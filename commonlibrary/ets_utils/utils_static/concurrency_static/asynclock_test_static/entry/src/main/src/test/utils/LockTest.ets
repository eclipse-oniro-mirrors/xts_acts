/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import hilog from '@ohos.hilog';
import { check, check_negative,sleep } from './utils';

function createUint(): Uint32Array {
  let sab = new ArrayBuffer(4);
  return new Uint32Array(sab);
}
function createInt(): Int32Array {
  let sab = new ArrayBuffer(4);
  return new Int32Array(sab);
}

function exchangeUint(buf: Uint32Array, oldVal: number, newVal: number): void {
  if (buf[0] != oldVal) {
    throw new Error("Test failed: expected " + oldVal + ", but got " + buf[0]);
  }
  buf[0] = newVal;
}

function exchange(buf: Int32Array, oldVal: number, newVal: number): void {
  if (buf[0] != oldVal) {
    throw new Error("Test failed: expected " + oldVal + ", but got " + buf[0]);
  }
  buf[0] = newVal;
}

// test entry point
export function exclusiveSingleTest(): Promise<String> {
  let flagBuf = createInt();
  flagBuf[0] = 0;
  let lock = new AsyncLock();

  let p1 = lock.lockAsync<void>(async (): Promise<void> => {
    exchange(flagBuf, 0, 1);
    await Promise.resolve(1);
    exchange(flagBuf, 1, 0);
  }, AsyncLockMode.EXCLUSIVE);
  let p2 = lock.lockAsync<void>(async (): Promise<void> => {
    exchange(flagBuf, 0, 2);
    await Promise.resolve(1);
    exchange(flagBuf, 2, 0);
  }, AsyncLockMode.EXCLUSIVE);
  return check("exclusiveSingleTest", Promise.all([p1, p2]));
}

// Code of this function must be the same as in Worker.ets

async function exclusiveMultiJob(lockName: string, timeout: number, tidBuf: Int32Array,
  tid: number): Promise<void> {
  let lock = AsyncLock.request(lockName);
  lock.lockAsync<void>(async (): Promise<void> => {
    let old = Atomics.compareExchange(tidBuf, 0, 0, tid.toInt());
    if (old != 0) {
      throw new Error("Expected 0, but was: " + old);
    }
    await Promise.resolve(1);
    old = Atomics.compareExchange(tidBuf, 0, tid.toInt(), 0);
    if (old != tid) {
      throw new Error("Expected old=" + tid + ", but was: " + old);
    }
  }, AsyncLockMode.EXCLUSIVE);
}

// test entry point
export function exclusiveMultiTest(): Promise<String> {
  let lockName = "exclusiveMultiLock";
  let tidBuf = createInt();
  tidBuf[0] = 0;
  let p1: Promise<Any> = taskpool.execute(exclusiveMultiJob, lockName, Number(100), tidBuf, Number(2));
  let p2 = exclusiveMultiJob(lockName, Number(100), tidBuf, Number(1));
  return check("exclusiveMultiTest", Promise.all([p1, p2]));
}
interface lockType {
  test: string
  lockName: string
  timeout: number
}
interface lockType_exclusiveMultiWorkerTest {
  test: string
  lockName: string
  timeout: number
  tidBuf: Int32Array
  tid: number
}
// test entry point
export async function exclusiveMultiWorkerTest() {
  let lockName = "exclusiveMultiWorkerLock";
  let tidBuf = createInt();
  tidBuf[0] = 0;
  let data: lockType_exclusiveMultiWorkerTest = {
    test: "exclusiveMultiWorkerTest",
    lockName: lockName,
    timeout: Number(100),
    tidBuf: tidBuf,
    tid: Number(2)
  }
  let p1 = new Promise<void>((resolve, reject) => {
    let worker = new EAWorker()
    worker.start()
    let job1 = worker.run<string>((): string => {
      let flag = ""
      let result: Promise<void> | null = null;
      result = exclusiveMultiWorkerJob(data.lockName, data.timeout, data.tidBuf, data.tid);
      await result.then(():void => {
        flag = 'PASSED'
      }, (e: Error):void => {
        flag = 'FAILED: ' + e.message
      });
      return flag
    })
    let workerresult = job1.Await()
    worker.join()
    if (workerresult === "PASSED") {
      resolve(undefined);
    } else {
      reject(Error(workerresult));
    }
  });
  let p2 = exclusiveMultiJob(lockName, Number(100), tidBuf, Number(1));
  return check("exclusiveMultiWorkerTest", Promise.all([p1, p2]));
}
// test entry point
export function sharedSingleTest(): Promise<String> {
  let flagBuf = createInt();
  flagBuf[0] = 0;
  let lock = new AsyncLock();

  let p = lock.lockAsync<void>(async (): Promise<void> => {
    exchange(flagBuf, 0, 1);
    await Promise.resolve(1);
    await lock.lockAsync<void>(async (): Promise<void> => {
      exchange(flagBuf, 1, 2);
    }, AsyncLockMode.SHARED);
    exchange(flagBuf, 2, 0);
  }, AsyncLockMode.SHARED);
  return check("sharedSingleTest", p);
}

// Code of this function must be the same as in Worker.ets

async function sharedMultiJob(lockName: string, timeout: number, flagBuf: Int32Array,
  idx: number): Promise<void> {
  let lock = AsyncLock.request(lockName);
  await lock.lockAsync<void>(async (): Promise<void> => {
    hilog.info(0x0000, 'sharedMultiJob', 'lock.lockAsync '+idx);
    flagBuf[idx.toInt()] = 1;
    await Promise.resolve(1);
    let prevSet = true;
    for (let i = 0; i < idx; ++i) {
      hilog.info(0x0000, 'sharedMultiJob', 'for '+idx);
      if (!flagBuf[i]) {
        hilog.info(0x0000, 'sharedMultiJob', 'for if '+idx);
        prevSet = false;
      }
    }
    if (!prevSet) {
      hilog.info(0x0000, 'sharedMultiJob', 'throw error '+idx);
      throw new Error("Expected callback overlap");
    }
    flagBuf[idx.toInt()] = 0;
  }, AsyncLockMode.SHARED);
}

