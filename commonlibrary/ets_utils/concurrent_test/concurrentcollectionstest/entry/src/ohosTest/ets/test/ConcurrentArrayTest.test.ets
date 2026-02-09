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
import { collections, taskpool} from '@kit.ArkTS';
import type { BusinessError } from '@ohos.base';
import { test_array_001, test_array_002, test_array_003, test_array_004,
  test_array_005,test_array_006,test_array_007,test_array_008,test_array_009,
  test_array_010,test_array_011,test_array_012,test_array_013,test_array_014,
  test_array_015,test_array_016,test_array_017,test_array_018,test_array_019,
  test_array_020,test_array_021,test_array_022,test_array_023,test_array_024,
  test_array_025,test_array_026,test_array_027,test_array_028,test_array_029,
  test_array_030,test_array_031,test_array_032,test_array_033,test_array_034,
  test_array_035,test_array_036,
  test_array_037,
  test_array_038,
  test_array_039,
  test_array_040} from '../testability/pages/taskpool';

let concurrentNum = 100
let arrCount = 1000

function getInitArray1(): collections.Array<number> {
  let arr = new  collections.Array<number>()
  for (let i = 9999; i < 9999 + arrCount; i++) {
    arr.push(i)
  }
  return arr
}

function getInitArray2(): collections.Array<number> {
  let arr = new collections.Array<number>(1, 2, 3, 4);
  return arr
}

function getInitArray3(): collections.Array<number> {
  let arrayPara  = [1,2,3,4];
  let arr = new collections.Array<number>(...arrayPara);
  return arr
}

function getInitArray4(): collections.Array<number> {
  let arr = collections.Array.create<number>(4, 10);
  return arr
}

function getInitArray5(): collections.Array<number> {
  let array : Array<number> = [1,2,3,4];
  let arr = collections.Array.from<number>(array);
  return arr
}

function getInitArray6(): collections.Array<number> {
  const mapper = new Map([
    ['1', 1],
    ['2', 2],
    ['3', 3],
    ['4', 4],
  ]);
  let arr: collections.Array<number> = collections.Array.from(mapper.values());
  return arr
}

function getInitArray7(): collections.Array<number> {
  let array : Array<number> = [1, 2, 3];
  let arr = collections.Array.from<number>(array, (value, index) => value + index);
  return arr
}

function getInitArray8(): collections.Array<string> {
  let array : Array<number> = [1, 2, 3];
  let arr = collections.Array.from<number, string>(array, (value, index) => value + "." + index);
  return arr
}

function getInitArray9(): collections.Array<string> {
  let arr: collections.Array<string> = collections.Array.of('a', 'b', 'c', 'd');
  return arr
}

function getInitArray10(): collections.Array<number> {
  let array: collections.Array<number> = collections.Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
  let copied: collections.Array<number> = array.copyWithin(3, 1, 3);
  console.info(copied.toString());
  return copied
}

export function sleep(time: number): Promise<void> {
  return new Promise((re, je) => {
    setTimeout(() => {
      re()
    }, time)
  })
}

