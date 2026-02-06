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
// Function declaration - square of a number
export function calcSquare(num: number): number {
  if (typeof num !== 'number' || !Number.isFinite(num)) {
    throw new Error('Input must be a finite number');
  }
  return num * num;
}

// Anonymous function expression - add two numbers
export const addTwoNum = function (a: number, b: number): number {
  if (typeof a !== 'number' || typeof b !== 'number') {
    throw new Error('Both inputs must be numbers');
  }
  return a + b;
};

// Named function expression - multiply two numbers
export const mulTwoNum = function mul(a: number, b: number): number {
  if (typeof a !== 'number' || typeof b !== 'number') {
    throw new Error('Both inputs must be numbers');
  }
  return a * b;
};

// Object method - modify object property
export function updateObjProp<T extends object, K extends keyof T>(
  obj: T,
  key: K,
  value: T[K]
): T {
  if (typeof obj !== 'object' || obj === null) {
    throw new Error('First input must be a non-null object');
  }
  obj[key] = value;
  return obj;
}

// Array parameter - add element
export function pushArrElem(arr: number[], val: number): number[] {
  if (!Array.isArray(arr) || typeof val !== 'number') {
    throw new Error('First input must be number array, second must be number');
  }
  arr.push(val);
  return arr;
}

// Function declaration - return fixed number without parameters
export function getFixedNum(): number {
  return 99;
}

// Anonymous function expression - string concatenation
export const strConcat = function (str1: string, str2: string): string {
  if (typeof str1 !== 'string' || typeof str2 !== 'string') {
    throw new Error('Both inputs must be strings');
  }
  return str1 + str2;
};

// Named function expression - factorial calculation
export const numFactorial = function fact(n: number): number {
  if (typeof n !== 'number' || n < 0 || !Number.isInteger(n)) {
    throw new Error('Input must be a non-negative integer');
  }
  return n === 0 || n === 1 ? 1 : n * fact(n - 1);
};


// Function declaration hoisting - call before declaration (factorial)
export function factorialHoisted(n: number): number {
  // Call first (declaration is below, no nested functions)
  const result = hoistedFact(n);

  // Function declaration (independent, not nested)
  function hoistedFact(x: number): number {
    return x === 0 || x === 1 ? 1 : x * hoistedFact(x - 1);
  }

  return result;
}

// Function expression - no hoisting (calling first causes error)
export function checkExprNoHoist(): boolean {
  try {
    // @ts-ignore: Intentionally call undefined expression function
    exprFunc(5);
    return false;
  } catch {
    // Define expression function later (independent, not nested)
    const exprFunc = (x: number): number => x * 2;
    return true;
  }
}

// call method - bind this to object
export function bindThisWithCall(obj: { value: number; getValue: () => number }): number {
  if (typeof obj.getValue !== 'function') {
    throw new Error('Object must have a "getValue" function');
  }
  return obj.getValue.call(obj);
}

// apply method - pass array parameters for summation
export function sumWithApply(arr: number[]): number {
  if (!Array.isArray(arr) || arr.length !== 3) {
    throw new Error('Input must be a 3-element number array');
  }

  // Independent summation function, not nested
  function sum(a: number, b: number, c: number): number {
    return a + b + c;
  }

  return sum.apply(null, arr);
}

// Recursive call - factorial (independent function, not nested)
export function factorialRecursive(n: number): number {
  if (typeof n !== 'number' || n < 0 || !Number.isInteger(n)) {
    throw new Error('Input must be a non-negative integer');
  }
  return n === 0 || n === 1 ? 1 : n * factorialRecursive(n - 1);
}

// Function hoisting + default parameters - call before declaration
export function addWithDefaultHoist(a: number): number {
  // Call first (declaration is below)
  const result = hoistedAdd(a);

  // Independent function declaration, not nested
  function hoistedAdd(x: number, y: number = 6): number {
    return x + y;
  }

  return result;
}

// call method - pass multiple parameters for multiplication
export function mulWithCall(a: number, b: number, c: number): number {

  // Independent multiplication function, not nested
  function mul(x: number, y: number, z: number): number {
    return x * y * z;
  }

  return mul.call(null, a, b, c);
}

// apply method - bind this + pass parameters
export function addWithApplyBind(obj: { base: number; add: (x: number) => number }, x: number): number {
  if (typeof obj.add !== 'function') {
    throw new Error('Object must have an "add" function');
  }
  return obj.add.apply(obj, [x]);
}

// Function scope - inner variables inaccessible from outside
export function checkInnerVarAccess(): boolean {

  // Independent inner function, no nested functions
  function innerFunc(): void {
    const innerVar: number = 10;
  }

  innerFunc();
  try {
    // @ts-ignore: Intentionally access inner variable
    console.log(innerVar);
    return false;
  } catch {
    return true;
  }
}

// Nested function - access outer variable (no nested function calls)
export function getOuterVarInNested(outerVar: number): number {

  // Independent nested function, only accesses variable without calling other functions
  function innerFunc(): number {
    return outerVar * 2;
  }

  return innerFunc();
}

// Multi-level nesting - sum of three-level variables (no nested function calls)
export function sumThreeLayerVar(a: number, b: number, c: number): number {

  // Three-level independent functions, only access variables without calling other functions
  function outer(): number {

    function middle(): number {

      function inner(): number {
        return a + b + c;
      }

      return inner();
    }

    return middle();
  }

  return outer();
}

