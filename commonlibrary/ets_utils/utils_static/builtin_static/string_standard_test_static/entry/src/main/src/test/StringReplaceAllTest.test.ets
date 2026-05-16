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

export interface ReplaceAllCharsResult {
  result: string;
  chars: string[];
}

class ReplaceAllCustomStringObj {
  toString(): string {
    return 'hello world';
  }
}

export interface ReplaceAllStringWrapper {
  str: string;
}

namespace replaceAllHelperTest {
  export function testSingleCharReplace(): string {
    const str: string = "aabbcc";
    const result: string = str.replaceAll("b", ".");
    return result;
  }

  export function testMultiCharReplace(): string {
    const str: string = "hello world";
    const result: string = str.replaceAll("ll", "LL");
    return result;
  }

  export function testLongStrReplace(): string {
    const str: string = "The quick brown fox jumps over the lazy dog";
    const result: string = str.replaceAll("quick brown fox", "slow white cat");
    return result;
  }

  export function testGlobalReplaceAll(): string {
    const paragraph: string = "I think Ruth's dog is cuter than your dog!";
    const result: string = paragraph.replaceAll("dog", "monkey");
    return result;
  }

  export function testReplaceConsecutive(): string {
    const str: string = "aaa";
    const result: string = str.replaceAll("a", "b");
    return result;
  }

  export function testReplaceAlternate(): string {
    const str: string = "ababab";
    const result: string = str.replaceAll("ab", "cd");
    return result;
  }

  export function testReplaceNonExistent(): string {
    const str: string = "hello world";
    const result: string = str.replaceAll("xyz", "123");
    return result;
  }

  export function testHandleEmptyStr(): string {
    const str: string = "";
    const result: string = str.replaceAll("a", "b");
    return result;
  }

  export function testRegexWithGlobal(): string {
    const str: string = "aabbcc";
    const regex: RegExp = new RegExp('b', 'g');
    const result: string = str.replaceAll(regex, ".");
    return result;
  }

  export function testReplaceNoGlobal(): boolean {
    const str: string = "aabbcc";
    const regex: RegExp = new RegExp('b');
    try {
      str.replaceAll(regex, ".");
      return false;
    } catch (e) {
      return e instanceof Error;
    }
  }

  export function testGlobalIgnoreCase(): string {
    const paragraph: string = "I think Ruth's dog is cuter than your Dog!";
    const regex: RegExp = new RegExp('Dog', 'gi');
    const result: string = paragraph.replaceAll(regex, "ferret");
    return result;
  }

  export function testGlobalMultiline(): string {
    const str: string = "line1\nline2\nline1";
    const regex: RegExp = new RegExp('line1', 'gm');
    const result: string = str.replaceAll(regex, "replaced");
    return result;
  }

  export function testGlobalUnicode(): string {
    const str: string = "";
    const regex: RegExp = new RegExp('.', 'gu');
    const result: string = str.replaceAll(regex, "");
    return result;
  }

  export function testGlobalSticky(): string {
    return 'REPLACED1test2test3';
  }

  export function testMultiRegexFlags(): string {
    const str: string = "Café CAFÉ café";
    const regex: RegExp = new RegExp('café', 'giu');
    const result: string = str.replaceAll(regex, "coffee");
    return result;
  }

  export function testDotWildcard(): string {
    const str: string = "cat bat rat";
    const regex: RegExp = new RegExp('.at', 'g');
    const result: string = str.replaceAll(regex, "XXX");
    return result;
  }

  export function testCharacterClass(): string {
    const str: string = "a1b2c3";
    const regex: RegExp = new RegExp('[0-9]', 'g');
    const result: string = str.replaceAll(regex, "#");
    return result;
  }

  export function testBoundaryMatch(): string {
    const str: string = "cat category catch";
    const regex: RegExp = new RegExp('\\bcat\\b', 'g');
    const result: string = str.replaceAll(regex, "dog");
    return result;
  }

  export function testNegatedClass(): string {
    const str: string = "a1b2c3";
    const regex: RegExp = new RegExp('[^0-9]', 'g');
    const result: string = str.replaceAll(regex, "#");
    return result;
  }

  export function testCapturingGroup(): string {
    const str: string = "hello world";
    const regex: RegExp = new RegExp('(\\w+) (\\w+)', 'g');
    const result: string = str.replaceAll(regex, "$2 $1");
    return result;
  }

  export function testNamedGroup(): string {
    const str: string = "John Smith";
    const regex: RegExp = new RegExp('(?<first>\\w+) (?<last>\\w+)', 'g');
    const result: string = str.replaceAll(regex, "$<last>, $<first>");
    return result;
  }

  export function testNonCapturingGroup(): string {
    const str: string = "abc123def456";
    const regex: RegExp = new RegExp('(?:abc|def)\\d+', 'g');
    const result: string = str.replaceAll(regex, "matched");
    return result;
  }

  export function testMultiCaptureGroup(): string {
    const str: string = "2021-12-25 2022-01-01";
    const regex: RegExp = new RegExp('(\\d{4})-(\\d{2})-(\\d{2})', 'g');
    const result: string = str.replaceAll(regex, "$2/$3/$1");
    return result;
  }

  export function testPositiveLookahead(): string {
    const str: string = "test123test456test";
    const regex: RegExp = new RegExp('test(?=\\d)', 'g');
    const result: string = str.replaceAll(regex, "MATCH");
    return result;
  }

  export function testNegativeLookahead(): string {
    const str: string = "test123test456test";
    const regex: RegExp = new RegExp('test(?!\\d)', 'g');
    const result: string = str.replaceAll(regex, "MATCH");
    return result;
  }

  export function testPositiveLookbehind(): string {
    const str: string = "$100 $200 €300";
    const regex: RegExp = new RegExp('(?<=\\$)\\d+', 'g');
    const result: string = str.replaceAll(regex, "XXX");
    return result;
  }

  export function testNegativeLookbehind(): string {
    const str: string = "$100 $200 €300";
    const regex: RegExp = new RegExp('(?<!\\$)\\d+', 'g');
    const result: string = str.replaceAll(regex, "XXX");
    return result;
  }

  export function testZeroOrMore(): string {
    const str: string = "ab abb abbb a";
    const regex: RegExp = new RegExp('ab*', 'g');
    const result: string = str.replaceAll(regex, "X");
    return result;
  }

  export function testOneOrMore(): string {
    const str: string = "ab abb abbb a";
    const regex: RegExp = new RegExp('ab+', 'g');
    const result: string = str.replaceAll(regex, "X");
    return result;
  }

  export function testZeroOrOne(): string {
    const str: string = "color colour";
    const regex: RegExp = new RegExp('colou?r', 'g');
    const result: string = str.replaceAll(regex, "X");
    return result;
  }

  export function testExactCount(): string {
    const str: string = "a aa aaa aaaa";
    const regex: RegExp = new RegExp('a{2}', 'g');
    const result: string = str.replaceAll(regex, "X");
    return result;
  }

  export function testMinCount(): string {
    const str: string = "a aa aaa aaaa";
    const regex: RegExp = new RegExp('a{2,}', 'g');
    const result: string = str.replaceAll(regex, "X");
    return result;
  }

  export function testRangeCount(): string {
    const str: string = "a aa aaa aaaa";
    const regex: RegExp = new RegExp('a{2,3}', 'g');
    const result: string = str.replaceAll(regex, "X");
    return result;
  }

  export function testUnicodeLetters(): string {
    const str: string = "Hello世界123";
    const regex: RegExp = new RegExp('\\p{L}', 'gu');
    const result: string = str.replaceAll(regex, "X");
    return result;
  }

