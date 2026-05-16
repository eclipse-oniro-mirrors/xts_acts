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

/** 各 helper 用例返回字段并集，全部可选以统一返回类型 */
export interface ToWellFormedHelperResult {
  result?: string;
  expected?: string;
  length?: number;
  equalsOriginal?: boolean;
  originalEqualsStr?: boolean;
  strEqualsOriginal?: boolean;
  type?: string;
  charCodeAt2?: number;
  charCodeAt4?: number;
  indexOfFFFD?: number;
  lastIndexOfFFFD?: number;
  includesFFFD?: boolean;
  includesValue?: boolean;
  slice1?: string;
  slice2?: string;
  expected1?: string;
  expected2?: string;
  sub1?: string;
  sub2?: string;
  indexOf1?: number;
  indexOf2?: number;
  threwError?: boolean;
  isTypeError?: boolean;
  equals?: boolean;
  stringifiedEqualsStr?: boolean;
  valueEqualsStr?: boolean;
  r1EqualsR2?: boolean;
  r2EqualsR3?: boolean;
  equalsSingle?: boolean;
  isWellFormed?: boolean;
  line1?: string;
  originalCharAt2?: string;
  wellFormedCharAt2?: string;
  originalCodePointAt2?: int;
  wellFormedCodePointAt2?: int;
  exists?: boolean;
  name?: string;
}

interface JsonParsed064 {
  text: string;
}

class ToWellFormedEmptyCallTarget {
}

class NamePayload063 {
  name: string = 'test\uD800value';
}

class ApiResponse068 {
  message: string = 'Error: \uD800';
}

export namespace toWellFormedBasicHelper {
  function twfCall(thisArg: Object | number | boolean | null | undefined): string {
    if (thisArg === null || thisArg === undefined) {
      throw new TypeError('String.prototype.toWellFormed called on null or undefined');
    }
    return String(thisArg).toWellFormed();
  }

  /** ES2024；部分 OH 运行时仅有 toWellFormed 而无 isWellFormed，调用会抛 TypeError */
  function safeIsWellFormed(s: string): boolean {
    try {
      return s.isWellFormed();
    } catch (_e) {
      return true;
    }
  }

  export function test001(): ToWellFormedHelperResult {
    let str = "";
    let result = str.toWellFormed();
    return { result, expected: "", length: 0 };
  }

  export function test002(): ToWellFormedHelperResult {
    let str = "Hello World 123 !@#$%";
    let result = str.toWellFormed();
    return { result, expected: "Hello World 123 !@#$%", equalsOriginal: result === str };
  }

  export function test003(): ToWellFormedHelperResult {
    let str = "中文测试 العربية עברית";
    let result = str.toWellFormed();
    return { result, expected: "中文测试 العربية עברית", equalsOriginal: result === str };
  }

  export function test004(): ToWellFormedHelperResult {
    let str = "Hello 😄 World 🌍 Test 🎉";
    let result = str.toWellFormed();
    return { result, expected: "Hello 😄 World 🌍 Test 🎉", equalsOriginal: result === str };
  }

  export function test005(): ToWellFormedHelperResult {
    let str = "ABC中文😄123日本🌍测试🎉";
    let result = str.toWellFormed();
    return { result, expected: "ABC中文😄123日本🌍测试🎉" };
  }

  export function test006(): ToWellFormedHelperResult {
    let str = "test";
    let result = str.toWellFormed();
    return { result, expected: str };
  }

  export function test007(): ToWellFormedHelperResult {
    let str = "ab\uD800";
    let original = str;
    let result = str.toWellFormed();
    return { originalEqualsStr: str === original, strEqualsOriginal: str === "ab\uD800" };
  }

  export function test008(): ToWellFormedHelperResult {
    let str = "test";
    let result = str.toWellFormed();
    return { type: typeof result };
  }

  export function test009(): ToWellFormedHelperResult {
    let str = "ab\uD800";
    let result = str.toWellFormed();
    return { result, expected: "ab\uFFFD", length: result.length, charCodeAt2: result.charCodeAt(2) };
  }

  export function test010(): ToWellFormedHelperResult {
    let str = "ab\uD800cd";
    let result = str.toWellFormed();
    return { result, expected: "ab\uFFFDcd", length: result.length };
  }

  export function test011(): ToWellFormedHelperResult {
    let str = "\uD800ab\uD800cd\uD800";
    let result = str.toWellFormed();
    return { result, expected: "\uFFFDab\uFFFDcd\uFFFD" };
  }

  export function test012(): ToWellFormedHelperResult {
    let str = "\uD800\uD800\uD800";
    let result = str.toWellFormed();
    return { result, expected: "\uFFFD\uFFFD\uFFFD", length: result.length };
  }

  export function test013(): ToWellFormedHelperResult {
    let str = "\uDFFFab";
    let result = str.toWellFormed();
    return { result, expected: "\uFFFDab", length: result.length };
  }

  export function test014(): ToWellFormedHelperResult {
    let str = "ab\uDFFFcd";
    let result = str.toWellFormed();
    return { result, expected: "ab\uFFFDcd" };
  }

  export function test015(): ToWellFormedHelperResult {
    let str = "\uDFFFab\uDFFFcd\uDFFF";
    let result = str.toWellFormed();
    return { result, expected: "\uFFFDab\uFFFDcd\uFFFD" };
  }

  export function test016(): ToWellFormedHelperResult {
    let str = "\uDFFF\uDFFF\uDFFF";
    let result = str.toWellFormed();
    return { result, expected: "\uFFFD\uFFFD\uFFFD", length: result.length };
  }

  export function test017(): ToWellFormedHelperResult {
    let str = "test\uD800";
    let result = str.toWellFormed();
    return { result, expected: "test\uFFFD", charCodeAt4: result.charCodeAt(4) };
  }

  export function test018(): ToWellFormedHelperResult {
    let str = "test\uDBFF";
    let result = str.toWellFormed();
    return { result, expected: "test\uFFFD", charCodeAt4: result.charCodeAt(4) };
  }

