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

import {
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Size,
  Level,
  TestType
} from '@ohos/hypium';
import {
  delay,
  printArgs1,
  printArgs40,
  printArgs43,
  printArgs44,
  printArgs46,
  printArgs49,
  sleep
} from '../testability/pages/Utils';
import { ArkTSUtils, MessageEvents, taskpool, worker } from '@kit.ArkTS';

export default function AsynclockDifferentSecondTest() {
  describe('AsynclockDifferentSecondTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(300);
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
     * @tc.name   AsynclockDifferentTest3900
     * @tc.number SUB_UTILS_ASYNCLOCK_DIFFERENT_TEST_3900
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsynclockDifferentTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockDifferentTest3900';
        console.info(`${caseName} test start`);
        const promises: Promise<void>[] = [];
        let count = 0;
        const lock1 = ArkTSUtils.locks.AsyncLock.request('lock1');
        const lock2 = ArkTSUtils.locks.AsyncLock.request('lock2');
        const lock3 = ArkTSUtils.locks.AsyncLock.request('lock3');
        for (let i = 0; i < 10; i++) {
          const promise1 = lock1.lockAsync(async () => {
            console.log('Enter shared lock lock1');
            await lock2.lockAsync(async () => {
              console.log('Enter shared lock lock2');
              await lock3.lockAsync(async () => {
                setTimeout(() => {
                  console.log('Asynchronous operation completed');
                  count++;
                }, 200);
                console.log('Exit EXCLUSIVE lock lock3');
              }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
              console.log('Exit shared lock lock2');
            }, ArkTSUtils.locks.AsyncLockMode.SHARED);
            console.log('Exit shared lock lock1');
          }, ArkTSUtils.locks.AsyncLockMode.SHARED);
          console.log('Exit shared lock lock1');
          promises.push(promise1);
        }
        try {
          await Promise.all(promises);
        } catch (e) {
          console.log('Caught an error in Promise.all:', JSON.stringify(e));
        }
        while (count != 10) {
          await sleep(300);
        }
        console.log('Success execution count:' + count);
        expect(count).assertEqual(10);
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.name   AsynclockDifferentTest4000
     * @tc.number SUB_UTILS_ASYNCLOCK_DIFFERENT_TEST_4000
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsynclockDifferentTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockDifferentTest4000';
        console.info(`${caseName} test start`);
        let count = 0;
        let task: taskpool.Task = new taskpool.Task(printArgs40, 1);
        for (let i = 0; i < 3; i++) {
          taskpool.execute(task).then((value) => {
            count++;
            console.log('value:' + value);
          }).catch(() => {
            console.log('taskpool failed');
          })
        }
        while (count != 3) {
          await sleep(300);
        }
        console.log('Success execution count:' + count);
        expect(count).assertEqual(3);
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.name   AsynclockDifferentTest4100
     * @tc.number SUB_UTILS_ASYNCLOCK_DIFFERENT_TEST_4100
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsynclockDifferentTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockDifferentTest4100';
        console.info(`${caseName} test start`);
        let count = 0;
        let count1 = 0;
        let task: taskpool.Task = new taskpool.Task(delay, 1);
        task.onExecutionSucceeded(() => {
          count++;
        })
        for (let i = 0; i < 3; i++) {
           taskpool.execute(task).then((value) => {
            count1++;
            console.log('value:' + value);
          }).catch(() => {
            console.log('taskpool failed');
          })
        }
        while (count != 3) {
          await sleep(300);
        }
        console.log('Success execution count:' + count);
        expect(count).assertEqual(3);
        expect(count1).assertEqual(3);
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.name   AsynclockDifferentTest4200
     * @tc.number SUB_UTILS_ASYNCLOCK_DIFFERENT_TEST_4200
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsynclockDifferentTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockDifferentTest4200';
        console.info(`${caseName} test start`);
        const promises: Promise<void>[] = [];
        let count = 0;
        const lock1 = ArkTSUtils.locks.AsyncLock.request('lock1');
        const lock2 = ArkTSUtils.locks.AsyncLock.request('lock2');
        const lock3 = ArkTSUtils.locks.AsyncLock.request('lock3');
        for (let i = 0; i < 10; i++) {
          const promise1 = lock1.lockAsync(async () => {
            console.log('Enter shared lock lock1');
            await lock2.lockAsync(async () => {
              console.log('Enter EXCLUSIVE lock lock2');
              await lock3.lockAsync(async () => {
                let WorkThread: worker.ThreadWorker;
                WorkThread = new worker.ThreadWorker('../testability/workers/Worker2');
                WorkThread.postMessage(caseName);
                WorkThread.onmessage = (e: MessageEvents): void => {
                  count = e.data;
                  console.log('e:' + JSON.stringify(e));
                  console.info('main2 thread count is  ' + count);
                  WorkThread.terminate();
                }
                console.log('Exit EXCLUSIVE lock lock3');
              }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
              console.log('Exit EXCLUSIVE lock lock2');
            }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
            console.log('Exit shared lock lock1');
          }, ArkTSUtils.locks.AsyncLockMode.SHARED);
          console.log('Exit shared lock lock1');
          promises.push(promise1);
        }
        try {
          await Promise.all(promises);
        } catch (e) {
          console.log('Caught an error in Promise.all:', JSON.stringify(e));
        }
        while (count != 1) {
          await sleep(300);
        }
        console.log('Success execution count:' + count);
        expect(count).assertEqual(1);
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.name   AsynclockDifferentTest4300
     * @tc.number SUB_UTILS_ASYNCLOCK_DIFFERENT_TEST_4300
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsynclockDifferentTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockDifferentTest4300';
        console.info(`${caseName} test start`);
        let count = 0;
        let task: taskpool.Task = new taskpool.Task(printArgs43, 1);
        for (let i = 0; i < 3; i++) {
          taskpool.execute(task).then((value) => {
            count++;
            console.log('value:' + value);
          })
        }
        while (count != 3) {
          await sleep(300);
        }
        console.log('Success execution count:' + count);
        expect(count).assertEqual(3);
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.name   AsynclockDifferentTest4400
     * @tc.number SUB_UTILS_ASYNCLOCK_DIFFERENT_TEST_4400
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsynclockDifferentTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockDifferentTest4400';
        console.info(`${caseName} test start`);
        let count = 0;
        let task: taskpool.Task = new taskpool.Task(printArgs44, 1);
        for (let i = 0; i < 3; i++) {
          taskpool.execute(task).finally(() => {
            count++;
          })
        }
        while (count != 3) {
          await sleep(300);
        }
        console.log('Success execution count:' + count);
        expect(count).assertEqual(3);
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.name   AsynclockDifferentTest4500
     * @tc.number SUB_UTILS_ASYNCLOCK_DIFFERENT_TEST_4500
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsynclockDifferentTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockDifferentTest4500';
        console.info(`${caseName} test start`);
        const promises: Promise<void>[] = [];
        let count = 0;
        const lock1 = ArkTSUtils.locks.AsyncLock.request('lock1');
        const lock2 = ArkTSUtils.locks.AsyncLock.request('lock2');
        const options1 = new ArkTSUtils.locks.AsyncLockOptions<void>();
        options1.timeout = 1000;
        const options2 = new ArkTSUtils.locks.AsyncLockOptions<void>();
        options2.timeout = 1000;
        for (let i = 0; i <= 10; i++) {
          const promise1 = lock1.lockAsync(async () => {
            console.log('enter SHARE lock1');
            try {
              await lock2.lockAsync(async () => {
                console.log('enter EXCLUSIVE lock2');
                await new Promise<void>((resolve) => {
                  setTimeout(() => {
                    resolve();
                  }, 1000);
                });
                console.log('Exit EXCLUSIVE lock');
              }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE, options2);
            } catch (error) {
              count++;
              console.error(`Error acquiring lock2 in iteration ${count}:`, error);
            }
            console.log('Exit SHARED lock');
          }, ArkTSUtils.locks.AsyncLockMode.SHARED, options1);
          promises.push(promise1);
        }
        try {
          await Promise.all(promises);
        } catch (e) {
          console.log('Caught an error in Promise.all:', JSON.stringify(e));
        }
        while (count != 10) {
          await sleep(300);
        }
        console.log('Success execution count:' + count);
        expect(count).assertEqual(10);
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.name   AsynclockDifferentTest4600
     * @tc.number SUB_UTILS_ASYNCLOCK_DIFFERENT_TEST_4600
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsynclockDifferentTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockDifferentTest4600';
        console.info(`${caseName} test start`);
        let count = 0;
        let task: taskpool.Task = new taskpool.Task(printArgs46, 1);
        for (let i = 0; i < 3; i++) {
          taskpool.execute(task).then((value) => {
            count++;
            console.log('value:' + value);
          })
        }
        while (count != 3) {
          await sleep(300);
        }
        console.log('Success execution count:' + count);
        expect(count).assertEqual(3);
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.name   AsynclockDifferentTest4700
     * @tc.number SUB_UTILS_ASYNCLOCK_DIFFERENT_TEST_4700
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsynclockDifferentTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockDifferentTest4700';
        console.info(`${caseName} test start`);
        let count: number = 0;
        let WorkThread: worker.ThreadWorker;
        WorkThread = new worker.ThreadWorker('../testability/workers/Worker2');
        WorkThread.postMessage(caseName);
        WorkThread.onmessage = (e: MessageEvents): void => {
          count = e.data;
          console.log('e:' + JSON.stringify(e));
          console.info('main2 thread count is  ' + count);
          WorkThread.terminate();
        }
        while (count != 1) {
          await sleep(300);
        }
        console.log('Success execution count:' + count);
        expect(count).assertEqual(1);
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.name   AsynclockDifferentTest4800
     * @tc.number SUB_UTILS_ASYNCLOCK_DIFFERENT_TEST_4800
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsynclockDifferentTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockDifferentTest4800';
        console.info(`${caseName} test start`);
        const promises: Promise<void>[] = [];
        let count = 0;
        const lock1 = ArkTSUtils.locks.AsyncLock.request('lock1');
        const lock2 = ArkTSUtils.locks.AsyncLock.request('lock2');
        const options1 = new ArkTSUtils.locks.AsyncLockOptions<void>();
        options1.timeout = 1000;
        const options2 = new ArkTSUtils.locks.AsyncLockOptions<void>();
        options2.timeout = 1000;
        for (let i = 0; i < 10; i++) {
          const promise1 = lock1.lockAsync(async () => {
            console.log('enter SHARE lock1');
            try {
              await lock2.lockAsync(async () => {
                console.log('enter SHARED lock2');
                await new Promise<void>((resolve) => {
                  setTimeout(() => {
                    count++;
                    resolve();
                  }, 1000);
                });
                console.log('Exit SHARED lock');
              }, ArkTSUtils.locks.AsyncLockMode.SHARED, options2);
            } catch (error) {
              console.error(`Error acquiring lock2 in iteration ${count}:`, error);
            }
            console.log('Exit SHARED lock');
          }, ArkTSUtils.locks.AsyncLockMode.SHARED, options1);
          promises.push(promise1);
        }
        try {
          await Promise.all(promises);
        } catch (e) {
          console.log('Caught an error in Promise.all:', JSON.stringify(e));
        }
        while (count != 10) {
          await sleep(300);
        }
        console.log('Success execution count:' + count);
        expect(count).assertEqual(10);
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.name   AsynclockDifferentTest4900
     * @tc.number SUB_UTILS_ASYNCLOCK_DIFFERENT_TEST_4900
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsynclockDifferentTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockDifferentTest4900';
        console.info(`${caseName} test start`);
        let count = 0;
        let task: taskpool.Task = new taskpool.Task(printArgs49, 1);
        for (let i = 0; i < 3; i++) {
          taskpool.execute(task).then((value) => {
            count++;
            console.log('value:' + value);
          })
        }
        while (count != 3) {
          await sleep(300);
        }
        console.log('Success execution count:' + count);
        expect(count).assertEqual(3);
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.name   AsynclockDifferentTest5000
     * @tc.number SUB_UTILS_ASYNCLOCK_DIFFERENT_TEST_5000
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsynclockDifferentTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockDifferentTest5000';
        console.info(`${caseName} test start`);
        let count: number = 0;
        let WorkThread: worker.ThreadWorker;
        WorkThread = new worker.ThreadWorker('../testability/workers/Worker2');
        WorkThread.postMessage(caseName);
        WorkThread.onmessage = (e: MessageEvents): void => {
          count = e.data;
          console.log('e:' + JSON.stringify(e));
          console.info('main2 thread count is  ' + count);
          WorkThread.terminate();
        }
        while (count != 1) {
          await sleep(300);
        }
        console.log('Success execution count:' + count);
        expect(count).assertEqual(1);
        console.info(`${caseName} test end`);
        Done();
      });

  })
}