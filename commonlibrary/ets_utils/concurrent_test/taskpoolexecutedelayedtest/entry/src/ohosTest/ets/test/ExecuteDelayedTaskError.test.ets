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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, TestType, Level, Size } from '@ohos/hypium';
import { MessageEvents, taskpool, worker } from '@kit.ArkTS';
import {
  asyncErrorTask,
  asyncLockErrorTask, asyncLockNormalTask, errorTask, normalTask,
  normalTask2,
  promiseErrorTask,
  promiseNormalTask,
  setTimeoutErrorTask,
} from '../testability/pages/ConcurrentFunc';
import { sleep } from '../testability/pages/Utils';

@Concurrent
async function errorTask2(args: string) {
  console.log(`errorTask2 Task ${args} executed`);
  const eTask: taskpool.Task = new taskpool.Task(errorTask, args);
  try {
    // 执行抛异常任务
    taskpool.executeDelayed(100, eTask)
  } catch (err) {
    console.error(`${args} executing error task failed, error: ${err.message}`);
  }
}

@Concurrent
async function errorTaskThen2(args: string) {
  console.log(`errorTaskThen2 Task ${args} executed`);
  const eTask: taskpool.Task = new taskpool.Task(normalTask, args);
  try {
    // 执行抛异常任务
    taskpool.executeDelayed(100, eTask).then(() => {
      console.log(`errorTaskThen2 then Task ${args} executed`);
      throw new Error(`Error in task ${args}`)
    })
  } catch (err) {
    console.error(`${args} executing error task failed, error: ${err.message}`);
  }
}

@Concurrent
async function errorTaskCatch2(args: string) {
  console.log(`errorTaskCatch2 Task ${args} executed`);
  const eTask: taskpool.Task = new taskpool.Task(errorTask, args);
  try {
    // 执行抛异常任务
    taskpool.executeDelayed(100, eTask).catch(() => {
      console.log(`errorTaskCatch2 then Task ${args} executed`);
      throw new Error(`Error in task ${args}`)
    })
  } catch (err) {
    console.error(`${args} executing error task failed, error: ${err.message}`);
  }
}

@Concurrent
async function errorTaskFinally2(args: string) {
  console.log(`errorTaskFinally2 Task ${args} executed`);
  const eTask: taskpool.Task = new taskpool.Task(normalTask, args);
  try {
    // 执行抛异常任务
    taskpool.executeDelayed(100, eTask)
      .finally(() => {
        console.log(`errorTaskFinally2 then Task ${args} executed`);
        throw new Error(`Error in task ${args}`)
      })
  } catch (err) {
    console.error(`${args} executing error task failed, error: ${err.message}`);
  }
}

