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

import {
  lock,
  asyncTask,
  asyncOperation,
  AsyncLockTest1,
  AsyncLockTest,
  printArgs01,
  printArgs02,
  WorkThread
} from './lock';
import { BusinessError } from '@kit.BasicServicesKit';
import { MessageEvents, taskpool, worker } from '@kit.ArkTS';

/**
 * error
 * @param args
 * @returns
 */
@Concurrent
export function printArgs1(args: number): number {
  console.info('printArgs: ' + args);
  let s: string[] = []
  s[0].split('')[1].toString()
  return args;
}


@Concurrent
export function printArgs3(args: number): number {
  console.info('printArgs: ' + args);
  return args;
}


@Concurrent
export function printArgs5(args: number): number {
  console.info('printArgs: ' + args);
  taskpool.Task.sendData(args);
  return args;
}



@Concurrent
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


@Concurrent
export async function printArgsLock3() {
  try {
    // 获取锁
    await lock.acquire1().then(() => {
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



@Concurrent
export async function printArgsLock5() {
  try {
    // 获取锁
    await lock.acquire1().then(() => {
      console.log('Lock is held.');
      console.log('Executing task...');
      if (Math.random() < 1) { // 抛出异常
        throw new Error('Simulated error in task execution.');
      }
      console.log('Task completed successfully.');
    }).catch((error: BusinessError) => {
      console.error('Error during task execution:', error.message);
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


@Concurrent
export async function printArgsLock7() {
  try {
    // 获取锁
    await lock.acquire1().then(() => {
      console.log('Lock is held.');
      console.log('Executing task...');
      console.log('Task completed successfully.');
    }).catch((error: BusinessError) => {
      console.error('Error during task execution:', error.message);
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

@Concurrent
export async function printArgsPromise1() {
  console.log('Executing task...');
  // 模拟一个包含异步操作的任务
  await new Promise<void>((resolve, reject) => {
    setTimeout(() => {
      if (Math.random() < 1) { // 抛出异常
        reject(new Error('Simulated error in task execution.'));
      } else {
        resolve();
      }
    }, 100); // 模拟耗时操作
  });

  console.log('Task completed successfully.');

}


@Concurrent
export async function printArgsPromise3() {
  await asyncTask()
    .then(() => {
      // 在.then回调中模拟抛出异常
      if (Math.random() < 1) {
        throw new Error('Simulated error in then callback.');
      }
      console.log('Task completed successfully');
    })
}


@Concurrent
export async function printArgsPromise5() {
  await asyncTask()
    .then(() => {
      if (Math.random() < 1) {
        throw new Error('Simulated error in then callback.');
      }
      console.log('Task completed successfully');
    })
    .catch((error: BusinessError) => {
      console.error('caught error in then callback:', error.message);
      if (Math.random() < 1) {
        throw new Error('Simulated error in then callback.');
      }
    });
}


@Concurrent
export async function printArgsPromise7() {
  await asyncTask()
    .then(() => {
      console.log('Task completed successfully');
    })
    .catch((error: BusinessError) => {
      console.error('caught error in then callback:', error.message);
    })
    .finally(() => {
      if (Math.random() < 1) {
        throw new Error('Simulated error in finally callback.');
      }
    })
}


@Concurrent
export async function printArgsSettimeout1() {
  await new Promise<void>((resolve, reject) => {
    setTimeout(() => {
      if (Math.random() < 1) { // 这里可以调整条件以模拟不同情况
        console.error('Simulated error in setTimeout callback.');
        reject(new Error('Simulated error in setTimeout callback.'));
      } else {
        console.log('Task completed successfully');
        resolve();
      }
    }, 100);
  });
}


@Concurrent
export async function printArgsSettimeout3(): Promise<void> {
  try {
    await asyncOperation();
    console.log('Task completed successfully');
  } catch (error) {
    console.error('caught error in task execution:', error.message);
    throw new Error('Simulated error in async operation.');
  }
}


@Concurrent
export async function printArgsWait(a: AsyncLockTest) {
  await a.setCount(10)
}

@Concurrent
export async function printArgsWait1(a: AsyncLockTest1) {
  await a.setCount(10).then(() => {
    if (Math.random() < 1) {
      throw new Error('Simulated error in then callback.');
    }
  })
}

@Concurrent
export async function printArgsWait2(a: AsyncLockTest1) {
  await a.setCount(10).then(() => {
    if (Math.random() < 1) {
      throw new Error('Simulated error in then callback.');
    }
  }).catch(() => {
    if (Math.random() < 1) {
      throw new Error('Simulated error in catch callback.');
    }
  })
}

@Concurrent
export async function printArgsWait3(a: AsyncLockTest1) {
  await a.setCount(10).then(() => {
  }).finally(() => {
    if (Math.random() < 1) {
      throw new Error('Simulated error in finally callback.');
    }
  })
}

@Concurrent
export async function printArgsWorker1(args: number): Promise<number> {
  console.info('printArgs: ' + args);
  let work = new worker.ThreadWorker('../../workers/Worker.ets');
  work.onmessage = (e: MessageEvents) => {
    let data: string = e.data;
    console.info('worker1 onmessage is: ', data);
    work.terminate()
  }
  work.onmessageerror = () => {
    console.info('worker1 onmessageerror');
    work.terminate()
  }

  work.onexit = (e: number) => {
    console.info('worker1 onexit code is: ', e);
  }

  work.postMessage('1');
  return args;
}

@Concurrent
export async function printArgsTaskpool(args: number): Promise<number> {
  let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
  taskGroup.addTask(printArgs01, 1);
  try {
    await taskpool.execute(taskGroup);
  } catch (err) {
    if (Math.random() < 1) { // 抛出异常
      throw new Error('Simulated error in task execution.');
    }
  }
  return args;
}

@Concurrent
export async function printArgsTaskpool1(args: number): Promise<number> {
  let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
  taskGroup.addTask(printArgs02, 1);
  try {
    await taskpool.execute(taskGroup).then(() => {
      if (Math.random() < 1) { // 抛出异常
        throw new Error('Simulated error in then execution.');
      }
    })
  } catch (err) {
    if (Math.random() < 1) { // 抛出异常
      throw new Error('Simulated error in then execution.');
    }
  }
  return args;
}

@Concurrent
export async function printArgsTaskpool2(args: number): Promise<number> {
  let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
  taskGroup.addTask(printArgs01, 1);
  try {
    await taskpool.execute(taskGroup).catch(() => {
      if (Math.random() < 1) { // 抛出异常
        throw new Error('Simulated error in catch execution.');
      }
    })
  } catch (err) {
    if (Math.random() < 1) { // 抛出异常
      throw new Error('Simulated error in catch execution.');
    }
  }
  return args;
}

@Concurrent
export async function printArgsTaskpool3(args: number): Promise<number> {
  let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
  taskGroup.addTask(printArgs02, 1);
  try {
    await taskpool.execute(taskGroup).finally(() => {
      if (Math.random() < 1) { // 抛出异常
        throw new Error('Simulated error in finally execution.');
      }
    })
  } catch (err) {
    if (Math.random() < 1) { // 抛出异常
      throw new Error('Simulated error in finally execution.');
    }
  }
  return args;
}