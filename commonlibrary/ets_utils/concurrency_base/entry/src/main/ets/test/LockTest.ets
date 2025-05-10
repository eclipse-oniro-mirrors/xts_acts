/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import worker, { MessageEvents } from '@ohos.worker';
import taskpool from '@ohos.taskpool';
import utils  from '@arkts.utils';
import { check, check_negative } from './utils';

let globalWorker: worker.ThreadWorker = new worker.ThreadWorker("entry/ets/workers/worker.ets");;

// TESTS IMPLEMENTATION //

function createInt(): Uint32Array {
  let sab = new SharedArrayBuffer(4);
  return new Uint32Array(sab);
}

function exchange(buf: Uint32Array, oldVal: number, newVal: number) {
  if (buf[0] != oldVal) {
    throw new Error("Test failed: expected " + oldVal + ", but got " + buf[0]);
  }
  buf[0] = newVal;
}

// test entry point
export function exclusiveSingleTest() {
  let flagBuf = createInt();
  flagBuf[0] = 0;
  let lock = new utils.locks.AsyncLock();

  let p1 = lock.lockAsync<void>(async () => {
    exchange(flagBuf, 0, 1);
    await Promise.resolve();
    exchange(flagBuf, 1, 0);
  }, utils.locks.AsyncLockMode.EXCLUSIVE);
  let p2 = lock.lockAsync<void>(async () => {
    exchange(flagBuf, 0, 2);
    await Promise.resolve();
    exchange(flagBuf, 2, 0);
  }, utils.locks.AsyncLockMode.EXCLUSIVE);
  return check("exclusiveSingleTest", Promise.all([p1, p2]));
}

// Code of this function must be the same as in Worker.ets
@Concurrent
async function exclusiveMultiJob(lockName: string, timeout: number, tidBuf: Uint32Array, tid: number): Promise<void> {
  let lock = utils.locks.AsyncLock.request(lockName);
  lock.lockAsync<void>(async () => {
    let old = Atomics.compareExchange(tidBuf, 0, 0, tid);
    if (old != 0) {
      throw new Error("Expected 0, but was: " + old);
    }
    await new Promise<void>(resolve => setTimeout(resolve, timeout));
    old = Atomics.compareExchange(tidBuf, 0, tid, 0);
    if (old != tid) {
      throw new Error("Expected old=" + tid + ", but was: " + old);
    }
  }, utils.locks.AsyncLockMode.EXCLUSIVE);
}

// test entry point
export function exclusiveMultiTest() {
  let lockName = "exclusiveMultiLock";
  let tidBuf = createInt();
  tidBuf[0] = 0;
  let p1: Promise<Object> = taskpool.execute(exclusiveMultiJob, lockName, 100, tidBuf, 2) as Promise<Object>;
  let p2 = exclusiveMultiJob(lockName, 100, tidBuf, 1);
  return check("exclusiveMultiTest", Promise.all([p1, p2]));
}

// test entry point
export function exclusiveMultiWorkerTest() {
  let lockName = "exclusiveMultiWorkerLock";
  let tidBuf = createInt();
  tidBuf[0] = 0;

  let p1 = new Promise<void>((resolve, reject) => {
    globalWorker.postMessage({test: "exclusiveMultiWorkerTest", lockName: lockName, timeout: 100, tidBuf: tidBuf, tid: 2});
    globalWorker.onmessage = (e: MessageEvents) => {
      if (e.data === "PASSED") {
        resolve();
      } else {
        reject(e.data);
      }
    }
  });
  let p2 = exclusiveMultiJob(lockName, 100, tidBuf, 1);
  return check("exclusiveMultiWorkerTest", Promise.all([p1, p2]));
}

// test entry point
export function sharedSingleTest() {
  let flagBuf = createInt();
  flagBuf[0] = 0;
  let lock = new utils.locks.AsyncLock();

  let p = lock.lockAsync<void>(async () => {
    exchange(flagBuf, 0, 1);
    await Promise.resolve();
    await lock.lockAsync<void>(async () => {
      exchange(flagBuf, 1 ,2);
    }, utils.locks.AsyncLockMode.SHARED);
    exchange(flagBuf, 2, 0);
  }, utils.locks.AsyncLockMode.SHARED);
  return check("sharedSingleTest", p);
}

// Code of this function must be the same as in Worker.ets
@Concurrent
async function sharedMultiJob(lockName: string, timeout: number, flagBuf: Uint32Array, idx: number) {
  let lock = utils.locks.AsyncLock.request(lockName);
  await lock.lockAsync<void>(async () => {
    flagBuf[idx] = 1;
    await new Promise<void>(resolve => setTimeout(resolve, timeout));
    let prevSet = true;
    for (let i = 0; i < idx; ++i) {
      if (!flagBuf[i]) {
        prevSet = false;
      }
    }
    if (!prevSet) {
      throw new Error("Expected callback overlap");
    }
    flagBuf[idx] = 0;
  }, utils.locks.AsyncLockMode.SHARED);
}