// test entry point
export function sharedMultiTest(): Promise<String> {
  let lockName = "sharedMultiLock";
  let sab = new ArrayBuffer(2 * 4);
  let flagBuf = new Int32Array(sab);
  flagBuf[0] = 0;
  flagBuf[1] = 0;
  let p1 = sharedMultiJob(lockName, Number(200), flagBuf, Number(0));
  let p2: Promise<Any> = taskpool.execute(sharedMultiJob, lockName, Number(100), flagBuf, Number(1));
  return check("sharedMultiTest", Promise.all([p1, p2]));
}

// test entry point
export async function sharedMultiWorkerTest() {
  let lockName = "sharedMultiWorkerLock";
  let sab = new ArrayBuffer(2 * 4);
  let flagBuf = new Int32Array(sab);
  flagBuf[0] = 0;
  flagBuf[1] = 0;
  let data:lockType_exclusiveMultiWorkerTest = {test: "sharedMultiWorkerTest", lockName: lockName, timeout: Number(100), tidBuf: flagBuf, tid: Number(1)}
  let p1 = sharedMultiJob(lockName, 200, flagBuf, 0);
  let p2 = new Promise<void>((resolve, reject) => {
    let worker = new EAWorker()
    worker.start()
    let job1 = worker.run<string>((): string => {
      let flag = ""
      let result: Promise<void> | null = null;
      result = sharedMultiWorkerJob(data.lockName, data.timeout, data.tidBuf, data.tid);
      await result.then(():void => {
        flag = 'PASSED'
      }, (e: Error):void => {
        flag = 'FAILED: ' + e.message
      });
      return flag
    })
    let workerresult = job1.Await()
    worker.join()
    if (workerresult === "PASSED") {
      resolve(undefined);
    } else {
      reject(Error(workerresult));
    }
  });
  return check("sharedMultiWorkerTest", Promise.all([p1, p2]));
}


export function isAvailableTrueJob(lockName: string) {
  let lock = AsyncLock.request(lockName);
  let options = new AsyncLockOptions<void>();
  options.isAvailable = true;
  let p: Promise<void> = lock.lockAsync(() => {
  }, AsyncLockMode.EXCLUSIVE, options);
  p.then((): void => {
    hilog.info(0x0000, 'ActsConcurrencyBaseJSTest', 'Test failed: the lock is acquired');
  });
  p.catch((): void => {
    hilog.info(0x0000, 'ActsConcurrencyBaseJSTest', 'Test passed');
  });
}

// test entry point
export function isAvailableTest(): Promise<string> {
  let lockName: string = "isAvailableLock";
  let lock = AsyncLock.request(lockName);
  lock.lockAsync<void>(async (): Promise<void> => {
    await new Promise<number>((resolve): void => {
      setTimeout((): void => {
        resolve(1);
      }, 1000);
    });
  });
  let p: Promise<Any> = taskpool.execute(isAvailableTrueJob, lockName) as Promise<Any>;
  return check("isAvailableTest", p);
}


function isAvailableFalseJob(lockName: string): Promise<void> {
  let lock = AsyncLock.request(lockName);
  let options = new AsyncLockOptions<void>();
  options.isAvailable = false;
  let p: Promise<void> = lock.lockAsync((): void => {
  }, AsyncLockMode.EXCLUSIVE, options);
  p.then((): void => {
    hilog.info(0x0000, 'ActsConcurrencyBaseJSTest', 'Test passed');
  });
  p.catch((): void => {
    hilog.info(0x0000, 'ActsConcurrencyBaseJSTest', 'Test failed: the lock is acquired');
  });
  return p;
}

// test entry point
export function isNotAvailableTest(): Promise<string> {
  let lockName: string = "isNotAvailableLock";
  let lock = AsyncLock.request(lockName);
  lock.lockAsync<void>(async (): Promise<void> => {
    await new Promise<number>((resolve): void => {
      setTimeout((): void => {
        resolve(1);
      }, 100);
    });
  });
  let p: Promise<Any> = taskpool.execute(isAvailableFalseJob, lockName);
  return check("isNotAvailableTest", p);
}

// test entry point
export function queryTest(): Promise<string> {
  let lockName = "queryTestLock"
  let lock = AsyncLock.request(lockName);
  let state: AsyncLockState = AsyncLock.query(lockName);
  if (!state) {
    throw new Error('Test failed: expected a valid state, but was ' + state);
  }

  let p = lock.lockAsync<void>(async (): Promise<void> => {
    let states: AsyncLockState[] = AsyncLock.queryAll();
    if (states.length == 0) {
      throw new Error('Test failed: expected at least 1 state, but was ' + states.length);
    }
    let state: AsyncLockState = AsyncLock.query(lockName);
    let pending: AsyncLockInfo[] = state.pending;
    if (pending.length != 0) {
      throw new Error('Test failed: expected pending.length=0, but was ' + pending.length);
    }
    let held: AsyncLockInfo[] = state.held;
    if (held.length != 1) {
      throw new Error('Test failed: expected held.length=1, but was ' + held.length);
    }
    if (held[0].name !== lockName) {
      throw new Error('Test failed: expected held[0].name=' + lockName + ', but was ' + held[0].name);
    }
    if (held[0].mode !== AsyncLockMode.EXCLUSIVE) {
      throw new Error('Test failed: expected held[0].mode=EXCLUSIVE, but was ' + held[0].mode);
    }
  }, AsyncLockMode.EXCLUSIVE);
  return check("queryTest", p);
}

