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

// Test Array.of() with generator function result
export function ArrayOfTest0100() {
  function* generator() {
    yield 1;
    yield 2;
    yield 3;
  }
  let gen = generator();
  let arr = Array.of(gen);
  return arr.length === 1 && 
         typeof arr[0].next === 'function' &&
         arr[0].next().value === 1;
}

// Test Array.of() with Array subclass
export function ArrayOfTest0200() {
  class MyArray extends Array {
    constructor(...args) {
      super(...args);
    }
  }
  let myArr = MyArray.of(1, 2, 3);
  return myArr instanceof MyArray &&
         myArr instanceof Array &&
         myArr.length === 3 &&
         myArr[0] === 1 &&
         myArr[2] === 3;
}

// Test Array.of() subclass instance inherits Array methods
export function ArrayOfTest0300() {
  class MyArray extends Array {}
  let myArr = MyArray.of(1, 2, 3);
  let mapped = myArr.map(x => x * 2);
  let filtered = myArr.filter(x => x > 1);
  let reduced = myArr.reduce((a, b) => a + b);
  return mapped.length === 3 && mapped[0] === 2 &&
         filtered.length === 2 && filtered[0] === 2 &&
         reduced === 6;
}

// Test Array.of() with multi-level inheritance
export function ArrayOfTest0400() {
  class MyArray extends Array {}
  class MyArray2 extends MyArray {}
  let myArr = MyArray2.of(1, 2, 3);
  return myArr instanceof MyArray2 &&
         myArr instanceof MyArray &&
         myArr instanceof Array &&
         myArr.length === 3;
}

// Test Array.of() with array-like object argument
export function ArrayOfTest0500() {
  let arrayLike = { 0: 'a', 1: 'b', length: 2 };
  let arr = Array.of(arrayLike);
  return arr.length === 1 &&
         !Array.isArray(arr[0]) &&
         arr[0].length === 2 &&
         arr[0][0] === 'a' &&
         arr[0][1] === 'b';
}

// Test Array.of() with arguments object
export function ArrayOfTest0600() {
  function test() {
    let arr = Array.of(arguments);
    return arr.length === 1 &&
           arr[0][0] === 1 &&
           arr[0][1] === 2 &&
           arr[0][2] === 3;
  }
  return test(1, 2, 3);
}

// Test Array.of.call() with custom constructor
export function ArrayOfTest0700() {
  function NotArray(len) {
    this.customLength = len;
  }
  let result = Array.of.call(NotArray, 1, 2, 3);
  return result instanceof NotArray &&
         result.length === 3 &&
         result[0] === 1 &&
         result[1] === 2 &&
         result[2] === 3;
}

// Test Array.of.apply() with argument array
export function ArrayOfTest0800() {
  let args = [1, 2, 3, 4, 5];
  let arr = Array.of.apply(null, args);
  return Array.isArray(arr) &&
         arr.length === 5 &&
         arr[0] === 1 &&
         arr[4] === 5;
}

// Test Array.of.bind() with custom constructor
export function ArrayOfTest0900() {
  function CustomArray(...args) {
    this.data = args;
  }
  let boundOf = Array.of.bind(CustomArray);
  let result = boundOf(1, 2, 3);
  return result instanceof CustomArray &&
         result.length === 3 &&
         result[0] === 1 &&
         result[2] === 3;
}

// Test Array.of() with large number of arguments
export function ArrayOfTest1000() {
  let args = [];
  for (let i = 0; i < 1000; i++) {
    args.push(i);
  }
  let arr = Array.of.apply(null, args);
  return arr.length === 1000 &&
         arr[0] === 0 &&
         arr[999] === 999;
}

// Test Array.of() with subclass custom property
export function ArrayOfTest1200() {
  class MyArray extends Array {
    constructor(...args) {
      super(...args);
      this.created = true;
    }
  }
  let myArr = MyArray.of(1, 2, 3);
  return myArr.created === true &&
         myArr.constructor === MyArray;
}

// Test Array.of() with subclass getter methods
export function ArrayOfTest1300() {
  class MyArray extends Array {
    get first() {
      return this[0];
    }
    get last() {
      return this[this.length - 1];
    }
  }
  let myArr = MyArray.of(1, 2, 3, 4, 5);
  return myArr.first === 1 &&
         myArr.last === 5;
}

// Test Array.of.call() with Object constructor
export function ArrayOfTest1400() {
  let result = Array.of.call(Object, 1, 2, 3);
  return typeof result === 'object' &&
         result.length === 3 &&
         result[0] === 1;
}

// Test Array.of.call() with plain object as this
export function ArrayOfTest1500() {
  let obj = {};
  let result = Array.of.call(obj, 1, 2, 3);
  return Array.isArray(result) &&
         result.length === 3 &&
         result instanceof Array;
}

