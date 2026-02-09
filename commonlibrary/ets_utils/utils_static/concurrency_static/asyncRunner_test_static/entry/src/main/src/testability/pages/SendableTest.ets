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

// import { ArkTSUtils, taskpool } from '@kit.ArkTS';
// import { printArgs1001, printArgs1002 } from './TaskMethodTest';

// @Sendable
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

// @Sendable
export class DeriveClass extends BaseClass {
  private name: string = 'sendable: this is DeriveClass';

  printName() {
    console.info(this.name);
  }

  constructor() {
    super();
  }
}

// @Sendable
export class AsyncLockTest {
  private count_: number = 0;
  private lock_: AsyncLock = new AsyncLock();

  async getCount(): Promise<number> {
    return this.count_;
   
  }

  async setCount(count: number) {
    let s: string[] = []
    s[0].split('')[1].toString()
    this.count_ = count;
   
  }
}

// @Sendable
export class AsyncLockTestThen {
  private count_: number = 0;
  private lock_: AsyncLock = new AsyncLock();

  async getCount(): Promise<number> {
    return this.count_;
    // return this.lock_.lockAsync(() => {
    //   return this.count_;
    // })
  }

  async setCount(count: number): Promise<void> {
    this.count_ = count;
    let s: string[] = [];
    s[0].split('')[1].toString();
   
  }
}

// @Sendable
export class AsyncLockTestCatch {
  private count_: number = 0;
  private lock_: AsyncLock = new AsyncLock();

  async getCount(): Promise<number> {
    return this.count_;
    // return this.lock_.lockAsync(() => {
    //   return this.count_;
    // })
  }

  async setCount(count: number) {
    this.count_ = count;
    let s: string[] = [];
    s[0].split('')[1].toString();
   

  }
}

// @Sendable
export class AsyncLockTestFinally {
  private count_: number = 0;
  private lock_: AsyncLock = new AsyncLock();

  async getCount(): Promise<number> {
    return this.count_;
   
  }

  async setCount(count: number) {
    this.count_ = count;
    let s: string[] = [];
    s[0].split('')[1].toString();
   

  }
}


// @Sendable
export class AsyncLockTest1 {
  private count_: number = 0;
  private lock_: AsyncLock = new AsyncLock();

  async getCount(): Promise<number> {
     return this.count_;
    
  }

  async setCount(count: number) {
    this.count_ = count;
   
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
      resolve(undefined);  // 任务成功完成
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
        resolve(undefined);
      }
    }, 100); // 模拟耗时操作
  });
}

// @Sendable
export class AsyncLockTest2 {
  private count_: number = 0;
  private lock_: AsyncLock = new AsyncLock();

  async getCount(): Promise<number> {
     return this.count_;
    // return this.lock_.lockAsync(() => {
    //   return this.count_;
    // })
  }

  async setCount(count: number) {
    if (Math.random() < 1) {
      throw new Error('Simulated error in wait callback.');
    }
    this.count_ = count;
  
  }
}

//@Concurrent
export function printArgs01(args: number): number {
  if (Math.random() < 1) {
    throw new Error('Simulated error in task execution.');
  }
  return args;
}

//@Concurrent
export function printArgs02(args: number): number {
  return args;
}



//@Concurrent
export async function asyncMethod(index: number): Promise<void> {
  return new Promise<void>((resolve) => {
    setTimeout(() => {
      console.info(`async test sucessfully: ${index}`);
      resolve(undefined);
    }, 200);
  });
}
