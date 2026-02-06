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
// Function declaration - number to the fifth power
export function calcQuintic(num: number): number {
  if (typeof num !== 'number' || !Number.isFinite(num)) {
    throw new Error('Input must be a finite number');
  }
  return num **5;
}

// Anonymous function expression - greatest common divisor of two numbers
export const gcdTwoNum = function (a: number, b: number): number {
  if (typeof a !== 'number' || typeof b !== 'number' || a <= 0 || b <= 0) {
    throw new Error('Inputs must be positive numbers');
  }
  while (b !== 0) {
    [a, b] = [b, a % b];
  }
  return a;
};

// Named function expression - string replacement
export const strReplace = function replaceStr(str: string, search: string, replacement: string): string {
  if (typeof str !== 'string' || typeof search !== 'string' || typeof replacement !== 'string') {
    throw new Error('All inputs must be strings');
  }
  return str.replace(search, replacement);
};

// Object method - batch set properties
export function setObjMultiProps<T extends object>(obj: T, props: Partial<T>): T {
  if (typeof obj !== 'object' || obj === null || typeof props !== 'object' || props === null) {
    throw new Error('Both inputs must be non-null objects');
  }
  Object.entries(props).forEach(([key, value]) => {
    (obj as Record<string, unknown>)[key] = value;
  });
  return obj;
}

// Array parameter - number sorting
export function sortArrNum(arr: number[]): number[] {
  if (!Array.isArray(arr) || !arr.every(item => typeof item === 'number')) {
    throw new Error('Input must be an array of numbers');
  }
  return arr.sort((a, b) => a - b);
}

// Function declaration - return fixed boolean without parameters
export function getFixedBoolean(): boolean {
  return false;
}

// Anonymous function expression - string padding at the end
export const strPadEnd = function (str: string, length: number, padStr: string): string {
  if (typeof str !== 'string' || typeof length !== 'number' || typeof padStr !== 'string') {
    throw new Error('Inputs must be string, number, string');
  }
  return str.padEnd(length, padStr);
};

// Named function expression - factorial calculation
export const numFactorial = function fact(n: number): number {
  if (typeof n !== 'number' || n < 0 || !Number.isInteger(n)) {
    throw new Error('Input must be a non-negative integer');
  }
  return n === 0 ? 1 : n * fact(n - 1);
};

// Function expression - accumulate results of multiple calls
export function checkExprMultiCall(times: number): { total: number } {
  let count = 0;
  const exprFunc = (): void => {
    count++;
  };
  for (let i = 0; i < times; i++) {
    exprFunc();
  }
  return { total: count };
}

// call method - pass object parameters
export function bindThisWithCallObj(
  obj: { format: (arg: any) => string } | { calculate: (...args: any[]) => number },
  ...args: any[]
): string | number {
  if ('format' in obj && typeof obj.format === 'function') {
    return obj.format.call(obj, ...args);
  } else if ('calculate' in obj && typeof obj.calculate === 'function') {
    return obj.calculate.call(obj, ...args);
  }
  throw new Error('Object must have "format" or "calculate" function');
}


// Recursive call - Fibonacci with upper limit
export function fibonacciRecursiveWithLimit(limit: number): number[] {
  if (typeof limit !== 'number' || limit < 1) {
    throw new Error('Limit must be a positive number');
  }
  const sequence: number[] = [];

  function fib(a: number, b: number): void {
    if (a > limit) {
      return;
    }
    sequence.push(a);
    fib(b, a + b);
  }

  fib(1, 1);
  return sequence;
}

// Function hoisting + default parameter calculation
export function multiplyWithDefaultHoist(a: number, b: number): number {
  const result = hoistedMultiply(a, b);

  function hoistedMultiply(x: number, y: number, z: number = 2): number {
    return x * y * z;
  }

  return result;
}

// Function scope - let variable shadowing
export function checkInnerLetShadow(): boolean {
  let outerVar = 10;

  function innerFunc() {
    let outerVar = 20;
    return outerVar;
  }

  return innerFunc() === 20 && outerVar === 10;
}

// Nested function - access outer variable in deep nesting
export function getOuterVarInDeepNested(a: number, b: number): number {

  function layer1() {

    function layer2() {

      function layer3() {
        return a + b;
      }

      return layer3();
    }

    return layer2();
  }

  return layer1();
}