export default function executeDelayedTaskErrorTest() {
  describe('executeDelayedTaskErrorTest', () => {
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
     * @tc.name   executeDelayedTaskErrorTest0100
     * @tc.number SUB_EXECUTE_DELAYED_TASK_ERROR_TEST_0100
     * @tc.desc   Testing Task ThrowError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('executeDelayedTaskErrorTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'executeDelayedTaskErrorTest0100';
      console.info(`${caseName} test start`);
      let num = 0;
      const nTask: taskpool.Task = new taskpool.Task(normalTask, caseName);
      const eTask: taskpool.Task = new taskpool.Task(errorTask, caseName);

      for (let i = 1; i <= 10; i++) {
        try {
          // 执行正常任务
          taskpool.executeDelayed(100, nTask)
          // 执行抛异常任务
          taskpool.executeDelayed(100, eTask)
        } catch (err) {
          console.error(`${caseName} executing error task failed, error: ${err.message}`);
          expect(err.message).assertContain(`Error in task ${caseName}`);
        }
        num++;
      }

      while (num < 10) {
        await sleep(100);
      }

      expect(num).assertEqual(10);
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   executeDelayedTaskErrorTest0200
     * @tc.number SUB_EXECUTE_DELAYED_TASK_ERROR_TEST_0200
     * @tc.desc   Testing Generics Task ThrowError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('executeDelayedTaskErrorTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'executeDelayedTaskErrorTest0200';
      console.info(`${caseName} test start`);
      let num = 0;
      const nTask: taskpool.Task = new taskpool.GenericsTask<[string], void>(normalTask, caseName);
      const eTask: taskpool.Task = new taskpool.GenericsTask<[string], void>(errorTask, caseName);

      for (let i = 1; i <= 10; i++) {
        try {
          // 执行正常任务
          taskpool.executeDelayed<[string], void>(100, nTask)
          // 执行抛异常任务
          taskpool.executeDelayed<[string], void>(100, eTask)
        } catch (err) {
          console.error(`${caseName} executing error task failed, error: ${err.message}`);
          expect(err.message).assertContain(`Error in task ${caseName}`);
        }
        num++;
      }

      while (num < 10) {
        await sleep(100);
      }

      expect(num).assertEqual(10);
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   executeDelayedTaskErrorTest0300
     * @tc.number SUB_EXECUTE_DELAYED_TASK_ERROR_TEST_0300
     * @tc.desc   Testing Task onEnqueued ThrowError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('executeDelayedTaskErrorTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'executeDelayedTaskErrorTest0300';
      console.info(`${caseName} test start`);
      let num = 0;
      const nTask: taskpool.Task = new taskpool.Task(normalTask, caseName);
      const eTask: taskpool.Task = new taskpool.Task(normalTask, caseName);

      eTask.onEnqueued(() => {
        console.log(`onEnqueued Task ${caseName} executed`);
        try {
          throw new Error(`Error in task ${caseName}`)
        } catch (err) {
          console.error(`${caseName} executing error task failed, error: ${err.message}`);
          expect(err.message).assertContain(`Error in task ${caseName}`);
        }
      });

      for (let i = 1; i <= 10; i++) {
        try {
          // 执行正常任务
          taskpool.executeDelayed(100, nTask)
          // 执行抛异常任务
          taskpool.executeDelayed(100, eTask)
        } catch (err) {
          console.error(`${caseName} executing error task failed, error: ${err.message}`);
          expect(err.message).assertContain(`Error in task ${caseName}`);
        }
        num++;
      }

      while (num < 10) {
        await sleep(100);
      }

      expect(num).assertEqual(10);
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   executeDelayedTaskErrorTest0400
     * @tc.number SUB_EXECUTE_DELAYED_TASK_ERROR_TEST_0400
     * @tc.desc   Testing Task onStartExecution ThrowError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('executeDelayedTaskErrorTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'executeDelayedTaskErrorTest0400';
      console.info(`${caseName} test start`);
      let num = 0;
      const nTask: taskpool.Task = new taskpool.Task(normalTask, caseName);
      const eTask: taskpool.Task = new taskpool.Task(normalTask, caseName);

      eTask.onStartExecution(() => {
        console.log(`onStartExecution Task ${caseName} executed`);
        try {
          throw new Error(`Error in task ${caseName}`)
        } catch (err) {
          console.error(`${caseName} executing error task failed, error: ${err.message}`);
          expect(err.message).assertContain(`Error in task ${caseName}`);
        }
      });

      for (let i = 1; i <= 10; i++) {
        try {
          // 执行正常任务
          taskpool.executeDelayed(100, nTask)
          // 执行抛异常任务
          taskpool.executeDelayed(100, eTask)
        } catch (err) {
          console.error(`${caseName} executing error task failed, error: ${err.message}`);
          expect(err.message).assertContain(`Error in task ${caseName}`);
        }
        num++;
      }

      while (num < 10) {
        await sleep(100);
      }

      expect(num).assertEqual(10);
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   executeDelayedTaskErrorTest0500
     * @tc.number SUB_EXECUTE_DELAYED_TASK_ERROR_TEST_0500
     * @tc.desc   Testing Task onExecutionFailed ThrowError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('executeDelayedTaskErrorTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'executeDelayedTaskErrorTest0500';
      console.info(`${caseName} test start`);
      let num = 0;
      const nTask: taskpool.Task = new taskpool.Task(normalTask, caseName);
      const eTask: taskpool.Task = new taskpool.Task(errorTask, caseName);
      eTask.onExecutionFailed(() => {
        console.log(`onExecutionFailed Task ${caseName} executed`);
        throw new Error(`Error in task ${caseName}`)
      });

      for (let i = 1; i <= 10; i++) {
        try {
          // 执行正常任务
          taskpool.executeDelayed(100, nTask)
          // 执行抛异常任务
          taskpool.executeDelayed(100, eTask)
        } catch (err) {
          console.error(`${caseName} executing error task failed, error: ${err.message}`);
          expect(err.message).assertContain(`Error in task ${caseName}`);
        }
        num++;
      }

      while (num < 10) {
        await sleep(100);
      }

      expect(num).assertEqual(10);
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   executeDelayedTaskErrorTest0600
     * @tc.number SUB_EXECUTE_DELAYED_TASK_ERROR_TEST_0600
     * @tc.desc   Testing Task onExecutionSucceeded ThrowError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('executeDelayedTaskErrorTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'executeDelayedTaskErrorTest0600';
      console.info(`${caseName} test start`);
      let num = 0;
      const nTask: taskpool.Task = new taskpool.Task(normalTask, caseName);
      const eTask: taskpool.Task = new taskpool.Task(normalTask, caseName);
      eTask.onExecutionSucceeded(() => {
        console.log(`onExecutionSucceeded Task ${caseName} executed`);
        try {
          throw new Error(`Error in task ${caseName}`)
        } catch (err) {
          console.error(`${caseName} executing error task failed, error: ${err.message}`);
          expect(err.message).assertContain(`Error in task ${caseName}`);
        }
      });

      for (let i = 1; i <= 10; i++) {
        try {
          // 执行正常任务
          taskpool.executeDelayed(100, nTask)
          // 执行抛异常任务
          taskpool.executeDelayed(100, eTask)
        } catch (err) {
          console.error(`${caseName} executing error task failed, error: ${err.message}`);
          expect(err.message).assertContain(`Error in task ${caseName}`);
        }
        num++;
      }

      while (num < 10) {
        await sleep(100);
      }

      expect(num).assertEqual(10);
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   executeDelayedTaskErrorTest0700
     * @tc.number SUB_EXECUTE_DELAYED_TASK_ERROR_TEST_0700
     * @tc.desc   Testing Task onReceiveData ThrowError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('executeDelayedTaskErrorTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'executeDelayedTaskErrorTest0700';
      console.info(`${caseName} test start`);
      let num = 0;
      const nTask: taskpool.Task = new taskpool.Task(normalTask, caseName);
      const eTask: taskpool.Task = new taskpool.Task(normalTask2, caseName);
      eTask.onReceiveData(() => {
        console.log(`onReceiveData Task ${caseName} executed`);
        try {
          throw new Error(`Error in task ${caseName}`)
        } catch (err) {
          console.error(`${caseName} executing error task failed, error: ${err.message}`);
          expect(err.message).assertContain(`Error in task ${caseName}`);
        }
      });

      for (let i = 1; i <= 10; i++) {
        try {
          // 执行正常任务
          taskpool.executeDelayed(100, nTask)
          // 执行抛异常任务
          taskpool.executeDelayed(100, eTask)
        } catch (err) {
          console.error(`${caseName} executing error task failed, error: ${err.message}`);
          expect(err.message).assertContain(`Error in task ${caseName}`);
        }
        num++;
      }

      while (num < 10) {
        await sleep(100);
      }

      expect(num).assertEqual(10);
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   executeDelayedTaskErrorTest0800
     * @tc.number SUB_EXECUTE_DELAYED_TASK_ERROR_TEST_0800
     * @tc.desc   Testing Task then ThrowError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('executeDelayedTaskErrorTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'executeDelayedTaskErrorTest0800';
      console.info(`${caseName} test start`);
      let num = 0;
      const nTask: taskpool.Task = new taskpool.Task(normalTask, caseName);
      const eTask: taskpool.Task = new taskpool.Task(normalTask, caseName);

      for (let i = 1; i <= 10; i++) {
        try {
          // 执行正常任务
          taskpool.executeDelayed(100, nTask);
          // 执行抛异常任务
          taskpool.executeDelayed(100, eTask).then(() => {
            console.log(`then Task ${caseName} executed`);
            throw new Error(`Error in task ${caseName}`)
          })
        } catch (err) {
          console.error(`${caseName} executing error task failed, error: ${err.message}`);
          expect(err.message).assertContain(`Error in task ${caseName}`);
        }
        num++;
      }

      while (num < 10) {
        await sleep(100);
      }

      expect(num).assertEqual(10);
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   executeDelayedTaskErrorTest0900
     * @tc.number SUB_EXECUTE_DELAYED_TASK_ERROR_TEST_0900
     * @tc.desc   Testing Task catch ThrowError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('executeDelayedTaskErrorTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'executeDelayedTaskErrorTest0900';
      console.info(`${caseName} test start`);
      let num = 0;
      const nTask: taskpool.Task = new taskpool.Task(normalTask, caseName);
      const eTask: taskpool.Task = new taskpool.Task(errorTask, caseName);

      for (let i = 1; i <= 10; i++) {
        try {
          // 执行正常任务
          taskpool.executeDelayed(100, nTask)
          // 执行抛异常任务
          taskpool.executeDelayed(100, eTask).catch(() => {
            console.log(`catch Task ${caseName} executed`);
            try {
              throw new Error(`Error in task ${caseName}`)
            } catch (err) {
              console.error(`${caseName} executing error task failed, error: ${err.message}`);
              expect(err.message).assertContain(`Error in task ${caseName}`);
            }
          })
        } catch (err) {
          console.error(`${caseName} executing error task failed, error: ${err.message}`);
          expect(err.message).assertContain(`Error in task ${caseName}`);
        }
        num++;
      }

      while (num < 10) {
        await sleep(100);
      }

      expect(num).assertEqual(10);
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   executeDelayedTaskErrorTest1000
     * @tc.number SUB_EXECUTE_DELAYED_TASK_ERROR_TEST_1000
     * @tc.desc   Testing Task catch ThrowError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('executeDelayedTaskErrorTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'executeDelayedTaskErrorTest1000';
      console.info(`${caseName} test start`);
      let num = 0;
      const nTask: taskpool.Task = new taskpool.Task(normalTask, caseName);
      const eTask: taskpool.Task = new taskpool.Task(normalTask, caseName);

      for (let i = 1; i <= 10; i++) {
        try {
          // 执行正常任务
          taskpool.executeDelayed(100, nTask)
          // 执行抛异常任务
          taskpool.executeDelayed(100, eTask).finally(() => {
            console.log(`finally Task ${caseName} executed`);
            throw new Error(`Error in task ${caseName}`)
          })
        } catch (err) {
          console.error(`${caseName} executing error task failed, error: ${err.message}`);
          expect(err.message).assertContain(`Error in task ${caseName}`);
        }
        num++;
      }

      while (num < 10) {
        await sleep(100);
      }

      expect(num).assertEqual(10);
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   executeDelayedTaskErrorTest1100
     * @tc.number SUB_EXECUTE_DELAYED_TASK_ERROR_TEST_1100
     * @tc.desc   Testing asyncLock Task ThrowError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('executeDelayedTaskErrorTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'executeDelayedTaskErrorTest1100';
      console.info(`${caseName} test start`);
      let num = 0;
      const nTask: taskpool.Task = new taskpool.Task(normalTask, caseName);
      const eTask: taskpool.Task = new taskpool.Task(asyncLockErrorTask, caseName);

      for (let i = 1; i <= 10; i++) {
        try {
          // 执行正常任务
          taskpool.executeDelayed(100, nTask)
          // 执行抛异常任务
          taskpool.executeDelayed(100, eTask)
        } catch (err) {
          console.error(`${caseName} executing error task failed, error: ${err.message}`);
          expect(err.message).assertContain(`Error in task ${caseName}`);
        }
        num++;
      }

      while (num < 10) {
        await sleep(100);
      }

      expect(num).assertEqual(10);
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   executeDelayedTaskErrorTest1200
     * @tc.number SUB_EXECUTE_DELAYED_TASK_ERROR_TEST_1200
     * @tc.desc   Testing asyncLock Task then ThrowError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('executeDelayedTaskErrorTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'executeDelayedTaskErrorTest1200';
      console.info(`${caseName} test start`);
      let num = 0;
      const nTask: taskpool.Task = new taskpool.Task(normalTask, caseName);
      const eTask: taskpool.Task = new taskpool.Task(asyncLockNormalTask, caseName);

      for (let i = 1; i <= 10; i++) {
        try {
          // 执行正常任务
          taskpool.executeDelayed(100, nTask)
          // 执行抛异常任务
          taskpool.executeDelayed(100, eTask).then(() => {
            console.log(`asyncLockNormalTask then Task ${caseName} executed`);
            throw new Error(`Error in task ${caseName}`)
          })
        } catch (err) {
          console.error(`${caseName} executing error task failed, error: ${err.message}`);
          expect(err.message).assertContain(`Error in task ${caseName}`);
        }
        num++;
      }

      while (num < 10) {
        await sleep(100);
      }

      expect(num).assertEqual(10);
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   executeDelayedTaskErrorTest1300
     * @tc.number SUB_EXECUTE_DELAYED_TASK_ERROR_TEST_1300
     * @tc.desc   Testing asyncLock Task catch ThrowError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('executeDelayedTaskErrorTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'executeDelayedTaskErrorTest1300';
      console.info(`${caseName} test start`);
      let num = 0;
      const nTask: taskpool.Task = new taskpool.Task(normalTask, caseName);
      const eTask: taskpool.Task = new taskpool.Task(asyncLockErrorTask, caseName);

      for (let i = 1; i <= 10; i++) {
        try {
          // 执行正常任务
          taskpool.executeDelayed(100, nTask)
          // 执行抛异常任务
          taskpool.executeDelayed(100, eTask).catch(() => {
            console.log(`asyncLockNormalTask catch Task ${caseName} executed`);
            try {
              throw new Error(`Error in task ${caseName}`)
            } catch (err) {
              console.error(`${caseName} executing error task failed, error: ${err.message}`);
              expect(err.message).assertContain(`Error in task ${caseName}`);
            }
          })
        } catch (err) {
          console.error(`${caseName} executing error task failed, error: ${err.message}`);
          expect(err.message).assertContain(`Error in task ${caseName}`);
        }
        num++;
      }

      while (num < 10) {
        await sleep(100);
      }

      expect(num).assertEqual(10);
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   executeDelayedTaskErrorTest1400
     * @tc.number SUB_EXECUTE_DELAYED_TASK_ERROR_TEST_1400
     * @tc.desc   Testing asyncLock Task finally ThrowError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('executeDelayedTaskErrorTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'executeDelayedTaskErrorTest1400';
      console.info(`${caseName} test start`);
      let num = 0;
      const nTask: taskpool.Task = new taskpool.Task(normalTask, caseName);
      const eTask: taskpool.Task = new taskpool.Task(asyncLockNormalTask, caseName);

      for (let i = 1; i <= 10; i++) {
        try {
          // 执行正常任务
          taskpool.executeDelayed(100, nTask)
          // 执行抛异常任务
          taskpool.executeDelayed(100, eTask).finally(() => {
            console.log(`asyncLockNormalTask finally Task ${caseName} executed`);
            throw new Error(`Error in task ${caseName}`)
          })
        } catch (err) {
          console.error(`${caseName} executing error task failed, error: ${err.message}`);
          expect(err.message).assertContain(`Error in task ${caseName}`);
        }
        num++;
      }

      while (num < 10) {
        await sleep(100);
      }

      expect(num).assertEqual(10);
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   executeDelayedTaskErrorTest1500
     * @tc.number SUB_EXECUTE_DELAYED_TASK_ERROR_TEST_1500
     * @tc.desc   Testing asyncLock Task finally ThrowError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('executeDelayedTaskErrorTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'executeDelayedTaskErrorTest1500';
      console.info(`${caseName} test start`);
      let num = 0;
      const nTask: taskpool.Task = new taskpool.Task(promiseNormalTask, caseName);
      const eTask: taskpool.Task = new taskpool.Task(promiseErrorTask, caseName);

      for (let i = 1; i <= 10; i++) {
        try {
          // 执行正常任务
          taskpool.executeDelayed(100, nTask)
          // 执行抛异常任务
          taskpool.executeDelayed(100, eTask)
        } catch (err) {
          console.error(`${caseName} executing error task failed, error: ${err.message}`);
          expect(err.message).assertContain(`Error in task ${caseName}`);
        }
        num++;
      }

      while (num < 10) {
        await sleep(100);
      }

      expect(num).assertEqual(10);
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   executeDelayedTaskErrorTest1600
     * @tc.number SUB_EXECUTE_DELAYED_TASK_ERROR_TEST_1600
     * @tc.desc   Testing promise Task then ThrowError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('executeDelayedTaskErrorTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'executeDelayedTaskErrorTest1600';
      console.info(`${caseName} test start`);
      let num = 0;
      const nTask: taskpool.Task = new taskpool.Task(promiseNormalTask, caseName);
      const eTask: taskpool.Task = new taskpool.Task(promiseNormalTask, caseName);

      for (let i = 1; i <= 10; i++) {
        try {
          // 执行正常任务
          taskpool.executeDelayed(100, nTask)
          // 执行抛异常任务
          taskpool.executeDelayed(100, eTask).then(() => {
            console.log(`promiseNormalTask then Task ${caseName} executed`);
            throw new Error(`Error in task ${caseName}`)
          })
        } catch (err) {
          console.error(`${caseName} executing error task failed, error: ${err.message}`);
          expect(err.message).assertContain(`Error in task ${caseName}`);
        }
        num++;
      }

      while (num < 10) {
        await sleep(100);
      }

      expect(num).assertEqual(10);
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   executeDelayedTaskErrorTest1700
     * @tc.number SUB_EXECUTE_DELAYED_TASK_ERROR_TEST_1700
     * @tc.desc   Testing asyncLock Task finally ThrowError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('executeDelayedTaskErrorTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'executeDelayedTaskErrorTest1700';
      console.info(`${caseName} test start`);
      let num = 0;
      const nTask: taskpool.Task = new taskpool.Task(promiseNormalTask, caseName);
      const eTask: taskpool.Task = new taskpool.Task(promiseErrorTask, caseName);

      for (let i = 1; i <= 10; i++) {
        try {
          // 执行正常任务
          taskpool.executeDelayed(100, nTask)
          // 执行抛异常任务
          taskpool.executeDelayed(100, eTask).catch(() => {
            console.log(`promiseNormalTask catch Task ${caseName} executed`);
            try {
              throw new Error(`Error in task ${caseName}`)
            } catch (err) {
              console.error(`${caseName} executing error task failed, error: ${err.message}`);
              expect(err.message).assertContain(`Error in task ${caseName}`);
            }
          })
        } catch (err) {
          console.error(`${caseName} executing error task failed, error: ${err.message}`);
          expect(err.message).assertContain(`Error in task ${caseName}`);
        }
        num++;
      }

      while (num < 10) {
        await sleep(100);
      }

      expect(num).assertEqual(10);
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   executeDelayedTaskErrorTest1800
     * @tc.number SUB_EXECUTE_DELAYED_TASK_ERROR_TEST_1800
     * @tc.desc   Testing asyncLock Task finally ThrowError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('executeDelayedTaskErrorTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'executeDelayedTaskErrorTest1800';
      console.info(`${caseName} test start`);
      let num = 0;
      const nTask: taskpool.Task = new taskpool.Task(promiseNormalTask, caseName);
      const eTask: taskpool.Task = new taskpool.Task(promiseNormalTask, caseName);

      for (let i = 1; i <= 10; i++) {
        try {
          // 执行正常任务
          taskpool.executeDelayed(100, nTask)
          // 执行抛异常任务
          taskpool.executeDelayed(100, eTask).finally(() => {
            console.log(`promiseNormalTask finally Task ${caseName} executed`);
            throw new Error(`Error in task ${caseName}`)
          })
        } catch (err) {
          console.error(`${caseName} executing error task failed, error: ${err.message}`);
          expect(err.message).assertContain(`Error in task ${caseName}`);
        }
        num++;
      }

      while (num < 10) {
        await sleep(100);
      }

      expect(num).assertEqual(10);
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   executeDelayedTaskErrorTest1900
     * @tc.number SUB_EXECUTE_DELAYED_TASK_ERROR_TEST_1900
     * @tc.desc   Testing setTimeout Task ThrowError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('executeDelayedTaskErrorTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'executeDelayedTaskErrorTest1900';
      console.info(`${caseName} test start`);
      let num = 0;
      const nTask: taskpool.Task = new taskpool.Task(normalTask, caseName);
      const eTask: taskpool.Task = new taskpool.Task(setTimeoutErrorTask, caseName);

      for (let i = 1; i <= 10; i++) {
        try {
          // 执行正常任务
          taskpool.executeDelayed(100, nTask)
          // 执行抛异常任务
          taskpool.executeDelayed(100, eTask)
        } catch (err) {
          console.error(`${caseName} executing error task failed, error: ${err.message}`);
          expect(err.message).assertContain(`Error in task ${caseName}`);
        }
        num++;
      }

      while (num < 10) {
        await sleep(100);
      }

      expect(num).assertEqual(10);
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   executeDelayedTaskErrorTest2000
     * @tc.number SUB_EXECUTE_DELAYED_TASK_ERROR_TEST_2000
     * @tc.desc   Testing async Task ThrowError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('executeDelayedTaskErrorTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'executeDelayedTaskErrorTest2000';
      console.info(`${caseName} test start`);
      let num = 0;
      const nTask: taskpool.Task = new taskpool.Task(normalTask, caseName);
      const eTask: taskpool.Task = new taskpool.Task(asyncErrorTask, caseName);

      for (let i = 1; i <= 10; i++) {
        try {
          // 执行正常任务
          taskpool.executeDelayed(100, nTask)
          // 执行抛异常任务
          taskpool.executeDelayed(100, eTask)
        } catch (err) {
          console.error(`${caseName} executing error task failed, error: ${err.message}`);
          expect(err.message).assertContain(`Error in task ${caseName}`);
        }
        num++;
      }

      while (num < 10) {
        await sleep(100);
      }

      expect(num).assertEqual(10);
      done();
      console.info(`${caseName} test end`);
    })

    // wait/waitFor 8条用例（预留 21，22，23，24，25，26,27,28）

    /**
     * @tc.name   executeDelayedTaskErrorTest2900
     * @tc.number SUB_EXECUTE_DELAYED_TASK_ERROR_TEST_2900
     * @tc.desc   Testing worker Task ThrowError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('executeDelayedTaskErrorTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'executeDelayedTaskErrorTest2900';
      console.info(`${caseName} test start`);
      let num = 0;
      const nTask: taskpool.Task = new taskpool.Task(normalTask, caseName);
      const eTask: taskpool.Task = new taskpool.Task(asyncErrorTask, caseName);
      const workerInstance = new worker.ThreadWorker('../testability/pages/workers/ExecuteDelayWorker.ets');

      for (let i = 1; i <= 10; i++) {
        try {
          // 执行正常任务
          taskpool.executeDelayed(100, nTask)
          // 执行抛异常任务
          workerInstance.once('test_once', async () => {
            try {
              taskpool.executeDelayed(100, eTask)
            } catch (err) {
              console.error(`${caseName} workerInstance executing error task failed, error: ${err.message}`);
              throw new Error(`Error in task ${caseName}`)
            }
          })
          workerInstance.dispatchEvent({type:"test_once", timeStamp:0})
        } catch (err) {
          console.error(`${caseName} executing error task failed, error: ${err.message}`);
          expect(err.message).assertContain(`Error in task ${caseName}`);
        }
        num++;
      }

      while (num < 10) {
        await sleep(100);
      }

      // 销毁Worker线程，终止Worker接收消息。
      workerInstance.terminate();

      expect(num).assertEqual(10);
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   executeDelayedTaskErrorTest3000
     * @tc.number SUB_EXECUTE_DELAYED_TASK_ERROR_TEST_3000
     * @tc.desc   Testing worker Task onmessage ThrowError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('executeDelayedTaskErrorTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'executeDelayedTaskErrorTest3000';
      console.info(`${caseName} test start`);
      let num = 0;
      const nTask: taskpool.Task = new taskpool.Task(normalTask, caseName);
      const eTask: taskpool.Task = new taskpool.Task(errorTask, caseName);
      const workerInstance = new worker.ThreadWorker('../testability/pages/workers/ExecuteDelayWorker.ets');

      for (let i = 1; i <= 10; i++) {
        try {
          // 执行正常任务
          taskpool.executeDelayed(100, nTask)
          // 执行抛异常任务
          workerInstance.onmessage = async (event: MessageEvents) => {
            try {
              taskpool.executeDelayed(100, eTask)
            } catch (err) {
              console.error(`${caseName} workerInstance onmessage executing error task failed, error: ${err.message}`);
              throw new Error(`Error in task ${caseName}`)
            }
          };
          workerInstance.postMessage('1')
        } catch (err) {
          console.error(`${caseName} executing error task failed, error: ${err.message}`);
          expect(err.message).assertContain(`Error in task ${caseName}`);
        }
        num++;
      }

      while (num < 10) {
        await sleep(100);
      }

      // 销毁Worker线程，终止Worker接收消息。
      workerInstance.terminate();

      expect(num).assertEqual(10);
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   executeDelayedTaskErrorTest3100
     * @tc.number SUB_EXECUTE_DELAYED_TASK_ERROR_TEST_3100
     * @tc.desc   Testing errorTask2 Task ThrowError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('executeDelayedTaskErrorTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'executeDelayedTaskErrorTest3100';
      console.info(`${caseName} test start`);
      let num = 0;

      const nTask: taskpool.Task = new taskpool.Task(normalTask, caseName);
      const eTask: taskpool.Task = new taskpool.Task(errorTask2, caseName);

      for (let i = 1; i <= 10; i++) {
        try {
          // 执行正常任务
          taskpool.executeDelayed(100, nTask)
          // 执行抛异常任务
          taskpool.executeDelayed(100, eTask)
        } catch (err) {
          console.error(`${caseName} executing error task failed, error: ${err.message}`);
          expect(err.message).assertContain(`Error in task ${caseName}`);
        }
        num++;
      }

      while (num < 10) {
        await sleep(100);
      }

      expect(num).assertEqual(10);
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   executeDelayedTaskErrorTest3200
     * @tc.number SUB_EXECUTE_DELAYED_TASK_ERROR_TEST_3200
     * @tc.desc   Testing errorTaskThen2 Task finally ThrowError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('executeDelayedTaskErrorTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'executeDelayedTaskErrorTest3200';
      console.info(`${caseName} test start`);
      let num = 0;
      const nTask: taskpool.Task = new taskpool.Task(normalTask, caseName);
      const eTask: taskpool.Task = new taskpool.Task(errorTaskThen2, caseName);

      for (let i = 1; i <= 10; i++) {
        try {
          // 执行正常任务
          taskpool.executeDelayed(100, nTask)
          // 执行抛异常任务
          taskpool.executeDelayed(100, eTask)
        } catch (err) {
          console.error(`${caseName} executing error task failed, error: ${err.message}`);
          expect(err.message).assertContain(`Error in task ${caseName}`);
        }
        num++;
      }

      while (num < 10) {
        await sleep(100);
      }

      expect(num).assertEqual(10);
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   executeDelayedTaskErrorTest3300
     * @tc.number SUB_EXECUTE_DELAYED_TASK_ERROR_TEST_3300
     * @tc.desc   Testing errorTaskCatch2 Task ThrowError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('executeDelayedTaskErrorTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'executeDelayedTaskErrorTest3300';
      console.info(`${caseName} test start`);
      let num = 0;
      const nTask: taskpool.Task = new taskpool.Task(normalTask, caseName);
      const eTask: taskpool.Task = new taskpool.Task(errorTaskCatch2, caseName);

      for (let i = 1; i <= 10; i++) {
        try {
          // 执行正常任务
          taskpool.executeDelayed(100, nTask)
          // 执行抛异常任务
          taskpool.executeDelayed(100, eTask)
        } catch (err) {
          console.error(`${caseName} executing error task failed, error: ${err.message}`);
          expect(err.message).assertContain(`Error in task ${caseName}`);
        }
        num++;
      }

      while (num < 10) {
        await sleep(100);
      }

      expect(num).assertEqual(10);
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   executeDelayedTaskErrorTest3400
     * @tc.number SUB_EXECUTE_DELAYED_TASK_ERROR_TEST_3400
     * @tc.desc   Testing errorTaskFinally2 Task finally ThrowError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('executeDelayedTaskErrorTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'executeDelayedTaskErrorTest3400';
      console.info(`${caseName} test start`);
      let num = 0;
      const nTask: taskpool.Task = new taskpool.Task(normalTask, caseName);
      const eTask: taskpool.Task = new taskpool.Task(errorTaskFinally2, caseName);

      for (let i = 1; i <= 10; i++) {
        try {
          // 执行正常任务
          taskpool.executeDelayed(100, nTask)
          // 执行抛异常任务
          taskpool.executeDelayed(100, eTask)
        } catch (err) {
          console.error(`${caseName} executing error task failed, error: ${err.message}`);
          expect(err.message).assertContain(`Error in task ${caseName}`);
        }
        num++;
      }

      while (num < 10) {
        await sleep(100);
      }

      expect(num).assertEqual(10);
      done();
      console.info(`${caseName} test end`);
    })
  })
}