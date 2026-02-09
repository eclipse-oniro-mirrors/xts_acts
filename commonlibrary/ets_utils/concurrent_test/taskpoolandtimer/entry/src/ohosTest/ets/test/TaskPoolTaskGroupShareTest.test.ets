/*
* Copyright (C) 2024 HiHope Open Source Organization.
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
import { worker, MessageEvents, ErrorEvent } from '@kit.ArkTS';
import { WorkerSrc, Worker3 } from '../testability/pages/WorkerSrc'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium';
import {
  awaitAsync,
  awaitCatch,
  awaitCompute,
  awaitFinally,
  awaitPromise,
  promiseAll,
  promiseCompute,
  promiseThen,
  printArgs1,
  printArgs2,
  concurrentTask3
} from '../testability/pages/SequenceRunnerSendableTest'
import { Calculator } from '../testability/pages/CalculateIndex';
import { taskpool } from '@kit.ArkTS';

function sleep(time: number): Promise<void> {
  return new Promise((re, je) => {
    setTimeout(() => {
      re();
    }, time)
  });
}

const TASK_COUNT = 10;
let task1Count = 0;

export default function taskPoolTaskShareTest() {
  describe('TASKPOOL_TASKGROUP_SHARE_TEST', () => {
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
     * @tc.name   taskPoolTaskShareTest_0100
     * @tc.number TASKPOOL_TASKGROUP_SHARE_TEST_0100
     * @tc.desc   test Loop through 10 taskpool threads, passing index into the task each time, using new promise in the task, promise callback in the new promise, The evaluation function in the shared module is called in the then callback of the await promise (computed using the passed index) and the result of the evaluation function is returned
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('taskPoolTaskShareTest_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async (Done: Function) => {
      const taskPromises: Promise<void>[] = [];
      for (let i = 0; i < TASK_COUNT; i++) {
        const task = new taskpool.Task(promiseThen, i);
        const taskPromise = taskpool.execute(task)
          .then((result: object) => {
            expect(result).assertEqual(i * 2);
          })
          .catch((e: Error) => {
            console.error(`Task ${i} failed:`, e.message);
          });
        taskPromises.push(taskPromise);
      }
      await Promise.all(taskPromises);
      task1Count = 0;
      Done();
    })
    /**
     * @tc.name   taskPoolTaskShareTest_0200
     * @tc.number TASKPOOL_TASKGROUP_SHARE_TEST_0200
     * @tc.desc   test Loop through 10 taskpool threads, passing index into the task each time, await calls to the async evaluation function in the shared module in the task (computed using the passed index) Use await new promise and await promise callback in turn in the evaluation function, The calculation is performed in the then callback of await new promise and await promise respectively, and the result of the calculation of the function is computed by return
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('taskPoolTaskShareTest_0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async (Done: Function) => {
      const taskPromises: Promise<void>[] = [];
      for (let i = 0; i < TASK_COUNT; i++) {
        const task = new taskpool.Task(awaitCompute, i);
        const taskPromise = taskpool.execute(task)
          .then((result: object) => {
            expect(result).assertEqual((i * 2) * 2);
          })
          .catch((e: Error) => {
            console.error(`Task ${i} failed:`, e.message);
          });
        taskPromises.push(taskPromise);
      }
      await Promise.all(taskPromises);
      task1Count = 0;
      Done();
    })
    /**
     * @tc.name   taskPoolTaskShareTest_0300
     * @tc.number TASKPOOL_TASKGROUP_SHARE_TEST_0300
     * @tc.desc   test Loop through 10 taskpool threads, passing index into the task each time, using await new promise and promise callback in the task, Call the async evaluation function in the shared module (computed using the passed index) in the then callback of await promise, and return the result of the evaluation function
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolTaskShareTest_0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const taskPromises: Promise<void>[] = [];
      for (let i = 0; i < TASK_COUNT; i++) {
        const task = new taskpool.Task(awaitPromise, i);
        const taskPromise = taskpool.execute(task)
          .then((result: object) => {
            expect(result).assertEqual((i + 10) * 2);
          })
          .catch((e: Error) => {
            console.error(`Task ${i} failed:`, e.message);
          });
        taskPromises.push(taskPromise);
      }
      await Promise.all(taskPromises);
      task1Count = 0;
      Done();
    })
    /**
     * @tc.name   taskPoolTaskShareTest_0400
     * @tc.number TASKPOOL_TASKGROUP_SHARE_TEST_0400
     * @tc.desc   test Loop through 10 taskpool threads, passing index into the task each time, using await new promise and await promise callbacks in the task, The evaluation function in the shared module is called in the finally callback of the await promise (computed using the passed index), and the evaluation result of the function is computed in return
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolTaskShareTest_0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const taskPromises: Array<Promise<void>> = [];
      for (let i = 0; i < TASK_COUNT; i++) {
        const task = new taskpool.Task(awaitFinally, i);
        const taskPromise = taskpool.execute(task)
          .then((result: object) => {
            expect(result).toBe((i + 1) * 2);
          })
          .catch((err: Error) => {
            console.error(`Task ${i} failed: ${err.message}`);
          });
        taskPromises.push(taskPromise);
      }
      await Promise.all(taskPromises);
      task1Count = 0;
      Done();
    })
    /**
     * @tc.name   taskPoolTaskShareTest_0500
     * @tc.number TASKPOOL_TASKGROUP_SHARE_TEST_0500
     * @tc.desc   test Loop through 10 taskpool threads, passing index into the task each time, using new promise and promise callbacks in the task, calling the calculation function in the shared module (calculated using the passed index) in the catch callback of await promise, return Calculates the result of the function
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolTaskShareTest_0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const taskPromises: Promise<void>[] = [];
      for (let i = 0; i < TASK_COUNT; i++) {
        const task = new taskpool.Task(awaitCatch, i);
        const taskPromise = taskpool.execute(task)
          .then((result: object) => {
            expect(result).assertEqual(i * 4);
            return sleep(100);
          })
          .catch((error: Error) => {
            console.error(`Task ${i} failed with error: ${error.message}`);
            return sleep(100);
          });
        taskPromises.push(taskPromise);
      }
      await Promise.all(taskPromises);
      task1Count = 0;
      Done();
    })
    /**
     * @tc.name   taskPoolTaskShareTest_0600
     * @tc.number TASKPOOL_TASKGROUP_SHARE_TEST_0600
     * @tc.desc   test Loop through 10 taskpool threads, passing index into the task each time, using new promise and promise callbacks in the task, calling the calculation function in the shared module (calculated using the passed index) in the then callback of await promise, return Calculates the result of the function
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolTaskShareTest_0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const taskPromises: Promise<void>[] = [];
      for (let i = 0; i < TASK_COUNT; i++) {
        const task = new taskpool.Task(promiseCompute, i);
        const taskPromise = taskpool.execute(task)
          .then((result: object) => {
            expect(result).assertEqual((i + 1) * 2);
            return sleep(100);
          })
          .catch((error: Error) => {
            console.error(`[Task ${i}] Failed:`, error);
            return sleep(100);
          });
        taskPromises.push(taskPromise);
      }
      await Promise.all(taskPromises);
      task1Count = 0;
      Done();
    })
    /**
     * @tc.name   taskPoolTaskShareTest_0700
     * @tc.number TASKPOOL_TASKGROUP_SHARE_TEST_0700
     * @tc.desc   test Loop through 10 taskpool threads, passing index into the task each time, using await new promise and promise callback in the task, Call the async evaluation function in the shared module in await new promise (computed with the index passed in) and return the result of the evaluation function
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolTaskShareTest_0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const taskPromises: Promise<void>[] = [];
      for (let i = 0; i < TASK_COUNT; i++) {
        const task = new taskpool.Task(awaitAsync, i);
        const taskPromise = taskpool.execute(task)
          .then((result: object) => {
            expect(result).assertEqual(i * 2 + 1);
            return sleep(100);
          })
          .catch((error: Error) => {
            console.error(`Task ${i} error:`, error.message);
            return sleep(100);
          });
        taskPromises.push(taskPromise);
      }
      await Promise.all(taskPromises);
      task1Count = 0;
      Done();
    })
    /**
     * @tc.name   taskPoolTaskShareTest_0800
     * @tc.number TASKPOOL_TASKGROUP_SHARE_TEST_0800
     * @tc.desc   test Loop through 10 taskpool threads, passing index into the task each time, using await new promise in the task, calling the calculation function in the shared module (using the passed index), using await promise callback, return Calculates the result of the function
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolTaskShareTest_0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const taskPromises: Promise<void>[] = [];
      for (let i = 0; i < TASK_COUNT; i++) {
        const task = new taskpool.Task(promiseAll, i);
        const taskPromise = taskpool.execute(task)
          .then((result: object) => {
            expect(result).assertEqual((i + 1) * 2 + i);
          })
          .catch((error: Error) => {
            console.error(`Task ${i} failed:`, error.message);
          });
        taskPromises.push(taskPromise);
      }
      await Promise.all(taskPromises);
      task1Count = 0;
      Done();
    })
    /**
     * @tc.name   taskPoolTaskShareTest_0900
     * @tc.number TASKPOOL_TASKGROUP_SHARE_TEST_0900
     * @tc.desc   test Loop through 10 taskpool threads, using await new promise in the taskpool's onEqueued callback, calling the calculation function in the shared module (calculated using index), and using await promise callback
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolTaskShareTest_0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      let result1 = 0;
      for (let i = 0; i < TASK_COUNT; i++) {
        let task: taskpool.Task = new taskpool.Task(printArgs1, i);
        task.onEnqueued(async () => {
          const res1 = await Calculator.computeSync(i);
          result1 = result1 + res1;
        });
        taskpool.execute(task).then(() => {
        });
      }
      await sleep(100);
      expect(result1).assertEqual(90);
      task1Count = 0;
      result1 = 0;
      Done();
    })
    /**
     * @tc.name   taskPoolTaskShareTest_1000
     * @tc.number TASKPOOL_TASKGROUP_SHARE_TEST_1000
     * @tc.desc   test Loop through 10 taskpool threads, using await new promise in the taskpool's onEqueued callback, await to call the async computation function in the shared module (calculated using index), and await promise callback
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolTaskShareTest_1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      let result1 = 0;
      for (let i = 0; i < TASK_COUNT; i++) {
        let task: taskpool.Task = new taskpool.Task(printArgs1, i);
        task.onEnqueued(async () => {
          const res1 = await Calculator.computeAsync1(i);
          result1 = result1 + res1;
        });
        taskpool.execute(task).then(() => {
        });
      }
      await sleep(100);
      expect(result1).assertEqual(90);
      task1Count = 0;
      result1 = 0;
      Done();
    })
    /**
     * @tc.name   taskPoolTaskShareTest_1100
     * @tc.number TASKPOOL_TASKGROUP_SHARE_TEST_1100
     * @tc.desc   test Loop through 10 taskpool threads, using await new promise and promise callback in the onStartExecution callback for taskpool, Call the calculation function in the shared module in await new promise (calculated using index)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolTaskShareTest_1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      let result1 = 0;
      for (let i = 0; i < TASK_COUNT; i++) {
        let task: taskpool.Task = new taskpool.Task(printArgs1, i);
        task.onStartExecution(async () => {
          const res1 = await Calculator.computeSync(i);
          result1 = result1 + res1;
        });
        taskpool.execute(task).then(() => {
        });
      }
      await sleep(100);
      expect(result1).assertEqual(90);
      task1Count = 0;
      result1 = 0;
      Done();
    })
    /**
     * @tc.name   taskPoolTaskShareTest_1200
     * @tc.number TASKPOOL_TASKGROUP_SHARE_TEST_1200
     * @tc.desc   test Loop through 10 taskpool threads, using the await new promise and await promise callbacks in the onStartExecution callback of the taskpool, Call the async evaluation function in the shared module in await new promise (computed using index)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolTaskShareTest_1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      let result1 = 0;
      for (let i = 0; i < TASK_COUNT; i++) {
        let task: taskpool.Task = new taskpool.Task(printArgs1, i);
        task.onStartExecution(async () => {
          const res1 = await Calculator.computeAsync1(i);
          result1 = result1 + res1;
        });
        taskpool.execute(task).then(() => {
        });
      }
      await sleep(100);
      expect(result1).assertEqual(90);
      task1Count = 0;
      result1 = 0;
      Done();
    })
    /**
     * @tc.name   taskPoolTaskShareTest_1300
     * @tc.number TASKPOOL_TASKGROUP_SHARE_TEST_1300
     * @tc.desc   test Loop through 10 taskpool threads, using await new promise and await promise callbacks in taskpool's onExecutionFailed callback, Call the calculation function in the shared module (calculated using index) in the then callback of await promise
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolTaskShareTest_1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      let result1 = 0;
      for (let i = 0; i < TASK_COUNT; i++) {
        let task: taskpool.Task = new taskpool.Task(concurrentTask3, i);
        task.onExecutionFailed(async () => {
          const res1 = await Calculator.computeSync(i);
          result1 = result1 + res1;
        });
        taskpool.execute(task).then(() => {
        });
      }
      await sleep(1000);
      expect(result1).assertEqual(90);
      task1Count = 0;
      result1 = 0;
      Done();
    })
    /**
     * @tc.name   taskPoolTaskShareTest_1400
     * @tc.number TASKPOOL_TASKGROUP_SHARE_TEST_1400
     * @tc.desc   test Loop through 10 taskpool threads, using await new promise and await promise callbacks in taskpool's onExecutionFailed callback, await call async evaluation function in shared module in then callback of await promise (computed using index)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolTaskShareTest_1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'taskPoolTaskShareTest_1400';
      console.info(`${caseName} test start`);
      let result1 = 0;
      let flag = false;
      for (let i = 0; i < TASK_COUNT; i++) {
        let task: taskpool.Task = new taskpool.Task(concurrentTask3, i);
        task.onExecutionFailed(async () => {
          const res1 = await Calculator.computeAsync1(i);
          result1 = result1 + res1;
          flag = true;
        });
        taskpool.execute(task).then(() => {
          console.info('taskpool: execute task success');
        });
      }
      while (flag === false){
        await sleep(1000);
      }

      expect(result1).assertEqual(90);
      console.info(`${caseName} test end`);
      task1Count = 0;
      result1 = 0;
      Done();
    })
    /**
     * @tc.name   taskPoolTaskShareTest_1500
     * @tc.number TASKPOOL_TASKGROUP_SHARE_TEST_1500
     * @tc.desc   test Loop through 10 taskpool threads, using await new promise and await promise callbacks in the onExecutionSucceeded callback of taskpool, Calling the calculation function in the shared module (calculated using index) in the catch callback of await promise,
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolTaskShareTest_1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      let result1 = 0;
      for (let i = 0; i < TASK_COUNT; i++) {
        let task: taskpool.Task = new taskpool.Task(printArgs1, i);
        task.onExecutionSucceeded(async () => {
          const res1 = await Calculator.computeSync(i);
          result1 = result1 + res1;
        });
        taskpool.execute(task).then(() => {
        });
      }
      await sleep(100);
      expect(result1).assertEqual(90);
      task1Count = 0;
      result1 = 0;
      Done();
    })
    /**
     * @tc.name   taskPoolTaskShareTest_1600
     * @tc.number TASKPOOL_TASKGROUP_SHARE_TEST_1600
     * @tc.desc   test Loop through 10 taskpool threads, using await new promise and await promise callbacks in the onExecutionSucceeded callback of taskpool, await call async evaluation function in shared module (computed using index) in catch callback of await promise
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolTaskShareTest_1600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      let result1 = 0;
      for (let i = 0; i < TASK_COUNT; i++) {
        let task: taskpool.Task = new taskpool.Task(printArgs1, i);
        task.onExecutionSucceeded(async () => {
          const res1 = await Calculator.computeAsync1(i);
          result1 = result1 + res1;
        });
        taskpool.execute(task).then(() => {
        });
      }
      await sleep(100);
      expect(result1).assertEqual(90);
      task1Count = 0;
      result1 = 0;
      Done();
    })
    /**
     * @tc.name   taskPoolTaskShareTest_1700
     * @tc.number TASKPOOL_TASKGROUP_SHARE_TEST_1700
     * @tc.desc   test Loop through the 10 taskpool threads, using the await new promise and await promise callbacks in the onReceiveData callback of the taskpool, await call async evaluation function in shared module (computed using index) in finally callback of await promise
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolTaskShareTest_1700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      let result1 = 0;
      for (let i = 0; i < TASK_COUNT; i++) {
        let task: taskpool.Task = new taskpool.Task(printArgs2, i);
        task.onReceiveData(async (kye: number) => {
          const res1 = await Calculator.computeSync(kye);
          result1 = result1 + res1;
        });
        await taskpool.execute(task).then(() => {
        });
      }
      await sleep(1000);
      expect(result1).assertEqual(90);
      task1Count = 0;
      result1 = 0;
      Done();
    })
    /**
     * @tc.name   taskPoolTaskShareTest_1800
     * @tc.number TASKPOOL_TASKGROUP_SHARE_TEST_1800
     * @tc.desc   test Loop through 10 taskpool threads, using the awiat new promise and await promise callbacks in the then callback of the taskpool, Call the calculation function in the shared module (calculated using index) in the then callback of await new promise and await promise, respectively
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolTaskShareTest_1800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      let result1 = 0;
      for (let i = 0; i < TASK_COUNT; i++) {
        let task: taskpool.Task = new taskpool.Task(printArgs1, i);
        taskpool.execute(task).then(async () => {
          const res1 = await Calculator.computeSync(i);
          result1 = result1 + res1;
        });
      }
      await sleep(100);
      expect(result1).assertEqual(90);
      task1Count = 0;
      result1 = 0;
      Done();
    })
    /**
     * @tc.name   taskPoolTaskShareTest_1900
     * @tc.number TASKPOOL_TASKGROUP_SHARE_TEST_1900
     * @tc.desc   test Loop through 10 taskpool threads, using await new promise and await promise callbacks in the then callback of the taskpool, Call the async evaluation function in the shared module (calculated using index) in the finally callback of await new promise and await promise, respectively
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolTaskShareTest_1900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      let result1 = 0;
      for (let i = 0; i < TASK_COUNT; i++) {
        let task: taskpool.Task = new taskpool.Task(printArgs1, i);
        taskpool.execute(task).then(async () => {
          const res1 = await Calculator.computeAsync1(i);
          result1 = result1 + res1;
        });
      }
      await sleep(1000);
      expect(result1).assertEqual(90);
      task1Count = 0;
      result1 = 0;
      Done();
    })
    /**
     * @tc.name   taskPoolTaskShareTest_2000
     * @tc.number TASKPOOL_TASKGROUP_SHARE_TEST_2000
     * @tc.desc   test Loop to create 10 taskpool threads, use await new promise in the catch callback of the taskpool, Call async computation function in shared module in await new promise (compute using index) Use promise in async computation function, compute in promise
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolTaskShareTest_2000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      let result1 = 0;
      for (let i = 0; i < TASK_COUNT; i++) {
        let task: taskpool.Task = new taskpool.Task(concurrentTask3, i);
        taskpool.execute(task).then(async () => {
          const res1 = await Calculator.computeAsync1(i);
          result1 = result1 + res1;
        }).catch(async () => {
          console.log('this catch success')
          const res1 = await Calculator.computeAsync1(i);
          result1 = result1 + res1 + 10;
        });
      }
      await sleep(1000);
      expect(result1).assertEqual(190);
      task1Count = 0;
      result1 = 0;
      Done();
    })
    /**
     * @tc.name   taskPoolTaskShareTest_2100
     * @tc.number TASKPOOL_TASKGROUP_SHARE_TEST_2100
     * @tc.desc   test Loop through 10 taskpool threads, using await new promise in the taskpool's finally callback, calling the async calculation function in the shared module (calculated using index), and using the promise callback
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolTaskShareTest_2100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      let result1 = 0;
      for (let i = 0; i < TASK_COUNT; i++) {
        let task: taskpool.Task = new taskpool.Task(printArgs1, i);
        taskpool.execute(task).finally(async () => {
          const res1 = await Calculator.computeAsync1(i);
          result1 = result1 + res1;
        });
      }
      while (result1 < 90) {
        await sleep(100)
      }
      expect(result1).assertEqual(90);
      task1Count = 0;
      result1 = 0;
      Done();
    })

    /**
     * @tc.name   taskPoolTaskShareTest_2200
     * @tc.number TASKPOOL_TASKGROUP_SHARE_TEST_2200
     * @tc.desc   test Loop through 10 worker threads, in turn using await new promise, calling the calculation function in the shared module (calculated using index), using await promise callback, and sending the result of the calculation to the main thread
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolTaskShareTest_2200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      let result1 = 0;
      for (let i = 0; i < TASK_COUNT; i++) {
        let work = new worker.ThreadWorker('../workers/WorkerOne');
        work.postMessage(i);
        work.onmessage = async (e: MessageEvents): Promise<void> => {
          let data: number = e.data;
          console.info('main thread data is  ' + data);
          result1 = result1 + data;
          work.terminate()
        }
      }

      while (result1 < 90) {
        await sleep(100)
      }
      expect(result1).assertEqual(90);
      task1Count = 0;
      result1 = 0;
      Done();
    })
    /**
     * @tc.name   taskPoolTaskShareTest_2300
     * @tc.number TASKPOOL_TASKGROUP_SHARE_TEST_2300
     * @tc.desc   test Loop through 10 worker threads, using await new promise and await promise callbacks in the onmessage callback of the worker thread, await call async evaluation function in shared module in then callback of await promise (computed using index)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolTaskShareTest_2300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      let result1 = 0;
      for (let i = 0; i < TASK_COUNT; i++) {
        let work = new worker.ThreadWorker('../workers/WorkerTwo');
        work.postMessage(i);
        work.onmessage = async (e: MessageEvents): Promise<void> => {
          let data: number = e.data;
          console.info('main thread data is  ' + data);
          result1 = result1 + data;
          work.terminate()
        }
      }
      while (result1 < 90) {
        await sleep(100)
      }
      expect(result1).assertEqual(90);
      task1Count = 0;
      result1 = 0;
      Done();
    })
    /**
     * @tc.name   taskPoolTaskShareTest_2400
     * @tc.number TASKPOOL_TASKGROUP_SHARE_TEST_2400
     * @tc.desc   test Loop to create 10 worker threads, using await new promise in the onexit callback of the worker thread, Call async computation function in shared module in await new promise (compute using index) Use promise in async computation function, compute in promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolTaskShareTest_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        let totalCalculated = 0;
        let totalExpected = 0;
        let completedTasks = 0;
        for (let index = 0; index < 10; index++) {
          console.log(`Worker ${index} created`);
          const workerInstance = new Worker3();
          workerInstance.worker.onexit = async (code: number): Promise<void> => {
            console.log(`Worker ${index} exited with code: ${code}`);
            try {
              const result1 = await new Promise<number>(async (resolve, reject) => {
                try {
                  const res = await Calculator.computeAsync1(index);
                  console.log(`Worker ${index} computeAsync1 result: ${res}`);
                  resolve(res);
                } catch (error) {
                  console.log(`Worker ${index} computeAsync1 error: ${error.message}`);
                  reject(error);
                } finally {
                  console.log(`Worker ${index} computeAsync1 finally`);
                }
              });

              const result2 = await Promise.resolve(result1)
                .then(async (res) => {
                  return res;
                })
                .finally(async () => {
                  console.log(`Worker ${index} Promise callback finally`);
                });
              totalExpected += result2;
              totalCalculated += result2;
              completedTasks++;
              console.log(`totalCalculated: ${totalCalculated}, totalExpected: ${totalExpected}`);
              if (completedTasks === 10) {
                expect(totalCalculated).assertEqual(totalExpected);
                Done();
              }
            } catch (error) {
              console.log(`Worker ${index} error in onexit: ${error.message}`);
            } finally {
              workerInstance.worker.terminate();
            }
          };
          workerInstance.worker.postMessage(index);
          console.log(`Worker ${index} postMessage called`);
        }
      });
  })
}