// test entry point
export function sharedMultiTest() {
  let lockName = "sharedMultiLock";
  let sab = new SharedArrayBuffer(2 * 4);
  let flagBuf = new Uint32Array(sab);
  flagBuf[0] = 0;
  flagBuf[1] = 0;
  let p1 = sharedMultiJob(lockName, 200, flagBuf, 0);
  let p2: Promise<Object> = taskpool.execute(sharedMultiJob, lockName, 100, flagBuf, 1) as Promise<Object>;
  return check("sharedMultiTest", Promise.all([p1, p2]));
}

// test entry point
export function sharedMultiWorkerTest() {
  let lockName = "sharedMultiWorkerLock";
  let sab = new SharedArrayBuffer(2 * 4);
  let flagBuf = new Uint32Array(sab);
  flagBuf[0] = 0;
  flagBuf[1] = 0;

  let p1 = sharedMultiJob(lockName, 200, flagBuf, 0);
  let p2 = new Promise<void>((resolve, reject) => {
    globalWorker.postMessage({test: "sharedMultiWorkerTest", lockName: lockName, timeout: 100, tidBuf: flagBuf, tid: 1});
    globalWorker.onmessage = (e: MessageEvents) => {
      if (e.data === "PASSED") {
        resolve();
      } else {
        reject(e.data);
      }
    }
  });
  return check("sharedMultiWorkerTest", Promise.all([p1, p2]));
}

@Concurrent
export function isAvailableTrueJob(lockName: string) {
  let lock = utils.locks.AsyncLock.request(lockName);
  let options = new utils.locks.AsyncLockOptions<void>();
  options.isAvailable = true;
  let p: Promise<void> = lock.lockAsync(() => {}, utils.locks.AsyncLockMode.EXCLUSIVE, options);
  p.then(() => {
    hilog.info(0x0000, 'ActsConcurrencyBaseJSTest', 'Test failed: the lock is acquired');
  });
  p.catch( () => {
    hilog.info(0x0000, 'ActsConcurrencyBaseJSTest', 'Test passed');
  });
}

// test entry point
export function isAvailableTest() {
  let lockName = "isAvailableLock";
  let lock = utils.locks.AsyncLock.request(lockName);
  lock.lockAsync<void>(async () => {
    await new Promise<void>(resolve => setTimeout(resolve, 1000));
  });
  let p = taskpool.execute(isAvailableTrueJob, lockName) as Promise<object>;
  return check("isAvailableTest", p);
}

@Concurrent
function isAvailableFalseJob(lockName: string) {
  let lock = utils.locks.AsyncLock.request(lockName);
  let options = new utils.locks.AsyncLockOptions<void>();
  options.isAvailable = false;
  let p: Promise<void> = lock.lockAsync(() => {}, utils.locks.AsyncLockMode.EXCLUSIVE, options);
  p.then(() => {
    hilog.info(0x0000, 'ActsConcurrencyBaseJSTest', 'Test passed');
  });
  p.catch( () => {
    hilog.info(0x0000, 'ActsConcurrencyBaseJSTest', 'Test failed: the lock is acquired');
  });
}

// test entry point
export function isNotAvailableTest() {
  let lockName = "isNotAvailableLock";
  let lock = utils.locks.AsyncLock.request(lockName);
  lock.lockAsync<void>(async () => {
    await new Promise<void>(resolve => setTimeout(resolve, 1000));
  });
  let p = taskpool.execute(isAvailableFalseJob, lockName) as Promise<object>;
  return check("isNotAvailableTest", p);
}

// test entry point
export function queryTest() {
  let lockName = "queryTestLock"
  let lock = utils.locks.AsyncLock.request(lockName);
  let state = utils.locks.AsyncLock.query(lock.name);
  if (!state) {
    throw new Error('Test failed: expected a valid state, but was ' + state);
  }

  let p = lock.lockAsync<void>(async () => {
    let states: utils.locks.AsyncLockState[] = utils.locks.AsyncLock.queryAll();
    if (states.length == 0) {
      throw new Error('Test failed: expected at least 1 state, but was ' + states.length);
    }
    let state = utils.locks.AsyncLock.query(lock.name);
    let pending: utils.locks.AsyncLockInfo[] = state.pending;
    if (pending.length != 0) {
      throw new Error('Test failed: expected pending.length=0, but was ' + pending.length);
    }
    let held: utils.locks.AsyncLockInfo[] = state.held;
    if (held.length != 1) {
      throw new Error('Test failed: expected held.length=1, but was ' + held.length);
    }
    if (held[0].name !== lockName) {
      throw new Error('Test failed: expected held[0].name=' + lockName + ', but was ' + held[0].name);
    }
    if (held[0].mode !== utils.locks.AsyncLockMode.EXCLUSIVE) {
      throw new Error('Test failed: expected held[0].mode=EXCLUSIVE, but was ' + held[0].mode);
    }
  }, utils.locks.AsyncLockMode.EXCLUSIVE);
  return check("queryTest", p);
}

