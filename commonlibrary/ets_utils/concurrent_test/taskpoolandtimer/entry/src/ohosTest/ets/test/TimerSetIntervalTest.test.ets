import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from "@ohos/hypium";
import { sleep } from "../testability/pages/Utils";


export default function TimerSetIntervalTest() {
  describe('TimerSetIntervalTest', () => {
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
     * @tc.name   TimerSetIntervalTest0100
     * @tc.number SUB_TIMER_SETINTERVAL_TEST_0100
     * @tc.desc   test SetInterval
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TimerSetIntervalTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done: Function) => {
      const a: undefined = undefined;
      const TimeID = setInterval('Handler executed', -1);
      await sleep(100);
      expect(typeof TimeID).assertEqual(typeof a);
      clearInterval(TimeID);
      Done();
    });


    /**
     * @tc.name   TimerSetIntervalTest0200
     * @tc.number SUB_TIMER_SETINTERVAL_TEST_0200
     * @tc.desc   test SetInterval
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TimerSetIntervalTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let flag = false;
      let TimeID = setInterval(() => {
        flag = true;
        console.log('Handler executed');
      }, 0);
      while (!flag) {
        await sleep(100);
      }
      expect(flag).assertTrue();
      clearInterval(TimeID);
      Done();
    });


    /**
     * @tc.name   TimerSetIntervalTest0300
     * @tc.number SUB_TIMER_SETINTERVAL_TEST_0300
     * @tc.desc   test SetInterval
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TimerSetIntervalTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const args: string = 'Hello, World!';
      let flag = false
      let msg2: string = '';
      let time1 = Date.now()
      let time2 = Date.now()
      let TimeID = setInterval((msg: string) => {
        msg2 = msg;
        time2 = Date.now()
        flag = true
      }, 100, args);

      while (!flag) {
        await sleep(100);
      }
      expect(time2 - time1 >= 100).assertTrue()
      expect(msg2).assertEqual('Hello, World!');
      clearInterval(TimeID);
      Done();
    });


    /**
     * @tc.name   TimerSetIntervalTest0400
     * @tc.number SUB_TIMER_SETINTERVAL_TEST_0400
     * @tc.desc   test SetInterval
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TimerSetIntervalTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const TimeID = setInterval(null, 200.1);
      const a: undefined = undefined;
      await sleep(100);
      expect(typeof TimeID).assertEqual(typeof a);
      clearInterval(TimeID);
      Done();
    });


    /**
     * @tc.name   TimerSetIntervalTest0500
     * @tc.number SUB_TIMER_SETINTERVAL_TEST_0500
     * @tc.desc   test SetInterval
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TimerSetIntervalTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const TimeID = setInterval('', null);
      const a: undefined = undefined;
      expect(typeof TimeID).assertEqual(typeof a)
      clearInterval(TimeID);
      Done();
    });


    /**
     * @tc.name   TimerSetIntervalTest0600
     * @tc.number SUB_TIMER_SETINTERVAL_TEST_0600
     * @tc.desc   test SetInterval
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TimerSetIntervalTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let longRunningFunction: () => boolean = (): boolean => {
        const startTime = Date.now();
        while (Date.now() - startTime < 3000) {
        }
        return true;
      };
      let lastResult: boolean = false;
      let TimeID: number = setInterval(() => {
        const result = longRunningFunction();
        lastResult = result;
      }, 2000);
      while (!lastResult) {
        await sleep(100);
      }
      expect(lastResult).assertTrue()
      clearInterval(TimeID);
      Done();
    });


    /**
     * @tc.name   TimerSetIntervalTest0700
     * @tc.number SUB_TIMER_SETINTERVAL_TEST_0700
     * @tc.desc   test SetInterval
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TimerSetIntervalTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let longRunningFunction: () => boolean = (): boolean => {
        const startTime = Date.now();
        while (Date.now() - startTime < 3000) {
        }
        return true;
      };
      let lastResult: boolean = false;
      let TimeID: number = setInterval(() => {
        const result = longRunningFunction();
        lastResult = result;
      }, 3000);
      while (!lastResult) {
        await sleep(100);
      }
      expect(lastResult).assertTrue()
      clearInterval(TimeID);
      Done();
    });


    /**
     * @tc.name   TimerSetIntervalTest0800
     * @tc.number SUB_TIMER_SETINTERVAL_TEST_0800
     * @tc.desc   test SetInterval
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TimerSetIntervalTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let longRunningFunction: () => boolean = (): boolean => {
        const startTime = Date.now();
        while (Date.now() - startTime < 2000) {
        }
        return true;
      };
      let lastResult: boolean = false;
      let TimeID: number = setInterval(() => {
        const result = longRunningFunction();
        lastResult = result;
      }, 3000);
      while (!lastResult) {
        await sleep(100);
      }
      expect(lastResult).assertTrue()
      clearInterval(TimeID);
      Done();
    });

  })
}