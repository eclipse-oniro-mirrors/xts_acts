/*
* Copyright (C) 2025 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the 'License');
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an 'AS IS' BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Size, Level, TestType } from '@ohos/hypium';
import { ArkTSUtils , MessageEvents, taskpool, worker } from '@kit.ArkTS';
import { sleep } from '../testability/pages/Utils';
import {
  taskFunctionTest5000,
  taskFunctionTest5200,
  taskFunctionTest5500
} from '../testability/pages/TaskpoolUtilsAsynclockSameAddUtils';

export default function AsynclockSameAddSecondTest() {
  describe('AsynclockSameAddSecondTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(100);
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
     * @tc.number SUB_ASYNCLOCK_SAME_ADD_TEST_5000
     * @tc.name AsynclockSameAddTest5000
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AsynclockSameAddTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockSameAddTest5000';
        console.info(`${caseName} test start`);
        let task: taskpool.Task = new taskpool.Task(taskFunctionTest5000);
        let count = 0;
        for (let i = 0; i < 3; i++) {
          taskpool.execute(task).then((result) => {
            console.log(`${result}`);
            count++;
          });
        }
        while(count != 3){
          await sleep(300);
        }
        expect(count).assertEqual(3);
        console.info(`${caseName} test end`);
        Done();
      });



    /**
     * @tc.number SUB_ASYNCLOCK_SAME_ADD_TEST_5100
     * @tc.name AsynclockSameAddTest5100
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AsynclockSameAddTest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockSameAddTest5100';
        console.info(`${caseName} test start`);
        let lock1 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request('lock_1');
        let lock2 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request('lock_1');
        const promises: Promise<void>[] = [];
        let count = 0;
        for (let i = 0; i < 10; i++) {
          const promise1 = lock1.lockAsync(async () => {
            setTimeout(() => {},1000)
            console.log('Enter shared lock lock1');
            lock2.lockAsync(async () => {
              setTimeout(() => {},1000)
              console.log('Enter exclusive lock lock2');
              await new Promise<void>((resolve, reject) => {
                setTimeout(() => {
                  count++;
                  resolve();
                }, 1000);
              });
            }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
          }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
          promises.push(promise1);
        }
        try {
          await Promise.all(promises);
        } catch (e) {
          console.log('Caught an error in Promise.all:', JSON.stringify(e));
        }
        while(count != 10){
          await sleep(300);
        }
        expect(count).assertEqual(10);
        Done();
      });

    /**
     * @tc.number SUB_ASYNCLOCK_SAME_ADD_TEST_5200
     * @tc.name AsynclockSameAddTest5200
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AsynclockSameAddTest5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockSameAddTest5200';
        console.info(`${caseName} test start`);
        let task: taskpool.Task = new taskpool.Task(taskFunctionTest5200);
        let count = 0;
        for (let i = 0; i < 3; i++) {
          taskpool.execute(task).then((result) => {
            console.log(`${result}`);
            count++;
          });
        }
        while(count != 3){
          await sleep(300);
        }
        expect(count).assertEqual(3);
        console.info(`${caseName} test end`);
        Done();
      });

    /**
     * @tc.number SUB_ASYNCLOCK_SAME_ADD_TEST_5300
     * @tc.name AsynclockSameAddTest5300
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AsynclockSameAddTest5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockSameAddTest5300';
        console.info(`${caseName} test start`);
        let count: number = 0;
        let WorkThread: worker.ThreadWorker;
        WorkThread = new worker.ThreadWorker('../testability/workers/Worker1');
        WorkThread.onexit = () => {
          console.log('onexit');
        }
        WorkThread.postMessage(caseName);
        WorkThread.onmessage = (e: MessageEvents): void => {
          count = e.data;
          console.log('e:' + JSON.stringify(e));
          console.info('main2 thread count is  ' + count);
          WorkThread.terminate();
          console.log('Success execution count:' + count);
          console.info(`${caseName} test end`);
        }
        while (count != 1) {
          await sleep(300);
        }
        expect(count).assertEqual(1);
        Done();
      });

    /**
     * @tc.number SUB_ASYNCLOCK_SAME_ADD_TEST_5400
     * @tc.name AsynclockSameAddTest5400
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AsynclockSameAddTest5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockSameAddTest5400';
        console.info(`${caseName} test start`);
        let lock1 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request('lock_1');
        let lock2 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request('lock_1');
        const promises: Promise<void>[] = [];
        let count = 0;
        for (let i = 0; i < 10; i++) {
          const promise1 = lock1.lockAsync(async () => {
            setTimeout(() => {},1000)
            lock2.lockAsync(async () => {
              setTimeout(() => {},1000)
              setTimeout(() => {
                count++;
              }, 1000);
            }, ArkTSUtils.locks.AsyncLockMode.SHARED);
          }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
          promises.push(promise1);
        }
        try {
          await Promise.all(promises);
        } catch (e) {
          console.log('Caught an error in Promise.all:', JSON.stringify(e));
        }
        while(count != 10){
          await sleep(300);
        }
        expect(count).assertEqual(10);
        Done();
      });

    /**
     * @tc.number SUB_ASYNCLOCK_SAME_ADD_TEST_5500
     * @tc.name AsynclockSameAddTest5500
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AsynclockSameAddTest5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockSameAddTest5500';
        console.info(`${caseName} test start`);
        let task: taskpool.Task = new taskpool.Task(taskFunctionTest5500);
        let count = 0;
        for (let i = 0; i < 3; i++) {
          taskpool.execute(task).then((result) => {
            console.log(`${result}`);
            count++;
          });
        }
        while(count != 3){
          await sleep(300);
        }
        expect(count).assertEqual(3);
        console.info(`${caseName} test end`);
        Done();
      });

    /**
     * @tc.number SUB_ASYNCLOCK_SAME_ADD_TEST_5600
     * @tc.name AsynclockSameAddTest5600
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AsynclockSameAddTest5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockSameAddTest5600';
        console.info(`${caseName} test start`);
        let count: number = 0;
        let WorkThread: worker.ThreadWorker;
        WorkThread = new worker.ThreadWorker('../testability/workers/Worker1');
        WorkThread.onexit = () => {
          console.log('onexit');
        }
        WorkThread.postMessage(caseName);
        WorkThread.onmessage = (e: MessageEvents): void => {
          count = e.data;
          console.log('e:' + JSON.stringify(e));
          console.info('main2 thread count is  ' + count);
          WorkThread.terminate();
          console.log('Success execution count:' + count);
          console.info(`${caseName} test end`);
        }
        while (count != 1) {
          await sleep(300);
        }
        expect(count).assertEqual(1);
        Done();
      });

  })
}