'use static'

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


function getArrayElement<T>(array: T[] | null, index: number): T | undefined {
  if (array === null) {
    return undefined;
  }
  for (let i = 0; i < array.length; i++) {
    if (i === index) {
      return array[i];
    }
  }
  return undefined;
}

function inner(y: number): number {
  return y + 3;
}

class TestObject1 {
}

class Data1 {
  value: number;

  constructor(val: number) {
    this.value = val;
  }
}

class Data2 {
  value: number;

  constructor(val: number) {
    this.value = val;
  }
}

class Config5 {
  value: number | null = null;
}

class Config6 {
  value: number = 10;
}

class Settings7 {
  threshold: number = 0;
}

class Calculator9 {
  add(a: number, b: number): number {
    return a + b;
  }
}

export function ExpressionTest0201() {
  const TAG = 'ExpressionTest0201';
  let maxVal: number = Number.MAX_VALUE;
  let result: number = maxVal + 1;
  let expected: number = Number.MAX_VALUE;
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }
}

export function ExpressionTest0202() {
  const TAG = 'ExpressionTest0202';
  let minVal: number = Number.MIN_VALUE;
  let result: number = minVal - 1;
  let expected: number = -1;
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }
}

export function ExpressionTest0203() {
  const TAG = 'ExpressionTest0203';
  let maxVal: number = Number.MAX_VALUE;
  let result: number = maxVal * 2;
  let expected: number = Infinity;
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }
}

export function ExpressionTest0204() {
  const TAG = 'ExpressionTest0204';
  let a: number = Infinity;
  let b: number = 100;
  let result: number = a / b;
  let expected: number = Infinity;
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }
}

export function ExpressionTest0205() {
  const TAG = 'ExpressionTest0205';
  let a: number = 5;
  let b: number = Infinity;
  let result: number = a % b;
  let expected: number = 5;
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }
}

export function ExpressionTest0206() {
  const TAG = 'ExpressionTest0206';
  let a: number = 1;
  let b: number = 1000;
  let result: number = a**b;
  let expected: number = 1;
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }
}

export function ExpressionTest0207() {
  const TAG = 'ExpressionTest0207';
  let a: number = 5;
  let testFunc: (x: number) => number = (x: number): number => {
    return x * 2;
  };
  let result: number = testFunc(++a);
  let expected: number = 12;
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }
}

export function ExpressionTest0208() {
  const TAG = 'ExpressionTest0208';
  let a: number = 5;
  let testFunc: (x: number) => number = (x: number): number => {
    return x * 2;
  };
  let result: number = testFunc(a++);
  let expected: number = 10;
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }
}

export function ExpressionTest0209() {
  const TAG = 'ExpressionTest0209';
  let arr: number[] = [10, 20, 30];
  let index: int = 2;
  let result: number = arr[--index];
  let expected: number = 20;
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }
}

export function ExpressionTest0210() {
  const TAG = 'ExpressionTest0210';
  let arr: number[] = [10, 20, 30];
  let index: int = 2;
  let result: number = arr[index--];
  let expected: number = 30;
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }
}

export function ExpressionTest0211() {
  const TAG = 'ExpressionTest0211';
  let getValue: () => number = (): number => {
    return 42;
  };
  let result: number = 0;
  result = getValue() + 8;
  let expected: number = 50;
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }
}

export function ExpressionTest0212() {
  const TAG = 'ExpressionTest0212';
  let getIncrement: () => number = (): number => {
    return 5;
  };
  let a: number = 10;
  a += getIncrement();
  let expected: number = 15;
  if (a !== expected) {
    console.info(`${TAG} Task execution failed: a: ${a}`);
    throw new Error('a check failed, expected expected');
  }
}

export function ExpressionTest0213() {
  const TAG = 'ExpressionTest0213';
  let getDecrement: () => number = (): number => {
    return 3;
  };
  let a: number = 10;
  a -= getDecrement();
  let expected: number = 7;
  if (a !== expected) {
    console.info(`${TAG} Task execution failed: a: ${a}`);
    throw new Error('a check failed, expected expected');
  }
}

export function ExpressionTest0214() {
  const TAG = 'ExpressionTest0214';
  let flag: boolean = true;
  let a: number = 4;
  a *= flag ? 3 : 5;
  let expected: number = 12;
  if (a !== expected) {
    console.info(`${TAG} Task execution failed: a: ${a}`);
    throw new Error('a check failed, expected expected');
  }
}