// test entry point
export function abortTest() {
  let lock = new utils.locks.AsyncLock();
  let s: utils.locks.AbortSignal<string> = {aborted: false, reason: "Aborted"};
  let options = new utils.locks.AsyncLockOptions<string>();
  options.isAvailable = false;
  options.signal = s;
  let p: Promise<number|string> = lock.lockAsync<number, string>(() => {
    hilog.info(0x0000, 'ActsConcurrencyBaseJSTest', 'Test failed');
    return 5;
  }, utils.locks.AsyncLockMode.EXCLUSIVE, options);
  s.aborted = true;
  let p1 = p.then(
    () => {
      throw new Error('Test failed. Promise is fulfilled.')
    },
    (err: string) => {
      if (err !== "Aborted") {
        throw new Error('Test failed. Wrong error value.');
      }
  });
  return check("abortTest", p1);
}

// test entry point
export function deadlockTest() {
  let lock = new utils.locks.AsyncLock();
  let options = new utils.locks.AsyncLockOptions<string>();
  options.timeout = 1000;
  let p: Promise<number|string> = lock.lockAsync<number, string>(async () => {
    let options = new utils.locks.AsyncLockOptions<string>();
    options.timeout = 1000;
    await lock.lockAsync(() => {
      throw new Error('Test failed: inner lock acquired.');
    }, utils.locks.AsyncLockMode.EXCLUSIVE, options);
    return 0;
  }, utils.locks.AsyncLockMode.EXCLUSIVE, options);
  return check_negative("deadlockTest", p);
}

// test entry point
export function nestedDeadlockTest() {
  let options = new utils.locks.AsyncLockOptions<void>();
  options.timeout = 1000;

  let lockA = new utils.locks.AsyncLock();
  let p = lockA.lockAsync<void, void>(async () => {
    let lockB = new utils.locks.AsyncLock();
    await lockB.lockAsync<void, void>(async () => {
      await lockA.lockAsync<void,void>(() => {
        throw new Error('Test failed: acquired the inner lock A.');
      }, utils.locks.AsyncLockMode.EXCLUSIVE, options);
    }, utils.locks.AsyncLockMode.EXCLUSIVE, options);
  }, utils.locks.AsyncLockMode.EXCLUSIVE, options);
  return check_negative("nestedDeadlockTest", p);
}

@Concurrent
function twoThreadedDeadlockT2(lockNameL1: string, lockNameL2: string, flagBuf: Uint32Array) {
  let L2 = utils.locks.AsyncLock.request(lockNameL2);
  L2.lockAsync<void>(async () => { // F2
    hilog.info(0x0000, 'ActsConcurrencyBaseJSTest', '>T2 F2');
    hilog.info(0x0000, 'ActsConcurrencyBaseJSTest', '0->1');
    Atomics.compareExchange(flagBuf, 0, 0, 1);
    // now lock the second lock
    let L1 = utils.locks.AsyncLock.request(lockNameL1);
    await L1.lockAsync<void>(() => {
      // deadlock should happen, then T1 timeout exceeds and locks will unlock
    }, utils.locks.AsyncLockMode.EXCLUSIVE);
    hilog.info(0x0000, 'ActsConcurrencyBaseJSTest', '<T2 F2');
  }, utils.locks.AsyncLockMode.EXCLUSIVE);
}

// test entry point
export function twoThreadedDeadlockTest() {
  hilog.info(0x0000, 'ActsConcurrencyBaseJSTest', '>twoThreadedDeadlockTest');
  let lockNameL1 = "twoThreadedDeadlockTestL1";
  let lockNameL2 = "twoThreadedDeadlockTestL2";
  let options = new utils.locks.AsyncLockOptions<void>();
  options.timeout = 1000;
  let flagBuf = createInt();
  flagBuf[0] = 0;

  let p = new Promise<void>((resolve, reject) => {
    let L1 = utils.locks.AsyncLock.request(lockNameL1);
    L1.lockAsync<void>(async () => { // F1
      hilog.info(0x0000, 'ActsConcurrencyBaseJSTest', '>T1 F1');
      // spawn T2
      taskpool.execute(twoThreadedDeadlockT2, lockNameL1, lockNameL2, flagBuf);
      // busy loop: wait until T2 acquires L2
      hilog.info(0x0000, 'ActsConcurrencyBaseJSTest', '>bloop');
      while (Atomics.load(flagBuf, 0) != 1) {
      }
      hilog.info(0x0000, 'ActsConcurrencyBaseJSTest', '<bloop');
      // try to lock L2 for the deadlock
      let L2 = utils.locks.AsyncLock.request(lockNameL2);
      await L2.lockAsync<void, void>(() => {
        resolve();
      }, utils.locks.AsyncLockMode.EXCLUSIVE, options);
      hilog.info(0x0000, 'ActsConcurrencyBaseJSTest', '<T1 F1');
    }, utils.locks.AsyncLockMode.EXCLUSIVE).then((v) => {
      resolve(v);
    }).catch((e: Error) =>{
      reject(e);
    });
  });
  hilog.info(0x0000, 'ActsConcurrencyBaseJSTest', '<twoThreadedDeadlockTest');
  return check_negative("twoThreadedDeadlockTest", p);
}

