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
import { describe, expect, it, afterEach, TestType, Size, Level, beforeAll, beforeEach, afterAll } from '../../../hypium/index';
import { attemptClearTimer, createTimer, mainTimer, Timer } from '../testability/pages/TaskMethodTest1';
import { sleep } from '../testability/pages/Utils';


const timerIds: number[] = [];

export default function timerMultiThreadTest() {
  describe('TimerMultiThreadTest', (): void => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll((): void => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(500)
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(async () => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
      timerIds.forEach((id) => {
        clearInterval(id as int);
      });
      await sleep(500)
    })
    afterAll((): void => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.number SUB_TIMER_MULTI_THREAD_TEST_0100
     * @tc.name timerMultiThreadTest1001
     * @tc.desc main thread timer
     * @tc.size SMALLTEST
     * @tc.type Function
     * @tc.level Level 0
     */
    it('timerMultiThreadTest1001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const timer = await createTimer(100, 3);
        timerIds.push(timer.id);
        expect(timer.count).assertEqual(3);
        done();
      });

    /**
     * @tc.number SUB_TIMER_MULTI_THREAD_TEST_0200
     * @tc.name timerMultiThreadTest1002
     * @tc.desc subThread timer
     * @tc.size SMALLTEST
     * @tc.type Function
     * @tc.level Level 1
     */
    it('timerMultiThreadTest1002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
          const task = new taskpool.Task(createTimer, 150, 4);
          const timer = await taskpool.execute(task) as Timer;
          timerIds.push(timer.id)
          expect(timer.count).assertEqual(4);
          done();
        } catch (err) {
          done();
        }
      });


  });
}