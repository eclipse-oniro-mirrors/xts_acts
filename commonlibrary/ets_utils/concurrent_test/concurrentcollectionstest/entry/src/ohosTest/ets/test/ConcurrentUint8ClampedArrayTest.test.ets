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
import { collections, taskpool } from '@kit.ArkTS';
import {
  test_uint8ClampedArray_001,
  test_uint8ClampedArray_002,
  test_uint8ClampedArray_003,
  test_uint8ClampedArray_004,
  test_uint8ClampedArray_005,
  test_uint8ClampedArray_006,
  test_uint8ClampedArray_007,
  test_uint8ClampedArray_008,
  test_uint8ClampedArray_009,
  test_uint8ClampedArray_010,
  test_uint8ClampedArray_011,
  test_uint8ClampedArray_012,
  test_uint8ClampedArray_013,
  test_uint8ClampedArray_014,
  test_uint8ClampedArray_015,
  test_uint8ClampedArray_016,
  test_uint8ClampedArray_017,
  test_uint8ClampedArray_018,
  test_uint8ClampedArray_019,
  test_uint8ClampedArray_020,
  test_uint8ClampedArray_021,
  test_uint8ClampedArray_022,
  test_uint8ClampedArray_023,
  test_uint8ClampedArray_024,
  test_uint8ClampedArray_025,
  test_uint8ClampedArray_026,
  test_uint8ClampedArray_027} from '../testability/pages/taskpool2';
import { BusinessError } from '@kit.BasicServicesKit';

let concurrentNum = 100

function getInitUint8ClampedArray1(): collections.Uint8ClampedArray {
  let uint8ClampedArray = new collections.Uint8ClampedArray(1000);
  for (let i = 0; i < 1000; i++) {
    uint8ClampedArray[i] = (i % 256);
  }
  return uint8ClampedArray;
}

function getInitUint8ClampedArray2(): collections.Uint8ClampedArray {
  let uint8ClampedArray = new collections.Uint8ClampedArray([1, 2, 3, 4]);
  return uint8ClampedArray;
}

function getInitUint8ClampedArray3(): collections.Uint8ClampedArray {
  let arrayPara = [1, 2, 3, 4];
  let uint8ClampedArray = new collections.Uint8ClampedArray(arrayPara);
  return uint8ClampedArray;
}

function getInitUint8ClampedArray4(): collections.Uint8ClampedArray {
  let uint8ClampedArray = collections.Uint8ClampedArray.from([1, 2, 3, 4, 5, 6, 7, 8]);
  return uint8ClampedArray;
}

function getInitUint8ClampedArray5(): collections.Uint8ClampedArray {
  let array: Array<number> = [1, 2, 3, 4];
  let uint8ClampedArray = collections.Uint8ClampedArray.from(array);
  return uint8ClampedArray;
}

function getInitUint8ClampedArray6(): collections.Uint8ClampedArray {
  const set = new Set([1, 2, 3, 4]);
  let uint8ClampedArray: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from(set);
  return uint8ClampedArray;
}

function getInitUint8ClampedArray7(): collections.Uint8ClampedArray {
  let array: Array<number> = [1, 2, 3];
  let uint8ClampedArray = collections.Uint8ClampedArray.from(array, (value, index) => value + index);
  return uint8ClampedArray;
}

function getInitUint8ClampedArray8(): collections.Uint8ClampedArray {
  let uint8ClampedArray: collections.Uint8ClampedArray = collections.Uint8ClampedArray.of(1, 2, 3, 4);
  return uint8ClampedArray;
}

function getInitUint8ClampedArray9(): collections.Uint8ClampedArray {
  let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([1, 2, 3, 4, 5, 6, 7, 8]);
  let copied: collections.Uint8ClampedArray = array.copyWithin(3, 1, 3);
  return copied;
}

function getInitUint8ClampedArray10(): collections.Uint8ClampedArray {
  let arrayBuffer: collections.ArrayBuffer = new collections.ArrayBuffer(12);
  let uint8ClampedArray: collections.Uint8ClampedArray = new collections.Uint8ClampedArray(arrayBuffer, 1, 5);
  return uint8ClampedArray;
}

export function sleep(time: number): Promise<void> {
  return new Promise((re, je) => {
    setTimeout(() => {
      re()
    }, time)
  })
}

