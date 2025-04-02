/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { taskpool, collections} from '@kit.ArkTS'
import { BusinessError } from '@ohos.base'
import { StrCat, A, B, printStrArgs, printArgs } from './exportFunclist'
import HashMap from '@ohos.util.HashMap';
import { errorManager } from '@kit.AbilityKit';
import { SendableClass, SimpleSendable } from './sendable';

export async function currentFun(): Promise<void> {
  "use concurrent"
  await new Promise<void>((resolve: Function, reject: Function) => {
    setTimeout(resolve, 500, "async operation 1")
  });
  await new Promise<void>((resolve, reject) => {
    setTimeout(resolve, 500, "async operation 2")
  });
}

export function transferArrayBuffer(arg1: Array<number>): string {
  "use concurrent"
  arg1[0] = 100;
  arg1[1] = 200;
  arg1[2] = 300;
  arg1[3] = 400;
  return "success";
}

export function transferAtomics(arg1: Int32Array) {
  "use concurrent"
  console.info("wait begin::");
  let res = Atomics.wait(arg1, 0, 0, 3000);
  return res;
}

export function setCloneListTest(arrayBuffer: Array<number>): Int32Array {
  "use concurrent"
  let view: Int32Array = new Int32Array(arrayBuffer);
  let arr: Array<number> = [5, 6, 7, 8];
  for (let i: number = 0; i < arr.length; i++) {
    view[i] = arr[i];
  }
  return view;
}

export function setTransferListTest(arg1: Uint8Array, arg2: Uint8Array): number {
  "use concurrent"
  return arg1.byteLength + arg2.byteLength;
}

export async function testString(args: string): Promise<void> {
  "use concurrent"
  let p: number = await new Promise((resolve, reject) => {
    setTimeout(() => {
      const randomNumber: number = Math.floor(Math.random() * 100);
      resolve(randomNumber);
    }, 200);
  })
}

export function testTime(): number {
  "use concurrent";
  return Date.now();
}

export async function testNumber(value1: number, value2: number): Promise<number> {
  "use concurrent"
  let result: number = await new Promise((resolve, reject) => {
    let value = value1 + value2;
    resolve(value);
  })
  return result;
}

export function testTaskPool(): void {
  try {
    let task1: taskpool.Task = new taskpool.Task(delaySum, 100, 100, 500);
    let task2: taskpool.Task = new taskpool.Task(delaySum, 200, 200, 500);
    let task3: taskpool.Task = new taskpool.Task(printArgs, 300);

    taskpool.execute(task1)
    taskpool.execute(task2)
    taskpool.execute(task3)

    let start: number = new Date().getTime();
    while (new Date().getTime() - start < 1000) {
      continue;
    }
    for (let i: number = 1; i <= 10; i++) {
      taskpool.cancel(task1);
    }
  }
  catch(e) {
    console.info("taskpool catch error: " + e);
  }
}

export function promiseCase() {
  let p: Promise<void> = new Promise<void>((resolve: Function, reject: Function) => {
    setTimeout(() => {
      resolve(1)
    }, 100)
  }).then(undefined, (error: BusinessError) => {
  })
  return p
}

export function printArgsFunc(Sum: Function, num1: number, num2: number): number {
  "use concurrent"
  let result: number = Sum(num1, num2)
  return result;
}

export function Sum(value1: number, value2: number): number {
  "use concurrent"
  return value1 + value2;
}

export async function asyncSum(value1: number, value2: number): Promise<number> {
  "use concurrent"
  return value1 + value2;
}

export function delaySum(value1: number, value2: number, delay: number): number {
  "use concurrent"
  let start: number = new Date().getTime();
  while (new Date().getTime() - start < delay) {
    continue;
  }
  return value1 + value2;
}

export function Add(value1: boolean, value2: boolean): boolean {
  "use concurrent"
  if (value1 && value2)
    return true;
  else
    return false;
}

export function funcStrCat(value1: string, value2: string, value3: string): string {
  "use concurrent"
  return value1 + StrCat(value2, value3);
}

export function arraySum(arg1: Array<number>, arg2: Array<number>): Array<number> {
  "use concurrent"
  let value: Array<number> = [];
  value[0] = arg1[0] + arg2[0];
  value[1] = arg1[1] + arg2[1];
  return value;
}

export function objectSum(arg1: A, arg2: B): A {
  "use concurrent"
  let cc: A = arg1;
  cc.a = arg1.a + arg2.a;
  cc.b = arg1.b + arg2.b;
  return cc;
}

export function Multi(value1: number, value2: number): number {
  "use concurrent"
  return value1 * value2;
}

export function AdditionDelay(delay: number): void {
  "use concurrent"
  let start: number = new Date().getTime();
  while (new Date().getTime() - start < delay) {
    continue;
  }
}

export function WaitforRunner(finalString: string): string {
  "use concurrent"
  return finalString;
}

export function errorTest() {
  "use concurrent"
  throw new Error("this is an error");
}

export function testCancelDelayed(a:string) {
  "use concurrent"
  let t = Date.now()
  while ((Date.now() - t) < 1000) {
    continue;
  }
  return 'a';
}

export function dependend(params:Number) {
  "use concurrent"
  if (params >= 100) {
    let t = Date.now();
    while ((Date.now() - t) < 1000) {
      continue;
    }
  }
}