// test entry point
export function twoThreadedDeadlockWorkerTest() {
  hilog.info(0x0000, 'ActsConcurrencyBaseJSTest', '>twoThreadedDeadlockWorkerTest');
  let lockNameL1 = "twoThreadedDeadlockWorkerLockL1";
  let lockNameL2 = "twoThreadedDeadlockWorkerLockL2";
  let options = new utils.locks.AsyncLockOptions<void>();
  options.timeout = 1000;
  let flagBuf = createInt();
  flagBuf[0] = 0;

  let p = new Promise<void>((resolve, reject) => {
    let L1 = utils.locks.AsyncLock.request(lockNameL1);
    return L1.lockAsync<void>(async () => { // F1
      hilog.info(0x0000, 'ActsConcurrencyBaseJSTest', '>T1 F1');
      // spawn T2
      globalWorker.postMessage({test: "twoThreadedDeadlockWorkerTest", lockNameL1: lockNameL1, lockNameL2: lockNameL2,
        flagBuf: flagBuf});
      // busy loop: wait until T2 acquires L2
      hilog.info(0x0000, 'ActsConcurrencyBaseJSTest', '>bloop');
      while (Atomics.load(flagBuf, 0) != 1) {
      }
      hilog.info(0x0000, 'ActsConcurrencyBaseJSTest', '<bloop');
      // try to lock L2 for the deadlock
      let L2 = utils.locks.AsyncLock.request(lockNameL2);
      await L2.lockAsync<void, void>(() => {
        resolve();
      }, utils.locks.AsyncLockMode.EXCLUSIVE, options);
      hilog.info(0x0000, 'ActsConcurrencyBaseJSTest', '<T1 F1');
    }, utils.locks.AsyncLockMode.EXCLUSIVE).then((v) => {
      resolve(v);
    }).catch((e: Error) =>{
      reject(e);
    });
  });
  hilog.info(0x0000, 'ActsConcurrencyBaseJSTest', '<twoThreadedDeadlockWorkerTest');
  return check_negative("twoThreadedDeadlockWorkerTest", p);
}

// test entry point
export function twoLocksSingleTest() {
  let flagBuf = createInt();
  flagBuf[0] = 0;
  let lock1 = new utils.locks.AsyncLock();
  let lock2 = new utils.locks.AsyncLock();

  let p1 = lock1.lockAsync<void>(async () => {
    exchange(flagBuf, 0, 1);
    await Promise.resolve();
    exchange(flagBuf, 1, 0);
  }, utils.locks.AsyncLockMode.EXCLUSIVE);
  let p2 = lock2.lockAsync<void>(async () => {
    exchange(flagBuf, 0, 2);
    await Promise.resolve();
    exchange(flagBuf, 2, 0);
  }, utils.locks.AsyncLockMode.EXCLUSIVE);
  return check("twoLocksSingleTest", Promise.all([p1, p2]));
}

@Concurrent
async function exclusiveLockAcquireJob(): Promise<void> {
  let lock = new utils.locks.AsyncLock();
  lock.lockAsync<void>(async () => {
  }, utils.locks.AsyncLockMode.EXCLUSIVE);
}

// test entry point
export function twoThreadsAcquireOwnLocks() {
  let p1: Promise<Object> = taskpool.execute(exclusiveLockAcquireJob) as Promise<Object>;
  let p2: Promise<Object> = taskpool.execute(exclusiveLockAcquireJob) as Promise<Object>;
  return check("twoThreadsAcquireOwnLocks", Promise.all([p1, p2]));
}

@Concurrent
async function lockJob(lockName: string, flagBuf: Uint32Array): Promise<void> {
  let lock = utils.locks.AsyncLock.request(lockName);
  lock.lockAsync<void>(async () => {
    Atomics.compareExchange(flagBuf, 0, 0, 1);
    await new Promise<void>(resolve => setTimeout(resolve, 100));
    Atomics.compareExchange(flagBuf, 0, 1, 0);
  }, utils.locks.AsyncLockMode.SHARED);
}

// test entry point
export async function multipleWakeupTest() {
  let lockName = "multipleWakeupLock";
  let flagBuf = createInt();
  flagBuf[0] = 0;
  let p: Promise<Object> = taskpool.execute(lockJob, lockName, flagBuf) as Promise<Object>;
  // busy loop
  while (Atomics.load(flagBuf, 0) == 0) {
  }
  let count = 10;
  let promises: Promise<void>[] = new Array<Promise<void>>(count);
  let lock = utils.locks.AsyncLock.request(lockName);
  for (let i = 0; i < count; ++i) {
    promises[i] = lock.lockAsync<void>(async () => {
    }, utils.locks.AsyncLockMode.SHARED);
  }
  await p;
  return check("multipleWakeupTest", Promise.all(promises));
}

async function waitForLockBody() {
  let flagBuf = createInt();
  flagBuf[0] = 0;
  let lock = new utils.locks.AsyncLock();

  await lock.lockAsync<void>(async () => {
    exchange(flagBuf, 0, 1);
  }, utils.locks.AsyncLockMode.EXCLUSIVE);
  if (flagBuf[0] != 1) {
    throw new Error("Test failed: expected value 1, but was " + flagBuf[0]);
  }
  hilog.info(0x0000, 'ActsConcurrencyBaseJSTest', 'Test passed');
}

