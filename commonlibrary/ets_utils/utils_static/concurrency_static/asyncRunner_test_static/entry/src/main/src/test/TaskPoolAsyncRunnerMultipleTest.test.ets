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

import {
  describe,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect,
  Level,
  Size,
  TestType
} from '../../../hypium/index';
// import { taskpool } from '@kit.ArkTS';
import { BusinessError } from '@kit.BasicServicesKit';
import {
// multipleTask1,
// multipleTask2,
// multipleTask3,
  multipleTask4,
// multipleTask5
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
      await sleep(50);
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.number TASKPOOL_TASK_MULTIPLE_TEST_0400
     * @tc.name taskPoolAsyncRunnerMultipleTest0400
     * @tc.desc test worker error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolAsyncRunnerMultipleTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => { //async (Done: Function) => {
        const caseName = 'taskPoolAsyncRunnerMultipleTest0400'
        console.info(`${caseName} test start`)
        let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10, 50);
        let count: number = 0;
        const taskCount = 10;
        const tasks: taskpool.Task[] = [];
        for (let i = 0; i < 1; i++) {
          console.info('=======1');
          tasks.push(new taskpool.Task(multipleTask4));
        }
        try {
          for (let i = 0; i < 1; i++) {
            console.info('=======2',tasks.length);
            asyncRunner.execute(tasks[i]).then(() => {
              console.info('=======', count);
              count++;
              if (i === 2 || i === 4 || i === 9) {
                setTimeout(() => {
                  // gc;
                }, 10);
              }
            }).catch((e: Error) => { // 改为通用Error类型
              count++;
              console.info('======error', JSON.stringify((e as BusinessError).message)); // 若需访问BusinessError属性，可做类型断言
            });
          }
        } catch (e: Error) {
          console.info('======error2', JSON.stringify((e as BusinessError).message));
        }
        while (count < 1) {
          await sleep(100);
        }
        await sleep(1000);
        expect(1).assertEqual(count);
        console.info(`${caseName} test end`);
        done();
      })


  })
}