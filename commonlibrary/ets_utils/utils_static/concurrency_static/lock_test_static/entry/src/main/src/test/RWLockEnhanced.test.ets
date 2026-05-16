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

import {
  afterEach,
  describe,
  expect,
  it,
  TestType,
  Level,
  Size
} from "../../../hypium/index";
import Utils from './Util.test';
import { BaseClass, sleep } from '../utils/Model';

export default function RWLockEnhancedTest(): void {
  describe('RWLockEnhancedTest', (): void => {
    afterEach(async (): Promise<void> => {
      await Utils.msSleep(200);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_RWLock_Enhanced_0100
     * @tc.name rwLockEnhancedReadToWriteUpgrade
     * @tc.desc Test read lock upgrade to write lock
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('rwLockEnhancedReadToWriteUpgrade', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (Done: () => void): Promise<void> => {
        const TAG: string = 'rwLockEnhancedReadToWriteUpgrade';
        console.info(`${TAG} test start`);
        let rwLock = new concurrency.stackless.AsyncReadWriteLock();
        let rLock = rwLock.readLock();
        let wLock = rwLock.writeLock();
        let result = new AtomicReference<string>('');

        await rLock.lock();
        result.exchange(result.load() + 'R');

        let worker = new EAWorker();
        worker.start();
        let job = worker.run<Promise<void>>(async (): Promise<void> => {
          await wLock.lock();
          result.exchange(result.load() + 'W');
          wLock.unlock();
        });

        await sleep(200);
        rLock.unlock();

        await job;
        worker.join();
        await sleep(200);

        console.info(`${TAG} result: ${result.load()}`);
        expect(result.load()).assertEqual('RW');
        Done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_RWLock_Enhanced_0200
     * @tc.name rwLockEnhancedWriteToReadDowngrade
     * @tc.desc Test write lock downgrade to read lock
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('rwLockEnhancedWriteToReadDowngrade', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (Done: () => void): Promise<void> => {
        const TAG: string = 'rwLockEnhancedWriteToReadReadDowngrade';
        console.info(`${TAG} test start`);
        let rwLock = new concurrency.stackless.AsyncReadWriteLock();
        let rLock = rwLock.readLock();
        let wLock = rwLock.writeLock();
        let result = new AtomicReference<string>('');
        let workerCompleted = new AtomicInt(0);

        await wLock.lock();
        result.exchange(result.load() + 'W1');

        let worker = new EAWorker();
        worker.start();
        worker.run<Promise<void>>(async (): Promise<void> => {
          await rLock.lock();
          result.exchange(result.load() + 'R');
          rLock.unlock();
          workerCompleted.fetchAdd(1);
        });

        await sleep(200);

        result.exchange(result.load() + 'W2');
        wLock.unlock();

        while (workerCompleted.load() < 1) {
          await sleep(50);
        }
        await worker.join();
        console.info(`${TAG} result: ${result.load()}, worker completed: ${workerCompleted.load()}`);
        expect(workerCompleted.load()).assertEqual(1);
        Done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_RWLock_Enhanced_0300
     * @tc.name rwLockEnhancedMultipleReadLocksNested
     * @tc.desc Test multiple read locks nesting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('rwLockEnhancedMultipleReadLocksNested', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (Done: () => void): Promise<void> => {
        const TAG: string = 'rwLockEnhancedMultipleReadLocksNested';
        console.info(`${TAG} test start`);
        let rwLock = new concurrency.stackless.AsyncReadWriteLock();
        let rLock1 = rwLock.readLock();
        let rLock2 = rwLock.readLock();
        let count = new AtomicInt(0);

        await rLock1.lock();
        count.fetchAdd(1);

        await rLock2.lock();
        count.fetchAdd(1);

        rLock2.unlock();
        rLock1.unlock();

        console.info(`${TAG} count: ${count.load()}`);
        expect(count.load()).assertEqual(2);
        Done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_RWLock_Enhanced_0400
     * @tc.name rwLockEnhancedWriterStarvation
     * @tc.desc Test writer starvation scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('rwLockEnhancedWriterStarvation', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (Done: () => void): Promise<void> => {
        const TAG: string = 'rwLockEnhancedWriterStarvation';
        console.info(`${TAG} test start`);
        let rwLock = new concurrency.stackless.AsyncReadWriteLock();
        let rLock = rwLock.readLock();
        let wLock = rwLock.writeLock();
        let writerExecuted = new AtomicInt(0);
        let readCount = new AtomicInt(0);
        let readCompleted = new AtomicInt(0);

        for (let i = 0; i < 20; i++) {
          taskpool.execute(async (): Promise<void> => {
            await rLock.lock();
            readCount.fetchAdd(1);
            setTimeout((): void => {
              rLock.unlock();
              readCompleted.fetchAdd(1);
            }, 30);
          });
        }

        while (readCompleted.load() < 5) {
          await sleep(50);
        }

        taskpool.execute(async (): Promise<void> => {
          await wLock.lock();
          writerExecuted.fetchAdd(1);
          wLock.unlock();
        });

        while (writerExecuted.load() < 1) {
          await sleep(50);
        }

        console.info(`${TAG} read count: ${readCount.load()}, writer executed: ${writerExecuted.load()}`);
        expect(readCount.load()).assertLarger(0);
        expect(writerExecuted.load()).assertEqual(1);
        Done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_RWLock_Enhanced_0500
     * @tc.name rwLockEnhancedReaderStarvation
     * @tc.desc Test reader starvation scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('rwLockEnhancedReaderStarvation', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (Done: () => void): Promise<void> => {
        const TAG: string = 'rwLockEnhancedReaderStarvation';
        console.info(`${TAG} test start`);
        let rwLock = new concurrency.stackless.AsyncReadWriteLock();
        let rLock = rwLock.readLock();
        let wLock = rwLock.writeLock();
        let readerExecuted = new AtomicInt(0);
        let writeCount = new AtomicInt(0);
        let writeCompleted = new AtomicInt(0);

        for (let i = 0; i < 10; i++) {
          taskpool.execute(async (): Promise<void> => {
            await wLock.lock();
            writeCount.fetchAdd(1);
            setTimeout((): void => {
              wLock.unlock();
              writeCompleted.fetchAdd(1);
            }, 20);
          });
        }

        while (writeCompleted.load() < 3) {
          await sleep(50);
        }

        taskpool.execute(async (): Promise<void> => {
          await rLock.lock();
          readerExecuted.fetchAdd(1);
          rLock.unlock();
        });

        while (readerExecuted.load() < 1) {
          await sleep(50);
        }

        console.info(`${TAG} write count: ${writeCount.load()}, reader executed: ${readerExecuted.load()}`);
        expect(writeCount.load()).assertLarger(0);
        expect(readerExecuted.load()).assertEqual(1);
        Done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_RWLock_Enhanced_0600
     * @tc.name rwLockEnhancedMassiveReadersWriters
     * @tc.desc Test massive readers and writers concurrency
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('rwLockEnhancedMassiveReadersWriters', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const TAG: string = 'rwLockEnhancedMassiveReadersWriters';
        console.info(`${TAG} test start`);
        let rwLock = new concurrency.stackless.AsyncReadWriteLock();
        let readCount = new AtomicInt(0);
        let writeCount = new AtomicInt(0);
        let readCompleted = new AtomicInt(0);
        let writeCompleted = new AtomicInt(0);
        let class1 = new BaseClass();

        for (let i = 0; i < 50; i++) {
          taskpool.execute(async (): Promise<void> => {
            let readLock = rwLock.readLock();
            await readLock.lock();
            readCount.fetchAdd(1);
            await class1.increaseCount();
            readLock.unlock();
            readCompleted.fetchAdd(1);
          });
        }

        for (let i = 0; i < 5; i++) {
          let eaw = new EAWorker();
          eaw.start();
          await eaw.run<Promise<void>>(async (): Promise<void> => {
            let writeLock = rwLock.writeLock();
            await writeLock.lock();
            writeCount.fetchAdd(1);
            await class1.increaseCount();
            writeLock.unlock();
            writeCompleted.fetchAdd(1);
          });
          eaw.join();
        }

        while (readCompleted.load() < 50 || writeCompleted.load() < 5) {
          await sleep(50);
        }

        console.info(`${TAG} read count: ${readCount.load()}, write count: ${writeCount.load()}`);
        expect(readCount.load() + writeCount.load()).assertLargerOrEqual(55);
        Done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_RWLock_Enhanced_0700
     * @tc.name rwLockEnhancedAlternatingReadWrite
     * @tc.desc Test alternating read and write execution
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('rwLockEnhancedAlternatingReadWrite', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const TAG: string = 'rwLockEnhancedAlternatingReadWrite';
        console.info(`${TAG} test start`);
        let rwLock = new concurrency.stackless.AsyncReadWriteLock();
        let rLock = rwLock.readLock();
        let wLock = rwLock.writeLock();
        let sequence: string[] = [];
        let iterations = 10;

        for (let i = 0; i < iterations; i++) {
          await rLock.lock();
          sequence.push('R');
          rLock.unlock();

          await wLock.lock();
          sequence.push('W');
          wLock.unlock();
        }

        console.info(`${TAG} sequence: ${sequence.toString()}`);
        expect(sequence.length).assertEqual(iterations * 2);
        Done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_RWLock_Enhanced_0800
     * @tc.name rwLockEnhancedReaderDataConsistency
     * @tc.desc Test reader concurrent read data consistency
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('rwLockEnhancedReaderDataConsistency', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (Done: () => void): Promise<void> => {
        const TAG: string = 'rwLockEnhancedReaderDataConsistency';
        console.info(`${TAG} test start`);
        let rwLock = new concurrency.stackless.AsyncReadWriteLock();
        let data: BaseClass = new BaseClass();
        let writeCount = new AtomicInt(0);
        let readCount = new AtomicInt(0);

        let eaw = new EAWorker();
        eaw.start();
        await eaw.run<Promise<void>>(async (): Promise<void> => {
          let writeLock = rwLock.writeLock();
          await writeLock.lock();
          await data.increaseCount();
          writeCount.fetchAdd(1);
          writeLock.unlock();
        });
        eaw.join();
        while (writeCount.load() < 1) {
          await sleep(50);
        }

        for (let i = 0; i < 10; i++) {
          taskpool.execute(async (): Promise<void> => {
            let readLock = rwLock.readLock();
            await readLock.lock();
            await data.getCount();
            readCount.fetchAdd(1);
            readLock.unlock();
          });
        }

        while (readCount.load() < 10) {
          await sleep(50);
        }

        console.info(`${TAG} write count: ${writeCount.load()}, read count: ${readCount.load()}`);
        expect(writeCount.load()).assertEqual(1);
        expect(readCount.load()).assertEqual(10);
        Done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_RWLock_Enhanced_0900
     * @tc.name rwLockEnhancedWriterExclusivity
     * @tc.desc Test writer exclusivity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('rwLockEnhancedWriterExclusivity', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (Done: () => void): Promise<void> => {
        const TAG: string = 'rwLockEnhancedWriterExclusivity';
        console.info(`${TAG} test start`);
        let rwLock = new concurrency.stackless.AsyncReadWriteLock();
        let wLock = rwLock.writeLock();
        let concurrentWrites = new AtomicInt(0);
        let maxConcurrent = new AtomicInt(0);
        let workerStarted = new AtomicInt(0);
        let workerCompleted = new AtomicInt(0);

        await wLock.lock();

        let worker = new EAWorker();
        worker.start();
        let job = worker.run<Promise<void>>(async (): Promise<void> => {
          workerStarted.fetchAdd(1);
          await wLock.lock();
          concurrentWrites.fetchAdd(1);
          if (concurrentWrites.load() > maxConcurrent.load()) {
            maxConcurrent.store(concurrentWrites.load());
          }
          setTimeout((): void => {
            concurrentWrites.fetchSub(1);
            wLock.unlock();
            workerCompleted.fetchAdd(1);
          }, 100);
        });

        while (workerStarted.load() < 1) {
          await sleep(10);
        }

        expect(concurrentWrites.load()).assertEqual(0);

        wLock.unlock();

        while (workerCompleted.load() < 1) {
          await sleep(50);
        }
        await job;
        worker.join();

        console.info(`${TAG} max concurrent writes: ${maxConcurrent.load()}`);
        expect(maxConcurrent.load()).assertLessOrEqual(1);
        Done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_RWLock_Enhanced_1000
     * @tc.name rwLockEnhancedReadLockDoubleUnlock
     * @tc.desc Test read lock double unlock exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('rwLockEnhancedReadLockDoubleUnlock', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (Done: () => void): Promise<void> => {
        const TAG: string = 'rwLockEnhancedReadLockDoubleUnlock';
        console.info(`${TAG} test start`);
        let rwLock = new concurrency.stackless.AsyncReadWriteLock();
        let rLock = rwLock.readLock();
        let errorCount = 0;

        await rLock.lock();
        rLock.unlock();

        try {
          rLock.unlock();
        } catch (e) {
          errorCount++;
          console.info(`${TAG} caught expected error: ${e.message}`);
        }

        console.info(`${TAG} error count: ${errorCount}`);
        expect(errorCount).assertEqual(1);
        Done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_RWLock_Enhanced_1100
     * @tc.name rwLockEnhancedWriteLockDoubleUnlock
     * @tc.desc Test write lock double unlock exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('rwLockEnhancedWriteLockDoubleUnlock', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (Done: () => void): Promise<void> => {
        const TAG: string = 'rwLockEnhancedWriteLockDoubleUnlock';
        console.info(`${TAG} test start`);
        let rwLock = new concurrency.stackless.AsyncReadWriteLock();
        let wLock = rwLock.writeLock();
        let errorCount = 0;

        await wLock.lock();
        wLock.unlock();

        try {
          wLock.unlock();
        } catch (e) {
          errorCount++;
          console.info(`${TAG} caught expected error: ${e.message}`);
        }

        console.info(`${TAG} error count: ${errorCount}`);
        expect(errorCount).assertEqual(1);
        Done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_RWLock_Enhanced_1200
     * @tc.name rwLockEnhancedMixedLockUsage
     * @tc.desc Test mixed use of readLock and writeLock
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('rwLockEnhancedMixedLockUsage', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const TAG: string = 'rwLockEnhancedMixedLockUsage';
        console.info(`${TAG} test start`);
        let rwLock = new concurrency.stackless.AsyncReadWriteLock();
        let rLock = rwLock.readLock();
        let wLock = rwLock.writeLock();
        let count = new AtomicInt(0);

        await rLock.lock();
        count.fetchAdd(1);
        rLock.unlock();

        await wLock.lock();
        count.fetchAdd(1);
        wLock.unlock();

        let worker = new EAWorker();
        worker.start();
        let job = worker.run<Promise<void>>(async (): Promise<void> => {
          await rLock.lock();
          count.fetchAdd(1);
          rLock.unlock();
        });

        await job;
        worker.join();

        console.info(`${TAG} count: ${count.load()}`);
        expect(count.load()).assertEqual(3);
        Done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_RWLock_Enhanced_1300
     * @tc.name rwLockEnhancedConcurrentReadersSameLock
     * @tc.desc Test concurrent readers on same read lock
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('rwLockEnhancedConcurrentReadersSameLock', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (Done: () => void): Promise<void> => {
        const TAG: string = 'rwLockEnhancedConcurrentReadersSameLock';
        console.info(`${TAG} test start`);
        let rwLock = new concurrency.stackless.AsyncReadWriteLock();
        let rLock = rwLock.readLock();
        let count = new AtomicInt(0);
        let unlockCount = new AtomicInt(0);
        let readerCount = 20;

        for (let i = 0; i < readerCount; i++) {
          taskpool.execute(async (): Promise<void> => {
            await rLock.lock();
            count.fetchAdd(1);
            setTimeout((): void => {
              rLock.unlock();
              unlockCount.fetchAdd(1);
            }, 10);
          });
        }

        while (count.load() < readerCount) {
          await sleep(50);
        }

        console.info(`${TAG} reader count: ${count.load()}, unlocked: ${unlockCount.load()}`);
        expect(count.load()).assertLargerOrEqual(readerCount);
        Done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_RWLock_Enhanced_1400
     * @tc.name rwLockEnhancedMultipleRWLockInstances
     * @tc.desc Test independence of multiple RWLock instances
     * @tc.size MediumTestawait 
     * @tc.type Function
     * @tc.level Level 0
     */
    it('rwLockEnhancedMultipleRWLockInstances', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (Done: () => void): Promise<void> => {
        const TAG: string = 'rwLockEnhancedMultipleRWLockInstances';
        console.info(`${TAG} test start`);
        let lock1 = new concurrency.stackless.AsyncReadWriteLock();
        let lock2 = new concurrency.stackless.AsyncReadWriteLock();
        let count1 = new AtomicInt(0);
        let count2 = new AtomicInt(0);

        let lock1Write = lock1.writeLock();
        let lock2Write = lock2.writeLock();
        await lock1Write.lock();
        await lock2Write.lock();

        count1.fetchAdd(1);
        count2.fetchAdd(1);

        lock2Write.unlock();
        lock1Write.unlock();

        console.info(`${TAG} count1: ${count1.load()}, count2: ${count2.load()}`);
        expect(count1.load()).assertEqual(1);
        expect(count2.load()).assertEqual(1);
        Done();
      });
  })
}
