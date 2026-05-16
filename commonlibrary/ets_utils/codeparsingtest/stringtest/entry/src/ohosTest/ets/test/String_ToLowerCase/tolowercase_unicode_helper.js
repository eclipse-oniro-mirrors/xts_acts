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

// Test dotted capital I (İ) - special character that changes length
export function testDottedCapitalI() {
  const str = "İ"; // U+0130
  const originalLen = str.length;
  const result = str.toLowerCase();
  const resultLen = result.length;
  return {
    original: str,
    originalLen: originalLen,
    result: result,
    resultLen: resultLen
  };
}

// Test length change verification function
export function testLengthChange(char) {
  const original = char;
  const lower = char.toLowerCase();
  return {
    original: original,
    originalLen: original.length,
    result: lower,
    resultLen: lower.length,
    lengthChanged: original.length !== lower.length
  };
}

// Test decomposed character (E + combining acute accent)
export function testDecomposedChar() {
  const str = "E\u0301"; // U+0045 + U+0301
  const result = str.toLowerCase();
  return {
    original: str,
    result: result
  };
}

// Test with normalize() and toLowerCase()
export function testWithNormalize() {
  const str = "É";
  const normalized = str.normalize('NFC');
  const result = normalized.toLowerCase();
  return {
    original: str,
    normalized: normalized,
    result: result
  };
}

// Test Turkish I difference
export function testTurkishI() {
  const iUpper = "I"; // U+0049
  const lowerResult = iUpper.toLowerCase();
  const localeLowerResult = iUpper.toLocaleLowerCase('tr-TR');

  return {
    upper: iUpper,
    lower: lowerResult,
    localeLower: localeLowerResult
  };
}
