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

import { describe, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { ArkTSUtils, collections, lang, taskpool } from '@kit.ArkTS';
import { Sleep } from '../utils/utils';
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
} from '../utils/arkTSUtilsCommon';

export default function arkTSUtilsTest() {
  describe('arkTSUtilsTest', () => {

    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_1200
     * @tc.name      : testTaskLocksQueryAll0001
     * @tc.desc      : The queryAll operation of AsyncLock does not create an asynchronous lock but performs a query,
     *                 resulting in no information with length=0.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskLocksQueryAll0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG: string = 'testTaskLocksQueryAll0001';
      try {
        let states: ArkTSUtils.locks.AsyncLockState[] = ArkTSUtils.locks.AsyncLock.queryAll();
        expect(states.length).assertEqual(0);
      } catch (error) {
        console.error(`${TAG} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_1300
     * @tc.name      : testTaskLocksQueryAll0002
     * @tc.desc      : The queryAll operation of AsyncLock does not create an asynchronous lock but performs a query,
     *                 returning information on existing asynchronous locks and validating each item in the AsyncLockState results.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskLocksQueryAll0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG: string = 'testTaskLocksQueryAll0002';
      try {
        let states: ArkTSUtils.locks.AsyncLockState[] = ArkTSUtils.locks.AsyncLock.queryAll();
        expect(Array.isArray(states)).assertTrue();
      } catch (error) {
        console.error(`${TAG} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_1400
     * @tc.name      : testTaskLocksQueryAll0003
     * @tc.desc      : The queryAll operation of AsyncLock creates multiple asynchronous locks,
     *                 performs a query, and validates each item in the AsyncLockState results.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskLocksQueryAll0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG: string = 'testTaskLocksQueryAll0003';
      try {
        ArkTSUtils.locks.AsyncLock.request("name1");
        ArkTSUtils.locks.AsyncLock.request("name2");
        ArkTSUtils.locks.AsyncLock.request("name3");
        let states: ArkTSUtils.locks.AsyncLockState[] = ArkTSUtils.locks.AsyncLock.queryAll();
        console.info(`${TAG} state.` + JSON.stringify(states));
        expect(states.length).assertEqual(3);
      } catch (error) {
        console.error(`${TAG} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_0100
     * @tc.name      : testTaskLocksConstructor0001
     * @tc.desc      : The request operation of AsyncLock, which had not been created before,
     *                 is a creation operation at this point, and it returns a newly created asynchronous lock.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskLocksConstructor0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG: string = 'testTaskLocksConstructor0001';
      try {
        let lock = new ArkTSUtils.locks.AsyncLock();
        expect(lock instanceof ArkTSUtils.locks.AsyncLock).assertTrue();
      } catch (error) {
        console.error(`${TAG} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_0700
     * @tc.name      : testTaskLocksQuery0001
     * @tc.desc      : The request operation of AsyncLock has not been created before, resulting in an error.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskLocksQuery0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG: string = 'testTaskLocksQuery0001';
      try {
        const lockName = "";
        ArkTSUtils.locks.AsyncLock.query(lockName);
        expect().assertFail();
      } catch (error) {
        console.error(`${TAG} catch error: ${error}`);
      }
      done()
    })

    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_1100
     * @tc.name      : testTaskLocksQuery0005
     * @tc.desc      : The query operation of AsyncLock has not been created before, error.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskLocksQuery0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG: string = 'testTaskLocksQuery0005';
      try {
        const lockName = "name";
        ArkTSUtils.locks.AsyncLock.query(lockName);
        expect().assertFail();
      } catch (error) {
        console.error(`${TAG} catch error: ${error}`);
      }
      done()
    })

    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_0200
     * @tc.name      : testTaskLocksRequest0001
     * @tc.desc      : The request operation of AsyncLock, which had not been created before,
     *                 is a creation operation at this point, and it returns a newly created asynchronous lock.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskLocksRequest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG: string = 'testTaskLocksRequest0001';
      try {
        const lockName = "";
        let lock = ArkTSUtils.locks.AsyncLock.request(lockName);
        expect(lock.name).assertEqual(lockName);
      } catch (error) {
        console.error(`${TAG} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_0300
     * @tc.name      : testTaskLocksRequest0002
     * @tc.desc      : The request operation of AsyncLock has already been created earlier.
     *                 Here, it is a lookup operation that returns an already existing asynchronous lock.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskLocksRequest0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG: string = 'testTaskLocksRequest0002';
      try {
        const lockName = "";
        ArkTSUtils.locks.AsyncLock.request(lockName);
        let lock = ArkTSUtils.locks.AsyncLock.request(lockName);
        expect(lock.name).assertEqual(lockName);
      } catch (error) {
        console.error(`${TAG} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_0400
     * @tc.name      : testTaskLocksRequest0003
     * @tc.desc      : The request operation of AsyncLock has not been created before.
     *                 Here, it is a creation operation that returns a newly created asynchronous lock.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskLocksRequest0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG: string = 'testTaskLocksRequest0003';
      try {
        const lockName = "name";
        let lock = ArkTSUtils.locks.AsyncLock.request(lockName);
        expect(lock.name).assertEqual(lockName);
      } catch (error) {
        console.error(`${TAG} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_0500
     * @tc.name      : testTaskLocksRequest0004
     * @tc.desc      : The request operation of AsyncLock has already been created before.
     *                 Here, it is a lookup operation that returns an existing asynchronous lock.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskLocksRequest0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG: string = 'testTaskLocksRequest0004';
      try {
        const lockName = "name";
        ArkTSUtils.locks.AsyncLock.request(lockName);
        let lock = ArkTSUtils.locks.AsyncLock.request(lockName);
        expect(lock.name).assertEqual(lockName);
      } catch (error) {
        console.error(`${TAG} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_0600
     * @tc.name      : testTaskLocksRequest0005
     * @tc.desc      : The request operation of AsyncLock had already been created.
     *                 When performing a lookup with a case-insensitive mismatch,
     *                 it actually returns a newly created async lock.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskLocksRequest0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG: string = 'testTaskLocksRequest0005';
      try {
        const lockName = "name";
        const newLockName = "Name";
        ArkTSUtils.locks.AsyncLock.request(lockName);
        let lock = ArkTSUtils.locks.AsyncLock.request(newLockName);
        expect(lock.name).assertEqual(newLockName);
      } catch (error) {
        console.error(`${TAG} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_0800
     * @tc.name      : testTaskLocksQuery0002
     * @tc.desc      : The request operation of AsyncLock has already been created.
     *                 It returns an existing async lock and verifies each piece of information in the AsyncLockState result.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskLocksQuery0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG: string = 'testTaskLocksQuery0002';
      try {
        const lockName = "";
        ArkTSUtils.locks.AsyncLock.request(lockName);
        let state = ArkTSUtils.locks.AsyncLock.query(lockName);
        console.info(`${TAG} state:  => ${JSON.stringify(state)}`);
        console.info(`${TAG} state.held:  => ${JSON.stringify(state.held)}`);
        console.info(`${TAG} state.pending:  => ${JSON.stringify(state.pending)}`);
        expect(state && Array.isArray(state.held) && Array.isArray(state.pending)).assertTrue();
      } catch (error) {
        console.error(`${TAG} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_0900
     * @tc.name      : testTaskLocksQuery0003
     * @tc.desc      : The query operation of AsyncLock was previously created with the specified name.
     *                 It returns an existing async lock and verifies each piece of information in the AsyncLockState result.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskLocksQuery0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG: string = 'testTaskLocksQuery0003';
      try {
        const lockName = "name";
        ArkTSUtils.locks.AsyncLock.request(lockName);
        let state = ArkTSUtils.locks.AsyncLock.query(lockName);
        console.info(`${TAG} state:  => ${JSON.stringify(state)}`);
        console.info(`${TAG} state.held:  => ${JSON.stringify(state.held)}`);
        console.info(`${TAG} state.pending:  => ${JSON.stringify(state.pending)}`);
        expect(state && Array.isArray(state.held) && Array.isArray(state.pending)).assertTrue();
      } catch (error) {
        console.error(`${TAG} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_1000
     * @tc.name      : testTaskLocksQuery0004
     * @tc.desc      : The query operation of AsyncLock was previously created with the specified name.
     *                 When performing a lookup with a case-insensitive mismatch, it results in an error.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskLocksQuery0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG: string = 'testTaskLocksQuery0004';
      try {
        const lockName = "name";
        const newLockName = "NAme";
        ArkTSUtils.locks.AsyncLock.request(lockName);
        ArkTSUtils.locks.AsyncLock.query(newLockName);
        expect().assertFail();
      } catch (error) {
        console.error(`${TAG} catch error: ${error}`);
      }
      done()
    })

    /**
     * @tc.number     : SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_1500
     * @tc.name       : testLockAsync0001
     * @tc.desc       : Test the function of the interface LockAsync.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLockAsync0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testLockAsync0001";
      try {
        let lock = new ArkTSUtils.locks.AsyncLock();
        ArkTSUtils.locks.AsyncLock.query(lock.name);
        lock.lockAsync<void>(() => {
        }, ArkTSUtils.locks.AsyncLockMode.SHARED);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: code => ${err.code} message => ${err.message}`);
      }
      done()
    })

    /**
     * @tc.number     : SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_1600
     * @tc.name       : testLockAsync0006
     * @tc.desc       : Test the function of the interface LockAsync.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLockAsync0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testLockAsync0006";
      try {
        let result = '';
        let lock = new ArkTSUtils.locks.AsyncLock();
        let options = new ArkTSUtils.locks.AsyncLockOptions<string>();
        options.isAvailable = false;
        options.signal = null;
        options.timeout = 0;
        let state1: boolean = false;
        let state2: boolean = false;
        lock.lockAsync(async () => {
          result += 'A';
          await Sleep(500);
          state1 = true;
        }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE, options);
        await Sleep(200);
        lock.lockAsync(async () => {
          result += 'B';
          await Sleep(500);
          state2 = true;
        }, ArkTSUtils.locks.AsyncLockMode.SHARED, options);
        while (!(state1 && state2)) {
          await loadCase();
        }
        expect(result).assertEqual('AB');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.number     : SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_1700
     * @tc.name       : testLockAsync0007
     * @tc.desc       : Test the function of the interface LockAsync.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLockAsync0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testLockAsync0007";
      try {
        let lock = new ArkTSUtils.locks.AsyncLock();
        let options = new ArkTSUtils.locks.AsyncLockOptions<string>();
        options.isAvailable = true;
        options.signal = null;
        options.timeout = 0;
        lock.lockAsync(async () => {
          await Sleep(1000);
        }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE, options);
        await lock.lockAsync(async () => {
          await Sleep(1000);
        }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE, options);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
      }
      done()
    })

    /**
     * @tc.number     : SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_1800
     * @tc.name       : testLockAsync0008
     * @tc.desc       : Test the function of the interface LockAsync.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLockAsync0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testLockAsync0008";
      try {
        let result = '';
        let lock = new ArkTSUtils.locks.AsyncLock();
        let options = new ArkTSUtils.locks.AsyncLockOptions<string>();
        options.isAvailable = false;
        options.signal = {
          aborted: true, reason: 'Aborted'
        };
        options.timeout = 0;
        lock.lockAsync(async () => {
          result += 'A'
          await Sleep(1000);
        }, ArkTSUtils.locks.AsyncLockMode.SHARED, options);
        lock.lockAsync(async () => {
          result += 'B';
          await Sleep(1000);
        }, ArkTSUtils.locks.AsyncLockMode.SHARED, options);
        expect(result).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.number     : SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_1900
     * @tc.name       : testLockAsync0009
     * @tc.desc       : Test the function of the interface LockAsync.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLockAsync0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testLockAsync0009";
      try {
        let result = '';
        let lock = new ArkTSUtils.locks.AsyncLock();
        let options = new ArkTSUtils.locks.AsyncLockOptions<string>();
        options.isAvailable = true;
        options.signal = {
          aborted: false, reason: 'Aborted'
        };
        options.timeout = 0;
        let state1: boolean = false;
        let state2: boolean = false;
        lock.lockAsync(async () => {
          result += 'A'
          await Sleep(500);
          state1 = true;
        }, ArkTSUtils.locks.AsyncLockMode.SHARED, options);
        await Sleep(200);
        lock.lockAsync(async () => {
          result += 'B';
          await Sleep(500);
          state2 = true;
        }, ArkTSUtils.locks.AsyncLockMode.SHARED, options);
        while (!(state1 && state2)) {
          await loadCase();
        }
        expect(result).assertEqual('AB');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.number     : SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_2000
     * @tc.name       : testLockAsync0010
     * @tc.desc       : Test the function of the interface LockAsync.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLockAsync0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testLockAsync0010";
      try {
        let result = '';
        let lock = new ArkTSUtils.locks.AsyncLock();
        let options = new ArkTSUtils.locks.AsyncLockOptions<string>();
        options.isAvailable = false;
        options.signal = {
          aborted: true, reason: 'Aborted'
        };
        options.timeout = 0;
        await lock.lockAsync(async () => {
          result += 'A';
          await Sleep(1500);
        }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE, options);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
      }
      done()
    })

    /**
     * @tc.number     : SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_2100
     * @tc.name       : testLockAsync0011
     * @tc.desc       : Test the function of the interface LockAsync.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLockAsync0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testLockAsync0011";
      try {
        let result = '';
        let lock = new ArkTSUtils.locks.AsyncLock();
        let options = new ArkTSUtils.locks.AsyncLockOptions<string>();
        options.isAvailable = true;
        options.signal = null;
        options.timeout = 1000;
        await lock.lockAsync(async () => {
          result += 'A';
          await new Promise<void>((resolve) => setTimeout(resolve, 100));
        }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE, options);
        expect(result).assertEqual('A');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.number     : SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_2200
     * @tc.name       : testLockAsync0012
     * @tc.desc       : Test the function of the interface LockAsync.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLockAsync0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testLockAsync0012";
      try {
        let lock = new ArkTSUtils.locks.AsyncLock();
        let options = new ArkTSUtils.locks.AsyncLockOptions<string>();
        options.isAvailable = false;
        options.signal = {
          aborted: false, reason: "Aborted"
        };
        options.timeout = 1000;
        lock.lockAsync(async () => {
          await new Promise<void>((resolve) => setTimeout(resolve, 1100));
        }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
        await lock.lockAsync(async () => {
          await new Promise<void>((resolve) => setTimeout(resolve, 1100));
        }, ArkTSUtils.locks.AsyncLockMode.SHARED, options);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
      }
      done()
    })

    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_2300
     * @tc.name      : testLockAsync0013
     * @tc.desc      : Perform operations exclusively under the acquired locks. The method first acquires the lock, then calls the callback,
     *                 and finally releases the lock. The callback is executed asynchronously in the same thread that calls lockAsync.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testLockAsync0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG: string = 'testLockAsync0013';
      try {
        let res = '';
        let lock = new ArkTSUtils.locks.AsyncLock();
        let state1: boolean = false;
        let state2: boolean = false;
        lock.lockAsync(async () => {
          res += 'l1开始-';
          await Sleep(1000);
        }, ArkTSUtils.locks.AsyncLockMode.SHARED).then(() => {
          res += 'l1结束-';
          state1 = true;
        })
        await Sleep(200);
        lock.lockAsync(async () => {
          res += 'l2开始-';
          await Sleep(1000);
        }, ArkTSUtils.locks.AsyncLockMode.SHARED).then(() => {
          res += 'l2结束';
          state2 = true;
        })
        while (!(state1 && state2)) {
          await loadCase();
        }
        expect(res).assertEqual('l1开始-l2开始-l1结束-l2结束')
      } catch (error) {
        console.error(`${TAG} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_2400
     * @tc.name      : testLockAsync0014
     * @tc.desc      : Perform operations exclusively under the acquired locks. The method first acquires the lock, then calls the callback,
     *                 and finally releases the lock. The callback is executed asynchronously in the same thread that calls lockAsync.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testLockAsync0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG: string = 'testLockAsync0014';
      try {
        let res = '';
        let lock = new ArkTSUtils.locks.AsyncLock();
        let state1: boolean = false;
        let state2: boolean = false;
        lock.lockAsync(async () => {
          res += 'l1开始-';
          await Sleep(500);
        }, ArkTSUtils.locks.AsyncLockMode.SHARED).then(() => {
          res += 'l1结束-';
          state1 = true;
        })
        await Sleep(200);
        lock.lockAsync(async () => {
          res += 'l2开始-';
          await Sleep(500);
        }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE).then(() => {
          res += 'l2结束';
          state2 = true;
        })
        while (!(state1 && state2)) {
          await loadCase();
        }
        expect(res).assertEqual('l1开始-l1结束-l2开始-l2结束');
      } catch (error) {
        console.error(`${TAG} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_2500
     * @tc.name      : testLockAsync0015
     * @tc.desc      : Perform operations exclusively under the acquired locks. The method first acquires the lock, then calls the callback,
     *                 and finally releases the lock. The callback is executed asynchronously in the same thread that calls lockAsync.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testLockAsync0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG: string = 'testLockAsync0015';
      try {
        let res = '';
        let lock = new ArkTSUtils.locks.AsyncLock();
        let state1: boolean = false;
        let state2: boolean = false;
        lock.lockAsync(async () => {
          res += 'l1开始-';
          await Sleep(500);
        }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE).then(() => {
          res += 'l1结束-';
          state1 = true;
        })
        await Sleep(200);
        lock.lockAsync(async () => {
          res += 'l2开始-';
          await Sleep(500);
        }, ArkTSUtils.locks.AsyncLockMode.SHARED).then(() => {
          res += 'l2结束';
          state2 = true;
        })
        while (!(state1 && state2)) {
          await loadCase();
        }
        expect(res).assertEqual('l1开始-l1结束-l2开始-l2结束');
      } catch (error) {
        console.error(`${TAG} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_2600
     * @tc.name      : testLockAsync0016
     * @tc.desc      : Perform operations exclusively under the acquired locks. The method first acquires the lock, then calls the callback,
     *                 and finally releases the lock. The callback is executed asynchronously in the same thread that calls lockAsync.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testLockAsync0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG: string = 'testLockAsync0016';
      try {
        let res = '';
        let lock = new ArkTSUtils.locks.AsyncLock();
        let state1: boolean = false;
        let state2: boolean = false;
        lock.lockAsync(async () => {
          res += 'l1开始-';
          await Sleep(500);
        }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE).then(() => {
          res += 'l1结束-';
          state1 = true;
        })
        await Sleep(200);
        lock.lockAsync(async () => {
          res += 'l2开始-';
          await Sleep(500);
        }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE).then(() => {
          res += 'l2结束';
          state2 = true;
        })
        while (!(state1 && state2)) {
          await loadCase();
        }
        expect(res).assertEqual('l1开始-l1结束-l2开始-l2结束');
      } catch (error) {
        console.error(`${TAG} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.number     : SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_2700
     * @tc.name       : testLockAsync0017
     * @tc.desc       : Test the function of the interface LockAsync.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLockAsync0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testLockAsync0017";
      try {
        let l1_start = 0;
        let l1_end = 0;
        let l2_start = 0;
        let l2_end = 0;
        let task1: taskpool.Task = new taskpool.Task(sharedTaskTime, TAG);
        let task2: taskpool.Task = new taskpool.Task(sharedTaskTime, TAG);
        let state1: boolean = false;
        let state2: boolean = false;
        taskpool.execute(task1).then(value => {
          const res = value as Array<number>;
          l1_start = res[0];
          l1_end = res[1];
          state1 = true;
        })
        await Sleep(100);
        taskpool.execute(task2).then(value => {
          const res = value as Array<number>;
          l2_start = res[0];
          l2_end = res[1];
          state2 = true;
        })
        while (!(state1 && state2)) {
          await loadCase();
        }
        const res = (l1_start < l2_start) && (l2_start <= l1_end) && (l1_end < l2_end);
        expect(res).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.number     : SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_2800
     * @tc.name       : testLockAsync0018
     * @tc.desc       : Test the function of the interface LockAsync.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLockAsync0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testLockAsync0018";
      try {
        const lockName = 'name';
        let res = false;
        let A = 0;
        let B = 0;
        let task1: taskpool.Task = new taskpool.Task(sharedTimeTask, lockName);
        let task2: taskpool.Task = new taskpool.Task(exclusiveTimeTask, lockName);
        let state1: boolean = false;
        let state2: boolean = false;
        taskpool.execute(task1).then(value => {
          const res = value as Array<number>;
          A = res[1];
          state1 = true;
        })
        await Sleep(200);
        taskpool.execute(task2).then(value => {
          const res = value as Array<number>;
          B = res[1];
          state2 = true;
        })
        while (!(state1 && state2)) {
          await loadCase();
        }
        res = B - A >= 200;
        expect(res).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.number     : SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_2900
     * @tc.name       : testLockAsync0019
     * @tc.desc       : Test the function of the interface LockAsync.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLockAsync0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testLockAsync0019";
      try {
        const lockName = 'name';
        let res = false;
        let A = 0;
        let B = 0;
        let task1: taskpool.Task = new taskpool.Task(exclusiveTimeTask, lockName);
        let task2: taskpool.Task = new taskpool.Task(sharedTimeTask, lockName);
        let state1: boolean = false;
        let state2: boolean = false;
        taskpool.execute(task1).then(value => {
          const res = value as Array<number>;
          A = res[1];
          state1 = true;
        })
        await Sleep(200);
        taskpool.execute(task2).then(value => {
          const res = value as Array<number>;
          B = res[1];
          state2 = true;
        })
        while (!(state1 && state2)) {
          await loadCase();
        }
        res = B - A >= 500;
        expect(res).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.number     : SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_3000
     * @tc.name       : testLockAsync0020
     * @tc.desc       : Test the function of the interface LockAsync.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLockAsync0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testLockAsync0020";
      try {
        let res = "";
        let task1: taskpool.Task = new taskpool.Task(exclusiveTask, TAG, 'A');
        let task2: taskpool.Task = new taskpool.Task(exclusiveTask, TAG, 'B');
        let state1: boolean = false;
        let state2: boolean = false;
        taskpool.execute(task1).then(value => {
          res += (value as string);
          state1 = true;
        })
        await Sleep(200);
        taskpool.execute(task2).then(value => {
          res += (value as string);
          state2 = true;
        })
        while (!(state1 && state2)) {
          await loadCase();
        }
        expect(res).assertEqual('AB');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.number     : SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_3100
     * @tc.name       : testLockAsync0021
     * @tc.desc       : Test the function of the interface LockAsync.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLockAsync0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testLockAsync0021";
      try {
        let l1_start = 0;
        let l1_end = 0;
        let l2_start = 0;
        let l2_end = 0;
        let lock = ArkTSUtils.locks.AsyncLock.request(TAG);
        let task1: taskpool.Task = new taskpool.Task(locksTimeTask, lock, ArkTSUtils.locks.AsyncLockMode.SHARED);
        let task2: taskpool.Task = new taskpool.Task(locksTimeTask, lock, ArkTSUtils.locks.AsyncLockMode.SHARED);
        let state1: boolean = false;
        let state2: boolean = false;
        taskpool.execute(task1).then(value => {
          const res = value as Array<number>;
          l1_start = res[0];
          l1_end = res[1];
          state1 = true;
        })
        await Sleep(200);
        taskpool.execute(task2).then(value => {
          const res = value as Array<number>;
          l2_start = res[0];
          l2_end = res[1];
          state2 = true;
        })
        while (!(state1 && state2)) {
          await loadCase();
        }
        const res = (l1_start < l2_start) && (l2_start <= l1_end) && (l1_end < l2_end);
        expect(res).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.number     : SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_3200
     * @tc.name       : testLockAsync0022
     * @tc.desc       : Test the function of the interface LockAsync.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLockAsync0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testLockAsync0022";
      try {
        let res = '';
        let lock = ArkTSUtils.locks.AsyncLock.request(TAG);
        let task1: taskpool.Task = new taskpool.Task(locksTask, lock, ArkTSUtils.locks.AsyncLockMode.SHARED);
        let task2: taskpool.Task = new taskpool.Task(locksTask, lock, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
        await taskpool.execute(task1).then(value => {
          res += (value as string);
        })
        taskpool.execute(task2).then(value => {
          res += (value as string);
        })
        expect(res).assertEqual('A');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.number     : SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_3300
     * @tc.name       : testLockAsync0023
     * @tc.desc       : Test the function of the interface LockAsync.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLockAsync0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testLockAsync0023";
      try {
        let res = '';
        let lock = ArkTSUtils.locks.AsyncLock.request(TAG);
        let task1: taskpool.Task = new taskpool.Task(locksTask, lock, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
        let task2: taskpool.Task = new taskpool.Task(locksTask, lock, ArkTSUtils.locks.AsyncLockMode.SHARED);
        let state1: boolean = false;
        let state2: boolean = false;
        taskpool.execute(task1).then(value => {
          res += (value as string);
          state1 = true;
        })
        await Sleep(200);
        taskpool.execute(task2).then(value => {
          res += (value as string);
          state2 = true;
        })
        while (!(state1 && state2)) {
          await loadCase();
        }
        expect(res).assertEqual('BA');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.number     : SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_3400
     * @tc.name       : testLockAsync0024
     * @tc.desc       : Test the function of the interface LockAsync.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLockAsync0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testLockAsync0024";
      try {
        let res = '';
        let lock = ArkTSUtils.locks.AsyncLock.request(TAG);
        let task1: taskpool.Task = new taskpool.Task(lockExclusiveTask, lock, 'A');
        let task2: taskpool.Task = new taskpool.Task(lockExclusiveTask, lock, 'B');
        let state1: boolean = false;
        let state2: boolean = false;
        taskpool.execute(task1).then(value => {
          res += (value as string);
          state1 = true;
        })
        await Sleep(200);
        taskpool.execute(task2).then(value => {
          res += (value as string);
          state2 = true;
        })
        while (!(state1 && state2)) {
          await loadCase();
        }
        expect(res).assertEqual('AB');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.number     : SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_3500
     * @tc.name       : testAsyncLockMode0001
     * @tc.desc       : Test the function of the interface LockAsyncMode.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAsyncLockMode0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testAsyncLockMode0001";
      try {
        let res = '';
        let lock = new ArkTSUtils.locks.AsyncLock;
        let state1: boolean = false;
        let state2: boolean = false;
        lock.lockAsync(async () => {
          console.log('shared0');
          res += 'A'
          state1 = true;
        }, ArkTSUtils.locks.AsyncLockMode.SHARED);
        await Sleep(200);
        lock.lockAsync(async () => {
          console.log('shared1');
          res += 'B'
          state2 = true;
        }, ArkTSUtils.locks.AsyncLockMode.SHARED);
        while (!(state1 && state2)) {
          await loadCase();
        }
        expect(res).assertEqual('AB');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.number     : SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_3600
     * @tc.name       : testAsyncLockMode0002
     * @tc.desc       : Test the function of the interface LockAsyncMode.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAsyncLockMode0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testAsyncLockMode0002";
      try {
        let res = '';
        let lock = ArkTSUtils.locks.AsyncLock.request("exclusive0");
        let state1: boolean = false;
        let state2: boolean = false;
        lock.lockAsync(async () => {
          console.log('shared0');
          res += 'A'
          await Sleep(500);
        }, ArkTSUtils.locks.AsyncLockMode.SHARED).then(() => {
          state1 = true;
        });
        await Sleep(200);
        lock.lockAsync(async () => {
          console.log('exclusive0');
          res += 'B'
          await Sleep(500);
          state2 = true;
        }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
        while (!(state1 && state2)) {
          await loadCase();
        }
        expect(res).assertEqual('AB');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.number     : SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_3700
     * @tc.name       : testAsyncLockOptions0001
     * @tc.desc       : Test the function of the interface LockAsyncOptions.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAsyncLockOptions0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testAsyncLockOptions0001";
      try {
        let options = new ArkTSUtils.locks.AsyncLockOptions<string>();
        expect(options instanceof ArkTSUtils.locks.AsyncLockOptions).assertTrue();
        expect(options.isAvailable).assertFalse();
        expect(options.signal).assertNull();
        expect(options.timeout).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.number     : SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_3800
     * @tc.name       : testAsyncLockOptions0002
     * @tc.desc       : Test the function of the interface LockAsyncOptions.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAsyncLockOptions0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testAsyncLockOptions0002";
      try {
        let lock = new ArkTSUtils.locks.AsyncLock();
        let options = new ArkTSUtils.locks.AsyncLockOptions<string>();
        options.isAvailable = true;
        let res = '';
        lock.lockAsync(async () => {
          console.log('shared0');
          res += 'A';
          await new Promise<void>((resolve) => setTimeout(resolve, 100));
        }, ArkTSUtils.locks.AsyncLockMode.SHARED, options);
        lock.lockAsync(async () => {
          console.log('shared0');
          res += 'B';
        }, ArkTSUtils.locks.AsyncLockMode.SHARED, options);
        console.log(`${TAG} result:` + res);
        expect(options.isAvailable).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.number     : SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_3900
     * @tc.name       : testAsyncLockOptions0003
     * @tc.desc       : Test the function of the interface LockAsyncOptions.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAsyncLockOptions0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testAsyncLockOptions0003";
      try {
        let lock = new ArkTSUtils.locks.AsyncLock();
        let options = new ArkTSUtils.locks.AsyncLockOptions<string>();
        options.isAvailable = false;
        lock.lockAsync(async () => {
          console.log('shared0');
          await Sleep(1000);
        }, ArkTSUtils.locks.AsyncLockMode.SHARED, options);
        console.log(`${TAG} result:` + options.isAvailable);
        expect(options.isAvailable).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.number     : SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_4000
     * @tc.name       : testAsyncLockOptions0004
     * @tc.desc       : Test the function of the interface LockAsyncOptions.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAsyncLockOptions0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testAsyncLockOptions0004";
      try {
        let lock = new ArkTSUtils.locks.AsyncLock();
        let options = new ArkTSUtils.locks.AsyncLockOptions<string>();
        options.signal = null;
        lock.lockAsync(async () => {
          console.log('shared0');
          await Sleep(1000);
        }, ArkTSUtils.locks.AsyncLockMode.SHARED, options);
        console.log(`${TAG} result:` + options.signal);
        expect(options.signal).assertEqual(null);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.number     : SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_4100
     * @tc.name       : testAsyncLockOptions0005
     * @tc.desc       : Test the function of the interface LockAsyncOptions.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAsyncLockOptions0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testAsyncLockOptions0005";
      try {
        let lock = new ArkTSUtils.locks.AsyncLock();
        let options = new ArkTSUtils.locks.AsyncLockOptions<string>();
        options.signal = {
          aborted: true, reason: "error"
        };
        lock.lockAsync(async () => {
          console.log('shared0');
          await Sleep(1000);
        }, ArkTSUtils.locks.AsyncLockMode.SHARED, options);
        console.log(`${TAG} result:` + JSON.stringify(options.signal));
        expect(JSON.stringify(options.signal)).assertEqual('{"aborted":true,"reason":"error"}');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.number     : SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_4200
     * @tc.name       : testAsyncLockOptions0006
     * @tc.desc       : Test the function of the interface LockAsyncOptions.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAsyncLockOptions0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testAsyncLockOptions0006";
      try {
        let lock = new ArkTSUtils.locks.AsyncLock();
        let options = new ArkTSUtils.locks.AsyncLockOptions<string>();
        options.signal = {
          aborted: false, reason: "error"
        };
        lock.lockAsync(async () => {
          console.log('shared0');
          await Sleep(1000);
        }, ArkTSUtils.locks.AsyncLockMode.SHARED, options);
        console.log(`${TAG} result:` + JSON.stringify(options.signal));
        expect(JSON.stringify(options.signal)).assertEqual('{"aborted":false,"reason":"error"}');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.number     : SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_4300
     * @tc.name       : testAsyncLockOptions0007
     * @tc.desc       : Test the function of the interface LockAsyncOptions.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAsyncLockOptions0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testAsyncLockOptions0007";
      try {
        let lock = new ArkTSUtils.locks.AsyncLock();
        let options = new ArkTSUtils.locks.AsyncLockOptions<string>();
        options.timeout = 0;
        lock.lockAsync(async () => {
          console.log('shared0');
          await Sleep(1000);
        }, ArkTSUtils.locks.AsyncLockMode.SHARED, options);
        console.log(`${TAG} result:` + options.timeout);
        expect(options.timeout).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.number     : SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_4400
     * @tc.name       : testAsyncLockOptions0008
     * @tc.desc       : Test the function of the interface LockAsyncOptions.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAsyncLockOptions0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testAsyncLockOptions0008";
      try {
        let lock = new ArkTSUtils.locks.AsyncLock();
        let options = new ArkTSUtils.locks.AsyncLockOptions<string>();
        options.timeout = 1000;
        lock.lockAsync(async () => {
          console.log('shared0');
          await Sleep(1000);
        }, ArkTSUtils.locks.AsyncLockMode.SHARED, options);
        console.log(`${TAG} result:` + options.timeout);
        expect(options.timeout).assertEqual(1000);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.number     : SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_4500
     * @tc.name       : testAsyncLockState0001
     * @tc.desc       : Test the function of the interface LockAsyncState.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAsyncLockState0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testAsyncLockState0001";
      try {
        let lock = ArkTSUtils.locks.AsyncLock.request(TAG);
        lock.lockAsync(async () => {
          await Sleep(1000);
        })
        let state = ArkTSUtils.locks.AsyncLock.query(TAG);
        let held: ArkTSUtils.locks.AsyncLockInfo[] = state.held;
        let res = false;
        for (let i = 0; i < held.length; i++) {
          if (held[i].name == TAG) {
            res = true;
          }
        }
        expect(res).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.number     : SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_4600
     * @tc.name       : testAsyncLockState0002
     * @tc.desc       : Test the function of the interface LockAsyncState.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAsyncLockState0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testAsyncLockState0002";
      try {
        let lock = ArkTSUtils.locks.AsyncLock.request(TAG);
        lock.lockAsync(async () => {
          await Sleep(1000);
        }, ArkTSUtils.locks.AsyncLockMode.SHARED);
        let state = ArkTSUtils.locks.AsyncLock.query(TAG);
        let held: ArkTSUtils.locks.AsyncLockInfo[] = state.held;
        let res = false;
        for (let i = 0; i < held.length; i++) {
          if (held[i].name == TAG) {
            res = held[i].mode == ArkTSUtils.locks.AsyncLockMode.SHARED;
          }
        }
        expect(res).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.number     : SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_4700
     * @tc.name       : testAsyncLockState0003
     * @tc.desc       : Test the function of the interface LockAsyncState.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAsyncLockState0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testAsyncLockState0003";
      try {
        let lock = ArkTSUtils.locks.AsyncLock.request(TAG);
        lock.lockAsync(async () => {
          await Sleep(1000);
        }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
        let state = ArkTSUtils.locks.AsyncLock.query(TAG);
        let held: ArkTSUtils.locks.AsyncLockInfo[] = state.held;
        let res = false;
        for (let i = 0; i < held.length; i++) {
          if (held[i].name == TAG) {
            res = held[i].mode == ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE;
          }
        }
        expect(res).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.number     : SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_4800
     * @tc.name       : testAsyncLockState0004
     * @tc.desc       : Test the function of the interface LockAsyncState.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAsyncLockState0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testAsyncLockState0004";
      try {
        let lock = ArkTSUtils.locks.AsyncLock.request(TAG);
        lock.lockAsync(async () => {
          await Sleep(1000);
        }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
        let state = ArkTSUtils.locks.AsyncLock.query(TAG);
        let held: ArkTSUtils.locks.AsyncLockInfo[] = state.held;
        let res = false;
        for (let i = 0; i < held.length; i++) {
          if (held[i].name == TAG) {
            res = Number.isFinite(held[i].contextId);
          }
        }
        expect(res).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.number     : SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_4900
     * @tc.name       : testAsyncLockState0005
     * @tc.desc       : Test the function of the interface LockAsyncState.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAsyncLockState0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testAsyncLockState0005";
      try {
        let lock = ArkTSUtils.locks.AsyncLock.request(TAG);
        lock.lockAsync(async () => {
          await Sleep(1000);
        }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
        lock.lockAsync(async () => {
        }, ArkTSUtils.locks.AsyncLockMode.SHARED);
        let state = ArkTSUtils.locks.AsyncLock.query(TAG);
        let pending: ArkTSUtils.locks.AsyncLockInfo[] = state.pending;
        let res = false;
        for (let i = 0; i < pending.length; i++) {
          if (pending[i].name == TAG) {
            res = true;
          }
        }
        expect(res).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.number     : SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_5000
     * @tc.name       : testAsyncLockState0006
     * @tc.desc       : Test the function of the interface LockAsyncState.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAsyncLockState0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testAsyncLockState0006";
      try {
        let lock = ArkTSUtils.locks.AsyncLock.request(TAG);
        lock.lockAsync(async () => {
          await Sleep(1000);
        }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
        lock.lockAsync(async () => {
        }, ArkTSUtils.locks.AsyncLockMode.SHARED);
        let state = ArkTSUtils.locks.AsyncLock.query(TAG);
        let pending: ArkTSUtils.locks.AsyncLockInfo[] = state.pending;
        let res = false;
        for (let i = 0; i < pending.length; i++) {
          if (pending[i].name == TAG) {
            res = pending[i].mode == ArkTSUtils.locks.AsyncLockMode.SHARED;
          }
        }
        expect(res).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.number     : SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_5100
     * @tc.name       : testAsyncLockState0007
     * @tc.desc       : Test the function of the interface LockAsyncState.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAsyncLockState0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testAsyncLockState0007";
      try {
        let lock = ArkTSUtils.locks.AsyncLock.request(TAG);
        lock.lockAsync(async () => {
          await Sleep(1000);
        }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
        lock.lockAsync(async () => {
        }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
        let state = ArkTSUtils.locks.AsyncLock.query(TAG);
        let pending: ArkTSUtils.locks.AsyncLockInfo[] = state.pending;
        let res = false;
        for (let i = 0; i < pending.length; i++) {
          if (pending[i].name == TAG) {
            res = pending[i].mode == ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE;
          }
        }
        expect(res).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.number     : SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_5200
     * @tc.name       : testAsyncLockState0008
     * @tc.desc       : Test the function of the interface LockAsyncState.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAsyncLockState0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testAsyncLockState0008";
      try {
        let lock = ArkTSUtils.locks.AsyncLock.request(TAG);
        lock.lockAsync(async () => {
          await Sleep(1000);
        }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
        lock.lockAsync(async () => {
        }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
        let state = ArkTSUtils.locks.AsyncLock.query(TAG);
        let pending: ArkTSUtils.locks.AsyncLockInfo[] = state.pending;
        let res = false;
        for (let i = 0; i < pending.length; i++) {
          if (pending[i].name == TAG) {
            res = Number.isFinite(pending[i].contextId);
          }
        }
        expect(res).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })


    /**
     * @tc.number     : SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_5300
     * @tc.name       : testISendable0001
     * @tc.desc       : Test the function of the interface ISendable.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testISendable0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testISendable0001";
      try {
        type ISendable = lang.ISendable;
        let jsonText = '{"name": "John", "age": 30, "city": "ChongQing"}';
        let obj = ArkTSUtils.ASON.parse(jsonText) as ISendable;
        expect((obj as object)?.["name"]).assertEqual('John');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.number     : SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_5400
     * @tc.name       : testTransformer0001
     * @tc.desc       : Test the function of the interface Transformer.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTransformer0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testTransformer0001";
      try {
        type ISendable = lang.ISendable;
        let options: ArkTSUtils.ASON.ParseOptions = {
          bigIntMode: ArkTSUtils.ASON.BigIntMode.PARSE_AS_BIGINT,
          parseReturnType: ArkTSUtils.ASON.ParseReturnType.OBJECT,
        }
        let numberText = '{"largeNumber":1}';
        let numberObj = ArkTSUtils.ASON.parse(numberText, undefined, options) as ISendable;
        expect((numberObj as object)?.["largeNumber"]).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.number     : SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_5500
     * @tc.name       : testAsyncLockParseOptions0001
     * @tc.desc       : Test the function of the interface LockAsyncParseOptions.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAsyncLockParseOptions0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testAsyncLockParseOptions0001";
      try {
        type ISendable = lang.ISendable;
        let options: ArkTSUtils.ASON.ParseOptions = {
          bigIntMode: ArkTSUtils.ASON.BigIntMode.DEFAULT,
          parseReturnType: ArkTSUtils.ASON.ParseReturnType.OBJECT,
        }
        let numberText = '{"largeNumber":112233445566778899n}';
        let numberObj = ArkTSUtils.ASON.parse(numberText, undefined, options) as ISendable;
        console.info(`${TAG} result:` + (numberObj as object)?.["largeNumber"]);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
      }
      done()
    })

    /**
     * @tc.number     : SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_5600
     * @tc.name       : testAsyncLockParseOptions0002
     * @tc.desc       : Test the function of the interface LockAsyncParseOptions.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAsyncLockParseOptions0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testAsyncLockParseOptions0002";
      try {
        type ISendable = lang.ISendable;
        let options: ArkTSUtils.ASON.ParseOptions = {
          bigIntMode: ArkTSUtils.ASON.BigIntMode.PARSE_AS_BIGINT,
          parseReturnType: ArkTSUtils.ASON.ParseReturnType.OBJECT,
        }
        let numberText = '{"largeNumber":9007199254740992}';
        let numberObj = ArkTSUtils.ASON.parse(numberText, undefined, options) as ISendable;
        console.info(`${TAG} result:` + typeof (numberObj as object)?.["largeNumber"]);
        expect(typeof (numberObj as object)?.["largeNumber"]).assertEqual(`bigint`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.number     : SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_5700
     * @tc.name       : testAsyncLockParseOptions0003
     * @tc.desc       : Test the function of the interface LockAsyncParseOptions.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAsyncLockParseOptions0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testAsyncLockParseOptions0003";
      try {
        type ISendable = lang.ISendable;
        let options: ArkTSUtils.ASON.ParseOptions = {
          bigIntMode: ArkTSUtils.ASON.BigIntMode.ALWAYS_PARSE_AS_BIGINT,
          parseReturnType: ArkTSUtils.ASON.ParseReturnType.OBJECT,
        }
        let numberText = '{"largeNumber":1}';
        let numberObj = ArkTSUtils.ASON.parse(numberText, undefined, options) as ISendable;
        console.info(`${TAG} result:` + typeof (numberObj as object)?.["largeNumber"]);
        expect(typeof (numberObj as object)?.["largeNumber"]).assertEqual(`bigint`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.number     : SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_5800
     * @tc.name       : testAsyncLockParseOptions0004
     * @tc.desc       : Test the function of the interface LockAsyncParseOptions.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAsyncLockParseOptions0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testAsyncLockParseOptions0004";
      try {
        let options: ArkTSUtils.ASON.ParseOptions = {
          bigIntMode: ArkTSUtils.ASON.BigIntMode.DEFAULT,
          parseReturnType: ArkTSUtils.ASON.ParseReturnType.OBJECT,
        }
        let numberText = '{"largeNumber":1}';
        let numberObj = ArkTSUtils.ASON.parse(numberText, undefined, options);
        console.info(`${TAG} result:` + numberObj);
        expect(ArkTSUtils.isSendable(numberObj)).assertTrue();
        expect(typeof numberObj).assertEqual('object');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.number     : SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_5900
     * @tc.name       : testParse0001
     * @tc.desc       : Test the function of the interface Parse.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testParse0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testParse0001";
      try {
        type ISendable = lang.ISendable;
        let text = '';
        ArkTSUtils.ASON.parse(text) as ISendable;
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
      }
      done()
    })

    /**
     * @tc.number     : SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_6000
     * @tc.name       : testParse0002
     * @tc.desc       : Test the function of the interface Parse.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testParse0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testParse0002";
      try {
        type ISendable = lang.ISendable;
        let text = '{"name" "John", "age": 30, "city": "ChongQing"}';
        ArkTSUtils.ASON.parse(text) as ISendable;
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
      }
      done()
    })

    /**
     * @tc.number     : SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_6100
     * @tc.name       : testParse0003
     * @tc.desc       : Test the function of the interface Parse.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testParse0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testParse0003";
      try {
        type ISendable = lang.ISendable;
        let jsonText = '{"name": "John", "age": 30, "city": "ChongQing"}';
        const obj = ArkTSUtils.ASON.parse(jsonText) as ISendable;
        expect((obj as object)?.["name"]).assertEqual("John");
        expect(ArkTSUtils.isSendable(obj)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.number     : SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_6200
     * @tc.name       : testParse0004
     * @tc.desc       : Test the function of the interface Parse.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testParse0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testParse0004";
      try {
        type ISendable = lang.ISendable;
        let jsonText = '{"name": "John", "age": 30, "city": "ChongQing"}';
        const obj = ArkTSUtils.ASON.parse(jsonText, undefined, undefined) as ISendable;
        expect((obj as object)?.["name"]).assertEqual("John");
        expect(ArkTSUtils.isSendable(obj)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.number     : SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_6300
     * @tc.name       : testParse0005
     * @tc.desc       : Test the function of the interface Parse.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testParse0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testParse0005";
      try {
        type ISendable = lang.ISendable;
        let jsonText = '{"name": "John", "age": 30, "bigInt": 1234567890123456789012345678901234567890}';
        let options: ArkTSUtils.ASON.ParseOptions = {
          bigIntMode: ArkTSUtils.ASON.BigIntMode.DEFAULT,
          parseReturnType: ArkTSUtils.ASON.ParseReturnType.OBJECT,
        };
        const obj = ArkTSUtils.ASON.parse(jsonText, undefined, options) as ISendable;
        expect((obj as object)?.["bigInt"]).assertEqual(1.2345678901234568e+39);
        expect((obj as object)?.["age"]).assertEqual(30);
        expect(ArkTSUtils.isSendable(obj)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.number     : SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_6400
     * @tc.name       : testParse0006
     * @tc.desc       : Test the function of the interface Parse.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testParse0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testParse0006";
      try {
        type ISendable = lang.ISendable;
        let jsonText = '{"name": "John", "age": 30, "bigInt": 1234567890123456789012345678901234567890}';
        let options: ArkTSUtils.ASON.ParseOptions = {
          bigIntMode: ArkTSUtils.ASON.BigIntMode.PARSE_AS_BIGINT,
          parseReturnType: ArkTSUtils.ASON.ParseReturnType.OBJECT,
        }
        const obj = ArkTSUtils.ASON.parse(jsonText, undefined, options) as ISendable;
        expect((obj as object)?.["bigInt"]).assertEqual(1234567890123456789012345678901234567890n);
        expect((obj as object)?.["age"]).assertEqual(30);
        expect(ArkTSUtils.isSendable(obj)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.number     : SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_6500
     * @tc.name       : testParse0007
     * @tc.desc       : Test the function of the interface Parse.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testParse0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testParse0007";
      try {
        type ISendable = lang.ISendable;
        let jsonText = '{"name": "John", "age": 30, "bigInt": 1234567890123456789012345678901234567890}';
        let options: ArkTSUtils.ASON.ParseOptions = {
          bigIntMode: ArkTSUtils.ASON.BigIntMode.ALWAYS_PARSE_AS_BIGINT,
          parseReturnType: ArkTSUtils.ASON.ParseReturnType.OBJECT,
        }
        const obj = ArkTSUtils.ASON.parse(jsonText, undefined, options) as ISendable;
        expect((obj as object)?.["bigInt"]).assertEqual(1234567890123456789012345678901234567890n);
        expect((obj as object)?.["age"]).assertEqual(30n);
        expect(ArkTSUtils.isSendable(obj)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.number     : SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_6600
     * @tc.name       : testStringify0001
     * @tc.desc       : Test the function of the interface Stringify.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testStringify0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testStringify0001";
      try {
        let str = ArkTSUtils.ASON.stringify(null);
        expect(str).assertEqual(JSON.stringify(null));
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_6700
     * @tc.name       : testStringify0002
     * @tc.desc       : Test the function of the interface Stringify.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testStringify0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testStringify0002";
      try {
        let str = ArkTSUtils.ASON.stringify(undefined);
        expect(str).assertEqual(JSON.stringify(undefined));
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_6800
     * @tc.name       : testStringify0003
     * @tc.desc       : Test the function of the interface Stringify.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testStringify0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testStringify0003";
      try {
        let str = ArkTSUtils.ASON.stringify(4);
        expect(str).assertEqual(JSON.stringify(4));
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_6900
     * @tc.name       : testStringify0004
     * @tc.desc       : Test the function of the interface Parse.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testStringify0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testStringify0004";
      try {
        let str = ArkTSUtils.ASON.stringify(true);
        expect(str).assertEqual(JSON.stringify(true));
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_7000
     * @tc.name       : testStringify0005
     * @tc.desc       : Test the function of the interface Parse.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testStringify0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testStringify0005";
      try {
        let num: bigint = 123456789012345123456789012345n;
        let str = ArkTSUtils.ASON.stringify(num);
        let value = num.valueOf()
        expect(str).assertEqual(value.toString())
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.number     : SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_7100
     * @tc.name       : testStringify0006
     * @tc.desc       : Test the function of the interface Parse.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testStringify0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testStringify0006";
      try {
        let str = ArkTSUtils.ASON.stringify('testStringify0009');
        expect(str).assertEqual(JSON.stringify('testStringify0009'));
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.number     : SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_7200
     * @tc.name       : testStringify0007
     * @tc.desc       : Test the function of the interface Parse.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testStringify0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testStringify0007";
      try {
        type ISendable = lang.ISendable;
        let value: ISendable | number | null;
        value = 10;
        value = null;
        let str = ArkTSUtils.ASON.stringify(value);
        expect(str).assertEqual(JSON.stringify(value));
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.number     : SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_7300
     * @tc.name       : testStringify0008
     * @tc.desc       : Test the function of the interface Parse.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testStringify0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testStringify0008";
      try {
        let lock1 = new ArkTSUtils.locks.AsyncLock();
        let str = ArkTSUtils.ASON.stringify(lock1);
        expect(str).assertEqual(JSON.stringify(lock1));
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.number     : SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_7400
     * @tc.name       : testStringify0009
     * @tc.desc       : Test the function of the interface Parse.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testStringify0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testStringify0009";
      try {
        let value = new collections.BitVector(1);
        let str = ArkTSUtils.ASON.stringify(value);
        expect(str).assertEqual(JSON.stringify(value));
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.number     : SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_7600
     * @tc.name       : testStringify0011
     * @tc.desc       : Test the function of the interface Parse.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testStringify0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testStringify0011";
      try {
        let value = new collections.Map<string, string>();
        let str = ArkTSUtils.ASON.stringify(value);
        expect(str).assertEqual(JSON.stringify(value));
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.number     : SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_7700
     * @tc.name       : testStringify0012
     * @tc.desc       : Test the function of the interface Parse.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testStringify0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testStringify0012";
      try {
        let value = new collections.Array<number>(1, 2, 3);
        let str = ArkTSUtils.ASON.stringify(value);
        expect(str).assertEqual(JSON.stringify(value));
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.number     : SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_7800
     * @tc.name       : testStringify0013
     * @tc.desc       : Test the function of the interface Parse.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testStringify0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testStringify0013";
      try {
        let concatArray: collections.ConcatArray<number> = new collections.Array<number>(1, 2, 4);
        let str = ArkTSUtils.ASON.stringify(concatArray);
        expect(str).assertEqual(JSON.stringify(concatArray));
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.number     : SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_7900
     * @tc.name       : testIsSendable0001
     * @tc.desc       : Test the function of the interface IsSendable.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIsSendable0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testIsSendable0001";
      try {
        let value: [] = [];
        expect(ArkTSUtils.isSendable(value)).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.number     : SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_8000
     * @tc.name       : testIsSendable0002
     * @tc.desc       : Test the function of the interface IsSendable.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIsSendable0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testIsSendable0002";
      try {
        let value = null;
        expect(ArkTSUtils.isSendable(value)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.number     : SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_8100
     * @tc.name       : testIsSendable0003
     * @tc.desc       : Test the function of the interface IsSendable.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIsSendable0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testIsSendable0003";
      try {
        let value = undefined;
        expect(ArkTSUtils.isSendable(value)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.number     : SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_8200
     * @tc.name       : testIsSendable0004
     * @tc.desc       : Test the function of the interface IsSendable.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIsSendable0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testIsSendable0004";
      try {
        let value: number = 1;
        expect(ArkTSUtils.isSendable(value)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.number     : SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_8300
     * @tc.name       : testIsSendable0005
     * @tc.desc       : Test the function of the interface IsSendable.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIsSendable0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testIsSendable0005";
      try {
        let value: boolean = false;
        expect(ArkTSUtils.isSendable(value)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.number     : SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_8400
     * @tc.name       : testIsSendable0006
     * @tc.desc       : Test the function of the interface IsSendable.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIsSendable0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testIsSendable0006";
      try {
        let value: bigint = 1n;
        expect(ArkTSUtils.isSendable(value)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.number     : SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_8500
     * @tc.name       : testIsSendable0007
     * @tc.desc       : Test the function of the interface IsSendable.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIsSendable0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testIsSendable0007";
      try {
        let value: Date = new Date();
        expect(ArkTSUtils.isSendable(value)).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.number     : SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_8600
     * @tc.name       : testIsSendable0008
     * @tc.desc       : Test the function of the interface IsSendable.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIsSendable0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testIsSendable0008";
      try {
        let value: String = '1';
        expect(ArkTSUtils.isSendable(value)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.number     : SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_8700
     * @tc.name       : testIsSendable0009
     * @tc.desc       : Test the function of the interface IsSendable.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIsSendable0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testIsSendable0009";
      try {
        let value: RegExp = /1/g;
        expect(ArkTSUtils.isSendable(value)).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.number     : SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_8800
     * @tc.name       : testIsSendable0010
     * @tc.desc       : Test the function of the interface IsSendable.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIsSendable0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testIsSendable0010";
      try {
        let value: Array<string> = new Array()
        expect(ArkTSUtils.isSendable(value)).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.number     : SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_8900
     * @tc.name       : testIsSendable0011
     * @tc.desc       : Test the function of the interface IsSendable.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIsSendable0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testIsSendable0011";
      try {
        let value: Map<string, string> = new Map()
        expect(ArkTSUtils.isSendable(value)).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.number     : SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_9000
     * @tc.name       : testIsSendable0012
     * @tc.desc       : Test the function of the interface IsSendable.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIsSendable0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testIsSendable0012";
      try {
        let value: Set<string> = new Set();
        expect(ArkTSUtils.isSendable(value)).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.number     : SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_9100
     * @tc.name       : testIsSendable0013
     * @tc.desc       : Test the function of the interface IsSendable.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIsSendable0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testIsSendable0013";
      try {
        interface Object {
          a: 1,
          b: 2
        };
        let value: Object = {
          a: 1, b: 2
        };
        expect(ArkTSUtils.isSendable(value)).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.number     : SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_9200
     * @tc.name       : testIsSendable0014
     * @tc.desc       : Test the function of the interface IsSendable.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIsSendable0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testIsSendable0014";
      try {
        let value: Object = new Object();
        expect(ArkTSUtils.isSendable(value)).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.number     : SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_9300
     * @tc.name       : testIsSendable0015
     * @tc.desc       : Test the function of the interface IsSendable.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIsSendable0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testIsSendable0015";
      try {
        let value: ArrayBuffer = new ArrayBuffer(1);
        expect(ArkTSUtils.isSendable(value)).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.number     : SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_9400
     * @tc.name       : testIsSendable0016
     * @tc.desc       : Test the function of the interface IsSendable.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIsSendable0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testIsSendable0016";
      try {
        let value: Int8Array = new Int8Array();
        expect(ArkTSUtils.isSendable(value)).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.number     : SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_9500
     * @tc.name       : testIsSendable0017
     * @tc.desc       : Test the function of the interface IsSendable.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIsSendable0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testIsSendable0017";
      try {
        let value: Uint8Array = new Uint8Array();
        expect(ArkTSUtils.isSendable(value)).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.number     : SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_9600
     * @tc.name       : testIsSendable0018
     * @tc.desc       : Test the function of the interface IsSendable.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIsSendable0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testIsSendable0018";
      try {
        let value: Uint8ClampedArray = new Uint8ClampedArray();
        expect(ArkTSUtils.isSendable(value)).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.number     : SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_9700
     * @tc.name       : testIsSendable0019
     * @tc.desc       : Test the function of the interface IsSendable.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIsSendable0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testIsSendable0019";
      try {
        let value: Int16Array = new Int16Array();
        expect(ArkTSUtils.isSendable(value)).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.number     : SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_9800
     * @tc.name       : testIsSendable0020
     * @tc.desc       : Test the function of the interface IsSendable.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIsSendable0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testIsSendable0020";
      try {
        let value: Uint16Array = new Uint16Array()
        expect(ArkTSUtils.isSendable(value)).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.number     : SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_9900
     * @tc.name       : testIsSendable0021
     * @tc.desc       : Test the function of the interface IsSendable.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIsSendable0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testIsSendable0021";
      try {
        let value: Int32Array = new Int32Array();
        expect(ArkTSUtils.isSendable(value)).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.number     : SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_10000
     * @tc.name       : testIsSendable0022
     * @tc.desc       : Test the function of the interface IsSendable.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIsSendable0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testIsSendable0022";
      try {
        let value: Uint32Array = new Uint32Array();
        expect(ArkTSUtils.isSendable(value)).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.number     : SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_10100
     * @tc.name       : testIsSendable0023
     * @tc.desc       : Test the function of the interface IsSendable.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIsSendable0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testIsSendable0023";
      try {
        let value: Float32Array = new Float32Array();
        expect(ArkTSUtils.isSendable(value)).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.number     : SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_10200
     * @tc.name       : testIsSendable0024
     * @tc.desc       : Test the function of the interface IsSendable.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIsSendable0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testIsSendable0024";
      try {
        let value: Float64Array = new Float64Array();
        expect(ArkTSUtils.isSendable(value)).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.number     : SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_10300
     * @tc.name       : testIsSendable0025
     * @tc.desc       : Test the function of the interface IsSendable.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIsSendable0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testIsSendable0025";
      try {
        let value: Function = () => {
        };
        expect(ArkTSUtils.isSendable(value)).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.number     : SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_10400
     * @tc.name       : testIsSendable0026
     * @tc.desc       : Test the function of the interface IsSendable.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIsSendable0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testIsSendable0026";
      try {
        let value = new NumClass()
        expect(ArkTSUtils.isSendable(value.GetA())).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail()
      }
      done()
    })

    /**
     * @tc.number     : SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_10500
     * @tc.name       : testIsSendable0027
     * @tc.desc       : Test the function of the interface IsSendable.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIsSendable0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testIsSendable0027";
      try {
        let value = new NumClass();
        expect(ArkTSUtils.isSendable(value.a)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.number     : SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_10600
     * @tc.name       : testIsSendable0028
     * @tc.desc       : Test the function of the interface IsSendable.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIsSendable0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testIsSendable0028";
      try {
        expect(ArkTSUtils.isSendable(NumClass.GetB())).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.number     : SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_10700
     * @tc.name       : testIsSendable0029
     * @tc.desc       : Test the function of the interface IsSendable.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIsSendable0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testIsSendable0029";
      try {
        expect(ArkTSUtils.isSendable(NumClass.b)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.number     : SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_10800
     * @tc.name       : testIsSendable0030
     * @tc.desc       : Test the function of the interface IsSendable.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIsSendable0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testIsSendable0030";
      try {
        let value: collections.ConcatArray<string> = new collections.Array();
        expect(ArkTSUtils.isSendable(value)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.number     : SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_10900
     * @tc.name       : testIsSendable0031
     * @tc.desc       : Test the function of the interface IsSendable.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIsSendable0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testIsSendable0031";
      try {
        let value: collections.Array<string> = new collections.Array();
        expect(ArkTSUtils.isSendable(value)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.number     : SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_11000
     * @tc.name       : testIsSendable0032
     * @tc.desc       : Test the function of the interface IsSendable.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIsSendable0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testIsSendable0032";
      try {
        let value: collections.Map<string, string> = new collections.Map();
        expect(ArkTSUtils.isSendable(value)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.number     : SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_11100
     * @tc.name       : testIsSendable0033
     * @tc.desc       : Test the function of the interface IsSendable.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIsSendable0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testIsSendable0033";
      try {
        let value: collections.Set<string> = new collections.Set();
        expect(ArkTSUtils.isSendable(value)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.number     : SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_11200
     * @tc.name       : testIsSendable0034
     * @tc.desc       : Test the function of the interface IsSendable.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIsSendable0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testIsSendable0034";
      try {
        let value: collections.BitVector = new collections.BitVector(1);
        expect(ArkTSUtils.isSendable(value)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.number     : SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_11300
     * @tc.name       : testIsSendable0035
     * @tc.desc       : Test the function of the interface IsSendable.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIsSendable0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testIsSendable0035";
      try {
        let value: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock();
        expect(ArkTSUtils.isSendable(value)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.number     : SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_11400
     * @tc.name       : testIsSendable0036
     * @tc.desc       : Test the function of the interface IsSendable.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIsSendable0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testIsSendable0036";
      try {
        let sendableClass: SendableClass = new SendableClass();
        expect(ArkTSUtils.isSendable(sendableClass.count_)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.number     : SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_11500
     * @tc.name       : testIsSendable0037
     * @tc.desc       : Test the function of the interface IsSendable.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIsSendable0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testIsSendable0037";
      try {
        let sendableClass: SendableClass = new SendableClass();
        expect(ArkTSUtils.isSendable(sendableClass.getCount_())).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.number     : SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_11600
     * @tc.name       : testIsSendable0038
     * @tc.desc       : Test the function of the interface IsSendable.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIsSendable0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testIsSendable0038";
      try {
        let sendableClass: SendableClass = new SendableClass();
        expect(ArkTSUtils.isSendable(sendableClass)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.number     : SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_11700
     * @tc.name       : testIsSendable0039
     * @tc.desc       : Test the function of the interface IsSendable.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIsSendable0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testIsSendable0039";
      try {
        let sendableClass: SendableClass = new SendableClass();
        expect(ArkTSUtils.isSendable(typeof sendableClass)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.number     : SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_11800
     * @tc.name       : testIsSendable0040
     * @tc.desc       : Test the function of the interface IsSendable.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIsSendable0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testIsSendable0040";
      try {
        expect(ArkTSUtils.isSendable(SendableClass.count)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.number     : SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_11900
     * @tc.name       : testIsSendable0041
     * @tc.desc       : Test the function of the interface IsSendable.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIsSendable0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testIsSendable0041";
      try {
        expect(ArkTSUtils.isSendable(SendableClass.getCount())).assertEqual(true);
        expect(ArkTSUtils.isSendable(SendableClass.getPromiseCount())).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.number     : SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_12000
     * @tc.name       : testIsSendable0042
     * @tc.desc       : Test the function of the interface IsSendable.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIsSendable0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testIsSendable0042";
      try {
        type ISendable = lang.ISendable;
        let jsonText = '{"name": "John", "age": 30, "city": "ChongQing"}';
        let value = ArkTSUtils.ASON.parse(jsonText) as ISendable;
        expect(ArkTSUtils.isSendable(value)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.number     : SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_12100
     * @tc.name       : testIsSendable0043
     * @tc.desc       : Test the function of the interface IsSendable.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIsSendable0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testIsSendable0043";
      try {
        expect(ArkTSUtils.isSendable(sendableFunction)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })
  })
}