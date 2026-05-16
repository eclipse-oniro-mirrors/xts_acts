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
  test_uint16Array_001,
  test_uint16Array_002,
  test_uint16Array_003,
  test_uint16Array_004,
  test_uint16Array_005,
  test_uint16Array_006,
  test_uint16Array_007,
  test_uint16Array_008,
  test_uint16Array_009,
  test_uint16Array_010,
  test_uint16Array_011,
  test_uint16Array_012,
  test_uint16Array_013,
  test_uint16Array_014,
  test_uint16Array_015,
  test_uint16Array_016,
  test_uint16Array_017,
  test_uint16Array_018,
  test_uint16Array_019,
  test_uint16Array_020,
  test_uint16Array_021,
  test_uint16Array_022,
  test_uint16Array_023,
  test_uint16Array_024,
  test_uint16Array_025,
  test_uint16Array_026,
  test_uint16Array_027} from '../testability/pages/taskpool2';
import { BusinessError } from '@kit.BasicServicesKit';

let concurrentNum = 100

function getInitUint16Array1(): collections.Uint16Array {
  let uint16Array = new collections.Uint16Array(1000);
  for (let i = 0; i < 1000; i++) {
    uint16Array[i] = (i % 256);
  }
  return uint16Array;
}

function getInitUint16Array2(): collections.Uint16Array {
  let uint16Array = new collections.Uint16Array([1, 2, 3, 4]);
  return uint16Array;
}

function getInitUint16Array3(): collections.Uint16Array {
  let arrayPara = [1, 2, 3, 4];
  let uint16Array = new collections.Uint16Array(arrayPara);
  return uint16Array;
}

function getInitUint16Array4(): collections.Uint16Array {
  let uint16Array = collections.Uint16Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
  return uint16Array;
}

function getInitUint16Array5(): collections.Uint16Array {
  let array: Array<number> = [1, 2, 3, 4];
  let uint16Array = collections.Uint16Array.from(array);
  return uint16Array;
}

function getInitUint16Array6(): collections.Uint16Array {
  const set = new Set([1, 2, 3, 4]);
  let uint16Array: collections.Uint16Array = collections.Uint16Array.from(set);
  return uint16Array;
}

function getInitUint16Array7(): collections.Uint16Array {
  let array: Array<number> = [1, 2, 3];
  let uint16Array = collections.Uint16Array.from(array, (value, index) => value + index);
  return uint16Array;
}

function getInitUint16Array8(): collections.Uint16Array {
  let uint16Array: collections.Uint16Array = collections.Uint16Array.of(1, 2, 3, 4);
  return uint16Array;
}

function getInitUint16Array9(): collections.Uint16Array {
  let array: collections.Uint16Array = collections.Uint16Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
  let copied: collections.Uint16Array = array.copyWithin(3, 1, 3);
  return copied;
}

function getInitUint16Array10(): collections.Uint16Array {
  let arrayBuffer: collections.ArrayBuffer = new collections.ArrayBuffer(12);
  let uint16Array: collections.Uint16Array = new collections.Uint16Array(arrayBuffer, 2, 5);
  return uint16Array;
}

export function sleep(time: number): Promise<void> {
  return new Promise((re, je) => {
    setTimeout(() => {
      re()
    }, time)
  })
}