// test entry point
export function abortTest(): Promise<string> {
  let lock = new AsyncLock();
  let s: AbortSignal<string> = { aborted: false, reason: "Aborted" };
  let options = new AsyncLockOptions<string>();
  options.isAvailable = false;
  options.signal = s;
  let p: Promise<number | string> = lock.lockAsync<number, string>((): number => {
    hilog.info(0x0000, 'ActsConcurrencyBaseJSTest', 'Test failed');
    return 5;
  }, AsyncLockMode.EXCLUSIVE, options);
  s.aborted = true;
  let p1 = p.then(
    (): void => {
      throw new Error('Test failed. Promise is fulfilled.')
    },
    (err: Error) => {
      if (err.message !== "Aborted") {
        throw new Error('Test failed. Wrong error value.');
      }
    });
  return check("abortTest", p1);
}

// test entry point
export function deadlockTest(): Promise<string> {
  let lock = new AsyncLock();
  let options = new AsyncLockOptions<string>();
  options.timeout = 1000;
  let p: Promise<number | string> = lock.lockAsync<number, string>(async (): Promise<number> => {
    let options = new AsyncLockOptions<string>();
    options.timeout = 1000;
    await lock.lockAsync((): void => {
      throw new Error('Test failed: inner lock acquired.');
    }, AsyncLockMode.EXCLUSIVE, options);
    return (0 as number);
  }, AsyncLockMode.EXCLUSIVE, options);
  return check_negative("deadlockTest", p);
}

// test entry point
export function nestedDeadlockTest(): Promise<string> {
  let options = new AsyncLockOptions<void>();
  options.timeout = 1000;

  let lockA = new AsyncLock();
  let p = lockA.lockAsync<void, void>(async (): Promise<void> => {
    let lockB = new AsyncLock();
    await lockB.lockAsync<void, void>(async (): Promise<void> => {
      await lockA.lockAsync<void, void>((): void => {
        throw new Error('Test failed: acquired the inner lock A.');
      }, AsyncLockMode.EXCLUSIVE, options);
    }, AsyncLockMode.EXCLUSIVE, options);
  }, AsyncLockMode.EXCLUSIVE, options);
  return check_negative("nestedDeadlockTest", p);
}
/*
function twoThreadedDeadlockT2(lockNameL1: string, lockNameL2: string, flagBuf: Int32Array): Promise<void> {
  let L2 = AsyncLock.request(lockNameL2);
  return L2.lockAsync<void>(async (): Promise<void> => { // F2
    hilog.info(0x0000, 'ActsConcurrencyBaseJSTest', '>T2 F2');
    hilog.info(0x0000, 'ActsConcurrencyBaseJSTest', '0->1');
    Atomics.compareExchange(flagBuf, 0, 0, 1);
    // now lock the second lock
    let L1 = AsyncLock.request(lockNameL1);
    await L1.lockAsync<void>((): void => {
      // deadlock should happen, then T1 timeout exceeds and locks will unlock
    }, AsyncLockMode.EXCLUSIVE);
    hilog.info(0x0000, 'ActsConcurrencyBaseJSTest', '<T2 F2');
  }, AsyncLockMode.EXCLUSIVE);
}

function twoThreadedDeadlockT2(lockNameL1: string, lockNameL2: string, flagBuf: Int32Array): Promise<void> {
  let L2 = AsyncLock.request(lockNameL2);
  return L2.lockAsync<void>(async (): Promise<void> => { // F2
    hilog.info(0x0000, 'ActsConcurrencyBaseJSTest', '>T2 F2');
    hilog.info(0x0000, 'ActsConcurrencyBaseJSTest', '0->1');
    Atomics.compareExchange(flagBuf, 0, 0, 1);
    // now lock the second lock
    let L1 = AsyncLock.request(lockNameL1);
    await L1.lockAsync<void>((): void => {
      // deadlock should happen, then T1 timeout exceeds and locks will unlock
    }, AsyncLockMode.EXCLUSIVE);
    hilog.info(0x0000, 'ActsConcurrencyBaseJSTest', '<T2 F2');
  }, AsyncLockMode.EXCLUSIVE);
}*/
// test entry point
export function twoThreadedDeadlockTest(): Promise<string> {
  hilog.info(0x0000, 'ActsConcurrencyBaseJSTest', '>twoThreadedDeadlockTest');
  let lockNameL1 = "twoThreadedDeadlockTestL1";
  let lockNameL2 = "twoThreadedDeadlockTestL2";
  let options = new AsyncLockOptions<void>();
  options.timeout = 1000;
  let flagBuf = createInt();
  flagBuf[0] = 0;

  let p = new Promise<void>((resolve, reject): void => {
    let L1 = AsyncLock.request(lockNameL1);
    L1.lockAsync<void>(async (): Promise<void> => { // F1
      hilog.info(0x0000, 'ActsConcurrencyBaseJSTest', '>T1 F1');
      // spawn T2
      taskpool.execute(twoThreadedDeadlockT2, lockNameL1, lockNameL2, flagBuf);
      // busy loop: wait until T2 acquires L2
      hilog.info(0x0000, 'ActsConcurrencyBaseJSTest', '>bloop');
      while (Atomics.load(flagBuf, 0) != 1) {
      }
      hilog.info(0x0000, 'ActsConcurrencyBaseJSTest', '<bloop');
      // try to lock L2 for the deadlock
      let L2 = AsyncLock.request(lockNameL2);
      await L2.lockAsync<void, void>((): void => {
        resolve(undefined);
      }, AsyncLockMode.EXCLUSIVE, options);
      hilog.info(0x0000, 'ActsConcurrencyBaseJSTest', '<T1 F1');
    }, AsyncLockMode.EXCLUSIVE).then((): void => {
      resolve(undefined);
    }).catch((e: Error):void => {
      reject(e);
    });
  });
  hilog.info(0x0000, 'ActsConcurrencyBaseJSTest', '<twoThreadedDeadlockTest');
  return check_negative("twoThreadedDeadlockTest", p);
}


