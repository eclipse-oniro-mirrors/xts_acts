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

// Test null this value
export function testNull() {
  try {
    const result = String.prototype.toLowerCase.call(null);
    return { thrown: false, isTypeError: false, result: result };
  } catch (e) {
    return { thrown: true, isTypeError: e instanceof TypeError };
  }
}

// Test undefined this value
export function testUndefined() {
  try {
    const result = String.prototype.toLowerCase.call(undefined);
    return { thrown: false, isTypeError: false, result: result };
  } catch (e) {
    return { thrown: true, isTypeError: e instanceof TypeError };
  }
}

// Test number this value
export function testNumber() {
  try {
    const result = String.prototype.toLowerCase.call(123);
    return { thrown: false, isTypeError: false, result: result };
  } catch (e) {
    return { thrown: true, isTypeError: e instanceof TypeError };
  }
}

// Test plain object this value
export function testObject() {
  try {
    const result = String.prototype.toLowerCase.call({ key: "value" });
    return { thrown: false, isTypeError: false, result: result };
  } catch (e) {
    return { thrown: true, isTypeError: e instanceof TypeError };
  }
}

// Test array this value
export function testArray() {
  try {
    const result = String.prototype.toLowerCase.call([1, 2, 3]);
    return { thrown: false, isTypeError: false, result: result };
  } catch (e) {
    return { thrown: true, isTypeError: e instanceof TypeError };
  }
}

// Test boolean this value
export function testBoolean() {
  try {
    const result = String.prototype.toLowerCase.call(true);
    return { thrown: false, isTypeError: false, result: result };
  } catch (e) {
    return { thrown: true, isTypeError: e instanceof TypeError };
  }
}

// Test object with toString method
export function testObjectWithToString() {
  const obj = {
    toString() {
      return "HELLO";
    }
  };
  try {
    const result = String.prototype.toLowerCase.call(obj);
    return { result: result };
  } catch (e) {
    return { error: e.message };
  }
}

// Test call and apply methods
export function testCallApply() {
  const str = "HELLO";
  const callResult = String.prototype.toLowerCase.call(str);
  const applyResult = String.prototype.toLowerCase.apply(str);
  return {
    callResult: callResult,
    applyResult: applyResult
  };
}

// Test Symbol this value
export function testSymbol() {
  try {
    const sym = Symbol("test");
    const result = String.prototype.toLowerCase.call(sym);
    return { thrown: false, isTypeError: false, result: result };
  } catch (e) {
    return { thrown: true, isTypeError: e instanceof TypeError };
  }
}

// Test String wrapper object
export function testStringWrapper() {
  const strObj = new String("HELLO");
  const result = strObj.toLowerCase();
  return {
    result: result,
    type: typeof result
  };
}
