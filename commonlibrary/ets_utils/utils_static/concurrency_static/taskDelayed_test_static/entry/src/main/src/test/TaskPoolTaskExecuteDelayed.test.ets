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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, TestType, Level, Size } from '../../../hypium/index';
// import { taskpool } from '@kit.ArkTS';
import {
  testFun1,
  testFun2,
  testFun3,
  //testFun4,
  testFun5
} from '../testability/pages/TaskMethodTest';
import { BusinessError } from '@ohos.base';
import { sleep } from '../testability/pages/Utils';

export default function taskPoolTaskExecuteDelayedTest() {
  describe('TaskPoolTaskExecuteDelayedTest', (): void => {
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
      await sleep(100)
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll((): void => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.number TASKPOOL_TASK_EXECUTEDELAYED_0200
     * @tc.name taskPoolTaskExecuteDelayed1002
     * @tc.desc test GenericsTask
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolTaskExecuteDelayed1002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      console.info('testTag', '%{public}s', 'it begin');

      let allPoints:number = 0;
      let repeatCount:number = 10
      let cycleCount:number = 100
      let step :number= 1;
      let callbackTime:number = 0;

      await new Promise<boolean>((resolve, _) => {
        for (let i = 0; i < repeatCount; i++) {
          let task: taskpool.Task = new taskpool.Task(testFun2, cycleCount, step)
          await taskpool.executeDelayed(50, task)
            .then((num?:number) => {
              allPoints += Number(num as Number)
              callbackTime++;
              if (callbackTime == repeatCount) {
                resolve(true)
              }
            })
            .catch((e:Error) => {
              console.error(`error message error: ${JSON.stringify(e)}`)
              throw e as Error
            })
        }
      })
      expect(allPoints).assertEqual(cycleCount * repeatCount * step)
      done()
    })



  })
}