// test entry point
export function waitForLock() {
  return check("waitForLock", waitForLockBody());
}

// test entry point
export function dontWaitForLock() {
  let flagBuf = createInt();
  flagBuf[0] = 0;
  let lock = new utils.locks.AsyncLock();
  let p = lock.lockAsync<void>(async () => {
    exchange(flagBuf, 0, 1)
  }, utils.locks.AsyncLockMode.EXCLUSIVE);
  if (flagBuf[0] != 0) {
    throw new Error("Test failed: expected value 0, but was " + flagBuf[0]);
  }
  return check("dontWaitForLock", p);
}

// test entry point
export function queryWithDeadlockTest() {
  let options = new utils.locks.AsyncLockOptions<string>();
  options.timeout = 1000;
  let lock = new utils.locks.AsyncLock();
  let p = lock.lockAsync<void>(async () => {
    await lock.lockAsync(() => {
    }, utils.locks.AsyncLockMode.EXCLUSIVE, options);
  }, utils.locks.AsyncLockMode.EXCLUSIVE);

  setTimeout(() => {
    let states: utils.locks.AsyncLockState[] = utils.locks.AsyncLock.queryAll();
    hilog.info(0x0000, 'ActsConcurrencyBaseJSTest', 'states.length = ' + states.length);
  }, 100);

  return check_negative("queryWithDeadlockTest", p);
}

@Concurrent
async function lockHolderJob(lockName: string, timeout: number, flagBuf: Uint32Array): Promise<void> {
  let lock = utils.locks.AsyncLock.request(lockName);
  lock.lockAsync<void>(async () => {
    hilog.info(0x0000, 'ActsConcurrencyBaseJSTest', '0->1');
    Atomics.compareExchange(flagBuf, 0, 0, 1);
    hilog.info(0x0000, 'ActsConcurrencyBaseJSTest', '>timeout');
    await new Promise<void>(resolve => setTimeout(resolve, timeout));
    hilog.info(0x0000, 'ActsConcurrencyBaseJSTest', '<timeout');
  }, utils.locks.AsyncLockMode.EXCLUSIVE);
}