// Test Array.of() with deeply nested generator
export function ArrayOfTest1600() {
  function* deepGenerator() {
    yield* [1, 2, 3];
  }
  let gen = deepGenerator();
  let arr = Array.of(gen);
  return arr.length === 1 &&
         arr[0].next().value === 1;
}

// Test Array.of() with Symbol.species
export function ArrayOfTest1700() {
  class MyArray extends Array {
    static get [Symbol.species]() {
      return Array;
    }
  }
  let myArr = MyArray.of(1, 2, 3);
  let mapped = myArr.map(x => x);
  return myArr instanceof MyArray &&
         mapped instanceof Array;
}

// Test Array.of() with modified Array.prototype.push
export function ArrayOfTest1800() {
  let originalPush = Array.prototype.push;
  let customPushCalled = false;
  Array.prototype.push = function(...args) {
    customPushCalled = true;
    return originalPush.apply(this, args);
  };
  
  let arr = Array.of(1, 2, 3);
  arr.push(4);
  
  Array.prototype.push = originalPush; // Restore
  
  return customPushCalled &&
         arr.length === 4 &&
         arr[3] === 4;
}

// Test Array.of() with Symbol argument
export function ArrayOfTest1900() {
  let sym = Symbol("test");
  let arr = Array.of(sym);
  return arr.length === 1 && typeof arr[0] === "symbol";
}

// Test Array.of() with Symbol.iterator
export function ArrayOfTest2000() {
  let arr = Array.of(Symbol.iterator);
  return arr.length === 1 && typeof arr[0] === "symbol";
}

// Test Array.of() result can be frozen
export function ArrayOfTest2100() {
  let arr = Array.of(1, 2, 3);
  Object.freeze(arr);
  return Object.isFrozen(arr) && arr.length === 3 && arr[0] === 1;
}

// Test Array.of() result can be sealed
export function ArrayOfTest2200() {
  let arr = Array.of(1, 2, 3);
  Object.seal(arr);
  arr[0] = 100;
  return Object.isSealed(arr) && arr[0] === 100 && arr.length === 3;
}

// Test Array.of() result can be prevented from extensions
export function ArrayOfTest2300() {
  let arr = Array.of(1, 2, 3);
  Object.preventExtensions(arr);
  arr[0] = 100;
  return !Object.isExtensible(arr) && arr[0] === 100 && arr.length === 3;
}

// Test Array.of() result has correct prototype
export function ArrayOfTest2400() {
  let arr = Array.of(1, 2, 3);
  return Object.getPrototypeOf(arr) === Array.prototype;
}

// Test Array.of() can be wrapped by Proxy
export function ArrayOfTest2500() {
  let callCount = 0;
  let handler = {
    apply: function(target, thisArg, args) {
      callCount++;
      return target.apply(thisArg, args);
    }
  };
  let proxiedOf = new Proxy(Array.of, handler);
  let arr = proxiedOf(1, 2, 3);
  return callCount === 1 &&
         Array.isArray(arr) &&
         arr.length === 3 &&
         arr[0] === 1 &&
         arr[1] === 2 &&
         arr[2] === 3;
}

// Test Array.of() result with readonly length property
export function ArrayOfTest2600() {
  let arr = Array.of(1, 2, 3);
  Object.defineProperty(arr, 'length', { writable: false });
  let hasThrown = false;
  try {
    arr.push(4);
  } catch (e) {
    hasThrown = true;
  }
  return arr.length === 3 && hasThrown;
}

// Test Array.of() result elements can have getter/setter
export function ArrayOfTest2700() {
  let arr = Array.of(1, 2, 3);
  let internalValue = 1;
  Object.defineProperty(arr, '0', {
    get: function() { return internalValue * 2; },
    set: function(val) { internalValue = val; }
  });
  let result1 = arr[0] === 2;
  arr[0] = 10;
  let result2 = arr[0] === 20;
  return result1 && result2;
}

// Test Array.of() works with circular reference object
export function ArrayOfTest2800() {
  let obj = {};
  obj.self = obj;
  let arr = Array.of(obj);
  return arr.length === 1 &&
         arr[0] === obj &&
         arr[0].self === obj;
}

// Test hasOwnProperty check for array elements
export function ArrayOfHasOwnPropertyTest01(arr, index) {
  return Object.prototype.hasOwnProperty.call(arr, index);
}

// Test Array.of() result wrapped in Proxy works correctly
export function ArrayOfTest2900() {
  let arr = Array.of(1, 2, 3);
  let handler = {};
  let proxy = new Proxy(arr, handler);
  return Array.isArray(proxy) &&
         proxy.length === 3 &&
         proxy[0] === 1 &&
         proxy[1] === 2 &&
         proxy[2] === 3;
}

// Test Array.of() with mixed type arguments
export function ArrayOfTest3000() {
  let arr = Array.of("foo", 2, "bar", true);
  return Array.isArray(arr) &&
         arr.length === 4 &&
         arr[0] === "foo" &&
         arr[1] === 2 &&
         arr[2] === "bar" &&
         arr[3] === true;
}
