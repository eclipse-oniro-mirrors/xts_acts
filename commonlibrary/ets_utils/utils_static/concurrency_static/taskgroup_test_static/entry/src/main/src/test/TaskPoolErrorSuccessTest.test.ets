/*
* Copyright (c) 2025 Huawei Device Co., Ltd.
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

import hilog from '@ohos.hilog';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType} from "../../../hypium/index";
import {
  asyncLock,
  asyncLock1,
  asyncLock2,
  asyncLock3,
  printArgs1,
  printArgs2,
  printArgs3,
  printArgs4,
  printArgs5,
  printArgs6,
  printArgs7,
  printArgs8,
  printArgs9,
} from '../testability/pages/TaskMethodTest';
import { Count1, Count2, Count3, Count4 } from '../testability/pages/DataFlg';
import {
  AsyncLockTest,
  AsyncLockTestCatch,
  AsyncLockTestFinally,
  AsyncLockTestThen,
} from '../testability/pages/SendableTest';
import { BusinessError } from '@ohos.base';
import { sleep } from '../testability/pages/Utils';

export default function taskPoolErrorSuccessTest() {
  describe('TaskPoolErrorSuccessTest', (): void => {
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
    afterEach(async (): Promise<void> => {
      await sleep(2000)
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll((): void => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.number TASKPOOL_TASK_ERROR_SUCCESS_TEST_0100
     * @tc.name taskPoolTaskErrorSuccessTest1001
     * @tc.desc test ErrorSuccess
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolTaskErrorSuccessTest1001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {

      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.

      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(printArgs1, 1.0);
      taskGroup.addTask(printArgs3, 1.0);

      Count1.count = 0
      Count2.count = 0

      for (let i = 0; i < 1; i++) {
        taskpool.execute(taskGroup).then((num: Array<Any>) => {
          Count1.count = Count1.count + (num[0] as Number)
          console.info('======', Count1.count, Count2.count)
        }).catch((err: Any) => {
          Count2.count += 1
          console.error('=======', JSON.stringify(err))
        })
      }

      while (Count2.count < 1) {
        await sleep(100)
      }
      expect(0).assertEqual(Count1.count)
      expect(1).assertEqual(Count2.count)
      Count1.count = 0
      Count2.count = 0
      done()
    })

    /**
     * @tc.number TASKPOOL_TASK_ERROR_SUCCESS_TEST_0400
     * @tc.name taskPoolTaskErrorSuccessTest1004
     * @tc.desc test onExecutionSucceeded
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolTaskErrorSuccessTest1004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {

      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.

      let task: taskpool.Task = new taskpool.Task(printArgs1, 1.0);
      let task2: taskpool.Task = new taskpool.Task(printArgs2, 1.0);
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(task)
      taskGroup.addTask(task2)
      let count: Number = 0.0
      let count2: Number = 0.0

      task.onExecutionSucceeded(() => {
        console.info("====onExecutionSucceeded: execute task success")
        count++
      });
      task2.onExecutionSucceeded(() => {
        console.info("====onExecutionSucceeded2: execute task success")
        try {
          let s: string[] = []
          s[0].split('')[1].toString()
        } catch (e) {
          count2 += 1
        }
      })

      for (let i = 0; i < 1; i++) {
        taskpool.execute(taskGroup).then((num: Array<Any>) => {
          console.info("====taskpool: execute task success")
        }).catch((err: Any) => {
          console.error("====taskpool: execute task err")
          count2 = 0
          count = 0
        });
      }

      while (count < 1 || count2 < 1) {
        await sleep(100)
      }
      expect(String(1)).assertEqual(String(count))
      expect(String(1)).assertEqual(String(count2))
      done()
    })
    /**
     * @tc.number TASKPOOL_TASK_ERROR_SUCCESS_TEST_0600
     * @tc.name taskPoolTaskErrorSuccessTest1006
     * @tc.desc test Task
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolTaskErrorSuccessTest1006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {

      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.

      let task: taskpool.Task = new taskpool.Task(printArgs1, 1.0);
      let task2: taskpool.Task = new taskpool.Task(printArgs2, 1.0);
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(task)
      taskGroup.addTask(task2)
      let count: Number = 0
      let count2: Number = 0

      for (let i = 0; i < 1; i++) {
        taskpool.execute(taskGroup).then((num: Array<Any>) => {
          count += (num[0] as Number)
          let s: string[] = []
          s[0].split('')[1].toString()
        }).catch((e: Any) => {
          count2 ++
        })

      }

      while (count < 1 || count2 < 1) {
        await sleep(100)
      }

      expect(String(1)).assertEqual(String(count))
      expect(String(1)).assertEqual(String(count2))
      done()
    })

    /**
     * @tc.number TASKPOOL_TASK_ERROR_SUCCESS_TEST_0701
     * @tc.name taskPoolTaskErrorSuccessTest1007
     * @tc.desc test Task
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolTaskErrorSuccessTest1007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {

      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.

      let task: taskpool.Task = new taskpool.Task(printArgs1, 1.0);
      let task2: taskpool.Task = new taskpool.Task(printArgs2, 1.0);
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(task);
      taskGroup.addTask(task2);
      let count: Number = 0
      let count2: Number = 0

      for (let i = 0; i < 1; i++) {
        taskpool.execute(taskGroup).then((num: Array<Any>) => {
          count += (num[0] as Number)
          let s: string[] = []
          s[0].split('')[1].toString()
        }).catch((e: Any) => {
          let s: string[] = []
          s[0].split('')[1].toString()
        }).catch((err: Any) => {
          count2 ++
        })
      }

      while (count < 1 || count2 < 1) {
        await sleep(100)
      }

      expect(String(1)).assertEqual(String(count))
      expect(String(1)).assertEqual(String(count2))
      done()
    })

    /**
     * @tc.number TASKPOOL_TASK_ERROR_SUCCESS_TEST_0800
     * @tc.name taskPoolTaskErrorSuccessTest1008
     * @tc.desc test Task
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolTaskErrorSuccessTest1008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {

      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.

      let task: taskpool.Task = new taskpool.Task(printArgs1, 1.0);
      let task2: taskpool.Task = new taskpool.Task(printArgs2, 1.0);
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(task);
      taskGroup.addTask(task2);
      let count: Number = 0
      let count2: Number = 0

      for (let i = 0; i < 1; i++) {
        taskpool.execute(taskGroup).then((num: Array<Any>) => {
          count += 1
        }).finally(() => {
          let s: string[] = []
          s[0].split('')[1].toString()
        }).catch((err: Any) => {
          count2 ++
        })
      }

      while (count < 1 || count2 < 1) {
        await sleep(100)
      }

      expect(String(1)).assertEqual(String(count))
      expect(String(1)).assertEqual(String(count2))
      done()
    })

    /**
     * @tc.number TASKPOOL_TASK_ERROR_SUCCESS_TEST_0700
     * @tc.name taskPoolTaskErrorSuccessTest1009
     * @tc.desc test asyncLock
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolTaskErrorSuccessTest1009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {

      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.

      let asyncLockTest = new AsyncLockTest()
      let task: taskpool.Task = new taskpool.Task(printArgs1, 1.0);
      let task2: taskpool.Task = new taskpool.Task(asyncLock, asyncLockTest);
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(task);
      taskGroup.addTask(task2);
      let count: Number = 0.0
      let count2: Number = 0.0

      for (let i = 0; i < 1; i++) {
        taskpool.execute(taskGroup).then((num: Array<Any>) => {
          count += 1.0
        }).catch((e: Any) => {
          count2 ++
        })
      }

      while (count2 < 1) {
        await sleep(100)
      }

      expect(String(0)).assertEqual(String(count))
      expect(String(1)).assertEqual(String(count2))
      done()
    })

    /**
     * @tc.number TASKPOOL_TASK_ERROR_SUCCESS_TEST_1000
     * @tc.name taskPoolTaskErrorSuccessTest1010
     * @tc.desc test onEnqueued
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolTaskErrorSuccessTest1010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {

      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.

      let task: taskpool.Task = new taskpool.Task(printArgs1, 1.0);
      let task2: taskpool.Task = new taskpool.Task(printArgs2, 1.0);
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(task);
      taskGroup.addTask(task2);
      let count: Number = 0
      let count2: Number = 0
      Count1.count = 0
      Count2.count = 0

      task.onEnqueued(() => {
        count++
      });
      task2.onEnqueued(() => {
        try {
          let s: string[] = []
          s[0].split('')[1].toString()
        } catch (e) {
          count2++
        }
      });

      for (let i = 0; i < 1; i++) {
        taskpool.execute(taskGroup).then((num: Array<Any>) => {
          Count1.count = Count1.count + 1
          console.info("taskpool: execute task success")
        });
      }

      while (Count1.count < 1 || count2 < 1 || count < 1) {
        await sleep(100)
      }
      expect(String(1)).assertEqual(String(count))
      expect(String(1)).assertEqual(String(count2))
      expect(1).assertEqual(Count1.count)
      Count1.count = 0
      Count2.count = 0
      done()
    })

    /**
     * @tc.number TASKPOOL_TASK_ERROR_SUCCESS_TEST_1300
     * @tc.name taskPoolTaskErrorSuccessTest1013
     * @tc.desc test asyncLock-catch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolTaskErrorSuccessTest1013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {

      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.

      let asyncLockTest = new AsyncLockTestCatch()
      let task: taskpool.Task = new taskpool.Task(printArgs1, 1.0);
      let task2: taskpool.Task = new taskpool.Task(asyncLock, asyncLockTest);
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(task);
      taskGroup.addTask(task2);
      let count: Number = 0
      let count2: Number = 0

      for (let i = 0; i < 1; i++) {
        taskpool.execute(taskGroup).then((e: Array<Any>) => {
          count ++
        }).catch((e: Any) => {
          count2 ++
        })
      }

      while (count2 < 1) {
        await sleep(100)
      }

      expect(String(0)).assertEqual(String(count))
      expect(String(1)).assertEqual(String(count2))
      done()
    })

    /**
     * @tc.number TASKPOOL_TASK_ERROR_SUCCESS_TEST_1400
     * @tc.name taskPoolTaskErrorSuccessTest1014
     * @tc.desc test asyncLock-finally
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolTaskErrorSuccessTest1014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {

      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.

      let asyncLockTest = new AsyncLockTestFinally()
      let task: taskpool.Task = new taskpool.Task(printArgs1, 1.0);
      let task2: taskpool.Task = new taskpool.Task(asyncLock, asyncLockTest);
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(task);
      taskGroup.addTask(task2);
      let count: Number = 0
      let count2: Number = 0

      for (let i = 0; i < 1; i++) {
        taskpool.execute(taskGroup).then((e: Array<Any>) => {
          count ++
        }).catch((error: Any) => {
          count2 ++
        })
      }

      while (count2 < 1) {
        await sleep(100)
      }

      expect(String(0)).assertEqual(String(count))
      expect(String(1)).assertEqual(String(count2))
      done()
    })

    /**
     * @tc.number TASKPOOL_TASK_ERROR_SUCCESS_TEST_1500
     * @tc.name taskPoolTaskErrorSuccessTest1015
     * @tc.desc test task-then
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolTaskErrorSuccessTest1015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {

      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.

      let asyncLockTest = new AsyncLockTestFinally()
      let task: taskpool.Task = new taskpool.Task(printArgs1, 1.0);
      let task2: taskpool.Task = new taskpool.Task(asyncLock1, asyncLockTest);
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(task);
      taskGroup.addTask(task2);
      let count: Number = 0
      let count2: Number = 0

      for (let i = 0; i < 1; i++) {
        taskpool.execute(taskGroup).then((e: Array<Any>) => {
          count ++
        }).catch((error: Any) => {
          count2 ++
        })
      }

      while (count2 < 1) {
        await sleep(100)
      }

      expect(String(0)).assertEqual(String(count))
      expect(String(1)).assertEqual(String(count2))
      done()
    })

    /**
     * @tc.number TASKPOOL_TASK_ERROR_SUCCESS_TEST_1600
     * @tc.name taskPoolTaskErrorSuccessTest1016
     * @tc.desc test task-catch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolTaskErrorSuccessTest1016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {

      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.

      let asyncLockTest = new AsyncLockTestFinally()
      let task: taskpool.Task = new taskpool.Task(printArgs1, 1.0);
      let task2: taskpool.Task = new taskpool.Task(asyncLock2, asyncLockTest);
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(task);
      taskGroup.addTask(task2);
      let count: Number = 0
      let count2: Number = 0

      for (let i = 0; i < 1; i++) {
        taskpool.execute(taskGroup).then((e: Array<Any>) => {
          count ++
        }).catch((error: Any) => {
          count2 ++
        })
      }

      while (count2 < 1) {
        await sleep(100)
      }

      expect(String(0)).assertEqual(String(count))
      expect(String(1)).assertEqual(String(count2))
      done()
    })

    /**
     * @tc.number TASKPOOL_TASK_ERROR_SUCCESS_TEST_1700
     * @tc.name taskPoolTaskErrorSuccessTest1017
     * @tc.desc test task-finally
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolTaskErrorSuccessTest1017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {

      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.

      let asyncLockTest = new AsyncLockTestFinally()
      let task: taskpool.Task = new taskpool.Task(printArgs1, 1.0);
      let task2: taskpool.Task = new taskpool.Task(asyncLock3, asyncLockTest);
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(task);
      taskGroup.addTask(task2);
      let count: Number = 0
      let count2: Number = 0

      for (let i = 0; i < 1; i++) {
        taskpool.execute(taskGroup).then((e: Array<Any>) => {
          count ++
        }).catch((error: Any) => {
          count2 ++
        })
      }

      while (count2 < 1) {
        await sleep(100)
      }

      expect(String(0)).assertEqual(String(count))
      expect(String(1)).assertEqual(String(count2))
      done()
    })

    /**
     * @tc.number TASKPOOL_TASK_ERROR_SUCCESS_TEST_1800
     * @tc.name taskPoolTaskErrorSuccessTest1018
     * @tc.desc test task-promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolTaskErrorSuccessTest1018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {

      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.

      let asyncLockTest = new AsyncLockTest()
      let task: taskpool.Task = new taskpool.Task(printArgs1, 1.0);
      let task2: taskpool.Task = new taskpool.Task(asyncLock, asyncLockTest);
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(task);
      taskGroup.addTask(task2);
      let count: Number = 0
      let count2: Number = 0

      for (let i = 0; i < 1; i++) {
        taskpool.execute(taskGroup).then((e: Array<Any>) => {
          count ++
        }).catch((error: Any) => {
          count2 ++
        })
      }

      while (count2 < 1) {
        await sleep(100)
      }

      expect(String(0)).assertEqual(String(count))
      expect(String(1)).assertEqual(String(count2))
      done()
    })

    /**
     * @tc.number TASKPOOL_TASK_ERROR_SUCCESS_TEST_2000
     * @tc.name taskPoolTaskErrorSuccessTest1020
     * @tc.desc test async-error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolTaskErrorSuccessTest1020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {

      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.

      let asyncLockTest = new AsyncLockTest()
      let task: taskpool.Task = new taskpool.Task(printArgs1, 1.0);
      let task2: taskpool.Task = new taskpool.Task(asyncLock, asyncLockTest);
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(task);
      taskGroup.addTask(task2);
      let count: Number = 0
      let count2: Number = 0

      for (let i = 0; i < 1; i++) {
        taskpool.execute(taskGroup).then((e: Array<Any>) => {
          count ++
        }).catch((error: Any) => {
          count2 ++
        })
      }

      while (count2 < 1) {
        await sleep(100)
      }

      expect(String(0)).assertEqual(String(count))
      expect(String(1)).assertEqual(String(count2))
      done()
    })

    /**
     * @tc.number TASKPOOL_TASK_ERROR_SUCCESS_TEST_2100
     * @tc.name taskPoolTaskErrorSuccessTest1021
     * @tc.desc test await-error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolTaskErrorSuccessTest1021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {

      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.

      let asyncLockTest = new AsyncLockTest()
      let task: taskpool.Task = new taskpool.Task(printArgs1, 1.0);
      let task2: taskpool.Task = new taskpool.Task(asyncLock, asyncLockTest);
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(task);
      taskGroup.addTask(task2);
      let count: Number = 0
      let count2: Number = 0

      for (let i = 0; i < 1; i++) {
        taskpool.execute(taskGroup).then((e: Array<Any>) => {
          count ++
        }).catch((error: Any) => {
          count2 ++
        })
      }

      while (count2 < 1) {
        await sleep(100)
      }

      expect(String(0)).assertEqual(String(count))
      expect(String(1)).assertEqual(String(count2))
      done()
    })

    /**
     * @tc.number TASKPOOL_TASK_ERROR_SUCCESS_TEST_2200
     * @tc.name taskPoolTaskErrorSuccessTest1022
     * @tc.desc test await-then
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolTaskErrorSuccessTest1022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {

      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.

      let asyncLockTest = new AsyncLockTestFinally()
      let task: taskpool.Task = new taskpool.Task(printArgs1, 1.0);
      let task2: taskpool.Task = new taskpool.Task(asyncLock1, asyncLockTest);
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(task);
      taskGroup.addTask(task2);
      let count: Number = 0
      let count2: Number = 0

      for (let i = 0; i < 1; i++) {
        taskpool.execute(taskGroup).then((e: Array<Any>) => {
          count ++
        }).catch((error: Any) => {
          count2 ++
        })
      }

      while (count2 < 1) {
        await sleep(100)
      }

      expect(String(0)).assertEqual(String(count))
      expect(String(1)).assertEqual(String(count2))
      done()
    })

    /**
     * @tc.number TASKPOOL_TASK_ERROR_SUCCESS_TEST_2300
     * @tc.name taskPoolTaskErrorSuccessTest1023
     * @tc.desc test await-catch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolTaskErrorSuccessTest1023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {

      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.

      let asyncLockTest = new AsyncLockTestFinally()
      let task: taskpool.Task = new taskpool.Task(printArgs1, 1.0);
      let task2: taskpool.Task = new taskpool.Task(asyncLock2, asyncLockTest);
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(task);
      taskGroup.addTask(task2);
      let count: Number = 0
      let count2: Number = 0

      for (let i = 0; i < 1; i++) {
        taskpool.execute(taskGroup).then((e: Array<Any>) => {
          count ++
        }).catch((error: Any) => {
          count2 ++
        })
      }

      while (count2 < 1) {
        await sleep(100)
      }

      expect(String(0)).assertEqual(String(count))
      expect(String(1)).assertEqual(String(count2))
      done()
    })

    /**
     * @tc.number TASKPOOL_TASK_ERROR_SUCCESS_TEST_2400
     * @tc.name taskPoolTaskErrorSuccessTest1024
     * @tc.desc test await-finally
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolTaskErrorSuccessTest1024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {

      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.

      let asyncLockTest = new AsyncLockTestFinally()
      let task: taskpool.Task = new taskpool.Task(printArgs1, 1.0);
      let task2: taskpool.Task = new taskpool.Task(asyncLock3, asyncLockTest);
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();

      taskGroup.addTask(task);
      taskGroup.addTask(task2);
      let count: Number = 0
      let count2: Number = 0

      for (let i = 0; i < 1; i++) {
        taskpool.execute(taskGroup).then((e: Array<Any>) => {
          count ++
        }).catch((error: Any) => {
          count2 ++
        })
      }

      while (count2 < 1) {
        await sleep(100)
      }

      expect(String(0)).assertEqual(String(count))
      expect(String(1)).assertEqual(String(count2))
      done()
    })

  })
}