// test entry point
export function twoLocksSingleTest(): Promise<string> {
  let flagBuf = createInt();
  flagBuf[0] = 0;
  let lock1 = new AsyncLock();
  let lock2 = new AsyncLock();

  let p1 = lock1.lockAsync<void>(async (): Promise<void> => {
    exchange(flagBuf, 0, 1);
    await Promise.resolve(1);
    exchange(flagBuf, 1, 0);
  }, AsyncLockMode.EXCLUSIVE);
  let p2 = lock2.lockAsync<void>(async (): Promise<void> => {
    exchange(flagBuf, 0, 2);
    await Promise.resolve(1);
    exchange(flagBuf, 2, 0);
  }, AsyncLockMode.EXCLUSIVE);
  return check("twoLocksSingleTest", Promise.all([p1, p2]));
}


async function exclusiveLockAcquireJob(): Promise<void> {
  let lock = new AsyncLock();
  lock.lockAsync<void>(async (): Promise<void> => {
  }, AsyncLockMode.EXCLUSIVE);
}

// test entry point
export function twoThreadsAcquireOwnLocks(): Promise<string> {
  let p1: Promise<Any> = taskpool.execute(exclusiveLockAcquireJob) as Promise<Any>;
  let p2: Promise<Any> = taskpool.execute(exclusiveLockAcquireJob) as Promise<Any>;
  return check("twoThreadsAcquireOwnLocks", Promise.all([p1, p2]));
}


async function lockJob(lockName: string, flagBuf: Int32Array): Promise<void> {
  let lock = AsyncLock.request(lockName);
  lock.lockAsync<void>(async (): Promise<void> => {
    Atomics.compareExchange(flagBuf, 0, 0, 1);
    await new Promise<number>((resolve): void => {
      setTimeout((): void => {
        resolve(1);
      }, 100);
    });
    Atomics.compareExchange(flagBuf, 0, 1, 0);
  }, AsyncLockMode.SHARED);
}

// test entry point
export async function multipleWakeupTest(): Promise<string> {
  let lockName = "multipleWakeupLock";
  let flagBuf = createInt();
  flagBuf[0] = 0;
  let p: Promise<Any> = taskpool.execute(lockJob, lockName, flagBuf) as Promise<Any>;
  // busy loop
  while (Atomics.load(flagBuf, 0) == 0) {
    await sleep(100)
  }
  let count = 10;
  let promises: Array<Promise<void>> = new Array<Promise<void>>(count);
  let lock = AsyncLock.request(lockName);
  for (let i = 0; i < count; ++i) {
    promises[i] = lock.lockAsync<void>(async (): Promise<void> => {
    }, AsyncLockMode.SHARED);
  }
  await p;
  return check("multipleWakeupTest", Promise.all(promises));
}

async function waitForLockBody(): Promise<void> {
  let flagBuf = createInt();
  flagBuf[0] = 0;
  let lock = new AsyncLock();

  await lock.lockAsync<void>(async (): Promise<void> => {
    exchange(flagBuf, 0, 1);
  }, AsyncLockMode.EXCLUSIVE);
  if (flagBuf[0] != 1) {
    throw new Error("Test failed: expected value 1, but was " + flagBuf[0]);
  }
  hilog.info(0x0000, 'ActsConcurrencyBaseJSTest', 'Test passed');
}

// test entry point
export function waitForLock(): Promise<string> {
  return check("waitForLock", waitForLockBody());
}

// test entry point
export function dontWaitForLock(): Promise<string> {
  let flagBuf = createInt();
  flagBuf[0] = 0;
  let lock = new AsyncLock();
  let p = lock.lockAsync<void>(async (): Promise<void> => {
    exchange(flagBuf, 0, 1)
  }, AsyncLockMode.EXCLUSIVE);
  if (flagBuf[0] != 0) {
    throw new Error("Test failed: expected value 0, but was " + flagBuf[0]);
  }
  return check("dontWaitForLock", p);
}

// test entry point
export function queryWithDeadlockTest(): Promise<string> {
  let options = new AsyncLockOptions<string>();
  options.timeout = 1000;
  let lock = new AsyncLock();
  let p = lock.lockAsync<void>(async (): Promise<void> => {
    await lock.lockAsync((): void => {
    }, AsyncLockMode.EXCLUSIVE, options);
  }, AsyncLockMode.EXCLUSIVE);

  setTimeout((): void => {
    let states: AsyncLockState[] = AsyncLock.queryAll();
    hilog.info(0x0000, 'ActsConcurrencyBaseJSTest', 'states.length = ' + states.length);
  }, 100);

  return check_negative("queryWithDeadlockTest", p);
}


async function lockHolderJob(lockName: string, timeout: int, flagBuf: Int32Array): Promise<void> {
  let lock = AsyncLock.request(lockName);
  lock.lockAsync<void>(async (): Promise<void> => {
    hilog.info(0x0000, 'ActsConcurrencyBaseJSTest', '0->1');
    Atomics.compareExchange(flagBuf, 0, 0, 1);
    hilog.info(0x0000, 'ActsConcurrencyBaseJSTest', '>timeout');
    new Promise<number>((resolve): void => {
      setTimeout((): void => {
        resolve(1);
      }, timeout);
    });
    hilog.info(0x0000, 'ActsConcurrencyBaseJSTest', '<timeout');
  }, AsyncLockMode.EXCLUSIVE);
}

