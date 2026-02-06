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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from '../../../hypium/index';
// import { taskpool } from '@kit.ArkTS';
import { printArgs1, } from '../testability/pages/TaskMethodTest';
import { BusinessError } from '@kit.BasicServicesKit';
import { sleep } from '../testability/pages/Utils';

declare class ArkTools {
  static forceFullGC(): void;
}

export default function taskPoolAsyncRunnerMultipleGCTest() {
  describe('TaskPoolAsyncRunnerMultipleGCTest', () => {
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
      await sleep(50);
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.number SUB_TASKPOOL_ASYNC_RUNNER_MULTIPLE_GC_TEST_0100
     * @tc.name taskPoolAsyncRunnerMultipleGCTest0100
     * @tc.desc test task ui
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolAsyncRunnerMultipleGCTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {  //async (Done: Function) => {
      const caseName = 'taskPoolAsyncRunnerMultipleGCTest0100';
      console.info(`${caseName} test start`);
      let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10, 1000);
      let count: number = 0;
      for (let j = 0; j < 1; j++) {
        await sleep(10);
        for (let i = 0; i < 1; i++) {
          let task: taskpool.Task = new taskpool.Task(printArgs1);
          asyncRunner.execute(task).then(() => {
          }).catch((e: Error) => {
            count++;
            console.info('======error', e.message);
          });
        }
        if (j == (2 || 4 || 7)) {
          setTimeout(() => {
            // gc
          }, 10)
        }
      }
      while (count < 1) {
        await sleep(100);
      }
      expect(1).assertEqual(count);
      console.info(`${caseName} test end`);
      done();
    })

    /**
     * @tc.number SUB_TASKPOOL_ASYNC_RUNNER_MULTIPLE_GC_TEST_0200
     * @tc.name taskPoolAsyncRunnerMultipleGCTest0200
     * @tc.desc test task ui
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolAsyncRunnerMultipleGCTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {  //async (Done: Function) => {
      const caseName = 'taskPoolAsyncRunnerMultipleGCTest0200';
      console.info(`${caseName} test start`);
      let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10, 50);
      let count: number = 0;
      let priority: Array<taskpool.Priority> = [
        taskpool.Priority.HIGH,
        taskpool.Priority.LOW,
        taskpool.Priority.IDLE,
        taskpool.Priority.MEDIUM,
      ];
      for (let i = 0; i < 4; i++) {
        let task: taskpool.Task = new taskpool.Task(printArgs1);
        asyncRunner.execute(task, priority[i]).then(() => {
        }).catch((e: Error) => {
          count++;
          console.info('======error',e.message);
        });

      }

      while (count < 4) {
        await sleep(100);
      }
      expect(4).assertEqual(count);
      console.info(`${caseName} test end`);
      done();
    })

  })
}