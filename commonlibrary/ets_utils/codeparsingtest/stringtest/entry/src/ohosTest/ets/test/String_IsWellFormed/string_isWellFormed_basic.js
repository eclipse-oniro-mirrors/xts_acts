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

// Basic function tests for String.prototype.isWellFormed
export function testIsWellFormedEmptyString() {
  const result = "".isWellFormed();
  return { result, expected: true };
}

export function testIsWellFormedPureASCII() {
  const result1 = "Hello World".isWellFormed();
  const result2 = "1234567890".isWellFormed();
  const result3 = "!@#$%^&*()".isWellFormed();
  const result4 = "abc\tdef\nghi".isWellFormed();
  return { result: [result1, result2, result3, result4], expected: [true, true, true, true] };
}

export function testIsWellFormedUnicode() {
  const result1 = "你好世界".isWellFormed();
  const result2 = "こんにちは".isWellFormed();
  const result3 = "مرحبا".isWellFormed();
  const result4 = "Привет".isWellFormed();
  return { result: [result1, result2, result3, result4], expected: [true, true, true, true] };
}

export function testIsWellFormedEmoji() {
  const result1 = "😀".isWellFormed();
  const result2 = "🎉🎊🎁".isWellFormed();
  const result3 = "👨‍👩‍👧‍👦".isWellFormed();
  const result4 = "🏳️‍🌈".isWellFormed();
  return { result: [result1, result2, result3, result4], expected: [true, true, true, true] };
}

export function testIsWellFormedCompleteSurrogatePairs() {
  const result1 = "\uD83D\uDE04".isWellFormed();
  const result2 = "\uD83D\uDC4D".isWellFormed();
  const result3 = "ab\uD83D\uDE04c".isWellFormed();
  return { result: [result1, result2, result3], expected: [true, true, true] };
}