export function hashMapTest(args:number) {
  "use concurrent"
  let hashMap1: HashMap<string, number> = new HashMap();
  hashMap1.set('a', 123);
  return hashMap1;
}

export function delay() {
  "use concurrent"
  let t = Date.now();
  while ((Date.now() - t) < 1000) {
    continue;
  }
}

export async function randomTest(): Promise<void> {
  "use concurrent"
  let t = Date.now();
  while ((Date.now() - t) < 1000) {
    continue;
  }
  let p = await new Promise<void>((resolve: Function, reject: Function) => {
    setTimeout(() => {
      const randomNumber = Math.floor(Math.random() * 100);
      resolve(randomNumber);
    }, 200);
  })
  return p;
}

export async function outerTaskFunc(params:string) {
  "use concurrent"
  let t1 = Date.now();
  while ((Date.now() - t1) < 100) {
    continue
  }
  let val = "";
  if (params == "001") {
    let innerTask = new taskpool.Task(printStrArgs, params)
    val += await taskpool.execute(innerTask)
  } else if (params == "002") {
    val += await taskpool.execute(printStrArgs, params);
  }

  let t2 = Date.now();
  while ((Date.now() - t2) < 100) {
    continue
  }
  return "outerTaskRes-" + val;
}

export function isConcurrentTest1() {
    "use concurrent"
}

export function isConcurrentTest2() {}

export async function sequenceRunnerTest(): Promise<string> {
  "use concurrent"
  let finalString = "";
  let t: Array<taskpool.Task> = []
  for (let i = 0; i < 100; i++) {
    t[i] = new taskpool.Task(printArgs, i);
  }

  let runner:taskpool.SequenceRunner = new taskpool.SequenceRunner("runner16");
  for (let i = 0; i < 20; i++) {
    if (i % 2 == 1) {
      finalString += await runner.execute(t[i]) + ',';
    }
  }
  return finalString;
}

export async function sequenceRunnerPriorityTest(): Promise<string> {
  "use concurrent"
  let finalString = "";
  let t: Array<taskpool.Task> = []
  for (let i = 0; i < 100; i++) {
    t[i] = new taskpool.Task(printArgs, i);
  }

  let runner:taskpool.SequenceRunner = new taskpool.SequenceRunner("runner17");
  for (let i = 0; i < 20; i++) {
    if (i % 2 == 1) {
      finalString += await runner.execute(t[i]) + ',';
    }
  }
  return finalString;
}

export class CancelAndExecuteDelayed{
  private task: taskpool.Task;
  public res:number = 0;
  public i:number = 0;
  public isTerminate:boolean = false;
  constructor(num: number) {
    this.task = new taskpool.Task(printArgs, num);
  }

  postRequest() {
    try {
      taskpool.cancel(this.task);
    } catch (e) {
    }

    taskpool.executeDelayed(1000, this.task).then((value: Object) => {
      this.i++;
      this.res += value as number;
      this.isTerminate = true;
    }).catch((e: BusinessError) => {
    })
  }
}

export function errorManageTest() {
  "use concurrent"
  let oldObserver = (reason: Error, promise: Promise<string>) => {
    console.log("This is oldObserver");
  };
  errorManager.on("unhandledRejection", oldObserver);
  errorManager.off("unhandledRejection");
  let t = Date.now();
  while (Date.now() - t <= 1000){
  }
  new Promise<string>((res, rej) => {
    rej("rejError")
  }).then(() => {
    throw new Error("resError");
  }).catch(() => {
    throw new Error("catchError");
  });
  let observer = (reason: Error, promise: Promise<string>) => {
    console.log("This is observer, reject reason is ", reason);
  };
  errorManager.on("unhandledRejection", observer);
}

export function dealHashMapTest(hashMap:HashMap<string, number>) {
  "use concurrent"
  hashMap.set('a', 123);
  return hashMap;
}

export function noUseConcurrentTest(arg:string) {
  return arg;
}

export function sendDataTest(args:number) {
  "use concurrent"
  let res: number = args * 10;
  taskpool.Task.sendData(res);
}

export function sendableClassTestFunc(class1: SendableClass, class2: SendableClass) {
  "use concurrent"
  let num1 = class1.GetNum();
  let num2 = class2.GetNum();
  return num1 + num2;
}

export function Int8ArrayTestFunc(array: collections.Int8Array) {
  "use concurrent"
  array.set([0,1,2]);
  return array;
}

export function SetTestFunc(set: collections.Set<number>) {
  "use concurrent"
  set.add(4);
  return set;
}

export function MapTestFunc(map: collections.Map<number, number>) {
  "use concurrent"
  map.set(5,6);
  return map;
}

export function simpleSendableClassTestFunc(class1: SimpleSendable, class2: SimpleSendable) {
  "use concurrent"
  return class1.digit + class2.digit;
}

export function Uint8ClampedArrayTestFunc(array: collections.Uint8ClampedArray) {
  "use concurrent"
  array.set([0,1,2]);
  return array;
}

@Concurrent
export function testWithThreeParams(a: number, b: string, c: number): string {
  let ret = a + c;
  return "result: " + b + " " + ret;
}

@Concurrent
export function testWithArray(args: [number, string]): string {
  return "result:" + JSON.stringify(args);
}