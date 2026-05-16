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

// Type conversion, object, array and other tests for String.prototype.concat()

// Type conversion tests
export function testConcatWithInteger() {
  const str = 'Count: ';
  const result = str.concat(42);
  return result;
}

export function testConcatWithFloat() {
  const str = 'Value: ';
  const result = str.concat(3.14);
  return result;
}

export function testConcatWithMultipleNumbers() {
  const result = ''.concat(4, 5);
  return result;
}

export function testConcatWithNaN() {
  const result = ''.concat(NaN);
  return result;
}

export function testConcatWithInfinity() {
  const result1 = ''.concat(Infinity);
  const result2 = ''.concat(-Infinity);
  return { result1, result2 };
}

export function testConcatWithTrue() {
  const str = 'Value: ';
  const result = str.concat(true);
  return result;
}

export function testConcatWithFalse() {
  const str = 'Value: ';
  const result = str.concat(false);
  return result;
}

export function testConcatWithNull() {
  const str = 'Value: ';
  const result = str.concat(null);
  return result;
}

export function testConcatWithUndefined() {
  const str = 'Value: ';
  const result = str.concat(undefined);
  return result;
}

export function testConcatWithZero() {
  const str = 'Count: ';
  const result = str.concat(0);
  return result;
}

export function testConcatWithNegative() {
  const str = 'Value: ';
  const result = str.concat(-42);
  return result;
}

// Object and array type conversion tests
export function testConcatWithEmptyObject() {
  const result = ''.concat({});
  return result;
}

export function testConcatWithCustomToString() {
  const obj = {
    toString: function() {
      return 'Custom';
    }
  };
  const result = 'Result: '.concat(obj);
  return result;
}

export function testConcatWithEmptyArray() {
  const result = ''.concat([]);
  return result;
}

export function testConcatWithArray() {
  const result = ''.concat([1, 2, 3]);
  return result;
}

export function testConcatWithFunction() {
  const result = ''.concat(function testFn() {});
  return result;
}

export function testConcatOperatorWithObject() {
  const obj = {
    valueOf: function() { return 42; },
    toString: function() { return 'Hello'; }
  };
  const concatResult = ''.concat(obj);
  const plusResult = '' + obj;
  return { concat: concatResult, plus: plusResult };
}

export function testConcatWithPrototypeCall() {
  try {
    const result = String.prototype.concat.call(123, ' World');
    return { result: result, error: null };
  } catch (e) {
    return { result: null, error: e.message };
  }
}

export function testConcatStrictModePrototypeCall() {
  'use strict';
  try {
    const result = String.prototype.concat.call(null, 'test');
    return { result: result, error: null };
  } catch (e) {
    return { result: null, error: e.message };
  }
}

export function testArrayConcatVsStringConcat() {
  const str = 'Hello';
  const arr = [1, 2];
  const strResult = str.concat();
  const arrResult = arr.concat();
  const strSameRef = strResult === str;
  const arrSameRef = arrResult === arr;
  return {
    strResult: strResult,
    arrResult: arrResult.toString(),
    strSameRef: strSameRef,
    arrSameRef: arrSameRef
  };
}

export function testConcatWithSpread() {
  const greetList = ['Hello', ' ', 'Venkat', '!'];
  const result = ''.concat(...greetList);
  return result;
}

export function testConcatWithSpreadEmpty() {
  const result = ''.concat(...[]);
  return result;
}

export function testConcatWithSpreadMixed() {
  const arr = ['Hello', ' ', 42, ' ', true];
  const result = ''.concat(...arr);
  return result;
}

export function testConcatWithNumberInTemplate() {
  const name = 'Alice';
  const age = 25;
  const result = 'Name: '.concat(name, ', Age: ', age);
  return result;
}
