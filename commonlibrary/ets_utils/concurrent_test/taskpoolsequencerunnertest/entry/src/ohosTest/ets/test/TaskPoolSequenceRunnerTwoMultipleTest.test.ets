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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium';
import { ErrorEvent, MessageEvents, taskpool, worker } from '@kit.ArkTS';
import {
  printArgs1,
} from '../testability/pages/TaskMethodTest';

import { BusinessError } from '@kit.BasicServicesKit';

import { sleep, testUI, testUI1 } from '../testability/pages/Utils';

declare class ArkTools {
  static forceFullGC(): void;
}

export default function taskPoolSequenceRunnerTwoMultipleTest() {
  describe('TaskPoolSequenceRunnerTwoMultipleTest', () => {
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
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.number TASKPOOL_SEQUENCE_RUNNER_MULTIPLE_TEST_0100
     * @tc.name taskPoolSequenceRunnerMultipleTest0100
     * @tc.desc test task ui
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolSequenceRunnerMultipleTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      const caseName = 'taskPoolSequenceRunnerMultipleTest0100'
      console.info(`${caseName} test start`)
      let arr: Array<taskpool.Task> = []
      for (let i = 0; i < 100; i++) {
        let task1: taskpool.Task = new taskpool.Task(printArgs1);
        arr.push(task1)
      }

      let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      let count: number = 0

      for (let i = 0; i < 100; i++) {
        if (i == 30 || i == 50 || i == 80) {
          ArkTools.forceFullGC()
        }
        runner.execute(arr[i]).then(() => {
          console.info('=======', count)
          count++
        }).catch((e: BusinessError) => {
          console.info('=======error', JSON.stringify(e.message))
          expect(true).assertFalse()
        })
      }

      while (count < 100) {
        await sleep(100)
      }

      expect(100).assertEqual(count)
      console.info(`${caseName} test end`)
      done()
    })

    /**
     * @tc.number TASKPOOL_SEQUENCE_RUNNER_MULTIPLE_TEST_0200
     * @tc.name taskPoolSequenceRunnerMultipleTest0200
     * @tc.desc test task ui
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolSequenceRunnerMultipleTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      const caseName = 'taskPoolSequenceRunnerMultipleTest0200'
      console.info(`${caseName} test start`)
      let arr: Array<taskpool.Task> = []
      for (let i = 0; i < 4; i++) {
        let task1: taskpool.Task = new taskpool.Task(printArgs1);
        arr.push(task1)
      }

      let runner1: taskpool.SequenceRunner = new taskpool.SequenceRunner(taskpool.Priority.HIGH);
      let runner2: taskpool.SequenceRunner = new taskpool.SequenceRunner(taskpool.Priority.LOW);
      let runner3: taskpool.SequenceRunner = new taskpool.SequenceRunner(taskpool.Priority.IDLE);
      let runner4: taskpool.SequenceRunner = new taskpool.SequenceRunner(taskpool.Priority.MEDIUM);

      let count: number = 0
      let runner: Array<taskpool.SequenceRunner> = [
        runner1,
        runner2,
        runner3,
        runner4,
      ]
      for (let i = 0; i < 4; i++) {
        runner[i].execute(arr[i]).then(() => {
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