export function ExpressionTest0215() {
  const TAG = 'ExpressionTest0215';
  let a: number = 10;
  let b: number = 5;
  let result: number = 20;
  result /= a > b ? 2 : 4;
  let expected: number = 10;
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }
}

export function ExpressionTest0216() {
  const TAG = 'ExpressionTest0216';
  let a: number = 25;
  let b: number = 3 + 2;
  a %= b;
  let expected: number = 0;
  if (a !== expected) {
    console.info(`${TAG} Task execution failed: a: ${a}`);
    throw new Error('a check failed, expected expected');
  }
}

export function ExpressionTest0217() {
  const TAG = 'ExpressionTest0217';
  let base: number = 3;
  let exponent: number = 3;
  base **= exponent;
  let expected: number = 27;
  if (base !== expected) {
    console.info(`${TAG} Task execution failed: base: ${base}`);
    throw new Error('base check failed, expected expected');
  }
}

export function ExpressionTest0218() {
  const TAG = 'ExpressionTest0218';
  let a: number = -0;
  let b: number = 0;
  let result: boolean = a === b;
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0219() {
  const TAG = 'ExpressionTest0219';
  let a: number = 5;
  let b: number = 5.0;
  let result: boolean = a !== b;
  let expected: boolean = false;
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }
}

export function ExpressionTest0220() {
  const TAG = 'ExpressionTest0220';
  let a: string = "";
  let b: number = 0;
  let aAsNumber: number = Number(a);
  let result: boolean = aAsNumber === b;
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0221() {
  const TAG = 'ExpressionTest0221';
  let a: number = Number.MAX_VALUE;
  let b: number = 1000000000;
  let result: boolean = a > b;
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0222() {
  const TAG = 'ExpressionTest0222';
  let a: number = Number.MIN_VALUE;
  let b: number = 0.1;
  let result: boolean = a < b;
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0223() {
  const TAG = 'ExpressionTest0223';
  let a: number = 999999999999999;
  let b: number = 999999999999999;
  let result: boolean = a >= b;
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0224() {
  const TAG = 'ExpressionTest0224';
  let a: number = 0.0000000001;
  let b: number = 0.0000000002;
  let result: boolean = a <= b;
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0225() {
  const TAG = 'ExpressionTest0225';
  let isPositive: (x: number) => boolean = (x: number): boolean => {
    return x > 0;
  };
  let a: number = 5;
  let b: number = 10;
  let result: boolean = isPositive(a) && isPositive(b);
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0226() {
  const TAG = 'ExpressionTest0226';
  let called: boolean = false;
  let testFunc: () => boolean = (): boolean => {
    called = true;
    return true;
  };
  let a: boolean = false;
  let result: boolean = a && testFunc();
  if (called) {
    console.info(`${TAG} Task execution failed: called: ${called}`);
    throw new Error('called is not false');
  }
}

export function ExpressionTest0227() {
  const TAG = 'ExpressionTest0227';
  let isEven: (x: number) => boolean = (x: number): boolean => {
    return x % 2 === 0;
  };
  let a: number = 3;
  let b: number = 4;
  let result: boolean = isEven(a) || isEven(b);
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0228() {
  const TAG = 'ExpressionTest0228';
  let called: boolean = false;
  let testFunc: () => boolean = (): boolean => {
    called = true;
    return false;
  };
  let a: boolean = true;
  let result: boolean = a || testFunc();
  if (called) {
    console.info(`${TAG} Task execution failed: called: ${called}`);
    throw new Error('called is not false');
  }
}

export function ExpressionTest0229() {
  const TAG = 'ExpressionTest0229';
  let a: number = 0b1111;
  let b: number = 0b1010;
  let result: number = a & b;
  let expected: number = 0b1010;
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }
}

export function ExpressionTest0230() {
  const TAG = 'ExpressionTest0230';
  let a: number = 0b1000;
  let b: number = 0b0011;
  let result: number = a | b;
  let expected: number = 0b1011;
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }
}

export function ExpressionTest0231() {
  const TAG = 'ExpressionTest0231';
  let a: number = 0b1010;
  let b: number = 0b0101;
  let result: number = a ^ b;
  let expected: number = 0b1111;
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }
}

export function ExpressionTest0232() {
  const TAG = 'ExpressionTest0232';
  let a: number = 0b10000000;
  let result: number = ~a;
  let expected: number = -0b10000001;
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }
}

export function ExpressionTest0233() {
  const TAG = 'ExpressionTest0233';
  let a: number = 42;
  let result: number = a << 0;
  let expected: number = 42;
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }
}

export function ExpressionTest0234() {
  const TAG = 'ExpressionTest0234';
  let a: number = 0b111;
  let result: number = a >> 5;
  let expected: number = 0;
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }
}

export function ExpressionTest0235() {
  const TAG = 'ExpressionTest0235';
  let a: int = -2147483648;
  let result: int = a >>> 31;
  let expected: int = 1;
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }
}

