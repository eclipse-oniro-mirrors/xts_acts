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

// Test split.call() with string
export function testCallWithString() {
  const split = String.prototype.split;
  const result = split.call("Hello World", " ");
  return { result, expectedLength: 2, expectedValues: ["Hello", "World"] };
}

// Test split.call() with number
export function testCallWithNumber() {
  const split = String.prototype.split;
  const result = split.call(123, "2");
  return { result, expectedLength: 2, expectedValues: ["1", "3"] };
}

// Test split.call() with object
export function testCallWithObject() {
  const split = String.prototype.split;
  const result = split.call({ toString: () => "a,b,c" }, ",");
  return { result, expectedLength: 3, expectedValues: ["a", "b", "c"] };
}

// Test split with String wrapper object
export function testStringWrapper() {
  const strObj = new String("a,b,c");
  const result = strObj.split(",");
  return { result, expectedLength: 3, expectedValues: ["a", "b", "c"] };
}

// Test split with inherited String
export function testInheritedString() {
  class MyString extends String {}
  const myStr = new MyString("a-b-c");
  const result = myStr.split("-");
  return { result, expectedLength: 3, expectedValues: ["a", "b", "c"] };
}
