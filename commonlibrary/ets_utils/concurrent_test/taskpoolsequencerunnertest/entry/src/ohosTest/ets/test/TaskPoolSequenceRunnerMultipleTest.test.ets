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


export default function taskPoolSequenceRunnerMultipleTest() {
  describe('TaskPoolSequenceRunnerMultipleTest', () => {
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
     * @tc.desc test worker error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('taskPoolSequenceRunnerMultipleTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.

      const caseName = 'taskPoolSequenceRunnerMultipleTest0100'
      console.info(`${caseName} test start`)
      let task1: taskpool.Task = new taskpool.Task(multipleTask1);
      let task2: taskpool.Task = new taskpool.Task(multipleTask1);
      let task3: taskpool.Task = new taskpool.Task(multipleTask1);
      let task4: taskpool.Task = new taskpool.Task(multipleTask1);
      let task5: taskpool.Task = new taskpool.Task(multipleTask1);
      let task6: taskpool.Task = new taskpool.Task(multipleTask1);
      let task7: taskpool.Task = new taskpool.Task(multipleTask1);
      let task8: taskpool.Task = new taskpool.Task(multipleTask1);
      let task9: taskpool.Task = new taskpool.Task(multipleTask1);
      let task10: taskpool.Task = new taskpool.Task(multipleTask1);

      let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      let arr: Array<taskpool.Task> = [
        task1,
        task2,
        task3,
        task4,
        task5,
        task6,
        task7,
        task8,
        task9,
        task10,
      ]

      let count: number = 0

      setTimeout(() => {
        ArkTools.forceFullGC()
      }, 10)

      for (let i = 0; i < 10; i++) {
        runner.execute(arr[i]).then(() => {
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
     * @tc.number TASKPOOL_SEQUENCE_RUNNER_MULTIPLE_TEST_0200
     * @tc.name taskPoolSequenceRunnerMultipleTest0200
     * @tc.desc test worker error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('taskPoolSequenceRunnerMultipleTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.

      const caseName = 'taskPoolSequenceRunnerMultipleTest0200'
      console.info(`${caseName} test start`)
      let task1: taskpool.Task = new taskpool.Task(multipleTask2);
      let task2: taskpool.Task = new taskpool.Task(multipleTask2);
      let task3: taskpool.Task = new taskpool.Task(multipleTask2);
      let task4: taskpool.Task = new taskpool.Task(multipleTask2);
      let task5: taskpool.Task = new taskpool.Task(multipleTask2);
      let task6: taskpool.Task = new taskpool.Task(multipleTask2);
      let task7: taskpool.Task = new taskpool.Task(multipleTask2);
      let task8: taskpool.Task = new taskpool.Task(multipleTask2);
      let task9: taskpool.Task = new taskpool.Task(multipleTask2);
      let task10: taskpool.Task = new taskpool.Task(multipleTask2);

      let count: number = 0

      let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      let arr: Array<taskpool.Task> = [
        task1,
        task2,
        task3,
        task4,
        task5,
        task6,
        task7,
        task8,
        task9,
        task10,
      ]

      setTimeout(() => {
        ArkTools.forceFullGC()
      }, 10)

      for (let i = 0; i < 10; i++) {
        runner.execute(arr[i]).then(() => {
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
     * @tc.number TASKPOOL_SEQUENCE_RUNNER_MULTIPLE_TEST_0300
     * @tc.name taskPoolSequenceRunnerMultipleTest0300
     * @tc.desc test worker error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('taskPoolSequenceRunnerMultipleTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.

      const caseName = 'taskPoolSequenceRunnerMultipleTest0300'
      console.info(`${caseName} test start`)
      let task1: taskpool.Task = new taskpool.Task(multipleTask3);
      let task2: taskpool.Task = new taskpool.Task(multipleTask3);
      let task3: taskpool.Task = new taskpool.Task(multipleTask3);
      let task4: taskpool.Task = new taskpool.Task(multipleTask3);
      let task5: taskpool.Task = new taskpool.Task(multipleTask3);
      let task6: taskpool.Task = new taskpool.Task(multipleTask3);
      let task7: taskpool.Task = new taskpool.Task(multipleTask3);
      let task8: taskpool.Task = new taskpool.Task(multipleTask3);
      let task9: taskpool.Task = new taskpool.Task(multipleTask3);
      let task10: taskpool.Task = new taskpool.Task(multipleTask3);

      let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      let arr: Array<taskpool.Task> = [
        task1,
        task2,
        task3,
        task4,
        task5,
        task6,
        task7,
        task8,
        task9,
        task10,
      ]

      let count: number = 0

      setTimeout(() => {
        ArkTools.forceFullGC()
      }, 10)

      for (let i = 0; i < 10; i++) {
        runner.execute(arr[i]).then(() => {
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
     * @tc.number TASKPOOL_SEQUENCE_RUNNER_MULTIPLE_TEST_0400
     * @tc.name taskPoolSequenceRunnerMultipleTest0400
     * @tc.desc test worker error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('taskPoolSequenceRunnerMultipleTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.

      const caseName = 'taskPoolSequenceRunnerMultipleTest0400'
      console.info(`${caseName} test start`)
      let task1: taskpool.Task = new taskpool.Task(multipleTask4);
      let task2: taskpool.Task = new taskpool.Task(multipleTask4);
      let task3: taskpool.Task = new taskpool.Task(multipleTask4);
      let task4: taskpool.Task = new taskpool.Task(multipleTask4);
      let task5: taskpool.Task = new taskpool.Task(multipleTask4);
      let task6: taskpool.Task = new taskpool.Task(multipleTask4);
      let task7: taskpool.Task = new taskpool.Task(multipleTask4);
      let task8: taskpool.Task = new taskpool.Task(multipleTask4);
      let task9: taskpool.Task = new taskpool.Task(multipleTask4);
      let task10: taskpool.Task = new taskpool.Task(multipleTask4);

      let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      let arr: Array<taskpool.Task> = [
        task1,
        task2,
        task3,
        task4,
        task5,
        task6,
        task7,
        task8,
        task9,
        task10,
      ]

      let count: number = 0
      setTimeout(() => {
        ArkTools.forceFullGC()
      }, 10)

      for (let i = 0; i < 10; i++) {
        runner.execute(arr[i]).then(() => {
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
     * @tc.number TASKPOOL_SEQUENCE_RUNNER_MULTIPLE_TEST_0500
     * @tc.name taskPoolSequenceRunnerMultipleTest0500
     * @tc.desc test worker error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('taskPoolSequenceRunnerMultipleTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      const caseName = 'taskPoolSequenceRunnerMultipleTest0500'
      console.info(`${caseName} test start`)
      let task1: taskpool.Task = new taskpool.Task(multipleTask5);
      let task2: taskpool.Task = new taskpool.Task(multipleTask5);
      let task3: taskpool.Task = new taskpool.Task(multipleTask5);
      let task4: taskpool.Task = new taskpool.Task(multipleTask5);
      let task5: taskpool.Task = new taskpool.Task(multipleTask5);
      let task6: taskpool.Task = new taskpool.Task(multipleTask5);
      let task7: taskpool.Task = new taskpool.Task(multipleTask5);
      let task8: taskpool.Task = new taskpool.Task(multipleTask5);
      let task9: taskpool.Task = new taskpool.Task(multipleTask5);
      let task10: taskpool.Task = new taskpool.Task(multipleTask5);

      let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      let arr: Array<taskpool.Task> = [
        task1,
        task2,
        task3,
        task4,
        task5,
        task6,
        task7,
        task8,
        task9,
        task10,
      ]

      let count: number = 0

      setTimeout(() => {
        ArkTools.forceFullGC()
      }, 10)

      for (let i = 0; i < 10; i++) {
        runner.execute(arr[i]).then(() => {
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