export function ExpressionTest0236() {
  const TAG = 'ExpressionTest0236';
  let add: (a: number, b: number) => number = (a: number, b: number): number => {
    return a + b;
  };
  let multiply: (a: number, b: number) => number = (a: number, b: number): number => {
    return a * b;
  };
  let flag: boolean = false;
  let result: number = flag ? add(2, 3) : multiply(2, 3);
  let expected: number = 6;
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }
}

export function ExpressionTest0237() {
  const TAG = 'ExpressionTest0237';
  let getStart: () => number = (): number => {
    return 1;
  };
  let getEnd: () => number = (): number => {
    return 4;
  };
  let getStep: () => number = (): number => {
    return 1;
  };
  let sum: number = 0;
  let i: number, j: number;
  for (i = getStart(), j = getEnd(); i <= j; i += getStep(), j -= getStep()) {
    sum += i + j;
  }
  let expected: number = 10;
  if (sum !== expected) {
    console.info(`${TAG} Task execution failed: sum: ${sum}`);
    throw new Error('sum check failed, expected expected');
  }
}

export function ExpressionTest0238() {
  const TAG = 'ExpressionTest0238';
  let obj: TestObject1 = new TestObject1();
  let result: string = typeof obj;
  let expected: string = "object";
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }
}

export function ExpressionTest0239() {
  const TAG = 'ExpressionTest0239';
  let str: string = "hello";
  let result: string = typeof str;
  let expected: string = "string";
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }
}

export function ExpressionTest0240() {
  const TAG = 'ExpressionTest0240';
  let a: number = 3.14;
  let result: number = +a;
  let expected: number = 3.14;
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }
}

export function ExpressionTest0241() {
  const TAG = 'ExpressionTest0241';
  let a: number = 3.14;
  let result: number = -a;
  let expected: number = -3.14;
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }
}

