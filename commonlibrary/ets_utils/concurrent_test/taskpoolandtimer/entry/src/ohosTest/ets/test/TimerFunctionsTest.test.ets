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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium';
import { asyncTask, logTime, task, task2 } from '../testability/pages/PromiseMethods';
import { BusinessError } from '@kit.BasicServicesKit';

let flag: boolean = false;

function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
};

interface TaskInfo {
  name: string;
  delay: number;
}

export default function functionsInTimerTest() {
  describe('FunctionsInTimerTest', () => {
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
     * @tc.number SUB_FUNCTIONS_IN_TIMER_TEST_0100
     * @tc.name functionsInTimerTest0100
     * @tc.desc test Execute different time-consuming tasks in functions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('functionsInTimerTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async (Done: Function) => {
      const caseName = 'functionsInTimerTest0100';
      console.info(`${caseName} test start`);
      setTimeout(async () => {
        await task('1millisecond tasks', 1);
        await task('200millisecond tasks', 20);
        await task('700millisecond tasks', 70);
        flag = true;
      }, 0);
      while (flag != true) {
        await sleep(100);
      }
      expect(flag).assertTrue();
      console.info(`${caseName} test end`);
      Done();
    })

    /**
     * @tc.number SUB_FUNCTIONS_IN_TIMER_TEST_0200
     * @tc.name functionsInTimerTest0200
     * @tc.desc test Asynchronous tasks are used for nesting in functions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('functionsInTimerTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'functionsInTimerTest0200';
      console.info(`${caseName} test start`);
      const timerId = setTimeout(async () => {
        console.log('Timer callback started');
        try {
          const promises = [asyncTask(1), asyncTask(2), asyncTask(3)]; // 创建多个 Promise
          const results = await Promise.all(promises); // 并行执行所有 Promise
          results.forEach(result => console.log(result));
          flag = true;
        } catch (error) {
          console.error('Error in async tasks:', error);
        }
      }, 100);
      while (flag != true) {
        await sleep(100);
      }
      expect(flag).assertTrue();
      console.info(`${caseName} test end`);
      Done();
    })

    /**
     * @tc.number SUB_FUNCTIONS_IN_TIMER_TEST_0300
     * @tc.name functionsInTimerTest0300
     * @tc.desc test Exceptions are thrown in the function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('functionsInTimerTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'functionsInTimerTest0300';
      console.info(`${caseName} test start`);
      setTimeout(() => {
        try {
          if (Math.random() < 1) {
            throw new Error('error1');
          }
        } catch (error) {
          expect(error.message).assertEqual('error1')
          flag = true;
        }
      }, 100);
      while (flag != true) {
        await sleep(100);
      }
      expect(flag).assertTrue();
      console.info(`${caseName} test end`);
      Done();
    })

    /**
     * @tc.number SUB_FUNCTIONS_IN_TIMER_TEST_0400
     * @tc.name functionsInTimerTest0400
     * @tc.desc test Native calls uv thread
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('functionsInTimerTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'functionsInTimerTest0400';
      console.info(`${caseName} test start`);
      const tasks: TaskInfo[] = [
        {
          name: '1millisecond tasks', delay: 1
        },
        {
          name: '20millisecond tasks', delay: 20
        },
        {
          name: '70millisecond tasks', delay: 70
        }
      ];
      tasks.forEach((taskInfo: TaskInfo) => {
        setTimeout(() => {
          task2(taskInfo.name, taskInfo.delay).then(() => {
            logTime(`${taskInfo.name} is completed`);
            flag = true;
          }).catch((error: BusinessError) => {
            console.error(`Error in task ${taskInfo.name}:`, error);
          });
        }, 0);
      });
      while (flag != true) {
        await sleep(100);
      }
      expect(flag).assertTrue();
      console.info(`${caseName} test end`);
      Done();
    })
  })
}

