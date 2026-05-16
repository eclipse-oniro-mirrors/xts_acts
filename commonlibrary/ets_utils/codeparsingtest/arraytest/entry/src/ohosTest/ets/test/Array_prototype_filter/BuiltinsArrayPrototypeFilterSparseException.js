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
export function builtinsArrayFilterSparseArray0300() {
  const arr = [];
  arr[0] = 1;
  arr[2] = 3;
  arr[4] = 5;
  
  const result = arr.filter((num) => num > 2);
  

  return result.length === 2 &&
         result[0] === 3 &&
         result[1] === 5;
}

export function builtinsArrayFilterSparseArrayWithIndex0301() {
  const arr = [];
  arr[1] = 2;
  arr[3] = 4;
  arr[5] = 6;
  
  const indices = [];
  const result = arr.filter((num, index) => {
    indices.push(index);
    return num > 3;
  });
  

  return indices.length === 3 &&
         indices[0] === 1 &&
         indices[1] === 3 &&
         indices[2] === 5 &&
         result.length === 2 &&
         result[0] === 4 &&
         result[1] === 6;
}

export function builtinsArrayFilterCallbackException0302() {
  const arr = [1, 2, 3, 4, 5];
  

  try {
    arr.filter((num) => {
      if (num === 3) {
        throw new Error('Test exception');
      }
      return num > 2;
    });
    return false;
  } catch (e) {
    return e.message === 'Test exception';
  }
}

export function builtinsArrayFilterNoCallback0303() {
  const arr = [1, 2, 3];
  

  try {

    arr.filter();
    return false;
  } catch (e) {
    return true;
  }
}

export function builtinsArrayFilterNonFunctionCallback0304() {
  const arr = [1, 2, 3];
  

  try {

    arr.filter(123);
    return false;
  } catch (e) {

  }
  
  try {

    arr.filter('string');
    return false;
  } catch (e) {

  }
  
  try {

    arr.filter({});
    return false;
  } catch (e) {

  }
  
  return true;
}

export function builtinsArrayFilterSparseArrayWithHoles0305() {
  const arr = [1, , 3, , 5];
  
  const result = arr.filter((num) => num > 2);
  

  return result.length === 2 &&
         result[0] === 3 &&
         result[1] === 5;
}

export function builtinsArrayFilterSparseArrayWithLargeIndices0306() {
  const arr = [];
  arr[100] = 100;
  arr[200] = 200;
  arr[300] = 300;
  
  const result = arr.filter((num) => num > 150);
  
  return result.length === 2 &&
         result[0] === 200 &&
         result[1] === 300;
}

export function builtinsArrayFilterSparseArrayWithZero0307() {
  const arr = [];
  arr[0] = 0;
  arr[2] = 2;
  arr[4] = 4;
  
  const result = arr.filter((num) => num === 0 || num > 2);
  
  return result.length === 2 &&
         result[0] === 0 &&
         result[1] === 4;
}

export function builtinsArrayFilterSparseArrayWithNegative0308() {
  const arr = [];
  arr[0] = -1;
  arr[2] = -3;
  arr[4] = 5;
  
  const result = arr.filter((num) => num < 0);
  
  return result.length === 2 &&
         result[0] === -1 &&
         result[1] === -3;
}

export function builtinsArrayFilterSparseArrayWithNaN0309() {
  const arr = [];
  arr[0] = NaN;
  arr[2] = 3;
  arr[4] = NaN;
  
  const result = arr.filter((num) => isNaN(num));
  
  return result.length === 2 &&
         isNaN(result[0]) &&
         isNaN(result[1]);
}

export function builtinsArrayFilterSparseArrayWithUndefined0310() {
  const arr = [];
  arr[0] = undefined;
  arr[2] = 2;
  arr[4] = undefined;
  
  const result = arr.filter((num) => num === undefined);
  
  return result.length === 2 &&
         result[0] === undefined &&
         result[1] === undefined;
}