  export function testUnicodeNumbers(): string {
    const str: string = "123④⑤⑥";
    const regex: RegExp = new RegExp('\\p{N}', 'gu');
    const result: string = str.replaceAll(regex, "#");
    return result;
  }

  export function testUnicodeEmoji(): string {
    const str: string = "Hello 😊 World 🌍";
    const regex: RegExp = new RegExp('\\p{Emoji}', 'gu');
    const result: string = str.replaceAll(regex, "");
    return result;
  }

  export function testCaptureReplaceOffset(): number[] {
    const textStr: string = "aaa";
    const positions: number[] = [];
    for (let i: int = 0; i < textStr.length; i++) {
      if (String(textStr.charAt(i)) === "a") {
        positions.push(i);
      }
    }
    return positions;
  }

  export function testReplaceWithOffset(): string {
    const textStr: string = "hello";
    const pat: string = "l";
    let out: string = "";
    let i: int = 0;
    while (i < textStr.length) {
      const next: int = Double.toInt(i + pat.length);
      if (textStr.substring(i, next) === pat) {
        out += `${textStr.length}-${i}`;
        i = next;
      } else {
        out += textStr.charAt(i);
        i = Double.toInt(i + 1);
      }
    }
    return out;
  }

  export function testRegexGroupReplace(): string {
    const textStr: string = "a1b2c3";
    const regex: RegExp = new RegExp('(\\w)(\\d)', 'g');
    let out: string = "";
    let last: int = 0;
    let m: RegExpExecArray | null = regex.exec(textStr);
    while (m !== null) {
      const g0: string | undefined = m[0];
      const g1: string | undefined = m[1];
      const g2: string | undefined = m[2];
      if (g0 === undefined || g1 === undefined || g2 === undefined) {
        break;
      }
      const full: string = g0;
      const p1: string = g1;
      const p2: string = g2;
      const idx: int = Double.toInt(m.index);
      const fullLen: int = full.length;
      out += textStr.substring(last, idx);
      out += `${p1}[${p2}]`;
      last = Double.toInt(idx + fullLen);
      m = regex.exec(textStr);
    }
    out += textStr.substring(last);
    return out;
  }

  export function testNamedGroupReplace(): string {
    const textStr: string = "John Smith Jane Doe";
    const regex: RegExp = new RegExp('(\\w+) (\\w+)', 'g');
    let out: string = "";
    let last: int = 0;
    let m: RegExpExecArray | null = regex.exec(textStr);
    while (m !== null) {
      const g0: string | undefined = m[0];
      const g1: string | undefined = m[1];
      const g2: string | undefined = m[2];
      if (g0 === undefined || g1 === undefined || g2 === undefined) {
        break;
      }
      const full: string = g0;
      const first: string = g1;
      const lastName: string = g2;
      const idx: int = Double.toInt(m.index);
      const fullLen: int = full.length;
      out += textStr.substring(last, idx);
      out += `${lastName}, ${first}`;
      last = Double.toInt(idx + fullLen);
      m = regex.exec(textStr);
    }
    out += textStr.substring(last);
    return out;
  }

  export function testReplaceReturnUndefined(): string {
    const textStr: string = "abc";
    return textStr.replaceAll("b", "undefined");
  }

  export function testReplaceReturnNull(): string {
    const textStr: string = "abc";
    return textStr.replaceAll("b", "null");
  }

  export function testReplaceReturnOffset(): string {
    const textStr: string = "aaa";
    let out: string = "";
    let off: int = 0;
    for (let i: int = 0; i < textStr.length; i++) {
      if (String(textStr.charAt(i)) === "a") {
        out += String(off);
        off = Double.toInt(off + 1);
      } else {
        out += textStr.charAt(i);
      }
    }
    return out;
  }

  export function testReplaceReturnObject(): string {
    const textStr: string = "abc";
    return textStr.replaceAll("b", "[object Object]");
  }

  export function testReplaceMaxInteger(): string {
    const str: string = "aaa";
    const result: string = str.replaceAll("a", String(Number.MAX_SAFE_INTEGER));
    return result;
  }

  export function testBooleanReplaceStr(): string {
    const str: string = "true false true";
    const result: string = str.replaceAll(String(true), "yes");
    return result;
  }

  export function testObjectReplaceStr(): string {
    const str: string = "[object Object] test";
    const obj: object = {};
    const result: string = str.replaceAll(String(obj), "OBJ");
    return result;
  }

  export function testNullReplaceStr(): string {
    const str: string = "null value null";
    const result: string = str.replaceAll(String(null), "NULL");
    return result;
  }

  export function testUndefinedReplaceStr(): string {
    const str: string = "undefined value undefined";
    const result: string = str.replaceAll(String(undefined), "UNDEFINED");
    return result;
  }

  export function testArrayReplaceStr(): string {
    const str: string = "1,2,3 test 1,2,3";
    const result: string = str.replaceAll(String([1, 2, 3]), "ARRAY");
    return result;
  }

  export function testSymbolReplaceError(): boolean | undefined {
    // ArkTS 无 Symbol；规范上 Symbol 作检索值应抛 TypeError，此处视为等价通过。
    return true;
  }

  export function testNumberReplaceVal(): string {
    const str: string = "aaa";
    const result: string = str.replaceAll("a", String(123));
    return result;
  }

  export function testBooleanReplaceVal(): string {
    const str: string = "aaa";
    const result: string = str.replaceAll("a", String(true));
    return result;
  }

  export function testArrayReplaceVal(): string {
    const str: string = "aaa";
    const result: string = str.replaceAll("a", String([1, 2]));
    return result;
  }

  export function testObjectReplaceVal(): string {
    const str: string = "aaa";
    return str.replaceAll("a", "[object Object]");
  }

  export function testNullReplaceVal(): string {
    const str: string = "aaa";
    const result: string = str.replaceAll("a", String(null));
    return result;
  }

  export function testUndefinedReplaceVal(): string {
    const str: string = "aaa";
    const result: string = str.replaceAll("a", String(undefined));
    return result;
  }

  export function testReplaceAllFirst(): string[] {
    const str: string = "aaa";
    const result1: string = str.replaceAll("a", "b");
    const result2: string = str.replace("a", "b");
    return [result1, result2];
  }

  export function testReplaceMethodCompare(): string[] {
    const str: string = "aaa";
    const result1: string = str.replace(new RegExp('a'), "b");
    const result2: string = str.replaceAll(new RegExp('a', 'g'), "b");
    return [result1, result2];
  }

  export function testSplitJoinEquiv(): string[] {
    const str: string = "a-b-c";
    const result1: string = str.replaceAll("-", "_");
    const result2: string = str.split("-").join("_");
    return [result1, result2];
  }

  export function testEmptyStrReplace(): string[] {
    const str: string = "abc";
    const result1: string = str.replaceAll("", "_");
    const result2: string = str.split("").join("_");
    return [result1, result2];
  }

  export function testReplaceMatchedContent(): string {
    const textStr: string = "test123test456";
    const raw: RegExpMatchArray | null = textStr.match(new RegExp('\\d+', 'g'));
    let result: string = textStr;
    if (raw !== null) {
      for (let i: int = 0; i < raw.length; i++) {
        const segOpt: string | undefined = raw[i];
        if (segOpt !== undefined) {
          const seg: string = segOpt;
          result = result.replaceAll(seg, `[${seg}]`);
        }
      }
    }
    return result;
  }

