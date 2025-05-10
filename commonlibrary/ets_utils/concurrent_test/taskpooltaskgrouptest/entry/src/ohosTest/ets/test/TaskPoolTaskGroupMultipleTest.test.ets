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
import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { ErrorEvent, MessageEvents, taskpool, worker } from '@kit.ArkTS';
import {
  printArgs1,
} from '../testability/pages/TaskMethodTest';
import { BusinessError } from '@kit.BasicServicesKit';
import { sleep } from '../testability/pages/Utils';

declare class ArkTools {
  static forceFullGC(): void;
}

export default function taskPoolTaskGroupMultipleTest() {
  describe('TaskPoolTaskGroupMultipleTest', () => {
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
     * @tc.number TASKPOOL_TASK_GROUP_MULTIPLE_TEST_0100
     * @tc.name taskPoolTaskGroupMultipleTest0100
     * @tc.desc test task ui
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolTaskGroupMultipleTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      
      const caseName = 'taskPoolTaskGroupMultipleTest0100'
      console.info(`${caseName} test start`)
      let task1: taskpool.Task = new taskpool.Task(printArgs1);

      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      for (let i = 0; i < 10; i++) {
        let task1: taskpool.Task = new taskpool.Task(printArgs1);
        taskGroup.addTask(task1);
      }

      let count: number = 0

      for (let j = 0; j < 10; j++) {
        await sleep(10)
        for (let i = 0; i < 10; i++) {
          taskpool.execute(taskGroup).then(() => {
            console.info('=======', count)
            count++
          }).catch((e: BusinessError) => {
            console.info('=======error', JSON.stringify(e.message))
            expect(true).assertFalse()
          })
        }
        setTimeout(()=>{
          ArkTools.forceFullGC()
        },10)
      }

      while (count < 100) {
        await sleep(100)
      }

      expect(100).assertEqual(count)
      console.info(`${caseName} test end`)
      done()
    })

    /**
     * @tc.number TASKPOOL_TASK_GROUP_MULTIPLE_TEST_0200
     * @tc.name taskPoolTaskGroupMultipleTest0200
     * @tc.desc test task ui
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolTaskGroupMultipleTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      
      const caseName = 'taskPoolTaskGroupMultipleTest0200'
      console.info(`${caseName} test start`)
      let task1: taskpool.Task = new taskpool.Task(printArgs1);

      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(task1);

      let count: number = 0

      let priority: Array<taskpool.Priority> = [
        taskpool.Priority.HIGH,
        taskpool.Priority.LOW,
        taskpool.Priority.IDLE,
        taskpool.Priority.MEDIUM,
      ]
      for (let i = 0; i < 4; i++) {
        taskpool.execute(taskGroup, priority[i]).then(() => {
          console.info('=======', count)
          count++
        }).catch((e: BusinessError) => {
          console.info('=======error', JSON.stringify(e.message))
          expect(true).assertFalse()
        })
      }

      while (count < 4) {
        await sleep(100)
      }

      expect(4).assertEqual(count)
      console.info(`${caseName} test end`)
      done()
    })

  })
}