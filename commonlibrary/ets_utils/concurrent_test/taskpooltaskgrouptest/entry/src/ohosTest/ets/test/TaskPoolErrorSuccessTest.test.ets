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
import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { taskpool } from '@kit.ArkTS';
import {
  asyncLock,
  asyncLock1,
  asyncLock2,
  asyncLock3,
  printArgs1,
  printArgs10,
  printArgs2,
  printArgs3,
  printArgs4,
  printArgs5,
  printArgs6,
  printArgs7,
  printArgs8,
  printArgs9,
  testFunc,
  testTransfer
} from '../testability/pages/TaskMethodTest';
import { Count1, Count2, Count3, Count4 } from '../testability/pages/DataFlg';
import { AsyncLockTest, AsyncLockTest1,
  AsyncLockTestCatch,
  AsyncLockTestFinally,
  AsyncLockTestThen, BaseClass } from '../testability/pages/SendableTest';
import { BusinessError } from '@kit.BasicServicesKit';
import { sleep } from '../testability/pages/Utils';

export default function taskPoolErrorSuccessTest() {
  describe('TaskPoolErrorSuccessTest', () => {
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
    afterEach(async () => {
      await sleep(2000)
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
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
    it('taskPoolTaskGroupExecute1001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(printArgs1, 1);
      taskGroup.addTask(printArgs3, 1);

      Count1.count = 0
      Count2.count = 0

      for (let i = 0; i < 10; i++) {
        taskpool.execute(taskGroup).then((num: object[]) => {
          Count1.count = Count1.count + Number(num[0])
          console.info('======', Count1.count, Count2.count)
        }).catch((err: object[]) => {
          Count2.count += 1
          console.error('=======', JSON.stringify(err))
        })
      }

      while (Count2.count < 10) {
        await sleep(100)
      }
      expect(0).assertEqual(Count1.count)
      expect(10).assertEqual(Count2.count)
      Count1.count = 0
      Count2.count = 0
      done()
    })

    /**
     * @tc.number TASKPOOL_TASK_ERROR_SUCCESS_TEST_0200
     * @tc.name taskPoolTaskErrorSuccessTest1002
     * @tc.desc test ErrorSuccess GenericsTask
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolTaskGroupExecute1002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      
      let task1: taskpool.Task = new taskpool.GenericsTask<[number], number>(printArgs1, 1);
      let task2: taskpool.Task = new taskpool.GenericsTask<[number], number>(printArgs3, 1);
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(task1);
      taskGroup.addTask(task2);

      Count1.count = 0
      Count2.count = 0

      for (let i = 0; i < 10; i++) {
        taskpool.execute(taskGroup).then((num: object[]) => {
          Count1.count = Count1.count + Number(num[0])
          console.info('======', Count1.count, Count2.count)
        }).catch((err: object[]) => {
          Count2.count += 1
          console.error('=======', JSON.stringify(err))
        })
      }

      while (Count2.count < 10) {
        await sleep(100)
      }
      expect(0).assertEqual(Count1.count)
      expect(10).assertEqual(Count2.count)
      Count1.count = 0
      Count2.count = 0
      done()
    })

    /**
     * @tc.number TASKPOOL_TASK_ERROR_SUCCESS_TEST_0300
     * @tc.name taskPoolTaskErrorSuccessTest1003
     * @tc.desc test onStartExecution
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolTaskErrorSuccessTest1003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      
      let task: taskpool.Task = new taskpool.Task(printArgs1, 1);
      let task2: taskpool.Task = new taskpool.Task(printArgs2, 1);
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(task)
      taskGroup.addTask(task2)

      Count1.count = 0
      Count2.count = 0

      task.onStartExecution(() => {
        console.info("====onStartExecution success")
      })
      task2.onStartExecution(() => {
        console.info("====onStartExecution2 success")
        try {
          let s: string[] = []
          s[0].split('')[1].toString()
        } catch (e) {
          Count2.count += 1
        }
      })

      for (let i = 0; i < 10; i++) {
        taskpool.execute(taskGroup).then((num: object[]) => {
          Count1.count = Count1.count + Number(num[0])
          console.info("====taskpool: execute task success")
        }).catch((err: BusinessError) => {
          console.error("====taskpool: execute task err")
          Count1.count = 0
          Count2.count = 0
        });
      }

      while (Count2.count > 10) {
        await sleep(100)
      }
      expect(0).assertEqual(Count1.count)
      expect(0).assertEqual(Count2.count)
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
    it('taskPoolTaskErrorSuccessTest1004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      
      let task: taskpool.Task = new taskpool.Task(printArgs1, 1);
      let task2: taskpool.Task = new taskpool.Task(printArgs2, 1);
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(task)
      taskGroup.addTask(task2)
      let count: number = 0
      let count2: number = 0

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

      for (let i = 0; i < 10; i++) {
        taskpool.execute(taskGroup).then(() => {
          console.info("====taskpool: execute task success")
        }).catch((err: BusinessError) => {
          console.error("====taskpool: execute task err")
          count2 = 0
          count = 0
        });
      }

      while (count < 10) {
        await sleep(100)
      }
      expect(10).assertEqual(count)
      expect(10).assertEqual(count2)
      done()
    })

    /**
     * @tc.number TASKPOOL_TASK_ERROR_SUCCESS_TEST_0500
     * @tc.name taskPoolTaskErrorSuccessTest1005
     * @tc.desc test onReceiveData
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolTaskErrorSuccessTest1005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      
      let task: taskpool.Task = new taskpool.Task(printArgs7, 1);
      let task2: taskpool.Task = new taskpool.Task(printArgs8, 1);
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(task)
      taskGroup.addTask(task2)
      let count: number = 0
      let count2: number = 0

      task.onReceiveData((num: number) => {
        console.info('======num',num)
        count += num
      });
      task2.onReceiveData((num: number) => {
        try {
          let s: string[] = []
          s[0].split('')[1].toString()
        } catch (e) {
          count2 += 1
        }
      })

      for (let i = 0; i < 10; i++) {
        taskpool.execute(taskGroup).then()
      }

      while (count < 10) {
        await sleep(100)
      }
      expect(10).assertEqual(count)
      expect(10).assertEqual(count2)
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
    it('taskPoolTaskErrorSuccessTest1006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      
      let task: taskpool.Task = new taskpool.Task(printArgs1, 1);
      let task2: taskpool.Task = new taskpool.Task(printArgs2, 1);
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(task)
      taskGroup.addTask(task2)
      let count: number = 0
      let count2: number = 0

      for (let i = 0; i < 10; i++) {
        taskpool.execute(taskGroup).then((num: object[]) => {
          count += Number(num[0])
          let s: string[] = []
          s[0].split('')[1].toString()
        }).catch(() => {
          count2 ++
        })

      }

      while (count < 10) {
        await sleep(100)
      }

      expect(10).assertEqual(count)
      expect(10).assertEqual(count2)
      done()
    })

    /**
     * @tc.number TASKPOOL_TASK_ERROR_SUCCESS_TEST_0700
     * @tc.name taskPoolTaskErrorSuccessTest1007
     * @tc.desc test Task
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolTaskErrorSuccessTest1007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      
      let task: taskpool.Task = new taskpool.Task(printArgs1, 1);
      let task2: taskpool.Task = new taskpool.Task(printArgs2, 1);
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(task);
      taskGroup.addTask(task2);
      let count: number = 0
      let count2: number = 0

      for (let i = 0; i < 10; i++) {
        taskpool.execute(taskGroup).then((num: object[]) => {
          count += Number(num[0])
          let s: string[] = []
          s[0].split('')[1].toString()
        }).catch(() => {
          let s: string[] = []
          s[0].split('')[1].toString()
        }).catch(() => {
          count2 ++
        })
      }

      while (count < 10) {
        await sleep(100)
      }

      expect(10).assertEqual(count)
      expect(10).assertEqual(count2)
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
    it('taskPoolTaskErrorSuccessTest1008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      
      let task: taskpool.Task = new taskpool.Task(printArgs1, 1);
      let task2: taskpool.Task = new taskpool.Task(printArgs2, 1);
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(task);
      taskGroup.addTask(task2);
      let count: number = 0
      let count2: number = 0

      for (let i = 0; i < 10; i++) {
        taskpool.execute(taskGroup).then(() => {
          count += 1
        }).finally(() => {
          let s: string[] = []
          s[0].split('')[1].toString()
        }).catch(() => {
          count2 ++
        })
      }

      while (count < 10) {
        await sleep(100)
      }

      expect(10).assertEqual(count)
      expect(10).assertEqual(count2)
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
    it('taskPoolTaskGroupExecute1009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      
      let asyncLockTest = new AsyncLockTest()
      let task: taskpool.Task = new taskpool.Task(printArgs1, 1);
      let task2: taskpool.Task = new taskpool.Task(asyncLock, asyncLockTest);
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(task);
      taskGroup.addTask(task2);
      let count: number = 0
      let count2: number = 0

      for (let i = 0; i < 10; i++) {
        taskpool.execute(taskGroup).then(() => {
          count += 1
        }).catch(() => {
          count2 ++
        })
      }

      while (count2 < 10) {
        await sleep(100)
      }

      expect(0).assertEqual(count)
      expect(10).assertEqual(count2)
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
    it('taskPoolTaskErrorSuccessTest1010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      
      let task: taskpool.Task = new taskpool.Task(printArgs1, 1);
      let task2: taskpool.Task = new taskpool.Task(printArgs2, 1);
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(task);
      taskGroup.addTask(task2);
      let count: number = 0
      let count2: number = 0
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

      for (let i = 0; i < 10; i++) {
        taskpool.execute(taskGroup).then((num: object) => {
          Count1.count = Count1.count + 1
          console.info("taskpool: execute task success")
        });
      }

      while (Count1.count < 10) {
        await sleep(100)
      }
      expect(10).assertEqual(count)
      expect(10).assertEqual(count2)
      expect(10).assertEqual(Count1.count)
      Count1.count = 0
      Count2.count = 0
      done()
    })

    /**
     * @tc.number TASKPOOL_TASK_ERROR_SUCCESS_TEST_1100
     * @tc.name taskPoolTaskErrorSuccessTest1011
     * @tc.desc test onExecutionFailed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolTaskErrorSuccessTest1011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      
      let task: taskpool.Task = new taskpool.Task(printArgs3, 1);
      let task2: taskpool.Task = new taskpool.Task(printArgs4, 1);
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(task);
      taskGroup.addTask(task2);
      let count: number = 0
      let count2: number = 0

      task.onExecutionFailed(() => {
        count++
      });
      task2.onExecutionFailed((e:Error)=>{
        try {
          let s: string[] = []
          s[0].split('')[1].toString()
        } catch (e) {
          count2++
        }
      })

      for (let i = 0; i < 10; i++) {
        taskpool.execute(taskGroup).then(() => {
          console.info("taskpool: execute task success")
        });
      }

      while ((count + count2) < 10) {
        await sleep(100)
      }

      expect(10).assertEqual(count + count2)
      done()
    })

    /**
     * @tc.number TASKPOOL_TASK_ERROR_SUCCESS_TEST_1200
     * @tc.name taskPoolTaskErrorSuccessTest1012
     * @tc.desc test asyncLock-then
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolTaskGroupExecute1012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      
      let asyncLockTest = new AsyncLockTestThen()
      let task: taskpool.Task = new taskpool.Task(printArgs1, 1);
      let task2: taskpool.Task = new taskpool.Task(asyncLock, asyncLockTest);
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(task);
      taskGroup.addTask(task2);
      let count: number = 0
      let count2: number = 0

      for (let i = 0; i < 10; i++) {
        taskpool.execute(taskGroup).then(() => {
          count += 1
        }).catch((e: BusinessError) => {
          console.info('=====', e.message)
          expect(e.message).assertContain('Cannot read property split of undefined')
          count2 ++
        })
      }

      while (count2 < 10) {
        await sleep(100)
      }

      expect(0).assertEqual(count)
      expect(10).assertEqual(count2)
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
    it('taskPoolTaskGroupExecute1013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      
      let asyncLockTest = new AsyncLockTestCatch()
      let task: taskpool.Task = new taskpool.Task(printArgs1, 1);
      let task2: taskpool.Task = new taskpool.Task(asyncLock, asyncLockTest);
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(task);
      taskGroup.addTask(task2);
      let count: number = 0
      let count2: number = 0

      for (let i = 0; i < 10; i++) {
        taskpool.execute(taskGroup).then(() => {
          count ++
        }).catch(() => {
          count2 ++
        })
      }

      while (count2 < 10) {
        await sleep(100)
      }

      expect(0).assertEqual(count)
      expect(10).assertEqual(count2)
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
    it('taskPoolTaskGroupExecute1014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      
      let asyncLockTest = new AsyncLockTestFinally()
      let task: taskpool.Task = new taskpool.Task(printArgs1, 1);
      let task2: taskpool.Task = new taskpool.Task(asyncLock, asyncLockTest);
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(task);
      taskGroup.addTask(task2);
      let count: number = 0
      let count2: number = 0

      for (let i = 0; i < 10; i++) {
        taskpool.execute(taskGroup).then(() => {
          count ++
        }).catch(() => {
          count2 ++
        })
      }

      while (count2 < 10) {
        await sleep(100)
      }

      expect(0).assertEqual(count)
      expect(10).assertEqual(count2)
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
    it('taskPoolTaskGroupExecute1015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      
      let asyncLockTest = new AsyncLockTestFinally()
      let task: taskpool.Task = new taskpool.Task(printArgs1, 1);
      let task2: taskpool.Task = new taskpool.Task(asyncLock1, asyncLockTest);
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(task);
      taskGroup.addTask(task2);
      let count: number = 0
      let count2: number = 0

      for (let i = 0; i < 10; i++) {
        taskpool.execute(taskGroup).then(() => {
          count ++
        }).catch(() => {
          count2 ++
        })
      }

      while (count2 < 10) {
        await sleep(100)
      }

      expect(0).assertEqual(count)
      expect(10).assertEqual(count2)
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
    it('taskPoolTaskGroupExecute1016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      
      let asyncLockTest = new AsyncLockTestFinally()
      let task: taskpool.Task = new taskpool.Task(printArgs1, 1);
      let task2: taskpool.Task = new taskpool.Task(asyncLock2, asyncLockTest);
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(task);
      taskGroup.addTask(task2);
      let count: number = 0
      let count2: number = 0

      for (let i = 0; i < 10; i++) {
        taskpool.execute(taskGroup).then(() => {
          count ++
        }).catch(() => {
          count2 ++
        })
      }

      while (count2 < 10) {
        await sleep(100)
      }

      expect(0).assertEqual(count)
      expect(10).assertEqual(count2)
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
    it('taskPoolTaskGroupExecute1017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      
      let asyncLockTest = new AsyncLockTestFinally()
      let task: taskpool.Task = new taskpool.Task(printArgs1, 1);
      let task2: taskpool.Task = new taskpool.Task(asyncLock3, asyncLockTest);
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(task);
      taskGroup.addTask(task2);
      let count: number = 0
      let count2: number = 0

      for (let i = 0; i < 10; i++) {
        taskpool.execute(taskGroup).then(() => {
          count ++
        }).catch(() => {
          count2 ++
        })
      }

      while (count2 < 10) {
        await sleep(100)
      }

      expect(0).assertEqual(count)
      expect(10).assertEqual(count2)
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
    it('taskPoolTaskGroupExecute1018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      
      let asyncLockTest = new AsyncLockTest()
      let task: taskpool.Task = new taskpool.Task(printArgs1, 1);
      let task2: taskpool.Task = new taskpool.Task(asyncLock, asyncLockTest);
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(task);
      taskGroup.addTask(task2);
      let count: number = 0
      let count2: number = 0

      for (let i = 0; i < 10; i++) {
        taskpool.execute(taskGroup).then(() => {
          count ++
        }).catch(() => {
          count2 ++
        })
      }

      while (count2 < 10) {
        await sleep(100)
      }

      expect(0).assertEqual(count)
      expect(10).assertEqual(count2)
      done()
    })

    /**
     * @tc.number TASKPOOL_TASK_ERROR_SUCCESS_TEST_1900
     * @tc.name taskPoolTaskErrorSuccessTest1019
     * @tc.desc test task-setTimeout
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolTaskGroupExecute1019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      
      let task: taskpool.Task = new taskpool.Task(printArgs1, 1);
      let task2: taskpool.Task = new taskpool.Task(printArgs9, 1);
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(task);
      taskGroup.addTask(task2);
      let count: number = 0
      let count2: number = 0

      for (let i = 0; i < 10; i++) {
        taskpool.execute(taskGroup).then(() => {
          count += 1
          count2 ++
        })
      }

      while (count < 10) {
        await sleep(100)
      }

      expect(10).assertEqual(count)
      expect(10).assertEqual(count2)
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
    it('taskPoolTaskGroupExecute1020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      
      let asyncLockTest = new AsyncLockTest()
      let task: taskpool.Task = new taskpool.Task(printArgs1, 1);
      let task2: taskpool.Task = new taskpool.Task(asyncLock, asyncLockTest);
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(task);
      taskGroup.addTask(task2);
      let count: number = 0
      let count2: number = 0

      for (let i = 0; i < 10; i++) {
        taskpool.execute(taskGroup).then(() => {
          count ++
        }).catch(() => {
          count2 ++
        })
      }

      while (count2 < 10) {
        await sleep(100)
      }

      expect(0).assertEqual(count)
      expect(10).assertEqual(count2)
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
    it('taskPoolTaskGroupExecute1021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      
      let asyncLockTest = new AsyncLockTest()
      let task: taskpool.Task = new taskpool.Task(printArgs1, 1);
      let task2: taskpool.Task = new taskpool.Task(asyncLock, asyncLockTest);
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(task);
      taskGroup.addTask(task2);
      let count: number = 0
      let count2: number = 0

      for (let i = 0; i < 10; i++) {
        taskpool.execute(taskGroup).then(() => {
          count ++
        }).catch(() => {
          count2 ++
        })
      }

      while (count2 < 10) {
        await sleep(100)
      }

      expect(0).assertEqual(count)
      expect(10).assertEqual(count2)
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
    it('taskPoolTaskGroupExecute1022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      
      let asyncLockTest = new AsyncLockTestFinally()
      let task: taskpool.Task = new taskpool.Task(printArgs1, 1);
      let task2: taskpool.Task = new taskpool.Task(asyncLock1, asyncLockTest);
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(task);
      taskGroup.addTask(task2);
      let count: number = 0
      let count2: number = 0

      for (let i = 0; i < 10; i++) {
        taskpool.execute(taskGroup).then(() => {
          count ++
        }).catch(() => {
          count2 ++
        })
      }

      while (count2 < 10) {
        await sleep(100)
      }

      expect(0).assertEqual(count)
      expect(10).assertEqual(count2)
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
    it('taskPoolTaskGroupExecute1023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      
      let asyncLockTest = new AsyncLockTestFinally()
      let task: taskpool.Task = new taskpool.Task(printArgs1, 1);
      let task2: taskpool.Task = new taskpool.Task(asyncLock2, asyncLockTest);
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(task);
      taskGroup.addTask(task2);
      let count: number = 0
      let count2: number = 0

      for (let i = 0; i < 10; i++) {
        taskpool.execute(taskGroup).then(() => {
          count ++
        }).catch(() => {
          count2 ++
        })
      }

      while (count2 < 10) {
        await sleep(100)
      }

      expect(0).assertEqual(count)
      expect(10).assertEqual(count2)
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
    it('taskPoolTaskGroupExecute1024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      
      let asyncLockTest = new AsyncLockTestFinally()
      let task: taskpool.Task = new taskpool.Task(printArgs1, 1);
      let task2: taskpool.Task = new taskpool.Task(asyncLock3, asyncLockTest);
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();

      taskGroup.addTask(task);
      taskGroup.addTask(task2);
      let count: number = 0
      let count2: number = 0

      for (let i = 0; i < 10; i++) {
        taskpool.execute(taskGroup).then(() => {
          count ++
        }).catch(() => {
          count2 ++
        })
      }

      while (count2 < 10) {
        await sleep(100)
      }

      expect(0).assertEqual(count)
      expect(10).assertEqual(count2)
      done()
    })

  })
}