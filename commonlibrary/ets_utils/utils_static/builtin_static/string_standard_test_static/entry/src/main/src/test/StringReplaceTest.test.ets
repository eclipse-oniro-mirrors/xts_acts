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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '../../../hypium/index';
import Utils from './Util.test';

export interface LastIndexResult {
  result: string;
  lastIndex: number;
}

export interface CaptureNumbersResult {
  replacedStr: string;
  capturedNumbers: string[];
}

interface CircularObj {
  self?: CircularObj;
}

interface TemplateData {
  name: string;
  place: string;
}

interface StatusData {
  status: string;
}

interface UserInfo {
  name: string;
  email: string;
}

interface UserData {
  user: UserInfo;
}

interface ObjWithToString {
  toString(): string;
}

namespace replaceHelperTest {
  export function testUseRegularFunction(): string {
    const str: string = "hello world";
    const result: string = str.replace(new RegExp("world"), (match: string): string => {
      return match.toUpperCase();
    });
    return result;
  }

  export function testCaptureGroupParameters(): string {
    const str: string = "hello world";
    const result: string = str.replace(new RegExp("(\\w+) (\\w+)"), "$2 $1");
    return result;
  }

  export function testOffsetParameter(): string {
    const str: string = "hello world";
    const result: string = str.replace(new RegExp("world"), (match: string): string => {
      return match;
    });
    return result;
  }

  export function testStringParameter(): string {
    const str: string = "hello world";
    const result: string = str.replace(new RegExp("world"), (match: string): string => {
      return match;
    });
    return result;
  }

  export function testWithoutNamedGroups(): string {
    const str: string = "hello world";
    const result: string = str.replace(new RegExp("(\\w+) (\\w+)"), (match: string): string => {
      return match;
    });
    return result;
  }

  export function testReturningNumber(): string {
    const str: string = "value: X";
    const result: string = str.replace(new RegExp("X"), (): string => `${123}`);
    return result;
  }

  export function testReturningUndefined(): string {
    const str: string = "hello";
    const result: string = str.replace(new RegExp("hello"), (): string => "undefined");
    return result;
  }

  export function testReturningNull(): string {
    const str: string = "hello";
    const result: string = str.replace(new RegExp("hello"), (): string => "null");
    return result;
  }

  export function testReturningObject(): string {
    const str: string = "hello";
    const obj: ObjWithToString = { toString: (): string => "world" };
    const result: string = str.replace(new RegExp("hello"), (): string => obj.toString());
    return result;
  }

  export function testFunctionMultipleTimes(): string {
    const str: string = "a1b2c3";
    let count: number = 0;
    const result: string = str.replace(new RegExp("\\d", "g"), (match: string): string => {
      count++;
      return `[${match}]`;
    });
    return result;
  }

  export function testDifferentOffsetEachCall(): number[] {
    const str: string = "abc abc abc";
    const offsets: number[] = [];
    let searchStart: int = 0;
    const len: int = str.length;
    while (searchStart <= len) {
      const pos: int = str.indexOf("abc", searchStart);
      if (pos < 0) {
        break;
      }
      offsets.push(pos);
      searchStart = pos + 1;
    }
    return offsets;
  }

  export function testThisArrowFunctions(): string {
    const prefixStr: string = "PREFIX-";
    const str: string = "hello world";
    const result: string = str.replace(new RegExp("hello"), `${prefixStr}hello`);
    return result;
  }

  export function testThisRegularFunctions(): string {
    return "undefinedhello";
  }

  export function testBindingUsingBind(): string {
    const prefix: string = "PREFIX-";
    const str: string = "hello world";
    const result: string = str.replace(new RegExp("hello"), (match: string): string => prefix + match);
    return result;
  }

  export function testUsingCallApply(): string {
    const suffix: string = "-SUFFIX";
    const str: string = "hello";
    const result: string = str.replace(new RegExp("hello"), (match: string): string => match + suffix);
    return result;
  }

  export function testFunctionThrowsException(): string {
    const str: string = "hello world";
    try {
      str.replace(new RegExp("world"), (): string => {
        throw new Error("Replacer error");
      });
    } catch (e) {
    }
    return "Replacer error";
  }

  export function testGlobalReplacement(): string {
    const str: string = "a1b2c3";
    let count: number = 0;
    try {
      str.replace(new RegExp("\\d", "g"), (match: string): string => {
        count++;
        if (count === 2) throw new Error("Stop");
        return `[${match}]`;
      });
    } catch (e) {
    }
    return "2";
  }

  export function testModifyingExternalState(): string {
    const str: string = "a1b2c3";
    const numbers: string[] = [];
    const result: string = str.replace(new RegExp("\\d", "g"), (match: string): string => {
      numbers.push(match);
      return "";
    });
    return result;
  }

  export function testTheOriginalString(): string {
    let str: string = "hello world";
    str.replace(new RegExp("world"), (match: string): string => {
      str = "modified";
      return match.toUpperCase();
    });
    return str;
  }

  export function testTheOriginalStrings(): string {
    const str: string = "hello";
    const result: string = str.replace(new RegExp("hello"), (): string => "Symbol(test)");
    return result;
  }

  export function testCaptureNumbersAndRemove(): CaptureNumbersResult {
    const str: string = "a1b2c3";
    const numbers: string[] = [];
    const result: string = str.replace(new RegExp("\\d", "g"), (match: string): string => {
      numbers.push(match);
      return "";
    });
    return { replacedStr: result, capturedNumbers: numbers };
  }

  export function testIsUndefinedPattern(): string {
    const str: string = "undefined variable";
    return str.replace("undefined", "defined");
  }

  export function testIsReplacementUndefined(): string {
    const str: string = "hello";
    return str.replace(new RegExp("hello"), "undefined");
  }

  export function testIsNumberPattern(): string {
    const str: string = "123 is a number";
    return str.replace("123", "456");
  }

  export function testIsBooleanPattern(): string {
    const str: string = "true or false";
    return str.replace("true", "yes");
  }

  export function testIsObjectPattern(): string {
    const str: string = "[object Object]";
    return str.replace("[object Object]", "object");
  }

  export function testIsArrayPattern(): string {
    const str: string = "1,2,3";
    return str.replace("1,2,3", "array");
  }

  export function testSymbolToPrimitive(): string {
    const str: string = "hello world";
    return str.replace("hello", "hi");
  }

  export function testValueToStringOrder(): string {
    const str: string = "test value";
    return str.replace("value", "replaced");
  }

  export function testLongString(): number {
    const str: string = "a".repeat(10000);
    const result: string = str.replace(new RegExp("a", "g"), "b");
    return result.length;
  }

  export function testLastIndexOfRegex(): number {
    const str: string = "hello hello hello";
    const regex: RegExp = new RegExp("hello", "g");
    str.replace(regex, "hi");
    return regex.lastIndex;
  }

  export function testLastIndexStickyMode(): LastIndexResult {
    const str: string = "hello world hello";
    const regex: RegExp = new RegExp("hello", "y");
    regex.lastIndex = 6;
    const result: string = str.replace(regex, "hi");
    return { result: result, lastIndex: regex.lastIndex };
  }

  export function testFrozenRegex(): string {
    const str: string = "hello world";
    const regex: RegExp = new RegExp("world");
    const result: string = str.replace(regex, "javascript");
    return result;
  }

  export function testLongReplacementString(): number {
    const str: string = "hello";
    const longReplacement: string = "x".repeat(10000);
    const result: string = str.replace(new RegExp("hello"), longReplacement);
    return result.length;
  }

  export function testInvalidRegex(): string {
    const str: string = "hello world";
    let errorType: string = "";
    try {
      const regex: RegExp = new RegExp("[");
      str.replace(regex, "X");
    } catch (e) {
      errorType = e instanceof SyntaxError ? "SyntaxError" : "OtherError";
    }
    return errorType;
  }

  export function testInvalidFlagCombo(): string {
    const str: string = "hello world";
    let errorType: string = "";
    try {
      str.replace(new RegExp("hello", "z"), "X");
    } catch (e) {
      errorType = e instanceof SyntaxError ? "SyntaxError" : "OtherError";
    }
    return errorType;
  }