// test entry point
export function sequentialLock(): Promise<string> {
  let lockNameB = "sequentialLockB";
  let flagBuf = createInt();
  flagBuf[0] = 0;
  taskpool.execute(lockHolderJob, lockNameB, 100, flagBuf);
  let p = new Promise<void>((resolve, reject) => {
    let lockA = new AsyncLock();
    lockA.lockAsync((): void => {
      // busy loop
      hilog.info(0x0000, 'ActsConcurrencyBaseJSTest', '>bloop');
      while (Atomics.load(flagBuf, 0) != 1) {
      }
      hilog.info(0x0000, 'ActsConcurrencyBaseJSTest', '<bloop');
      let lockB = AsyncLock.request(lockNameB);
      lockB.lockAsync((): void => {
        let old = Atomics.load(flagBuf, 0);
        if (old == 2) {
          resolve(undefined);
        } else {
          reject(new Error("Expected 2, but was: " + old));
        }
      });
      let old = Atomics.compareExchange(flagBuf, 0, 1, 2);
      if (old != 1) {
        reject(new Error("Expected 1, but was: " + old));
      }
    });
  });
  return check("sequentialLock", p);
}

interface lockType_sequentialLockWorkerTest {
  test: string
  lockName: string
  timeout: number
  flagBuf: Int32Array
}

// test entry point
export async function sequentialLockWorkerTest() {
  let lockNameB = "sequentialLockWorkerB";
  let flagBuf = createInt();
  flagBuf[0] = 0;
  let data:lockType_sequentialLockWorkerTest ={ test: "sequentialLockWorkerTest", lockName: lockNameB, timeout: Number(100), flagBuf: flagBuf }
  let p1 = new Promise<void>((resolve) => {
    let worker = new EAWorker()
    worker.start()
    let job1 = worker.run<string>((): string => {
      let flag = ""
      let result: Promise<void> | null = null;
      result = lockHolderWorkerJob(data.lockName , data.timeout, data.flagBuf);
      await result.then(():void => {
        flag = 'PASSED'
      }, (e: Error):void => {
        flag = 'FAILED: ' + e.message
      });
      return flag
    })
    job1.Await()
    worker.join()
    resolve(undefined);
  });
  let p = new Promise<void>((resolve, reject) => {
    let lockA = new AsyncLock();
    lockA.lockAsync((): void =>{
      // busy loop
      hilog.info(0x0000, 'ActsConcurrencyBaseJSTest', '>bloop');
      while (Atomics.load(flagBuf, 0) != 1) {
        await sleep(100)
      }
      hilog.info(0x0000, 'ActsConcurrencyBaseJSTest', '<bloop');
      let lockB = AsyncLock.request(lockNameB);
      lockB.lockAsync((): void =>{
        let old = Atomics.load(flagBuf, 0);
        if (old == 2) {
          resolve(undefined);
        } else {
          reject(new Error("Expected 2, but was: " + old));
        }
      });
      let old = Atomics.compareExchange(flagBuf, 0, 1, 2);
      if (old != 1) {
        reject(new Error("Expected 1, but was: " + old));
      }
    });
  });
  return check("sequentialLockWorkerTest", Promise.all([p1, p]));
}
// test entry point
export function sequentialLockInf(): Promise<string> {
  let lockNameB = "sequentialLockInfB";
  let flagBuf = createInt();
  flagBuf[0] = 0;
  taskpool.execute(lockHolderJob, lockNameB, 1000, flagBuf);
  let p = new Promise<void>((resolve, reject) => {
    let lockA = new AsyncLock();
    lockA.lockAsync((): void => {
      // busy loop
      while (Atomics.load(flagBuf, 0) != 1) {
      }
      let lockB = AsyncLock.request(lockNameB);
      lockB.lockAsync((): void => {
        let old = Atomics.compareExchange(flagBuf, 0, 2, 3);
        if (old != 2) {
          reject(new Error("Expected 2, but was: " + old));
        }
      });
      let old = Atomics.compareExchange(flagBuf, 0, 1, 2);
      if (old == 1) {
        resolve(undefined);
      } else {
        reject(new Error("Expected 1, but was: " + old));
      }
    });
  });
  return check("sequentialLockInf", p);
}

// test entry point
export function sequentialLockUnlocked(): Promise<string> {
  let flagBuf = createInt();
  flagBuf[0] = 0;
  let lockA = new AsyncLock();
  let p = lockA.lockAsync<void>(async (): Promise<void> => {
    exchange(flagBuf, 0, 1);
    let lockB = new AsyncLock();
    await lockB.lockAsync((): void => {
      exchange(flagBuf, 1, 2);
    });
    exchange(flagBuf, 2, 3);
  });
  return check("sequentialLockUnlocked", p);
}

// test entry point
export function sequentialLockUnlocked1(): Promise<string> {
  let p = new Promise<void>((resolve, reject) => {
    let lockA = new AsyncLock();
    lockA.lockAsync<void>(/*F1*/ async (): Promise<void> => {
      let lockB = new AsyncLock();
      let p = lockB.lockAsync<void>(/*F2*/ async (): Promise<void> => {
        let res = await lockA.lockAsync<number>(/*F3*/ (): number => {
          return 42
        }, AsyncLockMode.SHARED);
        if (res == 42) {
          resolve(undefined);
        } else {
          reject(new Error("Test failed. Expected 42, but was " + res));
        }
      });
    });
  });
  return check("sequentialLockUnlocked1", p);
}

// test entry point
export function sequentialLockUnlocked3(): Promise<string> {
  let p = new Promise<void>((resolve, reject) => {
    let lockA = new AsyncLock();
    lockA.lockAsync<void>(/*F1*/ async (): Promise<void> => {
      let lockB = new AsyncLock();
      lockB.lockAsync<void>(/*F2*/ async (): Promise<void> => {
        let p1 = lockA.lockAsync<number>(/*F3*/ (): number => {
          return 42
        }, AsyncLockMode.EXCLUSIVE);
        p1.then((v: number): void => {
          if (v == 42) {
            resolve(undefined);
          } else {
            reject(new Error("Expected 42, but was " + v));
          }
        }, reject);
      });
    });
  });
  return check("sequentialLockUnlocked3", p);
}

