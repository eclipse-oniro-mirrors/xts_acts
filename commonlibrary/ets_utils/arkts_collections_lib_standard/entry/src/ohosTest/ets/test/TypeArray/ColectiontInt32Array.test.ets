/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { collections, taskpool } from '@kit.ArkTS';
import { BusinessError } from '@kit.BasicServicesKit';

export function sleep(time: number): Promise<void> {
  return new Promise((re, je) => {
    setTimeout(() => {
      re()
    }, time)
  })
}

@Concurrent
export function testTypeArray(index: number, arr: collections.Int32Array) {
  let tag = 'testTypeArray'
  try {
    for (let i = 0; i < 10; i++) {
      arr.copyWithin(2, 1, 2)
      arr.join('')
      arr.slice(1)
      arr.sort()
      arr.fill(10)
    }
  } catch (e) {
    console.info(`${tag} Task execution catch: ${e.message}, code: ${e.code}`);
  }
}

@Concurrent
export function testTypeArray2(index: number, arr: collections.Uint16Array) {
  let tag = 'testTypeArray2'
  try {
    for (let i = 0; i < 10; i++) {
      arr.copyWithin(2, 1, 2)
      arr.join('')
      arr.slice(1)
      arr.sort()
      arr.fill(10)
    }
  } catch (e) {
    console.info(`${tag} Task execution catch: ${e.message}, code: ${e.code}`);
  }
}

async function asyncSleep(time: number) {
  return await new Promise<number>((resolve) => {
    setTimeout(() => {
      resolve(1)
    }, time)
  })
}

