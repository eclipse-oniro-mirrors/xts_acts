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


class TestClass1 {
  prop: number = 42;
}

class MyClass2 {
}

class TestClass3 {
  getValue(): number {
    return 42;
  }
}

class InnerClass4 {
  value: number = 10;
}

class OuterClass5 {
  inner: InnerClass4 = new InnerClass4();
}

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

export function ExpressionTest0001() {
  const TAG = 'ExpressionTest0001';
  let a: number = 5;
  let b: number = 3;
  let result: number = a + b;
  let expected: number = 8;
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }
}

export function ExpressionTest0002() {
  const TAG = 'ExpressionTest0002';
  let a: number = 10;
  let b: number = 4;
  let result: number = a - b;
  let expected: number = 6;
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }
}

export function ExpressionTest0003() {
  const TAG = 'ExpressionTest0003';
  let a: number = 7;
  let b: number = 6;
  let result: number = a * b;
  let expected: number = 42;
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }
}

export function ExpressionTest0004() {
  const TAG = 'ExpressionTest0004';
  let a: number = 24;
  let b: number = 4;
  let result: number = a / b;
  let expected: number = 6;
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }
}

export function ExpressionTest0005() {
  const TAG = 'ExpressionTest0005';
  let a: number = 17;
  let b: number = 5;
  let result: number = a % b;
  let expected: number = 2;
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }
}

export function ExpressionTest0006() {
  const TAG = 'ExpressionTest0006';
  let a: number = 2;
  let b: number = 5;
  let result: number = a**b;
  let expected: number = 32;
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }
}

export function ExpressionTest0007() {
  const TAG = 'ExpressionTest0007';
  let num: number = 5;
  let result: number = ++num;
  let expected: number = 6;
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }
}

export function ExpressionTest0008() {
  const TAG = 'ExpressionTest0008';
  let num: number = 5;
  let result: number = num++;
  let expected: number = 5;
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }
}

export function ExpressionTest0009() {
  const TAG = 'ExpressionTest0009';
  let num: number = 5;
  let result: number = --num;
  let expected: number = 4;
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }
}

export function ExpressionTest0010() {
  const TAG = 'ExpressionTest0010';
  let num: number = 5;
  let result: number = num--;
  let expected: number = 5;
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }
}

export function ExpressionTest0011() {
  const TAG = 'ExpressionTest0011';
  let num: number = 0;
  num = 10;
  let expected: number = 10;
  if (num !== expected) {
    console.info(`${TAG} Task execution failed: num: ${num}`);
    throw new Error('num check failed, expected expected');
  }
}

export function ExpressionTest0012() {
  const TAG = 'ExpressionTest0012';
  let num: number = 5;
  num += 3;
  let expected: number = 8;
  if (num !== expected) {
    console.info(`${TAG} Task execution failed: num: ${num}`);
    throw new Error('num check failed, expected expected');
  }
}

export function ExpressionTest0013() {
  const TAG = 'ExpressionTest0013';
  let num: number = 10;
  num -= 4;
  let expected: number = 6;
  if (num !== expected) {
    console.info(`${TAG} Task execution failed: num: ${num}`);
    throw new Error('num check failed, expected expected');
  }
}

export function ExpressionTest0014() {
  const TAG = 'ExpressionTest0014';
  let num: number = 6;
  num *= 7;
  let expected: number = 42;
  if (num !== expected) {
    console.info(`${TAG} Task execution failed: num: ${num}`);
    throw new Error('num check failed, expected expected');
  }
}

export function ExpressionTest0015() {
  const TAG = 'ExpressionTest0015';
  let num: number = 28;
  num /= 4;
  let expected: number = 7;
  if (num !== expected) {
    console.info(`${TAG} Task execution failed: num: ${num}`);
    throw new Error('num check failed, expected expected');
  }
}

export function ExpressionTest0016() {
  const TAG = 'ExpressionTest0016';
  let num: number = 17;
  num %= 5;
  let expected: number = 2;
  if (num !== expected) {
    console.info(`${TAG} Task execution failed: num: ${num}`);
    throw new Error('num check failed, expected expected');
  }
}

export function ExpressionTest0017() {
  const TAG = 'ExpressionTest0017';
  let num: number = 3;
  num **= 3;
  let expected: number = 27;
  if (num !== expected) {
    console.info(`${TAG} Task execution failed: num: ${num}`);
    throw new Error('num check failed, expected expected');
  }
}

export function ExpressionTest0018() {
  const TAG = 'ExpressionTest0018';
  let a: number = 5;
  let b: number = 5;
  let result: boolean = a === b;
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0019() {
  const TAG = 'ExpressionTest0019';
  let a: number = 5;
  let b: string = "5";
  let result: boolean = a === Number(b);
  let expected: boolean = true;
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }
}