// test entry point
export function disarmTimeoutTest(): Promise<string> {
  let lock = new AsyncLock();
  hilog.info(0x0000, 'ActsConcurrencyBaseJSTest', '>lockAsync');
  let options = new AsyncLockOptions<void>();
  options.timeout = 1000;
  let p: Promise<void> = lock.lockAsync<void, void>((): void => {
    hilog.info(0x0000, 'ActsConcurrencyBaseJSTest', '>callback');
    hilog.info(0x0000, 'ActsConcurrencyBaseJSTest', '<callback');
  }, AsyncLockMode.EXCLUSIVE, options);
  hilog.info(0x0000, 'ActsConcurrencyBaseJSTest', '<lockAsync');
  return check("disarmTimeoutTest", p);
}

// test entry point
export function disarmTimeoutLongAwaitTest(): Promise<string> {
  /*
  * Create an exclusive lock and set the timeout period to 1 second.
  * In the callback function, await 5 seconds is used to verify that the
  * callback function can be properly executed and ends after 5 seconds instead of rejecting after 1 second.
  * */
  let lock = new AsyncLock();
  hilog.info(0x0000, 'ActsConcurrencyBaseJSTest', '>lockAsync');
  let options = new AsyncLockOptions<void>();
  options.timeout = 500;
  let p: Promise<void> = lock.lockAsync<void, void>(async (): Promise<void> => {
    hilog.info(0x0000, 'ActsConcurrencyBaseJSTest', '>callback');
    await new Promise<number>((res, rej) => {
      setTimeout((): void => {
        res(123);
      }, 1500);
    });
    hilog.info(0x0000, 'ActsConcurrencyBaseJSTest', '<callback');
  }, AsyncLockMode.EXCLUSIVE, options);
  hilog.info(0x0000, 'ActsConcurrencyBaseJSTest', '<lockAsync');
  return check("disarmTimeoutLongAwaitTest", p);
}


async function applyLockJob(lockName: string, mode: AsyncLockMode, tidBuf: Int32Array, tid: int): Promise<void> {
  let lock = AsyncLock.request(lockName);
  lock.lockAsync<void>(async (): Promise<void> => {
    let old = Atomics.compareExchange(tidBuf, 0, 0, tid);
    if (old != 0) {
      throw new Error("Expected 0, but was: " + old);
    }
    await new Promise<number>((resolve): void => {
      setTimeout((): void => {
        resolve(1);
      }, 100);
    });
    old = Atomics.compareExchange(tidBuf, 0, tid, 0);
    if (old != tid) {
      throw new Error("Expected old=" + tid + ", but was: " + old);
    }
  }, mode);
}

function fourThreadsApplyForSameLockImpl(mode: AsyncLockMode): Promise<Array<Any>> {
  let lockName = "fourThreadsApplyForSameLock" + (mode == AsyncLockMode.EXCLUSIVE ? "_exclusive" : "shared");
  let tidBuf = createInt();
  tidBuf[0] = 0;
  let promises = new Array<Promise<Any>>(4);
  for (let i: int = 0; i < 4; ++i) {
    promises.push(taskpool.execute(applyLockJob, lockName, mode, tidBuf, 0));
  }
  return Promise.all(promises);
}

// test entry point
export function fourThreadsApplyForSameLockExclusive(): Promise<string> {
  return check("fourThreadsApplyForSameLockExclusive", fourThreadsApplyForSameLockImpl(AsyncLockMode.EXCLUSIVE));
}

// test entry point
export function fourThreadsApplyForSameLockShared(): Promise<string> {
  return check("fourThreadsApplyForSameLockShared", fourThreadsApplyForSameLockImpl(AsyncLockMode.SHARED));
}

function acquireLockTwiceSuccess(outerMode: AsyncLockMode, innerMode: AsyncLockMode,
  isAvailable: boolean): Promise<void> {
  let lock = new AsyncLock();
  return new Promise<void>((resolve) => {
    let innerOptions = new AsyncLockOptions<void>();
    innerOptions.isAvailable = isAvailable;
    lock.lockAsync<void>((): void => {
      lock.lockAsync<void, void>((): void => {
        resolve(undefined);
      }, innerMode, innerOptions);
    }, outerMode);
  });
}

// test entry point
export function acquireLockTwiceSharedSharedAvailable(): Promise<string> {
  return check("acquireLockTwiceSharedSharedAvailable",
    acquireLockTwiceSuccess(AsyncLockMode.SHARED, AsyncLockMode.SHARED, true));
}

// test entry point
export function acquireLockTwiceSharedSharedNotAvailable(): Promise<string> {
  return check("acquireLockTwiceSharedSharedNotAvailable",
    acquireLockTwiceSuccess(AsyncLockMode.SHARED, AsyncLockMode.SHARED, false));
}

function acquireLockTwiceReject(outerMode: AsyncLockMode, innerMode: AsyncLockMode,
  isAvailable: boolean): Promise<void> {
  let lock = new AsyncLock();
  return new Promise<void>((resolve, reject) => {
    let innerOptions = new AsyncLockOptions<void>();
    innerOptions.isAvailable = isAvailable;
    lock.lockAsync<void>((): void => {
      lock.lockAsync<void, void>((): void => {
      }, innerMode, innerOptions).then((): void => {
        reject(new Error("Test failed"));
      }, (): void => {
        resolve(undefined)
      });
    }, outerMode);
  });
}

// test entry point
export function acquireLockTwiceSharedExclusiveAvailable(): Promise<string> {
  return check("acquireLockTwiceSharedExclusiveAvailable",
    acquireLockTwiceReject(AsyncLockMode.SHARED, AsyncLockMode.EXCLUSIVE, true));
}

// test entry point
export function acquireLockTwiceSharedExclusiveNotAvailable(): Promise<string> {
  return check("acquireLockTwiceSharedExclusiveNotAvailable",
    acquireLockTwiceSuccess(AsyncLockMode.SHARED, AsyncLockMode.EXCLUSIVE, false));
}

