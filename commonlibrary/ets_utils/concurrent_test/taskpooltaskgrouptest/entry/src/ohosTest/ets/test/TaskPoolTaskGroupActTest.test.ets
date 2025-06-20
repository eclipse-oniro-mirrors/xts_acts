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
import { Count1, Count2, Count3, Count4, Worker1, Worker2 } from '../testability/pages/DataFlg';
import {
  printArgs1,
  printArgs2,
  printArgs1001,
  printArgs1002,
  printArgs1005,
  printArgs1006,
  printArgs1007,
  printArgs1008,
  printArgs1009,
  printArgs1010,
  printArgs1011,
  printArgs1012,
  printArgs1013,
  printArgs1014,
  printArgs1015,
  printArgs1016
} from '../testability/pages/TaskMethodTest';
import { printArgs1003, printArgs1004 } from '../testability/pages/SecondTaskMethodTest'
import { BaseClass } from '../testability/pages/SendableTest';
import { BusinessError } from '@kit.BasicServicesKit';
import { worker, MessageEvents, ErrorEvent } from '@kit.ArkTS';
import { sleep } from '../testability/pages/Utils';


export default function taskPoolTaskGroupActTest() {
  describe('TaskPoolTaskGroupActTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(async () => {
      await sleep(1000)
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
     * @tc.number TASKPOOL_TASKGROUP_ACT_1001
     * @tc.name TASKPOOL_TASKGROUP_ACT_1001
     * @tc.desc test TaskGroup
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolTaskGroupActTest1001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      Count1.count = 0
      Count2.count = 0

      taskGroup.addTask(printArgs1001, 1);
      taskGroup.addTask(printArgs1002, 2);

      for (let i = 0; i < 10; i++) {
        taskpool.execute(taskGroup).then((num: object[]) => {
          Count1.count = Count1.count + Number(num[0])
          Count2.count = Count2.count + Number(num[1])
          console.info('======', Count1.count, Count2.count)
        })
      }

      while (Count1.count < 10 || Count2.count < 10) {
        await sleep(1000)
      }
      await sleep(500)
      expect(10).assertEqual(Count1.count)
      expect(20).assertEqual(Count2.count)
      Count1.count = 0
      Count2.count = 0
      done()
    })

    /**
     * @tc.number TASKPOOL_TASKGROUP_ACT_1002
     * @tc.name TASKPOOL_TASKGROUP_ACT_1002
     * @tc.desc test TaskGroup
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolTaskGroupActTest1002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      
      await sleep(1000)
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      Count1.count = 0
      Count2.count = 0

      taskGroup.addTask(printArgs1003, 1);
      taskGroup.addTask(printArgs1004, 2);

      for (let i = 0; i < 10; i++) {
        taskpool.execute(taskGroup).then((num: object[]) => {
          Count1.count = Count1.count + Number(num[0])
          Count2.count = Count2.count + Number(num[1])
          console.info('======', Count1.count, Count2.count)
        }).catch((e: BusinessError) => {
          console.info('======e.message', e.message)
        })
      }

      while (Count1.count < 10 || Count2.count < 10) {
        await sleep(1000)
      }
      await sleep(1000)
      expect(10).assertEqual(Count1.count)
      expect(20).assertEqual(Count2.count)
      Count1.count = 0
      Count2.count = 0
      done()
    })

    /**
     * @tc.number TASKPOOL_TASKGROUP_ACT_1003
     * @tc.name TASKPOOL_TASKGROUP_ACT_1003
     * @tc.desc test TaskGroup
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolTaskGroupActTest1003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      Count1.count = 0
      Count2.count = 0

      taskGroup.addTask(printArgs1005, 1);
      taskGroup.addTask(printArgs1006, 2);

      for (let i = 0; i < 10; i++) {
        taskpool.execute(taskGroup).then((num: object[]) => {
          Count1.count = Count1.count + Number(num[0])
          Count2.count = Count2.count + Number(num[1])
          console.info('======', Count1.count, Count2.count)
        })
      }

      while (Count1.count < 10 || Count2.count < 10) {
        await sleep(1000)
      }
      expect(10).assertEqual(Count1.count)
      expect(20).assertEqual(Count2.count)
      Count1.count = 0
      Count2.count = 0
      done()
    })

    /**
     * @tc.number TASKPOOL_TASKGROUP_ACT_1004
     * @tc.name TASKPOOL_TASKGROUP_ACT_1004
     * @tc.desc test TaskGroup
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolTaskGroupActTest1004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      Count1.count = 0
      Count2.count = 0

      taskGroup.addTask(printArgs1007, 1);
      taskGroup.addTask(printArgs1008, 2);

      for (let i = 0; i < 10; i++) {
        taskpool.execute(taskGroup).then((num: object[]) => {
          Count1.count = Count1.count + Number(num[0])
          Count2.count = Count2.count + Number(num[1])
          console.info('======', Count1.count, Count2.count)
        })
      }

      while (Count1.count < 10 || Count2.count < 10) {
        await sleep(1000)
      }
      expect(10).assertEqual(Count1.count)
      expect(20).assertEqual(Count2.count)
      Count1.count = 0
      Count2.count = 0
      done()
    })

    /**
     * @tc.number TASKPOOL_TASKGROUP_ACT_1005
     * @tc.name TASKPOOL_TASKGROUP_ACT_1005
     * @tc.desc test TaskGroup
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    // it('taskPoolTaskGroupActTest1005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

    //   // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
    //   
    //   let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
    //   Count1.count = 0
    //   Count2.count = 0
    //
    //   taskGroup.addTask(printArgs1009, 1,taskGroup);
    //   taskGroup.addTask(printArgs1010, 2,taskGroup);
    //
    //   for (let i = 0; i < 10; i++) {
    //     taskpool.execute(taskGroup).then((num: object[]) => {
    //       Count1.count = Count1.count + Number(num[0])
    //       Count2.count = Count2.count + Number(num[1])
    //       console.info('======', Count1.count, Count2.count)
    //     })
    //   }
    //
    //   while (Count1.count < 10 || Count2.count < 10) {
    //     await sleep(1000)
    //   }
    //   expect(10).assertEqual(Count1.count)
    //   expect(20).assertEqual(Count2.count)
    //   Count1.count = 0
    //   Count2.count = 0
    //   done()
    // })

    /**
     * @tc.number TASKPOOL_TASKGROUP_ACT_1006
     * @tc.name TASKPOOL_TASKGROUP_ACT_1006
     * @tc.desc test TaskGroup
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolTaskGroupActTest1006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      Count1.count = 0
      Count2.count = 0

      taskGroup.addTask(printArgs1011, 1);
      taskGroup.addTask(printArgs1012, 2);

      for (let i = 0; i < 10; i++) {
        taskpool.execute(taskGroup).then((num: object[]) => {
          Count1.count = Count1.count + Number(num[0])
          Count2.count = Count2.count + Number(num[1])
          console.info('======', Count1.count, Count2.count)
        })
      }

      while (Count1.count < 10 || Count2.count < 10) {
        await sleep(1000)
      }
      expect(10).assertEqual(Count1.count)
      expect(20).assertEqual(Count2.count)
      Count1.count = 0
      Count2.count = 0
      done()
    })

    /**
     * @tc.number TASKPOOL_TASKGROUP_ACT_1007
     * @tc.name TASKPOOL_TASKGROUP_ACT_1007
     * @tc.desc test TaskGroup
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolTaskGroupActTest1007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      Count1.count = 0
      Count2.count = 0

      taskGroup.addTask(printArgs1013, 1);
      taskGroup.addTask(printArgs1014, 2);

      for (let i = 0; i < 10; i++) {
        taskpool.execute(taskGroup).then((num: object[]) => {
          Count1.count = Count1.count + Number(num[0])
          Count2.count = Count2.count + Number(num[1])
          console.info('======', Count1.count, Count2.count)
        })
      }

      while (Count1.count < 10 || Count2.count < 10) {
        await sleep(1000)
      }
      expect(10).assertEqual(Count1.count)
      expect(20).assertEqual(Count2.count)
      Count1.count = 0
      Count2.count = 0
      done()
    })

    /**
     * @tc.number TASKPOOL_TASKGROUP_ACT_1008
     * @tc.name TASKPOOL_TASKGROUP_ACT_1008
     * @tc.desc test TaskGroup
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolTaskGroupActTest1008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      Count1.count = 0
      Count2.count = 0

      taskGroup.addTask(printArgs1015);
      taskGroup.addTask(printArgs1016);

      for (let i = 0; i < 10; i++) {
        taskpool.execute(taskGroup).then(() => {
          Count1.count = Count1.count + 1
          Count2.count = Count2.count + 1
          console.info('======', Count1.count, Count2.count)
        })
      }

      while (Count1.count < 10 || Count2.count < 10) {
        await sleep(500)
      }
      expect(10).assertEqual(Count1.count)
      expect(10).assertEqual(Count2.count)
      Count1.count = 0
      Count2.count = 0
      done()
    })


  })
}