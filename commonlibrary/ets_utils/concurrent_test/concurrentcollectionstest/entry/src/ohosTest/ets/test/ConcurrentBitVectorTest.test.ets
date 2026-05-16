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
  test_bitvector_001,
  test_bitvector_002,
  test_bitvector_003, test_bitvector_004, test_bitvector_005,
  test_bitvector_006,
  test_bitvector_007,
  test_bitvector_008,
  test_bitvector_009,
  test_bitvector_010,
  test_bitvector_011,
  test_bitvector_012,
  test_bitvector_013} from '../testability/pages/taskpool';
import { BusinessError } from '@kit.BasicServicesKit';

let concurrentNum = 100

function getInitBitVector1(): collections.BitVector {
  let bitVector = new collections.BitVector(0);
  bitVector.push(0);
  bitVector.push(1);
  bitVector.push(0);
  bitVector.push(1);
  bitVector.push(0);
  return bitVector;
}

function getInitBitVector2(): collections.BitVector {
  let bitVector = new collections.BitVector(0);
  bitVector.push(1);
  bitVector.push(1);
  bitVector.push(0);
  bitVector.push(0);
  bitVector.push(1);
  return bitVector;
}

function getInitBitVector3(): collections.BitVector {
  let bitVector = new collections.BitVector(0);
  for (let i = 0; i < 1000; i++) {
    bitVector.push(i % 2);
  }
  return bitVector;
}

export function sleep(time: number): Promise<void> {
  return new Promise((re, je) => {
    setTimeout(() => {
      re()
    }, time)
  })
}

