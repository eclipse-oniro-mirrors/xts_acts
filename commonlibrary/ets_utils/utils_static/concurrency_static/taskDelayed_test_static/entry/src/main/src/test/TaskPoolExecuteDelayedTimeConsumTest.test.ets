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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '../../../hypium/index';
// import { taskpool } from '@kit.ArkTS';
import {
  longTask,
  longTaskError,
  printArgs,
  printArgsError,
  timedTask,
  timedTaskError
} from '../testability/pages/TaskMethodTest';
import { BusinessError } from '@ohos.base';
import { Count1 } from '../testability/pages/DataFlg';
import { sleep } from '../testability/pages/Utils';

export default function taskPoolExecuteDelayedTimeConsumTest() {
  describe('TaskPoolExecuteDelayedTimeConsumTest', (): void => {
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
     * @tc.number TASKPOOL_EXECUTE_DELAYED_TIME_CONSUM_TEST_0100
     * @tc.name taskPoolExecuteDelayedTimeConsumTest0100
     * @tc.desc The task takes less time than the delay time success
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolExecuteDelayedTimeConsumTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      Count1.count = 0
      // 创建一个任务
      let task: taskpool.Task = new taskpool.Task(printArgs, 100 as Number); // 100: 测试参数
      // 记录任务开始时间
      let startTime: number = Date.now();
      console.info('taskpool start time is: ' + startTime);
      taskpool.executeDelayed(1000, task)
        .then(() => {
          let endTime: number = Date.now();
          let elapsedTime: number = endTime - startTime;
          console.info('taskpool elapsed time is: ' + elapsedTime + 'ms');
          Count1.count++
        });

      while ((Count1.count as number) < 1) {
        await sleep(100)
      }

      expect(1).assertEqual(Count1.count)
      done()
    });

    /**
     * @tc.number taskPoolExecuteDelayedTimeConsumTest0100_2
     * @tc.name taskPoolExecuteDelayedTimeConsumTest0100_2
     * @tc.desc The task takes less time than the delay time fail
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolExecuteDelayedTimeConsumTest0100_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      // 记录任务开始时间
      let flag:boolean=false;
      let startTime: number = Date.now();
      console.info('taskpool start time is: ' + startTime);
      let task: taskpool.Task = new taskpool.Task(printArgsError, 100);
       await taskpool.executeDelayed(1000, task)
        .catch((e: Error):void => {
          flag = true;
        });
      expect(flag).assertTrue();
      done()
    });

    /**
     * @tc.number taskPoolExecuteDelayedTimeConsumTest0101_2
     * @tc.name taskPoolExecuteDelayedTimeConsumTest0101_2
     * @tc.desc The task takes equal time than the delay time fail
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolExecuteDelayedTimeConsumTest0101_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let startTime: number = Date.now();
      console.info('taskpool start time is: ' + startTime);
      let flag:boolean=false;
      const delayTime = 1000;
      const taskDuration = 1000;
      let task: taskpool.Task = new taskpool.Task(timedTaskError, taskDuration);

      await taskpool.executeDelayed(delayTime, task)
        .then(() => {
        })
        .catch((e: Error):void => {
          flag = true;
        });
      expect(flag).assertTrue();
      done()
    });

    /**
     * @tc.number taskPoolExecuteDelayedTimeConsumTest0102_2
     * @tc.name taskPoolExecuteDelayedTimeConsumTest0102_2
     * @tc.desc The task takes larger time than the delay time success
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolExecuteDelayedTimeConsumTest0102_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      // 记录任务开始时间
      let startTime: number = Date.now();
      console.info('taskpool start time is: ' + startTime);

      // 创建一个任务
      let task: taskpool.Task = new taskpool.Task(longTask, 100); // 100: 测试参数
      Count1.count = 0
      // 使用 executeDelayed 延时执行任务
      await taskpool.executeDelayed(1000, task) // 1000: 延时 1000ms
        .then(() => {
          let endTime: number = Date.now();
          let elapsedTime: number = endTime - startTime;
          console.info('taskpool elapsed time is: ' + elapsedTime + 'ms');
          Count1.count++
        })
        .catch((e: Error):void => {
        });
      while (Count1.count < 1) {
        await sleep(100)
      }

      expect(1).assertEqual(Count1.count)
      done();
    });

    /**
     * @tc.number taskPoolExecuteDelayedTimeConsumTest0102_3
     * @tc.name taskPoolExecuteDelayedTimeConsumTest0102_3
     * @tc.desc The task takes larger time than the delay time fail
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolExecuteDelayedTimeConsumTest0102_3', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      // 记录任务开始时间
      let startTime: number = Date.now();
      let flag :boolean= false;
      console.info('taskpool start time is: ' + startTime);
      let task: taskpool.Task = new taskpool.Task(longTaskError, 100);
      await taskpool.executeDelayed(1000, task)
        .then(() => {
        })
        .catch((e: Error):void => {
         flag = true;
        });
      expect(flag).assertTrue();
      done()
    });
  })
}

