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

export function testMaxSafeInteger() {
  let str = 'test';
  let thrown = false;
  try {
    let result = str.padEnd(Number.MAX_SAFE_INTEGER, '*');
  } catch (e) {
    thrown = true;
  }
  return { thrown };
}

export function testExceedMaxLength() {
  let str = 'a';
  let isRangeError = false;
  try {
    let result = str.padEnd(0x1FFFFFFFE, 'x');
  } catch (e) {
    isRangeError = e.name === 'RangeError';
  }
  return { isRangeError };
}

export function testSymbolTarget() {
  let str = 'test';
  let isTypeError = false;
  try {
    let result = str.padEnd(Symbol('len'), 'x');
  } catch (e) {
    isTypeError = e.name === 'TypeError';
  }
  return { isTypeError };
}

export function testExceedMaxLen() {
  let str = 'test';
  let isRangeError = false;
  try {
    let result = str.padEnd(2 ** 31, 'x');
  } catch (e) {
    isRangeError = e.name === 'RangeError';
  }
  return { isRangeError };
}

export function testCallOnNull() {
  let isTypeError = false;
  try {
    let result = String.prototype.padEnd.call(null, 10, 'x');
  } catch (e) {
    isTypeError = e.name === 'TypeError';
  }
  return { isTypeError };
}

export function testCallOnUndef() {
  let isTypeError = false;
  try {
    let result = String.prototype.padEnd.call(undefined, 10, 'x');
  } catch (e) {
    isTypeError = e.name === 'TypeError';
  }
  return { isTypeError };
}

export function testNoParams() {
  let str = 'test';
  let result = str.padEnd();
  return { result };
}

export function testCall() {
  let result = String.prototype.padEnd.call('test', 10, 'x');
  return { result };
}

export function testApply() {
  let result = String.prototype.padEnd.apply('test', [10, 'x']);
  return { result };
}

export function testBind() {
  let padEndBind = String.prototype.padEnd.bind('test');
  let result = padEndBind(10, 'x');
  return { result };
}

export function testCallOnNumber() {
  let result = String.prototype.padEnd.call(123, 10, 'x');
  return { result };
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

export function testInfinity() {
  let str = 'test';
  let isRangeError = false;
  try {
    let result = str.padEnd(Infinity, '*');
  } catch (e) {
    isRangeError = e.name === 'RangeError';
  }
  return { isRangeError };
}

export function testSymbolPad() {
  let str = 'hello';
  let isTypeError = false;
  try {
    let result = str.padEnd(10, Symbol('test'));
  } catch (e) {
    isTypeError = e.name === 'TypeError';
  }
  return { isTypeError };
}

export function testEmptyString() {
  let str = 'test';
  let result = str.padEnd('', '*');
  return { result };
}

export function testNullTarget() {
  let str = 'hello';
  let result = str.padEnd(null, '*');
  return { result };
}

export function testUndefinedTarget() {
  let str = 'test';
  let result = str.padEnd(undefined, '*');
  return { result };
}

export function testNumberPad() {
  let str = 'test';
  let result = str.padEnd(10, 123);
  return { result };
}

export function testNullPad() {
  let str = 'abc';
  let result = str.padEnd(12, null);
  return { result };
}

export function testBoolPad() {
  let str = 'test';
  let result1 = str.padEnd(12, true);
  let result2 = str.padEnd(14, false);
  return { result1, result2 };
}

export function testArrayPad() {
  let str = 'test';
  let result = str.padEnd(15, [1, 2]);
  return { result };
}

export function testObjectValueOf() {
  let str = 'abc';
  let obj = {
    valueOf: function() {
      return 10;
    }
  };
  let result = str.padEnd(obj, 'x');
  return { result, length: result.length };
}

export function testArrayTarget() {
  let str = 'test';
  let result1 = str.padEnd([5], '*');
  let result2 = str.padEnd([5, 6], '*');
  return { result1, result2 };
}

export function testBooleanTarget() {
  let str = 'abc';
  let result1 = str.padEnd(true, '*');
  let result2 = str.padEnd(false, '*');
  return { result1, result2 };
}

export function testObjectPad() {
  let str = 'abc';
  let obj = {
    toString: function() {
      return 'xyz';
    }
  };
  let result = str.padEnd(10, obj);
  return { result };
}

export function testNonNumString() {
  let str = 'hello';
  let result = str.padEnd('abc', '*');
  return { result };
}

export function testObjectPad2() {
  let str = 'test';
  let obj = {
    toString: function() {
      return 'custom';
    }
  };
  let result = str.padEnd(15, obj);
  return { result };
}

export function testHasOwnProperty() {
  let str = 'test';
  let hasOwnOnProto = String.prototype.hasOwnProperty('padEnd');
  return { hasOwnOnProto };
}

export function testFrozenObj() {
  let strObj = Object.freeze(new String('test'));
  let result = strObj.padEnd(10, 'x');
  return { result };
}

export function testSealedObj() {
  let strObj = Object.seal(new String('test'));
  let result = strObj.padEnd(10, 'x');
  return { result };
}
