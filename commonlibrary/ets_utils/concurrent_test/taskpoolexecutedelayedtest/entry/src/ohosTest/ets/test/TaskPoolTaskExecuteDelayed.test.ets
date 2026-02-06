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
import { taskpool } from '@kit.ArkTS';
import { testFun1, testFun2, testFun3, testFun4, testFun5 } from '../testability/pages/TaskMethodTest';
import { BusinessError } from '@kit.BasicServicesKit';


export default function taskPoolTaskExecuteDelayedTest() {
  describe('TaskPoolTaskExecuteDelayedTest', () => {
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
     * @tc.name   taskPoolTaskExecuteDelayed1001
     * @tc.number TASKPOOL_TASK_EXECUTEDELAYED_TEST_0100
     * @tc.desc   test TaskGroup
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolTaskExecuteDelayed1001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      console.info('testTag', '%{public}s', 'it begin');

      let allPoints = 0;
      let repeatCount = 10
      let step = 1
      let callbackTime = 0;


      await new Promise<boolean>((resolve, _) => {
        let task: taskpool.Task = new taskpool.Task(testFun1, step)
        for (let i = 0; i < repeatCount; i++) {
          taskpool.executeDelayed(50, task)
            .then((num: object) => {
              allPoints += Number(num)
              callbackTime++;
              if (callbackTime == repeatCount) {
                resolve(true)
              }
            }).catch((e: BusinessError) => {
            console.error(`error message error: ${JSON.stringify(e)}`)
            throw e as Error
          })
        }
      })
      expect(allPoints).assertEqual(2 * step * repeatCount)
      done()
    })


    /**
     * @tc.name   taskPoolTaskExecuteDelayed1002
     * @tc.number TASKPOOL_TASK_EXECUTEDELAYED_0200
     * @tc.desc   test GenericsTask
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('taskPoolTaskExecuteDelayed1002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      console.info('testTag', '%{public}s', 'it begin');

      let allPoints = 0;
      let repeatCount = 10
      let cycleCount = 100
      let step = 1;
      let callbackTime = 0;

      await new Promise<boolean>((resolve, _) => {
        let task: taskpool.Task = new taskpool.Task(testFun2, cycleCount, step)
        for (let i = 0; i < repeatCount; i++) {
          taskpool.executeDelayed(50, task)
            .then((num: object) => {
              allPoints += Number(num)
              callbackTime++;
              if (callbackTime == repeatCount) {
                resolve(true)
              }
            })
            .catch((e: BusinessError) => {
              console.error(`error message error: ${JSON.stringify(e)}`)
              throw e as Error
            })
        }
      })
      expect(allPoints).assertEqual(cycleCount * repeatCount * step)
      done()
    })


    /**
     * @tc.name   taskPoolTaskExecuteDelayed1003
     * @tc.number TASKPOOL_TASK_EXECUTEDELAYED_0300
     * @tc.desc   test GenericsTask
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolTaskExecuteDelayed1003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      console.info('testTag', '%{public}s', 'it begin');

      let allTextSizeList: Array<number> = []

      let repeatCount = 10
      let cycleCount = 100
      let content = "asyncTask"
      let callbackTime = 0;

      await new Promise<boolean>((resolve, _) => {
        let task: taskpool.Task = new taskpool.Task(testFun3, cycleCount, content)
        for (let i = 0; i < repeatCount; i++) {
          taskpool.executeDelayed(50, task)
            .then((arr: object) => {
              allTextSizeList.push(...(arr as Array<number>))
              callbackTime++;
              if (callbackTime == repeatCount) {
                resolve(true)
              }
            })
            .catch((e: BusinessError) => {
              console.error(`error message error: ${JSON.stringify(e)}`)
              throw e as Error;
            })
        }
      })

      if (allTextSizeList.length < cycleCount * repeatCount) {
        console.error(`Length exception error`)
        throw new Error("Length exception error")
      }

      let result = true;
      for (let i = 1; i < repeatCount * cycleCount; i++) {
        if (allTextSizeList[i-1] == allTextSizeList[i] && allTextSizeList[i] > 0) {
          continue
        } else {
          result = false;
          break
        }
      }
      expect(result).assertEqual(true)
      done()
    })


    /**
     * @tc.name   taskPoolTaskExecuteDelayed1004
     * @tc.number TASKPOOL_TASKGROUP_EXECUTE_0400
     * @tc.desc   test task1.name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolTaskExecuteDelayed1004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      console.info('testTag', '%{public}s', 'it begin');


      let allPoints = 0;
      let repeatCount = 10
      let step = 1;
      let callbackTime = 0;

      await new Promise<boolean>((resolve, _) => {
        let task: taskpool.Task = new taskpool.Task(testFun4, step)
        for (let i = 0; i < repeatCount; i++) {
          taskpool.executeDelayed(50, task)
            .then((num: object) => {
              allPoints += Number(num)
              callbackTime++;
              if (callbackTime == repeatCount) {
                resolve(true)
              }
            })
            .catch((e: BusinessError) => {
              console.error(`error message error: ${JSON.stringify(e)}`)
              throw e as Error;
            })
        }
      })
      expect(allPoints).assertEqual(repeatCount * step * 2)
      done()
    })

    /**
     * @tc.name   taskPoolTaskExecuteDelayed1005
     * @tc.number TASKPOOL_TASK_EXECUTEDELAYED_0300
     * @tc.desc   test GenericsTask
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolTaskExecuteDelayed1005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      console.info('testTag', '%{public}s', 'it begin');

      let allTextSizeList: Array<number> = []

      let repeatCount = 10
      let content = "asyncTask"
      let callbackTime = 0;

      await new Promise<boolean>((resolve, _) => {
        let task: taskpool.Task = new taskpool.Task(testFun5, content)
        for (let i = 0; i < repeatCount; i++) {
          taskpool.executeDelayed(50, task)
            .then((arr: object) => {
              allTextSizeList.push((arr as Array<number>)[0])
              callbackTime++;
              if (callbackTime == repeatCount) {
                resolve(true)
              }
            })
            .catch((e: BusinessError) => {
              console.error(`error message error: ${JSON.stringify(e)}`)
              throw e as Error
            })
        }
      })

      let result = true;
      for (let i = 1; i < repeatCount; i++) {
        if (allTextSizeList[i-1] == allTextSizeList[i] && allTextSizeList[i] > 0) {
          continue
        } else {
          result = false;
          break
        }
      }
      expect(result).assertEqual(true)
      done()
    })


  })
}