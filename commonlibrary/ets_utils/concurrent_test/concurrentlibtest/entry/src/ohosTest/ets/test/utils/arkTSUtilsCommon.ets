/**
 * Copyright (c) 2024 SwanLink (Jiangsu) Technology Development Co., LTD.
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

import { ArkTSUtils } from '@kit.ArkTS';
import { GetTime, Sleep } from './utils';

export function loadCase(): Promise<void | Object> {
  let p: Promise<void | Object> = new Promise((resolve: Function, reject: Function) => {
    setTimeout(() => {
      resolve(1);
    }, 100);
  });
  return p;
}

@Concurrent
export async function sharedTaskTime(lockName: string): Promise<Array<number>> {
  let res = new Array<number>();
  let lock = ArkTSUtils.locks.AsyncLock.request(lockName);
  await lock.lockAsync(async () => {
    res.push(GetTime());
    await Sleep(500);
  }, ArkTSUtils.locks.AsyncLockMode.SHARED).then(() => {
    res.push(GetTime());
  })
  return res;
}

@Concurrent
export async function exclusiveTask(lockName: string, str: string): Promise<string> {
  let res = "";
  let lock = ArkTSUtils.locks.AsyncLock.request(lockName);
  await lock.lockAsync(async () => {
    res += str;
    await Sleep(500);
  }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
  return res;
}

@Concurrent
export async function lockExclusiveTask(lock: ArkTSUtils.locks.AsyncLock, str: string): Promise<string> {
  let res = "";
  await lock.lockAsync(async () => {
    res += str;
    await Sleep(500);
  }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
  return res;
}

@Concurrent
export async function sharedTimeTask(lockName: string): Promise<Array<number>> {
  let res = new Array<number>();
  let lock = ArkTSUtils.locks.AsyncLock.request(lockName);
  await lock.lockAsync(async () => {
    res.push(ArkTSUtils.locks.AsyncLockMode.SHARED);
    res.push(GetTime());
    await Sleep(500);
  }, ArkTSUtils.locks.AsyncLockMode.SHARED);
  return res;
}

@Concurrent
export async function exclusiveTimeTask(lockName: string): Promise<Array<number>> {
  let res = new Array<number>();
  let lock = ArkTSUtils.locks.AsyncLock.request(lockName);
  await lock.lockAsync(async () => {
    res.push(ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
    res.push(GetTime());
    await Sleep(500);
  }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
  return res;
}

@Concurrent
export async function locksTask(lock: ArkTSUtils.locks.AsyncLock,
  mode: ArkTSUtils.locks.AsyncLockMode): Promise<string> {
  let res = "";
  await lock.lockAsync(async () => {
    res = mode == ArkTSUtils.locks.AsyncLockMode.SHARED ? 'A' : 'B';
    await Sleep(500);
  }, mode);
  return res;
}

@Concurrent
export async function locksTimeTask(lock: ArkTSUtils.locks.AsyncLock,
  mode: ArkTSUtils.locks.AsyncLockMode): Promise<Array<number>> {
  let res = new Array<number>();
  await lock.lockAsync(async () => {
    res.push(GetTime());
    await Sleep(500);
  }, mode).then(() => {
    res.push(GetTime());
  })
  return res;
}

@Sendable
export function sendableFunction() {
  console.info(`sendableFunction`);
}

export class NumClass {
  a = 1;
  static b = 1;

  GetA() {
    return this.a
  }

  static GetB() {
    return NumClass.b
  }
}

@Sendable
export class SendableClass {
  count_: number = 0;
  static count: number = 1;

  static getPromiseCount(): Promise<number> {
    let lock: ArkTSUtils.locks.AsyncLock = ArkTSUtils.locks.AsyncLock.request("lock");
    return lock.lockAsync(() => {
      return SendableClass.count;
    })
  }

  static getCount(): number {
    return SendableClass.count;
  }

  async getCountAsync_(): Promise<number> {
    let lock: ArkTSUtils.locks.AsyncLock = ArkTSUtils.locks.AsyncLock.request("lock");
    return lock.lockAsync(() => {
      return this.count_;
    })
  }

  getCount_(): number {
    return SendableClass.count;
  }

  async setCount(count: number) {
    let lock: ArkTSUtils.locks.AsyncLock = ArkTSUtils.locks.AsyncLock.request("lock");
    await lock.lockAsync(() => {
      this.count_ = count;
    })
  }
}
