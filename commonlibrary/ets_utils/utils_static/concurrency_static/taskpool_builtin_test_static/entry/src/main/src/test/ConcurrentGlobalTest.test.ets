'use static'
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from "../../../hypium/index";
import type { BusinessError } from '@ohos.base';
import {test_Global_test_001,test_Global_test_002,test_Global_test_003,test_Global_test_004,test_Global_test_005,test_Global_test_006,test_Global_test_007,test_Global_test_008,test_Global_test_009,test_Global_test_010,
  test_Global_test_011,test_Global_test_012,test_Global_test_013,test_Global_test_014,test_Global_test_015,test_Global_test_016,test_Global_test_017,test_Global_test_018,test_Global_test_019,test_Global_test_020,
  test_Global_test_021,test_Global_test_022,test_Global_test_023,test_Global_test_024,test_Global_test_025,test_Global_test_026,test_Global_test_027,test_Global_test_028,test_Global_test_029,test_Global_test_030,
  test_Global_test_031,test_Global_test_032,test_Global_test_033,test_Global_test_034,test_Global_test_035,test_Global_test_036,test_Global_test_037,test_Global_test_038,test_Global_test_039,test_Global_test_040,test_Global_test_041,
  test_Global_test_042,test_Global_test_043,test_Global_test_044,test_Global_test_045,test_Global_test_046,test_Global_test_047,test_Global_test_048,test_Global_test_049,test_Global_test_050,
  test_Global_test_051,
} from "../testability/pages/taskpool"

import {sleep} from '../testability/pages/utils'

let concurrentNum: int = 100

