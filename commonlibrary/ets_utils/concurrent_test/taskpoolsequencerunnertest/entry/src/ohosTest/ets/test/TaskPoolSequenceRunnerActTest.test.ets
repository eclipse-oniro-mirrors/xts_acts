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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, TestType, Level, Size } from "@ohos/hypium";

import { taskpool, worker } from "@kit.ArkTS";
import {
  asyncLock4,
  asyncLock5,
  cancelTask,
  printArgs1,
  printArgs10,
  secPool,
  timeout,
} from "../testability/pages/TaskMethodTest";
import { sleep, WorkThread } from "../testability/pages/Utils";
import { AsyncLockTest1 } from "../testability/pages/SendableTest";

export default function taskPoolSequenceRunnerActTest() {
  describe('TaskPoolSequenceRunnerActTest', () => {
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
     * @tc.number TASKPOOL_SEQUENCERUNNER_ACT_TEST_0100
     * @tc.name taskPoolSequenceRunnerActTest1001
     * @tc.desc test SequenceRunner-worker-then
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolSequenceRunnerActTest1001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      let count1 = 0;
      let count2 = 0;

      for (let i = 0; i < 10; i++) {
        // 关键修改：每次循环创建新 Task 实例
        const task1: taskpool.Task = new taskpool.Task(printArgs10, 1);
        const task2: taskpool.Task = new taskpool.Task(printArgs10, 2);

        // 并发执行任务
        runner.execute(task1).then((result) => {
          count1++;
          let work = new worker.ThreadWorker('../testability/pages/workers/WorkerTaskGroup.ets');
          work.postMessage('1')
          work.terminate()
          console.info( 'testTag', 'Task1 Result: %{public}d', result);
          expect(1).assertEqual(result)
        }).catch((err: Error) => {
          console.error( 'testTag', 'Task1 Error: %{public}s', err.message);
        });

        runner.execute(task2).then((result) => {
          count2++;
          let work = new worker.ThreadWorker('../testability/pages/workers/WorkerTaskGroup.ets');
          work.postMessage('1')
          console.info( 'testTag', 'Task2 Result: %{public}d', result);
          expect(2).assertEqual(result)
          work.terminate()
        }).catch((err: Error) => {
          console.error( 'testTag', 'Task2 Error: %{public}s', err.message);
        });
      }

      const startTime = new Date().getTime();
      while (count1 < 10 || count2 < 10) {
        if (new Date().getTime() - startTime > 20000) {
          throw new Error('Test timeout');
        }
        await sleep(100);
      }

      expect(count1).assertEqual(10);
      expect(count2).assertEqual(10);
      done();
    });

    /**
     * @tc.number TASKPOOL_SEQUENCERUNNER_ACT_TEST_0200
     * @tc.name taskPoolSequenceRunnerActTest1002
     * @tc.desc test SequenceRunner-二级-then
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolSequenceRunnerActTest1002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      let count1 = 0;
      let count2 = 0;

      for (let i = 0; i < 10; i++) {
        let task1: taskpool.Task = new taskpool.Task(secPool, 1);
        let task2: taskpool.Task = new taskpool.Task(secPool, 2);

        runner.execute(task1).then((result) => {
          count1++;
          console.info( 'testTag', 'Task1 result: %{public}d', result);
          expect(1).assertEqual(result)
        })
          .catch((err: Error) => {
            console.error( 'testTag', 'Task1 Error: %{public}s', err.message);
          });
        runner.execute(task2).then((result) => {
          count2++;
          console.info( 'testTag', 'Task2 result: %{public}d', result);
          expect(2).assertEqual(result)
        })
          .catch((err: Error) => {
            console.error( 'testTag', 'Task2 Error: %{public}s', err.message);
          });
      }

      while (count1 < 10 || count2 < 10) {
        await sleep(100);
      }

      expect(10).assertEqual(count1);
      expect(10).assertEqual(count2);
      done();
    });

    /**
     * @tc.number TASKPOOL_SEQUENCERUNNER_ACT_TEST_0300
     * @tc.name taskPoolSequenceRunnerActTest1003
     * @tc.desc test SequenceRunner-asyncLock-then
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolSequenceRunnerActTest1003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      let count1 = 0;
      let count2 = 0;

      for (let i = 0; i < 10; i++) {
        let asyncLockTest = new AsyncLockTest1()
        let task1: taskpool.Task = new taskpool.Task(asyncLock4, asyncLockTest);
        let task2: taskpool.Task = new taskpool.Task(asyncLock5, asyncLockTest);

        runner.execute(task1).then((result) => {
          count1++;
          console.info( 'testTag', 'Task1 result: %{public}d', result);
          expect(1).assertEqual(result)
        })
          .catch((err: Error) => {
            console.error( 'testTag', 'Task1 Error: %{public}s', err.message);
          })
        runner.execute(task2).then((result) => {
          count2++;
          console.info( 'testTag', 'Task2 result: %{public}d', result);
          expect(2).assertEqual(result)
        })
          .catch((err: Error) => {
            console.error( 'testTag', 'Task2 Error: %{public}s', err.message);
          })
      }

      while (count1 < 10 || count2 < 10) {
        await sleep(100);
      }

      expect(10).assertEqual(count1);
      expect(10).assertEqual(count2);
      done();
    });

    /**
     * @tc.number TASKPOOL_SEQUENCERUNNER_ACT_TEST_0400
     * @tc.name taskPoolSequenceRunnerActTest1004
     * @tc.desc test SequenceRunner-promise-then
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolSequenceRunnerActTest1004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      let count1 = 0;
      let count2 = 0;

      for (let i = 0; i < 10; i++) {
        let asyncLockTest = new AsyncLockTest1()
        let task1: taskpool.Task = new taskpool.Task(asyncLock4, asyncLockTest);
        let task2: taskpool.Task = new taskpool.Task(asyncLock5, asyncLockTest);

        runner.execute(task1).then((result) => {
          count1++;
          console.info( 'testTag', 'Task1 result: %{public}d', result);
          expect(1).assertEqual(result)
        })
          .catch((err: Error) => {
            console.error( 'testTag', 'Task1 Error: %{public}s', err.message);
          })
        runner.execute(task2).then((result) => {
          count2++;
          console.info( 'testTag', 'Task2 result: %{public}d', result);
          expect(2).assertEqual(result)
        })
          .catch((err: Error) => {
            console.error( 'testTag', 'Task2 Error: %{public}s', err.message);
          })
      }

      while (count1 < 10 || count2 < 10) {
        await sleep(100);
      }

      expect(10).assertEqual(count1);
      expect(10).assertEqual(count2);
      done();
    });

    /**
     * @tc.number TASKPOOL_SEQUENCERUNNER_ACT_TEST_0500
     * @tc.name taskPoolSequenceRunnerActTest1005
     * @tc.desc test SequenceRunner-promise-cancel
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolSequenceRunnerActTest1005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      let count1 = 0;
      let count2 = 0;

      for (let i = 0; i < 10; i++) {
        let task1 = new taskpool.Task(printArgs1, 1);
        let task2 = new taskpool.Task(printArgs1, 2);

        runner.execute(task1).then((result) => {
          cancelTask(task1)
          count1++;
          console.info( 'testTag', 'Task1 result: %{public}d', result);
          expect(1).assertEqual(result)
        })
          .catch((err: Error) => {
            console.error( 'testTag', 'Task1 Error: %{public}s', err.message);
          })
        runner.execute(task2).then((result) => {
          cancelTask(task2)
          count2++;
          console.info( 'testTag', 'Task2 result: %{public}d', result);
          expect(2).assertEqual(result)
        })
          .catch((err: Error) => {
            console.error( 'testTag', 'Task2 Error: %{public}s', err.message);
          })
      }

      while (count1 < 10 || count2 < 10) {
        await sleep(100);
      }

      expect(10).assertEqual(count1);
      expect(10).assertEqual(count2);
      done();
    });

    /**
     * @tc.number TASKPOOL_SEQUENCERUNNER_ACT_TEST_0600
     * @tc.name taskPoolSequenceRunnerActTest1006
     * @tc.desc test SequenceRunner-setTimeOut-then
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolSequenceRunnerActTest1006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      let count1 = 0;
      let count2 = 0;

      for (let i = 0; i < 10; i++) {
        let task1: taskpool.Task = new taskpool.Task(timeout, 1);
        let task2: taskpool.Task = new taskpool.Task(timeout, 2);

        runner.execute(task1).then((result) => {
          count1++;
          console.info( 'testTag', 'Task1 result: %{public}d', result);
          expect(1).assertEqual(result)
        })

        runner.execute(task2).then((result) => {
          count2++;
          console.info( 'testTag', 'Task2 result: %{public}d', result);
          expect(2).assertEqual(result)
        })
      }

      while (count1 < 10 || count2 < 10) {
        await sleep(100);
      }

      expect(10).assertEqual(count1);
      expect(10).assertEqual(count2);
      done();
    });

    /**
     * @tc.number TASKPOOL_SEQUENCERUNNER_ACT_TEST_0700
     * @tc.name taskPoolSequenceRunnerActTest1007
     * @tc.desc test SequenceRunner-async-then
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolSequenceRunnerActTest1007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      let count1 = 0;
      let count2 = 0;

      for (let i = 0; i < 10; i++) {
        let asyncLockTest = new AsyncLockTest1()
        let task1: taskpool.Task = new taskpool.Task(asyncLock4, asyncLockTest);
        let task2: taskpool.Task = new taskpool.Task(asyncLock5, asyncLockTest);
        runner.execute(task1).then((result) => {
          count1++;
          console.info( 'testTag', 'Task1 result: %{public}d', result);
          expect(1).assertEqual(result)
        })
          .catch((err: Error) => {
            console.error( 'testTag', 'Task1 Error: %{public}s', err.message);
          })

        runner.execute(task2).then((result) => {
          count2++;
          console.info( 'testTag', 'Task2 result: %{public}d', result);
          expect(2).assertEqual(result)
        })
          .catch((err: Error) => {
            console.error( 'testTag', 'Task2 Error: %{public}s', err.message);
          })
      }

      while (count1 < 10 || count2 < 10) {
        await sleep(100);
      }

      expect(10).assertEqual(count1);
      expect(10).assertEqual(count2);
      done();
    });

    /**
     * @tc.number TASKPOOL_SEQUENCERUNNER_ACT_TEST_0800
     * @tc.name taskPoolSequenceRunnerActTest1008
     * @tc.desc test SequenceRunner-wait-then
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolSequenceRunnerActTest1008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      let count1 = 0;
      let count2 = 0;

      for (let i = 0; i < 10; i++) {
        let asyncLockTest = new AsyncLockTest1()
        let task1: taskpool.Task = new taskpool.Task(asyncLock4, asyncLockTest); // TODO
        let task2: taskpool.Task = new taskpool.Task(asyncLock5, asyncLockTest);
        runner.execute(task1).then((result) => {
          count1++;
          console.info( 'testTag', 'Task1 result: %{public}d', result);
          expect(1).assertEqual(result)
        })
          .catch((err: Error) => {
            console.error( 'testTag', 'Task1 Error: %{public}s', err.message);
          })

        runner.execute(task2).then((result) => {
          count2++;
          console.info( 'testTag', 'Task2 result: %{public}d', result);
          expect(2).assertEqual(result)
        })
          .catch((err: Error) => {
            console.error( 'testTag', 'Task2 Error: %{public}s', err.message);
          })
      }

      while (count1 < 10 || count2 < 10) {
        await sleep(100);
      }

      expect(10).assertEqual(count1);
      expect(10).assertEqual(count2);
      done();
    });

    /**
     * @tc.number TASKPOOL_SEQUENCERUNNER_ACT_TEST_0900
     * @tc.name taskPoolSequenceRunnerActTest1009
     * @tc.desc test SequenceRunner-waitfor-then
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolSequenceRunnerActTest1009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      let count1 = 0;
      let count2 = 0;

      for (let i = 0; i < 10; i++) {
        let asyncLockTest = new AsyncLockTest1()
        let task1: taskpool.Task = new taskpool.Task(asyncLock4, asyncLockTest); // TODO
        let task2: taskpool.Task = new taskpool.Task(asyncLock5, asyncLockTest);
        runner.execute(task1).then((result) => {
          count1++;
          console.info( 'testTag', 'Task1 result: %{public}d', result);
          expect(1).assertEqual(result)
        })
          .catch((err: Error) => {
            console.error( 'testTag', 'Task1 Error: %{public}s', err.message);
          })

        runner.execute(task2).then((result) => {
          count2++;
          console.info( 'testTag', 'Task2 result: %{public}d', result);
          expect(2).assertEqual(result)
        })
          .catch((err: Error) => {
            console.error( 'testTag', 'Task2 Error: %{public}s', err.message);
          })
      }

      while (count1 < 10 || count2 < 10) {
        await sleep(100);
      }

      expect(10).assertEqual(count1);
      expect(10).assertEqual(count2);
      done();
    });
  })
}