export default function ArrayTest() {
  describe('ArrayTest', () => {
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
     * @tc.name   test_concurrent_array_001
     * @tc.number SUB_CONCURRENT_ARRAY_TEST_0100
     * @tc.desc   test_concurrent_array_001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_array_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_array_001';
        console.info(`${caseName} test start`);
        let arr = getInitArray1()
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_array_001, arr, caseName, i)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${arr.length}`);
          expect(arr.length).assertEqual(arrCount + concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   test_concurrent_array_002
     * @tc.number SUB_CONCURRENT_ARRAY_TEST_0200
     * @tc.desc   test_concurrent_array_002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_array_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_array_002';
        console.info(`${caseName} test start`);
        let arr = getInitArray2()
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_array_001, arr, caseName, i)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${arr.length}`);
          expect(arr.length).assertEqual(4 + concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   test_concurrent_array_003
     * @tc.number SUB_CONCURRENT_ARRAY_TEST_0300
     * @tc.desc   test_concurrent_array_003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_array_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_array_003';
        console.info(`${caseName} test start`);
        let arr = getInitArray3()
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_array_001, arr, caseName, i)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${arr.length}`);
          expect(arr.length).assertEqual(4 + concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   test_concurrent_array_004
     * @tc.number SUB_CONCURRENT_ARRAY_TEST_0400
     * @tc.desc   test_concurrent_array_004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_array_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_array_004';
        console.info(`${caseName} test start`);
        let arr = getInitArray4()
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_array_001, arr, caseName, i)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${arr.length}`);
          expect(arr.length).assertEqual(4 + concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   test_concurrent_array_005
     * @tc.number SUB_CONCURRENT_ARRAY_TEST_0500
     * @tc.desc   test_concurrent_array_005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_array_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_array_005';
        console.info(`${caseName} test start`);
        let arr = getInitArray5()
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_array_001, arr, caseName, i)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${arr.length}`);
          expect(arr.length).assertEqual(4 + concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   test_concurrent_array_006
     * @tc.number SUB_CONCURRENT_ARRAY_TEST_0600
     * @tc.desc   test_concurrent_array_006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_array_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_array_006';
        console.info(`${caseName} test start`);
        let arr = getInitArray6()
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_array_003, arr, caseName, i)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${arr.length}`);
          expect(arr.length).assertEqual(104)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   test_concurrent_array_007
     * @tc.number SUB_CONCURRENT_ARRAY_TEST_0700
     * @tc.desc   test_concurrent_array_007
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_array_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_array_007';
        console.info(`${caseName} test start`);
        let arr = getInitArray7()
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_array_003, arr, caseName, i)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${arr.length}`);
          expect(arr.length).assertEqual(103)
          expect(arr[0]).assertEqual(1)
          expect(arr[1]).assertEqual(3)
          expect(arr[2]).assertEqual(5)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   test_concurrent_array_008
     * @tc.number SUB_CONCURRENT_ARRAY_TEST_0800
     * @tc.desc   test_concurrent_array_008
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_array_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_array_008';
        console.info(`${caseName} test start`);
        let arr = getInitArray8()
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_array_004, arr, caseName, i+'')
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${arr.length}`);
          expect(arr.length).assertEqual(103)
          expect(arr[0]).assertEqual('1.0')
          expect(arr[1]).assertEqual('2.1')
          expect(arr[2]).assertEqual('3.2')
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   test_concurrent_array_009
     * @tc.number SUB_CONCURRENT_ARRAY_TEST_0900
     * @tc.desc   test_concurrent_array_009
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_array_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_array_009';
        console.info(`${caseName} test start`);
        let arr = getInitArray8()
        let count = 0;
        try {
          for (let i = 0; i < concurrentNum; i++) {
            taskpool.execute(test_array_005, arr, caseName, i+'').then((res) => {
              expect(res as boolean)
                .assertTrue()
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
              expect().assertFail()
            })
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }

        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   test_concurrent_array_010
     * @tc.number SUB_CONCURRENT_ARRAY_TEST_1000
     * @tc.desc   test_concurrent_array_010
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_array_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_array_010';
        console.info(`${caseName} test start`);
        let arr = getInitArray9()
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_array_004, arr, caseName, i+'')
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${arr.length}`);
          expect(arr.length).assertEqual(104)
          expect(arr[0]).assertEqual('a')
          expect(arr[1]).assertEqual('b')
          expect(arr[2]).assertEqual('c')
          expect(arr[3]).assertEqual('d')
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   test_concurrent_array_011
     * @tc.number SUB_CONCURRENT_ARRAY_TEST_1100
     * @tc.desc   test_concurrent_array_011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_array_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_array_011';
        console.info(`${caseName} test start`);
        let arr = getInitArray10()
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_array_003, arr, caseName, i)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${arr.length}`);
          expect(arr.length).assertEqual(108)
          expect(arr[0]).assertEqual(1)
          expect(arr[1]).assertEqual(2)
          expect(arr[2]).assertEqual(3)
          expect(arr[3]).assertEqual(2)
          expect(arr[4]).assertEqual(3)
          expect(arr[5]).assertEqual(6)
          expect(arr[6]).assertEqual(7)
          expect(arr[7]).assertEqual(8)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   test_concurrent_array_012
     * @tc.number SUB_CONCURRENT_ARRAY_TEST_1200
     * @tc.desc   test_concurrent_array_012
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_array_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_array_012';
        console.info(`${caseName} test start`);
        let arr = getInitArray9()
        let count = 0;
        try {
          for (let i = 0; i < concurrentNum; i++) {
            taskpool.execute(test_array_006, arr, caseName, i+'').then((res) => {
              expect(res as number)
                .assertEqual(0)
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
              expect().assertFail()
            })
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }

        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   test_concurrent_array_013
     * @tc.number SUB_CONCURRENT_ARRAY_TEST_1300
     * @tc.desc   test_concurrent_array_013
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_array_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_array_013';
        console.info(`${caseName} test start`);
        let arr = getInitArray10()
        let count = 0;
        try {
          for (let i = 0; i < concurrentNum; i++) {
            taskpool.execute(test_array_007, arr, caseName, i).then((res) => {
              expect(res as boolean)
                .assertFalse()
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
              expect().assertFail()
            })
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }

        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   test_concurrent_array_014
     * @tc.number SUB_CONCURRENT_ARRAY_TEST_1400
     * @tc.desc   test_concurrent_array_014
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_array_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_array_014';
        console.info(`${caseName} test start`);
        let arr = getInitArray10()
        let count = 0;
        try {
          for (let i = 0; i < concurrentNum; i++) {
            taskpool.execute(test_array_008, arr, caseName, i).then((res) => {
              expect(res as number)
                .assertEqual(32)
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
              expect().assertFail()
            })
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }

        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   test_concurrent_array_015
     * @tc.number SUB_CONCURRENT_ARRAY_TEST_1500
     * @tc.desc   test_concurrent_array_015
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_array_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_array_015';
        console.info(`${caseName} test start`);
        let arr = getInitArray10()
        let count = 0;
        try {
          for (let i = 0; i < concurrentNum; i++) {
            taskpool.execute(test_array_009, arr, caseName, i).then((res) => {
              expect(res as boolean)
                .assertEqual(32)
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
              expect().assertFail()
            })
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }

        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   test_concurrent_array_016
     * @tc.number SUB_CONCURRENT_ARRAY_TEST_1600
     * @tc.desc   test_concurrent_array_016
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_array_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_array_016';
        console.info(`${caseName} test start`);
        let arr = getInitArray10()
        let count = 0;
        try {
          for (let i = 0; i < concurrentNum; i++) {
            taskpool.execute(test_array_010, arr, caseName, i).then((res) => {
              expect(res as string)
                .assertEqual('1-2-3-2-3-6-7-8')
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
              expect().assertFail()
            })
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }

        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   test_concurrent_array_017
     * @tc.number SUB_CONCURRENT_ARRAY_TEST_1700
     * @tc.desc   test_concurrent_array_017
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_array_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_array_017';
        console.info(`${caseName} test start`);
        let arr = getInitArray2()
        let count = 0;
        try {
          for (let i = 0; i < concurrentNum; i++) {
            taskpool.execute(test_array_011, arr, caseName, i).then((res) => {
              expect(res as string)
                .assertEqual('1,2,3,4')
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
              expect().assertFail()
            })
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }

        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   test_concurrent_array_018
     * @tc.number SUB_CONCURRENT_ARRAY_TEST_1800
     * @tc.desc   test_concurrent_array_018
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_array_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_array_018';
        console.info(`${caseName} test start`);
        let arr = getInitArray2()
        let count = 0;
        try {
          for (let i = 0; i < concurrentNum; i++) {
            taskpool.execute(test_array_012, arr, caseName, i).then((res) => {
              expect(res as string)
                .assertEqual('2,3')
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
              expect().assertFail()
            })
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }

        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   test_concurrent_array_019
     * @tc.number SUB_CONCURRENT_ARRAY_TEST_1900
     * @tc.desc   test_concurrent_array_019
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_array_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_array_019';
        console.info(`${caseName} test start`);
        let arr = getInitArray2()
        let count = 0;
        try {
          for (let i = 0; i < concurrentNum; i++) {
            taskpool.execute(test_array_013, arr, caseName, i).then((res) => {
              expect(res as string)
                .assertEqual('4,3,2,1')
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
              expect().assertFail()
            })
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }

        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   test_concurrent_array_020
     * @tc.number SUB_CONCURRENT_ARRAY_TEST_2000
     * @tc.desc   test_concurrent_array_020
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_array_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_array_020';
        console.info(`${caseName} test start`);
        let arr = getInitArray2()
        let count = 0;
        try {
          for (let i = 0; i < concurrentNum; i++) {
            taskpool.execute(test_array_014, arr, caseName, i).then((res) => {
              expect(res as number)
                .assertEqual(1)
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
              expect().assertFail()
            })
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }

        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   test_concurrent_array_021
     * @tc.number SUB_CONCURRENT_ARRAY_TEST_2100
     * @tc.desc   test_concurrent_array_021
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_array_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_array_021';
        console.info(`${caseName} test start`);
        let arr = getInitArray2()
        let count = 0;
        try {
          for (let i = 0; i < concurrentNum; i++) {
            taskpool.execute(test_array_015, arr, caseName, i).then((res) => {
              expect(res as string)
                .assertEqual('forEach_completed')
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
              expect().assertFail()
            })
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }

        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   test_concurrent_array_022
     * @tc.number SUB_CONCURRENT_ARRAY_TEST_2200
     * @tc.desc   test_concurrent_array_022
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_array_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_array_022';
        console.info(`${caseName} test start`);
        let arr = getInitArray2()
        let count = 0;
        try {
          for (let i = 0; i < concurrentNum; i++) {
            taskpool.execute(test_array_016, arr, caseName, i).then((res) => {
              expect(res as string)
                .assertEqual('2,4,6,8')
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
              expect().assertFail()
            })
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }

        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   test_concurrent_array_023
     * @tc.number SUB_CONCURRENT_ARRAY_TEST_2300
     * @tc.desc   test_concurrent_array_023
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_array_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_array_023';
        console.info(`${caseName} test start`);
        let arr = getInitArray2()
        let count = 0;
        try {
          for (let i = 0; i < concurrentNum; i++) {
            taskpool.execute(test_array_017, arr, caseName, i).then((res) => {
              expect(res as string)
                .assertEqual('2,4')
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
              expect().assertFail()
            })
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }

        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   test_concurrent_array_024
     * @tc.number SUB_CONCURRENT_ARRAY_TEST_2400
     * @tc.desc   test_concurrent_array_024
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_array_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_array_024';
        console.info(`${caseName} test start`);
        let arr = getInitArray2()
        let count = 0;
        try {
          for (let i = 0; i < concurrentNum; i++) {
            taskpool.execute(test_array_018, arr, caseName, i).then((res) => {
              expect(res as number)
                .assertEqual(10)
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
              expect().assertFail()
            })
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }

        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   test_concurrent_array_025
     * @tc.number SUB_CONCURRENT_ARRAY_TEST_2500
     * @tc.desc   test_concurrent_array_025
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_array_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_array_025';
        console.info(`${caseName} test start`);
        let arr = getInitArray2()
        let count = 0;
        try {
          for (let i = 0; i < concurrentNum; i++) {
            taskpool.execute(test_array_019, arr, caseName, i).then((res) => {
              expect(res as number)
                .assertEqual(10)
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
              expect().assertFail()
            })
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }

        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   test_concurrent_array_026
     * @tc.number SUB_CONCURRENT_ARRAY_TEST_2600
     * @tc.desc   test_concurrent_array_026
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_array_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_array_026';
        console.info(`${caseName} test start`);
        let arr = getInitArray2()
        let count = 0;
        try {
          for (let i = 0; i < concurrentNum; i++) {
            taskpool.execute(test_array_020, arr, caseName, i).then((res) => {
              expect(res as number)
                .assertEqual(3)
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
              expect().assertFail()
            })
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }

        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   test_concurrent_array_027
     * @tc.number SUB_CONCURRENT_ARRAY_TEST_2700
     * @tc.desc   test_concurrent_array_027
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_array_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_array_027';
        console.info(`${caseName} test start`);
        let arr = getInitArray2()
        let count = 0;
        try {
          for (let i = 0; i < concurrentNum; i++) {
            taskpool.execute(test_array_021, arr, caseName, i).then((res) => {
              expect(res as string)
                .assertEqual('0,1')
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
              expect().assertFail()
            })
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }

        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   test_concurrent_array_028
     * @tc.number SUB_CONCURRENT_ARRAY_TEST_2800
     * @tc.desc   test_concurrent_array_028
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_array_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_array_028';
        console.info(`${caseName} test start`);
        let arr = getInitArray2()
        let count = 0;
        try {
          for (let i = 0; i < concurrentNum; i++) {
            taskpool.execute(test_array_022, arr, caseName, i).then((res) => {
              expect(res as string)
                .assertEqual('0')
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
              expect().assertFail()
            })
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }

        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   test_concurrent_array_029
     * @tc.number SUB_CONCURRENT_ARRAY_TEST_2900
     * @tc.desc   test_concurrent_array_029
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_array_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_array_029';
        console.info(`${caseName} test start`);
        let arr = getInitArray2()
        let count = 0;
        try {
          for (let i = 0; i < concurrentNum; i++) {
            taskpool.execute(test_array_023, arr, caseName, i).then((res) => {
              expect(res as string)
                .assertEqual('1')
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
              expect().assertFail()
            })
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }

        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   test_concurrent_array_030
     * @tc.number SUB_CONCURRENT_ARRAY_TEST_3000
     * @tc.desc   test_concurrent_array_030
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_array_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_array_030';
        console.info(`${caseName} test start`);
        let arr = getInitArray2()
        let count = 0;
        try {
          for (let i = 0; i < concurrentNum; i++) {
            taskpool.execute(test_array_024, arr, caseName, i).then((res) => {
              expect(res as number)
                .assertEqual(2)
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
              expect().assertFail()
            })
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }

        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   test_concurrent_array_031
     * @tc.number SUB_CONCURRENT_ARRAY_TEST_3100
     * @tc.desc   test_concurrent_array_031
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_array_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_array_031';
        console.info(`${caseName} test start`);
        let arr = getInitArray2()
        let count = 0;
        try {
          for (let i = 0; i < concurrentNum; i++) {
            taskpool.execute(test_array_025, arr, caseName, i).then((res) => {
              expect(res as boolean)
                .assertTrue()
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
              expect().assertFail()
            })
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }

        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   test_concurrent_array_032
     * @tc.number SUB_CONCURRENT_ARRAY_TEST_3200
     * @tc.desc   test_concurrent_array_032
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_array_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_array_032';
        console.info(`${caseName} test start`);
        let arr = getInitArray2()
        let count = 0;
        try {
          for (let i = 0; i < concurrentNum; i++) {
            taskpool.execute(test_array_026, arr, caseName, i).then((res) => {
              expect(res as number)
                .assertEqual(1)
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
              expect().assertFail()
            })
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }

        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   test_concurrent_array_033
     * @tc.number SUB_CONCURRENT_ARRAY_TEST_3300
     * @tc.desc   test_concurrent_array_033
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_array_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_array_033';
        console.info(`${caseName} test start`);
        let arr = getInitArray2()
        let count = 0;
        try {
          for (let i = 0; i < concurrentNum; i++) {
            taskpool.execute(test_array_027, arr, caseName, i).then((res) => {
              expect(res as string)
                .assertEqual('1,0,0,4')
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
              expect().assertFail()
            })
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }

        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   test_concurrent_array_034
     * @tc.number SUB_CONCURRENT_ARRAY_TEST_3400
     * @tc.desc   test_concurrent_array_034
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_array_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_array_034';
        console.info(`${caseName} test start`);
        let arr = getInitArray2()
        let count = 0;
        try {
          for (let i = 0; i < concurrentNum; i++) {
            taskpool.execute(test_array_028, arr, caseName, i).then((res) => {
              expect(res as string)
                .assertEqual('1')
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
              expect().assertFail()
            })
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }

        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   test_concurrent_array_035
     * @tc.number SUB_CONCURRENT_ARRAY_TEST_3500
     * @tc.desc   test_concurrent_array_035
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_array_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_array_035';
        console.info(`${caseName} test start`);
        let arr = getInitArray2()
        let count = 0;
        try {
          for (let i = 0; i < concurrentNum; i++) {
            taskpool.execute(test_array_029, arr, caseName, i).then((res) => {
              expect(res as string)
                .assertEqual('1,2,3,4,10,10')
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
              expect().assertFail()
            })
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }

        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   test_concurrent_array_036
     * @tc.number SUB_CONCURRENT_ARRAY_TEST_3600
     * @tc.desc   test_concurrent_array_036
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_array_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_array_036';
        console.info(`${caseName} test start`);
        let arr = getInitArray2()
        let count = 0;
        try {
          for (let i = 0; i < concurrentNum; i++) {
            taskpool.execute(test_array_030, arr, caseName, i).then((res) => {
              expect(res as string)
                .assertEqual('1,2,3,4,5,6,7,8')
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
              expect().assertFail()
            })
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }

        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   test_concurrent_array_037
     * @tc.number SUB_CONCURRENT_ARRAY_TEST_3700
     * @tc.desc   test_concurrent_array_037
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_array_037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_array_037';
        console.info(`${caseName} test start`);
        let arr = getInitArray1()
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_array_031, arr, caseName, i)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${arr.length}`);
          expect(arr.length).assertEqual(arrCount - concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   test_concurrent_array_038
     * @tc.number SUB_CONCURRENT_ARRAY_TEST_3800
     * @tc.desc   test_concurrent_array_038
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_array_038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_array_038';
        console.info(`${caseName} test start`);
        let arr = getInitArray2()
        let count = 0;
        try {
          for (let i = 0; i < concurrentNum; i++) {
            taskpool.execute(test_array_032, arr, caseName, i).then((res) => {
              expect(res as boolean)
                .assertTrue()
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
              expect().assertFail()
            })
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }

        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   test_concurrent_array_039
     * @tc.number SUB_CONCURRENT_ARRAY_TEST_3900
     * @tc.desc   test_concurrent_array_039
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_array_039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_array_039';
        console.info(`${caseName} test start`);
        let arr = getInitArray2()
        let count = 0;
        try {
          for (let i = 0; i < concurrentNum; i++) {
            taskpool.execute(test_array_033, arr, caseName, i).then((res) => {
              expect(res as string)
                .assertEqual('1,2,3,4')
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
              expect().assertFail()
            })
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }

        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   test_concurrent_array_040
     * @tc.number SUB_CONCURRENT_ARRAY_TEST_4000
     * @tc.desc   test_concurrent_array_040
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_array_040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_array_040';
        console.info(`${caseName} test start`);
        let arr = getInitArray1()
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_array_034, arr, caseName, i)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${arr.length}`);
          expect(arr.length).assertEqual(arrCount - 2*concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   test_concurrent_array_041
     * @tc.number SUB_CONCURRENT_ARRAY_TEST_4100
     * @tc.desc   test_concurrent_array_041
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_array_041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_array_041';
        console.info(`${caseName} test start`);
        let arr = getInitArray1()
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_array_035, arr, caseName, i)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${arr.length}`);
          expect(arr.length).assertEqual(arrCount + concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   test_concurrent_array_042
     * @tc.number SUB_CONCURRENT_ARRAY_TEST_4200
     * @tc.desc   test_concurrent_array_042
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_array_042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_array_042';
        console.info(`${caseName} test start`);
        let arr = getInitArray2()
        let count = 0;
        try {
          for (let i = 0; i < concurrentNum; i++) {
            taskpool.execute(test_array_036, arr, caseName, i).then((res) => {
              expect(res as number)
                .assertEqual(2)
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
              expect().assertFail()
            })
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }

        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   test_concurrent_array_043
     * @tc.number SUB_CONCURRENT_ARRAY_TEST_4300
     * @tc.desc   test_concurrent_array_043 - test ConcatArray index access
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_array_043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_array_043';
        console.info(`${caseName} test start`);
        let arr : collections.ConcatArray<number> = new collections.Array<number>(1, 2, 4);
        let count = 0;
        try {
          for (let i = 0; i < concurrentNum; i++) {
            taskpool.execute(test_array_037, arr, caseName, i).then((res) => {
              expect(res as number)
                .assertEqual(2)
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
              expect().assertFail()
            })
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }

        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   test_concurrent_array_044
     * @tc.number SUB_CONCURRENT_ARRAY_TEST_4400
     * @tc.desc   test_concurrent_array_044 - test ConcatArray join method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_array_044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_array_044';
        console.info(`${caseName} test start`);
        let arr : collections.ConcatArray<number> = new collections.Array<number>(1, 2, 4);
        let count = 0;
        try {
          for (let i = 0; i < concurrentNum; i++) {
            taskpool.execute(test_array_038, arr, caseName, i).then((res) => {
              expect(res as string)
                .assertEqual('1-2-4')
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
              expect().assertFail()
            })
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }

        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   test_concurrent_array_045
     * @tc.number SUB_CONCURRENT_ARRAY_TEST_4500
     * @tc.desc   test_concurrent_array_045 - test ConcatArray slice method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_array_045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_array_045';
        console.info(`${caseName} test start`);
        let arr : collections.ConcatArray<number> = new collections.Array<number>(1, 2, 3,4,5);
        let count = 0;
        try {
          for (let i = 0; i < concurrentNum; i++) {
            taskpool.execute(test_array_039, arr, caseName, i).then((res) => {
              expect(res as string)
                .assertEqual('2,3')
              expect(arr.length).assertEqual(5)
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
              expect().assertFail()
            })
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }

        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   test_concurrent_array_046
     * @tc.number SUB_CONCURRENT_ARRAY_TEST_4600
     * @tc.desc   test_concurrent_array_046
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_array_046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_array_046';
        console.info(`${caseName} test start`);
        let arr: collections.ArrayBuffer = new collections.ArrayBuffer(10);
        let count = 0;
        try {
          for (let i = 0; i < concurrentNum; i++) {
            taskpool.execute(test_array_040, arr, caseName, i).then((res) => {
              expect(res as number)
                .assertEqual(4)
              expect(arr.byteLength).assertEqual(10)
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
              expect().assertFail()
            })
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }

        console.info(`${caseName} test end`);
        done()
      })
})
}