export function ExpressionTest0020() {
  const TAG = 'ExpressionTest0020';
  let a: number = 5;
  let b: string = "5";
  let result: boolean = a == Number(b);
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0021() {
  const TAG = 'ExpressionTest0021';
  let a: number = 5;
  let b: number = 3;
  let result: boolean = a !== b;
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0022() {
  const TAG = 'ExpressionTest0022';
  let a: number = 10;
  let b: number = 5;
  let result: boolean = a > b;
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0023() {
  const TAG = 'ExpressionTest0023';
  let a: number = 3;
  let b: number = 7;
  let result: boolean = a < b;
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0024() {
  const TAG = 'ExpressionTest0024';
  let a: number = 5;
  let b: number = 5;
  let result: boolean = a >= b;
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0025() {
  const TAG = 'ExpressionTest0025';
  let a: number = 4;
  let b: number = 5;
  let result: boolean = a <= b;
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0026() {
  const TAG = 'ExpressionTest0026';
  let a: boolean = true;
  let b: boolean = true;
  let result: boolean = a && b;
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0027() {
  const TAG = 'ExpressionTest0027';
  let a: boolean = true;
  let b: boolean = false;
  let result: boolean = a && b;
  let expected: boolean = false;
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }
}

export function ExpressionTest0028() {
  const TAG = 'ExpressionTest0028';
  let a: boolean = false;
  let b: boolean = true;
  let result: boolean = a || b;
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0029() {
  const TAG = 'ExpressionTest0029';
  let a: boolean = true;
  let result: boolean = !a;
  let expected: boolean = false;
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }
}

export function ExpressionTest0030() {
  const TAG = 'ExpressionTest0030';
  let a: number = 5; // 0101
  let b: number = 3; // 0011
  let result: number = a & b; // 0001 = 1
  let expected: number = 1;
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }
}

export function ExpressionTest0031() {
  const TAG = 'ExpressionTest0031';
  let a: number = 5; // 0101
  let b: number = 3; // 0011
  let result: number = a | b; // 0111 = 7
  let expected: number = 7;
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }
}

export function ExpressionTest0032() {
  const TAG = 'ExpressionTest0032';
  let a: number = 5; // 0101
  let b: number = 3; // 0011
  let result: number = a ^ b; // 0110 = 6
  let expected: number = 6;
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }
}

export function ExpressionTest0033() {
  const TAG = 'ExpressionTest0033';
  let a: number = 5; // 00000000000000000000000000000101
  let result: number = ~a; // 11111111111111111111111111111010 = -6
  let expected: number = -6;
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }
}

export function ExpressionTest0034() {
  const TAG = 'ExpressionTest0034';
  let a: number = 5; // 101
  let result: number = a << 2; // 10100 = 20
  let expected: number = 20;
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }
}

export function ExpressionTest0035() {
  const TAG = 'ExpressionTest0035';
  let a: number = 20; // 10100
  let result: number = a >> 2; // 101 = 5
  let expected: number = 5;
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }
}

export function ExpressionTest0036() {
  const TAG = 'ExpressionTest0036';
  let a: int = -20;
  let result: int = a >>> 2;
  let expected: int = 1073741819;
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }
}

export function ExpressionTest0037() {
  const TAG = 'ExpressionTest0037';
  let a: number = 10;
  let b: number = 5;
  let result: string = a > b ? "greater" : "less";
  let expected: string = "greater";
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }
}

export function ExpressionTest0038() {
  const TAG = 'ExpressionTest0038';
  let a: number = 1;
  let b: number = 2;
  a++;
  b++;
  let result: number = a + b;
  let expected: number = 5;
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }
}

export function ExpressionTest0039() {
  const TAG = 'ExpressionTest0039';
  let a: number = 42;
  let result: string = typeof a;
  let expected: string = "number";
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }

  if (!result.includes(expected)) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result does not contain expected');
  }
}

export function ExpressionTest0040() {
  const TAG = 'ExpressionTest0040';
  let a: string = "test";
  let result: string = typeof a;
  let expected: string = "string";
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }

  if (!result.includes(expected)) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result does not contain expected');
  }
}

export function ExpressionTest0041() {
  const TAG = 'ExpressionTest0041';
  let a: boolean = true;
  let result: string = typeof a;
  let expected: string = "boolean";
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }
}

export function ExpressionTest0042() {
  const TAG = 'ExpressionTest0042';
  let a: undefined;
  let result: string = typeof a;
  let expected: string = "undefined";
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }
}

export function ExpressionTest0043() {
  const TAG = 'ExpressionTest0043';
  let a: number = 42;
  let result: number = +a;
  let expected: number = 42;
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }
}

export function ExpressionTest0044() {
  const TAG = 'ExpressionTest0044';
  let a: number = 42;
  let result: number = -a;
  let expected: number = -42;
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }
}

export function ExpressionTest0049() {
  const TAG = 'ExpressionTest0049';
  let arr: number[] = [1, 2, 3];
  let a: number = arr[0];
  let b: number = arr[1];
  let c: number = arr[2];
  let expectedA: number = 1;
  let expectedB: number = 2;
  let expectedC: number = 3;
  if (a !== expectedA) {
    console.info(`${TAG} Task execution failed: a: ${a}`);
    throw new Error('a check failed, expected expectedA');
  }

  if (b !== expectedB) {
    console.info(`${TAG} Task execution failed: b: ${b}`);
    throw new Error('b check failed, expected expectedB');
  }

  if (c !== expectedC) {
    console.info(`${TAG} Task execution failed: c: ${c}`);
    throw new Error('c check failed, expected expectedC');
  }
}

export function ExpressionTest0050() {
  const TAG = 'ExpressionTest0050';
  let a: number = 2;
  let b: number = 3;
  let c: number = 4;
  let result: number = a + b * c; // 2 + (3 * 4) = 14
  let expected: number = 14;
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }
}

export function ExpressionTest0051() {
  const TAG = 'ExpressionTest0051';
  let a: number = 2;
  let b: number = 3;
  let c: number = 4;
  let result: number = (a + b) * c;
  let expected: number = 20;
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }
}

export function ExpressionTest0052() {
  const TAG = 'ExpressionTest0052';
  let str1: string = "Hello";
  let str2: string = "World";
  let result: string = str1 + " " + str2;
  let expected: string = "Hello World";
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }

  if (!result.includes(str1)) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result does not contain str1');
  }
}