export function ExpressionTest0246() {
  const TAG = 'ExpressionTest0246';
  let a: boolean = true;
  let b: boolean = false;
  let c: boolean = true;
  let d: boolean = false;
  let result: boolean = a || b && c || d;
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0247() {
  const TAG = 'ExpressionTest0247';
  let arr: number[] | null = [10, 20, 30];
  let result1: number | undefined = getArrayElement(arr, 1);
  let nullArr: number[] | null = null;
  let result2 = getArrayElement(nullArr, 1);
  let expected1: number = 20;
  let expected2: undefined = undefined;
  if (result1 !== expected1) {
    console.info(`${TAG} Task execution failed: result1: ${result1}`);
    throw new Error('result1 check failed, expected expected1');
  }

  if (result2 !== expected2) {
    console.info(`${TAG} Task execution failed: result2: ${result2}`);
    throw new Error('result2 check failed, expected expected2');
  }
}

export function ExpressionTest0248() {
  const TAG = 'ExpressionTest0248';
  let x: number = 0;
  let y: number = 10;
  for (let i = 0; i < 3; i++, x += i % 2 === 0 ? 1 : 2, y -= 2) {
  }
  let expectedX: number = 5;
  let expectedY: number = 4;
  if (x !== expectedX) {
    console.info(`${TAG} Task execution failed: x: ${x}`);
    throw new Error('x check failed, expected expectedX');
  }

  if (y !== expectedY) {
    console.info(`${TAG} Task execution failed: y: ${y}`);
    throw new Error('y check failed, expected expectedY');
  }
}

export function ExpressionTest0249() {
  const TAG = 'ExpressionTest0249';
  let a: number = 5;
  let b: number = 10;
  let result: boolean = (a = b) > 7;
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0250() {
  const TAG = 'ExpressionTest0250';
  let count: number = 0;
  let i: number, j: number;
  for (i = 0, j = 0; i < 5 && j < 10; i++, j += 2) {
    count++;
  }
  let expected: number = 5;
  if (count !== expected) {
    console.info(`${TAG} Task execution failed: count: ${count}`);
    throw new Error('count check failed, expected expected');
  }
}

export function ExpressionTest0251() {
  const TAG = 'ExpressionTest0251';
  let a: number = 1;
  let result: number = a + Number.EPSILON;
  let expected: boolean = result > a;
  if (!expected) {
    console.info(`${TAG} Task execution failed: expected: ${expected}`);
    throw new Error('expected is not true');
  }
}

export function ExpressionTest0252() {
  const TAG = 'ExpressionTest0252';
  let a: number = 1;
  let result: number = a - Number.EPSILON;
  let expected: boolean = result < a;
  if (!expected) {
    console.info(`${TAG} Task execution failed: expected: ${expected}`);
    throw new Error('expected is not true');
  }
}

export function ExpressionTest0253() {
  const TAG = 'ExpressionTest0253';
  let a: number = -0.0;
  let b: number = 5;
  let result: number = a * b;
  let expected: number = -0.0;
  if (1 / result !== -Infinity) {
    console.info(`${TAG} Task execution failed: 1 / result: ${1 / result}`);
    throw new Error('1 / result check failed, expected -Infinity');
  }
}

export function ExpressionTest0254() {
  const TAG = 'ExpressionTest0254';
  let a: number = 0;
  let b: number = -5;
  let result: number = a / b;
  let expected: number = -0;
  if (1 / result !== -Infinity) {
    console.info(`${TAG} Task execution failed: 1 / result: ${1 / result}`);
    throw new Error('1 / result check failed, expected -Infinity');
  }
}

export function ExpressionTest0255() {
  const TAG = 'ExpressionTest0255';
  let a: number = 10;
  let b: number = -3;
  let result: number = a % b;
  let expected: number = 1;
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }
}

export function ExpressionTest0256() {
  const TAG = 'ExpressionTest0256';
  let a: number = 0;
  let b: number = 3;
  let result: number = a**b;
  let expected: number = 0;
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }
}

export function ExpressionTest0258() {
  const TAG = 'ExpressionTest0258';
  let a: number = 2;
  let outer: (x: number) => number = (x: number): number => {
    return inner(x) * 2;
  };
  let result: number = outer(a++);
  let expected: number = 10;
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }
}

export function ExpressionTest0261() {
  const TAG = 'ExpressionTest0261';
  let getBase: () => number = (): number => {
    return 10;
  };
  let getMultiplier: () => number = (): number => {
    return 3;
  };
  let getOffset: () => number = (): number => {
    return 5;
  };
  let result: number = 0;
  result = getBase() * getMultiplier() + getOffset();
  let expected: number = 35;
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }
}

export function ExpressionTest0262() {
  const TAG = 'ExpressionTest0262';
  let a: number = 5;
  let b: number = 3;
  let c: number = 2;
  a += b * c + (b + c);
  if (a !== 16) {
    console.info(`${TAG} Task execution failed: a: ${a}`);
    throw new Error('a check failed, expected 16');
  }
}

export function ExpressionTest0263() {
  const TAG = 'ExpressionTest0263';
  let a: number = 20;
  let b: number = 4;
  let c: number = 2;
  a -= b / c + (b - c);
  if (a !== 16) {
    console.info(`${TAG} Task execution failed: a: ${a}`);
    throw new Error('a check failed, expected 16');
  }
}

export function ExpressionTest0264() {
  const TAG = 'ExpressionTest0264';
  let a: number = 5;
  let b: number = 3;
  let result: number = 2;
  result *= a > b ? a - b : a + b;
  if (result !== 4) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 4');
  }
}

export function ExpressionTest0265() {
  const TAG = 'ExpressionTest0265';
  let a: number = 15; // 0b1111
  let b: number = 5; // 0b0101
  let result: number = 10;
  result /= a & b;
  if (result !== 2) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 2');
  }
}

export function ExpressionTest0266() {
  const TAG = 'ExpressionTest0266';
  let base: number = 3;
  let exponent: number = 3;
  let a: number = 30;
  a %= base**exponent;
  if (a !== 3) {
    console.info(`${TAG} Task execution failed: a: ${a}`);
    throw new Error('a check failed, expected 3');
  }
}

