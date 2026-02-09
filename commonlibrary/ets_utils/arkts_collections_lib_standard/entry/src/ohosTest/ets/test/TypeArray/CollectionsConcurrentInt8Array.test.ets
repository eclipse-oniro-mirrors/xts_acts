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
export function testModifyArray(index: number, arr: collections.Array<number>) {
  let tag = 'testModifyArray'
  try {
    for (let i = 0; i < 10; i++) {
      arr.push(1)
      arr.join('')
      arr.shift()
      arr.unshift(2)
      arr.slice(1)
      arr.sort()
      arr.fill(10)
    }
  } catch (e) {
    console.info(`${tag} Task execution catch: ${e.message}, code: ${e.code}`);
  }
}

@Concurrent
export function testModifyInt8Array(index: number, arr: collections.Int8Array) {
  let tag = 'testModifyArray'
  try {
    for (let i = 0; i < 10; i++) {
      arr.copyWithin(3,1,3)
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
export default function collectionsConcurrentInt8Array() {
  describe('collectionsConcurrentInt8Array', () => {
    beforeEach(async () => {
      await sleep(100);
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.



    /**
     * @tc.name   CollectionsConcurrentModifyTest4001
     * @tc.number SUB_COLLECTION_CONCURRENT_MODIFY_4001
     * @tc.desc   ConcatArray copyWithin 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsConcurrentModifyTest4001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsConcurrentModifyTest4001';
        console.info(`${caseName} test start`);
        let count = 0;
        let int8Array: collections.Int8Array = new collections.Int8Array(10);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testModifyInt8Array, i, int8Array).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            int8Array.copyWithin(3,1,3)
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
     * @tc.name   CollectionsConcurrentModifyTest4000
     * @tc.number SUB_COLLECTION_CONCURRENT_MODIFY_4000
     * @tc.desc   ConcatArray every 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsConcurrentModifyTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsConcurrentModifyTest4000';
        console.info(`${caseName} test start`);
        let count = 0;
        let int8Array: collections.Int8Array = new collections.Int8Array(10);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testModifyInt8Array, i, int8Array).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            int8Array.every((element: number) => element > 0)
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
     * @tc.name   CollectionsConcurrentModifyTest4100
     * @tc.number SUB_COLLECTION_CONCURRENT_MODIFY_4100
     * @tc.desc   ConcatArray filter 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsConcurrentModifyTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsConcurrentModifyTest4100';
        console.info(`${caseName} test start`);
        let count = 0;
        let int8Array: collections.Int8Array = new collections.Int8Array(10);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testModifyInt8Array, i, int8Array).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            int8Array.filter((element: number) => element % 2 == 0)
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
     * @tc.name   CollectionsConcurrentModifyTest4200
     * @tc.number SUB_COLLECTION_CONCURRENT_MODIFY_4200
     * @tc.desc   ConcatArray find 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsConcurrentModifyTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsConcurrentModifyTest4200';
        console.info(`${caseName} test start`);
        let count = 0;
        let int8Array: collections.Int8Array = new collections.Int8Array(10);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testModifyInt8Array, i, int8Array).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            int8Array.find((element: number) => element > 2)
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
     * @tc.name   CollectionsConcurrentModifyTest4300
     * @tc.number SUB_COLLECTION_CONCURRENT_MODIFY_4300
     * @tc.desc   ConcatArray findIndex 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsConcurrentModifyTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsConcurrentModifyTest4300';
        console.info(`${caseName} test start`);
        let count = 0;
        let int8Array: collections.Int8Array = new collections.Int8Array(10);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testModifyInt8Array, i, int8Array).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            int8Array.findIndex((value: number) => value % 2 === 0)
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
     * @tc.name   CollectionsConcurrentModifyTest4400
     * @tc.number SUB_COLLECTION_CONCURRENT_MODIFY_4400
     * @tc.desc   ConcatArray indexOf 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsConcurrentModifyTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsConcurrentModifyTest4400';
        console.info(`${caseName} test start`);
        let count = 0;
        let int8Array: collections.Int8Array = new collections.Int8Array(10);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testModifyInt8Array, i, int8Array).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            int8Array.indexOf(3)
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
     * @tc.name   CollectionsConcurrentModifyTest4500
     * @tc.number SUB_COLLECTION_CONCURRENT_MODIFY_4500
     * @tc.desc   ConcatArray join 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsConcurrentModifyTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsConcurrentModifyTest4500';
        console.info(`${caseName} test start`);
        let count = 0;
        let int8Array: collections.Int8Array = new collections.Int8Array(10);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testModifyInt8Array, i, int8Array).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            int8Array.join('-')
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
     * @tc.name   CollectionsConcurrentModifyTest4600
     * @tc.number SUB_COLLECTION_CONCURRENT_MODIFY_4600
     * @tc.desc   ConcatArray map 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsConcurrentModifyTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsConcurrentModifyTest4600';
        console.info(`${caseName} test start`);
        let count = 0;
        let int8Array: collections.Int8Array = new collections.Int8Array(10);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testModifyInt8Array, i, int8Array).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            int8Array.map(Math.sqrt)
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
     * @tc.name   CollectionsConcurrentModifyTest4700
     * @tc.number SUB_COLLECTION_CONCURRENT_MODIFY_4700
     * @tc.desc   ConcatArray reduce1 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsConcurrentModifyTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsConcurrentModifyTest4700';
        console.info(`${caseName} test start`);
        let count = 0;
        let int8Array: collections.Int8Array = new collections.Int8Array(10);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testModifyInt8Array, i, int8Array).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            int8Array.reduce((accumulator: number, value: number) => accumulator + value)
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
     * @tc.name   CollectionsConcurrentModifyTest4800
     * @tc.number SUB_COLLECTION_CONCURRENT_MODIFY_4800
     * @tc.desc   ConcatArray reduce2 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsConcurrentModifyTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsConcurrentModifyTest4800';
        console.info(`${caseName} test start`);
        let count = 0;
        let int8Array: collections.Int8Array = new collections.Int8Array(10);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testModifyInt8Array, i, int8Array).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            int8Array.reduce((accumulator: number, value: number) => accumulator + value)
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
     * @tc.name   CollectionsConcurrentModifyTest4900
     * @tc.number SUB_COLLECTION_CONCURRENT_MODIFY_4900
     * @tc.desc   ConcatArray reduce3 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsConcurrentModifyTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsConcurrentModifyTest4900';
        console.info(`${caseName} test start`);
        let count = 0;
        let int8Array: collections.Int8Array = new collections.Int8Array(10);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testModifyInt8Array, i, int8Array).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            int8Array.reduce((accumulator: number, value: number) => accumulator + value, 1)
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
     * @tc.name   CollectionsConcurrentModifyTest5000
     * @tc.number SUB_COLLECTION_CONCURRENT_MODIFY_5000
     * @tc.desc   ConcatArray reverse 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsConcurrentModifyTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsConcurrentModifyTest5000';
        console.info(`${caseName} test start`);
        let count = 0;
        let int8Array: collections.Int8Array = new collections.Int8Array(10);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testModifyInt8Array, i, int8Array).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            int8Array.reverse()
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
     * @tc.name   CollectionsConcurrentModifyTest5100
     * @tc.number SUB_COLLECTION_CONCURRENT_MODIFY_5100
     * @tc.desc   ConcatArray set 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsConcurrentModifyTest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsConcurrentModifyTest5100';
        console.info(`${caseName} test start`);
        let count = 0;
        let int8Array: collections.Int8Array = new collections.Int8Array(10);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testModifyInt8Array, i, int8Array).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            int8Array.set([1, 2, 3], 3)
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
     * @tc.name   CollectionsConcurrentModifyTest5200
     * @tc.number SUB_COLLECTION_CONCURRENT_MODIFY_5200
     * @tc.desc   ConcatArray slice 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsConcurrentModifyTest5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsConcurrentModifyTest5200';
        console.info(`${caseName} test start`);
        let count = 0;
        let int8Array: collections.Int8Array = new collections.Int8Array(10);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testModifyInt8Array, i, int8Array).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            int8Array.slice(2)
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
     * @tc.name   CollectionsConcurrentModifyTest5300
     * @tc.number SUB_COLLECTION_CONCURRENT_MODIFY_5300
     * @tc.desc   ConcatArray some 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsConcurrentModifyTest5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsConcurrentModifyTest5300';
        console.info(`${caseName} test start`);
        let count = 0;
        let int8Array: collections.Int8Array = new collections.Int8Array(10);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testModifyInt8Array, i, int8Array).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            int8Array.some((element: number) => element < 0)
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
     * @tc.name   CollectionsConcurrentModifyTest5400
     * @tc.number SUB_COLLECTION_CONCURRENT_MODIFY_5400
     * @tc.desc   ConcatArray sort 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsConcurrentModifyTest5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsConcurrentModifyTest5400';
        console.info(`${caseName} test start`);
        let count = 0;
        let int8Array: collections.Int8Array = new collections.Int8Array(10);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testModifyInt8Array, i, int8Array).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            int8Array.sort((a: number, b: number) => a - b)
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
     * @tc.name   CollectionsConcurrentModifyTest5500
     * @tc.number SUB_COLLECTION_CONCURRENT_MODIFY_5500
     * @tc.desc   ConcatArray subarray 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsConcurrentModifyTest5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsConcurrentModifyTest5500';
        console.info(`${caseName} test start`);
        let count = 0;
        let int8Array: collections.Int8Array = new collections.Int8Array(10);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testModifyInt8Array, i, int8Array).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            int8Array.subarray(1,2)
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
     * @tc.name   CollectionsConcurrentModifyTest5600
     * @tc.number SUB_COLLECTION_CONCURRENT_MODIFY_5600
     * @tc.desc   ConcatArray at 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsConcurrentModifyTest5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsConcurrentModifyTest5600';
        console.info(`${caseName} test start`);
        let count = 0;
        let int8Array: collections.Int8Array = new collections.Int8Array(10);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testModifyInt8Array, i, int8Array).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            int8Array.at(3)
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
     * @tc.name   CollectionsConcurrentModifyTest5700
     * @tc.number SUB_COLLECTION_CONCURRENT_MODIFY_5700
     * @tc.desc   ConcatArray entries 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsConcurrentModifyTest5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsConcurrentModifyTest5700';
        console.info(`${caseName} test start`);
        let count = 0;
        let int8Array: collections.Int8Array = new collections.Int8Array(10);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testModifyInt8Array, i, int8Array).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            int8Array.entries()
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
     * @tc.name   CollectionsConcurrentModifyTest5800
     * @tc.number SUB_COLLECTION_CONCURRENT_MODIFY_5800
     * @tc.desc   ConcatArray keys 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsConcurrentModifyTest5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsConcurrentModifyTest5800';
        console.info(`${caseName} test start`);
        let count = 0;
        let int8Array: collections.Int8Array = new collections.Int8Array(10);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testModifyInt8Array, i, int8Array).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            int8Array.keys()
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
     * @tc.name   CollectionsConcurrentModifyTest5900
     * @tc.number SUB_COLLECTION_CONCURRENT_MODIFY_5900
     * @tc.desc   ConcatArray values 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsConcurrentModifyTest5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsConcurrentModifyTest5900';
        console.info(`${caseName} test start`);
        let count = 0;
        let int8Array: collections.Int8Array = new collections.Int8Array(10);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testModifyInt8Array, i, int8Array).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            int8Array.values()
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
     * @tc.name   CollectionsConcurrentModifyTest6000
     * @tc.number SUB_COLLECTION_CONCURRENT_MODIFY_6000
     * @tc.desc   ConcatArray includes 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsConcurrentModifyTest6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsConcurrentModifyTest6000';
        console.info(`${caseName} test start`);
        let count = 0;
        let int8Array: collections.Int8Array = new collections.Int8Array(10);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testModifyInt8Array, i, int8Array).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            int8Array.includes(2)
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
     * @tc.name   CollectionsConcurrentModifyTest6100
     * @tc.number SUB_COLLECTION_CONCURRENT_MODIFY_6100
     * @tc.desc   ConcatArray reduceRight1 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsConcurrentModifyTest6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsConcurrentModifyTest6100';
        console.info(`${caseName} test start`);
        let count = 0;
        let int8Array: collections.Int8Array = new collections.Int8Array(10);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testModifyInt8Array, i, int8Array).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            int8Array.reduceRight((accumulator: number, value: number) => accumulator + value, 1)
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
     * @tc.name   CollectionsConcurrentModifyTest6200
     * @tc.number SUB_COLLECTION_CONCURRENT_MODIFY_6200
     * @tc.desc   ConcatArray reduceRight2 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsConcurrentModifyTest6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsConcurrentModifyTest6200';
        console.info(`${caseName} test start`);
        let count = 0;
        let int8Array: collections.Int8Array = new collections.Int8Array(10);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testModifyInt8Array, i, int8Array).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            int8Array.reduceRight((accumulator: number, value: number) => accumulator + value)
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
     * @tc.name   CollectionsConcurrentModifyTest6300
     * @tc.number SUB_COLLECTION_CONCURRENT_MODIFY_6300
     * @tc.desc   ConcatArray toString 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsConcurrentModifyTest6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsConcurrentModifyTest6300';
        console.info(`${caseName} test start`);
        let count = 0;
        let int8Array: collections.Int8Array = new collections.Int8Array(10);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testModifyInt8Array, i, int8Array).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            int8Array.toString()
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
     * @tc.name   CollectionsConcurrentModifyTest6400
     * @tc.number SUB_COLLECTION_CONCURRENT_MODIFY_6400
     * @tc.desc   ConcatArray toLocaleString 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsConcurrentModifyTest6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsConcurrentModifyTest6400';
        console.info(`${caseName} test start`);
        let count = 0;
        let int8Array: collections.Int8Array = new collections.Int8Array(10);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testModifyInt8Array, i, int8Array).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            int8Array.toLocaleString()
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
     * @tc.name   CollectionsConcurrentModifyTest6500
     * @tc.number SUB_COLLECTION_CONCURRENT_MODIFY_6500
     * @tc.desc   ConcatArray toLocaleString 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsConcurrentModifyTest6500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsConcurrentModifyTest6500';
        console.info(`${caseName} test start`);
        let count = 0;
        let int8Array: collections.Int8Array = new collections.Int8Array(10);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testModifyInt8Array, i, int8Array).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            int8Array.lastIndexOf(0,0)
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