export default function globalTest() {
  describe('globalTest', () => {
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
     * @tc.name   test_concurrent_Global_test_001
     * @tc.number SUB_CONCURRENT_GLOBAL_TEST_0100
     * @tc.desc   test_concurrent_Global_test_001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_Global_test_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_Global_test_001';
        console.info(`${caseName} test start`);
        let count: int = 0;
        try {
          for (let i: int = 0; i < concurrentNum; i++) {
            taskpool.execute(test_Global_test_001).then((res) => {
              expect(res as string)
                .assertEqual("%20!%22#$%25&'()*+,-./0123456789:;%3C=%3E?@ABCDEFGHIJKLMNOPQRSTUVWXYZ%5B%5C%5D%5E_%60abcdefghijklmnopqrstuvwxyz%7B%7C%7D~")
              count++
            }).catch((e: Error) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
              expect().assertFail()
            })
          }
          let result = encodeURI(" !\"#$%&'()*+,-./0123456789:;<=>?@ABCDEF" +
            "GHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~");
          expect(result)
            .assertEqual("%20!%22#$%25&'()*+,-./0123456789:;%3C=%3E?@ABCDEFGHIJKLMNOPQRSTUVWXYZ%5B%5C%5D%5E_%60abcdefghijklmnopqrstuvwxyz%7B%7C%7D~")
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        while (count < concurrentNum) {
          await sleep(100)
        }
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   test_concurrent_Global_test_002
     * @tc.number SUB_CONCURRENT_GLOBAL_TEST_0200
     * @tc.desc   test_concurrent_Global_test_002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_Global_test_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_Global_test_002';
        console.info(`${caseName} test start`);
        let count: int = 0;
        try {
          for (let i: int = 0; i < concurrentNum; i++) {
            taskpool.execute(test_Global_test_002).then((res) => {
              expect(res as string)
                .assertEqual("!!%22%22##$$%25%25&&''(())**++,,--..//::;;%3C%3C==%3E%3E??@@%5B%5B%5C%5C%5D%5D%5E%5E__%60%60%7B%7B%7C%7C%7D%7D~~");
              count++;
            }).catch((e: Error) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
              expect().assertFail();
            });
          }
          for (let i: int = 0; i < concurrentNum; i++) {
            let result = encodeURI("!!\"\"##$$%%&&''(())**++,,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~");
            expect(result)
              .assertEqual("!!%22%22##$$%25%25&&''(())**++,,--..//::;;%3C%3C==%3E%3E??@@%5B%5B%5C%5C%5D%5D%5E%5E__%60%60%7B%7B%7C%7C%7D%7D~~");
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail();
        }
        while (count < concurrentNum) {
          await sleep(100);
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.name   test_concurrent_Global_test_003
     * @tc.number SUB_CONCURRENT_GLOBAL_TEST_0300
     * @tc.desc   test_concurrent_Global_test_003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_Global_test_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_Global_test_003';
        console.info(`${caseName} test start`);
        let count: int = 0;
        try {
          for (let i: int = 0; i < concurrentNum; i++) {
            taskpool.execute(test_Global_test_003).then((res) => {
              expect(res as string).assertEqual("%5C%5Cb%5C0%5C%F0%9F%92%87%5C%E5%BC%80$%5Cv%5Ct%5Cr%5Cn%5Cf%5Cb");
              count++;
            }).catch((e: Error) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
              expect().assertFail();
            });
          }
          for (let i: int = 0; i < concurrentNum; i++) {
            let result = encodeURI("\\\\b\\0\\💇\\开\x24\\v\\t\\r\\n\\f\\b");
            expect(result).assertEqual("%5C%5Cb%5C0%5C%F0%9F%92%87%5C%E5%BC%80$%5Cv%5Ct%5Cr%5Cn%5Cf%5Cb");
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail();
        }
        while (count < concurrentNum) {
          await sleep(100);
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.name   test_concurrent_Global_test_004
     * @tc.number SUB_CONCURRENT_GLOBAL_TEST_0400
     * @tc.desc   test_concurrent_Global_test_004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_Global_test_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_Global_test_004';
        console.info(`${caseName} test start`);
        let count: int = 0;
        try {
          for (let i: int = 0; i < concurrentNum; i++) {
            taskpool.execute(test_Global_test_004).then((res) => {
              expect(res as string).assertEqual("%F0%9F%92%87%20===%20%F0%9F%92%87");
              count++;
            }).catch((e: Error) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
              expect().assertFail();
            });
          }
          for (let i: int = 0; i < concurrentNum; i++) {
            let result = encodeURI("💇 === \ud83d\udc87");
            expect(result).assertEqual("%F0%9F%92%87%20===%20%F0%9F%92%87");
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail();
        }
        while (count < concurrentNum) {
          await sleep(100);
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.name   test_concurrent_Global_test_005
     * @tc.number SUB_CONCURRENT_GLOBAL_TEST_0500
     * @tc.desc   test_concurrent_Global_test_005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_Global_test_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_Global_test_005';
        console.info(`${caseName} test start`);
        let count: int = 0;
        try {
          for (let i: int = 0; i < concurrentNum; i++) {
            taskpool.execute(test_Global_test_005).then((res) => {
              expect(res as string).assertEqual(" !\"#$%&'()*+,-./0123456789:;<=>?@ABCDEF" +
                "GHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~");
              count++;
            }).catch((e: Error) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
              expect().assertFail();
            });
          }
          for (let i: int = 0; i < concurrentNum; i++) {
            let result =
              decodeURI("%20!%22#$%25&'()*+,-./0123456789:;%3C=%3E?@ABCDEFGHIJKLMNOPQRSTUVWXYZ%5B%5C%5D%5E_%60abcdefghijklmnopqrstuvwxyz%7B%7C%7D~");
            expect(result).assertEqual(" !\"#$%&'()*+,-./0123456789:;<=>?@ABCDEF" +
              "GHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~");
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail();
        }
        while (count < concurrentNum) {
          await sleep(100);
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.name   test_concurrent_Global_test_006
     * @tc.number SUB_CONCURRENT_GLOBAL_TEST_0600
     * @tc.desc   test_concurrent_Global_test_006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_Global_test_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_Global_test_006';
        console.info(`${caseName} test start`);
        let count: int = 0;
        try {
          for (let i: int = 0; i < concurrentNum; i++) {
            taskpool.execute(test_Global_test_006).then((res) => {
              expect(res as string).assertEqual("!!\"\"##$$%%&&''(())**++,,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~");
              count++;
            }).catch((e: Error) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
              expect().assertFail();
            });
          }
          for (let i: int = 0; i < concurrentNum; i++) {
            let result =
              decodeURI("!!%22%22##$$%25%25&&''(())**++,,--..//::;;%3C%3C==%3E%3E??@@%5B%5B%5C%5C%5D%5D%5E%5E__%60%60%7B%7B%7C%7C%7D%7D~~");
            expect(result).assertEqual("!!\"\"##$$%%&&''(())**++,,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~");
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail();
        }
        while (count < concurrentNum) {
          await sleep(100);
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.name   test_concurrent_Global_test_007
     * @tc.number SUB_CONCURRENT_GLOBAL_TEST_0700
     * @tc.desc   test_concurrent_Global_test_007
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_Global_test_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_Global_test_007';
        console.info(`${caseName} test start`);
        let count: int = 0;
        try {
          for (let i: int = 0; i < concurrentNum; i++) {
            taskpool.execute(test_Global_test_007).then((res) => {
              expect(res as string).assertEqual("\\\\b\\0\\💇\\开$\\v\\t\\r\\n\\f\\b");
              count++;
            }).catch((e: Error) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
              expect().assertFail();
            });
          }
          for (let i: int = 0; i < concurrentNum; i++) {
            let result =
              decodeURI("%5C%5Cb%5C0%5C%F0%9F%92%87%5C%E5%BC%80$%5Cv%5Ct%5Cr%5Cn%5Cf%5Cb");
            expect(result).assertEqual("\\\\b\\0\\💇\\开$\\v\\t\\r\\n\\f\\b");
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail();
        }
        while (count < concurrentNum) {
          await sleep(100);
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.name   test_concurrent_Global_test_008
     * @tc.number SUB_CONCURRENT_GLOBAL_TEST_0800
     * @tc.desc   test_concurrent_Global_test_008
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_Global_test_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_Global_test_008';
        console.info(`${caseName} test start`);
        let count: int = 0;
        try {
          for (let i: int = 0; i < concurrentNum; i++) {
            taskpool.execute(test_Global_test_008).then((res) => {
              expect(res as string).assertEqual("💇 === \ud83d\udc87");
              count++;
            }).catch((e: Error) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
              expect().assertFail();
            });
          }
          for (let i: int = 0; i < concurrentNum; i++) {
            let result =
              decodeURI("%F0%9F%92%87%20===%20%F0%9F%92%87");
            expect(result).assertEqual("💇 === \ud83d\udc87");
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail();
        }
        while (count < concurrentNum) {
          await sleep(100);
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.name   test_concurrent_Global_test_009
     * @tc.number SUB_CONCURRENT_GLOBAL_TEST_0900
     * @tc.desc   test_concurrent_Global_test_009
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_Global_test_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_Global_test_009';
        console.info(`${caseName} test start`);
        let count: int = 0;
        try {
          for (let i: int = 0; i < concurrentNum; i++) {
            taskpool.execute(test_Global_test_009).then((res) => {
              expect(res as string)
                .assertEqual("%20!%22%23%24%25%26'()*%2B%2C-.%2F0123456789%3A%3B%3C%3D%3E%3F" +
                  "%40ABCDEFGHIJKLMNOPQRSTUVWXYZ%5B%5C%5D%5E_%60abcdefghijklmnopqrstuvwxyz%7B%7C%7D~");
              count++;
            }).catch((e: Error) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
              expect().assertFail();
            });
          }
          for (let i: int = 0; i < concurrentNum; i++) {
            let result = encodeURIComponent(" !\"#$%&'()*+,-./0123456789:;<=>?@ABCDEF" +
              "GHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~");
            expect(result)
              .assertEqual("%20!%22%23%24%25%26'()*%2B%2C-.%2F0123456789%3A%3B%3C%3D%3E%3F" +
                "%40ABCDEFGHIJKLMNOPQRSTUVWXYZ%5B%5C%5D%5E_%60abcdefghijklmnopqrstuvwxyz%7B%7C%7D~");
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail();
        }
        while (count < concurrentNum) {
          await sleep(100);
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.name   test_concurrent_Global_test_010
     * @tc.number SUB_CONCURRENT_GLOBAL_TEST_1000
     * @tc.desc   test_concurrent_Global_test_010
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_Global_test_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_Global_test_010';
        console.info(`${caseName} test start`);
        let count: int = 0;
        try {
          for (let i: int = 0; i < concurrentNum; i++) {
            taskpool.execute(test_Global_test_010).then((res) => {
              expect(res as string)
                .assertEqual("!!%22%22%23%23%24%24%25%25%26%26''(())**%2B%2B%2C%2C--..%2F%2F%3A%3A%3B%3B%3C%3C%3D%3D%3E%3E%3F%3F%40%40%" +
                  "5B%5B%5C%5C%5D%5D%5E%5E__%60%60%7B%7B%7C%7C%7D%7D~~");
              count++;
            }).catch((e: Error) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
              expect().assertFail();
            });
          }
          for (let i: int = 0; i < concurrentNum; i++) {
            let result = encodeURIComponent("!!\"\"##$$%%&&''(())**++,,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~");
            expect(result)
              .assertEqual("!!%22%22%23%23%24%24%25%25%26%26''(())**%2B%2B%2C%2C--..%2F%2F%3A%3A%3B%3B%3C%3C%3D%3D%3E%3E%3F%3F%40%40%" +
                "5B%5B%5C%5C%5D%5D%5E%5E__%60%60%7B%7B%7C%7C%7D%7D~~");
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail();
        }
        while (count < concurrentNum) {
          await sleep(100);
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.name   test_concurrent_Global_test_011
     * @tc.number SUB_CONCURRENT_GLOBAL_TEST_1100
     * @tc.desc   test_concurrent_Global_test_011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_Global_test_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_Global_test_011';
        console.info(`${caseName} test start`);
        let count: int = 0;
        try {
          for (let i: int = 0; i < concurrentNum; i++) {
            taskpool.execute(test_Global_test_011).then((res) => {
              expect(res as string).assertEqual("%5C%5Cb%5C0%5C%F0%9F%92%87%5C%E5%BC%80%24%5Cv%5Ct%5Cr%5Cn%5Cf%5Cb");
              count++;
            }).catch((e: Error) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
              expect().assertFail();
            });
          }
          for (let i: int = 0; i < concurrentNum; i++) {
            const result = encodeURIComponent("\\\\b\\0\\💇\\开\x24\\v\\t\\r\\n\\f\\b");
            expect(result).assertEqual("%5C%5Cb%5C0%5C%F0%9F%92%87%5C%E5%BC%80%24%5Cv%5Ct%5Cr%5Cn%5Cf%5Cb");
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail();
        }
        while (count < concurrentNum) { await sleep(100); }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.name   test_concurrent_Global_test_012
     * @tc.number SUB_CONCURRENT_GLOBAL_TEST_1200
     * @tc.desc   test_concurrent_Global_test_012
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_Global_test_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_Global_test_012';
        console.info(`${caseName} test start`);
        let count: int = 0;
        try {
          for (let i: int = 0; i < concurrentNum; i++) {
            taskpool.execute(test_Global_test_012).then((res) => {
              expect(res as string).assertEqual("%F0%9F%92%87%20%3D%3D%3D%20%F0%9F%92%87");
              count++;
            }).catch((e: Error) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
              expect().assertFail();
            });
          }
          for (let i: int = 0; i < concurrentNum; i++) {
            const result = encodeURIComponent("💇 === \ud83d\udc87");
            expect(result).assertEqual("%F0%9F%92%87%20%3D%3D%3D%20%F0%9F%92%87");
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail();
        }
        while (count < concurrentNum) { await sleep(100); }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.name   test_concurrent_Global_test_013
     * @tc.number SUB_CONCURRENT_GLOBAL_TEST_1300
     * @tc.desc   test_concurrent_Global_test_013
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_Global_test_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_Global_test_013';
        console.info(`${caseName} test start`);
        let count: int = 0;
        const expected = " !\"#$%&'()*+,-./0123456789:;<=>?@ABCDEF" +
          "GHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~";
        try {
          for (let i: int = 0; i < concurrentNum; i++) {
            taskpool.execute(test_Global_test_013).then((res) => {
              expect(res as string).assertEqual(expected);
              count++;
            }).catch((e: Error) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
              expect().assertFail();
            });
          }
          for (let i: int = 0; i < concurrentNum; i++) {
            const result =
              decodeURIComponent("%20!%22#$%25&'()*+,-./0123456789:;%3C=%3E?@ABCDEFGHIJKLMNOPQRSTUVWXYZ%5B%5C%5D%5E_%60abcdefghijklmnopqrstuvwxyz%7B%7C%7D~");
            expect(result).assertEqual(expected);
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail();
        }
        while (count < concurrentNum) { await sleep(100); }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.name   test_concurrent_Global_test_014
     * @tc.number SUB_CONCURRENT_GLOBAL_TEST_1400
     * @tc.desc   test_concurrent_Global_test_014
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_Global_test_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_Global_test_014';
        console.info(`${caseName} test start`);
        let count: int = 0;
        const expected = "!!\"\"##$$%%&&''(())**++,,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~";
        try {
          for (let i: int = 0; i < concurrentNum; i++) {
            taskpool.execute(test_Global_test_014).then((res) => {
              expect(res as string).assertEqual(expected);
              count++;
            }).catch((e: Error) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
              expect().assertFail();
            });
          }
          for (let i: int = 0; i < concurrentNum; i++) {
            const result =
              decodeURIComponent("!!%22%22##$$%25%25&&''(())**++,,--..//::;;%3C%3C==%3E%3E??@@%5B%5B%5C%5C%5D%5D%5E%5E__%60%60%7B%7B%7C%7C%7D%7D~~");
            expect(result).assertEqual(expected);
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail();
        }
        while (count < concurrentNum) { await sleep(100); }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.name   test_concurrent_Global_test_015
     * @tc.number SUB_CONCURRENT_GLOBAL_TEST_1500
     * @tc.desc   test_concurrent_Global_test_015
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_Global_test_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_Global_test_015';
        console.info(`${caseName} test start`);
        let count: int = 0;
        const expected = "💇 === \ud83d\udc87";
        try {
          for (let i: int = 0; i < concurrentNum; i++) {
            taskpool.execute(test_Global_test_015).then((res) => {
              expect(res as string).assertEqual(expected);
              count++;
            }).catch((e: Error) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
              expect().assertFail();
            });
          }
          for (let i: int = 0; i < concurrentNum; i++) {
            const result =
              decodeURIComponent("%F0%9F%92%87%20===%20%F0%9F%92%87");
            expect(result).assertEqual(expected);
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail();
        }
        while (count < concurrentNum) { await sleep(100); }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.name   test_concurrent_Global_test_016
     * @tc.number SUB_CONCURRENT_GLOBAL_TEST_1600
     * @tc.desc   test_concurrent_Global_test_016
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_Global_test_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_Global_test_016';
        console.info(`${caseName} test start`);
        let count: int = 0;
        const expected = "\\\\b\\0\\💇\\开$\\v\\t\\r\\n\\f\\b";
        try {
          for (let i: int = 0; i < concurrentNum; i++) {
            taskpool.execute(test_Global_test_016).then((res) => {
              expect(res as string).assertEqual(expected);
              count++;
            }).catch((e: Error) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
              expect().assertFail();
            });
          }
          for (let i: int = 0; i < concurrentNum; i++) {
            const result =
              decodeURIComponent("%5C%5Cb%5C0%5C%F0%9F%92%87%5C%E5%BC%80$%5Cv%5Ct%5Cr%5Cn%5Cf%5Cb");
            expect(result).assertEqual(expected);
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail();
        }
        while (count < concurrentNum) { await sleep(100); }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.name   test_concurrent_Global_test_017
     * @tc.number SUB_CONCURRENT_GLOBAL_TEST_1700
     * @tc.desc   test_concurrent_Global_test_017
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_Global_test_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_Global_test_017';
        console.info(`${caseName} test start`);
        let count: int = 0;
        const expected = " !\"#$%&'()*+,-./0123456789:;<=>?@ABCDEF" +
          "GHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~";
        try {
          for (let i: int = 0; i < concurrentNum; i++) {
            taskpool.execute(test_Global_test_017).then((res) => {
              expect(res as string).assertEqual(expected);
              count++;
            }).catch((e: Error) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
              expect().assertFail();
            });
          }
          for (let i: int = 0; i < concurrentNum; i++) {
            const result =
              decodeURIComponent("%20!%22%23%24%25%26'()*%2B%2C-.%2F0123456789%3A%3B%3C%3D%3E%3F%40ABCDEFGHIJKLMNOPQRSTUVWXYZ%5B%5C%5D%5E_%60abcdefghijklmnopqrstuvwxyz%7B%7C%7D~");
            expect(result).assertEqual(expected);
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail();
        }
        while (count < concurrentNum) { await sleep(100); }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.name   test_concurrent_Global_test_018
     * @tc.number SUB_CONCURRENT_GLOBAL_TEST_1800
     * @tc.desc   test_concurrent_Global_test_018
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_Global_test_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_Global_test_018';
        console.info(`${caseName} test start`);
        let count: int = 0;
        const expected = "!!\"\"##$$%%&&''(())**++,,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~";
        try {
          for (let i: int = 0; i < concurrentNum; i++) {
            taskpool.execute(test_Global_test_018).then((res) => {
              expect(res as string).assertEqual(expected);
              count++;
            }).catch((e: Error) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
              expect().assertFail();
            });
          }
          for (let i: int = 0; i < concurrentNum; i++) {
            const result = decodeURIComponent(
              "!!%22%22%23%23%24%24%25%25%26%26''(())**%2B%2B%2C%2C--..%2F%2F%3A%3A" +
                "%3B%3B%3C%3C%3D%3D%3E%3E%3F%3F%40%40%5B%5B%5C%5C%5D%5D%5E%5E__%60%" +
                "60%7B%7B%7C%7C%7D%7D~~"
            );
            expect(result).assertEqual(expected);
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail();
        }
        while (count < concurrentNum) { await sleep(100); }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.name   test_concurrent_Global_test_019
     * @tc.number SUB_CONCURRENT_GLOBAL_TEST_1900
     * @tc.desc   test_concurrent_Global_test_019
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_Global_test_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_Global_test_019';
        console.info(`${caseName} test start`);
        let count: int = 0;
        const expected = "\\\\b\\0\\💇\\开\x24\\v\\t\\r\\n\\f\\b";
        try {
          for (let i: int = 0; i < concurrentNum; i++) {
            taskpool.execute(test_Global_test_019).then((res) => {
              expect(res as string).assertEqual(expected);
              count++;
            }).catch((e: Error) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
              expect().assertFail();
            });
          }
          for (let i: int = 0; i < concurrentNum; i++) {
            const result =
              decodeURIComponent("%5C%5Cb%5C0%5C%F0%9F%92%87%5C%E5%BC%80%24%5Cv%5Ct%5Cr%5Cn%5Cf%5Cb");
            expect(result).assertEqual(expected);
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail();
        }
        while (count < concurrentNum) { await sleep(100); }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.name   test_concurrent_Global_test_020
     * @tc.number SUB_CONCURRENT_GLOBAL_TEST_2000
     * @tc.desc   test_concurrent_Global_test_020
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_Global_test_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_Global_test_020';
        console.info(`${caseName} test start`);
        let count: int = 0;
        const expected = "💇 === \ud83d\udc87";
        try {
          for (let i: int = 0; i < concurrentNum; i++) {
            taskpool.execute(test_Global_test_020).then((res) => {
              expect(res as string).assertEqual(expected);
              count++;
            }).catch((e: Error) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
              expect().assertFail();
            });
          }
          for (let i: int = 0; i < concurrentNum; i++) {
            const result =
              decodeURIComponent("%F0%9F%92%87%20%3D%3D%3D%20%F0%9F%92%87");
            expect(result).assertEqual(expected);
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail();
        }
        while (count < concurrentNum) { await sleep(100); }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.name   test_concurrent_Global_test_021
     * @tc.number SUB_CONCURRENT_GLOBAL_TEST_2100
     * @tc.desc   test_concurrent_Global_test_021
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_Global_test_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_Global_test_021';
        console.info(`${caseName} test start`);
        let count: int = 0;
        const expected = "%20%21%22%23%24%25%26%27%28%29*+%2C-./0123456789%3A%3B%3C%3D%3E%3F@ABCDEFGHIJKLMNOPQRSTUVWXYZ%5B%5C%5D%5E_%60abcdefghijklmnopqrstuvwxyz%7B%7C%7D%7E";
        try {
          for (let i: int = 0; i < concurrentNum; i++) {
            taskpool.execute(test_Global_test_021).then((res) => {
              expect(res as string).assertEqual(expected);
              count++;
            }).catch((e: Error) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
              expect().assertFail();
            });
          }
          for (let i: int = 0; i < concurrentNum; i++) {
            const result = escape(" !\"#$%&'()*+,-./0123456789:;<=>?@ABCDEF" +
              "GHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~");
            expect(result).assertEqual(expected);
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail();
        }
        while (count < concurrentNum) { await sleep(100); }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.name   test_concurrent_Global_test_022
     * @tc.number SUB_CONCURRENT_GLOBAL_TEST_2200
     * @tc.desc   test_concurrent_Global_test_022
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_Global_test_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_Global_test_022';
        console.info(`${caseName} test start`);
        let count: int = 0;
        const expected = "%21%21%22%22%23%23%24%24%25%25%26%26%27%27%28%28%29%29**++%2C%2C--..//%3A%3A%3B%3B%3C%3C%3D%3D%3E%3E%3F%3F@@%5B%5B%5C%5C%5D%5D%5E%5E__%60%60%7B%7B%7C%7C%7D%7D%7E%7E";
        try {
          for (let i: int = 0; i < concurrentNum; i++) {
            taskpool.execute(test_Global_test_022).then((res) => {
              expect(res as string).assertEqual(expected);
              count++;
            }).catch((e: Error) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
              expect().assertFail();
            });
          }
          for (let i: int = 0; i < concurrentNum; i++) {
            const result = escape("!!\"\"##$$%%&&''(())**++,,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~");
            expect(result).assertEqual(expected);
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail();
        }
        while (count < concurrentNum) { await sleep(100); }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.name   test_concurrent_Global_test_023
     * @tc.number SUB_CONCURRENT_GLOBAL_TEST_2300
     * @tc.desc   test_concurrent_Global_test_023
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_Global_test_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_Global_test_023';
        console.info(`${caseName} test start`);
        let count: int = 0;
        const expected = "%5C%5Cb%5C0%5C%uD83D%uDC87%5C%u5F00%24%5Cv%5Ct%5Cr%5Cn%5Cf%5Cb";
        try {
          for (let i: int = 0; i < concurrentNum; i++) {
            taskpool.execute(test_Global_test_023).then((res) => {
              expect(res as string).assertEqual(expected);
              count++;
            }).catch((e: Error) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
              expect().assertFail();
            });
          }
          for (let i: int = 0; i < concurrentNum; i++) {
            const result = escape("\\\\b\\0\\💇\\开\x24\\v\\t\\r\\n\\f\\b");
            expect(result).assertEqual(expected);
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail();
        }
        while (count < concurrentNum) { await sleep(100); }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.name   test_concurrent_Global_test_024
     * @tc.number SUB_CONCURRENT_GLOBAL_TEST_2400
     * @tc.desc   test_concurrent_Global_test_024
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_Global_test_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_Global_test_024';
        console.info(`${caseName} test start`);
        let count: int = 0;
        const expected = "%uD83D%uDC87%20%3D%3D%3D%20%uD83D%uDC87";
        try {
          for (let i: int = 0; i < concurrentNum; i++) {
            taskpool.execute(test_Global_test_024).then((res) => {
              expect(res as string).assertEqual(expected);
              count++;
            }).catch((e: Error) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
              expect().assertFail();
            });
          }
          for (let i: int = 0; i < concurrentNum; i++) {
            const result = escape("💇 === \ud83d\udc87");
            expect(result).assertEqual(expected);
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail();
        }
        while (count < concurrentNum) { await sleep(100); }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.name   test_concurrent_Global_test_025
     * @tc.number SUB_CONCURRENT_GLOBAL_TEST_2500
     * @tc.desc   test_concurrent_Global_test_025
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_Global_test_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_Global_test_025';
        console.info(`${caseName} test start`);
        let count: int = 0;
        try {
          for (let i: int = 0; i < concurrentNum; i++) {
            taskpool.execute(test_Global_test_025).then((res) => {
              expect(res as boolean).assertTrue();
              count++;
            }).catch((e: Error) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
              expect().assertFail();
            });
          }
          for (let i: int = 0; i < concurrentNum; i++) {
            const result = isFinite(123);
            expect(result).assertTrue();
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail();
        }
        while (count < concurrentNum) { await sleep(100); }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.name   test_concurrent_Global_test_026
     * @tc.number SUB_CONCURRENT_GLOBAL_TEST_2600
     * @tc.desc   test_concurrent_Global_test_026
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_Global_test_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_Global_test_026';
        console.info(`${caseName} test start`);
        let count: int = 0;
        try {
          for (let i: int = 0; i < concurrentNum; i++) {
            taskpool.execute(test_Global_test_026).then((res) => {
              expect(res as boolean).assertTrue();
              count++;
            }).catch((e: Error) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
              expect().assertFail();
            });
          }
          for (let i: int = 0; i < concurrentNum; i++) {
            const result = isFinite(3.14);
            expect(result).assertTrue();
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail();
        }
        while (count < concurrentNum) { await sleep(100); }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.name   test_concurrent_Global_test_027
     * @tc.number SUB_CONCURRENT_GLOBAL_TEST_2700
     * @tc.desc   test_concurrent_Global_test_027
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_Global_test_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_Global_test_027';
        console.info(`${caseName} test start`);
        let count: int = 0;
        try {
          for (let i: int = 0; i < concurrentNum; i++) {
            taskpool.execute(test_Global_test_027).then((res) => {
              expect(res as boolean).assertTrue();
              count++;
            }).catch((e: Error) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
              expect().assertFail();
            });
          }
          for (let i: int = 0; i < concurrentNum; i++) {
            const result = isFinite(456);
            expect(result).assertTrue();
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail();
        }
        while (count < concurrentNum) { await sleep(100); }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.name   test_concurrent_Global_test_028
     * @tc.number SUB_CONCURRENT_GLOBAL_TEST_2800
     * @tc.desc   test_concurrent_Global_test_028
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_Global_test_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_Global_test_028';
        console.info(`${caseName} test start`);
        let count: int = 0;
        try {
          for (let i: int = 0; i < concurrentNum; i++) {
            taskpool.execute(test_Global_test_028).then((res) => {
              expect(res as boolean).assertFalse();
              count++;
            }).catch((e: Error) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
              expect().assertFail();
            });
          }
          for (let i: int = 0; i < concurrentNum; i++) {
            const result = isFinite(Infinity);
            expect(result).assertFalse();
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail();
        }
        while (count < concurrentNum) { await sleep(100); }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.name   test_concurrent_Global_test_029
     * @tc.number SUB_CONCURRENT_GLOBAL_TEST_2900
     * @tc.desc   test_concurrent_Global_test_029
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_Global_test_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_Global_test_029';
        console.info(`${caseName} test start`);
        let count: int = 0;
        try {
          for (let i: int = 0; i < concurrentNum; i++) {
            taskpool.execute(test_Global_test_029).then((res) => {
              expect(res as boolean).assertFalse();
              count++;
            }).catch((e: Error) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
              expect().assertFail();
            });
          }
          for (let i: int = 0; i < concurrentNum; i++) {
            const result = isFinite(-Infinity);
            expect(result).assertFalse();
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail();
        }
        while (count < concurrentNum) { await sleep(100); }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.name   test_concurrent_Global_test_030
     * @tc.number SUB_CONCURRENT_GLOBAL_TEST_3000
     * @tc.desc   test_concurrent_Global_test_030
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_Global_test_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_Global_test_030';
        console.info(`${caseName} test start`);
        let count: int = 0;
        try {
          for (let i: int = 0; i < concurrentNum; i++) {
            taskpool.execute(test_Global_test_030).then((res) => {
              expect(res as boolean).assertFalse();
              count++;
            }).catch((e: Error) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
              expect().assertFail();
            });
          }
          for (let i: int = 0; i < concurrentNum; i++) {
            const result = isFinite(NaN);
            expect(result).assertFalse();
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail();
        }
        while (count < concurrentNum) { await sleep(100); }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.name   test_concurrent_Global_test_031
     * @tc.number SUB_CONCURRENT_GLOBAL_TEST_3100
     * @tc.desc   test_concurrent_Global_test_031
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_Global_test_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_Global_test_031';
        console.info(`${caseName} test start`);
        let count: int = 0;
        try {
          for (let i: int = 0; i < concurrentNum; i++) {
            taskpool.execute(test_Global_test_031).then((res) => {
              expect(res as boolean).assertTrue();
              count++;
            }).catch((e: Error) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
              expect().assertFail();
            });
          }
          for (let i: int = 0; i < concurrentNum; i++) {
            const result = isFinite(Number.EPSILON);
            expect(result).assertTrue();
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail();
        }
        while (count < concurrentNum) {
          await sleep(100)
        }
        console.info(`${caseName} test end`);
        done()
      });

    /**
     * @tc.name   test_concurrent_Global_test_032
     * @tc.number SUB_CONCURRENT_GLOBAL_TEST_3200
     * @tc.desc   test_concurrent_Global_test_032
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_Global_test_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_Global_test_032';
        console.info(`${caseName} test start`);
        let count: int = 0;
        try {
          for (let i: int = 0; i < concurrentNum; i++) {
            taskpool.execute(test_Global_test_032).then((res) => {
              expect(res as boolean).assertTrue();
              count++;
            }).catch((e: Error) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
              expect().assertFail();
            });
          }
          for (let i: int = 0; i < concurrentNum; i++) {
            const result = isFinite(Number.MAX_VALUE);
            expect(result).assertTrue();
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail();
        }
        while (count < concurrentNum) {
          await sleep(100)
        }
        console.info(`${caseName} test end`);
        done()
      });

    /**
     * @tc.name   test_concurrent_Global_test_033
     * @tc.number SUB_CONCURRENT_GLOBAL_TEST_3300
     * @tc.desc   test_concurrent_Global_test_033
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_Global_test_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_Global_test_033';
        console.info(`${caseName} test start`);
        let count: int = 0;
        try {
          for (let i: int = 0; i < concurrentNum; i++) {
            taskpool.execute(test_Global_test_033).then((res) => {
              expect(res as boolean).assertTrue();
              count++;
            }).catch((e: Error) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
              expect().assertFail();
            });
          }
          for (let i: int = 0; i < concurrentNum; i++) {
            const result = isFinite(Number.MIN_VALUE);
            expect(result).assertTrue();
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail();
        }
        while (count < concurrentNum) {
          await sleep(100)
        }
        console.info(`${caseName} test end`);
        done()
      });

    /**
     * @tc.name   test_concurrent_Global_test_034
     * @tc.number SUB_CONCURRENT_GLOBAL_TEST_3400
     * @tc.desc   test_concurrent_Global_test_034
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_Global_test_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_Global_test_034';
        console.info(`${caseName} test start`);
        let count: int = 0;
        const expected = " !\"#$%&'()*+,-./0123456789:;<=>?@ABCDEF" +
          "GHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~";
        try {
          for (let i: int = 0; i < concurrentNum; i++) {
            taskpool.execute(test_Global_test_034).then((res) => {
              expect(res as string).assertEqual(expected);
              count++;
            }).catch((e: Error) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
              expect().assertFail();
            });
          }
          for (let i: int = 0; i < concurrentNum; i++) {
            const result = unescape("%20%21%22%23%24%25%26%27%28%29*+%2C-./0123456789%3A" +
              "%3B%3C%3D%3E%3F@ABCDEFGHIJKLMNOPQRSTUVWXYZ%5B%5C%5D%5E_%60abcdefghijklmnopqrstuvwxyz%7B%7C%7D%7E");
            expect(result).assertEqual(expected);
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail();
        }
        while (count < concurrentNum) {
          await sleep(100)
        }
        console.info(`${caseName} test end`);
        done()
      });

    /**
     * @tc.name   test_concurrent_Global_test_035
     * @tc.number SUB_CONCURRENT_GLOBAL_TEST_3500
     * @tc.desc   test_concurrent_Global_test_035
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_Global_test_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_Global_test_035';
        console.info(`${caseName} test start`);
        let count: int = 0;
        const expected = "!!\"\"##$$%%&&''(())**++,,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~";
        try {
          for (let i: int = 0; i < concurrentNum; i++) {
            taskpool.execute(test_Global_test_035).then((res) => {
              expect(res as string).assertEqual(expected);
              count++;
            }).catch((e: Error) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
              expect().assertFail();
            });
          }
          for (let i: int = 0; i < concurrentNum; i++) {
            const result = unescape("%21%21%22%22%23%23%24%24%25%25%26%26%27%27%28%28%29%29**++%2C%2C--." +
              ".//%3A%3A%3B%3B%3C%3C%3D%3D%3E%3E%3F%3F@@%5B%5B%5C%5C%5D%5D%5E%5E__%60%60%7B%7B%7C%7C%7D%7D%7E%7E");
            expect(result).assertEqual(expected);
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail();
        }
        while (count < concurrentNum) {
          await sleep(100)
        }
        console.info(`${caseName} test end`);
        done()
      });

    /**
     * @tc.name   test_concurrent_Global_test_036
     * @tc.number SUB_CONCURRENT_GLOBAL_TEST_3600
     * @tc.desc   test_concurrent_Global_test_036
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_Global_test_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_Global_test_036';
        console.info(`${caseName} test start`);
        let count: int = 0;
        const expected = "\\\\b\\0\\💇\\开\x24\\v\\t\\r\\n\\f\\b";
        try {
          for (let i: int = 0; i < concurrentNum; i++) {
            taskpool.execute(test_Global_test_036).then((res) => {
              expect(res as string).assertEqual(expected);
              count++;
            }).catch((e: Error) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
              expect().assertFail();
            });
          }
          for (let i: int = 0; i < concurrentNum; i++) {
            const result = unescape("%5C%5Cb%5C0%5C%uD83D%uDC87%5C%u5F00%24%5Cv%5Ct%5Cr%5Cn%5Cf%5Cb");
            expect(result).assertEqual(expected);
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail();
        }
        while (count < concurrentNum) {
          await sleep(100)
        }
        console.info(`${caseName} test end`);
        done()
      });

    /**
     * @tc.name   test_concurrent_Global_test_037
     * @tc.number SUB_CONCURRENT_GLOBAL_TEST_3700
     * @tc.desc   test_concurrent_Global_test_037
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_Global_test_037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_Global_test_037';
        console.info(`${caseName} test start`);
        let count: int = 0;
        const expected = "💇 === \ud83d\udc87";
        try {
          for (let i: int = 0; i < concurrentNum; i++) {
            taskpool.execute(test_Global_test_037).then((res) => {
              expect(res as string).assertEqual(expected);
              count++;
            }).catch((e: Error) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
              expect().assertFail();
            });
          }
          for (let i: int = 0; i < concurrentNum; i++) {
            const result = unescape("%uD83D%uDC87%20%3D%3D%3D%20%uD83D%uDC87");
            expect(result).assertEqual(expected);
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail();
        }
        while (count < concurrentNum) {
          await sleep(100)
        }
        console.info(`${caseName} test end`);
        done()
      });

    /**
     * @tc.name   test_concurrent_Global_test_038
     * @tc.number SUB_CONCURRENT_GLOBAL_TEST_3800
     * @tc.desc   test_concurrent_Global_test_038
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_Global_test_038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_Global_test_038';
        console.info(`${caseName} test start`);
        let count: int = 0;
        try {
          for (let i: int = 0; i < concurrentNum; i++) {
            taskpool.execute(test_Global_test_038).then((res) => {
              expect(res as boolean).assertFalse();
              count++;
            }).catch((e: Error) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
              expect().assertFail();
            });
          }
          for (let i: int = 0; i < concurrentNum; i++) {
            const result = isNaN(123);
            expect(result).assertFalse();
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail();
        }
        while (count < concurrentNum) {
          await sleep(100)
        }
        console.info(`${caseName} test end`);
        done()
      });

    /**
     * @tc.name   test_concurrent_Global_test_039
     * @tc.number SUB_CONCURRENT_GLOBAL_TEST_3900
     * @tc.desc   test_concurrent_Global_test_039
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_Global_test_039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_Global_test_039';
        console.info(`${caseName} test start`);
        let count: int = 0;
        try {
          for (let i: int = 0; i < concurrentNum; i++) {
            taskpool.execute(test_Global_test_039).then((res) => {
              expect(res as boolean).assertFalse();
              count++;
            }).catch((e: Error) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
              expect().assertFail();
            });
          }
          for (let i: int = 0; i < concurrentNum; i++) {
            const result = isNaN(-45.6);
            expect(result).assertFalse();
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail();
        }
        while (count < concurrentNum) {
          await sleep(100)
        }
        console.info(`${caseName} test end`);
        done()
      });

    /**
     * @tc.name   test_concurrent_Global_test_040
     * @tc.number SUB_CONCURRENT_GLOBAL_TEST_4000
     * @tc.desc   test_concurrent_Global_test_040
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_Global_test_040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_Global_test_040';
        console.info(`${caseName} test start`);
        let count: int = 0;
        try {
          for (let i: int = 0; i < concurrentNum; i++) {
            taskpool.execute(test_Global_test_040).then((res) => {
              expect(res as boolean).assertFalse();
              count++;
            }).catch((e: Error) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
              expect().assertFail();
            });
          }
          for (let i: int = 0; i < concurrentNum; i++) {
            const result = isNaN(0);
            expect(result).assertFalse();
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail();
        }
        while (count < concurrentNum) {
          await sleep(100)
        }
        console.info(`${caseName} test end`);
        done()
      });

    /**
     * @tc.name   test_concurrent_Global_test_041
     * @tc.number SUB_CONCURRENT_GLOBAL_TEST_4100
     * @tc.desc   test_concurrent_Global_test_041
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_Global_test_041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_Global_test_041';
        console.info(`${caseName} test start`);
        let count: int = 0;
        try {
          for (let i: int = 0; i < concurrentNum; i++) {
            taskpool.execute(test_Global_test_041).then((res) => {
              expect(res as boolean).assertFalse();
              count++;
            }).catch((e: Error) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
              expect().assertFail();
            });
          }
          for (let i: int = 0; i < concurrentNum; i++) {
            const result = isNaN(Infinity);
            expect(result).assertFalse();
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail();
        }
        while (count < concurrentNum) { await sleep(100) }
        console.info(`${caseName} test end`);
        done()
      });

    /**
     * @tc.name   test_concurrent_Global_test_042
     * @tc.number SUB_CONCURRENT_GLOBAL_TEST_4200
     * @tc.desc   test_concurrent_Global_test_042
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_Global_test_042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_Global_test_042';
        console.info(`${caseName} test start`);
        let count: int = 0;
        try {
          for (let i: int = 0; i < concurrentNum; i++) {
            taskpool.execute(test_Global_test_042).then((res) => {
              expect(res as boolean).assertFalse();
              count++;
            }).catch((e: Error) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
              expect().assertFail();
            });
          }
          for (let i: int = 0; i < concurrentNum; i++) {
            const result = isNaN(-Infinity);
            expect(result).assertFalse();
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail();
        }
        while (count < concurrentNum) { await sleep(100) }
        console.info(`${caseName} test end`);
        done()
      });

    /**
     * @tc.name   test_concurrent_Global_test_043
     * @tc.number SUB_CONCURRENT_GLOBAL_TEST_4300
     * @tc.desc   test_concurrent_Global_test_043
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_Global_test_043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_Global_test_043';
        console.info(`${caseName} test start`);
        let count: int = 0;
        try {
          for (let i: int = 0; i < concurrentNum; i++) {
            taskpool.execute(test_Global_test_043).then((res) => {
              expect(res as boolean).assertFalse();
              count++;
            }).catch((e: Error) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
              expect().assertFail();
            });
          }
          for (let i: int = 0; i < concurrentNum; i++) {
            const result = isNaN(Number.MAX_VALUE);
            expect(result).assertFalse();
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail();
        }
        while (count < concurrentNum) { await sleep(100) }
        console.info(`${caseName} test end`);
        done()
      });

    /**
     * @tc.name   test_concurrent_Global_test_044
     * @tc.number SUB_CONCURRENT_GLOBAL_TEST_4400
     * @tc.desc   test_concurrent_Global_test_044
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_Global_test_044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_Global_test_044';
        console.info(`${caseName} test start`);
        let count: int = 0;
        try {
          for (let i: int = 0; i < concurrentNum; i++) {
            taskpool.execute(test_Global_test_044).then((res) => {
              expect(res as boolean).assertFalse();
              count++;
            }).catch((e: Error) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
              expect().assertFail();
            });
          }
          for (let i: int = 0; i < concurrentNum; i++) {
            const result = isNaN(Number.MIN_VALUE);
            expect(result).assertFalse();
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail();
        }
        while (count < concurrentNum) { await sleep(100) }
        console.info(`${caseName} test end`);
        done()
      });

    /**
     * @tc.name   test_concurrent_Global_test_045
     * @tc.number SUB_CONCURRENT_GLOBAL_TEST_4500
     * @tc.desc   test_concurrent_Global_test_045
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_Global_test_045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_Global_test_045';
        console.info(`${caseName} test start`);
        let count: int = 0;
        try {
          for (let i: int = 0; i < concurrentNum; i++) {
            taskpool.execute(test_Global_test_045).then((res) => {
              expect(res as boolean).assertFalse();
              count++;
            }).catch((e: Error) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
              expect().assertFail();
            });
          }
          for (let i: int = 0; i < concurrentNum; i++) {
            const result = isNaN(Number.EPSILON);
            expect(result).assertFalse();
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail();
        }
        while (count < concurrentNum) { await sleep(100) }
        console.info(`${caseName} test end`);
        done()
      });

    /**
     * @tc.name   test_concurrent_Global_test_046
     * @tc.number SUB_CONCURRENT_GLOBAL_TEST_4600
     * @tc.desc   test_concurrent_Global_test_046
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_Global_test_046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_Global_test_046';
        console.info(`${caseName} test start`);
        let count: int = 0;
        try {
          for (let i: int = 0; i < concurrentNum; i++) {
            taskpool.execute(test_Global_test_046).then((res) => {
              expect(res as boolean).assertFalse();
              count++;
            }).catch((e: Error) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
              expect().assertFail();
            });
          }
          for (let i: int = 0; i < concurrentNum; i++) {
            const result = isNaN(Number.NEGATIVE_INFINITY);
            expect(result).assertFalse();
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail();
        }
        while (count < concurrentNum) { await sleep(100) }
        console.info(`${caseName} test end`);
        done()
      });

    /**
     * @tc.name   test_concurrent_Global_test_047
     * @tc.number SUB_CONCURRENT_GLOBAL_TEST_4700
     * @tc.desc   test_concurrent_Global_test_047
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_Global_test_047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_Global_test_047';
        console.info(`${caseName} test start`);
        let count: int = 0;
        try {
          for (let i: int = 0; i < concurrentNum; i++) {
            taskpool.execute(test_Global_test_047).then((res) => {
              expect(res as boolean).assertFalse();
              count++;
            }).catch((e: Error) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
              expect().assertFail();
            });
          }
          for (let i: int = 0; i < concurrentNum; i++) {
            const result = isNaN(Number.POSITIVE_INFINITY);
            expect(result).assertFalse();
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail();
        }
        while (count < concurrentNum) { await sleep(100) }
        console.info(`${caseName} test end`);
        done()
      });

    /**
     * @tc.name   test_concurrent_Global_test_048
     * @tc.number SUB_CONCURRENT_GLOBAL_TEST_4800
     * @tc.desc   test_concurrent_Global_test_048
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_Global_test_048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_Global_test_048';
        console.info(`${caseName} test start`);
        let count: int = 0;
        try {
          for (let i: int = 0; i < concurrentNum; i++) {
            taskpool.execute(test_Global_test_048).then((res) => {
              expect(res as boolean).assertTrue();
              count++;
            }).catch((e: Error) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
              expect().assertFail();
            });
          }
          for (let i: int = 0; i < concurrentNum; i++) {
            const result = isNaN(Number.NaN);
            expect(result).assertTrue();
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail();
        }
        while (count < concurrentNum) { await sleep(100) }
        console.info(`${caseName} test end`);
        done()
      });

    /**
     * @tc.name   test_concurrent_Global_test_049
     * @tc.number SUB_CONCURRENT_GLOBAL_TEST_4900
     * @tc.desc   test_concurrent_Global_test_049
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_Global_test_049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_Global_test_049';
        console.info(`${caseName} test start`);
        let count: int = 0;
        try {
          for (let i: int = 0; i < concurrentNum; i++) {
            taskpool.execute(test_Global_test_049).then((res) => {
              expect(res as boolean).assertTrue();
              count++;
            }).catch((e: Error) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
              expect().assertFail();
            });
          }
          for (let i: int = 0; i < concurrentNum; i++) {
            const result = isNaN(NaN);
            expect(result).assertTrue();
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail();
        }
        while (count < concurrentNum) { await sleep(100) }
        console.info(`${caseName} test end`);
        done()
      });

    /**
     * @tc.name   test_concurrent_Global_test_050
     * @tc.number SUB_CONCURRENT_GLOBAL_TEST_5000
     * @tc.desc   test_concurrent_Global_test_050
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_Global_test_050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_Global_test_050';
        console.info(`${caseName} test start`);
        let count: int = 0;
        try {
          for (let i: int = 0; i < concurrentNum; i++) {
            taskpool.execute(test_Global_test_050).then((_res) => {
              expect().assertFail();
              count++;
            }).catch((e: Error) => {
              expect(e.message).assertContain("DecodeURI: invalid chara");
              count++;
            });
          }
          for (let i: int = 0; i < concurrentNum; i++) {
            try {
              const _r = encodeURI("\ud83d");
              expect().assertFail();
            } catch (err) {
              expect((err as BusinessError).message).assertContain("DecodeURI: invalid chara");
            }
          }
        } catch (e) {
          console.info(`${caseName} Unexpected failure: ${e.message}, code: ${e.code}`);
          expect().assertFail();
        }
        while (count < concurrentNum) { await sleep(100) }
        console.info(`${caseName} test end`);
        done()
      });

    /**
     * @tc.name   test_concurrent_Global_test_051
     * @tc.number SUB_CONCURRENT_GLOBAL_TEST_5100
     * @tc.desc   test_concurrent_Global_test_051
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_Global_test_051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_Global_test_051';
        console.info(`${caseName} test start`);
        let count: int = 0;
        try {
          for (let i: int = 0; i < concurrentNum; i++) {
            taskpool.execute(test_Global_test_051).then((_res) => {
              expect().assertFail();
              count++;
            }).catch((e: Error) => {
              expect(e.message).assertContain("DecodeURI: invalid chara");
              count++;
            });
          }
          for (let i: int = 0; i < concurrentNum; i++) {
            try {
              const _r = encodeURIComponent("\ud83d");
              expect().assertFail();
            } catch (err) {
              expect((err as BusinessError).message).assertContain("DecodeURI: invalid chara");
            }
          }
        } catch (e) {
          console.info(`${caseName} Unexpected failure: ${e.message}, code: ${e.code}`);
          expect().assertFail();
        }
        while (count < concurrentNum) { await sleep(100) }
        console.info(`${caseName} test end`);
        done()
      });
  })
}