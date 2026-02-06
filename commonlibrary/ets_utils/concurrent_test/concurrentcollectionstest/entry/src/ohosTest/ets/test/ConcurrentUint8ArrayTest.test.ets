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
  test_uint8Array_001,
  test_uint8Array_002,
  test_uint8Array_003,
  test_uint8Array_004,
  test_uint8Array_005,
  test_uint8Array_006,
  test_uint8Array_007,
  test_uint8Array_008,
  test_uint8Array_009,
  test_uint8Array_010,
  test_uint8Array_011,
  test_uint8Array_012,
  test_uint8Array_013,
  test_uint8Array_014,
  test_uint8Array_015,
  test_uint8Array_016,
  test_uint8Array_017,
  test_uint8Array_018,
  test_uint8Array_019,
  test_uint8Array_020,
  test_uint8Array_021,
  test_uint8Array_022,
  test_uint8Array_023,
  test_uint8Array_024,
  test_uint8Array_025,
  test_uint8Array_026,
  test_uint8Array_027} from '../testability/pages/taskpool';
import { BusinessError } from '@kit.BasicServicesKit';

let concurrentNum = 100

function getInitUint8Array1(): collections.Uint8Array {
  let uint8Array = new collections.Uint8Array(1000);
  for (let i = 0; i < 1000; i++) {
    uint8Array[i] = (i % 256);
  }
  return uint8Array;
}

function getInitUint8Array2(): collections.Uint8Array {
  let uint8Array = new collections.Uint8Array([1, 2, 3, 4]);
  return uint8Array;
}

function getInitUint8Array3(): collections.Uint8Array {
  let arrayPara = [1, 2, 3, 4];
  let uint8Array = new collections.Uint8Array(arrayPara);
  return uint8Array;
}

function getInitUint8Array4(): collections.Uint8Array {
  let uint8Array = collections.Uint8Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
  return uint8Array;
}

function getInitUint8Array5(): collections.Uint8Array {
  let array: Array<number> = [1, 2, 3, 4];
  let uint8Array = collections.Uint8Array.from(array);
  return uint8Array;
}

function getInitUint8Array6(): collections.Uint8Array {
  const set = new Set([1, 2, 3, 4]);
  let uint8Array: collections.Uint8Array = collections.Uint8Array.from(set);
  return uint8Array;
}

function getInitUint8Array7(): collections.Uint8Array {
  let array: Array<number> = [1, 2, 3];
  let uint8Array = collections.Uint8Array.from(array, (value, index) => value + index);
  return uint8Array;
}

function getInitUint8Array8(): collections.Uint8Array {
  let uint8Array: collections.Uint8Array = collections.Uint8Array.of(1, 2, 3, 4);
  return uint8Array;
}

function getInitUint8Array9(): collections.Uint8Array {
  let array: collections.Uint8Array = collections.Uint8Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
  let copied: collections.Uint8Array = array.copyWithin(3, 1, 3);
  return copied;
}

function getInitUint8Array10(): collections.Uint8Array {
  let arrayBuffer: collections.ArrayBuffer = new collections.ArrayBuffer(12);
  let uint8Array: collections.Uint8Array = new collections.Uint8Array(arrayBuffer, 1, 5);
  return uint8Array;
}

export function sleep(time: number): Promise<void> {
  return new Promise((re, je) => {
    setTimeout(() => {
      re()
    }, time)
  })
}

