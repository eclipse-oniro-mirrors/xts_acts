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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Size, TestType, Level } from "@ohos/hypium";
import { sleep } from "../testability/pages/Utils";


export default function TimerClearIntervalTest() {
  describe('TimerClearIntervalTest', () => {
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
     * @tc.name   TimerClearIntervalTest0100
     * @tc.number SUB_TIMER_CLEARINTERVAL_TEST_0100
     * @tc.desc   test ClearInterval
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TimerClearIntervalTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done: Function) => {
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
     * @tc.name   TimerClearIntervalTest0200
     * @tc.number SUB_TIMER_CLEARINTERVAL_TEST_0200
     * @tc.desc   test ClearInterval
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TimerClearIntervalTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done: Function) => {
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
     * @tc.name   TimerClearIntervalTest0300
     * @tc.number SUB_TIMER_CLEARINTERVAL_TEST_0300
     * @tc.desc   test ClearInterval
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TimerClearIntervalTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
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
     * @tc.name   TimerClearIntervalTest0400
     * @tc.number SUB_TIMER_CLEARINTERVAL_TEST_0400
     * @tc.desc   test ClearInterval
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TimerClearIntervalTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const timeoutID = 9999;
      const intervalID = clearInterval(timeoutID);
      let a: undefined = undefined
      expect(typeof intervalID).assertEqual(typeof a)
      Done();
    });


    /**
     * @tc.name   TimerClearIntervalTest0500
     * @tc.number SUB_TIMER_CLEARINTERVAL_TEST_0500
     * @tc.desc   test ClearInterval
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TimerClearIntervalTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const timeoutID = clearInterval();
      console.log('timeoutID:' + timeoutID)
      let a: undefined = undefined
      expect(typeof timeoutID).assertEqual(typeof a)
      Done();
    });


    /**
     * @tc.name   TimerClearIntervalTest0600
     * @tc.number SUB_TIMER_CLEARINTERVAL_TEST_0600
     * @tc.desc   test ClearInterval
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TimerClearIntervalTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const timeoutID = clearInterval(null);
      console.log('timeoutID:' + timeoutID)
      let a: undefined = undefined
      expect(typeof timeoutID).assertEqual(typeof a)
      Done();
    });


    /**
     * @tc.name   TimerClearIntervalTest0700
     * @tc.number SUB_TIMER_CLEARINTERVAL_TEST_0700
     * @tc.desc   test ClearInterval
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TimerClearIntervalTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const timeoutID = clearInterval(undefined);
      console.log('timeoutID:' + timeoutID)
      let a: undefined = undefined
      expect(typeof timeoutID).assertEqual(typeof a)
      Done();
    });


    /**
     * @tc.name   TimerClearIntervalTest0800
     * @tc.number SUB_TIMER_CLEARINTERVAL_TEST_0800
     * @tc.desc   test ClearInterval
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TimerClearIntervalTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const timeoutID = clearInterval(-1);
      console.log('timeoutID:' + timeoutID)
      let a: undefined = undefined
      expect(typeof timeoutID).assertEqual(typeof a)
      Done();
    });


    /**
     * @tc.name   TimerClearIntervalTest0900
     * @tc.number SUB_TIMER_CLEARINTERVAL_TEST_0900
     * @tc.desc   test ClearInterval
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TimerClearIntervalTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const timeoutID = clearInterval(0);
      console.log('timeoutID:' + timeoutID)
      let a: undefined = undefined
      expect(typeof timeoutID).assertEqual(typeof a)
      Done();
    });


    /**
     * @tc.name   TimerClearIntervalTest1000
     * @tc.number SUB_TIMER_CLEARINTERVAL_TEST_1000
     * @tc.desc   test ClearInterval
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TimerClearIntervalTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const timeoutID = clearInterval(1.1);
      console.log('timeoutID:' + timeoutID)
      let a: undefined = undefined
      expect(typeof timeoutID).assertEqual(typeof a)
      Done();
    });


    /**
     * @tc.name   TimerClearIntervalTest1100
     * @tc.number SUB_TIMER_CLEARINTERVAL_TEST_1100
     * @tc.desc   test ClearInterval
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TimerClearIntervalTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
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