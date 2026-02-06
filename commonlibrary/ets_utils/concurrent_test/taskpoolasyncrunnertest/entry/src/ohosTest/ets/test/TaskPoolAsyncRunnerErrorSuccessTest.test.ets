/*
* Copyright (C) 2024 HiHope Open Source Organization.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { taskpool } from '@kit.ArkTS';
import {
  asyncLock,
  asyncLock1,
  asyncLock2,
  asyncLock3,
  printArgs1,
  printArgs2,
  printArgs3,
  printArgs4,
  sendData1,
  sendData2,
  printArgs9,
} from '../testability/pages/TaskMethodTest';
import { Count1, Count2 } from '../testability/pages/DataFlg';
import {
  AsyncLockTest,
  AsyncLockTestCatch,
  AsyncLockTestFinally,
  AsyncLockTestThen
} from '../testability/pages/SendableTest';
import { BusinessError } from '@kit.BasicServicesKit';
import { sleep } from '../testability/pages/Utils';

export default function taskPoolAsyncRunnerErrorSuccessTest() {
  describe('TaskPoolAsyncRunnerErrorSuccessTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(async () => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
      await sleep(100);
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.name   taskPoolAsyncRunnerErrorSuccessTest1001
     * @tc.number SUB_TASKPOOL_ASYNC_RUNNER_ERROR_SUCCESS_TEST_0100
     * @tc.desc   test ErrorSuccess
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolAsyncRunnerErrorSuccessTest1001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        console.log('taskPoolAsyncRunnerErrorSuccessTest1001: begin');
        let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10, 50);
        let Count1: number = 0;
        let Count2: number = 0;
        for (let i = 0; i < 10; i++) {
          let task: taskpool.Task = new taskpool.Task(printArgs1, 1);
          let task2: taskpool.Task = new taskpool.Task(printArgs3, 1);
          asyncRunner.execute(task).then((num: object) => {
            Count1 = Count1 + Number(num);
            console.info('======', Count1);
          });

          asyncRunner.execute(task2).catch((err: object[]) => {
            Count2 += 1;
            console.error('=======', JSON.stringify(err));
          });
        }
        while (Count2 < 10 || Count1 < 10) {
          await sleep(100);
        }
        expect(10).assertEqual(Count1);
        expect(10).assertEqual(Count2);
        Count1 = 0;
        Count2 = 0;
        console.log('taskPoolAsyncRunnerErrorSuccessTest1001: end');
        Done();
      })

    /**
     * @tc.name   taskPoolAsyncRunnerErrorSuccessTest1002
     * @tc.number SUB_TASKPOOL_ASYNC_RUNNER_ERROR_SUCCESS_TEST_0200
     * @tc.desc   test ErrorSuccess GenericsTask
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolAsyncRunnerErrorSuccessTest1002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        console.log('taskPoolAsyncRunnerErrorSuccessTest1002: begin');
        let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10, 50);
        let Count1: number = 0;
        let Count2: number = 0;
        for (let i = 0; i < 10; i++) {
          let task1: taskpool.Task = new taskpool.GenericsTask<[number], number>(printArgs1, 1);
          let task2: taskpool.Task = new taskpool.GenericsTask<[number], number>(printArgs3, 1);
          asyncRunner.execute(task1).then((num: object) => {
            Count1 = Count1 + Number(num);
            console.info('======', Count1);
          });

          asyncRunner.execute(task2).catch((err: object[]) => {
            Count2 += 1;
            console.error('=======', JSON.stringify(err));
          });

        }
        while (Count2 < 10 || Count1 < 10) {
          await sleep(100);
        }
        expect(10).assertEqual(Count1);
        expect(10).assertEqual(Count2);
        Count1 = 0;
        Count2 = 0;
        console.log('taskPoolAsyncRunnerErrorSuccessTest1002: end');
        Done();
      })

    /**
     * @tc.name   taskPoolAsyncRunnerErrorSuccessTest1003
     * @tc.number SUB_TASKPOOL_ASYNC_RUNNER_ERROR_SUCCESS_TEST_0300
     * @tc.desc   test onStartExecution
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolAsyncRunnerErrorSuccessTest1003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        console.log('taskPoolAsyncRunnerErrorSuccessTest1003: begin');
        let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10, 50);
        let Count1: number = 0;
        let Count2: number = 0;
        for (let i = 0; i < 10; i++) {
          let task1: taskpool.Task = new taskpool.Task(printArgs1, 1);
          let task2: taskpool.Task = new taskpool.Task(printArgs2, 1, 50);
          task1.onStartExecution(() => {
            console.info('====onStartExecution success');
          })
          task2.onStartExecution(() => {
            console.info('====onStartExecution2 success');
            try {
              let s: string[] = [];
              s[0].split('')[1].toString();
            } catch (e) {
              Count2++;
            }
          })
          asyncRunner.execute(task1).then((num: object) => {
            Count1 = Count1 + Number(num);
            console.info('====taskpool: execute task success');
          });

          asyncRunner.execute(task2).then((num: object) => {
            console.info('====taskpool: execute task2 success');
            Count2--;
          });
        }
        while (Count2 > 0 || Count1 < 10 ) {
          await sleep(100);
        }
        expect(10).assertEqual(Count1);
        expect(0).assertEqual(Count2);
        Count1 = 0;
        Count2 = 0;
        console.log('taskPoolAsyncRunnerErrorSuccessTest1003: end');
        Done();
      })

    /**
     * @tc.name   taskPoolAsyncRunnerErrorSuccessTest1004
     * @tc.number SUB_TASKPOOL_ASYNC_RUNNER_ERROR_SUCCESS_TEST_0400
     * @tc.desc   test onExecutionSucceeded
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolAsyncRunnerErrorSuccessTest1004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        console.log('taskPoolAsyncRunnerErrorSuccessTest1004: begin');
        let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10, 50);
        let count: number = 0;
        let count2: number = 0;
        for (let i = 0; i < 10; i++) {
          let task: taskpool.Task = new taskpool.Task(printArgs1, 1);
          let task2: taskpool.Task = new taskpool.Task(printArgs2, 1, 50);
          task.onExecutionSucceeded(() => {
            console.info('====onExecutionSucceeded: execute task success');
            count++;
          });
          task2.onExecutionSucceeded(() => {
            console.info('====onExecutionSucceeded2: execute task success');
            try {
              let s: string[] = [];
              s[0].split('')[1].toString();
            } catch (e) {
              count2++;
            }
          })
          asyncRunner.execute(task).then((num: object) => {
            count = count + Number(num);
            console.info('====taskpool: execute task success');
          });

          asyncRunner.execute(task2).then((num: object) => {
            count2 = count2 + Number(num);
            console.info('====taskpool: execute task2 success');
          });

        }

        while (count < 20 || count2 < 20) {
          await sleep(100);
        }
        expect(20).assertEqual(count);
        expect(20).assertEqual(count2);
        console.log('taskPoolAsyncRunnerErrorSuccessTest1004: end');
        Done();
      })

    /**
     * @tc.name   taskPoolAsyncRunnerErrorSuccessTest1005
     * @tc.number SUB_TASKPOOL_ASYNC_RUNNER_ERROR_SUCCESS_TEST_0500
     * @tc.desc   test onReceiveData
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolAsyncRunnerErrorSuccessTest1005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        console.log('taskPoolAsyncRunnerErrorSuccessTest1005: begin');
        let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10, 50);
        let count: number = 0;
        let count2: number = 0;
        for (let i = 0; i < 10; i++) {
          let task: taskpool.Task = new taskpool.Task(sendData1, 1);
          let task2: taskpool.Task = new taskpool.Task(sendData2, 1, 50);
          task.onReceiveData((num: number) => {
            console.info('======num', num);
            count += num;
          });
          task2.onReceiveData((num: number) => {
            try {
              let s: string[] = [];
              s[0].split('')[1].toString();
            } catch (e) {
              count2 += num;
            }
          })
          asyncRunner.execute(task);

          asyncRunner.execute(task2);

        }
        while (count2 < 10 || count < 10) {
          await sleep(100);
        }
        expect(10).assertEqual(count);
        expect(10).assertEqual(count2);
        console.log('taskPoolAsyncRunnerErrorSuccessTest1005: end');
        Done();
      })

    /**
     * @tc.name   taskPoolAsyncRunnerErrorSuccessTest1006
     * @tc.number SUB_TASKPOOL_ASYNC_RUNNER_ERROR_SUCCESS_TEST_0600
     * @tc.desc   test Task
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolAsyncRunnerErrorSuccessTest1006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10, 50);
        let count: number = 0;
        let count2: number = 0;
        for (let i = 0; i < 10; i++) {
          let task: taskpool.Task = new taskpool.Task(printArgs1, 1);
          let task2: taskpool.Task = new taskpool.Task(printArgs2, 1, 50);
          asyncRunner.execute(task).then((num: object) => {
            let s: string[] = [];
            s[0].split('')[1].toString();
          }).catch(() => {
            count2++;
          });

          asyncRunner.execute(task2).then((num: object) => {
            count += Number(num);
          });

        }
        while (count2 < 10 || count < 10) {
          await sleep(100);
        }
        expect(10).assertEqual(count);
        expect(10).assertEqual(count2);
        console.log('taskPoolAsyncRunnerErrorSuccessTest1006: end');
        Done();
      })

    /**
     * @tc.name   taskPoolAsyncRunnerErrorSuccessTest1007
     * @tc.number SUB_TASKPOOL_ASYNC_RUNNER_ERROR_SUCCESS_TEST_0700
     * @tc.desc   test Task
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolAsyncRunnerErrorSuccessTest1007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        console.log('taskPoolAsyncRunnerErrorSuccessTest1007: begin');
        let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10, 50);
        let count: number = 0;
        let count2: number = 0;
        for (let i = 0; i < 10; i++) {
          let task: taskpool.Task = new taskpool.Task(printArgs1, 1);
          let task2: taskpool.Task = new taskpool.Task(printArgs2, 1, 50);
          asyncRunner.execute(task).then((num: object) => {
            let s: string[] = [];
            s[0].split('')[1].toString();
          }).catch(() => {
            let s: string[] = [];
            s[0].split('')[1].toString();
          }).catch(() => {
            count2++;
          });

          asyncRunner.execute(task2).then((num: object) => {
            count += Number(num);
          });

        }
        while (count2 < 10 || count < 10) {
          await sleep(100);
        }
        expect(10).assertEqual(count);
        expect(10).assertEqual(count2);
        console.log('taskPoolAsyncRunnerErrorSuccessTest1007: end');
        Done();
      })

    /**
     * @tc.name   taskPoolAsyncRunnerErrorSuccessTest1008
     * @tc.number SUB_TASKPOOL_ASYNC_RUNNER_ERROR_SUCCESS_TEST_0800
     * @tc.desc   test Task
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolAsyncRunnerErrorSuccessTest1008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        console.log('taskPoolAsyncRunnerErrorSuccessTest1008: begin');
        let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10, 50);
        let count: number = 0;
        let count2: number = 0;
        for (let i = 0; i < 10; i++) {
          let task: taskpool.Task = new taskpool.Task(printArgs1, 1);
          let task2: taskpool.Task = new taskpool.Task(printArgs2, 1, 50);
          asyncRunner.execute(task).finally(() => {
            let s: string[] = [];
            s[0].split('')[1].toString();
          }).catch(() => {
            count2++;
          });
          asyncRunner.execute(task2).then(() => {
            count++;
          });
        }
        while (count2 < 10 || count < 10) {
          await sleep(100);
        }
        expect(10).assertEqual(count);
        expect(10).assertEqual(count2);
        console.log('taskPoolAsyncRunnerErrorSuccessTest1008: end');
        Done();
      })

    /**
     * @tc.name   taskPoolAsyncRunnerErrorSuccessTest1009
     * @tc.number SUB_TASKPOOL_ASYNC_RUNNER_ERROR_SUCCESS_TEST_1009
     * @tc.desc   test asyncLock
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolAsyncRunnerErrorSuccessTest1009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        console.log('taskPoolAsyncRunnerErrorSuccessTest1009: begin');
        let count: number = 0;
        let count2: number = 0;
        let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10, 50);
        for (let i = 0; i < 10; i++) {
          let asyncLockTest = new AsyncLockTest()
          let task: taskpool.Task = new taskpool.Task(printArgs1, 1);
          let task2: taskpool.Task = new taskpool.Task(asyncLock, asyncLockTest);
          asyncRunner.execute(task).then((num) => {
            count += Number(num);
          });

          asyncRunner.execute(task2).catch(() => {
            count2++;
          });
        }
        while (count2 < 10 || count < 10) {
          await sleep(100);
        }
        expect(10).assertEqual(count);
        expect(10).assertEqual(count2);
        console.log('taskPoolAsyncRunnerErrorSuccessTest1009: end');
        Done();
      })

    /**
     * @tc.name   taskPoolAsyncRunnerErrorSuccessTest1010
     * @tc.number SUB_TASKPOOL_ASYNC_RUNNER_ERROR_SUCCESS_TEST_1000
     * @tc.desc   test onEnqueued
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolAsyncRunnerErrorSuccessTest1010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        let count: number = 0;
        let count2: number = 0;
        let Count3: number = 0;
        let Count4: number = 0;
        let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10, 50);
        for (let i = 0; i < 10; i++) {
          let task: taskpool.Task = new taskpool.Task(printArgs1, 1);
          let task2: taskpool.Task = new taskpool.Task(printArgs2, 1, 50);
          task.onEnqueued(() => {
            count++;
          });
          task2.onEnqueued(() => {
            try {
              let s: string[] = [];
              s[0].split('')[1].toString();
            } catch (e) {
              count2++;
            }
          });
          asyncRunner.execute(task).then((num: object) => {
            Count3 = Count3 + Number(num);
            console.info('taskpool: execute task success');
          });
          asyncRunner.execute(task2).then((num: object) => {
            Count4 = Count4 + Number(num);
            console.info('taskpool: execute task success');
          });
        }
        while (Count3 < 10 ||Count4 < 10||count2 < 10 || count < 10) {
          await sleep(100);
        }
        expect(10).assertEqual(count);
        expect(10).assertEqual(count2);
        expect(10).assertEqual(Count3);
        expect(10).assertEqual(Count4);
        Count3 = 0;
        Count4 = 0;
        console.log('taskPoolAsyncRunnerErrorSuccessTest1010: end');
        Done();
      })

    /**
     * @tc.name   taskPoolAsyncRunnerErrorSuccessTest1011
     * @tc.number SUB_TASKPOOL_ASYNC_RUNNER_ERROR_SUCCESS_TEST_1100
     * @tc.desc   test onExecutionFailed
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolAsyncRunnerErrorSuccessTest1011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        console.log('taskPoolAsyncRunnerErrorSuccessTest1011: begin');
        let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10, 50);
        let count: number = 0;
        let count2: number = 0;
        for (let i = 0; i < 10; i++) {
          let task: taskpool.Task = new taskpool.Task(printArgs3, 1);
          let task2: taskpool.Task = new taskpool.Task(printArgs4, 1);
          task.onExecutionFailed(() => {
            count++;
          });
          task2.onExecutionFailed((e: Error) => {
            try {
              let s: string[] = [];
              s[0].split('')[1].toString();
            } catch (e) {
              count2++;
            }
          })
          asyncRunner.execute(task).catch(() => {
            count++;
            console.info('taskpool: execute task fail');
          });
          asyncRunner.execute(task2).catch(() => {
            count2++;
            console.info('taskpool: execute task fail');
          });
        }
        while (count2 < 20 || count < 20) {
          await sleep(100);
        }
        expect(20).assertEqual(count);
        expect(20).assertEqual(count2);
        console.log('taskPoolAsyncRunnerErrorSuccessTest1011: end');
        Done();
      })

    /**
     * @tc.name   taskPoolAsyncRunnerErrorSuccessTest1012
     * @tc.number SUB_TASKPOOL_ASYNC_RUNNER_ERROR_SUCCESS_TEST_1200
     * @tc.desc   test asyncLock-then
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolAsyncRunnerErrorSuccessTest1012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        console.log('taskPoolAsyncRunnerErrorSuccessTest1012: begin');
        let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10, 50);
        let count: number = 0;
        let count2: number = 0;
        for (let i = 0; i < 10; i++) {
          let asyncLockTest = new AsyncLockTestThen()
          let task: taskpool.Task = new taskpool.Task(printArgs1, 1);
          let task2: taskpool.Task = new taskpool.Task(asyncLock, asyncLockTest);
          asyncRunner.execute(task).then((num) => {
            count += Number(num);
          });
          asyncRunner.execute(task2).catch((e: BusinessError) => {
            console.info('=====', e.message)
            expect(e.message).assertContain('Cannot read property split of undefined')
            count2++;
          })
        }
        while (count2 < 10 || count < 10) {
          await sleep(100);
        }
        expect(10).assertEqual(count);
        expect(10).assertEqual(count2);
        console.log('taskPoolAsyncRunnerErrorSuccessTest1012: end');
        Done();
      })

    /**
     * @tc.name   taskPoolAsyncRunnerErrorSuccessTest1013
     * @tc.number SUB_TASKPOOL_ASYNC_RUNNER_ERROR_SUCCESS_TEST_1300
     * @tc.desc   test asyncLock-catch
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolAsyncRunnerErrorSuccessTest1013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        console.log('taskPoolAsyncRunnerErrorSuccessTest1013: begin');
        let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10, 50);
        let count: number = 0;
        let count2: number = 0;
        for (let i = 0; i < 10; i++) {
          let asyncLockTest = new AsyncLockTestCatch()
          let task: taskpool.Task = new taskpool.Task(printArgs1, 1);
          let task2: taskpool.Task = new taskpool.Task(asyncLock, asyncLockTest);
          asyncRunner.execute(task).then(() => {
            count++;
          });
          asyncRunner.execute(task2).catch(() => {
            count2++;
          });
        }
        while (count2 < 10 || count < 10) {
          await sleep(100);
        }
        expect(10).assertEqual(count);
        expect(10).assertEqual(count2);
        console.log('taskPoolAsyncRunnerErrorSuccessTest1013: end');
        Done();
      })

    /**
     * @tc.name   taskPoolAsyncRunnerErrorSuccessTest1014
     * @tc.number SUB_TASKPOOL_ASYNC_RUNNER_ERROR_SUCCESS_TEST_1400
     * @tc.desc   test asyncLock-finally
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolAsyncRunnerErrorSuccessTest1014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        console.log('taskPoolAsyncRunnerErrorSuccessTest1014: begin');
        let count: number = 0;
        let count2: number = 0;
        let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10, 50);
        for (let i = 0; i < 10; i++) {
          let asyncLockTest = new AsyncLockTestFinally();
          let task: taskpool.Task = new taskpool.Task(printArgs1, 1);
          let task2: taskpool.Task = new taskpool.Task(asyncLock, asyncLockTest);
          asyncRunner.execute(task).then(() => {
            count++;
          });
          asyncRunner.execute(task2).catch(() => {
            count2++;
          });
        }
        while (count2 < 10 || count < 10) {
          await sleep(100);
        }
        expect(10).assertEqual(count);
        expect(10).assertEqual(count2);
        console.log('taskPoolAsyncRunnerErrorSuccessTest1014: end');
        Done();
      })

    /**
     * @tc.name   taskPoolAsyncRunnerErrorSuccessTest1015
     * @tc.number SUB_TASKPOOL_ASYNC_RUNNER_ERROR_SUCCESS_TEST_1500
     * @tc.desc   test task-then
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolAsyncRunnerErrorSuccessTest1015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        console.log('taskPoolAsyncRunnerErrorSuccessTest1015: begin');
        let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10, 50);
        let count: number = 0;
        let count2: number = 0;
        for (let i = 0; i < 10; i++) {
          let asyncLockTest = new AsyncLockTestFinally();
          let task: taskpool.Task = new taskpool.Task(printArgs1, 1);
          let task2: taskpool.Task = new taskpool.Task(asyncLock1, asyncLockTest);
          asyncRunner.execute(task).then(() => {
            count++;
          });
           asyncRunner.execute(task2).catch(() => {
            count2++;
          });
        }
        while (count2 < 10 || count < 10) {
          await sleep(100);
        }
        expect(10).assertEqual(count);
        expect(10).assertEqual(count2);
        console.log('taskPoolAsyncRunnerErrorSuccessTest1015: end');
        Done();
      })

    /**
     * @tc.name   taskPoolAsyncRunnerErrorSuccessTest1016
     * @tc.number SUB_TASKPOOL_ASYNC_RUNNER_ERROR_SUCCESS_TEST_1600
     * @tc.desc   test task-catch
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolAsyncRunnerErrorSuccessTest1016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        console.log('taskPoolAsyncRunnerErrorSuccessTest1016: begin');
        let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10, 50);
        let count: number = 0;
        let count2: number = 0;
        for (let i = 0; i < 10; i++) {
          let asyncLockTest = new AsyncLockTestFinally();
          let task: taskpool.Task = new taskpool.Task(printArgs1, 1);
          let task2: taskpool.Task = new taskpool.Task(asyncLock2, asyncLockTest);
          asyncRunner.execute(task).then(() => {
            count++;
          });
          asyncRunner.execute(task2).catch(() => {
            count2++;
          });
        }
        while (count2 < 10 || count < 10) {
          await sleep(100);
        }
        expect(10).assertEqual(count);
        expect(10).assertEqual(count2);
        console.log('taskPoolAsyncRunnerErrorSuccessTest1016: end');
        Done();
      })

    /**
     * @tc.name   taskPoolAsyncRunnerErrorSuccessTest1017
     * @tc.number SUB_TASKPOOL_ASYNC_RUNNER_ERROR_SUCCESS_TEST_1700
     * @tc.desc   test task-finally
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolAsyncRunnerErrorSuccessTest1017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        console.log('taskPoolAsyncRunnerErrorSuccessTest1017: begin');
        let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10, 50);
        let count: number = 0;
        let count2: number = 0;
        for (let i = 0; i < 10; i++) {
          let asyncLockTest = new AsyncLockTestFinally();
          let task: taskpool.Task = new taskpool.Task(printArgs1, 1);
          let task2: taskpool.Task = new taskpool.Task(asyncLock3, asyncLockTest);
          asyncRunner.execute(task).then(() => {
            count++;
          });
          asyncRunner.execute(task2).catch(() => {
            count2++;
          });
        }
        while (count2 < 10 || count < 10) {
          await sleep(100);
        }
        expect(10).assertEqual(count);
        expect(10).assertEqual(count2);
        console.log('taskPoolAsyncRunnerErrorSuccessTest1017: end');
        Done();
      })

    /**
     * @tc.name   taskPoolAsyncRunnerErrorSuccessTest1018
     * @tc.number SUB_TASKPOOL_ASYNC_RUNNER_ERROR_SUCCESS_TEST_1800
     * @tc.desc   test task-promise
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolAsyncRunnerErrorSuccessTest1018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        console.log('taskPoolAsyncRunnerErrorSuccessTest1018: begin');
        let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10, 50);
        let count: number = 0;
        let count2: number = 0;
        for (let i = 0; i < 10; i++) {
          let asyncLockTest = new AsyncLockTest();
          let task: taskpool.Task = new taskpool.Task(printArgs1, 1);
          let task2: taskpool.Task = new taskpool.Task(asyncLock, asyncLockTest);
          asyncRunner.execute(task).then(() => {
            count++;
          });
          asyncRunner.execute(task2).catch(() => {
            count2++;
          });
        }
        while (count2 < 10 || count < 10) {
          await sleep(100);
        }
        expect(10).assertEqual(count);
        expect(10).assertEqual(count2);
        console.log('taskPoolAsyncRunnerErrorSuccessTest1018: end');
        Done();
      })

    /**
     * @tc.name   taskPoolAsyncRunnerErrorSuccessTest1019
     * @tc.number SUB_TASKPOOL_ASYNC_RUNNER_ERROR_SUCCESS_TEST_1900
     * @tc.desc   test task-setTimeout
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolAsyncRunnerErrorSuccessTest1019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        console.log('taskPoolAsyncRunnerErrorSuccessTest1019: begin');
        let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10, 50);
        let count: number = 0;
        let count2: number = 0;
        for (let i = 0; i < 10; i++) {
          let task: taskpool.Task = new taskpool.Task(printArgs1, 1);
          let task2: taskpool.Task = new taskpool.Task(printArgs9, 1);
          asyncRunner.execute(task).then((num) => {
            count += Number(num);
          });
          asyncRunner.execute(task2).catch(() => {
            count2++;
          });
        }
        while (count < 10 || count2 < 10) {
          await sleep(100);
        }
        expect(10).assertEqual(count);
        expect(10).assertEqual(count2);
        console.log('taskPoolAsyncRunnerErrorSuccessTest1019: end');
        Done();
      })

    /**
     * @tc.name   taskPoolAsyncRunnerErrorSuccessTest1020
     * @tc.number SUB_TASKPOOL_ASYNC_RUNNER_ERROR_SUCCESS_TEST_2000
     * @tc.desc   test async-error
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolAsyncRunnerErrorSuccessTest1020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        console.log('taskPoolAsyncRunnerErrorSuccessTest1020: begin');
        let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10, 50);
        let count: number = 0;
        let count2: number = 0;
        for (let i = 0; i < 10; i++) {
          let asyncLockTest = new AsyncLockTest();
          let task: taskpool.Task = new taskpool.Task(printArgs1, 1);
          let task2: taskpool.Task = new taskpool.Task(asyncLock, asyncLockTest);
          asyncRunner.execute(task).then(() => {
            count++;
          });
          asyncRunner.execute(task2).catch(() => {
            count2++;
          });
        }
        while (count2 < 10 || count < 10) {
          await sleep(100);
        }
        expect(10).assertEqual(count);
        expect(10).assertEqual(count2);
        console.log('taskPoolAsyncRunnerErrorSuccessTest1020: end');
        Done();
      })
  })
}