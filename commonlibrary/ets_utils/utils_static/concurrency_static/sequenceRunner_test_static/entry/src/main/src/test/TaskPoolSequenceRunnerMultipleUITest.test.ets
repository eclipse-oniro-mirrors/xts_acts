/*
* Copyright (C) 2025 HiHope Open Source Organization.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '../../../hypium/index';

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

export default function taskPoolSequenceRunnerMultipleUITest() {
  describe('TaskPoolSequenceRunnerMultipleUITest', (): void => {
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
    afterEach((): void => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll((): void => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.number TASKPOOL_SEQUENCE_RUNNER_MULTIPLE_UI_TEST_0100
     * @tc.name taskPoolSequenceRunnerMultipleUITest0100
     * @tc.desc test task ui
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolSequenceRunnerMultipleUITest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      const caseName = 'taskPoolSequenceRunnerMultipleUITest0100'
      console.info(`${caseName} test start`)

      let arr1: Array<taskpool.Task> = []
      for (let i = 0; i < 10; i++) {
        let task1: taskpool.Task = new taskpool.Task(multipleUITask1);
        arr1.push(task1)
      }

      let arr2: Array<taskpool.Task> = []
      for (let i = 0; i < 10; i++) {
        let task1: taskpool.Task = new taskpool.Task(multipleUITask2);
        arr2.push(task1)
      }

      let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();

      let count1: number = 0
      let count2: number = 0

      for (let i = 0; i < 10; i++) {
        runner.execute(arr1[i]).then((): void => {
          console.info('=======', count1)
          count1++
        }).catch((e: Any) => {
          console.info('=======error', JSON.stringify(e))
          expect(true).assertFalse()
        })

        runner.execute(arr2[i]).then((): void => {
          console.info('=======', count2)
          count2++
        }).catch((e: Any) => {
          console.info('=======error', JSON.stringify(e))
          expect(true).assertFalse()
        })
      }

      while (count2 < 10 || count1 < 10) {
        await sleep(100)
      }

      expect(10).assertEqual(count2)
      expect(10).assertEqual(count1)
      console.info(`${caseName} test end`)
    })

    /**
     * @tc.number TASKPOOL_SEQUENCE_RUNNER_MULTIPLE_UI_TEST_0200
     * @tc.name taskPoolSequenceRunnerMultipleUITest0200
     * @tc.desc test task ui
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolSequenceRunnerMultipleUITest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      const caseName = 'taskPoolSequenceRunnerMultipleUITest0200'
      console.info(`${caseName} test start`)

      let arr1: Array<taskpool.Task> = []
      for (let i = 0; i < 10; i++) {
        let task1: taskpool.Task = new taskpool.Task(multipleUITask3);
        arr1.push(task1)
      }

      let arr2: Array<taskpool.Task> = []
      for (let i = 0; i < 10; i++) {
        let task1: taskpool.Task = new taskpool.Task(multipleUITask4);
        arr2.push(task1)
      }
      let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      let count: number = 0

      for (let i = 0; i < 10; i++) {
        runner.execute(arr1[i]).then((): void => {
          console.info('=======', count)
          count++
        }).catch((e: Any) => {
          console.info('=======error', JSON.stringify(e))
          expect(true).assertFalse()
        })
        runner.execute(arr2[i]).then((): void => {
          console.info('=======', count)
          count++
        }).catch((e: Any) => {
          console.info('=======error', JSON.stringify(e))
          expect(true).assertFalse()
        })
      }

      while (count < 20) {
        await sleep(100)
      }

      expect(20).assertEqual(count)
      console.info(`${caseName} test end`)
    })


  })
}