export default function ColectiontInt32Array() {
  describe('ColectiontInt32Array', () => {
    beforeEach(async () => {
      await sleep(100);
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.

    /**
     * @tc.name   CollectionsInt32ArrayTest0100
     * @tc.number SUB_COLLECTION_INT32ARRAY_TEST_0100
     * @tc.desc   TypeArray join 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsInt32ArrayTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsInt32ArrayTest0100';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr: collections.Int32Array = new collections.Int32Array(12);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testTypeArray, i, arr).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            arr.copyWithin(3, 1, 3)
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200201)
        }
        while (count < 100) {
          await asyncSleep(100)
        }
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   CollectionsInt32ArrayTest0200
     * @tc.number SUB_COLLECTION_INT32ARRAY_TEST_0200
     * @tc.desc   TypeArray every 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsInt32ArrayTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsInt32ArrayTest0200';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr: collections.Int32Array = new collections.Int32Array(12);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testTypeArray, i, arr).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            arr.every((element: number) => element > 0);
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200201)
        }
        while (count < 100) {
          await asyncSleep(100)
        }
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   CollectionsInt32ArrayTest0300
     * @tc.number SUB_COLLECTION_INT32ARRAY_TEST_0300
     * @tc.desc   TypeArray filter 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsInt32ArrayTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsInt32ArrayTest0300';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr: collections.Int32Array = new collections.Int32Array(12);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testTypeArray, i, arr).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            arr.filter((element: number) => element > 0);
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200201)
        }
        while (count < 100) {
          await asyncSleep(100)
        }
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   CollectionsInt32ArrayTest0400
     * @tc.number SUB_COLLECTION_INT32ARRAY_TEST_0400
     * @tc.desc   TypeArray filter 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsInt32ArrayTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsInt32ArrayTest0400';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr: collections.Int32Array = new collections.Int32Array(12);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testTypeArray, i, arr).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            arr.find((element: number) => element > 0);
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200201)
        }
        while (count < 100) {
          await asyncSleep(100)
        }
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   CollectionsInt32ArrayTest0500
     * @tc.number SUB_COLLECTION_INT32ARRAY_TEST_0500
     * @tc.desc   TypeArray findIndex 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsInt32ArrayTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsInt32ArrayTest0500';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr: collections.Int32Array = new collections.Int32Array(12);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testTypeArray, i, arr).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            arr.findIndex((element: number) => element > 0);
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200201)
        }
        while (count < 100) {
          await asyncSleep(100)
        }
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   CollectionsInt32ArrayTest0600
     * @tc.number SUB_COLLECTION_INT32ARRAY_TEST_0600
     * @tc.desc   TypeArray indexOf 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsInt32ArrayTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsInt32ArrayTest0600';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr: collections.Int32Array = new collections.Int32Array(12);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testTypeArray, i, arr).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            arr.indexOf(1);
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200201)
        }
        while (count < 100) {
          await asyncSleep(100)
        }
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   CollectionsInt32ArrayTest0700
     * @tc.number SUB_COLLECTION_INT32ARRAY_TEST_0700
     * @tc.desc   TypeArray join 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsInt32ArrayTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsInt32ArrayTest0700';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr: collections.Int32Array = new collections.Int32Array(12);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testTypeArray, i, arr).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            arr.join('1');
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200201)
        }
        while (count < 100) {
          await asyncSleep(100)
        }
        console.info(`${caseName} test end`);
        done()
      })


    /**
     * @tc.name   CollectionsInt32ArrayTest0800
     * @tc.number SUB_COLLECTION_INT32ARRAY_TEST_0800
     * @tc.desc   TypeArray map 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsInt32ArrayTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsInt32ArrayTest0800';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr: collections.Int32Array = new collections.Int32Array(12);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testTypeArray, i, arr).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            arr.map(Math.sqrt);
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200201)
        }
        while (count < 100) {
          await asyncSleep(100)
        }
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   CollectionsInt32ArrayTest0900
     * @tc.number SUB_COLLECTION_INT32ARRAY_TEST_0900
     * @tc.desc   TypeArray reduce 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsInt32ArrayTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsInt32ArrayTest0900';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr: collections.Int32Array = new collections.Int32Array(12);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testTypeArray, i, arr).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            arr.reduce<string>((accumulator: string, value: number) => accumulator + value, 'initialValue');
            ;
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200201)
        }
        while (count < 100) {
          await asyncSleep(100)
        }
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   CollectionsInt32ArrayTest0901
     * @tc.number SUB_COLLECTION_INT32ARRAY_TEST_0901
     * @tc.desc   TypeArray reduce 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsInt32ArrayTest0901', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsInt32ArrayTest0901';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr: collections.Int32Array = new collections.Int32Array(12);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testTypeArray, i, arr).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            arr.reduce((accumulator: number, value: number) => accumulator + value, 1);
            ;
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200201)
        }
        while (count < 100) {
          await asyncSleep(100)
        }
        console.info(`${caseName} test end`);
        done()
      })
    /**
     * @tc.name   CollectionsInt32ArrayTest09011
     * @tc.number SUB_COLLECTION_INT32ARRAY_TEST_09011
     * @tc.desc   TypeArray reduce 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsInt32ArrayTest09011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsInt32ArrayTest09011';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr: collections.Int32Array = new collections.Int32Array(12);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testTypeArray, i, arr).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            arr.reduce((accumulator: number, value: number) => accumulator + value);
            ;
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200201)
        }
        while (count < 100) {
          await asyncSleep(100)
        }
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   CollectionsInt32ArrayTest1000
     * @tc.number SUB_COLLECTION_INT32ARRAY_TEST_1000
     * @tc.desc   TypeArray reverse 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsInt32ArrayTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsInt32ArrayTest1000';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr: collections.Int32Array = new collections.Int32Array(12);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testTypeArray, i, arr).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            arr.reverse();
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200201)
        }
        while (count < 100) {
          await asyncSleep(100)
        }
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   CollectionsInt32ArrayTest1100
     * @tc.number SUB_COLLECTION_INT32ARRAY_TEST_1100
     * @tc.desc   TypeArray set 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsInt32ArrayTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsInt32ArrayTest1100';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr: collections.Int32Array = new collections.Int32Array(12);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testTypeArray, i, arr).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            arr.set([1, 2, 3], 3);
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200201)
        }
        while (count < 100) {
          await asyncSleep(100)
        }
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   CollectionsInt32ArrayTest1200
     * @tc.number SUB_COLLECTION_INT32ARRAY_TEST_1200
     * @tc.desc   TypeArray slice 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsInt32ArrayTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsInt32ArrayTest1200';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr: collections.Int32Array = new collections.Int32Array(12);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testTypeArray, i, arr).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            arr.slice(1, 3);
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200201)
        }
        while (count < 100) {
          await asyncSleep(100)
        }
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   CollectionsInt32ArrayTest1201
     * @tc.number SUB_COLLECTION_INT32ARRAY_TEST_1201
     * @tc.desc   TypeArray some 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsInt32ArrayTest1201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsInt32ArrayTest1201';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr: collections.Int32Array = new collections.Int32Array(12);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testTypeArray, i, arr).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            arr.some((element: number) => element < 0);
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200201)
        }
        while (count < 100) {
          await asyncSleep(100)
        }
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   CollectionsInt32ArrayTest1300
     * @tc.number SUB_COLLECTION_INT32ARRAY_TEST_1300
     * @tc.desc   TypeArray sort 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsInt32ArrayTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsInt32ArrayTest1300';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr: collections.Int32Array = new collections.Int32Array(12);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testTypeArray, i, arr).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            arr.sort((a: number, b: number) => a - b);
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200201)
        }
        while (count < 100) {
          await asyncSleep(100)
        }
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   CollectionsInt32ArrayTest1400
     * @tc.number SUB_COLLECTION_INT32ARRAY_TEST_1400
     * @tc.desc   TypeArray subarray 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsInt32ArrayTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsInt32ArrayTest1400';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr: collections.Int32Array = new collections.Int32Array(12);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testTypeArray, i, arr).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            arr.subarray();
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200201)
        }
        while (count < 100) {
          await asyncSleep(100)
        }
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   CollectionsInt32ArrayTest1500
     * @tc.number SUB_COLLECTION_INT32ARRAY_TEST_1500
     * @tc.desc   TypeArray at 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsInt32ArrayTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsInt32ArrayTest1500';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr: collections.Int32Array = new collections.Int32Array(12);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testTypeArray, i, arr).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            arr.at(-1);
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200201)
        }
        while (count < 100) {
          await asyncSleep(100)
        }
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   CollectionsInt32ArrayTest1600
     * @tc.number SUB_COLLECTION_INT32ARRAY_TEST_1600
     * @tc.desc   TypeArray entries 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsInt32ArrayTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsInt32ArrayTest1600';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr: collections.Int32Array = new collections.Int32Array(12);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testTypeArray, i, arr).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            arr.entries();
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200201)
        }
        while (count < 100) {
          await asyncSleep(100)
        }
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   CollectionsInt32ArrayTest1700
     * @tc.number SUB_COLLECTION_INT32ARRAY_TEST_1700
     * @tc.desc   TypeArray keys 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsInt32ArrayTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsInt32ArrayTest1700';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr: collections.Int32Array = new collections.Int32Array(12);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testTypeArray, i, arr).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            arr.keys();
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200201)
        }
        while (count < 100) {
          await asyncSleep(100)
        }
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   CollectionsInt32ArrayTest1800
     * @tc.number SUB_COLLECTION_INT32ARRAY_TEST_1800
     * @tc.desc   TypeArray values 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsInt32ArrayTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsInt32ArrayTest1800';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr: collections.Int32Array = new collections.Int32Array(12);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testTypeArray, i, arr).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            arr.values();
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200201)
        }
        while (count < 100) {
          await asyncSleep(100)
        }
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   CollectionsInt32ArrayTest1900
     * @tc.number SUB_COLLECTION_INT32ARRAY_TEST_1900
     * @tc.desc   TypeArray includes 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsInt32ArrayTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsInt32ArrayTest1900';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr: collections.Int32Array = new collections.Int32Array(12);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testTypeArray, i, arr).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            arr.includes(1);
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200201)
        }
        while (count < 100) {
          await asyncSleep(100)
        }
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   CollectionsInt32ArrayTest2000
     * @tc.number SUB_COLLECTION_INT32ARRAY_TEST_2000
     * @tc.desc   TypeArray reduceRight 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsInt32ArrayTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsInt32ArrayTest2000';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr: collections.Int32Array = new collections.Int32Array(12);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testTypeArray, i, arr).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            arr.reduceRight((accumulator: number, value: number) => accumulator + value);
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200201)
        }
        while (count < 100) {
          await asyncSleep(100)
        }
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   CollectionsInt32ArrayTest2100
     * @tc.number SUB_COLLECTION_INT32ARRAY_TEST_2100
     * @tc.desc   TypeArray reduceRight 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsInt32ArrayTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsInt32ArrayTest2100';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr: collections.Int32Array = new collections.Int32Array(12);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testTypeArray, i, arr).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            arr.reduceRight<number>((accumulator: number, value: number) => accumulator + value, 1);
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200201)
        }
        while (count < 100) {
          await asyncSleep(100)
        }
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   CollectionsInt32ArrayTest2200
     * @tc.number SUB_COLLECTION_INT32ARRAY_TEST_2200
     * @tc.desc   TypeArray toString 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsInt32ArrayTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsInt32ArrayTest2200';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr: collections.Int32Array = new collections.Int32Array(12);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testTypeArray, i, arr).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            arr.toString();
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200201)
        }
        while (count < 100) {
          await asyncSleep(100)
        }
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   CollectionsInt32ArrayTest2300
     * @tc.number SUB_COLLECTION_INT32ARRAY_TEST_2300
     * @tc.desc   TypeArray toLocaleString 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsInt32ArrayTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsInt32ArrayTest2300';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr: collections.Int32Array = new collections.Int32Array(12);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testTypeArray, i, arr).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            arr.toLocaleString();
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200201)
        }
        while (count < 100) {
          await asyncSleep(100)
        }
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   CollectionsInt32ArrayTest2400
     * @tc.number SUB_COLLECTION_INT32ARRAY_TEST_2400
     * @tc.desc   TypeArray toLocaleString 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsInt32ArrayTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsInt32ArrayTest2400';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr: collections.Int32Array = new collections.Int32Array(12);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testTypeArray, i, arr).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            arr.lastIndexOf(0, 0);
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200201)
        }
        while (count < 100) {
          await asyncSleep(100)
        }
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   CollectionsUint16ArrayTest0100
     * @tc.number SUB_COLLECTION_UINT16ARRAY_TEST_0100
     * @tc.desc   TypeArray join 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsUint16ArrayTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsUint16ArrayTest0100';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr: collections.Uint16Array = new collections.Uint16Array(12);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testTypeArray2, i, arr).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            arr.copyWithin(3, 1, 3)
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200201)
        }
        while (count < 100) {
          await asyncSleep(100)
        }
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   CollectionsUint16ArrayTest0200
     * @tc.number SUB_COLLECTION_UINT16ARRAY_TEST_0200
     * @tc.desc   TypeArray every 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsUint16ArrayTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsUint16ArrayTest0200';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr: collections.Uint16Array = new collections.Uint16Array(12);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testTypeArray2, i, arr).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            arr.every((element: number) => element > 0);
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200201)
        }
        while (count < 100) {
          await asyncSleep(100)
        }
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   CollectionsUint16ArrayTest0300
     * @tc.number SUB_COLLECTION_UINT16ARRAY_TEST_0300
     * @tc.desc   TypeArray filter 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsUint16ArrayTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsUint16ArrayTest0300';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr: collections.Uint16Array = new collections.Uint16Array(12);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testTypeArray2, i, arr).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            arr.filter((element: number) => element > 0);
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200201)
        }
        while (count < 100) {
          await asyncSleep(100)
        }
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   CollectionsUint16ArrayTest0400
     * @tc.number SUB_COLLECTION_UINT16ARRAY_TEST_0400
     * @tc.desc   TypeArray filter 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsUint16ArrayTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsUint16ArrayTest0400';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr: collections.Uint16Array = new collections.Uint16Array(12);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testTypeArray2, i, arr).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            arr.find((element: number) => element > 0);
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200201)
        }
        while (count < 100) {
          await asyncSleep(100)
        }
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   CollectionsUint16ArrayTest0500
     * @tc.number SUB_COLLECTION_UINT16ARRAY_TEST_0500
     * @tc.desc   TypeArray findIndex 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsUint16ArrayTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsUint16ArrayTest0500';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr: collections.Uint16Array = new collections.Uint16Array(12);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testTypeArray2, i, arr).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            arr.findIndex((element: number) => element > 0);
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200201)
        }
        while (count < 100) {
          await asyncSleep(100)
        }
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   CollectionsUint16ArrayTest0600
     * @tc.number SUB_COLLECTION_UINT16ARRAY_TEST_0600
     * @tc.desc   TypeArray indexOf 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsUint16ArrayTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsUint16ArrayTest0600';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr: collections.Uint16Array = new collections.Uint16Array(12);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testTypeArray2, i, arr).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            arr.indexOf(1);
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200201)
        }
        while (count < 100) {
          await asyncSleep(100)
        }
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   CollectionsUint16ArrayTest0700
     * @tc.number SUB_COLLECTION_UINT16ARRAY_TEST_0700
     * @tc.desc   TypeArray join 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsUint16ArrayTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsUint16ArrayTest0700';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr: collections.Uint16Array = new collections.Uint16Array(12);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testTypeArray2, i, arr).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            arr.join('1');
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200201)
        }
        while (count < 100) {
          await asyncSleep(100)
        }
        console.info(`${caseName} test end`);
        done()
      })


    /**
     * @tc.name   CollectionsUint16ArrayTest0800
     * @tc.number SUB_COLLECTION_UINT16ARRAY_TEST_0800
     * @tc.desc   TypeArray map 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsUint16ArrayTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsUint16ArrayTest0800';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr: collections.Uint16Array = new collections.Uint16Array(12);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testTypeArray2, i, arr).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            arr.map(Math.sqrt);
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200201)
        }
        while (count < 100) {
          await asyncSleep(100)
        }
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   CollectionsUint16ArrayTest0900
     * @tc.number SUB_COLLECTION_UINT16ARRAY_TEST_0900
     * @tc.desc   TypeArray reduce 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsUint16ArrayTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsUint16ArrayTest0900';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr: collections.Uint16Array = new collections.Uint16Array(12);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testTypeArray2, i, arr).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            arr.reduce<string>((accumulator: string, value: number) => accumulator + value, 'initialValue');
            ;
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200201)
        }
        while (count < 100) {
          await asyncSleep(100)
        }
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   CollectionsUint16ArrayTest0901
     * @tc.number SUB_COLLECTION_UINT16ARRAY_TEST_0901
     * @tc.desc   TypeArray reduce 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsUint16ArrayTest0901', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsUint16ArrayTest0901';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr: collections.Uint16Array = new collections.Uint16Array(12);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testTypeArray2, i, arr).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            arr.reduce((accumulator: number, value: number) => accumulator + value, 1);
            ;
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200201)
        }
        while (count < 100) {
          await asyncSleep(100)
        }
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   CollectionsUint16ArrayTest1000
     * @tc.number SUB_COLLECTION_UINT16ARRAY_TEST_1000
     * @tc.desc   TypeArray reverse 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsUint16ArrayTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsUint16ArrayTest1000';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr: collections.Uint16Array = new collections.Uint16Array(12);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testTypeArray2, i, arr).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            arr.reverse();
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200201)
        }
        while (count < 100) {
          await asyncSleep(100)
        }
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   CollectionsUint16ArrayTest1100
     * @tc.number SUB_COLLECTION_UINT16ARRAY_TEST_1100
     * @tc.desc   TypeArray set 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsUint16ArrayTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsUint16ArrayTest1100';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr: collections.Uint16Array = new collections.Uint16Array(12);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testTypeArray2, i, arr).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            arr.set([1, 2, 3], 3);
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200201)
        }
        while (count < 100) {
          await asyncSleep(100)
        }
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   CollectionsUint16ArrayTest1200
     * @tc.number SUB_COLLECTION_UINT16ARRAY_TEST_1200
     * @tc.desc   TypeArray slice 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsUint16ArrayTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsUint16ArrayTest1200';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr: collections.Uint16Array = new collections.Uint16Array(12);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testTypeArray2, i, arr).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            arr.slice(1, 3);
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200201)
        }
        while (count < 100) {
          await asyncSleep(100)
        }
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   CollectionsUint16ArrayTest1201
     * @tc.number SUB_COLLECTION_UINT16ARRAY_TEST_1201
     * @tc.desc   TypeArray some 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsUint16ArrayTest1201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsUint16ArrayTest1201';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr: collections.Uint16Array = new collections.Uint16Array(12);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testTypeArray2, i, arr).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            arr.some((element: number) => element < 0);
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200201)
        }
        while (count < 100) {
          await asyncSleep(100)
        }
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   CollectionsUint16ArrayTest1300
     * @tc.number SUB_COLLECTION_UINT16ARRAY_TEST_1300
     * @tc.desc   TypeArray sort 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsUint16ArrayTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsUint16ArrayTest1300';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr: collections.Uint16Array = new collections.Uint16Array(12);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testTypeArray2, i, arr).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            arr.sort((a: number, b: number) => a - b);
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200201)
        }
        while (count < 100) {
          await asyncSleep(100)
        }
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   CollectionsUint16ArrayTest1400
     * @tc.number SUB_COLLECTION_UINT16ARRAY_TEST_1400
     * @tc.desc   TypeArray subarray 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsUint16ArrayTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsUint16ArrayTest1400';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr: collections.Uint16Array = new collections.Uint16Array(12);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testTypeArray2, i, arr).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            arr.subarray();
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200201)
        }
        while (count < 100) {
          await asyncSleep(100)
        }
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   CollectionsUint16ArrayTest1500
     * @tc.number SUB_COLLECTION_UINT16ARRAY_TEST_1500
     * @tc.desc   TypeArray at 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsUint16ArrayTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsUint16ArrayTest1500';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr: collections.Uint16Array = new collections.Uint16Array(12);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testTypeArray2, i, arr).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            arr.at(-1);
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200201)
        }
        while (count < 100) {
          await asyncSleep(100)
        }
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   CollectionsUint16ArrayTest1600
     * @tc.number SUB_COLLECTION_UINT16ARRAY_TEST_1600
     * @tc.desc   TypeArray entries 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsUint16ArrayTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsUint16ArrayTest1600';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr: collections.Uint16Array = new collections.Uint16Array(12);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testTypeArray2, i, arr).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            arr.entries();
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200201)
        }
        while (count < 100) {
          await asyncSleep(100)
        }
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   CollectionsUint16ArrayTest1700
     * @tc.number SUB_COLLECTION_UINT16ARRAY_TEST_1700
     * @tc.desc   TypeArray keys 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsUint16ArrayTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsUint16ArrayTest1700';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr: collections.Uint16Array = new collections.Uint16Array(12);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testTypeArray2, i, arr).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            arr.keys();
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200201)
        }
        while (count < 100) {
          await asyncSleep(100)
        }
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   CollectionsUint16ArrayTest1800
     * @tc.number SUB_COLLECTION_UINT16ARRAY_TEST_1800
     * @tc.desc   TypeArray values 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsUint16ArrayTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsUint16ArrayTest1800';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr: collections.Uint16Array = new collections.Uint16Array(12);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testTypeArray2, i, arr).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            arr.values();
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200201)
        }
        while (count < 100) {
          await asyncSleep(100)
        }
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   CollectionsUint16ArrayTest1900
     * @tc.number SUB_COLLECTION_UINT16ARRAY_TEST_1900
     * @tc.desc   TypeArray includes 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsUint16ArrayTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsUint16ArrayTest1900';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr: collections.Uint16Array = new collections.Uint16Array(12);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testTypeArray2, i, arr).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            arr.includes(1);
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200201)
        }
        while (count < 100) {
          await asyncSleep(100)
        }
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   CollectionsUint16ArrayTest2000
     * @tc.number SUB_COLLECTION_UINT16ARRAY_TEST_2000
     * @tc.desc   TypeArray reduceRight 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsUint16ArrayTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsUint16ArrayTest2000';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr: collections.Uint16Array = new collections.Uint16Array(12);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testTypeArray2, i, arr).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            arr.reduceRight((accumulator: number, value: number) => accumulator + value);
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200201)
        }
        while (count < 100) {
          await asyncSleep(100)
        }
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   CollectionsUint16ArrayTest2100
     * @tc.number SUB_COLLECTION_UINT16ARRAY_TEST_2100
     * @tc.desc   TypeArray reduceRight 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsUint16ArrayTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsUint16ArrayTest2100';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr: collections.Uint16Array = new collections.Uint16Array(12);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testTypeArray2, i, arr).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            arr.reduceRight<number>((accumulator: number, value: number) => accumulator + value, 1);
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200201)
        }
        while (count < 100) {
          await asyncSleep(100)
        }
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   CollectionsUint16ArrayTest2200
     * @tc.number SUB_COLLECTION_UINT16ARRAY_TEST_2200
     * @tc.desc   TypeArray toString 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsUint16ArrayTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsUint16ArrayTest2200';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr: collections.Uint16Array = new collections.Uint16Array(12);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testTypeArray2, i, arr).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            arr.toString();
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200201)
        }
        while (count < 100) {
          await asyncSleep(100)
        }
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   CollectionsUint16ArrayTest2300
     * @tc.number SUB_COLLECTION_UINT16ARRAY_TEST_2300
     * @tc.desc   TypeArray toLocaleString 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsUint16ArrayTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsUint16ArrayTest2300';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr: collections.Uint16Array = new collections.Uint16Array(12);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testTypeArray2, i, arr).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            arr.toLocaleString();
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200201)
        }
        while (count < 100) {
          await asyncSleep(100)
        }
        console.info(`${caseName} test end`);
        done()
      })
    /**
     * @tc.name   CollectionsUint16ArrayTest2400
     * @tc.number SUB_COLLECTION_UINT16ARRAY_TEST_2400
     * @tc.desc   TypeArray toLocaleString 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsUint16ArrayTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsUint16ArrayTest2400';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr: collections.Uint16Array = new collections.Uint16Array(12);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testTypeArray2, i, arr).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            arr.fill(1);
            arr.fill(1, 0);
            arr.fill(1, 0, 2);
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200201)
        }
        while (count < 100) {
          await asyncSleep(100)
        }
        console.info(`${caseName} test end`);
        done()
      })
    /**
     * @tc.name   CollectionsUint16ArrayTest2500
     * @tc.number SUB_COLLECTION_UINT16ARRAY_TEST_2500
     * @tc.desc   TypeArray toLocaleString 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsUint16ArrayTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsUint16ArrayTest2500';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr: collections.Uint16Array = new collections.Uint16Array(12);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testTypeArray2, i, arr).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            arr.forEach(() => {
            });
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200201)
        }
        while (count < 100) {
          await asyncSleep(100)
        }
        console.info(`${caseName} test end`);
        done()
      })
    /**
     * @tc.name   CollectionsUint16ArrayTest2600
     * @tc.number SUB_COLLECTION_UINT16ARRAY_TEST_2600
     * @tc.desc   TypeArray toLocaleString 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsUint16ArrayTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsUint16ArrayTest2600';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr: collections.Uint16Array = new collections.Uint16Array(12);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testTypeArray2, i, arr).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            arr.reduce((accumulator: number, value: number) => accumulator + value);
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200201)
        }
        while (count < 100) {
          await asyncSleep(100)
        }
        console.info(`${caseName} test end`);
        done()
      })
    /**
     * @tc.name   CollectionsUint16ArrayTest2700
     * @tc.number SUB_COLLECTION_UINT16ARRAY_TEST_2700
     * @tc.desc   TypeArray toLocaleString 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsUint16ArrayTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsUint16ArrayTest2700';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr: collections.Uint16Array = new collections.Uint16Array(12);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testTypeArray2, i, arr).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            arr.lastIndexOf(0, 0);
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200201)
        }
        while (count < 100) {
          await asyncSleep(100)
        }
        console.info(`${caseName} test end`);
        done()
      })
  })
}