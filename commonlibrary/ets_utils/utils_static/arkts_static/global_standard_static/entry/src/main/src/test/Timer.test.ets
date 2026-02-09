/*
 * Copyright (c) 2024 SwanLink (Jiangsu) Technology Development Co., LTD.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import {
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '../../../hypium/index';

let count = 0;
let flag = 'a';

function add() {
  count++;
}

function waitForSeconds(time: int): Promise<void> {
  return new Promise<void>((resolve) => {
    setTimeout(() => {
      resolve(undefined);
    }, time);
  });
}

function myFunction(param1: string, param2: string) {
  console.info(param1, param2);
}


function init(size: number): string {
  let ans = '[';
  while (ans.length < size) {
    ans += '{"a":1},';
  }
  ans += '{"a":1}]';
  return ans
}

export default function TimerTest() {
  describe('TimerTest', (): void => {
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
     * @tc.name   testSetTimer001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_TIMER_0100
     * @tc.desc   Test the timer and execute the accumulation result after 1 second.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetTimer001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      setTimeout(() => {
        add();
      }, 1000);
      await waitForSeconds(2000);
      expect(count).assertEqual(1);
      done.unsafeCall();
    });

    /**
     * @tc.name   testSetTimer002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_TIMER_0200
     * @tc.desc   Test the timer and execute the accumulation result after 1 second.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetTimer002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        count = 0;
        setTimeout(() => {
          expect(count).assertEqual(0);
          add();
          expect(count).assertEqual(1);
        },);
        await waitForSeconds(1000);
        expect(count).assertEqual(1);
        done();
      });

    /**
     * @tc.name   testSetTimer003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_TIMER_0300
     * @tc.desc   Test the cumulative results of executing multiple timers.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetTimer003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        count = 0;
        let result1 = setTimeout(() => {
          add();
        },);
        let result2 = setTimeout(() => {
          add();
          add();
          add();
        },);
        await waitForSeconds(3000);
        expect(new Number(result1) === undefined).assertFalse();
        expect(new Number(result2) === undefined).assertFalse();
        expect(count).assertEqual(4);
        done();
      });

    /**
     * @tc.name   testSetTimer004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_TIMER_0400
     * @tc.desc   Test the string assignment result of the Settimer execution.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetTimer004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        flag = 'a';
        let result1 = setTimeout(() => {
          flag = 'b';
        },);
        await waitForSeconds(1000);
        expect(new Number(result1) === undefined).assertFalse();
        done();
      });

    /**
     * @tc.name   testSetTimer005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_TIMER_0500
     * @tc.desc   Test the results of string assignment executed by multiple timers.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetTimer005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        flag = 'a';
        let result1 = setTimeout(() => {
          flag = 'b';
        },);
        await waitForSeconds(1000);
        expect(flag).assertEqual('b');
        let result2 = setTimeout(() => {
          flag = 'c';
        }, 2500);
        await waitForSeconds(4000);
        expect(flag).assertEqual('c');
        expect(new Number(result1) === undefined).assertFalse();
        expect(new Number(result2) === undefined).assertFalse();
        done();
      });

    /**
     * @tc.name   testClearTimer001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CLEAR_TIMER_0100
     * @tc.desc   Test ClearTimer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testClearTimer001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let result1 = setTimeout(() => {
        },);
        let result2 = setTimeout(() => {
        },);
        await waitForSeconds(1000);
        expect(new Number(result1) === undefined).assertFalse();
        expect(new Number(result2) === undefined).assertFalse();
        clearTimeout(result1);
        clearTimeout(result2);
        done();
      });


    /**
     * @tc.name   testSetInterval001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_INTERVAL_0100
     * @tc.desc   Test the scenario of accumulating SetInterval once.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetInterval001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        count = 0;
        let result1 = setInterval(() => {
          add();
        }, 1500);
        await waitForSeconds(2000);
        clearInterval(result1);
        expect(count).assertEqual(1);
        done();
      });

    /**
     * @tc.name   testSetInterval002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_INTERVAL_0200
     * @tc.desc   Test scenarios where SetInterval accumulates multiple times.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetInterval002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        count = 0;
        let result1 = setInterval(() => {
          add();
        }, 900);
        await waitForSeconds(3000);
        clearInterval(result1);
        expect(count).assertEqual(3);
        done();
      });

    /**
     * @tc.name   testSetInterval003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_INTERVAL_0300
     * @tc.desc   Test scenarios where multiple SetIntervals are accumulated multiple times.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetInterval003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        count = 0;
        let result1 = setInterval(() => {
          add();
        }, 900);
        let result2 = setInterval(() => {
          add();
          add();
          add();
        }, 900);
        await waitForSeconds(3000);
        expect(new Number(result1) === undefined).assertFalse();
        expect(new Number(result2) === undefined).assertFalse();
        clearInterval(result1);
        clearInterval(result2);
        expect(count).assertEqual(12);
        done();
      });

    /**
     * @tc.name   testSetInterval004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_INTERVAL_0400
     * @tc.desc   Scenario for testing SetInterval string assignment.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetInterval004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        flag = 'a';
        let result1 = setInterval(() => {
          flag = 'b';
        }, 700);
        await waitForSeconds(1000);
        clearInterval(result1);
        expect(new Number(result1) === undefined).assertFalse();
        expect(flag).assertEqual('b');
        done();
      });

    /**
     * @tc.name   testSetInterval005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_INTERVAL_0500
     * @tc.desc   Test scenarios for assigning multiple SetInterval strings.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetInterval005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        flag = 'a';
        let result1 = setInterval(() => {
          flag = 'b';
        }, 700);
        await waitForSeconds(1000);
        clearInterval(result1);
        expect(flag).assertEqual('b');
        let result2 = setInterval(() => {
          flag = 'c';
        }, 2500);
        await waitForSeconds(4000);
        expect(new Number(result1) === undefined).assertFalse();
        expect(new Number(result2) === undefined).assertFalse();
        clearInterval(result2);
        expect(flag).assertEqual('c');
        done();
      });


    /**
     * @tc.name   testClearInterval001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CLEAR_INTERVAL_0100
     * @tc.desc   Test ClearInterval.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testClearInterval001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let result1 = setInterval(() => {
        }, 1000);
        let result2 = setInterval(() => {
        }, 1000);
        await waitForSeconds(1000);
        expect(new Number(result1) === undefined).assertFalse();
        expect(new Number(result2) === undefined).assertFalse();
        clearInterval(result1);
        clearInterval(result2);
        done();
      });

    /**
     * @tc.name   testTimer001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TIMER_0100
     * @tc.desc   Test setTimeout.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTimer001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let result1 = setTimeout(myFunction, 1000, 'Hello', 'World');
      let result2 = setTimeout(myFunction);
      let result3 = setTimeout(myFunction, 0, 'Hello');
      clearTimeout(result1);
      clearTimeout(result2);
      clearTimeout(result3);
      done();
    });


    /**
     * @tc.name   testTimer002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TIMER_0200
     * @tc.desc   Test setInterval.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTimer002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let result1 = setInterval(myFunction, 1000, 'Hello', 'World');
      let result2 = setInterval(myFunction, 0);
      let result3 = setInterval(myFunction, 0, 'Hello');
      clearInterval(result1);
      clearInterval(result2);
      clearInterval(result3);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TIMER_0300
     * @tc.name testTimer003
     * @tc.desc Test clearTimeout.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testTimer003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        clearTimeout();
      } catch (e) {
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testTimer004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TIMER_0400
     * @tc.desc   Test ClearInterval.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTimer004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        clearInterval();
      } catch (e) {
        expect().assertFail();
      }
      done();
    });

  })
}