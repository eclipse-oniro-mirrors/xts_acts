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

// Test functions for special parameter types
export function testNaN() {
  const str = 'Mozilla';
  const result = str.substring(NaN, 3);
  return { result, expected: 'Moz' };
}

export function testInfinity() {
  const str = 'Mozilla';
  const result = str.substring(0, Infinity);
  return { result, expected: 'Mozilla' };
}

export function testNull() {
  const str = 'Mozilla';
  const result = str.substring(null, 3);
  return { result, expected: 'Moz' };
}

export function testBoolean() {
  const str = 'Mozilla';
  const result = str.substring(true, 5);
  return { result, expected: 'ozil' };
}

export function testStringNumeric() {
  const str = 'Mozilla';
  const result = str.substring('1', '3');
  return { result, expected: 'oz' };
}

export function testStringNonNumeric() {
  const str = 'Mozilla';
  const result = str.substring('abc', 3);
  return { result, expected: 'Moz' };
}
