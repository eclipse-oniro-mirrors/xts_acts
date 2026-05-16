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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../hypium/index';
import { sleep } from '../testability/pages/Utils';
interface A {
  action: string,
  time: number
}
interface B {
  action: string,
  timestamp: number
}

export default function TimerMemoryTest(): void {
  describe('TimerMemoryTest', (): void => {
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
     * @tc.number SUB_TIMER_MEMORY_TEST_0300
     * @tc.name TimerMemoryTest0300
     * @tc.desc test Memory
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TimerMemoryTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      let totalCount = 0;
      const LOOP_TIMES = 100;
      const SHORT_DELAY_FACTOR = 0.1;
      const INTERVAL_EXECUTION_TIMES = 10;
      for (let i = 0; i < LOOP_TIMES; i++) {
        await new Promise<void>((resolve) => {
          let counter = 0;
          let intervalId: number;
          intervalId = setInterval(() => {
            totalCount++;
            counter++;
            if (counter === INTERVAL_EXECUTION_TIMES) {
              clearInterval(intervalId as int);
              let temp: number | null = null;
              temp = intervalId;
              temp = null;
              resolve(undefined);
            }
          }, 10 * SHORT_DELAY_FACTOR as int);
        });
      }
      console.info(`totalCount: ${totalCount}`);
      const expectedCount = LOOP_TIMES * INTERVAL_EXECUTION_TIMES;
      console.log('expectedCount' + expectedCount)
      expect(expectedCount).assertEqual(totalCount)
      Done();
    });

    /**
     * @tc.number SUB_TIMER_MEMORY_TEST_0400
     * @tc.name TimerMemoryTest0400
     * @tc.desc test Memory
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TimerMemoryTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      let executionCount = 0;
      const MAX_DELAY = 10;
      const ROUNDS = 10;
      const SHORT_DELAY_FACTOR = 0.1;
      const allPromises: Promise<void>[] = [];
      for (let round = 1; round <= ROUNDS; round++) {
        console.log(`Round ${round} start:`);
        const roundPromises: Promise<void>[] = [];
        for (let delay = 0; delay <= MAX_DELAY; delay++) {
          const promise = new Promise<void>((resolve) => {
            setTimeout(() => {
              console.log(`Round ${round}, Delay: ${delay} seconds, Timestamp: ${Date.now()}`);
              executionCount++;
              resolve(undefined);
            }, delay * 1000 * SHORT_DELAY_FACTOR as int);
          });
          roundPromises.push(promise);
        }
        allPromises.push(Promise.all(roundPromises).then(() => {
          console.log(`Round ${round} end. Execution count: ${executionCount}`);
        }));
      }
      await Promise.all(allPromises);
      expect(executionCount).assertEqual(11 * ROUNDS);
      Done();
    });


    /**
     * @tc.number SUB_TIMER_MEMORY_TEST_0500
     * @tc.name TimerMemoryTest0500
     * @tc.desc test Memory
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TimerMemoryTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const executionLog: A[] = [];
      const logExecution = (action: string) => {
        const currentTime = Date.now();
        executionLog.push({
          action, time: currentTime
        });
        console.log(`${action} at ${currentTime}`);
      }
      let shouldContinue = true;
      setTimeout(() => {
        logExecution('Outer setTimeout executed');
        setTimeout(() => {
          logExecution('Inner setTimeout executed');
          let intervalId: number;
          intervalId = setInterval(() => {
            if (shouldContinue) {
              logExecution('Nested setInterval executed');
            } else {
              clearInterval(intervalId as int);
              logExecution('Nested setInterval stopped due to condition');
            }
          }, 1000);
          setTimeout(() => {
            shouldContinue = false;
          }, 3000);
        }, 2000);
      }, 1000);
      let outerIntervalId : number;
      outerIntervalId = setInterval(() => {
        if (shouldContinue) {
          logExecution('Outer setInterval executed');
        } else {
          clearInterval(outerIntervalId as int);
          logExecution('Outer setInterval stopped due to condition');
        }
      }, 1500);
      setTimeout(() => {
        shouldContinue = false;
      }, 6000);
      setTimeout(() => {
        console.log('Execution Log:');
        executionLog.forEach((entry, index) => {
          console.log(`${index + 1}. ${entry.action} at ${entry.time}`);
        });
      }, 7000);
      expect(shouldContinue).assertTrue()
      Done();
    });


    /**
     * @tc.number SUB_TIMER_MEMORY_TEST_0600
     * @tc.name TimerMemoryTest0600
     * @tc.desc test Memory
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TimerMemoryTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const log: B[] = [];
      const recordAction = (action: string) => {
        const timestamp = Date.now();
        log.push({
          action, timestamp
        });
        console.log(`${action} at ${timestamp}`);
      }
      let outerSetTimeoutExecuted = false;
      let innerSetTimeoutExecuted = false;
      let nestedSetIntervalExecuted = false;
      let outerSetIntervalExecuted = false;
      let outerSetTimeoutCleared = false;
      let innerSetTimeoutCleared = false;
      let nestedSetIntervalCleared = false;
      let outerSetIntervalCleared = false;
      const timerIds: number[] = [];
      const outerSetTimeoutId = setTimeout(() => {
        outerSetTimeoutExecuted = true;
        recordAction('Outer setTimeout executed');
        const innerSetTimeoutId = setTimeout(() => {
          innerSetTimeoutExecuted = true;
          recordAction('Inner setTimeout executed');
          const nestedSetIntervalId = setInterval(() => {
            nestedSetIntervalExecuted = true;
            recordAction('Nested setInterval executed');
          }, 1000);
          timerIds.push(nestedSetIntervalId);
          const clearNestedIntervalTimeoutId = setTimeout(() => {
            if (!nestedSetIntervalCleared) {
              clearInterval(nestedSetIntervalId);
              nestedSetIntervalCleared = true;
              recordAction('Nested setInterval cleared');
            }
          }, 3000);
          timerIds.push(clearNestedIntervalTimeoutId);
        }, 2500);
        timerIds.push(innerSetTimeoutId);
        const clearInnerTimeoutId = setTimeout(() => {
          if (!innerSetTimeoutCleared) {
            clearTimeout(innerSetTimeoutId);
            innerSetTimeoutCleared = true;
            recordAction('Inner setTimeout cleared');
          }
        }, 3500);
        timerIds.push(clearInnerTimeoutId);
      }, 1000);
      timerIds.push(outerSetTimeoutId);
      const outerSetIntervalId = setInterval(() => {
        outerSetIntervalExecuted = true;
        recordAction('Outer setInterval executed');
      }, 1500);
      timerIds.push(outerSetIntervalId);
      const clearOuterIntervalTimeoutId = setTimeout(() => {
        if (!outerSetIntervalCleared) {
          clearInterval(outerSetIntervalId);
          outerSetIntervalCleared = true;
          recordAction('Outer setInterval cleared');
        }
      }, 6000);
      timerIds.push(clearOuterIntervalTimeoutId);
      const clearOuterTimeoutId = setTimeout(() => {
        if (!outerSetTimeoutCleared) {
          clearTimeout(outerSetTimeoutId);
          outerSetTimeoutCleared = true;
          recordAction('Outer setTimeout cleared');
        }
      }, 4000);
      timerIds.push(clearOuterTimeoutId);
      const finalLogTimeoutId = setTimeout(() => {
        console.log('Final Execution Log:');
        log.forEach((entry, index) => {
          console.log(`${index + 1}. ${entry.action} at ${entry.timestamp}`);
        });
        console.log('Timer Execution and Clear Status:');
        console.log(`Outer setTimeout executed: ${outerSetTimeoutExecuted}, cleared: ${outerSetTimeoutCleared}`);
        console.log(`Inner setTimeout executed: ${innerSetTimeoutExecuted}, cleared: ${innerSetTimeoutCleared}`);
        console.log(`Nested setInterval executed: ${nestedSetIntervalExecuted}, cleared: ${nestedSetIntervalCleared}`);
        console.log(`Outer setInterval executed: ${outerSetIntervalExecuted}, cleared: ${outerSetIntervalCleared}`);
        recordAction('All timers cleared');
      }, 7000);
      timerIds.push(finalLogTimeoutId);
      expect(outerSetTimeoutExecuted).assertFalse()
      expect(outerSetTimeoutCleared).assertFalse()
      expect(innerSetTimeoutExecuted).assertFalse()
      expect(innerSetTimeoutCleared).assertFalse()
      timerIds.forEach((id) => {
        clearTimeout(id as int);
        clearInterval(id as int);
      });
      Done();
    });

  })
}