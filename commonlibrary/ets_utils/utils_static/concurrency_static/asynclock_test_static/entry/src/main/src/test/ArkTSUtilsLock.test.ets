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

import { describe, it, expect, Level, Size, TestType, xit, afterEach } from "../../../hypium/index";
import { sleep } from '../testability/pages/utils';
import {
  exclusiveTask,
  exclusiveTimeTask,
  loadCase,
  lockExclusiveTask,
  locksTask,
  locksTimeTask,
  NumClass,
  SendableClass,
  sendableFunction,
  sharedTaskTime,
  sharedTimeTask
} from '../testability/pages/arkTSUtilsCommon';
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog';

class Person {
  name: string;
  age: number;
  city: string;

  constructor(name: string, age: number, city: string) {
    super();
    this.name = name;
    this.age = age;
    this.city = city;
  }
}

class BigIntPerson {
  name: string;
  age: number;
  bigInt: number;

  constructor(name: string, age: number, bigInt: number) {
    super();
    this.name = name;
    this.age = age;
    this.bigInt = bigInt;
  }
}

class Obj {
  largeNumber: number;

  constructor(largeNumber: number) {
    super();
    this.largeNumber = largeNumber;
  }
}

export default function arkTSUtilsLockTest() {
  describe('arkTSUtilsLockTest', (): void => {
    afterEach(() => {
      await sleep(20);
    })
    /**
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_1200
     * @tc.name testTaskLocksQueryAll_static_0001
     * @tc.desc The queryAll operation of AsyncLock does not create an asynchronous lock but performs a query,
     *                 resulting in no information with length=0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTaskLocksQueryAll_static_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'testTaskLocksQueryAll_static_0001';
        try {
          let states: AsyncLockState[] = AsyncLock.queryAll();
          expect(states.length).assertEqual(0);
        } catch (error) {
          error = error as Error;
          console.error(`${TAG} catch error: ${error}`);
          expect(false).assertFail();
        }
        done()
      })

    /**
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_1300
     * @tc.name testTaskLocksQueryAll_static_0002
     * @tc.desc The queryAll operation of AsyncLock does not create an asynchronous lock but performs a query,
     *                 returning information on existing asynchronous locks and validating each item in the AsyncLockState results.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTaskLocksQueryAll_static_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'testTaskLocksQueryAll_static_0002';
        try {
          let states: AsyncLockState[] = AsyncLock.queryAll();
          expect(Array.isArray(states)).assertTrue();
        } catch (error) {
          error = error as Error;
          console.error(`${TAG} catch error: ${error}`);
          expect(false).assertFail();
        }
        done()
      })

    /**
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_1400
     * @tc.name testTaskLocksQueryAll_static_0003
     * @tc.desc The queryAll operation of AsyncLock creates multiple asynchronous locks,
     *                 performs a query, and validates each item in the AsyncLockState results.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTaskLocksQueryAll_static_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'testTaskLocksQueryAll_static_0003';
        try {
          AsyncLock.request("name1");
          AsyncLock.request("name2");
          AsyncLock.request("name3");
          let states: AsyncLockState[] = AsyncLock.queryAll();
          console.info(`${TAG} state.` + JSON.stringify(states));
          expect(states.length).assertEqual(3);
        } catch (error) {
          error = error as Error;
          console.error(`${TAG} catch error: ${error}`);
          expect(false).assertFail();
        }
        done()
      })

    /**
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_0100
     * @tc.name testTaskLocksConstructor_static_0001
     * @tc.desc The request operation of AsyncLock, which had not been created before,
     *                 is a creation operation at this point, and it returns a newly created asynchronous lock.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTaskLocksConstructor_static_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'testTaskLocksConstructor_static_0001';
        try {
          let lock = new AsyncLock();
          expect(lock instanceof AsyncLock).assertTrue();
        } catch (error) {
          error = error as Error;
          console.error(`${TAG} catch error: ${error}`);
          expect(false).assertFail();
        }
        done()
      })

    /**
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_0700
     * @tc.name testTaskLocksQuery_static_0001
     * @tc.desc The request operation of AsyncLock has not been created before, resulting in an error.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTaskLocksQuery_static_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'testTaskLocksQuery_static_0001';
        try {
          const lockName = "";
          AsyncLock.query(lockName);
          expect(false).assertFail();
        } catch (error) {
          error = error as Error;
          console.error(`${TAG} catch error: ${error}`);
        }
        done()
      })

    /**
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_1100
     * @tc.name testTaskLocksQuery_static_0005
     * @tc.desc The query operation of AsyncLock has not been created before, error.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTaskLocksQuery_static_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'testTaskLocksQuery_static_0005';
        try {
          const lockName = "name";
          AsyncLock.query(lockName);
          expect(false).assertFail();
        } catch (error) {
          error = error as Error;
          console.error(`${TAG} catch error: ${error}`);
        }
        done()
      })

    /**
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_0200
     * @tc.name testTaskLocksRequest_static_0001
     * @tc.desc The request operation of AsyncLock, which had not been created before,
     *                 is a creation operation at this point, and it returns a newly created asynchronous lock.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTaskLocksRequest_static_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'testTaskLocksRequest_static_0001';
        try {
          const lockName = "";
          let lock = AsyncLock.request(lockName);
          expect(lock.name).assertEqual(lockName);
        } catch (error) {
          error = error as Error;
          console.error(`${TAG} catch error: ${error}`);
          expect(false).assertFail();
        }
        done()
      })

    /**
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_0300
     * @tc.name testTaskLocksRequest_static_0002
     * @tc.desc The request operation of AsyncLock has already been created earlier.
     *                 Here, it is a lookup operation that returns an already existing asynchronous lock.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTaskLocksRequest_static_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'testTaskLocksRequest_static_0002';
        try {
          const lockName = "";
          AsyncLock.request(lockName);
          let lock = AsyncLock.request(lockName);
          expect(lock.name).assertEqual(lockName);
        } catch (error) {
          error = error as Error;
          console.error(`${TAG} catch error: code =>  message => ${error.message}`);
          expect(false).assertFail();
        }
        done()
      })

    /**
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_0400
     * @tc.name testTaskLocksRequest_static_0003
     * @tc.desc The request operation of AsyncLock has not been created before.
     *                 Here, it is a creation operation that returns a newly created asynchronous lock.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTaskLocksRequest_static_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'testTaskLocksRequest_static_0003';
        try {
          const lockName = "name";
          let lock = AsyncLock.request(lockName);
          expect(lock.name).assertEqual(lockName);
        } catch (error) {
          error = error as Error;
          console.error(`${TAG} catch error: ${error}`);
          expect(false).assertFail();
        }
        done()
      })

    /**
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_0500
     * @tc.name testTaskLocksRequest_static_0004
     * @tc.desc The request operation of AsyncLock has already been created before.
     *                 Here, it is a lookup operation that returns an existing asynchronous lock.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTaskLocksRequest_static_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'testTaskLocksRequest_static_0004';
        try {
          const lockName = "name";
          AsyncLock.request(lockName);
          let lock = AsyncLock.request(lockName);
          expect(lock.name).assertEqual(lockName);
        } catch (error) {
          error = error as Error;
          console.error(`${TAG} catch error: ${error}`);
          expect(false).assertFail();
        }
        done()
      })

    /**
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_0600
     * @tc.name testTaskLocksRequest_static_0005
     * @tc.desc The request operation of AsyncLock had already been created.
     *                 When performing a lookup with a case-insensitive mismatch,
     *                 it actually returns a newly created async lock.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTaskLocksRequest_static_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'testTaskLocksRequest_static_0005';
        try {
          const lockName = "name";
          const newLockName = "Name";
          AsyncLock.request(lockName);
          let lock = AsyncLock.request(newLockName);
          expect(lock.name).assertEqual(newLockName);
        } catch (error) {
          error = error as Error;
          console.error(`${TAG} catch error: ${error}`);
          expect(false).assertFail();
        }
        done()
      })

    /**
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_0800
     * @tc.name testTaskLocksQuery_static_0002
     * @tc.desc The request operation of AsyncLock has already been created.
     *                 It returns an existing async lock and verifies each piece of information in the AsyncLockState result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTaskLocksQuery_static_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'testTaskLocksQuery_static_0002';
        try {
          const lockName = "";
          AsyncLock.request(lockName);
          let state = AsyncLock.query(lockName);
          console.info(`${TAG} state:  => ${JSON.stringify(state)}`);
          console.info(`${TAG} state.held:  => ${JSON.stringify(state.held)}`);
          console.info(`${TAG} state.pending:  => ${JSON.stringify(state.pending)}`);
          expect(state && Array.isArray(state.held) && Array.isArray(state.pending)).assertTrue();
        } catch (error) {
          error = error as Error;
          console.error(`${TAG} catch error: ${error}`);
          expect(false).assertFail();
        }
        done()
      })

    /**
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_0900
     * @tc.name testTaskLocksQuery_static_0003
     * @tc.desc The query operation of AsyncLock was previously created with the specified name.
     *                 It returns an existing async lock and verifies each piece of information in the AsyncLockState result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTaskLocksQuery_static_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'testTaskLocksQuery_static_0003';
        try {
          const lockName = "name";
          AsyncLock.request(lockName);
          let state = AsyncLock.query(lockName);
          console.info(`${TAG} state:  => ${JSON.stringify(state)}`);
          console.info(`${TAG} state.held:  => ${JSON.stringify(state.held)}`);
          console.info(`${TAG} state.pending:  => ${JSON.stringify(state.pending)}`);
          expect(state && Array.isArray(state.held) && Array.isArray(state.pending)).assertTrue();
        } catch (error) {
          error = error as Error;
          console.error(`${TAG} catch error: ${error}`);
          expect(false).assertFail();
        }
        done()
      })

    /**
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_1_static_000
     * @tc.name testTaskLocksQuery_static_0004
     * @tc.desc The query operation of AsyncLock was previously created with the specified name.
     *                 When performing a lookup with a case-insensitive mismatch, it results in an error.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTaskLocksQuery_static_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'testTaskLocksQuery_static_0004';
        try {
          const lockName = "name";
          const newLockName = "NAme";
          AsyncLock.request(lockName);
          AsyncLock.query(newLockName);
          expect(false).assertFail();
        } catch (error) {
          error  = error as Error;
          console.error(`${TAG} catch error: ${error}`);
        }
        done()
      })

    /**
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_1500
     * @tc.name testLockAsync_static_0001
     * @tc.desc Test the function of the interface LockAsync.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testLockAsync_static_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testLockAsync_static_0001";
        try {
          let lock = new AsyncLock();
          AsyncLock.query(lock.name);
          lock.lockAsync<void>(() => {
          }, AsyncLockMode.SHARED);
          expect(false).assertFail();
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} failed, error: code =>  message => ${err.message}`);
        }
        done()
      })

    /**
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_1600
     * @tc.name testLockAsync_static_0006
     * @tc.desc Test the function of the interface LockAsync.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testLockAsync_static_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testLockAsync_static_0006";
        try {
          let result = '';
          let lock = new AsyncLock();
          let options = new AsyncLockOptions<string>();
          options.isAvailable = false;
          options.signal = null;
          options.timeout = 0;
          let state1: boolean = false;
          let state2: boolean = false;
          lock.lockAsync(async () => {
            result += 'A';
            await sleep(500);
            state1 = true;
          }, AsyncLockMode.EXCLUSIVE, options).catch((err: Error) => {
            console.error(`${TAG} failed, error: ${err}`);
          });
          await sleep(200);
          lock.lockAsync(async () => {
            result += 'B';
            await sleep(500);
            state2 = true;
          }, AsyncLockMode.SHARED, options).catch((err: Error) => {
            console.error(`${TAG} failed, error: ${err}`);
          });
          while (!(state1 && state2)) {
            await loadCase();
          }
          expect(result).assertEqual('AB');
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} failed, error: ${err}`);
          expect(false).assertFail();
        }
        done()
      })

    /**
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_1700
     * @tc.name testLockAsync_static_0007
     * @tc.desc Test the function of the interface LockAsync.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testLockAsync_static_0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testLockAsync_static_0007";
        try {
          let lock = new AsyncLock();
          let options = new AsyncLockOptions<string>();
          options.isAvailable = true;
          options.signal = null;
          options.timeout = 0;
          lock.lockAsync(async () => {
            await sleep(1000);
          }, AsyncLockMode.EXCLUSIVE, options);
          await lock.lockAsync(async () => {
            await sleep(1000);
          }, AsyncLockMode.EXCLUSIVE, options);
          expect(false).assertFail();
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} failed, error: ${err}`);
        }
        done()
      })

    /**
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_1800
     * @tc.name testLockAsync_static_0008
     * @tc.desc Test the function of the interface LockAsync.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testLockAsync_static_0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testLockAsync_static_0008";
        try {
          let result = '';
          let sig: AbortSignal<String> = {
            aborted: true, reason: 'Aborted'
          };
          let lock = new AsyncLock();
          let options = new AsyncLockOptions<string>();
          options.isAvailable = false;
          options.signal = sig;
          options.timeout = 0;
          lock.lockAsync(async () => {
            result += 'A'
            await sleep(1000);
          }, AsyncLockMode.SHARED, options);
          lock.lockAsync(async () => {
            result += 'B';
            await sleep(1000);
          }, AsyncLockMode.SHARED, options);
          expect(result).assertEqual('');
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} failed, error: ${err}`);
          expect(false).assertFail();
        }
        done()
      })

    /**
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_1900
     * @tc.name testLockAsync_static_0009
     * @tc.desc Test the function of the interface LockAsync.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testLockAsync_static_0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testLockAsync_static_0009";
        try {
          let result = '';
          let sig: AbortSignal<String> = {
            aborted: false, reason: 'Aborted'
          };
          let lock = new AsyncLock();
          let options = new AsyncLockOptions<string>();
          options.isAvailable = true;
          options.signal = sig;
          options.timeout = 0;
          let state1: boolean = false;
          let state2: boolean = false;
          lock.lockAsync(async () => {
            result += 'A'
            await sleep(500);
            state1 = true;
          }, AsyncLockMode.SHARED, options);
          await sleep(200);
          lock.lockAsync(async () => {
            result += 'B';
            await sleep(500);
            state2 = true;
          }, AsyncLockMode.SHARED, options);
          while (!(state1 && state2)) {
            await loadCase();
          }
          expect(result).assertEqual('AB');
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} failed, error: ${err}`);
          expect(false).assertFail();
        }
        done()
      })

    /**
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_2_static_000
     * @tc.name testLockAsync_static_0010
     * @tc.desc Test the function of the interface LockAsync.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testLockAsync_static_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testLockAsync_static_0010";
        try {
          let result = '';
          let sig: AbortSignal<String> = {
            aborted: true, reason: 'Aborted'
          };
          let lock = new AsyncLock();
          let options = new AsyncLockOptions<string>();
          options.isAvailable = false;
          options.signal = sig;
          options.timeout = 0;
          await lock.lockAsync(async () => {
            result += 'A';
            await sleep(1500);
          }, AsyncLockMode.EXCLUSIVE, options);
          expect(false).assertFail();
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} failed, error: ${err}`);
        }
        done()
      })

    /**
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_2100
     * @tc.name testLockAsync_static_0011
     * @tc.desc Test the function of the interface LockAsync.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testLockAsync_static_0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testLockAsync_static_0011";
        try {
          let result = '';
          let lock = new AsyncLock();
          let options = new AsyncLockOptions<string>();
          options.isAvailable = true;
          options.signal = null;
          options.timeout = 1000;
          await lock.lockAsync(async () => {
            result += 'A';
            await new Promise<int>((resolve) => {
              setTimeout(() => {
                resolve(1)
              }, 100)
            });
          }, AsyncLockMode.EXCLUSIVE, options);
          expect(result).assertEqual('A');
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} failed, error: ${err}`);
          expect(false).assertFail();
        }
        done()
      })

    /**
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_2200
     * @tc.name testLockAsync_static_0012
     * @tc.desc Test the function of the interface LockAsync.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testLockAsync_static_0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testLockAsync_static_0012";
        try {
          let lock = new AsyncLock();
          let sig: AbortSignal<String> = {
            aborted: false, reason: 'Aborted'
          };
          let options = new AsyncLockOptions<string>();
          options.isAvailable = false;
          options.signal = sig;
          options.timeout = 1000;
          lock.lockAsync(async () => {
            await new Promise<void>((resolve) => {
              setTimeout(() => {
                resolve(undefined)
              }, 1100)
            });
          }, AsyncLockMode.EXCLUSIVE);
          await lock.lockAsync(async () => {
            await new Promise<void>((resolve) => {
              setTimeout(() => {
                resolve(undefined)
              }, 1100)
            });
          }, AsyncLockMode.SHARED, options);
          expect(false).assertFail();
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} failed, error: ${err}`);
        }
        done()
      })

    /**
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_2300
     * @tc.name testLockAsync_static_0013
     * @tc.desc Perform operations exclusively under the acquired locks. The method first acquires the lock, then calls the callback,
     *                 and finally releases the lock. The callback is executed asynchronously in the same thread that calls lockAsync.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testLockAsync_static_0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'testLockAsync_static_0013';
        try {
          let res: String = '';
          let lock = new AsyncLock();
          let state1: boolean = false;
          let state2: boolean = false;
          lock.lockAsync(
            async () => {
              res += 'l1开始-';
              await sleep(1000);
            }, AsyncLockMode.SHARED
          ).then<void>(() => {
            res += 'l1结束-';
            state1 = true;
          })
          await sleep(200);
          lock.lockAsync(
            async () => {
              res += 'l2开始-';
              await sleep(1000);
            }, AsyncLockMode.SHARED
          ).then<void>(() => {
            res += 'l2结束';
            state2 = true;
          })
          while (!(state1 && state2)) {
            await loadCase();
          }
          expect(res).assertEqual('l1开始-l2开始-l1结束-l2结束')
        } catch (error) {
          error = error as Error;
          console.error(`${TAG} catch error: ${error}`);
          expect(false).assertFail();
        }
        done()
      })

    /**
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_2400
     * @tc.name testLockAsync_static_0014
     * @tc.desc Perform operations exclusively under the acquired locks. The method first acquires the lock, then calls the callback,
     *                 and finally releases the lock. The callback is executed asynchronously in the same thread that calls lockAsync.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testLockAsync_static_0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'testLockAsync_static_0014';
        try {
          let res = '';
          let lock = new AsyncLock();
          let state1: boolean = false;
          let state2: boolean = false;
          lock.lockAsync(
            async () => {
              res += 'l1开始-';
              await sleep(500);
            }, AsyncLockMode.SHARED
          ).then(() => {
            res += 'l1结束-';
            state1 = true;
          })
          await sleep(200);
          lock.lockAsync(async () => {
            res += 'l2开始-';
            await sleep(500);
          }, AsyncLockMode.EXCLUSIVE).then(() => {
            res += 'l2结束';
            state2 = true;
          })
          while (!(state1 && state2)) {
            await loadCase();
          }
          expect(res).assertEqual('l1开始-l1结束-l2开始-l2结束');
        } catch (error) {
          error = error as Error;
          console.error(`${TAG} catch error: ${error}`);
          expect(false).assertFail();
        }
        done()
      })

    /**
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_2500
     * @tc.name testLockAsync_static_0015
     * @tc.desc Perform operations exclusively under the acquired locks. The method first acquires the lock, then calls the callback,
     *                 and finally releases the lock. The callback is executed asynchronously in the same thread that calls lockAsync.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testLockAsync_static_0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'testLockAsync_static_0015';
        try {
          let res = '';
          let lock = new AsyncLock();
          let state1: boolean = false;
          let state2: boolean = false;
          lock.lockAsync(async () => {
            res += 'l1开始-';
            await sleep(500);
          }, AsyncLockMode.EXCLUSIVE).then(() => {
            res += 'l1结束-';
            state1 = true;
          })
          await sleep(200);
          lock.lockAsync(async () => {
            res += 'l2开始-';
            await sleep(500);
          }, AsyncLockMode.SHARED).then(() => {
            res += 'l2结束';
            state2 = true;
          })
          while (!(state1 && state2)) {
            await loadCase();
          }
          expect(res).assertEqual('l1开始-l1结束-l2开始-l2结束');
        } catch (error) {
          error = error as Error;
          console.error(`${TAG} catch error: ${error}`);
          expect(false).assertFail();
        }
        done()
      })

    /**
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_2600
     * @tc.name testLockAsync_static_0016
     * @tc.desc Perform operations exclusively under the acquired locks. The method first acquires the lock, then calls the callback,
     *                 and finally releases the lock. The callback is executed asynchronously in the same thread that calls lockAsync.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testLockAsync_static_0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'testLockAsync_static_0016';
        try {
          let res = '';
          let lock = new AsyncLock();
          let state1: boolean = false;
          let state2: boolean = false;
          lock.lockAsync(async () => {
            res += 'l1开始-';
            await sleep(500);
          }, AsyncLockMode.EXCLUSIVE).then(() => {
            res += 'l1结束-';
            state1 = true;
          })
          await sleep(200);
          lock.lockAsync(async () => {
            res += 'l2开始-';
            await sleep(500);
          }, AsyncLockMode.EXCLUSIVE).then(() => {
            res += 'l2结束';
            state2 = true;
          })
          while (!(state1 && state2)) {
            await loadCase();
          }
          expect(res).assertEqual('l1开始-l1结束-l2开始-l2结束');
        } catch (error) {
          error = error as Error;
          console.error(`${TAG} catch error: ${error}`);
          expect(false).assertFail();
        }
        done()
      })

    /**
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_2700
     * @tc.name testLockAsync_static_0017
     * @tc.desc Test the function of the interface LockAsync.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testLockAsync_static_0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testLockAsync_static_0017";
        try {
          let l1_start: Number = 0;
          let l1_end: Number = 0;
          let l2_start: Number = 0;
          let l2_end: Number = 0;
          let state1: boolean = false;
          let state2: boolean = false;
          let job1 = async () => {
            let eaw1 = new EAWorker()
            eaw1.start()
            let result: Array<Number> = await eaw1.run<Promise<Array<Number>>>(sharedTaskTime, TAG).Await()
            l1_start = result[0];
            l1_end = result[1];
            state1 = true;
            eaw1.join()
          }

          let job2 = async () => {
            let eaw = new EAWorker()
            eaw.start()
            let result: Array<Number> = await eaw.run<Promise<Array<Number>>>(sharedTaskTime, TAG).Await()
            l2_start = result[0];
            l2_end = result[1];
            state2 = true;
            eaw.join()
          }
          job1().catch((e: Error) => {
            console.error(`${TAG} job1 error: ${e}`);
          })
          await sleep(100);
          job2().catch((e: Error) => {
            console.error(`${TAG} job2 error: ${e}`);
          })
          while (!(state1 && state2)) {
            await loadCase();
          }
          console.error(`${TAG} l1_start: ${l1_start}`);
          console.error(`${TAG} l2_start: ${l2_start}`);
          console.error(`${TAG} l1_end: ${l1_end}`);
          console.error(`${TAG} l2_end: ${l2_end}`);
          const res = (l1_start < l2_start) && (l2_start <= l1_end) && (l1_end < l2_end);
          expect(res).assertTrue();
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} failed, error: ${err}`);
          expect(false).assertFail();
        }
        done()
      })

    /**
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_2800
     * @tc.name testLockAsync_static_0018
     * @tc.desc Test the function of the interface LockAsync.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testLockAsync_static_0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testLockAsync_static_0018";
        try {
          const lockName = 'name';
          let res = false;
          let A: Number = 0;
          let B: Number = 0;
          let task1: taskpool.Task = new taskpool.Task(sharedTimeTask, lockName);
          let task2: taskpool.Task = new taskpool.Task(exclusiveTimeTask, lockName);
          let state1: boolean = false;
          let state2: boolean = false;
          taskpool.execute(task1).then((value: Any) => {
            const res = value as Array<Number>;
            A = res[1];
            state1 = true;
          })
          await sleep(200);
          taskpool.execute(task2).then((value: Any) => {
            const res = value as Array<Number>;
            B = res[1];
            state2 = true;
          })
          while (!(state1 && state2)) {
            await loadCase();
          }
          res = B - A >= 200;
          expect(res).assertTrue();
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} failed, error: ${err}`);
          expect(false).assertFail();
        }
        done()
      })

    /**
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_2900
     * @tc.name testLockAsync_static_0019
     * @tc.desc Test the function of the interface LockAsync.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testLockAsync_static_0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testLockAsync_static_0019";
        try {
          const lockName = 'name';
          let res = false;
          let A: Number = 0;
          let B: Number = 0;
          let task1: taskpool.Task = new taskpool.Task(exclusiveTimeTask, lockName);
          let task2: taskpool.Task = new taskpool.Task(sharedTimeTask, lockName);
          let state1: boolean = false;
          let state2: boolean = false;
          taskpool.execute(task1).then((value: Any) => {
            const res = value as Array<Number>;
            A = res[1];
            state1 = true;
          })
          await sleep(200);
          taskpool.execute(task2).then((value: Any) => {
            const res = value as Array<Number>;
            B = res[1];
            state2 = true;
          })
          while (!(state1 && state2)) {
            await loadCase();
          }
          res = B - A >= 500;
          expect(res).assertTrue();
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} failed, error: ${err}`);
          expect(false).assertFail();
        }
        done()
      })

    /**
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_3_static_000
     * @tc.name testLockAsync_static_0020
     * @tc.desc Test the function of the interface LockAsync.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testLockAsync_static_0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testLockAsync_static_0020";
        try {
          let res: string = "";
          let task1: taskpool.Task = new taskpool.Task(exclusiveTask, TAG, 'A');
          let task2: taskpool.Task = new taskpool.Task(exclusiveTask, TAG, 'B');
          let state1: boolean = false;
          let state2: boolean = false;
          taskpool.execute(task1).then((value: Any) => {
            res += (value as string);
            state1 = true;
          })
          await sleep(200);
          taskpool.execute(task2).then((value: Any) => {
            res += (value as string);
            state2 = true;
          })
          while (!(state1 && state2)) {
            await loadCase();
          }
          expect(res).assertEqual('AB');
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} failed, error: ${err}`);
          expect(false).assertFail();
        }
        done()
      })

    /**
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_3100
     * @tc.name testLockAsync_static_0021
     * @tc.desc Test the function of the interface LockAsync.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testLockAsync_static_0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testLockAsync_static_0021";
        try {
          let l1_start: Number = 0;
          let l1_end: Number = 0;
          let l2_start: Number = 0;
          let l2_end: Number = 0;
          let lock = AsyncLock.request(TAG);
          let state1: boolean = false;
          let state2: boolean = false;

          let job1 = async () => {
            let eaw = new EAWorker()
            eaw.start()
            eaw.run<Promise<Array<Number>>>(sharedTaskTime, TAG).Await().then((value: Any) => {
              const res = value as Array<number>;
              l1_start = res[0];
              l1_end = res[1];
              state1 = true;
            })
            eaw.join()
          }
          let job2 = async () => {
            let eaw = new EAWorker()
            eaw.start()
            eaw.run<Promise<Array<Number>>>(sharedTaskTime, TAG).Await().then((value: Any) => {
              const res = value as Array<number>;
              l2_start = res[0];
              l2_end = res[1];
              state2 = true;
            })
            eaw.join()
          }
          job1().catch((e: Error) => {
            console.error(`${TAG} job1 error: ${e}`);
          })
          await sleep(100);
          job2().catch((e: Error) => {
            console.error(`${TAG} job2 error: ${e}`);
          })

          while (!(state1 && state2)) {
            await loadCase();
          }
          console.error(`${TAG} l1_start: ${l1_start}`);
          console.error(`${TAG} l2_start: ${l2_start}`);
          console.error(`${TAG} l1_end: ${l1_end}`);
          console.error(`${TAG} l2_end: ${l2_end}`);
          const res = (l1_start < l2_start) && (l2_start <= l1_end) && (l1_end < l2_end);
          expect(res).assertTrue();
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} failed, error: ${err}`);
          expect(false).assertFail();
        }
        done()
      })

    /**
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_3200
     * @tc.name testLockAsync_static_0022
     * @tc.desc Test the function of the interface LockAsync.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testLockAsync_static_0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testLockAsync_static_0022";
        try {
          let res = '';
          let lock = AsyncLock.request(TAG);
          let task1: taskpool.Task = new taskpool.Task(locksTask, lock, AsyncLockMode.SHARED);
          let task2: taskpool.Task = new taskpool.Task(locksTask, lock, AsyncLockMode.EXCLUSIVE);
          await taskpool.execute(task1).then((value: Any) => {
            res += (value as string);
          })
          taskpool.execute(task2).then((value: Any) => {
            res += (value as string);
          })
          expect(res).assertEqual('A');
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} failed, error: ${err}`);
          expect(false).assertFail();
        }
        done()
      })

    /**
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_3300
     * @tc.name testLockAsync_static_0023
     * @tc.desc Test the function of the interface LockAsync.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testLockAsync_static_0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testLockAsync_static_0023";
        try {
          let res = '';
          let lock = AsyncLock.request(TAG);
          let task1: taskpool.Task = new taskpool.Task(locksTask, lock, AsyncLockMode.EXCLUSIVE);
          let task2: taskpool.Task = new taskpool.Task(locksTask, lock, AsyncLockMode.SHARED);
          let state1: boolean = false;
          let state2: boolean = false;
          taskpool.execute(task1).then((value: Any) => {
            res += (value as string);
            state1 = true;
          })
          await sleep(200);
          taskpool.execute(task2).then((value: Any) => {
            res += (value as string);
            state2 = true;
          })
          while (!(state1 && state2)) {
            await loadCase();
          }
          expect(res).assertEqual('BA');
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} failed, error: ${err}`);
          expect(false).assertFail();
        }
        done()
      })

    /**
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_3400
     * @tc.name testLockAsync_static_0024
     * @tc.desc Test the function of the interface LockAsync.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testLockAsync_static_0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testLockAsync_static_0024";
        try {
          let res = '';
          let lock = AsyncLock.request(TAG);
          let task1: taskpool.Task = new taskpool.Task(lockExclusiveTask, lock, 'A');
          let task2: taskpool.Task = new taskpool.Task(lockExclusiveTask, lock, 'B');
          let state1: boolean = false;
          let state2: boolean = false;
          taskpool.execute(task1).then((value: Any) => {
            res += (value as string);
            state1 = true;
          })
          await sleep(200);
          taskpool.execute(task2).then((value: Any) => {
            res += (value as string);
            state2 = true;
          })
          while (!(state1 && state2)) {
            await loadCase();
          }
          expect(res).assertEqual('AB');
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} failed, error: ${err}`);
          expect(false).assertFail();
        }
        done()
      })

    /**
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_3500
     * @tc.name testAsyncLockMode_static_0001
     * @tc.desc Test the function of the interface LockAsyncMode.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testAsyncLockMode_static_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testAsyncLockMode_static_0001";
        try {
          let res = '';
          let lock = new AsyncLock;
          let state1: boolean = false;
          let state2: boolean = false;
          lock.lockAsync(async () => {
            console.log('shared0');
            res += 'A'
            state1 = true;
          }, AsyncLockMode.SHARED);
          await sleep(200);
          lock.lockAsync(async () => {
            console.log('shared1');
            res += 'B'
            state2 = true;
          }, AsyncLockMode.SHARED);
          while (!(state1 && state2)) {
            await loadCase();
          }
          expect(res).assertEqual('AB');
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} failed, error: ${err}`);
          expect(false).assertFail();
        }
        done()
      })

    /**
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_3600
     * @tc.name testAsyncLockMode_static_0002
     * @tc.desc Test the function of the interface LockAsyncMode.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testAsyncLockMode_static_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testAsyncLockMode_static_0002";
        try {
          let res = '';
          let lock = AsyncLock.request("exclusive0");
          let state1: boolean = false;
          let state2: boolean = false;
          lock.lockAsync(async () => {
            console.log('shared0');
            res += 'A'
            await sleep(500);
          }, AsyncLockMode.SHARED).then(() => {
            state1 = true;
          });
          await sleep(200);
          lock.lockAsync(async () => {
            console.log('exclusive0');
            res += 'B'
            await sleep(500);
            state2 = true;
          }, AsyncLockMode.EXCLUSIVE);
          while (!(state1 && state2)) {
            await loadCase();
          }
          expect(res).assertEqual('AB');
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} failed, error: ${err}`);
          expect(false).assertFail();
        }
        done()
      })

    /**
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_3700
     * @tc.name testAsyncLockOptions_static_0001
     * @tc.desc Test the function of the interface LockAsyncOptions.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testAsyncLockOptions_static_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testAsyncLockOptions_static_0001";
        try {
          let options = new AsyncLockOptions<string>();
          expect(options instanceof AsyncLockOptions).assertTrue();
          expect(options.isAvailable).assertFalse();
          //expect(options.signal).assertNull();
          expect(options.timeout).assertEqual(0);
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} failed, error: ${err}`);
          expect(false).assertFail();
        }
        done()
      })

    /**
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_3800
     * @tc.name testAsyncLockOptions_static_0002
     * @tc.desc Test the function of the interface LockAsyncOptions.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testAsyncLockOptions_static_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testAsyncLockOptions_static_0002";
        try {
          let lock = new AsyncLock();
          let options = new AsyncLockOptions<string>();
          options.isAvailable = true;
          let res = '';
          lock.lockAsync(async () => {
            console.log('shared0');
            res += 'A';
            await new Promise<int>((resolve) => {
              setTimeout(() => {
                resolve(1)
              }, 100)
            });
          }, AsyncLockMode.SHARED, options);
          lock.lockAsync(async () => {
            console.log('shared0');
            res += 'B';
          }, AsyncLockMode.SHARED, options);
          console.log(`${TAG} result:` + res);
          expect(options.isAvailable).assertEqual(true);
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} failed, error: ${err}`);
          expect(false).assertFail();
        }
        done()
      })

    /**
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_3900
     * @tc.name testAsyncLockOptions_static_0003
     * @tc.desc Test the function of the interface LockAsyncOptions.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testAsyncLockOptions_static_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testAsyncLockOptions_static_0003";
        try {
          let lock = new AsyncLock();
          let options = new AsyncLockOptions<string>();
          options.isAvailable = false;
          lock.lockAsync(async () => {
            console.log('shared0');
            await sleep(1000);
          }, AsyncLockMode.SHARED, options);
          console.log(`${TAG} result:` + options.isAvailable);
          expect(options.isAvailable).assertEqual(false);
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} failed, error: ${err}`);
          expect(false).assertFail();
        }
        done()
      })

    /**
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_4_static_000
     * @tc.name testAsyncLockOptions_static_0004
     * @tc.desc Test the function of the interface LockAsyncOptions.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testAsyncLockOptions_static_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testAsyncLockOptions_static_0004";
        try {
          let lock = new AsyncLock();
          let options = new AsyncLockOptions<string>();
          options.signal = null;
          lock.lockAsync(async () => {
            console.log('shared0');
            await sleep(1000);
          }, AsyncLockMode.SHARED, options);
          console.log(`${TAG} result:` + options.signal);
          expect(options.signal).assertEqual(null);
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} failed, error: ${err}`);
          expect(false).assertFail();
        }
        done()
      })

    /**
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_4100
     * @tc.name testAsyncLockOptions_static_0005
     * @tc.desc Test the function of the interface LockAsyncOptions.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testAsyncLockOptions_static_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testAsyncLockOptions_static_0005";
        try {
          let sig: AbortSignal<String> = {
            aborted: true, reason: "error"
          };
          let lock = new AsyncLock();
          let options = new AsyncLockOptions<string>();
          options.signal = sig;
          lock.lockAsync(async () => {
            console.log('shared0');
            await sleep(1000);
          }, AsyncLockMode.SHARED, options);
          console.log(`${TAG} result:` + JSON.stringify(options.signal));
          expect(JSON.stringify(options.signal)).assertEqual('{"aborted":true,"reason":"error"}');
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} failed, error: ${err}`);
          expect(false).assertFail();
        }
        done()
      })

    /**
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_4200
     * @tc.name testAsyncLockOptions_static_0006
     * @tc.desc Test the function of the interface LockAsyncOptions.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testAsyncLockOptions_static_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testAsyncLockOptions_static_0006";
        try {
          let sig: AbortSignal<String> = {
            aborted: false, reason: "error"
          };
          let lock = new AsyncLock();
          let options = new AsyncLockOptions<string>();
          options.signal = sig;
          lock.lockAsync(async () => {
            console.log('shared0');
            await sleep(1000);
          }, AsyncLockMode.SHARED, options);
          console.log(`${TAG} result:` + JSON.stringify(options.signal));
          expect(JSON.stringify(options.signal)).assertEqual('{"aborted":false,"reason":"error"}');
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} failed, error: ${err}`);
          expect(false).assertFail();
        }
        done()
      })

    /**
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_4300
     * @tc.name testAsyncLockOptions_static_0007
     * @tc.desc Test the function of the interface LockAsyncOptions.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testAsyncLockOptions_static_0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testAsyncLockOptions_static_0007";
        try {
          let lock = new AsyncLock();
          let options = new AsyncLockOptions<string>();
          options.timeout = 0;
          lock.lockAsync(async () => {
            console.log('shared0');
            await sleep(1000);
          }, AsyncLockMode.SHARED, options);
          console.log(`${TAG} result:` + options.timeout);
          expect(options.timeout).assertEqual(0);
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} failed, error: ${err}`);
          expect(false).assertFail();
        }
        done()
      })

    /**
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_4400
     * @tc.name testAsyncLockOptions_static_0008
     * @tc.desc Test the function of the interface LockAsyncOptions.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testAsyncLockOptions_static_0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testAsyncLockOptions_static_0008";
        try {
          let lock = new AsyncLock();
          let options = new AsyncLockOptions<string>();
          options.timeout = 1000;
          lock.lockAsync(async () => {
            console.log('shared0');
            await sleep(1000);
          }, AsyncLockMode.SHARED, options);
          console.log(`${TAG} result:` + options.timeout);
          expect(options.timeout).assertEqual(1000);
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} failed, error: ${err}`);
          expect(false).assertFail();
        }
        done()
      })

    /**
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_4500
     * @tc.name testAsyncLockState_static_0001
     * @tc.desc Test the function of the interface LockAsyncState.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testAsyncLockState_static_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testAsyncLockState_static_0001";
        try {
          let lock = AsyncLock.request(TAG);
          lock.lockAsync(async () => {
            await sleep(1000);
          })
          let state = AsyncLock.query(TAG);
          let held: AsyncLockInfo[] = state.held;
          let res = false;
          for (let i = 0; i < held.length; i++) {
            if (held[i].name == TAG) {
              res = true;
            }
          }
          expect(res).assertTrue();
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} failed, error: ${err}`);
          expect(false).assertFail();
        }
        done()
      })

    /**
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_4600
     * @tc.name testAsyncLockState_static_0002
     * @tc.desc Test the function of the interface LockAsyncState.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testAsyncLockState_static_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testAsyncLockState_static_0002";
        try {
          let lock = AsyncLock.request(TAG);
          lock.lockAsync(async () => {
            await sleep(1000);
          }, AsyncLockMode.SHARED);
          let state = AsyncLock.query(TAG);
          let held: AsyncLockInfo[] = state.held;
          let res = false;
          for (let i = 0; i < held.length; i++) {
            if (held[i].name == TAG) {
              res = held[i].mode == AsyncLockMode.SHARED;
            }
          }
          expect(res).assertTrue();
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} failed, error: ${err}`);
          expect(false).assertFail();
        }
        done()
      })

    /**
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_4700
     * @tc.name testAsyncLockState_static_0003
     * @tc.desc Test the function of the interface LockAsyncState.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testAsyncLockState_static_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testAsyncLockState_static_0003";
        try {
          let lock = AsyncLock.request(TAG);
          lock.lockAsync(async () => {
            await sleep(1000);
          }, AsyncLockMode.EXCLUSIVE);
          let state = AsyncLock.query(TAG);
          let held: AsyncLockInfo[] = state.held;
          let res = false;
          for (let i = 0; i < held.length; i++) {
            if (held[i].name == TAG) {
              res = held[i].mode == AsyncLockMode.EXCLUSIVE;
            }
          }
          expect(res).assertTrue();
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} failed, error: ${err}`);
          expect(false).assertFail();
        }
        done()
      })

    /**
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_4800
     * @tc.name testAsyncLockState_static_0004
     * @tc.desc Test the function of the interface LockAsyncState.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testAsyncLockState_static_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testAsyncLockState_static_0004";
        try {
          let lock = AsyncLock.request(TAG);
          lock.lockAsync(async () => {
            await sleep(1000);
          }, AsyncLockMode.EXCLUSIVE);
          let state = AsyncLock.query(TAG);
          let held: AsyncLockInfo[] = state.held;
          let res = false;
          for (let i = 0; i < held.length; i++) {
            if (held[i].name == TAG) {
              res = Number.isFinite(held[i].contextId);
            }
          }
          expect(res).assertTrue();
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} failed, error: ${err}`);
          expect(false).assertFail();
        }
        done()
      })

    /**
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_4900
     * @tc.name testAsyncLockState_static_0005
     * @tc.desc Test the function of the interface LockAsyncState.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testAsyncLockState_static_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testAsyncLockState_static_0005";
        try {
          let lock = AsyncLock.request(TAG);
          lock.lockAsync(async () => {
            await sleep(1000);
          }, AsyncLockMode.EXCLUSIVE);
          lock.lockAsync(async () => {
          }, AsyncLockMode.SHARED);
          let state = AsyncLock.query(TAG);
          let pending: AsyncLockInfo[] = state.pending;
          let res = false;
          for (let i = 0; i < pending.length; i++) {
            if (pending[i].name == TAG) {
              res = true;
            }
          }
          expect(res).assertTrue();
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} failed, error: ${err}`);
          expect(false).assertFail();
        }
        done()
      })

    /**
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_5_static_000
     * @tc.name testAsyncLockState_static_0006
     * @tc.desc Test the function of the interface LockAsyncState.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testAsyncLockState_static_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testAsyncLockState_static_0006";
        try {
          let lock = AsyncLock.request(TAG);
          lock.lockAsync(async () => {
            await sleep(1000);
          }, AsyncLockMode.EXCLUSIVE);
          lock.lockAsync(async () => {
          }, AsyncLockMode.SHARED);
          let state = AsyncLock.query(TAG);
          let pending: AsyncLockInfo[] = state.pending;
          let res = false;
          for (let i = 0; i < pending.length; i++) {
            if (pending[i].name == TAG) {
              res = pending[i].mode == AsyncLockMode.SHARED;
            }
          }
          expect(res).assertTrue();
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} failed, error: ${err}`);
          expect(false).assertFail();
        }
        done()
      })

    /**
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_5100
     * @tc.name testAsyncLockState_static_0007
     * @tc.desc Test the function of the interface LockAsyncState.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testAsyncLockState_static_0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testAsyncLockState_static_0007";
        try {
          let lock = AsyncLock.request(TAG);
          lock.lockAsync(async () => {
            await sleep(1000);
          }, AsyncLockMode.EXCLUSIVE);
          lock.lockAsync(async () => {
          }, AsyncLockMode.EXCLUSIVE);
          let state = AsyncLock.query(TAG);
          let pending: AsyncLockInfo[] = state.pending;
          let res = false;
          for (let i = 0; i < pending.length; i++) {
            if (pending[i].name == TAG) {
              res = pending[i].mode == AsyncLockMode.EXCLUSIVE;
            }
          }
          expect(res).assertTrue();
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} failed, error: ${err}`);
          expect(false).assertFail();
        }
        done()
      })

    /**
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_5200
     * @tc.name testAsyncLockState_static_0008
     * @tc.desc Test the function of the interface LockAsyncState.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testAsyncLockState_static_0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testAsyncLockState_static_0008";
        try {
          let lock = AsyncLock.request(TAG);
          lock.lockAsync(async () => {
            await sleep(1000);
          }, AsyncLockMode.EXCLUSIVE);
          lock.lockAsync(async () => {
          }, AsyncLockMode.EXCLUSIVE);
          let state = AsyncLock.query(TAG);
          let pending: AsyncLockInfo[] = state.pending;
          let res = false;
          for (let i = 0; i < pending.length; i++) {
            if (pending[i].name == TAG) {
              res = Number.isFinite(pending[i].contextId);
            }
          }
          expect(res).assertTrue();
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} failed, error: ${err}`);
          expect(false).assertFail();
        }
        done()
      })

  })
}