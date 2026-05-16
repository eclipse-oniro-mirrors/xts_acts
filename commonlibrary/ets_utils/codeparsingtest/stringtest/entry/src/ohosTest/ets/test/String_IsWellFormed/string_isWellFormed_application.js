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

// Real-world application scenario tests for String.prototype.isWellFormed
export function testIsWellFormedUserInputValidation() {
  const input1 = "Hello World";
  const input2 = "Hello\uD800World";
  const result1 = input1.isWellFormed();
  const result2 = input2.isWellFormed();
  return { result: [result1, result2], expected: [true, false] };
}

export function testIsWellFormedTextSanitization() {
  const text1 = "clean text";
  const text2 = "dirty\uD800text";
  const fixed1 = text1.isWellFormed() ? text1 : text1.toWellFormed();
  const fixed2 = text2.isWellFormed() ? text2 : text2.toWellFormed();
  const result1 = fixed1.isWellFormed();
  const result2 = fixed2.isWellFormed();
  return { result: [result1, result2], expected: [true, true] };
}

export function testIsWellFormedFilenameValidation() {
  const filename1 = "document.pdf";
  const filename2 = "doc\uD800ument.pdf";
  const result1 = filename1.isWellFormed();
  const result2 = filename2.isWellFormed();
  return { result: [result1, result2], expected: [true, false] };
}

export function testIsWellFormedDatabaseStorage() {
  const data1 = "valid data";
  const data2 = "invalid\uD800data";
  const result1 = data1.isWellFormed();
  const result2 = data2.isWellFormed();
  return { result: [result1, result2], expected: [true, false] };
}

export function testIsWellFormedLogging() {
  const message1 = "Normal log message";
  const message2 = "Log\uD800message";
  const result1 = message1.isWellFormed();
  const result2 = message2.isWellFormed();
  return { result: [result1, result2], expected: [true, false] };
}

export function testIsWellFormedMultilingual() {
  const texts = {
    en: "Hello",
    zh: "你好",
    ja: "こんにちは",
    ko: "안녕하세요",
    ar: "مرحبا",
    invalid: "test\uD800value"
  };
  const results = [];
  const expected = [true, true, true, true, true, false];
  Object.values(texts).forEach(text => {
    results.push(text.isWellFormed());
  });
  return { result: results, expected: expected };
}

export function testIsWellFormedRegexPatternValidation() {
  const pattern1 = "test";
  const pattern2 = "test\uD800";
  const result1 = pattern1.isWellFormed();
  const result2 = pattern2.isWellFormed();
  return { result: [result1, result2], expected: [true, false] };
}

export function testIsWellFormedCSVData() {
  const csvLine = "name,age,city\nJohn,30,New York\uD800";
  const lines = csvLine.split("\n");
  const results = lines.map(line => line.isWellFormed());
  return { result: results, expected: [true, false] };
}

export function testIsWellFormedHTMLValidation() {
  const html = "<div>Hello\uD800World</div>";
  const result = html.isWellFormed();
  return { result, expected: false };
}

export function testIsWellFormedConfigValidation() {
  const configStr = '{"name":"test\uD800app","version":"1.0.0"}';
  const config = JSON.parse(configStr);
  const result = config.name.isWellFormed();
  return { result, expected: false };
}

export function testIsWellFormedStringChain() {
  const result = "  hello\uD800world  ".trim().toUpperCase().replace("WORLD", "UNIVERSE").isWellFormed();
  return { result, expected: false };
}