export function ExpressionTest0053() {
  const TAG = 'ExpressionTest0053';
  let str: string = "Count: ";
  let num: number = 5;
  let result: string = str + num;
  let expected: string = "Count: 5";
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }
}

export function ExpressionTest0054() {
  const TAG = 'ExpressionTest0054';
  let str: string = "Hello";
  str += " there";
  let expected: string = "Hello there";
  if (str !== expected) {
    console.info(`${TAG} Task execution failed: str: ${str}`);
    throw new Error('str check failed, expected expected');
  }
}

export function ExpressionTest0055() {
  const TAG = 'ExpressionTest0055';
  let arr: string[] = ["a", "b", "c"];
  let key: string = "1";
  let result: boolean = parseInt(key, 10) >= 0 && parseInt(key, 10) < arr.length;
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0057() {
  const TAG = 'ExpressionTest0057';
  let arr: number[] = [1, 2, 3];
  let result: boolean = arr instanceof Array;
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0058() {
  const TAG = 'ExpressionTest0058';
  let result: undefined = undefined;
  let expected: undefined = undefined;
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }
}

export function ExpressionTest0059() {
  const TAG = 'ExpressionTest0059';
  let i: number = 0;
  let j: number = 0;
  for (; i < 3; i++, j += 2) {
  }
  let expectedI: number = 3;
  let expectedJ: number = 6;
  if (i !== expectedI) {
    console.info(`${TAG} Task execution failed: i: ${i}`);
    throw new Error('i check failed, expected expectedI');
  }

  if (j !== expectedJ) {
    console.info(`${TAG} Task execution failed: j: ${j}`);
    throw new Error('j check failed, expected expectedJ');
  }
}

export function ExpressionTest0060() {
  const TAG = 'ExpressionTest0060';
  let arr: number[] = [1, 2, 3, 4, 5];
  let a: number = 0;
  let b: number = 0;
  for (let i = 0, j = 3; i < 1; i++, j++) {
    a = arr[i];
    b = arr[j];
  }
  let expectedA: number = 1;
  let expectedB: number = 4;
  if (a !== expectedA) {
    console.info(`${TAG} Task execution failed: a: ${a}`);
    throw new Error('a check failed, expected expectedA');
  }

  if (b !== expectedB) {
    console.info(`${TAG} Task execution failed: b: ${b}`);
    throw new Error('b check failed, expected expectedB');
  }
}

export function ExpressionTest0063() {
  const TAG = 'ExpressionTest0063';
  let a: boolean = false;
  let b: string = "not evaluated";
  let result: boolean | string = a && b;
  let expected: boolean = false;
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }
}

export function ExpressionTest0064() {
  const TAG = 'ExpressionTest0064';
  let a: boolean = true;
  let b: string = "not evaluated";
  let result: boolean | string = a || b;
  let expected: boolean = true;
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }
}

export function ExpressionTest0065() {
  const TAG = 'ExpressionTest0065';
  let a: null = null;
  let b: number = 42;
  let result: null | number = a ?? b;
  let expected: number = 42;
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }
}

export function ExpressionTest0066() {
  const TAG = 'ExpressionTest0066';
  let a: number = 0;
  let b: number = 42;
  let result: number = a ?? b;
  let expected: number = 0;
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }
}

export function ExpressionTest0067() {
  const TAG = 'ExpressionTest0067';
  let obj: TestClass1 = new TestClass1();
  let result: number | undefined = obj?.prop;
  let expected: number = 42;
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }
}

export function ExpressionTest0069() {
  const TAG = 'ExpressionTest0069';
  let base: number = -2;
  let exponent: number = 3;
  let result: number = base**exponent;
  let expected: number = -8;
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }
}

export function ExpressionTest0070() {
  const TAG = 'ExpressionTest0070';
  let a: number = 5;
  let b: number = 0;
  let result: number = a / b;
  let expected: number = Infinity;
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }
}

export function ExpressionTest0071() {
  const TAG = 'ExpressionTest0071';
  let a: boolean = true;
  let booleanToNumber: (value: boolean) => number = (value: boolean): number => {
    return value ? 1 : 0;
  };
  let result: number = booleanToNumber(a);
  let expected: number = 1;
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }
}

export function ExpressionTest0073() {
  const TAG = 'ExpressionTest0073';
  let a: number = 5;
  let result: number = ++a * 2;
  let expected: number = 12;
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }
}

export function ExpressionTest0074() {
  const TAG = 'ExpressionTest0074';
  let a: number = 5;
  let result: number = a++ * 2;
  let expected: number = 10;
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }
}

export function ExpressionTest0075() {
  const TAG = 'ExpressionTest0075';
  let a: boolean = true;
  let b: boolean = false;
  let c: boolean = true;
  let result: boolean = a && b || c;
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0076() {
  const TAG = 'ExpressionTest0076';
  let a: number = -4;
  let result: number = a << 1;
  let expected: number = -8;
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }
}

export function ExpressionTest0077() {
  const TAG = 'ExpressionTest0077';
  let a: number = -8;
  let result: number = a >> 1;
  let expected: number = -4;
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }
}

export function ExpressionTest0078() {
  const TAG = 'ExpressionTest0078';
  let str1: string = "apple";
  let str2: string = "banana";
  let result: boolean = str1 > str2;
  let expected: boolean = false;
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }
}

