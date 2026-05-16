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

// Test non-string this value for String.prototype.slice()

// Test number as this
export function testNumberAsThis() {
  let result1 = String.prototype.slice.call(12345, 1, 3);
  let result2 = String.prototype.slice.call(987654321, 2, 6);
  return {
    result1: result1,
    expected1: "23",
    result2: result2,
    expected2: "7654"
  };
}

// Test boolean as this
export function testBooleanAsThis() {
  let result1 = String.prototype.slice.call(true, 1, 3);
  let result2 = String.prototype.slice.call(false, 0, 2);
  return {
    result1: result1,
    expected1: "ru",
    result2: result2,
    expected2: "fa"
  };
}

// Test array as this
export function testArrayAsThis() {
  let result1 = String.prototype.slice.call([1, 2, 3, 4], 0, 5);
  let result2 = String.prototype.slice.call(['a', 'b', 'c'], 2, 5);
  return {
    result1: result1,
    expected1: "1,2,3",
    result2: result2,
    expected2: "b,c"
  };
}

// Test object as this
export function testObjectAsThis() {
  let result1 = String.prototype.slice.call({x: 1, y: 2}, 0, 5);
  let result2 = String.prototype.slice.call({toString: () => 'custom'}, 0, 4);
  return {
    result1: result1,
    expected1: "[obje",
    result2: result2,
    expected2: "cust"
  };
}

// Test frozen object as this
export function testFrozenObjectAsThis() {
  let frozenStr = Object.freeze("Hello World");
  let result1 = frozenStr.slice(0, 5);
  let result2 = frozenStr.slice(6);
  return {
    result1: result1,
    expected1: "Hello",
    result2: result2,
    expected2: "World"
  };
}

// Test frozen non-string object
export function testFrozenNonString() {
  let frozenObj = Object.freeze({toString: () => "Frozen"});
  let result = String.prototype.slice.call(frozenObj, 0, 4);
  return {
    result: result,
    expected: "Froz"
  };
}

// Test sealed object
export function testSealedObject() {
  let sealedObj = Object.seal({x: 1});
  let result = String.prototype.slice.call(sealedObj, 0, 5);
  return {
    result: result,
    expected: "[obje"
  };
}

// Test with call
export function testWithCall() {
  let str = "Hello World";
  let result1 = String.prototype.slice.call(str, 0, 5);
  let result2 = String.prototype.slice.call('Test', 1, 3);
  return {
    result1: result1,
    expected1: "Hello",
    result2: result2,
    expected2: "es"
  };
}

// Test with apply
export function testWithApply() {
  let str = "Hello World";
  let result1 = String.prototype.slice.apply(str, [0, 5]);
  let result2 = String.prototype.slice.apply('Test', [1, 3]);
  return {
    result1: result1,
    expected1: "Hello",
    result2: result2,
    expected2: "es"
  };
}

// Test with bind
export function testWithBind() {
  let boundSlice = String.prototype.slice.bind("Hello World");
  let result1 = boundSlice(0, 5);
  let result2 = boundSlice(6);
  return {
    result1: result1,
    expected1: "Hello",
    result2: result2,
    expected2: "World"
  };
}
