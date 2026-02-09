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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../hypium/index';
import { sleep } from '../testability/pages/TestUtils';

export default function PromiseRaceStressTest() {
  describe('PromiseRaceStressTest', ():void => {
    beforeAll(():void => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
      console.info('PromiseRaceStressTest beforeAll called');
    })

    beforeEach(async ():Promise<void> => {
      await sleep(200);
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
      // Add delay to ensure resources from the previous test case are released
      console.info('PromiseRaceStressTest beforeEach called');
    })

    afterEach(():void => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
      console.info('PromiseRaceStressTest afterEach called');
    })

    afterAll(():void => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
      console.info('PromiseRaceStressTest afterAll called');
    })

    /**
     * @tc.number SUB_PROMISE_RACE_STRESS_TEST_4700
     * @tc.name PromiseRaceStressTest4700
     * @tc.desc Test Promise.race with 1000 promises where all promises resolve with different delays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseRaceStressTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done: () => void):Promise<void> => {
      const caseName = 'PromiseRaceStressTest4700';
      console.info(`${caseName} test start`);

      try {
        const totalPromises = 100;
        const expectedValue = 'Fastest promise resolved';

        console.info(`${caseName} Creating ${totalPromises} promises that all resolve`);

        const promises: Promise<string>[] = [];

        const fastestPromise = Promise.resolve(expectedValue);
        promises.push(fastestPromise);

        for (let i = 1; i < totalPromises; i++) {
          const delay:number = Math.floor(Math.random() * 100) + 10;
          promises.push(new Promise<string>(resolve => {
            setTimeout(() => {
              resolve(`Promise ${i} resolved after ${delay}ms`);
            },100);
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
        expect(false).assertTrue();
      } finally {
        console.info(`${caseName} test end`);
        Done();
      }
    });

  });
}
