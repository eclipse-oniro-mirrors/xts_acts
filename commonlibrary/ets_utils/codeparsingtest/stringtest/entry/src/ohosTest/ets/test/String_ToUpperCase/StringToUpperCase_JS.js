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

export function testCallWithObject() {
  const obj = {
    toString: function() {
      return 'hello world';
    }
  };
  const result = String.prototype.toUpperCase.call(obj);
  return { result, expected: 'HELLO WORLD' };
}

export function testCallWithBoolean() {
  const bool = true;
  const result = String.prototype.toUpperCase.call(bool);
  return { result, expected: 'TRUE' };
}

export function testCallWithNumber() {
  const num = 123;
  const result = String.prototype.toUpperCase.call(num);
  return { result, expected: '123' };
}

export function testCallWithBigInt() {
  const bigInt = 123n;
  const result = String.prototype.toUpperCase.call(bigInt);
  return { result, expected: '123' };
}

export function testCallWithSymbol() {
  try {
    const sym = Symbol('test');
    const result = String.prototype.toUpperCase.call(sym);
    return { error: false, result, message: 'Should have thrown TypeError' };
  } catch (err) {
    return { error: true, isTypeError: err instanceof TypeError };
  }
}

export function testCallWithNull() {
  try {
    const result = String.prototype.toUpperCase.call(null);
    return { error: false, result, message: 'Should have thrown TypeError' };
  } catch (err) {
    return { error: true, isTypeError: err instanceof TypeError };
  }
}

export function testCallWithUndefined() {
  try {
    const result = String.prototype.toUpperCase.call(undefined);
    return { error: false, result, message: 'Should have thrown TypeError' };
  } catch (err) {
    return { error: true, isTypeError: err instanceof TypeError };
  }
}

export function testApplyMethod() {
  const str = 'hello world';
  const result = String.prototype.toUpperCase.apply(str);
  return { result, expected: 'HELLO WORLD' };
}

export function testBindMethod() {
  const str = 'hello world';
  const toUpper = String.prototype.toUpperCase.bind(str);
  const result = toUpper();
  return { result, expected: 'HELLO WORLD' };
}

export function testReflectApply() {
  const str = 'hello world';
  const result = Reflect.apply(String.prototype.toUpperCase, str, []);
  return { result, expected: 'HELLO WORLD' };
}

export function testNoProtoObject() {
  try {
    const obj = Object.create(null);
    const result = String.prototype.toUpperCase.call(obj);
    return { error: false, result, message: 'Should have thrown TypeError' };
  } catch (err) {
    return { error: true, isTypeError: err instanceof TypeError };
  }
}

export function testModifiedPrototype() {
  const originalToUpper = String.prototype.toUpperCase;
  String.prototype.toUpperCase = function() {
    return 'MODIFIED';
  };
  const str = 'hello world';
  const result = str.toUpperCase();
  String.prototype.toUpperCase = originalToUpper;
  return { result, expected: 'MODIFIED' };
}

export function testGetPrototypeOf() {
  const str = 'hello world';
  const proto = Object.getPrototypeOf(str);
  const result = proto.toUpperCase.call(str);
  return { result, expected: 'HELLO WORLD' };
}
