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

export function builtinsArrayFilterModifyDuringIteration0200() {
  const arr = [1, 2, 3, 4, 5];
  const filtered = [];

  const result = arr.filter((num, index, array) => {
    if (index === 1) {
      array.push(6);
      array[0] = 10;
    }
    filtered.push(num);
    return num > 2;
  });

  return filtered.length === 5 &&
    filtered[0] === 1 &&
    filtered[1] === 2 &&
    filtered[2] === 3 &&
    filtered[3] === 4 &&
    filtered[4] === 5 &&
    result.length === 3 &&
    result[0] === 3 &&
    result[1] === 4 &&
    result[2] === 5 &&
    arr.length === 6 &&
    arr[0] === 10 &&
    arr[5] === 6;
}

export function builtinsArrayFilterRemoveDuringIteration0201() {
  const arr = [1, 2, 3, 4, 5];
  const filtered = [];

  const result = arr.filter((num, index, array) => {
    if (index === 1) {
      array.splice(2, 1);
    }
    filtered.push(num);
    return num > 2;
  });

  return filtered.length === 4 &&
    filtered[0] === 1 &&
    filtered[1] === 2 &&
    filtered[2] === 4 &&
    filtered[3] === 5 &&
    result.length === 2 &&
    result[0] === 4 &&
    result[1] === 5 &&
    arr.length === 4 &&
    arr[0] === 1 &&
    arr[1] === 2 &&
    arr[2] === 4 &&
    arr[3] === 5;
}

export function builtinsArrayFilterClearDuringIteration0202() {
  const arr = [1, 2, 3, 4, 5];
  const filtered = [];

  const result = arr.filter((num, index, array) => {
    if (index === 1) {
      array.length = 0;
    }
    filtered.push(num);
    return num > 2;
  });

  return filtered.length === 2 &&
    filtered[0] === 1 &&
    filtered[1] === 2 &&
    result.length === 0 &&
    arr.length === 0;
}

export function builtinsArrayFilterWithEmptyArray0203() {
  const arr = [];
  const result = arr.filter(num => num > 0);
  return result.length === 0 && Array.isArray(result);
}

export function builtinsArrayFilterWithSingleElement0204() {
  const arr = [5];
  const result = arr.filter(num => num > 3);
  return result.length === 1 && result[0] === 5;
}

export function builtinsArrayFilterWithAllMatching0205() {
  const arr = [1, 2, 3, 4, 5];
  const result = arr.filter(num => num > 0);
  return result.length === 5 && result[0] === 1 && result[4] === 5;
}

export function builtinsArrayFilterWithNoneMatching0206() {
  const arr = [1, 2, 3, 4, 5];
  const result = arr.filter(num => num > 10);
  return result.length === 0;
}

export function builtinsArrayFilterWithUndefinedElements0207() {
  const arr = [1, undefined, 3, undefined, 5];
  const result = arr.filter(num => num !== undefined);
  return result.length === 3 && result[0] === 1 && result[1] === 3 && result[2] === 5;
}

export function builtinsArrayFilterWithNullElements0208() {
  const arr = [1, null, 3, null, 5];
  const result = arr.filter(num => num !== null);
  return result.length === 3 && result[0] === 1 && result[1] === 3 && result[2] === 5;
}

export function builtinsArrayFilterWithNaNElements0209() {
  const arr = [1, NaN, 3, NaN, 5];
  const result = arr.filter(num => !isNaN(num));
  return result.length === 3 && result[0] === 1 && result[1] === 3 && result[2] === 5;
}

export function builtinsArrayFilterWithMixedTypes0210() {
  const arr = [1, '2', 3, '4', 5];
  const result = arr.filter(item => typeof item === 'number');
  return result.length === 3 && result[0] === 1 && result[1] === 3 && result[2] === 5;
}