export function ExpressionTest0267() {
  const TAG = 'ExpressionTest0267';
  let a: number = 2;
  let shift: number = 3;
  let base: number = 2;
  base **= a << shift;
  if (base !== 65536) {
    console.info(`${TAG} Task execution failed: base: ${base}`);
    throw new Error('base check failed, expected 65536');
  }
}

export function ExpressionTest0268() {
  const TAG = 'ExpressionTest0268';
  let a: number = 5;
  let b: number = 5.000000000000001;
  let result: boolean = a === b;
  if (result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not false');
  }
}

export function ExpressionTest0269() {
  const TAG = 'ExpressionTest0269';
  let a: number = 10;
  let b: number = 10.0;
  let result: boolean = a !== b;
  if (result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not false');
  }
}

export function ExpressionTest0271() {
  const TAG = 'ExpressionTest0271';
  let a: number = Number.MAX_SAFE_INTEGER;
  let b: number = Number.MAX_SAFE_INTEGER + 1;
  let result: boolean = a > b;
  if (result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not false');
  }
}

export function ExpressionTest0272() {
  const TAG = 'ExpressionTest0272';
  let a: number = Number.MIN_SAFE_INTEGER;
  let b: number = Number.MIN_SAFE_INTEGER - 1;
  let result: boolean = a < b;
  if (result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not false');
  }
}

export function ExpressionTest0273() {
  const TAG = 'ExpressionTest0273';
  let a: number = 3.1415926535;
  let b: number = 3.1415926534;
  let result: boolean = a >= b;
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0274() {
  const TAG = 'ExpressionTest0274';
  let a: number = 2.7182818284;
  let b: number = 2.7182818285;
  let result: boolean = a <= b;
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0275() {
  const TAG = 'ExpressionTest0275';
  let obj1: Data1 = new Data1(5);
  let obj2: Data1 = new Data1(10);
  let result: boolean = obj1.value > 0 && obj2.value > 0;
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0276() {
  const TAG = 'ExpressionTest0276';
  let a: number = 5;
  let b: boolean = true;
  let result: boolean = Boolean(a && b);
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0277() {
  const TAG = 'ExpressionTest0277';
  let obj1: Data2 = new Data2(0);
  let obj2: Data2 = new Data2(10);
  let result: boolean = obj1.value > 0 || obj2.value > 0;
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0278() {
  const TAG = 'ExpressionTest0278';
  let a: number = 0;
  let b: boolean = true;
  let result: boolean = Boolean(a || b);
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0279() {
  const TAG = 'ExpressionTest0279';
  let a: number = 0x80000000.toInt(); // Negative in 32-bit
  let b: number = 0xFFFFFF00.toInt();
  let result: number = a & b;
  let expected: number = -2147483648;
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }
}

export function ExpressionTest0280() {
  const TAG = 'ExpressionTest0280';
  let a: number = 0x80000000.toInt(); // -2147483648
  let b: number = 0x000000FF; // 255
  let result: number = a | b;
  let expected: number = -2147483393;
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }
}

export function ExpressionTest0281() {
  const TAG = 'ExpressionTest0281';
  let a: number = 0x80000000.toInt(); // Negative in 32-bit
  let b: number = 0xFFFFFFFF.toInt();
  let result: number = a ^ b;
  let expected: number = 0x7FFFFFFF;
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }
}

export function ExpressionTest0282() {
  const TAG = 'ExpressionTest0282';
  let a: number = 0x40000000;
  let result: number = ~a;
  let expected: number = -0x40000001;
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }
}

export function ExpressionTest0283() {
  const TAG = 'ExpressionTest0283';
  let a: int = 0x40000000;
  let result: int = (a << 1) >>> 0;
  let expected: int = 0x80000000.toInt();
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }
}

export function ExpressionTest0284() {
  const TAG = 'ExpressionTest0284';
  let a: number = 0x80000000.toInt();
  let result: number = a >> 1;
  let expected: number = -1073741824;
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }
}

export function ExpressionTest0285() {
  const TAG = 'ExpressionTest0285';
  let a: int = 0x80000000.toInt();
  let result: int = a >>> 2;
  let expected: int = 0x20000000;
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }
}

export function ExpressionTest0286() {
  const TAG = 'ExpressionTest0286';
  let a: number = 5;
  let b: number = 10;
  let c: number = 15;
  let result: number = a > b ? a : (b > c ? b : c);
  let expected: number = 15;
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }
}