export default function Uint16ArrayTest() {
  describe('Uint16ArrayTest', () => {
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
     * @tc.name   test_concurrent_collections_uint16Array_001
     * @tc.number SUB_CONCURRENT_UINT16ARRAY_TEST_0100
     * @tc.desc   test_concurrent_collections_uint16Array_001 - test uint16Array constructor and basic operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_collections_uint16Array_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_collections_uint16Array_001';
        console.info(`${caseName} test start`);
        let uint16Array = getInitUint16Array1()
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_uint16Array_001, uint16Array, caseName, i)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${uint16Array.length}`);
          expect(uint16Array.length).assertEqual(1000)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   test_concurrent_collections_uint16Array_002
     * @tc.number SUB_CONCURRENT_UINT16ARRAY_TEST_0200
     * @tc.desc   test_concurrent_collections_uint16Array_002 - test uint16Array from method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_collections_uint16Array_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_collections_uint16Array_002';
        console.info(`${caseName} test start`);
        let uint16Array = getInitUint16Array2()
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_uint16Array_002, uint16Array, caseName, i)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${uint16Array.length}`);
          expect(uint16Array.length).assertEqual(4)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   test_concurrent_collections_uint16Array_003
     * @tc.number SUB_CONCURRENT_UINT16ARRAY_TEST_0300
     * @tc.desc   test_concurrent_collections_uint16Array_003 - test uint16Array from with array parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_collections_uint16Array_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_collections_uint16Array_003';
        console.info(`${caseName} test start`);
        let uint16Array = getInitUint16Array3()
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_uint16Array_003, uint16Array, caseName, i)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${uint16Array.length}`);
          expect(uint16Array.length).assertEqual(4)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   test_concurrent_collections_uint16Array_004
     * @tc.number SUB_CONCURRENT_UINT16ARRAY_TEST_0400
     * @tc.desc   test_concurrent_collections_uint16Array_004 - test uint16Array copyWithin method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_collections_uint16Array_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_collections_uint16Array_004';
        console.info(`${caseName} test start`);
        let uint16Array = getInitUint16Array4()
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_uint16Array_004, uint16Array, caseName, i)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${uint16Array.length}`);
          expect(uint16Array.length).assertEqual(8)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   test_concurrent_collections_uint16Array_005
     * @tc.number SUB_CONCURRENT_UINT16ARRAY_TEST_0500
     * @tc.desc   test_concurrent_collections_uint16Array_005 - test uint16Array from with Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_collections_uint16Array_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_collections_uint16Array_005';
        console.info(`${caseName} test start`);
        let uint16Array = getInitUint16Array5()
        let count = 0;
        try {
          for (let i = 0; i < concurrentNum; i++) {
            await taskpool.execute(test_uint16Array_005, uint16Array, caseName, i).then((res) => {
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
     * @tc.name   test_concurrent_collections_uint16Array_006
     * @tc.number SUB_CONCURRENT_UINT16ARRAY_TEST_0600
     * @tc.desc   test_concurrent_collections_uint16Array_006 - test uint16Array from with Set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_collections_uint16Array_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_collections_uint16Array_006';
        console.info(`${caseName} test start`);
        let uint16Array = getInitUint16Array6()
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_uint16Array_006, uint16Array, caseName, i)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${uint16Array.length}`);
          expect(uint16Array.length).assertEqual(4)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   test_concurrent_collections_uint16Array_007
     * @tc.number SUB_CONCURRENT_UINT16ARRAY_TEST_0700
     * @tc.desc   test_concurrent_collections_uint16Array_007 - test uint16Array from with mapping function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_collections_uint16Array_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_collections_uint16Array_007';
        console.info(`${caseName} test start`);
        let uint16Array = getInitUint16Array7()
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_uint16Array_007, uint16Array, caseName, i)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${uint16Array.length}`);
          expect(uint16Array.length).assertEqual(3)
          expect(uint16Array[0]).assertEqual(1)
          expect(uint16Array[1]).assertEqual(3)
          expect(uint16Array[2]).assertEqual(5)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   test_concurrent_collections_uint16Array_008
     * @tc.number SUB_CONCURRENT_UINT16ARRAY_TEST_0800
     * @tc.desc   test_concurrent_collections_uint16Array_008 - test uint16Array of method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_collections_uint16Array_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_collections_uint16Array_008';
        console.info(`${caseName} test start`);
        let uint16Array = getInitUint16Array8()
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_uint16Array_008, uint16Array, caseName, i)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${uint16Array.length}`);
          expect(uint16Array.length).assertEqual(4)
          expect(uint16Array[0]).assertEqual(1)
          expect(uint16Array[1]).assertEqual(2)
          expect(uint16Array[2]).assertEqual(3)
          expect(uint16Array[3]).assertEqual(4)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   test_concurrent_collections_uint16Array_009
     * @tc.number SUB_CONCURRENT_UINT16ARRAY_TEST_0900
     * @tc.desc   test_concurrent_collections_uint16Array_009 - test uint16Array copyWithin result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_collections_uint16Array_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_collections_uint16Array_009';
        console.info(`${caseName} test start`);
        let uint16Array = getInitUint16Array9()
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_uint16Array_009, uint16Array, caseName, i)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${uint16Array.length}`);
          expect(uint16Array.length).assertEqual(8)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   test_concurrent_collections_uint16Array_010
     * @tc.number SUB_CONCURRENT_UINT16ARRAY_TEST_1000
     * @tc.desc   test_concurrent_collections_uint16Array_010 - test uint16Array with ArrayBuffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_collections_uint16Array_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_collections_uint16Array_010';
        console.info(`${caseName} test start`);
        let uint16Array = getInitUint16Array10()
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_uint16Array_010, uint16Array, caseName, i)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${uint16Array.length}`);
          expect(uint16Array.length).assertEqual(5)
          expect(uint16Array.byteLength).assertEqual(10)
          expect(uint16Array.byteOffset).assertEqual(2)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   test_concurrent_collections_uint16Array_011
     * @tc.number SUB_CONCURRENT_UINT16ARRAY_TEST_1100
     * @tc.desc   test_concurrent_collections_uint16Array_011 - test uint16Array some and every methods
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_collections_uint16Array_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_collections_uint16Array_011';
        console.info(`${caseName} test start`);
        let uint16Array = getInitUint16Array2()
        let count = 0;
        try {
          for (let i = 0; i < concurrentNum; i++) {
            await taskpool.execute(test_uint16Array_011, uint16Array, caseName, i).then((res) => {
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
     * @tc.name   test_concurrent_collections_uint16Array_012
     * @tc.number SUB_CONCURRENT_UINT16ARRAY_TEST_1200
     * @tc.desc   test_concurrent_collections_uint16Array_012 - test uint16Array fill method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_collections_uint16Array_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_collections_uint16Array_012';
        console.info(`${caseName} test start`);
        let uint16Array = getInitUint16Array2()
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_uint16Array_012, uint16Array, caseName, i)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${uint16Array.toString()}`);
          expect(uint16Array[0]).assertEqual(1)
          expect(uint16Array[1]).assertEqual(0)
          expect(uint16Array[2]).assertEqual(0)
          expect(uint16Array[3]).assertEqual(4)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   test_concurrent_collections_uint16Array_013
     * @tc.number SUB_CONCURRENT_UINT16ARRAY_TEST_1300
     * @tc.desc   test_concurrent_collections_uint16Array_013 - test uint16Array filter and find methods
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_collections_uint16Array_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_collections_uint16Array_013';
        console.info(`${caseName} test start`);
        let uint16Array = getInitUint16Array2()
        let count = 0;
        try {
          for (let i = 0; i < concurrentNum; i++) {
            await taskpool.execute(test_uint16Array_013, uint16Array, caseName, i).then((res) => {
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
     * @tc.name   test_concurrent_collections_uint16Array_014
     * @tc.number SUB_CONCURRENT_UINT16ARRAY_TEST_1400
     * @tc.desc   test_concurrent_collections_uint16Array_014 - test uint16Array findIndex and indexOf methods
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_collections_uint16Array_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_collections_uint16Array_014';
        console.info(`${caseName} test start`);
        let uint16Array = getInitUint16Array2()
        let count = 0;
        try {
          for (let i = 0; i < concurrentNum; i++) {
            await taskpool.execute(test_uint16Array_014, uint16Array, caseName, i).then((res) => {
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
     * @tc.name   test_concurrent_collections_uint16Array_015
     * @tc.number SUB_CONCURRENT_UINT16ARRAY_TEST_1500
     * @tc.desc   test_concurrent_collections_uint16Array_015 - test uint16Array forEach method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_collections_uint16Array_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_collections_uint16Array_015';
        console.info(`${caseName} test start`);
        let uint16Array = getInitUint16Array2()
        let count = 0;
        try {
          for (let i = 0; i < concurrentNum; i++) {
            await taskpool.execute(test_uint16Array_015, uint16Array, caseName, i).then((res) => {
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
     * @tc.name   test_concurrent_collections_uint16Array_016
     * @tc.number SUB_CONCURRENT_UINT16ARRAY_TEST_1600
     * @tc.desc   test_concurrent_collections_uint16Array_016 - test uint16Array lastIndexOf and join methods
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_collections_uint16Array_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_collections_uint16Array_016';
        console.info(`${caseName} test start`);
        let uint16Array = getInitUint16Array2()
        let count = 0;
        try {
          for (let i = 0; i < concurrentNum; i++) {
            await taskpool.execute(test_uint16Array_016, uint16Array, caseName, i).then((res) => {
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
     * @tc.name   test_concurrent_collections_uint16Array_017
     * @tc.number SUB_CONCURRENT_UINT16ARRAY_TEST_1700
     * @tc.desc   test_concurrent_collections_uint16Array_017 - test uint16Array map method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_collections_uint16Array_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_collections_uint16Array_017';
        console.info(`${caseName} test start`);
        let uint16Array = getInitUint16Array2()
        let count = 0;
        try {
          for (let i = 0; i < concurrentNum; i++) {
            await taskpool.execute(test_uint16Array_017, uint16Array, caseName, i).then((res) => {
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
     * @tc.name   test_concurrent_collections_uint16Array_018
     * @tc.number SUB_CONCURRENT_UINT16ARRAY_TEST_1800
     * @tc.desc   test_concurrent_collections_uint16Array_018 - test uint16Array reduce methods
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_collections_uint16Array_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_collections_uint16Array_018';
        console.info(`${caseName} test start`);
        let uint16Array = getInitUint16Array2()
        let count = 0;
        try {
          for (let i = 0; i < concurrentNum; i++) {
            await taskpool.execute(test_uint16Array_018, uint16Array, caseName, i).then((res) => {
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
     * @tc.name   test_concurrent_collections_uint16Array_019
     * @tc.number SUB_CONCURRENT_UINT16ARRAY_TEST_1900
     * @tc.desc   test_concurrent_collections_uint16Array_019 - test uint16Array reduceRight methods
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_collections_uint16Array_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_collections_uint16Array_019';
        console.info(`${caseName} test start`);
        let uint16Array = getInitUint16Array2()
        let count = 0;
        try {
          for (let i = 0; i < concurrentNum; i++) {
            await taskpool.execute(test_uint16Array_019, uint16Array, caseName, i).then((res) => {
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
     * @tc.name   test_concurrent_collections_uint16Array_020
     * @tc.number SUB_CONCURRENT_UINT16ARRAY_TEST_2000
     * @tc.desc   test_concurrent_collections_uint16Array_020 - test uint16Array reverse method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_collections_uint16Array_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_collections_uint16Array_020';
        console.info(`${caseName} test start`);
        let uint16Array = getInitUint16Array2()
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_uint16Array_020, uint16Array, caseName, i)
          }
          await taskpool.execute(group).then((res) => {
            expect(res).assertContain('4,3,2,1')
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${uint16Array.toString()}`);
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   test_concurrent_collections_uint16Array_021
     * @tc.number SUB_CONCURRENT_UINT16ARRAY_TEST_2100
     * @tc.desc   test_concurrent_collections_uint16Array_021 - test uint16Array set method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_collections_uint16Array_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_collections_uint16Array_021';
        console.info(`${caseName} test start`);
        let uint16Array = getInitUint16Array1()
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_uint16Array_021, uint16Array, caseName, i)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${uint16Array.length}`);
          expect(uint16Array.length).assertEqual(1000)
          expect(uint16Array[0]).assertEqual(100)
          expect(uint16Array[1]).assertEqual(101)
          expect(uint16Array[2]).assertEqual(102)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   test_concurrent_collections_uint16Array_022
     * @tc.number SUB_CONCURRENT_UINT16ARRAY_TEST_2200
     * @tc.desc   test_concurrent_collections_uint16Array_022 - test uint16Array slice method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_collections_uint16Array_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_collections_uint16Array_022';
        console.info(`${caseName} test start`);
        let uint16Array = getInitUint16Array2()
        let count = 0;
        try {
          for (let i = 0; i < concurrentNum; i++) {
            await taskpool.execute(test_uint16Array_022, uint16Array, caseName, i).then((res) => {
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
     * @tc.name   test_concurrent_collections_uint16Array_023
     * @tc.number SUB_CONCURRENT_UINT16ARRAY_TEST_2300
     * @tc.desc   test_concurrent_collections_uint16Array_023 - test uint16Array sort method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_collections_uint16Array_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_collections_uint16Array_023';
        console.info(`${caseName} test start`);
        let uint16Array = getInitUint16Array2()
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_uint16Array_023, uint16Array, caseName, i)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${uint16Array.toString()}`);
          expect(uint16Array[0]).assertEqual(4)
          expect(uint16Array[1]).assertEqual(3)
          expect(uint16Array[2]).assertEqual(2)
          expect(uint16Array[3]).assertEqual(1)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   test_concurrent_collections_uint16Array_024
     * @tc.number SUB_CONCURRENT_UINT16ARRAY_TEST_2400
     * @tc.desc   test_concurrent_collections_uint16Array_024 - test uint16Array subarray method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_collections_uint16Array_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_collections_uint16Array_024';
        console.info(`${caseName} test start`);
        let uint16Array = getInitUint16Array2()
        let count = 0;
        try {
          for (let i = 0; i < concurrentNum; i++) {
            await taskpool.execute(test_uint16Array_024, uint16Array, caseName, i).then((res) => {
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
     * @tc.name   test_concurrent_collections_uint16Array_025
     * @tc.number SUB_CONCURRENT_UINT16ARRAY_TEST_2500
     * @tc.desc   test_concurrent_collections_uint16Array_025 - test uint16Array at and includes methods
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_collections_uint16Array_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_collections_uint16Array_025';
        console.info(`${caseName} test start`);
        let uint16Array = getInitUint16Array2()
        let count = 0;
        try {
          for (let i = 0; i < concurrentNum; i++) {
            await taskpool.execute(test_uint16Array_025, uint16Array, caseName, i).then((res) => {
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
     * @tc.name   test_concurrent_collections_uint16Array_026
     * @tc.number SUB_CONCURRENT_UINT16ARRAY_TEST_2600
     * @tc.desc   test_concurrent_collections_uint16Array_026 - test uint16Array entries method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_collections_uint16Array_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_collections_uint16Array_026';
        console.info(`${caseName} test start`);
        let uint16Array = getInitUint16Array2()
        let count = 0;
        try {
          for (let i = 0; i < concurrentNum; i++) {
            await taskpool.execute(test_uint16Array_026, uint16Array, caseName, i).then((res) => {
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
     * @tc.name   test_concurrent_collections_uint16Array_027
     * @tc.number SUB_CONCURRENT_UINT16ARRAY_TEST_2700
     * @tc.desc   test_concurrent_collections_uint16Array_027 - test uint16Array keys and values methods
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_collections_uint16Array_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_collections_uint16Array_027';
        console.info(`${caseName} test start`);
        let uint16Array = getInitUint16Array2()
        let count = 0;
        try {
          for (let i = 0; i < concurrentNum; i++) {
            await taskpool.execute(test_uint16Array_027, uint16Array, caseName, i).then((res) => {
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