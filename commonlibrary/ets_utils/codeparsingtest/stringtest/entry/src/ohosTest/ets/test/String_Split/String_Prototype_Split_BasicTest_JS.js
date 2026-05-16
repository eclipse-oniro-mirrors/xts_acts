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

// Test split without separator parameter
export function testNoSeparator() {
  const str = "Hello World";
  const result = str.split();
  return { result, expectedLength: 1, expectedValue: "Hello World" };
}

// Test split with undefined as separator
export function testUndefinedSeparator() {
  const str = "Hello World";
  const result = str.split(undefined);
  return { result, expectedLength: 1, expectedValue: "Hello World" };
}

// Test split with null as separator
export function testNullSeparator() {
  const str = "testnulltest";
  const result = str.split(null);
  return { result, expectedLength: 2, expectedValues: ["test", "test"] };
}

// Test split with boolean true as separator
export function testBooleanTrueSeparator() {
  const str = "testtruetestfalsetest";
  const result = str.split(true);
  return { result, expectedLength: 2, expectedValues: ["test", "testfalsetest"] };
}

// Test split with boolean false as separator
export function testBooleanFalseSeparator() {
  const str = "testtruetestfalsetest";
  const result = str.split(false);
  return { result, expectedLength: 2, expectedValues: ["testtruetest","test"] };
}

// Test split with number as separator
export function testNumberSeparator(num) {
  const str = "test2test2test";
  const result = str.split(num);
  return { result, expectedLength: 3, expectedValues: ["test", "test", "test"] };
}

// Test split with empty array as separator (converts to empty string)
export function testEmptyArraySeparator() {
  const str = "test";
  const result = str.split([]);
  return { result, expectedLength: 4 };
}

// Test split with negative number as separator
export function testNegativeNumberSeparator() {
  const str = "test-1test";
  const result = str.split(-1);
  return { result, expectedLength: 2, expectedValues: ["test", "test"] };
}

// Test split with float number as separator
export function testFloatNumberSeparator() {
  const str = "test1.5test";
  const result = str.split(1.5);
  return { result, expectedLength: 1, expectedValues: ["test1.5test"] };
}

// Test split with zero number as separator
export function testZeroNumberSeparator() {
  const str = "test0test";
  const result = str.split(0);
  return { result, expectedLength: 2, expectedValues: ["test", "test"] };
}