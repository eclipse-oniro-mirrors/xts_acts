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

export function test001() {
  let str = "";
  let result = str.toWellFormed();
  return { result, expected: "", length: 0 };
}

export function test002() {
  let str = "Hello World 123 !@#$%";
  let result = str.toWellFormed();
  return { result, expected: "Hello World 123 !@#$%", equalsOriginal: result === str };
}

export function test003() {
  let str = "中文测试 العربية עברית";
  let result = str.toWellFormed();
  return { result, expected: "中文测试 العربية עברית", equalsOriginal: result === str };
}

export function test004() {
  let str = "Hello 😄 World 🌍 Test 🎉";
  let result = str.toWellFormed();
  return { result, expected: "Hello 😄 World 🌍 Test 🎉", equalsOriginal: result === str };
}

export function test005() {
  let str = "ABC中文😄123日本🌍测试🎉";
  let result = str.toWellFormed();
  return { result, expected: "ABC中文😄123日本🌍测试🎉" };
}

export function test006() {
  let str = "test";
  let result = str.toWellFormed();
  return { result, expected: str };
}

export function test007() {
  let str = "ab\uD800";
  let original = str;
  let result = str.toWellFormed();
  return { originalEqualsStr: str === original, strEqualsOriginal: str === "ab\uD800" };
}

export function test008() {
  let str = "test";
  let result = str.toWellFormed();
  return { type: typeof result };
}

export function test009() {
  let str = "ab\uD800";
  let result = str.toWellFormed();
  return { result, expected: "ab\uFFFD", length: result.length, charCodeAt2: result.charCodeAt(2) };
}

export function test010() {
  let str = "ab\uD800cd";
  let result = str.toWellFormed();
  return { result, expected: "ab\uFFFDcd", length: result.length };
}

export function test011() {
  let str = "\uD800ab\uD800cd\uD800";
  let result = str.toWellFormed();
  return { result, expected: "\uFFFDab\uFFFDcd\uFFFD" };
}

export function test012() {
  let str = "\uD800\uD800\uD800";
  let result = str.toWellFormed();
  return { result, expected: "\uFFFD\uFFFD\uFFFD", length: result.length };
}

export function test013() {
  let str = "\uDFFFab";
  let result = str.toWellFormed();
  return { result, expected: "\uFFFDab", length: result.length };
}

export function test014() {
  let str = "ab\uDFFFcd";
  let result = str.toWellFormed();
  return { result, expected: "ab\uFFFDcd" };
}

export function test015() {
  let str = "\uDFFFab\uDFFFcd\uDFFF";
  let result = str.toWellFormed();
  return { result, expected: "\uFFFDab\uFFFDcd\uFFFD" };
}

export function test016() {
  let str = "\uDFFF\uDFFF\uDFFF";
  let result = str.toWellFormed();
  return { result, expected: "\uFFFD\uFFFD\uFFFD", length: result.length };
}

export function test017() {
  let str = "test\uD800";
  let result = str.toWellFormed();
  return { result, expected: "test\uFFFD", charCodeAt4: result.charCodeAt(4) };
}

export function test018() {
  let str = "test\uDBFF";
  let result = str.toWellFormed();
  return { result, expected: "test\uFFFD", charCodeAt4: result.charCodeAt(4) };
}

export function test019() {
  let str = "test\uDC00";
  let result = str.toWellFormed();
  return { result, expected: "test\uFFFD", charCodeAt4: result.charCodeAt(4) };
}

export function test020() {
  let str = "test\uDFFF";
  let result = str.toWellFormed();
  return { result, expected: "test\uFFFD", charCodeAt4: result.charCodeAt(4) };
}

export function test021() {
  let str = "\uD800\uDFFF\uD800\uDFFF";
  let result = str.toWellFormed();
  return { result, expected: "\uFFFD\uFFFD\uFFFD\uFFFD", length: result.length };
}

export function test022() {
  let str = "\uDC00\uD800";
  let result = str.toWellFormed();
  return { result, expected: "\uFFFD\uFFFD" };
}

export function test023() {
  let str = "\uD800A";
  let result = str.toWellFormed();
  return { result, expected: "\uFFFDA" };
}

