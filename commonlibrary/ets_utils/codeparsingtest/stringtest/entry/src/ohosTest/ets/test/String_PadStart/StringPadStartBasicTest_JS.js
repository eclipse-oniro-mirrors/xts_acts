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

export function testNullTarget() {
  const result = 'abc'.padStart(null, '0');
  return { result };
}

export function testNullPad() {
  const result = 'abc'.padStart(7, null);
  return { result };
}

export function testStringTarget() {
  const result = 'abc'.padStart('5', '0');
  return { result };
}

export function testBooleanTarget() {
  const result1 = 'abc'.padStart(true, '0');
  const result2 = 'abc'.padStart(false, '0');
  return { result1, result2 };
}

export function testNumberPad() {
  const result = 'abc'.padStart(6, 123);
  return { result };
}

export function testBooleanPad() {
  const result = 'abc'.padStart(6, true);
  return { result };
}

export function testObjectPad() {
  const obj = { toString: () => 'foo' };
  const result = 'abc'.padStart(10, obj);
  return { result };
}

export function testObjectTarget() {
  const obj = { valueOf: () => 5 };
  const result = 'abc'.padStart(obj, '0');
  return { result };
}

export function testArrayPad() {
  const result = 'abc'.padStart(10, [1, 2]);
  return { result };
}


export function testMaxSafeInteger() {
  try {
    const result = 'abc'.padStart(Number.MAX_SAFE_INTEGER, '0');
    return { thrown: false, result };
  } catch (e) {
    return { thrown: true, errorName: e.name };
  }
}

export function testExceedMaxLength() {
  try {
    const result = 'a'.padStart(Number.MAX_SAFE_INTEGER + 1, 'b');
    return { isRangeError: false, result };
  } catch (e) {
    return { isRangeError: e.name === 'RangeError', errorName: e.name };
  }
}

export function testInfinity() {
  try {
    const result = 'abc'.padStart(Infinity, '0');
    return { isRangeError: false, result };
  } catch (e) {
    return { isRangeError: e.name === 'RangeError', errorName: e.name };
  }
}

export function testMemoryLimit() {
  try {
    const result = 'a'.padStart(1073741824, 'b');
    return { isError: false, result };
  } catch (e) {
    return { isError: true, errorName: e.name };
  }
}


export function testNoParams() {
  const result = 'abc'.padStart();
  return { result };
}

export function testSymbolTarget() {
  try {
    const result = 'abc'.padStart(Symbol('test'));
    return { isTypeError: false, result };
  } catch (e) {
    return { isTypeError: e.name === 'TypeError', errorName: e.name };
  }
}

export function testSymbolPad() {
  try {
    const result = 'abc'.padStart(5, Symbol('test'));
    return { isTypeError: false, result };
  } catch (e) {
    return { isTypeError: e.name === 'TypeError', errorName: e.name };
  }
}

export function testCallOnNumber() {
  const result = String.prototype.padStart.call(123, 6, '0');
  return { result };
}

export function testCallOnNull() {
  try {
    'use strict';
    String.prototype.padStart.call(null, 5, '0');
    return { isTypeError: false };
  } catch (e) {
    return { isTypeError: e.name === 'TypeError', errorName: e.name };
  }
}

export function testCallOnUndef() {
  try {
    'use strict';
    String.prototype.padStart.call(undefined, 5, '0');
    return { isTypeError: false };
  } catch (e) {
    return { isTypeError: e.name === 'TypeError', errorName: e.name };
  }
}

export function testCallOnObject() {
  const result = String.prototype.padStart.call({}, 5, '0');
  return { result };
}

export function testCallOnArray() {
  const result = String.prototype.padStart.call([1, 2, 3], 10, '0');
  return { result };
}

export function testApply() {
  const result = String.prototype.padStart.apply('abc', [6, '0']);
  return { result };
}

export function testCall() {
  const result = String.prototype.padStart.call('abc', 6, '0');
  return { result };
}

export function testBind() {
  const bound = String.prototype.padStart.bind('abc');
  const result = bound(6, '0');
  return { result };
}

export function testEmptyStringTarget() {
  const result = 'test'.padStart('', '0');
  return { result };
}

export function testArrayTarget() {
  const result1 = 'test'.padStart([5], '*');
  const result2 = 'test'.padStart([3], '*');
  return { result1, result2 };
}

export function testObjectValueOf() {
  const obj = { valueOf: () => 5 };
  const result = 'abc'.padStart(obj, '0');
  return { result };
}

export function testObjectToString() {
  const obj = { toString: () => 'foo' };
  const result = 'abc'.padStart(10, obj);
  return { result };
}

export function testNonNumStringTarget() {
  const result = 'hello'.padStart('abc', '0');
  return { result };
}

export function testValueOfThrow() {
  try {
    const obj = { valueOf: () => { throw new Error('test'); } };
    'abc'.padStart(obj, '0');
    return { isError: false };
  } catch (e) {
    return { isError: true, errorName: e.name };
  }
}

export function testToStringThrow() {
  try {
    const obj = { toString: () => { throw new Error('test'); } };
    'abc'.padStart(5, obj);
    return { isError: false };
  } catch (e) {
    return { isError: true, errorName: e.name };
  }
}


