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
  Level,
  Size,
  TestType
} from '../../../hypium/index';
import hilog from '@ohos.hilog'
import Utils from './Util.test';
import { BaseClass, Event } from '../utils/Model';

function assertIllegalLockStateError(e: Error): void {
  expect(e.name).assertEqual('IllegalLockStateError')
}

export default function RWLockTest(): void {
  describe('RWLockTest', (): void => {
    afterEach(async (): Promise<void> => {
      await Utils.msSleep(200);
    })
    /**
     * @tc.number SUB_RWLock_Test_0100
     * @tc.name RWLockTest001
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('RWLockTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (Done: () => void): Promise<void> => {
        const tag: string = 'RWLockTest001';
        console.info(`${tag} test start`);
        let count = 0
        let lock = new concurrency.stackless.AsyncReadWriteLock().readLock()
        await lock.lock()
        count++
        lock.unlock()
        let func = async (): Promise<void> => {
          await lock.lock()
          count++
          lock.unlock()
        }
        await func()
        await new Promise<void>((resolve, reject) => {
          (async (): Promise<void> => {
            await lock.lock()
            count++
            resolve(undefined)
          })().catch(reject)
        }).then(() => {
          lock.unlock()
        })
        let eaw = new EAWorker()
        eaw.start()
        await eaw.run<Promise<void>>(async (): Promise<void> => {
          await lock.lock()
          count++
          lock.unlock()
        })
        eaw.join()
        setTimeout(async () => {
          await lock.lock()
          count++
          lock.unlock()
        }, 10)
        while (count < 5) {
          await Utils.msSleep(200)
        }
        console.info(`${tag} test result: ${count}`);
        expect(count).assertEqual(5)
        Done()
      });

    /**
     * @tc.number SUB_RWLock_Test_0200
     * @tc.name RWLockTest002
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('RWLockTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const tag: string = 'RWLockTest002';
        console.info(`${tag} test start`);
        let count = 0
        let lock = new concurrency.stackless.AsyncReadWriteLock().readLock()
        await lock.lock()
        count++
        let func = async (): Promise<void> => {
          count++
          lock.unlock()
        }
        await func()
        await new Promise<void>((resolve, reject) => {
          (async (): Promise<void> => {
            await lock.lock()
            count++
            resolve(undefined)
          })().catch(reject)
        }).then(() => {
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
        eaw.quit()
        setTimeout(() => {
          count++
          lock.unlock()
        }, 10)
        while (count < 6) {
          await Utils.msSleep(200)
        }
        console.info(`${tag} test result: ${count}`);
        expect(count).assertEqual(6)
        Done()
      });

    /**
     * @tc.number SUB_RWLock_Test_0300
     * @tc.name RWLockTest003
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('RWLockTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const tag: string = 'RWLockTest003';
        console.info(`${tag} test start`);
        let count = 0
        let lock = new concurrency.stackless.AsyncReadWriteLock().readLock()
        let lock2 = new concurrency.stackless.AsyncReadWriteLock().readLock()
        let lock3 = new concurrency.stackless.AsyncReadWriteLock().readLock()
        let lock4 = new concurrency.stackless.AsyncReadWriteLock().readLock()
        await lock.lock()
        count++
        let func = async (): Promise<void> => {
          await lock2.lock()
          count++
        }
        await func()
        await taskpool.execute(async () => {
          count++
          lock.unlock()
          await lock3.lock()
        })
        let eaw = new EAWorker()
        eaw.start()
        await eaw.run<Promise<void>>(async (): Promise<void> => {
          count++
          lock2.unlock()
          await lock4.lock()
        })
        eaw.join()
        await new Promise<void>((resolve) => {
          count++
          lock3.unlock()
          resolve(undefined)
        }).then(() => {
          count++
          lock4.unlock()
        })
        while (count < 6) {
          await Utils.msSleep(200)
        }
        console.info(`${tag} test result: ${count}`);
        expect(count).assertEqual(6)
        Done()
      });

    /**
     * @tc.number SUB_RWLock_Test_0400
     * @tc.name RWLockTest004
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('RWLockTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (Done: () => void): Promise<void> => {
        const tag: string = 'RWLockTest004';
        console.info(`${tag} test start`);
        let count = 0
        let lock = new concurrency.stackless.AsyncReadWriteLock().readLock()
        for (let i = 0; i < 1000; i++) {
          await lock.lock()
          count++
          lock.unlock()
        }
        let func = async (): Promise<void> => {
          await lock.lock()
          count++
          lock.unlock()
        }
        await func()
        console.info(`${tag} test result: ${count}`);
        expect(count).assertEqual(1001)
        Done()
      });


    /**
     * @tc.number SUB_RWLock_Test_0500
     * @tc.name RWLockTest005
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('RWLockTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const tag: string = 'RWLockTest005';
        console.info(`${tag} test start`);
        let count = 0
        let lock = new concurrency.stackless.AsyncReadWriteLock().readLock()
        await lock.lock()
        await lock.lock()
        lock.unlock()
        lock.unlock()
        try {
          lock.unlock()
        } catch (e) {
          count++
          assertIllegalLockStateError(e as Error)
        }
        console.info(`${tag} test result: ${count}`);
        expect(count).assertEqual(1)
        Done()
      });

    /**
     * @tc.number SUB_RWLock_Test_0600
     * @tc.name RWLockTest006
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('RWLockTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const tag: string = 'RWLockTest006';
        console.info(`${tag} test start`);
        let count = 0
        let class1 = new BaseClass()
        let lock = new concurrency.stackless.AsyncReadWriteLock().readLock()
        for (let i = 0; i < 100; i++) {
          taskpool.execute(async () => {
            await lock.lock()
            count++
            class1.increaseCount()
            lock.unlock()
          })
        }
        for (let i = 0; i < 10; i++) {
          let eaw = new EAWorker()
          eaw.start()
          eaw.run<Promise<void>>(async (): Promise<void> => {
            await lock.lock()
            count++
            class1.increaseCount()
            lock.unlock()
          })
          eaw.quit()
        }
        await lock.lock()
        count++
        class1.increaseCount()
        let func = async (): Promise<void> => {
          lock.unlock()
        }
        await func()
        while (await class1.getCount() < 111) {
          await Utils.msSleep(200)
        }
        console.info(`${tag} test result: ${count}`);
        expect(count).assertLessOrEqual(111)
        Done()
      });

    /**
     * @tc.number SUB_RWLock_Test_0700
     * @tc.name RWLockTest007
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('RWLockTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const tag: string = 'RWLockTest007';
        console.info(`${tag} test start`);
        let count = 0
        let finish = 0
        let lock = new concurrency.stackless.AsyncReadWriteLock().readLock()
        for (let i = 0; i < 10; i++) {
          taskpool.execute(async () => {
            await lock.lock()
            for (let j = 0; j < 1000; j++) {
              count++
            }
            lock.unlock()
          }).then(() => {
            finish++
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
          finish++
        }
        await lock.lock()
        count++
        let func = async (): Promise<void> => {
          lock.unlock()
        }
        await func()
        while (finish < 20) {
          await Utils.msSleep(200)
        }
        console.info(`${tag} test result: ${count}`);
        expect(count <= 20001).assertEqual(true)
        Done()
      })


    /**
     * @tc.number SUB_RWLock_Test_0800
     * @tc.name RWLockTest008
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('RWLockTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const tag: string = 'RWLockTest008';
        console.info(`${tag} test start`);
        let count = 0
        let class1 = new BaseClass()
        let lock = new concurrency.stackless.AsyncReadWriteLock().readLock()
        for (let i = 0; i < 10; i++) {
          taskpool.execute(async () => {
            await lock.lock()
            count++
            class1.increaseCount()
            throw new Error("error")
          }).finally(() => {
            lock.unlock()
          })
        }
        for (let i = 0; i < 10; i++) {
          let eaw = new EAWorker()
          eaw.start()
          eaw.setUncaughtExceptionHandler(() => {
            lock.unlock()
          })
          eaw.run<Promise<void>>(async (): Promise<void> => {
            await lock.lock()
            count++
            class1.increaseCount()
            throw new Error("error")
          })
          eaw.quit()
        }
        await lock.lock()
        count++
        class1.increaseCount()
        let func = async (): Promise<void> => {
          lock.unlock()
        }
        await func()
        while (await class1.getCount() < 21) {
          await Utils.msSleep(200)
        }
        console.info(`${tag} test result: ${count}`);
        expect(count).assertLessOrEqual(21)
        Done()
      });


    /**
     * @tc.number SUB_RWLock_Test_0900
     * @tc.name RWLockTest009
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('RWLockTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const tag: string = 'RWLockTest009';
        console.info(`${tag} test start`);
        let count = 0
        let lock = new concurrency.stackless.AsyncReadWriteLock().readLock()
        let lock2 = new concurrency.stackless.AsyncReadWriteLock().readLock()
        let lock3 = new concurrency.stackless.AsyncReadWriteLock().readLock()
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
        console.info(`${tag} test result: ${count}`);
        expect(count).assertEqual(6)
        Done()
      })

    /**
     * @tc.number SUB_RWLock_Test_1000
     * @tc.name RWLockTest010
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('RWLockTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (Done: () => void): Promise<void> => {
        const tag: string = 'RWLockTest010';
        console.info(`${tag} test start`);
        let count = 0
        let lock = new concurrency.stackless.AsyncReadWriteLock().readLock()
        let lock2 = new concurrency.stackless.AsyncReadWriteLock().readLock()
        let event1 = new Event()
        let event2 = new Event()
        let class1 = new BaseClass()
        taskpool.execute(async () => {
          await lock.lock()
          event1.Fire()
          count++
          class1.increaseCount()
          event2.Wait()
          lock2.unlock()
        })
        let eaw = new EAWorker()
        eaw.start()
        eaw.run<Promise<void>>(async (): Promise<void> => {
          await lock2.lock()
          event2.Fire()
          count++
          class1.increaseCount()
          event1.Wait()
          lock.unlock()
        })
        eaw.join()
        await lock.lock()
        await lock2.lock()
        count++
          class1.increaseCount()
        let func = async (): Promise<void> => {
          lock.unlock()
          lock2.unlock()
        }
        await func()
        while (await class1.getCount() < 3) {
          await Utils.msSleep(200)
        }
        console.info(`${tag} test result: ${count}`);
        expect(count).assertLessOrEqual(3)
        Done()
      });


    /**
     * @tc.number SUB_RWLock_Test_1100
     * @tc.name RWLockTest011
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('RWLockTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (Done: () => void): Promise<void> => {
        const tag: string = 'RWLockTest011';
        console.info(`${tag} test start`);
        let count = 0
        let lock = new concurrency.stackless.AsyncReadWriteLock().writeLock()
        await lock.lock()
        count++
        lock.unlock()
        let func = async (): Promise<void> => {
          await lock.lock()
          count++
          lock.unlock()
        }
        await func()
        await new Promise<void>((resolve, reject) => {
          (async (): Promise<void> => {
            await lock.lock()
            count++
            resolve(undefined)
          })().catch(reject)
        }).then(() => {
          lock.unlock()
        })
        let eaw = new EAWorker()
        eaw.start()
        await eaw.run<Promise<void>>(async (): Promise<void> => {
          await lock.lock()
          count++
          lock.unlock()
        })
        eaw.join()
        setTimeout(async () => {
          await lock.lock()
          count++
          lock.unlock()
        }, 10)
        while (count < 5) {
          await Utils.msSleep(200)
        }
        console.info(`${tag} test result: ${count}`);
        expect(count).assertEqual(5)
        Done()
      });

    /**
     * @tc.number SUB_RWLock_Test_1200
     * @tc.name RWLockTest012
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('RWLockTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const tag: string = 'RWLockTest012';
        console.info(`${tag} test start`);
        let count = 0
        let lock = new concurrency.stackless.AsyncReadWriteLock().writeLock()
        await lock.lock()
        count++
        let func = async (): Promise<void> => {
          count++
          lock.unlock()
        }
        await func()
        await new Promise<void>((resolve, reject) => {
          (async (): Promise<void> => {
            await lock.lock()
            count++
            resolve(undefined)
          })().catch(reject)
        }).then(() => {
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
        eaw.quit()
        setTimeout(() => {
          count++
          lock.unlock()
        }, 10)
        while (count < 6) {
          await Utils.msSleep(200)
        }
        console.info(`${tag} test result: ${count}`);
        expect(count).assertEqual(6)
        Done()
      });

    /**
     * @tc.number SUB_RWLock_Test_1300
     * @tc.name RWLockTest013
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('RWLockTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const tag: string = 'RWLockTest013';
        console.info(`${tag} test start`);
        let count = 0
        let lock = new concurrency.stackless.AsyncReadWriteLock().writeLock()
        let lock2 = new concurrency.stackless.AsyncReadWriteLock().writeLock()
        let lock3 = new concurrency.stackless.AsyncReadWriteLock().writeLock()
        let lock4 = new concurrency.stackless.AsyncReadWriteLock().writeLock()
        await lock.lock()
        count++
        let func = async (): Promise<void> => {
          await lock2.lock()
          count++
        }
        await func()
        await taskpool.execute(async () => {
          count++
          lock.unlock()
          await lock3.lock()
        })
        let eaw = new EAWorker()
        eaw.start()
        await eaw.run<Promise<void>>(async (): Promise<void> => {
          count++
          lock2.unlock()
          await lock4.lock()
        })
        eaw.join()
        await new Promise<void>((resolve) => {
          count++
          lock3.unlock()
          resolve(undefined)
        }).then(() => {
          count++
          lock4.unlock()
        })
        while (count < 6) {
          await Utils.msSleep(200)
        }
        console.info(`${tag} test result: ${count}`);
        expect(count).assertEqual(6)
        Done()
      });

    /**
     * @tc.number SUB_RWLock_Test_1400
     * @tc.name RWLockTest014
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('RWLockTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (Done: () => void): Promise<void> => {
        const tag: string = 'RWLockTest014';
        console.info(`${tag} test start`);
        let count = 0
        let lock = new concurrency.stackless.AsyncReadWriteLock().writeLock()
        for (let i = 0; i < 1000; i++) {
          await lock.lock()
          count++
          lock.unlock()
        }
        let func = async (): Promise<void> => {
          await lock.lock()
          count++
          lock.unlock()
        }
        await func()
        console.info(`${tag} test result: ${count}`);
        expect(count).assertEqual(1001)
        Done()
      });


    /**
     * @tc.number SUB_RWLock_Test_1500
     * @tc.name RWLockTest015
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('RWLockTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const tag: string = 'RWLockTest015';
        console.info(`${tag} test start`);
        let count = 0
        let lock = new concurrency.stackless.AsyncReadWriteLock().writeLock()
        await lock.lock()
        lock.unlock()
        try {
          lock.unlock()
        } catch (e) {
          count++
          assertIllegalLockStateError(e as Error)
        }
        console.info(`${tag} test result: ${count}`);
        expect(count).assertEqual(1)
        Done()
      });

    /**
     * @tc.number SUB_RWLock_Test_1600
     * @tc.name RWLockTest016
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('RWLockTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const tag: string = 'RWLockTest016';
        console.info(`${tag} test start`);
        let count = 0
        let lock = new concurrency.stackless.AsyncReadWriteLock().writeLock()
        for (let i = 0; i < 100; i++) {
          taskpool.execute(async () => {
            await lock.lock()
            count++
            lock.unlock()
          })
        }
        for (let i = 0; i < 10; i++) {
          let eaw = new EAWorker()
          eaw.start()
          eaw.run<Promise<void>>(async (): Promise<void> => {
            await lock.lock()
            count++
            lock.unlock()
          })
          eaw.quit()
        }
        await lock.lock()
        count++
        let func = async (): Promise<void> => {
          lock.unlock()
        }
        await func()
        while (count < 111) {
          await Utils.msSleep(200)
        }
        console.info(`${tag} test result: ${count}`);
        expect(count).assertEqual(111)
        Done()
      });

    /**
     * @tc.number SUB_RWLock_Test_1700
     * @tc.name RWLockTest017
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('RWLockTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const tag: string = 'RWLockTest017';
        console.info(`${tag} test start`);
        let count = 0
        let lock = new concurrency.stackless.AsyncReadWriteLock().writeLock()
        for (let i = 0; i < 10; i++) {
          taskpool.execute(async () => {
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
          eaw.run<Promise<void>>(async (): Promise<void> => {
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
        let func = async (): Promise<void> => {
          lock.unlock()
        }
        await func()
        while (count < 20001) {
          await Utils.msSleep(200)
        }
        console.info(`${tag} test result: ${count}`);
        expect(count).assertEqual(20001)
        Done()
      })


    /**
     * @tc.number SUB_RWLock_Test_1800
     * @tc.name RWLockTest018
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('RWLockTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const tag: string = 'RWLockTest018';
        console.info(`${tag} test start`);
        let count = 0
        let lock = new concurrency.stackless.AsyncReadWriteLock().writeLock()
        for (let i = 0; i < 10; i++) {
          taskpool.execute(async () => {
            await lock.lock()
            count++
            throw new Error("error")
          }).finally(() => {
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
        let func = async (): Promise<void> => {
          lock.unlock()
        }
        await func()
        while (count < 21) {
          await Utils.msSleep(200)
        }
        console.info(`${tag} test result: ${count}`);
        expect(count).assertEqual(21)
        Done()
      });


    /**
     * @tc.number SUB_RWLock_Test_1900
     * @tc.name RWLockTest019
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('RWLockTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const tag: string = 'RWLockTest019';
        console.info(`${tag} test start`);
        let count = 0
        let lock = new concurrency.stackless.AsyncReadWriteLock().writeLock()
        let lock2 = new concurrency.stackless.AsyncReadWriteLock().writeLock()
        let lock3 = new concurrency.stackless.AsyncReadWriteLock().writeLock()
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
        console.info(`${tag} test result: ${count}`);
        expect(count).assertEqual(6)
        Done()
      })


    /**
     * @tc.number SUB_RWLock_Test_2100
     * @tc.name RWLockTest021
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('RWLockTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const tag: string = 'RWLockTest021';
        console.info(`${tag} test start`);
        let count = 0
        let lock = new concurrency.stackless.AsyncReadWriteLock().readLock()
        let lock2 = new concurrency.stackless.AsyncReadWriteLock().readLock()
        for (let i = 0; i < 100; i++) {
          await lock.lock()
        }
        await taskpool.execute(async () => {
          for (let i = 0; i < 100; i++) {
            count++
            lock.unlock()
          }
        })
        let eaw = new EAWorker()
        eaw.start()
        await eaw.run<Promise<void>>(async (): Promise<void> => {
          for (let i = 0; i < 100; i++) {
            await lock.lock()
          }
        })
        eaw.quit()
        for (let i = 0; i < 100; i++) {
          count++
          lock.unlock()
        }
        await lock.lock()
        await lock2.lock()
        count++
        let func = async (): Promise<void> => {
          lock.unlock()
          lock2.unlock()
        }
        await func()
        while (count < 201) {
          await Utils.msSleep(200)
        }
        console.info(`${tag} test result: ${count}`);
        expect(count).assertEqual(201)
        Done()
      });

    /**
     * @tc.number SUB_RWLock_Test_2200
     * @tc.name RWLockTest022
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('RWLockTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const tag: string = 'RWLockTest022';
        console.info(`${tag} test start`);
        let count = 0
        let lock = new concurrency.stackless.AsyncReadWriteLock()
        let rLock = lock.readLock()
        let wLock = lock.writeLock()
        await wLock.lock()
        rLock.unlock()
        count++
        await rLock.lock()
        wLock.unlock()
        count++
        await wLock.lock()
        wLock.unlock()
        console.info(`${tag} test result: ${count}`);
        expect(count).assertEqual(2)
        Done()
      });

    /**
     * @tc.number SUB_RWLock_Test_2300
     * @tc.name RWLockTest023
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('RWLockTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (Done: () => void): Promise<void> => {
        const tag: string = 'RWLockTest023';
        console.info(`${tag} test start`);
        let result = ''
        let lock = new concurrency.stackless.AsyncReadWriteLock()
        let rLock = lock.readLock()
        let wLock = lock.writeLock()
        await wLock.lock()
        result += '0'
        taskpool.execute(async () => {
          await rLock.lock()
          result += '2'
        })
        let eaw = new EAWorker()
        eaw.start()
        await eaw.run<void>(() => {
          result += '1'
          wLock.unlock()
        })
        eaw.quit()
        while (result.indexOf('2') < 0) {
          await Utils.msSleep(100)
        }
        let eaw2 = new EAWorker()
        eaw2.start()
        await eaw2.run<void>(() => {
          rLock.unlock()
          result += '3'
        })
        eaw2.join()
        await wLock.lock()
        result += '4'
        wLock.unlock()
        console.log(`TESTCASE ${tag} end, result: ` + result);
        expect(result).assertEqual('01234')
        Done()
      });

    /**
     * @tc.number SUB_RWLock_Test_2400
     * @tc.name RWLockTest024
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('RWLockTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (Done: () => void): Promise<void> => {
        const tag: string = 'RWLockTest024';
        console.info(`${tag} test start`);
        let result = ''
        let lock = new concurrency.stackless.AsyncReadWriteLock()
        let rLock = lock.readLock()
        let wLock = lock.writeLock()
        await wLock.lock()
        result += '0'
        for (let i = 0; i < 10; i++) {
          taskpool.execute(async () => {
            await rLock.lock()
            result += '1'
          }).finally(() => {
            rLock.unlock()
          })
        }
        let jobs: Promise<Promise<void>>[] = []
        let workers: EAWorker[] = []
        for (let i = 0; i < 10; i++) {
          let eaw = new EAWorker()
          eaw.start()
          workers.push(eaw)
          jobs.push(eaw.run<Promise<void>>(async (): Promise<void> => {
            await rLock.lock()
            result += '1'
          }))
        }
        let eaw = new EAWorker()
        eaw.start()
        await eaw.run<void>(() => {
          result += '0'
          wLock.unlock()
        })
        eaw.quit()
        await Promise.all(jobs)
        workers.forEach((worker: EAWorker) => {
          worker.join()
        })
        for (let i = 0; i < 10; i++) {
          rLock.unlock()
        }
        await wLock.lock()
        wLock.unlock()
        console.log(`TESTCASE ${tag} end, result: ` + result);
        expect(result.startsWith('0') && result.endsWith('1')).assertEqual(true)
        Done()
      });


    /**
     * @tc.number SUB_RWLock_Test_2500
     * @tc.name RWLockTest025
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('RWLockTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (Done: () => void): Promise<void> => {
        const tag: string = 'RWLockTest025';
        console.info(`${tag} test start`);
        let result = ''
        let lock = new concurrency.stackless.AsyncReadWriteLock()
        let rLock = lock.readLock()
        let wLock = lock.writeLock()
        let count = 0
        await rLock.lock()
        result += '0'
        for (let i = 0; i < 10; i++) {
          taskpool.execute(async (index: int) => {
            await rLock.lock()
            result += String(index)
            rLock.unlock()
            await wLock.lock()
            result += '1'
          }, i).finally(() => {
            wLock.unlock()
            count++
          })
        }
        let jobs: Promise<Promise<void>>[] = []
        let workers: EAWorker[] = []
        for (let i = 0; i < 10; i++) {
          let eaw = new EAWorker()
          eaw.start()
          workers.push(eaw)
          jobs.push(eaw.run<Promise<void>>(async (): Promise<void> => {
            await rLock.lock()
            result += '1'
          }))
          eaw.quit()
        }
        await Promise.all(jobs)
        workers.forEach((worker: EAWorker) => {
          worker.join()
        })
        for (let i = 0; i < 10; i++) {
          rLock.unlock()
        }
        rLock.unlock()
        while (count < 10) {
          await Utils.msSleep(100)
        }
        console.log(`TESTCASE ${tag} end, result: ` + result);
        expect(result.startsWith('0') && result.endsWith('1')).assertEqual(true)
        Done()
      });

    /**
     * @tc.number SUB_RWLock_Test_2600
     * @tc.name RWLockTest026
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('RWLockTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (Done: () => void): Promise<void> => {
        const tag: string = 'RWLockTest026';
        console.info(`${tag} test start`);
        let class1 = new BaseClass()
        let result = ''
        let lock = new concurrency.stackless.AsyncReadWriteLock()
        let rLock = lock.readLock()
        let wLock = lock.writeLock()

        for (let i = 0; i < 10; i++) {
          taskpool.execute(async (index: int) => {
            await rLock.lock()
            result += String(index)
          }, i).finally(() => {
            rLock.unlock()
            class1.increaseCount()
          })
          taskpool.execute(async (index: int) => {
            await wLock.lock()
            result += String(index)
          }, i).finally(() => {
            wLock.unlock()
            class1.increaseCount()
          })
        }
        let jobs: Promise<Promise<void>>[] = []
        let workers: EAWorker[] = []
        for (let i = 0; i < 10; i++) {
          let eaw = new EAWorker()
          eaw.start()
          workers.push(eaw)
          jobs.push(eaw.run<Promise<void>>(async (index: int): Promise<void> => {
            await rLock.lock()
            result += String(index)
            rLock.unlock()
            class1.increaseCount()
          }, i))
          let eaw1 = new EAWorker()
          eaw1.start()
          workers.push(eaw1)
          jobs.push(eaw1.run<Promise<void>>(async (index: int): Promise<void> => {
            await wLock.lock()
            result += String(index)
            wLock.unlock()
            class1.increaseCount()
          }, i))
        }

        await Promise.all(jobs)
        workers.forEach((worker: EAWorker) => {
          worker.join()
        })
        while (await class1.getCount() < 40) {
          await Utils.msSleep(100)
        }
        console.log(`TESTCASE ${tag} end, result: ` + result);
        expect(await class1.getCount()).assertEqual(40)
        Done()
      });
  })
}
