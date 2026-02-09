/*
* Copyright (C) 2025 HiHope Open Source Organization.
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
import { BusinessError } from '@ohos.base';

export class BaseClass {
  private str: string = 'sendable: BaseClass';
  public static num: number = 10;
  public str1: string = 'sendable: this is BaseClass\'s string';
  public num1: number = 5;
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

export class DeriveClass extends BaseClass {
  public name: string = 'sendable: this is DeriveClass';

  printName(): void {
    console.info(this.name);
  }

  constructor() {
    super();
  }
}

export class AsyncLockTest {
  public count_: number = 0;
  public lock_: AsyncLock = new AsyncLock();

  async getCount(): Promise<number> {
    return this.lock_.lockAsync((): number => {
      return this.count_;
    })
  }

  async setCount(count: number): Promise<void> {
    let s: string[] = []
    s[0].split('')[1].toString()
    await this.lock_.lockAsync((): number => {
      this.count_ = count;
    })
  }
}

export class AsyncLockTestThen {
  public count_: number = 0;
  public lock_: AsyncLock = new AsyncLock();

  async getCount(): Promise<number> {
    return this.lock_.lockAsync((): number => {
      return this.count_;
    })
  }

  async setCount(count: number): Promise<void> {

    await this.lock_.lockAsync((): void => {//line:98
      this.count_ = count;
    }).then((): void => {
      let s: string[] = []
      s[0].split('')[1].toString()
    })
  }
}

export class AsyncLockTestCatch {
  public count_: number = 0;
  public lock_: AsyncLock = new AsyncLock();

  async getCount(): Promise<number> {
    return this.lock_.lockAsync((): number => {
      return this.count_;
    })
  }

  async setCount(count: number): Promise<void> {
    try {
      await this.lock_.lockAsync((): void => {
        this.count_ = count;
      }).then((): void => {
        let s: string[] = []
        s[0].split('')[1].toString()
      })
    } catch(e) {
      e = e as BusinessError;
      let s: string[] = []
      s[0].split('')[1].toString()
    }
  }
}

export class AsyncLockTestFinally {
  public count_: number = 0;
  public lock_: AsyncLock = new AsyncLock();

  async getCount(): Promise<number> {
    return this.lock_.lockAsync((): number => {
      return this.count_;
    })
  }

  async setCount(count: number) {

    await this.lock_.lockAsync((): void => {
      this.count_ = count;
    }).finally((): void => {
      let s: string[] = []
      s[0].split('')[1].toString()
    })
  }
}

export class AsyncLockTest1 {
  public count_: number = 0;
  public lock_: AsyncLock = new AsyncLock();

  async getCount(): Promise<number> {
    return this.lock_.lockAsync((): number => {
      return this.count_;
    })
  }

  async setCount(count: number): Promise<void> {
    if (Math.random() < 1) { // 抛出异常
      throw new Error('await error')
    }
    await this.lock_.lockAsync((): void => {
      this.count_ = count;
    })
  }
}

export class AsyncLockTest2 {
  public count_: number = 0;
  public lock_: AsyncLock = new AsyncLock();

  async getCount(): Promise<number> {
    return this.lock_.lockAsync((): number => {
      return this.count_;
    })
  }

  async setCount(count: number) {
    await this.lock_.lockAsync((): number => {
      this.count_ = count;
    })
  }
}