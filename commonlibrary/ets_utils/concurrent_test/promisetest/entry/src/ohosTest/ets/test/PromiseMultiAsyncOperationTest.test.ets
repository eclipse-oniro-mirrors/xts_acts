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
import { sleep, taskFail, taskSuccess } from '../testability/pages/TestUtils';


export default function PromiseMultiAsyncOperationTest() {
  describe('PromiseMultiAsyncOperationTest', () => {
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
     * @tc.number SUB_PROMISE_MULTI_ASYNC_OPERATION_TEST_0100
     * @tc.name PromiseMultiAsyncOperationTest0100
     * @tc.desc async lazy import taskPool three nest
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseMultiAsyncOperationTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const taskSuccess1 = new taskpool.Task(taskSuccess);
      const taskSuccess2 = new taskpool.Task(taskSuccess);
      const taskSuccess3 = new taskpool.Task(taskSuccess);
      const taskSuccess4 = new taskpool.Task(taskSuccess);
      const taskSuccess5 = new taskpool.Task(taskSuccess);
      const taskFail1 = new taskpool.Task(taskFail);
      const taskFail2 = new taskpool.Task(taskFail);
      const taskFail3 = new taskpool.Task(taskFail);
      const taskFail4 = new taskpool.Task(taskFail);
      const taskFail5 = new taskpool.Task(taskFail);
      const results = await Promise.all(  [taskpool.execute(taskSuccess1)
                                          ,taskpool.execute(taskSuccess2)
                                          ,taskpool.execute(taskSuccess3)
                                          ,taskpool.execute(taskSuccess4)
                                          ,taskpool.execute(taskSuccess5)
                                          ,taskpool.execute(taskFail1)
                                          ,taskpool.execute(taskFail2)
                                          ,taskpool.execute(taskFail3)
                                          ,taskpool.execute(taskFail4)
                                          ,taskpool.execute(taskFail5)

      ]);
      console.log("PromiseMultiAsyncOperationTest0100" + results.toString());
      Done();
    })

    /**
     * @tc.number SUB_PROMISE_MULTI_ASYNC_OPERATION_TEST_0200
     * @tc.name PromiseMultiAsyncOperationTest0200
     * @tc.desc async lazy import taskPool three nest
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseMultiAsyncOperationTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const taskSuccess1 = new taskpool.Task(taskSuccess);
      const taskSuccess2 = new taskpool.Task(taskSuccess);
      const taskSuccess3 = new taskpool.Task(taskSuccess);
      const taskSuccess4 = new taskpool.Task(taskSuccess);
      const taskSuccess5 = new taskpool.Task(taskSuccess);
      const taskSuccess6 = new taskpool.Task(taskSuccess);
      const taskSuccess7 = new taskpool.Task(taskSuccess);
      const taskSuccess8 = new taskpool.Task(taskSuccess);
      const taskSuccess9 = new taskpool.Task(taskSuccess);
      const taskSuccess10 = new taskpool.Task(taskSuccess);
      const results = await Promise.all(  [taskpool.execute(taskSuccess1)
                                          ,taskpool.execute(taskSuccess2)
                                          ,taskpool.execute(taskSuccess3)
                                          ,taskpool.execute(taskSuccess4)
                                          ,taskpool.execute(taskSuccess5)
                                          ,taskpool.execute(taskSuccess6)
                                          ,taskpool.execute(taskSuccess7)
                                          ,taskpool.execute(taskSuccess8)
                                          ,taskpool.execute(taskSuccess9)
                                          ,taskpool.execute(taskSuccess10)
      ]);
      console.log("PromiseMultiAsyncOperationTest0200" + results.toString());
      Done();
    })


    /**
     * @tc.number SUB_PROMISE_MULTI_ASYNC_OPERATION_TEST_0300
     * @tc.name PromiseMultiAsyncOperationTest0300
     * @tc.desc async lazy import taskPool three nest
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseMultiAsyncOperationTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const asyncFunction = async () => {
        return new Promise<number>((resolve) => {
          setTimeout(() => {
            resolve(42);
          }, 500);
        });
      };

      const result : number= await asyncFunction().then((result) => {
        return new Promise<number>((resolve) => {
          setTimeout(() => {
            resolve(result + 1);
          }, 500);
        });
      }).then((result) => {
        return new Promise<number>((resolve) => {
          setTimeout(() => {
            resolve(result + 1);
          }, 500);
        });
      }).then((result) => {
        return new Promise<number>((resolve) => {
          setTimeout(() => {
            resolve(result + 1);
          }, 500);
        });
      }).then((result) => {
        return new Promise<number>((resolve) => {
          setTimeout(() => {
            resolve(result + 1);
          }, 500);
        });
      }).then((result) => {
        return new Promise<number>((resolve) => {
          setTimeout(() => {
            resolve(result + 1);
          }, 500);
        });
      }).then((result) => {
        return new Promise<number>((resolve) => {
          setTimeout(() => {
            resolve(result + 1);
          }, 500);
        });
      }).then((result) => {
        return new Promise<number>((resolve) => {
          setTimeout(() => {
            resolve(result + 1);
          }, 500);
        });
      }).then((result) => {
        return new Promise<number>((resolve) => {
          setTimeout(() => {
            resolve(result + 1);
          }, 500);
        });
      }).then((result) => {
        return new Promise<number>((resolve) => {
          setTimeout(() => {
            resolve(result + 1);
          }, 500);
        });
      }).then((result) => {
        return new Promise<number>((resolve) => {
          setTimeout(() => {
            resolve(result + 1);
          }, 500);
        });
      }).catch(() => {
        console.log("PromiseMultiAsyncOperationTest0300 test error");
        return 0
      })
      expect(52).assertEqual(result)
      Done();
    })


  })
}