export function builtinsArrayFilterWithObjects0211() {
  const arr = [
    { name: 'Alice', age: 25 },
    { name: 'Bob', age: 30 },
    { name: 'Charlie', age: 20 }
  ];
  const result = arr.filter(person => person.age > 21);
  return result.length === 2 && result[0].name === 'Alice' && result[1].name === 'Bob';
}

export function builtinsArrayFilterWithStrings0212() {
  const arr = ['apple', 'banana', 'cherry', 'date'];
  const result = arr.filter(str => str.length > 5);
  return result.length === 2 && result[0] === 'banana' && result[1] === 'cherry';
}

export function builtinsArrayFilterWithBooleans0213() {
  const arr = [true, false, true, false, true];
  const result = arr.filter(bool => bool);
  return result.length === 3 && result[0] === true && result[1] === true && result[2] === true;
}

export function builtinsArrayFilterWithNestedArrays0214() {
  const arr = [[1, 2], [3, 4, 5], [6], [7, 8, 9, 10]];
  const result = arr.filter(subArr => subArr.length > 2);
  return result.length === 2 && result[0].length === 3 && result[1].length === 4;
}

export function builtinsArrayFilterWithFunctionElements0215() {
  const arr = [
    () => 1,
    () => 2,
    () => 3
  ];
  const result = arr.filter(func => func() > 1);
  return result.length === 2 && result[0]() === 2 && result[1]() === 3;
}

export function builtinsArrayFilterWithDateObjects0216() {
  const today = new Date();
  const yesterday = new Date(today);
  yesterday.setDate(yesterday.getDate() - 1);
  const tomorrow = new Date(today);
  tomorrow.setDate(tomorrow.getDate() + 1);

  const arr = [yesterday, today, tomorrow];
  const result = arr.filter(date => date > today);
  return result.length === 1 && result[0] === tomorrow;
}

export function builtinsArrayFilterWithMapObjects0217() {
  const map1 = new Map();
  map1.set('a', 1);
  const map2 = new Map();
  map2.set('a', 1);
  map2.set('b', 2);
  const map3 = new Map();

  const arr = [map1, map2, map3];
  const result = arr.filter(map => map.size > 0);
  return result.length === 2 && result[0] === map1 && result[1] === map2;
}

export function builtinsArrayFilterWithSetObjects0218() {
  const set1 = new Set();
  set1.add(1);
  const set2 = new Set();
  set2.add(1);
  set2.add(2);
  const set3 = new Set();

  const arr = [set1, set2, set3];
  const result = arr.filter(set => set.size > 0);
  return result.length === 2 && result[0] === set1 && result[1] === set2;
}

export function builtinsArrayFilterWithRegExpObjects0219() {
  const regex1 = /test/;
  const regex2 = /test/i;
  const regex3 = /^test$/;

  const arr = [regex1, regex2, regex3];
  const result = arr.filter(regex => regex.flags.includes('i'));
  return result.length === 1 && result[0] === regex2;
}

export function builtinsArrayFilterWithErrorObjects0220() {
  const error1 = new Error('Error 1');
  const error2 = new TypeError('Type Error');
  const error3 = new SyntaxError('Syntax Error');

  const arr = [error1, error2, error3];
  const result = arr.filter(error => error instanceof TypeError);
  return result.length === 1 && result[0] === error2;
}

export function builtinsArrayFilterWithPromiseObjects0221() {
  const promise1 = Promise.resolve('success');
  const promise2 = Promise.reject('error');
  const promise3 = new Promise(resolve => setTimeout(resolve, 100));

  const arr = [promise1, promise2, promise3];
  const result = arr.filter(promise => promise instanceof Promise);
  return result.length === 3;
}

export function builtinsArrayFilterWithGeneratorObjects0222() {
  function* gen1() { yield 1; }
  function* gen2() { yield 2; yield 3; }
  function* gen3() { yield 4; yield 5; yield 6; }

  const arr = [gen1(), gen2(), gen3()];
  const result = arr.filter(generator => generator.next().value > 1);
  return result.length === 2 && result[0].next().value === 3 && result[1].next().value === 5;
}