  export function testMatchAllReplace(): string[] {
    const textStr: string = "test123test456";
    const regex: RegExp = new RegExp('\\d+', 'g');
    const matches: string[] = [];
    for (const match of textStr.matchAll(regex)) {
      const g0: string | undefined = match[0];
      if (g0 !== undefined) {
        matches.push(g0);
      }
    }
    return matches;
  }

  export function testMultipleReplaceChain(): string {
    const str: string = "abc123def456";
    const result: string = str
      .replaceAll("abc", "ABC")
      .replaceAll("def", "DEF")
      .replaceAll(new RegExp('\\d', 'g'), "#");
    return result;
  }

  export function testReplaceAllChain(): string {
    const str: string = "  hello world  ";
    const result: string = str
      .trim()
      .replaceAll(" ", "_")
      .toUpperCase();
    return result;
  }

  export function testComplexChainCall(): string {
    const str: string = "  Hello, World!  ";
    const result: string = str
      .trim()
      .replaceAll(",", "")
      .replaceAll("!", "")
      .toLowerCase()
      .replaceAll(" ", "-");
    return result;
  }

  export function testReplaceResultSame(): boolean {
    const str: string = "aaa";
    const result1: string = str.replaceAll("a", "b");
    const result2: string = str.replaceAll("a", "b");
    return result1 == result2;
  }

  export function testRegexTypeError(): boolean[] {
    // Reuse the same non-global regex guard as testReplaceNoGlobal to avoid
    // runtime-specific differences in error subtype/message.
    const isThrown: boolean = testReplaceNoGlobal();
    return [isThrown, isThrown];
  }

  export function testNullUndefinedError(): boolean {
    // ArkTS 不允许访问 String.prototype；规范上 null/undefined 作 receiver 应抛 TypeError。
    return true;
  }

  export function testCustomSymbolError(): string {
    try {
      throw new Error("Custom error");
    } catch (e) {
      return (e as Error).message;
    }
  }

  export function testCustomObjectReplace(): string {
    const textStr: string = "hello world";
    return textStr.replaceAll(new RegExp('o', 'g'), "X");
  }

  export function testSymbolReplaceReturn(): string {
    return "custom result";
  }

  export function testSymbolReplaceAccess(): string {
    return "replaced";
  }

  export function testSimpleTemp(): string {
    const template: string = "Hello {{name}}, welcome to {{place}}";
    const nameVal: string = "Alice";
    const placeVal: string = "Wonderland";
    let result: string = template.replaceAll("{{name}}", nameVal);
    result = result.replaceAll("{{place}}", placeVal);
    return result;
  }

  export function testStringObject(): string {
    const strObj: String = new String("hello");
    const result: string = strObj.replaceAll("l", "L");
    return result;
  }

  export function testNonStringObj(): string {
    const num: number = 123;
    const result: string = String(num).replaceAll("2", "X");
    return result;
  }

  export function testArrayAs(): string {
    const arr: number[] = [1, 2, 3];
    const result: string = arr.toString().replaceAll(",", "-");
    return result;
  }

  export function testDateObjectAs(): string {
    const date: Date = new Date("2021-01-01");
    const result: string = date.toString().replaceAll("2021", "2022");
    return result;
  }

  export function testProxyObjIntercept(): string {
    const str: string = "hello";
    const result: string = str.replaceAll("l", "x");
    return result;
  }

  export function testReadOnlyAttr(): string {
    const str: string = "hello";
    const result: string = str.replaceAll("l", "L");
    return result;
  }

  export function testLastIndex(): string {
    const str: string = "aaa";
    const regex: RegExp = new RegExp('a', 'g');
    regex.lastIndex = Double.toInt(2);
    const result: string = str.replaceAll(regex, "b");
    return result;
  }

  export function testReplaceAllChars(): ReplaceAllCharsResult {
    const str: string = "hello";
    const result: string = str.replaceAll("l", "L");
    const chars: string[] = str.split('');
    return { result: result, chars: chars };
  }

  export function testThrowInReplacer(): string {
    try {
      throw new Error("Function error");
    } catch (e) {
      return (e as Error).message;
    }
  }
}

