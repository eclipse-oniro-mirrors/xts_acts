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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../hypium/index';
import {
  printArgs1,
  printArgs2,
  printArgs3,
  printArgs4,
  printArgs5,
  printArgs6,
  printArgs7,
  printArgs8
} from '../testability/pages/TaskMethodTest';
import { Count1, Count2, Count3, Count4 } from '../testability/pages/DataFlg';
import { BusinessError } from '@ohos.base';
import { sleep } from '../testability/pages/Utils';


export default function TaskPoolSequenceRunnerTest() {
  describe('TaskPoolSequenceRunnerTest', (): void => {
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
     * @tc.number SUB_TASKPOOL_SEQUENCERUNNER_TEST_0100
     * @tc.name TestSequenceRunner0100
     * @tc.desc Testing Task
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TestSequenceRunner0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let sequenceRunner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      Count1.count = 0
      Count2.count = 0

      for (let i = 0; i < 10; i++) {
        let task1: taskpool.Task = new taskpool.Task(printArgs1, Count1.count);
        let task2: taskpool.Task = new taskpool.Task(printArgs2, Count2.count);
        await sleep(100)
        sequenceRunner.execute(task1).then((): void => {
          Count1.count++
          console.log('count1.count' + Count1.count)
        }).catch((err: Object | null | undefined) => {
          Count1.count++
          console.error('=======', JSON.stringify(err))
        })
        sequenceRunner.execute(task2).then((): void => {
          Count2.count++
          console.log('count1.count' + Count2.count)
        }).catch((err: Object | null | undefined) => {
          Count2.count++
          console.error('=======', JSON.stringify(err))
        })
      }

      while (Count1.count < 10 || Count2.count < 10) {
        await sleep(500)
      }
      expect('10').assertEqual(string(Count1.count))
      expect('10').assertEqual(string(Count2.count))
      Count1.count = 0
      Count2.count = 0
    })

    /**
     * @tc.number SUB_TASKPOOL_SEQUENCERUNNER_TEST_0200
     * @tc.name TestSequenceRunner0200
     * @tc.desc Testing Task
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TestSequenceRunner0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let sequenceRunner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      Count3.count = 0
      Count4.count = 0
      let count1: number = 0
      let count2: number = 0

      for (let i = 0; i < 10; i++) {
        await sleep(100)
        let task1: taskpool.Task = new taskpool.Task(printArgs3, Count3.count);
        let task2: taskpool.Task = new taskpool.Task(printArgs4, Count4.count);
        try {
          sequenceRunner.execute(task1).then((): void => {
            Count3.count++
            console.info('======', Count3.count)
          }).catch((err: Object | null | undefined) => {
            count1++
            console.error(`error message error: error}`)
          })
        } catch (e) {
          e = e as BusinessError;
          console.error(`error message e: e`)
        }
        try {
          sequenceRunner.execute(task2).then((): void => {
            Count4.count++
            console.info('======', Count4.count)
          }).catch((err: Object | null | undefined) => {
            // expect(error.message).assertContain('Cannot read property split of undefined')
            count2++
            console.error(`error message error: error}`)
          })
        } catch (e) {
          e = e as BusinessError;
          console.error(`error message e: e`)
        }
      }

      while (count1 < 10 || count2 < 10) {
        await sleep(1000)
      }

      expect('0').assertEqual(string(Count3.count))
      expect('0').assertEqual(string(Count4.count))
      expect('10').assertEqual(string(count1))
      expect('10').assertEqual(string(count2))
      Count3.count = 0
      Count4.count = 0
    })

    /**
     * @tc.number SUB_TASKPOOL_SEQUENCERUNNER_TEST_0500
     * @tc.name TestSequenceRunner0500
     * @tc.desc Testing Task
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TestSequenceRunner0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let sequenceRunner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      let name1: String = ''
      let name2: String = ''
      Count1.count = 0
      Count2.count = 0

      for (let i = 0; i < 10; i++) {
        await sleep(100)
        let task1: taskpool.Task = new taskpool.Task('Task1', printArgs1, 1.0);
        let task2: taskpool.Task = new taskpool.Task('Task2', printArgs2, 1.0);
        sequenceRunner.execute(task1).then((): void => {
          Count1.count++
          name1 = task1.name
          console.log('count1:' + Count1.count)
        })
        sequenceRunner.execute(task2).then((): void => {
          Count2.count++
          name2 = task2.name
          console.log('count2:' + Count2.count)
        })
      }

      while (Count1.count < 10 || Count2.count < 10) {
        await sleep(1000)
      }

      expect('10').assertEqual(string(Count1.count))
      expect('Task1').assertEqual(name1)
      expect('10').assertEqual(string(Count2.count))
      expect('Task2').assertEqual(name2)
      Count1.count = 0
      Count2.count = 0
    })

    /**
     * @tc.number SUB_TASKPOOL_SEQUENCERUNNER_TEST_0600
     * @tc.name TestSequenceRunner0600
     * @tc.desc Testing Task
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TestSequenceRunner0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let sequenceRunner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      Count1.count = 0
      Count2.count = 0

      for (let i = 0; i < 10; i++) {
        let task1: taskpool.Task = new taskpool.Task(printArgs5, 1.0);
        let task2: taskpool.Task = new taskpool.Task(printArgs6, 1.0);

        sequenceRunner.execute(task1).then((): void => {
        }).catch((err: Object | null | undefined) => {
          Count1.count++
          console.log('count1:' + Count1.count)
          console.log('error message1' + err)
        })
        sequenceRunner.execute(task2).then((): void => {
        }).catch((err: Object | null | undefined) => {
          Count2.count++
          console.log('count2:' + Count2.count)
          console.log('error message2' + err)
        })
        taskpool.cancel(task1)
        taskpool.cancel(task2)
      }

      while (Count1.count < 10 || Count2.count < 10) {
        await sleep(1000)
      }

      expect('10').assertEqual(string(Count1.count))
      expect('10').assertEqual(string(Count2.count))
      Count1.count = 0
      Count2.count = 0
    })

    /**
     * @tc.number SUB_TASKPOOL_SEQUENCERUNNER_TEST_0900
     * @tc.name sequenceRunner0900
     * @tc.desc Testing Task
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('sequenceRunner0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let sequenceRunner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      Count1.count = 0
      Count2.count = 0
      let count1: number = 0
      let count2: number = 0

      for (let i = 0; i < 10; i++) {
        let task1: taskpool.Task = new taskpool.Task(printArgs1, Count1.count)
        let task2: taskpool.Task = new taskpool.Task(printArgs2, Count2.count)
        task1.onEnqueued((): void => {
          count1++
          console.info('taskpool: onEnqueued' + count1)
        });
        sequenceRunner.execute(task1).then((): void => {
          Count1.count++
          console.log('Count1.count++:' + Count1.count++)
        })

        task2.onEnqueued((): void => {
          count2++
          console.info('taskpool: onEnqueued' + count2)
        });
        sequenceRunner.execute(task2).then((): void => {
          Count2.count++
          console.log('Count2.count++:' + Count2.count++)
        })
      }

      while (count1 < 10 || count2 < 10) {
        await sleep(1000)
      }

      expect('10').assertEqual(string(count1))
      expect('10').assertEqual(string(count2))
      Count1.count = 0
      Count2.count = 0
    })


    /**
     * @tc.number SUB_TASKPOOL_SEQUENCERUNNER_TEST_1000
     * @tc.name sequenceRunner1000
     * @tc.desc Testing Task
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('sequenceRunner1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let sequenceRunner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      Count3.count = 0
      Count4.count = 0
      let count1: number = 0
      let count2: number = 0

      for (let i = 0; i < 10; i++) {
        let task1: taskpool.Task = new taskpool.Task(printArgs3, Count3.count)
        let task2: taskpool.Task = new taskpool.Task(printArgs4, Count4.count)
        task1.onEnqueued((): void => {
          Count1.count++
          console.info('taskpool: onEnqueued' + count1)
        });
        sequenceRunner.execute(task1).then((): void => {
        }).catch((error: Object | null | undefined) => {
          count1++
          console.log('Count1.count:' + Count1.count)
          // expect(error.message).assertContain('Cannot read property split of undefined')
        })

        task2.onEnqueued((): void => {
          Count2.count++
          console.info('taskpool: onEnqueued' + count2)
        });
        sequenceRunner.execute(task2).then((): void => {
        }).catch((error: Object | null | undefined) => {
          count2++
          console.log('Count2.count:' + Count2.count)
          // expect(error.message).assertContain('Cannot read property split of undefined')
        })
      }

      while (count1 < 10 || count2 < 10 || Count1.count < 10 || Count2.count < 10) {
        await sleep(1000)
      }

      expect('10').assertEqual(string(count1))
      expect('10').assertEqual(string(count2))
      expect('10').assertEqual(string(Count1.count))
      expect('10').assertEqual(string(Count2.count))
      Count3.count = 0
      Count4.count = 0
    })


    /**
     * @tc.number SUB_TASKPOOL_SEQUENCERUNNER_TEST_1100
     * @tc.name sequenceRunner1100
     * @tc.desc Testing Task onStartExecution
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('sequenceRunner1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let sequenceRunner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      let count1: number = 0
      let count2: number = 0
      Count1.count = 0
      Count2.count = 0

      for (let i = 0; i < 10; i++) {
        let task1: taskpool.Task = new taskpool.Task(printArgs1, Count1.count)
        let task2: taskpool.Task = new taskpool.Task(printArgs2, Count2.count)
        task1.onStartExecution((): void => {
          count1++
          console.info('taskpool: onStartExecution')
        });
        sequenceRunner.execute(task1).then((): void => {
          console.log('Count3.count:' + Count3.count)
        })

        task2.onStartExecution((): void => {
          count2++
          console.info('taskpool: onStartExecution' + count2)
        });
        sequenceRunner.execute(task2).then((): void => {
          console.log('Count4.count:' + Count4.count)
        })
      }

      while (count1 < 10 || count2 < 10) {
        await sleep(1000)
      }

      expect('10').assertEqual(string(count1))
      expect('10').assertEqual(string(count2))
      expect('0').assertEqual(string(Count1.count))
      expect('0').assertEqual(string(Count2.count))
    })

    /**
     * @tc.number SUB_TASKPOOL_SEQUENCERUNNER_TEST_1300
     * @tc.name sequenceRunner1300
     * @tc.desc Testing Task  onExecutionFailed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('sequenceRunner1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let sequenceRunner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      let count1: number = 0
      let count2: number = 0

      for (let i = 0; i < 10; i++) {
        let task1: taskpool.Task = new taskpool.Task(printArgs3, 1)
        let task2: taskpool.Task = new taskpool.Task(printArgs4, 1)
        task1.onExecutionFailed((e: Error) => {
          count1++
          console.info('task1.count1:' + count1)
          console.info('taskpool: onExecutionFailed error is ' + e);
        })
        sequenceRunner.execute(task1).then((): void => {
          console.info('SequenceRunner: execute task success')
        })

        task2.onExecutionFailed((e: Error) => {
          count2++
          console.info('task2.count2:' + count2)
          console.info('taskpool: onExecutionFailed error is ' + e);
        })
        sequenceRunner.execute(task2).then((): void => {
          console.info('SequenceRunner: execute task success')
        })
      }

      while (count1 < 10 || count2 < 10) {
        await sleep(1000)
      }

      expect('10').assertEqual(string(count1))
      expect('10').assertEqual(string(count2))
    })

    /**
     * @tc.number SUB_TASKPOOL_SEQUENCERUNNER_TEST_1900
     * @tc.name sequenceRunner1900
     * @tc.desc Testing Task  idDone
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('sequenceRunner1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let sequenceRunner: taskpool.SequenceRunner = new taskpool.SequenceRunner();

      for (let i = 0; i < 10; i++) {
        let task1: taskpool.Task = new taskpool.Task(printArgs1, 1.0);
        sequenceRunner.execute(task1)
        task1.isDone()
        while (!task1.isDone()) {
          await sleep(100)
        }
        expect(task1.isDone()).assertTrue()

        let task2: taskpool.Task = new taskpool.Task(printArgs2, 1.0);
        sequenceRunner.execute(task2)
        task2.isDone()
        while (!task2.isDone()) {
          await sleep(100)
        }
        expect(task2.isDone()).assertTrue()
      }

    })

    /**
     * @tc.number SUB_TASKPOOL_SEQUENCERUNNER_TEST_2000
     * @tc.name sequenceRunner2000
     * @tc.desc Testing Task  idDone
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('sequenceRunner2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let sequenceRunner: taskpool.SequenceRunner = new taskpool.SequenceRunner();

      for (let i = 0; i < 10; i++) {
        let task1: taskpool.Task = new taskpool.Task(printArgs5, 1.0);
        let task2: taskpool.Task = new taskpool.Task(printArgs6, 1.0);
        sequenceRunner.execute(task1)
        sequenceRunner.execute(task2)
        expect(task1.isDone()).assertFalse()
        expect(task2.isDone()).assertFalse()
      }
    })

  })
}