export default function BitVectorTest() {
  describe('BitVectorTest', () => {
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
     * @tc.name   test_concurrent_collections_bitvector_001
     * @tc.number SUB_CONCURRENT_BITVECTOR_TEST_0100
     * @tc.desc   test_concurrent_collections_bitvector_001 - test BitVector push method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_collections_bitvector_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_collections_bitvector_001';
        console.info(`${caseName} test start`);
        let bitVector = getInitBitVector1()
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_bitvector_001, bitVector, caseName, i)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${bitVector.length}`);
          expect(bitVector.length).assertEqual(5 + concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   test_concurrent_collections_bitvector_002
     * @tc.number SUB_CONCURRENT_BITVECTOR_TEST_0200
     * @tc.desc   test_concurrent_collections_bitvector_002 - test BitVector pop method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_collections_bitvector_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_collections_bitvector_002';
        console.info(`${caseName} test start`);
        let bitVector = getInitBitVector3()
        let count = 0;
        try {
          for (let i = 0; i < concurrentNum; i++) {
            await taskpool.execute(test_bitvector_002, bitVector, caseName, i).then((res) => {
              res = (res === 0 || res === 1)
              expect(res as boolean)
                .assertTrue()
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
              expect().assertFail()
            })
          }
          expect(bitVector.length).assertEqual(900)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }


        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   test_concurrent_collections_bitvector_003
     * @tc.number SUB_CONCURRENT_BITVECTOR_TEST_0300
     * @tc.desc   test_concurrent_collections_bitvector_003 - test BitVector has method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_collections_bitvector_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_collections_bitvector_003';
        console.info(`${caseName} test start`);
        let bitVector = getInitBitVector2()
        let count = 0;
        try {
          for (let i = 0; i < concurrentNum; i++) {
            await taskpool.execute(test_bitvector_003, bitVector, caseName, i).then((res) => {
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
     * @tc.name   test_concurrent_collections_bitvector_004
     * @tc.number SUB_CONCURRENT_BITVECTOR_TEST_0400
     * @tc.desc   test_concurrent_collections_bitvector_004 - test BitVector setBitsByRange method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_collections_bitvector_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_collections_bitvector_004';
        console.info(`${caseName} test start`);
        let bitVector = getInitBitVector1()
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_bitvector_004, bitVector, caseName, i)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result completed`);
          expect(bitVector.length).assertEqual(5)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   test_concurrent_collections_bitvector_005
     * @tc.number SUB_CONCURRENT_BITVECTOR_TEST_0500
     * @tc.desc   test_concurrent_collections_bitvector_005 - test BitVector setAllBits method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_collections_bitvector_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_collections_bitvector_005';
        console.info(`${caseName} test start`);
        let bitVector = getInitBitVector2()
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_bitvector_005, bitVector, caseName, i)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result completed`);
          expect(bitVector.length).assertEqual(5)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   test_concurrent_collections_bitvector_006
     * @tc.number SUB_CONCURRENT_BITVECTOR_TEST_0600
     * @tc.desc   test_concurrent_collections_bitvector_006 - test BitVector getBitsByRange method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_collections_bitvector_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_collections_bitvector_006';
        console.info(`${caseName} test start`);
        let bitVector = getInitBitVector1()
        let count = 0;
        try {
          for (let i = 0; i < concurrentNum; i++) {
            await taskpool.execute(test_bitvector_006, bitVector, caseName, i).then((res) => {
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
     * @tc.name   test_concurrent_collections_bitvector_007
     * @tc.number SUB_CONCURRENT_BITVECTOR_TEST_0700
     * @tc.desc   test_concurrent_collections_bitvector_007 - test BitVector resize method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_collections_bitvector_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_collections_bitvector_007';
        console.info(`${caseName} test start`);
        let bitVector = getInitBitVector2()
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_bitvector_007, bitVector, caseName, i)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${bitVector.length}`);
          expect(bitVector.length).assertEqual(6)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   test_concurrent_collections_bitvector_008
     * @tc.number SUB_CONCURRENT_BITVECTOR_TEST_0800
     * @tc.desc   test_concurrent_collections_bitvector_008 - test BitVector getBitCountByRange method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_collections_bitvector_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_collections_bitvector_008';
        console.info(`${caseName} test start`);
        let bitVector = getInitBitVector1()
        let count = 0;
        try {
          for (let i = 0; i < concurrentNum; i++) {
            await taskpool.execute(test_bitvector_008, bitVector, caseName, i).then((res) => {
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
     * @tc.name   test_concurrent_collections_bitvector_009
     * @tc.number SUB_CONCURRENT_BITVECTOR_TEST_0900
     * @tc.desc   test_concurrent_collections_bitvector_009 - test BitVector getIndexOf method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_collections_bitvector_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_collections_bitvector_009';
        console.info(`${caseName} test start`);
        let bitVector = getInitBitVector1()
        let count = 0;
        try {
          for (let i = 0; i < concurrentNum; i++) {
            await taskpool.execute(test_bitvector_009, bitVector, caseName, i).then((res) => {
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
     * @tc.name   test_concurrent_collections_bitvector_010
     * @tc.number SUB_CONCURRENT_BITVECTOR_TEST_1000
     * @tc.desc   test_concurrent_collections_bitvector_010 - test BitVector getLastIndexOf method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_collections_bitvector_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_collections_bitvector_010';
        console.info(`${caseName} test start`);
        let bitVector = getInitBitVector1()
        let count = 0;
        try {
          for (let i = 0; i < concurrentNum; i++) {
            await taskpool.execute(test_bitvector_010, bitVector, caseName, i).then((res) => {
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
     * @tc.name   test_concurrent_collections_bitvector_011
     * @tc.number SUB_CONCURRENT_BITVECTOR_TEST_1100
     * @tc.desc   test_concurrent_collections_bitvector_011 - test BitVector index access method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_collections_bitvector_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_collections_bitvector_011';
        console.info(`${caseName} test start`);
        let bitVector = getInitBitVector1()
        let count = 0;
        try {
          for (let i = 0; i < concurrentNum; i++) {
            await taskpool.execute(test_bitvector_011, bitVector, caseName, i).then((res) => {
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
     * @tc.name   test_concurrent_collections_bitvector_012
     * @tc.number SUB_CONCURRENT_BITVECTOR_TEST_1200
     * @tc.desc   test_concurrent_collections_bitvector_012 - test BitVector flipBitByIndex method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_collections_bitvector_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_collections_bitvector_012';
        console.info(`${caseName} test start`);
        let bitVector = getInitBitVector1()
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_bitvector_012, bitVector, caseName, i)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result completed`);
          expect(bitVector.length).assertEqual(5)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   test_concurrent_collections_bitvector_013
     * @tc.number SUB_CONCURRENT_BITVECTOR_TEST_1300
     * @tc.desc   test_concurrent_collections_bitvector_013 - test BitVector flipBitsByRange and values method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_collections_bitvector_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_collections_bitvector_013';
        console.info(`${caseName} test start`);
        let bitVector = getInitBitVector1()
        let count = 0;
        try {
          for (let i = 0; i < concurrentNum; i++) {
            await taskpool.execute(test_bitvector_013, bitVector, caseName, i).then((res) => {
              expect(res as string)
                .assertEqual('completed')
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