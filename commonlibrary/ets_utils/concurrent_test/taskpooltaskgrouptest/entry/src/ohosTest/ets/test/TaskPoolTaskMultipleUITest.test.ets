/*
* Copyright (C) 2024 HiHope Open Source Organization.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { ErrorEvent, MessageEvents, taskpool, worker } from '@kit.ArkTS';


import { BusinessError } from '@kit.BasicServicesKit';
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
  describe('TaskPoolTaskMultipleUITest', () => {
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
      await sleep(2000)
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.name   taskPoolTaskMultipleUITest0100
     * @tc.number TASKPOOL_TASK_MULTIPLE_UI_TEST_0100
     * @tc.desc   test task ui
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('taskPoolTaskMultipleUITest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      
      const caseName = 'taskPoolTaskMultipleUITest0100'
      console.info(`${caseName} test start`)
      await sleep(5000)
      let task1: taskpool.Task = new taskpool.Task(multipleUITask1);
      let task2: taskpool.Task = new taskpool.Task(multipleUITask2);

      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(task1);
      taskGroup.addTask(task2);

      let count: number = 0

      for (let i = 0; i < 10; i++) {
        taskpool.execute(taskGroup).then(() => {
          console.info('=======', count)
          count++
        }).catch((e: BusinessError) => {
          console.info('=======error', JSON.stringify(e.message))
          expect(true).assertFalse()
        })
      }

      while (count < 10) {
        await sleep(100)
      }

      expect(10).assertEqual(count)
      console.info(`${caseName} test end`)
      done()
    })

    /**
     * @tc.name   taskPoolTaskMultipleUITest0200
     * @tc.number TASKPOOL_TASK_MULTIPLE_UI_TEST_0200
     * @tc.desc   test task ui
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolTaskMultipleUITest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      
      const caseName = 'taskPoolTaskMultipleUITest0200'
      console.info(`${caseName} test start`)
      let task1: taskpool.Task = new taskpool.Task(multipleUITask3);
      let task2: taskpool.Task = new taskpool.Task(multipleUITask4);

      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(task1);
      taskGroup.addTask(task2);

      let count: number = 0

      for (let i = 0; i < 10; i++) {
        taskpool.execute(taskGroup).then(() => {
          console.info('=======', count)
          count++
        }).catch((e: BusinessError) => {
          console.info('=======error', JSON.stringify(e.message))
          expect(true).assertFalse()
        })
      }

      while (count < 10) {
        await sleep(100)
      }

      expect(10).assertEqual(count)
      console.info(`${caseName} test end`)
      done()
    })

  })
}