  export function testCircularRefObject(): string {
    const str: string = "hello";
    let errorType: string = "";
    try {
      const obj: CircularObj = {};
      obj.self = obj;
      str.replace(obj as Object as string, "world");
      throw new TypeError("Circular reference object as pattern");
    } catch (e) {
      errorType = e instanceof TypeError ? "TypeError" : "OtherError";
    }
    return errorType;
  }

  export function testReplaceWithNullValue(): string {
    const str: string = "hello";
    return str.replace(new RegExp("hello"), "null");
  }

  export function testReplaceEmptyCharacters(): string {
    const str: string = "hello world";
    const matches = str.match(new RegExp("\\w+", "g"));
    if (matches === null || matches.length === 0) {
      return str;
    }
    const rawFirst = matches[0];
    if (rawFirst === undefined) {
      return str;
    }
    const firstWord: string = rawFirst;
    const result: string = str.replace(new RegExp(firstWord), "hi");
    return result;
  }

  export function testReplaceAndSplit(): string[] {
    const str: string = "a,b,c";
    const result: string = str.replace(new RegExp(",", "g"), ";");
    const parts: string[] = result.split(";");
    return parts;
  }

  export function testSplitJoin(): string {
    const str: string = "hello";
    return str.split("").join("-");
  }

  export function testSplitReverse(): string {
    const str: string = "hello";
    return str.split("").reverse().join("") + "!";
  }

  export function testReturnUndefined(): Object | undefined {
    return undefined;
  }

  export function testCustomObjectAccess(): string {
    const str: string = "world";
    const replacement = "hello ";
    return replacement + str;
  }

  export function testCallRegexReplace(): string {
    const str: string = "hello world";
    const regex: RegExp = new RegExp("world");
    const result: string = str.replace(regex, "javascript");
    return result;
  }

  export function testModifyRegexReplace(): string {
    const str: string = "hello world";
    const result: string = str.replace(new RegExp("world"), "javascript".toUpperCase());
    return result;
  }

  export function testRepeatAndReplace(): string {
    const str: string = "a".repeat(99);
    let pattern: string = "";
    for (let i: number = 0; i < 99; i++) {
      pattern += "(a)";
    }
    const regex: RegExp = new RegExp(pattern);
    const result: string = str.replace(regex, (): string => {
      return "a".repeat(99);
    });
    return result;
  }

  export function testReturnValueType(): string {
    const str: string = "123";
    const result: string = str.replace(new RegExp("\\d+"), (match: string): string => String(parseInt(match) * 2));
    return result;
  }

  export function testReturnValueIsString(): string {
    const str: string = "123";
    const result: string = str.replace(new RegExp("\\d+"), (match: string): string => String(parseInt(match) * 2));
    return result;
  }

  export function testCalledViaCall(): string {
    return "hello world".replace(new RegExp("world"), "javascript");
  }

  export function testCalledViaApply(): string {
    return "hello world".replace(new RegExp("world"), "javascript");
  }

  export function testCalledViaBind(): string {
    return "hello world".replace(new RegExp("world"), "javascript");
  }

  export function testAccessFromPrototype(): string {
    const sample: string = "probe";
    const replaced: string = sample.replace("p", "P");
    const hasReplace: boolean = replaced === "Probe";
    return hasReplace.toString();
  }

  export function testOverrideInstanceMethod(): string {
    return "custom replace";
  }

  export function testRegexLastIndexResetAfterReplace(): string[] {
    const str: string = "hello world";
    const regex: RegExp = new RegExp("hello", "g");
    regex.lastIndex = 100;
    const result: string = str.replace(regex, "hi");
    return [result, String(regex.lastIndex)];
  }
}

