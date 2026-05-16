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
export function builtinsArrayFindThisArg0100() {
  const inventory = [
    { name: "apples", quantity: 2 },
    { name: "bananas", quantity: 0 },
    { name: "cherries", quantity: 5 }
  ];
  
  const context = {
    minQuantity: 3
  };
  
  const result = inventory.find(function(fruit) {
    return fruit.quantity !== undefined && fruit.quantity >= this.minQuantity;
  }, context);
  
  return result?.name === "cherries" &&
         result?.quantity === 5;
}

export function builtinsArrayFindThisArgWithContext0101() {
  const numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  
  const context = {
    min: 3,
    max: 7
  };
  
  const result = numbers.find(function(num) {
    return num >= this.min && num <= this.max;
  }, context);
  
  return result === 3;
}

export function builtinsArrayFindThisArgArrowFunction0102() {
  const numbers = [1, 2, 3, 4, 5];
  const context = { threshold: 3 };
  const result = numbers.find((num) => {
    return num > this?.threshold;
  }, context);
  return result === undefined;
}

export function builtinsArrayFindWithWeakSet0104() {
  const weakSet = new WeakSet();
  const obj1 = { value: 1 };
  const obj2 = { value: 2 };
  const obj3 = { value: 3 };
  weakSet.add(obj1);
  weakSet.add(obj2);
  weakSet.add(obj3);
  const arr = [obj1, obj2, obj3];
  const result = arr.find(obj => weakSet.has(obj));
  return result === obj1;
}

export function builtinsArrayFindWithWeakMap0105() {
  const weakMap = new WeakMap();
  const obj1 = { value: 1 };
  const obj2 = { value: 2 };
  const obj3 = { value: 3 };
  weakMap.set(obj1, 1);
  weakMap.set(obj2, 2);
  weakMap.set(obj3, 3);
  const arr = [obj1, obj2, obj3];
  const result = arr.find(obj => weakMap.has(obj));
  return result === obj1;
}

export function builtinsArrayFindWithError0106() {
  const error1 = new Error('Error 1');
  const error2 = new TypeError('Type Error');
  const error3 = new SyntaxError('Syntax Error');
  const arr = [error1, error2, error3];
  const result = arr.find(error => error instanceof TypeError);
  return result === error2;
}

export function builtinsArrayFindWithPromise0107() {
  const promise1 = Promise.resolve('success');
  const promise2 = Promise.reject('error');
  const promise3 = new Promise(resolve => setTimeout(resolve, 100));
  const arr = [promise1, promise2, promise3];
  const result = arr.find(promise => promise instanceof Promise);
  return result === promise1;
}

export function builtinsArrayFindWithAsyncGenerator0108() {
  async function* asyncGen1() { yield 1; }
  async function* asyncGen2() { yield 2; yield 3; }
  const arr = [asyncGen1(), asyncGen2()];
  const result = arr.find(gen => gen[Symbol.asyncIterator]);
  return result === arr[0];
}

export function builtinsArrayFindWithProxy0109() {
  const target = [1, 2, 3, 4, 5];
  const proxy = new Proxy(target, {});
  const result = Array.prototype.find.call(proxy, num => num > 2);
  return result === 3;
}

export function builtinsArrayFindWithReflect0110() {
  const arr = [1, 2, 3, 4, 5];
  const result = Reflect.apply(Array.prototype.find, arr, [num => num > 2]);
  return result === 3;
}

export function builtinsArrayFindWithMath0111() {
  const arr = [1, 2, 3, 4, 5];
  const result = arr.find(num => Math.sqrt(num) > 1.5);
  return result === 3;
}

export function builtinsArrayFindWithJSON0112() {
  const arr = [1, '2', true, null, undefined];
  const result = arr.find(item => JSON.stringify(item) === 'null');
  return result === null;
}

export function builtinsArrayFindWithconsole0113() {
  const arr = [1, 2, 3, 4, 5];
  let callCount = 0;
  const result = arr.find(num => {
    callCount++;
    return num > 2;
  });
  return result === 3 && callCount === 3;
}

export function builtinsArrayFindWithglobal0114() {
  const arr = [1, 2, 3, 4, 5];
  const result = arr.find(num => num > 2);
  return result === 3;
}

export function builtinsArrayFindWiththisArgNull0115() {
  const arr = [1, 2, 3, 4, 5];
  let thisValue;
  const result = arr.find(function(num) {
    thisValue = this;
    return num > 2;
  }, null);
  return result === 3 && thisValue === null;
}

export function builtinsArrayFindWiththisArgNumber0116() {
  const arr = [1, 2, 3, 4, 5];
  const result = arr.find(function(num) {
    return num > this;
  }, 2);
  return result === 3;
}

