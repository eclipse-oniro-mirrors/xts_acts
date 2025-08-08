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

export default function setTimeoutTest() {
  describe('SetTimeoutTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      flag = false
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
     * @tc.number SUB_TIMER_SETTIMEOUT_TEST_0100
     * @tc.name setTimeoutTest0100
     * @tc.desc test Handler passes string, delay:-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('setTimeoutTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async (Done: Function) => {
      const caseName = 'setTimeoutTest0100';
      console.info(`${caseName} test start`);
      const a: undefined = undefined;
      const b = setTimeout('Handler executed', -1);
      await sleep(100);
      expect(typeof b).assertEqual(typeof a);
      console.info(`${caseName} test end`);
      Done();
    })

    /**
     * @tc.number SUB_TIMER_SETTIMEOUT_TEST_0200
     * @tc.name setTimeoutTest0200
     * @tc.desc test Handler passes func, delay:0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('setTimeoutTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'setTimeoutTest0200';
      console.info(`${caseName} test start`);
      setTimeout(() => {
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
     * @tc.number SUB_TIMER_SETTIMEOUT_TEST_0300
     * @tc.name setTimeoutTest0300
     * @tc.desc test Handler passes func，delay：100，args：string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('setTimeoutTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'setTimeoutTest0300';
      console.info(`${caseName} test start`);
      const args: string = 'Hello, World!';
      let msg2: string = '';
      let time1 = Date.now()
      let time2 = Date.now()
      setTimeout((msg: string) => {
        msg2 = msg;
        time2 = Date.now()
        flag = true
      }, 100, args);
      while (flag != true) {
        await sleep(100);
      }

      expect(msg2).assertEqual('Hello, World!');
      expect(time2 - time1 >= 100).assertTrue()
      console.info(`${caseName} test end`);
      Done();
    })

    /**
     * @tc.number SUB_TIMER_SETTIMEOUT_TEST_0400
     * @tc.name setTimeoutTest0400
     * @tc.desc test Handler passes null，delay：200.1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('setTimeoutTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'setTimeoutTest0400';
      console.info(`${caseName} test start`);
      const timerIdWithNull = setTimeout(null, 200.1);
      const a: undefined = undefined;
      await sleep(100);
      expect(typeof timerIdWithNull).assertEqual(typeof a);
      console.info(`${caseName} test end`);
      Done();
    })

    /**
     * @tc.number SUB_TIMER_SETTIMEOUT_TEST_0500
     * @tc.name setTimeoutTest0500
     * @tc.desc test Handler passes func，delay：2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('setTimeoutTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'setTimeoutTest0500';
      console.info(`${caseName} test start`);
      setTimeout(() => {
        flag = true;
      }, 2147483648);
      while (flag != true) {
        await sleep(100);
      }
      expect(flag).assertTrue();
      console.info(`${caseName} test end`);
      Done();
    })

    /**
     * @tc.number SUB_TIMER_SETTIMEOUT_TEST_0600
     * @tc.name setTimeoutTest0600
     * @tc.desc test Handler passes string，delay：null/undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('setTimeoutTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'setTimeoutTest0600';
      console.info(`${caseName} test start`);
      const timerIdWithNull = setTimeout('', null);
      const a: undefined = undefined;
      expect(typeof timerIdWithNull).assertEqual(typeof a);
      console.info(`${caseName} test end`);
      Done();
    })
  })
}