export function ExpressionTest0079() {
  const TAG = 'ExpressionTest0079';
  let str1: string = "apple";
  let str2: string = "banana";
  let result: boolean = str1 < str2;
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0080() {
  const TAG = 'ExpressionTest0080';
  let score: number = 85;
  let result: string = score > 90 ? "A" : score > 80 ? "B" : "C";
  let expected: string = "B";
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }
}

export function ExpressionTest0081() {
  const TAG = 'ExpressionTest0081';
  let a: number = 17;
  let b: number = -5;
  let result: number = a % b;
  let expected: number = 2;
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }
}

export function ExpressionTest0082() {
  const TAG = 'ExpressionTest0082';
  let a: null = null;
  let result: string = typeof a;
  let expected: string = "object";
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }
}

export function ExpressionTest0083() {
  const TAG = 'ExpressionTest0083';
  let a: number = 5;
  let result: boolean = !a;
  let expected: boolean = false;
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }
}

export function ExpressionTest0084() {
  const TAG = 'ExpressionTest0084';
  let a: number = 0;
  let result: boolean = !a;
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0085() {
  const TAG = 'ExpressionTest0085';
  let a: number = 5;
  let result: boolean = !!a;
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0086() {
  const TAG = 'ExpressionTest0086';
  let a: number = 5; // 101
  a <<= 2; // 10100 = 20
  let expected: number = 20;
  if (a !== expected) {
    console.info(`${TAG} Task execution failed: a: ${a}`);
    throw new Error('a check failed, expected expected');
  }
}

export function ExpressionTest0087() {
  const TAG = 'ExpressionTest0087';
  let a: number = 20; // 10100
  a >>= 2; // 101 = 5
  let expected: number = 5;
  if (a !== expected) {
    console.info(`${TAG} Task execution failed: a: ${a}`);
    throw new Error('a check failed, expected expected');
  }
}

export function ExpressionTest0088() {
  const TAG = 'ExpressionTest0088';
  let a: number = 5; // 0101
  a &= 3; // 0011
  let expected: number = 1; // 0001
  if (a !== expected) {
    console.info(`${TAG} Task execution failed: a: ${a}`);
    throw new Error('a check failed, expected expected');
  }
}

export function ExpressionTest0089() {
  const TAG = 'ExpressionTest0089';
  let a: number = 5; // 0101
  a |= 3; // 0011
  let expected: number = 7; // 0111
  if (a !== expected) {
    console.info(`${TAG} Task execution failed: a: ${a}`);
    throw new Error('a check failed, expected expected');
  }
}

export function ExpressionTest0090() {
  const TAG = 'ExpressionTest0090';
  let a: number = 5; // 0101
  a ^= 3; // 0011
  let expected: number = 6; // 0110
  if (a !== expected) {
    console.info(`${TAG} Task execution failed: a: ${a}`);
    throw new Error('a check failed, expected expected');
  }
}

export function ExpressionTest0091() {
  const TAG = 'ExpressionTest0091';
  let a: number = 2;
  a **= 3;
  let expected: number = 8;
  if (a !== expected) {
    console.info(`${TAG} Task execution failed: a: ${a}`);
    throw new Error('a check failed, expected expected');
  }
}

export function ExpressionTest0092() {
  const TAG = 'ExpressionTest0092';
  let obj: MyClass2 = new MyClass2();
  let result: boolean = obj instanceof MyClass2;
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0094() {
  const TAG = 'ExpressionTest0094';
  let a: number;
  let b: number;
  a = b = 5;
  let expected: number = 5;
  if (a !== expected) {
    console.info(`${TAG} Task execution failed: a: ${a}`);
    throw new Error('a check failed, expected expected');
  }

  if (b !== expected) {
    console.info(`${TAG} Task execution failed: b: ${b}`);
    throw new Error('b check failed, expected expected');
  }
}

export function ExpressionTest0096() {
  const TAG = 'ExpressionTest0096';
  let a: boolean = true;
  let b: number = 1;
  let result: boolean = (a ? 1 : 0) === b;
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0097() {
  const TAG = 'ExpressionTest0097';
  let a: null = null;
  let b: undefined = undefined;
  let result: boolean = a == b;
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0098() {
  const TAG = 'ExpressionTest0098';
  let a: string[] = ["1", "2", "3"];
  let b: string = "1,2,3";
  let result: boolean = a.join(",") === b;
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0099() {
  const TAG = 'ExpressionTest0099';
  let a: number = 5;
  let b: number = 3;
  let c: number = 2;
  let result: boolean = a > b + c;
  let expected: boolean = false;
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }
}

export function ExpressionTest0101() {
  const TAG = 'ExpressionTest0101';
  let maxInt: number = 9007199254740991;
  let result: number = maxInt + 1;
  let expected: number = 9007199254740992;
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }
}

export function ExpressionTest0102() {
  const TAG = 'ExpressionTest0102';
  let a: number = -5;
  let b: number = -3;
  let result: number = a - b;
  let expected: number = -2;
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }
}

export function ExpressionTest0103() {
  const TAG = 'ExpressionTest0103';
  let a: number = 2.5;
  let b: number = 4.0;
  let result: number = a * b;
  let expected: number = 10.0;
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }
}

export function ExpressionTest0104() {
  const TAG = 'ExpressionTest0104';
  let a: number = 7;
  let b: number = 2;
  let result: number = a / b;
  let expected: number = 3.5;
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }
}

export function ExpressionTest0105() {
  const TAG = 'ExpressionTest0105';
  let a: number = 10.5;
  let b: number = 3;
  let result: number = a % b;
  let expected: number = 1.5;
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }
}

export function ExpressionTest0106() {
  const TAG = 'ExpressionTest0106';
  let a: number = 16;
  let b: number = 0.25;
  let result: number = a**b;
  let expected: number = 2;
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }
}

