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
  printArgs10,
  printArgs11,
  printArgs12,
  printArgs13,
  printArgs14,
} from '../testability/pages/TaskMethodTest';

import { sleep, WorkThread } from '../testability/pages/Utils';
import { BusinessError } from '@kit.BasicServicesKit';

export default function taskPoolErrorSuccess2Test() {
  describe('TaskPoolErrorSuccess2Test', () => {
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
     * @tc.number TASKPOOL_TASK_ERROR_SUCCESS_TEST_2500
     * @tc.name taskPoolTaskErrorSuccessTest1025
     * @tc.desc test worker error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolTaskGroupExecute1025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      
      let task: taskpool.Task = new taskpool.Task(printArgs1, 1);
      let task2: taskpool.Task = new taskpool.Task(printArgs10, 1);
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(task);
      taskGroup.addTask(task2);
      let count: number = 0
      let count2: number = 0

      for (let i = 0; i < 10; i++) {
        taskpool.execute(taskGroup).then(() => {
          count ++
          let work = new worker.ThreadWorker('../testability/pages/workers/WorkerTaskGroup.ets');
          work.onerror = (e: ErrorEvent): void => {
            console.info('======e.message', e.message)
            count2 ++
            work.terminate()
          }
          work.postMessage('2')
        })
      }

      while (count2 < 10) {
        await sleep(100)
      }
      await sleep(100)
      expect(10).assertEqual(count)
      expect(10).assertEqual(count2)
      done()
    })

    /**
     * @tc.number TASKPOOL_TASK_ERROR_SUCCESS_TEST_2600
     * @tc.name taskPoolTaskErrorSuccessTest1026
     * @tc.desc test worker-onmessage error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolTaskGroupExecute1026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      
      let task: taskpool.Task = new taskpool.Task(printArgs1, 1);
      let task2: taskpool.Task = new taskpool.Task(printArgs10, 1);
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(task);
      taskGroup.addTask(task2);
      let count: number = 0
      let count2: number = 0

      for (let i = 0; i < 10; i++) {
        taskpool.execute(taskGroup).then(() => {
          count ++
          let work = new worker.ThreadWorker('../testability/pages/workers/WorkerTaskGroup.ets');
          work.onmessage = (e: MessageEvents): void => {
            console.info('======e.message', e.data)
            try {
              let s: string[] = []
              s[0].split('')[1].toString()
            } catch (e) {
              count2++
              work.terminate()
            }
          }
          work.postMessage('1')
        })
      }

      while (count2 < 10) {
        await sleep(100)
      }
      await sleep(100)
      expect(10).assertEqual(count)
      expect(10).assertEqual(count2)
      done()
    })

    /**
     * @tc.number TASKPOOL_TASK_ERROR_SUCCESS_TEST_2700
     * @tc.name taskPoolTaskErrorSuccessTest1027
     * @tc.desc test task-二级-error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolTaskGroupExecute1027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      
      let task: taskpool.Task = new taskpool.Task(printArgs1, 1);
      let task2: taskpool.Task = new taskpool.Task(printArgs11, 1);
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(task);
      taskGroup.addTask(task2);
      let count: number = 0
      let count2: number = 0


      for (let i = 0; i < 10; i++) {
        taskpool.execute(taskGroup).then(() => {
          console.info('======1')
          count ++
        }).catch((e: BusinessError) => {
          expect(e.message).assertContain('Cannot read property split of undefined')
          count2 ++
          console.info('======2', count2, e.message)
        })
      }

      while (count2 < 10) {
        await sleep(100)
      }

      expect(0).assertEqual(count)
      expect(10).assertEqual(count2)
      done()
    })

    /**
     * @tc.number TASKPOOL_TASK_ERROR_SUCCESS_TEST_2800
     * @tc.name taskPoolTaskErrorSuccessTest1028
     * @tc.desc test task-二级-error-then
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolTaskGroupExecute1028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      
      let task: taskpool.Task = new taskpool.Task(printArgs1, 1);
      let task2: taskpool.Task = new taskpool.Task(printArgs12, 1);
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(task);
      taskGroup.addTask(task2);
      let count: number = 0
      let count2: number = 0


      for (let i = 0; i < 10; i++) {
        taskpool.execute(taskGroup).then(() => {
          console.info('======1')
          count ++
        }).catch((e: BusinessError) => {
          expect(e.message).assertContain('Cannot read property split of undefined')
          count2 ++
          console.info('======2', count2, e.message)
        })
      }

      while (count2 < 10) {
        await sleep(100)
      }

      expect(0).assertEqual(count)
      expect(10).assertEqual(count2)
      done()
    })

    /**
     * @tc.number TASKPOOL_TASK_ERROR_SUCCESS_TEST_2900
     * @tc.name taskPoolTaskErrorSuccessTest1029
     * @tc.desc test task-二级-error-catch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolTaskGroupExecute1029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      
      let task: taskpool.Task = new taskpool.Task(printArgs1, 1);
      let task2: taskpool.Task = new taskpool.Task(printArgs13, 1);
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(task);
      taskGroup.addTask(task2);
      let count: number = 0
      let count2: number = 0


      for (let i = 0; i < 10; i++) {
        taskpool.execute(taskGroup).then(() => {
          console.info('======1')
          count ++
        }).catch((e: BusinessError) => {
          expect(e.message).assertContain('Cannot read property split of undefined')
          count2 ++
          console.info('======2', count2, e.message)
        })
      }

      while (count2 < 10) {
        await sleep(100)
      }

      expect(0).assertEqual(count)
      expect(10).assertEqual(count2)
      done()
    })

    /**
     * @tc.number TASKPOOL_TASK_ERROR_SUCCESS_TEST_3000
     * @tc.name taskPoolTaskErrorSuccessTest1030
     * @tc.desc test task-二级-error-catch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolTaskGroupExecute1030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      
      let task: taskpool.Task = new taskpool.Task(printArgs1, 1);
      let task2: taskpool.Task = new taskpool.Task(printArgs14, 1);
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(task);
      taskGroup.addTask(task2);
      let count: number = 0
      let count2: number = 0


      for (let i = 0; i < 10; i++) {
        taskpool.execute(taskGroup).then(() => {
          console.info('======1')
          count ++
        }).catch((e: BusinessError) => {
          expect(e.message).assertContain('Cannot read property split of undefined')
          count2 ++
          console.info('======2', count2, e.message)
        })
      }

      while (count2 < 10) {
        await sleep(100)
      }

      expect(0).assertEqual(count)
      expect(10).assertEqual(count2)
      done()
    })

  })
}