// test entry point
export function acquireLockTwiceExclusiveSharedAvailable(): Promise<string> {
  return check("acquireLockTwiceReject",
    acquireLockTwiceReject(AsyncLockMode.EXCLUSIVE, AsyncLockMode.SHARED, true));
}

// test entry point
export function acquireLockTwiceExclusiveSharedNotAvailable(): Promise<string> {
  return check("acquireLockTwiceExclusiveSharedNotAvailable",
    acquireLockTwiceSuccess(AsyncLockMode.EXCLUSIVE, AsyncLockMode.SHARED, false));
}

// test entry point
export function acquireLockTwiceExclusiveExclusiveAvailable(): Promise<string> {
  return check("acquireLockTwiceExclusiveSharedNotAvailable",
    acquireLockTwiceReject(AsyncLockMode.EXCLUSIVE, AsyncLockMode.EXCLUSIVE, true));
}

// test entry point
export function acquireLockTwiceExclusiveExclusiveNotAvailable(): Promise<string> {
  return check("acquireLockTwiceExclusiveExclusiveNotAvailable",
    acquireLockTwiceSuccess(AsyncLockMode.EXCLUSIVE, AsyncLockMode.EXCLUSIVE, false));
}


async function pressureWorker(lockName: string, timeout: int, taskBuf: Int32Array): Promise<void> {
  let lock = AsyncLock.request(lockName);
  await lock.lockAsync(async (): Promise<void> => {
    let value: Number = 0;
    let index: int = -1;
    for (let i: int = 0; i < taskBuf.length; ++i) {
      value = Atomics.load(taskBuf, i);
      if (value == 0) {
        index = i;
        break;
      }
    }
    if (index < 0) {
      // all data is processed
      console.log("ActsConcurrencyBaseJSTest: No data to process");
      return Promise.resolve();
    }
    console.log("ActsConcurrencyBaseJSTest: Process at " + index);
    await new Promise<number>((resolve): void => {
      setTimeout((): void => {
        resolve(1);
      }, timeout);
    });
    let newValue = Atomics.exchange(taskBuf, index, 1);
    if (value != newValue) {
      throw new Error("Value is changed after timeout");
    }
  });
}

// test entry point
export function pressureTest(): Promise<string> {
  let sab = new ArrayBuffer(4 * 100);
  let taskBuf = new Int32Array(sab);
  for (let i = 0; i < taskBuf.length; ++i) {
    taskBuf[i] = 0;
  }
  let lockName = "pressureLock";
  let promises = new Array<Promise<Any>>(100);
  for (let i = 0; i < taskBuf.length; ++i) {
    let timeout = i % 10;
    let p = taskpool.execute(pressureWorker, lockName, timeout, taskBuf) as Promise<Any>;
    promises[i] = p;
  }
  return check("pressureTest", Promise.all(promises));
}


async function timeoutLockWithEnvDestroyedTest(lockName: string): Promise<void> {
  let lock = AsyncLock.request(lockName);
  let options = new AsyncLockOptions<void>();
  options.timeout = 100;
  await new Promise<Object>((resolve, reject) => {
    lock.lockAsync(() => {
    }, AsyncLockMode.SHARED, options).then(() => {
      reject(Error('Should not be executed, current lock is not available'))
    }).catch((): void => {
      resolve(new Object())
    })
  })
}

async function exclusiveMultiWorkerJob(lockName: string, timeout: number,
  tidBuf: Int32Array, tid: number): Promise<void> {
  let lock = AsyncLock.request(lockName);
  return lock.lockAsync<void>(async () => {
    let old = Atomics.compareExchange(tidBuf, 0, 0, tid.toInt());
    if (old != 0) {
      throw new Error('Expected 0, but was: ' + old);
    }
    await Promise.resolve(1);
    old = Atomics.compareExchange(tidBuf, 0, tid.toInt(), 0);
    if (old != tid) {
      throw new Error('Expected old=' + tid + ', but was: ' + old);
    }
  }, AsyncLockMode.EXCLUSIVE);
}

async function sharedMultiWorkerJob(lockName: string, timeout: number, flagBuf: Int32Array, idx: number) {
  let lock = AsyncLock.request(lockName);
  await lock.lockAsync<void>(async () => {
    flagBuf[idx.toInt()] = 1;
    await Promise.resolve(1);
    let prevSet = true;
    for (let i = 0; i < idx; ++i) {
      if (!flagBuf[i]) {
        prevSet = false;
      }
    }
    if (!prevSet) {
      throw new Error('Expected callback overlap');
    }
    flagBuf[idx.toInt()] = 0;
  }, AsyncLockMode.SHARED);
}

async function twoThreadedDeadlockT2(lockNameL1: string, lockNameL2: string, flagBuf: Int32Array) {
  let L2 = AsyncLock.request(lockNameL2);
  L2.lockAsync<void>(async () => { // F2
    hilog.info(0x00000, 'Worker:twoThreadedDeadlockT2', '>T2 F2');
    hilog.info(0x00000, 'Worker:twoThreadedDeadlockT2', '0->1');
    Atomics.compareExchange(flagBuf, 0, 0, 1);

    let L1 = AsyncLock.request(lockNameL1);
    await L1.lockAsync<void>(() => {

    }, AsyncLockMode.EXCLUSIVE);
  }, AsyncLockMode.EXCLUSIVE);
}

async function lockHolderWorkerJob(lockName: string, timeout: number, flagBuf: Int32Array): Promise<void> {
  let lock = AsyncLock.request(lockName);
  lock.lockAsync<void>(async () => {
    hilog.info(0x00000, 'Worker:lockHolderWorkerJob', '0->1');
    Atomics.compareExchange(flagBuf, 0, 0, 1);
    hilog.info(0x00000, 'Worker:lockHolderWorkerJob', '>timeout');
    await Promise.resolve(1);
    hilog.info(0x00000, 'Worker:lockHolderWorkerJob', '<timeout');
  }, AsyncLockMode.EXCLUSIVE);
}