export function ExpressionTest0107() {
  const TAG = 'ExpressionTest0107';
  let count: number = 0;
  let i: number = 0;
  while (++i < 5) {
    count++;
  }
  let expected: number = 4;
  if (count !== expected) {
    console.info(`${TAG} Task execution failed: count: ${count}`);
    throw new Error('count check failed, expected expected');
  }
}

export function ExpressionTest0108() {
  const TAG = 'ExpressionTest0108';
  let count: number = 0;
  let i: number = 0;
  while (i++ < 5) {
    count++;
  }
  let expected: number = 5;
  if (count !== expected) {
    console.info(`${TAG} Task execution failed: count: ${count}`);
    throw new Error('count check failed, expected expected');
  }
}

export function ExpressionTest0109() {
  const TAG = 'ExpressionTest0109';
  let a: number = 5;
  let b: number = 3;
  let result: number = --a - b;
  let expected: number = 1;
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }
}

export function ExpressionTest0110() {
  const TAG = 'ExpressionTest0110';
  let a: number = 5;
  let b: number = 3;
  let result: number = a-- - b;
  let expected: number = 2;
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }
}

export function ExpressionTest0111() {
  const TAG = 'ExpressionTest0111';
  let a: number = 10;
  let b: number = 4;
  let result: number = 0;
  result = a * 2 + b / 2;
  let expected: number = 22;
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }
}

export function ExpressionTest0112() {
  const TAG = 'ExpressionTest0112';
  let a: number = 5;
  let b: number = -3;
  a += b;
  let expected: number = 2;
  if (a !== expected) {
    console.info(`${TAG} Task execution failed: a: ${a}`);
    throw new Error('a check failed, expected expected');
  }
}

export function ExpressionTest0113() {
  const TAG = 'ExpressionTest0113';
  let a: number = 5;
  let b: number = -3;
  a -= b;
  let expected: number = 8;
  if (a !== expected) {
    console.info(`${TAG} Task execution failed: a: ${a}`);
    throw new Error('a check failed, expected expected');
  }
}

export function ExpressionTest0114() {
  const TAG = 'ExpressionTest0114';
  let a: number = 6;
  let b: number = 0.5;
  a *= b;
  let expected: number = 3;
  if (a !== expected) {
    console.info(`${TAG} Task execution failed: a: ${a}`);
    throw new Error('a check failed, expected expected');
  }
}

export function ExpressionTest0115() {
  const TAG = 'ExpressionTest0115';
  let a: number = 15;
  let b: number = 2;
  a /= b;
  let expected: number = 7.5;
  if (a !== expected) {
    console.info(`${TAG} Task execution failed: a: ${a}`);
    throw new Error('a check failed, expected expected');
  }
}

export function ExpressionTest0116() {
  const TAG = 'ExpressionTest0116';
  let a: number = -17;
  let b: number = 5;
  a %= b;
  let expected: number = -2;
  if (a !== expected) {
    console.info(`${TAG} Task execution failed: a: ${a}`);
    throw new Error('a check failed, expected expected');
  }
}

export function ExpressionTest0117() {
  const TAG = 'ExpressionTest0117';
  let a: number = 2;
  let b: number = -3;
  a **= b;
  let expected: number = 0.125;
  if (a !== expected) {
    console.info(`${TAG} Task execution failed: a: ${a}`);
    throw new Error('a check failed, expected expected');
  }
}

export function ExpressionTest0118() {
  const TAG = 'ExpressionTest0118';
  let a: number = 1.5;
  let b: number = 1.5;
  let result: boolean = a === b;
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0119() {
  const TAG = 'ExpressionTest0119';
  let a: number = 1.5;
  let b: number = 2.5;
  let result: boolean = a !== b;
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0121() {
  const TAG = 'ExpressionTest0121';
  let a: number = 3.7;
  let b: number = 3.2;
  let result: boolean = a > b;
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0122() {
  const TAG = 'ExpressionTest0122';
  let a: number = -5;
  let b: number = -3;
  let result: boolean = a < b;
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0123() {
  const TAG = 'ExpressionTest0123';
  let a: number = 7.5;
  let b: number = 7.5;
  let result: boolean = a >= b;
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0124() {
  const TAG = 'ExpressionTest0124';
  let a: number = -2.3;
  let b: number = -2.1;
  let result: boolean = a <= b;
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0125() {
  const TAG = 'ExpressionTest0125';
  let a: number = 5;
  let b: number = 10;
  let result: number = a && b;
  let expected: number = 10;
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }
}

export function ExpressionTest0126() {
  const TAG = 'ExpressionTest0126';
  let a: number = 0;
  let b: number = 10;
  let result: number = a && b;
  let expected: number = 0;
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }
}

export function ExpressionTest0127() {
  const TAG = 'ExpressionTest0127';
  let a: number = 0;
  let b: number = 10;
  let result: number = a || b;
  let expected: number = 10;
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }
}

export function ExpressionTest0128() {
  const TAG = 'ExpressionTest0128';
  let a: number = 0;
  let result: boolean = !a;
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0129() {
  const TAG = 'ExpressionTest0129';
  let a: number = -5;
  let b: number = -3;
  let result: number = a & b;
  let expected: number = -7;
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }
}

export function ExpressionTest0130() {
  const TAG = 'ExpressionTest0130';
  let a: number = 0xffff;
  let b: number = 0xff00;
  let result: number = a | b;
  let expected: number = 0xffff;
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }
}

export function ExpressionTest0131() {
  const TAG = 'ExpressionTest0131';
  let a: number = 255;
  let b: number = 0;
  let result: number = a ^ b;
  let expected: number = 255;
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }
}

export function ExpressionTest0132() {
  const TAG = 'ExpressionTest0132';
  let a: number = 2147483647;
  let result: number = ~a;
  let expected: number = -2147483648;
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }
}