export function test024() {
  let str = "\uD83D\uDE00\uD800";
  let result = str.toWellFormed();
  return { result, expected: "😀\uFFFD", length: result.length };
}

export function test025() {
  let str = "A";
  let result = str.toWellFormed();
  return { result, expected: "A", length: result.length };
}

export function test026() {
  let str = "\uD800";
  let result = str.toWellFormed();
  return { result, expected: "\uFFFD", length: result.length };
}

export function test027() {
  let str = "😄";
  let result = str.toWellFormed();
  return { result, expected: "😄", length: result.length };
}

export function test028() {
  let str = "\uD800abc";
  let result = str.toWellFormed();
  return { result, expected: "\uFFFDabc", indexOfFFFD: result.indexOf("\uFFFD") };
}

export function test029() {
  let str = "abc\uD800";
  let result = str.toWellFormed();
  return { result, expected: "abc\uFFFD", lastIndexOfFFFD: result.lastIndexOf("\uFFFD") };
}

export function test030() {
  let str = "ab\uD800cd";
  let result = str.toWellFormed();
  return { result, expected: "ab\uFFFDcd", indexOfFFFD: result.indexOf("\uFFFD") };
}

export function test031() {
  let str = "test\uFFFDtest";
  let result = str.toWellFormed();
  return { result, expected: "test\uFFFDtest", equalsOriginal: result === str };
}

export function test032() {
  let str = "a\u200Bb\u200Cc\u200Dd";
  let result = str.toWellFormed();
  return { result, equalsOriginal: result === str };
}

export function test033() {
  let str = "\uFEFFtest";
  let result = str.toWellFormed();
  return { result, equalsOriginal: result === str };
}

export function test034() {
  let str = "test\u0000\u0001\u0002\uD800";
  let result = str.toWellFormed();
  return { length: result.length, includesFFFD: result.includes("\uFFFD") };
}

export function test035() {
  let str = "line1\nline2\t\uD800\nline3";
  let result = str.toWellFormed();
  return { result, expected: "line1\nline2\t\uFFFD\nline3" };
}

export function test036() {
  let str = "test\uE000\uE001\uD800";
  let result = str.toWellFormed();
  return { result, expected: "test\uE000\uE001\uFFFD" };
}

export function test037() {
  let str = "test\uDBFF\uDFFF";
  let result = str.toWellFormed();
  return { result, equalsOriginal: result === str };
}

export function test038() {
  let value = "test";
  let str = `${value}\uD800`;
  let result = str.toWellFormed();
  return { result, expected: "test\uFFFD" };
}

export function test039() {
  let part1 = "hello\uD800";
  let part2 = "world";
  let str = `${part1.toWellFormed()} ${part2}`;
  return { result: str, expected: "hello\uFFFD world" };
}

export function test040() {
  let illFormed = "https://example.com/search?q=\uD800";
  let wellFormed = illFormed.toWellFormed();
  return { result: encodeURI(wellFormed), expected: "https://example.com/search?q=%EF%BF%BD" };
}

export function test041() {
  let str = "test\uD800value";
  let result = str.toWellFormed();
  return { result: encodeURIComponent(result), expected: "test%EF%BF%BDvalue" };
}

export function test042() {
  let str1 = "hello\uD800";
  let str2 = "world\uDFFF";
  let result = str1.toWellFormed().concat(str2.toWellFormed());
  return { result, expected: "hello\uFFFDworld\uFFFD", isWellFormed: result.isWellFormed() };
}

export function test043() {
  let str = "a\uD800b\uDFFFc";
  let wellFormed = str.toWellFormed();
  let parts = wellFormed.split("");
  return { length: parts.length };
}

export function test044() {
  let str = "hello\uD800world";
  let wellFormed = str.toWellFormed();
  return { slice1: wellFormed.slice(0, 6), expected1: "hello\uFFFD", slice2: wellFormed.slice(6), expected2: "world" };
}

export function test045() {
  let str = "test\uD800value";
  let wellFormed = str.toWellFormed();
  return { sub1: wellFormed.substring(0, 5), expected1: "test\uFFFD", sub2: wellFormed.substring(5), expected2: "value" };
}

export function test046() {
  let str = "hello\uD800world";
  let wellFormed = str.toWellFormed();
  let result = wellFormed.replace("\uFFFD", "[INVALID]");
  return { result, expected: "hello[INVALID]world" };
}

