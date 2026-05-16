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

export default function MutexLockTest() {
  describe('MutexLockTest', (): void => {
    afterEach(() => {
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
        let lock = new Mutex()
        lock.lock()
        count++
        lock.unlock()
        let func = async () => {
          lock.lock()
          count++
          lock.unlock()
        }
        await func()
        console.info(`${TAG} test start1`);
        await new Promise<void>((resolve) => {
          lock.lock()
          count++
          resolve(undefined)
        }).then(() => {
          lock.unlock()
        })
        console.info(`${TAG} test start2`);
        let eaw = new EAWorker()
        eaw.start()
        eaw.run<void>(() => {
          lock.lock()
          count++
          lock.unlock()
        }).Await()
        eaw.join()
        console.info(`${TAG} test start3`);
        setTimeout(() => {
          lock.lock()
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
     * @tc.level Level 0
     */
    it('MutexTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (Done: () => void): Promise<void> => {
        const TAG: string = 'MutexTest002';
        console.info(`${TAG} test start`);
        let count = 0
        let lock = new Mutex()
        lock.lock()
        count++
        let func = async () => {
          count++
          lock.unlock()
        }
        await func()
        await new Promise<void>((resolve) => {
          lock.lock()
          count++
          resolve(undefined)
        }).then(() => {
        })
        await taskpool.execute(() => {
          count++
          lock.unlock()
        })
        let eaw = new EAWorker()
        eaw.start()
        eaw.run<void>(() => {
          lock.lock()
          count++
        }).Await()
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
        let lock = new Mutex()
        let lock2 = new Mutex()
        let lock3 = new Mutex()
        let lock4 = new Mutex()
        lock.lock()
        count++
        let func = async () => {
          lock2.lock()
          count++
        }
        func()
        await taskpool.execute(() => {
          count++
          lock.unlock()
          lock3.lock()
        })
        let eaw = new EAWorker()
        eaw.start()
        eaw.run<void>(() => {
          count++
          lock2.unlock()
          lock4.lock()
        }).Await()
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
     * @tc.level Level 0
     */
    it('MutexTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const TAG: string = 'MutexTest004';
        console.info(`${TAG} test start`);
        let count = 0
        let lock = new Mutex()
        for (let i = 0; i < 1000; i++) {
          lock.lock()
          count++
          lock.unlock()
        }
        let func = async () => {
          lock.lock()
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
     * @tc.level Level 0
     */
    it('MutexTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const TAG: string = 'MutexTest005';
        console.info(`${TAG} test start`);
        let count = 0
        let lock = new Mutex()
        lock.lock()
        lock.unlock()
        try {
          lock.unlock()
        } catch (e) {
          count++
          expect(e.message).assertContain('state is already unlocked')
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
     * @tc.level Level 0
     */
    it('MutexTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const TAG: string = 'MutexTest006';
        console.info(`${TAG} test start`);
        let count = 0
        let lock = new Mutex()
        for (let i = 0; i < 100; i++) {
          taskpool.execute(()=>{
            lock.lock()
            count++
            lock.unlock()
          })
        }
        for (let i = 0; i < 10; i++) {
          let eaw = new EAWorker()
          eaw.start()
          eaw.run<void>(()=>{
            lock.lock()
            count++
            lock.unlock()
          })
          eaw.join()
        }
        lock.lock()
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
     * @tc.level Level 0
     */
    it('MutexTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const TAG: string = 'MutexTest007';
        console.info(`${TAG} test start`);
        let count = 0
        let lock = new Mutex()
        for (let i = 0; i < 10; i++) {
          taskpool.execute(()=>{
            lock.lock()
            for (let j = 0; j < 1000; j++) {
              count++
            }
            lock.unlock()
          })
        }
        for (let i = 0; i < 10; i++) {
          let eaw = new EAWorker()
          eaw.start()
          eaw.run<void>(()=>{
            lock.lock()
            for (let j = 0; j < 1000; j++) {
              count++
            }
            lock.unlock()
          })
          eaw.join()
        }
        lock.lock()
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
     * @tc.level Level 0
     */
    it('MutexTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const TAG: string = 'MutexTest008';
        console.info(`${TAG} test start`);
        let count = 0
        let lock = new Mutex()
        for (let i = 0; i < 10; i++) {
          taskpool.execute(()=>{
            lock.lock()
            count++
            throw new Error("error")
          }).finally(()=>{
            lock.unlock()
          })
        }
        for (let i = 0; i < 10; i++) {
          let eaw = new EAWorker()
          eaw.start()
          eaw.setUncaughtExceptionHandler(()=>{
            lock.unlock()
          })
          eaw.run<void>(()=>{
            lock.lock()
            count++
            throw new Error("error")
          })
          eaw.join()
        }
        lock.lock()
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
     * @tc.level Level 0
     */
    it('MutexTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const TAG: string = 'MutexTest009';
        console.info(`${TAG} test start`);
        let count = 0
        let lock = new Mutex()
        let lock2 = new Mutex()
        let lock3 = new Mutex()
        lock.lock()
        count++
        lock2.lock()
        count++
        lock3.lock()
        count++
        lock.unlock()
        lock2.unlock()
        lock3.unlock()
        lock.lock()
        count++
        lock2.lock()
        count++
        lock3.lock()
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