/*
* Copyright (c) 2025 Huawei Device Co., Ltd.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType} from "../../../hypium/index";
import { BusinessError } from '@ohos.base';
import {
  multipleUITask1,
  multipleUITask2,
  multipleUITask3,
  multipleUITask4
} from '../testability/pages/MultipleTask';
import { sleep } from '../testability/pages/Utils';

declare class ArkTools {
  static forceFullGC(): void;
}


export default function taskPoolTaskMultipleUITest() {
  describe('TaskPoolTaskMultipleUITest', (): void => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll((): void => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach((): void => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(async (): Promise<void> => {
      await sleep(2000)
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll((): void => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.number TASKPOOL_TASK_MULTIPLE_UI_TEST_0100
     * @tc.name taskPoolTaskMultipleUITest0100
     * @tc.desc test task ui
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolTaskMultipleUITest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      
      const caseName = 'taskPoolTaskMultipleUITest0100'
      console.info(`${caseName} test start`)
      await sleep(500)
      let count: number = 0
      for (let i = 0; i < 1; i++) {     let task1: taskpool.Task = new taskpool.Task(multipleUITask1);
        let task2: taskpool.Task = new taskpool.Task(multipleUITask2);

        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup.addTask(task1);
        taskGroup.addTask(task2);

        taskpool.execute(taskGroup).then((e: Any) => {
          console.info('=======', count)
          count++
        }).catch((e: Any) => {
          console.info('=======error', JSON.stringify(e as BusinessError))
          expect(true).assertFalse()
        })
      }

      while (count < 1) {
        await sleep(100)
      }

      expect(String(1)).assertEqual(String(count))
      console.info(`${caseName} test end`)
      done()
    })

    /**
     * @tc.number TASKPOOL_TASK_MULTIPLE_UI_TEST_0200
     * @tc.name taskPoolTaskMultipleUITest0200
     * @tc.desc test task ui
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolTaskMultipleUITest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      const caseName = 'taskPoolTaskMultipleUITest0200'
      console.info(`${caseName} test start`)
      let count: number = 0
      for (let i = 0; i < 1; i++) {  let task1: taskpool.Task = new taskpool.Task(multipleUITask3);
        let task2: taskpool.Task = new taskpool.Task(multipleUITask4);

        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup.addTask(task1);
        taskGroup.addTask(task2);

        taskpool.execute(taskGroup).then((e: Any) => {
          console.info('=======', count)
          count++
        }).catch((e: Any) => {
          console.info('=======error', JSON.stringify(e as BusinessError))
          expect(true).assertFalse()
        })
      }

      while (count < 1) {
        await sleep(100)
      }

      expect(1).assertEqual(count)
      console.info(`${caseName} test end`)
      done()
    })

  })
}