export function ExpressionTest0288() {
  const TAG = 'ExpressionTest0288';
  let flag: boolean = true;
  let result: string = typeof flag;
  let expected: string = "boolean";
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }
}

export function ExpressionTest0289() {
  const TAG = 'ExpressionTest0289';
  let val: null = null;
  let result: string = typeof val;
  let expected: string = "object"; // Known JavaScript quirk
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }
}

export function ExpressionTest0290() {
  const TAG = 'ExpressionTest0290';
  let a: number = 9876543210;
  let result: number = +a;
  let expected: number = 9876543210;
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }
}

export function ExpressionTest0291() {
  const TAG = 'ExpressionTest0291';
  let a: number = 9876543210;
  let result: number = -a;
  let expected: number = -9876543210;
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }
}

export function ExpressionTest0296() {
  const TAG = 'ExpressionTest0296';
  let a: number = 5;
  let b: number = 3;
  let c: number = 2;
  let result1: number = a + b * c;
  let result2: number = (a + b) * c;
  if (result1 !== 11) {
    console.info(`${TAG} Task execution failed: result1: ${result1}`);
    throw new Error('result1 check failed, expected 11');
  }

  if (result2 !== 16) {
    console.info(`${TAG} Task execution failed: result2: ${result2}`);
    throw new Error('result2 check failed, expected 16');
  }
}

export function ExpressionTest0297() {
  const TAG = 'ExpressionTest0297';
  let calc: Calculator9 | null = new Calculator9();
  let result1: number | undefined = calc?.add(2, 3);
  if (result1 !== 5) {
    console.info(`${TAG} Task execution failed: result1: ${result1}`);
    throw new Error('result1 check failed, expected 5');
  }
}

export function ExpressionTest0298() {
  const TAG = 'ExpressionTest0298';
  let sum1: number = 0;
  let sum2: number = 0;
  let sum3: number = 0;
  let i: number, j: number, k: number;
  for (i = 1, j = 2, k = 3; i <= 3; i++, j += 2, k *= 2) {
    sum1 += i;
    sum2 += j;
    sum3 += k;
  }
  if (sum1 !== 6) {
    console.info(`${TAG} Task execution failed: sum1: ${sum1}`);
    throw new Error('sum1 check failed, expected 6');
  }

  if (sum2 !== 12) {
    console.info(`${TAG} Task execution failed: sum2: ${sum2}`);
    throw new Error('sum2 check failed, expected 12');
  }

  if (sum3 !== 21) {
    console.info(`${TAG} Task execution failed: sum3: ${sum3}`);
    throw new Error('sum3 check failed, expected 21');
  }
}

export function ExpressionTest0299() {
  const TAG = 'ExpressionTest0299';
  let a: number = 5;
  let b: number = 3;
  let c: number = 2;
  let result: boolean = a > b + c;
  if (result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not false');
  }
}

export function ExpressionTest0300() {
  const TAG = 'ExpressionTest0300';
  let product: number = 1;
  let i: number, j: number;
  for (i = 1, j = 1; i <= 5 && j <= 120; i++, j *= i) {
    product *= j;
  }
  if (product !== 34560) {
    console.info(`${TAG} Task execution failed: product: ${product}`);
    throw new Error('product check failed, expected 34560');
  }
}

export function ExpressionTest0301() {
  const TAG = 'ExpressionTest0301';
  const a: number = -5; // 0b11111111111111111111111111111011
  const b: number = -3; // 0b11111111111111111111111111111101
  const result: number = a & b;
  const expected: number = -7; // 0b11111111111111111111111111111001
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }
}

export function ExpressionTest0302() {
  const TAG = 'ExpressionTest0302';
  const a: number = 10; // 0b00000000000000000000000000001010
  const b: number = -10; // 0b11111111111111111111111111110110
  const result: number = a & b;
  const expected: number = 2; // 0b00000000000000000000000000000010
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }
}

export function ExpressionTest0303() {
  const TAG = 'ExpressionTest0303';
  const a: number = -5; // 0b11111111111111111111111111111011
  const b: number = -3; // 0b11111111111111111111111111111101
  const result: number = a | b;
  const expected: number = -1; // 0b11111111111111111111111111111111
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }
}

