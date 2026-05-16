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
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  TestType,
  Level,
  Size
} from "../../../hypium/index";
import hilog from '@ohos.hilog'
import Utils from './Util.test';

async function noParamNoReturnTask(): Promise<void> {
  await new Promise<string>((resolve) => {
    resolve('success')
  })
}

function assertIllegalLockStateError(e: Error): void {
  expect(e.name).assertEqual('IllegalLockStateError')
}

export default function MutexLockTest(): void {
  describe('MutexLockTest', (): void => {
    afterEach(async (): Promise<void> => {
      await Utils.msSleep(200);
    })
    /**
     * @tc.number SUB_MutexLock_Test_0100
     * @tc.name MutexTest001
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('MutexTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (Done: () => void): Promise<void> => {
        const TAG: string = 'MutexTest001';
        console.info(`${TAG} test start`);
        let count = 0
        let lock = new concurrency.stackless.AsyncMutex()
        await lock.lock()
        count++
        lock.unlock()
        let func = async () => {
          await lock.lock()
          count++
          lock.unlock()
        }
        await func()
        console.info(`${TAG} test start1`);
        await lock.lock()
        count++
        await new Promise<void>((resolve) => {
          resolve(undefined)
        })
        lock.unlock()
        console.info(`${TAG} test start2`);
        let eaw = new EAWorker()
        eaw.start()
        await eaw.run<Promise<void>>(async (): Promise<void> => {
          await lock.lock()
          count++
          lock.unlock()
        })
        eaw.join()
        console.info(`${TAG} test start3`);
        setTimeout(async () => {
          await lock.lock()
          count++
          lock.unlock()
        }, 10)
        while (count < 5) {
          await Utils.msSleep(200)
        }
        console.info(`${TAG} test result: ${count}`);
        expect(count).assertEqual(5)
        Done()
      });

    /**
     * @tc.number SUB_MutexLock_Test_0200
     * @tc.name MutexTest002
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MutexTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const TAG: string = 'MutexTest002';
        console.info(`${TAG} test start`);
        let count = 0
        let lock = new concurrency.stackless.AsyncMutex()
        await lock.lock()
        count++
        let func = async () => {
          count++
          lock.unlock()
        }
        await func()
        await lock.lock()
        count++
        await new Promise<void>((resolve) => {
          resolve(undefined)
        })
        await taskpool.execute(async () => {
          count++
          lock.unlock()
        })
        let eaw = new EAWorker()
        eaw.start()
        await eaw.run<Promise<void>>(async (): Promise<void> => {
          await lock.lock()
          count++
        })
        eaw.join()
        setTimeout(() => {
          count++
          lock.unlock()
        }, 10)
        while (count < 6) {
          await Utils.msSleep(200)
        }
        console.info(`${TAG} test result: ${count}`);
        expect(count).assertEqual(6)
        Done()
      });

    /**
     * @tc.number SUB_MutexLock_Test_0300
     * @tc.name MutexTest003
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('MutexTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (Done: () => void): Promise<void> => {
        const TAG: string = 'MutexTest003';
        console.info(`${TAG} test start`);
        let count = 0
        let lock = new concurrency.stackless.AsyncMutex()
        let lock2 = new concurrency.stackless.AsyncMutex()
        let lock3 = new concurrency.stackless.AsyncMutex()
        let lock4 = new concurrency.stackless.AsyncMutex()
        let workerStage = new AtomicInt(0)
        await lock.lock()
        count++
        let func = async () => {
          await lock2.lock()
          count++
        }
        await func()
        await taskpool.execute(async () => {
          count++
          lock.unlock()
          await lock3.lock()
        })
        await lock4.lock()
        let eaw = new EAWorker()
        eaw.start()
        let workerJob = eaw.run<Promise<void>>(async (): Promise<void> => {
          count++
          lock2.unlock()
          workerStage.fetchAdd(1)
          await lock4.lock()
          lock4.unlock()
        })
        while (workerStage.load() < 1) {
          await Utils.msSleep(10)
        }
        await new Promise<void>((resolve) => {
          count++
          lock3.unlock()
          resolve(undefined)
        }).then(() => {
          count++
          lock4.unlock()
        })
        await workerJob
        eaw.join()
        while (count < 6) {
          await Utils.msSleep(200)
        }
        console.info(`${TAG} test result: ${count}`);
        expect(count).assertEqual(6)
        Done()
      });

    /**
     * @tc.number SUB_MutexLock_Test_0400
     * @tc.name MutexTest004
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MutexTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (Done: () => void): Promise<void> => {
        const TAG: string = 'MutexTest004';
        console.info(`${TAG} test start`);
        let count = 0
        let lock = new concurrency.stackless.AsyncMutex()
        for (let i = 0; i < 1000; i++) {
          await lock.lock()
          count++
          lock.unlock()
        }
        let func = async () => {
          await lock.lock()
          count++
          lock.unlock()
        }
        await func()
        console.info(`${TAG} test result: ${count}`);
        expect(count).assertEqual(1001)
        Done()
      });


    /**
     * @tc.number SUB_MutexLock_Test_0500
     * @tc.name MutexTest005
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MutexTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const TAG: string = 'MutexTest005';
        console.info(`${TAG} test start`);
        let count = 0
        let lock = new concurrency.stackless.AsyncMutex()
        await lock.lock()
        lock.unlock()
        try {
          lock.unlock()
        } catch (e) {
          count++
          assertIllegalLockStateError(e as Error)
        }
        console.info(`${TAG} test result: ${count}`);
        expect(count).assertEqual(1)
        Done()
      });

    /**
     * @tc.number SUB_MutexLock_Test_0600
     * @tc.name MutexTest006
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MutexTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const TAG: string = 'MutexTest006';
        console.info(`${TAG} test start`);
        let count = 0
        let lock = new concurrency.stackless.AsyncMutex()
        for (let i = 0; i < 100; i++) {
          taskpool.execute(async ()=>{
            await lock.lock()
            count++
            lock.unlock()
          })
        }
        for (let i = 0; i < 10; i++) {
          let eaw = new EAWorker()
          eaw.start()
          await eaw.run<Promise<void>>(async (): Promise<void> => {
            await lock.lock()
            count++
            lock.unlock()
          })
          eaw.quit()
        }
        await lock.lock()
        count++
        let func = async () => {
          lock.unlock()
        }
        await func()
        while (count < 111) {
          await Utils.msSleep(200)
        }
        console.info(`${TAG} test result: ${count}`);
        expect(count).assertEqual(111)
        Done()
      });

    /**
     * @tc.number SUB_MutexLock_Test_0700
     * @tc.name MutexTest007
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MutexTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const TAG: string = 'MutexTest007';
        console.info(`${TAG} test start`);
        let count = 0
        let lock = new concurrency.stackless.AsyncMutex()
        for (let i = 0; i < 10; i++) {
          taskpool.execute(async ()=>{
            await lock.lock()
            for (let j = 0; j < 1000; j++) {
              count++
            }
            lock.unlock()
          })
        }
        for (let i = 0; i < 10; i++) {
          let eaw = new EAWorker()
          eaw.start()
          await eaw.run<Promise<void>>(async (): Promise<void> => {
            await lock.lock()
            for (let j = 0; j < 1000; j++) {
              count++
            }
            lock.unlock()
          })
          eaw.quit()
        }
        await lock.lock()
        count++
        let func = async () => {
          lock.unlock()
        }
        await func()
        while (count < 20001) {
          await Utils.msSleep(200)
        }
        console.info(`${TAG} test result: ${count}`);
        expect(count).assertEqual(20001)
        Done()
      })


    /**
     * @tc.number SUB_MutexLock_Test_0800
     * @tc.name MutexTest008
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MutexTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const TAG: string = 'MutexTest008';
        console.info(`${TAG} test start`);
        let count = 0
        let lock = new concurrency.stackless.AsyncMutex()
        for (let i = 0; i < 10; i++) {
          taskpool.execute(async ()=>{
            await lock.lock()
            count++
            throw new Error("error")
          }).finally(()=>{
            lock.unlock()
          })
        }
        for (let i = 0; i < 10; i++) {
          let eaw = new EAWorker()
          eaw.start()
          try {
            await eaw.run<Promise<void>>(async (): Promise<void> => {
              await lock.lock()
              try {
                count++
                throw new Error("error")
              } finally {
                lock.unlock()
              }
            })
          } catch (e) {
          }
          eaw.join()
        }
        await lock.lock()
        count++
        let func = async () => {
          lock.unlock()
        }
        await func()
        while (count < 21) {
          await Utils.msSleep(200)
        }
        console.info(`${TAG} test result: ${count}`);
        expect(count).assertEqual(21)
        Done()
      });


    /**
     * @tc.number SUB_MutexLock_Test_0900
     * @tc.name MutexTest009
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MutexTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const TAG: string = 'MutexTest009';
        console.info(`${TAG} test start`);
        let count = 0
        let lock = new concurrency.stackless.AsyncMutex()
        let lock2 = new concurrency.stackless.AsyncMutex()
        let lock3 = new concurrency.stackless.AsyncMutex()
        await lock.lock()
        count++
        await lock2.lock()
        count++
        await lock3.lock()
        count++
        lock.unlock()
        lock2.unlock()
        lock3.unlock()
        await lock.lock()
        count++
        await lock2.lock()
        count++
        await lock3.lock()
        count++
        lock3.unlock()
        lock2.unlock()
        lock.unlock()
        console.info(`${TAG} test result: ${count}`);
        expect(count).assertEqual(6)
        Done()
      })
  })
}