export function builtinsArrayFilterSparseArrayWithNull0311() {
  const arr = [];
  arr[0] = null;
  arr[2] = 2;
  arr[4] = null;
  
  const result = arr.filter((num) => num === null);
  
  return result.length === 2 &&
         result[0] === null &&
         result[1] === null;
}

export function builtinsArrayFilterSparseArrayWithString0312() {
  const arr = [];
  arr[0] = 'hello';
  arr[2] = 'world';
  arr[4] = 'test';
  
  const result = arr.filter((str) => str.length > 4);
  
  return result.length === 2 &&
         result[0] === 'hello' &&
         result[1] === 'world';
}

export function builtinsArrayFilterSparseArrayWithBoolean0313() {
  const arr = [];
  arr[0] = true;
  arr[2] = false;
  arr[4] = true;
  
  const result = arr.filter((bool) => bool);
  
  return result.length === 2 &&
         result[0] === true &&
         result[1] === true;
}

export function builtinsArrayFilterSparseArrayWithObject0314() {
  const arr = [];
  arr[0] = { value: 1 };
  arr[2] = { value: 2 };
  arr[4] = { value: 3 };
  
  const result = arr.filter((obj) => obj.value > 1);
  
  return result.length === 2 &&
         result[0].value === 2 &&
         result[1].value === 3;
}

export function builtinsArrayFilterSparseArrayWithArray0315() {
  const arr = [];
  arr[0] = [1, 2];
  arr[2] = [3, 4, 5];
  arr[4] = [6];
  
  const result = arr.filter((subArr) => subArr.length > 2);
  
  return result.length === 1 &&
         result[0].length === 3;
}

export function builtinsArrayFilterSparseArrayWithFunction0316() {
  const arr = [];
  arr[0] = () => 1;
  arr[2] = () => 2;
  arr[4] = () => 3;
  
  const result = arr.filter((func) => func() > 1);
  
  return result.length === 2 &&
         result[0]() === 2 &&
         result[1]() === 3;
}

export function builtinsArrayFilterSparseArrayWithDate0317() {
  const today = new Date();
  const yesterday = new Date(today);
  yesterday.setDate(yesterday.getDate() - 1);
  const tomorrow = new Date(today);
  tomorrow.setDate(tomorrow.getDate() + 1);
  
  const arr = [];
  arr[0] = yesterday;
  arr[2] = today;
  arr[4] = tomorrow;
  
  const result = arr.filter((date) => date > today);
  
  return result.length === 1 &&
         result[0] === tomorrow;
}

export function builtinsArrayFilterSparseArrayWithBigInt0318() {
  const arr = [];
  arr[0] = 1n;
  arr[2] = 2n;
  arr[4] = 3n;
  
  const result = arr.filter((bigInt) => bigInt > 1n);
  
  return result.length === 2 &&
         result[0] === 2n &&
         result[1] === 3n;
}

export function builtinsArrayFilterSparseArrayWithSymbol0319() {
  const sym1 = Symbol('test1');
  const sym2 = Symbol('test2');
  const sym3 = Symbol('test3');
  
  const arr = [];
  arr[0] = sym1;
  arr[2] = sym2;
  arr[4] = sym3;
  
  const result = arr.filter((sym) => sym.toString().includes('test2'));
  
  return result.length === 1 &&
         result[0] === sym2;
}

export function builtinsArrayFilterSparseArrayWithRegExp0320() {
  const regex1 = /test/;
  const regex2 = /test/i;
  const regex3 = /test/g;
  
  const arr = [];
  arr[0] = regex1;
  arr[2] = regex2;
  arr[4] = regex3;
  
  const result = arr.filter((regex) => regex.flags.includes('i'));
  
  return result.length === 1 &&
         result[0] === regex2;
}

export function builtinsArrayFilterSparseArrayWithError0321() {
  const error1 = new Error('Error 1');
  const error2 = new TypeError('Type Error');
  const error3 = new SyntaxError('Syntax Error');
  
  const arr = [];
  arr[0] = error1;
  arr[2] = error2;
  arr[4] = error3;
  
  const result = arr.filter((error) => error instanceof TypeError);
  
  return result.length === 1 &&
         result[0] === error2;
}

