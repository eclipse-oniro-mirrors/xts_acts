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
import { BaseClass } from '../testability/pages/SendableTest';
import { BusinessError } from '@kit.BasicServicesKit';
import { sleep } from '../testability/pages/Utils';


export default function taskPoolTaskGroupExecuteTest() {
  describe('TaskPoolTaskGroupExecuteTest', () => {
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
     * @tc.number TASKPOOL_TASKGROUP_EXECUTE_0100
     * @tc.name taskPoolTaskGroupExecute1001
     * @tc.desc test TaskGroup
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolTaskGroupExecute1001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(printArgs1, 1);
      taskGroup.addTask(printArgs2, 1);

      Count1.count = 0
      Count2.count = 0

      for (let i = 0; i < 10; i++) {

        taskpool.execute(taskGroup).then((num: object[]) => {
          Count1.count = Count1.count + Number(num[0])
          Count2.count = Count2.count + Number(num[1])
          console.info('======', Count1.count, Count2.count)
        })
      }

      while (Count1.count < 10) {
        await sleep(100)
      }
      expect(10).assertEqual(Count1.count)
      expect(10).assertEqual(Count2.count)
      Count1.count = 0
      Count2.count = 0
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
    it('taskPoolTaskGroupExecute1001_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(printArgs3, 1);
      taskGroup.addTask(printArgs4, 2);
      let count: number = 0
      Count3.count = 0
      Count4.count = 0

      for (let i = 0; i < 10; i++) {
        try {
          taskpool.execute(taskGroup).then((num: object[]) => {
            Count3.count = Count3.count + Number(num[0])
            Count4.count = Count4.count + Number(num[1])
            console.info('======', Count3.count, Count4.count)
          }).catch((error: BusinessError) => {
            expect(error.message).assertContain('Cannot read property split of undefined')
            count++
            console.error(`error message error: ${JSON.stringify(error)}`)
          })
        } catch (e) {
          console.error(`error message e: ${JSON.stringify(e)}`)
        }
      }

      while (count < 10) {
        await sleep(100)
      }
      expect(0).assertEqual(Count3.count)
      expect(0).assertEqual(Count4.count)
      expect(10).assertEqual(count)
      Count3.count = 0
      Count4.count = 0
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
    it('taskPoolTaskGroupExecute1002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      
      let task1: taskpool.Task = new taskpool.GenericsTask<[number], number>(printArgs1, 1);
      let task2: taskpool.Task = new taskpool.GenericsTask<[number], number>(printArgs2, 1);
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(task1);
      taskGroup.addTask(task2);

      Count1.count = 0
      Count2.count = 0

      for (let i = 0; i < 10; i++) {
        taskpool.execute(taskGroup).then((num: object[]) => {
          Count1.count = Count1.count + Number(num[0])
          Count2.count = Count2.count + Number(num[1])
          console.info('======', Count1.count, Count2.count)
        })
      }

      while (Count1.count < 10) {
        await sleep(100)
      }
      expect(10).assertEqual(Count1.count)
      expect(10).assertEqual(Count2.count)
      Count1.count = 0
      Count2.count = 0
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
    it('taskPoolTaskGroupExecute1002_1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      
      let task1: taskpool.Task = new taskpool.GenericsTask<[number], number>(printArgs3, 1);
      let task2: taskpool.Task = new taskpool.GenericsTask<[number], number>(printArgs4, 1);
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(task1);
      taskGroup.addTask(task2);
      let count: number = 0
      Count1.count = 0
      Count2.count = 0

      for (let i = 0; i < 10; i++) {

        taskpool.execute(taskGroup).then((num: object[]) => {
          Count1.count = Count1.count + Number(num[0])
          Count2.count = Count2.count + Number(num[1])
          console.info('======', Count1.count, Count2.count)
        }).catch((error: BusinessError) => {
          expect(error.message).assertContain('Cannot read property split of undefined')
          count++
          console.error(`error message error: ${JSON.stringify(error)}`)
        })
      }

      while (count < 10) {
        await sleep(100)
      }
      expect(0).assertEqual(Count1.count)
      expect(0).assertEqual(Count2.count)
      expect(10).assertEqual(count)
      Count1.count = 0
      Count2.count = 0
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
    it('taskPoolTaskGroupExecute1003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      
      let task1: taskpool.Task = new taskpool.Task('TaskName1', printArgs1, 1);
      let task2: taskpool.Task = new taskpool.Task('TaskName2', printArgs2, 1);
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(task1);
      taskGroup.addTask(task2);
      Count1.count = 0
      Count2.count = 0

      for (let i = 0; i < 10; i++) {
        taskpool.execute(taskGroup).then((num: object[]) => {
          Count1.count = Count1.count + Number(num[0])
          Count2.count = Count2.count + Number(num[1])
          console.info('======', Count1.count)
        })
      }

      while (Count1.count < 10) {
        await sleep(100)
      }
      expect(10).assertEqual(Count1.count)
      expect('TaskName1').assertEqual(task1.name)
      expect(10).assertEqual(Count2.count)
      expect('TaskName2').assertEqual(task2.name)
      Count1.count = 0
      Count2.count = 0
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
    it('taskPoolTaskGroupExecute1004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      
      let task1: taskpool.Task = new taskpool.Task('TaskName1', printArgs5, 1);
      let task2: taskpool.Task = new taskpool.Task('TaskName2', printArgs6, 1);
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(task1);
      taskGroup.addTask(task2);
      let count1: number = 0

      for (let i = 0; i < 1; i++) {
        taskpool.execute(taskGroup).then((num: object[]) => {
          Count1.count = Count1.count + Number(num[0])
          Count2.count = Count2.count + Number(num[1])
          console.info('======', Count1.count)
        }).catch((e: object) => {
          expect((e as BusinessError).name).assertContain('BusinessError')
          count1++
          console.info('======e', JSON.stringify(e))
        })

        await sleep(1000)
        taskpool.cancel(task2)
        taskpool.cancel(task1)
      }
      while (count1 < 1) {
        await sleep(100)
      }
      expect(1).assertEqual(count1)
      done()
    })

    /**
     * @tc.number TASKPOOL_TASKGROUP_EXECUTE_0700
     * @tc.name taskPoolTaskGroupExecute1005
     * @tc.desc test taskpool.cancel(id)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    // it('taskPoolTaskGroupExecute1005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
    //   // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
    //   
    //   let task1: taskpool.Task = new taskpool.Task('TaskName1', printArgs1, 1);
    //   let task2: taskpool.Task = new taskpool.Task('TaskName2', printArgs2, 1);
    //
    //   Count1.count = 0
    //   Count2.count = 0
    //
    //   for (let i = 0; i < 10; i++) {
    //     taskpool.execute(task1)
    //     taskpool.execute(task2)
    //   }
    //
    //   let taskpoolInfo: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo();
    //   let taskIS = Array.from(taskpoolInfo.taskInfos)
    //   for (let taskInfo of taskIS) {
    //     let id = taskInfo.taskId
    //     // taskpool.cancel(id)
    //   }
    //   await sleep(1000)
    //   expect(taskpool.Task.isCanceled()).assertTrue()
    //   Count1.count = 0
    //   Count2.count = 0
    //   done()
    // })

    /**
     * @tc.number TASKPOOL_TASKGROUP_EXECUTE_0800
     * @tc.name taskPoolTaskGroupExecute1006
     * @tc.desc test setTransferList
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolTaskGroupExecute1006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      
      let buffer: ArrayBuffer = new ArrayBuffer(8);
      let view: Uint8Array = new Uint8Array(buffer);
      let buffer1: ArrayBuffer = new ArrayBuffer(16);
      let view1: Uint8Array = new Uint8Array(buffer1);

      let buffers: ArrayBuffer = new ArrayBuffer(8);
      let views: Uint8Array = new Uint8Array(buffers);
      let buffers1: ArrayBuffer = new ArrayBuffer(16);
      let views1: Uint8Array = new Uint8Array(buffers1);

      console.info("testTransfer view byteLength: " + view.byteLength);
      console.info("testTransfer view1 byteLength: " + view1.byteLength);
      console.info("testTransfer views byteLength: " + views.byteLength);
      console.info("testTransfer views1 byteLength: " + views1.byteLength);

      expect(8).assertEqual(view.byteLength)
      expect(16).assertEqual(view1.byteLength)
      expect(8).assertEqual(views.byteLength)
      expect(16).assertEqual(views1.byteLength)

      let task: taskpool.Task = new taskpool.Task(testTransfer, view, view1);
      task.setTransferList([view.buffer, view1.buffer]);
      let task2: taskpool.Task = new taskpool.Task(testTransfer, views, views1);
      task2.setTransferList([views.buffer, views1.buffer]);

      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(task);
      taskGroup.addTask(task2);

      for (let i = 0; i < 1; i++) {

        taskpool.execute(taskGroup).then((res: Object[]) => {
          console.info("test result: " + res);
        }).catch((e: string) => {
          console.error("test catch: " + e);
        })

      }

      while (view.byteLength > 0) {
        await sleep(100)
      }
      console.info("testTransfer view2 byteLength: " + view.byteLength);
      console.info("testTransfer view3 byteLength: " + view1.byteLength);
      console.info("testTransfer view4 byteLength: " + views.byteLength);
      console.info("testTransfer view5 byteLength: " + views1.byteLength);
      expect(0).assertEqual(view.byteLength)
      expect(0).assertEqual(view1.byteLength)
      expect(0).assertEqual(views.byteLength)
      expect(0).assertEqual(views1.byteLength)
      done()
    })

    /**
     * @tc.number TASKPOOL_TASKGROUP_EXECUTE_0900
     * @tc.name taskPoolTaskGroupExecute1007
     * @tc.desc test setCloneList
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolTaskGroupExecute1007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      
      let ret1: number = 0
      let ret2: number = 0
      let baseInstance1: BaseClass = new BaseClass();
      let array1 = new Array<BaseClass>();
      array1.push(baseInstance1);
      let task1 = new taskpool.Task(testFunc, array1, 10);
      task1.setCloneList(array1);

      let baseInstance2: BaseClass = new BaseClass();
      let array2 = new Array<BaseClass>();
      array2.push(baseInstance2);
      let task2 = new taskpool.Task(testFunc, array2, 10);
      task2.setCloneList(array2);
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(task1);
      taskGroup.addTask(task2);

      for (let i = 0; i < 10; i++) {
        taskpool.execute(taskGroup).then((res: Object[]) => {
          console.info("sendable: task1 res is: " + res);
          ret1 = res[0] as number
          ret2 = res[1] as number
        }).catch((e: BusinessError) => {
          console.error(`sendable: task1 execute Code is ${e.code}, message is ${e.message}`);
        })
      }

      while (ret1 != 55) {
        await sleep(100)
      }
      expect(55).assertEqual(ret1)
      expect(55).assertEqual(ret2)
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
    it('taskPoolTaskGroupExecute1008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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
        count2++
      });

      for (let i = 0; i < 10; i++) {
        taskpool.execute(taskGroup).then((num: object[]) => {
          Count1.count = Count1.count + Number(num[0])
          Count2.count = Count2.count + Number(num[1])
          console.info("taskpool: execute task success")
        });
      }

      while (count < 10 || Count1.count < 10 || Count2.count < 10 || count2 < 10) {
        await sleep(100)
      }
      expect(10).assertEqual(count)
      expect(10).assertEqual(count2)
      expect(10).assertEqual(Count1.count)
      expect(10).assertEqual(Count2.count)
      Count1.count = 0
      Count2.count = 0
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
    it('taskPoolTaskGroupExecute1009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      
      let task: taskpool.Task = new taskpool.Task(printArgs1, 1);
      let task2: taskpool.Task = new taskpool.Task(printArgs2, 1);

      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(task);
      taskGroup.addTask(task2);

      Count1.count = 0
      Count2.count = 0

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

      for (let i = 0; i < 10; i++) {
        taskpool.execute(taskGroup).then(() => {
          console.info("taskpool: execute task success")
        });

      }

      while (Count1.count < 10) {
        await sleep(100)
      }

      expect(10).assertEqual(Count1.count)
      expect(10).assertEqual(Count2.count)
      Count1.count = 0
      Count2.count = 0
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
    it('taskPoolTaskGroupExecute1010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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

      task.onStartExecution(() => {
        count++
      });
      task2.onStartExecution(() => {
        count2++
      });

      for (let i = 0; i < 10; i++) {
        taskpool.execute(taskGroup).then((num: object[]) => {
          Count1.count = Count1.count + Number(num[0])
          Count2.count = Count2.count + Number(num[1])
          console.info("taskpool: execute task success")
        });
      }

      while (count < 10 || Count1.count < 10 || Count2.count < 10 || count2 < 10) {
        await sleep(100)
      }
      expect(10).assertEqual(Count1.count)
      expect(10).assertEqual(count)
      expect(10).assertEqual(Count2.count)
      expect(10).assertEqual(count2)
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
    it('taskPoolTaskGroupExecute1011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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

      for (let i = 0; i < 10; i++) {
        taskpool.execute(taskGroup).then((num: object[]) => {
          Count1.count = Count1.count + Number(num[0])
          Count2.count = Count2.count + Number(num[1])
          console.info("taskpool: execute task success")
        });
      }

      while (Count1.count < 10) {
        await sleep(100)
      }
      expect(10).assertEqual(Count1.count)
      expect(10).assertEqual(count)
      expect(10).assertEqual(count2)
      expect(10).assertEqual(Count2.count)
      Count1.count = 0
      Count2.count = 0
      done()

    })

    /**
     * @tc.number TASKPOOL_TASKGROUP_EXECUTE_1400
     * @tc.name taskPoolTaskGroupExecute1012
     * @tc.desc test onExecutionFailed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolTaskGroupExecute1012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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
        count2++
      })

      for (let i = 0; i < 10; i++) {
        taskpool.execute(taskGroup).then(() => {
          console.info("taskpool: execute task success")
        });
      }

      while ((count + count2) < 10) {
        await sleep(100)
      }
      console.info('=====', count)
      expect(10).assertEqual(count + count2)
      done()
    })

    /**
     * @tc.number TASKPOOL_TASKGROUP_EXECUTE_1500
     * @tc.name taskPoolTaskGroupExecute1012_1
     * @tc.desc test onExecutionFailed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolTaskGroupExecute1012_1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      
      let task: taskpool.Task = new taskpool.Task(printArgs3, 1);
      let task2: taskpool.Task = new taskpool.Task(printArgs4, 1);
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(task);
      taskGroup.addTask(task2);
      let count: number = 0
      let count2: number = 0

      task.onExecutionFailed(() => {
        try {
          let s: string[] = []
          s[0].split('')[1].toString()
        } catch (e) {
          count++
        }
      })

      task2.onExecutionFailed(() => {
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
     * @tc.number TASKPOOL_TASKGROUP_EXECUTE_1600
     * @tc.name taskPoolTaskGroupExecute1013
     * @tc.desc test onExecutionSucceeded
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolTaskGroupExecute1013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      
      let task: taskpool.Task = new taskpool.Task(printArgs1, 1);
      let task2: taskpool.Task = new taskpool.Task(printArgs2, 1);
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(task);
      taskGroup.addTask(task2);
      let count: number = 0
      let count2: number = 0

      task.onExecutionSucceeded(() => {
        count++
      });
      task2.onExecutionSucceeded(() => {
        count2++
      })

      for (let i = 0; i < 10; i++) {
        taskpool.execute(taskGroup).then(() => {
          console.info("taskpool: execute task success")
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
     * @tc.number TASKPOOL_TASKGROUP_EXECUTE_1700
     * @tc.name taskPoolTaskGroupExecute1013_1
     * @tc.desc test onExecutionSucceeded
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolTaskGroupExecute1013_1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      
      let task: taskpool.Task = new taskpool.Task(printArgs1, 1);
      let task2: taskpool.Task = new taskpool.Task(printArgs2, 1);
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(task);
      taskGroup.addTask(task2);
      let count: number = 0
      let count2: number = 0

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

      for (let i = 0; i < 10; i++) {
        taskpool.execute(taskGroup).then(() => {
          console.info("taskpool: execute task success")
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
     * @tc.number TASKPOOL_TASKGROUP_EXECUTE_1800
     * @tc.name taskPoolTaskGroupExecute1014
     * @tc.desc test onReceiveData
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolTaskGroupExecute1014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      
      let task: taskpool.Task = new taskpool.Task(printArgs7, 1);
      let task2: taskpool.Task = new taskpool.Task(printArgs8, 1);
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(task);
      taskGroup.addTask(task2);
      let count: number = 0
      let count2: number = 0

      task.onReceiveData((num: number) => {
        console.info('======num',num)
        count += num
      });
      task2.onReceiveData((num: number) => {
        count2 += num
      })

      for (let i = 0; i < 10; i++) {
        taskpool.execute(taskGroup)
      }

      while (count < 10) {
        await sleep(100)
      }

      expect(10).assertEqual(count)
      expect(10).assertEqual(count2)
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
    it('taskPoolTaskGroupExecute1015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      
      let task: taskpool.Task = new taskpool.Task(printArgs1, 1);
      let task2: taskpool.Task = new taskpool.Task(printArgs2, 1);
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(task);
      taskGroup.addTask(task2);

      for (let i = 0; i < 10; i++) {
        taskpool.execute(taskGroup)
      }
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
    it('taskPoolTaskGroupExecute1016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      
      let task: taskpool.Task = new taskpool.Task(printArgs5, 1);
      let task2: taskpool.Task = new taskpool.Task(printArgs6, 1);
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(task);
      taskGroup.addTask(task2);

      for (let i = 0; i < 10; i++) {
        taskpool.execute(taskGroup)
      }
      expect(task.isDone()).assertFalse()
      done()
    })

  })
}