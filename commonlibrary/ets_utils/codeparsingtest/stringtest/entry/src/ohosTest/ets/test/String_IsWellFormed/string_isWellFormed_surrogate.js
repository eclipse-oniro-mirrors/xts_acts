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

// Lone surrogate tests for String.prototype.isWellFormed
export function testIsWellFormedLoneHighSurrogate() {
  const result1 = "\uD800".isWellFormed();
  const result2 = "\uD83D".isWellFormed();
  return { result: [result1, result2], expected: [false, false] };
}

export function testIsWellFormedHighSurrogateAtStart() {
  const result1 = "\uD800abc".isWellFormed();
  const result2 = "\uD83Dhello".isWellFormed();
  return { result: [result1, result2], expected: [false, false] };
}

export function testIsWellFormedHighSurrogateInMiddle() {
  const result1 = "ab\uD800cd".isWellFormed();
  const result2 = "hello\uD83Dworld".isWellFormed();
  const result3 = "ab\uD800c".isWellFormed();
  return { result: [result1, result2, result3], expected: [false, false, false] };
}

export function testIsWellFormedHighSurrogateAtEnd() {
  const result1 = "abc\uD800".isWellFormed();
  const result2 = "hello\uD83D".isWellFormed();
  const result3 = "ab\uD800".isWellFormed();
  return { result: [result1, result2, result3], expected: [false, false, false] };
}

export function testIsWellFormedMultipleHighSurrogates() {
  const result1 = "\uD800\uD800".isWellFormed();
  const result2 = "\uD83D\uD83D".isWellFormed();
  const result3 = "ab\uD800\uD800cd".isWellFormed();
  return { result: [result1, result2, result3], expected: [false, false, false] };
}

export function testIsWellFormedHighSurrogateBoundaries() {
  const result1 = "\uD800".isWellFormed();
  const result2 = "\uDBFF".isWellFormed();
  const result3 = "\uDA00".isWellFormed();
  return { result: [result1, result2, result3], expected: [false, false, false] };
}

export function testIsWellFormedLoneLowSurrogate() {
  const result1 = "\uDC00".isWellFormed();
  const result2 = "\uDFFF".isWellFormed();
  return { result: [result1, result2], expected: [false, false] };
}

export function testIsWellFormedLowSurrogateAtStart() {
  const result1 = "\uDC00abc".isWellFormed();
  const result2 = "\uDFFFhello".isWellFormed();
  const result3 = "\uDFFFab".isWellFormed();
  return { result: [result1, result2, result3], expected: [false, false, false] };
}

export function testIsWellFormedLowSurrogateInMiddle() {
  const result1 = "ab\uDC00cd".isWellFormed();
  const result2 = "hello\uDFFFworld".isWellFormed();
  const result3 = "c\uDFFFab".isWellFormed();
  return { result: [result1, result2, result3], expected: [false, false, false] };
}

export function testIsWellFormedLowSurrogateAtEnd() {
  const result1 = "abc\uDC00".isWellFormed();
  const result2 = "hello\uDFFF".isWellFormed();
  return { result: [result1, result2], expected: [false, false] };
}

export function testIsWellFormedMultipleLowSurrogates() {
  const result1 = "\uDC00\uDC00".isWellFormed();
  const result2 = "\uDFFF\uDFFF".isWellFormed();
  const result3 = "ab\uDC00\uDC00cd".isWellFormed();
  return { result: [result1, result2, result3], expected: [false, false, false] };
}

export function testIsWellFormedLowSurrogateBoundaries() {
  const result1 = "\uDC00".isWellFormed();
  const result2 = "\uDFFF".isWellFormed();
  const result3 = "\uDE00".isWellFormed();
  return { result: [result1, result2, result3], expected: [false, false, false] };
}

export function testIsWellFormedWrongSurrogateOrder() {
  const result1 = "\uDC00\uD800".isWellFormed();
  const result2 = "\uDFFF\uD83D".isWellFormed();
  const result3 = "ab\uDC00\uD800cd".isWellFormed();
  return { result: [result1, result2, result3], expected: [false, false, false] };
}

export function testIsWellFormedMixedSurrogates() {
  const result1 = "\uD83D\uDE04\uDC00".isWellFormed();
  const result2 = "\uD800\uD83D\uDE04".isWellFormed();
  const result3 = "\uD83D\uDE04\uD800\uD83D\uDE04".isWellFormed();
  return { result: [result1, result2, result3], expected: [false, false, false] };
}

export function testIsWellFormedConsecutiveHighSurrogates() {
  const result1 = "\uD800\uD800".isWellFormed();
  const result2 = "\uD83D\uD83D\uD83D".isWellFormed();
  return { result: [result1, result2], expected: [false, false] };
}

export function testIsWellFormedConsecutiveLowSurrogates() {
  const result1 = "\uDC00\uDC00".isWellFormed();
  const result2 = "\uDFFF\uDFFF\uDFFF".isWellFormed();
  return { result: [result1, result2], expected: [false, false] };
}

export function testIsWellFormedInterleavedSurrogates() {
  const result1 = "\uD800\uDC00\uD800".isWellFormed();
  const result2 = "\uD800\uDC00\uDC00".isWellFormed();
  const result3 = "\uD800\uD800\uDC00".isWellFormed();
  return { result: [result1, result2, result3], expected: [false, false, false] };
}
