import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../hypium/index';
import { sleep } from '../testability/pages/Utils';


export default function TimerSetIntervalTest() {
  describe('TimerSetIntervalTest', (): void => {
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
     * @tc.number SUB_TIMER_SETINTERVAL_TEST_0200
     * @tc.name TimerSetIntervalTest0200
     * @tc.desc test SetInterval
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TimerSetIntervalTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
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
     * @tc.number SUB_TIMER_SETINTERVAL_TEST_0300
     * @tc.name TimerSetIntervalTest0300
     * @tc.desc test SetInterval
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TimerSetIntervalTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const args: string = 'Hello, World!';
      let flag = false
      let msg2: string = '';
      let time1 = Date.now()
      let time2 = Date.now()
      let TimeID = setInterval((msg: string) => {
        msg2 = msg;
        flag = true
        time2 = Date.now()
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
     * @tc.number SUB_TIMER_SETINTERVAL_TEST_0600
     * @tc.name TimerSetIntervalTest0600
     * @tc.desc test SetInterval
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TimerSetIntervalTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
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
      clearInterval(TimeID as int);
      Done();
    });


    /**
     * @tc.number SUB_TIMER_SETINTERVAL_TEST_0700
     * @tc.name TimerSetIntervalTest0700
     * @tc.desc test SetInterval
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TimerSetIntervalTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
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
      clearInterval(TimeID as int);
      Done();
    });


    /**
     * @tc.number SUB_TIMER_SETINTERVAL_TEST_0800
     * @tc.name TimerSetIntervalTest0800
     * @tc.desc test SetInterval
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TimerSetIntervalTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
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
      clearInterval(TimeID as int);
      Done();
    });

  })
}