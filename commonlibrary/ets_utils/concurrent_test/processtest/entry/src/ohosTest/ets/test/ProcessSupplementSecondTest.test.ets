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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium';
import process from '@ohos.process';
import { MessageEvent, taskpool } from '@kit.ArkTS';
import { BusinessError } from '@kit.BasicServicesKit';
import { ErrorEvent, MessageEvents, ThreadWorkerGlobalScope, worker } from '@kit.ArkTS';
import {
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
  taskpoolTestFunc9,
  WorkThread10,
  WorkThread11,
  WorkThread12,
  WorkThread13,
  WorkThread14,
  WorkThread15,
  WorkThread16,
  WorkThread17,
  WorkThread18,
  WorkThread9
} from '../testability/pages/TaskpoolMethods';

const BASE_COUNT = 2;


export default function ProcessSupplementSecondTest() {
  describe('ProcessSupplementSecondTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(100);
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
     * @tc.name   ProcessSupplementSecondTest0100
     * @tc.number SUB_PROCESS_SUPPLEMENT_SECOND_TEST_0100
     * @tc.desc   execute sendable function
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('ProcessSupplementSecondTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'ProcessSupplementSecondTest0100';
      console.info(`${caseName}, test start`);
      const TEST_UID = 12345;
      const TEST_COUNT = 100;
      let successCount = 0;
      let failureCount = 0;
      let exceptionCount = 0;
      console.info(`${caseName}, starting main thread tests`);
      for (let i = 0; i < TEST_COUNT; i++) {
        try {
          const result = process.isAppUid(TEST_UID);
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
     * @tc.name   ProcessSupplementSecondTest0200
     * @tc.number ProcessSupplementSecondTest0200
     * @tc.desc   ProcessSupplementSecondTest0200
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('ProcessSupplementSecondTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'ProcessSupplementSecondTest0200';
      console.info(`${caseName}, test start`);
      const TEST_UID = 12345;
      const TEST_COUNT = 100;
      let successCount: number = 0;
      let failureCount = 0;
      let exceptionCount = 0;
      let completedTasks = 0;
      console.info(`${caseName}, starting taskpool tests`);
      const totalTasks = TEST_COUNT;
      const taskPromises: Promise<void>[] = [];
      for (let i = 0; i < totalTasks; i++) {
        const task = new taskpool.Task(taskpoolTestFunc1, TEST_UID);
        const promise = taskpool.execute(task).then((result) => {
          successCount += 1;
          completedTasks++;
          console.info(`${caseName}, task ${i} completed with ${result} successes`);
        }).catch((e: BusinessError) => {
          exceptionCount += BASE_COUNT;
          console.error(`${caseName}, task ${i} failed: ${e.message}`);
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
     * @tc.name   ProcessSupplementSecondTest0300
     * @tc.number SUB_PROCESS_SUPPLEMENT_SECOND_TEST_0300
     * @tc.desc   execute sendable function
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('ProcessSupplementSecondTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'ProcessSupplementSecondTest0300';
      console.info(`${caseName}, test start`);
      const TEST_UID = 12345;
      const TEST_COUNT = 100;
      let successCount = 0;
      let failureCount = 0;
      let exceptionCount = 0;
      console.info(`${caseName}, creating Worker`);
      const workerTestPromise = new Promise<void>((resolve) => {
        WorkThread9.workerStageModel.onmessage = (e: MessageEvent<number>) => {
          const results = e.data;
          successCount = results;
          console.info(`${caseName}, worker completed with results:`, results);
          resolve();
        };
        WorkThread9.workerStageModel.onerror = (e: ErrorEvent) => {
          console.error(`${caseName}, worker error:`, e.message);
          exceptionCount = TEST_COUNT;
          resolve();
        };
      });
      console.info(`${caseName}, starting Worker test`);
      WorkThread9.workerStageModel.postMessage({ uid: TEST_UID, count: TEST_COUNT });
      await workerTestPromise;
      WorkThread9.workerStageModel.terminate();
      console.info(`${caseName}, Worker test results:`);
      console.info(`Success: ${successCount}, Failures: ${failureCount}, Exceptions: ${exceptionCount}`);
      expect(successCount).assertEqual(TEST_COUNT);
      expect(failureCount).assertEqual(0);
      expect(exceptionCount).assertEqual(0);
      console.info(`${caseName}, test end`);
      Done();
    });


    /**
     * @tc.name   ProcessSupplementSecondTest0400
     * @tc.number SUB_PROCESS_SUPPLEMENT_SECOND_TEST_0400
     * @tc.desc   execute sendable function
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('ProcessSupplementSecondTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'ProcessSupplementSecondTest0400';
      console.info(`${caseName}, test start`);
      const TEST_NAME = 'tool';
      const TEST_COUNT = 100;
      let successCount = 0;
      let failureCount = 0;
      let exceptionCount = 0;
      console.info(`${caseName}, starting main thread tests`);
      for (let i = 0; i < TEST_COUNT; i++) {
        try {
          const result = process.getUidForName(TEST_NAME);
          if (result) {
            console.info(` main thread result is ${result}`);
            successCount++;
            console.info(`${caseName}, main thread call ${i} success, result: ${result}`);
          } else {
            failureCount++;
            console.error(`${caseName}, main thread call ${i} failed: invalid return type`);
          }
        } catch (error) {
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
     * @tc.name   ProcessSupplementSecondTest0500
     * @tc.number SUB_PROCESS_SUPPLEMENT_SECOND_TEST_0500
     * @tc.desc   execute sendable function
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('ProcessSupplementSecondTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'ProcessSupplementSecondTest0500';
      console.info(`${caseName}, test start`);
      const TEST_UID = 'tool';
      const TEST_COUNT = 100;
      let successCount: number = 0;
      let failureCount = 0;
      let exceptionCount = 0;
      let completedTasks = 0;
      console.info(`${caseName}, starting taskpool tests`);
      const totalTasks = TEST_COUNT;
      const taskPromises: Promise<void>[] = [];
      for (let i = 0; i < totalTasks; i++) {
        const task = new taskpool.Task(taskpoolTestFunc2, TEST_UID);
        const promise = taskpool.execute(task).then((result) => {
          successCount += 1;
          completedTasks++;
          console.info(`${caseName}, task ${i} completed with ${result} successes`);
        }).catch((e: BusinessError) => {
          exceptionCount += BASE_COUNT;
          console.error(`${caseName}, task ${i} failed: ${e.message}`);
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
     * @tc.name   ProcessSupplementSecondTest0600
     * @tc.number SUB_PROCESS_SUPPLEMENT_SECOND_TEST_0600
     * @tc.desc   execute sendable function
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('ProcessSupplementSecondTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'ProcessSupplementSecondTest0600';
      console.info(`${caseName}, test start`);
      const TEST_NAME = 'tool';
      const TEST_COUNT = 100;
      let successCount = 0;
      let failureCount = 0;
      let exceptionCount = 0;
      console.info(`${caseName}, creating Worker`);
      const workerTestPromise = new Promise<void>((resolve) => {
        WorkThread10.workerStageModel.onmessage = (e: MessageEvent<number>) => {
          const results = e.data;
          successCount = results;
          console.info(`${caseName}, worker completed with results:`, results);
          resolve();
        };
        WorkThread10.workerStageModel.onerror = (e: ErrorEvent) => {
          console.error(`${caseName}, worker error:`, e.message);
          exceptionCount = TEST_COUNT;
          resolve();
        };
      });
      console.info(`${caseName}, starting Worker test`);
      WorkThread10.workerStageModel.postMessage({ uid: TEST_NAME, count: TEST_COUNT });
      await workerTestPromise;
      WorkThread10.workerStageModel.terminate();
      console.info(`${caseName}, Worker test results:`);
      console.info(`Success: ${successCount}, Failures: ${failureCount}, Exceptions: ${exceptionCount}`);
      expect(successCount).assertEqual(TEST_COUNT);
      expect(failureCount).assertEqual(0);
      expect(exceptionCount).assertEqual(0);
      console.info(`${caseName}, test end`);
      Done();
    });


    /**
     * @tc.name   ProcessSupplementSecondTest0700
     * @tc.number SUB_PROCESS_SUPPLEMENT_SECOND_TEST_0700
     * @tc.desc   execute sendable function
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('ProcessSupplementSecondTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'ProcessSupplementSecondTest0700';
      console.info(`${caseName}, test start`);
      const TEST_COUNT = 100;
      let successCount = 0;
      let failureCount = 0;
      let exceptionCount = 0;
      console.info(`${caseName}, starting main thread tests`);
      for (let i = 0; i < TEST_COUNT; i++) {
        try {
          let tid = process.tid;
          const result = process.getThreadPriority(tid);
          if (result <= 19 && result >= -20) {
            console.info(` main thread result is ${result}`);
            successCount++;
            console.info(`${caseName}, main thread call ${i} success, result: ${result}`);
          } else {
            failureCount++;
            console.error(`${caseName}, main thread call ${i} failed: invalid return type`);
          }
        } catch (error) {
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
     * @tc.name   ProcessSupplementSecondTest0800
     * @tc.number SUB_PROCESS_SUPPLEMENT_SECOND_TEST_0800
     * @tc.desc   execute sendable function
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('ProcessSupplementSecondTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'ProcessSupplementSecondTest0800';
      console.info(`${caseName}, test start`);
      const TEST_COUNT = 100;
      let successCount: number = 0;
      let failureCount = 0;
      let exceptionCount = 0;
      let completedTasks = 0;
      console.info(`${caseName}, starting taskpool tests`);
      const totalTasks = TEST_COUNT;
      const taskPromises: Promise<void>[] = [];
      for (let i = 0; i < totalTasks; i++) {
        let tid = process.tid;
        const task = new taskpool.Task(taskpoolTestFunc3, tid);
        const promise = taskpool.execute(task).then((result) => {
          successCount += 1;
          completedTasks++;
          console.info(`${caseName}, task ${i} completed with ${result} successes`);
        }).catch((e: BusinessError) => {
          exceptionCount += BASE_COUNT;
          console.error(`${caseName}, task ${i} failed: ${e.message}`);
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
     * @tc.name   ProcessSupplementSecondTest0900
     * @tc.number SUB_PROCESS_SUPPLEMENT_SECOND_TEST_0900
     * @tc.desc   execute sendable function
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('ProcessSupplementSecondTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'ProcessSupplementSecondTest0900';
      console.info(`${caseName}, test start`);
      const TEST_COUNT = 100;
      let successCount = 0;
      let failureCount = 0;
      let exceptionCount = 0;
      console.info(`${caseName}, creating Worker`);
      const workerTestPromise = new Promise<void>((resolve) => {
        WorkThread11.workerStageModel.onmessage = (e: MessageEvent<number>) => {
          const results = e.data;
          successCount = results;
          console.info(`${caseName}, worker completed with results:`, results);
          resolve();
        };
        WorkThread11.workerStageModel.onerror = (e: ErrorEvent) => {
          console.error(`${caseName}, worker error:`, e.message);
          exceptionCount = TEST_COUNT;
          resolve();
        };
      });
      console.info(`${caseName}, starting Worker test`);
      WorkThread11.workerStageModel.postMessage({ count: TEST_COUNT });
      await workerTestPromise;
      WorkThread11.workerStageModel.terminate();
      console.info(`${caseName}, Worker test results:`);
      console.info(`Success: ${successCount}, Failures: ${failureCount}, Exceptions: ${exceptionCount}`);
      expect(successCount).assertEqual(TEST_COUNT);
      expect(failureCount).assertEqual(0);
      expect(exceptionCount).assertEqual(0);
      console.info(`${caseName}, test end`);
      Done();
    });


    /**
     * @tc.name   ProcessSupplementSecondTest1000
     * @tc.number SUB_PROCESS_SUPPLEMENT_SECOND_TEST_1000
     * @tc.desc   execute sendable function
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('ProcessSupplementSecondTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'ProcessSupplementSecondTest1000';
      console.info(`${caseName}, test start`);
      const TEST_COUNT = 100;
      let successCount: number = 0;
      let failureCount = 0;
      let exceptionCount = 0;
      let completedTasks = 0;
      console.info(`${caseName}, starting taskpool tests`);
      const totalTasks = TEST_COUNT;
      const taskPromises: Promise<void>[] = [];
      for (let i = 0; i < totalTasks; i++) {
        let _SC_ARG_MAX = 0;
        const task = new taskpool.Task(taskpoolTestFunc4, _SC_ARG_MAX);
        const promise = taskpool.execute(task).then((result) => {
          successCount += 1;
          completedTasks++;
          console.info(`${caseName}, task ${i} completed with ${result} successes`);
        }).catch((e: BusinessError) => {
          exceptionCount += BASE_COUNT;
          console.error(`${caseName}, task ${i} failed: ${e.message}`);
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
     * @tc.name   ProcessSupplementSecondTest1100
     * @tc.number SUB_PROCESS_SUPPLEMENT_SECOND_TEST_1100
     * @tc.desc   execute sendable function
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('ProcessSupplementSecondTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'ProcessSupplementSecondTest1100';
      console.info(`${caseName}, test start`);
      const TEST_COUNT = 100;
      let successCount = 0;
      let failureCount = 0;
      let exceptionCount = 0;
      console.info(`${caseName}, creating Worker`);
      //const Worker = new worker.ThreadWorker('../workers/Worker4');
      const workerTestPromise = new Promise<void>((resolve) => {
        WorkThread12.workerStageModel.onmessage = (e: MessageEvent<number>) => {
          const results = e.data;
          successCount = results;
          console.info(`${caseName}, worker completed with results:`, results);
          resolve();
        };
        WorkThread12.workerStageModel.onerror = (e: ErrorEvent) => {
          console.error(`${caseName}, worker error:`, e.message);
          exceptionCount = TEST_COUNT;
          resolve();
        };
      });
      console.info(`${caseName}, starting Worker test`);
      WorkThread12.workerStageModel.postMessage({ count: TEST_COUNT });
      await workerTestPromise;
      WorkThread12.workerStageModel.terminate();
      console.info(`${caseName}, Worker test results:`);
      console.info(`Success: ${successCount}, Failures: ${failureCount}, Exceptions: ${exceptionCount}`);
      expect(successCount).assertEqual(TEST_COUNT);
      expect(failureCount).assertEqual(0);
      expect(exceptionCount).assertEqual(0);
      console.info(`${caseName}, test end`);
      Done();
    });


    /**
     * @tc.name   ProcessSupplementSecondTest1200
     * @tc.number SUB_PROCESS_SUPPLEMENT_SECOND_TEST_1200
     * @tc.desc   execute sendable function
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('ProcessSupplementSecondTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'ProcessSupplementSecondTest1200';
      console.info(`${caseName}, test start`);
      const TEST_COUNT = 100;
      let successCount: number = 0;
      let failureCount = 0;
      let exceptionCount = 0;
      let completedTasks = 0;
      console.info(`${caseName}, starting taskpool tests`);
      const totalTasks = TEST_COUNT;
      const taskPromises: Promise<void>[] = [];
      for (let i = 0; i < totalTasks; i++) {
        let args_param = 'PATH';
        const task = new taskpool.Task(taskpoolTestFunc5, args_param);
        const promise = taskpool.execute(task).then((result) => {
          successCount += 1;
          completedTasks++;
          console.info(`${caseName}, task ${i} completed with ${result} successes`);
        }).catch((e: BusinessError) => {
          exceptionCount += BASE_COUNT;
          console.error(`${caseName}, task ${i} failed: ${e.message}`);
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
     * @tc.name   ProcessSupplementSecondTest1300
     * @tc.number SUB_PROCESS_SUPPLEMENT_SECOND_TEST_1300
     * @tc.desc   execute sendable function
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('ProcessSupplementSecondTest1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'ProcessSupplementSecondTest1300';
      console.info(`${caseName}, test start`);
      const TEST_COUNT = 100;
      let successCount = 0;
      let failureCount = 0;
      let exceptionCount = 0;
      console.info(`${caseName}, creating Worker`);
      //const Worker = new worker.ThreadWorker('../workers/Worker5');
      const workerTestPromise = new Promise<void>((resolve) => {
        WorkThread13.workerStageModel.onmessage = (e: MessageEvent<number>) => {
          const results = e.data;
          successCount = results;
          console.info(`${caseName}, worker completed with results:`, results);
          resolve();
        };
        WorkThread13.workerStageModel.onerror = (e: ErrorEvent) => {
          console.error(`${caseName}, worker error:`, e.message);
          exceptionCount = TEST_COUNT;
          resolve();
        };
      });
      console.info(`${caseName}, starting Worker test`);
      WorkThread13.workerStageModel.postMessage({ count: TEST_COUNT });
      await workerTestPromise;
      WorkThread13.workerStageModel.terminate();
      console.info(`${caseName}, Worker test results:`);
      console.info(`Success: ${successCount}, Failures: ${failureCount}, Exceptions: ${exceptionCount}`);
      expect(successCount).assertEqual(TEST_COUNT);
      expect(failureCount).assertEqual(0);
      expect(exceptionCount).assertEqual(0);
      console.info(`${caseName}, test end`);
      Done();
    });


    /**
     * @tc.name   ProcessSupplementSecondTest1400
     * @tc.number SUB_PROCESS_SUPPLEMENT_SECOND_TEST_1400
     * @tc.desc   execute sendable function
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('ProcessSupplementSecondTest1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
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
          let pro = new process.ProcessManager();
          let result = pro.isAppUid(TEST_UID);
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
     * @tc.name   ProcessSupplementSecondTest1500
     * @tc.number SUB_PROCESS_SUPPLEMENT_SECOND_TEST_1500
     * @tc.desc   execute sendable function
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('ProcessSupplementSecondTest1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'ProcessSupplementSecondTest1500';
      console.info(`${caseName}, test start`);
      const TEST_UID = 12345;
      const TEST_COUNT = 100;
      let successCount: number = 0;
      let failureCount = 0;
      let exceptionCount = 0;
      let completedTasks = 0;
      console.info(`${caseName}, starting taskpool tests`);
      const totalTasks = TEST_COUNT;
      const taskPromises: Promise<void>[] = [];
      for (let i = 0; i < totalTasks; i++) {
        const task = new taskpool.Task(taskpoolTestFunc6, TEST_UID);
        const promise = taskpool.execute(task).then((result) => {
          successCount += 1;
          completedTasks++;
          console.info(`${caseName}, task ${i} completed with ${result} successes`);
        }).catch((e: BusinessError) => {
          exceptionCount += BASE_COUNT;
          console.error(`${caseName}, task ${i} failed: ${e.message}`);
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
     * @tc.name   ProcessSupplementSecondTest1600
     * @tc.number SUB_PROCESS_SUPPLEMENT_SECOND_TEST_1600
     * @tc.desc   execute sendable function
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('ProcessSupplementSecondTest1600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'ProcessSupplementSecondTest1600';
      console.info(`${caseName}, test start`);
      const TEST_UID = 12345;
      const TEST_COUNT = 100;
      let successCount = 0;
      let failureCount = 0;
      let exceptionCount = 0;
      console.info(`${caseName}, creating Worker`);
      //const Worker = new worker.ThreadWorker('../workers/Worker6');
      const workerTestPromise = new Promise<void>((resolve) => {
        WorkThread14.workerStageModel.onmessage = (e: MessageEvent<number>) => {
          const results = e.data;
          successCount = results;
          console.info(`${caseName}, worker completed with results:`, results);
          resolve();
        };
        WorkThread14.workerStageModel.onerror = (e: ErrorEvent) => {
          console.error(`${caseName}, worker error:`, e.message);
          exceptionCount = TEST_COUNT;
          resolve();
        };
      });
      console.info(`${caseName}, starting Worker test`);
      WorkThread14.workerStageModel.postMessage({ uid: TEST_UID, count: TEST_COUNT });
      await workerTestPromise;
      WorkThread14.workerStageModel.terminate();
      console.info(`${caseName}, Worker test results:`);
      console.info(`Success: ${successCount}, Failures: ${failureCount}, Exceptions: ${exceptionCount}`);
      expect(successCount).assertEqual(TEST_COUNT);
      expect(failureCount).assertEqual(0);
      expect(exceptionCount).assertEqual(0);
      console.info(`${caseName}, test end`);
      Done();
    });


    /**
     * @tc.name   ProcessSupplementSecondTest1700
     * @tc.number SUB_PROCESS_SUPPLEMENT_SECOND_TEST_1700
     * @tc.desc   execute sendable function
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('ProcessSupplementSecondTest1700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'ProcessSupplementSecondTest1700';
      console.info(`${caseName}, test start`);
      const TEST_NAME = 'tool';
      const TEST_COUNT = 100;
      let successCount = 0;
      let failureCount = 0;
      let exceptionCount = 0;
      console.info(`${caseName}, starting main thread tests`);
      for (let i = 0; i < TEST_COUNT; i++) {
        try {
          let pro = new process.ProcessManager();
          let result = pro.getUidForName(TEST_NAME);
          if (result) {
            console.info(` main thread result is ${result}`);
            successCount++;
            console.info(`${caseName}, main thread call ${i} success, result: ${result}`);
          } else {
            failureCount++;
            console.error(`${caseName}, main thread call ${i} failed: invalid return type`);
          }
        } catch (error) {
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
     * @tc.name   ProcessSupplementSecondTest1800
     * @tc.number SUB_PROCESS_SUPPLEMENT_SECOND_TEST_1800
     * @tc.desc   execute sendable function
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('ProcessSupplementSecondTest1800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'ProcessSupplementSecondTest1800';
      console.info(`${caseName}, test start`);
      const TEST_UID = 'tool';
      const TEST_COUNT = 100;
      let successCount: number = 0;
      let failureCount = 0;
      let exceptionCount = 0;
      let completedTasks = 0;
      console.info(`${caseName}, starting taskpool tests`);
      const totalTasks = TEST_COUNT;
      const taskPromises: Promise<void>[] = [];
      for (let i = 0; i < totalTasks; i++) {
        const task = new taskpool.Task(taskpoolTestFunc7, TEST_UID);
        const promise = taskpool.execute(task).then((result) => {
          successCount += 1;
          completedTasks++;
          console.info(`${caseName}, task ${i} completed with ${result} successes`);
        }).catch((e: BusinessError) => {
          exceptionCount += BASE_COUNT;
          console.error(`${caseName}, task ${i} failed: ${e.message}`);
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
     * @tc.name   ProcessSupplementSecondTest1900
     * @tc.number SUB_PROCESS_SUPPLEMENT_SECOND_TEST_1900
     * @tc.desc   execute sendable function
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('ProcessSupplementSecondTest1900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'ProcessSupplementSecondTest1900';
      console.info(`${caseName}, test start`);
      const TEST_NAME = 'tool';
      const TEST_COUNT = 100;
      let successCount = 0;
      let failureCount = 0;
      let exceptionCount = 0;
      console.info(`${caseName}, creating Worker`);
      //const Worker = new worker.ThreadWorker('../workers/Worker7');
      const workerTestPromise = new Promise<void>((resolve) => {
        WorkThread15.workerStageModel.onmessage = (e: MessageEvent<number>) => {
          const results = e.data;
          successCount = results;
          console.info(`${caseName}, worker completed with results:`, results);
          resolve();
        };
        WorkThread15.workerStageModel.onerror = (e: ErrorEvent) => {
          console.error(`${caseName}, worker error:`, e.message);
          exceptionCount = TEST_COUNT;
          resolve();
        };
      });
      console.info(`${caseName}, starting Worker test`);
      WorkThread15.workerStageModel.postMessage({ uid: TEST_NAME, count: TEST_COUNT });
      await workerTestPromise;
      WorkThread15.workerStageModel.terminate();
      console.info(`${caseName}, Worker test results:`);
      console.info(`Success: ${successCount}, Failures: ${failureCount}, Exceptions: ${exceptionCount}`);
      expect(successCount).assertEqual(TEST_COUNT);
      expect(failureCount).assertEqual(0);
      expect(exceptionCount).assertEqual(0);
      console.info(`${caseName}, test end`);
      Done();
    });


    /**
     * @tc.name   ProcessSupplementSecondTest2000
     * @tc.number SUB_PROCESS_SUPPLEMENT_SECOND_TEST_2000
     * @tc.desc   execute sendable function
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('ProcessSupplementSecondTest2000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'ProcessSupplementSecondTest2000';
      console.info(`${caseName}, test start`);
      const TEST_COUNT = 100;
      let successCount = 0;
      let failureCount = 0;
      let exceptionCount = 0;
      console.info(`${caseName}, starting main thread tests`);
      for (let i = 0; i < TEST_COUNT; i++) {
        try {
          let pro = new process.ProcessManager();
          let tid = process.tid;
          let result = pro.getThreadPriority(tid);
          if (result <= 19 && result >= -20) {
            console.info(` main thread result is ${result}`);
            successCount++;
            console.info(`${caseName}, main thread call ${i} success, result: ${result}`);
          } else {
            failureCount++;
            console.error(`${caseName}, main thread call ${i} failed: invalid return type`);
          }
        } catch (error) {
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
     * @tc.name   ProcessSupplementSecondTest2100
     * @tc.number SUB_PROCESS_SUPPLEMENT_SECOND_TEST_2100
     * @tc.desc   execute sendable function
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('ProcessSupplementSecondTest2100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'ProcessSupplementSecondTest2100';
      console.info(`${caseName}, test start`);
      const TEST_COUNT = 100;
      let successCount: number = 0;
      let failureCount = 0;
      let exceptionCount = 0;
      let completedTasks = 0;
      console.info(`${caseName}, starting taskpool tests`);
      const totalTasks = TEST_COUNT;
      const taskPromises: Promise<void>[] = [];
      for (let i = 0; i < totalTasks; i++) {
        let tid = process.tid;
        const task = new taskpool.Task(taskpoolTestFunc8, tid);
        const promise = taskpool.execute(task).then((result) => {
          successCount += 1;
          completedTasks++;
          console.info(`${caseName}, task ${i} completed with ${result} successes`);
        }).catch((e: BusinessError) => {
          exceptionCount += BASE_COUNT;
          console.error(`${caseName}, task ${i} failed: ${e.message}`);
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
     * @tc.name   ProcessSupplementSecondTest2200
     * @tc.number SUB_PROCESS_SUPPLEMENT_SECOND_TEST_2200
     * @tc.desc   execute sendable function
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('ProcessSupplementSecondTest2200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'ProcessSupplementSecondTest2200';
      console.info(`${caseName}, test start`);
      const TEST_COUNT = 100;
      let successCount = 0;
      let failureCount = 0;
      let exceptionCount = 0;
      console.info(`${caseName}, creating Worker`);
      //const Worker = new worker.ThreadWorker('../workers/Worker8');
      const workerTestPromise = new Promise<void>((resolve) => {
        WorkThread16.workerStageModel.onmessage = (e: MessageEvent<number>) => {
          const results = e.data;
          successCount = results;
          console.info(`${caseName}, worker completed with results:`, results);
          resolve();
        };
        WorkThread16.workerStageModel.onerror = (e: ErrorEvent) => {
          console.error(`${caseName}, worker error:`, e.message);
          exceptionCount = TEST_COUNT;
          resolve();
        };
      });
      console.info(`${caseName}, starting Worker test`);
      WorkThread16.workerStageModel.postMessage({ count: TEST_COUNT });
      await workerTestPromise;
      WorkThread16.workerStageModel.terminate();
      console.info(`${caseName}, Worker test results:`);
      console.info(`Success: ${successCount}, Failures: ${failureCount}, Exceptions: ${exceptionCount}`);
      expect(successCount).assertEqual(TEST_COUNT);
      expect(failureCount).assertEqual(0);
      expect(exceptionCount).assertEqual(0);
      console.info(`${caseName}, test end`);
      Done();
    });


    /**
     * @tc.name   ProcessSupplementSecondTest2300
     * @tc.number SUB_PROCESS_SUPPLEMENT_SECOND_TEST_2300
     * @tc.desc   execute sendable function
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('ProcessSupplementSecondTest2300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'ProcessSupplementSecondTest2300';
      console.info(`${caseName}, test start`);
      const TEST_COUNT = 100;
      let successCount: number = 0;
      let failureCount = 0;
      let exceptionCount = 0;
      let completedTasks = 0;
      console.info(`${caseName}, starting taskpool tests`);
      const totalTasks = TEST_COUNT;
      const taskPromises: Promise<void>[] = [];
      for (let i = 0; i < totalTasks; i++) {
        let _SC_ARG_MAX = 0;
        const task = new taskpool.Task(taskpoolTestFunc9, _SC_ARG_MAX);
        const promise = taskpool.execute(task).then((result) => {
          successCount += 1;
          completedTasks++;
          console.info(`${caseName}, task ${i} completed with ${result} successes`);
        }).catch((e: BusinessError) => {
          exceptionCount += BASE_COUNT;
          console.error(`${caseName}, task ${i} failed: ${e.message}`);
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
     * @tc.name   ProcessSupplementSecondTest2400
     * @tc.number SUB_PROCESS_SUPPLEMENT_SECOND_TEST_2400
     * @tc.desc   execute sendable function
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('ProcessSupplementSecondTest2400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'ProcessSupplementSecondTest2400';
      console.info(`${caseName}, test start`);
      const TEST_COUNT = 100;
      let successCount = 0;
      let failureCount = 0;
      let exceptionCount = 0;
      console.info(`${caseName}, creating Worker`);
      //const Worker = new worker.ThreadWorker('../workers/Worker9');
      const workerTestPromise = new Promise<void>((resolve) => {
        WorkThread17.workerStageModel.onmessage = (e: MessageEvent<number>) => {
          const results = e.data;
          successCount = results;
          console.info(`${caseName}, worker completed with results:`, results);
          resolve();
        };
        WorkThread17.workerStageModel.onerror = (e: ErrorEvent) => {
          console.error(`${caseName}, worker error:`, e.message);
          exceptionCount = TEST_COUNT;
          resolve();
        };
      });
      console.info(`${caseName}, starting Worker test`);
      WorkThread17.workerStageModel.postMessage({ count: TEST_COUNT });
      await workerTestPromise;
      WorkThread17.workerStageModel.terminate();
      console.info(`${caseName}, Worker test results:`);
      console.info(`Success: ${successCount}, Failures: ${failureCount}, Exceptions: ${exceptionCount}`);
      expect(successCount).assertEqual(TEST_COUNT);
      expect(failureCount).assertEqual(0);
      expect(exceptionCount).assertEqual(0);
      console.info(`${caseName}, test end`);
      Done();
    });

    /**
     * @tc.name   ProcessSupplementSecondTest2500
     * @tc.number SUB_PROCESS_SUPPLEMENT_SECOND_TEST_2500
     * @tc.desc   execute sendable function
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('ProcessSupplementSecondTest2500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'ProcessSupplementSecondTest2500';
      console.info(`${caseName}, test start`);
      const TEST_COUNT = 100;
      let successCount: number = 0;
      let failureCount = 0;
      let exceptionCount = 0;
      let completedTasks = 0;
      console.info(`${caseName}, starting taskpool tests`);
      const totalTasks = TEST_COUNT;
      const taskPromises: Promise<void>[] = [];
      for (let i = 0; i < totalTasks; i++) {
        let args_param = 'PATH';
        const task = new taskpool.Task(taskpoolTestFunc10, args_param);
        const promise = taskpool.execute(task).then((result) => {
          successCount += 1;
          completedTasks++;
          console.info(`${caseName}, task ${i} completed with ${result} successes`);
        }).catch((e: BusinessError) => {
          exceptionCount += BASE_COUNT;
          console.error(`${caseName}, task ${i} failed: ${e.message}`);
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
     * @tc.name   ProcessSupplementSecondTest2600
     * @tc.number SUB_PROCESS_SUPPLEMENT_SECOND_TEST_2600
     * @tc.desc   execute sendable function
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('ProcessSupplementSecondTest2600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'ProcessSupplementSecondTest2600';
      console.info(`${caseName}, test start`);
      const TEST_COUNT = 100;
      let successCount = 0;
      let failureCount = 0;
      let exceptionCount = 0;
      console.info(`${caseName}, creating Worker`);
      //const Worker = new worker.ThreadWorker('../workers/Worker10');
      const workerTestPromise = new Promise<void>((resolve) => {
        WorkThread18.workerStageModel.onmessage = (e: MessageEvent<number>) => {
          const results = e.data;
          successCount = results;
          console.info(`${caseName}, worker completed with results:`, results);
          resolve();
        };
        WorkThread18.workerStageModel.onerror = (e: ErrorEvent) => {
          console.error(`${caseName}, worker error:`, e.message);
          exceptionCount = TEST_COUNT;
          resolve();
        };
      });
      console.info(`${caseName}, starting Worker test`);
      WorkThread18.workerStageModel.postMessage({ count: TEST_COUNT });
      await workerTestPromise;
      WorkThread18.workerStageModel.terminate();
      console.info(`${caseName}, Worker test results:`);
      console.info(`Success: ${successCount}, Failures: ${failureCount}, Exceptions: ${exceptionCount}`);
      expect(successCount).assertEqual(TEST_COUNT);
      expect(failureCount).assertEqual(0);
      expect(exceptionCount).assertEqual(0);
      console.info(`${caseName}, test end`);
      Done();
    });

  });
}
