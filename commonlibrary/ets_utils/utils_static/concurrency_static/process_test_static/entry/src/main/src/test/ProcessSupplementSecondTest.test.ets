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
import {
  printArgs4,
  printArgs5,
  printArgs6,
  printArgs7,
  printArgs8,
  sleep,
  taskpoolTestFunc1,
  taskpoolTestFunc10,
  taskpoolTestFunc2,
  taskpoolTestFunc3,
  taskpoolTestFunc4,
  taskpoolTestFunc5,
  taskpoolTestFunc6,
  taskpoolTestFunc7,
  taskpoolTestFunc8,
  taskpoolTestFunc9 } from '../testability/pages/TaskpoolMethods';
const BASE_COUNT = 2;


export default function ProcessSupplementSecondTest() {
  describe('ProcessSupplementSecondTest', (): void => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll((): void => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async (): Promise<void> => {
      await sleep(100);
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
     * @tc.number SUB_PROCESS_SUPPLEMENT_SECOND_TEST_0400
     * @tc.name ProcessSupplementSecondTest0400
     * @tc.desc execute sendable function
     * @tc.size SMALLTEST
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ProcessSupplementSecondTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'ProcessSupplementSecondTest0400';
      console.info(`${caseName}, test start`);
      const TEST_NAME = 'tool';
      const TEST_COUNT: number = 100;
      let successCount: number = 0;
      let failureCount: number = 0;
      let exceptionCount: number = 0;
      console.info(`${caseName}, starting main thread tests`);
      for (let i = 0; i < TEST_COUNT; i++) {
        try {
          const ProcessManager = new StdProcess.ProcessManager();
          const result = ProcessManager.getUidForName(TEST_NAME);
          if (result) {
            console.info(` main thread result is ${result}`);
            successCount++;
            console.info(`${caseName}, main thread call ${i} success, result: ${result}`);
          } else {
            failureCount++;
            console.error(`${caseName}, main thread call ${i} failed: invalid return type`);
          }
        } catch (error) {
          error = error as Error;
          exceptionCount++;
          console.error(`${caseName}, main thread call ${i} exception: ${error.message}`);
        }
      }
      console.info(`${caseName}, main thread test results:`);
      console.info(`Success: ${successCount}, Failures: ${failureCount}, Exceptions: ${exceptionCount}`);
      expect(successCount).assertEqual(TEST_COUNT);
      expect(failureCount).assertEqual(0);
      expect(exceptionCount).assertEqual(0);
      console.info(`${caseName}, test end`);
      Done();
    });


    /**
     * @tc.number SUB_PROCESS_SUPPLEMENT_SECOND_TEST_0500
     * @tc.name ProcessSupplementSecondTest0500
     * @tc.desc execute sendable function
     * @tc.size SMALLTEST
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ProcessSupplementSecondTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'ProcessSupplementSecondTest0500';
      console.info(`${caseName}, test start`);
      const TEST_UID = 'tool';
      const TEST_COUNT: number = 100;
      let successCount: number = 0;
      let failureCount: number = 0;
      let exceptionCount: number = 0;
      let completedTasks: number = 0;
      console.info(`${caseName}, starting taskpool tests`);
      const totalTasks = TEST_COUNT;
      const taskPromises: Promise<void>[] = [];
      for (let i = 0; i < totalTasks; i++) {
        const task = new taskpool.Task(taskpoolTestFunc2, TEST_UID);
        const promise = taskpool.execute(task).then((value: Any): void => {
          const result = value as Number;
          successCount += 1;
          completedTasks++;
          console.info(`${caseName}, task ${i} completed with ${result} successes`);
        }).catch((error: Error): void => {
          
          exceptionCount += BASE_COUNT;
          console.error(`${caseName}, task ${i} failed: ${error.message || error}`);
        });
        taskPromises.push(promise);
      }
      await Promise.all(taskPromises);
      failureCount = TEST_COUNT - successCount - exceptionCount;
      console.info(`${caseName}, taskpool test results:`);
      console.info(`Success: ${successCount}, Failures: ${failureCount}, Exceptions: ${exceptionCount}`);
      expect(successCount).assertEqual(TEST_COUNT);
      expect(failureCount).assertEqual(0);
      expect(exceptionCount).assertEqual(0);
      expect(completedTasks).assertEqual(totalTasks);

      console.info(`${caseName}, test end`);
      Done();
    });

    /**
     * @tc.number SUB_PROCESS_SUPPLEMENT_SECOND_TEST_1200
     * @tc.name ProcessSupplementSecondTest1200
     * @tc.desc execute sendable function
     * @tc.size SMALLTEST
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ProcessSupplementSecondTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'ProcessSupplementSecondTest1200';
      console.info(`${caseName}, test start`);
      const TEST_COUNT: number = 100;
      let successCount: number = 0;
      let failureCount: number = 0;
      let exceptionCount: number = 0;
      let completedTasks: number = 0;
      console.info(`${caseName}, starting taskpool tests`);
      const totalTasks = TEST_COUNT;
      const taskPromises: Promise<void>[] = [];
      for (let i = 0; i < totalTasks; i++) {
        let args_param = 'PATH';
        const task = new taskpool.Task(taskpoolTestFunc5, args_param);
        const promise = taskpool.execute(task).then((value: Any): void => {
          const result = value as Number;
          successCount += 1;
          completedTasks++;
          console.info(`${caseName}, task ${i} completed with ${result} successes`);
        }).catch((error: Error): void => {
          
          exceptionCount += BASE_COUNT;
          console.error(`${caseName}, task ${i} failed: ${error.message || error}`);
        });
        taskPromises.push(promise);
      }
      await Promise.all(taskPromises);
      failureCount = TEST_COUNT - successCount - exceptionCount;
      console.info(`${caseName}, taskpool test results:`);
      console.info(`Success: ${successCount}, Failures: ${failureCount}, Exceptions: ${exceptionCount}`);
      expect(successCount).assertEqual(TEST_COUNT);
      expect(failureCount).assertEqual(0);
      expect(exceptionCount).assertEqual(0);
      expect(completedTasks).assertEqual(totalTasks);

      console.info(`${caseName}, test end`);
      Done();
    });


    /**
     * @tc.number SUB_PROCESS_SUPPLEMENT_SECOND_TEST_1400
     * @tc.name ProcessSupplementSecondTest1400
     * @tc.desc execute sendable function
     * @tc.size SMALLTEST
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ProcessSupplementSecondTest1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'ProcessSupplementSecondTest1400';
      console.info(`${caseName}, test start`);
      const TEST_UID = 12345;
      const TEST_COUNT = 100;
      let successCount = 0;
      let failureCount = 0;
      let exceptionCount = 0;
      console.info(`${caseName}, starting main thread tests`);
      for (let i = 0; i < TEST_COUNT; i++) {
        try {
          const ProcessManager = new StdProcess.ProcessManager();
          let result = ProcessManager.isAppUid(TEST_UID);

          if (typeof result === 'boolean') {
            if (result) {
              console.info(` main thread result is ${result}`);
              successCount++;
            } else {
              console.info(` main thread result is ${result}`);
            }
            console.info(`${caseName}, main thread call ${i} success, result: ${result}`);
          } else {
            failureCount++;
            console.error(`${caseName}, main thread call ${i} failed: invalid return type`);
          }
        } catch (error) {
          error = error as Error;
          exceptionCount++;
          console.error(`${caseName}, main thread call ${i} exception: ${error.message}`);
        }
      }
      console.info(`${caseName}, main thread test results:`);
      console.info(`Success: ${successCount}, Failures: ${failureCount}, Exceptions: ${exceptionCount}`);
      expect(successCount).assertEqual(TEST_COUNT);
      expect(failureCount).assertEqual(0);
      expect(exceptionCount).assertEqual(0);
      console.info(`${caseName}, test end`);
      Done();
    });

  });
}
