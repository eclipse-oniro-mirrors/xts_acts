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

import { BusinessError } from '@kit.BasicServicesKit';
import {
  multipleUITask1,
  multipleUITask2,
  multipleUITask3,
  multipleUITask4
} from '../testability/pages/MultipleTask';
import { sleep } from '../testability/pages/Utils';

export default function taskPoolAsyncRunnerMultipleUITest() {
  describe('TaskPoolAsyncRunnerMultipleUITest', () => {
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
      await sleep(2000);
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.name   taskPoolAsyncRunnerMultipleUITest0100
     * @tc.number SUB_TASKPOOL_ASYNC_RUNNER_MULTIPLE_UI_TEST_0100
     * @tc.desc   test task ui
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolAsyncRunnerMultipleUITest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'taskPoolAsyncRunnerMultipleUITest0100';
      console.info(`${caseName} test start`);
      let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10, 50);
      let count: number = 0;
      for (let i = 0; i < 10; i++) {
        let task1: taskpool.Task = new taskpool.Task(multipleUITask1);
        let task2: taskpool.Task = new taskpool.Task(multipleUITask2);
        asyncRunner.execute(task1).then(() => {
          console.info('=======', count);
          count++;
        }).catch((e: BusinessError) => {
          console.info('=======error', JSON.stringify(e.message));
          expect(true).assertFalse();
        });
        asyncRunner.execute(task2).then(() => {
          console.info('=======', count);
          count++;
        }).catch((e: BusinessError) => {
          console.info('=======error', JSON.stringify(e.message));
          expect(true).assertFalse();
        });
      }

      while (count < 20) {
        await sleep(100);
      }
      expect(20).assertEqual(count);
      console.info(`${caseName} test end`);
      Done();
    })

    /**
     * @tc.name   taskPoolAsyncRunnerMultipleUITest0200
     * @tc.number SUB_TASKPOOL_ASYNC_RUNNER_MULTIPLE_UI_TEST_0200
     * @tc.desc   test task ui&await
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolAsyncRunnerMultipleUITest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'taskPoolAsyncRunnerMultipleUITest0200';
      console.info(`${caseName} test start`);
      let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10, 50);
      let count: number = 0;
      for (let i = 0; i < 10; i++) {
        let task1: taskpool.Task = new taskpool.Task(multipleUITask3);
        let task2: taskpool.Task = new taskpool.Task(multipleUITask4);
        asyncRunner.execute(task1).then(() => {
          console.info('=======', count);
          count++;
        }).catch((e: BusinessError) => {
          console.info('=======error', JSON.stringify(e.message));
          expect(true).assertFalse();
        });
        asyncRunner.execute(task2).then(() => {
          console.info('=======', count);
          count++;
        }).catch((e: BusinessError) => {
          console.info('=======error', JSON.stringify(e.message));
          expect(true).assertFalse();
        });
      }

      while (count < 20) {
        await sleep(100);
      }

      expect(20).assertEqual(count);
      console.info(`${caseName} test end`);
      Done();
    })

  })
}