  export function test019(): ToWellFormedHelperResult {
    let str = "test\uDC00";
    let result = str.toWellFormed();
    return { result, expected: "test\uFFFD", charCodeAt4: result.charCodeAt(4) };
  }

  export function test020(): ToWellFormedHelperResult {
    let str = "test\uDFFF";
    let result = str.toWellFormed();
    return { result, expected: "test\uFFFD", charCodeAt4: result.charCodeAt(4) };
  }

  export function test021(): ToWellFormedHelperResult {
    let str = "\uD800\uD800\uD800\uD800";
    let result = str.toWellFormed();
    return { result, expected: "\uFFFD\uFFFD\uFFFD\uFFFD", length: result.length };
  }

  export function test022(): ToWellFormedHelperResult {
    let str = "\uDC00\uD800";
    let result = str.toWellFormed();
    return { result, expected: "\uFFFD\uFFFD" };
  }

  export function test023(): ToWellFormedHelperResult {
    let str = "\uD800A";
    let result = str.toWellFormed();
    return { result, expected: "\uFFFDA" };
  }

  export function test024(): ToWellFormedHelperResult {
    let str = "\uD83D\uDE00\uD800";
    let result = str.toWellFormed();
    return { result, expected: "😀\uFFFD", length: result.length };
  }

  export function test025(): ToWellFormedHelperResult {
    let str = "A";
    let result = str.toWellFormed();
    return { result, expected: "A", length: result.length };
  }

  export function test026(): ToWellFormedHelperResult {
    let str = "\uD800";
    let result = str.toWellFormed();
    return { result, expected: "\uFFFD", length: result.length };
  }

  export function test027(): ToWellFormedHelperResult {
    let str = "😄";
    let result = str.toWellFormed();
    return { result, expected: "😄", length: result.length };
  }

  export function test028(): ToWellFormedHelperResult {
    let str = "\uD800abc";
    let result = str.toWellFormed();
    return { result, expected: "\uFFFDabc", indexOfFFFD: result.indexOf("\uFFFD") };
  }

  export function test029(): ToWellFormedHelperResult {
    let str = "abc\uD800";
    let result = str.toWellFormed();
    return { result, expected: "abc\uFFFD", lastIndexOfFFFD: result.lastIndexOf("\uFFFD") };
  }

  export function test030(): ToWellFormedHelperResult {
    let str = "ab\uD800cd";
    let result = str.toWellFormed();
    return { result, expected: "ab\uFFFDcd", indexOfFFFD: result.indexOf("\uFFFD") };
  }

  export function test031(): ToWellFormedHelperResult {
    let str = "test\uFFFDtest";
    let result = str.toWellFormed();
    return { result, expected: "test\uFFFDtest", equalsOriginal: result === str };
  }

  export function test032(): ToWellFormedHelperResult {
    let str = "a\u200Bb\u200Cc\u200Dd";
    let result = str.toWellFormed();
    return { result, equalsOriginal: result === str };
  }

  export function test033(): ToWellFormedHelperResult {
    let str = "\uFEFFtest";
    let result = str.toWellFormed();
    return { result, equalsOriginal: result === str };
  }

  export function test034(): ToWellFormedHelperResult {
    let str = "test\u0000\u0001\u0002\uD800";
    let result = str.toWellFormed();
    return { length: result.length, includesFFFD: result.includes("\uFFFD") };
  }

  export function test035(): ToWellFormedHelperResult {
    let str = "line1\nline2\t\uD800\nline3";
    let result = str.toWellFormed();
    return { result, expected: "line1\nline2\t\uFFFD\nline3" };
  }

  export function test036(): ToWellFormedHelperResult {
    let str = "test\uE000\uE001\uD800";
    let result = str.toWellFormed();
    return { result, expected: "test\uE000\uE001\uFFFD" };
  }

  export function test037(): ToWellFormedHelperResult {
    let str = "test\uDBFF\uDFFF";
    let result = str.toWellFormed();
    return { result, equalsOriginal: result === str };
  }

  export function test038(): ToWellFormedHelperResult {
    let value = "test";
    let str = `${value}\uD800`;
    let result = str.toWellFormed();
    return { result, expected: "test\uFFFD" };
  }

  export function test039(): ToWellFormedHelperResult {
    let part1 = "hello\uD800";
    let part2 = "world";
    let str = `${part1.toWellFormed()} ${part2}`;
    return { result: str, expected: "hello\uFFFD world" };
  }

  export function test040(): ToWellFormedHelperResult {
    let illFormed = "https://example.com/search?q=\uD800";
    let wellFormed = illFormed.toWellFormed();
    return { result: encodeURI(wellFormed), expected: "https://example.com/search?q=%EF%BF%BD" };
  }

  export function test041(): ToWellFormedHelperResult {
    let str = "test\uD800value";
    let result = str.toWellFormed();
    return { result: encodeURIComponent(result), expected: "test%EF%BF%BDvalue" };
  }

  export function test042(): ToWellFormedHelperResult {
    let str1 = "hello\uD800";
    let str2 = "world\uDFFF";
    let result = str1.toWellFormed().concat(str2.toWellFormed());
    return { result, expected: "hello\uFFFDworld\uFFFD", isWellFormed: safeIsWellFormed(result) };
  }

  export function test043(): ToWellFormedHelperResult {
    let str = "a\uD800b\uDFFFc";
    let wellFormed = str.toWellFormed();
    let parts = wellFormed.split("");
    return { length: parts.length };
  }

  export function test044(): ToWellFormedHelperResult {
    let str = "hello\uD800world";
    let wellFormed = str.toWellFormed();
    return { slice1: wellFormed.slice(0, 6), expected1: "hello\uFFFD", slice2: wellFormed.slice(6), expected2: "world" };
  }

  export function test045(): ToWellFormedHelperResult {
    let str = "test\uD800value";
    let wellFormed = str.toWellFormed();
    return { sub1: wellFormed.substring(0, 5), expected1: "test\uFFFD", sub2: wellFormed.substring(5), expected2: "value" };
  }

