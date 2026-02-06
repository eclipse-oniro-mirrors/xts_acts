/*
 * Copyright (C) 2025 HiHope Open Source Organization.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { sleep } from '../testability/pages/TestUtils';

export default function PromiseRaceStressTest() {
  describe('PromiseRaceStressTest', () => {
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
      console.info('PromiseRaceStressTest beforeAll called');
    })

    beforeEach(async () => {
      await sleep(200);
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
      // Add delay to ensure resources from the previous test case are released
      console.info('PromiseRaceStressTest beforeEach called');
    })

    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
      console.info('PromiseRaceStressTest afterEach called');
    })

    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
      console.info('PromiseRaceStressTest afterAll called');
    })

    /**
     * @tc.number SUB_PROMISE_RACE_STRESS_TEST_4600
     * @tc.name PromiseRaceStressTest4600
     * @tc.desc Test Promise.race with 1000 promises where the first one resolves immediately and the rest reject with delay
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseRaceStressTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'PromiseRaceStressTest4600';
      console.info(`${caseName} test start`);
      
      try {
        const totalPromises = 1000;
        const expectedValue = 'immediate success';
        let raceResolved = false;
        let resolvedValue: string = '';
        
        console.info(`${caseName} Creating ${totalPromises} promises...`);
        
        const promises: Promise<string>[] = [];
        
        promises.push(Promise.resolve(expectedValue));
        
        for (let i = 1; i < totalPromises; i++) {
          const delay = Math.floor(Math.random() * 100) + 10;
          promises.push(new Promise<string>((_, reject) => {
            setTimeout(() => {
              reject(new Error(`Promise ${i} rejected after ${delay}ms`));
            }, delay);
          }));
        }
        
        console.info(`${caseName} Promises created, calling Promise.race...`);
        const startTime = Date.now();
        
        Promise.race(promises)
          .then((value: string) => {
            const endTime = Date.now();
            const elapsedTime = endTime - startTime;
            console.info(`${caseName} Promise.race resolved in ${elapsedTime}ms with value: ${value}`);
            raceResolved = true;
            resolvedValue = value;
          })
          .catch((error: Error) => {
            console.error(`${caseName} Promise.race unexpectedly rejected: ${error.message}`);
            expect(false).assertTrue();
          });
        
        await sleep(50);
        
        console.info(`${caseName} Checking results...`);
        expect(raceResolved).assertTrue();
        expect(resolvedValue).assertEqual(expectedValue);
        
        await sleep(100);
        
      } catch (error) {
        let errorMessage = '';
        if (error instanceof Error) {
          errorMessage = `${caseName} Test failed with error: ${error.message}`;
        } else {
          errorMessage = `${caseName} Test failed with non-Error: ${JSON.stringify(error)}`;
        }
        console.error(errorMessage);
        expect(false).assertTrue();
      } finally {
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number SUB_PROMISE_RACE_STRESS_TEST_4700
     * @tc.name PromiseRaceStressTest4700
     * @tc.desc Test Promise.race with 1000 promises where all promises resolve with different delays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseRaceStressTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'PromiseRaceStressTest4700';
      console.info(`${caseName} test start`);
      
      try {
        const totalPromises = 1000;
        const expectedValue = 'Fastest promise resolved';
        
        console.info(`${caseName} Creating ${totalPromises} promises that all resolve`);
        
        const promises: Promise<string>[] = [];
        
        const fastestPromise = Promise.resolve(expectedValue);
        promises.push(fastestPromise);
        
        for (let i = 1; i < totalPromises; i++) {
          const delay = Math.floor(Math.random() * 100) + 10;
          promises.push(new Promise<string>(resolve => {
            setTimeout(() => {
              resolve(`Promise ${i} resolved after ${delay}ms`);
            }, delay);
          }));
        }
        
        console.info(`${caseName} Promises created, calling Promise.race...`);
        const startTime = Date.now();
        
        const result = await Promise.race(promises);
        const endTime = Date.now();
        const elapsedTime = endTime - startTime;
        
        console.info(`${caseName} Promise.race resolved in ${elapsedTime}ms with value: ${result}`);
        
        console.info(`${caseName} Checking results...`);
        expect(result).assertEqual(expectedValue);
        
      } catch (error) {
        let errorMessage = '';
        if (error instanceof Error) {
          errorMessage = `${caseName} Test failed with error: ${error.message}`;
        } else {
          errorMessage = `${caseName} Test failed with non-Error: ${JSON.stringify(error)}`;
        }
        console.error(errorMessage);
        expect(false).assertTrue();
      } finally {
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number SUB_PROMISE_RACE_STRESS_TEST_4800
     * @tc.name PromiseRaceStressTest4800
     * @tc.desc Test Promise.race with 1000 promises where all promises reject with different delays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseRaceStressTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'PromiseRaceStressTest4800';
      console.info(`${caseName} test start`);
      
      try {
        const totalPromises = 1000;
        const expectedErrorMessage = 'Fastest promise rejected';
        
        console.info(`${caseName} Creating ${totalPromises} promises that all reject`);
        
        const promises: Promise<string>[] = [];
        
        const fastestPromise = Promise.reject(new Error(expectedErrorMessage));
        promises.push(fastestPromise);
        
        for (let i = 1; i < totalPromises; i++) {
          const delay = Math.floor(Math.random() * 100) + 10;
          promises.push(new Promise<string>((_, reject) => {
            setTimeout(() => {
              reject(new Error(`Promise ${i} rejected after ${delay}ms`));
            }, delay);
          }));
        }
        
        console.info(`${caseName} Promises created, calling Promise.race...`);
        const startTime = Date.now();
        
        let rejectionReason = '';
        try {
          await Promise.race(promises);
          console.error(`${caseName} Promise.race unexpectedly resolved`);
          expect(false).assertTrue();
        } catch (error) {
          const endTime = Date.now();
          const elapsedTime = endTime - startTime;
          
          if (error instanceof Error) {
            rejectionReason = error.message;
            console.info(`${caseName} Promise.race rejected in ${elapsedTime}ms with reason: ${rejectionReason}`);
          } else {
            console.info(`${caseName} Promise.race rejected with non-Error`);
            rejectionReason = 'non-Error rejection';
          }
        }
        
        console.info(`${caseName} Checking results...`);
        expect(rejectionReason).assertEqual(expectedErrorMessage);
        
      } catch (error) {
        let errorMessage = '';
        if (error instanceof Error) {
          errorMessage = `${caseName} Test failed with error: ${error.message}`;
        } else {
          errorMessage = `${caseName} Test failed with non-Error: ${JSON.stringify(error)}`;
        }
        console.error(errorMessage);
        expect(false).assertTrue();
      } finally {
        console.info(`${caseName} test end`);
        done();
      }
    });
  });
}
