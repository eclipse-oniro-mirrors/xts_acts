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
import { ArkTSUtils, worker } from '@kit.ArkTS';

export class AsyncLock {
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
export class AsyncLockTest {
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
      let s: string[] = []
      s[0].split('')[1].toString()
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
      let s: string[] = []
      s[0].split('')[1].toString()
    }).catch(() => {
      let s: string[] = []
      s[0].split('')[1].toString()
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
      let s: string[] = []
      s[0].split('')[1].toString()
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

export class WorkThread {
  public workerStageModel = new worker.ThreadWorker('../../workers/Worker.ets');
}

@Concurrent
export function printArgs01(args: number): number {
  if (Math.random() < 1) { // 抛出异常
    throw new Error('Simulated error in task execution.');
  }
  return args
}

@Concurrent
export function printArgs02(args: number): number {
  return args
}

export let lock = new AsyncLock();