export function builtinsArrayFilterSparseArrayWithPromise0322() {
  const promise1 = Promise.resolve('success');
  const promise2 = Promise.reject('error');
  const promise3 = new Promise(resolve => setTimeout(resolve, 100));
  
  const arr = [];
  arr[0] = promise1;
  arr[2] = promise2;
  arr[4] = promise3;
  
  const result = arr.filter((promise) => promise instanceof Promise);
  
  return result.length === 3;
}

export function builtinsArrayFilterSparseArrayWithGenerator0323() {
  function* gen1() { yield 1; }
  function* gen2() { yield 2; yield 3; }
  function* gen3() { yield 4; yield 5; yield 6; }
  
  const arr = [];
  arr[0] = gen1();
  arr[2] = gen2();
  arr[4] = gen3();
  
  const result = arr.filter((generator) => generator.next().value > 1);
  
  return result.length === 2;
}

export function builtinsArrayFilterSparseArrayWithProxy0324() {
  const target = [];
  target[0] = 1;
  target[2] = 3;
  target[4] = 5;
  
  const proxy = new Proxy(target, {});
  const result = Array.prototype.filter.call(proxy, (num) => num > 2);
  
  return result.length === 2 &&
         result[0] === 3 &&
         result[1] === 5;
}

export function builtinsArrayFilterSparseArrayWithReflect0325() {
  const arr = [];
  arr[0] = 1;
  arr[2] = 3;
  arr[4] = 5;
  
  const result = Reflect.apply(Array.prototype.filter, arr, [(num) => num > 2]);
  
  return result.length === 2 &&
         result[0] === 3 &&
         result[1] === 5;
}

export function builtinsArrayFilterSparseArrayWithMath0326() {
  const arr = [];
  arr[0] = 1;
  arr[2] = 4;
  arr[4] = 9;
  
  const result = arr.filter((num) => Math.sqrt(num) === Math.floor(Math.sqrt(num)));
  
  return result.length === 3 &&
         result[0] === 1 &&
         result[1] === 4 &&
         result[2] === 9;
}

export function builtinsArrayFilterSparseArrayWithJSON0327() {
  const arr = [];
  arr[0] = { value: 1 };
  arr[2] = { value: 2 };
  arr[4] = { value: 3 };
  
  const result = arr.filter((obj) => JSON.stringify(obj).includes('2'));
  
  return result.length === 1 &&
         result[0].value === 2;
}

export function builtinsArrayFilterSparseArrayWithThisArg0328() {
  const arr = [];
  arr[0] = 1;
  arr[2] = 3;
  arr[4] = 5;
  
  const context = { threshold: 2 };
  
  const result = arr.filter(function(num) {
    return num > this.threshold;
  }, context);
  
  return result.length === 2 &&
         result[0] === 3 &&
         result[1] === 5;
}

export function builtinsArrayFilterSparseArrayWithArrowFunction0329() {
  const arr = [];
  arr[0] = 1;
  arr[2] = 3;
  arr[4] = 5;
  
  const result = arr.filter((num) => num > 2);
  
  return result.length === 2 &&
         result[0] === 3 &&
         result[1] === 5;
}

export function builtinsArrayFilterSparseArrayWithAsyncFunction0330() {
  const arr = [];
  arr[0] = 1;
  arr[2] = 3;
  arr[4] = 5;
  
  const result = arr.filter(async (num) => num > 2);
  
  return result.length === 3;
}

export function builtinsArrayFilterSparseArrayWithGeneratorFunction0331() {
  const arr = [];
  arr[0] = 1;
  arr[2] = 3;
  arr[4] = 5;
  
  function* filterGen(num) {
    yield num > 2;
  }
  
  const result = arr.filter((num) => filterGen(num).next().value);
  
  return result.length === 2 &&
         result[0] === 3 &&
         result[1] === 5;
}

export function builtinsArrayFilterSparseArrayWithComplexCondition0332() {
  const arr = [];
  arr[0] = 1;
  arr[2] = 4;
  arr[4] = 7;
  arr[6] = 10;
  arr[8] = 13;
  
  const result = arr.filter((num) => {
    return num % 3 === 1 && num > 5;
  });
  
  return result.length === 3 &&
         result[0] === 7 &&
         result[1] === 10 &&
         result[2] === 13;
}