export function ExpressionTest0133() {
  const TAG = 'ExpressionTest0133';
  let a: int = 1;
  let result: int = a << 31;
  let expected: int = -2147483648;
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }
}

export function ExpressionTest0134() {
  const TAG = 'ExpressionTest0134';
  let a: number = -2147483648;
  let result: number = a >> 31;
  let expected: number = -1;
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }
}

export function ExpressionTest0135() {
  const TAG = 'ExpressionTest0135';
  let a: int = 0xffffffff.toInt();
  let result: int = a >>> 1;
  let expected: int = 0x7fffffff;
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }
}

export function ExpressionTest0136() {
  const TAG = 'ExpressionTest0136';
  let a: number = 15;
  let b: number = 20;
  let result: number = a > b ? a : b;
  let expected: number = 20;
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }
}

export function ExpressionTest0137() {
  const TAG = 'ExpressionTest0137';
  let result: number = 0;
  let i: number, j: number;
  for (i = 0, j = 10; i < 5; i++, j--) {
    result += i + j;
  }
  let expected: number = 50;
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }
}

export function ExpressionTest0138() {
  const TAG = 'ExpressionTest0138';
  let a: bigint = BigInt(9007199254740991);
  let result: string = typeof a;
  let expected: string = "bigint";
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }

  if (!result.includes(expected)) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result does not contain expected');
  }
}

export function ExpressionTest0139() {
  const TAG = 'ExpressionTest0139';
  let testFunc: () => void = (): void => {
  };
  let result: string = typeof testFunc;
  let expected: string = "function";
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }
}

export function ExpressionTest0140() {
  const TAG = 'ExpressionTest0140';
  let a: number = -5;
  let result: number = +a;
  let expected: number = -5;
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }
}

export function ExpressionTest0141() {
  const TAG = 'ExpressionTest0141';
  let a: number = -5;
  let result: number = -a;
  let expected: number = 5;
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }
}

export function ExpressionTest0146() {
  const TAG = 'ExpressionTest0146';
  let arr: number[] = [1];
  let a: number = arr.length > 0 ? arr[0] : 0;
  let b: number = arr.length > 1 ? arr[1] : 0;
  let expectedA: number = 1;
  let expectedB: number = 0;
  if (a !== expectedA) {
    console.info(`${TAG} Task execution failed: a: ${a}`);
    throw new Error('a check failed, expected expectedA');
  }

  if (b !== expectedB) {
    console.info(`${TAG} Task execution failed: b: ${b}`);
    throw new Error('b check failed, expected expectedB');
  }
}

export function ExpressionTest0147() {
  const TAG = 'ExpressionTest0147';
  let arr: number[] = [];
  let a: number = arr.length > 0 ? arr[0] : 0;
  let rest: number[] = arr.length > 1 ? arr.slice(1) : [];
  let expectedA: number = 0;
  let expectedRestLength: number = 0;
  if (a !== expectedA) {
    console.info(`${TAG} Task execution failed: a: ${a}`);
    throw new Error('a check failed, expected expectedA');
  }

  if (rest.length !== expectedRestLength) {
    console.info(`${TAG} Task execution failed: rest.length: ${rest.length}`);
    throw new Error('rest.length check failed, expected expectedRestLength');
  }
}

export function ExpressionTest0148() {
  const TAG = 'ExpressionTest0148';
  let a: number = 5;
  let b: number = 3;
  let result: number = -a * b;
  let expected: number = -15;
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }
}

export function ExpressionTest0149() {
  const TAG = 'ExpressionTest0149';
  let obj: TestClass3 | null = new TestClass3();
  let result1 = obj?.getValue();
  obj = null;
  let expected1 = 42;
  if (result1 !== expected1) {
    console.info(`${TAG} Task execution failed: result1: ${result1}`);
    throw new Error('result1 check failed, expected expected1');
  }
}

export function ExpressionTest0150() {
  const TAG = 'ExpressionTest0150';
  let x: number = 0;
  let y: number = 100;
  for (let i = 0; i < 5; i++, x += 5, y -= 10) {
  }
  let expectedX: number = 25;
  let expectedY: number = 50;
  if (x !== expectedX) {
    console.info(`${TAG} Task execution failed: x: ${x}`);
    throw new Error('x check failed, expected expectedX');
  }

  if (y !== expectedY) {
    console.info(`${TAG} Task execution failed: y: ${y}`);
    throw new Error('y check failed, expected expectedY');
  }
}

export function ExpressionTest0151() {
  const TAG = 'ExpressionTest0151';
  let minInt: number = -9007199254740991;
  let result: number = minInt + (-1);
  let expected: number = -9007199254740992;
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }
}

export function ExpressionTest0152() {
  const TAG = 'ExpressionTest0152';
  let a: number = 9007199254740991;
  let b: number = -2;
  let result: number = a - b;
  let expected: number = 9007199254740993;
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }
}

export function ExpressionTest0153() {
  const TAG = 'ExpressionTest0153';
  let a: number = 0.0000001;
  let b: number = 0.0000002;
  let result: number = a * b;
  let expected: number = 2e-14;
  let tolerance: number = 1e-20;
  if (!(Math.abs(result - expected) < tolerance)) {
    console.info(`${TAG} Task execution failed: Math.abs(result - expected) < tolerance: ${Math.abs(result - expected) <
      tolerance}`);
    throw new Error('Math.abs(result - expected) < tolerance is not true');
  }
}