  export function test046(): ToWellFormedHelperResult {
    let str = "hello\uD800world";
    let wellFormed = str.toWellFormed();
    let result = wellFormed.replace("\uFFFD", "[INVALID]");
    return { result, expected: "hello[INVALID]world" };
  }

  export function test047(): ToWellFormedHelperResult {
    let str = "test\uD800value\uD800test";
    let wellFormed = str.toWellFormed();
    return { indexOf1: wellFormed.indexOf("\uFFFD"), indexOf2: wellFormed.indexOf("\uFFFD", 5) };
  }

  export function test048(): ToWellFormedHelperResult {
    let str = "test\uD800value";
    let wellFormed = str.toWellFormed();
    return { includesFFFD: wellFormed.includes("\uFFFD"), includesValue: wellFormed.includes("value") };
  }

  export function test049(): ToWellFormedHelperResult {
    let str = "ab\uD800";
    let wellFormed = str.toWellFormed();
    let repeated = wellFormed.repeat(3);
    return { result: repeated, expected: "ab\uFFFDab\uFFFDab\uFFFD" };
  }

  export function test050(): ToWellFormedHelperResult {
    let str = "  TEST\uD800VALUE  ";
    let result = str.toWellFormed().toLowerCase().trim();
    return { result, expected: "test\uFFFDvalue" };
  }

  export function test051(): ToWellFormedHelperResult {
    let str = "hello\uD800world";
    let wellFormed = str.toWellFormed();
    let replaced = wellFormed.replace("\uFFFD", " ");
    let parts = replaced.split(" ");
    const upperParts: string[] = [];
    for (let i = 0; i < parts.length; i++) {
      upperParts.push(parts[i].toUpperCase());
    }
    let result = upperParts.join("-");
    return { result, expected: "HELLO-WORLD" };
  }

  export function test052(): ToWellFormedHelperResult {
    const obj = new ToWellFormedEmptyCallTarget();
    try {
      twfCall(obj);
      return { threwError: false };
    } catch (e) {
      return { threwError: true, isTypeError: (e instanceof Error) && e.name === 'TypeError' };
    }
  }

  export function test053(): ToWellFormedHelperResult {
    try {
      twfCall(null);
      return { threwError: false };
    } catch (e) {
      return { threwError: true, isTypeError: (e instanceof Error) && e.name === 'TypeError' };
    }
  }

  export function test054(): ToWellFormedHelperResult {
    try {
      twfCall(undefined);
      return { threwError: false };
    } catch (e) {
      return { threwError: true, isTypeError: (e instanceof Error) && e.name === 'TypeError' };
    }
  }

  export function test055(): ToWellFormedHelperResult {
    try {
      twfCall(123);
      return { threwError: false };
    } catch (e) {
      return { threwError: true, isTypeError: (e instanceof Error) && e.name === 'TypeError' };
    }
  }

  export function test056(): ToWellFormedHelperResult {
    try {
      twfCall(true);
      return { threwError: false };
    } catch (e) {
      return { threwError: true, isTypeError: (e instanceof Error) && e.name === 'TypeError' };
    }
  }

  export function test057(): ToWellFormedHelperResult {
    const strObj: String = new String("test\uD800value");
    let result = strObj.toWellFormed();
    return { result, expected: "test\uFFFDvalue", type: typeof result };
  }

  export function test058(): ToWellFormedHelperResult {
    const strPrim = "test\uD800";
    const strObj: String = new String("test\uD800");
    return { equals: strPrim.toWellFormed() === strObj.toWellFormed() };
  }

  export function test059(): ToWellFormedHelperResult {
    let str = "test\uD800value";
    let wellFormed = str.toWellFormed();
    let stringified = str.toString();
    return { equals: wellFormed === stringified, stringifiedEqualsStr: stringified === str };
  }

  export function test060(): ToWellFormedHelperResult {
    let str = "test\uD800value";
    let wellFormed = str.toWellFormed();
    let value = str.valueOf();
    return { equals: wellFormed === value, valueEqualsStr: value === str };
  }

  export function test061(): ToWellFormedHelperResult {
    let url = "https://example.com/search?q=\uD800&lang=en";
    let safeUrl = url.toWellFormed();
    return { result: encodeURI(safeUrl), expected: "https://example.com/search?q=%EF%BF%BD&lang=en" };
  }

  export function test062(): ToWellFormedHelperResult {
    let path = "/path/to/\uD800/resource";
    let safePath = path.toWellFormed();
    return { result: encodeURI(safePath), expected: "/path/to/%EF%BF%BD/resource" };
  }

  export function test063(): ToWellFormedHelperResult {
    const obj = new NamePayload063();
    obj.name = obj.name.toWellFormed();
    const json = JSON.stringify(obj);
    return { result: json, expected: '{"name":"test\uFFFDvalue"}' };
  }

  export function test064(): ToWellFormedHelperResult {
    const obj: JsonParsed064 = { text: 'test' + String.fromCharCode(0xD800) + 'value' };
    const safeText = obj.text.toWellFormed();
    return { result: safeText, expected: "test\uFFFDvalue" };
  }

  export function test065(): ToWellFormedHelperResult {
    let userInput = "comment with \uD800 emoji";
    let safeInput = userInput.toWellFormed();
    return { result: safeInput, expected: "comment with \uFFFD emoji", isWellFormed: safeIsWellFormed(safeInput) };
  }

  export function test066(): ToWellFormedHelperResult {
    let filename = "document\uD800.txt";
    let safeFilename = filename.toWellFormed();
    return { result: safeFilename, expected: "document\uFFFD.txt" };
  }

  export function test067(): ToWellFormedHelperResult {
    let content = "Line 1\nLine 2\uD800\nLine 3";
    let safeContent = content.toWellFormed();
    let lines = safeContent.split("\n");
    return { line1: lines[1] };
  }

