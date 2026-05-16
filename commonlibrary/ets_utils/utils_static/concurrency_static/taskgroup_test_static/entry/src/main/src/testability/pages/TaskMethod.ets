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

import {
  lock,
  asyncTask,
  asyncOperation,
  AsyncLockTest1,
  AsyncLockTest,
  printArgs01,
  printArgs02,
//   WorkThread
} from './lock';
import { BusinessError } from '@ohos.base';
// import { MessageEvents, taskpool, worker } from '@kit.ArkTS';

/**
 * error
 * @param args
 * @returns
 */

export function printArgs1(args: Number): Number {
  console.info('printArgs: ' + args);
  let s: string[] = []
  s[0].split('')[1].toString()
  return args;
}

export function printArgs3(args: Number): Number {
  console.info('printArgs: ' + args);
  return args;
}

export function printArgs5(args: Number): Number {
  console.info('printArgs: ' + args);
  taskpool.Task.sendData(args);
  return args;
}

export async function printArgsLock1() {
  try {
    // 获取锁
    await lock.acquire();
    console.log('Lock is held.');
    console.log('Executing task...');
    console.log('Task completed successfully.');
  } finally {
    // 无论是否发生异常，确保锁被释放
    lock.release();
    console.log('Lock has been released.');
  }
}

export async function printArgsLock3() {
  try {
    // 获取锁
    await lock.acquire1().then((e: Any): void => {
      console.log('Lock is held.');
      console.log('Executing task...');
      if (Math.random() < 1) { // 抛出异常
        throw new Error('Simulated error in task execution.');
      }
      console.log('Task completed successfully.');
    })
    console.log('Task completed successfully.');
  } finally {
    // 无论是否发生异常，确保锁被释放
    lock.release();
    console.log('Lock has been released.');
  }
}

export async function printArgsLock5() {
  try {
    // 获取锁
    await lock.acquire1().then((e: Any): void => {
      console.log('Lock is held.');
      console.log('Executing task...');
      if (Math.random() < 1) { // 抛出异常
        throw new Error('Simulated error in task execution.');
      }
      console.log('Task completed successfully.');
    }).catch((error: Any) => {
      console.error('Error during task execution:',(error as BusinessError).message);
      if (Math.random() < 1) { // 抛出异常
        throw new Error('Simulated error in task execution.');
      }
    })
  } finally {
    // 无论是否发生异常，确保锁被释放
    lock.release();
    console.log('Lock has been released.');
  }
}

export async function printArgsLock7() {
  try {
    // 获取锁
    await lock.acquire1().then((e: Any): void => {
      console.log('Lock is held.');
      console.log('Executing task...');
      console.log('Task completed successfully.');
    }).catch((error: Any) => {
      console.error('Error during task execution:', (error as BusinessError).message);
    })
  } finally {
    // 无论是否发生异常，确保锁被释放
    lock.release();
    if (Math.random() < 1) { // 抛出异常
      let s: string[] = []
      s[0].split('')[1].toString()
    }
    console.log('Lock has been released.');
  }
}

export async function printArgsPromise1() {
  console.log('Executing task...');
  // 模拟一个包含异步操作的任务
  await new Promise<string>((resolve, reject): void => {
    setTimeout((): void => {
      if (Math.random() < 1) { // 抛出异常
        reject(new Error('Simulated error in task execution.'));
      } else {
        resolve('');
      }
    }, 100);
  });

  console.log('Task completed successfully.');
}

export async function printArgsPromise3() {
  await asyncTask()
    .then((e: Any) => {
      // 在.then回调中模拟抛出异常
      if (Math.random() < 1) {
        throw new Error('Simulated error in then callback.');
      }
      console.log('Task completed successfully');
    })
}

export async function printArgsPromise5() {
  await asyncTask()
    .then((e: Any) => {
      if (Math.random() < 1) {
        throw new Error('Simulated error in then callback.');
      }
      console.log('Task completed successfully');
    })
    .catch((error: Any) => {
      console.error('caught error in then callback:',  (error as BusinessError).message);
      if (Math.random() < 1) {
        throw new Error('Simulated error in then callback.');
      }
    });
}

