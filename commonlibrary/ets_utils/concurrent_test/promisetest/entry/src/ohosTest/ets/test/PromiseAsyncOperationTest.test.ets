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
import { ArkTSUtils, MessageEvents, taskpool, worker } from '@kit.ArkTS';
import { sleep, taskFunction } from '../testability/pages/TestUtils';



export default function PromiseAsyncOperationTest() {
  describe('PromiseAsyncOperationTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    });
    beforeEach(async () => {
      await sleep(100);
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    });
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    });
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    });

    /**
     * @tc.name   PromiseAsyncOperationTest0100
     * @tc.number SUB_PROMISE_ASYNC_OPERATION_TEST_0100
     * @tc.desc   async lazy import taskPool three nest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAsyncOperationTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = "AsyncOperationTest0100";
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
     * @tc.name   PromiseAsyncOperationTest0200
     * @tc.number SUB_PROMISE_ASYNC_OPERATION_TEST_0200
     * @tc.desc   async lazy import taskPool three nest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAsyncOperationTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const asyncFunction = async () => {
        return new Promise<number>((resolve) => {
          setTimeout(() => {
            resolve(42);
          }, 1000);
        });
      };
      asyncFunction().then((result) => {
          expect(result).assertEqual(42);
          Done()
      });
    })

    /**
     * @tc.name   PromiseAsyncOperationTest0300
     * @tc.number SUB_PROMISE_ASYNC_OPERATION_TEST_0300
     * @tc.desc   async lazy import taskPool three nest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAsyncOperationTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let task =  new  taskpool.Task(taskFunction);
      let result = await taskpool.execute(task);
      expect(42).assertEqual(result)
      Done()
    })

    /**
     * @tc.name   PromiseAsyncOperationTest0400
     * @tc.number SUB_PROMISE_ASYNC_OPERATION_TEST_0400
     * @tc.desc   async lazy import taskPool three nest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAsyncOperationTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let task =  new  taskpool.Task(taskFunction);
      taskpool.execute(task).then((result) => {
        expect(42).assertEqual(result)
      })
      Done();
    })


    /**
     * @tc.name   PromiseAsyncOperationTest0500
     * @tc.number SUB_PROMISE_ASYNC_OPERATION_TEST_0500
     * @tc.desc   async lazy import taskPool three nest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAsyncOperationTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const asyncLock: ArkTSUtils.locks.AsyncLock = ArkTSUtils.locks.AsyncLock.request('Lock');
      const result: number = await asyncLock.lockAsync(taskFunction);
      expect(42).assertEqual(result)
      Done();
    })

    /**
     * @tc.name   PromiseAsyncOperationTest0600
     * @tc.number SUB_PROMISE_ASYNC_OPERATION_TEST_0600
     * @tc.desc   async lazy import taskPool three nest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAsyncOperationTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const asyncLock: ArkTSUtils.locks.AsyncLock = ArkTSUtils.locks.AsyncLock.request('Lock');
      await asyncLock.lockAsync(taskFunction).then((result:number) => {
        expect(42).assertEqual(result)
        Done();
      })
    })

  })
}
