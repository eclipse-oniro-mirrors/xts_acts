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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium';
import {  taskpool } from '@kit.ArkTS';
import { BusinessError } from '@kit.BasicServicesKit';
import {
  test_asynclock_001,
  test_asynclock_002,
  test_asynclock_003,
  test_asynclock_004,
  test_asynclock_005,
  test_asynclock_006,
  test_asynclock_007, test_asynclock_008, test_asynclock_009 } from '../testability/pages/taskpool';

let concurrentNum = 100


export function sleep(time: number): Promise<void> {
  return new Promise((re, je) => {
    setTimeout(() => {
      re()
    }, time)
  })
}

export default function AsyncLockTest() {
  describe('AsyncLockTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(50);
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
     * @tc.name   test_concurrent_asynclock_001
     * @tc.number SUB_CONCURRENT_ASYNCLOCK_TEST_0100
     * @tc.desc   test_concurrent_asynclock_001 - test AsyncLock constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_asynclock_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_asynclock_001';
        console.info(`${caseName} test start`);
        let count = 0;
        try {
          for (let i = 0; i < concurrentNum; i++) {
            await taskpool.execute(test_asynclock_001, caseName, i).then((res) => {
              expect(res as number).assertEqual(1);
              count++;
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
              expect().assertFail();
            });
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail();
        }

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.name   test_concurrent_asynclock_002
     * @tc.number SUB_CONCURRENT_ASYNCLOCK_TEST_0200
     * @tc.desc   test_concurrent_asynclock_002 - test AsyncLock request method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_asynclock_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_asynclock_002';
        console.info(`${caseName} test start`);
        let count = 0;
        try {
          for (let i = 0; i < concurrentNum; i++) {
            await taskpool.execute(test_asynclock_002, caseName, i).then((res) => {
              expect(res as string).assertEqual('request_success');
              count++;
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
              expect().assertFail();
            });
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail();
        }

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.name   test_concurrent_asynclock_003
     * @tc.number SUB_CONCURRENT_ASYNCLOCK_TEST_0300
     * @tc.desc   test_concurrent_asynclock_003 - test AsyncLock query method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_asynclock_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_asynclock_003';
        console.info(`${caseName} test start`);
        let count = 0;
        try {
          for (let i = 0; i < concurrentNum; i++) {
            await taskpool.execute(test_asynclock_003, caseName, i).then((res) => {
              expect(res as boolean).assertTrue();
              count++;
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
              expect().assertFail();
            });
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail();
        }

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.name   test_concurrent_asynclock_004
     * @tc.number SUB_CONCURRENT_ASYNCLOCK_TEST_0400
     * @tc.desc   test_concurrent_asynclock_004 - test AsyncLock queryAll method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_asynclock_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_asynclock_004';
        console.info(`${caseName} test start`);
        let count = 0;
        try {
          for (let i = 0; i < concurrentNum; i++) {
            await taskpool.execute(test_asynclock_004, caseName, i).then((res) => {
              expect(res as boolean).assertTrue();
              count++;
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
              expect().assertFail();
            });
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail();
        }

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.name   test_concurrent_asynclock_005
     * @tc.number SUB_CONCURRENT_ASYNCLOCK_TEST_0500
     * @tc.desc   test_concurrent_asynclock_005 - test AsyncLock lockAsync basic usage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_asynclock_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_asynclock_005';
        console.info(`${caseName} test start`);
        let count = 0;
        try {
          for (let i = 0; i < concurrentNum; i++) {
            await taskpool.execute(test_asynclock_005, caseName, i).then((res) => {
              expect(res as number).assertEqual(100);
              count++;
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
              expect().assertFail();
            });
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail();
        }

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.name   test_concurrent_asynclock_006
     * @tc.number SUB_CONCURRENT_ASYNCLOCK_TEST_0600
     * @tc.desc   test_concurrent_asynclock_006 - test AsyncLock lockAsync with mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_asynclock_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_asynclock_006';
        console.info(`${caseName} test start`);
        let count = 0;
        try {
          for (let i = 0; i < concurrentNum; i++) {
            await taskpool.execute(test_asynclock_006, caseName, i).then((res) => {
              expect(res as string).assertEqual('exclusive_mode_success');
              count++;
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
              expect().assertFail();
            });
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail();
        }

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.name   test_concurrent_asynclock_007
     * @tc.number SUB_CONCURRENT_ASYNCLOCK_TEST_0700
     * @tc.desc   test_concurrent_asynclock_007 - test AsyncLock lockAsync with timeout
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_asynclock_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_asynclock_007';
        console.info(`${caseName} test start`);
        let count = 0;
        try {
          for (let i = 0; i < concurrentNum; i++) {
            await taskpool.execute(test_asynclock_007, caseName, i).then((res) => {
              expect(res as string).assertEqual('timeout_success');
              count++;
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
              expect().assertFail();
            });
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail();
        }

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.name   test_concurrent_asynclock_008
     * @tc.number SUB_CONCURRENT_ASYNCLOCK_TEST_0800
     * @tc.desc   test_concurrent_asynclock_008 - test AsyncLock concurrent access
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_asynclock_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_asynclock_008';
        console.info(`${caseName} test start`);
        let count = 0;
        try {
          for (let i = 0; i < concurrentNum; i++) {
            await taskpool.execute(test_asynclock_008, caseName, i).then((res) => {
              expect(res as number).assertEqual(concurrentNum);
              count++;
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
              expect().assertFail();
            });
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail();
        }

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.name   test_concurrent_asynclock_009
     * @tc.number SUB_CONCURRENT_ASYNCLOCK_TEST_0900
     * @tc.desc   test_concurrent_asynclock_009 - test AsyncLock error handling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_asynclock_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_asynclock_009';
        console.info(`${caseName} test start`);
        let count = 0;
        try {
          for (let i = 0; i < concurrentNum; i++) {
            await taskpool.execute(test_asynclock_009, caseName, i).then((res) => {
              expect(res as string).assertEqual('error_handled');
              count++;
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
              expect().assertFail();
            });
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail();
        }

        console.info(`${caseName} test end`);
        done();
      });
  })
}