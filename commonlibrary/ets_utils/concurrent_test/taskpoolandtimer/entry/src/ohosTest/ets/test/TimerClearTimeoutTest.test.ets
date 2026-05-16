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

let flag: boolean = false

function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time))
}

export default function clearTimeoutTest() {
  describe('ClearTimeoutTest', () => {
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
     * @tc.name   clearTimeoutTest0100
     * @tc.number SUB_TIMER_CLEARTIMEOUT_TEST_0100
     * @tc.desc   test ClearTimeout an ID that has not yet been executed
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('clearTimeoutTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async (Done: Function) => {
      const caseName = 'clearTimeoutTest0100';
      console.info(`${caseName} test start`);
      const timerId = setTimeout(() => {
        flag = true;
      }, 2000);
      const shouldCancel = true;
      if (shouldCancel) {
        clearTimeout(timerId);
      } else {
        console.log('Timer will execute as scheduled.');
      }
      expect(flag).assertFalse();
      console.info(`${caseName} test end`);
      Done();
    })

    /**
     * @tc.name   clearTimeoutTest0200
     * @tc.number SUB_TIMER_CLEARTIMEOUT_TEST_0200
     * @tc.desc   test ClearTimeout an ID that in execution
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('clearTimeoutTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'clearTimeoutTest0200';
      console.info(`${caseName} test start`);
      const timerId = setTimeout(() => {
        for (let i = 0; i < 5; i++) {
          console.log(`Handler is working... ${i + 1}/5`);
          const start = Date.now();
          while (Date.now() - start < 100) {
            console.log('Handler is working...');
          }
        }
        flag = true;
      }, 100);
      console.log(`Timer ID: ${timerId}`);
      setTimeout(() => {
        clearTimeout(timerId);
      }, 150);
      while (flag != true) {
        await sleep(100);
      }
      ;
      expect(flag).assertTrue();
      console.info(`${caseName} test end`);
      Done();
    })

    /**
     * @tc.name   clearTimeoutTest0300
     * @tc.number SUB_TIMER_CLEARTIMEOUT_TEST_0300
     * @tc.desc   test ClearTimeout an ID of the completed execution
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('clearTimeoutTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'clearTimeoutTest0300';
      console.info(`${caseName} test start`);
      const timerId = setTimeout(() => {
        flag = true;
      }, 100);
      console.log(`Timer ID: ${timerId}`);
      setTimeout(() => {
        clearTimeout(timerId);
      }, 150);
      while (flag != true) {
        await sleep(100);
      }

      expect(flag).assertTrue();
      console.info(`${caseName} test end`);
      Done();
    })

    /**
     * @tc.name   clearTimeoutTest0400
     * @tc.number SUB_TIMER_CLEARTIMEOUT_TEST_0400
     * @tc.desc   test ClearTimeout an ID that does not exist
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('clearTimeoutTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'clearTimeoutTest0400';
      console.info(`${caseName} test start`);
      const timerId = setTimeout(() => {
        flag = true;
      }, 10);
      let timerId2: number = 2;
      setTimeout(() => {
        clearTimeout(timerId2);
      }, 1);
      while (flag != true) {
        await sleep(100);
      }

      expect(flag).assertTrue();
      console.info(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.name   clearTimeoutTest0500
     * @tc.number SUB_TIMER_CLEARTIMEOUT_TEST_0500
     * @tc.desc   test ClearTimeout an ID that is null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('clearTimeoutTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'clearTimeoutTest0500';
      console.info(`${caseName} test start`);
      const timerId = setTimeout(() => {
        flag = true;
      }, 10);
      console.log(`Timer ID: ${timerId}`);
      setTimeout(() => {
        clearTimeout(null);
      }, 1);
      while (flag != true) {
        await sleep(100);
      }

      expect(flag).assertTrue();
      console.info(`${caseName} test end`);
      Done();
    })

    /**
     * @tc.name   clearTimeoutTest0600
     * @tc.number SUB_TIMER_CLEARTIMEOUT_TEST_0600
     * @tc.desc   test ClearTimeout enter the ID generated by setInterval
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('clearTimeoutTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'clearTimeoutTest0600';
      console.info(`${caseName} test start`);
      let flag2: boolean = false;
      const timerId = setInterval(() => {
        flag2 = true;
      }, 10);
      setTimeout(() => {
        clearTimeout(timerId);
      }, 1);
      expect(flag2).assertFalse();
      console.info(`${caseName} test end`);
      Done();
    })
  })
}