// Scope conflict - inner variable overrides outer
export function getInnerVarConflict(outerVar: number): number {

  function innerFunc(): number {
    const outerVar: number = 10; // Override outer variable
    return outerVar;
  }

  return innerFunc();
}

// Scope conflict - inner variable overrides global
export function getInnerVarOverGlobal(): number {

  function innerFunc(): number {
    const globalNum: number = 20; // Override global variable
    return globalNum;
  }

  return innerFunc();
}

// Scope conflict - parameter overrides outer variable
export function getParamOverOuter(outerVar: number): number {

  function innerFunc(x: number = 15): number { // Parameter overrides outer variable
    return x;
  }

  return innerFunc();
}

// Basic closure - counter (no nested function calls)
export function createCounterClosure(init: number): () => number {
  let count: number = init;
  // Independent closure function, no nested functions
  return function (): number {
    return count++;
  };
}

// Multi-level closure - sum of three-level variables (no nested function calls)
export function sumThreeLayerClosure(a: number, b: number, c: number): () => number {

  function outer(): () => number {

    function middle(): () => number {
      // Independent closure function, only accesses variables
      return function (): number {
        return a + b + c;
      };
    }

    return middle();
  }

  return outer();
}

// Closure encapsulation - counter object (no nested function calls)
export function createCounterObj(): { increment: () => void; decrement: () => void; getCount: () => number } {
  let count: number = 0;
  // Independent methods, no nested functions
  return {
    increment: () => {
      count++
    },
    decrement: () => {
      count--
    },
    getCount: (): number => count
  };
}

// Closure保存数组-添加元素（无嵌套函数调用）
export function pushArrInClosure(initArr: number[]): (val: number) => number[] {
  const arr: number[] = [...initArr];
  // Independent closure function, only operates on array
  return function (val: number): number[] {
    arr.push(val);
    return arr;
  };
}

// Closure保存对象-修改属性（无嵌套函数调用）
export function updateObjInClosure(initObj: { score: number }): (val: number) => { score: number } {
  const obj: { score: number } = { ...initObj };
  // Independent closure function, only modifies object
  return function (val: number): { score: number } {
    obj.score += val;
    return obj;
  };
}

// Multiple closure instances - independent variables (no nested function calls)
export function createTwoCounterClosure(): { counterA: () => number; counterB: () => number } {

  // Independent counter creation function
  function createCounter(init: number): () => number {
    let count: number = init;
    return (): number => count++;
  }

  return {
    counterA: createCounter(1),
    counterB: createCounter(1)
  };
}

// arguments object - access parameter by index
export function getArgByIndex(...args: number[]): number {
  // @ts-ignore: Use arguments object
  return arguments[1];
}

// arguments object - get parameter length
export function getArgLength(...args: number[]): number {
  // @ts-ignore: Use arguments object
  return arguments.length;
}

// arguments object - convert to array
export function convertArgsToArray(...args: number[]): number[] {
  // @ts-ignore: Use arguments object
  return Array.from(arguments);
}

// arguments object - handle indefinite parameters summation
export function sumAllArgs(...args: number[]): number {
  let sum: number = 0;
  // @ts-ignore: Use arguments object
  for (let i = 0; i < arguments.length; i++) {
    sum += arguments[i];
  }
  return sum;
}

// arguments object - non-array characteristics (no push method)
export function checkArgsNoPush(...args: number[]): boolean {
  try {
    // @ts-ignore: Intentionally call push
    arguments.push(10);
    return false;
  } catch {
    return true;
  }
}

// Default parameters - basic feature
export function addWithDefault(a: number, b: number = 8): number {
  return a + b;
}

// Default parameters - pass undefined to trigger default
export function addWithUndefinedDefault(a: number = 12): number {
  return a;
}

// Rest parameters - collect parameters
export function collectRestArgs(...rest: number[]): number[] {
  return rest;
}

// Default + rest parameters - mixed summation
export function sumDefaultAndRest(a: number = 3, ...rest: number[]): number {
  return a + rest.reduce((total, curr) => total + curr, 0);
}

// Parameter destructuring - object destructuring
export function getObjPropByDestruct({ age }: { name: string; age: number }): number {
  return age;
}

// Parameter destructuring - array destructuring
export function getArrElemByDestruct([, second]: number[]): number {
  return second;
}

// Arrow function - single parameter concise syntax
export const doubleWithArrow = (x: number): number => x * 2;

// Arrow function - use rest parameters instead of arguments
export const sumWithArrowRest = (...rest: number[]): number => {
  return rest.reduce((total, curr) => total + curr, 0);
};

// Arrow function - cannot be used as constructor
export function checkArrowNoNew(): boolean {
  const arrowFunc = (): void => {
  };
  try {
    // @ts-ignore: Intentionally new arrow function
    new arrowFunc();
    return false;
  } catch {
    return true;
  }
}

// Predefined function - isFinite check
export function checkFiniteValue(val: number): boolean {
  if (typeof val !== 'number') {
    throw new Error('Input must be a number');
  }
  return isFinite(val);
}

// Function declaration - cube of a number
export function calcCube(num: number): number {
  if (typeof num !== 'number' || !Number.isFinite(num)) {
    throw new Error('Input must be a finite number');
  }
  return num**3;
}

// Anonymous function expression - subtract two numbers
export const subTwoNum = function (a: number, b: number): number {
  if (typeof a !== 'number' || typeof b !== 'number') {
    throw new Error('Both inputs must be numbers');
  }
  return a - b;
};