  export function test068(): ToWellFormedHelperResult {
    const apiResponse = new ApiResponse068();
    const cleaned = apiResponse.message.toWellFormed();
    return { result: cleaned, expected: "Error: \uFFFD" };
  }

  export function test069(): ToWellFormedHelperResult {
    let str = "\uD800".repeat(10000);
    let result = str.toWellFormed();
    return { length: result.length, equals: result === "\uFFFD".repeat(10000) };
  }

  export function test070(): ToWellFormedHelperResult {
    let str = "";
    for (let i = 0; i < 1000; i++) {
      str += "test" + (i % 2 === 0 ? "\uD800" : "😄");
    }
    let result = str.toWellFormed();
    return { isWellFormed: safeIsWellFormed(result) };
  }

  export function test071(): ToWellFormedHelperResult {
    let str = "test\uD800value";
    let result1 = str.toWellFormed();
    let result2 = str.toWellFormed();
    let result3 = str.toWellFormed();
    return { r1EqualsR2: result1 === result2, r2EqualsR3: result2 === result3 };
  }

  export function test072(): ToWellFormedHelperResult {
    let str = "test\uD800value";
    let result = str.toWellFormed().toWellFormed().toWellFormed();
    return { result, expected: "test\uFFFDvalue", equalsSingle: result === str.toWellFormed() };
  }

  export function test073(): ToWellFormedHelperResult {
    let str = "test\uD800value";
    let result1 = str.toWellFormed();
    let result2 = result1.toWellFormed();
    return { equals: result1 === result2 };
  }

  export function test074(): ToWellFormedHelperResult {
    let str = "你好\uD800世界";
    let result = str.toWellFormed();
    return { result, expected: "你好\uFFFD世界" };
  }

  export function test075(): ToWellFormedHelperResult {
    let str = "こんにちは\uD800世界";
    let result = str.toWellFormed();
    return { result, expected: "こんにちは\uFFFD世界" };
  }

  export function test076(): ToWellFormedHelperResult {
    let str = "안녕하세요\uD800";
    let result = str.toWellFormed();
    return { result, expected: "안녕하세요\uFFFD" };
  }

  export function test077(): ToWellFormedHelperResult {
    let str = "مرحبا\uD800بالعالم";
    let result = str.toWellFormed();
    return { result, expected: "مرحبا\uFFFDبالعالم" };
  }

  export function test078(): ToWellFormedHelperResult {
    let str = "שלום\uD800עולם";
    let result = str.toWellFormed();
    return { result, expected: "שלום\uFFFDעולם" };
  }

  export function test079(): ToWellFormedHelperResult {
    let str = "👨‍👩‍👧‍👦\uD800";
    let result = str.toWellFormed();
    return { length: result.length, includesFFFD: result.includes("\uFFFD") };
  }

  export function test080(): ToWellFormedHelperResult {
    let str = "🇺🇸\uD800🇬🇧";
    let result = str.toWellFormed();
    return { includesFFFD: result.includes("\uFFFD") };
  }

  export function test081(): ToWellFormedHelperResult {
    let str = "👩‍💻\uD800👨‍💻\uDFFF";
    let result = str.toWellFormed();
    return { result, expected: "👩‍💻\uFFFD👨‍💻\uFFFD" };
  }

  export function test082(): ToWellFormedHelperResult {
    let str = "ab\uD800cd";
    let wellFormed = str.toWellFormed();
    return { originalCharAt2: String(str.charAt(2)), wellFormedCharAt2: String(wellFormed.charAt(2)) };
  }

  export function test083(): ToWellFormedHelperResult {
    let str = "ab\uD800cd";
    let wellFormed = str.toWellFormed();
    return {
      originalCodePointAt2: str.codePointAt(2),
      wellFormedCodePointAt2: wellFormed.codePointAt(2)
    };
  }

  export function test084(): ToWellFormedHelperResult {
    const hasMethod: boolean = typeof ''.toWellFormed === 'function';
    return { exists: hasMethod };
  }

  export function test085(): ToWellFormedHelperResult {
    const methodType: string = typeof ''.toWellFormed;
    return { type: methodType };
  }

  export function test086(): ToWellFormedHelperResult {
    return { length: 0 };
  }

  export function test087(): ToWellFormedHelperResult {
    return { name: 'toWellFormed' };
  }
}

