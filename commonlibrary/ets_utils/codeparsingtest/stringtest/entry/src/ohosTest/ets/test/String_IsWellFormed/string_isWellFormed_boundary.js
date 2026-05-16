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

// Boundary and special value tests for String.prototype.isWellFormed
export function testIsWellFormedLongWellFormedString() {
  const result1 = "a".repeat(1000000).isWellFormed();
  const result2 = "你好".repeat(100000).isWellFormed();
  return { result: [result1, result2], expected: [true, true] };
}

export function testIsWellFormedLongStringWithLoneSurrogate() {
  const result1 = ("a".repeat(1000000) + "\uD800").isWellFormed();
  const result2 = ("\uD800" + "a".repeat(1000000)).isWellFormed();
  return { result: [result1, result2], expected: [false, false] };
}

export function testIsWellFormedSingleASCII() {
  const result1 = "a".isWellFormed();
  const result2 = "Z".isWellFormed();
  const result3 = "0".isWellFormed();
  return { result: [result1, result2, result3], expected: [true, true, true] };
}

export function testIsWellFormedSingleUnicode() {
  const result1 = "你".isWellFormed();
  const result2 = "あ".isWellFormed();
  const result3 = "😀".isWellFormed();
  return { result: [result1, result2, result3], expected: [true, true, true] };
}

export function testIsWellFormedSingleSurrogate() {
  const result1 = "\uD800".isWellFormed();
  const result2 = "\uDC00".isWellFormed();
  const result3 = "\uDFFF".isWellFormed();
  return { result: [result1, result2, result3], expected: [false, false, false] };
}

export function testIsWellFormedControlCharacters() {
  const result1 = "\x00".isWellFormed();
  const result2 = "\x01".isWellFormed();
  const result3 = "\x1F".isWellFormed();
  const result4 = "\x7F".isWellFormed();
  return { result: [result1, result2, result3, result4], expected: [true, true, true, true] };
}

export function testIsWellFormedEscapeCharacters() {
  const result1 = "\n".isWellFormed();
  const result2 = "\r".isWellFormed();
  const result3 = "\t".isWellFormed();
  const result4 = "\\".isWellFormed();
  const result5 = "\"".isWellFormed();
  return { result: [result1, result2, result3, result4, result5], expected: [true, true, true, true, true] };
}

export function testIsWellFormedPrivateUseArea() {
  const result1 = "\uE000".isWellFormed();
  const result2 = "\uF8FF".isWellFormed();
  return { result: [result1, result2], expected: [true, true] };
}

export function testIsWellFormedSpecialPurposeArea() {
  const result1 = "\uFFF9".isWellFormed();
  const result2 = "\uFFFA".isWellFormed();
  const result3 = "\uFFFB".isWellFormed();
  const result4 = "\uFFFC".isWellFormed();
  const result5 = "\uFFFD".isWellFormed();
  return { result: [result1, result2, result3, result4, result5], expected: [true, true, true, true, true] };
}

export function testIsWellFormedBOMAndSpecialMarks() {
  const result1 = "\uFEFF".isWellFormed();
  const result2 = "\u200B".isWellFormed();
  const result3 = "\u200C".isWellFormed();
  const result4 = "\u200D".isWellFormed();
  return { result: [result1, result2, result3, result4], expected: [true, true, true, true] };
}