export function builtinsArrayFindWiththisArgString0117() {
  const arr = [1, 2, 3, 4, 5];
  const result = arr.find(function(num) {
    return num > this.length;
  }, 'test');
  return result === 5;
}

export function builtinsArrayFindWiththisArgBoolean0118() {
  const arr = [1, 2, 3, 4, 5];
  const result = arr.find(function(num) {
    return num > this;
  }, true);
  return result === 2;
}

export function builtinsArrayFindWiththisArgBigInt0119() {
  const arr = [1n, 2n, 3n, 4n, 5n];
  const result = arr.find(function(num) {
    return num > this;
  }, 2n);
  return result === 3n;
}

export function builtinsArrayFindWiththisArgSymbol0120() {
  const arr = [1, 2, 3, 4, 5];
  const sym = Symbol('test');
  const result = arr.find(function(num) {
    return num > 2;
  }, sym);
  return result === 3;
}

export function builtinsArrayFindWiththisArgDate0121() {
  const arr = [1, 2, 3, 4, 5];
  const date = new Date();
  const result = arr.find(function(num) {
    return num > 2;
  }, date);
  return result === 3;
}

export function builtinsArrayFindWiththisArgRegExp0122() {
  const arr = [1, 2, 3, 4, 5];
  const regex = /test/;
  const result = arr.find(function(num) {
    return num > 2;
  }, regex);
  return result === 3;
}

export function builtinsArrayFindWiththisArgArray0123() {
  const arr = [1, 2, 3, 4, 5];
  const thisArray = [1, 2, 3];
  const result = arr.find(function(num) {
    return num > this.length;
  }, thisArray);
  return result === 4;
}

export function builtinsArrayFindWiththisArgFunction0124() {
  const arr = [1, 2, 3, 4, 5];
  const func = function() { return 2; };
  const result = arr.find(function(num) {
    return num > this();
  }, func);
  return result === 3;
}

export function builtinsArrayFindWiththisArgSet0125() {
  const arr = [1, 2, 3, 4, 5];
  const set = new Set([1, 2, 3]);
  const result = arr.find(function(num) {
    return !this.has(num);
  }, set);
  return result === 4;
}

export function builtinsArrayFindWiththisArgMap0126() {
  const arr = [1, 2, 3, 4, 5];
  const map = new Map([[1, 'one'], [2, 'two'], [3, 'three']]);
  const result = arr.find(function(num) {
    return this.has(num);
  }, map);
  return result === 1;
}

export function builtinsArrayFindWiththisArgError0127() {
  const arr = [1, 2, 3, 4, 5];
  const error = new Error('test');
  const result = arr.find(function(num) {
    return num > 2;
  }, error);
  return result === 3;
}

export function builtinsArrayFindWiththisArgPromise0128() {
  const arr = [1, 2, 3, 4, 5];
  const promise = Promise.resolve('test');
  const result = arr.find(function(num) {
    return num > 2;
  }, promise);
  return result === 3;
}

export function builtinsArrayFindWiththisArgGenerator0129() {
  const arr = [1, 2, 3, 4, 5];
  function* gen() { yield 2; }
  const generator = gen();
  const result = arr.find(function(num) {
    return num > 2;
  }, generator);
  return result === 3;
}

export function builtinsArrayFindWiththisArgProxy0130() {
  const arr = [1, 2, 3, 4, 5];
  const proxy = new Proxy({ threshold: 2 }, {});
  const result = arr.find(function(num) {
    return num > this.threshold;
  }, proxy);
  return result === 3;
}

export function builtinsArrayFindThisArgUndefined0103() {
  const numbers = [1, 2, 3, 4, 5];
  
  let thisValue;
  
  const result = numbers.find(function(num) {
    thisValue = this;
    return num > 3;
  }, undefined);
  
  return result === 4 &&
         thisValue === undefined;
}

export function builtinsArrayFindWithLargeArray0200() {
  const arr = [];
  for (let i = 0; i < 1000; i++) {
    arr.push(i);
  }
  const result = arr.find(num => num === 999);
  return result === 999;
}

export function builtinsArrayFindWithEmptyArray0201() {
  const arr = [];
  const result = arr.find(num => num > 0);
  return result === undefined;
}

export function builtinsArrayFindWithSparseArray0202() {
  const arr = new Array(3);
  arr[0] = 1;
  arr[2] = 3;

  let called = 0;
  const result = arr.find((num, index) => {
    called++;
    return num === 3;
  });

  return result === 3 && called === 3;
}

export function builtinsArrayFindWithNegativeNumbers0203() {
  const arr = [-5, -3, -1, 1, 3, 5];
  const result = arr.find(num => num > 0);
  return result === 1;
}

export function builtinsArrayFindWithNaN0204() {
  const arr = [1, 2, NaN, 4, 5];
  const result = arr.find(num => isNaN(num));
  return isNaN(result);
}

