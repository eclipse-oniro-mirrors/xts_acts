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

// Test Turkish I difference between toLowerCase and toLocaleLowerCase
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

// Test dotted capital I (İ) with both methods
export function testDottedCapitalI() {
  const iDottedUpper = "İ"; // U+0130
  const lowerResult = iDottedUpper.toLowerCase();
  const localeLowerResult = iDottedUpper.toLocaleLowerCase('tr-TR');

  return {
    upper: iDottedUpper,
    lower: lowerResult,
    localeLower: localeLowerResult,
    lowerLength: lowerResult.length,
    localeLowerLength: localeLowerResult.length
  };
}

// Test toLowerCase vs toLocaleLowerCase with various strings
export function testCompareMethods() {
  const testStrings = [
    "HELLO WORLD",
    "ISTANBUL",
    "CAFÉ",
    "ÄÖÜ"
  ];

  return testStrings.map(str => ({
    original: str,
    lower: str.toLowerCase(),
    localeLower: str.toLocaleLowerCase('en-US'),
    localeLowerTR: str.toLocaleLowerCase('tr-TR'),
    same: str.toLowerCase() === str.toLocaleLowerCase('en-US')
  }));
}
