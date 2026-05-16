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

export class BaseClass {
  private str: string = 'sendable: BaseClass';
  public static num: Number = 10;
  public str1: string = 'sendable: this is BaseClass\'s string';
  private num1: Number = 5;
  public isDone1: boolean = false;

  private fibonacciRecursive(n: Number): Number {
    if (n <= 1) {
      return n;
    } else {
      return this.fibonacciRecursive(n - 1) + this.fibonacciRecursive(n - 2);
    }
  }

  private privateFunc(num: Number): Number {
    let res: Number = this.fibonacciRecursive(num);
    console.info('sendable: BaseClass privateFunc res is: ' + res);
    return res;
  }

  publicFunc(num: Number): Number {
    return this.privateFunc(num);
  }

  get GetNum(): Number {
    return this.num1;
  }

  set SetNum(num: Number) {
    this.num1 = num;
  }

  constructor() {
    console.info(this.str);
    this.isDone1 = true;
  }
}

export class DeriveClass extends BaseClass {
  private name: string = 'sendable: this is DeriveClass';

  printName() {
    console.info(this.name);
  }

  constructor() {
    super();
  }
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
    let s: string[] = []
    s[0].split('')[1].toString()
    await this.lock_.lockAsync(() => {
      this.count_ = count;
    })
  }
}

export class AsyncLockTestThen {
  private count_: Number = 0;
  private lock_: AsyncLock = new AsyncLock();

  async getCount(): Promise<Number> {
    return this.lock_.lockAsync(() => {
      return this.count_;
    })
  }

  async setCount(count: Number) {
    let s: string[] = []
    s[0].split('')[1].toString()
    await this.lock_.lockAsync(() => {
      this.count_ = count;
    })
  }
}

export class AsyncLockTestCatch {
  private count_: Number = 0;
  private lock_: AsyncLock = new AsyncLock();

  async getCount(): Promise<Number> {
    return this.lock_.lockAsync(() => {
      return this.count_;
    })
  }

  async setCount(count: Number) {
    let s: string[] = []
    s[0].split('')[1].toString()
    await this.lock_.lockAsync(() => {
      this.count_ = count;
    })
  }
}

export class AsyncLockTestFinally {
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
    }).finally(() => {
      let s: string[] = []
      s[0].split('')[1].toString()
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

export class AsyncLocks {
  public count_: Number = 1;
  async getCount(): Promise<Number> {
    let lock: AsyncLock = AsyncLock.request('lock_1');
    return lock.lockAsync(() => {
      return this.count_;
    })
  }
  async setCount(count: Number) {
    let lock: AsyncLock = AsyncLock.request('lock_1');
    await lock.lockAsync(() => {
      this.count_ = count;
    })
  }
}