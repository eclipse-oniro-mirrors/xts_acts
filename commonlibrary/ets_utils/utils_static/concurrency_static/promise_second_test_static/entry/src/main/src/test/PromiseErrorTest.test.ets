/*
 * Copyright (C) 2025 HiHope Open Source Organization.
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


import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../hypium/index';
import { sleep, taskFunction1 } from '../testability/pages/TestUtils';


export default function PromiseErrorTest() {
  describe('PromiseErrorTest', (): void => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(():void => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async ():Promise<void> => {
      await sleep(100);
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(():void => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(():void => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.number SUB_PROMISE_ERROR_TEST_0200
     * @tc.name PromiseErrorTest0200
     * @tc.desc async lazy import taskPool three nest
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseErrorTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,  async (Done: () => void):Promise<void> => {
      const asyncFunction = async () => {
        return new Promise<number>((resolve,reject) => {
          setTimeout(() => {
           reject(new Error ('42'));
          }, 1000);
        });
      };
      const testFunction = async () => {
        try {
          await asyncFunction();
        } catch (error) {
          error = error as Error;
          expect(error.message).assertEqual('42');
          console.error('发生错误：', error);
        }
      };
      await testFunction()
      Done();
    })


    /**
     * @tc.number SUB_PROMISE_ERROR_TEST_0300
     * @tc.name PromiseErrorTest0300
     * @tc.desc async lazy import taskPool three nest
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseErrorTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,  async (Done: () => void):Promise<void> => {
      const asyncFunction1 = async () => {
        return new Promise<number>((resolve,reject) => {
          setTimeout(() => {
           reject(new Error ('42'));
          }, 1000);
        });
      };
      const asyncFunction2 = async () => {
        return new Promise<number>((resolve,reject) => {
          setTimeout(() => {
            reject(new Error('43'));
          }, 1000);
        });
      };
      const asyncFunction3 = async () => {
        return new Promise<number>((resolve,reject) => {
          setTimeout(() => {
            resolve(44);
          }, 1000);
        });
      };

      try {
        await asyncFunction1();
        await asyncFunction2();
        await asyncFunction3();
      } catch (error) {
        error = error as Error;
        expect(error.message).assertEqual('42');
        console.error('发生错误：', error);
      }
      Done();
    })

  })
}
