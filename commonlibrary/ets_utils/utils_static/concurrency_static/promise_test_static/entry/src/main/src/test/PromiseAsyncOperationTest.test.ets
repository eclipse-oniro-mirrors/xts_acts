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
import { sleep, taskFunction } from '../testability/pages/TestUtils';



export default function PromiseAsyncOperationTest() {
  describe('PromiseAsyncOperationTest', (): void => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(():void => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    });
    beforeEach(async ():Promise<void> => {
      await sleep(100);
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    });
    afterEach(():void => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    });
    afterAll(():void => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    });

    /**
     * @tc.number SUB_PROMISE_ASYNC_OPERATION_TEST_0100
     * @tc.name PromiseAsyncOperationTest0100
     * @tc.desc async lazy import taskPool three nest
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseAsyncOperationTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void):Promise<void> => {
      const caseName = 'AsyncOperationTest0100';
      console.info(`${caseName}, test start`);
      const asyncFunction = async () => {
        return new Promise<number>((resolve,reject) => {
          setTimeout(() => {
            resolve(42);
          }, 1000);
        });
      };
      const result = await asyncFunction();
      expect(result).assertEqual(42);
      Done();
    })

    /**
     * @tc.number SUB_PROMISE_ASYNC_OPERATION_TEST_0200
     * @tc.name PromiseAsyncOperationTest0200
     * @tc.desc async lazy import taskPool three nest
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseAsyncOperationTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void):Promise<void> => {
      const asyncFunction = async () => {
        return new Promise<number>((resolve) => {
          setTimeout(() => {
            resolve(42);
          }, 1000);
        });
      };
      asyncFunction().then((result:number):void => {
          expect(result).assertEqual(42);
      });
      Done()
    })

    /**
     * @tc.number SUB_PROMISE_ASYNC_OPERATION_TEST_0500
     * @tc.name PromiseAsyncOperationTest0500
     * @tc.desc async lazy import taskPool three nest
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseAsyncOperationTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void):Promise<void> => {
      const asyncLock: AsyncLock = AsyncLock.request('Lock');
      const result: number = await asyncLock.lockAsync(taskFunction);
      expect(42).assertEqual(result)
      Done();
    })

    /**
     * @tc.number SUB_PROMISE_ASYNC_OPERATION_TEST_0600
     * @tc.name PromiseAsyncOperationTest0600
     * @tc.desc async lazy import taskPool three nest
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseAsyncOperationTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void):Promise<void> => {
      const asyncLock: AsyncLock = AsyncLock.request('Lock');
      await asyncLock.lockAsync(taskFunction).then((value: Any):void => {
        const result = value as number;
        expect(42).assertEqual(result)
        Done();
      })
    })

  })
}
