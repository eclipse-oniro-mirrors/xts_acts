/*
* Copyright (C) 2024 HiHope Open Source Organization.
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
// Named function expression - divide two numbers
export const divTwoNum = function div(a: number, b: number): number {
  if (typeof a !== 'number' || typeof b !== 'number') {
    throw new Error('Both inputs must be numbers');
  }
  if (b === 0) {
    throw new Error('Divisor cannot be zero');
  }
  return a / b;
};

// Object method - modify multiple object properties
export function updateObjMultiProp<T extends object>(
  obj: T,
  updates: Partial<T>
): T {
  if (typeof obj !== 'object' || obj === null) {
    throw new Error('First input must be a non-null object');
  }
  Object.assign(obj, updates);
  return obj;
}

// Array parameter - add element to head
export function unshiftArrElem(arr: number[], val: number): number[] {
  if (!Array.isArray(arr) || typeof val !== 'number') {
    throw new Error('First input must be number array, second must be number');
  }
  arr.unshift(val);
  return arr;
}

// Function declaration - return fixed boolean without parameters
export function getFixedBool(): boolean {
  return true;
}

// Anonymous function expression - string repetition
export const strRepeat = function (str: string, times: number): string {
  if (typeof str !== 'string' || typeof times !== 'number' || times < 0) {
    throw new Error('Invalid inputs: string and non-negative number required');
  }
  return str.repeat(times);
};

// Named function expression - Fibonacci sequence
export const numFibonacci = function fib(n: number): number {
  if (typeof n !== 'number' || n < 1 || !Number.isInteger(n)) {
    throw new Error('Input must be a positive integer');
  }
  return n === 1 || n === 2 ? 1 : fib(n - 1) + fib(n - 2);
};

// Function declaration hoisting - call before declaration (Fibonacci)
export function fibonacciHoisted(n: number): number {
  const result = hoistedFib(n);

  function hoistedFib(x: number): number {
    return x === 1 || x === 2 ? 1 : hoistedFib(x - 1) + hoistedFib(x - 2);
  }

  return result;
}

// Function expression - call after definition (normal execution)
export function checkExprHoistAfterDefine(): boolean {
  const exprFunc = (x: number): number => x * 3;
  try {
    exprFunc(4);
    return true;
  } catch {
    return false;
  }
}

// call method - bind this and pass multiple parameters
export function bindThisWithCallMulti(
  obj: { factor: number; multiply: (...args: number[]) => number } | { offset: number; add: (...args: number[]) => number },
  ...args: number[]
): number {
  if ('multiply' in obj && typeof obj.multiply === 'function') {
    return obj.multiply.call(obj, ...args);
  } else if ('add' in obj && typeof obj.add === 'function') {
    return obj.add.call(obj, ...args);
  }
  throw new Error('Object must have "multiply" or "add" function');
}

// apply method - pass array parameters for multiplication
export function multiplyWithApply(arr: number[]): number {

  function multiply(...args: number[]): number {
    return args.length === 0 ? 1 : args.reduce((a, b) => a * b, 1);
  }

  if (!Array.isArray(arr)) {
    throw new Error('Input must be an array');
  }
  return multiply.apply(null, arr);
}

// Recursive call - factorial with base value
export function factorialRecursiveWithBase(n: number, base: number): number {
  if (typeof n !== 'number' || n < 0 || !Number.isInteger(n) || typeof base !== 'number') {
    throw new Error('Invalid inputs: non-negative integer and number required');
  }
  return (n === 0 || n === 1 ? 1 : n * factorialRecursiveWithBase(n - 1, base)) * base;
}

// Function hoisting + multiple default parameters - call before declaration
export function addWithDefaultHoistMulti(a: number): number {
  const result = hoistedAddMulti(a);

  function hoistedAddMulti(x: number, y: number = 3, z: number = 4): number {
    return x + y + z;
  }

  return result;
}

// Function scope - modifying inner variable doesn't affect outer
export function checkInnerVarModify(): boolean {
  let outerVar: number = 5;

  function innerFunc(): void {
    let outerVar: number = 10;
    outerVar = 20;
  }

  innerFunc();
  return outerVar === 5;
}

// Nested function - access multiple outer variables
export function getOuterVarInNestedMulti(a: number, b: number, c: number): number {

  function innerFunc(): number {
    return a + b + c;
  }

  return innerFunc();
}

// Multi-level nesting - sum of four-level variables
export function sumFourLayerVar(a: number, b: number, c: number): number {

  function outer1(): number {

    function outer2(): number {

      function inner1(): number {

        return a + b + c;
      }

      return inner1();
    }

    return outer2();
  }

  return outer1();
}

// Scope conflict - multi-level inner variable override
export function getInnerVarConflictMulti(outerVar: number): number {

  function outerFunc(): number {
    let outerVar: number = 50;

    function innerFunc(): number {
      let outerVar: number = 10;
      return outerVar;
    }

    return innerFunc();
  }

  return outerFunc();
}

// Scope conflict - multi-level inner variable override global
export function getInnerVarOverGlobalMulti(): number {

  function outerFunc(): number {
    let globalVal: number = 100;

    function innerFunc(): number {
      let globalVal: number = 20;
      return globalVal;
    }

    return innerFunc();
  }

  return outerFunc();
}

// Basic closure - counter with specified step
export function createCounterClosureStep(init: number, step: number): () => number {
  let count: number = init;
  return function (): number {
    const current = count;
    count += step;
    return current;
  };
}

// Multi-level closure - sum of four-level variables
export function sumFourLayerClosure(a: number, b: number, c: number, d: number): () => number {

  function outer1(): () => number {

    function outer2(): () => number {

      function inner1(): () => number {
        return function (): number {
          return a + b + c + d;
        };
      }

      return inner1();
    }

    return outer2();
  }

  return outer1();
}

// Closure encapsulation - counter with reset function
export function createCounterObjWithReset(): { increment: () => void; reset: () => void; getCount: () => number } {
  let count: number = 0;
  return {
    increment: () => {
      count++
    },
    reset: (): void => {
      count = 0;
    },
    getCount: (): number => count
  };
}

// Closure保存数组-删除尾部元素
export function popArrInClosure(initArr: number[]): () => number[] {
  const arr: number[] = [...initArr];
  return function (): number[] {
    arr.pop();
    return arr;
  };
}

// Closure保存对象-删除属性
export function deleteObjPropInClosure<T extends object>(initObj: T): (key: keyof T) => T {
  const obj: T = { ...initObj };
  return function (key: keyof T): T {
    delete obj[key];
    return obj;
  };
}

// Multiple closure instances - three independent counters
export function createThreeCounterClosure(): { counterX: () => number; counterY: () => number; counterZ: () => number } {

  function createCounter(init: number): () => number {
    let count: number = init;
    return (): number => count++;
  }

  return {
    counterX: createCounter(1),
    counterY: createCounter(1),
    counterZ: createCounter(1)
  };
}

// arguments object - access last parameter by index
export function getArgByIndexLast(...args: number[]): number {
  // @ts-ignore
  return arguments[arguments.length - 1];
}

// arguments object - length is 0 when no parameters
export function getArgLengthZero(): number {
  // @ts-ignore
  return arguments.length;
}

// arguments object - convert to string
export function convertArgsToStr(...args: string[]): string {
  // @ts-ignore
  return Array.from(arguments).join('');
}

// arguments object - handle indefinite parameters multiplication
export function multiplyAllArgs(...args: number[]): number {
  let product: number = 1;
  // @ts-ignore
  for (let i = 0; i < arguments.length; i++) {
    product *= arguments[i];
  }
  return product;
}

// arguments object - non-array characteristics (no pop method)
export function checkArgsNoPop(...args: number[]): boolean {
  try {
    // @ts-ignore
    arguments.pop();
    return false;
  } catch {
    return true;
  }
}

// Default parameters - multiplication basic feature
export function multiplyWithDefault(a: number, b: number = 6): number {
  return a * b;
}

// Default parameters - multiplication pass undefined to trigger default
export function multiplyWithUndefinedDefault(a: number = 4, b: number = 1): number {
  return a * b;
}

// Rest parameters - collect string parameters
export function collectRestArgsStr(...rest: string[]): string[] {
  return rest;
}

// Default + rest parameters - mixed multiplication
export function multiplyDefaultAndRest(a: number = 1, ...rest: number[]): number {
  return a * rest.reduce((total, curr) => total * curr, 1);
}

// Parameter destructuring - extract multiple object properties
export function getObjMultiPropByDestruct<T extends { id: number; age: number }>(obj: T): { id: number; age: number } {
  const { id, age } = obj;
  return { id, age };
}

// Parameter destructuring - extract multiple array elements
export function getArrMultiElemByDestruct(arr: number[]): { first: number; third: number } {
  const [first, , third] = arr;
  return { first, third };
}

// Arrow function - single parameter triple calculation
export const tripleWithArrow = (x: number): number => x * 3;

// Arrow function - use rest parameters instead of arguments (multiplication)
export const multiplyWithArrowRest = (...rest: number[]): number => {
  return rest.reduce((total, curr) => total * curr, 1);
};

// Arrow function - no prototype property
export function checkArrowNoPrototype(): boolean {
  const arrowFunc = (): void => {
  };
  return arrowFunc.prototype === undefined;
}

// Predefined function - isNaN check
export function checkNaNValue(val: unknown): boolean {
  return isNaN(val as number);
}

// Predefined function - parseInt with radix check
export function parseIntWithRadixValid(str: string, radix: number): number {
  if (typeof str !== 'string' || typeof radix !== 'number' || radix < 2 || radix > 36) {
    throw new Error('Invalid inputs: string and radix (2-36) required');
  }
  return parseInt(str, radix);
}

// Predefined function - parseFloat handle decimals
export function parseFloatWithDecimal(str: string): number {
  if (typeof str !== 'string') {
    throw new Error('Input must be a string');
  }
  return parseFloat(str);
}

// Predefined function - encodeURIComponent check
export function encodeUriComponentValid(str: string): string {
  if (typeof str !== 'string') {
    throw new Error('Input must be a string');
  }
  return encodeURIComponent(str);
}

// Predefined function - decodeURIComponent check
export function decodeUriComponentValid(str: string): string {
  if (typeof str !== 'string') {
    throw new Error('Input must be a string');
  }
  return decodeURIComponent(str);
}

// Function declaration - fourth power of a number
export function calcQuartic(num: number): number {
  if (typeof num !== 'number' || !Number.isFinite(num)) {
    throw new Error('Input must be a finite number');
  }
  return num**4;
}

// Anonymous function expression - modulus of two numbers
export const modTwoNum = function (a: number, b: number): number {
  if (typeof a !== 'number' || typeof b !== 'number') {
    throw new Error('Both inputs must be numbers');
  }
  if (b === 0) {
    throw new Error('Divisor cannot be zero');
  }
  return a % b;
};

// Named function expression - exponentiation of two numbers
export const powTwoNum = function pow(base: number, exponent: number): number {
  if (typeof base !== 'number' || typeof exponent !== 'number') {
    throw new Error('Both inputs must be numbers');
  }
  if (base < 0 && !Number.isInteger(exponent)) {
    throw new Error('Negative base requires integer exponent');
  }
  return base**exponent;
};

// Object method - modify nested object property
export function updateObjNestedProp<T extends object>(
  obj: T,
  path: string,
  value: unknown
): T {
  if (typeof obj !== 'object' || obj === null) {
    throw new Error('First input must be a non-null object');
  }
  const keys = path.split('.');
  let current: any = obj;
  for (let i = 0; i < keys.length - 1; i++) {
    current = current[keys[i]];
    if (typeof current !== 'object' || current === null) {
      throw new Error(`Invalid path: ${keys.slice(0, i + 1).join('.')} is not an object`);
    }
  }
  current[keys[keys.length - 1]] = value;
  return obj;
}

// Array parameter - intercept elements
export function sliceArrElem(arr: number[], start: number, end: number): number[] {
  if (!Array.isArray(arr) || typeof start !== 'number' || typeof end !== 'number') {
    throw new Error('Invalid inputs: number array and two numbers required');
  }
  return arr.slice(start, end);
}

// Function declaration - return fixed array without parameters
export function getFixedArray(): number[] {
  return [5, 10, 15];
}

// Anonymous function expression - string pad start
export const strPadStart = function (str: string, length: number, padStr: string): string {
  if (typeof str !== 'string' || typeof length !== 'number' || typeof padStr !== 'string') {
    throw new Error('Invalid inputs: string, number, string required');
  }
  return str.padStart(length, padStr);
};

// Named function expression - triangular number
export const numTriangular = function triangular(n: number): number {
  if (typeof n !== 'number' || n < 1 || !Number.isInteger(n)) {
    throw new Error('Input must be a positive integer');
  }
  return n * (n + 1) / 2;
};

// Function constructor - string trim whitespace
export function strTrim(): (s: string) => string {
  const trimFunc = new Function(
    's',
    'if(typeof s!==\'string\')throw new Error("Input must be a string");return s.trim();'
  ) as (s: string) => string;
  return trimFunc;
}

// Function declaration hoisting - call before declaration (triangular number)
export function triangularHoisted(n: number): number {
  const result = hoistedTriangular(n);

  function hoistedTriangular(x: number): number {
    return x * (x + 1) / 2;
  }

  return result;
}

// Function expression - multiple calls after definition
export function checkExprCallAfterDefine(a: number, b: number): { call1: number; call2: number } {
  const exprFunc = (x: number, y: number): number => x / y;
  const call1 = exprFunc(a, b);
  const call2 = exprFunc(a, b);
  return { call1, call2 };
}

// call method - bind this to access nested object
export function bindThisWithCallNested(
  obj: { getMax: () => number } | { calc: (...args: any[]) => number },
  ...args: any[]
): number {
  if ('getMax' in obj && typeof obj.getMax === 'function') {
    return obj.getMax.call(obj);
  } else if ('calc' in obj && typeof obj.calc === 'function') {
    return obj.calc.call(obj, ...args);
  }
  throw new Error('Object must have "getMax" or "calc" function');
}

// apply method - pass array parameters for division
export function divideWithApply(arr: (number | number[])[]): number {

  function divide(...args: (number | number[])[]): number {
    const flatArgs = args.flat().filter(val => typeof val === 'number') as number[];
    if (flatArgs.length === 0) {
      return 1;
    }
    return flatArgs.reduce((a, b) => a / b);
  }

  if (!Array.isArray(arr)) {
    throw new Error('Input must be an array');
  }
  return divide.apply(null, arr);
}

// Recursive call - factorial with offset value
export function factorialRecursiveWithOffset(n: number, offset: number): number {
  if (typeof n !== 'number' || n < 0 || !Number.isInteger(n) || typeof offset !== 'number' || offset < 0) {
    throw new Error('Invalid inputs: non-negative integer and non-negative number required');
  }
  // Calculate (n+offset)! / offset!
  const totalFact = (num: number): number => num === 0 || num === 1 ? 1 : num * totalFact(num - 1);
  return totalFact(n + offset) / totalFact(offset);
}

// Function hoisting + nested default parameters - call before declaration
export function addWithDefaultHoistNested(a: number): number {
  const result = hoistedAddNested(a);

  function hoistedAddNested(x: number, y: { c: number; d: number } = { c: 2, d: 3 }): number {
    return x + y.c + y.d;
  }

  return result;
}

// Function scope - inner variable shadows outer variable
export function checkInnerVarShadow(): boolean {
  let outerVar: number = 5;

  function innerFunc(): number {
    let outerVar: number = 10;
    return outerVar;
  }

  return innerFunc() === 10 && outerVar === 5;
}

// Nested function - access shadowed outer variable
export function getOuterVarInNestedShadow(a: number, b: number): number {

  function outerFunc(): number {
    let a: number = 5;

    function innerFunc(): number {
      let b: number = 25;
      return a + b;
    }

    return innerFunc();
  }

  return outerFunc();
}

// Scope conflict - innermost takes effect after multi-level shadowing
export function getInnerVarConflictShadow(outerVar: number): number {

  function l1(): number {
    let outerVar: number = 80;

    function l2(): number {
      let outerVar: number = 50;

      function l3(): number {
        let outerVar: number = 5;
        return outerVar;
      }

      return l3();
    }

    return l2();
  }

  return l1();
}

// Scope conflict - multi-level shadowing overrides global
export function getInnerVarOverGlobalShadow(): number {

  function l1(): number {
    let appVal: number = 400;

    function l2(): number {
      let appVal: number = 300;

      function l3(): number {
        let appVal: number = 10;
        return appVal;
      }

      return l3();
    }

    return l2();
  }

  return l1();
}

// Basic closure - negative step counter
export function createCounterClosureNegStep(init: number, step: number): () => number {
  let count: number = init;
  return function (): number {
    const current = count;
    count -= step;
    return current;
  };
}

// Multi-level closure - sum of five-level variables
export function sumFiveLayerClosure(a: number, b: number, c: number, d: number, e: number): () => number {

  function l1(): () => number {

    function l2(): () => number {

      function l3(): () => number {

        function l4(): () => number {
          return function (): number {
            return a + b + c + d + e;
          };
        }

        return l4();
      }

      return l3();
    }

    return l2();
  }

  return l1();
}

// Closure encapsulation - counter with upper limit
export function createCounterObjWithLimit(limit: number): { increment: () => void; getCount: () => number } {
  let count: number = 0;
  return {
    increment: (): void => {
      if (count < limit) {
        count++;
      }
    },
    getCount: (): number => count
  };
}

// Closure保存数组-删除头部元素
export function shiftArrInClosure(initArr: number[]): () => number[] {
  const arr: number[] = [...initArr];
  return function (): number[] {
    arr.shift();
    return arr;
  };
}

// Closure保存对象-修改嵌套属性
export function updateObjNestedInClosure<T extends { user: { age: number } }>(initObj: T): (val: number) => T {
  const obj: T = { ...initObj };
  return function (val: number): T {
    obj.user.age += val;
    return obj;
  };
}

// Multiple closure instances - four independent counters
export function createFourCounterClosure(): { counter1: () => number; counter2: () => number; counter3: () => number; counter4: () => number } {

  function createCounter(init: number): () => number {
    let count: number = init;
    return (): number => count++;
  }

  return {
    counter1: createCounter(1),
    counter2: createCounter(1),
    counter3: createCounter(1),
    counter4: createCounter(1)
  };
}

// arguments object - access parameters in specified range by index
export function getArgByIndexRange(...args: (number | number)[]): number {
  const [start, end] = args.slice(-2) as number[];
  const targetArgs = args.slice(0, -2) as number[];
  let sum = 0;
  for (let i = start; i <= end; i++) {
    if (i >= 0 && i < targetArgs.length) {
      sum += targetArgs[i];
    }
  }
  return sum;
}

// arguments object - maximum parameter count check
export function getArgLengthMax(...args: number[]): number {
  // @ts-ignore
  return arguments.length;
}

// arguments object - convert to key-value pair object
export function convertArgsToObj(keys: string[], values: number[]): Record<string, number> {
  const obj: Record<string, number> = {};
  // @ts-ignore
  const args = Array.from(arguments);
  if (args.length !== 2 || !Array.isArray(args[0]) || !Array.isArray(args[1])) {
    throw new Error('Input must be two arrays');
  }
  const [keyArr, valArr] = args;
  keyArr.forEach((key, idx) => {
    if (typeof key === 'string' && typeof valArr[idx] === 'number') {
      obj[key] = valArr[idx];
    }
  });
  return obj;
}

// arguments object - handle indefinite parameters (continuous division)
export function divideAllArgs(...args: number[]): number {
  let result = 1;
  // @ts-ignore
  for (let i = 0; i < arguments.length; i++) {
    if (i === 0) {
      result = arguments[i];
    } else {
      result /= arguments[i];
    }
  }
  return result;
}

// arguments object - non-array characteristics (no shift method)
export function checkArgsNoShift(...args: number[]): boolean {
  try {
    // @ts-ignore
    arguments.shift();
    return false;
  } catch {
    return true;
  }
}

// Default parameters - exponentiation basic feature
export function powWithDefault(base: number, exponent: number = 2): number {
  return base**exponent;
}

// Default parameters - exponentiation pass undefined to trigger default
export function powWithUndefinedDefault(base: number = 2, exponent: number = 3): number {
  return base**exponent;
}

// Rest parameters - collect mixed number and string parameters
export function collectRestArgsNumStr(...rest: (number | string)[]): (number | string)[] {
  return rest;
}

// Default + rest parameters - mixed exponentiation
export function powDefaultAndRest(base: number = 1, ...rest: number[]): number {
  const exponent = rest.reduce((a, b) => a * b, 1);
  return base**exponent;
}

// Parameter destructuring - extract nested object properties
export function getObjNestedPropByDestruct<T extends { data: { user: { name: string } } }>(obj: T): string {
  const { data: { user: { name } } } = obj;
  return name;
}

// Parameter destructuring - extract nested array elements
export function getArrNestedElemByDestruct(arr: number[][]): number {
  const [[, second]] = arr;
  return second;
}

// Arrow function - single parameter fourth power calculation
export const quadWithArrow = (x: number): number => x**4;

// Arrow function - use rest parameters instead of arguments (continuous division)
export const divideWithArrowRest = (...rest: number[]): number => {
  if (rest.length === 0) {
    return 1;
  }
  return rest.reduce((a, b) => a / b);
};

// Arrow function - no arguments object
export function checkArrowNoArguments(...args: number[]): boolean {
  const arrowFunc = (...rest: number[]): void => {
    try {
      // @ts-ignore
      console.log(arguments);
    } catch {
      return;
    }
    throw new Error('Arguments exists');
  };
  try {
    arrowFunc(...args);
    return true;
  } catch {
    return false;
  }
}

// Predefined function - check infinite value
export function checkInfiniteValue(val: number): boolean {
  if (typeof val !== 'number') {
    throw new Error('Input must be a number');
  }
  return isFinite(val);
}
