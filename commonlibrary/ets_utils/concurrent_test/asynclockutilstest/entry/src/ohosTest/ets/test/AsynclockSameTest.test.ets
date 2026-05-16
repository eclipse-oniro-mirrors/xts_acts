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
  printArgs1,
  taskFunctionTest0200,
  taskFunctionTest0400,
  taskFunctionTest0600,
  taskFunctionTest0900,
  taskFunctionTest1200,
  taskFunctionTest1500,
  taskFunctionTest1800,
  taskFunctionTest2100,
  taskFunctionTest2400,
  test,
  taskFunctionTest2700,
  taskFunctionTest3000,
  taskFunctionTest3300,
  taskFunctionTest3600,
  taskFunctionTest3900,
  taskFunctionTest4200,
  taskFunctionTest4500,
  taskFunctionTest4700,
  taskFunctionTest4900,
} from '../testability/pages/TaskpoolUtilsAsynclockSameUtils';
export default function AsynclockSameTest() {
  describe('AsynclockSameTest', () => {
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
     * @tc.name   AsynclockSameTest0100
     * @tc.number SUB_ASYNCLOCK_SAME_TEST_0100
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsynclockSameTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done:Function) => {
        const caseName = 'AsynclockSameTest0100';
        console.info(`${caseName} test start`);
        let lock1 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request('lock_1');
        const promises: Promise<void>[] = [];
        let count = 0;
        for (let i = 0; i < 10; i++) {
          const promise  = lock1.lockAsync(async () => {
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
        while(count != 10){
          await sleep(300);
        }
        expect(count).assertEqual(10);
        console.info(`${caseName} test end`)
        Done();
      });


    /**
     * @tc.name   AsynclockSameTest0200
     * @tc.number SUB_ASYNCLOCK_SAME_TEST_0200
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsynclockSameTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockSameTest0200';
        console.info(`${caseName} test start`);
        let task: taskpool.Task = new taskpool.Task(taskFunctionTest0200);
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
     * @tc.name   AsynclockSameTest0300
     * @tc.number SUB_ASYNCLOCK_SAME_TEST_0300
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsynclockSameTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockSameTest0300';
        console.info(`${caseName} test start`);
        let lock1 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request('lock_1');
        const promises: Promise<void>[] = [];
        let count = 0;
        for (let i = 0; i < 10; i++) {
          const promise1 = lock1.lockAsync(async () => {
            await new Promise<void>((resolve) => {
              setTimeout(() => {
                resolve();
                count++;
              }, 200);
            });
          }, ArkTSUtils.locks.AsyncLockMode.SHARED);
          promises.push(promise1);
        }
        while(count != 10){
          await sleep(300);
        }
        await Promise.all(promises);
        expect(count).assertEqual(10);
        console.info(`${caseName} test end`);
        Done();
      });

    /**
     * @tc.name   AsynclockSameTest0400
     * @tc.number SUB_ASYNCLOCK_SAME_TEST_0400
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsynclockSameTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockSameTest0400';
        console.info(`${caseName} test start`);
        let task: taskpool.Task = new taskpool.Task(taskFunctionTest0400);
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
     * @tc.name   AsynclockSameTest0500
     * @tc.number SUB_ASYNCLOCK_SAME_TEST_0500
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsynclockSameTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockSameTest0500';
        console.info(`${caseName} test start`);
        let lock1 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request('lock_1');
        let count = 0;
        const promises: Promise<void>[] = [];
        for (let i = 0; i < 10; i++) {
          const promise1 = lock1.lockAsync(async () => {
            console.log('Enter shared lock lock1');
            await new Promise<void>((_, reject) => {
              setTimeout(() => {
                reject();
                count++;
              }, 200);
            });
          }, ArkTSUtils.locks.AsyncLockMode.SHARED);
          console.log('Exit shared lock lock1');
          promises.push(promise1);
        }
        await Promise.all(promises);
        while(count != 10){
          await sleep(300);
        }
        console.log('Success execution count:' + count);
        expect(count).assertEqual(10);
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.name   AsynclockSameTest0600
     * @tc.number SUB_ASYNCLOCK_SAME_TEST_0600
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsynclockSameTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockSameTest0600';
        console.info(`${caseName} test start`);
        let task: taskpool.Task = new taskpool.Task(taskFunctionTest0600);
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
     * @tc.name   AsynclockSameTest0700
     * @tc.number SUB_ASYNCLOCK_SAME_TEST_0700
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsynclockSameTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockSameTest0700';
        console.info(`${caseName} test start`);
        let count: number = 0;
        let WorkThread: worker.ThreadWorker;
        WorkThread = new worker.ThreadWorker('../testability/workers/Worker');
        WorkThread.onexit = () => {
          console.log('onexit');
        }
        WorkThread.postMessage(caseName);
        WorkThread.onmessage = (e: MessageEvents): void => {
          count = e.data;
          console.log('e:' + JSON.stringify(e));
          console.info('main2 thread count is  ' + count);
          WorkThread.terminate();
        }
        await sleep(300);
        console.log('Success execution count:' + count);
        while(count != 10){
          await sleep(300);
        }
        expect(count).assertEqual(10);
        console.info(`${caseName} test end`);
        Done();
      });

    /**
     * @tc.name   AsynclockSameTest0800
     * @tc.number SUB_ASYNCLOCK_SAME_TEST_0800
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsynclockSameTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockSameTest0800';
        console.info(`${caseName} test start`);
        let lock1 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request('lock_1');
        const promises: Promise<void>[] = [];
        let count = 0;
        let errorCount = 0;
        for (let i = 0; i < 10; i++) {
          const promise1  = lock1.lockAsync(async () => {
            await new Promise<void>((resolve, reject) => {
              setTimeout(() => {
                try {
                  count++;
                  throw new Error('Simulated asynchronous operation error');
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
        while(count != 10){
          await sleep(300);
        }
        while(errorCount != 10){
          await sleep(300);
        }
        expect(count).assertEqual(10);
        expect(errorCount).assertEqual(10);
        console.info(`${caseName} test end`);
        Done();
      });
    /**
     * @tc.name   AsynclockSameTest0900
     * @tc.number SUB_ASYNCLOCK_SAME_TEST_0900
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsynclockSameTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockSameTest0900';
        console.info(`${caseName} test start`);
        let task: taskpool.Task = new taskpool.Task(taskFunctionTest0900);
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
     * @tc.name   AsynclockSameTest1000
     * @tc.number SUB_ASYNCLOCK_SAME_TEST_1000
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsynclockSameTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockSameTest1000';
        console.info(`${caseName} test start`);
        let lock1 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request('lock_1');
        const promises: Promise<void>[] = [];
        let task: taskpool.Task = new taskpool.Task(printArgs1, 1);
        let count = 0;
        let errorCount = 0;
        let executionSucceededCount = 0;
        task.onExecutionSucceeded(()=>{
          const promise1  = lock1.lockAsync(async () => {
            console.log('Enter shared lock lock1');
             new Promise<void>((_, reject) => {
                try {
                  executionSucceededCount++;
                  const error = new Error('Simulated asynchronous operation error');
                  console.error('Caught an exception:', error.message);
                  throw error;
                } catch (e) {
                  errorCount++;
                  reject(e);
                }
            });
          }, ArkTSUtils.locks.AsyncLockMode.SHARED);
          console.log('Exit shared lock lock1');
          promises.push(promise1);
        });
        await taskpool.execute(task).then(async () => {
          console.info('taskpool: onExecute')
          count++;
        })
        try {
          await Promise.all(promises);
        } catch (e) {
          console.log('Caught an error in Promise.all:', JSON.stringify(e));
        }
        while(count != 1){
          await sleep(300);
        }
        while(executionSucceededCount != 1){
          await sleep(300);
        }
        while(errorCount != 1){
          await sleep(300);
        }
        console.log('Success execution count:' + count);
        expect(count).assertEqual(1);
        expect(executionSucceededCount).assertEqual(1);
        expect(errorCount).assertEqual(1);
        console.info(`${caseName} test end`);
        Done();
      });

    /**
     * @tc.name   AsynclockSameTest1100
     * @tc.number SUB_ASYNCLOCK_SAME_TEST_1100
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsynclockSameTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockSameTest1100';
        console.info(`${caseName} test start`);
        let lock1 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request('lock_1');
        let lock2 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request('lock_1');
        const promises: Promise<void>[] = [];
        let count = 0;
        let errorCount = 0;
        for (let i = 0; i < 10; i++) {
          const promise1 = lock1.lockAsync(async () => {
            console.log('Enter shared lock lock1');
            await lock2.lockAsync(async () => {
              console.log('Enter shared lock lock2');
              await new Promise<void>((resolve, reject) => {
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
            console.log('Exit shared lock lock2');
          }, ArkTSUtils.locks.AsyncLockMode.SHARED);
          console.log('Exit shared lock lock1');
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
        expect(errorCount).assertEqual(10);
        Done();
      });

    /**
     * @tc.name   AsynclockSameTest1200
     * @tc.number SUB_ASYNCLOCK_SAME_TEST_1200
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsynclockSameTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockSameTest1200';
        console.info(`${caseName} test start`);
        let task: taskpool.Task = new taskpool.Task(taskFunctionTest1200, 1);
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
     * @tc.name   AsynclockSameTest1300
     * @tc.number SUB_ASYNCLOCK_SAME_TEST_1300
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsynclockSameTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockSameTest1300';
        console.info(`${caseName} test start`);
        let count: number = 0;
        let WorkThread: worker.ThreadWorker;
        WorkThread = new worker.ThreadWorker('../testability/workers/Worker');
        WorkThread.onexit = () => {
          console.log('onexit');
        }
        WorkThread.postMessage(caseName);
        WorkThread.onmessage = (e: MessageEvents): void => {
          count = e.data;
          console.log('e:' + JSON.stringify(e));
          console.info('main2 thread count is  ' + count);
          WorkThread.terminate();
        }
        while(count != 1){
          await sleep(300);
        }
        console.log('Success execution count:' + count);
        expect(count).assertEqual(1);
        console.info(`${caseName} test end`);
        Done();
      });

    /**
     * @tc.name   AsynclockSameTest1400
     * @tc.number SUB_ASYNCLOCK_SAME_TEST_1400
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsynclockSameTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockSameTest1400';
        console.info(`${caseName} test start`);
        let lock1 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request('lock_1');
        let lock2 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request('lock_1');
        const promises: Promise<void>[] = [];
        let count = 0;
        for (let i = 0; i < 10; i++) {
          const promise1  = lock1.lockAsync(async () => {
            console.log('Enter shared lock lock1');
            await lock2.lockAsync(async () => {
              console.log('Enter shared lock lock2');
              await new Promise<void>((resolve, reject) => {
                setTimeout(() => {
                  count++;
                  resolve();
                }, 200);
              });
            }, ArkTSUtils.locks.AsyncLockMode.SHARED);
          }, ArkTSUtils.locks.AsyncLockMode.SHARED);
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
        console.log('Success execution count:' + count);
        expect(count).assertEqual(10);
        console.info(`${caseName} test end`);
        Done();
      });

    /**
     * @tc.name   AsynclockSameTest1500
     * @tc.number SUB_ASYNCLOCK_SAME_TEST_1500
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsynclockSameTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockSameTest1500';
        console.info(`${caseName} test start`);
        let task: taskpool.Task = new taskpool.Task(taskFunctionTest1500);
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
     * @tc.name   AsynclockSameTest1600
     * @tc.number SUB_ASYNCLOCK_SAME_TEST_1600
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsynclockSameTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockSameTest1600';
        console.info(`${caseName} test start`);
        let lock1 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request('lock_1');
        let lock2 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request('lock_1');
        const promises: Promise<void>[] = [];
        let task: taskpool.Task = new taskpool.Task(printArgs1, 1);
        let count = 0;
        let onEnqueuedcount = 0;
        task.onEnqueued(()=>{
          const promise1 : Promise<void> = lock1.lockAsync(async () => {
            console.log('Enter shared lock lock1');
            await lock2.lockAsync(async () => {
              console.log('Enter exclusive lock lock2');
              await new Promise<void>((resolve, reject) => {
                setTimeout(() => {
                  onEnqueuedcount++;
                  resolve();
                }, 200);
              });
            }, ArkTSUtils.locks.AsyncLockMode.SHARED);
            console.log('Exit exclusive lock lock2');
          }, ArkTSUtils.locks.AsyncLockMode.SHARED);
          console.log('Exit shared lock lock1');
          promises.push(promise1);
        });
        await taskpool.execute(task).then(async () => {
          console.log('onExecute');
          count++;
        })
        try {
          await Promise.all(promises);
        } catch (e) {
          console.log('Caught an error in Promise.all:', JSON.stringify(e));
        }
        while(count != 1){
          await sleep(300);
        }
        console.log('Success execution count:' + count);
        expect(count).assertEqual(1);
        expect(onEnqueuedcount).assertEqual(1);
        console.info(`${caseName} test end`);
        Done();
      });

    /**
     * @tc.name   AsynclockSameTest1700
     * @tc.number SUB_ASYNCLOCK_SAME_TEST_1700
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsynclockSameTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockSameTest1700';
        console.info(`${caseName} test start`);
        let lock1 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request('lock_1');
        let lock2 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request('lock_1');
        const promises: Promise<void>[] = [];
        let count = 0;
        for (let i = 0; i < 10; i++) {
          const promise1 : Promise<void> = lock1.lockAsync(async () => {
            console.log('Enter shared lock lock1');
            await lock2.lockAsync(async () => {
              console.log('Enter shared lock lock2');
              await new Promise<void>((resolve, reject) => {
                setTimeout(() => {
                  count++;
                  reject();
                }, 200);
              });
            }, ArkTSUtils.locks.AsyncLockMode.SHARED);
          }, ArkTSUtils.locks.AsyncLockMode.SHARED);
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
        console.log('Success execution count:' + count);
        expect(count).assertEqual(10);
        console.info(`${caseName} test end`);
        Done();
      });

    /**
     * @tc.name   AsynclockSameTest1800
     * @tc.number SUB_ASYNCLOCK_SAME_TEST_1800
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsynclockSameTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockSameTest1800';
        console.info(`${caseName} test start`);
        let task: taskpool.Task = new taskpool.Task(taskFunctionTest1800);
        let count = 0;
        for (let i = 0; i < 3; i++) {
          taskpool.execute(task).then((result) => {
            console.log('Success execution count:' + result);
            count++;
          })
        }
        console.log(`${count}`)
        while(count != 3){
          await sleep(300);
        }
        expect(count).assertEqual(3);
        console.info(`${caseName} test end`);
        Done();
      });

    /**
     * @tc.name   AsynclockSameTest1900
     * @tc.number SUB_ASYNCLOCK_SAME_TEST_1900
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsynclockSameTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockSameTest1900';
        console.info(`${caseName} test start`);
        let count: number = 0;
        let WorkThread: worker.ThreadWorker;
        WorkThread = new worker.ThreadWorker('../testability/workers/Worker');
        WorkThread.onexit = () => {
          console.log('onexit');
        }
        WorkThread.postMessage(caseName);
        WorkThread.onmessage = (e: MessageEvents): void => {
          count = e.data;
          console.log('e:' + JSON.stringify(e));
          console.info('main2 thread count is  ' + count);
          WorkThread.terminate();
        }
        await sleep(300);
        console.log('Success execution count:' + count);
        while(count != 1){
          await sleep(300);
        }
        expect(count).assertEqual(1);
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.name   AsynclockSameTest2000
     * @tc.number SUB_ASYNCLOCK_SAME_TEST_2000
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsynclockSameTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockSameTest2000';
        console.info(`${caseName} test start`);
        let lock1 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request('lock_1');
        let lock2 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request('lock_1');
        const promises: Promise<void>[] = [];
        let count = 0;
        let errorCount = 0;
        for (let i = 0; i < 10; i++) {
          const promise1 : Promise<void> = lock1.lockAsync(async () => {
            console.log('Enter shared lock lock1');
            lock2.lockAsync(async () => {
              console.log('Enter exclusive lock lock2');
              try {
                count++;
                const error = new Error('Simulated asynchronous operation error');
                console.error('Caught an exception:', error.message);
                throw error;
              } catch (e) {
                errorCount++;
              }
            }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
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
        expect(count).assertEqual(10);
        expect(errorCount).assertEqual(10);
        console.info(`${caseName} test end`);
        Done();
      });

    /**
     * @tc.name   AsynclockSameTest2100
     * @tc.number SUB_ASYNCLOCK_SAME_TEST_2100
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsynclockSameTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockSameTest2100';
        console.info(`${caseName} test start`);
        let task: taskpool.Task = new taskpool.Task(taskFunctionTest2100);
        let count = 0;
        for (let i = 0; i < 3; i++) {
          taskpool.execute(task).then((result) => {
            console.log('Success execution count:' + result);
            count++;
          })
        }
        while(count != 3){
          await sleep(300);
        }
        expect(count).assertEqual(3);
        console.info(`${caseName} test end`);
        Done();
      });

    /**
     * @tc.name   AsynclockSameTest2200
     * @tc.number SUB_ASYNCLOCK_SAME_TEST_2200
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsynclockSameTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockSameTest2200';
        console.info(`${caseName} test start`);
        let lock1 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request('lock_1');
        let lock2 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request('lock_1');
        const promises: Promise<void>[] = [];
        let task: taskpool.Task = new taskpool.Task(printArgs1, 1);
        let count = 0;
        let onStartExecutioncount = 0;
        task.onStartExecution(()=>{
          const promise1 : Promise<void> = lock1.lockAsync(async () => {
             lock2.lockAsync(async () => {
              try {
                const error = new Error('Simulated asynchronous operation error');
                console.error('Caught an exception:', error.message);
                throw error;
              } catch (e) {
                onStartExecutioncount++;
              }
            }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
          }, ArkTSUtils.locks.AsyncLockMode.SHARED);
          promises.push(promise1);
        });
        await taskpool.execute(task).then(async () => {
          console.log('onExecute');
          count++;
        })
        try {
          await Promise.all(promises);
        } catch (e) {
          console.log('Caught an error in Promise.all:', JSON.stringify(e));
        }
        while (count != 1) {
          await sleep(300);
        }
        while (onStartExecutioncount != 1) {
          await sleep(300);
        }
        expect(count).assertEqual(1);
        expect(onStartExecutioncount).assertEqual(1);
        console.info(`${caseName} test end`);
        Done();
      });

    /**
     * @tc.name   AsynclockSameTest2300
     * @tc.number SUB_ASYNCLOCK_SAME_TEST_2300
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsynclockSameTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockSameTest2300';
        console.info(`${caseName} test start`);
        let lock1 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request('lock_1');
        let lock2 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request('lock_1');
        const promises: Promise<void>[] = [];
        let count = 0;
        for (let i = 0; i < 10; i++) {
          const promise1 : Promise<void> = lock1.lockAsync(async () => {
            lock2.lockAsync(async () => {
               new Promise<void>((resolve, reject) => {
                count++;
                resolve();
              });
            }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
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
        expect(count).assertEqual(10);
        console.info(`${caseName} test end`);
        Done();
      });

    /**
     * @tc.name   AsynclockSameTest2400
     * @tc.number SUB_ASYNCLOCK_SAME_TEST_2400
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsynclockSameTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockSameTest2400';
        console.info(`${caseName} test start`);
        let task: taskpool.Task = new taskpool.Task(taskFunctionTest2400);
        let count = 0;
        for (let i = 0; i < 3; i++) {
          taskpool.execute(task).then((result) => {
            console.log('Success execution count:' + result);
            count++;
          })
        }
        while(count != 3){
          await sleep(300);
        }
        expect(count).assertEqual(3);
        console.info(`${caseName} test end`);
        Done();
      });

    /**
     * @tc.name   AsynclockSameTest2500
     * @tc.number SUB_ASYNCLOCK_SAME_TEST_2500
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsynclockSameTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockSameTest2500';
        console.info(`${caseName} test start`);
        let lock1 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request('lock_1');
        let lock2 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request('lock_1');
        const promises: Promise<void>[] = [];
        let task: taskpool.Task = new taskpool.Task(test, 1);
        let count = 0;
        let onExecutionFailedcount = 0;
        task.onExecutionFailed(()=>{
          const promise1 : Promise<void> = lock1.lockAsync(async () => {
            lock2.lockAsync(async () => {
              new Promise<void>((resolve, reject) => {
                count++;
                resolve();
              });
            }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
          }, ArkTSUtils.locks.AsyncLockMode.SHARED);
          promises.push(promise1);
        });
        await taskpool.execute(task).then(async()=>{
        }).catch(()=>{
          onExecutionFailedcount++;
        })
        try {
          await Promise.all(promises);
        } catch (e) {
          console.log('Caught an error in Promise.all:', JSON.stringify(e));
        }
        await sleep(300);
        expect(count).assertEqual(1);
        expect(onExecutionFailedcount).assertEqual(1);
        console.info(`${caseName} test end`);
        Done();
      });

    /**
     * @tc.name   AsynclockSameTest2600
     * @tc.number SUB_ASYNCLOCK_SAME_TEST_2600
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsynclockSameTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockSameTest2600';
        console.info(`${caseName} test start`);
        let lock1 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request('lock_1');
        let lock2 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request('lock_1');
        const promises: Promise<void>[] = [];
        let count = 0;
        for (let i = 0; i < 10; i++) {
          const promise1 : Promise<void> = lock1.lockAsync(async () => {
            lock2.lockAsync(async () => {
              new Promise<void>((resolve, reject) => {
                count++;
                reject();
              });
            }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
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
        expect(count).assertEqual(10);
        console.info(`${caseName} test end`);
        Done();
      });

    /**
     * @tc.name   AsynclockSameTest2700
     * @tc.number SUB_ASYNCLOCK_SAME_TEST_2700
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsynclockSameTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockSameTest2700';
        console.info(`${caseName} test start`);
        let task: taskpool.Task = new taskpool.Task(taskFunctionTest2700);
        let count = 0;
        for (let i = 0; i < 3; i++) {
          taskpool.execute(task).then((result) => {
            console.log('Success execution count:' + result);
            count++;
          })
        }
        while(count != 3){
          await sleep(300);
        }
        expect(count).assertEqual(3);
        console.info(`${caseName} test end`);
        Done();
      });

    /**
     * @tc.name   AsynclockSameTest2800
     * @tc.number SUB_ASYNCLOCK_SAME_TEST_2800
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsynclockSameTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockSameTest2800';
        console.info(`${caseName} test start`);
        let count: number = 0;
        let WorkThread: worker.ThreadWorker;
        WorkThread = new worker.ThreadWorker('../testability/workers/Worker');
        WorkThread.onexit = () => {
          console.log('onexit');
        }
        WorkThread.postMessage(caseName);
        WorkThread.onmessage = (e: MessageEvents): void => {
          count = e.data;
          console.log('e:' + JSON.stringify(e));
          WorkThread.terminate();
          console.info(`${caseName} test end`);
        }
        while (count != 1) {
          await sleep(300);
        }
        expect(count).assertEqual(1);
        Done();
      });

    /**
     * @tc.name   AsynclockSameTest2900
     * @tc.number SUB_ASYNCLOCK_SAME_TEST_2900
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsynclockSameTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockSameTest2900';
        console.info(`${caseName} test start`);
        let lock1 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request('lock_1');
        let lock2 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request('lock_1');
        const promises: Promise<void>[] = [];
        let count = 0;
        for (let i = 0; i < 10; i++) {
          const promise1 : Promise<void> = lock1.lockAsync(async () => {
            lock2.lockAsync(async () => {
              let task: taskpool.Task = new taskpool.Task(printArgs1, 1);
              await taskpool.execute(task).then((result) => {
                count++;
              })
            }, ArkTSUtils.locks.AsyncLockMode.SHARED);
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
     * @tc.name   AsynclockSameTest3000
     * @tc.number SUB_ASYNCLOCK_SAME_TEST_3000
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsynclockSameTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockSameTest3000';
        console.info(`${caseName} test start`);
        let task: taskpool.Task = new taskpool.Task(taskFunctionTest3000);
        let count = 0;
        for (let i = 0; i < 3; i++) {
          taskpool.execute(task).then((result) => {
            console.log('Success execution count:' + result);
            count++;
          })
        }
        while(count != 3){
          await sleep(300);
        }
        expect(count).assertEqual(3);
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.name   AsynclockSameTest3100
     * @tc.number SUB_ASYNCLOCK_SAME_TEST_3100
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsynclockSameTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockSameTest3100';
        console.info(`${caseName} test start`);
        let count: number = 0;
        let WorkThread: worker.ThreadWorker;
        WorkThread = new worker.ThreadWorker('../testability/workers/Worker');
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
     * @tc.name   AsynclockSameTest3200
     * @tc.number SUB_ASYNCLOCK_SAME_TEST_3200
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsynclockSameTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockSameTest3200';
        console.info(`${caseName} test start`);
        let lock1 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request('lock_1');
        let lock2 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request('lock_1');
        const promises: Promise<void>[] = [];
        let count = 0;
        for (let i = 0; i < 10; i++) {
          const promise1 : Promise<void> = lock1.lockAsync(async () => {
            console.log('Enter shared lock lock1');
            lock2.lockAsync(async () => {
              console.log('Enter exclusive lock lock2');
              let task: taskpool.Task = new taskpool.Task(printArgs1, 1);
              await taskpool.execute(task).then((result) => {
                count++;
              })
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
     * @tc.name   AsynclockSameTest3300
     * @tc.number SUB_ASYNCLOCK_SAME_TEST_3300
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsynclockSameTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockSameTest3300';
        console.info(`${caseName} test start`);
        let task: taskpool.Task = new taskpool.Task(taskFunctionTest3300);
        let count = 0;
        for (let i = 0; i < 3; i++) {
          taskpool.execute(task).then((result) => {
            console.log('Success execution count:' + result);
            count++;
          })
        }
        while(count != 3){
          await sleep(300);
        }
        expect(count).assertEqual(3);
        console.info(`${caseName} test end`);
        Done();
      });

    /**
     * @tc.name   AsynclockSameTest3400
     * @tc.number SUB_ASYNCLOCK_SAME_TEST_3400
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsynclockSameTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        let lock1 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request('lock_1');
        let lock2 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request('lock_1');
        let count = 0;
        const promises: Promise<void>[] = [];
        let task: taskpool.Task = new taskpool.Task(printArgs1,1);
        await taskpool.execute(task).finally(async () => {
          const promise1 : Promise<void> = lock1.lockAsync(async () => {
            console.log('Enter shared lock lock1');
            lock2.lockAsync(async () => {
              console.log('Enter exclusive lock lock2');
              let task: taskpool.Task = new taskpool.Task(printArgs1, 1);
              await taskpool.execute(task).then((result) => {
                count++;
              })
            }, ArkTSUtils.locks.AsyncLockMode.SHARED);
            console.log('Exit exclusive lock lock2');
          }, ArkTSUtils.locks.AsyncLockMode.SHARED);
          console.log('Exit shared lock lock1');
          promises.push(promise1);
          try {
            await Promise.all(promises);
          } catch (e) {
            console.log('Caught an error in Promise.all:', JSON.stringify(e));
          }
          await sleep(300);
          console.log('Success execution count:' + count);
          expect(count).assertEqual(1);
          Done();
        })
      });

    /**
     * @tc.name   AsynclockSameTest3500
     * @tc.number SUB_ASYNCLOCK_SAME_TEST_3500
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsynclockSameTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockSameTest3500';
        console.info(`${caseName} test start`);
        let lock1 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request('lock_1');
        let lock2 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request('lock_1');
        const promises: Promise<void>[] = [];
        let count = 0;
        let returnCount = 0
        for (let i = 0; i < 10; i++) {
          const promise1 : Promise<void> = lock1.lockAsync(async () => {
            lock2.lockAsync(async () => {
              let WorkThread: worker.ThreadWorker;
              WorkThread = new worker.ThreadWorker('../testability/workers/Worker');
              WorkThread.onexit = () => {
                console.log('onexit');
              }
              WorkThread.postMessage(caseName);
              WorkThread.onmessage = (e: MessageEvents): void => {
                returnCount = e.data;
                count++;
                console.log('e:' + JSON.stringify(e));
                WorkThread.terminate();
                console.info(`${caseName} test end`);
              }
            }, ArkTSUtils.locks.AsyncLockMode.SHARED);
          }, ArkTSUtils.locks.AsyncLockMode.SHARED);
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
        console.log('Success execution count:' + count);
        expect(count).assertEqual(10);
        expect(returnCount).assertEqual(42);
        console.info(`${caseName} test end`);
        Done();
      });

    /**
     * @tc.name   AsynclockSameTest3600
     * @tc.number SUB_ASYNCLOCK_SAME_TEST_3600
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsynclockSameTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockSameTest3600';
        console.info(`${caseName} test start`);
        let task: taskpool.Task = new taskpool.Task(taskFunctionTest3600);
        let count = 0;
        for (let i = 0; i < 3; i++) {
          taskpool.execute(task).then((result) => {
            console.log('Success execution count:' + result);
            count++;
          })
        }
        console.log(`${count}`)
        while(count != 3){
          await sleep(300);
        }
        expect(count).assertEqual(3);
        console.info(`${caseName} test end`);
        Done();
      });

    /**
     * @tc.name   AsynclockSameTest3700
     * @tc.number SUB_ASYNCLOCK_SAME_TEST_3700
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsynclockSameTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockSameTest3700';
        console.info(`${caseName} test start`);
        let lock1 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request('lock_1');
        let lock2 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request('lock_1');
        const promises: Promise<void>[] = [];
        let count: number = 0;
        let WorkThread: worker.ThreadWorker;
        WorkThread = new worker.ThreadWorker('../testability/workers/Worker');
        WorkThread.onexit = () => {
          console.log('onexit');
        }
        WorkThread.postMessage(caseName);
        WorkThread.onmessage = (e: MessageEvents): void => {

          const promise1 : Promise<void> = lock1.lockAsync(async () => {
            lock2.lockAsync(async () => {
              let WorkThread: worker.ThreadWorker;
              WorkThread = new worker.ThreadWorker('../testability/workers/Worker');
              WorkThread.onexit = () => {
                console.log('onexit');
              }
              WorkThread.postMessage(caseName);
              WorkThread.onmessage = (e: MessageEvents): void => {
                count = e.data ;
                console.log('e:' + JSON.stringify(e));
                WorkThread.terminate();
                console.info(`${caseName} test end`);
              }
            }, ArkTSUtils.locks.AsyncLockMode.SHARED);
          }, ArkTSUtils.locks.AsyncLockMode.SHARED);
          promises.push(promise1);

        }
        try {
          await Promise.all(promises);
        } catch (e) {
          console.log('Caught an error in Promise.all:', JSON.stringify(e));
        }
        while (count != 42) {
          await sleep(300);
        }
        expect(count).assertEqual(42);
        Done();
      });

    /**
     * @tc.name   AsynclockSameTest3800
     * @tc.number SUB_ASYNCLOCK_SAME_TEST_3800
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsynclockSameTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockSameTest3800';
        console.info(`${caseName} test start`);
        let lock1 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request('lock_1');
        let lock2 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request('lock_1');
        const promises: Promise<void>[] = [];
        let count = 0;
        let returnCount = 0
        for (let i = 0; i < 10; i++) {
          const promise1 : Promise<void> = lock1.lockAsync(async () => {
            console.log('Enter shared lock lock1');
            lock2.lockAsync(async () => {

              console.log('Enter exclusive lock lock2');
              console.log('Enter worker');
              let WorkThread: worker.ThreadWorker;
              WorkThread = new worker.ThreadWorker('../testability/workers/Worker');
              WorkThread.onexit = () => {
                console.log('onexit');
              }
              WorkThread.postMessage(caseName);
              WorkThread.onmessage = (e: MessageEvents): void => {
                returnCount = e.data;
                count++;
                console.log('e:' + JSON.stringify(e));
                console.info('main2 thread count is  ' + count);
                WorkThread.terminate();
                console.log('Success execution count:' + count);
                console.info(`${caseName} test end`);
              }
              console.log('Exit worker');

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
        while(count != 10){
          await sleep(300);
        }
        console.log('Success execution count:' + count);
        expect(count).assertEqual(10);
        expect(returnCount).assertEqual(42);
        console.info(`${caseName} test end`);
        Done();
      });

    /**
     * @tc.name   AsynclockSameTest3900
     * @tc.number SUB_ASYNCLOCK_SAME_TEST_3900
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsynclockSameTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockSameTest3900';
        console.info(`${caseName} test start`);
        let task: taskpool.Task = new taskpool.Task(taskFunctionTest3900);
        let count = 0;
        for (let i = 0; i < 3; i++) {
          taskpool.execute(task).then((result) => {
            console.log('Success execution count:' + result);
            count++;
          })
        }
        console.log(`${count}`)
        while(count != 3){
          await sleep(300);
        }
        expect(count).assertEqual(3);
        console.info(`${caseName} test end`);
        Done();
      });

    /**
     * @tc.name   AsynclockSameTest4000
     * @tc.number SUB_ASYNCLOCK_SAME_TEST_4000
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsynclockSameTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockSameTest4000';
        console.info(`${caseName} test start`);
        let WorkThread: worker.ThreadWorker;
        WorkThread = new worker.ThreadWorker('../testability/workers/Worker');
        WorkThread.onexit = () => {
          console.log('onexit');
        }
        WorkThread.postMessage(caseName);
        WorkThread.onmessage = (e: MessageEvents): void => {
          expect(e.data).assertEqual(42);
          Done();
        }
      });

    /**
     * @tc.name   AsynclockSameTest4100
     * @tc.number SUB_ASYNCLOCK_SAME_TEST_4100
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsynclockSameTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockSameTest4100';
        console.info(`${caseName} test start`);
        let lock1 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request('lock_1');
        let lock2 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request('lock_1');
        let lock3 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request('lock_1');
        const promises: Promise<void>[] = [];
        let count = 0;
        for (let i = 0; i < 10; i++) {
          const promise1  = lock1.lockAsync(async () => {
            console.log('Enter shared lock lock1');
             lock2.lockAsync(async () => {
              console.log('Enter exclusive lock lock2');
               lock3.lockAsync(async () => {
                console.log('Enter exclusive lock lock3');
                 let task: taskpool.Task = new taskpool.Task(printArgs1, 1);
                 await taskpool.execute(task).then((result) => {
                   count++;
                 })
              }, ArkTSUtils.locks.AsyncLockMode.SHARED);
            }, ArkTSUtils.locks.AsyncLockMode.SHARED);
          }, ArkTSUtils.locks.AsyncLockMode.SHARED);
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
        console.log('Success execution count:' + count);
        expect(count).assertEqual(10);
        console.info(`${caseName} test end`);
        Done();
      });

    /**
     * @tc.name   AsynclockSameTest4200
     * @tc.number SUB_ASYNCLOCK_SAME_TEST_4200
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsynclockSameTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockSameTest4200';
        console.info(`${caseName} test start`);
        let task: taskpool.Task = new taskpool.Task(taskFunctionTest4200);
        let count = 0;
        for (let i = 0; i < 3; i++) {
          taskpool.execute(task).then((result) => {
            console.log('Success execution count:' + result);
            count++;
          })
        }
        console.log(`${count}`)
        while(count != 3){
          await sleep(300);
        }
        expect(count).assertEqual(3);
        console.info(`${caseName} test end`);
        Done();
      });

    /**
     * @tc.name   AsynclockSameTest4300
     * @tc.number SUB_ASYNCLOCK_SAME_TEST_4300
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsynclockSameTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockSameTest4300';
        console.info(`${caseName} test start`);
        let count: number = 0;
        let WorkThread: worker.ThreadWorker;
        WorkThread = new worker.ThreadWorker('../testability/workers/Worker');
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
     * @tc.name   AsynclockSameTest4400
     * @tc.number SUB_ASYNCLOCK_SAME_TEST_4400
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsynclockSameTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockSameTest4400';
        console.info(`${caseName} test start`);
        let lock1 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request('lock_1');
        let lock2 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request('lock_1');
        let lock3 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request('lock_1');
        const promises: Promise<void>[] = [];
        let count = 0;
        for (let i = 0; i < 10; i++) {
          const promise1  = lock1.lockAsync(async () => {
            console.log('Enter shared lock lock1');
            lock2.lockAsync(async () => {
              console.log('Enter exclusive lock lock2');
              lock3.lockAsync(async () => {
                console.log('Enter exclusive lock lock3');
                new Promise<void>((resolve, reject) => {
                  count++;
                  resolve();
                });
              }, ArkTSUtils.locks.AsyncLockMode.SHARED);
            }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
          }, ArkTSUtils.locks.AsyncLockMode.SHARED);
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
        console.log('Success execution count:' + count);
        expect(count).assertEqual(10);
        console.info(`${caseName} test end`);
        Done();
      });

    /**
     * @tc.name   AsynclockSameTest4500
     * @tc.number SUB_ASYNCLOCK_SAME_TEST_4500
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsynclockSameTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockSameTest4500';
        console.info(`${caseName} test start`);
        let task: taskpool.Task = new taskpool.Task(taskFunctionTest4500);
        let count = 0;
        for (let i = 0; i < 3; i++) {
          taskpool.execute(task).then((result) => {
            console.log('Success execution count:' + result);
            count++;
          })
        }
        console.log(`${count}`)
        while(count != 3){
          await sleep(300);
        }
        expect(count).assertEqual(3);
        console.info(`${caseName} test end`);
        Done();
      });

    /**
     * @tc.name   AsynclockSameTest4600
     * @tc.number SUB_ASYNCLOCK_SAME_TEST_4600
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsynclockSameTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockSameTest4600';
        console.info(`${caseName} test start`);
        let lock1 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request('lock_1');
        let lock2 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request('lock_1');
        let lock3 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request('lock_1');
        const promises: Promise<void>[] = [];
        let count = 0;
        for (let i = 0; i < 10; i++) {
          const promise1  = lock1.lockAsync(async () => {
            console.log('Enter shared lock lock1');
            lock2.lockAsync(async () => {
              console.log('Enter exclusive lock lock2');
              lock3.lockAsync(async () => {
                console.log('Enter exclusive lock lock3');
                setTimeout( async () => {
                  console.log('Enter exclusive lock lock3');
                  count++
                },300);
              }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
            }, ArkTSUtils.locks.AsyncLockMode.SHARED);
          }, ArkTSUtils.locks.AsyncLockMode.SHARED);
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
        console.log('Success execution count:' + count);
        expect(count).assertEqual(10);
        console.info(`${caseName} test end`);
        Done();
      });

    /**
     * @tc.name   AsynclockSameTest4700
     * @tc.number SUB_ASYNCLOCK_SAME_TEST_4700
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsynclockSameTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockSameTest4700';
        console.info(`${caseName} test start`);
        let task: taskpool.Task = new taskpool.Task(taskFunctionTest4700);
        let count = 0;
        for (let i = 0; i < 3; i++) {
          taskpool.execute(task).then((result) => {
            console.log('Success execution count:' + result);
            count++;
          })
        }
        console.log(`${count}`)
        while(count != 3){
          await sleep(300);
        }
        expect(count).assertEqual(3);
        console.info(`${caseName} test end`);
        Done();
      });

    /**
     * @tc.name   AsynclockSameTest4800
     * @tc.number SUB_ASYNCLOCK_SAME_TEST_4800
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsynclockSameTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockSameTest4800';
        console.info(`${caseName} test start`);
        let lock1 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request('lock_1');
        let lock2 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request('lock_1');
        let lock3 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request('lock_1');
        const promises: Promise<void>[] = [];
        let count = 0;
        let returnCount = 0
        for (let i = 0; i < 10; i++) {
          const promise1 : Promise<void> = lock1.lockAsync(async () => {
            console.log('Enter shared lock lock1');
            lock2.lockAsync(async () => {
              console.log('Enter exclusive lock lock2');
              lock3.lockAsync(async () => {
                console.log('Enter exclusive lock lock3');
                console.log('Enter worker');
                let WorkThread: worker.ThreadWorker;
                WorkThread = new worker.ThreadWorker('../testability/workers/Worker');
                WorkThread.onexit = () => {
                  console.log('onexit');
                }
                WorkThread.postMessage(caseName);
                WorkThread.onmessage = (e: MessageEvents): void => {
                  returnCount = e.data;
                  count++;
                  console.log('e:' + JSON.stringify(e));
                  console.info('main2 thread count is  ' + count);
                  WorkThread.terminate();
                  console.log('Success execution count:' + count);
                  console.info(`${caseName} test end`);
                }
                console.log('Exit worker');
              }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
            }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
          }, ArkTSUtils.locks.AsyncLockMode.SHARED);
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
        console.log('Success execution count:' + count);
        expect(count).assertEqual(10);
        expect(returnCount).assertEqual(42);
        console.info(`${caseName} test end`);
        Done();
      });

    /**
     * @tc.name   AsynclockSameTest4900
     * @tc.number SUB_ASYNCLOCK_SAME_TEST_4900
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsynclockSameTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockSameTest4900';
        console.info(`${caseName} test start`);
        let task: taskpool.Task = new taskpool.Task(taskFunctionTest4900);
        let count = 0;
        for (let i = 0; i < 3; i++) {
          taskpool.execute(task).then((result) => {
            console.log('Success execution count:' + result);
            count++;
          })
        }
        console.log(`${count}`)
        while(count != 3){
          await sleep(300);
        }
        expect(count).assertEqual(3);
        console.info(`${caseName} test end`);
        Done();
      });
  })
}