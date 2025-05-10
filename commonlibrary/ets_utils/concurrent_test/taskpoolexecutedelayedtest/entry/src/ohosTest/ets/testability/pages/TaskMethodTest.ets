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

import { AsyncLockTest, AsyncLockTest1, BaseClass, DeriveClass } from './SendableTest';
import { taskpool, worker } from '@kit.ArkTS';
import { defError, sleep, test, test1, WorkThread } from './Utils';
import { MeasureText } from '@kit.ArkUI';

@Concurrent
export function printArgs1(args: number): number {
  console.info('printArgs: ' + args);
  return args;
}

@Concurrent
export function printArgs2(args: number): number {
  console.info('printArgs: ' + args);
  return args;
}

/**
 * error
 * @param args
 * @returns
 */
@Concurrent
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
@Concurrent
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
@Concurrent
export function printArgs5(arg: number): number {
  console.info('printArgs: ' + arg);

  // 延时2s
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
@Concurrent
export function printArgs6(arg: number): number {
  console.info('printArgs: ' + arg);

  // 延时2s
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
@Concurrent
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
@Concurrent
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
@Concurrent
export async function printArgs9(args: number){
  console.info('printArgs: ' + args);
  setTimeout(() => {
    let s: string[] = []
    s[0].split('')[1].toString()
  },100)
  return args;
}

/**
 * worker线程
 * @param args
 * @returns
 */
@Concurrent
export function printArgs10(args: number): number {
  console.info('printArgs: ' + args);
  // WorkThread.workerStageModel.postMessage('worker线程')
  return args;
}

/**
 * task-二级
 * @param args
 * @returns
 */
@Concurrent
export async function printArgs11(args: number) {
  console.info('printArgs: ' + args);
  let task: taskpool.Task = new taskpool.Task(test);
  await taskpool.execute(task)
  return args;
}

/**
 * task-二级
 * @param args
 * @returns
 */
@Concurrent
export async function printArgs12(args: number) {
  console.info('printArgs: ' + args);
  let task: taskpool.Task = new taskpool.Task(test1);
  await taskpool.execute(task).then(() => {
    let s: string[] = []
    s[0].split('')[1].toString()
  })
  return args;
}

/**
 * task-二级
 * @param args
 * @returns
 */
@Concurrent
export async function printArgs13(args: number) {
  console.info('printArgs: ' + args);
  let task: taskpool.Task = new taskpool.Task(test1);
  await taskpool.execute(task).then(() => {
    let s: string[] = []
    s[0].split('')[1].toString()
  }).catch(() => {
    let s: string[] = []
    s[0].split('')[1].toString()
  })
  return args;
}

/**
 * task-二级
 * @param args
 * @returns
 */
@Concurrent
export async function printArgs14(args: number) {
  console.info('printArgs: ' + args);
  let task: taskpool.Task = new taskpool.Task(test1);
  await taskpool.execute(task).finally(() => {
    let s: string[] = []
    s[0].split('')[1].toString()
  })
  return args;
}

@Concurrent
export function testTransfer(arg1: ArrayBuffer, arg2: ArrayBuffer): number {
  console.info('testTransfer arg1 byteLength: ' + arg1.byteLength);
  console.info('testTransfer arg2 byteLength: ' + arg2.byteLength);
  return 100;
}

@Concurrent
export function testFunc(arr: Array<BaseClass>, num: number): number {
  let baseInstance1 = arr[0];
  console.info('sendable: str1 is: ' + baseInstance1.str1);
  baseInstance1.SetNum = 100;
  console.info('sendable: num1 is: ' + baseInstance1.GetNum);
  console.info('sendable: isDone1 is: ' + baseInstance1.isDone1);
  // 获取斐波那契数列第num项的结果
  let res: number = baseInstance1.publicFunc(num);
  return res;
}

@Concurrent
export function printLog(arr: Array<DeriveClass>): void {
  let deriveInstance = arr[0];
  deriveInstance.printName();
}

@Concurrent
export async function asyncLock(a: AsyncLockTest) {
  await a.setCount(10)
}

@Concurrent
export async function asyncLock1(a: AsyncLockTest1) {
  await a.setCount(10).then(() => {
    let s: string[] = []
    s[0].split('')[1].toString()
  })
}

@Concurrent
export async function asyncLock2(a: AsyncLockTest1) {
  await a.setCount(10).then(() => {
    let s: string[] = []
    s[0].split('')[1].toString()
  }).catch(() => {
    let s: string[] = []
    s[0].split('')[1].toString()
  })
}

@Concurrent
export async function asyncLock3(a: AsyncLockTest1) {
  await a.setCount(10).then(() => {

  }).finally(() => {
    let s: string[] = []
    s[0].split('')[1].toString()
  })
}

@Concurrent
export async function asyncLockWork() {
  await sleep(500)
  let work1 = new worker.ThreadWorker('./workers/WorkerTaskGroup2.ets');
  let work2 = new worker.ThreadWorker('./workers/WorkerTaskGroup3.ets');
  work1.postMessage('')
  work2.postMessage('')
  work1.terminate()
  work2.terminate()

}

@Concurrent
export async function setTimeOutWork() {
  setTimeout(() => {

  }, 100)
}

@Concurrent
export function waitForTest() {

}

// 定义一个打印参数的任务函数
@Concurrent
export function printArgs(args: number): void {
  console.info('printArgs: ' + args);
}

export function printArgsError(args: number): void {
  if (args < 0) {
    throw new Error('Invalid argument: args cannot be negative.');
  }
  console.info('printArgs: ' + args);
}

// 定义一个耗时等于延时时间的任务函数
@Concurrent
export function timedTask(duration: number): void {
  console.info('timedTask started');
  const start = Date.now();
  while (Date.now() - start < duration) {} // 模拟耗时操作
  console.info('timedTask completed');
}

// 定义一个耗时等于延时时间的任务函数
@Concurrent
export function timedTaskError(duration: number): void {
  console.info('timedTask started');
  const start = Date.now();
  while (Date.now() - start < duration) {} // 模拟耗时操作
  throw new Error('Invalid argument: args cannot be negative.');
}

// 定义一个耗时较长的任务函数
@Concurrent
export function longTask(): void {
  console.info('longTask started');
  for (let i = 0; i < 10000000; i++) {} // 模拟耗时操作
  console.info('longTask completed');
}

// 定义一个耗时较长的任务函数
@Concurrent
export function longTaskError(): void {
  console.info('longTask started');
  for (let i = 0; i < 10000000; i++) {} // 模拟耗时操作
  console.info('longTask completed');
  throw new Error('Invalid argument: args cannot be negative.');
}

@Concurrent
export async function testFun1(step: number) {
  let points = 0;
  points += step;
  //函数局部成员场景
  let inner = async (args: number) => {
    console.info('printArgs: ' + args);
    return await new Promise<number>((resolve, _) => {
      resolve(++args)
    })
  }
  await inner(points);
  //调用其他文件函数场景
  (await import('./Utils')).test3(() => {
    points += step;
  });
  console.info('printArgs: ' + points);
  return points;
}

@Concurrent
export async function testFun1_Err(step: number) {
  let points = 0;
  points += step;
  //函数局部成员场景
  let inner = async (args: number) => {
    console.info('printArgs: ' + args);
    return await new Promise<number>((resolve, _) => {
      resolve(++args)
    })
  }
  await inner(points);
  //调用其他文件函数场景
  (await import('./Utils')).test3(() => {
    points += step;
    //抛出自定义异常
    throw defError;
  });
  console.info('printArgs: ' + points);
  return points;
}

@Concurrent
export async function testFun2(cycleCount: number, step: number) {
  let points = 0;
  for (let i = 0; i < cycleCount; i++) {
    points = await new Promise<number>((resolve, _) => {
      resolve(points + step)
    })
  }
  return points
}

@Concurrent
export async function testFun2_Err(cycleCount: number, step: number) {
  let points = 0;
  for (let i = 0; i < cycleCount; i++) {
    points = await new Promise<number>((resolve, _) => {
      resolve(points + step)
    })
    throw defError
  }
  return points
}


@Concurrent
export async function testFun3(cycleCount: number, text: string) {
  let textWidthList: number[] = []
  for (let i = 0; i < cycleCount; i++) {
    textWidthList.push(MeasureText.measureText({ textContent: text }))
  }
  return textWidthList;
}

@Concurrent
export async function testFun3_Err(cycleCount: number, text: string) {
  let textWidthList: number[] = []
  for (let i = 0; i < cycleCount; i++) {
    textWidthList.push(MeasureText.measureText({ textContent: text }))
    throw defError
  }
  return textWidthList;
}


@Concurrent
export async function testFun4(step: number) {
  let points = 0;
  return await new Promise<number>(async (resolve, _) => {
    points += step;
    await new Promise<number>(async (resolve, _) => {
      points += step;
      resolve(points)
    })
    resolve(points)
  })
}

@Concurrent
export async function testFun4_Err(step: number) {
  let points = 0;
  return await new Promise<number>(async (resolve, _) => {
    points += step;
    await new Promise<number>(async (resolve, _) => {
      points += step;
      resolve(points)
    })
    throw defError
  })
}

@Concurrent
export async function testFun5(text: string) {
  let textWidthList: number[] = []
  let inner = async () => {
    textWidthList.push(await new Promise<number>((resolve, _) => {
      resolve(MeasureText.measureText({ textContent: text }))
    }))
  }
  await inner()
  return textWidthList
}

@Concurrent
export async function testFun5_Err(text: string) {
  let textWidthList: number[] = []
  let inner = async () => {
    textWidthList.push(await new Promise<number>((resolve, _) => {
      resolve(MeasureText.measureText({ textContent: text }))
    }))
    throw defError
  }
  await inner()
  return textWidthList
}
