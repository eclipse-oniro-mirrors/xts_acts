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
import { delay, printArgs1, sleep } from '../testability/pages/Utils';
import { ArkTSUtils, MessageEvents, taskpool, worker } from '@kit.ArkTS';
import {
  delay1,
  TaskFun1,
  TaskFun10,
  TaskFun12,
  TaskFun15,
  TaskFun16,
  TaskFun18,
  TaskFun2,
  TaskFun21,
  TaskFun22,
  TaskFun24,
  TaskFun27,
  TaskFun4,
  TaskFun7
} from '../testability/pages/Utils2';
import { TaskTest, TaskTest1, TaskTest2 } from '../testability/pages/Methods2';

export default function AsynclockDifferentThirdTest() {
  describe('AsynclockDifferentThirdTest', () => {
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
     * @tc.name   AsynclockDifferentThirdTest0100
     * @tc.number SUB_ASYNCLOCK_DIFFERENT_THIRD_TEST_0100
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsynclockDifferentThirdTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockDifferentThirdTest0100';
        console.info(`${caseName} test start`);
        let LOCK1 = new ArkTSUtils.locks.AsyncLock();
        const promises: Promise<void>[] = [];
        let count = 0;
        for (let i = 0; i < 10; i++) {
          const promise = LOCK1.lockAsync(async () => {
            console.log('EXCLUSIVE');
            try {
              throw new Error('Error occurred in asynchronous operation');
            } catch (error) {
              count++;
              console.error('Caught an exception:', error.message);
            }
          }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
          promises.push(promise);
        }
        await Promise.all(promises);
        while (count != 10) {
          await sleep(300);
        }
        console.log('count:' + count);
        expect(count).assertEqual(10);
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.name   AsynclockDifferentThirdTest0200
     * @tc.number SUB_ASYNCLOCK_DIFFERENT_THIRD_TEST_0200
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsynclockDifferentThirdTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockDifferentThirdTest0200';
        console.info(`${caseName} test start`);
        let task: taskpool.Task = new taskpool.Task(TaskFun2, 0);
        let count1 = 0;
        const promises: Promise<void>[] = [];
        for (let i = 0; i < 3; i++) {
          taskpool.execute(task).then((value: Object) => {
            console.log('taskpool result: ' + value);
            count1++
          });
        }
        try {
          await Promise.all(promises);
        } catch (e) {
          console.log('Caught an error in Promise.all:', JSON.stringify(e));
        }
        while (count1 != 3) {
          await sleep(300);
        }
        console.log('count1:' + count1);
        expect(count1).assertEqual(3);
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.name   AsynclockDifferentThirdTest0300
     * @tc.number SUB_ASYNCLOCK_DIFFERENT_THIRD_TEST_0300
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsynclockDifferentThirdTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockDifferentThirdTest0300';
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
          }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
          console.log('Exit shared lock lock1');
          promises.push(promise1);
        }
        await sleep(300);
        await Promise.all(promises);
        console.log('Success execution count:' + count);
        expect(count).assertEqual(10);
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.name   AsynclockDifferentThirdTest0400
     * @tc.number SUB_ASYNCLOCK_DIFFERENT_THIRD_TEST_0400
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsynclockDifferentThirdTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockDifferentThirdTest0400';
        console.info(`${caseName} test start`);
        let task: taskpool.Task = new taskpool.Task(TaskFun4, 0);
        let count = 0;
        const promises: Promise<void>[] = [];
        for (let i = 0; i < 3; i++) {
          taskpool.execute(task).then((value: Object) => {
            console.log('taskpool result: ' + value);
            count++
          })
        }
        try {
          await Promise.all(promises);
        } catch (e) {
          console.log('Caught an error in Promise.all:', JSON.stringify(e));
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
     * @tc.name   AsynclockDifferentThirdTest0500
     * @tc.number SUB_ASYNCLOCK_DIFFERENT_THIRD_TEST_0500
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsynclockDifferentThirdTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockDifferentThirdTest0500';
        console.info(`${caseName} test start`);
        let count = 0;
        let count1 = 0;
        const promises: Promise<void>[] = [];
        let task: taskpool.Task = new taskpool.Task(delay1, 1);
        const lock1 = new ArkTSUtils.locks.AsyncLock();
        task.onStartExecution(() => {
          console.info('taskpool: onStartExecution');
          const promise1 = lock1.lockAsync(async () => {
            console.log('Enter shared lock lock1');
            taskpool.execute(task).then(() => {
              count++;
              console.log('taskpool success:' + count);
            });
          }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
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
     * @tc.name   AsynclockDifferentThirdTest0600
     * @tc.number SUB_ASYNCLOCK_DIFFERENT_THIRD_TEST_0600
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsynclockDifferentThirdTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockDifferentThirdTest0600';
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
          }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
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
     * @tc.name   AsynclockDifferentThirdTest0700
     * @tc.number SUB_ASYNCLOCK_DIFFERENT_THIRD_TEST_0700
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsynclockDifferentThirdTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockDifferentThirdTest0700';
        console.info(`${caseName} test start`);
        let task: taskpool.Task = new taskpool.Task(TaskFun7, 1);
        let count = 0;
        const promises: Promise<void>[] = [];
        for (let i = 0; i < 3; i++) {
          taskpool.execute(task).then((value) => {
            console.log('taskpool result: ' + value);
            count++
          })
        }
        try {
          await Promise.all(promises);
        } catch (e) {
          console.log('Caught an error in Promise.all:', JSON.stringify(e));
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
     * @tc.name   AsynclockDifferentThirdTest0800
     * @tc.number SUB_ASYNCLOCK_DIFFERENT_THIRD_TEST_0800
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsynclockDifferentThirdTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockDifferentThirdTest0800';
        console.info(`${caseName} test start`);
        let count: number = 0;
        let WorkThread: worker.ThreadWorker;
        WorkThread = new worker.ThreadWorker('../testability/workers/Worker3');
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
     * @tc.name   AsynclockDifferentThirdTest0900
     * @tc.number SUB_ASYNCLOCK_DIFFERENT_THIRD_TEST_0900
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsynclockDifferentThirdTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockDifferentThirdTest0900';
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
          }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
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
     * @tc.name   AsynclockDifferentThirdTest1000
     * @tc.number SUB_ASYNCLOCK_DIFFERENT_THIRD_TEST_1000
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsynclockDifferentThirdTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockDifferentThirdTest1000';
        console.info(`${caseName} test start`);
        const promises: Promise<void>[] = [];
        let task: taskpool.Task = new taskpool.Task(TaskFun10, 1);
        let count = 0;
        for (let i = 0; i < 3; i++) {
          taskpool.execute(task).then((value) => {
            console.log('taskpool result: ' + value);
            count++
          })
        }
        try {
          await Promise.all(promises);
        } catch (e) {
          console.log('Caught an error in Promise.all:', JSON.stringify(e));
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
     * @tc.name   AsynclockDifferentThirdTest1100
     * @tc.number SUB_ASYNCLOCK_DIFFERENT_THIRD_TEST_1100
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsynclockDifferentThirdTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockDifferentThirdTest1100';
        console.info(`${caseName} test start`);
        const lock1 = new ArkTSUtils.locks.AsyncLock();
        const lock2 = new ArkTSUtils.locks.AsyncLock();
        const promises: Promise<void>[] = [];
        let count = 0;
        let errorCount = 0;
        for (let i = 0; i < 10; i++) {
          const promise1 = lock1.lockAsync(async () => {
            console.log('Enter EXCLUSIVE lock lock1');
            await lock2.lockAsync(async () => {
              console.log('Enter EXCLUSIVE lock lock2');
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
            console.log('Exit EXCLUSIVE lock lock2');
          }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
          console.log('Exit EXCLUSIVE lock lock1');
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
     * @tc.name   AsynclockDifferentThirdTest1200
     * @tc.number SUB_ASYNCLOCK_DIFFERENT_THIRD_TEST_1200
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsynclockDifferentThirdTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockDifferentThirdTest1200';
        console.info(`${caseName} test start`);
        const promises: Promise<void>[] = [];
        let task: taskpool.Task = new taskpool.Task(TaskFun12, 0);
        let count = 0;
        for (let i = 0; i < 3; i++) {
          taskpool.execute(task).then((value) => {
            console.log('taskpool result: ' + value);
            count++
          })
        }
        try {
          await Promise.all(promises);
        } catch (e) {
          console.log('Caught an error in Promise.all:', JSON.stringify(e));
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
     * @tc.name   AsynclockDifferentThirdTest1300
     * @tc.number SUB_ASYNCLOCK_DIFFERENT_THIRD_TEST_1300
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsynclockDifferentThirdTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockDifferentThirdTest1300';
        console.info(`${caseName} test start`);
        let count: number = 0;
        let WorkThread: worker.ThreadWorker;
        WorkThread = new worker.ThreadWorker('../testability/workers/Worker3');
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
     * @tc.name   AsynclockDifferentThirdTest1400
     * @tc.number SUB_ASYNCLOCK_DIFFERENT_THIRD_TEST_1400
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsynclockDifferentThirdTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockDifferentThirdTest1400';
        console.info(`${caseName} test start`);
        const lock1 = new ArkTSUtils.locks.AsyncLock();
        const lock2 = new ArkTSUtils.locks.AsyncLock();
        const promises: Promise<void>[] = [];
        let count = 0;
        for (let i = 0; i < 10; i++) {
          const promise1 = lock1.lockAsync(async () => {
            console.log('Enter EXCLUSIVE lock lock1');
            await lock2.lockAsync(async () => {
              console.log('Enter exclusive lock lock2');
              await new Promise<void>((resolve) => {
                setTimeout(() => {
                  count++;
                  resolve();
                }, 200);
              });
            }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
            console.log('Exit EXCLUSIVE lock lock2');
          }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
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
     * @tc.name   AsynclockDifferentThirdTest1500
     * @tc.number SUB_ASYNCLOCK_DIFFERENT_THIRD_TEST_1500
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsynclockDifferentThirdTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockDifferentThirdTest1500';
        console.info(`${caseName} test start`);
        const promises: Promise<void>[] = [];
        let task: taskpool.Task = new taskpool.Task(TaskFun15, 1);
        let count = 0;
        for (let i = 0; i < 3; i++) {
          taskpool.execute(task).then((value) => {
            console.log('taskpool result: ' + value);
            count++
          })
        }
        try {
          await Promise.all(promises);
        } catch (e) {
          console.log('Caught an error in Promise.all:', JSON.stringify(e));
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
     * @tc.name   AsynclockDifferentThirdTest1600
     * @tc.number SUB_ASYNCLOCK_DIFFERENT_THIRD_TEST_1600
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsynclockDifferentThirdTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockDifferentThirdTest1600';
        console.info(`${caseName} test start`);
        const promises: Promise<void>[] = [];
        let count = 0;
        let task: taskpool.Task = new taskpool.Task(TaskFun16, 1);
        for (let i = 0; i < 3; i++) {
          taskpool.execute(task).finally(() => {
            count++;
          })
        }

        try {
          await Promise.all(promises);
        } catch (e) {
          console.log('Caught an error in Promise.all:', JSON.stringify(e));
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
     * @tc.name   AsynclockDifferentThirdTest1700
     * @tc.number SUB_ASYNCLOCK_DIFFERENT_THIRD_TEST_1700
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsynclockDifferentThirdTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockDifferentThirdTest1700';
        console.info(`${caseName} test start`);
        const lock1 = new ArkTSUtils.locks.AsyncLock();
        const lock2 = new ArkTSUtils.locks.AsyncLock();
        const promises: Promise<void>[] = [];
        let count = 0;
        for (let i = 0; i < 10; i++) {
          const promise1 = lock1.lockAsync(async () => {
            console.log('Enter EXCLUSIVE lock lock1');
            await lock2.lockAsync(async () => {
              console.log('Enter EXCLUSIVE lock lock2');
              await new Promise<void>((_, reject) => {
                setTimeout(() => {
                  count++;
                  reject();
                }, 200);
              });
            }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
            console.log('Exit EXCLUSIVE lock lock2');
          }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
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
     * @tc.name   AsynclockDifferentThirdTest1800
     * @tc.number SUB_ASYNCLOCK_DIFFERENT_THIRD_TEST_1800
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsynclockDifferentThirdTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockDifferentThirdTest1800';
        console.info(`${caseName} test start`);
        const promises: Promise<void>[] = [];
        let task: taskpool.Task = new taskpool.Task(TaskFun18, 1);
        let count = 0;
        for (let i = 0; i < 3; i++) {
          taskpool.execute(task).then((value) => {
            console.log('taskpool result: ' + value);
            count++
          })
        }
        try {
          await Promise.all(promises);
        } catch (e) {
          console.log('Caught an error in Promise.all:', JSON.stringify(e));
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
     * @tc.name   AsynclockDifferentThirdTest1900
     * @tc.number SUB_ASYNCLOCK_DIFFERENT_THIRD_TEST_1900
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsynclockDifferentThirdTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockDifferentThirdTest1900';
        console.info(`${caseName} test start`);
        let count: number = 0;
        let WorkThread: worker.ThreadWorker;
        WorkThread = new worker.ThreadWorker('../testability/workers/Worker3');
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
     * @tc.name   AsynclockDifferentThirdTest2000
     * @tc.number SUB_ASYNCLOCK_DIFFERENT_THIRD_TEST_2000
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsynclockDifferentThirdTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockDifferentThirdTest2000';
        console.info(`${caseName} test start`);
        const lock1 = new ArkTSUtils.locks.AsyncLock();
        const lock2 = new ArkTSUtils.locks.AsyncLock();
        const promises: Promise<void>[] = [];
        let count = 0;
        let errorCount = 0;
        for (let i = 0; i < 10; i++) {
          const promise1 = lock1.lockAsync(async () => {
            console.log('Enter EXCLUSIVE lock lock1');
            await lock2.lockAsync(async () => {
              console.log('Enter SHARED lock lock2');
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
            console.log('Exit SHARED lock lock2');
          }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
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
     * @tc.name   AsynclockDifferentThirdTest2100
     * @tc.number SUB_ASYNCLOCK_DIFFERENT_THIRD_TEST_2100
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsynclockDifferentThirdTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockDifferentThirdTest2100';
        console.info(`${caseName} test start`);
        const promises: Promise<void>[] = [];
        let task: taskpool.Task = new taskpool.Task(TaskFun21, 1);
        let count = 0;
        for (let i = 0; i < 3; i++) {
          taskpool.execute(task).then((value) => {
            console.log('taskpool result: ' + value);
            count++
          })
        }
        try {
          await Promise.all(promises);
        } catch (e) {
          console.log('Caught an error in Promise.all:', JSON.stringify(e));
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
     * @tc.name   AsynclockDifferentThirdTest2200
     * @tc.number SUB_ASYNCLOCK_DIFFERENT_THIRD_TEST_2200
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsynclockDifferentThirdTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockDifferentThirdTest2200';
        console.info(`${caseName} test start`);
        const promises: Promise<void>[] = [];
        let task: taskpool.Task = new taskpool.Task(TaskFun22, 0);
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
        try {
          await Promise.all(promises);
        } catch (e) {
          console.log('Caught an error in Promise.all:', JSON.stringify(e));
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
     * @tc.name   AsynclockDifferentThirdTest2300
     * @tc.number SUB_ASYNCLOCK_DIFFERENT_THIRD_TEST_2300
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsynclockDifferentThirdTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockDifferentThirdTest2300';
        console.info(`${caseName} test start`);
        const lock1 = new ArkTSUtils.locks.AsyncLock();
        const lock2 = new ArkTSUtils.locks.AsyncLock();
        const promises: Promise<void>[] = [];
        let count = 0;
        for (let i = 0; i < 10; i++) {
          const promise1 = lock1.lockAsync(async () => {
            console.log('Enter EXCLUSIVE lock lock1');
            await lock2.lockAsync(async () => {
              console.log('Enter SHARED lock lock2');
              await new Promise<void>((resolve) => {
                setTimeout(() => {
                  count++;
                  resolve();
                }, 200);
              });
            }, ArkTSUtils.locks.AsyncLockMode.SHARED);
            console.log('Exit SHARED lock lock2');
          }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
          console.log('Exit EXCLUSIVE lock lock1');
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
     * @tc.name   AsynclockDifferentThirdTest2400
     * @tc.number SUB_ASYNCLOCK_DIFFERENT_THIRD_TEST_2400
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsynclockDifferentThirdTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockDifferentThirdTest2400';
        console.info(`${caseName} test start`);
        const promises: Promise<void>[] = [];
        let task: taskpool.Task = new taskpool.Task(TaskFun24, 1);
        let count = 0;
        for (let i = 0; i < 3; i++) {
          taskpool.execute(task).then((value) => {
            count++;
            console.log('value:' + value);
          })
        }
        try {
          await Promise.all(promises);
        } catch (e) {
          console.log('Caught an error in Promise.all:', JSON.stringify(e));
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
     * @tc.name   AsynclockDifferentThirdTest2500
     * @tc.number SUB_ASYNCLOCK_DIFFERENT_THIRD_TEST_2500
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsynclockDifferentThirdTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockDifferentThirdTest2500';
        console.info(`${caseName} test start`);
        let count: number = 0;
        let WorkThread: worker.ThreadWorker;
        WorkThread = new worker.ThreadWorker('../testability/workers/Worker3');
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
     * @tc.name   AsynclockDifferentThirdTest2600
     * @tc.number SUB_ASYNCLOCK_DIFFERENT_THIRD_TEST_2600
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsynclockDifferentThirdTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockDifferentThirdTest2600';
        console.info(`${caseName} test start`);
        const lock1 = new ArkTSUtils.locks.AsyncLock();
        const lock2 = new ArkTSUtils.locks.AsyncLock();
        const promises: Promise<void>[] = [];
        let count = 0;
        for (let i = 0; i < 10; i++) {
          const promise1 = lock1.lockAsync(async () => {
            console.log('Enter EXCLUSIVE lock lock1');
            await lock2.lockAsync(async () => {
              console.log('Enter SHARED lock lock2');
              await new Promise<void>((_, reject) => {
                setTimeout(() => {
                  count++;
                  reject();
                }, 200);
              });
            }, ArkTSUtils.locks.AsyncLockMode.SHARED);
            console.log('Exit SHARED lock lock2');
          }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
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
     * @tc.name   AsynclockDifferentThirdTest2700
     * @tc.number SUB_ASYNCLOCK_DIFFERENT_THIRD_TEST_2700
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsynclockDifferentThirdTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockDifferentThirdTest2700';
        console.info(`${caseName} test start`);
        const promises: Promise<void>[] = [];
        let task: taskpool.Task = new taskpool.Task(TaskFun27, 1);
        let count = 0;
        for (let i = 0; i < 3; i++) {
          taskpool.execute(task).then((value) => {
            count++;
            console.log('value:' + value);
          })
        }
        try {
          await Promise.all(promises);
        } catch (e) {
          console.log('Caught an error in Promise.all:', JSON.stringify(e));
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
     * @tc.name   AsynclockDifferentThirdTest2800
     * @tc.number SUB_ASYNCLOCK_DIFFERENT_THIRD_TEST_2800
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsynclockDifferentThirdTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockDifferentThirdTest2800';
        console.info(`${caseName} test start`);
        let count: number = 0;
        let WorkThread: worker.ThreadWorker;
        WorkThread = new worker.ThreadWorker('../testability/workers/Worker3');
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
     * @tc.name   AsynclockDifferentThirdTest2900
     * @tc.number SUB_ASYNCLOCK_DIFFERENT_THIRD_TEST_2900
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsynclockDifferentThirdTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockDifferentThirdTest2900';
        console.info(`${caseName} test start`);
        const promises: Promise<void>[] = [];
        let count1 = 0;
        let count = 0;
        const lock1 = new ArkTSUtils.locks.AsyncLock();
        const lock2 = new ArkTSUtils.locks.AsyncLock();
        let task: taskpool.Task = new taskpool.Task(TaskFun1, 1);
        for (let i = 0; i < 10; i++) {
          const promise1 = lock1.lockAsync(async () => {
            console.log('Enter EXCLUSIVE lock lock1');
            await lock2.lockAsync(() => {
              count++;
              console.log('Enter exclusive lock lock2');
              taskpool.execute(task).then(() => {
                count1++;
                console.log('taskpool success');
              })
            }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
            console.log('Exit exclusive lock lock2');
          }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
          console.log('Exit EXCLUSIVE lock lock1');
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
     * @tc.name   AsynclockDifferentThirdTest3000
     * @tc.number SUB_ASYNCLOCK_DIFFERENT_THIRD_TEST_3000
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsynclockDifferentThirdTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockDifferentThirdTest3000';
        console.info(`${caseName} test start`);
        const promises: Promise<void>[] = [];
        let count1 = 0;
        for (let i = 0; i < 3; i++) {
          taskpool.execute(TaskTest).then(() => {
            count1++;
            console.info(`testTask executed successfully`);
          }).catch((error: Error) => {
            console.error(`testTask execution failed: ${error}`);
          });
        }
        try {
          await Promise.all(promises);
        } catch (e) {
          console.log('Caught an error in Promise.all:', JSON.stringify(e));
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
     * @tc.name   AsynclockDifferentThirdTest3100
     * @tc.number SUB_ASYNCLOCK_DIFFERENT_THIRD_TEST_3100
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsynclockDifferentThirdTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockDifferentThirdTest3100';
        console.info(`${caseName} test start`);
        let count: number = 0;
        let WorkThread: worker.ThreadWorker;
        WorkThread = new worker.ThreadWorker('../testability/workers/Worker3');
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
     * @tc.name   AsynclockDifferentThirdTest3200
     * @tc.number SUB_ASYNCLOCK_DIFFERENT_THIRD_TEST_3200
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsynclockDifferentThirdTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockDifferentThirdTest3200';
        console.info(`${caseName} test start`);
        const promises: Promise<void>[] = [];
        let count1 = 0;
        let count = 0;
        const lock1 = new ArkTSUtils.locks.AsyncLock();
        const lock2 = new ArkTSUtils.locks.AsyncLock();
        let task: taskpool.Task = new taskpool.Task(TaskFun1, 1);
        for (let i = 0; i < 10; i++) {
          const promise1 = lock1.lockAsync(async () => {
            console.log('Enter EXCLUSIVE lock lock1');
            await lock2.lockAsync(() => {
              count++;
              console.log('Enter SHARED lock lock2');
              taskpool.execute(task).then(() => {
                count1++;
                console.log('taskpool success');
              })
            }, ArkTSUtils.locks.AsyncLockMode.SHARED);
            console.log('Exit SHARED lock lock2');
          }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
          console.log('Exit EXCLUSIVE lock lock1');
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
     * @tc.name   AsynclockDifferentThirdTest3300
     * @tc.number SUB_ASYNCLOCK_DIFFERENT_THIRD_TEST_3300
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsynclockDifferentThirdTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockDifferentThirdTest3300';
        console.info(`${caseName} test start`);
        const promises: Promise<void>[] = [];
        let count1 = 0;
        for (let i = 0; i < 3; i++) {
          taskpool.execute(TaskTest1).then(() => {
            count1++;
            console.info(`testTask executed successfully`);
          }).catch((error: Error) => {
            console.error(`testTask execution failed: ${error}`);
          });
        }
        try {
          await Promise.all(promises);
        } catch (e) {
          console.log('Caught an error in Promise.all:', JSON.stringify(e));
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
     * @tc.name   AsynclockDifferentThirdTest3400
     * @tc.number SUB_ASYNCLOCK_DIFFERENT_THIRD_TEST_3400
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsynclockDifferentThirdTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockDifferentThirdTest3400';
        console.info(`${caseName} test start`);
        const promises: Promise<void>[] = [];
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

        try {
          await Promise.all(promises);
        } catch (e) {
          console.log('Caught an error in Promise.all:', JSON.stringify(e));
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
     * @tc.name   AsynclockDifferentThirdTest3500
     * @tc.number SUB_ASYNCLOCK_DIFFERENT_THIRD_TEST_3500
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsynclockDifferentThirdTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockDifferentThirdTest3500';
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
            console.log('Enter EXCLUSIVE lock lock1');
            await lock2.lockAsync(async () => {
              console.log('Enter EXCLUSIVE lock lock2');
              await lock3.lockAsync(() => {
                console.log('Enter EXCLUSIVE lock lock3');
                count++;
                console.log('Enter exclusive lock lock2');
                taskpool.execute(task).then(() => {
                  count1++;
                  console.log('taskpool success');
                })
              }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
              console.log('Exit EXCLUSIVE lock lock3');
            }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
            console.log('Exit EXCLUSIVE lock lock2');
          }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
          console.log('Exit EXCLUSIVE lock lock1');
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
     * @tc.name   AsynclockDifferentThirdTest3600
     * @tc.number SUB_ASYNCLOCK_DIFFERENT_THIRD_TEST_3600
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsynclockDifferentThirdTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockDifferentThirdTest3600';
        console.info(`${caseName} test start`);
        const promises: Promise<void>[] = [];
        let count1 = 0;
        for (let i = 0; i < 3; i++) {
          taskpool.execute(TaskTest2).then(() => {
            count1++;
            console.info(`testTask executed successfully`);
          }).catch((error: Error) => {
            console.error(`testTask execution failed: ${error}`);
          });
        }
        try {
          await Promise.all(promises);
        } catch (e) {
          console.log('Caught an error in Promise.all:', JSON.stringify(e));
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
     * @tc.name   AsynclockDifferentThirdTest3700
     * @tc.number SUB_ASYNCLOCK_DIFFERENT_THIRD_TEST_3700
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsynclockDifferentThirdTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockDifferentThirdTest3700';
        console.info(`${caseName} test start`);
        let count: number = 0;
        let WorkThread: worker.ThreadWorker;
        WorkThread = new worker.ThreadWorker('../testability/workers/Worker3');
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