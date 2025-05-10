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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium';
import { taskpool } from '@kit.ArkTS';
import { longTask, longTaskError, printArgs, printArgsError, timedTask,
  timedTaskError } from '../testability/pages/TaskMethodTest';
import { BusinessError } from '@kit.BasicServicesKit';
import { Count1 } from '../testability/pages/DataFlg';
import { sleep } from '../testability/pages/Utils';

export default function taskPoolExecuteDelayedTimeConsumTest() {
  describe('TaskPoolExecuteDelayedTimeConsumTest', () => {
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
     * @tc.number TASKPOOL_EXECUTE_DELAYED_TIME_CONSUM_TEST_0100
     * @tc.name taskPoolExecuteDelayedTimeConsumTest0100
     * @tc.desc The task takes less time than the delay time success
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolExecuteDelayedTimeConsumTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Count1.count = 0
      // 创建一个任务
      let task: taskpool.Task = new taskpool.Task(printArgs, 100); // 100: 测试参数
      // 记录任务开始时间
      let startTime: number = Date.now();
      console.info("taskpool start time is: " + startTime);
      // 使用 executeDelayed 延时执行任务
      taskpool.executeDelayed(1000, task)// 1000: 延时 1000ms
        .then((result: Object) => {
          // 计算任务实际执行时间
          let endTime: number = Date.now();
          let elapsedTime: number = endTime - startTime;
          console.info("taskpool elapsed time is: " + elapsedTime + "ms");
          Count1.count++
        });

      while (Count1.count < 1) {
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
    it('taskPoolExecuteDelayedTimeConsumTest0100_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      // 记录任务开始时间
      let startTime: number = Date.now();
      console.info("taskpool start time is: " + startTime);

      // 创建一个任务
      let task: taskpool.Task = new taskpool.Task(printArgsError, 100); // 100: 测试参数

      // 使用 executeDelayed 延时执行任务，传入不合法的 delayTime（小于 0）
       taskpool.executeDelayed(1000, task)
        .catch((e: BusinessError) => {
          // 任务执行失败
          console.error(`taskpool execute failed: Code: ${e.code}, message: ${e.message}`);
          // 断言：验证错误码和错误信息
          expect(e.code).assertEqual(10200014); // 错误码应为 10200014
          done()
        });
    });

    /**
     * @tc.number TASKPOOL_EXECUTE_DELAYED_TIME_CONSUM_TEST_0100
     * @tc.name taskPoolExecuteDelayedTimeConsumTest0100
     * @tc.desc The task takes equal time than the delay time success
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTaskExecutionTimeEqualsDelay', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      // 记录任务开始时间
      let startTime: number = Date.now();
      console.info("taskpool start time is: " + startTime);

      // 设置延时时间和任务耗时
      const delayTime = 1000; // 延时 1000ms
      const taskDuration = 1000; // 任务耗时 1000ms
      Count1.count = 0
      // 创建一个任务
      let task: taskpool.Task = new taskpool.Task(timedTask, taskDuration);

      // 使用 executeDelayed 延时执行任务
      taskpool.executeDelayed(delayTime, task)
        .then(() => {
          // 任务执行成功
          console.info("taskpool execute success");

          // 计算任务实际执行时间
          let endTime: number = Date.now();
          let elapsedTime: number = endTime - startTime;
          console.info("taskpool elapsed time is: " + elapsedTime + "ms");
          Count1.count++
        })
        .catch((e: BusinessError) => {
          // 任务执行失败
          console.error(`taskpool execute failed: Code: ${e.code}, message: ${e.message}`);

          // 断言：任务应成功执行，不应进入 catch
          expect(true).assertFalse(); // 强制失败
        });
      while (Count1.count < 1) {
        await sleep(100)
      }

      expect(1).assertEqual(Count1.count)
      done();
    });
    /**
     * @tc.number taskPoolExecuteDelayedTimeConsumTest0101_2
     * @tc.name taskPoolExecuteDelayedTimeConsumTest0101_2
     * @tc.desc The task takes equal time than the delay time fail
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolExecuteDelayedTimeConsumTest0101_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let startTime: number = Date.now();
      console.info("taskpool start time is: " + startTime);

      // 设置延时时间和任务耗时
      const delayTime = 1000; // 延时 1000ms
      const taskDuration = 1000; // 任务耗时 1000ms

      // 创建一个任务
      let task: taskpool.Task = new taskpool.Task(timedTaskError, taskDuration);

      // 使用 executeDelayed 延时执行任务
      taskpool.executeDelayed(delayTime, task)
        .then(() => {
          // 如果任务执行成功，强制断言失败
          expect(true).assertFalse(); // 不应进入 then
        })
        .catch((e: BusinessError) => {
          // 任务执行失败
          console.error(`taskpool execute failed: Code: ${e.code}, message: ${e.message}`);
          // 断言：验证错误码和错误信息
          expect(e.code).assertEqual(undefined);
          done()
        });
    });

    /**
     * @tc.number taskPoolExecuteDelayedTimeConsumTest0102_2
     * @tc.name taskPoolExecuteDelayedTimeConsumTest0102_2
     * @tc.desc The task takes larger time than the delay time success
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolExecuteDelayedTimeConsumTest0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      // 记录任务开始时间
      let startTime: number = Date.now();
      console.info("taskpool start time is: " + startTime);

      // 创建一个任务
      let task: taskpool.Task = new taskpool.Task(longTask, 100); // 100: 测试参数
      Count1.count = 0
      // 使用 executeDelayed 延时执行任务
      taskpool.executeDelayed(1000, task) // 1000: 延时 1000ms
        .then((result: Object) => {
          // 任务执行成功
          console.info("taskpool execute success, result: " + JSON.stringify(result));

          // 计算任务实际执行时间
          let endTime: number = Date.now();
          let elapsedTime: number = endTime - startTime;
          console.info("taskpool elapsed time is: " + elapsedTime + "ms");
          Count1.count++
        })
        .catch((e: BusinessError) => {
          // 任务执行失败
          console.error(`taskpool execute failed: Code: ${e.code}, message: ${e.message}`);

          // 断言：任务应成功执行，不应进入 catch
          expect(true).assertFalse(); // 强制失败
        });
      while (Count1.count < 1) {
        await sleep(100)
      }

      expect(1).assertEqual(Count1.count)
      done();
    });

    /**
     * @tc.number taskPoolExecuteDelayedTimeConsumTest0102_2
     * @tc.name taskPoolExecuteDelayedTimeConsumTest0102_2
     * @tc.desc The task takes larger time than the delay time fail
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolExecuteDelayedTimeConsumTest0102_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      // 记录任务开始时间
      let startTime: number = Date.now();
      console.info("taskpool start time is: " + startTime);

      // 创建一个任务
      let task: taskpool.Task = new taskpool.Task(longTaskError, 100); // 100: 测试参数

      // 使用 executeDelayed 延时执行任务，传入不合法的 delayTime（小于 0）
      taskpool.executeDelayed(1000, task)// -100: 不合法的延时时间
        .then(() => {
          // 如果任务执行成功，强制断言失败
          expect(true).assertFalse(); // 不应进入 then
        })
        .catch((e: BusinessError) => {
          // 任务执行失败
          console.error(`taskpool execute failed: Code: ${e.code}, message: ${e.message}`);
          // 断言：验证错误码和错误信息
          expect(e.code).assertEqual(undefined); // 错误码应为 10200028
          done()
        });
    });
  })
}

