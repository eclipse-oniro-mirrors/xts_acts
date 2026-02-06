/**
 * Copyright (c) 2025 SwanLink (Jiangsu) Technology Development Co., LTD.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
export const sleep = (ms: int): Promise<int> => {
  return new Promise<int>(resolve => {
    setTimeout(() => {
      resolve(1)
    }, ms)
  });
}

export function GetTime(): number {
  return new Date().getTime();
}
export function loadCase(): Promise<int> {
  let p: Promise<int> = new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(1);
    }, 100);
  });
  return p;
}

export async function sharedTaskTime(lockName: string): Promise<Array<Number>> {
  let res = new Array<Number>();
  let lock = AsyncLock.request(lockName);
  await lock.lockAsync(async () => {
    console.error(`${lockName} time: ${new Date().getTime()}`);
    res.push(GetTime());
    await sleep(500);
  }, AsyncLockMode.SHARED).then(() => {
    console.error(`${lockName} time2: ${new Date().getTime()}`);
    res.push(GetTime());
  })
  return res;
}

export async function exclusiveTask(lockName: string, str: string): Promise<string> {
  let res = "";
  let lock = AsyncLock.request(lockName);
  await lock.lockAsync(async () => {
    res += str;
    await sleep(500);
  }, AsyncLockMode.EXCLUSIVE);
  return res;
}

export async function lockExclusiveTask(lock: AsyncLock, str: string): Promise<string> {
  let res = "";
  await lock.lockAsync(async () => {
    res += str;
    await sleep(500);
  }, AsyncLockMode.EXCLUSIVE);
  return res;
}

export async function sharedTimeTask(lockName: string): Promise<Array<Number>> {
  let res = new Array<Number>();
  let lock = AsyncLock.request(lockName);
  await lock.lockAsync(async () => {
    res.push(AsyncLockMode.SHARED);
    res.push(GetTime());
    await sleep(500);
  }, AsyncLockMode.SHARED);
  return res;
}

export async function exclusiveTimeTask(lockName: string): Promise<Array<Number>> {
  let res = new Array<Number>();
  let lock = AsyncLock.request(lockName);
  await lock.lockAsync(async () => {
    res.push(AsyncLockMode.EXCLUSIVE);
    res.push(GetTime());
    await sleep(500);
  }, AsyncLockMode.EXCLUSIVE);
  return res;
}

export async function locksTask(lock: AsyncLock,
  mode: AsyncLockMode): Promise<string> {
  let res = "";
  await lock.lockAsync(async ()=> {
    res = mode == AsyncLockMode.SHARED ? 'A' : 'B';
    await sleep(500);
  }, mode);
  return res;
}

export async function locksTimeTask(lock: AsyncLock,
  mode: AsyncLockMode): Promise<Array<number>> {
  let res = new Array<number>();
  await lock.lockAsync(async () => {
    res.push(GetTime());
    await sleep(500);
  }, mode).then((): void => {
    res.push(GetTime());
  })
  return res;
}

export function sendableFunction() {
  console.info(`sendableFunction`);
}

export class NumClass {
  a :number= 1;
  static b:number = 1;

  GetA():number {
    return this.a
  }

  static GetB():number {
    return NumClass.b
  }
}

export class SendableClass {
  count_: number = 0;
  static count: number = 1;

  static getPromiseCount(): Promise<number> {
    let lock: AsyncLock = AsyncLock.request("lock");
    return lock.lockAsync(() => {
      return SendableClass.count;
    })
  }

  static getCount(): number {
    return SendableClass.count;
  }

  async getCountAsync_(): Promise<number> {
    let lock: AsyncLock = AsyncLock.request("lock");
    return lock.lockAsync(() => {
      return this.count_;
    })
  }

  getCount_(): number {
    return SendableClass.count;
  }

  async setCount(count: number) {
    let lock: AsyncLock = AsyncLock.request("lock");
    await lock.lockAsync(() => {
      this.count_ = count;
    })
  }
}
