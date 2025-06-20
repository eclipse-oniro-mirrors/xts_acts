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
import { MessageEvents, taskpool, worker } from '@kit.ArkTS';
import { sleep, test, test1, WorkThread } from './Utils';
import { asyncMethod, cancelTask, foo1, foo2 } from './SecondTaskMethodTest';
import { BusinessError } from '@kit.BasicServicesKit';
import { AsyncLock, Worker1, Worker2 } from './DataFlg';

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
export async function printArgs9(args: number) {
  console.info('printArgs: ' + args);
  setTimeout(() => {
    let s: string[] = []
    s[0].split('')[1].toString()
  }, 100)
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

@Concurrent
export function printArgs1001(args: number): number {
  console.info('printArgs: ' + args);
  let work = new worker.ThreadWorker('../../workers/Worker.ets');
  work.onmessage = (e: MessageEvents) => {
    let data: string = e.data;
    console.info('worker1 onmessage is: ', data);
    work.terminate()
  }
  work.onmessageerror = () => {
    console.info('worker1 onmessageerror');
  }

  work.onexit = (e: number) => {
    console.info('worker1 onexit code is: ', e);
  }

  work.postMessage('1');

  return args;
}

@Concurrent
export function printArgs1002(args: number): number {
  console.info('printArgs: ' + args);
  let work = new worker.ThreadWorker('../../workers/Worker.ets');
  work.onmessage = (e: MessageEvents) => {
    let data: string = e.data;
    console.info('worker2 onmessage is: ', data);
    work.terminate()
  }
  work.onmessageerror = () => {
    console.info('worker2 onmessageerror');
    work.terminate()
  }

  work.onexit = (e: number) => {
    console.info('worker2 onexit code is: ', e);
  }

  work.postMessage('1');

  return args;
}

@Concurrent
export function printArgs1005(args: number): number {
  console.info('printArgs: ' + args);
  let ac: AsyncLock = new AsyncLock()
  foo1(ac)
  return args;
}

@Concurrent
export function printArgs1006(args: number): number {
  console.info('printArgs: ' + args);
  let ac: AsyncLock = new AsyncLock()
  foo2(ac)
  return args;
}

@Concurrent
export function printArgs1007(args: number): number {
  console.info('printArgs: ' + args);
  const promise: Promise<number> = new Promise((resolve: Function, reject: Function) => {
    setTimeout(() => {
      const randomNumber: number = Math.random();
      if (randomNumber > 0.5) {
        resolve(randomNumber);
      } else {
        reject(new Error('Random number1 is too small'));
      }
    }, 1000);
  })
  promise.then((result: number) => {
    console.info(`Random number1 is ${result}`);
  }).catch((error: BusinessError) => {
    console.error(error.message);
  });
  return args;
}

@Concurrent
export function printArgs1008(args: number): number {
  console.info('printArgs: ' + args);
  const promise: Promise<number> = new Promise((resolve: Function, reject: Function) => {
    setTimeout(() => {
      const randomNumber: number = Math.random();
      if (randomNumber > 0.5) {
        resolve(randomNumber);
      } else {
        reject(new Error('Random number2 is too small'));
      }
    }, 500);
  })
  promise.then((result: number) => {
    console.info(`Random number2 is ${result}`);
  }).catch((error: BusinessError) => {
    console.error(error.message);
  });
  return args;
}

@Concurrent
export function printArgs1009(args: number, taskGroup: taskpool.TaskGroup): number {
  console.info('printArgs: ' + args);
  const promise: Promise<number> = new Promise((resolve: Function, reject: Function) => {
    setTimeout(() => {
      if (cancelTask(taskGroup)) {
        console.info('task1 is cancel successfully')
        resolve();
      } else {
        reject(new Error('task1 is not cancel'));
      }
    }, 500);
  })
  promise.then(() => {
    console.info(`task1 is cancel`);
  }).catch((error: BusinessError) => {
    console.error(error.message);
  });
  return args;
}

@Concurrent
export function printArgs1010(args: number, taskGroup: taskpool.TaskGroup): number {
  console.info('printArgs: ' + args);
  const promise: Promise<number> = new Promise((resolve: Function, reject: Function) => {
    setTimeout(() => {
      if (cancelTask(taskGroup)) {
        console.info('task1 is cancel successfully')
        resolve();
      } else {
        reject(new Error('task2 is not cancel'));
      }
    }, 500);
  })
  promise.then(() => {
    console.info(`task2 is cancel`);
  }).catch((error: BusinessError) => {
    console.error(error.message);
  });
  return args;
}

@Concurrent
export function printArgs1011(args: number): number {
  console.info('printArgs: ' + args);
  setTimeout(() => {
    console.info('set time out1')
  }, 500)
  return args;
}

@Concurrent
export function printArgs1012(args: number): number {
  console.info('printArgs: ' + args);
  setTimeout(() => {
    console.info('set time out2')
  }, 500)
  return args;
}

@Concurrent
export function printArgs1013(args: number): number {
  console.info('printArgs: ' + args);
  asyncMethod(1);
  return args;
}

@Concurrent
export function printArgs1014(args: number): number {
  console.info('printArgs: ' + args);
  asyncMethod(2);
  return args;
}

@Concurrent
export async function printArgs1015(): Promise<Object> {
  let ret = await Promise.all<Object>([
    new Promise<Object>(resolve => setTimeout(resolve, 1000, 'resolved'))
  ]);
  console.info('await result1', ret.toString())
  return ret;
}


@Concurrent
export async function printArgs1016(): Promise<Object> {
  let ret = await Promise.all<Object>([
    new Promise<Object>(resolve => setTimeout(resolve, 1000, 'resolved'))
  ]);
  console.info('await result2', ret.toString())
  return ret;
}
