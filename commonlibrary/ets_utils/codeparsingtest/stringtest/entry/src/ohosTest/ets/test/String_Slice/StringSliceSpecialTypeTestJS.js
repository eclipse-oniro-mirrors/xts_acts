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

// Test special parameter types for String.prototype.slice()

// Test undefined parameters
export function testUndefinedParam() {
  let str = "Hello World";
  let result1 = str.slice(undefined);
  let result2 = str.slice(undefined, 5);
  let result3 = str.slice(0, undefined);
  let result4 = str.slice(undefined, undefined);
  return {
    result1: result1,
    expected1: "Hello World",
    result2: result2,
    expected2: "Hello",
    result3: result3,
    expected3: "Hello World",
    result4: result4,
    expected4: "Hello World"
  };
}

// Test null parameters
export function testNullParam() {
  let str = "Hello World";
  let result1 = str.slice(null);
  let result2 = str.slice(null, 5);
  let result3 = str.slice(0, null);
  return {
    result1: result1,
    expected1: "Hello World",
    result2: result2,
    expected2: "Hello",
    result3: result3,
    expected3: ""
  };
}

// Test non-numeric string parameters
export function testNonNumericStringParam() {
  let str = "Hello World";
  let result1 = str.slice('abc');
  let result2 = str.slice('abc', 5);
  let result3 = str.slice(0, 'xyz');
  return {
    result1: result1,
    expected1: "Hello World",
    result2: result2,
    expected2: "Hello",
    result3: result3,
    expected3: ""
  };
}

// Test boolean parameters
export function testBooleanParam() {
  let str = "Hello World";
  let result1 = str.slice(true);
  let result2 = str.slice(false);
  let result3 = str.slice(0, true);
  let result4 = str.slice(0, false);
  return {
    result1: result1,
    expected1: "ello World",
    result2: result2,
    expected2: "Hello World",
    result3: result3,
    expected3: "H",
    result4: result4,
    expected4: ""
  };
}

// Test numeric string parameters
export function testNumericStringParam() {
  let str = "Hello World";
  let result1 = str.slice('2');
  let result2 = str.slice('0', '5');
  let result3 = str.slice('-3');
  return {
    result1: result1,
    expected1: "llo World",
    result2: result2,
    expected2: "Hello",
    result3: result3,
    expected3: "rld"
  };
}

// Test float parameters
export function testFloatParam() {
  let str = "Hello World";
  let result1 = str.slice(1.5);
  let result2 = str.slice(1.9, 4.2);
  return {
    result1: result1,
    expected1: "ello World",
    result2: result2,
    expected2: "ell"
  };
}

// Test NaN parameters
export function testNaNParam() {
  let str = "Hello World";
  let result1 = str.slice(NaN);
  let result2 = str.slice(0, NaN);
  let result3 = str.slice(NaN, 5);
  return {
    result1: result1,
    expected1: "Hello World",
    result2: result2,
    expected2: "",
    result3: result3,
    expected3: "Hello"
  };
}

// Test Infinity parameters
export function testInfinityParam() {
  let str = "Hello";
  let result1 = str.slice(Infinity);
  let result2 = str.slice(0, Infinity);
  let result3 = str.slice(-Infinity, Infinity);
  let result4 = str.slice(-Infinity);
  let result5 = str.slice(-Infinity, 3);
  let result6 = str.slice(2, -Infinity);
  return {
    result1: result1,
    expected1: "",
    result2: result2,
    expected2: "Hello",
    result3: result3,
    expected3: "Hello",
    result4: result4,
    expected4: "Hello",
    result5: result5,
    expected5: "Hel",
    result6: result6,
    expected6: ""
  };
}

// Test object parameters
export function testObjectParam() {
  let str = "Hello World";
  let obj1 = {valueOf: () => 2};
  let obj2 = {valueOf: () => 5, toString: () => 3};
  let result1 = str.slice(obj1);
  let result2 = str.slice(obj2);
  let result3 = str.slice([1, 2]);
  let result4 = str.slice([2]);
  return {
    result1: result1,
    expected1: "llo World",
    result2: result2,
    expected2: " World",
    result3: result3,
    expected3: "Hello World",
    result4: result4,
    expected4: "llo World"
  };
}

// Test object as indexEnd
export function testObjectAsEnd() {
  let str = "Hello";
  let obj = {x: 1, y: 2};
  let result1 = str.slice(obj);
  let result2 = str.slice(0, obj);
  return {
    result1: result1,
    expected1: "Hello",
    result2: result2,
    expected2: ""
  };
}