export function test047() {
  let str = "test\uD800value\uD800test";
  let wellFormed = str.toWellFormed();
  return { indexOf1: wellFormed.indexOf("\uFFFD"), indexOf2: wellFormed.indexOf("\uFFFD", 5) };
}

export function test048() {
  let str = "test\uD800value";
  let wellFormed = str.toWellFormed();
  return { includesFFFD: wellFormed.includes("\uFFFD"), includesValue: wellFormed.includes("value") };
}

export function test049() {
  let str = "ab\uD800";
  let wellFormed = str.toWellFormed();
  let repeated = wellFormed.repeat(3);
  return { result: repeated, expected: "ab\uFFFDab\uFFFDab\uFFFD" };
}

export function test050() {
  let str = "  TEST\uD800VALUE  ";
  let result = str.toWellFormed().toLowerCase().trim();
  return { result, expected: "test\uFFFDvalue" };
}

export function test051() {
  let str = "hello\uD800world";
  let wellFormed = str.toWellFormed();
  let replaced = wellFormed.replace("\uFFFD", " ");
  let parts = replaced.split(" ");
  let upperParts = [];
  for (let i = 0; i < parts.length; i++) {
    upperParts.push(parts[i].toUpperCase());
  }
  let result = upperParts.join("-");
  return { result, expected: "HELLO-WORLD" };
}

export function test052() {
  let obj = {};
  try {
    String.prototype.toWellFormed.call(obj);
    return { threwError: false };
  } catch (e) {
    return { threwError: true, isTypeError: e instanceof TypeError };
  }
}

export function test053() {
  try {
    String.prototype.toWellFormed.call(null);
    return { threwError: false };
  } catch (e) {
    return { threwError: true, isTypeError: e instanceof TypeError };
  }
}

export function test054() {
  try {
    String.prototype.toWellFormed.call(undefined);
    return { threwError: false };
  } catch (e) {
    return { threwError: true, isTypeError: e instanceof TypeError };
  }
}

export function test055() {
  try {
    String.prototype.toWellFormed.call(123);
    return { threwError: false };
  } catch (e) {
    return { threwError: true, isTypeError: e instanceof TypeError };
  }
}

export function test056() {
  try {
    String.prototype.toWellFormed.call(true);
    return { threwError: false };
  } catch (e) {
    return { threwError: true, isTypeError: e instanceof TypeError };
  }
}

export function test057() {
  let strObj = new String("test\uD800value");
  let result = strObj.toWellFormed();
  return { result, expected: "test\uFFFDvalue", type: typeof result };
}

export function test058() {
  let strPrim = "test\uD800";
  let strObj = new String("test\uD800");
  return { equals: strPrim.toWellFormed() === strObj.toWellFormed() };
}

export function test059() {
  let str = "test\uD800value";
  let wellFormed = str.toWellFormed();
  let stringified = str.toString();
  return { equals: wellFormed === stringified, stringifiedEqualsStr: stringified === str };
}

export function test060() {
  let str = "test\uD800value";
  let wellFormed = str.toWellFormed();
  let value = str.valueOf();
  return { equals: wellFormed === value, valueEqualsStr: value === str };
}

export function test061() {
  let url = "https://example.com/search?q=\uD800&lang=en";
  let safeUrl = url.toWellFormed();
  return { result: encodeURI(safeUrl), expected: "https://example.com/search?q=%EF%BF%BD&lang=en" };
}

export function test062() {
  let path = "/path/to/\uD800/resource";
  let safePath = path.toWellFormed();
  return { result: encodeURI(safePath), expected: "/path/to/%EF%BF%BD/resource" };
}

export function test063() {
  let obj = { name: "test\uD800value" };
  obj.name = obj.name.toWellFormed();
  let json = JSON.stringify(obj);
  return { result: json, expected: '{"name":"test\uFFFDvalue"}' };
}

export function test064() {
  let jsonStr = '{"text":"test\\uD800value"}';
  let obj = JSON.parse(jsonStr);
  let safeText = obj.text.toWellFormed();
  return { result: safeText, expected: "test\uFFFDvalue" };
}

