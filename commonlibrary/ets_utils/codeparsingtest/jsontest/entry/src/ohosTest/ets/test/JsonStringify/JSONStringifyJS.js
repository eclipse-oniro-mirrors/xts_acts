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

export function ArrayProto(){
  return Array.prototype;
}

export function FunctionProto(){
  return Function.prototype;
}

export function ObjectProto(){
  return Object.prototype;
}

export function JSONStringify_Type_FunctionEmpty_001(){
  let result = JSON.stringify(function() {});
  return result;
}

export function JSONStringify_Type_FunctionNamed_001(){
  let result = JSON.stringify(function test() {});
  return result;
}

export function JSONStringify_Enumerable_002(){
  let obj = {};
  Object.defineProperty(obj, "a", { value: 1, enumerable: true });
  let result = JSON.stringify(obj);
  return result;
}

export function JSONStringify_NonEnumerable_001(){
  let obj = {};
  Object.defineProperty(obj, "a", { value: 1, enumerable: false });
  let result = JSON.stringify(obj);
  return result;
}

export function JSONStringify_NonEnumerable_002(){
  let obj = {};
  Object.defineProperty(obj, "a", { value: 1, enumerable: false });
  Object.defineProperty(obj, "b", { value: 2, enumerable: true });
  let result = JSON.stringify(obj);
  return result;
}

export function JSONStringify_NonEnumerable_003(){
  let obj = { a: 1 };
  Object.defineProperty(obj, "b", { value: 2, enumerable: false });
  let result = JSON.stringify(obj);
  return result;
}

export function JSONStringify_Inherited_001(){
  let proto = { a: 1 };
  let obj = Object.create(proto);
  obj.b = 2;
  let result = JSON.stringify(obj);
  return result;
}

export function JSONStringify_Inherited_002(){
  let proto1 = { a: 1 };
  let proto2 = Object.create(proto1);
  proto2.b = 2;
  let obj = Object.create(proto2);
  obj.c = 3;
  let result = JSON.stringify(obj);
  return result;
}

export function JSONStringify_Detect_Direct_001(){
  let obj = {};
  obj.self = obj;
  let error = null;
  try {
    JSON.stringify(obj);
  } catch (e) {
    error = e;
  }
  return error.message;
}

export function JSONStringify_Detect_Property_001(){
  let obj = {};
  obj.self = obj;
  let error = null;
  try {
    JSON.stringify(obj);
  } catch (e) {
    error = e;
  }
  return error.message;
}

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

export function testUndefinedAsObjectProperty() {
  return JSON.stringify({ a: undefined });
}

export function testMultipleUndefinedProperties() {
  return JSON.stringify({ a: undefined, b: undefined });
}

export function testUndefinedMixedValues() {
  return JSON.stringify({ a: undefined, b: 1 });
}

export function testUndefinedInArray() {
  return JSON.stringify([undefined]);
}

export function testMultipleUndefinedInArray() {
  return JSON.stringify([undefined, undefined]);
}

export function testUndefinedMixedInArray() {
  return JSON.stringify([undefined, 1, undefined]);
}

export function testDirectUndefined() {
  return JSON.stringify(undefined);
}

export function testFunctionAsObjectProperty() {
  return JSON.stringify({ a: function() {} });
}

export function testMultipleFunctionProperties() {
  return JSON.stringify({ a: function() {}, b: function() {} });
}

export function testFunctionMixedValues() {
  return JSON.stringify({ a: function() {}, b: 1 });
}

export function testFunctionInArray() {
  return JSON.stringify([function() {}]);
}

export function testMultipleFunctionsInArray() {
  return JSON.stringify([function() {}, function() {}]);
}

export function testFunctionMixedInArray() {
  return JSON.stringify([function() {}, 1, function() {}]);
}

export function testDirectFunction() {
  return JSON.stringify(function() {});
}

export function testSymbolAsObjectKey() {
  return JSON.stringify({ [Symbol("foo")]: "bar" });
}

export function testSymbolForAsObjectKey() {
  return JSON.stringify({ [Symbol.for("foo")]: "bar" });
}

export function testSymbolMixedKeys() {
  return JSON.stringify({ a: 1, [Symbol("b")]: 2 });
}

export function testSymbolAsObjectValue() {
  return JSON.stringify({ a: Symbol("foo") });
}

export function testSymbolInArray() {
  return JSON.stringify([Symbol("foo")]);
}

export function testReplacerArrayWithSymbol() {
  return JSON.stringify({ [Symbol.for("foo")]: "bar" }, [Symbol.for("foo")]);
}

export function testReplacerFunctionSymbolKey() {
  const replacer = (key, value) => typeof key === "symbol" ? "symbol" : value;
  return JSON.stringify({ [Symbol("foo")]: "bar" }, replacer);
}

export function testBigInt() {
  try {
    return JSON.stringify(123n);
  } catch (e) {
    return "TypeError";
  }
}

export function testBigIntInObject() {
  try {
    return JSON.stringify({ a: 123n });
  } catch (e) {
    return "TypeError";
  }
}

export function testBigIntInArray() {
  try {
    return JSON.stringify([123n]);
  } catch (e) {
    return "TypeError";
  }
}

export function testMixedBigInt() {
  try {
    return JSON.stringify({ a: 1, b: 123n, c: 2 });
  } catch (e) {
    return "TypeError";
  }
}