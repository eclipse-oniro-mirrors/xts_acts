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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Size, Level, TestType } from "@ohos/hypium";
import { sleep } from "../testability/pages/TestUtils";


export default function PromiseResolveSecondTest() {
  describe('PromiseResolveSecondTest', () => {
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
     * @tc.number SUB_PROMISE_RESOLVE_TEST_2900
     * @tc.name PromiseResolveTest2900
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseResolveTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseResolveTest2900';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        let taskPromises: Promise<number>[] = [];
        const asyncOperation = (value: number, delay: number) => {
          return new Promise<number>((resolve) => {
            setTimeout(() => {
              arr.push(value);
              resolve(value * 2);
            }, delay);
          });
        };
        const outerPromises = [
          asyncOperation(1, 600),
          asyncOperation(2, 900),
          asyncOperation(3, 300)
        ];
        taskPromises.push(asyncOperation(1, 600));
        taskPromises.push(asyncOperation(2, 900));
        taskPromises.push(asyncOperation(3, 300));
        Promise.resolve()
          .then(() => {
            return Promise.race(outerPromises);
          })
          .then((outerResult) => {
            arr.push(4);
            successMessage = `Outer Promise.race result: ${outerResult}`;
            console.log(successMessage);
            const innerPromises = [
              asyncOperation(outerResult / 2 * 4, 450),
              asyncOperation(outerResult / 2 * 5, 600),
              asyncOperation(outerResult / 2 * 6, 540)
            ];
            return Promise.race(innerPromises);
          })
          .then((innerResult) => {
            arr.push(5);
            successMessage = `Inner Promise.race result: ${innerResult}`;
            console.log(successMessage);
          })
          .catch((error: Error) => {
            arr.push(6);
            errorMessage = `Error: ${error.message}`;
            console.error(errorMessage);
          });
        arr.push(7);
        await Promise.all(taskPromises);
        await sleep(200);
        expect(JSON.stringify(arr)).assertEqual('[7,3,4,3,1,1,12,5,18,2,2,15]');
        expect(successMessage).assertEqual('Inner Promise.race result: 24');
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.number SUB_PROMISE_RESOLVE_TEST_3000
     * @tc.name PromiseResolveTest3000
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseResolveTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseResolveTest3000';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        let taskPromises: Promise<number>[] = [];
        const asyncOperation = (value: number, delay: number) => {
          return new Promise<number>((resolve) => {
            setTimeout(() => {
              arr.push(value);
              resolve(value * 2);
            }, delay);
          });
        };
        Promise.resolve()
          .then(() => {
            taskPromises.push(asyncOperation(1, 200));
            return Promise.resolve(asyncOperation(1, 200));
          })
          .then((firstResult) => {
            arr.push(4);
            successMessage = `First Promise.resolve result: ${firstResult}`;
            console.log("successMessage:" + successMessage);
            taskPromises.push(asyncOperation(firstResult / 2 * 3, 150));
            return Promise.resolve(asyncOperation(firstResult / 2 * 3, 150));
          })
          .then((secondResult) => {
            arr.push(5);
            successMessage = `Second Promise.resolve result: ${secondResult}`;
            console.log("successMessage:" + successMessage);
            taskPromises.push(asyncOperation(secondResult / 2 * 4, 180));
            return Promise.resolve(asyncOperation(secondResult / 2 * 4, 180));
          })
          .then((thirdResult) => {
            arr.push(6);
            successMessage = `Third Promise.resolve result: ${thirdResult}`;
            console.log("successMessage:" + successMessage);
          })
          .catch((error: Error) => {
            arr.push(7);
            errorMessage = `Error: ${error.message}`;
            console.error("errorMessage:" + errorMessage);
          });
        arr.push(8);
        await Promise.all(taskPromises);
        await sleep(200);
        expect(JSON.stringify(arr)).assertEqual('[8,1,1,4]');
        expect(successMessage).assertEqual('First Promise.resolve result: 2');
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.number SUB_PROMISE_RESOLVE_TEST_3100
     * @tc.name PromiseResolveTest3100
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseResolveTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseResolveTest3100';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        let taskPromises: Promise<number>[] = [];
        const asyncOperation = (value: number, delay: number) => {
          return new Promise<number>((resolve) => {
            setTimeout(() => {
              arr.push(value);
              resolve(value * 2);
            }, delay);
          });
        };
        Promise.resolve()
          .then((): Promise<number> => {
            taskPromises.push(asyncOperation(1, 200));
            return asyncOperation(1, 200);
          })
          .then((firstResult) => {
            arr.push(4);
            successMessage = `First operation result: ${firstResult}`;
            console.log(successMessage);
            return Promise.reject(new Error(`Rejected after first operation with value ${firstResult}`));
          })
          .catch((firstError: Error): Promise<number> => {
            arr.push(5);
            errorMessage = `First rejection: ${firstError.message}`;
            console.error(errorMessage);
            taskPromises.push(asyncOperation(3, 150));
            return asyncOperation(3, 150);
          })
          .then((secondResult) => {
            arr.push(6);
            successMessage = `Second operation result: ${secondResult}`;
            console.log(successMessage);
            return Promise.reject(new Error(`Rejected after second operation with value ${secondResult}`));
          })
          .catch((secondError: Error) => {
            arr.push(7);
            errorMessage = `Second rejection: ${secondError.message}`;
            console.error(errorMessage);
          });
        arr.push(8);
        await Promise.all(taskPromises);
        await sleep(200);
        expect(JSON.stringify(arr)).assertEqual('[8,1,1,4,5]');
        expect(successMessage).assertEqual('First operation result: 2');
        console.info(`${caseName} test end`);
        Done();
      });

  })
}