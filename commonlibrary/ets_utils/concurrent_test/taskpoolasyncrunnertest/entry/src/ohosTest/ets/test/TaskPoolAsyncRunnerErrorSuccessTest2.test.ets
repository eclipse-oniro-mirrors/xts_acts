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
import { ErrorEvent, MessageEvents, taskpool, worker } from '@kit.ArkTS';
import {
  printArgs1,
  printArgs11,
  printArgs12,
  printArgs13,
  printArgs14
} from '../testability/pages/TaskMethodTest';

import { sleep } from '../testability/pages/Utils';
import { BusinessError } from '@kit.BasicServicesKit';

export default function taskPoolAsyncRunnerErrorSuccessTest2() {
  describe('TaskPoolAsyncRunnerErrorSuccessTest2', () => {
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
     * @tc.name   taskPoolAsyncRunnerErrorSuccessTest1025
     * @tc.number SUB_TASKPOOL_ASYNC_RUNNER_ERROR_SUCCESS_TEST_2500
     * @tc.desc   test worker error
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolAsyncRunnerErrorSuccessTest1025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        console.info('taskPoolAsyncRunnerErrorSuccessTest1025: begin');
        let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10, 50);
        let count: number = 0
        let count2: number = 0
        for (let i = 0; i < 10; i++) {
          let task: taskpool.Task = new taskpool.Task(printArgs1, 1);
          let task2: taskpool.Task = new taskpool.Task(printArgs1, 2);
          asyncRunner.execute(task).then(() => {
            count++;
          });
          asyncRunner.execute(task2).then(() => {
            let work = new worker.ThreadWorker('../testability/pages/workers/Worker.ets');
            work.onerror = (e: ErrorEvent): void => {
              console.info('======e.message', e.message);
              count2++;
              work.terminate();
            }
            work.postMessage('2');
          });
        }
        while (count2 < 10 || count < 10) {
          await sleep(100);
        }
        expect(10).assertEqual(count);
        expect(10).assertEqual(count2);
        console.info('taskPoolAsyncRunnerErrorSuccessTest1025: end');
        Done();
      })

    /**
     * @tc.name   taskPoolAsyncRunnerErrorSuccessTest1026
     * @tc.number SUB_TASKPOOL_ASYNC_RUNNER_ERROR_SUCCESS_TEST_2600
     * @tc.desc   test worker-onmessage error
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolAsyncRunnerErrorSuccessTest1026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        console.info('taskPoolAsyncRunnerErrorSuccessTest1026: begin');
        let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10, 50);
        let count: number = 0
        let count2: number = 0
        for (let i = 0; i < 10; i++) {
          let task: taskpool.Task = new taskpool.Task(printArgs1, 1);
          let task2: taskpool.Task = new taskpool.Task(printArgs1, 2);
          asyncRunner.execute(task).then(() => {
            count++;
          });
          asyncRunner.execute(task2).then(() => {
            let work = new worker.ThreadWorker('../testability/pages/workers/Worker.ets');
            work.onmessage = (e: MessageEvents): void => {
              console.info('======e.message', e.data);
              try {
                let s: string[] = [];
                s[0].split('')[1].toString();
              } catch (e) {
                count2++;
                work.terminate();
              }
            }
            work.postMessage('1');
          });
        }
        while (count2 < 10 || count < 10) {
          await sleep(100);
        }
        expect(10).assertEqual(count);
        expect(10).assertEqual(count2);
        console.info('taskPoolAsyncRunnerErrorSuccessTest1026: end');
        Done();
      })

    /**
     * @tc.name   taskPoolAsyncRunnerErrorSuccessTest1027
     * @tc.number SUB_TASKPOOL_ASYNC_RUNNER_ERROR_SUCCESS_TEST_2700
     * @tc.desc   test task-二级-error
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolAsyncRunnerErrorSuccessTest1027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        console.info('taskPoolAsyncRunnerErrorSuccessTest1027: begin');
        let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10, 50);
        let count: number = 0
        let count2: number = 0
        for (let i = 0; i < 10; i++) {
          let task: taskpool.Task = new taskpool.Task(printArgs1, 1);
          let task2: taskpool.Task = new taskpool.Task(printArgs11, 1);
          asyncRunner.execute(task).then(() => {
            console.info('======1');
            count++;
          });
          asyncRunner.execute(task2).catch((e: BusinessError) => {
            expect(e.message).assertContain('Cannot read property split of undefined')
            count2++;
            console.info('======2', count2, e.message);
          });
        }
        while (count2 < 10 || count < 10) {
          await sleep(100);
        }
        expect(10).assertEqual(count);
        expect(10).assertEqual(count2);
        console.info('taskPoolAsyncRunnerErrorSuccessTest1027: end');
        Done();
      })

    /**
     * @tc.name   taskPoolAsyncRunnerErrorSuccessTest1028
     * @tc.number SUB_TASKPOOL_ASYNC_RUNNER_ERROR_SUCCESS_TEST_2800
     * @tc.desc   test task-二级-error-then
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolAsyncRunnerErrorSuccessTest1028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        console.info('taskPoolAsyncRunnerErrorSuccessTest1028: begin');
        let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10, 50);
        let count: number = 0
        let count2: number = 0
        for (let i = 0; i < 10; i++) {
          let task: taskpool.Task = new taskpool.Task(printArgs1, 1);
          let task2: taskpool.Task = new taskpool.Task(printArgs12, 1);
          asyncRunner.execute(task).then(() => {
            console.info('======1');
            count++;
          });
          asyncRunner.execute(task2).catch((e: BusinessError) => {
            expect(e.message).assertContain('Cannot read property split of undefined');
            count2++;
            console.info('======2', count2, e.message);
          });
        }
        while (count2 < 10 || count < 10) {
          await sleep(100);
        }
        expect(10).assertEqual(count);
        expect(10).assertEqual(count2);
        console.info('taskPoolAsyncRunnerErrorSuccessTest1028: end');
        Done();
      })

    /**
     * @tc.name   taskPoolAsyncRunnerErrorSuccessTest1029
     * @tc.number SUB_TASKPOOL_ASYNC_RUNNER_ERROR_SUCCESS_TEST_2900
     * @tc.desc   test task-二级-error-catch
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolAsyncRunnerErrorSuccessTest1029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        console.info('taskPoolAsyncRunnerErrorSuccessTest1029: begin');
        let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10, 50);
        let count: number = 0
        let count2: number = 0
        for (let i = 0; i < 10; i++) {
          let task: taskpool.Task = new taskpool.Task(printArgs1, 1);
          let task2: taskpool.Task = new taskpool.Task(printArgs13, 1);
          asyncRunner.execute(task).then(() => {
            console.info('======1');
            count++;
          });
          asyncRunner.execute(task2).catch((e: BusinessError) => {
            expect(e.message).assertContain('Cannot read property split of undefined');
            count2++;
            console.info('======2', count2, e.message);
          });
        }
        while (count2 < 10 || count < 10) {
          await sleep(100);
        }
        expect(10).assertEqual(count);
        expect(10).assertEqual(count2);
        console.info('taskPoolAsyncRunnerErrorSuccessTest1029: end');
        Done();
      })

    /**
     * @tc.name   taskPoolAsyncRunnerErrorSuccessTest1030
     * @tc.number SUB_TASKPOOL_ASYNC_RUNNER_ERROR_SUCCESS_TEST_3000
     * @tc.desc   test task-二级-error-catch
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolAsyncRunnerErrorSuccessTest1030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10, 50);
        let count: number = 0
        let count2: number = 0
        for (let i = 0; i < 10; i++) {
          let task: taskpool.Task = new taskpool.Task(printArgs1, 1);
          let task2: taskpool.Task = new taskpool.Task(printArgs14, 1);
          asyncRunner.execute(task).then(() => {
            console.info('======1');
            count++;
          });
          asyncRunner.execute(task2).catch((e: BusinessError) => {
            expect(e.message).assertContain('Cannot read property split of undefined');
            count2++;
            console.info('======2', count2, e.message);
          });
        }
        while (count2 < 10 || count < 10) {
          await sleep(100);
        }
        expect(10).assertEqual(count);
        expect(10).assertEqual(count2);
        console.info('taskPoolAsyncRunnerErrorSuccessTest1030: end');
        Done();
      })
  })
}