async function workersetDelayRequestAndCloseWorkerInstantlyTest(lockName: string, timeout: number): Promise<void> {
  let lock = AsyncLock.request(lockName);
  lock.lockAsync<void>(async () => {
    await Promise.resolve(1);
    throw new Error('The current request should not be called because worker close instantly after request is created');
  }, AsyncLockMode.EXCLUSIVE);

}
// test entry point
export async function setDelayRequestAndCloseWorkerInstantlyTest(): Promise<string> {
  let worker = new EAWorker()
  let lockName = 'setDelayRequestAndCloseWorkerInstantlyTest';
  let lock = AsyncLock.request(lockName);
  let p = new Promise<void>((resolve, reject) => {
    let data: lockType = { test: lockName, lockName: lockName, timeout: 3000 }
    worker.start()
    let job = worker.run<string>((): string => {
      let flag = ""
      let result: Promise<void> | null = null;
      result = workersetDelayRequestAndCloseWorkerInstantlyTest(data.lockName, data.timeout);
      await result.then(():void => {
        hilog.info(0x00000, "zcq ", "worker pass");
        flag = 'PASSED'
      }, (e: Error):void => {
        hilog.info(0x00000, "zcq ", "worker fail" + e.message);
        flag = 'FAILED: ' + e.message
      });
      return flag
    })
    let workerresult: string = job.Await()
    if (workerresult === 'PASSED') {
      worker.join()
      resolve(undefined);
    } else {
      reject(Error(workerresult));
    }
  });
  // p0 use the same lock with worker thread, if p0 resolved, means lock request created in worker thread is skipped as expected
  let p0 = lock.lockAsync(async (): Promise<void> => {
    await new Promise<void>(resolve => {
      setTimeout(() => {
        resolve(undefined)
      }, 3000)
    });
  });
  return check('setDelayRequestAndCloseWorkerInstantlyTest', Promise.all([p, p0]));
}
function promiseLockAsync(): Promise<Promise<void>> {
  let lock = new AsyncLock;
  return lock.lockAsync(async (): Promise<void> => {
    await new Promise<number>((resolve): void => {
      setTimeout((): void => {
        resolve(1);
      }, 100);
    });
  })
}

declare class ArkTools {
  static forceFullGC(): void
}

// test entry point
export async function gcAfterLockAsyncTest(): Promise<string> {
  let p = promiseLockAsync();
  ;
  return check('gcAfterLockAsyncTest', p);
}

async function mainExecutor(index: number, flagBuf: Int32Array, timeout: int): Promise<void> {
  let lockName = 'doubleExitSharedLockTest';
  let lock = AsyncLock.request(lockName);
  await lock.lockAsync(async (): Promise<void> => {
    flagBuf[index.toInt()] = 1;
    if (flagBuf[2] != 0) {
      throw new Error('Unexpected set flag at index 2');
    }
    await Promise.resolve(1);
    flagBuf[index.toInt()] = 0;
  }, AsyncLockMode.SHARED);
}


async function taskExecutor(flagBuf: Int32Array, timeout: int): Promise<void> {
  let lockName = 'doubleExitSharedLockTest';
  let lock = AsyncLock.request(lockName);
  await lock.lockAsync(async (): Promise<void> => {
    flagBuf[2] = 1;
    if (flagBuf[0] != 0) {
      throw new Error('Unexpected set flag at index 0');
    }
    if (flagBuf[1] != 0) {
      throw new Error('Unexpected set flag at index 1');
    }
    await Promise.resolve(1);
    flagBuf[2] = 0;
  }, AsyncLockMode.EXCLUSIVE);
}

// test entry point
export function doubleExitSharedLockTest(): Promise<string> {
  let sab = new ArrayBuffer(3 * 4);
  let flagBuf = new Int32Array(sab);
  for (let i = 0; i < flagBuf.length; ++i) {
    flagBuf[i] = 0;
  }
  return check('doubleExitSharedLockTest', Promise.all([
    mainExecutor(0, flagBuf, 500),
    mainExecutor(1, flagBuf, 300),
    taskpool.execute(taskExecutor, flagBuf, 100),
  ]));
}

// test entry point
// export function timeoutLockWithEnvDestroyedTest() {
//   let workerInstance: worker.ThreadWorker = new worker.ThreadWorker('entry/ets/workers/worker.ets');
//   let lockName = 'timeoutLockWithEnvDestroyedTest';
//   let lock = AsyncLock.request(lockName);
//   let p = lock.lockAsync(async (): Promise<void> => {
//     await new Promise<void>(resolve => setTimeout(resolve, 2000));
//   });
//   let p0 = new Promise<void>((resolve, reject) => {
//     workerInstance.postMessage({ test: lockName, lockName: lockName });
//     workerInstance.onmessage = (e: MessageEvents) => {
//       if (e.data === 'PASSED') {
//         workerInstance.terminate();
//         resolve(1);
//       } else {
//         reject(e.data);
//       }
//     };
//   });
//   return check(lockName, Promise.all([p, p0]));
// }

function lockAsyncPromise(mode?: AsyncLockMode): Promise<Promise<void>> {
  if (mode == undefined) {
    mode = AsyncLockMode.EXCLUSIVE
  }
  let lock = AsyncLock.request('lock');
  return lock.lockAsync(async (): Promise<void> => {
    await new Promise<number>((resolve): void => {
      setTimeout((): void => {
        resolve(1);
      }, 1000);
    });
    console.log('lzl done')
  }, mode)
}

// test entry point
export async function pendingSharedRequestAfterGC(): Promise<string> {
  let p: Promise<Promise<void>> = lockAsyncPromise(AsyncLockMode.SHARED);
  let p0: Promise<Promise<void>> = lockAsyncPromise(AsyncLockMode.SHARED);
  return check('pendingSharedRequestAfterGC', Promise.all([p, p0]));
}