// Scope conflict - global variable shadowed by multiple layers
export function getGlobalVarShadowed(): number {

  function l1() {
    const appConfig = { version: 2.0 };

    function l2() {
      const appConfig = { version: 3.0 };
      return appConfig.version;
    }

    return l2();
  }

  return l1();
}

// Basic closure - accumulator with step
export function createAccumulatorClosure(initial: number): (step: number) => number {
  let total = initial;
  return function (step: number): number {
    total += step;
    return total;
  };
}

// Closure encapsulation - counter with adjustable step
export function createCounterWithStep(initial: number,
  step: number): { getNext: () => number; setStep: (s: number) => void } {
  let count = initial;
  let currentStep = step;
  return {
    getNext: (): number => {
      const current = count;
      count += currentStep;
      return current;
    },
    setStep: (s: number): void => {
      currentStep = s;
    }
  };
}

// Closure保存数组-过滤元素
export function filterArrInClosure(initArr: number[]): (min: number) => number[] {
  const arr = [...initArr];
  return function (min: number): number[] {
    return arr.filter(item => item >= min);
  };
}

// Multiple closure instances - five independent counters
export function createFiveCounterClosure(): Record<string, () => number> {

  function createCounter(init: number): () => number {
    let count = init;
    return () => count++;
  }

  return {
    c1: createCounter(1),
    c2: createCounter(1),
    c3: createCounter(1),
    c4: createCounter(1),
    c5: createCounter(1)
  };
}

// arguments object - sum of even-indexed parameters
export function getArgByIndexEven(...args: number[]): number {
  let sum = 0;
  // @ts-ignore
  for (let i = 0; i < arguments.length; i++) {
    if (i % 2 === 0) {
      sum += arguments[i];
    }
  }
  return sum;
}

// arguments object - minimum parameter count check
export function getArgLengthMin(): number {
  // @ts-ignore
  return arguments.length;
}

// arguments object - convert to Map
export function convertArgsToMap(keys: string[], values: number[]): Map<string, number> {
  const map = new Map<string, number>();
  // @ts-ignore
  const args = Array.from(arguments);
  if (args.length !== 2 || !Array.isArray(args[0]) || !Array.isArray(args[1])) {
    throw new Error('Input must be two arrays');
  }
  args[0].forEach((key, idx) => {
    if (typeof key === 'string' && typeof args[1][idx] === 'number') {
      map.set(key, args[1][idx]);
    }
  });
  return map;
}

// arguments object - sum of all parameters
export function sumAllArgs(...args: number[]): number {
  let sum = 0;
  // @ts-ignore
  for (let i = 0; i < arguments.length; i++) {
    sum += arguments[i];
  }
  return sum;
}

// arguments object - non-array特性（无splice方法）
export function checkArgsNoSplice(...args: number[]): boolean {
  try {
    // @ts-ignore
    arguments.splice(0, 1);
    return false;
  } catch {
    return true;
  }
}

// Default parameters - basic summation feature
export function sumWithDefault(a: number, b: number = 10): number {
  return a + b;
}

// Default parameters - summation with undefined triggering default
export function sumWithUndefinedDefault(a: number = 2, b: number = 3): number {
  return a + b;
}

// Rest parameters - collect mixed type parameters
export function collectRestArgsMixed(...rest: (number | string | boolean)[]): (number | string | boolean)[] {
  return rest;
}

// Default + rest parameters - mixed summation
export function sumDefaultAndRest(a: number = 1, ...rest: number[]): number {
  return a + rest.reduce((total, curr) => total + curr, 0);
}

// Parameter destructuring - deep array element extraction
export function getArrDeepElemByDestruct(arr: number[][][]): number {
  const [[, [first]]] = arr;
  return first;
}

// Arrow function - single parameter to the fifth power calculation
export const quintWithArrow = (x: number): number => x** 5;

// Arrow function - sum with rest parameters
export const sumWithArrowRest = (...rest: number[]): number => {
  return rest.reduce((a, b) => a + b, 0);
};

// Predefined function - JSON.parse to parse JSON (replace eval)
export function parseJsonWithJSON(jsonStr: string): object {
  if (typeof jsonStr !== 'string') {
    throw new Error('Input must be a JSON string');
  }
  return JSON.parse(jsonStr);
}

// Predefined function - Number.isInteger to check integer
export function checkIntegerValue(val: number): boolean {
  if (typeof val !== 'number') {
    throw new Error('Input must be a number');
  }
  return Number.isInteger(val);
}

