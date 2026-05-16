'use static'
/*
* Copyright (c) 2026 SwanLink (Jiangsu) Technology Development Co., LTD.
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


export function testAttemptInvalidTypeConversion0001() {
  const TAG = 'testAttemptInvalidTypeConversion0001';
  let arr: number[] = [1, 2, 3];
  let str: string = JSON.stringify(arr);
  let expectedStr: string = "[1,2,3]";
  if (str !== expectedStr) {
    console.info(`${TAG} Task execution failed: str: ${str}`);
    throw new Error('str check failed, expected expectedStr');
  }
}

export function testAttemptInvalidTypeConversion0002() {
  const TAG = 'testAttemptInvalidTypeConversion0002';
  let str: string = "";
  let num: number = Number(str);
  let expectedNum: number = 0;
  if (num !== expectedNum) {
    console.info(`${TAG} Task execution failed: num: ${num}`);
    throw new Error('num check failed, expected expectedNum');
  }
}

export function testAttemptInvalidTypeConversion0003() {
  const TAG = 'testAttemptInvalidTypeConversion0003';
  let str: string = "hello";
  let bool: boolean = Boolean(str);
  let expectedBool: boolean = true;
  if (bool !== expectedBool) {
    console.info(`${TAG} Task execution failed: bool: ${bool}`);
    throw new Error('bool check failed, expected expectedBool');
  }
}

export function testAttemptInvalidTypeConversion0004() {
  const TAG = 'testAttemptInvalidTypeConversion0004';
  let num: number = 42;
  let str: string = String(num);
  let expectedStr: string = "42";
  if (str !== expectedStr) {
    console.info(`${TAG} Task execution failed: str: ${str}`);
    throw new Error('str check failed, expected expectedStr');
  }
}

export function testAttemptInvalidTypeConversion0005() {
  const TAG = 'testAttemptInvalidTypeConversion0005';
  let str: string = "42.5";
  let num: number = parseFloat(str);
  let expectedNum: number = 42.5;
  if (num !== expectedNum) {
    console.info(`${TAG} Task execution failed: num: ${num}`);
    throw new Error('num check failed, expected expectedNum');
  }
}

export function testAttemptInvalidTypeConversion0006() {
  const TAG = 'testAttemptInvalidTypeConversion0006';
  let readonlyArr: readonly number[] = [1, 2, 3];
  let mutableArr: number[] = readonlyArr as number[];
  if (mutableArr[0] !== 1) {
    console.info(`${TAG} Task execution failed: mutableArr[0]: ${mutableArr[0]}`);
    throw new Error('mutableArr[0] check failed, expected 1');
  }

  if (mutableArr[1] !== 2) {
    console.info(`${TAG} Task execution failed: mutableArr[1]: ${mutableArr[1]}`);
    throw new Error('mutableArr[1] check failed, expected 2');
  }

  if (mutableArr[2] !== 3) {
    console.info(`${TAG} Task execution failed: mutableArr[2]: ${mutableArr[2]}`);
    throw new Error('mutableArr[2] check failed, expected 3');
  }
}

export function testAttemptInvalidTypeConversion0007() {
  const TAG = 'testAttemptInvalidTypeConversion0007';
  let arr: number[] = [1, 2, 3];
  let str: string = arr.toString();
  let expectedStr: string = "1,2,3";
  if (str !== expectedStr) {
    console.info(`${TAG} Task execution failed: str: ${str}`);
    throw new Error('str check failed, expected expectedStr');
  }
}

export function testAttemptInvalidTypeConversion0008() {
  const TAG = 'testAttemptInvalidTypeConversion0008';
  let str: string = "42";
  let num: number = parseInt(str, 10);
  let expectedNum: number = 42;
  if (num !== expectedNum) {
    console.info(`${TAG} Task execution failed: num: ${num}`);
    throw new Error('num check failed, expected expectedNum');
  }
}

export function testAttemptInvalidTypeConversion0009() {
  const TAG = 'testAttemptInvalidTypeConversion0009';
  let arr: number[] = [1, 2, 3];
  let str: string = String(arr);
  let expectedStr: string = "1,2,3";
  if (str !== expectedStr) {
    console.info(`${TAG} Task execution failed: str: ${str}`);
    throw new Error('str check failed, expected expectedStr');
  }
}

export function testAttemptInvalidTypeConversion0010() {
  const TAG = 'testAttemptInvalidTypeConversion0010';
  let arr: number[] = [1, 2, 3];
  let str: string = `${arr}`;
  let expectedStr: string = "1,2,3";
  if (str !== expectedStr) {
    console.info(`${TAG} Task execution failed: str: ${str}`);
    throw new Error('str check failed, expected expectedStr');
  }
}

export function testAttemptInvalidTypeConversion0011() {
  const TAG = 'testAttemptInvalidTypeConversion0011';
  let str: string = "42";
  let num: number = Number(str);
  let expectedNum: number = 42;
  if (num !== expectedNum) {
    console.info(`${TAG} Task execution failed: num: ${num}`);
    throw new Error('num check failed, expected expectedNum');
  }
}
