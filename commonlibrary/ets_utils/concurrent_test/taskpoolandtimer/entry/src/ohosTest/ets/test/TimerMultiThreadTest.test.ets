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
import { describe, expect, it, afterEach, TestType, Size, Level, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
import { taskpool } from '@kit.ArkTS';
import { attemptClearTimer, createTimer, mainTimer, Timer } from '../testability/pages/TaskMethodTest1';
import { sleep } from '../testability/pages/Utils';


const timerIds: number[] = [];

export default function timerMultiThreadTest() {
  describe('TimerMultiThreadTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
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
        clearInterval(id);
      });
      await sleep(500)
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.name   timerMultiThreadTest1001
     * @tc.number SUB_TIMER_MULTI_THREAD_TEST_0100
     * @tc.desc   main thread timer
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('timerMultiThreadTest1001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      async (done: Function) => {
        const timer = await createTimer(100, 3);
        timerIds.push(timer.id);
        expect(timer.count).assertEqual(3);
        done();
      });

    /**
     * @tc.name   timerMultiThreadTest1002
     * @tc.number SUB_TIMER_MULTI_THREAD_TEST_0200
     * @tc.desc   subThread timer
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('timerMultiThreadTest1002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          const task = new taskpool.Task(createTimer, 150, 4);
          const timer = await taskpool.execute(task) as Timer;
          timerIds.push(timer.id)
          expect(timer.count).assertEqual(4);
          done();
        } catch (err) {
          done(err);
        }
      });

    /**
     * @tc.name   timerMultiThreadTest1004
     * @tc.number SUB_TIMER_MULTI_THREAD_TEST_0400
     * @tc.desc   overThread timer
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('timerMultiThreadTest1004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          const timer = await taskpool.execute(mainTimer, 100, 3) as Timer;
          timerIds.push(timer.id);
          const res = await taskpool.execute(attemptClearTimer, timer.id)
          expect(res).assertEqual(undefined);
          done();
        } catch (err) {
          done(err);
        }
      });

    /**
     * @tc.name   timerMultiThreadTest1005
     * @tc.number SUB_TIMER_MULTI_THREAD_TEST_0500
     * @tc.desc   subTimer clear
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('timerMultiThreadTest1005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (done: Function) => {
        let timer = await mainTimer(100, 3) as Timer;
        try {
          const res = await taskpool.execute(attemptClearTimer, timer.id)
          timerIds.push(timer.id);
          expect(res).assertEqual(undefined);
        } catch (err) {
          expect(err.message).assertEqual('');
        } finally {
          done();
        }
      });

    /**
     * @tc.name   timerMultiThreadTest1006
     * @tc.number SUB_TIMER_MULTI_THREAD_TEST_0600
     * @tc.desc   mainTimer clear
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('timerMultiThreadTest1006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (done: Function) => {
        const setTask = new taskpool.Task(mainTimer, 100, 3);
        try {
          const timer = await taskpool.execute(setTask) as Timer;
          timerIds.push(timer.id);
          clearInterval(timer.id);
          expect(timer.count).assertEqual(3);
        } catch (err) {
          expect(err.message).assertEqual('');
        } finally {
          done();
        }
      });
  });
}