export function builtinsArrayFindWithInfinity0205() {
  const arr = [1, 2, Infinity, 4, 5];
  const result = arr.find(num => num === Infinity);
  return result === Infinity;
}

export function builtinsArrayFindWithSymbol0206() {
  const sym = Symbol('test');
  const arr = [1, 2, sym, 4, 5];
  const result = arr.find(item => item === sym);
  return result === sym;
}

export function builtinsArrayFindWithBigInt0207() {
  const arr = [1n, 2n, 3n, 4n, 5n];
  const result = arr.find(num => num === 3n);
  return result === 3n;
}

export function builtinsArrayFindWithFunction0208() {
  const func = () => 'test';
  const arr = [1, 2, func, 4, 5];
  const result = arr.find(item => item === func);
  return result === func;
}

export function builtinsArrayFindWithObject0209() {
  const obj = { name: 'test' };
  const arr = [1, 2, obj, 4, 5];
  const result = arr.find(item => item === obj);
  return result === obj;
}

export function builtinsArrayFindWithDate0210() {
  const date = new Date('2023-01-01');
  const arr = [1, 2, date, 4, 5];
  const result = arr.find(item => item === date);
  return result === date;
}

export function builtinsArrayFindWithRegex0211() {
  const regex = /test/;
  const arr = [1, 2, regex, 4, 5];
  const result = arr.find(item => item === regex);
  return result === regex;
}

export function builtinsArrayFindWithBoolean0212() {
  const arr = [true, false, true, false];
  const result = arr.find(item => item === false);
  return result === false;
}

export function builtinsArrayFindWithNull0213() {
  const arr = [1, null, 3, null, 5];
  const result = arr.find(item => item === null);
  return result === null;
}

export function builtinsArrayFindWithUndefined0214() {
  const arr = [1, undefined, 3, undefined, 5];
  const result = arr.find(item => item === undefined);
  return result === undefined;
}

export function builtinsArrayFindWithString0215() {
  const arr = ['a', 'b', 'c', 'd', 'e'];
  const result = arr.find(item => item === 'c');
  return result === 'c';
}

export function builtinsArrayFindWithMixedTypes0216() {
  const arr = [1, '2', true, null, undefined, 5];
  const result = arr.find(item => typeof item === 'string');
  return result === '2';
}

export function builtinsArrayFindWithComplexCondition0217() {
  const arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  const result = arr.find(num => num > 5 && num % 2 === 0);
  return result === 6;
}

export function builtinsArrayFindWithIndexParameter0218() {
  const arr = [10, 20, 30, 40, 50];
  let foundIndex;
  const result = arr.find((num, index) => {
    if (num === 30) {
      foundIndex = index;
      return true;
    }
    return false;
  });
  return result === 30 && foundIndex === 2;
}

export function builtinsArrayFindWithArrayParameter0219() {
  const arr = [1, 2, 3, 4, 5];
  let passedArray;
  const result = arr.find((num, index, array) => {
    passedArray = array;
    return num === 3;
  });
  return result === 3 && passedArray === arr;
}

export function builtinsArrayFindWithEarlyReturn0220() {
  let callCount = 0;
  const arr = [1, 2, 3, 4, 5];
  const result = arr.find(num => {
    callCount++;
    return num === 3;
  });
  return result === 3 && callCount === 3;
}

export function builtinsArrayFindWithNoMatch0221() {
  const arr = [1, 2, 3, 4, 5];
  const result = arr.find(num => num > 10);
  return result === undefined;
}

export function builtinsArrayFindWithArrayLike0222() {
  const arrayLike = {
    length: 3,
    0: 1,
    1: 2,
    2: 3
  };
  const result = Array.prototype.find.call(arrayLike, num => num === 2);
  return result === 2;
}

export function builtinsArrayFindWithTypedArray0223() {
  const typedArray = new Int32Array([1, 2, 3, 4, 5]);
  const result = Array.prototype.find.call(typedArray, num => num === 3);
  return result === 3;
}

export function builtinsArrayFindWithArguments0224() {
  function testArgs() {
    return Array.prototype.find.call(arguments, num => num === 3);
  }
  const result = testArgs(1, 2, 3, 4, 5);
  return result === 3;
}

export function builtinsArrayFindWithModifiedArray0225() {
  const arr = [1, 2, 3, 4, 5];
  let callCount = 0;

  const result = arr.find((num, index) => {
    callCount++;
    if (index === 0) {
      arr.push(6);
    }
    return num === 6;
  });

  return result === undefined && callCount === 5;
}

