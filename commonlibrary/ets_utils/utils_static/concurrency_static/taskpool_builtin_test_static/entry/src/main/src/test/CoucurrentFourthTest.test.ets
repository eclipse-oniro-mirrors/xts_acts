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
import { testRegExpToString1,
  testRegExpTest1,
  testRegExpConstructor1,
  testRegExpInstanceDotAll1,
  testBigIntValueOf1,
  testUndefinedLiteral1,
  testBigIntToString1,
  testBigIntToLocaleString1,
  testStringPadEnd1,
  testStringStartsWith1,
} from '../testability/pages/taskpool4';

import {sleep} from '../testability/pages/utils'

let concurrentNum: int = 100


export default function supplyTest() {
  describe('supplyTest', () => {
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
     * @tc.name   test_concurrent_builtins_regexp_tostring_001
     * @tc.number SUB_CONCURRENT_BUILTINS_FORTH_TEST_0100
     * @tc.desc   test RegExp.prototype.toString in concurrent taskpool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_concurrent_builtins_regexp_tostring_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_builtins_regexp_tostring_001';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testRegExpToString1)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${result}`);
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   test_concurrent_builtins_regexp_test_001
     * @tc.number SUB_CONCURRENT_BUILTINS_FORTH_TEST_0200
     * @tc.desc   test RegExp.prototype.test in concurrent taskpool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_concurrent_builtins_regexp_test_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_builtins_regexp_test_001';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testRegExpTest1)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${result}`);
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   test_concurrent_builtins_regexp_instance_dotall_001
     * @tc.number SUB_CONCURRENT_BUILTINS_FORTH_TEST_0800
     * @tc.desc   test RegExp instance property dotAll
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_concurrent_builtins_regexp_instance_dotall_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_builtins_regexp_instance_dotall_001';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testRegExpInstanceDotAll1)
          }
          await taskpool.execute(group).then((res) => {
            result = res.length
          }).catch((e: Error) => {
            expect().assertFail()
          })
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   test_concurrent_builtins_regexp_constructor_001
     * @tc.number SUB_CONCURRENT_BUILTINS_FORTH_TEST_0900
     * @tc.desc   test RegExp constructor with flags
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_concurrent_builtins_regexp_constructor_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_builtins_regexp_constructor_001';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testRegExpConstructor1)
          }
          await taskpool.execute(group).then((res) => {
            result = res.length
          }).catch((e: Error) => {
            expect().assertFail()
          })
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })


    /**
     * @tc.name   test_concurrent_builtins_bigint_valueof_001
     * @tc.number SUB_CONCURRENT_BUILTINS_FORTH_TEST_1100
     * @tc.desc   并发验证 BigInt 对象 valueOf 返回原始值
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_concurrent_builtins_bigint_valueof_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_builtins_bigint_valueof_001';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testBigIntValueOf1)
          }
          await taskpool.execute(group).then((res) => {
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   test_concurrent_builtins_undefined_literal_001
     * @tc.number SUB_CONCURRENT_BUILTINS_FORTH_TEST_1200
     * @tc.desc   并发验证 undefined 字面量
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_concurrent_builtins_undefined_literal_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_builtins_undefined_literal_001';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testUndefinedLiteral1)
          }
          await taskpool.execute(group).then((res) => {
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   test_concurrent_builtins_bigint_tostring_001
     * @tc.number SUB_CONCURRENT_BUILTINS_FORTH_TEST_1300
     * @tc.desc   并发验证 BigInt.prototype.toString 基本用例
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_concurrent_builtins_bigint_tostring_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_builtins_bigint_tostring_001';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testBigIntToString1)
          }
          await taskpool.execute(group).then((res) => {
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   test_concurrent_builtins_bigint_tolocalestring_001
     * @tc.number SUB_CONCURRENT_BUILTINS_FORTH_TEST_1301
     * @tc.desc   并发验证 BigInt.prototype.toLocaleString 基本用例（en-US）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_concurrent_builtins_bigint_tolocalestring_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_builtins_bigint_tolocalestring_001';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testBigIntToLocaleString1)
          }
          await taskpool.execute(group).then((res) => {
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })


    /**
     * @tc.name   test_concurrent_builtins_string_padend_001
     * @tc.number SUB_CONCURRENT_BUILTINS_FORTH_TEST_1500
     * @tc.desc   并发验证 String.prototype.padEnd 基本用例
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_concurrent_builtins_string_padend_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_builtins_string_padend_001';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testStringPadEnd1)
          }
          await taskpool.execute(group).then((res) => {
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   test_concurrent_builtins_string_startswith_001
     * @tc.number SUB_CONCURRENT_BUILTINS_FORTH_TEST_1600
     * @tc.desc   并发验证 String.prototype.startsWith 基本用例
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_concurrent_builtins_string_startswith_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_builtins_string_startswith_001';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testStringStartsWith1)
          }
          await taskpool.execute(group).then((res) => {
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })

  })
}