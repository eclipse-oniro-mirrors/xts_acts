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

// Compatibility and polyfill tests for String.prototype.isWellFormed
export function testIsWellFormedMethodExists() {
  const result = typeof String.prototype.isWellFormed === 'function';
  return { result, expected: true };
}

export function testIsWellFormedMixedCharacters() {
  const mixed = "Hello 你好 😀 \uD83D\uDE04 \uD800";
  const result = mixed.isWellFormed();
  return { result, expected: false };
}

export function testIsWellFormedEmptyStringOperations() {
  const result1 = "".isWellFormed();
  const result2 = "".concat("").isWellFormed();
  const result3 = "".padStart(10).isWellFormed();
  const result4 = "".repeat(5).isWellFormed();
  return { result: [result1, result2, result3, result4], expected: [true, true, true, true] };
}

export function testIsWellFormedLoneSurrogateOperations() {
  const str = "\uD800";
  const result1 = str.isWellFormed();
  const result2 = str.toUpperCase().isWellFormed();
  const result3 = str.toLowerCase().isWellFormed();
  const result4 = str.trim().isWellFormed();
  const result5 = str.repeat(2).isWellFormed();
  return { result: [result1, result2, result3, result4, result5], expected: [false, false, false, false, false] };
}

export function testIsWellFormedComplexScenario() {
  const str = "ab\uD800c";
  const originalResult = str.isWellFormed();
  const wellFormed = str.toWellFormed();
  const fixedResult = wellFormed.isWellFormed();
  return { result: [originalResult, fixedResult], expected: [false, true] };
}
