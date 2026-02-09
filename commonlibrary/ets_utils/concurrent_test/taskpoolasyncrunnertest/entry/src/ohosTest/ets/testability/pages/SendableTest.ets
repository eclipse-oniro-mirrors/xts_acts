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

import { ArkTSUtils, taskpool } from '@kit.ArkTS';
import { printArgs1001, printArgs1002 } from './TaskMethodTest';

@Sendable
export class BaseClass {
  private str: string = 'sendable: BaseClass';
  public static num: number = 10;
  public str1: string = 'sendable: this is BaseClass\'s string';
  private num1: number = 5;
  public isDone1: boolean = false;

  private fibonacciRecursive(n: number): number {
    if (n <= 1) {
      return n;
    } else {
      return this.fibonacciRecursive(n - 1) + this.fibonacciRecursive(n - 2);
    }
  }

  private privateFunc(num: number): number {
    let res: number = this.fibonacciRecursive(num);
    console.info('sendable: BaseClass privateFunc res is: ' + res);
    return res;
  }

  publicFunc(num: number): number {
    return this.privateFunc(num);
  }

  get GetNum(): number {
    return this.num1;
  }

  set SetNum(num: number) {
    this.num1 = num;
  }

  constructor() {
    console.info(this.str);
    this.isDone1 = true;
  }
}

@Sendable
export class DeriveClass extends BaseClass {
  private name: string = 'sendable: this is DeriveClass';

  printName() {
    console.info(this.name);
  }

  constructor() {
    super();
  }
}

@Sendable
export class AsyncLockTest {
  private count_: number = 0;
  private lock_: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock();

  async getCount(): Promise<number> {
    return this.lock_.lockAsync(() => {
      return this.count_;
    })
  }

  async setCount(count: number) {
    let s: string[] = []
    s[0].split('')[1].toString()
    await this.lock_.lockAsync(() => {
      this.count_ = count;
    })
  }
}

@Sendable
export class AsyncLockTestThen {
  private count_: number = 0;
  private lock_: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock();

  async getCount(): Promise<number> {
    return this.lock_.lockAsync(() => {
      return this.count_;
    })
  }

  async setCount(count: number) {

    await this.lock_.lockAsync(() => {
      this.count_ = count;
    }).then(() => {
      let s: string[] = [];
      s[0].split('')[1].toString();
    })
  }
}

@Sendable
export class AsyncLockTestCatch {
  private count_: number = 0;
  private lock_: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock();

  async getCount(): Promise<number> {
    return this.lock_.lockAsync(() => {
      return this.count_;
    })
  }

  async setCount(count: number) {

    await this.lock_.lockAsync(() => {
      this.count_ = count;
    }).then(() => {
      let s: string[] = [];
      s[0].split('')[1].toString();
    }).catch(() => {
      let s: string[] = [];
      s[0].split('')[1].toString();
    })

  }
}

@Sendable
export class AsyncLockTestFinally {
  private count_: number = 0;
  private lock_: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock();

  async getCount(): Promise<number> {
    return this.lock_.lockAsync(() => {
      return this.count_;
    })
  }

  async setCount(count: number) {

    await this.lock_.lockAsync(() => {
      this.count_ = count;
    }).finally(() => {
      let s: string[] = [];
      s[0].split('')[1].toString();
    })

  }
}


@Sendable
export class AsyncLockTest1 {
  private count_: number = 0;
  private lock_: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock();

  async getCount(): Promise<number> {
    return this.lock_.lockAsync(() => {
      return this.count_;
    })
  }

  async setCount(count: number) {
    await this.lock_.lockAsync(() => {
      this.count_ = count;
    })
  }
}

@Sendable
export class AsyncLock {
  public count_: number = 1;

  async getCount(): Promise<number> {
    let lock: ArkTSUtils.locks.AsyncLock = ArkTSUtils.locks.AsyncLock.request('lock_1');
    return lock.lockAsync(() => {
      return this.count_;
    })
  }

  async setCount(count: number) {
    let lock: ArkTSUtils.locks.AsyncLock = ArkTSUtils.locks.AsyncLock.request('lock_1');
    await lock.lockAsync(() => {
      this.count_ = count;
    })
  }
}

export class MyAsyncLock {
  private isLocked: boolean;

  constructor() {
    this.isLocked = false;
  }

  async acquire() {
    // 模拟获取锁的过程，等待直到锁可用
    throw new Error('Simulated error in task execution.');
  }

  async acquire1() {
    // 模拟获取锁的过程，等待直到锁可用
    console.log('Lock acquired.');
  }

  release() {
    // 释放锁
    this.isLocked = false;
    console.log('Lock released.');
  }
}

export let lock = new MyAsyncLock();

// 模拟异步任务函数
export function asyncTask(): Promise<void> {
  return new Promise<void>((resolve) => {
    setTimeout(() => {
      console.log('Task is executing...');
      resolve(); // 任务成功完成
    }, 100); // 模拟耗时操作
  });
}

export async function asyncOperation(): Promise<void> {
  return new Promise<void>((resolve, reject) => {
    setTimeout(() => {
      if (Math.random() < 1) { // 抛出异常
        console.error('Simulated error in async operation.');
        reject(new Error('Simulated error in async operation.'));
      } else {
        console.log('Async operation completed successfully.');
        resolve();
      }
    }, 100); // 模拟耗时操作
  });
}

@Sendable
export class AsyncLockTest2 {
  private count_: number = 0;
  private lock_: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock();

  async getCount(): Promise<number> {
    return this.lock_.lockAsync(() => {
      return this.count_;
    })
  }

  async setCount(count: number) {
    if (Math.random() < 1) {
      throw new Error('Simulated error in wait callback.');
    }
    await this.lock_.lockAsync(() => {
      this.count_ = count;
    })
  }
}

@Concurrent
export function printArgs01(args: number): number {
  if (Math.random() < 1) {
    throw new Error('Simulated error in task execution.');
  }
  return args;
}

@Concurrent
export function printArgs02(args: number): number {
  return args;
}

@Concurrent
export async function foo1(asynclock: AsyncLock) {
  asynclock.setCount(10)
  let num1: number = await asynclock.getCount();
  console.info('AsyncLock getCount is', num1)
}

@Concurrent
export async function foo2(asynclock: AsyncLock) {
  asynclock.setCount(10)
  let num1: number = await asynclock.getCount();
  console.info('AsyncLock getCount is', num1)
}

@Concurrent
export async function asyncMethod(index: number): Promise<void> {
  return new Promise((resolve) => {
    setTimeout(() => {
      console.info(`async test sucessfully: ${index}`);
      resolve();
    }, 200);
  });
}

@Concurrent
export function printArgs1003(args: number): number {
  console.info('printArgs: ' + args);
  let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
  taskGroup.addTask(printArgs1001, 1);
  return args;
}

@Concurrent
export function printArgs1004(args: number): number {
  console.info('printArgs: ' + args);
  let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
  taskGroup.addTask(printArgs1002, 1);
  return args;
}