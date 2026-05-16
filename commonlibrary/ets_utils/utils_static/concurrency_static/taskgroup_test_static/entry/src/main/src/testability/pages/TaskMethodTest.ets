/*
* Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { AsyncLockTest, AsyncLockTest1 } from './SendableTest';
import { sleep, test, test1, } from './Utils';
import { asyncMethod, cancelTask, foo1, foo2 } from './SecondTaskMethodTest';
import { BusinessError } from '@ohos.base';
import { AsyncLocks } from './DataFlg';
import { BaseClass } from './SendableTest';


export function printArgs1(args: Number): Number {
  console.info('printArgs: ' + args);
  return args;
}


export function printArgs2(args: Number): Number {
  console.info('printArgs: ' + args);
  return args;
}

/**
 * error
 * @param args
 * @returns
 */

export function printArgs3(args: Number): Number {
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

export function printArgs4(args: Number): Number {
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

export function printArgs5(arg: Number): Number {
  console.info('printArgs: ' + arg);

  // 延时2s
  let t: Number = Date.now();
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

export function printArgs6(arg: Number): Number {
  console.info('printArgs: ' + arg);

  // 延时2s
  let t: Number = Date.now();
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

export function printArgs7(args: Number): Number {
  console.info('printArgs: ' + args);
  taskpool.Task.sendData(args);
  return args;
}

/**
 * sendData
 * @param args
 * @returns
 */

export function printArgs8(args: Number): Number {
  console.info('printArgs: ' + args);
  taskpool.Task.sendData(args);
  return args;
}

/**
 * setTimeout-error
 * @param args
 * @returns
 */
export async function printArgs9(args: Number): Promise<Number> {
  console.info('printArgs: ' + args);
  setTimeout(() => {
    let s: string[] = []
    s[0].split('')[1].toString()
  }, 100)
  return args
}

/**
 * worker线程
 * @param args
 * @returns
 */
export function printArgs10(args: Number): Number {
  console.info('printArgs: ' + args);
  return args;
}

/**
 * task-二级
 * @param args
 * @returns
 */

export async function printArgs11(args: Number): Promise<Number> {
  console.info('printArgs: ' + args);
  let task: taskpool.Task = new taskpool.Task(test);
  await taskpool.execute(task).then((e: Any) => {

  })
  return args;
}

/**
 * task-二级
 * @param args
 * @returns
 */
export async function printArgs12(args: Number): Promise<Number> {
  console.info('printArgs: ' + args);
  let task: taskpool.Task = new taskpool.Task(test1);
  await taskpool.execute(task).then((e: Any) => {
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

export async function printArgs13(args: Number): Promise<Number> {
  console.info('printArgs: ' + args);
  let task: taskpool.Task = new taskpool.Task(test1);
  await taskpool.execute(task).then((e: Any) => {
    let s: string[] = []
    s[0].split('')[1].toString()
  }).catch((error: Any) => {
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

export async function printArgs14(args: Number): Promise<Number> {
  console.info('printArgs: ' + args);
  let task: taskpool.Task = new taskpool.Task(test1);
  await taskpool.execute(task).finally(() => {
    let s: string[] = []
    s[0].split('')[1].toString()
  })
  return args;
}


export function testTransfer(arg1: ArrayBuffer | Uint8Array, arg2: ArrayBuffer | Uint8Array): Number {
  return 100;
}


export function testFunc(arr: Array<BaseClass>, num: Number): Number {
  let baseInstance1 = arr[0];
  console.info('sendable: str1 is: ' + baseInstance1.str1);
  baseInstance1.SetNum = 100;
  console.info('sendable: num1 is: ' + baseInstance1.GetNum);
  console.info('sendable: isDone1 is: ' + baseInstance1.isDone1);
  // 获取斐波那契数列第num项的结果
  let res: Number = baseInstance1.publicFunc(num);
  return res;
}

export async function asyncLock(a: AsyncLockTest) {
  await a.setCount(10)
}

export async function asyncLock1(a: AsyncLockTest1) {
  await a.setCount(10).then((e: Any): void => {
    let s: string[] = []
    s[0].split('')[1].toString()
  })
}

export async function asyncLock2(a: AsyncLockTest1) {
  await a.setCount(10).then((e: Any): void => {
    let s: string[] = []
    s[0].split('')[1].toString()
  }).catch((error: Any) => {
    let s: string[] = []
    s[0].split('')[1].toString()
  })
}

export async function asyncLock3(a: AsyncLockTest1) {
  await a.setCount(10).then((e: Any): void => {

  }).finally(() => {
    let s: string[] = []
    s[0].split('')[1].toString()
  })
}

export function printArgs1005(args: Number): Number {
  console.info('printArgs: ' + args);
  let ac: AsyncLocks = new AsyncLocks()
  foo1(ac)
  return args;
}

export function printArgs1006(args: Number): Number {
  console.info('printArgs: ' + args);
  let ac: AsyncLocks = new AsyncLocks()
  foo2(ac)
  return args;
}

export function printArgs1007(args: Number): Number {
  console.info('printArgs: ' + args);
  const promise: Promise<Number> = new Promise<Number>((resolve, reject) => {
    setTimeout(() => {
      const randomNumber: Number = Math.random();
      if (randomNumber > 0.5) {
        resolve(randomNumber);
      } else {
        reject(new Error('Random number1 is too small'));
      }
    }, 1000);
  })
  promise.then((result: Number) => {
    console.info(`Random number1 is ${result}`);
  }).catch((error: Any) => {
    console.error((error as BusinessError).message);
  });
  return args;
}

export function printArgs1008(args: Number): Number {
  console.info('printArgs: ' + args);
  const promise: Promise<Number> = new Promise<Number>((resolve, reject): void => {
    setTimeout(() => {
      const randomNumber: Number = Math.random();
      if (randomNumber > 0.5) {
        resolve(randomNumber);
      } else {
        reject(new Error('Random number2 is too small'));
      }
    }, 500);
  })
  promise.then((result: Number) => {
    console.info(`Random number2 is ${result}`);
  }).catch((error: Any) => {
    console.error((error as BusinessError).message);
  });
  return args;
}


export function printArgs1009(args: Number, taskGroup: taskpool.TaskGroup): Number {
  console.info('printArgs: ' + args);
  const promise: Promise<Number> = new Promise<Number>((resolve, reject) => {
    setTimeout(() => {
      if (cancelTask(taskGroup)) {
        console.info('task1 is cancel successfully')
        resolve(1);
      } else {
        reject(new Error('task1 is not cancel'));
      }
    }, 500);
  })
  promise.then((result: Number) => {
    console.info(`task1 is cancel`);
  }).catch((error: Any) => {
    console.error((error as BusinessError).message);
  });
  return args;
}

export function printArgs1010(args: Number, taskGroup: taskpool.TaskGroup): Number {
  console.info('printArgs: ' + args);
  const promise: Promise<Number> = new Promise<Number>((resolve, reject) => {
    setTimeout(() => {
      if (cancelTask(taskGroup)) {
        console.info('task1 is cancel successfully')
        resolve(1);
      } else {
        reject(new Error('task2 is not cancel'));
      }
    }, 500);
  })
  promise.then((result: Number) => {
    console.info(`task2 is cancel`);
  }).catch((error: Any) => {
    console.error((error as BusinessError).message);
  });
  return args;
}

export function printArgs1011(args: Number): Number {
  console.info('printArgs: ' + args);
  setTimeout(() => {
    console.info('set time out1')
  }, 500)
  return args;
}

export function printArgs1012(args: Number): Number {
  console.info('printArgs: ' + args);
  setTimeout(() => {
    console.info('set time out2')
  }, 500)
  return args;
}

export async function printArgs1013(args: Number): Promise<Number> {
  console.info('printArgs: ' + args);
  await asyncMethod(1);
  return args;
}

export async function printArgs1014(args: Number): Promise<Number> {
  console.info('printArgs: ' + args);
  await asyncMethod(2);
  return args;
}

export async function printArgs1015(): Promise<Object> {
  let ret = await Promise.all<Object>([
    new Promise<Object>((resolve): void => {
      setTimeout(() => {
        resolve('resolved');
      }, 1000);
    })
  ]);
  console.info('await result1', ret.toString())
  return ret;
}

export async function printArgs1016(): Promise<Object> {
  let ret = await Promise.all<Object>([
    new Promise<Object>((resolve): void => {
      setTimeout(() => {
        resolve('resolved');
      }, 1000);
    })
  ]);
  console.info('await result2', ret.toString())
  return ret;
}