export default function Uint8ClampedArrayTest() {
  describe('Uint8ClampedArrayTest', () => {
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
     * @tc.name   test_Uint8ClampedArray_001
     * @tc.number SUB_CONCURRENT_UINT8CLAMPED_TEST_0100
     * @tc.desc   test_Uint8ClampedArray_001 - test uint8ClampedArray constructor and basic operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_Uint8ClampedArray_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_Uint8ClampedArray_001';
        console.info(`${caseName} test start`);
        let uint8ClampedArray = getInitUint8ClampedArray1()
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_uint8ClampedArray_001, uint8ClampedArray, caseName, i)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${uint8ClampedArray.length}`);
          expect(uint8ClampedArray.length).assertEqual(1000)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   test_Uint8ClampedArray_002
     * @tc.number SUB_CONCURRENT_UINT8CLAMPED_TEST_0200
     * @tc.desc   test_Uint8ClampedArray_002 - test uint8ClampedArray from method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_Uint8ClampedArray_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_Uint8ClampedArray_002';
        console.info(`${caseName} test start`);
        let uint8ClampedArray = getInitUint8ClampedArray2()
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_uint8ClampedArray_002, uint8ClampedArray, caseName, i)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${uint8ClampedArray.length}`);
          expect(uint8ClampedArray.length).assertEqual(4)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   test_Uint8ClampedArray_003
     * @tc.number SUB_CONCURRENT_UINT8CLAMPED_TEST_0300
     * @tc.desc   test_Uint8ClampedArray_003 - test uint8ClampedArray from with array parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_Uint8ClampedArray_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_Uint8ClampedArray_003';
        console.info(`${caseName} test start`);
        let uint8ClampedArray = getInitUint8ClampedArray3()
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_uint8ClampedArray_003, uint8ClampedArray, caseName, i)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${uint8ClampedArray.length}`);
          expect(uint8ClampedArray.length).assertEqual(4)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   test_Uint8ClampedArray_004
     * @tc.number SUB_CONCURRENT_UINT8CLAMPED_TEST_0400
     * @tc.desc   test_Uint8ClampedArray_004 - test uint8ClampedArray copyWithin method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_Uint8ClampedArray_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_Uint8ClampedArray_004';
        console.info(`${caseName} test start`);
        let uint8ClampedArray = getInitUint8ClampedArray4()
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_uint8ClampedArray_004, uint8ClampedArray, caseName, i)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${uint8ClampedArray.length}`);
          expect(uint8ClampedArray.length).assertEqual(8)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   test_Uint8ClampedArray_005
     * @tc.number SUB_CONCURRENT_UINT8CLAMPED_TEST_0500
     * @tc.desc   test_Uint8ClampedArray_005 - test uint8ClampedArray from with Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_Uint8ClampedArray_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_Uint8ClampedArray_005';
        console.info(`${caseName} test start`);
        let uint8ClampedArray = getInitUint8ClampedArray5()
        let count = 0;
        try {
          for (let i = 0; i < concurrentNum; i++) {
            await taskpool.execute(test_uint8ClampedArray_005, uint8ClampedArray, caseName, i).then((res) => {
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
     * @tc.name   test_Uint8ClampedArray_006
     * @tc.number SUB_CONCURRENT_UINT8CLAMPED_TEST_0600
     * @tc.desc   test_Uint8ClampedArray_006 - test uint8ClampedArray from with Set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_Uint8ClampedArray_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_Uint8ClampedArray_006';
        console.info(`${caseName} test start`);
        let uint8ClampedArray = getInitUint8ClampedArray6()
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_uint8ClampedArray_006, uint8ClampedArray, caseName, i)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${uint8ClampedArray.length}`);
          expect(uint8ClampedArray.length).assertEqual(4)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   test_Uint8ClampedArray_007
     * @tc.number SUB_CONCURRENT_UINT8CLAMPED_TEST_0700
     * @tc.desc   test_Uint8ClampedArray_007 - test uint8ClampedArray from with mapping function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_Uint8ClampedArray_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_Uint8ClampedArray_007';
        console.info(`${caseName} test start`);
        let uint8ClampedArray = getInitUint8ClampedArray7()
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_uint8ClampedArray_007, uint8ClampedArray, caseName, i)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${uint8ClampedArray.length}`);
          expect(uint8ClampedArray.length).assertEqual(3)
          expect(uint8ClampedArray[0]).assertEqual(1)
          expect(uint8ClampedArray[1]).assertEqual(3)
          expect(uint8ClampedArray[2]).assertEqual(5)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   test_Uint8ClampedArray_008
     * @tc.number SUB_CONCURRENT_UINT8CLAMPED_TEST_0800
     * @tc.desc   test_Uint8ClampedArray_008 - test uint8ClampedArray of method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_Uint8ClampedArray_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_Uint8ClampedArray_008';
        console.info(`${caseName} test start`);
        let uint8ClampedArray = getInitUint8ClampedArray8()
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_uint8ClampedArray_008, uint8ClampedArray, caseName, i)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${uint8ClampedArray.length}`);
          expect(uint8ClampedArray.length).assertEqual(4)
          expect(uint8ClampedArray[0]).assertEqual(1)
          expect(uint8ClampedArray[1]).assertEqual(2)
          expect(uint8ClampedArray[2]).assertEqual(3)
          expect(uint8ClampedArray[3]).assertEqual(4)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   test_Uint8ClampedArray_009
     * @tc.number SUB_CONCURRENT_UINT8CLAMPED_TEST_0900
     * @tc.desc   test_Uint8ClampedArray_009 - test uint8ClampedArray copyWithin result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_Uint8ClampedArray_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_Uint8ClampedArray_009';
        console.info(`${caseName} test start`);
        let uint8ClampedArray = getInitUint8ClampedArray9()
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_uint8ClampedArray_009, uint8ClampedArray, caseName, i)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${uint8ClampedArray.length}`);
          expect(uint8ClampedArray.length).assertEqual(8)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   test_Uint8ClampedArray_010
     * @tc.number SUB_CONCURRENT_UINT8CLAMPED_TEST_1000
     * @tc.desc   test_Uint8ClampedArray_010 - test uint8ClampedArray with ArrayBuffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_Uint8ClampedArray_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_Uint8ClampedArray_010';
        console.info(`${caseName} test start`);
        let uint8ClampedArray = getInitUint8ClampedArray10()
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_uint8ClampedArray_010, uint8ClampedArray, caseName, i)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${uint8ClampedArray.length}`);
          expect(uint8ClampedArray.length).assertEqual(5)
          expect(uint8ClampedArray.byteLength).assertEqual(5)
          expect(uint8ClampedArray.byteOffset).assertEqual(1)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   test_Uint8ClampedArray_011
     * @tc.number SUB_CONCURRENT_UINT8CLAMPED_TEST_1100
     * @tc.desc   test_Uint8ClampedArray_011 - test uint8ClampedArray some and every methods
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_Uint8ClampedArray_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_Uint8ClampedArray_011';
        console.info(`${caseName} test start`);
        let uint8ClampedArray = getInitUint8ClampedArray2()
        let count = 0;
        try {
          for (let i = 0; i < concurrentNum; i++) {
            await taskpool.execute(test_uint8ClampedArray_011, uint8ClampedArray, caseName, i).then((res) => {
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
     * @tc.name   test_Uint8ClampedArray_012
     * @tc.number SUB_CONCURRENT_UINT8CLAMPED_TEST_1200
     * @tc.desc   test_Uint8ClampedArray_012 - test uint8ClampedArray fill method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_Uint8ClampedArray_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_Uint8ClampedArray_012';
        console.info(`${caseName} test start`);
        let uint8ClampedArray = getInitUint8ClampedArray2()
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_uint8ClampedArray_012, uint8ClampedArray, caseName, i)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${uint8ClampedArray.toString()}`);
          expect(uint8ClampedArray[0]).assertEqual(1)
          expect(uint8ClampedArray[1]).assertEqual(0)
          expect(uint8ClampedArray[2]).assertEqual(0)
          expect(uint8ClampedArray[3]).assertEqual(4)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   test_Uint8ClampedArray_013
     * @tc.number SUB_CONCURRENT_UINT8CLAMPED_TEST_1300
     * @tc.desc   test_Uint8ClampedArray_013 - test uint8ClampedArray filter and find methods
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_Uint8ClampedArray_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_Uint8ClampedArray_013';
        console.info(`${caseName} test start`);
        let uint8ClampedArray = getInitUint8ClampedArray2()
        let count = 0;
        try {
          for (let i = 0; i < concurrentNum; i++) {
            await taskpool.execute(test_uint8ClampedArray_013, uint8ClampedArray, caseName, i).then((res) => {
              expect(res as string)
                .assertEqual('2,4,2')
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
     * @tc.name   test_Uint8ClampedArray_014
     * @tc.number SUB_CONCURRENT_UINT8CLAMPED_TEST_1400
     * @tc.desc   test_Uint8ClampedArray_014 - test uint8ClampedArray findIndex and indexOf methods
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_Uint8ClampedArray_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_Uint8ClampedArray_014';
        console.info(`${caseName} test start`);
        let uint8ClampedArray = getInitUint8ClampedArray2()
        let count = 0;
        try {
          for (let i = 0; i < concurrentNum; i++) {
            await taskpool.execute(test_uint8ClampedArray_014, uint8ClampedArray, caseName, i).then((res) => {
              expect(res as string)
                .assertEqual('1,1')
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
     * @tc.name   test_Uint8ClampedArray_015
     * @tc.number SUB_CONCURRENT_UINT8CLAMPED_TEST_1500
     * @tc.desc   test_Uint8ClampedArray_015 - test uint8ClampedArray forEach method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_Uint8ClampedArray_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_Uint8ClampedArray_015';
        console.info(`${caseName} test start`);
        let uint8ClampedArray = getInitUint8ClampedArray2()
        let count = 0;
        try {
          for (let i = 0; i < concurrentNum; i++) {
            await taskpool.execute(test_uint8ClampedArray_015, uint8ClampedArray, caseName, i).then((res) => {
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
     * @tc.name   test_Uint8ClampedArray_016
     * @tc.number SUB_CONCURRENT_UINT8CLAMPED_TEST_1600
     * @tc.desc   test_Uint8ClampedArray_016 - test uint8ClampedArray lastIndexOf and join methods
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_Uint8ClampedArray_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_Uint8ClampedArray_016';
        console.info(`${caseName} test start`);
        let uint8ClampedArray = getInitUint8ClampedArray2()
        let count = 0;
        try {
          for (let i = 0; i < concurrentNum; i++) {
            await taskpool.execute(test_uint8ClampedArray_016, uint8ClampedArray, caseName, i).then((res) => {
              expect(res as string)
                .assertEqual('1,1-2-3-4')
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
     * @tc.name   test_Uint8ClampedArray_017
     * @tc.number SUB_CONCURRENT_UINT8CLAMPED_TEST_1700
     * @tc.desc   test_Uint8ClampedArray_017 - test uint8ClampedArray map method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_Uint8ClampedArray_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_Uint8ClampedArray_017';
        console.info(`${caseName} test start`);
        let uint8ClampedArray = getInitUint8ClampedArray2()
        let count = 0;
        try {
          for (let i = 0; i < concurrentNum; i++) {
            await taskpool.execute(test_uint8ClampedArray_017, uint8ClampedArray, caseName, i).then((res) => {
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
     * @tc.name   test_Uint8ClampedArray_018
     * @tc.number SUB_CONCURRENT_UINT8CLAMPED_TEST_1800
     * @tc.desc   test_Uint8ClampedArray_018 - test uint8ClampedArray reduce methods
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_Uint8ClampedArray_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_Uint8ClampedArray_018';
        console.info(`${caseName} test start`);
        let uint8ClampedArray = getInitUint8ClampedArray2()
        let count = 0;
        try {
          for (let i = 0; i < concurrentNum; i++) {
            await taskpool.execute(test_uint8ClampedArray_018, uint8ClampedArray, caseName, i).then((res) => {
              expect(res as string)
                .assertEqual('10,16')
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
     * @tc.name   test_Uint8ClampedArray_019
     * @tc.number SUB_CONCURRENT_UINT8CLAMPED_TEST_1900
     * @tc.desc   test_Uint8ClampedArray_019 - test uint8ClampedArray reduceRight methods
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_Uint8ClampedArray_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_Uint8ClampedArray_019';
        console.info(`${caseName} test start`);
        let uint8ClampedArray = getInitUint8ClampedArray2()
        let count = 0;
        try {
          for (let i = 0; i < concurrentNum; i++) {
            await taskpool.execute(test_uint8ClampedArray_019, uint8ClampedArray, caseName, i).then((res) => {
              expect(res as string)
                .assertEqual('10,16')
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
     * @tc.name   test_Uint8ClampedArray_020
     * @tc.number SUB_CONCURRENT_UINT8CLAMPED_TEST_2000
     * @tc.desc   test_Uint8ClampedArray_020 - test uint8ClampedArray reverse method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_Uint8ClampedArray_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_Uint8ClampedArray_020';
        console.info(`${caseName} test start`);
        let uint8ClampedArray = getInitUint8ClampedArray2()
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_uint8ClampedArray_020, uint8ClampedArray, caseName, i)
          }
          await taskpool.execute(group).then((res) => {
            expect(res).assertContain('4,3,2,1')
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${uint8ClampedArray.toString()}`);
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })
    /**
     * @tc.name   test_Uint8ClampedArray_021
     * @tc.number SUB_CONCURRENT_UINT8CLAMPED_TEST_2100
     * @tc.desc   test_Uint8ClampedArray_021 - test uint8ClampedArray set method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_Uint8ClampedArray_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_Uint8ClampedArray_021';
        console.info(`${caseName} test start`);
        let uint8ClampedArray = getInitUint8ClampedArray1()
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_uint8ClampedArray_021, uint8ClampedArray, caseName, i)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${uint8ClampedArray.length}`);
          expect(uint8ClampedArray.length).assertEqual(1000)
          expect(uint8ClampedArray[0]).assertEqual(100)
          expect(uint8ClampedArray[1]).assertEqual(101)
          expect(uint8ClampedArray[2]).assertEqual(102)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   test_Uint8ClampedArray_022
     * @tc.number SUB_CONCURRENT_UINT8CLAMPED_TEST_2200
     * @tc.desc   test_Uint8ClampedArray_022 - test uint8ClampedArray slice method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_Uint8ClampedArray_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_Uint8ClampedArray_022';
        console.info(`${caseName} test start`);
        let uint8ClampedArray = getInitUint8ClampedArray2()
        let count = 0;
        try {
          for (let i = 0; i < concurrentNum; i++) {
            await taskpool.execute(test_uint8ClampedArray_022, uint8ClampedArray, caseName, i).then((res) => {
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
     * @tc.name   test_Uint8ClampedArray_023
     * @tc.number SUB_CONCURRENT_UINT8CLAMPED_TEST_2300
     * @tc.desc   test_Uint8ClampedArray_023 - test uint8ClampedArray sort method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_Uint8ClampedArray_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_Uint8ClampedArray_023';
        console.info(`${caseName} test start`);
        let uint8ClampedArray = getInitUint8ClampedArray2()
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_uint8ClampedArray_023, uint8ClampedArray, caseName, i)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${uint8ClampedArray.toString()}`);
          expect(uint8ClampedArray[0]).assertEqual(4)
          expect(uint8ClampedArray[1]).assertEqual(3)
          expect(uint8ClampedArray[2]).assertEqual(2)
          expect(uint8ClampedArray[3]).assertEqual(1)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   test_Uint8ClampedArray_024
     * @tc.number SUB_CONCURRENT_UINT8CLAMPED_TEST_2400
     * @tc.desc   test_Uint8ClampedArray_024 - test uint8ClampedArray subarray method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_Uint8ClampedArray_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_Uint8ClampedArray_024';
        console.info(`${caseName} test start`);
        let uint8ClampedArray = getInitUint8ClampedArray2()
        let count = 0;
        try {
          for (let i = 0; i < concurrentNum; i++) {
            await taskpool.execute(test_uint8ClampedArray_024, uint8ClampedArray, caseName, i).then((res) => {
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
     * @tc.name   test_Uint8ClampedArray_025
     * @tc.number SUB_CONCURRENT_UINT8CLAMPED_TEST_2500
     * @tc.desc   test_Uint8ClampedArray_025 - test uint8ClampedArray at and includes methods
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_Uint8ClampedArray_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_Uint8ClampedArray_025';
        console.info(`${caseName} test start`);
        let uint8ClampedArray = getInitUint8ClampedArray2()
        let count = 0;
        try {
          for (let i = 0; i < concurrentNum; i++) {
            await taskpool.execute(test_uint8ClampedArray_025, uint8ClampedArray, caseName, i).then((res) => {
              expect(res as string)
                .assertEqual('3,true')
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
     * @tc.name   test_Uint8ClampedArray_026
     * @tc.number SUB_CONCURRENT_UINT8CLAMPED_TEST_2600
     * @tc.desc   test_Uint8ClampedArray_026 - test uint8ClampedArray entries method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_Uint8ClampedArray_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_Uint8ClampedArray_026';
        console.info(`${caseName} test start`);
        let uint8ClampedArray = getInitUint8ClampedArray2()
        let count = 0;
        try {
          for (let i = 0; i < concurrentNum; i++) {
            await taskpool.execute(test_uint8ClampedArray_026, uint8ClampedArray, caseName, i).then((res) => {
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
     * @tc.name   test_Uint8ClampedArray_027
     * @tc.number SUB_CONCURRENT_UINT8CLAMPED_TEST_2700
     * @tc.desc   test_Uint8ClampedArray_027 - test uint8ClampedArray keys and values methods
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_Uint8ClampedArray_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_Uint8ClampedArray_027';
        console.info(`${caseName} test start`);
        let uint8ClampedArray = getInitUint8ClampedArray2()
        let count = 0;
        try {
          for (let i = 0; i < concurrentNum; i++) {
            await taskpool.execute(test_uint8ClampedArray_027, uint8ClampedArray, caseName, i).then((res) => {
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
  })
}