export async function printArgsPromise7() {
  await asyncTask()
    .then((e: Any) => {
      console.log('Task completed successfully');
    })
    .catch((error: Any) => {
      console.error('caught error in then callback:',  (error as BusinessError).message);
    })
    .finally(() => {
      if (Math.random() < 1) {
        throw new Error('Simulated error in finally callback.');
      }
    })
}

export async function printArgsSettimeout1() {
  await new Promise<number>((resolve, reject) => {
    setTimeout(() => {
      if (Math.random() < 1) { // 这里可以调整条件以模拟不同情况
        console.error('Simulated error in setTimeout callback.');
        reject(new Error('Simulated error in setTimeout callback.'));
      } else {
        console.log('Task completed successfully');
        resolve(1);
      }
    }, 100);
  });
}

export async function printArgsSettimeout3(): Promise<void> {
  try {
    await asyncOperation();
    console.log('Task completed successfully');
  } catch (error) {
    error = error as BusinessError;
    console.error('caught error in task execution:', error.message);
    throw new Error('Simulated error in async operation.');
  }
}

export async function printArgsWait(a: AsyncLockTest) {
  await a.setCount(10)
}

export async function printArgsWait1(a: AsyncLockTest1) {
  await a.setCount(10).then((e: Any): void => {
    if (Math.random() < 1) {
      throw new Error('Simulated error in then callback.');
    }
  })
}

export async function printArgsWait2(a: AsyncLockTest1) {
  await a.setCount(10).then((e: Any): void => {
    if (Math.random() < 1) {
      throw new Error('Simulated error in then callback.');
    }
  }).catch((error: Any) => {
    if (Math.random() < 1) {
      throw new Error('Simulated error in catch callback.');
    }
  })
}

export async function printArgsWait3(a: AsyncLockTest1) {
  await a.setCount(10).then((e: Any): void => {
  }).finally(() => {
    if (Math.random() < 1) {
      throw new Error('Simulated error in finally callback.');
    }
  })
}

export async function printArgsTaskpool(args: Number): Promise<Number> {
  let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
  taskGroup.addTask(printArgs01, 1.0);
  try {
    await taskpool.execute(taskGroup);
  } catch (err) {
    err = err as BusinessError;
    if (Math.random() < 1) { // 抛出异常
      throw new Error('Simulated error in task execution.');
    }
  }
  return args;
}

export async function printArgsTaskpool1(args: Number): Promise<Number> {
  let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
  taskGroup.addTask(printArgs02, 1.0);
  try {
    await taskpool.execute(taskGroup).then((e: Any) => {
      if (Math.random() < 1) { // 抛出异常
        throw new Error('Simulated error in then execution.');
      }
    })
  } catch (err) {
    err = err as BusinessError;
    if (Math.random() < 1) { // 抛出异常
      throw new Error('Simulated error in then execution.');
    }
  }
  return args;
}

export async function printArgsTaskpool2(args: Number): Promise<Number> {
  let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
  taskGroup.addTask(printArgs01, 1.0);
  try {
    await taskpool.execute(taskGroup).then((e: Any) => {

    }).catch((e: Any) => {
      if (Math.random() < 1) { // 抛出异常
        throw new Error('Simulated error in catch execution.');
      }
    })
  } catch (err) {
    err = err as BusinessError;
    if (Math.random() < 1) { // 抛出异常
      throw new Error('Simulated error in catch execution.');
    }
  }
  return args;
}

export async function printArgsTaskpool3(args: Number): Promise<Number> {
  let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
  taskGroup.addTask(printArgs02, 1.0);
  try {
    await taskpool.execute(taskGroup).then((e: Any) => {

    }).finally(() => {
      if (Math.random() < 1) { // 抛出异常
        throw new Error('Simulated error in finally execution.');
      }
    })
  } catch (err) {
    err = err as BusinessError;
    if (Math.random() < 1) { // 抛出异常
      throw new Error('Simulated error in finally execution.');
    }
  }
  return args;
}