export function builtinsArrayFilterWithSymbolElements0223() {
  const sym1 = Symbol('test1');
  const sym2 = Symbol('test2');
  const sym3 = Symbol('test3');

  const arr = [sym1, sym2, sym3];
  const result = arr.filter(sym => sym.toString().includes('test2'));
  return result.length === 1 && result[0] === sym2;
}

export function builtinsArrayFilterWithBigIntElements0224() {
  const arr = [1n, 2n, 3n, 4n, 5n];
  const result = arr.filter(bigInt => bigInt > 3n);
  return result.length === 2 && result[0] === 4n && result[1] === 5n;
}

export function builtinsArrayFilterWithFloatElements0225() {
  const arr = [1.1, 2.2, 3.3, 4.4, 5.5];
  const result = arr.filter(num => num > 3.0);
  return result.length === 3 && result[0] === 3.3 && result[1] === 4.4 && result[2] === 5.5;
}

export function builtinsArrayFilterWithNegativeElements0226() {
  const arr = [-5, -4, -3, -2, -1, 0, 1, 2, 3, 4, 5];
  const result = arr.filter(num => num < 0);
  return result.length === 5 && result[0] === -5 && result[4] === -1;
}

export function builtinsArrayFilterWithZeroElements0227() {
  const arr = [-1, 0, 1, 0, -1];
  const result = arr.filter(num => num === 0);
  return result.length === 2 && result[0] === 0 && result[1] === 0;
}

export function builtinsArrayFilterWithEmptyStringElements0228() {
  const arr = ['', 'hello', '', 'world', ''];
  const result = arr.filter(str => str !== '');
  return result.length === 2 && result[0] === 'hello' && result[1] === 'world';
}

export function builtinsArrayFilterWithLongStrings0229() {
  const arr = ['a', 'aa', 'aaa', 'aaaa', 'aaaaa'];
  const result = arr.filter(str => str.length > 3);
  return result.length === 2 && result[0] === 'aaaa' && result[1] === 'aaaaa';
}

export function builtinsArrayFilterWithSparseArray0230() {
  const arr = [];
  arr[0] = 1;
  arr[2] = 3;
  arr[4] = 5;

  const result = arr.filter(num => num > 0);
  return result.length === 3 && result[0] === 1 && result[1] === 3 && result[2] === 5;
}

export function builtinsArrayFilterWithHoles0231() {
  const arr = [1, , 3, , 5];
  const result = arr.filter(num => num > 0);
  return result.length === 3 && result[0] === 1 && result[1] === 3 && result[2] === 5;
}

export function builtinsArrayFilterWithThisArg0232() {
  const arr = [1, 2, 3, 4, 5];
  const context = { threshold: 3 };

  const result = arr.filter(function (num) {
    return num > this.threshold;
  }, context);

  return result.length === 2 && result[0] === 4 && result[1] === 5;
}

export function builtinsArrayFilterWithArrowFunction0233() {
  const arr = [1, 2, 3, 4, 5];
  const result = arr.filter(num => num > 3);
  return result.length === 2 && result[0] === 4 && result[1] === 5;
}

export function builtinsArrayFilterWithAsyncFunction0234() {
  const arr = [1, 2, 3, 4, 5];
  const result = arr.filter(async num => num > 3);
  return result.length === 5;
}

export function builtinsArrayFilterWithGeneratorFunction0235() {
  const arr = [1, 2, 3, 4, 5];
  function* filterGen(num) {
    yield num > 3;
  }

  const result = arr.filter(num => filterGen(num).next().value);
  return result.length === 2 && result[0] === 4 && result[1] === 5;
}

export function builtinsArrayFilterWithComplexCondition0236() {
  const arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  const result = arr.filter(num => {
    return num % 2 === 0 && num > 5 && num < 9;
  });
  return result.length === 2 && result[0] === 6 && result[1] === 8;
}

export function builtinsArrayFilterWithSideEffects0237() {
  const arr = [1, 2, 3, 4, 5];
  let counter = 0;

  const result = arr.filter(num => {
    counter++;
    return num > 3;
  });

  return result.length === 2 && counter === 5;
}

