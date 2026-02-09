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
import { BusinessError } from '@ohos.base';
import {
  describe,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect,
  Level,
  Size,
  TestType
} from "../../../hypium/index";
import {
  printArgs1,
  printArgs2,
  printArgs3,
  printArgs4,
  printArgs5,
  printArgs6,
  printArgs7,
  printArgs8,
//   printArgs9,
//   printArgs10,
  testFunc,
  testTransfer
} from '../testability/pages/TaskMethodTest';
import { Count1, Count2, Count3, Count4 } from '../testability/pages/DataFlg';
import { BaseClass } from '../testability/pages/SendableTest';
import { sleep } from '../testability/pages/Utils';


export default function taskPoolTaskGroupExecuteTest() {
  describe('TaskPoolTaskGroupExecuteTest', (): void => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll((): void => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach((): void => {
      // Presets an action, which is performed before each unit test case starts.
      // The Number of execution times is the same as the Number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(async (): Promise<void> => {
      await sleep(2000)
      // Presets a clear action, which is performed after each unit test case ends.
      // The Number of execution times is the same as the Number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll((): void => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.number TASKPOOL_TASKGROUP_EXECUTE_0100
     * @tc.name taskPoolTaskGroupExecute1001
     * @tc.desc test TaskGroup
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolTaskGroupExecute1001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
        Count1.count = 0.0
        Count2.count = 0.0
        for (let i = 0; i < 1; i++) {
          let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
          taskGroup.addTask(printArgs1, 1.0);
          taskGroup.addTask(printArgs2, 1.0);
          taskpool.execute(taskGroup).then((num: Array<Any>) => {
            hilog.info(0x0000, 'taskPoolTaskGroupExecute1001', '%{public}s', `num========${num}`);
            Count1.count = Count1.count + (num[0] as Number)
            Count2.count = Count2.count + (num[1] as Number)
            console.info('======', Count1.count, Count2.count)
          })
        }
        hilog.info(0x0000, 'taskPoolTaskGroupExecute1001', '%{public}s', `Count1.count========${Count1.count}`);
        while (Count1.count < 1 || Count2.count < 1) {
          await sleep(100)
        }
        expect(String(1)).assertEqual(String(Count1.count))
        expect(String(1)).assertEqual(String(Count2.count))
        Count1.count = 0.0
        Count2.count = 0.0
        done()
      })

    /**
     * @tc.number TASKPOOL_TASKGROUP_EXECUTE_0200
     * @tc.name taskPoolTaskGroupExecute1001_2
     * @tc.desc test TaskGroup error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolTaskGroupExecute1001_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
        let count: Number = 0.0
        Count3.count = 0.0
        Count4.count = 0.0
        for (let i = 0; i < 1; i++) {
          let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
          taskGroup.addTask(printArgs3, 1.0);
          taskGroup.addTask(printArgs4, 2.0);
          try {
            taskpool.execute(taskGroup).then((num: Array<Any>) => {
              Count3.count = Count3.count + (num[0] as Number)
              Count4.count = Count4.count + (num[1] as Number)
              console.info('======', Count3.count, Count4.count)
            }).catch((error: Any) => {
              // expect(String((error as BusinessError).message)).assertContain('Cannot read property split of undefined');
              count++
              console.error(`error message error: ${JSON.stringify(error)}`)
            })
          } catch (e) {
            e = e as BusinessError;
            console.error(`error message e: ${JSON.stringify(e)}`)
          }
        }

        while (count < 1) {
          await sleep(100)
        }
        expect(String(0)).assertEqual(String(Count3.count))
        expect(String(0)).assertEqual(String(Count4.count))
        expect(String(1)).assertEqual(String(count))
        Count3.count = 0.0
        Count4.count = 0.0
        done()
      })

    /**
     * @tc.number TASKPOOL_TASKGROUP_EXECUTE_0300
     * @tc.name taskPoolTaskGroupExecute1002
     * @tc.desc test GenericsTask
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolTaskGroupExecute1002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
        let task1: taskpool.Task = new taskpool.Task(printArgs1, 1.0);
        let task2: taskpool.Task = new taskpool.Task(printArgs2, 1.0);
        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup.addTask(task1);
        taskGroup.addTask(task2);
        Count1.count = 0.0
        Count2.count = 0.0
        taskpool.execute(taskGroup).then((num: Array<Any>) => {
          Count1.count = Count1.count + (num[0] as Number)
          Count2.count = Count2.count + (num[1] as Number)
          console.info('======', Count1.count, Count2.count)
        })
        while (Count1.count < 1 || Count2.count < 1) {
          await sleep(100)
        }
        expect(String(1)).assertEqual(String(Count1.count))
        expect(String(1)).assertEqual(String(Count2.count))
        Count1.count = 0.0
        Count2.count = 0.0
        done()
      })

    /**
     * @tc.number TASKPOOL_TASKGROUP_EXECUTE_0400
     * @tc.name taskPoolTaskGroupExecute1002_1
     * @tc.desc test GenericsTask
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolTaskGroupExecute1002_1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.

        let task1: taskpool.Task = new taskpool.Task(printArgs3, 1.0);
        let task2: taskpool.Task = new taskpool.Task(printArgs4, 1.0);
        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup.addTask(task1);
        taskGroup.addTask(task2);
        let count: Number = 0.0
        Count1.count = 0.0
        Count2.count = 0.0
        taskpool.execute(taskGroup).then((num: Array<Any>) => {
          Count1.count = Count1.count + (num[0] as Number)
          Count2.count = Count2.count + (num[1] as Number)
          console.info('======', Count1.count, Count2.count)
        }).catch((error: Any) => {
          // expect((error as BusinessError).message).assertContain('Cannot read property split of undefined')
          count++
          console.error(`error message error: ${JSON.stringify(error)}`)
        })

        while (count < 1) {
          await sleep(100)
        }
        expect(String(0)).assertEqual(String(Count1.count))
        expect(String(0)).assertEqual(String(Count2.count))
        expect(String(1)).assertEqual(String(count))
        Count1.count = 0.0
        Count2.count = 0.0
        done()
      })

    /**
     * @tc.number TASKPOOL_TASKGROUP_EXECUTE_0500
     * @tc.name taskPoolTaskGroupExecute1003
     * @tc.desc test task1.name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolTaskGroupExecute1003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
        let task1: taskpool.Task = new taskpool.Task('TaskName1', printArgs1, 1.0);
        let task2: taskpool.Task = new taskpool.Task('TaskName2', printArgs2, 1.0);
        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup.addTask(task1);
        taskGroup.addTask(task2);
        Count1.count = 0.0
        Count2.count = 0.0

        taskpool.execute(taskGroup).then((num: Array<Any>) => {
          Count1.count = Count1.count + (num[0] as Number)
          Count2.count = Count2.count + (num[1] as Number)
          console.info('======', Count1.count)
        })
        while (Count1.count < 1 || Count2.count < 1) {
          await sleep(100)
        }
        expect(String(1)).assertEqual(String(Count1.count))
        expect('TaskName1').assertEqual(String(task1.name))
        expect(String(1)).assertEqual(String(Count2.count))
        expect('TaskName2').assertEqual(String(task2.name))
        Count1.count = 0.0
        Count2.count = 0.0
        done()
      })

    /**
     * @tc.number TASKPOOL_TASKGROUP_EXECUTE_0600
     * @tc.name taskPoolTaskGroupExecute1004
     * @tc.desc test isCanceled
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolTaskGroupExecute1004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
        let task1: taskpool.Task = new taskpool.Task('TaskName1', printArgs5, 1.0);
        let task2: taskpool.Task = new taskpool.Task('TaskName2', printArgs6, 1.0);
        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup.addTask(task1);
        taskGroup.addTask(task2);
        let count1: Number = 0

        taskpool.execute(taskGroup).then((num: Array<Any>) => {
          Count1.count = Count1.count + (num[0] as Number)
          Count2.count = Count2.count + (num[1] as Number)
          console.info('======', Count1.count)
        }).catch((e: Any) => {
          //expect((e as BusinessError)?.name).assertContain('BusinessError')
          count1++
          console.info('======e', JSON.stringify(e))
        })
        await sleep(1000)
        taskpool.cancel(task2)
        taskpool.cancel(task1)

        while (count1 < 1) {
          await sleep(100)
        }
        expect(String(1)).assertEqual(String(count1))
        done()
      })

    /**
     * @tc.number TASKPOOL_TASKGROUP_EXECUTE_1000
     * @tc.name taskPoolTaskGroupExecute1008
     * @tc.desc test onEnqueued
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolTaskGroupExecute1008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.

        let task: taskpool.Task = new taskpool.Task(printArgs1, 1.0);
        let task2: taskpool.Task = new taskpool.Task(printArgs2, 1.0);

        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup.addTask(task);
        taskGroup.addTask(task2);

        let count: Number = 0.0
        let count2: Number = 0.0
        Count1.count = 0.0
        Count2.count = 0.0

        task.onEnqueued(() => {
          count++
        });
        task2.onEnqueued(() => {
          count2++
        });

        taskpool.execute(taskGroup).then((num: Array<Any>) => {
          Count1.count = Count1.count + (num[0] as Number)
          Count2.count = Count2.count + (num[1] as Number)
          console.info("taskpool: execute task success")
        });

        while (count < 1 || Count1.count < 1 || Count2.count < 1 || count2 < 1) {
          await sleep(100)
        }
        expect(String(1)).assertEqual(String(count))
        expect(String(1)).assertEqual(String(count2))
        expect(String(1)).assertEqual(String(Count1.count))
        expect(String(1)).assertEqual(String(Count2.count))
        Count1.count = 0.0
        Count2.count = 0.0
        done()
      })

    /**
     * @tc.number TASKPOOL_TASKGROUP_EXECUTE_1100
     * @tc.name taskPoolTaskGroupExecute1009
     * @tc.desc test onEnqueued
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolTaskGroupExecute1009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.

        let task: taskpool.Task = new taskpool.Task(printArgs1, 1.0);
        let task2: taskpool.Task = new taskpool.Task(printArgs2, 1.0);

        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup.addTask(task);
        taskGroup.addTask(task2);

        Count1.count = 0.0
        Count2.count = 0.0

        task.onEnqueued(() => {
          try {
            let s: string[] = []
            s[0].split('')[1].toString()
          } catch (e) {
            Count1.count++
          }
        })

        task2.onEnqueued(() => {
          try {
            let s: string[] = []
            s[0].split('')[1].toString()
          } catch (e) {
            Count2.count++
          }
        })

        taskpool.execute(taskGroup).then((num: Array<Any>) => {
          console.info("taskpool: execute task success")
        });

        hilog.info(0x0000, 'taskPoolTaskGroupExecute1009', '%{public}s', `Count1.count========${Count1.count}`);
        while (Count1.count < 1 || Count2.count < 1) {
          await sleep(100)
        }

        expect(String(1)).assertEqual(String(Count1.count))
        expect(String(1)).assertEqual(String(Count2.count))
        Count1.count = 0.0
        Count2.count = 0.0
        done()
      })

    /**
     * @tc.number TASKPOOL_TASKGROUP_EXECUTE_1200
     * @tc.name taskPoolTaskGroupExecute1010
     * @tc.desc test onStartExecution
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolTaskGroupExecute1010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.

        let task: taskpool.Task = new taskpool.Task(printArgs1, 1.0);
        let task2: taskpool.Task = new taskpool.Task(printArgs2, 1.0);
        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup.addTask(task);
        taskGroup.addTask(task2);
        let count: Number = 0.0
        let count2: Number = 0.0
        Count1.count = 0.0
        Count2.count = 0.0

        task.onStartExecution(() => {
          count++
        });
        task2.onStartExecution(() => {
          count2++
        });
        taskpool.execute(taskGroup).then((num: Array<Any>) => {
          Count1.count = Count1.count + (num[0] as Number)
          Count2.count = Count2.count + (num[1] as Number)
          console.info("taskpool: execute task success")
        });

        while (count < 1 || Count1.count < 1 || Count2.count < 1 || count2 < 1) {
          await sleep(100)
        }

        expect(String(1)).assertEqual(String(Count1.count))
        expect(String(1)).assertEqual(String(count))
        expect(String(1)).assertEqual(String(Count2.count))
        expect(String(1)).assertEqual(String(count2))
        Count1.count = 0
        Count2.count = 0
        done()
      })

    /**
     * @tc.number TASKPOOL_TASKGROUP_EXECUTE_1300
     * @tc.name taskPoolTaskGroupExecute1011
     * @tc.desc test onStartExecution
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolTaskGroupExecute1011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.

        let task: taskpool.Task = new taskpool.Task(printArgs1, 1.0);
        let task2: taskpool.Task = new taskpool.Task(printArgs2, 1.0);
        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup.addTask(task);
        taskGroup.addTask(task2);
        let count: Number = 0.0
        let count2: Number = 0.0
        Count1.count = 0.0
        Count2.count = 0.0

        task.onStartExecution(() => {
          try {
            let s: string[] = []
            s[0].split('')[1].toString()
          } catch (e) {
            count++
          }
        })

        task2.onStartExecution(() => {
          try {
            let s: string[] = []
            s[0].split('')[1].toString()
          } catch (e) {
            count2++
          }
        })

        taskpool.execute(taskGroup).then((num: Array<Any>) => {
          Count1.count = Count1.count + (num[0] as Number)
          Count2.count = Count2.count + (num[1] as Number)
          console.info("taskpool: execute task success")
        });

        while (count < 1 || Count1.count < 1 || Count2.count < 1 || count2 < 1) {
          await sleep(100)
        }
        expect(String(1)).assertEqual(String(Count1.count))
        expect(String(1)).assertEqual(String(count))
        expect(String(1)).assertEqual(String(count2))
        expect(String(1)).assertEqual(String(Count2.count))
        Count1.count = 0.0
        Count2.count = 0.0
        done()

      })

    /**
     * @tc.number TASKPOOL_TASKGROUP_EXECUTE_1600
     * @tc.name taskPoolTaskGroupExecute1013
     * @tc.desc test onExecutionSucceeded
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolTaskGroupExecute1013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.

        let task: taskpool.Task = new taskpool.Task(printArgs1, 1.0);
        let task2: taskpool.Task = new taskpool.Task(printArgs2, 1.0);
        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup.addTask(task);
        taskGroup.addTask(task2);
        let count: Number = 0.0
        let count2: Number = 0.0

        task.onExecutionSucceeded(() => {
          count++
        });
        task2.onExecutionSucceeded(() => {
          count2++
        })

        taskpool.execute(taskGroup).then((num: Array<Any>) => {
          console.info("taskpool: execute task success")
        });

        while (count < 1 || count2 < 1) {
          await sleep(100)
        }

        expect(String(1)).assertEqual(String(count))
        expect(String(1)).assertEqual(String(count2))
        done()
      })

    /**
     * @tc.number TASKPOOL_TASKGROUP_EXECUTE_1700
     * @tc.name taskPoolTaskGroupExecute1013_1
     * @tc.desc test onExecutionSucceeded
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolTaskGroupExecute1013_1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.

        let task: taskpool.Task = new taskpool.Task(printArgs1, 1.0);
        let task2: taskpool.Task = new taskpool.Task(printArgs2, 1.0);
        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup.addTask(task);
        taskGroup.addTask(task2);
        let count: Number = 0.0
        let count2: Number = 0.0

        task.onExecutionSucceeded(() => {
          try {
            let s: string[] = []
            s[0].split('')[1].toString()
          } catch (e) {
            count++
          }
        })

        task2.onExecutionSucceeded(() => {
          try {
            let s: string[] = []
            s[0].split('')[1].toString()
          } catch (e) {
            count2++
          }
        })

        taskpool.execute(taskGroup).then((num: Array<Any>) => {
          console.info("taskpool: execute task success")
        });

        while (count < 1 || count2 < 1) {
          await sleep(100)
        }

        expect(String(1)).assertEqual(String(count))
        expect(String(1)).assertEqual(String(count2))
        done()
      })

    /**
     * @tc.number TASKPOOL_TASKGROUP_EXECUTE_1900
     * @tc.name taskPoolTaskGroupExecute1015
     * @tc.desc test isDone
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolTaskGroupExecute1015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.

        let task: taskpool.Task = new taskpool.Task(printArgs1, 1.0);
        let task2: taskpool.Task = new taskpool.Task(printArgs2, 1.0);
        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup.addTask(task);
        taskGroup.addTask(task2);

        taskpool.execute(taskGroup)
        hilog.info(0x0000, 'taskPoolTaskGroupExecute1015', '%{public}s', `========${task.isDone()}`);
        while (!task.isDone()) {
          await sleep(100)
        }
        expect(task.isDone()).assertTrue()
        done()
      })

    /**
     * @tc.number TASKPOOL_TASKGROUP_EXECUTE_2000
     * @tc.name taskPoolTaskGroupExecute1016
     * @tc.desc test isDone
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolTaskGroupExecute1016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.

        let task: taskpool.Task = new taskpool.Task(printArgs5, 1.0);
        let task2: taskpool.Task = new taskpool.Task(printArgs6, 1.0);
        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup.addTask(task);
        taskGroup.addTask(task2);
        taskpool.execute(taskGroup)
        expect(task.isDone()).assertFalse()
        done()
      })

  })
}