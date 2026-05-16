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

// Interaction with other string methods tests for String.prototype.isWellFormed
export function testIsWellFormedWithToWellFormed() {
  const str = "ab\uD800c";
  let fixed = null;
  if (!str.isWellFormed()) {
    fixed = str.toWellFormed();
  }
  return { result: [str.isWellFormed(), fixed ? fixed.isWellFormed() : null], expected: [false, true] };
}

export function testIsWellFormedWithEncodeURISafety() {
  const url = "https://example.com/search?q=\uD800";
  return { result: url.isWellFormed(), expected: false };
}

export function testIsWellFormedAfterNormalize() {
  const str1 = "café";
  const str2 = "ab\uD800c";
  const result1 = str1.normalize("NFC").isWellFormed();
  const result2 = str1.normalize("NFD").isWellFormed();
  const result3 = str1.normalize("NFKC").isWellFormed();
  const result4 = str1.normalize("NFKD").isWellFormed();
  const result5 = str2.normalize().isWellFormed();
  return { result: [result1, result2, result3, result4, result5], expected: [true, true, true, true, false] };
}

export function testIsWellFormedAfterSlice() {
  const str = "abc\uD83D\uDE04def";
  const result1 = str.slice(0, 3).isWellFormed();
  const result2 = str.slice(3, 5).isWellFormed();
  const result3 = str.slice(0, 4).isWellFormed();
  return { result: [result1, result2, result3], expected: [true, true, false] };
}

export function testIsWellFormedAfterSubstring() {
  const str = "abc\uD83D\uDE04def";
  const result1 = str.substring(0, 3).isWellFormed();
  const result2 = str.substring(3, 5).isWellFormed();
  const result3 = str.substring(4, 6).isWellFormed();
  return { result: [result1, result2, result3], expected: [true, true, false] };
}

export function testIsWellFormedAfterConcat() {
  const str1 = "hello\uD83D";
  const str2 = "\uDE04world";
  const combined = str1.concat(str2);
  return { result: [str1.isWellFormed(), str2.isWellFormed(), combined.isWellFormed()], expected: [false, false, true] };
}

export function testIsWellFormedAfterTrim() {
  const str = "  ab\uD800cd  ";
  const result1 = str.trim().isWellFormed();
  const result2 = str.trimStart().isWellFormed();
  const result3 = str.trimEnd().isWellFormed();
  return { result: [result1, result2, result3], expected: [false, false, false] };
}

export function testIsWellFormedAfterPadStart() {
  const str = "\uD800abc";
  const result1 = str.padStart(10).isWellFormed();
  const result2 = str.padStart(10, "x").isWellFormed();
  return { result: [result1, result2], expected: [false, false] };
}

export function testIsWellFormedAfterPadEnd() {
  const str = "abc\uD800";
  const result1 = str.padEnd(10).isWellFormed();
  const result2 = str.padEnd(10, "y").isWellFormed();
  return { result: [result1, result2], expected: [false, false] };
}