export default function Uint8ArrayTest() {
  describe('Uint8ArrayTest', () => {
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
     * @tc.name   test_concurrent_collections_uint8Array_001
     * @tc.number SUB_CONCURRENT_UINT8ARRAY_TEST_TEST_0100
     * @tc.desc   test_concurrent_collections_uint8Array_001 - test Uint8Array constructor and basic operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_collections_uint8Array_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_collections_uint8Array_001';
        console.info(`${caseName} test start`);
        let uint8Array = getInitUint8Array1()
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_uint8Array_001, uint8Array, caseName, i)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${uint8Array.length}`);
          expect(uint8Array.length).assertEqual(1000)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   test_concurrent_collections_uint8Array_002
     * @tc.number SUB_CONCURRENT_UINT8ARRAY_TEST_TEST_0200
     * @tc.desc   test_concurrent_collections_uint8Array_002 - test Uint8Array from method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_collections_uint8Array_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_collections_uint8Array_002';
        console.info(`${caseName} test start`);
        let uint8Array = getInitUint8Array2()
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_uint8Array_002, uint8Array, caseName, i)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${uint8Array.length}`);
          expect(uint8Array.length).assertEqual(4)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   test_concurrent_collections_uint8Array_003
     * @tc.number SUB_CONCURRENT_UINT8ARRAY_TEST_TEST_0300
     * @tc.desc   test_concurrent_collections_uint8Array_003 - test Uint8Array from with array parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_collections_uint8Array_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_collections_uint8Array_003';
        console.info(`${caseName} test start`);
        let uint8Array = getInitUint8Array3()
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_uint8Array_003, uint8Array, caseName, i)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${uint8Array.length}`);
          expect(uint8Array.length).assertEqual(4)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   test_concurrent_collections_uint8Array_004
     * @tc.number SUB_CONCURRENT_UINT8ARRAY_TEST_TEST_0400
     * @tc.desc   test_concurrent_collections_uint8Array_004 - test Uint8Array copyWithin method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_collections_uint8Array_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_collections_uint8Array_004';
        console.info(`${caseName} test start`);
        let uint8Array = getInitUint8Array4()
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_uint8Array_004, uint8Array, caseName, i)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${uint8Array.length}`);
          expect(uint8Array.length).assertEqual(8)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   test_concurrent_collections_uint8Array_005
     * @tc.number SUB_CONCURRENT_UINT8ARRAY_TEST_TEST_0500
     * @tc.desc   test_concurrent_collections_uint8Array_005 - test Uint8Array from with Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_collections_uint8Array_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_collections_uint8Array_005';
        console.info(`${caseName} test start`);
        let uint8Array = getInitUint8Array5()
        let count = 0;
        try {
          for (let i = 0; i < concurrentNum; i++) {
            await taskpool.execute(test_uint8Array_005, uint8Array, caseName, i).then((res) => {
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
     * @tc.name   test_concurrent_collections_uint8Array_006
     * @tc.number SUB_CONCURRENT_UINT8ARRAY_TEST_TEST_0600
     * @tc.desc   test_concurrent_collections_uint8Array_006 - test Uint8Array from with Set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_collections_uint8Array_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_collections_uint8Array_006';
        console.info(`${caseName} test start`);
        let uint8Array = getInitUint8Array6()
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_uint8Array_006, uint8Array, caseName, i)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${uint8Array.length}`);
          expect(uint8Array.length).assertEqual(4)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   test_concurrent_collections_uint8Array_007
     * @tc.number SUB_CONCURRENT_UINT8ARRAY_TEST_TEST_0700
     * @tc.desc   test_concurrent_collections_uint8Array_007 - test Uint8Array from with mapping function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_collections_uint8Array_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_collections_uint8Array_007';
        console.info(`${caseName} test start`);
        let uint8Array = getInitUint8Array7()
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_uint8Array_007, uint8Array, caseName, i)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${uint8Array.length}`);
          expect(uint8Array.length).assertEqual(3)
          expect(uint8Array[0]).assertEqual(1)
          expect(uint8Array[1]).assertEqual(3)
          expect(uint8Array[2]).assertEqual(5)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   test_concurrent_collections_uint8Array_008
     * @tc.number SUB_CONCURRENT_UINT8ARRAY_TEST_TEST_0800
     * @tc.desc   test_concurrent_collections_uint8Array_008 - test Uint8Array of method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_collections_uint8Array_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_collections_uint8Array_008';
        console.info(`${caseName} test start`);
        let uint8Array = getInitUint8Array8()
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_uint8Array_008, uint8Array, caseName, i)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${uint8Array.length}`);
          expect(uint8Array.length).assertEqual(4)
          expect(uint8Array[0]).assertEqual(1)
          expect(uint8Array[1]).assertEqual(2)
          expect(uint8Array[2]).assertEqual(3)
          expect(uint8Array[3]).assertEqual(4)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   test_concurrent_collections_uint8Array_009
     * @tc.number SUB_CONCURRENT_UINT8ARRAY_TEST_TEST_0900
     * @tc.desc   test_concurrent_collections_uint8Array_009 - test Uint8Array copyWithin result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_collections_uint8Array_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_collections_uint8Array_009';
        console.info(`${caseName} test start`);
        let uint8Array = getInitUint8Array9()
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_uint8Array_009, uint8Array, caseName, i)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${uint8Array.length}`);
          expect(uint8Array.length).assertEqual(8)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   test_concurrent_collections_uint8Array_010
     * @tc.number SUB_CONCURRENT_UINT8ARRAY_TEST_TEST_1000
     * @tc.desc   test_concurrent_collections_uint8Array_010 - test Uint8Array with ArrayBuffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_collections_uint8Array_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_collections_uint8Array_010';
        console.info(`${caseName} test start`);
        let uint8Array = getInitUint8Array10()
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_uint8Array_010, uint8Array, caseName, i)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${uint8Array.length}`);
          expect(uint8Array.length).assertEqual(5)
          expect(uint8Array.byteLength).assertEqual(5)
          expect(uint8Array.byteOffset).assertEqual(1)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   test_concurrent_collections_uint8Array_011
     * @tc.number SUB_CONCURRENT_UINT8ARRAY_TEST_TEST_1100
     * @tc.desc   test_concurrent_collections_uint8Array_011 - test Uint8Array some and every methods
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_collections_uint8Array_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_collections_uint8Array_011';
        console.info(`${caseName} test start`);
        let uint8Array = getInitUint8Array2()
        let count = 0;
        try {
          for (let i = 0; i < concurrentNum; i++) {
            await taskpool.execute(test_uint8Array_011, uint8Array, caseName, i).then((res) => {
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
     * @tc.name   test_concurrent_collections_uint8Array_012
     * @tc.number SUB_CONCURRENT_UINT8ARRAY_TEST_TEST_1200
     * @tc.desc   test_concurrent_collections_uint8Array_012 - test Uint8Array fill method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_collections_uint8Array_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_collections_uint8Array_012';
        console.info(`${caseName} test start`);
        let uint8Array = getInitUint8Array2()
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_uint8Array_012, uint8Array, caseName, i)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${uint8Array.toString()}`);
          expect(uint8Array[0]).assertEqual(1)
          expect(uint8Array[1]).assertEqual(0)
          expect(uint8Array[2]).assertEqual(0)
          expect(uint8Array[3]).assertEqual(4)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   test_concurrent_collections_uint8Array_013
     * @tc.number SUB_CONCURRENT_UINT8ARRAY_TEST_TEST_1300
     * @tc.desc   test_concurrent_collections_uint8Array_013 - test Uint8Array filter and find methods
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_collections_uint8Array_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_collections_uint8Array_013';
        console.info(`${caseName} test start`);
        let uint8Array = getInitUint8Array2()
        let count = 0;
        try {
          for (let i = 0; i < concurrentNum; i++) {
            await taskpool.execute(test_uint8Array_013, uint8Array, caseName, i).then((res) => {
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
     * @tc.name   test_concurrent_collections_uint8Array_014
     * @tc.number SUB_CONCURRENT_UINT8ARRAY_TEST_TEST_1400
     * @tc.desc   test_concurrent_collections_uint8Array_014 - test Uint8Array findIndex and indexOf methods
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_collections_uint8Array_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_collections_uint8Array_014';
        console.info(`${caseName} test start`);
        let uint8Array = getInitUint8Array2()
        let count = 0;
        try {
          for (let i = 0; i < concurrentNum; i++) {
            await taskpool.execute(test_uint8Array_014, uint8Array, caseName, i).then((res) => {
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
     * @tc.name   test_concurrent_collections_uint8Array_015
     * @tc.number SUB_CONCURRENT_UINT8ARRAY_TEST_TEST_1500
     * @tc.desc   test_concurrent_collections_uint8Array_015 - test Uint8Array forEach method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_collections_uint8Array_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_collections_uint8Array_015';
        console.info(`${caseName} test start`);
        let uint8Array = getInitUint8Array2()
        let count = 0;
        try {
          for (let i = 0; i < concurrentNum; i++) {
            await taskpool.execute(test_uint8Array_015, uint8Array, caseName, i).then((res) => {
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
     * @tc.name   test_concurrent_collections_uint8Array_016
     * @tc.number SUB_CONCURRENT_UINT8ARRAY_TEST_TEST_1600
     * @tc.desc   test_concurrent_collections_uint8Array_016 - test Uint8Array lastIndexOf and join methods
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_collections_uint8Array_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_collections_uint8Array_016';
        console.info(`${caseName} test start`);
        let uint8Array = getInitUint8Array2()
        let count = 0;
        try {
          for (let i = 0; i < concurrentNum; i++) {
            await taskpool.execute(test_uint8Array_016, uint8Array, caseName, i).then((res) => {
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
     * @tc.name   test_concurrent_collections_uint8Array_017
     * @tc.number SUB_CONCURRENT_UINT8ARRAY_TEST_TEST_1700
     * @tc.desc   test_concurrent_collections_uint8Array_017 - test Uint8Array map method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_collections_uint8Array_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_collections_uint8Array_017';
        console.info(`${caseName} test start`);
        let uint8Array = getInitUint8Array2()
        let count = 0;
        try {
          for (let i = 0; i < concurrentNum; i++) {
            await taskpool.execute(test_uint8Array_017, uint8Array, caseName, i).then((res) => {
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
     * @tc.name   test_concurrent_collections_uint8Array_018
     * @tc.number SUB_CONCURRENT_UINT8ARRAY_TEST_TEST_1800
     * @tc.desc   test_concurrent_collections_uint8Array_018 - test Uint8Array reduce methods
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_collections_uint8Array_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_collections_uint8Array_018';
        console.info(`${caseName} test start`);
        let uint8Array = getInitUint8Array2()
        let count = 0;
        try {
          for (let i = 0; i < concurrentNum; i++) {
            await taskpool.execute(test_uint8Array_018, uint8Array, caseName, i).then((res) => {
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
     * @tc.name   test_concurrent_collections_uint8Array_019
     * @tc.number SUB_CONCURRENT_UINT8ARRAY_TEST_TEST_1900
     * @tc.desc   test_concurrent_collections_uint8Array_019 - test Uint8Array reduceRight methods
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_collections_uint8Array_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_collections_uint8Array_019';
        console.info(`${caseName} test start`);
        let uint8Array = getInitUint8Array2()
        let count = 0;
        try {
          for (let i = 0; i < concurrentNum; i++) {
            await taskpool.execute(test_uint8Array_019, uint8Array, caseName, i).then((res) => {
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
     * @tc.name   test_concurrent_collections_uint8Array_020
     * @tc.number SUB_CONCURRENT_UINT8ARRAY_TEST_TEST_2000
     * @tc.desc   test_concurrent_collections_uint8Array_020 - test Uint8Array reduceRight methods
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_collections_uint8Array_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_collections_uint8Array_020';
        console.info(`${caseName} test start`);
        let uint8Array = getInitUint8Array2()
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_uint8Array_020, uint8Array, caseName, i)
          }
          await taskpool.execute(group).then((res) => {
            expect(res).assertContain('4,3,2,1')
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${uint8Array.toString()}`);
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   test_concurrent_collections_uint8Array_021
     * @tc.number SUB_CONCURRENT_UINT8ARRAY_TEST_TEST_2100
     * @tc.desc   test_concurrent_collections_uint8Array_021 - test Uint8Array set method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_collections_uint8Array_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_collections_uint8Array_021';
        console.info(`${caseName} test start`);
        let uint8Array = getInitUint8Array1()
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_uint8Array_021, uint8Array, caseName, i)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${uint8Array.length}`);
          expect(uint8Array.length).assertEqual(1000)
          expect(uint8Array[0]).assertEqual(100)
          expect(uint8Array[1]).assertEqual(101)
          expect(uint8Array[2]).assertEqual(102)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   test_concurrent_collections_uint8Array_022
     * @tc.number SUB_CONCURRENT_UINT8ARRAY_TEST_TEST_2200
     * @tc.desc   test_concurrent_collections_uint8Array_022 - test Uint8Array slice method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_collections_uint8Array_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_collections_uint8Array_022';
        console.info(`${caseName} test start`);
        let uint8Array = getInitUint8Array2()
        let count = 0;
        try {
          for (let i = 0; i < concurrentNum; i++) {
            await taskpool.execute(test_uint8Array_022, uint8Array, caseName, i).then((res) => {
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
     * @tc.name   test_concurrent_collections_uint8Array_023
     * @tc.number SUB_CONCURRENT_UINT8ARRAY_TEST_TEST_2300
     * @tc.desc   test_concurrent_collections_uint8Array_023 - test Uint8Array sort method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_collections_uint8Array_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_collections_uint8Array_023';
        console.info(`${caseName} test start`);
        let uint8Array = getInitUint8Array2()
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_uint8Array_023, uint8Array, caseName, i)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${uint8Array.toString()}`);
          expect(uint8Array[0]).assertEqual(4)
          expect(uint8Array[1]).assertEqual(3)
          expect(uint8Array[2]).assertEqual(2)
          expect(uint8Array[3]).assertEqual(1)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   test_concurrent_collections_uint8Array_024
     * @tc.number SUB_CONCURRENT_UINT8ARRAY_TEST_TEST_2400
     * @tc.desc   test_concurrent_collections_uint8Array_024 - test Uint8Array subarray method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_collections_uint8Array_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_collections_uint8Array_024';
        console.info(`${caseName} test start`);
        let uint8Array = getInitUint8Array2()
        let count = 0;
        try {
          for (let i = 0; i < concurrentNum; i++) {
            await taskpool.execute(test_uint8Array_024, uint8Array, caseName, i).then((res) => {
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
     * @tc.name   test_concurrent_collections_uint8Array_025
     * @tc.number SUB_CONCURRENT_UINT8ARRAY_TEST_TEST_2500
     * @tc.desc   test_concurrent_collections_uint8Array_025 - test Uint8Array at and includes methods
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_collections_uint8Array_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_collections_uint8Array_025';
        console.info(`${caseName} test start`);
        let uint8Array = getInitUint8Array2()
        let count = 0;
        try {
          for (let i = 0; i < concurrentNum; i++) {
            await taskpool.execute(test_uint8Array_025, uint8Array, caseName, i).then((res) => {
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
     * @tc.name   test_concurrent_collections_uint8Array_026
     * @tc.number SUB_CONCURRENT_UINT8ARRAY_TEST_TEST_2600
     * @tc.desc   test_concurrent_collections_uint8Array_026 - test Uint8Array entries method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_collections_uint8Array_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_collections_uint8Array_026';
        console.info(`${caseName} test start`);
        let uint8Array = getInitUint8Array2()
        let count = 0;
        try {
          for (let i = 0; i < concurrentNum; i++) {
            await taskpool.execute(test_uint8Array_026, uint8Array, caseName, i).then((res) => {
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
     * @tc.name   test_concurrent_collections_uint8Array_027
     * @tc.number SUB_CONCURRENT_UINT8ARRAY_TEST_TEST_2700
     * @tc.desc   test_concurrent_collections_uint8Array_027 - test Uint8Array keys and values methods
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_collections_uint8Array_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_collections_uint8Array_027';
        console.info(`${caseName} test start`);
        let uint8Array = getInitUint8Array2()
        let count = 0;
        try {
          for (let i = 0; i < concurrentNum; i++) {
            await taskpool.execute(test_uint8Array_027, uint8Array, caseName, i).then((res) => {
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