export function test065() {
  let userInput = "comment with \uD800 emoji";
  let safeInput = userInput.toWellFormed();
  return { result: safeInput, expected: "comment with \uFFFD emoji", isWellFormed: safeInput.isWellFormed() };
}

export function test066() {
  let filename = "document\uD800.txt";
  let safeFilename = filename.toWellFormed();
  return { result: safeFilename, expected: "document\uFFFD.txt" };
}

export function test067() {
  let content = "Line 1\nLine 2\uD800\nLine 3";
  let safeContent = content.toWellFormed();
  let lines = safeContent.split("\n");
  return { line1: lines[1] };
}

export function test068() {
  let apiResponse = { message: "Error: \uD800" };
  let cleaned = apiResponse.message.toWellFormed();
  return { result: cleaned, expected: "Error: \uFFFD" };
}

export function test069() {
  let str = "\uD800".repeat(10000);
  let result = str.toWellFormed();
  return { length: result.length, equals: result === "\uFFFD".repeat(10000) };
}

export function test070() {
  let str = "";
  for (let i = 0; i < 1000; i++) {
    str += "test" + (i % 2 === 0 ? "\uD800" : "😄");
  }
  let result = str.toWellFormed();
  return { isWellFormed: result.isWellFormed() };
}

export function test071() {
  let str = "test\uD800value";
  let result1 = str.toWellFormed();
  let result2 = str.toWellFormed();
  let result3 = str.toWellFormed();
  return { r1EqualsR2: result1 === result2, r2EqualsR3: result2 === result3 };
}

export function test072() {
  let str = "test\uD800value";
  let result = str.toWellFormed().toWellFormed().toWellFormed();
  return { result, expected: "test\uFFFDvalue", equalsSingle: result === str.toWellFormed() };
}

export function test073() {
  let str = "test\uD800value";
  let result1 = str.toWellFormed();
  let result2 = result1.toWellFormed();
  return { equals: result1 === result2 };
}

export function test074() {
  let str = "你好\uD800世界";
  let result = str.toWellFormed();
  return { result, expected: "你好\uFFFD世界" };
}

export function test075() {
  let str = "こんにちは\uD800世界";
  let result = str.toWellFormed();
  return { result, expected: "こんにちは\uFFFD世界" };
}

export function test076() {
  let str = "안녕하세요\uD800";
  let result = str.toWellFormed();
  return { result, expected: "안녕하세요\uFFFD" };
}

export function test077() {
  let str = "مرحبا\uD800بالعالم";
  let result = str.toWellFormed();
  return { result, expected: "مرحبا\uFFFDبالعالم" };
}

export function test078() {
  let str = "שלום\uD800עולם";
  let result = str.toWellFormed();
  return { result, expected: "שלום\uFFFDעולם" };
}

export function test079() {
  let str = "👨‍👩‍👧‍👦\uD800";
  let result = str.toWellFormed();
  return { length: result.length, includesFFFD: result.includes("\uFFFD") };
}

export function test080() {
  let str = "🇺🇸\uD800🇬🇧";
  let result = str.toWellFormed();
  return { includesFFFD: result.includes("\uFFFD") };
}

export function test081() {
  let str = "👩‍💻\uD800👨‍💻\uDFFF";
  let result = str.toWellFormed();
  return { result, expected: "👩‍💻\uFFFD👨‍💻\uFFFD" };
}

export function test082() {
  let str = "ab\uD800cd";
  let wellFormed = str.toWellFormed();
  return { originalCharAt2: str.charAt(2), wellFormedCharAt2: wellFormed.charAt(2) };
}

export function test083() {
  let str = "ab\uD800cd";
  let wellFormed = str.toWellFormed();
  return { originalCodePointAt2: str.codePointAt(2), wellFormedCodePointAt2: wellFormed.codePointAt(2) };
}

export function test084() {
  let hasMethod = "toWellFormed" in String.prototype;
  return { exists: hasMethod };
}

export function test085() {
  let methodType = typeof String.prototype.toWellFormed;
  return { type: methodType };
}

export function test086() {
  let methodLength = String.prototype.toWellFormed.length;
  return { length: methodLength };
}

export function test087() {
  let methodName = String.prototype.toWellFormed.name;
  return { name: methodName };
}