export function ExpressionTest0154() {
  const TAG = 'ExpressionTest0154';
  let a: number = 1;
  let b: number = 1000000;
  let result: number = a / b;
  let expected: number = 0.000001;
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }
}

export function ExpressionTest0155() {
  const TAG = 'ExpressionTest0155';
  let a: number = 0;
  let b: number = 5;
  let result: number = a % b;
  let expected: number = 0;
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }
}

export function ExpressionTest0156() {
  const TAG = 'ExpressionTest0156';
  let a: number = 2;
  let b: number = 30;
  let result: number = a**b;
  let expected: number = 1073741824;
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }
}

export function ExpressionTest0157() {
  const TAG = 'ExpressionTest0157';
  let a: number = 3;
  let result: number = 2 * ++a + 5;
  let expected: number = 13;
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }
}

export function ExpressionTest0158() {
  const TAG = 'ExpressionTest0158';
  let a: number = 3;
  let result: number = 2 * a++ + 5;
  let expected: number = 11;
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }
}

export function ExpressionTest0159() {
  const TAG = 'ExpressionTest0159';
  let a: number = 10;
  let b: number = 4;
  let result: number = (--a * 2) / b + 3;
  let expected: number = 7.5;
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }
}

export function ExpressionTest0160() {
  const TAG = 'ExpressionTest0160';
  let a: number = 10;
  let b: number = 4;
  let result: number = (a-- * 2) / b + 3;
  let expected: number = 8;
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }
}

export function ExpressionTest0161() {
  const TAG = 'ExpressionTest0161';
  let a: number = 5;
  let b: number = 3;
  let c: number = 2;
  let result: number = 0;
  result = (a + b) * (c / a) + b;
  let expected: number = 6.2;
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }
}

export function ExpressionTest0162() {
  const TAG = 'ExpressionTest0162';
  let a: number = 9007199254740990;
  let b: number = 3;
  a += b;
  let expected: number = 9007199254740993;
  if (a !== expected) {
    console.info(`${TAG} Task execution failed: a: ${a}`);
    throw new Error('a check failed, expected expected');
  }
}

export function ExpressionTest0163() {
  const TAG = 'ExpressionTest0163';
  let a: number = 0.0000001;
  let b: number = 0.00000005;
  a -= b;
  let expected: number = 0.00000005;
  if (a !== expected) {
    console.info(`${TAG} Task execution failed: a: ${a}`);
    throw new Error('a check failed, expected expected');
  }
}

export function ExpressionTest0164() {
  const TAG = 'ExpressionTest0164';
  let a: number = -2.5;
  let b: number = 0.5;
  a *= b;
  let expected: number = -1.25;
  if (a !== expected) {
    console.info(`${TAG} Task execution failed: a: ${a}`);
    throw new Error('a check failed, expected expected');
  }
}

export function ExpressionTest0165() {
  const TAG = 'ExpressionTest0165';
  let a: number = -15;
  let b: number = -3;
  a /= b;
  let expected: number = 5;
  if (a !== expected) {
    console.info(`${TAG} Task execution failed: a: ${a}`);
    throw new Error('a check failed, expected expected');
  }
}

export function ExpressionTest0166() {
  const TAG = 'ExpressionTest0166';
  let a: number = 7.2;
  let b: number = 2.5;
  a %= b;
  let expected: number = 2.2;
  if (a !== expected) {
    console.info(`${TAG} Task execution failed: a: ${a}`);
    throw new Error('a check failed, expected expected');
  }
}

export function ExpressionTest0167() {
  const TAG = 'ExpressionTest0167';
  let a: number = 81;
  let b: number = 0.25;
  a **= b;
  let expected: number = 3;
  if (a !== expected) {
    console.info(`${TAG} Task execution failed: a: ${a}`);
    throw new Error('a check failed, expected expected');
  }
}

export function ExpressionTest0168() {
  const TAG = 'ExpressionTest0168';
  let a: number = Infinity;
  let b: number = Infinity;
  let result: boolean = a === b;
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0169() {
  const TAG = 'ExpressionTest0169';
  let a: number = Infinity;
  let b: number = -Infinity;
  let result: boolean = a !== b;
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0170() {
  const TAG = 'ExpressionTest0170';
  let a: number = NaN;
  let b: number = NaN;
  let result: boolean = a == b;
  let expected: boolean = false;
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }
}

export function ExpressionTest0171() {
  const TAG = 'ExpressionTest0171';
  let a: number = Infinity;
  let b: number = 1000000000;
  let result: boolean = a > b;
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0172() {
  const TAG = 'ExpressionTest0172';
  let a: number = -Infinity;
  let b: number = -1000000000;
  let result: boolean = a < b;
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0173() {
  const TAG = 'ExpressionTest0173';
  let a: number = NaN;
  let b: number = 5;
  let result: boolean = a >= b;
  let expected: boolean = false;
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }
}

export function ExpressionTest0174() {
  const TAG = 'ExpressionTest0174';
  let a: number = -3;
  let b: number = 2;
  let result: boolean = a <= b;
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0175() {
  const TAG = 'ExpressionTest0175';
  let a: number = 0;
  let b: number = -5;
  let result: number = a && b;
  let expected: number = 0;
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }
}

export function ExpressionTest0176() {
  const TAG = 'ExpressionTest0176';
  let a: number = -3;
  let b: number = -5;
  let result: number = a && b;
  let expected: number = -5;
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }
}

export function ExpressionTest0177() {
  const TAG = 'ExpressionTest0177';
  let a: number = -3;
  let b: number = -5;
  let result: number = a || b;
  let expected: number = -3;
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }
}

