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
import hilog from '@ohos.hilog';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType} from "../../../hypium/index";
import {
  printArgs1,
  printArgs10,
  printArgs11,
  printArgs12,
  printArgs13,
  printArgs14,
} from '../testability/pages/TaskMethodTest';

import { sleep } from '../testability/pages/Utils';
import { BusinessError } from '@ohos.base';

export default function taskPoolErrorSuccess2Test() {
  describe('TaskPoolErrorSuccess2Test', (): void => {
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
     * @tc.number TASKPOOL_TASK_ERROR_SUCCESS_SECOND_TEST_2700
     * @tc.name taskPoolTaskErrorSuccessSecondTest1027
     * @tc.desc test task-二级-error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolTaskErrorSuccessSecondTest1027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {

      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.

      let task: taskpool.Task = new taskpool.Task(printArgs1, 1.0);
      let task2: taskpool.Task = new taskpool.Task(printArgs11, 1.0);
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(task);
      taskGroup.addTask(task2);
      let count: Number = 0
      let count2: Number = 0


      for (let i = 0; i < 1; i++) {
         taskpool.execute(taskGroup).then((e: Array<Any>) => {
          console.info('======1')
          count ++
        }).catch((e: Error) => {
          count2 ++
          console.info('======2', count2, e.message)
        })
      }

      while (count2 < 1) {
        await sleep(100)
      }

      expect(String(0)).assertEqual(String(count))
      expect(String(1)).assertEqual(String(count2))
      done()
    })

    /**
     * @tc.number TASKPOOL_TASK_ERROR_SUCCESS_SECOND_TEST_2800
     * @tc.name taskPoolTaskErrorSuccessSecondTest1028
     * @tc.desc test task-二级-error-then
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolTaskErrorSuccessSecondTest1028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {

      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.

      let task: taskpool.Task = new taskpool.Task(printArgs1, 1.0);
      let task2: taskpool.Task = new taskpool.Task(printArgs12, 1.0);
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(task);
      taskGroup.addTask(task2);
      let count: Number = 0
      let count2: Number = 0


      for (let i = 0; i < 1; i++) {
         taskpool.execute(taskGroup).then((e: Array<Any>) => {
          console.info('======1')
          count ++
        }).catch((e: Error) => {
          count2 ++
          console.info('======2', count2, e.message)
        })
      }

      while (count2 < 1) {
        await sleep(100)
      }

      expect(String(0)).assertEqual(String(count))
      expect(String(1)).assertEqual(String(count2))
      done()
    })

    /**
     * @tc.number TASKPOOL_TASK_ERROR_SUCCESS_SECOND_TEST_2900
     * @tc.name taskPoolTaskErrorSuccessSecondTest1029
     * @tc.desc test task-二级-error-catch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolTaskErrorSuccessSecondTest1029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {

      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.

      let task: taskpool.Task = new taskpool.Task(printArgs1, 1.0);
      let task2: taskpool.Task = new taskpool.Task(printArgs13, 1.0);
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(task);
      taskGroup.addTask(task2);
      let count: Number = 0
      let count2: Number = 0


      for (let i = 0; i < 1; i++) {
         taskpool.execute(taskGroup).then((e: Array<Any>) => {
          console.info('======1')
          count ++
        }).catch((e: Error) => {
          count2 ++
          console.info('======2', count2, e.message)
        })
      }

      while (count2 < 1) {
        await sleep(100)
      }

      expect(String(0)).assertEqual(String(count))
      expect(String(1)).assertEqual(String(count2))
      done()
    })

    /**
     * @tc.number TASKPOOL_TASK_ERROR_SUCCESS_SECOND_TEST_3000
     * @tc.name taskPoolTaskErrorSuccessSecondTest1030
     * @tc.desc test task-二级-error-catch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolTaskErrorSuccessSecondTest1030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {

      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.

      let task: taskpool.Task = new taskpool.Task(printArgs1, 1.0);
      let task2: taskpool.Task = new taskpool.Task(printArgs14, 1.0);
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(task);
      taskGroup.addTask(task2);
      let count: Number = 0
      let count2: Number = 0


      for (let i = 0; i < 1; i++) {
         taskpool.execute(taskGroup).then((e: Array<Any>) => {
          console.info('======1')
          count ++
        }).catch((e: Error) => {
          count2 ++
          console.info('======2', count2, e.message)
        })
      }

      while (count2 < 1) {
        await sleep(100)
      }

      expect(String(0)).assertEqual(String(count))
      expect(String(1)).assertEqual(String(count2))
      done()
    })

  })
}