// Predefined function - parseFloat to handle integer strings
export function parseFloatWithIntStr(str: string): number {
  if (typeof str !== 'string') {
    throw new Error('Input must be a string');
  }
  return parseFloat(str);
}

// Predefined function - encodeURI to handle special characters
export function encodeUriSpecial(str: string): string {
  if (typeof str !== 'string') {
    throw new Error('Input must be a string');
  }
  return encodeURI(str);
}

// Predefined function - decodeURI to handle special characters
export function decodeUriSpecial(str: string): string {
  if (typeof str !== 'string') {
    throw new Error('Input must be a string');
  }
  return decodeURI(str);
}

// Function declaration - number cubed
export function calcCube(num: number): number {
  if (typeof num !== 'number' || !Number.isFinite(num)) {
    throw new Error('Input must be a finite number');
  }
  return num **3;
}

// Anonymous function expression - least common multiple of two numbers
export const lcmTwoNum = function (a: number, b: number): number {
  if (typeof a !== 'number' || typeof b !== 'number' || a <= 0 || b <= 0) {
    throw new Error('Inputs must be positive numbers');
  }
  // Calculate LCM using GCD: (a*b)/gcd(a,b)
  const gcd = (x: number, y: number): number => y === 0 ? x : gcd(y, x % y);
  return (a * b) / gcd(a, b);
};

// Named function expression - string to uppercase
export const strToUpper = function toUpperCase(str: string): string {
  if (typeof str !== 'string') {
    throw new Error('Input must be a string');
  }
  return str.toUpperCase();
};

// Function constructor - create alert function
export function createAlertFunc(): (msg: string) => string {
  const alertFunc = new Function(
    'msg',
    'if (typeof msg !== "string") throw new Error("Message must be a string");' +
      'return "[ALERT] " + msg;'
  ) as (msg: string) => string;
  return alertFunc;
}

// Object method - batch set nested properties
export function setObjNestedProps<T extends object>(obj: T, props: Partial<T>): T {
  if (typeof obj !== 'object' || obj === null || typeof props !== 'object' || props === null) {
    throw new Error('Both inputs must be non-null objects');
  }

  const setNested = (target: any, source: any): void => {
    Object.entries(source).forEach(([key, value]) => {
      if (typeof value === 'object' && value !== null && !Array.isArray(value)) {
        if (!target[key]) target[key] = {};
        setNested(target[key], value);
      } else {
        target[key] = value;
      }
    });
  };

  setNested(obj, props);
  return obj;
}

// Array parameter - reverse array
export function reverseArr(arr: number[]): number[] {
  if (!Array.isArray(arr) || !arr.every(item => typeof item === 'number')) {
    throw new Error('Input must be an array of numbers');
  }
  return [...arr].reverse(); // Return new array to avoid modifying original
}

// Function declaration - return random boolean without parameters
export function getRandomBoolean(): boolean {
  return Math.random() > 0.5;
}

// Anonymous function expression - string truncation
export const strTruncate = function (str: string, length: number): string {
  if (typeof str !== 'string' || typeof length !== 'number' || length < 0) {
    throw new Error('Invalid inputs: string and non-negative number required');
  }
  return str.length <= length ? str : `${str.slice(0, length)}...`;
};

// Named function expression - square root calculation
export const numSquareRoot = function squareRoot(n: number): number {
  if (typeof n !== 'number' || n < 0) {
    throw new Error('Input must be a non-negative number');
  }
  return Math.sqrt(n);
};

// Function declaration hoisting - call before declaration (Fibonacci)
export function fibonacciHoisted(n: number): number {
  const result = hoistedFib(n);
  function hoistedFib(x: number): number {
    if (x <= 2) return 1;
    return hoistedFib(x - 1) + hoistedFib(x - 2);
  }
  return result;
}

// Function expression - multiple calls with caching
export function checkExprMemoization(n: number): { calls: number; result: number } {
  let callCount = 0;
  const memo: Record<number, number> = {};
  const factorial = function (x: number): number {
    callCount++;
    if (x === 0) return 1;
    if (memo[x]) return memo[x];
    memo[x] = x * factorial(x - 1);
    return memo[x];
  };
  const result1 = factorial(n);
  const result2 = factorial(n); // Second call will hit cache
  return { calls: callCount, result: result1 };
}