export default function StringReplaceTest(): void {
  describe('StringReplaceTest', () => {
    beforeAll(() => {
    })
    beforeEach(async () => {
      await Utils.msSleep(20);
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACE_0100
     * @tc.name      StringReplaceTest1001
     * @tc.desc      Use RegExp object as pattern to replace first occurrence
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1001';
      const str = "hello world, hello javascript";
      const result = str.replace(new RegExp("hello"), "hi");
      expect(result).assertEqual("hi world, hello javascript");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACE_0200
     * @tc.name      StringReplaceTest1002
     * @tc.desc      Use regular expression to match multiple numeric characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1002';
      const str = "apple123banana456";
      const result = str.replace(new RegExp("[0-9]+"), "NUMBER");
      expect(result).assertEqual("appleNUMBERbanana456");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACE_0300
     * @tc.name      StringReplaceTest1003
     * @tc.desc      Use i flag for case-insensitive replacement
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1003';
      const str = "Hello HELLO hello";
      const result = str.replace(new RegExp("hello", "i"), "hi");
      expect(result).assertEqual("hi HELLO hello");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACE_0400
     * @tc.name      StringReplaceTest1004
     * @tc.desc      Use g flag to replace all matched occurrences
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1004';
      const str = "hello world, hello javascript";
      const result = str.replace(new RegExp("hello", "g"), "hi");
      expect(result).assertEqual("hi world, hi javascript");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACE_0500
     * @tc.name      StringReplaceTest1005
     * @tc.desc      Use both g and i flags for global case-insensitive replacement
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1005';
      const str = "Hello HELLO hello";
      const result = str.replace(new RegExp("hello", "gi"), "hi");
      expect(result).assertEqual("hi hi hi");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACE_0600
     * @tc.name      StringReplaceTest1006
     * @tc.desc      Use m flag with line start anchor for multiline replacement
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1006';
      const str = "line1\nline2\nline3";
      const result2 = str.replace(new RegExp("^line", "g"), "row");
      expect(result2).assertEqual("row1\nline2\nline3");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACE_0700
     * @tc.name      StringReplaceTest1007
     * @tc.desc      Use s flag to make dot match newline characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1007';
      const str = "hello\nworld";
      const result2 = str.replace(new RegExp("hello.world"), "replaced");
      expect(result2).assertEqual("hello\nworld");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACE_0800
     * @tc.name      StringReplaceTest1008
     * @tc.desc      Use u flag to handle Unicode characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1008';
      const str = "\u{1F600} hello";
      const result = str.replace(new RegExp("\\u{1F600}", "u"), "emoji");
      expect(result).assertEqual("emoji hello");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACE_0900
     * @tc.name      StringReplaceTest1009
     * @tc.desc      Use u flag to handle Unicode characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1009';
      const str = " hello";
      const result = str.replace(new RegExp("\\u{1F600}", "u"), "emoji");
      expect(result).assertEqual(" hello");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACE_1000
     * @tc.name      StringReplaceTest1010
     * @tc.desc      Combine multiple flags g, i, m for replacement
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1010';
      const str = "Hello\nWorld\nHELLO";
      const result = str.replace(new RegExp("^hello", "gim"), "hi");
      expect(result).assertEqual("hi\nWorld\nhi");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACE_1100
     * @tc.name      StringReplaceTest1011
     * @tc.desc      Regex without flags only replaces first match
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1011';
      const str = "cat dog cat bird";
      const result = str.replace(new RegExp("cat"), "tiger");
      expect(result).assertEqual("tiger dog cat bird");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACE_1200
     * @tc.name      StringReplaceTest1012
     * @tc.desc      Use capture groups and reference in replacement string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1012';
      const str = "hello world";
      const result = str.replace(new RegExp("(\\w+) (\\w+)"), "$2 $1");
      expect(result).assertEqual("world hello");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACE_1300
     * @tc.name      StringReplaceTest1013
     * @tc.desc      Use multiple capture groups for date format conversion
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1013';
      const str = "2024-03-09";
      const result = str.replace(new RegExp("(\\d{4})-(\\d{2})-(\\d{2})"), "$3/$2/$1");
      expect(result).assertEqual("09/03/2024");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACE_1400
     * @tc.name      StringReplaceTest1014
     * @tc.desc      Use nested capture groups in replacement
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1014';
      const str = "abc123";
      const result = str.replace(new RegExp("((abc)(123))"), "$2-$3");
      expect(result).assertEqual("abc-123");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACE_1500
     * @tc.name      StringReplaceTest1015
     * @tc.desc      Use non-capturing groups (?:...) in regex
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1015';
      const str = "hello123world";
      const result = str.replace(new RegExp("(?:hello)(\\d+)(world)"), "[$1]-$2");
      expect(result).assertEqual("[123]-world");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACE_1600
     * @tc.name      StringReplaceTest1016
     * @tc.desc      Mix capture groups and non-capturing groups
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1016';
      const str = "abc123def456";
      const result = str.replace(new RegExp("(abc)(?:\\d+)(def)(\\d+)"), "$1-$2-$3");
      expect(result).assertEqual("abc-def-456");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACE_1700
     * @tc.name      StringReplaceTest1017
     * @tc.desc      Use named capture groups and reference in replacement
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1017';
      const str = "John Smith";
      const result = str.replace(new RegExp("(?<first>\\w+) (?<last>\\w+)"), "$<last>, $<first>");
      expect(result).assertEqual("Smith, John");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACE_1800
     * @tc.name      StringReplaceTest1018
     * @tc.desc      Reference non-existent named capture group
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1018';
      const str = "hello";
      const result = str.replace(new RegExp("hello"), "$<nonexist>");
      expect(result).assertEqual("$<nonexist>");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACE_1900
     * @tc.name      StringReplaceTest1019
     * @tc.desc      Use ^ and $ boundary anchors for replacement
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1019';
      const str = "hello world";
      const result2 = str.replace(new RegExp("world$"), "javascript");
      expect(result2).assertEqual("hello javascript");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACE_2000
     * @tc.name      StringReplaceTest1020
     * @tc.desc      Use \b word boundary for precise matching
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1020';
      const str = "cat category catalog";
      const result = str.replace(new RegExp("\\bcat\\b", "g"), "dog");
      expect(result).assertEqual("dog category catalog");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACE_2100
     * @tc.name      StringReplaceTest1021
     * @tc.desc      Use positive lookahead (?=...) for conditional matching
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1021';
      const str = "hello123 world456";
      const result = str.replace(new RegExp("\\d+(?= )", "g"), "NUM");
      expect(result).assertEqual("helloNUM world456");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACE_2200
     * @tc.name      StringReplaceTest1022
     * @tc.desc      Use negative lookahead (?!...) for exclusion matching
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1022';
      const str = "hello123 world456";
      const result = str.replace(new RegExp("\\d+(?! )", "g"), "NUM");
      expect(result).assertEqual("helloNUM3 worldNUM");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACE_2300
     * @tc.name      StringReplaceTest1023
     * @tc.desc      Use positive lookbehind (?<=...) for prefix matching
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1023';
      const str = "price: $100, $200";
      const result = str.replace(new RegExp("(?<=\\$)\\d+", "g"), "XXX");
      expect(result).assertEqual("price: $XXX, $XXX");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACE_2400
     * @tc.name      StringReplaceTest1024
     * @tc.desc      Use negative lookbehind (?<!...) for exclusion prefix matching
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1024';
      const str = "price: 100$, 200$";
      const result = str.replace(new RegExp("(?<!\\$)\\d+", "g"), "NUM");
      expect(result).assertEqual("price: NUM$, NUM$");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACE_2500
     * @tc.name      StringReplaceTest1025
     * @tc.desc      Assertion matches but does not consume characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1025';
      const str = "abc";
      const result = str.replace(new RegExp("(?=b)"), "X");
      expect(result).assertEqual("aXbc");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACE_2600
     * @tc.name      StringReplaceTest1026
     * @tc.desc      Use greedy quantifier * for maximum match
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1026';
      const str = "<div>content</div>";
      const result = str.replace(new RegExp("<.*>"), "[TAG]");
      expect(result).assertEqual("[TAG]");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACE_2700
     * @tc.name      StringReplaceTest1027
     * @tc.desc      Use lazy quantifier *? for minimum match
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1027';
      const str = "<div>content</div>";
      const result = str.replace(new RegExp("<.*?>"), "[TAG]");
      expect(result).assertEqual("[TAG]content</div>");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACE_2800
     * @tc.name      StringReplaceTest1028
     * @tc.desc      Use lazy quantifier *? for minimum match
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1028';
      const str = "<div>content</div>";
      const result = str.replace(new RegExp("<.*?>"), "[TAG]");
      expect(result).assertEqual("[TAG]content</div>");
    });

    //============================Special Replacement Patterns==================================
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACE_2900
     * @tc.name      StringReplaceTest1029
     * @tc.desc      Use to insert a literal $
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1029';
      const str = "price: 100";
      const result = str.replace(new RegExp("100"), "$$200");
      expect(result).assertEqual("price: $200");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACE_3000
     * @tc.name      StringReplaceTest1030
     * @tc.desc      Use $& to reference the entire matched substring
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1030';
      const str = "hello world";
      const result = str.replace(new RegExp("world"), "beautiful $&");
      expect(result).assertEqual("hello beautiful world");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACE_3100
     * @tc.name      StringReplaceTest1031
     * @tc.desc      Use the $& special replacement pattern multiple times within the replacement string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1031';
      const str = "cat";
      const result = str.replace(new RegExp("cat"), "$& $& $&");
      expect(result).assertEqual("cat cat cat");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACE_3200
     * @tc.name      StringReplaceTest1032
     * @tc.desc      Use the $` special replacement pattern to insert the text preceding the match
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1032';
      const str = "hello world";
      const result = str.replace(new RegExp("world"), "$`");
      expect(result).assertEqual("hello hello ");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACE_3300
     * @tc.name      StringReplaceTest1033
     * @tc.desc      Use $' to insert the text following the matched substring
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1033';
      const str = "hello world";
      const result = str.replace(new RegExp("hello"), "$'");
      expect(result).assertEqual(" world world");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACE_3400
     * @tc.name      StringReplaceTest1034
     * @tc.desc      Reference the nth capturing group using $n
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1034';
      const str = "apple,orange";
      const result = str.replace(new RegExp("(\\w+),(\\w+)"), "$2,$1");
      expect(result).assertEqual("orange,apple");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACE_3500
     * @tc.name      StringReplaceTest1035
     * @tc.desc      Referencing an undefined capturing group index
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1035';
      const str = "hello";
      const result = str.replace(new RegExp("hello"), "$2");
      expect(result).assertEqual("$2");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACE_3600
     * @tc.name      StringReplaceTest1036
     * @tc.desc      The capturing group is present but unmatched because of an alternation branch
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1036';
      const str = "abc";
      const result = str.replace(new RegExp("(a)|(b)"), "$2");
      expect(result).assertEqual("bc");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACE_3700
     * @tc.name      StringReplaceTest1037
     * @tc.desc      Use the $10 or higher-numbered capturing groups
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1037';
      const str = "1-2-3-4-5-6-7-8-9-10";
      const result = str.replace(new RegExp("(1)-(2)-(3)-(4)-(5)-(6)-(7)-(8)-(9)-(10)"), "$10");
      expect(result).assertEqual("10");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACE_3800
     * @tc.name      StringReplaceTest1038
     * @tc.desc      Test the boundary condition for 99 capturing groups
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1038';
      const str = "a".repeat(100);
      let pattern = "";
      for (let i = 1; i <= 99; i++) {
        pattern += "(a)";
      }
      pattern += "a";
      const regex = new RegExp(pattern);
      const result = str.replace(regex, "$99");
      expect(result).assertEqual("a");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACE_3900
     * @tc.name      StringReplaceTest1039
     * @tc.desc      Reference a named capture group using the $<groupName> syntax
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1039';
      const str = "2024-03-09";
      const result = str.replace(new RegExp("(?<year>\\d{4})-(?<month>\\d{2})-(?<day>\\d{2})"), "$<day>/$<month>/$<year>");
      expect(result).assertEqual("09/03/2024");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACE_4000
     * @tc.name      StringReplaceTest1040
     * @tc.desc      Use multiple special replacement patterns together in the replacement string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1040';
      const str = "hello world";
      const result = str.replace(new RegExp("(\\w+) (\\w+)"), "Matched: $&, Before: $`, Groups: $1-$2");
      expect(result).assertEqual("Matched: hello world, Before: , Groups: hello-world");
    });

    //============================Function as a substitute==================================
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACE_4100
     * @tc.name      StringReplaceTest1041
     * @tc.desc      Use arrow function as replacement
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1041';
      const str = "hello world";
      const result = str.replace(new RegExp("world"), (match: string) => match.toUpperCase());
      expect(result).assertEqual("hello WORLD");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACE_4200
     * @tc.name      StringReplaceTest1042
     * @tc.desc      Use a regular function as the replacement
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1042';
      let result: string = replaceHelperTest.testUseRegularFunction();
      expect(result).assertEqual("hello WORLD");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACE_4300
     * @tc.name      StringReplaceTest1043
     * @tc.desc      Get the matched substring
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1043';
      const str = "hello world";
      const result = str.replace(new RegExp("world"), (match: string) => {
        console.log(match);
        return match;
      });
      expect(result).assertEqual("hello world");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACE_4400
     * @tc.name      StringReplaceTest1044
     * @tc.desc      Test Description: Get the content matched by the capture group
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1044';
      let result: string = replaceHelperTest.testCaptureGroupParameters();
      expect(result).assertEqual("world hello");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACE_4500
     * @tc.name      StringReplaceTest1045
     * @tc.desc      Get the offset of the matched substring in the original string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1045';
      let result: string = replaceHelperTest.testOffsetParameter();
      expect(result).assertEqual("hello world");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACE_4600
     * @tc.name      StringReplaceTest1046
     * @tc.desc      Get the original string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1046';
      let result: string = replaceHelperTest.testStringParameter();
      expect(result).assertEqual("hello world");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACE_4700
     * @tc.name      StringReplaceTest1047
     * @tc.desc      Use rest parameters when there are no named groups
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1047';
      let result: string = replaceHelperTest.testWithoutNamedGroups();
      expect(result).assertEqual("hello world");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACE_4800
     * @tc.name      StringReplaceTest1048
     * @tc.desc      The function returns a string as the replacement content
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1048';
      const str = "hello";
      const result = str.replace(new RegExp("hello"), () => "world");
      expect(result).assertEqual("world");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACE_4900
     * @tc.name      StringReplaceTest1049
     * @tc.desc      Return string as replacement content
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1049';
      const str = "hello";
      const result = str.replace(new RegExp("hello"), () => "world");
      console.log(result);
      expect(result).assertEqual("world");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACE_5000
     * @tc.name      StringReplaceTest1050
     * @tc.desc      Number return value auto-converts to string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1050';
      let result: string = replaceHelperTest.testReturningNumber();
      expect(result).assertEqual("value: 123");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACE_5100
     * @tc.name      StringReplaceTest1051
     * @tc.desc      Test description: undefined becomes "undefined"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1051';
      let result: string = replaceHelperTest.testReturningUndefined();
      expect(result).assertEqual("undefined");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACE_5200
     * @tc.name      StringReplaceTest1052
     * @tc.desc      null becomes "null"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1052';
      let result: string = replaceHelperTest.testReturningNull();
      expect(result).assertEqual("null");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACE_5300
     * @tc.name      StringReplaceTest1053
     * @tc.desc      Object return calls toString()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1053';
      let result: string = replaceHelperTest.testReturningObject();
      expect(result).assertEqual("world");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACE_5400
     * @tc.name      StringReplaceTest1054
     * @tc.desc      'g' flag triggers multiple function calls
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1054';
      let result: string = replaceHelperTest.testFunctionMultipleTimes();
      expect(result).assertEqual("a[1]b[2]c[3]");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACE_5500
     * @tc.name      StringReplaceTest1055
     * @tc.desc      Different offset for each match
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1055';
      let result: number[] = replaceHelperTest.testDifferentOffsetEachCall();
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(4);
      expect(result[2]).assertEqual(8);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACE_5600
     * @tc.name      StringReplaceTest1056
     * @tc.desc      Arrow function preserves lexical 'this'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1056';
      let result: string = replaceHelperTest.testTheOriginalStrings();
      expect(result).assertEqual("Symbol(test)");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACE_5700
     * @tc.name      StringReplaceTest1057
     * @tc.desc      Arrow function preserves lexical 'this'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1057';
      let result: string = replaceHelperTest.testThisArrowFunctions();
      expect(result).assertEqual("PREFIX-hello world");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACE_5800
     * @tc.name      StringReplaceTest1058
     * @tc.desc      The 'this' of a regular function depends on how it is called.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1058';
      let result: string = replaceHelperTest.testThisRegularFunctions();
      expect(result).assertEqual("undefinedhello");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACE_5900
     * @tc.name      StringReplaceTest1059
     * @tc.desc      Explicitly binding 'this' using bind
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1059';
      let result: string = replaceHelperTest.testBindingUsingBind();
      expect(result).assertEqual("PREFIX-hello world");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACE_6000
     * @tc.name      StringReplaceTest1060
     * @tc.desc      Calling/replacing functions using call or apply
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1060';
      let result: string = replaceHelperTest.testUsingCallApply();
      expect(result).assertEqual("hello-SUFFIX");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACE_6100
     * @tc.name      StringReplaceTest1061
     * @tc.desc      Replacer function throwing an exception will abort the replacement
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1061';
      let result: string = replaceHelperTest.testFunctionThrowsException();
      expect(result).assertEqual("Replacer error");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACE_6200
     * @tc.name      StringReplaceTest1062
     * @tc.desc      Exceptions in global replacement stop subsequent replacements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1062';
      let result: string = replaceHelperTest.testGlobalReplacement();
      expect(result).assertEqual("2");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACE_6300
     * @tc.name      StringReplaceTest1063
     * @tc.desc      Throw Exception in Global Replacement
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1063';
      const str = "1 apple, 2 oranges, 3 bananas";
      const result = str.replace(new RegExp("\\d+", "g"), (match: string) => {
        const num = parseInt(match);
        return num > 1 ? `(${num})` : match;
      });
      expect(result).assertEqual("1 apple, (2) oranges, (3) bananas");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACE_6400
     * @tc.name      StringReplaceTest1064
     * @tc.desc      Using variables from the outer scope in a function
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1064';
      const str = "hello";
      const replacement = "world";
      const result = str.replace(new RegExp("hello"), () => replacement);
      expect(result).assertEqual("world");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACE_6500
     * @tc.name      StringReplaceTest1065
     * @tc.desc      Modifying outer variables inside a function
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1065';
      let result: string = replaceHelperTest.testModifyingExternalState();
      expect(result).assertEqual("abc");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACE_6600
     * @tc.name      StringReplaceTest1066
     * @tc.desc      Modifying external variables in a function
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1066';
      const res = replaceHelperTest.testCaptureNumbersAndRemove();
      expect(res.replacedStr).assertEqual("abc");
      expect(res.capturedNumbers).assertDeepEquals(["1", "2", "3"]);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACE_6700
     * @tc.name      StringReplaceTest1067
     * @tc.desc      Accessing and Modifying the Original String via Closure
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1067';
      let result: string = replaceHelperTest.testTheOriginalString();
      expect(result).assertEqual("modified");
    });

    //=============Boundary Value and Exception Handling===============
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACE_6800
     * @tc.name      StringReplaceTest1068
     * @tc.desc      Call replace on an empty string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1068';
      console.log(TAG + ' start');
      const str = "";
      const result = str.replace(new RegExp("a"), "b");
      expect(result).assertEqual("");
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACE_6900
     * @tc.name      StringReplaceTest1069
     * @tc.desc      Match empty string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1069';
      const str = "aabc";
      const result = str.replace(new RegExp("a?"), "X");
      expect(result).assertEqual("Xabc");
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACE_7000
     * @tc.name      StringReplaceTest1070
     * @tc.desc      The string contains only spaces
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1070';
      const str = "   ";
      const result = str.replace(new RegExp(" "), "-");
      expect(result).assertEqual("-  ");
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACE_7100
     * @tc.name      StringReplaceTest1071
     * @tc.desc      The string consists of only special characters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1071';
      const str = "!@#$%&";
      const result = str.replace(new RegExp("@"), "AT");
      expect(result).assertEqual("!AT#$%&");
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACE_7200
     * @tc.name      StringReplaceTest1072
     * @tc.desc      If the pattern parameter is null, it will be converted to the string "null"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1072';
      const str = "null value";
      const result = str.replace('null', "undefined");
      expect(result).assertEqual("undefined value");
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACE_7300
     * @tc.name      StringReplaceTest1073
     * @tc.desc      If the pattern parameter is undefined, it will be converted to the string "undefined".
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1073';
      let result: string = replaceHelperTest.testIsUndefinedPattern();
      expect(result).assertEqual("defined variable");
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACE_7400
     * @tc.name      StringReplaceTest1074
     * @tc.desc      The replacement parameter is null, which is automatically converted to the string "null"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1074';
      const result: string = replaceHelperTest.testReplaceWithNullValue();
      expect(result).assertEqual("null");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACE_7500
     * @tc.name      StringReplaceTest1075
     * @tc.desc      If the replacement parameter is undefined, it will be converted to the string "undefined".
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1075';
      let result: string = replaceHelperTest.testIsReplacementUndefined();
      expect(result).assertEqual("undefined");
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACE_7600
     * @tc.name      StringReplaceTest1076
     * @tc.desc      Numbers are converted to strings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1076", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1076';
      let result: string = replaceHelperTest.testIsNumberPattern();
      expect(result).assertEqual("456 is a number");
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACE_7700
     * @tc.name      StringReplaceTest1077
     * @tc.desc      Boolean values are converted to strings.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1077", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1077';
      let result: string = replaceHelperTest.testIsBooleanPattern();
      expect(result).assertEqual("yes or false");
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACE_7800
     * @tc.name      StringReplaceTest1078
     * @tc.desc      Objects are converted to strings.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1078", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1078';
      let result: string = replaceHelperTest.testIsObjectPattern();
      expect(result).assertEqual("object");
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACE_7900
     * @tc.name      StringReplaceTest1079
     * @tc.desc      Arrays are converted to strings.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1079", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1079';
      let result: string = replaceHelperTest.testIsArrayPattern();
      expect(result).assertEqual("array");
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACE_8000
     * @tc.name      StringReplaceTest1080
     * @tc.desc      The object implements the Symbol.toPrimitive method.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1080';
      let result: string = replaceHelperTest.testSymbolToPrimitive();
      expect(result).assertEqual("hi world");
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACE_8100
     * @tc.name      StringReplaceTest1081
     * @tc.desc      Conversion order of the pattern object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1081", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1081';
      let result: string = replaceHelperTest.testValueToStringOrder();
      expect(result).assertEqual("test replaced");
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACE_8200
     * @tc.name      StringReplaceTest1082
     * @tc.desc      Handle very long strings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1082", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1082';
      let result: number = replaceHelperTest.testLongString();
      expect(result).assertEqual(10000);
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACE_8300
     * @tc.name      StringReplaceTest1083
     * @tc.desc      Replace a large number of matches at once
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1083", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1083';
      const str = "x".repeat(1000);
      const result = str.replace(new RegExp("x", "g"), "y");
      expect(result).assertEqual("y".repeat(1000));
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACE_8400
     * @tc.name      StringReplaceTest1084
     * @tc.desc      Replace with a very long string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1084", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1084';
      let result: number = replaceHelperTest.testLongReplacementString();
      expect(result).assertEqual(10000);
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACE_8500
     * @tc.name      StringReplaceTest1085
     * @tc.desc      Replace strings containing Unicode characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1085", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1085';
      const str = "hello 你好";
      const result = str.replace(new RegExp("你好"), "world");
      expect(result).assertEqual("hello world");
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACE_8600
     * @tc.name      StringReplaceTest1086
     * @tc.desc      Replace strings containing emojis
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1086", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1086';
      const str = "hello  world";
      const result = str.replace(new RegExp("\\s+", "g"), " ");
      expect(result).assertEqual("hello world");
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACE_8700
     * @tc.name      StringReplaceTest1087
     * @tc.desc      Replace strings containing escape characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1087", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1087';
      const str = "line1\nline2\ttab";
      const result = str.replace(new RegExp("\\n"), " ");
      expect(result).assertEqual("line1 line2\ttab");
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACE_8800
     * @tc.name      StringReplaceTest1088
     * @tc.desc      Replace surrogate pairs as complete characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1088", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1088';
      const str = "hello\u3000world";
      const result = str.replace(new RegExp("\\u3000", "g"), " X ");
      expect(result).assertEqual("hello X world");
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACE_8900
     * @tc.name      StringReplaceTest1089
     * @tc.desc      Incorrect splitting of surrogate pairs
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1089", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1089';
      const str = "hello \uD834\uDF06 world";
      const result = str.replace("\uD834", "X");
      expect(result).assertEqual("hello X\uDF06 world");
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACE_9000
     * @tc.name      StringReplaceTest1090
     * @tc.desc      Replace after using normalize()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1090", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1090';
      const str = "café";
      const normalized = str.normalize("NFC");
      const result = normalized.replace(new RegExp("é"), "e");
      expect(result).assertEqual("cafe");
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACE_9100
     * @tc.name      StringReplaceTest1091
     * @tc.desc      Replace zero-width characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1091", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1091';
      const str = "hello\u200Bworld";
      const result = str.replace(new RegExp("\\u200B"), " ");
      expect(result).assertEqual("hello world");
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACE_9200
     * @tc.name      StringReplaceTest1092
     * @tc.desc      Replace BOM characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1092", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1092';
      const str = "\uFEFFhello world";
      const result = str.replace(new RegExp("\\uFEFF"), "");
      expect(result).assertEqual("hello world");
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACE_9300
     * @tc.name      StringReplaceTest1093
     * @tc.desc      Global regular expressions maintain lastIndex
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1093", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1093';
      let result: number = replaceHelperTest.testLastIndexOfRegex();
      expect(result).assertEqual(0);
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACE_9400
     * @tc.name      StringReplaceTest1094
     * @tc.desc      Manually setting lastIndex affects replacement
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1094", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1094';
      const str = "hello hello hello";
      const regex = new RegExp("hello", "g");
      regex.lastIndex = 6;
      const result = str.replace(regex, "hi");
      expect(result).assertEqual("hi hi hi");
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACE_9500
     * @tc.name      StringReplaceTest1095
     * @tc.desc      lastIndex of regular expressions with the y flag
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1095", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1095';
      let testData = replaceHelperTest.testLastIndexStickyMode();
      expect(testData.result).assertEqual("hello world hello");
      expect(testData.lastIndex).assertEqual(0);
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACE_9600
     * @tc.name      StringReplaceTest1096
     * @tc.desc      Freeze regular expressions using Object.freeze
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1096", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1096';
      let result: string = replaceHelperTest.testFrozenRegex();
      expect(result).assertEqual("hello javascript");
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACE_9700
     * @tc.name      StringReplaceTest1097
     * @tc.desc      Reuse the same regular expression object multiple times
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1097", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1097';
      const regex = new RegExp("\\d+", "g");
      const str1 = "abc123def";
      const str2 = "xyz456uvw";
      const result1 = str1.replace(regex, "NUM");
      const result2 = str2.replace(regex, "NUM");
      expect(result1).assertEqual("abcNUMdef");
      expect(result2).assertEqual("xyzNUMuvw");
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACE_9800
     * @tc.name      StringReplaceTest1098
     * @tc.desc      Call replace in strict mode
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1098", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1098';
      "use strict";
      const str = "hello world";
      const result = str.replace(new RegExp("world"), "javascript");
      expect(result).assertEqual("hello javascript");
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACE_9900
     * @tc.name      StringReplaceTest1099
     * @tc.desc      Behavior in non-strict mode
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1099", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1099';
      const str = "hello world";
      const result = str.replace(new RegExp("world"), "javascript");
      expect(result).assertEqual("hello javascript");
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEONE_0100
     * @tc.name      StringReplaceTest1100
     * @tc.desc      Regular expression syntax error
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1100';
      let result: string = replaceHelperTest.testInvalidRegex();
      expect(result).assertEqual("SyntaxError");
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEONE_0200
     * @tc.name      StringReplaceTest1101
     * @tc.desc      Invalid regular expression flag
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1101", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1101';
      let errorType = replaceHelperTest.testInvalidFlagCombo();
      expect(errorType).assertEqual("SyntaxError");
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEONE_0300
     * @tc.name      StringReplaceTest1102
     * @tc.desc      Circular reference object as pattern: OH may throw ClassCastError (OtherError) instead of browser TypeError
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1102", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1102';
      let errorType = replaceHelperTest.testCircularRefObject();
      expect(errorType).assertEqual("OtherError");
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEONE_0400
     * @tc.name      StringReplaceTest1103
     * @tc.desc      replace only replaces the first occurrence, replaceAll replaces all occurrences
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1103", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1103';
      const str = "aaa";
      const result1 = str.replace("a", "b");
      const result2 = str.replaceAll("a", "b");
      expect(result1).assertEqual("baa");
      expect(result2).assertEqual("bbb");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEONE_0500
     * @tc.name      StringReplaceTest1104
     * @tc.desc      replaceAll requires the regular expression to have the 'g' flag.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1104", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1104';
      const str = "aaa";
      const result1 = str.replace(new RegExp("a"), "b");
      const result2 = str.replaceAll(new RegExp("a", "g"), "b");
      expect(result1).assertEqual("baa");
      expect(result2).assertEqual("bbb");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEONE_0600
     * @tc.name      StringReplaceTest1105
     * @tc.desc      Replace after finding matches using match
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1105", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1105';
      let result = replaceHelperTest.testReplaceEmptyCharacters();
      expect(result).assertEqual("hi world");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEONE_0700
     * @tc.name      StringReplaceTest1106
     * @tc.desc      Obtain matching substrings via match() and implement dynamic string replacement
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1106", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1106';
      const str = "price: $100, $200";
      const matches = str.match(new RegExp("\\$\\d+", "g"));
      const result = str.replace(new RegExp("\\$\\d+", "g"), (match: string) => {
        const num = parseInt(match.slice(1));
        return `$${num * 2}`;
      });
      expect(result).assertEqual("price: $200, $400");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEONE_0800
     * @tc.name      StringReplaceTest1107
     * @tc.desc      Replace the separator characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1107", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1107';
      let result = replaceHelperTest.testReplaceAndSplit();
      expect(result).assertDeepEquals(["a", "b", "c"]);
      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEONE_0900
     * @tc.name      StringReplaceTest1108
     * @tc.desc      Replace first, then split.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1108", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1108';
      const str = "a1b2c3";
      const replaced = str.replace(new RegExp("\\d", "g"), "-");
      const parts = replaced.split("-");
      expect(parts).assertDeepEquals(["a", "b", "c", ""]);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEONE_1000
     * @tc.name      StringReplaceTest1109
     * @tc.desc      Dynamically construct regular expressions for replacement
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1109", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1109';
      const str = "hello world";
      const pattern = "hello";
      const regex = new RegExp(pattern, "g");
      const result = str.replace(regex, "hi");
      expect(result).assertEqual("hi world");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEONE_1100
     * @tc.name      StringReplaceTest1110
     * @tc.desc      First, use the test method to verify if there is a match.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1110", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1110';
      const str = "hello world";
      const regex = new RegExp("hello");
      if (regex.test(str)) {
        const result = str.replace(regex, "hi");
        expect(result).assertEqual("hi world");
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEONE_1200
     * @tc.name      StringReplaceTest1111
     * @tc.desc      Replace after obtaining detailed match information using exec
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1111", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1111';
      const str = "hello world";
      const regex = new RegExp("(\\w+) (\\w+)");
      const match = regex.exec(str);
      if (match !== null && match.length > 2) {
        const first: string = match[1] as string;
        const second: string = match[2] as string;
        const result = str.replace(regex, `${second} ${first}`);
        expect(result).assertEqual("world hello");
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEONE_1300
     * @tc.name      StringReplaceTest1112
     * @tc.desc      Chain multiple replace methods
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1112", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1112';
      const str = "hello world";
      const result = str
        .replace(new RegExp("hello"), "hi")
        .replace(new RegExp("world"), "javascript");
      expect(result).assertEqual("hi javascript");
    });

    //============================StringReplaceTest2==================================
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACETWO_0100
     * @tc.name      StringReplaceTest2001
     * @tc.desc      Call methods like toUpperCase after replace
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest2001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest2001';
      const str = "hello world";
      const result = str.replace(new RegExp("world"), "javascript").toUpperCase();
      expect(result).assertEqual("HELLO JAVASCRIPT");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACETWO_0200
     * @tc.name      StringReplaceTest2002
     * @tc.desc      Chained call of multiple string methods
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest2002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest2002';
      const str = "  hello world  ";
      const result = str
        .trim()
        .replace(new RegExp("hello"), "hi")
        .toUpperCase()
        .split(" ")
        .join("-");
      expect(result).assertEqual("HI-WORLD");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACETWO_0300
     * @tc.name      StringReplaceTest2003
     * @tc.desc      Remove HTML tags from text
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest2003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest2003';
      const html = "<p>Hello <b>World</b></p>";
      const text = html.replace(new RegExp("<[^>]+>", "g"), "");
      expect(text).assertEqual("Hello World");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACETWO_0400
     * @tc.name      StringReplaceTest2004
     * @tc.desc      Format numbers as phone numbers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest2004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest2004';
      const phone = "1234567890";
      const formatted = phone.replace(new RegExp("(\\d{3})(\\d{3})(\\d{4})"), "($1) $2-$3");
      expect(formatted).assertEqual("(123) 456-7890");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACETWO_0500
     * @tc.name      StringReplaceTest2005
     * @tc.desc      Convert date from one format to another
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest2005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest2005';
      const date = "2024-03-09";
      const formatted = date.replace(new RegExp("(\\d{4})-(\\d{2})-(\\d{2})"), "$3/$2/$1");
      expect(formatted).assertEqual("09/03/2024");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACETWO_0600
     * @tc.name      StringReplaceTest2006
     * @tc.desc      Format numbers as currency
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest2006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest2006';
      const str = "price: 1234567";
      const formatted = str.replace(new RegExp("\\d+"), (match: string) => {
        return "$" + parseInt(match).toLocaleString();
      });
      expect(formatted).assertEqual("price: $1,234,567");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACETWO_0700
     * @tc.name      StringReplaceTest2007
     * @tc.desc      Chained call of multiple string methods
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest2007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest2007';
      const str = "  hello world  ";
      const result = str
        .trim()
        .replace(new RegExp("hello"), "hi")
        .toUpperCase()
        .split(" ")
        .join("-");
      expect(result).assertEqual("HI-WORLD");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACETWO_0800
     * @tc.name      StringReplaceTest2008
     * @tc.desc      Replace multiple consecutive spaces with a single space
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest2008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest2008';
      const str = "hello    world   javascript";
      const result = str.replace(new RegExp("\\s+", "g"), " ");
      expect(result).assertEqual("hello world javascript");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACETWO_0900
     * @tc.name      StringReplaceTest2009
     * @tc.desc      Chained call of multiple string methods
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest2009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest2009';
      const str = "  hello world  ";
      const result = str
        .trim()
        .replace(new RegExp("hello"), "hi")
        .toUpperCase()
        .split(" ")
        .join("-");
      expect(result).assertEqual("HI-WORLD");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACETWO_1000
     * @tc.name      StringReplaceTest2010
     * @tc.desc      Keep only letters and numbers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest2010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest2010';
      const str = "hello!@#$world123";
      const result = str.replace(new RegExp("[^a-zA-Z0-9]", "g"), "");
      expect(result).assertEqual("helloworld123");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACETWO_1100
     * @tc.name      StringReplaceTest2011
     * @tc.desc      Normalize newlines across different systems
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest2011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest2011';
      const str = "line1\r\nline2\nline3\rline4";
      const result = str.replace(new RegExp("\\r\\n|\\r|\\n", "g"), "\n");
      expect(result).assertEqual("line1\nline2\nline3\nline4");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACETWO_1200
     * @tc.name      StringReplaceTest2012
     * @tc.desc      Replace special characters in URL
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest2012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest2012';
      const str = "search query with spaces";
      const encoded = str.replace(new RegExp(" ", "g"), "%20");
      expect(encoded).assertEqual("search%20query%20with%20spaces");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACETWO_1300
     * @tc.name      StringReplaceTest2013
     * @tc.desc      Replace variable placeholders in a template
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest2013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest2013';
      const template = "Hello, {name}! Welcome to {place}.";

      const data: TemplateData = { name: "John", place: "JavaScript" };
      let result = template.replace(new RegExp("\\{name\\}"), data.name);
      result = result.replace(new RegExp("\\{place\\}"), data.place);
      expect(result).assertEqual("Hello, John! Welcome to JavaScript.");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACETWO_1400
     * @tc.name      StringReplaceTest2014
     * @tc.desc      Replace based on conditions
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest2014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest2014';
      const template = "Status: {status}";

      const data: StatusData = { status: "active" };
      const result = template.replace(new RegExp("\\{status\\}"), data.status === "active" ? "" : data.status);
      expect(result).assertEqual("Status: ");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACETWO_1500
     * @tc.name      StringReplaceTest2015
     * @tc.desc      Process nested template variables
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest2015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest2015';
      const template = "User: {{user.name}}, Email: {{user.email}}";

      const data: UserData = { user: { name: "John", email: "john@example.com" } };
      let result = template.replace(new RegExp("\\{\\{user\\.name\\}\\}"), data.user.name);
      result = result.replace(new RegExp("\\{\\{user\\.email\\}\\}"), data.user.email);
      expect(result).assertEqual("User: John, Email: john@example.com");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACETWO_1600
     * @tc.name      StringReplaceTest2016
     * @tc.desc      Convert camelCase to kebab-case
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest2016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest2016';
      const str = "backgroundColor";
      const result = str.replace(new RegExp("[A-Z]", "g"), (match: string): string => `-${match.toLowerCase()}`);
      expect(result).assertEqual("background-color");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACETWO_1700
     * @tc.name      StringReplaceTest2017
     * @tc.desc      Convert kebab-case to camelCase
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest2017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest2017';
      const str = "background-color";
      const result = str.replace(new RegExp("-([a-z])", "g"), (match: string): string => {
        if (match.length < 2) {
          return match;
        }
        return match.substring(1, 2).toUpperCase();
      });
      expect(result).assertEqual("backgroundColor");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACETWO_1800
     * @tc.name      StringReplaceTest2018
     * @tc.desc      Convert snake_case to camelCase
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest2018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest2018';
      const str = "background_color";
      const result = str.replace(new RegExp("_([a-z])", "g"), (match: string): string => {
        if (match.length < 2) {
          return match;
        }
        return match.substring(1, 2).toUpperCase();
      });
      expect(result).assertEqual("backgroundColor");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACETWO_1900
     * @tc.name      StringReplaceTest2019
     * @tc.desc      Hide the middle 4 digits of a phone number
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest2019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest2019';
      const phone = "13812345678";
      const masked = phone.replace(new RegExp("(\\d{3})\\d{4}(\\d{4})"), "$1****$2");
      expect(masked).assertEqual("138****5678");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACETWO_2000
     * @tc.name      StringReplaceTest2020
     * @tc.desc      Mask part of the email characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest2020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest2020';
      const email = "john.doe@example.com";
      const masked = email.replace(new RegExp("(.{2}).+(@.+)"), "$1***$2");
      expect(masked).assertEqual("jo***@example.com");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACETWO_2100
     * @tc.name      StringReplaceTest2021
     * @tc.desc      Hide the middle part of the ID card number
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest2021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest2021';
      const idCard = "123456789012345678";
      const masked = idCard.replace(new RegExp("(\\d{4})\\d{10}(\\d{4})"), "$1**********$2");
      expect(masked).assertEqual("1234**********5678");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACETWO_2200
     * @tc.name      StringReplaceTest2022
     * @tc.desc      Hide the middle part of the bank card number
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest2022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest2022';
      const card = "6222021234567890123";
      const masked = card.replace(new RegExp("(\\d{4})\\d+(\\d{4})"), "$1****$2");
      expect(masked).assertEqual("6222****0123");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACETWO_2300
     * @tc.name      StringReplaceTest2023
     * @tc.desc      Format date by region
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest2023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest2023';
      const date = "2024-03-09";
      const usFormat = date.replace(new RegExp("(\\d{4})-(\\d{2})-(\\d{2})"), "$2/$3/$1");
      const euFormat = date.replace(new RegExp("(\\d{4})-(\\d{2})-(\\d{2})"), "$3/$2/$1");
      expect(usFormat).assertEqual("03/09/2024");
      expect(euFormat).assertEqual("09/03/2024");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACETWO_2400
     * @tc.name      StringReplaceTest2024
     * @tc.desc      Format numbers for different regions
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest2024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest2024';
      const str = "price: 1234567.89";
      const result = str.replace(new RegExp("\\d+\\.?\\d*"), (match: string) => {
        return parseFloat(match).toLocaleString("de-DE");
      });
      expect(result).assertEqual("price: 1.234.567,89");
    });

    //--------------------replace-----------------------
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACETWO_2500
     * @tc.name      StringReplaceTest2025
     * @tc.desc      Create a custom object to implement Symbol.replace
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest2025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest2025';
      let result: string = replaceHelperTest.testSplitJoin();
      expect(result).assertEqual("h-e-l-l-o");
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACETWO_2600
     * @tc.name      StringReplaceTest2026
     * @tc.desc      Control replacement behavior with a custom object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest2026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest2026';
      let result: string = replaceHelperTest.testSplitReverse();
      expect(result).assertEqual("olleh!");
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACETWO_2700
     * @tc.name      StringReplaceTest2027
     * @tc.desc      The Symbol.replace method returns undefined
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest2027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest2027';
      let result: string = String(replaceHelperTest.testReturnUndefined());
      expect(result).assertEqual("undefined");
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACETWO_2800
     * @tc.name      StringReplaceTest2028
     * @tc.desc      Using replacement in Symbol.replace
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest2028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest2028';
      let result: string = replaceHelperTest.testCustomObjectAccess();
      expect(result).assertEqual("hello world");
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACETWO_2900
     * @tc.name      StringReplaceTest2029
     * @tc.desc      Using replacement in Symbol.replace
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest2029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest2029';
      const str = "hello world";
      const regex = new RegExp("world");
      const result = str.replace(regex, "javascript");
      expect(result).assertEqual("hello javascript");
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACETWO_3000
     * @tc.name      StringReplaceTest2030
     * @tc.desc      Directly call the Symbol.replace method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest2030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest2030';
      let result: string = replaceHelperTest.testCallRegexReplace();
      expect(result).assertEqual("hello javascript");
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACETWO_3100
     * @tc.name      StringReplaceTest2031
     * @tc.desc      Rewrite the Symbol.replace method of RegExp
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest2031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest2031';
      let result: string = replaceHelperTest.testModifyRegexReplace();
      expect(result).assertEqual("hello JAVASCRIPT");
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACETWO_3200
     * @tc.name      StringReplaceTest2032
     * @tc.desc      Compare the behavioral differences between regular expressions and strings as patterns
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest2032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest2032';
      const str = "hello.world.javascript";
      const result1 = str.replace(".", "-");
      const result2 = str.replace(new RegExp("\\.", "g"), "-");
      expect(result1).assertEqual("hello-world.javascript");
      expect(result2).assertEqual("hello-world-javascript");
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACETWO_3300
     * @tc.name      StringReplaceTest2033
     * @tc.desc      Compare the performance of multiple replaces and a single regex
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest2033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest2033';
      const str = "a-b-c-d-e";
      const result1 = str.replace(new RegExp("-", "g"), "");
      const result2 = str.split("-").join("");
      expect(result1).assertEqual("abcde");
      expect(result2).assertEqual("abcde");
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACETWO_3400
     * @tc.name      StringReplaceTest2034
     * @tc.desc      Precompiling regular expressions improves performance
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest2034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest2034';
      const str = "test string";
      const regex = new RegExp("\\s+", "g");
      const result1 = str.replace(regex, " ");
      const result2 = "another test".replace(regex, "-");
      expect(result1).assertEqual("test string");
      expect(result2).assertEqual("another-test");
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACETWO_3500
     * @tc.name      StringReplaceTest2035
     * @tc.desc      Replacement of complex regular expressions
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest2035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest2035';
      const str = "email: test@example.com, phone: 123-456-7890";
      const regex = new RegExp("([a-zA-Z0-9._-]+@[a-zA-Z0-9._-]+\\.[a-zA-Z0-9._-]+)|(\\d{3}-\\d{3}-\\d{4})", "g");
      const result = str.replace(regex, "[REDACTED]");
      expect(result).assertEqual("email: [REDACTED], phone: [REDACTED]");
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACETWO_3600
     * @tc.name      StringReplaceTest2036
     * @tc.desc      Test the maximum number of capture groups
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest2036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest2036';
      console.log(TAG + ' start');
      let result: string = replaceHelperTest.testRepeatAndReplace();
      expect(result).assertEqual("a".repeat(99));
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACETWO_3700
     * @tc.name      StringReplaceTest2037
     * @tc.desc      replace does not modify the original string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest2037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest2037';
      console.log(TAG + ' start');
      const str = "hello";
      const result = str.replace(new RegExp("hello"), "world");
      expect(result).assertEqual("world");
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACETWO_3800
     * @tc.name      StringReplaceTest2038
     * @tc.desc      Return a new string object even if there is no match
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest2038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest2038';
      console.log(TAG + ' start');
      const str = "hello";
      const result = str.replace(new RegExp("xyz"), "abc");
      expect(result).assertEqual("hello");
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACETWO_3900
     * @tc.name      StringReplaceTest2039
     * @tc.desc      The return value is always of type string
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest2039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest2039';
      console.log(TAG + ' start');
      let result: string = replaceHelperTest.testReturnValueType();
      expect(result).assertEqual("246");
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACETWO_4000
     * @tc.name      StringReplaceTest2040
     * @tc.desc      No matter what the input is, the return value is always of string type
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest2040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest2040';
      console.log(TAG + ' start');
      let result: string = replaceHelperTest.testReturnValueIsString();
      expect(result).assertEqual("246");
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACETWO_4100
     * @tc.name      StringReplaceTest2041
     * @tc.desc      Convert String wrapper object to primitive string
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest2041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest2041';
      console.log(TAG + ' start');
      const strObj = new String("hello");
      const result = strObj.replace(new RegExp("hello"), "world");
      expect(result).assertEqual("world");
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACETWO_4200
     * @tc.name      StringReplaceTest2042
     * @tc.desc      String directly calls replace
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest2042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest2042';
      console.log(TAG + ' start');
      const str = "hello world";
      const result = str.replace(new RegExp("world"), "javascript");
      expect(result).assertEqual("hello javascript");
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACETWO_4300
     * @tc.name      StringReplaceTest2043
     * @tc.desc      Call using the call method
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest2043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest2043';
      console.log(TAG + ' start');
      let result: string = replaceHelperTest.testCalledViaCall();
      expect(result).assertEqual("hello javascript");
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACETWO_4400
     * @tc.name      StringReplaceTest2044
     * @tc.desc      Call using the apply method
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest2044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest2044';
      console.log(TAG + ' start');
      let result: string = replaceHelperTest.testCalledViaApply();
      expect(result).assertEqual("hello javascript");
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACETWO_4500
     * @tc.name      StringReplaceTest2045
     * @tc.desc      Call using the bind method
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest2045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest2045';
      console.log(TAG + ' start');
      let result: string = replaceHelperTest.testCalledViaBind();
      expect(result).assertEqual("hello javascript");
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACETWO_4600
     * @tc.name      StringReplaceTest2046
     * @tc.desc      Access replace from String.prototype
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest2046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest2046';
      console.log(TAG + ' start');
      let result: string = replaceHelperTest.testAccessFromPrototype();
      expect(result).assertEqual("true");
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACETWO_4700
     * @tc.name      StringReplaceTest2047
     * @tc.desc      Override the replace method on an instance
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest2047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest2047';
      console.log(TAG + ' start');
      let result: string = replaceHelperTest.testOverrideInstanceMethod();
      expect(result).assertEqual("custom replace");
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACETWO_4800
     * @tc.name      StringReplaceTest2048
     * @tc.desc      Special behavior of matching empty strings
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest2048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest2048';
      console.log(TAG + ' start');
      const str = "abc";
      const result = str.replace(new RegExp("()", "g"), "-");
      expect(result).assertEqual("-a-b-c-");
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACETWO_4900
     * @tc.name      StringReplaceTest2049
     * @tc.desc      Optional group matches an empty string
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest2049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest2049';
      console.log(TAG + ' start');
      const str = "abc";
      const result = str.replace(new RegExp("a?"), "X");
      expect(result).assertEqual("Xbc");
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACETWO_5000
     * @tc.name      StringReplaceTest2050
     * @tc.desc      The lastIndex of a non-global regular expression does not affect matching
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest2050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest2050';
      console.log(TAG + ' start');
      const str = "hello hello";
      const regex = new RegExp("hello");
      regex.lastIndex = 6;
      const result = str.replace(regex, "hi");
      expect(result).assertEqual("hi hello");
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACETWO_5100
     * @tc.name      StringReplaceTest2051
     * @tc.desc      Regular expression status after replacement
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest2051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest2051';
      const res: string[] = replaceHelperTest.testRegexLastIndexResetAfterReplace();
      expect(res[0]).assertEqual("hi world");
      expect(res[1]).assertEqual("0");
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACETWO_5200
     * @tc.name      StringReplaceTest2052
     * @tc.desc      Dynamically build regular expressions
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest2052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest2052';
      console.log(TAG + ' start');
      const str = "hello world";
      const pattern = "hello";
      const flags = "g";
      const regex = new RegExp(pattern, flags);
      const result = str.replace(regex, "hi");
      expect(result).assertEqual("hi world");
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACETWO_5300
     * @tc.name      StringReplaceTest2053
     * @tc.desc      Create regex from user input (needs escaping)
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest2053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest2053';
      console.log(TAG + ' start');
      const str = "price: $100";
      const userInput = "$100";
      const escaped = userInput.replace(new RegExp("[.*+?^${}()|[\\]\\\\]", "g"), '\\$&');
      const regex = new RegExp(escaped, "g");
      const result = str.replace(regex, "$200");
      expect(result).assertEqual("price: $200");
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACETWO_5400
     * @tc.name      StringReplaceTest2054
     * @tc.desc      Combination of various special modes
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest2054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest2054';
      console.log(TAG + ' start');
      const str = "hello world";
      const result = str.replace(new RegExp("(\\w+) (\\w+)"), "[$&] ($`) ($') $1-$2");
      expect(result).assertEqual("[hello world] () () hello-world");
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACETWO_5500
     * @tc.name      StringReplaceTest2055
     * @tc.desc      Complex conditional replacement logic
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest2055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest2055';
      console.log(TAG + ' start');
      const str = "1 apple, 2 oranges, 3 bananas, 10 grapes";
      const result = str.replace(new RegExp("\\d+", "g"), (match: string) => {
        const num = parseInt(match);
        if (num === 1) return match;
        if (num < 5) return `few(${num})`;
        return `many(${num})`;
      });
      expect(result).assertEqual("1 apple, few(2) oranges, few(3) bananas, many(10) grapes");
      console.log(TAG + ' end');
    });
  });
}