export function ExpressionTest0304() {
  const TAG = 'ExpressionTest0304';
  const a: number = 10; // 0b00000000000000000000000000001010
  const b: number = -10; // 0b11111111111111111111111111110110
  const result: number = a | b;
  const expected: number = -2;
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }
}

export function ExpressionTest0305() {
  const TAG = 'ExpressionTest0305';
  const a: number = -5; // 0b11111111111111111111111111111011
  const b: number = -3; // 0b11111111111111111111111111111101
  const result: number = a ^ b;
  const expected: number = 6; // 0b00000000000000000000000000000110
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }
}

export function ExpressionTest0306() {
  const TAG = 'ExpressionTest0306';
  const a: number = 10;
  const b: number = -10;
  const result: number = a ^ b;
  const expected: number = -4;
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }
}

export function ExpressionTest0307() {
  const TAG = 'ExpressionTest0307';
  const a: number = 2147483647; // 0b01111111111111111111111111111111
  const result: number = ~a;
  const expected: number = -2147483648; // 0b10000000000000000000000000000000
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }
}

export function ExpressionTest0308() {
  const TAG = 'ExpressionTest0308';
  const a: number = -2147483648; // 0b10000000000000000000000000000000
  const result: number = ~a;
  const expected: number = 2147483647; // 0b01111111111111111111111111111111
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }
}

export function ExpressionTest0309() {
  const TAG = 'ExpressionTest0309';
  const a: number = -5; // 0b11111111111111111111111111111011
  const result: number = a << 2;
  const expected: number = -20; // 0b11111111111111111111111111101100
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }
}

export function ExpressionTest0310() {
  const TAG = 'ExpressionTest0310';
  const a: int = 1073741824; // 0b01000000000000000000000000000000
  const result: int = a << 1;
  const expected: int = -2147483648; // Overflow becomes negative
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }
}

export function ExpressionTest0311() {
  const TAG = 'ExpressionTest0311';
  const a: number = -20; // 0b11111111111111111111111111101100
  const result: number = a >> 2;
  const expected: number = -5; // 0b11111111111111111111111111111011
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }
}

export function ExpressionTest0312() {
  const TAG = 'ExpressionTest0312';
  const a: number = 15;
  const result: number = a >> 4;
  const expected: number = 0;
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }
}

export function ExpressionTest0313() {
  const TAG = 'ExpressionTest0313';
  const a: number = 10;
  const b: number = 3;
  const result: number = (a & b) + (a | b);
  const expected: number = a + b;
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }
}

export function ExpressionTest0314() {
  const TAG = 'ExpressionTest0314';
  const a: number = 15;
  const b: number = 9;
  const c: number = 4;
  const result: number = (a & b) * c;
  const expected: number = 36;
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }
}

export function ExpressionTest0315() {
  const TAG = 'ExpressionTest0315';
  const a: number = 5;
  const b: number = 3;
  const c: number = 4;
  const result: number = (a | b) / c;
  const expected: number = 1.75;
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }
}

export function ExpressionTest0316() {
  const TAG = 'ExpressionTest0316';
  const a: number = 10;
  const b: number = 3;
  const c: number = 5;
  const result: number = (a ^ b) % c;
  const expected: number = 4;
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }
}

export function ExpressionTest0317() {
  const TAG = 'ExpressionTest0317';
  const a: int = 3;
  const b: int = 2;
  const result: number = (~a)**b;
  const expected: int = 16;
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }
}

export function ExpressionTest0318() {
  const TAG = 'ExpressionTest0318';
  let a: number = 10;
  const b: number = 5;
  const c: number = 3;
  a += b & c;
  const expected: number = 11;
  if (a !== expected) {
    console.info(`${TAG} Task execution failed: a: ${a}`);
    throw new Error('a check failed, expected expected');
  }
}

export function ExpressionTest0319() {
  const TAG = 'ExpressionTest0319';
  let a: number = 10;
  const b: number = 5;
  const c: number = 3;
  a -= b | c;
  const expected: number = 3;
  if (a !== expected) {
    console.info(`${TAG} Task execution failed: a: ${a}`);
    throw new Error('a check failed, expected expected');
  }
}

export function ExpressionTest0320() {
  const TAG = 'ExpressionTest0320';
  let a: number = 4;
  const b: number = 3;
  a *= b << 1;
  const expected: number = 24;
  if (a !== expected) {
    console.info(`${TAG} Task execution failed: a: ${a}`);
    throw new Error('a check failed, expected expected');
  }
}
