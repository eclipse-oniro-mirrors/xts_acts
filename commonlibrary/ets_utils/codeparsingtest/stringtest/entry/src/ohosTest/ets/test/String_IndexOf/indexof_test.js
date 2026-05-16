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

// Type conversion tests for indexOf that are not supported in ArkTS

// Test indexOf with number as searchValue
export function testNumberAsSearchValue() {
  let str = "item123";
  let result = str.indexOf(123);
  return result;
}

// Test indexOf with boolean true as searchValue
export function testBooleanTrueAsSearchValue() {
  let str = "true or false";
  let result = str.indexOf(true);
  return result;
}

// Test indexOf with boolean false as searchValue
export function testBooleanFalseAsSearchValue() {
  let str = "true or false";
  let result = str.indexOf(false);
  return result;
}

// Test indexOf with null as searchValue
export function testNullAsSearchValue() {
  let str = "null value";
  let result = str.indexOf(null);
  return result;
}

// Test indexOf with string number as position
export function testStringNumberAsPosition() {
  let str = "hello world";
  let result = str.indexOf("o", "3");
  return result;
}

// Test indexOf with float as position
export function testFloatAsPosition() {
  let str = "hello world";
  let result = str.indexOf("o", 3.7);
  return result;
}

// Test indexOf with true as position
export function testTrueAsPosition() {
  let str = "hello world";
  let result = str.indexOf("h", true);
  return result;
}

// Test indexOf with false as position
export function testFalseAsPosition() {
  let str = "hello world";
  let result = str.indexOf("h", false);
  return result;
}

// Test indexOf with null as position
export function testNullAsPosition() {
  let str = "hello world";
  let result = str.indexOf("h", null);
  return result;
}

// Test indexOf with undefined as position
export function testUndefinedAsPosition() {
  let str = "hello world";
  let result = str.indexOf("h", undefined);
  return result;
}

// Test indexOf using call on number
export function testCallOnNumber() {
  let result = String.prototype.indexOf.call(12345, "34");
  return result;
}

// Test indexOf using apply on boolean
export function testApplyOnBoolean() {
  let result = String.prototype.indexOf.apply(true, ["ue"]);
  return result;
}

// Test indexOf without parameter
export function testNoParameter() {
  let str = "hello world";
  let result = str.indexOf();
  return result;
}

// Test indexOf with explicit undefined
export function testExplicitUndefined() {
  let str = "hello world";
  let result = str.indexOf(undefined);
  return result;
}

// Test indexOf without param in string containing "undefined"
export function testNoParamInUndefinedString() {
  let str = "undefined value";
  let result = str.indexOf();
  return result;
}