export function builtinsArrayFilterSparseArrayWithSideEffects0333() {
  const arr = [];
  arr[0] = 1;
  arr[2] = 3;
  arr[4] = 5;
  
  let counter = 0;
  
  const result = arr.filter((num) => {
    counter++;
    return num > 2;
  });
  
  return result.length === 2 && counter === 3;
}

export function builtinsArrayFilterSparseArrayWithLargeArray0334() {
  const arr = [];
  for (let i = 0; i < 1000; i += 2) {
    arr[i] = i;
  }
  
  const result = arr.filter((num) => num % 4 === 0);
  
  return result.length === 250 && result[0] === 0 && result[249] === 996;
}

export function builtinsArrayFilterSparseArrayWithTypedArray0335() {
  const typedArray = new Int32Array(5);
  typedArray[0] = 1;
  typedArray[2] = 3;
  typedArray[4] = 5;
  
  const result = Array.prototype.filter.call(typedArray, (num) => num > 2);
  
  return result.length === 2 &&
         result[0] === 3 &&
         result[1] === 5;
}

export function builtinsArrayFilterSparseArrayWithArguments0336() {
  function testArgs() {
    return Array.prototype.filter.call(arguments, (num) => num > 2);
  }
  

  const result = testArgs(1, undefined, 3, undefined, 5);
  
  return result.length === 2 &&
         result[0] === 3 &&
         result[1] === 5;
}

export function builtinsArrayFilterSparseArrayWithSet0337() {
  const set = new Set();
  set.add(1);
  set.add(3);
  set.add(5);
  

  const arr = [];
  let i = 0;
  for (const value of set) {
    arr[i * 2] = value;
    i++;
  }
  
  const result = arr.filter((num) => num > 2);
  
  return result.length === 2 &&
         result[0] === 3 &&
         result[1] === 5;
}

export function builtinsArrayFilterSparseArrayWithMap0338() {
  const map = new Map([['a', 1], ['b', 3], ['c', 5]]);
  

  const arr = [];
  let i = 0;
  for (const [, value] of map) {
    arr[i * 2] = value;
    i++;
  }
  
  const result = arr.filter((num) => num > 2);
  
  return result.length === 2 &&
         result[0] === 3 &&
         result[1] === 5;
}

export function builtinsArrayFilterSparseArrayWithWeakSet0339() {
  const weakSet = new WeakSet();
  const obj1 = { value: 1 };
  const obj2 = { value: 3 };
  const obj3 = { value: 5 };
  
  weakSet.add(obj1);
  weakSet.add(obj2);
  weakSet.add(obj3);
  

  const arr = [];
  arr[0] = obj1;
  arr[2] = obj2;
  arr[4] = obj3;
  
  const result = arr.filter((obj) => weakSet.has(obj) && obj.value > 2);
  
  return result.length === 2 &&
         result[0].value === 3 &&
         result[1].value === 5;
}

export function builtinsArrayFilterSparseArrayWithWeakMap0340() {
  const weakMap = new WeakMap();
  const obj1 = { value: 1 };
  const obj2 = { value: 3 };
  const obj3 = { value: 5 };
  
  weakMap.set(obj1, 1);
  weakMap.set(obj2, 3);
  weakMap.set(obj3, 5);
  

  const arr = [];
  arr[0] = obj1;
  arr[2] = obj2;
  arr[4] = obj3;
  
  const result = arr.filter((obj) => weakMap.has(obj) && weakMap.get(obj) > 2);
  
  return result.length === 2 &&
         result[0].value === 3 &&
         result[1].value === 5;
}

export function builtinsArrayFilterSparseArrayWithBigInt0341() {
  const arr = [];
  arr[0] = 1n;
  arr[2] = 3n;
  arr[4] = 5n;
  
  const result = arr.filter((bigInt) => bigInt > 2n);
  
  return result.length === 2 &&
         result[0] === 3n &&
         result[1] === 5n;
}