// test entry point
export function sequentialLock() {
  let lockNameB = "sequentialLockB";
  let flagBuf = createInt();
  flagBuf[0] = 0;
  taskpool.execute(lockHolderJob, lockNameB, 100, flagBuf);
  let p = new Promise<void>((resolve, reject) => {
    let lockA = new utils.locks.AsyncLock();
    lockA.lockAsync(() => {
      // busy loop
      hilog.info(0x0000, 'ActsConcurrencyBaseJSTest', '>bloop');
      while (Atomics.load(flagBuf, 0) != 1) {
      }
      hilog.info(0x0000, 'ActsConcurrencyBaseJSTest', '<bloop');
      let lockB = utils.locks.AsyncLock.request(lockNameB);
      lockB.lockAsync(() => {
        let old = Atomics.load(flagBuf, 0);
        if (old == 2) {
          resolve();
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

// test entry point
export function sequentialLockWorkerTest() {
  let lockNameB = "sequentialLockWorkerB";
  let flagBuf = createInt();
  flagBuf[0] = 0;
  let p1 = new Promise<void>((resolve) => {
    globalWorker.postMessage({ test: "sequentialLockWorkerTest", lockName: lockNameB, timeout: 100, flagBuf: flagBuf });
    globalWorker.onmessage = () => {
      resolve();
    }
  });
  let p = new Promise<void>((resolve, reject) => {
    let lockA = new utils.locks.AsyncLock();
    lockA.lockAsync(() => {
      // busy loop
      hilog.info(0x0000, 'ActsConcurrencyBaseJSTest', '>bloop');
      while (Atomics.load(flagBuf, 0) != 1) {
      }
      hilog.info(0x0000, 'ActsConcurrencyBaseJSTest', '<bloop');
      let lockB = utils.locks.AsyncLock.request(lockNameB);
      lockB.lockAsync(() => {
        let old = Atomics.load(flagBuf, 0);
        if (old == 2) {
          resolve();
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
export function sequentialLockInf() {
  let lockNameB = "sequentialLockInfB";
  let flagBuf = createInt();
  flagBuf[0] = 0;
  taskpool.execute(lockHolderJob, lockNameB, 1000, flagBuf);
  let p = new Promise<void>((resolve, reject) => {
    let lockA = new utils.locks.AsyncLock();
    lockA.lockAsync(() => {
      // busy loop
      while (Atomics.load(flagBuf, 0) != 1) {
      }
      let lockB = utils.locks.AsyncLock.request(lockNameB);
      lockB.lockAsync(() => {
        let old = Atomics.compareExchange(flagBuf, 0, 2, 3);
        if (old != 2) {
          reject(new Error("Expected 2, but was: " + old));
        }
      });
      let old = Atomics.compareExchange(flagBuf, 0, 1, 2);
      if (old == 1) {
        resolve();
      } else {
        reject(new Error("Expected 1, but was: " + old));
      }
    });
  });
  return check("sequentialLockInf", p);
}

// test entry point
export function sequentialLockUnlocked() {
  let flagBuf = createInt();
  flagBuf[0] = 0;
  let lockA = new utils.locks.AsyncLock();
  let p = lockA.lockAsync<void>(async () => {
    exchange(flagBuf, 0, 1);
    let lockB = new utils.locks.AsyncLock();
    await lockB.lockAsync(() => {
      exchange(flagBuf, 1, 2);
    });
    exchange(flagBuf, 2, 3);
  });
  return check("sequentialLockUnlocked", p);
}

// test entry point
export function sequentialLockUnlocked1() {
  let p = new Promise<void>((resolve, reject) => {
    let lockA = new utils.locks.AsyncLock();
    lockA.lockAsync<void>(/*F1*/ async () => {
      let lockB = new utils.locks.AsyncLock();
      let p = lockB.lockAsync<void>(/*F2*/ async () => {
        let res = await lockA.lockAsync<number>(/*F3*/ () => {
          return 42
        }, utils.locks.AsyncLockMode.SHARED);
        if (res == 42) {
          resolve();
        } else {
          reject(new Error("Test failed. Expected 42, but was " + res));
        }
      });
    });
  });
  return check("sequentialLockUnlocked1", p);
}

// test entry point
export function sequentialLockUnlocked3() {
  let p = new Promise<void>((resolve, reject) => {
    let lockA = new utils.locks.AsyncLock();
    lockA.lockAsync<void>(/*F1*/ async () => {
      let lockB = new utils.locks.AsyncLock();
      lockB.lockAsync<void>(/*F2*/ async () => {
        let p1 = lockA.lockAsync<number>(/*F3*/ () => {
          return 42
        }, utils.locks.AsyncLockMode.EXCLUSIVE);
        p1.then((v: number|void) => {
          if (v == 42) {
            resolve();
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
export function disarmTimeoutTest() {
  let lock = new utils.locks.AsyncLock();
  hilog.info(0x0000, 'ActsConcurrencyBaseJSTest', '>lockAsync');
  let options = new utils.locks.AsyncLockOptions<void>();
  options.timeout = 1000;
  let p: Promise<void> = lock.lockAsync<void, void>(() => {
    hilog.info(0x0000, 'ActsConcurrencyBaseJSTest', '>callback');
    hilog.info(0x0000, 'ActsConcurrencyBaseJSTest', '<callback');
  }, utils.locks.AsyncLockMode.EXCLUSIVE, options);
  hilog.info(0x0000, 'ActsConcurrencyBaseJSTest', '<lockAsync');
  return check("disarmTimeoutTest", p);
}

// test entry point
export function disarmTimeoutLongAwaitTest() {
  /*
  * Create an exclusive lock and set the timeout period to 1 second.
  * In the callback function, await 5 seconds is used to verify that the
  * callback function can be properly executed and ends after 5 seconds instead of rejecting after 1 second.
  * */
  let lock = new utils.locks.AsyncLock();
  hilog.info(0x0000, 'ActsConcurrencyBaseJSTest', '>lockAsync');
  let options = new utils.locks.AsyncLockOptions<void>();
  options.timeout = 500;
  let p: Promise<void> = lock.lockAsync<void, void>(async () => {
    hilog.info(0x0000, 'ActsConcurrencyBaseJSTest', '>callback');
    await new Promise<number>((res, rej) => {
      setTimeout(() => {
        res(123);
      }, 1500);
    });
    hilog.info(0x0000, 'ActsConcurrencyBaseJSTest', '<callback');
  }, utils.locks.AsyncLockMode.EXCLUSIVE, options);
  hilog.info(0x0000, 'ActsConcurrencyBaseJSTest', '<lockAsync');
  return check("disarmTimeoutLongAwaitTest", p);
}

@Concurrent
async function applyLockJob(lockName: string, mode: utils.locks.AsyncLockMode, tidBuf: Uint32Array, tid: number): Promise<void> {
  let lock = utils.locks.AsyncLock.request(lockName);
  lock.lockAsync<void>(async () => {
    let old = Atomics.compareExchange(tidBuf, 0, 0, tid);
    if (old != 0) {
      throw new Error("Expected 0, but was: " + old);
    }
    await new Promise<void>(resolve => setTimeout(resolve, 100));
    old = Atomics.compareExchange(tidBuf, 0, tid, 0);
    if (old != tid) {
      throw new Error("Expected old=" + tid + ", but was: " + old);
    }
  }, mode);
}

function fourThreadsApplyForSameLockImpl(mode: utils.locks.AsyncLockMode) {
  let lockName = "fourThreadsApplyForSameLock" + (mode == utils.locks.AsyncLockMode.EXCLUSIVE ? "_exclusive" : "shared");
  let tidBuf = createInt();
  tidBuf[0] = 0;
  let promises = new Array<Promise<void>>(4);
  for (let i = 0; i < promises.length; ++i) {
    promises[i] = taskpool.execute(applyLockJob, lockName, mode, tidBuf) as Object as Promise<void>;
  }
  return Promise.all(promises);
}

// test entry point
export function fourThreadsApplyForSameLockExclusive() {
  return check("fourThreadsApplyForSameLockExclusive", fourThreadsApplyForSameLockImpl(utils.locks.AsyncLockMode.EXCLUSIVE));
}

// test entry point
export function fourThreadsApplyForSameLockShared() {
  return check("fourThreadsApplyForSameLockShared", fourThreadsApplyForSameLockImpl(utils.locks.AsyncLockMode.SHARED));
}

function acquireLockTwiceSuccess(outerMode: utils.locks.AsyncLockMode, innerMode: utils.locks.AsyncLockMode,
                                 isAvailable: boolean): Promise<void> {
  let lock = new utils.locks.AsyncLock();
  return new Promise<void>((resolve) => {
    let innerOptions = new utils.locks.AsyncLockOptions<void>();
    innerOptions.isAvailable = isAvailable;
    lock.lockAsync<void>(() => {
      lock.lockAsync<void, void>(() => {
        resolve();
      }, innerMode, innerOptions);
    }, outerMode);
  });
}

// test entry point
export function acquireLockTwiceSharedSharedAvailable() {
  return check("acquireLockTwiceSharedSharedAvailable",
    acquireLockTwiceSuccess(utils.locks.AsyncLockMode.SHARED, utils.locks.AsyncLockMode.SHARED, true));
}

// test entry point
export function acquireLockTwiceSharedSharedNotAvailable() {
  return check("acquireLockTwiceSharedSharedNotAvailable",
    acquireLockTwiceSuccess(utils.locks.AsyncLockMode.SHARED, utils.locks.AsyncLockMode.SHARED, false));
}

function acquireLockTwiceReject(outerMode: utils.locks.AsyncLockMode, innerMode: utils.locks.AsyncLockMode,
                                isAvailable: boolean): Promise<void> {
  let lock = new utils.locks.AsyncLock();
  return new Promise<void>((resolve, reject) => {
    let innerOptions = new utils.locks.AsyncLockOptions<void>();
    innerOptions.isAvailable = isAvailable;
    lock.lockAsync<void>(() => {
      lock.lockAsync<void, void>(() => {
      }, innerMode, innerOptions).then(() => {
        reject(new Error("Test failed"));
      }, () => {
        resolve()
      });
    }, outerMode);
  });
}

// test entry point
export function acquireLockTwiceSharedExclusiveAvailable() {
  return check("acquireLockTwiceSharedExclusiveAvailable",
    acquireLockTwiceReject(utils.locks.AsyncLockMode.SHARED, utils.locks.AsyncLockMode.EXCLUSIVE, true));
}

// test entry point
export function acquireLockTwiceSharedExclusiveNotAvailable() {
  return check("acquireLockTwiceSharedExclusiveNotAvailable",
    acquireLockTwiceSuccess(utils.locks.AsyncLockMode.SHARED, utils.locks.AsyncLockMode.EXCLUSIVE, false));
}

// test entry point
export function acquireLockTwiceExclusiveSharedAvailable() {
  return check("acquireLockTwiceReject",
    acquireLockTwiceReject(utils.locks.AsyncLockMode.EXCLUSIVE, utils.locks.AsyncLockMode.SHARED, true));
}

// test entry point
export function acquireLockTwiceExclusiveSharedNotAvailable() {
  return check("acquireLockTwiceExclusiveSharedNotAvailable",
    acquireLockTwiceSuccess(utils.locks.AsyncLockMode.EXCLUSIVE, utils.locks.AsyncLockMode.SHARED, false));
}

// test entry point
export function acquireLockTwiceExclusiveExclusiveAvailable() {
  return check("acquireLockTwiceExclusiveSharedNotAvailable",
    acquireLockTwiceReject(utils.locks.AsyncLockMode.EXCLUSIVE, utils.locks.AsyncLockMode.EXCLUSIVE, true));
}

// test entry point
export function acquireLockTwiceExclusiveExclusiveNotAvailable() {
  return check("acquireLockTwiceExclusiveExclusiveNotAvailable",
    acquireLockTwiceSuccess(utils.locks.AsyncLockMode.EXCLUSIVE, utils.locks.AsyncLockMode.EXCLUSIVE, false));
}

@Concurrent
async function pressureWorker(lockName: string, timeout: number, taskBuf: Uint32Array) {
  let lock = utils.locks.AsyncLock.request(lockName);
  await lock.lockAsync(async () => {
    let value = 0;
    let index = -1;
    for (let i = 0; i < taskBuf.length; ++i) {
      value = Atomics.load(taskBuf, i);
      if (value == 0) {
        index = i;
        break;
      }
    }
    if (index < 0) {
      // all data is processed
      console.log("ActsConcurrencyBaseJSTest: No data to process");
      return;
    }
    console.log("ActsConcurrencyBaseJSTest: Process at " + index);
    await new Promise<void>(resolve => setTimeout(resolve, timeout));
    let newValue = Atomics.exchange(taskBuf, index, 1);
    if (value != newValue) {
      throw new Error("Value is changed after timeout");
    }
  });
}

// test entry point
export function pressureTest() {
  let sab = new SharedArrayBuffer(4 * 100);
  let taskBuf = new Uint32Array(sab);
  for (let i = 0; i < taskBuf.length; ++i) {
    taskBuf[i] = 0;
  }
  let lockName = "pressureLock";
  let promises = new Array<Promise<Object>>();
  for (let i = 0; i < taskBuf.length; ++i) {
    let timeout = i % 10;
    let p = taskpool.execute(pressureWorker, lockName, timeout, taskBuf) as Promise<Object>;
    promises[i] = p;
  }
  return check("pressureTest", Promise.all(promises));
}

// test entry point
export async function setDelayRequestAndCloseWorkerInstantlyTest() {
  let workerInstance: worker.ThreadWorker = new worker.ThreadWorker('entry/ets/workers/worker.ets');
  let lockName = 'setDelayRequestAndCloseWorkerInstantlyTest';
  let lock = utils.locks.AsyncLock.request(lockName);
  let p = new Promise<void>((resolve, reject) => {
    workerInstance.postMessage({ test: lockName, lockName: lockName, timeout: 3000 });
    workerInstance.onmessage = (e: MessageEvents) => {
      if (e.data === 'PASSED') {
        workerInstance.terminate();
        resolve();
      } else {
        reject(e.data);
      }
    };
  });
  // p0 use the same lock with worker thread, if p0 resolved, means lock request created in worker thread is skipped as expected
  let p0 = lock.lockAsync(async () => {
    await new Promise<void>((resolve) => setTimeout(resolve, 3000));
  });
  return check('setDelayRequestAndCloseWorkerInstantlyTest', Promise.all([p, p0]));
}

function promiseLockAsync() {
  let lock = new utils.locks.AsyncLock;
  return lock.lockAsync(async () => {
    await new Promise<void>(resolve => setTimeout(resolve, 1000));
  })
}

declare class ArkTools {
  static forceFullGC(): void
}

// test entry point
export async function gcAfterLockAsyncTest() {
  let p = promiseLockAsync();
  ArkTools.forceFullGC();
  return check('gcAfterLockAsyncTest', p);
}

async function mainExecutor(index: number, flagBuf: Uint32Array, timeout: number): Promise<void> {
  let lockName = 'doubleExitSharedLockTest';
  let lock = utils.locks.AsyncLock.request(lockName);
  await lock.lockAsync(async () => {
    flagBuf[index] = 1;
    if (flagBuf[2] != 0) {
      throw new Error('Unexpected set flag at index 2');
    }
    await new Promise<void>(resolve => setTimeout(resolve, timeout));
    flagBuf[index] = 0;
  }, utils.locks.AsyncLockMode.SHARED);
}

@Concurrent
async function taskExecutor(flagBuf: Uint32Array, timeout: number) {
  let lockName = 'doubleExitSharedLockTest';
  let lock = utils.locks.AsyncLock.request(lockName);
  await lock.lockAsync(async () => {
    flagBuf[2] = 1;
    if (flagBuf[0] != 0) {
      throw new Error('Unexpected set flag at index 0');
    }
    if (flagBuf[1] != 0) {
      throw new Error('Unexpected set flag at index 1');
    }
    await new Promise<void>(resolve => setTimeout(resolve, timeout));
    flagBuf[2] = 0;
  }, utils.locks.AsyncLockMode.EXCLUSIVE);
}

// test entry point
export function doubleExitSharedLockTest() {
  let sab = new SharedArrayBuffer(3 * 4);
  let flagBuf = new Uint32Array(sab);
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
export function timeoutLockWithEnvDestroyedTest() {
  let workerInstance: worker.ThreadWorker = new worker.ThreadWorker('entry/ets/workers/worker.ets');
  let lockName = 'timeoutLockWithEnvDestroyedTest';
  let lock = utils.locks.AsyncLock.request(lockName);
  let p = lock.lockAsync(async () => {
    await new Promise<void>(resolve => setTimeout(resolve, 2000));
  });
  let p0 = new Promise<void>((resolve, reject) => {
    workerInstance.postMessage({ test: lockName, lockName: lockName });
    workerInstance.onmessage = (e: MessageEvents) => {
      if (e.data === 'PASSED') {
        workerInstance.terminate();
        resolve();
      } else {
        reject(e.data);
      }
    };
  });
  return check(lockName, Promise.all([p, p0]));
}

function lockAsyncPromise(mode: utils.locks.AsyncLockMode = utils.locks.AsyncLockMode.EXCLUSIVE) {
  let lock = utils.locks.AsyncLock.request('lock');
  return lock.lockAsync(async () => {
    await new Promise<void>(resolve => setTimeout(resolve, 1000));
    console.log('lzl done')
  }, mode)
}

// test entry point
export async function pendingSharedRequestAfterGC() {
  let p = lockAsyncPromise(utils.locks.AsyncLockMode.SHARED);
  let p0 = lockAsyncPromise(utils.locks.AsyncLockMode.SHARED);
  ArkTools.forceFullGC();
  return check('pendingSharedRequestAfterGC', Promise.all([p, p0]));
}