export function builtinsArrayFilterWithLargeArray0238() {
  const arr = [];
  for (let i = 0; i < 1000; i++) {
    arr.push(i);
  }

  const result = arr.filter(num => num % 2 === 0);
  return result.length === 500 && result[0] === 0 && result[499] === 998;
}

export function builtinsArrayFilterWithTypedArray0239() {
  const typedArray = new Int32Array([1, 2, 3, 4, 5]);
  const result = Array.prototype.filter.call(typedArray, num => num > 2);
  return result.length === 3 && result[0] === 3 && result[1] === 4 && result[2] === 5;
}

export function builtinsArrayFilterWithArguments0240() {
  function testArgs() {
    return Array.prototype.filter.call(arguments, num => num > 2);
  }
  const result = testArgs(1, 2, 3, 4, 5);
  return result.length === 3 && result[0] === 3 && result[1] === 4 && result[2] === 5;
}

export function builtinsArrayFilterWithSet0241() {
  const set = new Set([1, 2, 3, 4, 5]);
  const result = Array.from(set).filter(num => num > 2);
  return result.length === 3 && result[0] === 3 && result[1] === 4 && result[2] === 5;
}

export function builtinsArrayFilterWithMap0242() {
  const map = new Map([['a', 1], ['b', 2], ['c', 3], ['d', 4], ['e', 5]]);
  const result = Array.from(map.values()).filter(num => num > 2);
  return result.length === 3 && result[0] === 3 && result[1] === 4 && result[2] === 5;
}

export function builtinsArrayFilterWithWeakSet0243() {
  const weakSet = new WeakSet();
  const obj1 = { value: 1 };
  const obj2 = { value: 2 };
  const obj3 = { value: 3 };
  weakSet.add(obj1);
  weakSet.add(obj2);
  weakSet.add(obj3);
  const arr = [obj1, obj2, obj3];
  const result = arr.filter(obj => weakSet.has(obj));
  return result.length === 3;
}

export function builtinsArrayFilterWithWeakMap0244() {
  const weakMap = new WeakMap();
  const obj1 = { value: 1 };
  const obj2 = { value: 2 };
  const obj3 = { value: 3 };
  weakMap.set(obj1, 1);
  weakMap.set(obj2, 2);
  weakMap.set(obj3, 3);
  const arr = [obj1, obj2, obj3];
  const result = arr.filter(obj => weakMap.has(obj));
  return result.length === 3;
}

export function builtinsArrayFilterWithBigInt0245() {
  const arr = [1n, 2n, 3n, 4n, 5n];
  const result = arr.filter(num => num > 2n);
  return result.length === 3 && result[0] === 3n && result[1] === 4n && result[2] === 5n;
}

export function builtinsArrayFilterWithSymbol0246() {
  const sym1 = Symbol('1');
  const sym2 = Symbol('2');
  const sym3 = Symbol('3');
  const arr = [sym1, sym2, sym3];
  const result = arr.filter(sym => sym.toString().includes('2'));
  return result.length === 1 && result[0] === sym2;
}

export function builtinsArrayFilterWithDate0247() {
  const today = new Date();
  const yesterday = new Date(today);
  yesterday.setDate(yesterday.getDate() - 1);
  const tomorrow = new Date(today);
  tomorrow.setDate(tomorrow.getDate() + 1);
  const arr = [yesterday, today, tomorrow];
  const result = arr.filter(date => date > today);
  return result.length === 1 && result[0] === tomorrow;
}

export function builtinsArrayFilterWithRegExp0248() {
  const regex1 = /test/;
  const regex2 = /test/i;
  const regex3 = /test/g;
  const arr = [regex1, regex2, regex3];
  const result = arr.filter(regex => regex.flags.includes('i'));
  return result.length === 1 && result[0] === regex2;
}

