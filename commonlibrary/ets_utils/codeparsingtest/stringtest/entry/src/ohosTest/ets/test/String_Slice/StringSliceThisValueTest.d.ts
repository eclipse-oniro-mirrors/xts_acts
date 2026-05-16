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

// Type definitions for StringSliceThisValueTest.js

export interface TestResult2 {
  result1: string;
  expected1: string;
  result2: string;
  expected2: string;
}

export interface TestResult1 {
  result: string;
  expected: string;
}

export function testNumberAsThis(): TestResult2;
export function testBooleanAsThis(): TestResult2;
export function testArrayAsThis(): TestResult2;
export function testObjectAsThis(): TestResult2;
export function testFrozenObjectAsThis(): TestResult2;
export function testFrozenNonString(): TestResult1;
export function testSealedObject(): TestResult1;
export function testWithCall(): TestResult2;
export function testWithApply(): TestResult2;
export function testWithBind(): TestResult2;
