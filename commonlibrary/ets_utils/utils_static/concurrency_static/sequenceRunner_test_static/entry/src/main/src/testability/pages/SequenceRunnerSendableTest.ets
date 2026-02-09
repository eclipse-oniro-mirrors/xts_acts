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

  public publicFunc(num: number): number {
    return this.privateFunc(num);
  }

  public get GetNum(): number {
    return this.num1;
  }

  public set SetNum(num: number) {
    this.num1 = num;
  }

  public constructor() {
    console.info(this.str);
    this.isDone1 = true;
  }
}

export class DeriveClass extends BaseClass {
  public name: string = 'sendable: this is DeriveClass';

  public printName(): void {
    console.info(this.name);
  }

  public constructor() {
    super();
  }
}

export function addFunction(a: number, b: number): number {
  return a + b;
}

export class AsyncLock1 {
  public count: number = 1;

  public async getCount(): Promise<number> {
    let lock: AsyncLock = AsyncLock.request('lock_1');
    return lock.lockAsync((): number => {
      return this.count;
    })
  }

  public async setCount(count: number): Promise<void> {
    let lock: AsyncLock = AsyncLock.request('lock_1');
    await lock.lockAsync((): void => {
      this.count = count;
    })
  }
}