export function builtinsArrayFilterWithError0249() {
  const error1 = new Error('Error 1');
  const error2 = new TypeError('Type Error');
  const error3 = new SyntaxError('Syntax Error');
  const arr = [error1, error2, error3];
  const result = arr.filter(error => error instanceof TypeError);
  return result.length === 1 && result[0] === error2;
}

export function builtinsArrayFilterWithPromise0250() {
  const promise1 = Promise.resolve('success');
  const promise2 = Promise.reject('error');
  const promise3 = new Promise(resolve => setTimeout(resolve, 100));
  const arr = [promise1, promise2, promise3];
  const result = arr.filter(promise => promise instanceof Promise);
  return result.length === 3;
}

export function builtinsArrayFilterWithGenerator0251() {
  function* gen1() { yield 1; }
  function* gen2() { yield 2; yield 3; }
  function* gen3() { yield 4; yield 5; yield 6; }
  const arr = [gen1(), gen2(), gen3()];
  const result = arr.filter(generator => generator.next().value > 1);
  return result.length === 2;
}

export function builtinsArrayFilterWithAsyncGenerator0252() {
  async function* asyncGen1() { yield 1; }
  async function* asyncGen2() { yield 2; yield 3; }
  const arr = [asyncGen1(), asyncGen2()];
  const result = arr.filter(gen => gen[Symbol.asyncIterator]);
  return result.length === 2;
}

export function builtinsArrayFilterWithProxy0253() {
  const target = [1, 2, 3, 4, 5];
  const proxy = new Proxy(target, {});
  const result = Array.prototype.filter.call(proxy, num => num > 2);
  return result.length === 3 && result[0] === 3 && result[1] === 4 && result[2] === 5;
}

export function builtinsArrayFilterWithReflect0254() {
  const arr = [1, 2, 3, 4, 5];
  const result = Reflect.apply(Array.prototype.filter, arr, [num => num > 2]);
  return result.length === 3 && result[0] === 3 && result[1] === 4 && result[2] === 5;
}

export function builtinsArrayFilterWithMath0255() {
  const arr = [1, 2, 3, 4, 5];
  const result = arr.filter(num => Math.sqrt(num) > 1.5);
  return result.length === 3 && result[0] === 3 && result[1] === 4 && result[2] === 5;
}

export function builtinsArrayFilterWithJSON0256() {
  const arr = [1, '2', true, null, undefined];
  const result = arr.filter(item => item !== null && item !== undefined);
  return result.length === 3 && result[0] === 1 && result[1] === '2' && result[2] === true;
}

export function builtinsArrayFilterWithconsole0257() {
  const arr = [1, 2, 3, 4, 5];
  let callCount = 0;
  const result = arr.filter(num => {
    callCount++;
    return num > 2;
  });
  return result.length === 3 && callCount === 5;
}

export function builtinsArrayFilterWithglobal0258() {
  const arr = [1, 2, 3, 4, 5];
  const result = arr.filter(num => num > 2);
  return result.length === 3;
}

export function builtinsArrayFilterWiththisArgUndefined0259() {
  const arr = [1, 2, 3, 4, 5];
  let thisValue;
  const result = arr.filter(function (num) {
    thisValue = this;
    return num > 2;
  }, undefined);
  return result.length === 3 && thisValue === undefined;
}

export function builtinsArrayFilterWiththisArgNull0260() {
  const arr = [1, 2, 3, 4, 5];
  let thisValue;
  const result = arr.filter(function (num) {
    thisValue = this;
    return num > 2;
  }, null);
  return result.length === 3 && thisValue === null;
}

export function builtinsArrayFilterWiththisArgNumber0261() {
  const arr = [1, 2, 3, 4, 5];
  const result = arr.filter(function (num) {
    return num > this;
  }, 2);
  return result.length === 3 && result[0] === 3 && result[1] === 4 && result[2] === 5;
}

export function builtinsArrayFilterWiththisArgString0262() {
  const arr = [1, 2, 3, 4, 5];
  const result = arr.filter(function (num) {
    return num > this.length;
  }, 'test');
  return result.length === 1 && result[0] === 5;
}

