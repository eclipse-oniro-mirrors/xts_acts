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
import { ConcurrentFunc, delay, printArgs1,
  printArgs12,
  printArgs15,
  printArgs17,
  printArgs2,
  printArgs20,
  printArgs21,
  printArgs23,
  printArgs25,
  printArgs37,
  printArgs4,
  printArgs9,
  sleep } from '../testability/pages/Utils';
import { ArkTSUtils, MessageEvents, taskpool, worker } from '@kit.ArkTS';
import { testTask, testTask1, testTask2 } from '../testability/pages/Methods';

export default function AsynclockDifferentTest() {
  describe('AsynclockDifferentTest', () => {
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
     * @tc.number SUB_ASYNCLOCK_DIFFERENT_TEST_0100
     * @tc.name AsynclockDifferentTest0100
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AsynclockDifferentTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockDifferentTest0100';
        console.info(`${caseName} test start`);
        let LOCK1 = new ArkTSUtils.locks.AsyncLock();
        const promises: Promise<void>[] = [];
        let count = 0;
        for (let i = 0; i < 10; i++) {
          const promise = LOCK1.lockAsync(async () => {
            console.log('SHARED');
            console.log('EXCLUSIVE');
            try {
              throw new Error('Error occurred in asynchronous operation');
            } catch (error) {
              count++;
              console.error('Caught an exception:', error.message);
            }
          }, ArkTSUtils.locks.AsyncLockMode.SHARED);
          promises.push(promise);
        }
        await Promise.all(promises);
        while (count != 10) {
          await sleep(300);
        }
        console.log('count:' + count);
        expect(count).assertEqual(10);
        console.info(`${caseName} test end`)
        Done();
      });


    /**
     * @tc.number SUB_ASYNCLOCK_DIFFERENT_TEST_0200
     * @tc.name AsynclockDifferentTest0200
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AsynclockDifferentTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockDifferentTest0200';
        console.info(`${caseName} test start`);
        let task: taskpool.Task = new taskpool.Task(printArgs2, 0);
        let count1 = 0;
        for (let i = 0; i < 3; i++) {
          taskpool.execute(task).then((value: Object) => {
            console.log('taskpool result: ' + value);
            count1++
          });
        }
        while (count1 != 3) {
          await sleep(300);
        }
        console.log('count1:' + count1);
        expect(count1).assertEqual(3);
        console.info(`${caseName} test end`)
        Done();
      });


    /**
     * @tc.number SUB_ASYNCLOCK_DIFFERENT_TEST_0300
     * @tc.name AsynclockDifferentTest0300
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AsynclockDifferentTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockDifferentTest0300';
        console.info(`${caseName} test start`);
        const lock1 = new ArkTSUtils.locks.AsyncLock();
        const promises: Promise<void>[] = [];
        let count = 0;
        for (let i = 0; i < 10; i++) {
          const promise1 = lock1.lockAsync(async () => {
            console.log('Enter shared lock lock1');
            await new Promise<void>((resolve) => {
              setTimeout(() => {
                console.log('Asynchronous operation completed');
                resolve();
                count++;
              }, 200);
            });
          }, ArkTSUtils.locks.AsyncLockMode.SHARED);
          console.log('Exit shared lock lock1');
          promises.push(promise1);
        }
        while (count != 10) {
          await sleep(300);
        }
        await Promise.all(promises);
        console.log('Success execution count:' + count);
        expect(count).assertEqual(10);
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.number SUB_ASYNCLOCK_DIFFERENT_TEST_0400
     * @tc.name AsynclockDifferentTest0400
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AsynclockDifferentTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockDifferentTest0400';
        console.info(`${caseName} test start`);
        let task: taskpool.Task = new taskpool.Task(printArgs4, 0);
        let count = 0;
        for (let i = 0; i < 3; i++) {
          taskpool.execute(task).then((value: Object) => {
            console.log('taskpool result: ' + value);
            count++
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
     * @tc.number SUB_ASYNCLOCK_DIFFERENT_TEST_0500
     * @tc.name AsynclockDifferentTest0500
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AsynclockDifferentTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockDifferentTest0500';
        console.info(`${caseName} test start`);
        const lock1 = new ArkTSUtils.locks.AsyncLock();
        let count = 0;
        const promises: Promise<void>[] = [];
        for (let i = 0; i < 10; i++) {
          const promise1 = lock1.lockAsync(async () => {
            console.log('Enter shared lock lock1');
            await new Promise<void>((_, reject) => {
              setTimeout(() => {
                console.log('Asynchronous operation completed');
                reject();
                count++;
              }, 200);
            });
          }, ArkTSUtils.locks.AsyncLockMode.SHARED);
          console.log('Exit shared lock lock1');
          promises.push(promise1);
        }
        await Promise.all(promises);
        while (count != 10) {
          await sleep(300);
        }
        console.log('Success execution count:' + count);
        expect(count).assertEqual(10);
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.number SUB_ASYNCLOCK_DIFFERENT_TEST_0600
     * @tc.name AsynclockDifferentTest0600
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AsynclockDifferentTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockDifferentTest0600';
        console.info(`${caseName} test start`);
        let task: taskpool.Task = new taskpool.Task(printArgs1, 1);
        let count = 0;
        for (let i = 0; i < 3; i++) {
          taskpool.execute(task).then((value) => {
            console.log('taskpool result: ' + value);
            count++
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
     * @tc.number SUB_ASYNCLOCK_DIFFERENT_TEST_0700
     * @tc.name AsynclockDifferentTest0700
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AsynclockDifferentTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockDifferentTest0700';
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
        while (count != 10) {
          await sleep(300);
        }
        console.log('Success execution count:' + count);
        expect(count).assertEqual(10);
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.number SUB_ASYNCLOCK_DIFFERENT_TEST_0800
     * @tc.name AsynclockDifferentTest0800
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AsynclockDifferentTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockDifferentTest0800';
        console.info(`${caseName} test start`);
        const lock1 = new ArkTSUtils.locks.AsyncLock();
        const promises: Promise<void>[] = [];
        let count = 0;
        let errorCount = 0;
        for (let i = 0; i < 10; i++) {
          const promise1 = lock1.lockAsync(async () => {
            console.log('Enter shared lock lock1');
            await new Promise<void>((_, reject) => {
              setTimeout(() => {
                try {
                  count++;
                  const error = new Error('Simulated asynchronous operation error');
                  console.error('Caught an exception:', error.message);
                  throw error;
                } catch (e) {
                  errorCount++;
                  reject(e);
                }
              }, 200);
            });
          }, ArkTSUtils.locks.AsyncLockMode.SHARED);
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
        console.log('Error count:' + errorCount);
        expect(count).assertEqual(10);
        expect(errorCount).assertEqual(10);
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.number SUB_ASYNCLOCK_DIFFERENT_TEST_0900
     * @tc.name AsynclockDifferentTest0900
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AsynclockDifferentTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockDifferentTest0900';
        console.info(`${caseName} test start`);
        let task: taskpool.Task = new taskpool.Task(printArgs9, 1);
        let count = 0;
        for (let i = 0; i < 3; i++) {
          taskpool.execute(task).then((value) => {
            console.log('taskpool result: ' + value);
            count++
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
     * @tc.number SUB_ASYNCLOCK_DIFFERENT_TEST_1000
     * @tc.name AsynclockDifferentTest1000
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AsynclockDifferentTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockDifferentTest1000';
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
     * @tc.number SUB_ASYNCLOCK_DIFFERENT_TEST_1100
     * @tc.name AsynclockDifferentTest1100
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AsynclockDifferentTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockDifferentTest1100';
        console.info(`${caseName} test start`);
        const lock1 = new ArkTSUtils.locks.AsyncLock();
        const lock2 = new ArkTSUtils.locks.AsyncLock();
        const promises: Promise<void>[] = [];
        let count = 0;
        let errorCount = 0;
        for (let i = 0; i < 10; i++) {
          const promise1 = lock1.lockAsync(async () => {
            console.log('Enter shared lock lock1');
            await lock2.lockAsync(async () => {
              console.log('Enter exclusive lock lock2');
              await new Promise<void>((_, reject) => {
                setTimeout(() => {
                  try {
                    count++;
                    const error = new Error('Simulated asynchronous operation error');
                    console.error('Caught an exception:', error.message);
                    throw error;
                  } catch (e) {
                    errorCount++;
                    reject(e);
                  }
                }, 200);
              });
            }, ArkTSUtils.locks.AsyncLockMode.SHARED);
            console.log('Exit exclusive lock lock2');
          }, ArkTSUtils.locks.AsyncLockMode.SHARED);
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
        console.log('Error count:' + errorCount);
        expect(count).assertEqual(10);
        expect(errorCount).assertEqual(10);
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.number SUB_ASYNCLOCK_DIFFERENT_TEST_1200
     * @tc.name AsynclockDifferentTest1200
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AsynclockDifferentTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockDifferentTest1200';
        console.info(`${caseName} test start`);
        let task: taskpool.Task = new taskpool.Task(printArgs12, 0);
        let count = 0;
        for (let i = 0; i < 3; i++) {
          taskpool.execute(task).then((value) => {
            console.log('taskpool result: ' + value);
            count++
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
     * @tc.number SUB_ASYNCLOCK_DIFFERENT_TEST_1300
     * @tc.name AsynclockDifferentTest1300
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AsynclockDifferentTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockDifferentTest1300';
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
     * @tc.number SUB_ASYNCLOCK_DIFFERENT_TEST_1400
     * @tc.name AsynclockDifferentTest1400
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AsynclockDifferentTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockDifferentTest1400';
        console.info(`${caseName} test start`);
        const lock1 = new ArkTSUtils.locks.AsyncLock();
        const lock2 = new ArkTSUtils.locks.AsyncLock();
        const promises: Promise<void>[] = [];
        let count = 0;
        for (let i = 0; i < 10; i++) {
          const promise1 = lock1.lockAsync(async () => {
            console.log('Enter shared lock lock1');
            await lock2.lockAsync(async () => {
              console.log('Enter exclusive lock lock2');
              await new Promise<void>((resolve) => {
                setTimeout(() => {
                  count++;
                  resolve();
                }, 200);
              });
            }, ArkTSUtils.locks.AsyncLockMode.SHARED);
            console.log('Exit exclusive lock lock2');
          }, ArkTSUtils.locks.AsyncLockMode.SHARED);
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
     * @tc.number SUB_ASYNCLOCK_DIFFERENT_TEST_1500
     * @tc.name AsynclockDifferentTest1500
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AsynclockDifferentTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockDifferentTest1500';
        console.info(`${caseName} test start`);
        let task: taskpool.Task = new taskpool.Task(printArgs15, 1);
        let count = 0;
        for (let i = 0; i < 3; i++) {
          taskpool.execute(task).then((value) => {
            console.log('taskpool result: ' + value);
            count++
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
     * @tc.number SUB_ASYNCLOCK_DIFFERENT_TEST_1600
     * @tc.name AsynclockDifferentTest1600
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AsynclockDifferentTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockDifferentTest1600';
        console.info(`${caseName} test start`);
        const lock1 = new ArkTSUtils.locks.AsyncLock();
        const lock2 = new ArkTSUtils.locks.AsyncLock();
        const promises: Promise<void>[] = [];
        let count = 0;
        for (let i = 0; i < 10; i++) {
          const promise1 = lock1.lockAsync(async () => {
            console.log('Enter shared lock lock1');
            await lock2.lockAsync(async () => {
              console.log('Enter exclusive lock lock2');
              await new Promise<void>((_, reject) => {
                setTimeout(() => {
                  count++;
                  reject();
                }, 200);
              });
            }, ArkTSUtils.locks.AsyncLockMode.SHARED);
            console.log('Exit exclusive lock lock2');
          }, ArkTSUtils.locks.AsyncLockMode.SHARED);
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
     * @tc.number SUB_ASYNCLOCK_DIFFERENT_TEST_1700
     * @tc.name AsynclockDifferentTest1700
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AsynclockDifferentTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockDifferentTest1700';
        console.info(`${caseName} test start`);
        let task: taskpool.Task = new taskpool.Task(printArgs17, 1);
        let count = 0;
        for (let i = 0; i < 3; i++) {
          taskpool.execute(task).then((value) => {
            console.log('taskpool result: ' + value);
            count++
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
     * @tc.number SUB_ASYNCLOCK_DIFFERENT_TEST_1800
     * @tc.name AsynclockDifferentTest1800
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AsynclockDifferentTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockDifferentTest1800';
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
     * @tc.number SUB_ASYNCLOCK_DIFFERENT_TEST_1900
     * @tc.name AsynclockDifferentTest1900
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AsynclockDifferentTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockDifferentTest1900';
        console.info(`${caseName} test start`);
        const lock1 = new ArkTSUtils.locks.AsyncLock();
        const lock2 = new ArkTSUtils.locks.AsyncLock();
        const promises: Promise<void>[] = [];
        let count = 0;
        let errorCount = 0;
        for (let i = 0; i < 10; i++) {
          const promise1 = lock1.lockAsync(async () => {
            console.log('Enter shared lock lock1');
            await lock2.lockAsync(async () => {
              console.log('Enter exclusive lock lock2');
              await new Promise<void>((_, reject) => {
                setTimeout(() => {
                  try {
                    count++;
                    const error = new Error('Simulated asynchronous operation error');
                    console.error('Caught an exception:', error.message);
                    throw error;
                  } catch (e) {
                    errorCount++;
                    reject(e);
                  }
                }, 200);
              });
            }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
            console.log('Exit exclusive lock lock2');
          }, ArkTSUtils.locks.AsyncLockMode.SHARED);
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
        console.log('Error count:' + errorCount);
        expect(count).assertEqual(10);
        expect(errorCount).assertEqual(10);
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.number SUB_ASYNCLOCK_DIFFERENT_TEST_2000
     * @tc.name AsynclockDifferentTest2000
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AsynclockDifferentTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockDifferentTest2000';
        console.info(`${caseName} test start`);
        let task: taskpool.Task = new taskpool.Task(printArgs20, 1);
        let count = 0;
        for (let i = 0; i < 3; i++) {
          taskpool.execute(task).then((value) => {
            console.log('taskpool result: ' + value);
            count++
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
     * @tc.number SUB_ASYNCLOCK_DIFFERENT_TEST_2100
     * @tc.name AsynclockDifferentTest2100
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AsynclockDifferentTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockDifferentTest2100';
        console.info(`${caseName} test start`);
        let task: taskpool.Task = new taskpool.Task(printArgs21, 0);
        let count = 0;
        task.onEnqueued(() => {
          console.info('taskpool: onEnqueued')
        });
        for (let i = 0; i < 3; i++) {
          taskpool.execute(task).then((value) => {
            count++;
            console.log('value:' + value)
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
     * @tc.number SUB_ASYNCLOCK_DIFFERENT_TEST_2200
     * @tc.name AsynclockDifferentTest2200
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AsynclockDifferentTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockDifferentTest2200';
        console.info(`${caseName} test start`);
        const lock1 = new ArkTSUtils.locks.AsyncLock();
        const lock2 = new ArkTSUtils.locks.AsyncLock();
        const promises: Promise<void>[] = [];
        let count = 0;
        for (let i = 0; i < 10; i++) {
          const promise1 = lock1.lockAsync(async () => {
            console.log('Enter shared lock lock1');
            await lock2.lockAsync(async () => {
              console.log('Enter exclusive lock lock2');
              await new Promise<void>((resolve) => {
                setTimeout(() => {
                  count++;
                  resolve();
                }, 200);
              });
            }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
            console.log('Exit exclusive lock lock2');
          }, ArkTSUtils.locks.AsyncLockMode.SHARED);
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
     * @tc.number SUB_ASYNCLOCK_DIFFERENT_TEST_2300
     * @tc.name AsynclockDifferentTest2300
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AsynclockDifferentTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockDifferentTest2300';
        console.info(`${caseName} test start`);
        let task: taskpool.Task = new taskpool.Task(printArgs23, 1);
        let count = 0;
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
     * @tc.number SUB_ASYNCLOCK_DIFFERENT_TEST_2400
     * @tc.name AsynclockDifferentTest2400
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AsynclockDifferentTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockDifferentTest2400';
        console.info(`${caseName} test start`);
        const lock1 = new ArkTSUtils.locks.AsyncLock();
        const lock2 = new ArkTSUtils.locks.AsyncLock();
        const promises: Promise<void>[] = [];
        let count = 0;
        for (let i = 0; i < 10; i++) {
          const promise1 = lock1.lockAsync(async () => {
            console.log('Enter shared lock lock1');
            await lock2.lockAsync(async () => {
              console.log('Enter exclusive lock lock2');
              await new Promise<void>((_, reject) => {
                setTimeout(() => {
                  count++;
                  reject();
                }, 200);
              });
            }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
            console.log('Exit exclusive lock lock2');
          }, ArkTSUtils.locks.AsyncLockMode.SHARED);
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
     * @tc.number SUB_ASYNCLOCK_DIFFERENT_TEST_2500
     * @tc.name AsynclockDifferentTest2500
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AsynclockDifferentTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockDifferentTest2500';
        console.info(`${caseName} test start`);
        let task: taskpool.Task = new taskpool.Task(printArgs25, 1);
        let count = 0;
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
     * @tc.number SUB_ASYNCLOCK_DIFFERENT_TEST_2600
     * @tc.name AsynclockDifferentTest2600
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AsynclockDifferentTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockDifferentTest2600';
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
     * @tc.number SUB_ASYNCLOCK_DIFFERENT_TEST_2700
     * @tc.name AsynclockDifferentTest2700
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AsynclockDifferentTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockDifferentTest2700';
        console.info(`${caseName} test start`);
        const promises: Promise<void>[] = [];
        let count1 = 0;
        let count = 0;
        const lock1 = new ArkTSUtils.locks.AsyncLock();
        const lock2 = new ArkTSUtils.locks.AsyncLock();
        let task: taskpool.Task = new taskpool.Task(printArgs1, 1);
        for (let i = 0; i < 10; i++) {
          const promise1 = lock1.lockAsync(async () => {
            console.log('Enter shared lock lock1');
            await lock2.lockAsync(() => {
              count++;
              console.log('Enter exclusive lock lock2');
              taskpool.execute(task).then(() => {
                count1++;
                console.log('taskpool success');
              })
            }, ArkTSUtils.locks.AsyncLockMode.SHARED);
            console.log('Exit exclusive lock lock2');
          }, ArkTSUtils.locks.AsyncLockMode.SHARED);
          console.log('Exit shared lock lock1');
          promises.push(promise1);
        }
        try {
          await Promise.all(promises);
        } catch (e) {
          console.log('Caught an error in Promise.all:', JSON.stringify(e));
        }
        while (count1 != 10) {
          await sleep(300);
        }
        console.log('Success execution count1:' + count1);
        expect(count).assertEqual(10);
        expect(count1).assertEqual(10);
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.number SUB_ASYNCLOCK_DIFFERENT_TEST_2800
     * @tc.name AsynclockDifferentTest2800
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AsynclockDifferentTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockDifferentTest2800';
        console.info(`${caseName} test start`);
        let count1 = 0;
        for (let i = 0; i < 3; i++) {
          taskpool.execute(testTask).then(() => {
            count1++;
            console.info(`testTask executed successfully`);
          }).catch((error: Error) => {
            console.error(`testTask execution failed: ${error}`);
          });
        }
        while (count1 != 3) {
          await sleep(300);
        }
        console.log('Success execution count1:' + count1);
        expect(count1).assertEqual(3);
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.number SUB_ASYNCLOCK_DIFFERENT_TEST_2900
     * @tc.name AsynclockDifferentTest2900
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AsynclockDifferentTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockDifferentTest2900';
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
     * @tc.number SUB_ASYNCLOCK_DIFFERENT_TEST_3000
     * @tc.name AsynclockDifferentTest3000
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AsynclockDifferentTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockDifferentTest3000';
        console.info(`${caseName} test start`);
        const promises: Promise<void>[] = [];
        let count1 = 0;
        let count = 0;
        const lock1 = new ArkTSUtils.locks.AsyncLock();
        const lock2 = new ArkTSUtils.locks.AsyncLock();
        let task: taskpool.Task = new taskpool.Task(printArgs1, 1);
        for (let i = 0; i < 10; i++) {
          const promise1 = lock1.lockAsync(async () => {
            console.log('Enter shared lock lock1');
            await lock2.lockAsync(() => {
              count++;
              console.log('Enter exclusive lock lock2');
              taskpool.execute(task).then(() => {
                count1++;
                console.log('taskpool success');
              })
            }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
            console.log('Exit exclusive lock lock2');
          }, ArkTSUtils.locks.AsyncLockMode.SHARED);
          console.log('Exit shared lock lock1');
          promises.push(promise1);
        }
        try {
          await Promise.all(promises);
        } catch (e) {
          console.log('Caught an error in Promise.all:', JSON.stringify(e));
        }
        while (count1 != 10) {
          await sleep(300);
        }
        console.log('Success execution count1:' + count1);
        expect(count).assertEqual(10);
        expect(count1).assertEqual(10);
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.number SUB_ASYNCLOCK_DIFFERENT_TEST_3100
     * @tc.name AsynclockDifferentTest3100
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AsynclockDifferentTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockDifferentTest3100';
        console.info(`${caseName} test start`);
        let count1 = 0;
        for (let i = 0; i < 3; i++) {
          taskpool.execute(testTask1).then(() => {
            count1++;
            console.info(`testTask executed successfully`);
          }).catch((error: Error) => {
            console.error(`testTask execution failed: ${error}`);
          });
        }
        while (count1 != 3) {
          await sleep(300);
        }
        console.log('Success execution count1:' + count1);
        expect(count1).assertEqual(3);
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.number SUB_ASYNCLOCK_DIFFERENT_TEST_3200
     * @tc.name AsynclockDifferentTest3200
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AsynclockDifferentTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockDifferentTest3200';
        console.info(`${caseName} test start`);
        let count = 0;
        let count1 = 0;
        const promises: Promise<void>[] = [];
        let task: taskpool.Task = new taskpool.Task(delay, 1);
        const lock1 = new ArkTSUtils.locks.AsyncLock();
        const lock2 = new ArkTSUtils.locks.AsyncLock();
        task.onStartExecution(() => {
          console.info('taskpool: onStartExecution');
          const promise1 = lock1.lockAsync(async () => {
            console.log('Enter shared lock lock1');
            await lock2.lockAsync(() => {
              console.log('Enter exclusive lock lock2');
              taskpool.execute(task).then(() => {
                count++;
                console.log('taskpool success:' + count);
              });
            }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
            console.log('Exit exclusive lock lock2');
          }, ArkTSUtils.locks.AsyncLockMode.SHARED);
          console.log('Exit shared lock lock1');
          promises.push(promise1);
        });
        await taskpool.execute(task).then(() => {
          count1++;
        });
        console.log('count:' + count);
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
        expect(count1).assertEqual(1);
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.number SUB_ASYNCLOCK_DIFFERENT_TEST_3300
     * @tc.name AsynclockDifferentTest3300
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AsynclockDifferentTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockDifferentTest3300';
        console.info(`${caseName} test start`);
        const promises: Promise<void>[] = [];
        let count1 = 0;
        let count = 0;
        const lock1 = ArkTSUtils.locks.AsyncLock.request('lock1');
        const lock2 = ArkTSUtils.locks.AsyncLock.request('lock2');
        const lock3 = ArkTSUtils.locks.AsyncLock.request('lock3');
        let task: taskpool.Task = new taskpool.Task(printArgs1, 1);
        for (let i = 0; i < 10; i++) {
          const promise1 = lock1.lockAsync(async () => {
            console.log('Enter shared lock lock1');
            await lock2.lockAsync(async () => {
              console.log('Enter shared lock lock2');
              await lock3.lockAsync(() => {
                console.log('Enter shared lock lock3');
                count++;
                console.log('Enter exclusive lock lock2');
                taskpool.execute(task).then(() => {
                  count1++;
                  console.log('taskpool success');
                })
                console.log('Exit shared lock lock3');
              }, ArkTSUtils.locks.AsyncLockMode.SHARED);
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
        while (count1 != 10) {
          await sleep(300);
        }
        console.log('Success execution count1:' + count1);
        expect(count).assertEqual(10);
        expect(count1).assertEqual(10);
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.number SUB_ASYNCLOCK_DIFFERENT_TEST_3400
     * @tc.name AsynclockDifferentTest3400
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AsynclockDifferentTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockDifferentTest3400';
        console.info(`${caseName} test start`);
        let count1 = 0;
        for (let i = 0; i < 3; i++) {
          taskpool.execute(testTask2).then(() => {
            count1++;
            console.info(`testTask executed successfully`);
          }).catch((error: Error) => {
            console.error(`testTask execution failed: ${error}`);
          });
        }
        while (count1 != 3) {
          await sleep(300);
        }
        console.log('Success execution count1:' + count1);
        expect(count1).assertEqual(3);
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.number SUB_ASYNCLOCK_DIFFERENT_TEST_3500
     * @tc.name AsynclockDifferentTest3500
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AsynclockDifferentTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockDifferentTest3500';
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
     * @tc.number SUB_ASYNCLOCK_DIFFERENT_TEST_3600
     * @tc.name AsynclockDifferentTest3600
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AsynclockDifferentTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockDifferentTest3600';
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
                await new Promise<void>((resolve) => {
                  setTimeout(() => {
                    console.log('Asynchronous operation completed');
                    resolve();
                    count++;
                  }, 200);
                });
                console.log('Exit shared lock lock3');
              }, ArkTSUtils.locks.AsyncLockMode.SHARED);
              console.log('Exit shared lock lock2');
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
        while (count != 10) {
          await sleep(300);
        }
        console.log('Success execution count:' + count);
        expect(count).assertEqual(10);
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.number SUB_ASYNCLOCK_DIFFERENT_TEST_3700
     * @tc.name AsynclockDifferentTest3700
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AsynclockDifferentTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockDifferentTest3700';
        console.info(`${caseName} test start`);
        let count = 0;
        let task: taskpool.Task = new taskpool.Task(printArgs37, 1);
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
     * @tc.number SUB_ASYNCLOCK_DIFFERENT_TEST_3800
     * @tc.name AsynclockDifferentTest3800
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AsynclockDifferentTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockDifferentTest3800';
        console.info(`${caseName} test start`);
        let count: number = 0;
        let count1: number = 0;
        let task: taskpool.Task = new taskpool.Task(ConcurrentFunc, 1);
        let onReceiveDataCallback: (data: number) => void = () => {
          count++;
          console.log('enter onReceiveData:' + count);
        };
        task.onReceiveData(onReceiveDataCallback);
        for (let i = 0; i < 3; i++) {
          taskpool.execute(task).then(() => {
            count1++;
          }).catch((error: Error) => {
            console.error('taskpool execute failed: ', error);
          });
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

  })
}