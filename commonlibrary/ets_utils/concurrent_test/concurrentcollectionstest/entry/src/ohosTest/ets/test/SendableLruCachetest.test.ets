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
import { ArkTSUtils, collections, taskpool,HashMap, HashSet } from '@kit.ArkTS';
import { lang } from '@kit.ArkTS';
import type { BusinessError } from '@ohos.base';
import {
  test_sendable_0100,
  test_sendable_0200,
  test_sendable_0300,
  test_sendable_0500,
  test_sendable_0600,
  test_sendable_0700,
  test_sendable_0800,
  test_sendable_0900,
  test_sendable_1000,
  test_sendable_1400,
  test_sendable_1600,
  test_sendable_1700,
  test_sendable_1800,
} from '../testability/pages/Sendablefunction';

export function sleep(time: number): Promise<void> {
  return new Promise((re, je) => {
    setTimeout(() => {
      re()
    }, time)
  })
}

let concurrentNum = 100
let arrCount = 1000

function getsendablepro(): ArkTSUtils.SendableLruCache<number, number> {
  let pro = new ArkTSUtils.SendableLruCache<number, number>();
  for (let i = 9999; i < 9999 + arrCount; i++) {
    pro.put(i + 1, 1);
  }
  return pro
}

function getInitArray(): collections.Array<string> {
  let arr = new  collections.Array<string>()
  for (let i = 9999; i < 9999 + arrCount; i++) {
    arr.push('i')
  }
  return arr
}
export default function SendableTest() {
  describe('SendableTest', () => {
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
     * @tc.name   test_sendable_0100
     * @tc.number SUB_SENDABLELRUCACHE_TEST_0100
     * @tc.desc   SendableLruCache
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_sendable_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_sendable_0100';
        console.info(`${caseName} test start`);
        let arr = getsendablepro()
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_sendable_0100, arr, caseName, i)
          }
          await taskpool.execute(group).then(() => {
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${arr}`)
          console.info(`${caseName} Task result: ${arr.length}`);
          expect(arr.length).assertEqual(66);
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail();
        }
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   test_sendable_0200
     * @tc.number SUB_SENDABLELRUCACHE_TEST_0200
     * @tc.desc   SendableLruCache
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_sendable_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_sendable_0200';
        console.info(`${caseName} test start`);
        let arr = getsendablepro()
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_sendable_0200, arr, caseName, i)
          }
          await taskpool.execute(group).then(() => {
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${arr}`)
          console.info(`${caseName} Task result: ${arr.length}`);
          expect(arr.toString()).assertContain('hits = 99');
          expect(arr.length).assertEqual(50);
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   test_sendable_0300
     * @tc.number SUB_SENDABLELRUCACHE_TEST_0300
     * @tc.desc   SendableLruCache
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_sendable_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_sendable_0300';
        console.info(`${caseName} test start`);
        let flag: Boolean = false;
        let arr = getsendablepro()
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_sendable_0300, arr, caseName, i)
          }
          await taskpool.execute(group).then(() => {
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch1: ${e.message}, code: ${e.code}`);
            expect(e.message).assertContain('The type of 0 must be small integer')
            flag = true;
          })
        } catch (e) {
          console.info(`${caseName} Task execution failed with error2: ${e.message}, code: ${e.code}`);
          flag = true;
        }
        expect(flag).assertTrue()
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   test_sendable_0500
     * @tc.number SUB_SENDABLELRUCACHE_TEST_0500
     * @tc.desc   SendableLruCache
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_sendable_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_sendable_0500';
        console.info(`${caseName} test start`);
        let arr = getsendablepro()
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_sendable_0500, arr, caseName, i)
          }
          await taskpool.execute(group).then(() => {
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch1: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${arr}`)
          console.info(`${caseName} Task result: ${arr.length}`);
          expect(arr.length).assertEqual(0);
        } catch (e) {
          console.info(`${caseName} Task execution failed with error2: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })
    
    /**
     * @tc.name   test_sendable_0600
     * @tc.number SUB_SENDABLELRUCACHE_TEST_0600
     * @tc.desc   SendableLruCache
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_sendable_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_sendable_0600';
        console.info(`${caseName} test start`);
        let arr = getsendablepro()
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_sendable_0600, arr, caseName, i)
          }
          await taskpool.execute(group).then(() => {
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch1: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${arr}`)
          console.info(`${caseName} Task result: ${arr.length}`);
          expect(arr.toString()).assertContain('maxSize = 364');
        } catch (e) {
          console.info(`${caseName} Task execution failed with error2: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   test_sendable_0700
     * @tc.number SUB_SENDABLELRUCACHE_TEST_0700
     * @tc.desc   SendableLruCache
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_sendable_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_sendable_0700';
        console.info(`${caseName} test start`);
        let arr = getsendablepro()
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_sendable_0700, arr, caseName, i)
          }
          await taskpool.execute(group).then(() => {
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch1: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${arr}`)
          console.info(`${caseName} Task result: ${arr.length}`);
          let result = arr.getMissCount();
          expect(result).assertEqual(600);
        } catch (e) {
          console.info(`${caseName} Task execution failed with error2: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })
    
    /**
     * @tc.name   test_sendable_0800
     * @tc.number SUB_SENDABLELRUCACHE_TEST_0800
     * @tc.desc   SendableLruCache
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_sendable_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_sendable_0800';
        console.info(`${caseName} test start`);
        let arr = getsendablepro()
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_sendable_0800, arr, caseName, i)
          }
          await taskpool.execute(group).then(() => {
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch1: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${arr}`)
          console.info(`${caseName} Task result: ${arr.length}`);
          let result1 = arr.getRemoveCount();
          expect(result1).assertEqual(938);
        } catch (e) {
          console.info(`${caseName} Task execution failed with error2: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   test_sendable_0900
     * @tc.number SUB_SENDABLELRUCACHE_TEST_0900
     * @tc.desc   SendableLruCache
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_sendable_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_sendable_0900';
        console.info(`${caseName} test start`);
        let arr = getsendablepro()
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_sendable_0900, arr, caseName, i)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch1: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${arr}`)
          console.info(`${caseName} Task result: ${arr.length}`);
          let result = arr.getMatchCount();
          expect(result).assertEqual(300);
        } catch (e) {
          console.info(`${caseName} Task execution failed with error2: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   test_sendable_1000
     * @tc.number SUB_SENDABLELRUCACHE_TEST_1000
     * @tc.desc   SendableLruCache
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_sendable_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_sendable_1000';
        console.info(`${caseName} test start`);
        let arr = getsendablepro()
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_sendable_0900, arr, caseName, i)
          }
          await taskpool.execute(group).then(() => {
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch1: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${arr}`)
          console.info(`${caseName} Task result: ${arr.length}`);
          let result = arr.getPutCount();
          expect(result).assertEqual(1300);
        } catch (e) {
          console.info(`${caseName} Task execution failed with error2: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   test_sendable_1100
     * @tc.number SUB_SENDABLELRUCACHE_TEST_1100
     * @tc.desc   SendableLruCache
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_sendable_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_sendable_1100';
        console.info(`${caseName} test start`);
        let arr = getsendablepro()
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_sendable_0900, arr, caseName, i)
          }
          await taskpool.execute(group).then(() => {
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch1: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${arr}`)
          console.info(`${caseName} Task result: ${arr.length}`);
          let result = arr.isEmpty();
          expect(result).assertFalse();
        } catch (e) {
          console.info(`${caseName} Task execution failed with error2: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   test_sendable_1200
     * @tc.number SUB_SENDABLELRUCACHE_TEST_1200
     * @tc.desc   SendableLruCache
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_sendable_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_sendable_1200';
        console.info(`${caseName} test start`);
        let arr = getsendablepro()
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_sendable_1000, arr, caseName, i)
          }
          await taskpool.execute(group).then(() => {
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch1: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${arr}`)
          console.info(`${caseName} Task result: ${arr.length}`);
          let result = arr.values();
          console.info('result = ' + result);
          expect(result.length).assertEqual(64);
          expect(result).assertContain(99);
        } catch (e) {
          console.info(`${caseName} Task execution failed with error2: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   test_sendable_1300
     * @tc.number SUB_SENDABLELRUCACHE_TEST_1300
     * @tc.desc   SendableLruCache
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_sendable_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_sendable_1300';
        console.info(`${caseName} test start`);
        let arr = getsendablepro()
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_sendable_1000, arr, caseName, i)
          }
          await taskpool.execute(group).then(() => {
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch1: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${arr}`)
          console.info(`${caseName} Task result: ${arr.length}`);
          let result = arr.keys();
          console.info('result = ' + result);
          expect(result.length).assertEqual(64);
          expect(result).assertContain(99);
        } catch (e) {
          console.info(`${caseName} Task execution failed with error2: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   test_sendable_1400
     * @tc.number SUB_SENDABLELRUCACHE_TEST_1400
     * @tc.desc   SendableLruCache
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_sendable_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_sendable_1400';
        console.info(`${caseName} test start`);
        let arr = getsendablepro()
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_sendable_1400, arr, caseName, i)
          }
          await taskpool.execute(group).then(() => {
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch1: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${arr}`)
          console.info(`${caseName} Task result: ${arr.length}`);
          expect(arr.length).assertEqual(63);
        } catch (e) {
          console.info(`${caseName} Task execution failed with error2: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   test_sendable_1500
     * @tc.number SUB_SENDABLELRUCACHE_TEST_1500
     * @tc.desc   SendableLruCache
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_sendable_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_sendable_1500';
        console.info(`${caseName} test start`);
        let arr = getsendablepro()
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_sendable_1000, arr, caseName, i)
          }
          await taskpool.execute(group).then(() => {
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch1: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${arr}`)
          console.info(`${caseName} Task result: ${arr.length}`);
          let result = arr.contains(99);
          expect(result).assertTrue()
        } catch (e) {
          console.info(`${caseName} Task execution failed with error2: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   test_sendable_1600
     * @tc.number SUB_SENDABLELRUCACHE_TEST_1600
     * @tc.desc   SendableLruCache
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_sendable_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_sendable_1600';
        console.info(`${caseName} test start`);
        let arr = getsendablepro()
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_sendable_1600, arr, caseName, i)
          }
          await taskpool.execute(group).then(() => {
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch1: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${arr}`)
          console.info(`${caseName} Task result: ${arr.length}`);
          expect(arr.length).assertEqual(163)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error2: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   test_sendable_1700
     * @tc.number SUB_SENDABLELRUCACHE_TEST_1700
     * @tc.desc   SendableLruCache
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_sendable_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_sendable_1700';
        console.info(`${caseName} test start`);
        let sendableMap = new collections.Map<string, string>();
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_sendable_1700, sendableMap, caseName, i)
          }
          await taskpool.execute(group).then(() => {
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch1: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          let obj = ArkTSUtils.ASON.stringify(sendableMap);
          console.info(`${caseName} Task result: ${obj}`)
          expect(obj.toString()).assertContain('99')
        } catch (e) {
          console.info(`${caseName} Task execution failed with error2: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   test_sendable_1800
     * @tc.number SUB_SENDABLELRUCACHE_TEST_1800
     * @tc.desc   SendableLruCache
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_sendable_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_sendable_1800';
        console.info(`${caseName} test start`);
        let sendableMap = new collections.Map<string,string>();
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_sendable_1800, sendableMap, caseName, i)
          }
          await taskpool.execute(group).then(() => {
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch1: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })

          expect(sendableMap.size).assertEqual(103)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error2: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })
  })
}