// call method - access deep nested object
export function bindThisWithCallDeep(
  obj: { getFullName: () => string } | { compute: (...args: any[]) => number },
  ...args: any[]
): string | number {
  if ('getFullName' in obj && typeof obj.getFullName === 'function') {
    return obj.getFullName.call(obj);
  } else if ('compute' in obj && typeof obj.compute === 'function') {
    return obj.compute.call(obj, ...args);
  }
  throw new Error('Object must have "getFullName" or "compute" function');
}

// apply method - nested array product
export function productWithApply(arr: (number | number[])[]): number {
  function product(...args: (number | number[])[]): number {
    const flatArgs = args.flat(Infinity).filter(val => typeof val === 'number') as number[];
    return flatArgs.length === 0 ? 1 : flatArgs.reduce((a, b) => a * b, 1);
  }
  if (!Array.isArray(arr)) {
    throw new Error('Input must be an array');
  }
  return product.apply(null, arr);
}

// Recursive call - factorial with cache
export function factorialRecursiveWithCache(n: number): { result: number; cacheHits: number } {
  if (typeof n !== 'number' || n < 0 || !Number.isInteger(n)) {
    throw new Error('Input must be a non-negative integer');
  }
  const cache: Record<number, number> = {};
  let cacheHits = 0;

  function fact(x: number): number {
    if (x === 0) return 1;
    if (cache[x]) {
      cacheHits++;
      return cache[x];
    }
    cache[x] = x * fact(x - 1);
    return cache[x];
  }

  const result = fact(n);
  return { result, cacheHits };
}

// Function hoisting + deep default parameters
export function addWithDefaultHoistDeep(a: number, b: number): number {
  const result = hoistedAddDeep(a, b);
  function hoistedAddDeep(
    x: number,
    y: number,
    c: { d: number; e: { f: number } } = { d: 4, e: { f: 5 } }
  ): number {
    return x + y + c.d + c.e.f;
  }
  return result;
}

// Function scope - const variable shadowing
export function checkInnerConstShadow(): boolean {
  const outerVar = 20;
  function innerFunc() {
    const outerVar = 40;
    return outerVar;
  }
  return innerFunc() === 40 && outerVar === 20;
}


// Scope conflict - global configuration shadowed by multiple layers
export function getGlobalConfigShadowed(): boolean {
  function l1() { const appConfig = { debug: true };
    function l2() { const appConfig = { debug: false };
      function l3() { const appConfig = { debug: true };
        return appConfig.debug;
      }
      return l3();
    }
    return l2();
  }
  return l1();
}

// Basic closure - multiplier with coefficient
export function createMultiplierClosure(factor: number): (num: number) => number {
  if (typeof factor !== 'number' || !Number.isFinite(factor)) {
    throw new Error('Factor must be a finite number');
  }
  return function(num: number): number {
    if (typeof num !== 'number' || !Number.isFinite(num)) {
      throw new Error('Input must be a finite number');
    }
    return factor * num;
  };
}

// Closure encapsulation - counter with upper and lower limits
export function createBoundedCounter(initial: number, step: number, max: number): {
  increment: () => void;
  getValue: () => number;
} {
  if (![initial, step, max].every(n => typeof n === 'number' && Number.isFinite(n))) {
    throw new Error('All parameters must be finite numbers');
  }
  let count = initial;
  return {
    increment: (): void => {
      const next = count + step;
      if (next <= max) count = next;
    },
    getValue: (): number => count
  };
}

// Closure保存数组-映射转换
export function mapArrInClosure(initArr: number[]): (callback: (n: number) => number) => number[] {
  if (!Array.isArray(initArr) || !initArr.every(n => typeof n === 'number')) {
    throw new Error('Input must be an array of numbers');
  }
  const arr = [...initArr];
  return function(callback: (n: number) => number): number[] {
    if (typeof callback !== 'function') {
      throw new Error('Callback must be a function');
    }
    return arr.map(callback);
  };
}

// Closure封装-冻结对象保护
export function freezeObjInClosure<T extends object>(initObj: T): {
  tryModify: (key: string, value: unknown) => boolean;
  getObj: () => Readonly<T>;
} {
  if (typeof initObj !== 'object' || initObj === null) {
    throw new Error('Input must be a non-null object');
  }
  const frozenObj = Object.freeze({ ...initObj });
  return {
    tryModify: (key: string, value: unknown): boolean => {
      try {
        // @ts-ignore
        frozenObj[key] = value;
        return true; // Modification successful (won't actually happen)
      } catch {
        return false; // Modification failed
      }
    },
    getObj: (): Readonly<T> => frozenObj
  };
}

