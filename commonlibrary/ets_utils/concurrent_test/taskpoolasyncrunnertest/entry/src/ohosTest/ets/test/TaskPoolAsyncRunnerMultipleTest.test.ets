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
  multipleTask1,
  multipleTask2,
  multipleTask3,
  multipleTask4,
  multipleTask5
} from '../testability/pages/MultipleTask';
import { sleep } from '../testability/pages/Utils';

declare class ArkTools {
  static forceFullGC(): void;
}

export default function taskPoolAsyncRunnerMultipleTest() {
  describe('TaskPoolAsyncRunnerMultipleTest', () => {
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
      await sleep(200);
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.name   taskPoolAsyncRunnerMultipleTest0100
     * @tc.number TASKPOOL_TASK_MULTIPLE_TEST_0100
     * @tc.desc   test worker error
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolAsyncRunnerMultipleTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'taskPoolAsyncRunnerMultipleTest0100';
      console.info(`${caseName} test start`)
      let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10, 50);
      let count: number = 0;
      const taskCount = 10;
      const tasks: taskpool.Task[] = [];
      for (let i = 0; i < taskCount; i++) {
        tasks.push(new taskpool.Task(multipleTask1));
      }
      for (let i = 0; i < tasks.length; i++) {
        asyncRunner.execute(tasks[i]).then(() => {
          console.info('=======', count);
          count++;
          if (i === 2 || i === 4 || i === 9) {
            setTimeout(() => {
              ArkTools.forceFullGC();
            }, 10);
          }
        }).catch((e: BusinessError) => {
          console.info('=======error', JSON.stringify(e));

        });
      }

      while (count < taskCount) {
        await sleep(100);
      }
      await sleep(1000);
      expect(taskCount).assertEqual(count);
      console.info(`${caseName} test end`);
      Done();
    })

    /**
     * @tc.name   taskPoolAsyncRunnerMultipleTest0200
     * @tc.number TASKPOOL_TASK_MULTIPLE_TEST_0200
     * @tc.desc   test worker error
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolAsyncRunnerMultipleTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'taskPoolAsyncRunnerMultipleTest0200'
        console.info(`${caseName} test start`)
        let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10, 50);
        let count: number = 0;
        const taskCount = 10;
        const tasks: taskpool.Task[] = [];
        for (let i = 0; i < taskCount; i++) {
          tasks.push(new taskpool.Task(multipleTask2));
        }
        for (let i = 0; i < tasks.length; i++) {
          asyncRunner.execute(tasks[i]).then(() => {
            console.info('=======', count);
            count++;
            if (i === 2 || i === 4 || i === 9) {
              setTimeout(() => {
                ArkTools.forceFullGC();
              }, 10);
            }
          }).catch((e: BusinessError) => {
            console.info('=======error', JSON.stringify(e));

          });
        }

        while (count < taskCount) {
          await sleep(100);
        }
        await sleep(1000);
        expect(taskCount).assertEqual(count);
        console.info(`${caseName} test end`);
        Done();
      })
    /**
     * @tc.name   taskPoolAsyncRunnerMultipleTest0300
     * @tc.number TASKPOOL_TASK_MULTIPLE_TEST_0300
     * @tc.desc   test worker error
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolAsyncRunnerMultipleTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'taskPoolAsyncRunnerMultipleTest0300'
        console.info(`${caseName} test start`)
        let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10, 50);
        let count: number = 0;
        const taskCount = 10;
        const tasks: taskpool.Task[] = [];
        for (let i = 0; i < taskCount; i++) {
          tasks.push(new taskpool.Task(multipleTask3));
        }
        for (let i = 0; i < tasks.length; i++) {
          asyncRunner.execute(tasks[i]).then(() => {
            console.info('=======', count);
            count++;
            if (i === 2 || i === 4 || i === 9) {
              setTimeout(() => {
                ArkTools.forceFullGC();
              }, 10);
            }
          }).catch((e: BusinessError) => {
            console.info('=======error', JSON.stringify(e));

          });
        }

        while (count < taskCount) {
          await sleep(100);
        }
        await sleep(1000);
        expect(taskCount).assertEqual(count);
        console.info(`${caseName} test end`);
        Done();
      })
    /**
     * @tc.name   taskPoolAsyncRunnerMultipleTest0400
     * @tc.number TASKPOOL_TASK_MULTIPLE_TEST_0400
     * @tc.desc   test worker error
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolAsyncRunnerMultipleTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'taskPoolAsyncRunnerMultipleTest0400'
      console.info(`${caseName} test start`)
      let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10, 50);
      let count: number = 0;
      const taskCount = 10;
      const tasks: taskpool.Task[] = [];
      for (let i = 0; i < taskCount; i++) {
        tasks.push(new taskpool.Task(multipleTask4));
      }
      for (let i = 0; i < tasks.length; i++) {
        asyncRunner.execute(tasks[i]).then(() => {
          console.info('=======', count);
          count++;
          if (i === 2 || i === 4 || i === 9) {
            setTimeout(() => {
              ArkTools.forceFullGC();
            }, 10);
          }
        }).catch((e: BusinessError) => {
          console.info('=======error', JSON.stringify(e));

        });
      }
      while (count < taskCount) {
        await sleep(100);
      }
      await sleep(1000);
      expect(taskCount).assertEqual(count);
      console.info(`${caseName} test end`);
      Done();
    })

    /**
     * @tc.name   taskPoolAsyncRunnerMultipleTest0500
     * @tc.number TASKPOOL_TASK_MULTIPLE_TEST_0500
     * @tc.desc   test worker error
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolAsyncRunnerMultipleTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'taskPoolAsyncRunnerMultipleTest0500'
      console.info(`${caseName} test start`)
      let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10, 50);
      let count: number = 0;
      const taskCount = 10;
      const tasks: taskpool.Task[] = [];
      for (let i = 0; i < taskCount; i++) {
        tasks.push(new taskpool.Task(multipleTask2));
      }
      for (let i = 0; i < tasks.length; i++) {
        asyncRunner.execute(tasks[i]).then(() => {
          console.info('=======', count);
          count++;
          if (i === 3 || i === 6 || i === 10) {
            setTimeout(() => {
              ArkTools.forceFullGC();
            }, 10);
          }
        }).catch((e: BusinessError) => {
          console.info('=======error', JSON.stringify(e));
        });
      }

      while (count < taskCount) {
        await sleep(100);
      }
      await sleep(1000);
      expect(taskCount).assertEqual(count);
      console.info(`${caseName} test end`);
      Done();
    })

  })
}