/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
import taskpool from '@ohos.taskpool';

function add(value1: number, value2: number): number {
  "use concurrent"
  return value1 + value2;
}

function addOne(value1: number): number {
  "use concurrent"
  return value1 + 1;
}

function printUndefined(value: number | undefined): number | undefined {
  "use concurrent"
  return value;
}

function printNull(value: null): null {
  "use concurrent"
  return value;
}

function funOne(value1: number): number {
  "use concurrent"
  console.info(`taskpool: data is: ${value1} `);
  return value1;
}

function multiply(value1: number, value2: number): number {
  "use concurrent"
  return value1 * value2;
}

function dividing(value1: number, value2: number): number {
  "use concurrent"
  return value1 / value2;
}

function mathCeil(value1: number): number {
  "use concurrent"
  return Math.ceil(value1);
}

function mathFloor(value1: number): number {
  "use concurrent"
  return Math.floor(value1);
}

function mathRound(value1: number): number {
  "use concurrent"
  return Math.round(value1);
}

function mathPow(value1: number, value2: number): number {
  "use concurrent"
  return Math.pow(value1, value2);
}

function mathSqrt(value1: number): number {
  "use concurrent"
  return Math.sqrt(value1);
}

function mathAbs(value1: number): number {
  "use concurrent"
  return Math.abs(value1);
}

function mathMore(value1: number): number {
  "use concurrent"
  return value1 % 5;
}

function mathMax(value1: number, value2: number): number {
  "use concurrent"
  return Math.max(value1, value2);
}

function mathMin(value1: number, value2: number): number {
  "use concurrent"
  return Math.min(value1, value2);
}

function addition(arg: number): number {
  "use concurrent"
  let start: number = new Date().getTime();
  while (new Date().getTime() - start < 100) {
    continue;
  }
  return arg;
}

function additionF(): void {
  "use concurrent"
  let start: number = new Date().getTime();
  while (new Date().getTime() - start < 100) {
    continue;
  }
}

function adds(value1: string, value2: string): string {
  "use concurrent"
  return value1 + value2;
}

function addAdd(value1: string, value2: string, value3: string): string {
  "use concurrent"
  setTimeout(() => {
  }, 1000);
  return value1 + value2 + value3;
}

function printString(args: string): string {
  "use concurrent"
  console.info(`printString: ${args}`);
  return args;
}

function printArgs(args: number): number {
  "use concurrent"
  console.info(`printArgs: ${args}`);
  return args;
}

function printABool(args: boolean): boolean {
  "use concurrent"
  console.info(`printArgs: ${args}`);
  return args;
}

function printABig(args: bigint): bigint {
  "use concurrent"
  console.info(`printArgs: ${args}`);
  return args;
}

function printSan(args: number): number {
  "use concurrent"
  let start: number = new Date().getTime();
  while (new Date().getTime() - start < 3000) {
    continue;
  }
  console.info(`printSan: ${args}`);
  return args;
}

function printLang(args: number): number {
  "use concurrent"
  let start: number = new Date().getTime();
  while (new Date().getTime() - start < 1000) {
    continue;
  }
  return args;
}

function printTime(args: number): number {
  "use concurrent"
  let start: number = new Date().getTime();
  while (new Date().getTime() - start < 10) {
    continue;
  }
  console.info(`printArgs: ${args}`);
  return args;
}

function testTransfer(arg1: ArrayBuffer, arg2: ArrayBuffer): number {
  "use concurrent"
  return arg1.byteLength + arg2.byteLength;
}

function testFunc(arrayBuffer: ArrayBuffer): Int32Array {
  "use concurrent"
  let view: Int32Array = new Int32Array(arrayBuffer);
  let arr: number[] = [11, 12, 13, 14];
  for (let i = 0; i < arr.length; i++) {
    view[i] = arr[i];
  }
  return view;
}

function throwError(): void {
  "use concurrent"
  try {
    throw new Error(' throw new Error ');
  } catch (error) {
    console.info(`no throw new Error: ${JSON.stringify(error)}`);
  }
}

function stringToNumber(str: string | number): number {
  "use concurrent"
  if (typeof (str) == 'number') {
    return str;
  }
  return str === 'a' ? 2 : str === 'b' ? 4 : 0;
}

function sendDataCatch(num: number): number | (number | string)[] {
  "use concurrent"
  let res: number = num * 10;
  console.info(`concurrentF: res1 ${res}`);
  try {
    taskpool.Task.sendData(res);
  } catch (error) {
    console.info(`sendDataCatch: catch error: err1 code => ${error.code} message => ${error.message}`);
    let errorArray: (number | string)[] = [error.code, error.message];
    console.info(`sendDataCatch: err2 ${JSON.stringify(errorArray)}`);
    return errorArray;
  }
  console.info(`concurrentF: res2 ${res}`);
  return num;
}

function sendDataFun(num: number): Promise<number | (number | string)[]> {
  "use concurrent"
  taskpool.Task.sendData(0);
  return new Promise((resolve, reject) => {
    let res1 = num * 20;
    let errorArray: (number | string)[] = [];
    try {
      taskpool.Task.sendData(res1);
      resolve(errorArray);
    } catch (error) {
      console.info(`sendDataFun: catch error: err1 code => ${error.code} message => ${error.message}`);
      errorArray = [error.code, error.message];
      console.info(`sendDataFun: err2 ${JSON.stringify(errorArray)}`);
      reject(errorArray)
    }
  });
}

function concurrentF(num: number): number {
  "use concurrent"
  let res: number = num * 10;
  console.info(`concurrentF: res1 ${res}`);
  taskpool.Task.sendData(res);
  console.info(`concurrentF: res2 ${res}`);
  return num;
}

function spileString(value1: string, value2: string): string {
  "use concurrent"
  let str: string = value1 + value2;
  taskpool.Task.sendData(str);
  return str;
}

function funArray(value1: number[]): void {
  "use concurrent"
  console.info(`taskpool: data is: ${JSON.stringify(value1)} `);
  taskpool.Task.sendData(value1);
}

function funDate(value1: object): void {
  "use concurrent"
  console.info(`taskpool: data is: ${JSON.stringify(value1)} `);
  taskpool.Task.sendData(value1);
}

function AdditionDelay(delay: number): number {
  "use concurrent"
  let start: number = new Date().getTime();
  while (new Date().getTime() - start < delay) {
    continue;
  }
  return delay;
}

export {
  add,
  addOne,
  printUndefined,
  printNull,
  funOne,
  multiply,
  dividing,
  mathCeil,
  mathFloor,
  mathRound,
  mathPow,
  mathSqrt,
  mathAbs,
  mathMore,
  mathMax,
  mathMin,
  addition,
  additionF,
  adds,
  addAdd,
  printString,
  printArgs,
  printABool,
  printABig,
  printSan,
  printLang,
  printTime,
  testTransfer,
  testFunc,
  throwError,
  stringToNumber,
  sendDataCatch,
  sendDataFun,
  concurrentF,
  spileString,
  funArray,
  funDate,
  AdditionDelay
}