// Multiple closure instances - six independent counters
export function createSixCounterClosure(): Record<string, () => number> {
  function createCounter(init: number): () => number {
    let count = init;
    return () => count++;
  }
  return {
    c1: createCounter(1),
    c2: createCounter(1),
    c3: createCounter(1),
    c4: createCounter(1),
    c5: createCounter(1),
    c6: createCounter(1)
  };
}

// arguments object - product of odd-indexed parameters
export function getArgByIndexOdd(...args: number[]): number {
  let product = 1;
  // @ts-ignore
  for (let i = 0; i < arguments.length; i++) {
    if (i % 2 === 1) product *= arguments[i];
  }
  return product;
}

// arguments object - average of parameter count
export function getArgLengthAverage(...args: number[]): number {
  // @ts-ignore
  return arguments.length;
}

// arguments object - convert to Set
export function convertArgsToSet(...args: number[]): Set<number> {
  // @ts-ignore
  return new Set(arguments);
}

// arguments object - product of all parameters
export function productAllArgs(...args: number[]): number {
  let product = 1;
  // @ts-ignore
  for (let i = 0; i < arguments.length; i++) {
    product *= arguments[i];
  }
  return product;
}

// arguments object - non-array feature (no reduce method)
export function checkArgsNoReduce(...args: number[]): boolean {
  try {
    // @ts-ignore
    arguments.reduce((a, b) => a + b, 0);
    return false;
  } catch {
    return true;
  }
}

// Default parameters - basic product feature
export function productWithDefault(a: number, b: number = 5): number {
  return a * b;
}

// Default parameters - product with undefined triggering default
export function productWithUndefinedDefault(a: number = 3, b: number = 4): number {
  return a * b;
}

// Rest parameters - collect complex type parameters
export function collectRestArgsComplex(...rest: (number | { id: number } | boolean[])[]):
  (number | { id: number } | boolean[])[] {
  return rest;
}

// Default + rest parameters - mixed product
export function productDefaultAndRest(a: number = 1, ...rest: number[]): number {
  return a * rest.reduce((total, curr) => total * curr, 1);
}

// Parameter destructuring - complex object property extraction
export function getObjComplexPropByDestruct<T extends {
  company: {
    departments: { name: string; employees: { id: number }[] }[]
  }
}>(obj: T): number {
  const { company: { departments } } = obj;
  const itDept = departments.find(dept => dept.name === 'IT');
  return itDept?.employees[0].id ?? -1;
}

// Parameter destructuring - complex array element extraction
export function getArrComplexElemByDestruct(arr: (number | string)[][][]): number {
  const [[, [, val1]], [[, val2]]] = arr;
  return val2 as number;
}

// Arrow function - single parameter cubed calculation
export const cubeWithArrow = (x: number): number => x** 3;


// Arrow function - product with rest parameters
export const productWithArrowRest = (...rest: number[]): number => {
  return rest.reduce((a, b) => a * b, 1);
};

// Arrow function - no prototype property
export function checkArrowNoPrototype(): boolean {
  const arrowFunc = () => {};
  return arrowFunc.prototype === undefined;
}

// Predefined function - JSON.parse with reviver
export function parseJsonWithReviver(jsonStr: string): { name: string; price: number } {
  if (typeof jsonStr !== 'string') {
    throw new Error('Input must be a JSON string');
  }
  return JSON.parse(jsonStr, (key, value) => {
    if (key === 'price') return parseFloat(value);
    return value;
  });
}

// Predefined function - Number.isSafeInteger to check safe integer
export function checkSafeIntegerValue(val: number): boolean {
  if (typeof val !== 'number') {
    throw new Error('Input must be a number');
  }
  return Number.isSafeInteger(val);
}

// Predefined function - parseFloat to handle hexadecimal strings
export function parseFloatWithHexStr(str: string): number {
  if (typeof str !== 'string') {
    throw new Error('Input must be a string');
  }
  return parseFloat(str);
}

// Predefined function - encodeURIComponent to handle special characters
export function encodeUriComponentSpecial(str: string): string {
  if (typeof str !== 'string') {
    throw new Error('Input must be a string');
  }
  return encodeURIComponent(str);
}

// Predefined function - decodeURIComponent to handle special characters
export function decodeUriComponentSpecial(str: string): string {
  if (typeof str !== 'string') {
    throw new Error('Input must be a string');
  }
  return decodeURIComponent(str);
}