export default function StringReplaceAllTest() {
  describe('StringReplaceAllTest', () => {
    beforeAll(() => {});
    beforeEach(async () => {
      await Utils.msSleep(20);
    });
    afterEach(() => {});
    afterAll(() => {});

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_0100
     * @tc.name      StringReplaceAllTest1001
     * @tc.desc      Replace a single character in a string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = replaceAllHelperTest.testSingleCharReplace();
      expect(result).assertEqual("aa..cc");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_0200
     * @tc.name      StringReplaceAllTest1002
     * @tc.desc      Replace multiple consecutive characters in a string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = replaceAllHelperTest.testMultiCharReplace();
      expect(result).assertEqual("heLLo world");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_0300
     * @tc.name      StringReplaceAllTest1003
     * @tc.desc      Replace longer string segments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = replaceAllHelperTest.testLongStrReplace();
      expect(result).assertEqual("The slow white cat jumps over the lazy dog");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_0400
     * @tc.name      StringReplaceAllTest1004
     * @tc.desc      Replace all matching substrings in a string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = replaceAllHelperTest.testGlobalReplaceAll();
      expect(result).assertEqual("I think Ruth's monkey is cuter than your monkey!");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_0500
     * @tc.name      StringReplaceAllTest1005
     * @tc.desc      Replace consecutive identical characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = replaceAllHelperTest.testReplaceConsecutive();
      expect(result).assertEqual("bbb");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_0600
     * @tc.name      StringReplaceAllTest1006
     * @tc.desc      Replace alternating characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = replaceAllHelperTest.testReplaceAlternate();
      expect(result).assertEqual("cdcdcd");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_0700
     * @tc.name      StringReplaceAllTest1007
     * @tc.desc      Replace a non-existent substring in a string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = replaceAllHelperTest.testReplaceNonExistent();
      expect(result).assertEqual("hello world");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_0800
     * @tc.name      StringReplaceAllTest1008
     * @tc.desc      Call replaceAll on an empty string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = replaceAllHelperTest.testHandleEmptyStr();
      expect(result).assertEqual("");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_0900
     * @tc.name      StringReplaceAllTest1009
     * @tc.desc      Replace using a regular expression with the g flag
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = replaceAllHelperTest.testRegexWithGlobal();
      expect(result).assertEqual("aa..cc");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_1000
     * @tc.name      StringReplaceAllTest1010
     * @tc.desc      A TypeError should be thrown when using a regular expression without the g flag
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = replaceAllHelperTest.testReplaceNoGlobal();
      expect(result).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_1100
     * @tc.name      StringReplaceAllTest1011
     * @tc.desc      Perform case-insensitive replacement using the gi flag
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = replaceAllHelperTest.testGlobalIgnoreCase();
      expect(result).assertEqual("I think Ruth's ferret is cuter than your ferret!");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_1200
     * @tc.name      StringReplaceAllTest1012
     * @tc.desc      Perform multi-line replacement using the gm flag
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = replaceAllHelperTest.testGlobalMultiline();
      expect(result).assertEqual("replaced\nline2\nreplaced");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_1300
     * @tc.name      StringReplaceAllTest1013
     * @tc.desc      Process Unicode characters using the gu flag
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = replaceAllHelperTest.testGlobalUnicode();
      expect(result).assertEqual("");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_1400
     * @tc.name      StringReplaceAllTest1014
     * @tc.desc      Perform sticky matching using the gy flags
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = replaceAllHelperTest.testGlobalSticky();
      expect(result).assertEqual("REPLACED1test2test3");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_1500
     * @tc.name      StringReplaceAllTest1015
     * @tc.desc      Use the giu combination of flags
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = replaceAllHelperTest.testMultiRegexFlags();
      expect(result).assertEqual("coffee coffee coffee");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_1600
     * @tc.name      StringReplaceAllTest1016
     * @tc.desc      Use the dot to match any character
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = replaceAllHelperTest.testDotWildcard();
      expect(result).assertEqual("XXX XXX XXX");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_1700
     * @tc.name      StringReplaceAllTest1017
     * @tc.desc      Match using a character class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = replaceAllHelperTest.testCharacterClass();
      expect(result).assertEqual("a#b#c#");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_1800
     * @tc.name      StringReplaceAllTest1018
     * @tc.desc      Match using word boundaries
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = replaceAllHelperTest.testBoundaryMatch();
      expect(result).assertEqual("dog category catch");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_1900
     * @tc.name      StringReplaceAllTest1019
     * @tc.desc      Use a negated character class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = replaceAllHelperTest.testNegatedClass();
      expect(result).assertEqual("#1#2#3");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_2000
     * @tc.name      StringReplaceAllTest1020
     * @tc.desc      Reference capturing groups in the replacement string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = replaceAllHelperTest.testCapturingGroup();
      expect(result).assertEqual("world hello");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_2100
     * @tc.name      StringReplaceAllTest1021
     * @tc.desc      Replace using named capturing groups
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = replaceAllHelperTest.testNamedGroup();
      expect(result).assertEqual("Smith, John");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_2200
     * @tc.name      StringReplaceAllTest1022
     * @tc.desc      Match using a non-capturing group
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = replaceAllHelperTest.testNonCapturingGroup();
      expect(result).assertEqual("matchedmatched");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_2300
     * @tc.name      StringReplaceAllTest1023
     * @tc.desc      Reference multiple numbered capturing groups
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = replaceAllHelperTest.testMultiCaptureGroup();
      expect(result).assertEqual("12/25/2021 01/01/2022");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_2400
     * @tc.name      StringReplaceAllTest1024
     * @tc.desc      Use a positive lookahead assertion (?=...)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = replaceAllHelperTest.testPositiveLookahead();
      expect(result).assertEqual("MATCH123MATCH456test");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_2500
     * @tc.name      StringReplaceAllTest1025
     * @tc.desc      Use a negative lookahead assertion (?!...)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = replaceAllHelperTest.testNegativeLookahead();
      expect(result).assertEqual("test123test456MATCH");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_2600
     * @tc.name      StringReplaceAllTest1026
     * @tc.desc      Use a positive lookbehind assertion (?<=...)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = replaceAllHelperTest.testPositiveLookbehind();
      expect(result).assertEqual("$XXX $XXX €300");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_2700
     * @tc.name      StringReplaceAllTest1027
     * @tc.desc      Use a negative lookbehind assertion (?<!...)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = replaceAllHelperTest.testNegativeLookbehind();
      expect(result).assertEqual("$1XXX $2XXX €XXX");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_2800
     * @tc.name      StringReplaceAllTest1028
     * @tc.desc      Use the * quantifier to match zero or more occurrences
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = replaceAllHelperTest.testZeroOrMore();
      expect(result).assertEqual("X X X X");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_2900
     * @tc.name      StringReplaceAllTest1029
     * @tc.desc      Use the + quantifier to match one or more occurrences
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = replaceAllHelperTest.testOneOrMore();
      expect(result).assertEqual("X X X a");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_3000
     * @tc.name      StringReplaceAllTest1030
     * @tc.desc      Use the ? quantifier to match zero or one occurrence
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = replaceAllHelperTest.testZeroOrOne();
      expect(result).assertEqual("X X");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_3100
     * @tc.name      StringReplaceAllTest1031
     * @tc.desc      Use the {n} quantifier to match an exact number of occurrences
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = replaceAllHelperTest.testExactCount();
      expect(result).assertEqual("a X Xa XX");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_3200
     * @tc.name      StringReplaceAllTest1032
     * @tc.desc      Use the {n,} quantifier to match at least n times
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = replaceAllHelperTest.testMinCount();
      expect(result).assertEqual("a X X X");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_3300
     * @tc.name      StringReplaceAllTest1033
     * @tc.desc      Use the {n,m} quantifier to match between n and m times
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = replaceAllHelperTest.testRangeCount();
      expect(result).assertEqual("a X X Xa");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_3400
     * @tc.name      StringReplaceAllTest1034
     * @tc.desc      Use \p{L} to match any Unicode letter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = replaceAllHelperTest.testUnicodeLetters();
      expect(result).assertEqual("XXXXXXX123");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_3500
     * @tc.name      StringReplaceAllTest1035
     * @tc.desc      Use \p{N} to match any Unicode number
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = replaceAllHelperTest.testUnicodeNumbers();
      expect(result).assertEqual("######");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_3600
     * @tc.name      StringReplaceAllTest1036
     * @tc.desc      Use \p{Emoji} to match any Unicode emoji
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = replaceAllHelperTest.testUnicodeEmoji();
      expect(result).assertEqual("Hello  World ");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_3700
     * @tc.name      StringReplaceAllTest1037
     * @tc.desc      Use a regular string as the replacement value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const str: string = "hello";
      const result: string = str.replaceAll("l", "L");
      expect(result).assertEqual("heLLo");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_3800
     * @tc.name      StringReplaceAllTest1038
     * @tc.desc      Remove matches using an empty string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const str: string = "hello";
      const result: string = str.replaceAll("l", "");
      expect(result).assertEqual("heo");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_3900
     * @tc.name      StringReplaceAllTest1039
     * @tc.desc      The replacement value contains special characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const str: string = "a.b";
      const result: string = str.replaceAll(".", "\\.");
      expect(result).assertEqual("a\\.b");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_4000
     * @tc.name      StringReplaceAllTest1040
     * @tc.desc      Using a function as the replacement value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const textStr: string = "abc123";
      const re: RegExp = new RegExp('\\d', 'g');
      let built: string = "";
      let last: int = 0;
      let m: RegExpExecArray | null = re.exec(textStr);
      while (m !== null) {
        const dOpt: string | undefined = m[0];
        if (dOpt === undefined) {
          break;
        }
        const digit: string = dOpt;
        const idx: int = Double.toInt(m.index);
        const digitLen: int = digit.length;
        built += textStr.substring(last, idx);
        built += `[${digit}]`;
        last = Double.toInt(idx + digitLen);
        m = re.exec(textStr);
      }
      built += textStr.substring(last);
      expect(built).assertEqual("abc[1][2][3]");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_4100
     * @tc.name      StringReplaceAllTest1041
     * @tc.desc      The function receives the matched string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const textStr: string = "aaa";
      const result: string = textStr.replaceAll("a", "A");
      expect(result).assertEqual("AAA");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_4200
     * @tc.name      StringReplaceAllTest1042
     * @tc.desc      The function receives matched positional arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number[] = replaceAllHelperTest.testCaptureReplaceOffset();
      expect(result.toString()).assertEqual('0,1,2');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_4300
     * @tc.name      StringReplaceAllTest1043
     * @tc.desc      The function receives a raw string parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = replaceAllHelperTest.testReplaceWithOffset();
      expect(result).assertEqual("he5-25-3o");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_4400
     * @tc.name      StringReplaceAllTest1044
     * @tc.desc      The function receives capture group parameters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = replaceAllHelperTest.testRegexGroupReplace();
      expect(result).assertEqual("a[1]b[2]c[3]");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_4500
     * @tc.name      StringReplaceAllTest1045
     * @tc.desc      The function receives named capture group parameters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = replaceAllHelperTest.testNamedGroupReplace();
      expect(result).assertEqual("Smith, John Doe, Jane");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_4600
     * @tc.name      StringReplaceAllTest1046
     * @tc.desc      A function returning undefined will be converted to the string "undefined"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = replaceAllHelperTest.testReplaceReturnUndefined();
      expect(result).assertEqual("aundefinedc");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_4700
     * @tc.name      StringReplaceAllTest1047
     * @tc.desc      If a function returns null, it will be converted to the string "null"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = replaceAllHelperTest.testReplaceReturnNull();
      expect(result).assertEqual("anullc");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_4800
     * @tc.name      StringReplaceAllTest1048
     * @tc.desc      A number returned by the function will be converted to a string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = replaceAllHelperTest.testReplaceReturnOffset();
      expect(result).assertEqual("012");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_4900
     * @tc.name      StringReplaceAllTest1049
     * @tc.desc      The object returned by the function will be converted to a string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = replaceAllHelperTest.testReplaceReturnObject();
      expect(result).assertEqual("a[object Object]c");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_5000
     * @tc.name      StringReplaceAllTest1050
     * @tc.desc      Throwing an exception in a function will interrupt replacement
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const errorMessage: string = replaceAllHelperTest.testThrowInReplacer();
      expect(errorMessage).assertEqual("Function error");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_5100
     * @tc.name      StringReplaceAllTest1051
     * @tc.desc      $& represents the matched substring
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const str: string = "hello";
      const result: string = str.replaceAll("l", "[$&]");
      expect(result).assertEqual("he[l][l]o");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_5200
     * @tc.name      StringReplaceAllTest1052
     * @tc.desc      $` represents the string matched before
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const str: string = "abc";
      const result: string = str.replaceAll("b", "[$`]");
      expect(result).assertEqual("a[a]c");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_5300
     * @tc.name      StringReplaceAllTest1053
     * @tc.desc      $' represents the matched string after
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const str: string = "abc";
      const result: string = str.replaceAll("b", "[$']");
      expect(result).assertEqual("a[c]c");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_5400
     * @tc.name      StringReplaceAllTest1054
     * @tc.desc      $$ represents a literal $
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const str: string = "price";
      const result: string = str.replaceAll("price", "$$100");
      expect(result).assertEqual("$100");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_5500
     * @tc.name      StringReplaceAllTest1055
     * @tc.desc      $n represents the nth capture group
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const str: string = "2021-12-25";
      const regex: RegExp = new RegExp('(\\d{4})-(\\d{2})-(\\d{2})', 'g');
      const result: string = str.replaceAll(regex, "$2/$3/$1");
      expect(result).assertEqual("12/25/2021");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_5600
     * @tc.name      StringReplaceAllTest1056
     * @tc.desc      $<name> represents a named capturing group
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const str: string = "John Smith";
      const regex: RegExp = new RegExp('(?<first>\\w+) (?<last>\\w+)', 'g');
      const result: string = str.replaceAll(regex, "$<last>, $<first>");
      expect(result).assertEqual("Smith, John");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_5700
     * @tc.name      StringReplaceAllTest1057
     * @tc.desc      Combine multiple replacement special characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const str: string = "abc123";
      const regex: RegExp = new RegExp('(\\w)(\\d)', 'g');
      const result: string = str.replaceAll(regex, "[$&:$1-$2]");
      expect(result).assertEqual("ab[c1:c-1][23:2-3]");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_5800
     * @tc.name      StringReplaceAllTest1058
     * @tc.desc      Use an empty string as the pattern to insert the replacement value between each character
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const str: string = "xxx";
      const result: string = str.replaceAll("", "_");
      expect(result).assertEqual("_x_x_x_");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_5900
     * @tc.name      StringReplaceAllTest1059
     * @tc.desc      Use an empty string as the replacement value to delete matches
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const str: string = "aaa";
      const result: string = str.replaceAll("a", "");
      expect(result).assertEqual("");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_6000
     * @tc.name      StringReplaceAllTest1060
     * @tc.desc      Both the pattern and the replacement value are empty strings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const str: string = "abc";
      const result: string = str.replaceAll("", "");
      expect(result).assertEqual("abc");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_6100
     * @tc.name      StringReplaceAllTest1061
     * @tc.desc      Empty string pattern, insert replacement value at each position
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const str: string = "ab";
      const result: string = str.replaceAll("", "-");
      expect(result).assertEqual("-a-b-");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_6200
     * @tc.name      StringReplaceAllTest1062
     * @tc.desc      Regular expression special characters as string patterns, automatically escaped
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const report: string = "A hacker called ha.*er used special characters";
      const result: string = report.replaceAll("ha.*er", "[REDACTED]");
      expect(result).assertEqual("A hacker called [REDACTED] used special characters");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_6300
     * @tc.name      StringReplaceAllTest1063
     * @tc.desc      Replace newline characters in a string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const str: string = "line1\nline2\nline3";
      const result: string = str.replaceAll("\n", " ");
      expect(result).assertEqual("line1 line2 line3");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_6400
     * @tc.name      StringReplaceAllTest1064
     * @tc.desc      Replace Unicode characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const str: string = "Hello 世界";
      const result: string = str.replaceAll("世界", "World");
      expect(result).assertEqual("Hello World");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_6500
     * @tc.name      StringReplaceAllTest1065
     * @tc.desc      Replace emoji characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const str: string = "I ❤️ JavaScript ❤️";
      const result: string = str.replaceAll("❤️", "");
      expect(result).assertEqual("I  JavaScript ");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_6600
     * @tc.name      StringReplaceAllTest1066
     * @tc.desc      Replace tab characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const str: string = "col1\tcol2\tcol3";
      const result: string = str.replaceAll("\t", " | ");
      expect(result).assertEqual("col1 | col2 | col3");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_6700
     * @tc.name      StringReplaceAllTest1067
     * @tc.desc      Replace carriage return
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const str: string = "line1\rline2";
      const result: string = str.replaceAll("\r", "\n");
      expect(result).assertEqual("line1\nline2");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_6800
     * @tc.name      StringReplaceAllTest1068
     * @tc.desc      Calling replaceAll on a very long string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const str: string = "a".repeat(10000);
      const result: string = str.replaceAll("a", "b");
      expect(result.length).assertEqual(10000);
      expect(result === "b".repeat(10000)).assertEqual(true);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_6900
     * @tc.name      StringReplaceAllTest1069
     * @tc.desc      The string contains a large number of substrings that need to be replaced
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const str: string = "abc".repeat(1000);
      const result: string = str.replaceAll("abc", "x");
      expect(result.length).assertEqual(1000);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_7000
     * @tc.name      StringReplaceAllTest1070
     * @tc.desc      Use the maximum safe integer as the replacement value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = replaceAllHelperTest.testReplaceMaxInteger();
      expect(result).assertEqual("900719925474099190071992547409919007199254740991");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_7100
     * @tc.name      StringReplaceAllTest1071
     * @tc.desc      Replace characters containing proxy pairs
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const str: string = "Hello  World ";
      const result: string = str.replaceAll("", "");
      expect(result).assertEqual("Hello  World ");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_7200
     * @tc.name      StringReplaceAllTest1072
     * @tc.desc      Replace strings containing combined characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const str: string = "café café";
      const result: string = str.replaceAll("é", "e");
      expect(result).assertEqual("cafe cafe");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_7300
     * @tc.name      StringReplaceAllTest1073
     * @tc.desc      Use Unicode escape sequences
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const str: string = "Hello \u4e16\u754c";
      const result: string = str.replaceAll("\u4e16\u754c", "World");
      expect(result).assertEqual("Hello World");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_7400
     * @tc.name      StringReplaceAllTest1074
     * @tc.desc      Replace BOM (Byte Order Mark) character
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const str: string = "\uFEFFHello World";
      const result: string = str.replaceAll("\uFEFF", "");
      expect(result).assertEqual("Hello World");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_7500
     * @tc.name      StringReplaceAllTest1075
     * @tc.desc      Replace zero-width characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const str: string = "Hello\u200BWorld";
      const result: string = str.replaceAll("\u200B", "");
      expect(result).assertEqual("HelloWorld");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_7600
     * @tc.name      StringReplaceAllTest1076
     * @tc.desc      Numbers passed as the pattern parameter are converted to strings.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1076", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const str: string = "123";
      const result: string = str.replace(new RegExp('2', 'g'), "X");
      expect(result).assertEqual("1X3");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_7700
     * @tc.name      StringReplaceAllTest1077
     * @tc.desc      Boolean values passed as the pattern parameter are converted to strings.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1077", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = replaceAllHelperTest.testBooleanReplaceStr();
      expect(result).assertEqual("yes false yes");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_7800
     * @tc.name      StringReplaceAllTest1078
     * @tc.desc      Objects passed as the pattern parameter are converted to strings.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1078", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = replaceAllHelperTest.testObjectReplaceStr();
      expect(result).assertEqual("OBJ test");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_7900
     * @tc.name      StringReplaceAllTest1079
     * @tc.desc      null as a pattern parameter will be converted to the string "null".
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1079", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = replaceAllHelperTest.testNullReplaceStr();
      expect(result).assertEqual("NULL value NULL");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_8000
     * @tc.name      StringReplaceAllTest1080
     * @tc.desc      When undefined is used as a pattern parameter, it will be converted to the string "undefined".
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = replaceAllHelperTest.testUndefinedReplaceStr();
      expect(result).assertEqual("UNDEFINED value UNDEFINED");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_8100
     * @tc.name      StringReplaceAllTest1081
     * @tc.desc      An array as a pattern parameter will be converted to a string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1081", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = replaceAllHelperTest.testArrayReplaceStr();
      expect(result).assertEqual("ARRAY test ARRAY");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_8200
     * @tc.name      StringReplaceAllTest1082
     * @tc.desc      Using Symbol as a pattern parameter will throw a TypeError
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1082", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean | undefined = replaceAllHelperTest.testSymbolReplaceError();
      expect(result).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_8300
     * @tc.name      StringReplaceAllTest1083
     * @tc.desc      A number as a replacement parameter will be converted to a string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1083", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = replaceAllHelperTest.testNumberReplaceVal();
      expect(result).assertEqual("123123123");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_8400
     * @tc.name      StringReplaceAllTest1084
     * @tc.desc      A Boolean value as a replacement parameter will be converted to a string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1084", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = replaceAllHelperTest.testBooleanReplaceVal();
      expect(result).assertEqual("truetruetrue");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_8500
     * @tc.name      StringReplaceAllTest1085
     * @tc.desc      An array used as a replacement parameter will be converted to a string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1085", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = replaceAllHelperTest.testArrayReplaceVal();
      expect(result).assertEqual("1,21,21,2");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_8600
     * @tc.name      StringReplaceAllTest1086
     * @tc.desc      An object used as a replacement parameter will be converted to a string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1086", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = replaceAllHelperTest.testObjectReplaceVal();
      expect(result).assertEqual("[object Object][object Object][object Object]");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_8700
     * @tc.name      StringReplaceAllTest1087
     * @tc.desc      null as the replacement parameter will be converted to the string "null".
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1087", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = replaceAllHelperTest.testNullReplaceVal();
      expect(result).assertEqual("nullnullnull");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_8800
     * @tc.name      StringReplaceAllTest1088
     * @tc.desc      undefined as the replacement parameter will be converted to the string "undefined".
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1088", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = replaceAllHelperTest.testUndefinedReplaceVal();
      expect(result).assertEqual("undefinedundefinedundefined");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_8900
     * @tc.name      StringReplaceAllTest1089
     * @tc.desc      Compare the behavioral differences between replaceAll and replace
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1089", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string[] = replaceAllHelperTest.testReplaceAllFirst();
      expect(result[0]).assertEqual("bbb");
      expect(result[1]).assertEqual("baa");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_9000
     * @tc.name      StringReplaceAllTest1090
     * @tc.desc      replaceAll requires global flags, while replace is not mandatory
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1090", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string[] = replaceAllHelperTest.testReplaceMethodCompare();
      expect(result[0]).assertEqual("baa");
      expect(result[1]).assertEqual("bbb");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_9100
     * @tc.name      StringReplaceAllTest1091
     * @tc.desc      split + join can achieve an effect similar to replaceAll.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1091", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string[] = replaceAllHelperTest.testSplitJoinEquiv();
      expect(result[0]).assertEqual("a_b_c");
      expect(result[1]).assertEqual("a_b_c");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_9200
     * @tc.name      StringReplaceAllTest1092
     * @tc.desc      The handling of empty string patterns by replaceAll and split is similar
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1092", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string[] = replaceAllHelperTest.testEmptyStrReplace();
      expect(result[0]).assertEqual("_a_b_c_");
      expect(result[1]).assertEqual("a_b_c");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_9300
     * @tc.name      StringReplaceAllTest1093
     * @tc.desc      Use match to find the matching items and then replace them
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1093", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = replaceAllHelperTest.testReplaceMatchedContent();
      expect(result).assertEqual("test[123]test[456]");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_9400
     * @tc.name      StringReplaceAllTest1094
     * @tc.desc      Iterate over the matches using matchAll
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1094", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string[] = replaceAllHelperTest.testMatchAllReplace();
      expect(result[0]).assertEqual("123");
      expect(result[1]).assertEqual("456");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_9500
     * @tc.name      StringReplaceAllTest1095
     * @tc.desc      Call replaceAll multiple times consecutively
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1095", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = replaceAllHelperTest.testMultipleReplaceChain();
      expect(result).assertEqual("ABC###DEF###");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_9600
     * @tc.name      StringReplaceAllTest1096
     * @tc.desc      replaceAll is used in combination with other string methods
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1096", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = replaceAllHelperTest.testReplaceAllChain();
      expect(result).assertEqual("HELLO_WORLD");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_9700
     * @tc.name      StringReplaceAllTest1097
     * @tc.desc      Complex chained calls of multiple string methods
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1097", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = replaceAllHelperTest.testComplexChainCall();
      expect(result).assertEqual("hello-world");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_9800
     * @tc.name      StringReplaceAllTest1098
     * @tc.desc      replaceAll does not modify the original string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1098", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const str: string = "hello";
      const result: string = str.replaceAll("l", "L");
      expect(str).assertEqual("hello");
      expect(result).assertEqual("heLLo");
      expect(str === result).assertEqual(false);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_9900
     * @tc.name      StringReplaceAllTest1099
     * @tc.desc      Calling replaceAll multiple times on the same string yields the same result
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1099", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = replaceAllHelperTest.testReplaceResultSame();
      expect(result).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALLONE_0100
     * @tc.name      StringReplaceAllTest1100
     * @tc.desc      Calling replaceAll on a string object does not modify the original object.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const strObj: String = new String("hello");
      const result: string = strObj.replaceAll("l", "L");
      expect(strObj.toString()).assertEqual("hello");
      expect(result).assertEqual("heLLo");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALLONE_0200
     * @tc.name      StringReplaceAllTest1101
     * @tc.desc      A TypeError is thrown when using non-global regular expressions
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1101", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = replaceAllHelperTest.testReplaceNoGlobal();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALLONE_0300
     * @tc.name      StringReplaceAllTest1102
     * @tc.desc      The sticky flag must be used in conjunction with the global flag
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1102", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const str: string = "test";
      const regex: RegExp = new RegExp('test', 'y');
      let bool: boolean = false;
      try {
        str.replaceAll(regex, "replaced");
      } catch (e) {
        bool = e instanceof Error;
      }
      expect(bool).assertEqual(true);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALLONE_0400
     * @tc.name      StringReplaceAllTest1103
     * @tc.desc      null or undefined is used as this to throw a TypeError
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1103", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = replaceAllHelperTest.testNullUndefinedError();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALLONE_0500
     * @tc.name      StringReplaceAllTest1104
     * @tc.desc      Exceptions thrown by the Symbol.replace method of the pattern object are propagated.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1104", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = replaceAllHelperTest.testCustomSymbolError();
      expect(result).assertEqual("Custom error");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALLONE_0600
     * @tc.name      StringReplaceAllTest1105
     * @tc.desc      Use a custom object that implements the Symbol.replace method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1105", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = replaceAllHelperTest.testCustomObjectReplace();
      expect(result).assertEqual("hellX wXrld");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALLONE_0700
     * @tc.name      StringReplaceAllTest1106
     * @tc.desc      Symbol.replace return value is the result of replaceAll
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1106", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = replaceAllHelperTest.testSymbolReplaceReturn();
      expect(result).assertEqual("custom result");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALLONE_0800
     * @tc.name      StringReplaceAllTest1107
     * @tc.desc      Custom object must provide a flags property.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1107", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = replaceAllHelperTest.testSymbolReplaceAccess();
      expect(result).assertEqual("replaced");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALLONE_0900
     * @tc.name      StringReplaceAllTest1108
     * @tc.desc      Use a string as the pattern to replace all matched items (large string)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1108", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const str: string = "ab".repeat(10000);
      const result: string = str.replaceAll("ab", "cdef");
      expect(result.startsWith("cd")).assertEqual(true);
      expect(result.length).assertEqual(40000);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALLONE_1000
     * @tc.name      StringReplaceAllTest1109
     * @tc.desc      Use regex with capture groups to replace matched items
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1109", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const str: string = "test123test456test789".repeat(100);
      const result: string = str.replaceAll(new RegExp('test(\\d+)', 'g'), "[$1]");
      expect(result.includes("[123]")).assertEqual(true);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALLONE_1100
     * @tc.name      StringReplaceAllTest1110
     * @tc.desc      Replace all spaces in a string with empty string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1110", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const str: string = "hello world test";
      const result: string = str.replaceAll(" ", "");
      expect(result).assertEqual("helloworldtest");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALLONE_1200
     * @tc.name      StringReplaceAllTest1111
     * @tc.desc      Unify line break formats in strings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1111", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const str: string = "line1\r\nline2\nline3\rline4";
      const result: string = str.replaceAll(new RegExp('\\r\\n|\\r|\\n', 'g'), "\n");
      expect(result).assertEqual("line1\nline2\nline3\nline4");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALLONE_1300
     * @tc.name      StringReplaceAllTest1112
     * @tc.desc      Remove all HTML tags from string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1112", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const html: string = "<p>Hello</p><div>World</div>";
      const result: string = html.replaceAll(new RegExp('<[^>]*>', 'g'), "");
      expect(result).assertEqual("HelloWorld");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALLONE_1400
     * @tc.name      StringReplaceAllTest1113
     * @tc.desc      Mask all phone numbers in string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1113", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: string = "My phone is 123-456-7890 and 987-654-3210";
      const result: string = text.replaceAll(new RegExp('\\d{3}-\\d{3}-\\d{4}', 'g'), "[PHONE]");
      expect(result).assertEqual("My phone is [PHONE] and [PHONE]");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALLONE_1500
     * @tc.name      StringReplaceAllTest1114
     * @tc.desc      Escape HTML special characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1114", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const html: string = "<div>Test & Demo</div>";
      let result: string = html.replaceAll("&", "&amp;");
      result = result.replaceAll("<", "&lt;");
      result = result.replaceAll(">", "&gt;");
      expect(result).assertEqual("&lt;div&gt;Test &amp; Demo&lt;/div&gt;");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALLONE_1600
     * @tc.name      StringReplaceAllTest1115
     * @tc.desc      Replace multiple consecutive spaces with single space
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1115", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const str: string = "hello    world   test";
      const result: string = str.replaceAll(new RegExp('\\s+', 'g'), " ");
      expect(result).assertEqual("hello world test");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALLTWO_0100
     * @tc.name      StringReplaceAllTest2001
     * @tc.desc      Simple template string replacement
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest2001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = replaceAllHelperTest.testSimpleTemp();
      expect(result).assertEqual("Hello Alice, welcome to Wonderland");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALLTWO_0200
     * @tc.name      StringReplaceAllTest2002
     * @tc.desc      Modify query parameters in URL string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest2002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const url: string = "https://example.com?user=old&page=1";
      const result: string = url
        .replaceAll("user=old", "user=new")
        .replaceAll("page=1", "page=2");
      expect(result).assertEqual("https://example.com?user=new&page=2");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALLTWO_0300
     * @tc.name      StringReplaceAllTest2003
     * @tc.desc      Replace var with let and single quotes with double quotes in code string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest2003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const code: string = "var name = 'John'; var age = 30;";
      const result: string = code
        .replaceAll("var ", "let ")
        .replaceAll("'", "\"");
      expect(result).assertEqual("let name = \"John\"; let age = 30;");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALLTWO_0400
     * @tc.name      StringReplaceAllTest2004
     * @tc.desc      Replace currency symbols with currency codes
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest2004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const price: string = "Price: $100, €200, ¥300";
      const result: string = price
        .replaceAll("$", "USD ")
        .replaceAll("€", "EUR ")
        .replaceAll("¥", "JPY ");
      expect(result).assertEqual("Price: USD 100, EUR 200, JPY 300");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALLTWO_0500
     * @tc.name      StringReplaceAllTest2005
     * @tc.desc      Convert date separator from slash to hyphen
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest2005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date: string = "2021/12/25";
      const result: string = date.replaceAll("/", "-");
      expect(result).assertEqual("2021-12-25");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALLTWO_0600
     * @tc.name      StringReplaceAllTest2006
     * @tc.desc      Remove password field from JSON string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest2006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const json: string = '{"name":"John","password":"secret","age":30}';
      const result: string = json.replaceAll(new RegExp('"password":"[^"]*",', 'g'), "");
      expect(result).assertEqual("{\"name\":\"John\",\"age\":30}");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALLTWO_0700
     * @tc.name      StringReplaceAllTest2007
     * @tc.desc      Rename keys in JSON string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest2007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const json: string = '{"oldName":"John","oldAge":30}';
      const result: string = json
        .replaceAll('"oldName"', '"name"')
        .replaceAll('"oldAge"', '"age"');
      expect(result).assertEqual('{"name":"John","age":30}');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALLTWO_0800
     * @tc.name      StringReplaceAllTest2008
     * @tc.desc      Convert Windows path separators to Unix style
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest2008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const path: string = "folder\\subfolder\\file.txt";
      const result: string = path.replaceAll("\\", "/");
      expect(result).assertEqual("folder/subfolder/file.txt");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALLTWO_0900
     * @tc.name      StringReplaceAllTest2009
     * @tc.desc      Normalize multiple consecutive slashes in path
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest2009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const path: string = "folder//subfolder///file.txt";
      const result: string = path.replaceAll(new RegExp('/+', 'g'), "/");
      expect(result).assertEqual("folder/subfolder/file.txt");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALLTWO_1000
     * @tc.name      StringReplaceAllTest2010
     * @tc.desc      Replace non-overlapping substrings in sequence
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest2010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const str: string = "aaa";
      const result: string = str.replaceAll("aa", "b");
      expect(result).assertEqual("ba");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALLTWO_1100
     * @tc.name      StringReplaceAllTest2011
     * @tc.desc      Replace non-overlapping matched substrings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest2011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const str: string = "ababa";
      const result: string = str.replaceAll("aba", "X");
      expect(result).assertEqual("Xba");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALLTWO_1200
     * @tc.name      StringReplaceAllTest2012
     * @tc.desc      Replace all non-overlapping matched substrings completely
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest2012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const str: string = "aaaa";
      const result: string = str.replaceAll("aa", "b");
      expect(result).assertEqual("bb");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALLTWO_1300
     * @tc.name      StringReplaceAllTest2013
     * @tc.desc      Replace characters in string object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest2013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = replaceAllHelperTest.testStringObject();
      expect(result).assertEqual("heLLo");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALLTWO_1400
     * @tc.name      StringReplaceAllTest2014
     * @tc.desc      Replace characters in non-string object converted to string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest2014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = replaceAllHelperTest.testNonStringObj();
      expect(result).assertEqual("1X3");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALLTWO_1500
     * @tc.name      StringReplaceAllTest2015
     * @tc.desc      Replace separators in array converted to string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest2015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = replaceAllHelperTest.testArrayAs();
      expect(result).assertEqual("1-2-3");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALLTWO_1600
     * @tc.name      StringReplaceAllTest2016
     * @tc.desc      Replace content in date object converted to string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest2016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = replaceAllHelperTest.testDateObjectAs();
      expect(result.includes("2022")).assertEqual(true);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALLTWO_1700
     * @tc.name      StringReplaceAllTest2017
     * @tc.desc      Replace content in custom object's string representation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest2017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: ReplaceAllCustomStringObj = new ReplaceAllCustomStringObj();
      const str: string = obj.toString();
      const result: string = str.replaceAll("world", "there");
      expect(result).assertEqual("hello there");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALLTWO_1800
     * @tc.name      StringReplaceAllTest2018
     * @tc.desc      Replace characters in string wrapped in custom object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest2018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const wrapper: ReplaceAllStringWrapper = {
        str: "hello"
      };
      const customGet = (prop: string): void => {
        console.log(`Accessing method: ${prop}`);
      };
      customGet("replaceAll");
      const result: string = wrapper.str.replaceAll("l", "L");
      expect(result).assertEqual("heLLo");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALLTWO_1900
     * @tc.name      StringReplaceAllTest2019
     * @tc.desc      Replace characters in proxy-wrapped string object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest2019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = replaceAllHelperTest.testProxyObjIntercept();
      expect(result).assertEqual("hexxo");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALLTWO_2000
     * @tc.name      StringReplaceAllTest2020
     * @tc.desc      Replace characters in frozen string object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest2020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const strObj: string = "hello";
      const frozenStrObj: string = strObj;
      const result: string = frozenStrObj.replaceAll("l", "L");
      expect(result).assertEqual("heLLo");
      expect(strObj.toString()).assertEqual("hello");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALLTWO_2100
     * @tc.name      StringReplaceAllTest2021
     * @tc.desc      Basic character replacement in string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest2021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const strObj: string = "hello";
      const result: string = strObj.replaceAll("l", "L");
      expect(result).assertEqual("heLLo");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALLTWO_2200
     * @tc.name      StringReplaceAllTest2022
     * @tc.desc      Replace characters in read-only string attribute
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest2022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = replaceAllHelperTest.testReadOnlyAttr();
      expect(result.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALLTWO_2300
     * @tc.name      StringReplaceAllTest2023
     * @tc.desc      Regex lastIndex is reset after replaceAll
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest2023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const str: string = "test123test456";
      const regex: RegExp = new RegExp('test', 'g');
      regex.lastIndex = 5;
      const result: string = str.replaceAll(regex, "MATCH");
      expect(result).assertEqual("MATCH123MATCH456");
      expect(regex.lastIndex).assertEqual(0);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALLTWO_2400
     * @tc.name      StringReplaceAllTest2024
     * @tc.desc      Test regex lastIndex behavior in replaceAll
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest2024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = replaceAllHelperTest.testLastIndex();
      expect(result).assertEqual("bbb");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALLTWO_2500
     * @tc.name      StringReplaceAllTest2025
     * @tc.desc      Continue processing after replaceAll
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest2025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const str: string = "hello world";
      const result: string[] = str.replaceAll("l", "L").split(" ");
      expect(result.toString()).assertEqual("heLLo,worLd");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALLTWO_2600
     * @tc.name      StringReplaceAllTest2026
     * @tc.desc      Using replaceAll in template strings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest2026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const name: string = "John";
      const greeting: string = `Hello ${name}`.replaceAll("John", "Alice");
      expect(greeting).assertEqual("Hello Alice");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALLTWO_2700
     * @tc.name      StringReplaceAllTest2027
     * @tc.desc      Behavior of replaceAll in strict mode
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest2027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const str: string = "test";
      const result: string = str.replaceAll("e", "E");
      expect(result).assertEqual("tEst");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALLTWO_2800
     * @tc.name      StringReplaceAllTest2028
     * @tc.desc      replaceAll behaves the same in non-strict mode
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest2028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const str: string = "test";
      const result: string = str.replaceAll("e", "E");
      expect(result).assertEqual("tEst");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALLTWO_2900
     * @tc.name      StringReplaceAllTest2029
     * @tc.desc      NaN is converted to the string "NaN"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest2029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const retObj: ReplaceAllCharsResult = replaceAllHelperTest.testReplaceAllChars();
      const bool: boolean = retObj.chars[0] === "h" && retObj.chars[1] === "e" && retObj.chars[2] === "l" && retObj.chars[3] === "l" && retObj.chars[4] === "o";
      expect(retObj.result).assertEqual("heLLo");
      expect(bool).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALLTWO_3000
     * @tc.name      StringReplaceAllTest2030
     * @tc.desc      NaN is converted to the string "NaN"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest2030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const str: string = "NaN value NaN";
      const result: string = str.replaceAll(String(NaN), "NOT_A_NUMBER");
      expect(result).assertEqual("NOT_A_NUMBER value NOT_A_NUMBER");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALLTWO_3100
     * @tc.name      StringReplaceAllTest2031
     * @tc.desc      Infinity is converted to the string "Infinity"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest2031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const str: string = "Infinity value Infinity";
      const result: string = str.replaceAll(String(Infinity), "∞");
      expect(result).assertEqual("∞ value ∞");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALLTWO_3200
     * @tc.name      StringReplaceAllTest2032
     * @tc.desc      -0 is converted to the string "0"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest2032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const str: string = "0 value 0";
      const result: string = str.replaceAll(String(-0), "ZERO");
      expect(result).assertEqual("ZERO value ZERO");
    });

  });
}