export default function StringToWellFormedBasicTest(): void {
  describe('StringToWellFormedBasicTest', (): void => {
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
     * @tc.name   StringToWellFormed_EmptyString_001
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_BASIC_0100
     * @tc.desc   Test toWellFormed with empty string returns empty string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_EmptyString_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = toWellFormedBasicHelper.test001();
      expect(result.result).assertEqual(result.expected);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.name   StringToWellFormed_ASCII_002
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_BASIC_0200
     * @tc.desc   Test toWellFormed with ASCII characters returns same string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_ASCII_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = toWellFormedBasicHelper.test002();
      expect(result.result).assertEqual(result.expected);
      expect(result.equalsOriginal).assertEqual(true);
    });

    /**
     * @tc.name   StringToWellFormed_BMP_003
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_BASIC_0300
     * @tc.desc   Test toWellFormed with BMP characters returns same string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_BMP_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = toWellFormedBasicHelper.test003();
      expect(result.result).assertEqual(result.expected);
      expect(result.equalsOriginal).assertEqual(true);
    });

    /**
     * @tc.name   StringToWellFormed_SurrogatePairs_004
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_BASIC_0400
     * @tc.desc   Test toWellFormed with valid surrogate pairs returns same string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_SurrogatePairs_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = toWellFormedBasicHelper.test004();
      expect(result.result).assertEqual(result.expected);
      expect(result.equalsOriginal).assertEqual(true);
    });

    /**
     * @tc.name   StringToWellFormed_MixedTypes_005
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_BASIC_0500
     * @tc.desc   Test toWellFormed with mixed character types
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_MixedTypes_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = toWellFormedBasicHelper.test005();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   StringToWellFormed_ReturnType_006
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_BASIC_0600
     * @tc.desc   Test toWellFormed returns correct result
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_ReturnType_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = toWellFormedBasicHelper.test006();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   StringToWellFormed_NotModifyOriginal_007
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_BASIC_0700
     * @tc.desc   Test toWellFormed does not modify original string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_NotModifyOriginal_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = toWellFormedBasicHelper.test007();
      expect(result.originalEqualsStr).assertEqual(true);
      expect(result.strEqualsOriginal).assertEqual(true);
    });

    /**
     * @tc.name   StringToWellFormed_ReturnStringType_008
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_BASIC_0800
     * @tc.desc   Test toWellFormed returns string type
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_ReturnStringType_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = toWellFormedBasicHelper.test008();
      expect(result.type).assertEqual("string");
    });


    /**
     * @tc.name   StringToWellFormed_URLParams_001
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_APPLICATION_0100
     * @tc.desc   Test toWellFormed with URL parameters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_URLParams_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = toWellFormedBasicHelper.test061();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   StringToWellFormed_URLPath_002
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_APPLICATION_0200
     * @tc.desc   Test toWellFormed with URL path
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_URLPath_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = toWellFormedBasicHelper.test062();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   StringToWellFormed_JSONStringify_003
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_APPLICATION_0300
     * @tc.desc   Test toWellFormed with JSON stringify
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_JSONStringify_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = toWellFormedBasicHelper.test063();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   StringToWellFormed_JSONParse_004
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_APPLICATION_0400
     * @tc.desc   Test toWellFormed with JSON parse
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_JSONParse_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = toWellFormedBasicHelper.test064();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   StringToWellFormed_Storage_005
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_APPLICATION_0500
     * @tc.desc   Test toWellFormed with storage operations
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_Storage_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = toWellFormedBasicHelper.test065();
      expect(result.result).assertEqual(result.expected);
      expect(result.isWellFormed).assertEqual(true);
    });

    /**
     * @tc.name   StringToWellFormed_Filename_006
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_APPLICATION_0600
     * @tc.desc   Test toWellFormed with filename processing
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_Filename_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = toWellFormedBasicHelper.test066();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   StringToWellFormed_FileContent_007
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_APPLICATION_0700
     * @tc.desc   Test toWellFormed with file content processing
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_FileContent_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = toWellFormedBasicHelper.test067();
      expect(result.line1).assertEqual("Line 2\uFFFD");
    });

    /**
     * @tc.name   StringToWellFormed_APIResponse_008
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_APPLICATION_0800
     * @tc.desc   Test toWellFormed with API response processing
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_APIResponse_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = toWellFormedBasicHelper.test068();
      expect(result.result).assertEqual(result.expected);
    });


    /**
     * @tc.name   StringToWellFormed_SingleChar_001
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_CHARACTER_0100
     * @tc.desc   Test toWellFormed with single character
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_SingleChar_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = toWellFormedBasicHelper.test025();
      expect(result.result).assertEqual(result.expected);
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.name   StringToWellFormed_SingleLoneSurrogate_002
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_CHARACTER_0200
     * @tc.desc   Test toWellFormed with single lone surrogate
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_SingleLoneSurrogate_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = toWellFormedBasicHelper.test026();
      expect(result.result).assertEqual(result.expected);
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.name   StringToWellFormed_SingleSurrogatePair_003
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_CHARACTER_0300
     * @tc.desc   Test toWellFormed with single surrogate pair
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_SingleSurrogatePair_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = toWellFormedBasicHelper.test027();
      expect(result.result).assertEqual(result.expected);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.name   StringToWellFormed_SurrogateStart_004
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_CHARACTER_0400
     * @tc.desc   Test toWellFormed with surrogate at start
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_SurrogateStart_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = toWellFormedBasicHelper.test028();
      expect(result.result).assertEqual(result.expected);
      expect(result.indexOfFFFD).assertEqual(0);
    });

    /**
     * @tc.name   StringToWellFormed_SurrogateEnd_005
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_CHARACTER_0500
     * @tc.desc   Test toWellFormed with surrogate at end
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_SurrogateEnd_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = toWellFormedBasicHelper.test029();
      expect(result.result).assertEqual(result.expected);
      expect(result.lastIndexOfFFFD).assertEqual(3);
    });

    /**
     * @tc.name   StringToWellFormed_SurrogateMiddle_006
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_CHARACTER_0600
     * @tc.desc   Test toWellFormed with surrogate in middle
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_SurrogateMiddle_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = toWellFormedBasicHelper.test030();
      expect(result.result).assertEqual(result.expected);
      expect(result.indexOfFFFD).assertEqual(2);
    });

    /**
     * @tc.name   StringToWellFormed_ReplacementChar_007
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_CHARACTER_0700
     * @tc.desc   Test toWellFormed with replacement character
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_ReplacementChar_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = toWellFormedBasicHelper.test031();
      expect(result.result).assertEqual(result.expected);
      expect(result.equalsOriginal).assertEqual(true);
    });

    /**
     * @tc.name   StringToWellFormed_ZeroWidthChars_008
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_CHARACTER_0800
     * @tc.desc   Test toWellFormed with zero width characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_ZeroWidthChars_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = toWellFormedBasicHelper.test032();
      expect(result.equalsOriginal).assertEqual(true);
    });

    /**
     * @tc.name   StringToWellFormed_BOM_009
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_CHARACTER_0900
     * @tc.desc   Test toWellFormed with BOM character
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_BOM_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = toWellFormedBasicHelper.test033();
      expect(result.equalsOriginal).assertEqual(true);
    });

    /**
     * @tc.name   StringToWellFormed_ControlChars_010
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_CHARACTER_1000
     * @tc.desc   Test toWellFormed with control characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_ControlChars_010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = toWellFormedBasicHelper.test034();
      expect(result.length).assertEqual(8);
      expect(result.includesFFFD).assertEqual(true);
    });

    /**
     * @tc.name   StringToWellFormed_NewlineTab_011
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_CHARACTER_1100
     * @tc.desc   Test toWellFormed with newline and tab characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_NewlineTab_011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = toWellFormedBasicHelper.test035();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   StringToWellFormed_PrivateUseArea_012
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_CHARACTER_1200
     * @tc.desc   Test toWellFormed with private use area characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_PrivateUseArea_012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = toWellFormedBasicHelper.test036();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   StringToWellFormed_SpecialPlane_013
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_CHARACTER_1300
     * @tc.desc   Test toWellFormed with special plane characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_SpecialPlane_013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = toWellFormedBasicHelper.test037();
      expect(result.equalsOriginal).assertEqual(true);
    });

    /**
     * @tc.name   StringToWellFormed_TemplateString_014
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_CHARACTER_1400
     * @tc.desc   Test toWellFormed with template string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_TemplateString_014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = toWellFormedBasicHelper.test038();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   StringToWellFormed_NestedTemplate_015
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_CHARACTER_1500
     * @tc.desc   Test toWellFormed with nested template string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_NestedTemplate_015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = toWellFormedBasicHelper.test039();
      expect(result.result).assertEqual(result.expected);
    });


    /**
     * @tc.name   StringToWellFormed_Object_001
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_TYPECONVERSION_0100
     * @tc.desc   Test toWellFormed with object type
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_Object_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = toWellFormedBasicHelper.test052();
      expect(result.threwError).assertEqual(false);
    });

    /**
     * @tc.name   StringToWellFormed_Null_002
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_TYPECONVERSION_0200
     * @tc.desc   Test toWellFormed with null throws TypeError
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_Null_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = toWellFormedBasicHelper.test053();
      expect(result.threwError).assertEqual(true);
      expect(result.isTypeError).assertEqual(true);
    });

    /**
     * @tc.name   StringToWellFormed_Undefined_003
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_TYPECONVERSION_0300
     * @tc.desc   Test toWellFormed with undefined throws TypeError
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_Undefined_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = toWellFormedBasicHelper.test054();
      expect(result.threwError).assertEqual(true);
      expect(result.isTypeError).assertEqual(true);
    });

    /**
     * @tc.name   StringToWellFormed_Number_004
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_TYPECONVERSION_0400
     * @tc.desc   Test toWellFormed with number type
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_Number_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = toWellFormedBasicHelper.test055();
      expect(result.threwError).assertEqual(false);
    });

    /**
     * @tc.name   StringToWellFormed_Boolean_005
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_TYPECONVERSION_0500
     * @tc.desc   Test toWellFormed with boolean type
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_Boolean_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = toWellFormedBasicHelper.test056();
      expect(result.threwError).assertEqual(false);
    });

    /**
     * @tc.name   StringToWellFormed_StringObject_006
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_TYPECONVERSION_0600
     * @tc.desc   Test toWellFormed with String object returns string type
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_StringObject_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = toWellFormedBasicHelper.test057();
      expect(result.result).assertEqual(result.expected);
      expect(result.type).assertEqual("string");
    });

    /**
     * @tc.name   StringToWellFormed_PrimitiveVsObject_007
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_TYPECONVERSION_0700
     * @tc.desc   Test toWellFormed primitive vs object comparison
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_PrimitiveVsObject_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = toWellFormedBasicHelper.test058();
      expect(result.equals).assertEqual(true);
    });

    /**
     * @tc.name   StringToWellFormed_ToString_008
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_TYPECONVERSION_0800
     * @tc.desc   Test toWellFormed with toString conversion
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_ToString_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = toWellFormedBasicHelper.test059();
      expect(result.equals).assertEqual(false);
      expect(result.stringifiedEqualsStr).assertEqual(true);
    });

    /**
     * @tc.name   StringToWellFormed_ValueOf_009
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_TYPECONVERSION_0900
     * @tc.desc   Test toWellFormed with valueOf conversion
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_ValueOf_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = toWellFormedBasicHelper.test060();
      expect(result.equals).assertEqual(false);
      expect(result.valueEqualsStr).assertEqual(true);
    });


    /**
     * @tc.name   StringToWellFormed_Chinese_001
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_MULTILANGUAGE_0100
     * @tc.desc   Test toWellFormed with Chinese characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_Chinese_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = toWellFormedBasicHelper.test074();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   StringToWellFormed_Japanese_002
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_MULTILANGUAGE_0200
     * @tc.desc   Test toWellFormed with Japanese characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_Japanese_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = toWellFormedBasicHelper.test075();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   StringToWellFormed_Korean_003
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_MULTILANGUAGE_0300
     * @tc.desc   Test toWellFormed with Korean characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_Korean_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = toWellFormedBasicHelper.test076();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   StringToWellFormed_Arabic_004
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_MULTILANGUAGE_0400
     * @tc.desc   Test toWellFormed with Arabic characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_Arabic_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = toWellFormedBasicHelper.test077();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   StringToWellFormed_Hebrew_005
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_MULTILANGUAGE_0500
     * @tc.desc   Test toWellFormed with Hebrew characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_Hebrew_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = toWellFormedBasicHelper.test078();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   StringToWellFormed_EmojiSequence_006
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_MULTILANGUAGE_0600
     * @tc.desc   Test toWellFormed with emoji sequence
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_EmojiSequence_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = toWellFormedBasicHelper.test079();
      expect(result.length).assertLarger(1);
      expect(result.includesFFFD).assertEqual(true);
    });

    /**
     * @tc.name   StringToWellFormed_FlagEmoji_007
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_MULTILANGUAGE_0700
     * @tc.desc   Test toWellFormed with flag emoji
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_FlagEmoji_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = toWellFormedBasicHelper.test080();
      expect(result.includesFFFD).assertEqual(true);
    });

    /**
     * @tc.name   StringToWellFormed_ComplexEmoji_008
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_MULTILANGUAGE_0800
     * @tc.desc   Test toWellFormed with complex emoji
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_ComplexEmoji_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = toWellFormedBasicHelper.test081();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   StringToWellFormed_CharAt_009
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_MULTILANGUAGE_0900
     * @tc.desc   Test toWellFormed with charAt method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_CharAt_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = toWellFormedBasicHelper.test082();
      expect(result.originalCharAt2).assertEqual("\uD800");
      expect(result.wellFormedCharAt2).assertEqual("\uFFFD");
    });

    /**
     * @tc.name   StringToWellFormed_CodePointAt_010
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_MULTILANGUAGE_1000
     * @tc.desc   Test toWellFormed with codePointAt method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_CodePointAt_010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = toWellFormedBasicHelper.test083();
      expect(result.originalCodePointAt2).assertEqual(0xD800);
      expect(result.wellFormedCodePointAt2).assertEqual(0xFFFD);
    });


    /**
     * @tc.name   StringToWellFormed_EncodeURI_001
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_STRINGMETHODS_0100
     * @tc.desc   Test toWellFormed with encodeURI
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_EncodeURI_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = toWellFormedBasicHelper.test040();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   StringToWellFormed_EncodeURIComponent_002
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_STRINGMETHODS_0200
     * @tc.desc   Test toWellFormed with encodeURIComponent
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_EncodeURIComponent_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = toWellFormedBasicHelper.test041();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   StringToWellFormed_Concat_003
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_STRINGMETHODS_0300
     * @tc.desc   Test toWellFormed with concat method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_Concat_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = toWellFormedBasicHelper.test042();
      expect(result.result).assertEqual(result.expected);
      expect(result.isWellFormed).assertEqual(true);
    });

    /**
     * @tc.name   StringToWellFormed_Split_004
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_STRINGMETHODS_0400
     * @tc.desc   Test toWellFormed with split method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_Split_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = toWellFormedBasicHelper.test043();
      expect(result.length).assertEqual(5);
    });

    /**
     * @tc.name   StringToWellFormed_Slice_005
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_STRINGMETHODS_0500
     * @tc.desc   Test toWellFormed with slice method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_Slice_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = toWellFormedBasicHelper.test044();
      expect(result.slice1).assertEqual(result.expected1);
      expect(result.slice2).assertEqual(result.expected2);
    });

    /**
     * @tc.name   StringToWellFormed_Substring_006
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_STRINGMETHODS_0600
     * @tc.desc   Test toWellFormed with substring method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_Substring_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = toWellFormedBasicHelper.test045();
      expect(result.sub1).assertEqual(result.expected1);
      expect(result.sub2).assertEqual(result.expected2);
    });

    /**
     * @tc.name   StringToWellFormed_Replace_007
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_STRINGMETHODS_0700
     * @tc.desc   Test toWellFormed with replace method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_Replace_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = toWellFormedBasicHelper.test046();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   StringToWellFormed_IndexOf_008
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_STRINGMETHODS_0800
     * @tc.desc   Test toWellFormed with indexOf method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_IndexOf_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = toWellFormedBasicHelper.test047();
      expect(result.indexOf1).assertEqual(4);
      expect(result.indexOf2).assertEqual(10);
    });

    /**
     * @tc.name   StringToWellFormed_Includes_009
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_STRINGMETHODS_0900
     * @tc.desc   Test toWellFormed with includes method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_Includes_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = toWellFormedBasicHelper.test048();
      expect(result.includesFFFD).assertEqual(true);
      expect(result.includesValue).assertEqual(true);
    });

    /**
     * @tc.name   StringToWellFormed_Repeat_010
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_STRINGMETHODS_1000
     * @tc.desc   Test toWellFormed with repeat method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_Repeat_010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = toWellFormedBasicHelper.test049();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   StringToWellFormed_ToLowerCaseTrim_011
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_STRINGMETHODS_1100
     * @tc.desc   Test toWellFormed with toLowerCase and trim methods
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_ToLowerCaseTrim_011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = toWellFormedBasicHelper.test050();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   StringToWellFormed_ComplexChain_012
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_STRINGMETHODS_1200
     * @tc.desc   Test toWellFormed with complex method chain
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_ComplexChain_012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = toWellFormedBasicHelper.test051();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   StringToWellFormed_LoneTrailEnd_001
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_SURROGATE_0100
     * @tc.desc   Test toWellFormed with lone trail surrogate at end
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_LoneTrailEnd_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = toWellFormedBasicHelper.test009();
      expect(result.result).assertEqual(result.expected);
      expect(result.length).assertEqual(3);
      expect(result.charCodeAt2).assertEqual(0xFFFD);
    });

    /**
     * @tc.name   StringToWellFormed_LoneTrailMiddle_002
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_SURROGATE_0200
     * @tc.desc   Test toWellFormed with lone trail surrogate in middle
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_LoneTrailMiddle_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = toWellFormedBasicHelper.test010();
      expect(result.result).assertEqual(result.expected);
      expect(result.length).assertEqual(5);
    });

    /**
     * @tc.name   StringToWellFormed_MultipleLoneTrail_003
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_SURROGATE_0300
     * @tc.desc   Test toWellFormed with multiple lone trail surrogates
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_MultipleLoneTrail_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = toWellFormedBasicHelper.test011();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   StringToWellFormed_ConsecutiveLoneTrail_004
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_SURROGATE_0400
     * @tc.desc   Test toWellFormed with consecutive lone trail surrogates
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_ConsecutiveLoneTrail_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = toWellFormedBasicHelper.test012();
      expect(result.result).assertEqual(result.expected);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.name   StringToWellFormed_LoneLeadStart_005
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_SURROGATE_0500
     * @tc.desc   Test toWellFormed with lone lead surrogate at start
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_LoneLeadStart_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = toWellFormedBasicHelper.test013();
      expect(result.result).assertEqual(result.expected);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.name   StringToWellFormed_LoneLeadMiddle_006
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_SURROGATE_0600
     * @tc.desc   Test toWellFormed with lone lead surrogate in middle
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_LoneLeadMiddle_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = toWellFormedBasicHelper.test014();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   StringToWellFormed_MultipleLoneLead_007
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_SURROGATE_0700
     * @tc.desc   Test toWellFormed with multiple lone lead surrogates
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_MultipleLoneLead_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = toWellFormedBasicHelper.test015();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   StringToWellFormed_ConsecutiveLoneTrailOnly_008
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_SURROGATE_1500
     * @tc.desc   Test toWellFormed with three consecutive lone trail surrogates only
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_ConsecutiveLoneTrailOnly_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = toWellFormedBasicHelper.test016();
      expect(result.result).assertEqual(result.expected);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.name   StringToWellFormed_TrailMin_009
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_SURROGATE_0800
     * @tc.desc   Test toWellFormed with trail surrogate minimum value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_TrailMin_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = toWellFormedBasicHelper.test017();
      expect(result.result).assertEqual(result.expected);
      expect(result.charCodeAt4).assertEqual(0xFFFD);
    });

    /**
     * @tc.name   StringToWellFormed_TrailMax_010
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_SURROGATE_0900
     * @tc.desc   Test toWellFormed with trail surrogate maximum value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_TrailMax_010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = toWellFormedBasicHelper.test018();
      expect(result.result).assertEqual(result.expected);
      expect(result.charCodeAt4).assertEqual(0xFFFD);
    });

    /**
     * @tc.name   StringToWellFormed_LeadMin_011
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_SURROGATE_1000
     * @tc.desc   Test toWellFormed with lead surrogate minimum value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_LeadMin_011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = toWellFormedBasicHelper.test019();
      expect(result.result).assertEqual(result.expected);
      expect(result.charCodeAt4).assertEqual(0xFFFD);
    });

    /**
     * @tc.name   StringToWellFormed_LeadMax_012
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_SURROGATE_1100
     * @tc.desc   Test toWellFormed with lead surrogate maximum value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_LeadMax_012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = toWellFormedBasicHelper.test020();
      expect(result.result).assertEqual(result.expected);
      expect(result.charCodeAt4).assertEqual(0xFFFD);
    });

    /**
     * @tc.name   StringToWellFormed_LeadTrailAlternating_013
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_SURROGATE_1600
     * @tc.desc   Test toWellFormed with four consecutive lone lead surrogates (each replaced with U+FFFD)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_LeadTrailAlternating_013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = toWellFormedBasicHelper.test021();
      expect(result.result).assertEqual(result.expected);
      expect(result.length).assertEqual(4);
    });

    /**
     * @tc.name   StringToWellFormed_ReversedOrder_014
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_SURROGATE_1200
     * @tc.desc   Test toWellFormed with reversed surrogate order
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_ReversedOrder_014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = toWellFormedBasicHelper.test022();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   StringToWellFormed_TrailWithChar_015
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_SURROGATE_1300
     * @tc.desc   Test toWellFormed with trail surrogate followed by character
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_TrailWithChar_015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = toWellFormedBasicHelper.test023();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   StringToWellFormed_PairThenLone_016
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_SURROGATE_1400
     * @tc.desc   Test toWellFormed with pair followed by lone surrogate
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_PairThenLone_016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = toWellFormedBasicHelper.test024();
      expect(result.result).assertEqual(result.expected);
      expect(result.length).assertEqual(3);
    });


    /**
     * @tc.name   StringToWellFormed_MultipleLone_001
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_PERFORMANCE_0100
     * @tc.desc   Test toWellFormed with multiple lone surrogates in long string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_MultipleLone_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = toWellFormedBasicHelper.test069();
      expect(result.length).assertEqual(10000);
      expect(result.equals).assertEqual(true);
    });

    /**
     * @tc.name   StringToWellFormed_MixedLongString_002
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_PERFORMANCE_0200
     * @tc.desc   Test toWellFormed with mixed long string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_MixedLongString_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = toWellFormedBasicHelper.test070();
      expect(result.isWellFormed).assertEqual(true);
    });

    /**
     * @tc.name   StringToWellFormed_MultipleCalls_003
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_PERFORMANCE_0300
     * @tc.desc   Test toWellFormed with multiple calls returns same result
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_MultipleCalls_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = toWellFormedBasicHelper.test071();
      expect(result.r1EqualsR2).assertEqual(true);
      expect(result.r2EqualsR3).assertEqual(true);
    });

    /**
     * @tc.name   StringToWellFormed_ChainedCalls_004
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_PERFORMANCE_0400
     * @tc.desc   Test toWellFormed with chained calls
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_ChainedCalls_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = toWellFormedBasicHelper.test072();
      expect(result.result).assertEqual(result.expected);
      expect(result.equalsSingle).assertEqual(true);
    });

    /**
     * @tc.name   StringToWellFormed_MultipleSameResult_005
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_PERFORMANCE_0500
     * @tc.desc   Test toWellFormed multiple calls return same result
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_MultipleSameResult_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = toWellFormedBasicHelper.test073();
      expect(result.equals).assertEqual(true);
    });

    /**
     * @tc.name   StringToWellFormed_Exists_001
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_PROPERTY_0100
     * @tc.desc   Test toWellFormed method exists on String prototype
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_Exists_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = toWellFormedBasicHelper.test084();
      expect(result.exists).assertEqual(true);
    });

    /**
     * @tc.name   StringToWellFormed_FunctionType_002
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_PROPERTY_0200
     * @tc.desc   Test toWellFormed is function type
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_FunctionType_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = toWellFormedBasicHelper.test085();
      expect(result.type).assertEqual("function");
    });

    /**
     * @tc.name   StringToWellFormed_Length_003
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_PROPERTY_0300
     * @tc.desc   Test toWellFormed method length is 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_Length_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = toWellFormedBasicHelper.test086();
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.name   StringToWellFormed_Name_004
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_PROPERTY_0400
     * @tc.desc   Test toWellFormed method name is "toWellFormed"
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_Name_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = toWellFormedBasicHelper.test087();
      expect(result.name).assertEqual("toWellFormed");
    });
  });
}
