/**
 Copyright [yyyy] [name of copyright owner]

 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at

 http://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
 */
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium';
import { ArkTSUtils, collections, taskpool } from '@kit.ArkTS';

export let bitVector: collections.BitVector = new collections.BitVector(0);

export function sleep(time: number): Promise<void> {
  return new Promise((re, je) => {
    setTimeout(() => {
      re()
    }, time)
  })
}


export default function AsyncLocktest() {
  describe('AsyncLocktest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(500);
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.number    : SUB_COOLLECTION_ASYNCLOCK_0100
     * @tc.name      : AsyncLocktest0100
     * @tc.desc      : AsyncLock query 10200030
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('AsyncLocktest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'AsyncLocktest0100';
        console.info(`${caseName} test start`);
        let flag: boolean = false;

        try {
          let lock = ArkTSUtils.locks.AsyncLock.request("queryTestLock");
          let state = ArkTSUtils.locks.AsyncLock.query('1');
          console.info(`Lock: ${lock}, State: ${state}`);
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200030)
          flag = true
        }
        expect(flag).assertTrue()
        console.info(`${caseName} test end`);
        done()
      })


    /**
     * @tc.number    : SUB_COOLLECTION_ASYNCLOCK_0200
     * @tc.name      : AsyncLocktest0200
     * @tc.desc      : AsyncLock lockAsync 401
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */

    it('AsyncLocktest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'AsyncLocktest0200';
        console.info(`${caseName} test start`);
        let flag: boolean = false;

        const lock = new ArkTSUtils.locks.AsyncLock();
        try {
          await lock.lockAsync<void>(() => Promise.resolve(), 123);
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(401)
          flag = true
        }
        expect(flag).assertTrue()
        console.info(`${caseName} test end`);
        done()
      })


    /**
     * @tc.number    : SUB_COOLLECTION_ASYNCLOCK_0300
     * @tc.name      : AsyncLocktest0300
     * @tc.desc      : AsyncLock lockAsync 401
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('AsyncLocktest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'AsyncLocktest0300';
        console.info(`${caseName} test start`);
        let flag: boolean = false;

        const lock = new ArkTSUtils.locks.AsyncLock();
        try {
          await lock.lockAsync<void>(
            () => Promise.resolve(),
            -1 as ArkTSUtils.locks.AsyncLockMode
          );
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(401)
          flag = true
        }
        expect(flag).assertTrue()
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.number    : SUB_COOLLECTION_ASYNCLOCK_0400
     * @tc.name      : AsyncLocktest0400
     * @tc.desc      : AsyncLock lockAsync 401
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('AsyncLocktest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'AsyncLocktest0400';
        let flag: boolean = false;
        console.info(`${caseName} test start`);
        try {
          let lock = new ArkTSUtils.locks.AsyncLock();
          let options = new ArkTSUtils.locks.AsyncLockOptions<void>();

          let p: Promise<void> = lock.lockAsync<void, void>(
            async (): Promise<void> => {
            },
            999,
            options
          );

        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(401)
          flag = true
        }
        expect(flag).assertTrue()
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.number    : SUB_COOLLECTION_ASYNCLOCK_0500
     * @tc.name      : AsyncLocktest0500
     * @tc.desc      : AsyncLock lockAsync 10200031
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('AsyncLocktest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'AsyncLocktest0500';
        let flag: boolean = false;
        console.info(`${caseName} test start`);
        try {
          let lock = new ArkTSUtils.locks.AsyncLock();
          let options = new ArkTSUtils.locks.AsyncLockOptions<void>();
          options.timeout = 1000;
          let operation1 = lock.lockAsync<void, void>(async () => {
            console.info("操作1：开始占用锁");
            await new Promise<void>((resolve) => setTimeout(resolve, 3000));
            console.info("操作1：释放锁");
          }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE, options);

          let operation2 = lock.lockAsync<void, void>(() => {
            console.info("操作2：获取锁成功（不会执行）");
          }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE, options);
          await operation2;
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200031)
          flag = true
        }
        expect(flag).assertTrue()
        console.info(`${caseName} test end`);
        done()
      })

  })
}