export function ExpressionTest0178() {
  const TAG = 'ExpressionTest0178';
  let a: number = -5;
  let result: boolean = !a;
  let expected: boolean = false;
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }
}

export function ExpressionTest0179() {
  const TAG = 'ExpressionTest0179';
  let a: number = 255;
  let b: number = 0;
  let result: number = a & b;
  let expected: number = 0;
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }
}

export function ExpressionTest0180() {
  const TAG = 'ExpressionTest0180';
  let a: number = 123;
  let b: number = 0xff;
  let result: number = a | b;
  let expected: number = 255;
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }
}

export function ExpressionTest0181() {
  const TAG = 'ExpressionTest0181';
  let a: number = 42;
  let result: number = a ^ a;
  let expected: number = 0;
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }
}

export function ExpressionTest0182() {
  const TAG = 'ExpressionTest0182';
  let a: number = 0;
  let result: number = ~a;
  let expected: number = -1;
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }
}

export function ExpressionTest0183() {
  const TAG = 'ExpressionTest0183';
  let a: int = 1;
  let result: int = a << 32;
  let expected: int = 1;
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }
}

export function ExpressionTest0184() {
  const TAG = 'ExpressionTest0184';
  let a: number = 255;
  let result: number = a >> 10;
  let expected: number = 0;
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }
}

export function ExpressionTest0185() {
  const TAG = 'ExpressionTest0185';
  let a: int = -1;
  let result: int = a >>> 0;
  let expected: int = -1;
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }
}

export function ExpressionTest0186() {
  const TAG = 'ExpressionTest0186';
  let a: number = NaN;
  let result: string = a ? "truthy" : "falsy";
  let expected: string = "falsy";
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }
}

export function ExpressionTest0187() {
  const TAG = 'ExpressionTest0187';
  let sum: number = 0;
  let product: number = 1;
  let i: number, j: number;
  for (i = 1, j = 5; i <= 5; i++, j--) {
    sum += i + j;
    product *= i;
  }
  let expectedSum: number = 30;
  let expectedProduct: number = 120;
  if (sum !== expectedSum) {
    console.info(`${TAG} Task execution failed: sum: ${sum}`);
    throw new Error('sum check failed, expected expectedSum');
  }

  if (product !== expectedProduct) {
    console.info(`${TAG} Task execution failed: product: ${product}`);
    throw new Error('product check failed, expected expectedProduct');
  }
}

export function ExpressionTest0188() {
  const TAG = 'ExpressionTest0188';
  let symbolCounter = 0;
  let createSymbol: (description: string) => string = (description: string): string => {
    return `Symbol(${description})_${symbolCounter++}`;
  };
  let sym: string = createSymbol("test");
  let result: string = typeof sym;
  let expected: string = "string";
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }

  if (!sym.includes("test")) {
    console.info(`${TAG} Task execution failed: sym: ${sym}`);
    throw new Error('sym does not contain test');
  }
}

export function ExpressionTest0189() {
  const TAG = 'ExpressionTest0189';
  let a: number = 42;
  let result: string = typeof a;
  let expected: string = "number";
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }
}

export function ExpressionTest0190() {
  const TAG = 'ExpressionTest0190';
  let a: number = 0;
  let result: number = +a;
  let expected: number = 0;
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }
}

export function ExpressionTest0191() {
  const TAG = 'ExpressionTest0191';
  let a: number = 0;
  let result: number = -a;
  let expected: number = 0;
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }
}

export function ExpressionTest0196() {
  const TAG = 'ExpressionTest0196';
  let a: number = 5;
  let b: number = 3;
  let c: number = 7;
  let bitwiseResult: number = a & b;
  let comparisonResult: boolean = c > 5;
  let result: boolean = (bitwiseResult !== 0) || comparisonResult;
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0197() {
  const TAG = 'ExpressionTest0197';
  let obj: OuterClass5 | null = new OuterClass5();
  let result1: number | undefined = obj?.inner?.value;
  obj = null;
  let expected1: number = 10;
  if (result1 !== expected1) {
    console.info(`${TAG} Task execution failed: result1: ${result1}`);
    throw new Error('result1 check failed, expected expected1');
  }
}

export function ExpressionTest0198() {
  const TAG = 'ExpressionTest0198';
  let a: number = 0;
  let b: number = 1;
  for (let i = 0; i < 5; i++, a += b, b *= 2) {
  }
  let expectedA: number = 31;
  let expectedB: number = 32;
  if (a !== expectedA) {
    console.info(`${TAG} Task execution failed: a: ${a}`);
    throw new Error('a check failed, expected expectedA');
  }

  if (b !== expectedB) {
    console.info(`${TAG} Task execution failed: b: ${b}`);
    throw new Error('b check failed, expected expectedB');
  }
}

export function ExpressionTest0199() {
  const TAG = 'ExpressionTest0199';
  let a: number = 10;
  let b: number = 5;
  let c: number = 3;
  let result: boolean = a / b > c;
  let expected: boolean = false;
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }
}

export function ExpressionTest0200() {
  const TAG = 'ExpressionTest0200';
  let result: number = 0;
  let i: number, j: number;
  for (i = (5 - 2), j = (3 * 4); i < j; i++, j--) {
    result += i + j;
  }
  let expected: number = 75;
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }
}
