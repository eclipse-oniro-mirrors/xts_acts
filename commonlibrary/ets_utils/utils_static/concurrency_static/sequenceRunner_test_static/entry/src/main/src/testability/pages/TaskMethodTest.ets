/*
* Copyright (C) 2025 HiHope Open Source Organization.
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

import { AsyncLockTest, AsyncLockTest1, BaseClass, DeriveClass } from './SendableTest';
import { sleep, test, test1 } from './Utils';
import { BusinessError } from '@ohos.base';

export function printArgs1(args: number): number {
  console.info('printArgs: ' + args);
  return args;
}

export function printArgs2(args: number): number {
  console.info('printArgs: ' + args);
  return args;
}

/**
 * error
 * @param args
 * @returns
 */
export function printArgs3(args: number): number {
  console.info('printArgs: ' + args);
  let s: string[] = []
  s[0].split('')[1].toString()
  return args;
}

/**
 * error
 * @param args
 * @returns
 */
export function printArgs4(args: number): number {
  console.info('printArgs: ' + args);
  let s: string[] = []
  s[0].split('')[1].toString()
  return args;
}

/**
 * 延时
 * @param args
 * @returns
 */
export function printArgs5(arg: number): number {
  console.info('printArgs: ' + arg);

  let t: number = Date.now();
  while (Date.now() - t < 2000) {
    continue;
  }

  if (taskpool.Task.isCanceled()) {
    console.info('==== task has been canceled after 2s sleep.');
    return arg + 1;
  }

  return arg;
}

/**
 * 延时
 * @param args
 * @returns
 */
export function printArgs6(arg: number): number {
  console.info('printArgs: ' + arg);

  let t: number = Date.now();
  while (Date.now() - t < 2000) {
    continue;
  }

  if (taskpool.Task.isCanceled()) {
    console.info('==== task has been canceled after 2s sleep.');
    return arg + 1;
  }

  return arg;
}

/**
 * sendData
 * @param args
 * @returns
 */
export function printArgs7(args: number): number {
  console.info('printArgs: ' + args);
  taskpool.Task.sendData(args);
  return args;
}

/**
 * sendData
 * @param args
 * @returns
 */
export function printArgs8(args: number): number {
  console.info('printArgs: ' + args);
  taskpool.Task.sendData(args);
  return args;
}

/**
 * setTimeout-error
 * @param args
 * @returns
 */
export async function printArgs9(args: number): Promise<number> {
  console.info('printArgs: ' + args);
  setTimeout((): void => {
    let s: string[] = []
    s[0].split('')[1].toString()
  }, 100)
  return args;
}


export function printArgs10(args: number): number {
  console.info('printArgs: ' + args);
  return args;
}

export function testTransfer(arg1: ArrayBuffer, arg2: ArrayBuffer): number {
  console.info('testTransfer arg1 byteLength: ' + arg1.byteLength);
  console.info('testTransfer arg2 byteLength: ' + arg2.byteLength);
  return 100;
}

export function testFunc(arr: Array<BaseClass>, num: number): number {
  let baseInstance1 = arr[0];
  console.info('sendable: str1 is: ' + baseInstance1.str1);
  baseInstance1.SetNum = 100;
  console.info('sendable: num1 is: ' + baseInstance1.GetNum);
  console.info('sendable: isDone1 is: ' + baseInstance1.isDone1);
  let res: number = baseInstance1.publicFunc(num);
  return res;
}

export function printLog(arr: Array<DeriveClass>): void {
  let deriveInstance = arr[0];
  deriveInstance.printName();
}

export async function asyncLock(a: AsyncLockTest): Promise<void> {
  await a.setCount(10)
}

export async function asyncLock1(a: AsyncLockTest1): Promise<void> {
  await a.setCount(10).then((): void => {
    let s: string[] = []
    s[0].split('')[1].toString()
  })
}

export async function asyncLock2(a: AsyncLockTest1): Promise<void> {
  try {
    await a.setCount(10).then((): void => {
      let s: string[] = []
      s[0].split('')[1].toString()
    })
  } catch(e) {
    e = e as BusinessError;
    let s: string[] = []
    s[0].split('')[1].toString()
  }
}

export async function asyncLock3(a: AsyncLockTest1): Promise<void> {
  await a.setCount(10).then((): void => {

  }).finally((): void => {
    let s: string[] = []
    s[0].split('')[1].toString()
  })
}

export async function asyncLock4(a: AsyncLockTest1): Promise<number> {
  await a.setCount(1)
  return 1 as number
}

export async function asyncLock5(a: AsyncLockTest1): Promise<number> {
  await a.setCount(2)
  return 2 as number
}

export async function cancelTask(task: taskpool.Task): Promise<string> {
  return await new Promise<string>((resolve) => {
    taskpool.cancel(task)
    resolve('cancel task')
  });
}

export async function timeout(args: number): Promise<number> {
  console.info('printArgs: ' + args);
  setTimeout((): void => {
    let s: string[] = []
  }, 100)
  return args;
}

export async function secPool(args: number): Promise<number> {
  console.info('printArgs: ' + args);
  let task: taskpool.Task = new taskpool.Task(test1);
  await taskpool.execute(task)
  return args;
}

export async function setTimeOutWork(): Promise<void> {
  setTimeout((): void => {

  }, 100)
}

export function waitForTest(): void {

}

export async function asyncLockThen(a: AsyncLockTest1): Promise<void> {
  await a.setCount(10).then((): void => {
    let s: string[] = []
    s[0].split('')[1].toString()
  })
}