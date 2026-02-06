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
import { ArkTSUtils, taskpool } from '@kit.ArkTS';
import { sleep, taskFunction1 } from '../testability/pages/TestUtils';


export default function PromiseErrorTest() {
  describe('PromiseErrorTest', () => {
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
     * @tc.number SUB_PROMISE_ERROR_TEST_0100
     * @tc.name PromiseErrorTest0100
     * @tc.desc async lazy import taskPool three nest
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseErrorTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const asyncFunction = async () => {
        return new Promise<number>((resolve,reject) => {
          setTimeout(() => {
            reject(42);
          }, 1000);
        });
      };
      await asyncFunction().catch((result:number) => {
        expect(result).assertEqual(42);
      })
      Done();
    })

    /**
     * @tc.number SUB_PROMISE_ERROR_TEST_0200
     * @tc.name PromiseErrorTest0200
     * @tc.desc async lazy import taskPool three nest
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseErrorTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const asyncFunction = async () => {
        return new Promise<number>((resolve,reject) => {
          setTimeout(() => {
            reject(42);
          }, 1000);
        });
      };
      const testFunction = async () => {
        try {
          await asyncFunction();
        } catch (error) {
          expect(error).assertEqual(42);
          console.error("发生错误：", error);
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
    it('PromiseErrorTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const asyncFunction1 = async () => {
        return new Promise<number>((resolve,reject) => {
          setTimeout(() => {
            reject(42);
          }, 1000);
        });
      };
      const asyncFunction2 = async () => {
        return new Promise<number>((resolve,reject) => {
          setTimeout(() => {
            reject(43);
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
        expect(error).assertEqual(42);
        console.error("发生错误：", error);
      }
      Done();
    })

    /**
     * @tc.number SUB_PROMISE_ERROR_TEST_0400
     * @tc.name PromiseErrorTest0400
     * @tc.desc async lazy import taskPool three nest
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseErrorTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const asyncFunction = async () => {
        return new Promise<number>((resolve,reject) => {
          setTimeout(() => {
            reject(42);
          }, 1000);
        });
      };
      await asyncFunction().catch(()=>{
        throw new Error()
      }).catch(() => {
        console.error("发生错误 : PromiseErrorTest0400");
        Done();
      })
    })



    /**
     * @tc.number SUB_PROMISE_ERROR_TEST_0500
     * @tc.name PromiseErrorTest0500
     * @tc.desc async lazy import taskPool three nest
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseErrorTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let result = 40;
      const asyncFunction = async () => {
        return new Promise<number>((resolve,reject) => {
          setTimeout(() => {
            result += 10;
            reject();
          }, 1000);
        });
      };
      await asyncFunction().then(()=>{
      }).catch(()=>{
        result += 10
      }).finally(()=>{
        result += 10
        expect(70).assertEqual(result)
      });
      Done();
    })


    /**
     * @tc.number SUB_PROMISE_ERROR_TEST_0600
     * @tc.name PromiseErrorTest0600
     * @tc.desc async lazy import taskPool three nest
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseErrorTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let task =  new taskpool.Task(taskFunction1);
      await taskpool.execute(task).catch((result:number) => {
        expect(42).assertEqual(result)
        Done();
      })
    })


    /**
     * @tc.number SUB_PROMISE_ERROR_TEST_0700
     * @tc.name PromiseErrorTest0700
     * @tc.desc async lazy import taskPool three nest
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseErrorTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const asyncLock: ArkTSUtils.locks.AsyncLock = ArkTSUtils.locks.AsyncLock.request('Lock');
      await asyncLock.lockAsync(taskFunction1).catch((result:number) => {
        expect(42).assertEqual(result)
        Done();
      })
    })

  })
}
