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

// Test split with null as limit (converts to 0)
export function testLimitNull() {
  const str = "a b c";
  const result = str.split(" ", null);
  return { result, expectedLength: 0 };
}

// Test split with negative limit (don't converts to 0)
export function testLimitNegative() {
  const str = "a b c";
  const result = str.split(" ", -1);
  return { result, expectedLength: 3 };
}

// Test split with string number as limit
export function testLimitStringNumber() {
  const str = "a b c d";
  const result = str.split(" ", "2");
  return { result, expectedLength: 2 };
}

// Test split with boolean as limit
export function testLimitBoolean() {
  const str = "a b c";
  const result = str.split(" ", true);
  return { result, expectedLength: 1, expectedValue: "a" };
}

// Test split with small float limit (converts to 0)
export function testLimitSmallFloat() {
  const str = "a b c d";
  const result = str.split(" ", 0.1);
  return { result, expectedLength: 0 };
}
