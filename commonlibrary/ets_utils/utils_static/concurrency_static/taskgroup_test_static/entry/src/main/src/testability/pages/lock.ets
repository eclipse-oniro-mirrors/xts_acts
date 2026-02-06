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

export class AsyncLocks {
  private isLocked: boolean;

  constructor() {
    this.isLocked = false;
  }

  async acquire() {
    throw new Error('Simulated error in task execution.');

  }

  async acquire1() {
    console.log('Lock acquired.');
  }

  release() {
    this.isLocked = false;
    console.log('Lock released.');
  }
}

export function asyncTask(): Promise<number> {
  return new Promise<number>((resolve): void => {
    setTimeout((): void => {
      console.log('Task is executing...');
      resolve(1);
    }, 100);
  });
}

export async function asyncOperation(): Promise<number> {
  return new Promise<number>((resolve, reject) => {
    setTimeout((): void => {
      if (Math.random() < 1) { // 抛出异常
        console.error('Simulated error in async operation.');
        reject(new Error('Simulated error in async operation.'));
      } else {
        console.log('Async operation completed successfully.');
        resolve(1);
      }
    }, 100);
  });
}

export class AsyncLockTest {
  private count_: Number = 0;
  private lock_: AsyncLock = new AsyncLock();

  async getCount(): Promise<Number> {
    return this.lock_.lockAsync(() => {
      return this.count_;
    })
  }

  async setCount(count: Number) {
    if (Math.random() < 1) {
      throw new Error('Simulated error in wait callback.');
    }
    await this.lock_.lockAsync(() => {
      this.count_ = count;
    })
  }
}

export class AsyncLockTest1 {
  private count_: Number = 0;
  private lock_: AsyncLock = new AsyncLock();

  async getCount(): Promise<Number> {
    return this.lock_.lockAsync(() => {
      return this.count_;
    })
  }

  async setCount(count: Number) {
    await this.lock_.lockAsync(() => {
      this.count_ = count;
    })
  }
}

export function printArgs01(args: Number): Number {
  if (Math.random() < 1) {
    throw new Error('Simulated error in task execution.');
  }
  return args
}

export function printArgs02(args: Number): Number {
  return args
}

export let lock = new AsyncLocks();
