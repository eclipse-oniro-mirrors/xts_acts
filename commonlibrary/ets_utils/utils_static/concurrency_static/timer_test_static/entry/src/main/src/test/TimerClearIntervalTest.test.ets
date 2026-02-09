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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Size, TestType, Level } from '../../../hypium/index';
import { sleep } from '../testability/pages/Utils';


export default function TimerClearIntervalTest() {
  describe('TimerClearIntervalTest', (): void => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll((): void => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async (): Promise<void> => {
      await sleep(100);
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach((): void => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll((): void => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.number SUB_TIMER_CLEARINTERVAL_TEST_0100
     * @tc.name TimerClearIntervalTest0100
     * @tc.desc test ClearInterval
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('TimerClearIntervalTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done: () => void): Promise<void> => {
      let count: number = 0;
      const timeoutID = setInterval(() => {
        count += 1;
      }, 2000);
      clearInterval(timeoutID);
      console.log('count:' + count);
      expect(count).assertEqual(0)
      Done();
    });


    /**
     * @tc.number SUB_TIMER_CLEARINTERVAL_TEST_0200
     * @tc.name TimerClearIntervalTest0200
     * @tc.desc test ClearInterval
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('TimerClearIntervalTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done: () => void): Promise<void> => {
      let a = 0
      const intervalID = setInterval(() => {
        console.log('Timer is executing...');
      }, 1000);
      console.log(`Timer ID is: ${intervalID}`);
      expect(typeof intervalID).assertEqual(typeof a)
      clearTimeout(intervalID)
      Done();
    });


    /**
     * @tc.number SUB_TIMER_CLEARINTERVAL_TEST_0300
     * @tc.name TimerClearIntervalTest0300
     * @tc.desc test ClearInterval
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TimerClearIntervalTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      let a = 0
      const timeoutID = setInterval(() => {
        console.log('Scheduled task execution completed');
      }, 2000);
      console.log(`Timer ID is: ${timeoutID}`);
      expect(typeof timeoutID).assertEqual(typeof a)
      clearInterval(timeoutID);
      Done();
    });

    /**
     * @tc.number SUB_TIMER_CLEARINTERVAL_TEST_1100
     * @tc.name TimerClearIntervalTest1100
     * @tc.desc test ClearInterval
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TimerClearIntervalTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      let count: number = 0
      const timeoutID = setTimeout(() => {
        count += 1
      }, 2000)
      clearInterval(timeoutID);
      expect(count).assertEqual(0)
      Done();
    });

  })
}