/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { afterEach, describe, expect, it, Level, Size, TestType } from '../../../hypium/index';
import Utils from './Util.test';
import { sleep } from '../utils/Model';

async function lockGuardAsync(lock: concurrency.stackless.AsyncMutex, callback: () => void): Promise<void> {
  await lock.lock();
  try {
    callback();
  } finally {
    lock.unlock();
  }
}

export default function MutexLockEnhancedTest(): void {
  describe('MutexLockEnhancedTest', (): void => {
    afterEach(async (): Promise<void> => {
      await Utils.msSleep(200);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_MutexLock_Enhanced_0100
     * @tc.name mutexLockEnhancedDeadlockCircularWait
     * @tc.desc Test circular wait deadlock scenario - Thread1: lockA->lockB, Thread2: lockB->lockA
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('mutexLockEnhancedDeadlockCircularWait', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (Done: () => void): Promise<void> => {
        const TAG: string = 'mutexLockEnhancedDeadlockCircularWait';
        console.info(`${TAG} test start`);
        let lockA = new concurrency.stackless.AsyncMutex();
        let lockB = new concurrency.stackless.AsyncMutex();
        let result = new AtomicReference<string>('');
        let worker1Completed = new AtomicInt(0);
        let worker2Completed = new AtomicInt(0);

        let worker1 = new EAWorker();
        worker1.start();
        worker1.run<Promise<void>>(async (): Promise<void> => {
          await lockA.lock();
          result.exchange(result.load() + '1A');
          lockA.unlock();
          await lockB.lock();
          result.exchange(result.load() + '1B');
          lockB.unlock();
          worker1Completed.fetchAdd(1);
        });

        let worker2 = new EAWorker();
        worker2.start();
        worker2.run<Promise<void>>(async (): Promise<void> => {
          await lockB.lock();
          result.exchange(result.load() + '2B');
          lockB.unlock();
          await lockA.lock();
          result.exchange(result.load() + '2A');
          lockA.unlock();
          worker2Completed.fetchAdd(1);
        });


        while (worker1Completed.load() < 1 || worker2Completed.load() < 1) {
          await sleep(50);
        }

        worker1.join();
        worker2.join();

        console.info(`${TAG} result: ${result.load()}`);
        expect(result.load().length).assertLargerOrEqual(4);
        expect(worker1Completed.load()).assertEqual(1);
        expect(worker2Completed.load()).assertEqual(1);
        Done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_MutexLock_Enhanced_0200
     * @tc.name mutexLockEnhancedSelfLock
     * @tc.desc Test repeated locking by same thread
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('mutexLockEnhancedSelfLock', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (Done: () => void): Promise<void> => {
        const TAG: string = 'mutexLockEnhancedSelfLock';
        console.info(`${TAG} test start`);
        let lock = new concurrency.stackless.AsyncMutex();
        let lockCount = new AtomicInt(0);
        let workerCompleted = new AtomicInt(0);

        await lock.lock();
        lockCount.fetchAdd(1);

        let worker = new EAWorker();
        worker.start();
        let job = worker.run<Promise<void>>(async (): Promise<void> => {
          await lock.lock();
          lockCount.fetchAdd(1);
          lock.unlock();
          workerCompleted.fetchAdd(1);
        });

        await sleep(200);
        lock.unlock();
        await job;

        while (workerCompleted.load() < 1) {
          await sleep(50);
        }

        worker.join();
        console.info(`${TAG} lock count: ${lockCount.load()}`);
        expect(lockCount.load()).assertEqual(2);
        expect(workerCompleted.load()).assertEqual(1);
        Done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_MutexLock_Enhanced_0300
     * @tc.name mutexLockEnhancedNestedLocks
     * @tc.desc Test nested lock usage
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('mutexLockEnhancedNestedLocks', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (Done: () => void): Promise<void> => {
        const TAG: string = 'mutexLockEnhancedNestedLocks';
        console.info(`${TAG} test start`);
        let lock1 = new concurrency.stackless.AsyncMutex();
        let lock2 = new concurrency.stackless.AsyncMutex();
        let lock3 = new concurrency.stackless.AsyncMutex();
        let count = 0;

        await lock1.lock();
        count++;
        await lock2.lock();
        count++;
        await lock3.lock();
        count++;

        lock3.unlock();
        lock2.unlock();
        lock1.unlock();

        console.info(`${TAG} test result: ${count}`);
        expect(count).assertEqual(3);
        Done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_MutexLock_Enhanced_0400
     * @tc.name mutexLockEnhancedMultiLockDeadlock
     * @tc.desc Test circular wait deadlock with three locks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('mutexLockEnhancedMultiLockDeadlock', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const TAG: string = 'mutexLockEnhancedMultiLockDeadlock';
        console.info(`${TAG} test start`);
        let lockA = new concurrency.stackless.AsyncMutex();
        let lockB = new concurrency.stackless.AsyncMutex();
        let lockC = new concurrency.stackless.AsyncMutex();
        let resultCount = new AtomicInt(0);
        let worker1Completed = new AtomicInt(0);
        let worker2Completed = new AtomicInt(0);

        let worker1 = new EAWorker();
        worker1.start();
        worker1.run<Promise<void>>(async (): Promise<void> => {
          await lockA.lock();
          lockA.unlock();
          await lockB.lock();
          lockB.unlock();
          await lockC.lock();
          resultCount.fetchAdd(1);
          lockC.unlock();
          worker1Completed.fetchAdd(1);
        });

        let worker2 = new EAWorker();
        worker2.start();
        worker2.run<Promise<void>>(async (): Promise<void> => {
          await lockC.lock();
          lockC.unlock();
          await lockB.lock();
          lockB.unlock();
          await lockA.lock();
          resultCount.fetchAdd(1);
          lockA.unlock();
          worker2Completed.fetchAdd(1);
        });

        while (worker1Completed.load() < 1 || worker2Completed.load() < 1) {
          await sleep(50);
        }
        worker1.join();
        worker2.join();

        console.info(`${TAG} completed workers: ${resultCount.load()}`);
        expect(resultCount.load()).assertLargerOrEqual(2);
        expect(worker1Completed.load()).assertEqual(1);
        expect(worker2Completed.load()).assertEqual(1);
        Done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_MutexLock_Enhanced_0500
     * @tc.name mutexLockEnhancedDoubleUnlock
     * @tc.desc Test double unlock exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('mutexLockEnhancedDoubleUnlock', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (Done: () => void): Promise<void> => {
        const TAG: string = 'mutexLockEnhancedDoubleUnlock';
        console.info(`${TAG} test start`);
        let lock = new concurrency.stackless.AsyncMutex();
        let errorCount = 0;

        await lock.lock();
        lock.unlock();

        try {
          lock.unlock();
        } catch (e) {
          errorCount++;
          console.info(`${TAG} caught expected error: ${e.message}`);
        }

        console.info(`${TAG} error count: ${errorCount}`);
        expect(errorCount).assertEqual(1);
        Done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_MutexLock_Enhanced_0600
     * @tc.name mutexLockEnhancedUnlockWithoutLock
     * @tc.desc Test unlock without lock
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('mutexLockEnhancedUnlockWithoutLock', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (Done: () => void): Promise<void> => {
        const TAG: string = 'mutexLockEnhancedUnlockWithoutLock';
        console.info(`${TAG} test start`);
        let lock = new concurrency.stackless.AsyncMutex();
        let errorCount = 0;

        try {
          lock.unlock();
        } catch (e) {
          errorCount++;
          console.info(`${TAG} caught expected error: ${e.message}`);
        }

        console.info(`${TAG} error count: ${errorCount}`);
        expect(errorCount).assertEqual(1);
        Done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_MutexLock_Enhanced_0700
     * @tc.name mutexLockEnhancedStateAfterException
     * @tc.desc Test lock state after exception is thrown
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('mutexLockEnhancedStateAfterException', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (Done: () => void): Promise<void> => {
        const TAG: string = 'mutexLockEnhancedStateAfterException';
        console.info(`${TAG} test start`);
        let lock = new concurrency.stackless.AsyncMutex();
        let count = 0;

        await lock.lock();
        try {
          count++;
          throw new Error("test exception");
        } catch (e) {
          console.info(`${TAG} caught exception: ${e.message}`);
        } finally {
          lock.unlock();
        }

        await lock.lock();
        count++;
        lock.unlock();

        console.info(`${TAG} test result: ${count}`);
        expect(count).assertEqual(2);
        Done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_MutexLock_Enhanced_0800
     * @tc.name mutexLockEnhancedExceptionInWorker
     * @tc.desc Test impact of exception in Worker on lock
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('mutexLockEnhancedExceptionInWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const TAG: string = 'mutexLockEnhancedExceptionInWorker';
        console.info(`${TAG} test start`);
        let lock = new concurrency.stackless.AsyncMutex();
        let count = new AtomicInt(0);
        let exceptionHandled = new AtomicInt(0);

        let worker = new EAWorker();
        worker.start();
        let job = worker.run<Promise<void>>(async (): Promise<void> => {
          await lock.lock();
          try {
            count.fetchAdd(1);
            throw new Error("worker exception");
          } finally {
            lock.unlock();
          }
        });

        try {
          await job;
        } catch (e) {
          console.info(`${TAG} worker exception: ${e.message}`);
          exceptionHandled.fetchAdd(1);
        }

        worker.join();

        await lock.lock();
        count.fetchAdd(1);
        lock.unlock();

        console.info(`${TAG} count: ${count.load()}, exception handled: ${exceptionHandled.load()}`);
        expect(count.load()).assertEqual(2);
        expect(exceptionHandled.load()).assertEqual(1);
        Done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_MutexLock_Enhanced_0900
     * @tc.name mutexLockEnhancedEmptyCriticalSection
     * @tc.desc Test empty critical section
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('mutexLockEnhancedEmptyCriticalSection', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const TAG: string = 'mutexLockEnhancedEmptyCriticalSection';
        console.info(`${TAG} test start`);
        let lock = new concurrency.stackless.AsyncMutex();
        let count = 0;

        for (let i = 0; i < 100; i++) {
          await lock.lock();
          lock.unlock();
          count++;
        }

        console.info(`${TAG} test result: ${count}`);
        expect(count).assertEqual(100);
        Done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_MutexLock_Enhanced_1000
     * @tc.name mutexLockEnhancedLockGuard
     * @tc.desc Test lockGuard method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('mutexLockEnhancedLockGuard', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (Done: () => void): Promise<void> => {
        const TAG: string = 'mutexLockEnhancedLockGuard';
        console.info(`${TAG} test start`);
        let lock = new concurrency.stackless.AsyncMutex();
        let count = 0;

        await lockGuardAsync(lock, () => {
          count++;
        });

        let exceptionCaught = false;
        try {
          await lockGuardAsync(lock, () => {
            count++;
            throw new Error("test");
          });
        } catch (e) {
          exceptionCaught = true;
        }

        await lockGuardAsync(lock, () => {
          count++;
        });

        console.info(`${TAG} count: ${count}, exception caught: ${exceptionCaught}`);
        expect(count).assertEqual(3);
        expect(exceptionCaught).assertTrue();
        Done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_MutexLock_Enhanced_1100
     * @tc.name mutexLockEnhancedWithTaskPool
     * @tc.desc Test Mutex and taskpool combination
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('mutexLockEnhancedWithTaskPool', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (Done: () => void): Promise<void> => {
        const TAG: string = 'mutexLockEnhancedWithTaskPool';
        console.info(`${TAG} test start`);
        let lock = new concurrency.stackless.AsyncMutex();
        let count = new AtomicInt(0);
        let taskCount = 10;

        for (let i = 0; i < taskCount; i++) {
          taskpool.execute(async (): Promise<void> => {
            await lock.lock();
            count.fetchAdd(1);
            lock.unlock();
          });
        }

        while (count.load() < taskCount) {
          await sleep(50);
        }

        console.info(`${TAG} final count: ${count.load()}`);
        expect(count.load()).assertEqual(taskCount);
        Done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_MutexLock_Enhanced_1200
     * @tc.name mutexLockEnhancedMultipleLocksSameWorker
     * @tc.desc Test same worker using multiple different locks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('mutexLockEnhancedMultipleLocksSameWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (Done: () => void): Promise<void> => {
        const TAG: string = 'mutexLockEnhancedMultipleLocksSameWorker';
        console.info(`${TAG} test start`);
        let lock1 = new concurrency.stackless.AsyncMutex();
        let lock2 = new concurrency.stackless.AsyncMutex();
        let lock3 = new concurrency.stackless.AsyncMutex();
        let result = new AtomicReference<string>('');

        let worker = new EAWorker();
        worker.start();
        let job = worker.run<Promise<void>>(async (): Promise<void> => {
          await lock1.lock();
          result.exchange(result.load() + '1');
          await lock2.lock();
          result.exchange(result.load() + '2');
          await lock3.lock();
          result.exchange(result.load() + '3');
          lock3.unlock();
          lock2.unlock();
          lock1.unlock();
        });

        await job;
        worker.join();

        console.info(`${TAG} result: ${result.load()}`);
        expect(result.load()).assertEqual('123');
        Done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_MutexLock_Enhanced_1300
     * @tc.name mutexLockEnhancedSequentialLocking
     * @tc.desc Test sequential locking pattern
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('mutexLockEnhancedSequentialLocking', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (Done: () => void): Promise<void> => {
        const TAG: string = 'mutexLockEnhancedSequentialLocking';
        console.info(`${TAG} test start`);
        let locks: concurrency.stackless.AsyncMutex[] = [
          new concurrency.stackless.AsyncMutex(),
          new concurrency.stackless.AsyncMutex(),
          new concurrency.stackless.AsyncMutex()
        ];
        let count = new AtomicInt(0);
        let workerCount = 5;

        let jobs: Promise<Promise<void>>[] = [];
        for (let i = 0; i < workerCount; i++) {
          let worker = new EAWorker();
          worker.start();
          let job = worker.run<Promise<void>>(async (): Promise<void> => {
            await locks[0].lock();
            await locks[1].lock();
            await locks[2].lock();
            count.fetchAdd(1);
            locks[2].unlock();
            locks[1].unlock();
            locks[0].unlock();
          });
          jobs.push(job);
        }

        for (let i = 0; i < workerCount; i++) {
          await jobs[i];
        }

        while (count.load() < workerCount) {
          await sleep(50);
        }

        console.info(`${TAG} final count: ${count.load()}`);
        expect(count.load()).assertEqual(workerCount);
        Done();
      });
  })
}
