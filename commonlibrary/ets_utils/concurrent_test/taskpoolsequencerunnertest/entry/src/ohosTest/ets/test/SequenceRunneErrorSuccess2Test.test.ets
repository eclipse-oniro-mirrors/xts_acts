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
  printArgs10,
  printArgs11,
  printArgs12,
  printArgs13,
  printArgs14,
} from '../testability/pages/TaskMethodTest';

import { BusinessError } from '@kit.BasicServicesKit';
import { sleep, WorkThread } from '../testability/pages/Utils';


export default function SequenceRunnerErrorSuccess2Test() {
  describe('SequenceRunnerErrorSuccess2Test', () => {
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
     * @tc.number SUB_SEQUENCERUNNER_ERROR_SUCCESS_TEST_0200
     * @tc.name TestSequenceRunnerErrorSuccess0200
     * @tc.desc Testing Task worker-error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TestSequenceRunnerErrorSuccess0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let sequenceRunner: taskpool.SequenceRunner = new taskpool.SequenceRunner();

      let count1: number = 0
      let count2: number = 0

      for (let i = 0; i < 10; i++) {
        let task1: taskpool.Task = new taskpool.Task(printArgs1, 1)
        let task2: taskpool.Task = new taskpool.Task(printArgs10, 1)

        try {
          sequenceRunner.execute(task1).then(() => {
            count1++
          })
        } catch (e) {
          console.error(`taskpool: error code: ${e.code}, info: ${e.message}`);
        }

        try {
          sequenceRunner.execute(task2).then(() => {
            console.info("SequenceRunner: execute task2 success")
            let work = new worker.ThreadWorker('../testability/pages/workers/WorkerSequenceRunner');
            work.onerror = (e: ErrorEvent): void => {
              console.info('======e.message', e.message)
              count2++
              work.terminate()
            }
            work.postMessage('2')
          })
        } catch (e) {
          console.error(`taskpool: error code: ${e.code}, info: ${e.message}`);
        }
      }

      while (count1 < 10 || count2 < 10) {
        await sleep(500)
      }
      await sleep(500)
      expect(10).assertEqual(count1)
      expect(10).assertEqual(count2)
      done()
    })


    /**
     * @tc.number SUB_SEQUENCERUNNER_ERROR_SUCCESS_TEST_0300
     * @tc.name SequenceRunnerErrorSuccess0300
     * @tc.desc Testing Task worker-error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SequenceRunnerErrorSuccess0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let sequenceRunner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      let count1: number = 0
      let count2: number = 0

      for (let i = 0; i < 10; i++) {
        let task1: taskpool.Task = new taskpool.Task(printArgs1, 1)
        let task2: taskpool.Task = new taskpool.Task(printArgs10, 1)

        try {
          sequenceRunner.execute(task1).then(() => {
            count1++
          })
        } catch (e) {
          console.error(`taskpool: error code: ${e.code}, info: ${e.message}`);
        }

        try {
          sequenceRunner.execute(task2).then(() => {
            console.info("SequenceRunner: execute task2 success")
            let work = new worker.ThreadWorker('../testability/pages/workers/WorkerSequenceRunner');
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
        } catch (e) {
          console.error(`taskpool: error code: ${e.code}, info: ${e.message}`);
        }

      }
      while (count1 < 10 || count2 < 10) {
        await sleep(500)
      }
      await sleep(500)
      expect(10).assertEqual(count1)
      expect(10).assertEqual(count2)
      done()
    })


    /**
     * @tc.number SUB_SEQUENCERUNNER_ERROR_SUCCESS_TEST_0400
     * @tc.name SequenceRunnerErrorSuccess0400
     * @tc.desc Testing Task task-error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SequenceRunnerErrorSuccess0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let sequenceRunner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      let count1: number = 0
      let count2: number = 0

      for (let i = 0; i < 10; i++) {
        let task1: taskpool.Task = new taskpool.Task(printArgs1, 1)
        let task2: taskpool.Task = new taskpool.Task(printArgs11, 1)

        try {
          sequenceRunner.execute(task1).then(() => {
            count1++
            console.info("SequenceRunner: execute task1 success" + count1)
          })
        } catch (e) {
          console.error(`taskpool: error code: ${e.code}, info: ${e.message}`);
        }

        try {
          sequenceRunner.execute(task2).then(() => {
            console.info("SequenceRunner: execute task1 success")
          }).catch((e: BusinessError) => {
            count2++
            expect(e.message).assertContain('Cannot read property split of undefined')
            console.error(`taskpool: error code: ${e.code}, info: ${e.message}`);
          })
        } catch (e) {
          console.error(`taskpool: error code: ${e.code}, info: ${e.message}`);
        }
      }

      while (count1 < 10 || count2 < 10) {
        await sleep(500)
      }

      expect(10).assertEqual(count1)
      expect(10).assertEqual(count2)
      done()
    })


    /**
     * @tc.number SUB_SEQUENCERUNNER_ERROR_SUCCESS_TEST_0500
     * @tc.name SequenceRunnerErrorSuccess0500
     * @tc.desc Testing Task task-error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SequenceRunnerErrorSuccess0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let sequenceRunner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      let count1: number = 0
      let count2: number = 0

      for (let i = 0; i < 10; i++) {
        let task1: taskpool.Task = new taskpool.Task(printArgs1, 1)
        let task2: taskpool.Task = new taskpool.Task(printArgs12, 1)

        try {
          sequenceRunner.execute(task1).then(() => {
            count1++
            console.info("SequenceRunner: execute task1 success" + count1)
          })
        } catch (e) {
          console.error(`taskpool: error code: ${e.code}, info: ${e.message}`);
        }

        try {
          sequenceRunner.execute(task2).then(() => {
            count2++
            console.info("SequenceRunner: execute task1 success")
          }).catch((e: BusinessError) => {
            expect(e.message).assertContain('Cannot read property split of undefined')
            console.error(`taskpool: error code: ${e.code}, info: ${e.message}`);
          })
        } catch (e) {
          console.error(`taskpool: error code: ${e.code}, info: ${e.message}`);
        }
      }

      while (count1 < 10) {
        await sleep(500)
      }

      expect(10).assertEqual(count1)
      expect(0).assertEqual(count2)
      done()
    })


    /**
     * @tc.number SUB_SEQUENCERUNNER_ERROR_SUCCESS_TEST_0600
     * @tc.name SequenceRunnerErrorSuccess0600
     * @tc.desc Testing Task task-error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SequenceRunnerErrorSuccess0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let sequenceRunner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      let count1: number = 0
      let count2: number = 0

      for (let i = 0; i < 10; i++) {
        let task1: taskpool.Task = new taskpool.Task(printArgs1, 1)
        let task2: taskpool.Task = new taskpool.Task(printArgs13, 1)

        try {
          sequenceRunner.execute(task1).then(() => {
            count1++
            console.info("SequenceRunner: execute task1 success" + count1)
          })
        } catch (e) {
          console.error(`taskpool: error code: ${e.code}, info: ${e.message}`);
        }

        try {
          sequenceRunner.execute(task2).then(() => {
            console.info("SequenceRunner: execute task1 success")
          }).catch((e: BusinessError) => {
            count2++
            expect(e.message).assertContain('Cannot read property split of undefined')
            console.error(`taskpool: error code: ${e.code}, info: ${e.message}`);
          })
        } catch (e) {
          console.error(`taskpool: error code: ${e.code}, info: ${e.message}`);
        }
      }

      while (count1 < 10 || count2 < 10) {
        await sleep(500)
      }

      expect(10).assertEqual(count1)
      expect(10).assertEqual(count2)
      done()
    })


    /**
     * @tc.number SUB_SEQUENCERUNNER_ERROR_SUCCESS_TEST_0700
     * @tc.name SequenceRunnerErrorSuccess0700
     * @tc.desc Testing Task task-error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SequenceRunnerErrorSuccess0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let sequenceRunner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      let count1: number = 0
      let count2: number = 0

      for (let i = 0; i < 10; i++) {
        let task1: taskpool.Task = new taskpool.Task(printArgs1, 1)
        let task2: taskpool.Task = new taskpool.Task(printArgs14, 1)

        try {
          sequenceRunner.execute(task1).then(() => {
            count1++
            console.info("SequenceRunner: execute task1 success" + count1)
          })
        } catch (e) {
          console.error(`taskpool: error code: ${e.code}, info: ${e.message}`);
        }

        try {
          sequenceRunner.execute(task2).then(() => {
            console.info("SequenceRunner: execute task2 success")
          }).catch((e: BusinessError) => {
            count2++
            expect(e.message).assertContain('Cannot read property split of undefined')
            console.error(`taskpool: error code: ${e.code}, info: ${e.message}` + count2);
          })
        } catch (e) {
          console.error(`taskpool: error code: ${e.code}, info: ${e.message}`);
        }
      }

      while (count1 < 10 || count2 < 10) {
        await sleep(500)
      }

      expect(10).assertEqual(count1)
      expect(10).assertEqual(count2)
      done()
    })
  })
}