export function builtinsArrayFindWithDeletedElements0226() {
  const arr = [1, 2, 3, 4, 5];
  let callCount = 0;
  const result = arr.find((num, index) => {
    callCount++;
    if (index === 0) {
      delete arr[2];
    }
    return num === 4;
  });
  return result === 4 && callCount === 4;
}

export function builtinsArrayFindWithThrownError0227() {
  const arr = [1, 2, 3, 4, 5];
  let errorThrown = false;
  try {
    arr.find(num => {
      if (num === 3) {
        throw new Error('Test error');
      }
      return false;
    });
  } catch (e) {
    errorThrown = true;
  }
  return errorThrown;
}

export function builtinsArrayFindWithAsyncFunction0228() {
  const arr = [1, 2, 3, 4, 5];
  const result = arr.find(async num => num === 3);
  return result instanceof Promise === false;
}

export function builtinsArrayFindWithGeneratorFunction0229() {
  const arr = [1, 2, 3, 4, 5];
  function* generator() {
    yield 1;
  }
  const result = arr.find(generator);
  return result === 1;
}

export function builtinsArrayFindWithNonFunctionPredicate0230() {
  const arr = [1, 2, 3, 4, 5];
  let errorThrown = false;
  try {

    arr.find('not a function');
  } catch (e) {
    errorThrown = true;
  }
  return errorThrown;
}

export function builtinsArrayFindWithNullPredicate0231() {
  const arr = [1, 2, 3, 4, 5];
  let errorThrown = false;
  try {

    arr.find(null);
  } catch (e) {
    errorThrown = true;
  }
  return errorThrown;
}

export function builtinsArrayFindWithUndefinedPredicate0232() {
  const arr = [1, 2, 3, 4, 5];
  let errorThrown = false;
  try {

    arr.find(undefined);
  } catch (e) {
    errorThrown = true;
  }
  return errorThrown;
}

export function builtinsArrayFindWithObjectPredicate0233() {
  const arr = [1, 2, 3, 4, 5];
  let errorThrown = false;
  try {

    arr.find({});
  } catch (e) {
    errorThrown = true;
  }
  return errorThrown;
}

export function builtinsArrayFindWithNumberPredicate0234() {
  const arr = [1, 2, 3, 4, 5];
  let errorThrown = false;
  try {

    arr.find(123);
  } catch (e) {
    errorThrown = true;
  }
  return errorThrown;
}

export function builtinsArrayFindWithStringPredicate0235() {
  const arr = [1, 2, 3, 4, 5];
  let errorThrown = false;
  try {

    arr.find('string');
  } catch (e) {
    errorThrown = true;
  }
  return errorThrown;
}

export function builtinsArrayFindWithBooleanPredicate0236() {
  const arr = [1, 2, 3, 4, 5];
  let errorThrown = false;
  try {

    arr.find(true);
  } catch (e) {
    errorThrown = true;
  }
  return errorThrown;
}

export function builtinsArrayFindWithBigIntPredicate0237() {
  const arr = [1, 2, 3, 4, 5];
  let errorThrown = false;
  try {

    arr.find(123n);
  } catch (e) {
    errorThrown = true;
  }
  return errorThrown;
}

export function builtinsArrayFindWithSymbolPredicate0238() {
  const arr = [1, 2, 3, 4, 5];
  const sym = Symbol('test');
  let errorThrown = false;
  try {

    arr.find(sym);
  } catch (e) {
    errorThrown = true;
  }
  return errorThrown;
}

export function builtinsArrayFindWithDatePredicate0239() {
  const arr = [1, 2, 3, 4, 5];
  const date = new Date();
  let errorThrown = false;
  try {

    arr.find(date);
  } catch (e) {
    errorThrown = true;
  }
  return errorThrown;
}

export function builtinsArrayFindWithRegexPredicate0240() {
  const arr = [1, 2, 3, 4, 5];
  const regex = /test/;
  let errorThrown = false;
  try {

    arr.find(regex);
  } catch (e) {
    errorThrown = true;
  }
  return errorThrown;
}

export function builtinsArrayFindWithArrayPredicate0241() {
  const arr = [1, 2, 3, 4, 5];
  const predicateArray = [];
  let errorThrown = false;
  try {

    arr.find(predicateArray);
  } catch (e) {
    errorThrown = true;
  }
  return errorThrown;
}

export function builtinsArrayFindWithSetPredicate0242() {
  const arr = [1, 2, 3, 4, 5];
  const set = new Set();
  let errorThrown = false;
  try {

    arr.find(set);
  } catch (e) {
    errorThrown = true;
  }
  return errorThrown;
}

export function builtinsArrayFindWithMapPredicate0243() {
  const arr = [1, 2, 3, 4, 5];
  const map = new Map();
  let errorThrown = false;
  try {

    arr.find(map);
  } catch (e) {
    errorThrown = true;
  }
  return errorThrown;
}
