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

// Type definitions for StringSliceSpecialTypeTest.js

export interface TestResult6 {
  result1: string;
  expected1: string;
  result2: string;
  expected2: string;
  result3: string;
  expected3: string;
  result4: string;
  expected4: string;
  result5: string;
  expected5: string;
  result6: string;
  expected6: string;
}

export interface TestResult4 {
  result1: string;
  expected1: string;
  result2: string;
  expected2: string;
  result3: string;
  expected3: string;
  result4: string;
  expected4: string;
}

export interface TestResult3 {
  result1: string;
  expected1: string;
  result2: string;
  expected2: string;
  result3: string;
  expected3: string;
}

export interface TestResult2 {
  result1: string;
  expected1: string;
  result2: string;
  expected2: string;
}

export function testUndefinedParam(): TestResult6;
export function testNullParam(): TestResult4;
export function testNonNumericStringParam(): TestResult4;
export function testBooleanParam(): TestResult6;
export function testNumericStringParam(): TestResult3;
export function testFloatParam(): TestResult2;
export function testNaNParam(): TestResult3;
export function testInfinityParam(): TestResult6;
export function testObjectParam(): TestResult6;
export function testObjectAsEnd(): TestResult2;