export function builtinsArrayFilterWiththisArgBoolean0263() {
  const arr = [1, 2, 3, 4, 5];
  const result = arr.filter(function (num) {
    return num > this;
  }, true);
  return result.length === 4 && result[0] === 2 && result[1] === 3 && result[2] === 4 && result[3] === 5;
}

export function builtinsArrayFilterWiththisArgBigInt0264() {
  const arr = [1n, 2n, 3n, 4n, 5n];
  const result = arr.filter(function (num) {
    return num > this;
  }, 2n);
  return result.length === 3 && result[0] === 3n && result[1] === 4n && result[2] === 5n;
}

export function builtinsArrayFilterWiththisArgSymbol0265() {
  const arr = [1, 2, 3, 4, 5];
  const sym = Symbol('test');
  const result = arr.filter(function (num) {
    return num > 2;
  }, sym);
  return result.length === 3;
}

export function builtinsArrayFilterWiththisArgDate0266() {
  const arr = [1, 2, 3, 4, 5];
  const date = new Date();
  const result = arr.filter(function (num) {
    return num > 2;
  }, date);
  return result.length === 3;
}

export function builtinsArrayFilterWiththisArgRegExp0267() {
  const arr = [1, 2, 3, 4, 5];
  const regex = /test/;
  const result = arr.filter(function (num) {
    return num > 2;
  }, regex);
  return result.length === 3;
}

export function builtinsArrayFilterWiththisArgArray0268() {
  const arr = [1, 2, 3, 4, 5];
  const thisArray = [1, 2, 3];
  const result = arr.filter(function (num) {
    return num > this.length;
  }, thisArray);
  return result.length === 2 && result[0] === 4 && result[1] === 5;
}

export function builtinsArrayFilterWiththisArgFunction0269() {
  const arr = [1, 2, 3, 4, 5];
  const func = function () { return 2; };
  const result = arr.filter(function (num) {
    return num > this();
  }, func);
  return result.length === 3 && result[0] === 3 && result[1] === 4 && result[2] === 5;
}

export function builtinsArrayFilterWiththisArgSet0270() {
  const arr = [1, 2, 3, 4, 5];
  const set = new Set([1, 2, 3]);
  const result = arr.filter(function (num) {
    return !this.has(num);
  }, set);
  return result.length === 2 && result[0] === 4 && result[1] === 5;
}

export function builtinsArrayFilterWiththisArgMap0271() {
  const arr = [1, 2, 3, 4, 5];
  const map = new Map([[1, 'one'], [2, 'two'], [3, 'three']]);
  const result = arr.filter(function (num) {
    return this.has(num);
  }, map);
  return result.length === 3 && result[0] === 1 && result[1] === 2 && result[2] === 3;
}

export function builtinsArrayFilterWiththisArgError0272() {
  const arr = [1, 2, 3, 4, 5];
  const error = new Error('test');
  const result = arr.filter(function (num) {
    return num > 2;
  }, error);
  return result.length === 3;
}

export function builtinsArrayFilterWiththisArgPromise0273() {
  const arr = [1, 2, 3, 4, 5];
  const promise = Promise.resolve('test');
  const result = arr.filter(function (num) {
    return num > 2;
  }, promise);
  return result.length === 3;
}

export function builtinsArrayFilterWiththisArgGenerator0274() {
  const arr = [1, 2, 3, 4, 5];
  function* gen() { yield 2; }
  const generator = gen();
  const result = arr.filter(function (num) {
    return num > 2;
  }, generator);
  return result.length === 3;
}

export function builtinsArrayFilterWiththisArgProxy0275() {
  const arr = [1, 2, 3, 4, 5];
  const proxy = new Proxy({ threshold: 2 }, {});
  const result = arr.filter(function (num) {
    return num > this.threshold;
  }, proxy);
  return result.length === 3 && result[0] === 3 && result[1] === 4 && result[2] === 5;
}