export function builtinsArrayFilterSparseArrayWithSymbol0342() {
  const sym1 = Symbol('1');
  const sym2 = Symbol('3');
  const sym3 = Symbol('5');
  
  const arr = [];
  arr[0] = sym1;
  arr[2] = sym2;
  arr[4] = sym3;
  
  const result = arr.filter((sym) => sym.toString().includes('3') || sym.toString().includes('5'));
  
  return result.length === 2 &&
         result[0] === sym2 &&
         result[1] === sym3;
}

export function builtinsArrayFilterSparseArrayWithDate0343() {
  const today = new Date();
  const yesterday = new Date(today);
  yesterday.setDate(yesterday.getDate() - 1);
  const tomorrow = new Date(today);
  tomorrow.setDate(tomorrow.getDate() + 1);
  
  const arr = [];
  arr[0] = yesterday;
  arr[2] = today;
  arr[4] = tomorrow;
  
  const result = arr.filter((date) => date >= today);
  
  return result.length === 2 &&
         result[0] === today &&
         result[1] === tomorrow;
}

export function builtinsArrayFilterSparseArrayWithRegExp0344() {
  const regex1 = /test/;
  const regex2 = /test/i;
  const regex3 = /test/g;
  
  const arr = [];
  arr[0] = regex1;
  arr[2] = regex2;
  arr[4] = regex3;
  
  const result = arr.filter((regex) => regex.flags.length > 0);
  
  return result.length === 2 &&
         result[0] === regex2 &&
         result[1] === regex3;
}

export function builtinsArrayFilterSparseArrayWithError0345() {
  const error1 = new Error('Error 1');
  const error2 = new TypeError('Type Error');
  const error3 = new SyntaxError('Syntax Error');
  
  const arr = [];
  arr[0] = error1;
  arr[2] = error2;
  arr[4] = error3;
  
  const result = arr.filter((error) => error.message.includes('Error'));
  
  return result.length === 3;
}

export function builtinsArrayFilterSparseArrayWithPromise0346() {
  const promise1 = Promise.resolve('success');
  const promise2 = Promise.reject('error');
  const promise3 = new Promise(resolve => setTimeout(resolve, 100));
  
  const arr = [];
  arr[0] = promise1;
  arr[2] = promise2;
  arr[4] = promise3;
  
  const result = arr.filter((promise) => promise instanceof Promise);
  
  return result.length === 3;
}

export function builtinsArrayFilterSparseArrayWithGenerator0347() {
  function* gen1() { yield 1; }
  function* gen2() { yield 3; }
  function* gen3() { yield 5; }
  
  const arr = [];
  arr[0] = gen1();
  arr[2] = gen2();
  arr[4] = gen3();
  
  const result = arr.filter((generator) => generator.next().value > 2);
  
  return result.length === 2;
}

export function builtinsArrayFilterSparseArrayWithAsyncGenerator0348() {
  async function* asyncGen1() { yield 1; }
  async function* asyncGen2() { yield 3; }
  
  const arr = [];
  arr[0] = asyncGen1();
  arr[2] = asyncGen2();
  
  const result = arr.filter((gen) => gen[Symbol.asyncIterator]);
  
  return result.length === 2;
}

export function builtinsArrayFilterSparseArrayWithProxy0349() {
  const target = [];
  target[0] = 1;
  target[2] = 3;
  target[4] = 5;
  
  const proxy = new Proxy(target, {
    get: function(target, prop) {
      return target[prop];
    }
  });
  
  const result = Array.prototype.filter.call(proxy, (num) => num > 2);
  
  return result.length === 2 &&
         result[0] === 3 &&
         result[1] === 5;
}

export function builtinsArrayFilterSparseArrayWithReflect0350() {
  const arr = [];
  arr[0] = 1;
  arr[2] = 3;
  arr[4] = 5;
  
  const result = Reflect.apply(Array.prototype.filter, arr, [(num) => num > 2]);
  
  return result.length === 2 &&
         result[0] === 3 &&
         result[1] === 5;
}