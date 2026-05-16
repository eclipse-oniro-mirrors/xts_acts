/*
 * Copyright (c) 2026 RKH Corp.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

export function builtinsArrayFillArrayLikeObject0600() {
  const arrayLike = {
    length: 3,
    0: 1,
    1: 2,
    2: 3
  };

  const result = Array.prototype.fill.call(arrayLike, 0);

  return result.length === 3 &&
         result[0] === 0 &&
         result[1] === 0 &&
         result[2] === 0 &&
         arrayLike === result;
}

export function builtinsArrayFillArrayLikeWithStart0601() {
  const arrayLike = {
    length: 4,
    0: 1,
    1: 2,
    2: 3,
    3: 4
  };

  const result = Array.prototype.fill.call(arrayLike, 9, 2);

  return result.length === 4 &&
         result[0] === 1 &&
         result[1] === 2 &&
         result[2] === 9 &&
         result[3] === 9;
}

export function builtinsArrayFillArrayLikeWithRange0602() {
  const arrayLike = {
    length: 5,
    0: 1,
    1: 2,
    2: 3,
    3: 4,
    4: 5
  };

  const result = Array.prototype.fill.call(arrayLike, 5, 1, 4);

  return result.length === 5 &&
         result[0] === 1 &&
         result[1] === 5 &&
         result[2] === 5 &&
         result[3] === 5 &&
         result[4] === 5;
}

export function builtinsArrayFillString0603() {
  const str = 'hello';
  try {
    Array.prototype.fill.call(str, 'a');
  } catch (e) {
  }
  return str === 'hello';
}

export function builtinsArrayFillWithNegativeStart0604() {
  const arr = [1, 2, 3, 4, 5];
  const result = Array.prototype.fill.call(arr, 0, -3);
  return result.length === 5 &&
         result[0] === 1 &&
         result[1] === 2 &&
         result[2] === 0 &&
         result[3] === 0 &&
         result[4] === 0;
}

export function builtinsArrayFillWithNegativeEnd0605() {
  const arr = [1, 2, 3, 4, 5];
  const result = Array.prototype.fill.call(arr, 0, 1, -1);
  return result.length === 5 &&
         result[0] === 1 &&
         result[1] === 0 &&
         result[2] === 0 &&
         result[3] === 0 &&
         result[4] === 5;
}

export function builtinsArrayFillWithInfinity0606() {
  const arr = [1, 2, 3];
  const result = Array.prototype.fill.call(arr, 0, Infinity, -Infinity);
  return result.length === 3 &&
         result[0] === 1 &&
         result[1] === 2 &&
         result[2] === 3;
}

export function builtinsArrayFillWithNaN0607() {
    const arr = [1, 2, 3];
    const result = Array.prototype.fill.call(arr, 0, NaN, NaN);

    return result.length === 3 &&
        result[0] === 1 &&
        result[1] === 2 &&
        result[2] === 3;
}

export function builtinsArrayFillWithUndefinedValue0608() {
  const arr = [1, 2, 3];
  const result = Array.prototype.fill.call(arr, undefined);
  return result.length === 3 &&
         result[0] === undefined &&
         result[1] === undefined &&
         result[2] === undefined;
}

export function builtinsArrayFillWithNullValue0609() {
  const arr = [1, 2, 3];
  const result = Array.prototype.fill.call(arr, null);
  return result.length === 3 &&
         result[0] === null &&
         result[1] === null &&
         result[2] === null;
}

export function builtinsArrayFillWithObjectValue0610() {
  const arr = [1, 2, 3];
  const obj = { value: 'test' };
  const result = Array.prototype.fill.call(arr, obj);
  return result.length === 3 &&
         result[0] === obj &&
         result[1] === obj &&
         result[2] === obj;
}

export function builtinsArrayFillWithFunctionValue0611() {
  const arr = [1, 2, 3];
  const func = () => 'test';
  const result = Array.prototype.fill.call(arr, func);
  return result.length === 3 &&
         result[0] === func &&
         result[1] === func &&
         result[2] === func;
}

export function builtinsArrayFillWithBigIntValue0612() {
  const arr = [1, 2, 3];
  const result = Array.prototype.fill.call(arr, 1n);
  return result.length === 3 &&
         result[0] === 1n &&
         result[1] === 1n &&
         result[2] === 1n;
}

export function builtinsArrayFillWithSymbolValue0613() {
  const arr = [1, 2, 3];
  const sym = Symbol('test');
  const result = Array.prototype.fill.call(arr, sym);
  return result.length === 3 &&
         result[0] === sym &&
         result[1] === sym &&
         result[2] === sym;
}

export function builtinsArrayFillWithDateValue0614() {
  const arr = [1, 2, 3];
  const date = new Date();
  const result = Array.prototype.fill.call(arr, date);
  return result.length === 3 &&
         result[0] === date &&
         result[1] === date &&
         result[2] === date;
}

export function builtinsArrayFillWithMapValue0615() {
  const arr = [1, 2, 3];
  const map = new Map();
  map.set('key', 'value');
  const result = Array.prototype.fill.call(arr, map);
  return result.length === 3 &&
         result[0] === map &&
         result[1] === map &&
         result[2] === map;
}

export function builtinsArrayFillWithSetValue0616() {
  const arr = [1, 2, 3];
  const set = new Set();
  set.add('value');
  const result = Array.prototype.fill.call(arr, set);
  return result.length === 3 &&
         result[0] === set &&
         result[1] === set &&
         result[2] === set;
}

export function builtinsArrayFillWithRegExpValue0617() {
  const arr = [1, 2, 3];
  const regex = /test/;
  const result = Array.prototype.fill.call(arr, regex);
  return result.length === 3 &&
         result[0] === regex &&
         result[1] === regex &&
         result[2] === regex;
}

export function builtinsArrayFillWithArrayValue0618() {
  const arr = [1, 2, 3];
  const innerArr = [4, 5, 6];
  const result = Array.prototype.fill.call(arr, innerArr);
  return result.length === 3 &&
         result[0] === innerArr &&
         result[1] === innerArr &&
         result[2] === innerArr;
}

export function builtinsArrayFillWithTypedArray0619() {
  const arr = [1, 2, 3];
  const typedArr = new Int8Array([4, 5, 6]);
  const result = Array.prototype.fill.call(arr, typedArr);
  return result.length === 3 &&
         result[0] === typedArr &&
         result[1] === typedArr &&
         result[2] === typedArr;
}

export function builtinsArrayFillWithGenerator0620() {
  const arr = [1, 2, 3];
  function* gen() { yield 1; }
  const generator = gen();
  const result = Array.prototype.fill.call(arr, generator);
  return result.length === 3 &&
         result[0] === generator &&
         result[1] === generator &&
         result[2] === generator;
}

export function builtinsArrayFillWithPromise0621() {
  const arr = [1, 2, 3];
  const promise = Promise.resolve('test');
  const result = Array.prototype.fill.call(arr, promise);
  return result.length === 3 &&
         result[0] === promise &&
         result[1] === promise &&
         result[2] === promise;
}

export function builtinsArrayFillWithError0622() {
  const arr = [1, 2, 3];
  const error = new Error('test');
  const result = Array.prototype.fill.call(arr, error);
  return result.length === 3 &&
         result[0] === error &&
         result[1] === error &&
         result[2] === error;
}

export function builtinsArrayFillWithBooleanValue0623() {
  const arr = [1, 2, 3];
  const result = Array.prototype.fill.call(arr, true);
  return result.length === 3 &&
         result[0] === true &&
         result[1] === true &&
         result[2] === true;
}

export function builtinsArrayFillWithFloatValue0624() {
  const arr = [1, 2, 3];
  const result = Array.prototype.fill.call(arr, 3.14);
  return result.length === 3 &&
         result[0] === 3.14 &&
         result[1] === 3.14 &&
         result[2] === 3.14;
}

export function builtinsArrayFillWithNegativeValue0625() {
  const arr = [1, 2, 3];
  const result = Array.prototype.fill.call(arr, -1);
  return result.length === 3 &&
         result[0] === -1 &&
         result[1] === -1 &&
         result[2] === -1;
}

export function builtinsArrayFillWithZeroValue0626() {
  const arr = [1, 2, 3];
  const result = Array.prototype.fill.call(arr, 0);
  return result.length === 3 &&
         result[0] === 0 &&
         result[1] === 0 &&
         result[2] === 0;
}

export function builtinsArrayFillWithEmptyString0627() {
  const arr = [1, 2, 3];
  const result = Array.prototype.fill.call(arr, '');
  return result.length === 3 &&
         result[0] === '' &&
         result[1] === '' &&
         result[2] === '';
}

export function builtinsArrayFillWithLongString0628() {
  const arr = [1, 2, 3];
  const longStr = 'a'.repeat(1000);
  const result = Array.prototype.fill.call(arr, longStr);
  return result.length === 3 &&
         result[0] === longStr &&
         result[1] === longStr &&
         result[2] === longStr;
}

export function builtinsArrayFillWithMixedArrayLike0629() {
  const arrayLike = {
    length: 3,
    0: 1,
    1: 'string',
    2: true
  };
  const result = Array.prototype.fill.call(arrayLike, 'test');
  return result.length === 3 &&
         result[0] === 'test' &&
         result[1] === 'test' &&
         result[2] === 'test' &&
         arrayLike === result;
}

export function builtinsArrayFillWithLargeArrayLike0630() {
  const arrayLike = {};
  arrayLike.length = 1000;
  for (let i = 0; i < 1000; i++) {
    arrayLike[i] = i;
  }
  const result = Array.prototype.fill.call(arrayLike, 0);
  let allZero = true;
  for (let i = 0; i < 1000; i++) {
    if (result[i] !== 0) {
      allZero = false;
      break;
    }
  }
  return result.length === 1000 && allZero && arrayLike === result;
}

export function builtinsArrayFillWithTypedArray0631() {
  const typedArray = new Int32Array([1, 2, 3, 4, 5]);
  const result = Array.prototype.fill.call(typedArray, 0);
  let allZero = true;
  for (let i = 0; i < typedArray.length; i++) {
    if (result[i] !== 0) {
      allZero = false;
      break;
    }
  }
  return allZero && typedArray === result;
}

export function builtinsArrayFillWithArguments0632() {
  function testArgs() {
    return Array.prototype.fill.call(arguments, 0);
  }
  const result = testArgs(1, 2, 3, 4, 5);
  let allZero = true;
  for (let i = 0; i < result.length; i++) {
    if (result[i] !== 0) {
      allZero = false;
      break;
    }
  }
  return result.length === 5 && allZero;
}

export function builtinsArrayFillWithSet0633() {
  const set = new Set([1, 2, 3, 4, 5]);
  const arrayLike = { length: 5, 0: 1, 1: 2, 2: 3, 3: 4, 4: 5 };
  const result = Array.prototype.fill.call(arrayLike, 0);
  let allZero = true;
  for (let i = 0; i < 5; i++) {
    if (result[i] !== 0) {
      allZero = false;
      break;
    }
  }
  return result.length === 5 && allZero && arrayLike === result;
}

export function builtinsArrayFillWithMap0634() {
  const map = new Map([['a', 1], ['b', 2], ['c', 3], ['d', 4], ['e', 5]]);
  const arrayLike = { length: 5, 0: 1, 1: 2, 2: 3, 3: 4, 4: 5 };
  const result = Array.prototype.fill.call(arrayLike, 0);
  let allZero = true;
  for (let i = 0; i < 5; i++) {
    if (result[i] !== 0) {
      allZero = false;
      break;
    }
  }
  return result.length === 5 && allZero && arrayLike === result;
}

export function builtinsArrayFillWithWeakSet0635() {
  const weakSet = new WeakSet();
  const obj1 = { value: 1 };
  const obj2 = { value: 2 };
  const obj3 = { value: 3 };
  weakSet.add(obj1);
  weakSet.add(obj2);
  weakSet.add(obj3);
  const arrayLike = { length: 3, 0: obj1, 1: obj2, 2: obj3 };
  const newObj = { value: 0 };
  const result = Array.prototype.fill.call(arrayLike, newObj);
  return result.length === 3 && result[0] === newObj && result[1] === newObj && result[2] === newObj && arrayLike === result;
}

export function builtinsArrayFillWithWeakMap0636() {
  const weakMap = new WeakMap();
  const obj1 = { value: 1 };
  const obj2 = { value: 2 };
  const obj3 = { value: 3 };
  weakMap.set(obj1, 1);
  weakMap.set(obj2, 2);
  weakMap.set(obj3, 3);
  const arrayLike = { length: 3, 0: obj1, 1: obj2, 2: obj3 };
  const newObj = { value: 0 };
  const result = Array.prototype.fill.call(arrayLike, newObj);
  return result.length === 3 && result[0] === newObj && result[1] === newObj && result[2] === newObj && arrayLike === result;
}

export function builtinsArrayFillWithBigInt0637() {
  const arrayLike = { length: 5, 0: 1n, 1: 2n, 2: 3n, 3: 4n, 4: 5n };
  const result = Array.prototype.fill.call(arrayLike, 0n);
  let allZero = true;
  for (let i = 0; i < 5; i++) {
    if (result[i] !== 0n) {
      allZero = false;
      break;
    }
  }
  return result.length === 5 && allZero && arrayLike === result;
}

export function builtinsArrayFillWithSymbol0638() {
  const sym1 = Symbol('1');
  const sym2 = Symbol('2');
  const sym3 = Symbol('3');
  const arrayLike = { length: 3, 0: sym1, 1: sym2, 2: sym3 };
  const newSym = Symbol('0');
  const result = Array.prototype.fill.call(arrayLike, newSym);
  return result.length === 3 && result[0] === newSym && result[1] === newSym && result[2] === newSym && arrayLike === result;
}

export function builtinsArrayFillWithDate0639() {
  const date1 = new Date();
  const date2 = new Date();
  const date3 = new Date();
  const arrayLike = { length: 3, 0: date1, 1: date2, 2: date3 };
  const newDate = new Date();
  const result = Array.prototype.fill.call(arrayLike, newDate);
  return result.length === 3 && result[0] === newDate && result[1] === newDate && result[2] === newDate && arrayLike === result;
}

export function builtinsArrayFillWithRegExp0640() {
  const regex1 = /test/;
  const regex2 = /test/i;
  const regex3 = /test/g;
  const arrayLike = { length: 3, 0: regex1, 1: regex2, 2: regex3 };
  const newRegex = /new/;
  const result = Array.prototype.fill.call(arrayLike, newRegex);
  return result.length === 3 && result[0] === newRegex && result[1] === newRegex && result[2] === newRegex && arrayLike === result;
}

export function builtinsArrayFillWithError0641() {
  const error1 = new Error('Error 1');
  const error2 = new TypeError('Type Error');
  const error3 = new SyntaxError('Syntax Error');
  const arrayLike = { length: 3, 0: error1, 1: error2, 2: error3 };
  const newError = new Error('New Error');
  const result = Array.prototype.fill.call(arrayLike, newError);
  return result.length === 3 && result[0] === newError && result[1] === newError && result[2] === newError && arrayLike === result;
}

export function builtinsArrayFillWithPromise0642() {
  const promise1 = Promise.resolve('success');
  const promise2 = Promise.reject('error');
  const promise3 = new Promise(resolve => setTimeout(resolve, 100));
  const arrayLike = { length: 3, 0: promise1, 1: promise2, 2: promise3 };
  const newPromise = Promise.resolve('new');
  const result = Array.prototype.fill.call(arrayLike, newPromise);
  return result.length === 3 && result[0] === newPromise && result[1] === newPromise && result[2] === newPromise && arrayLike === result;
}

export function builtinsArrayFillWithGenerator0643() {
  function* gen1() { yield 1; }
  function* gen2() { yield 2; yield 3; }
  function* gen3() { yield 4; yield 5; yield 6; }
  const arrayLike = { length: 3, 0: gen1(), 1: gen2(), 2: gen3() };
  function* newGen() { yield 0; }
  const newGenerator = newGen();
  const result = Array.prototype.fill.call(arrayLike, newGenerator);
  return result.length === 3 && result[0] === newGenerator && result[1] === newGenerator && result[2] === newGenerator && arrayLike === result;
}

export function builtinsArrayFillWithAsyncGenerator0644() {
  async function* asyncGen1() { yield 1; }
  async function* asyncGen2() { yield 2; yield 3; }
  const arrayLike = { length: 2, 0: asyncGen1(), 1: asyncGen2() };
  async function* newAsyncGen() { yield 0; }
  const newAsyncGenerator = newAsyncGen();
  const result = Array.prototype.fill.call(arrayLike, newAsyncGenerator);
  return result.length === 2 && result[0] === newAsyncGenerator && result[1] === newAsyncGenerator && arrayLike === result;
}

export function builtinsArrayFillWithProxy0645() {
  const target = { length: 5, 0: 1, 1: 2, 2: 3, 3: 4, 4: 5 };
  const proxy = new Proxy(target, {});
  const result = Array.prototype.fill.call(proxy, 0);
  let allZero = true;
  for (let i = 0; i < 5; i++) {
    if (result[i] !== 0) {
      allZero = false;
      break;
    }
  }
  return result.length === 5 && allZero && proxy === result;
}

export function builtinsArrayFillWithReflect0646() {
  const arrayLike = { length: 5, 0: 1, 1: 2, 2: 3, 3: 4, 4: 5 };
  const result = Reflect.apply(Array.prototype.fill, arrayLike, [0]);
  let allZero = true;
  for (let i = 0; i < 5; i++) {
    if (result[i] !== 0) {
      allZero = false;
      break;
    }
  }
  return result.length === 5 && allZero && arrayLike === result;
}

export function builtinsArrayFillWithMath0647() {
  const arrayLike = { length: 5, 0: 1, 1: 2, 2: 3, 3: 4, 4: 5 };
  const result = Array.prototype.fill.call(arrayLike, Math.PI);
  let allPi = true;
  for (let i = 0; i < 5; i++) {
    if (result[i] !== Math.PI) {
      allPi = false;
      break;
    }
  }
  return result.length === 5 && allPi && arrayLike === result;
}

export function builtinsArrayFillWithJSON0648() {
  const arrayLike = { length: 3, 0: 1, 1: 2, 2: 3 };
  const obj = { value: 0 };
  const result = Array.prototype.fill.call(arrayLike, obj);
  return result.length === 3 && JSON.stringify(result[0]) === JSON.stringify(obj) && arrayLike === result;
}

export function builtinsArrayFillWithconsole0649() {
  const arrayLike = { length: 2, 0: 1, 1: 2 };
  const result = Array.prototype.fill.call(arrayLike, console);
  return result.length === 2 && result[0] === console && result[1] === console && arrayLike === result;
}

export function builtinsArrayFillWithglobal0650() {
  const arrayLike = { length: 2, 0: 1, 1: 2 };
  const result = Array.prototype.fill.call(arrayLike, globalThis);
  return result.length === 2 && result[0] === globalThis && result[1] === globalThis && arrayLike === result;
}

export function builtinsArrayFillWiththisArgUndefined0651() {
  const arrayLike = { length: 3, 0: 1, 1: 2, 2: 3 };
  let thisValue;
  const result = Array.prototype.fill.call(arrayLike, 0, 0, 3);
  return result.length === 3 && arrayLike === result;
}

export function builtinsArrayFillWiththisArgNull0652() {
  const arrayLike = { length: 3, 0: 1, 1: 2, 2: 3 };
  const result = Array.prototype.fill.call(arrayLike, 0, 0, 3);
  return result.length === 3 && arrayLike === result;
}

export function builtinsArrayFillWiththisArgNumber0653() {
  const arrayLike = { length: 3, 0: 1, 1: 2, 2: 3 };
  const result = Array.prototype.fill.call(arrayLike, 0, 0, 3);
  return result.length === 3 && arrayLike === result;
}

export function builtinsArrayFillWiththisArgString0654() {
  const arrayLike = { length: 3, 0: 1, 1: 2, 2: 3 };
  const result = Array.prototype.fill.call(arrayLike, 0, 0, 3);
  return result.length === 3 && arrayLike === result;
}

export function builtinsArrayFillWiththisArgBoolean0655() {
  const arrayLike = { length: 3, 0: 1, 1: 2, 2: 3 };
  const result = Array.prototype.fill.call(arrayLike, 0, 0, 3);
  return result.length === 3 && arrayLike === result;
}

export function builtinsArrayFillWiththisArgBigInt0656() {
  const arrayLike = { length: 3, 0: 1n, 1: 2n, 2: 3n };
  const result = Array.prototype.fill.call(arrayLike, 0n, 0, 3);
  return result.length === 3 && arrayLike === result;
}

export function builtinsArrayFillWiththisArgSymbol0657() {
  const sym1 = Symbol('1');
  const sym2 = Symbol('2');
  const sym3 = Symbol('3');
  const arrayLike = { length: 3, 0: sym1, 1: sym2, 2: sym3 };
  const newSym = Symbol('0');
  const result = Array.prototype.fill.call(arrayLike, newSym, 0, 3);
  return result.length === 3 && arrayLike === result;
}

export function builtinsArrayFillWiththisArgDate0658() {
  const date1 = new Date();
  const date2 = new Date();
  const date3 = new Date();
  const arrayLike = { length: 3, 0: date1, 1: date2, 2: date3 };
  const newDate = new Date();
  const result = Array.prototype.fill.call(arrayLike, newDate, 0, 3);
  return result.length === 3 && arrayLike === result;
}

export function builtinsArrayFillWiththisArgRegExp0659() {
  const regex1 = /test/;
  const regex2 = /test/i;
  const regex3 = /test/g;
  const arrayLike = { length: 3, 0: regex1, 1: regex2, 2: regex3 };
  const newRegex = /new/;
  const result = Array.prototype.fill.call(arrayLike, newRegex, 0, 3);
  return result.length === 3 && arrayLike === result;
}

export function builtinsArrayFillWiththisArgArray0660() {
  const arrayLike = { length: 3, 0: 1, 1: 2, 2: 3 };
  const result = Array.prototype.fill.call(arrayLike, 0, 0, 3);
  return result.length === 3 && arrayLike === result;
}

export function builtinsArrayFillWiththisArgFunction0661() {
  const arrayLike = { length: 3, 0: 1, 1: 2, 2: 3 };
  const func = function() { return 0; };
  const result = Array.prototype.fill.call(arrayLike, func, 0, 3);
  return result.length === 3 && result[0] === func && result[1] === func && result[2] === func && arrayLike === result;
}

export function builtinsArrayFillWiththisArgSet0662() {
  const arrayLike = { length: 3, 0: 1, 1: 2, 2: 3 };
  const set = new Set();
  const result = Array.prototype.fill.call(arrayLike, set, 0, 3);
  return result.length === 3 && result[0] === set && result[1] === set && result[2] === set && arrayLike === result;
}

export function builtinsArrayFillWiththisArgMap0663() {
  const arrayLike = { length: 3, 0: 1, 1: 2, 2: 3 };
  const map = new Map();
  const result = Array.prototype.fill.call(arrayLike, map, 0, 3);
  return result.length === 3 && result[0] === map && result[1] === map && result[2] === map && arrayLike === result;
}

export function builtinsArrayFillWiththisArgError0664() {
  const arrayLike = { length: 3, 0: 1, 1: 2, 2: 3 };
  const error = new Error('test');
  const result = Array.prototype.fill.call(arrayLike, error, 0, 3);
  return result.length === 3 && result[0] === error && result[1] === error && result[2] === error && arrayLike === result;
}

export function builtinsArrayFillWiththisArgPromise0665() {
  const arrayLike = { length: 3, 0: 1, 1: 2, 2: 3 };
  const promise = Promise.resolve('test');
  const result = Array.prototype.fill.call(arrayLike, promise, 0, 3);
  return result.length === 3 && result[0] === promise && result[1] === promise && result[2] === promise && arrayLike === result;
}

export function builtinsArrayFillWiththisArgGenerator0666() {
  const arrayLike = { length: 3, 0: 1, 1: 2, 2: 3 };
  function* gen() { yield 0; }
  const generator = gen();
  const result = Array.prototype.fill.call(arrayLike, generator, 0, 3);
  return result.length === 3 && result[0] === generator && result[1] === generator && result[2] === generator && arrayLike === result;
}

export function builtinsArrayFillWiththisArgProxy0667() {
  const arrayLike = { length: 3, 0: 1, 1: 2, 2: 3 };
  const proxy = new Proxy({ value: 0 }, {});
  const result = Array.prototype.fill.call(arrayLike, proxy, 0, 3);
  return result.length === 3 && result[0] === proxy && result[1] === proxy && result[2] === proxy && arrayLike === result;
}

export function builtinsArrayFillWithComplexObject0668() {
  const complexObj = { name: 'test', value: 42, nested: { deep: true } };
  const arrayLike = { length: 3, 0: 1, 1: 2, 2: 3 };
  const result = Array.prototype.fill.call(arrayLike, complexObj, 0, 3);
  return result.length === 3 && result[0] === complexObj && result[1] === complexObj && result[2] === complexObj && arrayLike === result;
}

export function builtinsArrayFillWithNestedArray0669() {
  const nestedArray = [1, [2, 3], 4];
  const arrayLike = { length: 3, 0: 1, 1: 2, 2: 3 };
  const result = Array.prototype.fill.call(arrayLike, nestedArray, 0, 3);
  return result.length === 3 && result[0] === nestedArray && result[1] === nestedArray && result[2] === nestedArray && arrayLike === result;
}

export function builtinsArrayFillWithCircularReference0670() {
  const obj = { value: 1 };
  obj.self = obj;
  const arrayLike = { length: 3, 0: 1, 1: 2, 2: 3 };
  const result = Array.prototype.fill.call(arrayLike, obj, 0, 3);
  return result.length === 3 && result[0] === obj && result[0].self === obj && arrayLike === result;
}

export function builtinsArrayFillWithTypedArrayViews0671() {
  const int8Array = new Int8Array([1, 2, 3]);
  const arrayLike = { length: 3, 0: 1, 1: 2, 2: 3 };
  const result = Array.prototype.fill.call(arrayLike, int8Array, 0, 3);
  return result.length === 3 && result[0] === int8Array && result[1] === int8Array && result[2] === int8Array && arrayLike === result;
}

export function builtinsArrayFillWithStringObjects0672() {
  const stringObj = new String('test');
  const arrayLike = { length: 3, 0: 1, 1: 2, 2: 3 };
  const result = Array.prototype.fill.call(arrayLike, stringObj, 0, 3);
  return result.length === 3 && result[0] === stringObj && result[1] === stringObj && result[2] === stringObj && arrayLike === result;
}

export function builtinsArrayFillWithNumberObjects0673() {
  const numberObj = new Number(42);
  const arrayLike = { length: 3, 0: 1, 1: 2, 2: 3 };
  const result = Array.prototype.fill.call(arrayLike, numberObj, 0, 3);
  return result.length === 3 && result[0] === numberObj && result[1] === numberObj && result[2] === numberObj && arrayLike === result;
}

export function builtinsArrayFillWithBooleanObjects0674() {
  const booleanObj = new Boolean(true);
  const arrayLike = { length: 3, 0: 1, 1: 2, 2: 3 };
  const result = Array.prototype.fill.call(arrayLike, booleanObj, 0, 3);
  return result.length === 3 && result[0] === booleanObj && result[1] === booleanObj && result[2] === booleanObj && arrayLike === result;
}

export function builtinsArrayFillWithNullPrototype0675() {
  const nullProtoObj = Object.create(null);
  nullProtoObj.value = 'test';
  const arrayLike = { length: 3, 0: 1, 1: 2, 2: 3 };
  const result = Array.prototype.fill.call(arrayLike, nullProtoObj, 0, 3);
  return result.length === 3 && result[0] === nullProtoObj && result[1] === nullProtoObj && result[2] === nullProtoObj && arrayLike === result;
}

export function builtinsArrayFillWithCustomIterator0676() {
  const iterable = {
    *[Symbol.iterator]() {
      yield 1;
      yield 2;
      yield 3;
    }
  };
  const arrayLike = { length: 3, 0: 1, 1: 2, 2: 3 };
  const result = Array.prototype.fill.call(arrayLike, iterable, 0, 3);
  return result.length === 3 && result[0] === iterable && result[1] === iterable && result[2] === iterable && arrayLike === result;
}

export function builtinsArrayFillWithSymbolIterator0677() {
  const arrayLike = { length: 3, 0: 1, 1: 2, 2: 3 };
  const result = Array.prototype.fill.call(arrayLike, Symbol.iterator, 0, 3);
  return result.length === 3 && typeof result[0] === 'symbol' && result[0] === Symbol.iterator && arrayLike === result;
}

export function builtinsArrayFillWithArrayBuffer0678() {
  const buffer = new ArrayBuffer(8);
  const arrayLike = { length: 3, 0: 1, 1: 2, 2: 3 };
  const result = Array.prototype.fill.call(arrayLike, buffer, 0, 3);
  return result.length === 3 && result[0] === buffer && result[1] === buffer && result[2] === buffer && arrayLike === result;
}

export function builtinsArrayFillWithSharedArrayBuffer0679() {
  const buffer = new SharedArrayBuffer(8);
  const arrayLike = { length: 3, 0: 1, 1: 2, 2: 3 };
  const result = Array.prototype.fill.call(arrayLike, buffer, 0, 3);
  return result.length === 3 && result[0] === buffer && result[1] === buffer && result[2] === buffer && arrayLike === result;
}

export function builtinsArrayFillWithDataView0680() {
  const buffer = new ArrayBuffer(8);
  const view = new DataView(buffer);
  const arrayLike = { length: 3, 0: 1, 1: 2, 2: 3 };
  const result = Array.prototype.fill.call(arrayLike, view, 0, 3);
  return result.length === 3 && result[0] === view && result[1] === view && result[2] === view && arrayLike === result;
}

export function builtinsArrayFillWithInt8Array0681() {
  const int8Array = new Int8Array([1, 2, 3]);
  const arrayLike = { length: 3, 0: 1, 1: 2, 2: 3 };
  const result = Array.prototype.fill.call(arrayLike, int8Array, 0, 3);
  return result.length === 3 && result[0] === int8Array && result[1] === int8Array && result[2] === int8Array && arrayLike === result;
}

export function builtinsArrayFillWithUint8Array0682() {
  const uint8Array = new Uint8Array([1, 2, 3]);
  const arrayLike = { length: 3, 0: 1, 1: 2, 2: 3 };
  const result = Array.prototype.fill.call(arrayLike, uint8Array, 0, 3);
  return result.length === 3 && result[0] === uint8Array && result[1] === uint8Array && result[2] === uint8Array && arrayLike === result;
}

export function builtinsArrayFillWithUint8ClampedArray0683() {
  const uint8ClampedArray = new Uint8ClampedArray([1, 2, 3]);
  const arrayLike = { length: 3, 0: 1, 1: 2, 2: 3 };
  const result = Array.prototype.fill.call(arrayLike, uint8ClampedArray, 0, 3);
  return result.length === 3 && result[0] === uint8ClampedArray && result[1] === uint8ClampedArray && result[2] === uint8ClampedArray && arrayLike === result;
}

export function builtinsArrayFillWithInt16Array0684() {
  const int16Array = new Int16Array([1, 2, 3]);
  const arrayLike = { length: 3, 0: 1, 1: 2, 2: 3 };
  const result = Array.prototype.fill.call(arrayLike, int16Array, 0, 3);
  return result.length === 3 && result[0] === int16Array && result[1] === int16Array && result[2] === int16Array && arrayLike === result;
}

export function builtinsArrayFillWithUint16Array0685() {
  const uint16Array = new Uint16Array([1, 2, 3]);
  const arrayLike = { length: 3, 0: 1, 1: 2, 2: 3 };
  const result = Array.prototype.fill.call(arrayLike, uint16Array, 0, 3);
  return result.length === 3 && result[0] === uint16Array && result[1] === uint16Array && result[2] === uint16Array && arrayLike === result;
}

export function builtinsArrayFillWithInt32Array0686() {
  const int32Array = new Int32Array([1, 2, 3]);
  const arrayLike = { length: 3, 0: 1, 1: 2, 2: 3 };
  const result = Array.prototype.fill.call(arrayLike, int32Array, 0, 3);
  return result.length === 3 && result[0] === int32Array && result[1] === int32Array && result[2] === int32Array && arrayLike === result;
}

export function builtinsArrayFillWithUint32Array0687() {
  const uint32Array = new Uint32Array([1, 2, 3]);
  const arrayLike = { length: 3, 0: 1, 1: 2, 2: 3 };
  const result = Array.prototype.fill.call(arrayLike, uint32Array, 0, 3);
  return result.length === 3 && result[0] === uint32Array && result[1] === uint32Array && result[2] === uint32Array && arrayLike === result;
}

export function builtinsArrayFillWithFloat32Array0688() {
  const float32Array = new Float32Array([1, 2, 3]);
  const arrayLike = { length: 3, 0: 1, 1: 2, 2: 3 };
  const result = Array.prototype.fill.call(arrayLike, float32Array, 0, 3);
  return result.length === 3 && result[0] === float32Array && result[1] === float32Array && result[2] === float32Array && arrayLike === result;
}

export function builtinsArrayFillWithFloat64Array0689() {
  const float64Array = new Float64Array([1, 2, 3]);
  const arrayLike = { length: 3, 0: 1, 1: 2, 2: 3 };
  const result = Array.prototype.fill.call(arrayLike, float64Array, 0, 3);
  return result.length === 3 && result[0] === float64Array && result[1] === float64Array && result[2] === float64Array && arrayLike === result;
}

export function builtinsArrayFillWithBigInt64Array0690() {
  const bigInt64Array = new BigInt64Array([1n, 2n, 3n]);
  const arrayLike = { length: 3, 0: 1, 1: 2, 2: 3 };
  const result = Array.prototype.fill.call(arrayLike, bigInt64Array, 0, 3);
  return result.length === 3 && result[0] === bigInt64Array && result[1] === bigInt64Array && result[2] === bigInt64Array && arrayLike === result;
}

export function builtinsArrayFillWithBigUint64Array0691() {
  const bigUint64Array = new BigUint64Array([1n, 2n, 3n]);
  const arrayLike = { length: 3, 0: 1, 1: 2, 2: 3 };
  const result = Array.prototype.fill.call(arrayLike, bigUint64Array, 0, 3);
  return result.length === 3 && result[0] === bigUint64Array && result[1] === bigUint64Array && result[2] === bigUint64Array && arrayLike === result;
}

export function builtinsArrayFillWithArrowFunctionThisBinding0692() {
    const arrayLike = { length: 3, 0: 1, 1: 2, 2: 3 };
    const context = { value: 0 };

    const result = Array.prototype.fill.call(arrayLike, context.value);
    return result.length === 3
        && result[0] === 0
        && result[1] === 0
        && result[2] === 0
        && arrayLike === result;
}

export function builtinsArrayFillWithDynamicArrayModification0693() {
    const arrayLike = { length: 3, 0: 1, 1: 2, 2: 3 };
    let modifyCount = 0;

    const result = Array.prototype.fill.call(arrayLike, (() => {
        modifyCount++;
        return 0;
    })());

    return result.length === 3
        && result[0] === 0
        && result[1] === 0
        && result[2] === 0
        && arrayLike === result;
}

export function builtinsArrayFillWithComplexthisArg0694() {
    const arrayLike = { length: 3, 0: 1, 1: 2, 2: 3 };
    const complexContext = {
        value: 0,
        getValue: function() {
            return this.value;
        }
    };

    const fillValue = complexContext.getValue();
    const result = Array.prototype.fill.call(arrayLike, fillValue, 0, 3);

    return result.length === 3
        && result[0] === 0
        && result[1] === 0
        && result[2] === 0
        && arrayLike === result;
}

export function builtinsArrayFillWithGeneratorFunction0695() {
  const arrayLike = { length: 3, 0: 1, 1: 2, 2: 3 };
  function* generator() {
    yield 1;
    yield 2;
    yield 3;
  }
  const gen = generator();
  const result = Array.prototype.fill.call(arrayLike, gen.next().value, 0, 3);
  return result.length === 3 && result[0] === 1 && result[1] === 1 && result[2] === 1 && arrayLike === result;
}

export function builtinsArrayFillWithAsyncFunction0696() {
  const arrayLike = { length: 3, 0: 1, 1: 2, 2: 3 };
  async function asyncFunc() {
    return 42;
  }
  const result = Array.prototype.fill.call(arrayLike, asyncFunc(), 0, 3);
  return result.length === 3 && result[0] instanceof Promise && result[1] instanceof Promise && result[2] instanceof Promise && arrayLike === result;
}

export function builtinsArrayFillWithProxyTrap0697() {
  const arrayLike = {
    length: 3,
    0: 1,
    1: 2,
    2: 3
  };
  const proxy = new Proxy(arrayLike, {
    set: function(target, property, value) {
      if (property !== 'length') {
        target[property] = value * 2;
      } else {
        target[property] = value;
      }
      return true;
    }
  });
  const result = Array.prototype.fill.call(proxy, 5);
  return result.length === 3 && result[0] === 10 && result[1] === 10 && result[2] === 10 && proxy === result;
}

export function builtinsArrayFillWithReflectApply0698() {
  const arrayLike = { length: 3, 0: 1, 1: 2, 2: 3 };
  const result = Reflect.apply(Array.prototype.fill, arrayLike, [99, 0, 3]);
  return result.length === 3 && result[0] === 99 && result[1] === 99 && result[2] === 99 && arrayLike === result;
}

export function builtinsArrayFillWithEval0699() {
  const arrayLike = { length: 3, 0: 1, 1: 2, 2: 3 };
  const result = Array.prototype.fill.call(arrayLike, eval('10 + 20'), 0, 3);
  return result.length === 3 && result[0] === 30 && result[1] === 30 && result[2] === 30 && arrayLike === result;
}

export function builtinsArrayFillWithFunctionCall0700() {
  const arrayLike = { length: 3, 0: 1, 1: 2, 2: 3 };
  function getValue() {
    return 42;
  }
  const result = Array.prototype.fill.call(arrayLike, getValue.call(null), 0, 3);
  return result.length === 3 && result[0] === 42 && result[1] === 42 && result[2] === 42 && arrayLike === result;
}
