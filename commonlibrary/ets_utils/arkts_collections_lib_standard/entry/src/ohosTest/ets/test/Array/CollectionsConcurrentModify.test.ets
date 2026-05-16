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
export function testModifyArrayBuffer(index: number, arr: collections.ArrayBuffer) {
  let tag = 'testModifyArray'
  try {
    for (let i = 0; i < 10; i++) {
      arr.slice(1)
      arr.slice(1)
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
      arr.copyWithin(3, 1, 3)
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

export default function collectionsConcurrentModifyTest() {
  describe('collectionsConcurrentModifyTest', () => {
    beforeEach(async () => {
      await sleep(100);
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.

    /**
     * @tc.name   CollectionsConcurrentModifyTest0100
     * @tc.number SUB_COLLECTION_CONCURRENT_MODIFY_0100
     * @tc.desc   ConcatArray pop 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsConcurrentModifyTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsConcurrentModifyTest0100';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr = new collections.Array(1, 2, 3, 4, 5, 6, 7, 8);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testModifyArray, i, arr).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            arr.pop()
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
     * @tc.name   CollectionsConcurrentModifyTest0200
     * @tc.number SUB_COLLECTION_CONCURRENT_MODIFY_0200
     * @tc.desc   ConcatArray push 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsConcurrentModifyTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsConcurrentModifyTest0100';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr = new collections.Array(1, 2, 3, 4, 5, 6, 7, 8);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testModifyArray, i, arr).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            arr.push(1)
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
     * @tc.name   CollectionsConcurrentModifyTest0300
     * @tc.number SUB_COLLECTION_CONCURRENT_MODIFY_0300
     * @tc.desc   ConcatArray join 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsConcurrentModifyTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsConcurrentModifyTest0300';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr = new collections.Array(1, 2, 3, 4, 5, 6, 7, 8);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testModifyArray, i, arr).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            arr.join('-')
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
     * @tc.name   CollectionsConcurrentModifyTest0400
     * @tc.number SUB_COLLECTION_CONCURRENT_MODIFY_0400
     * @tc.desc   ConcatArray shift 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsConcurrentModifyTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsConcurrentModifyTest0400';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr = new collections.Array(1, 2, 3, 4, 5, 6, 7, 8);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testModifyArray, i, arr).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            arr.shift()
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
     * @tc.name   CollectionsConcurrentModifyTest0500
     * @tc.number SUB_COLLECTION_CONCURRENT_MODIFY_0500
     * @tc.desc   ConcatArray unshift 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsConcurrentModifyTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsConcurrentModifyTest0500';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr = new collections.Array(1, 2, 3, 4, 5, 6, 7, 8);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testModifyArray, i, arr).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            arr.unshift(1)
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
     * @tc.name   CollectionsConcurrentModifyTest0600
     * @tc.number SUB_COLLECTION_CONCURRENT_MODIFY_0600
     * @tc.desc   ConcatArray slice 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsConcurrentModifyTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsConcurrentModifyTest0600';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr = new collections.Array(1, 2, 3, 4, 5, 6, 7, 8);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testModifyArray, i, arr).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            arr.slice(0, 4)
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
     * @tc.name   CollectionsConcurrentModifyTest0700
     * @tc.number SUB_COLLECTION_CONCURRENT_MODIFY_0700
     * @tc.desc   ConcatArray sort 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsConcurrentModifyTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsConcurrentModifyTest0700';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr = new collections.Array(1, 2, 3, 4, 5, 6, 7, 8);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testModifyArray, i, arr).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            arr.sort((a: number, b: number) => a - b)
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
     * @tc.name   CollectionsConcurrentModifyTest0800
     * @tc.number SUB_COLLECTION_CONCURRENT_MODIFY_0800
     * @tc.desc   ConcatArray indexOf 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsConcurrentModifyTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsConcurrentModifyTest0800';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr = new collections.Array(1, 2, 3, 4, 5, 6, 7, 8);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testModifyArray, i, arr).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            arr.indexOf(1)
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
     * @tc.name   CollectionsConcurrentModifyTest0900
     * @tc.number SUB_COLLECTION_CONCURRENT_MODIFY_0900
     * @tc.desc   ConcatArray forEach 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsConcurrentModifyTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsConcurrentModifyTest0900';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr = new collections.Array(1, 2, 3, 4, 5, 6, 7, 8);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testModifyArray, i, arr).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            arr.forEach((value) => {
              const sum = value + Math.random(); // 无害操作
            })
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
     * @tc.name   CollectionsConcurrentModifyTest1000
     * @tc.number SUB_COLLECTION_CONCURRENT_MODIFY_1000
     * @tc.desc   ConcatArray map 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsConcurrentModifyTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsConcurrentModifyTest1000';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr = new collections.Array(1, 2, 3, 4, 5, 6, 7, 8);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testModifyArray, i, arr).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            arr.map(value => value)
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
     * @tc.name   CollectionsConcurrentModifyTest1100
     * @tc.number SUB_COLLECTION_CONCURRENT_MODIFY_1100
     * @tc.desc   ConcatArray filter 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsConcurrentModifyTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsConcurrentModifyTest1100';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr = new collections.Array(1, 2, 3, 4, 5, 6, 7, 8);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testModifyArray, i, arr).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            arr.filter((value: number) => value % 2 === 0)
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
     * @tc.name   CollectionsConcurrentModifyTest1200
     * @tc.number SUB_COLLECTION_CONCURRENT_MODIFY_1200
     * @tc.desc   ConcatArray reduce1 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsConcurrentModifyTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsConcurrentModifyTest1200';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr = new collections.Array(1, 2, 3, 4, 5, 6, 7, 8);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testModifyArray, i, arr).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            arr.reduce((accumulator, value) => accumulator + value)
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
     * @tc.name   CollectionsConcurrentModifyTest1300
     * @tc.number SUB_COLLECTION_CONCURRENT_MODIFY_1300
     * @tc.desc   ConcatArray reduce2 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsConcurrentModifyTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsConcurrentModifyTest1300';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr = new collections.Array(1, 2, 3, 4, 5, 6, 7, 8);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testModifyArray, i, arr).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            arr.reduce<number>((accumulator: number, value: number) => accumulator + value, 0)
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
     * @tc.name   CollectionsConcurrentModifyTest1400
     * @tc.number SUB_COLLECTION_CONCURRENT_MODIFY_1400
     * @tc.desc   ConcatArray at 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsConcurrentModifyTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsConcurrentModifyTest1400';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr = new collections.Array(1, 2, 3, 4, 5, 6, 7, 8);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testModifyArray, i, arr).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            arr.at(2)
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
     * @tc.name   CollectionsConcurrentModifyTest1500
     * @tc.number SUB_COLLECTION_CONCURRENT_MODIFY_1500
     * @tc.desc   ConcatArray entries 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsConcurrentModifyTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsConcurrentModifyTest1500';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr = new collections.Array(1, 2, 3, 4, 5, 6, 7, 8);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testModifyArray, i, arr).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            arr.entries()
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
     * @tc.name   CollectionsConcurrentModifyTest1600
     * @tc.number SUB_COLLECTION_CONCURRENT_MODIFY_1600
     * @tc.desc   ConcatArray keys 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsConcurrentModifyTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsConcurrentModifyTest1600';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr = new collections.Array(1, 2, 3, 4, 5, 6, 7, 8);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testModifyArray, i, arr).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            arr.keys()
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
     * @tc.name   CollectionsConcurrentModifyTest1700
     * @tc.number SUB_COLLECTION_CONCURRENT_MODIFY_1700
     * @tc.desc   ConcatArray values 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsConcurrentModifyTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsConcurrentModifyTest1700';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr = new collections.Array(1, 2, 3, 4, 5, 6, 7, 8);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testModifyArray, i, arr).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            arr.values()
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
     * @tc.name   CollectionsConcurrentModifyTest1800
     * @tc.number SUB_COLLECTION_CONCURRENT_MODIFY_1800
     * @tc.desc   ConcatArray find 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsConcurrentModifyTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsConcurrentModifyTest1800';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr = new collections.Array(1, 2, 3, 4, 5, 6, 7, 8);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testModifyArray, i, arr).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            arr.find((value: number) => value % 2 === 0)
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
     * @tc.name   CollectionsConcurrentModifyTest1900
     * @tc.number SUB_COLLECTION_CONCURRENT_MODIFY_1900
     * @tc.desc   ConcatArray includes 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsConcurrentModifyTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsConcurrentModifyTest1900';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr = new collections.Array(1, 2, 3, 4, 5, 6, 7, 8);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testModifyArray, i, arr).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            arr.includes(2)
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
     * @tc.name   CollectionsConcurrentModifyTest2000
     * @tc.number SUB_COLLECTION_CONCURRENT_MODIFY_2000
     * @tc.desc   ConcatArray findIndex 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsConcurrentModifyTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsConcurrentModifyTest2000';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr = new collections.Array(1, 2, 3, 4, 5, 6, 7, 8);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testModifyArray, i, arr).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            arr.findIndex((value: number) => value % 2 === 0)
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
     * @tc.name   CollectionsConcurrentModifyTest2100
     * @tc.number SUB_COLLECTION_CONCURRENT_MODIFY_2100
     * @tc.desc   ConcatArray fill 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsConcurrentModifyTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsConcurrentModifyTest2100';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr = new collections.Array(1, 2, 3, 4, 5, 6, 7, 8);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testModifyArray, i, arr).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            arr.fill(1)
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
     * @tc.name   CollectionsConcurrentModifyTest2200
     * @tc.number SUB_COLLECTION_CONCURRENT_MODIFY_2200
     * @tc.desc   ConcatArray shrinkTo 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsConcurrentModifyTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsConcurrentModifyTest2200';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr = new collections.Array(1, 2, 3, 4, 5, 6, 7, 8);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testModifyArray, i, arr).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            arr.shrinkTo(2)
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
     * @tc.name   CollectionsConcurrentModifyTest2300
     * @tc.number SUB_COLLECTION_CONCURRENT_MODIFY_2300
     * @tc.desc   ConcatArray extendTo 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsConcurrentModifyTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsConcurrentModifyTest2300';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr = new collections.Array(1, 2, 3, 4, 5, 6, 7, 8);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testModifyArray, i, arr).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            arr.extendTo(1, 10)
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
     * @tc.name   CollectionsConcurrentModifyTest2400
     * @tc.number SUB_COLLECTION_CONCURRENT_MODIFY_2400
     * @tc.desc   ConcatArray fill 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsConcurrentModifyTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsConcurrentModifyTest2400';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr = new collections.Array(1, 2, 3, 4, 5, 6, 7, 8);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testModifyArray, i, arr).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            arr.fill(1)
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
     * @tc.name   CollectionsConcurrentModifyTest2500
     * @tc.number SUB_COLLECTION_CONCURRENT_MODIFY_2500
     * @tc.desc   ConcatArray shrinkTo 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsConcurrentModifyTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsConcurrentModifyTest2500';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr = new collections.Array(1, 2, 3, 4, 5, 6, 7, 8);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testModifyArray, i, arr).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            arr.shrinkTo(2)
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
     * @tc.name   CollectionsConcurrentModifyTest2600
     * @tc.number SUB_COLLECTION_CONCURRENT_MODIFY_2600
     * @tc.desc   ConcatArray extendTo 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsConcurrentModifyTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsConcurrentModifyTest2600';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr = new collections.Array(1, 2, 3, 4, 5, 6, 7, 8);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testModifyArray, i, arr).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            arr.extendTo(1, 10)
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
     * @tc.name   CollectionsConcurrentModifyTest2700
     * @tc.number SUB_COLLECTION_CONCURRENT_MODIFY_2700
     * @tc.desc   ConcatArray concat 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsConcurrentModifyTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsConcurrentModifyTest2700';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr = new collections.Array(1, 2, 3, 4, 5, 6, 7, 8);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testModifyArray, i, arr).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            arr.concat()
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
     * @tc.name   CollectionsConcurrentModifyTest2800
     * @tc.number SUB_COLLECTION_CONCURRENT_MODIFY_2800
     * @tc.desc   ConcatArray splice1 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsConcurrentModifyTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsConcurrentModifyTest2800';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr = new collections.Array(1, 2, 3, 4, 5, 6, 7, 8);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testModifyArray, i, arr).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            arr.splice(2)
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
     * @tc.name   CollectionsConcurrentModifyTest2900
     * @tc.number SUB_COLLECTION_CONCURRENT_MODIFY_2900
     * @tc.desc   ConcatArray splice2 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsConcurrentModifyTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsConcurrentModifyTest2900';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr = new collections.Array(1, 2, 3, 4, 5, 6, 7, 8);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testModifyArray, i, arr).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            arr.splice(-2, 1)
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
     * @tc.name   CollectionsConcurrentModifyTest29001
     * @tc.number SUB_COLLECTION_CONCURRENT_MODIFY_29001
     * @tc.desc   ConcatArray splice2 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsConcurrentModifyTest29001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsConcurrentModifyTest29001';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr = new collections.Array(1, 2, 3, 4, 5, 6, 7, 8);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testModifyArray, i, arr).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            arr.splice(0, 1, 2)
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
     * @tc.name   CollectionsConcurrentModifyTest3000
     * @tc.number SUB_COLLECTION_CONCURRENT_MODIFY_3000
     * @tc.desc   ConcatArray copyWithin 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsConcurrentModifyTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsConcurrentModifyTest3000';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr = new collections.Array(1, 2, 3, 4, 5, 6, 7, 8);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testModifyArray, i, arr).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            arr.copyWithin(1, 2, 3)
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
     * @tc.name   CollectionsConcurrentModifyTest3100
     * @tc.number SUB_COLLECTION_CONCURRENT_MODIFY_3100
     * @tc.desc   ConcatArray reverse 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsConcurrentModifyTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsConcurrentModifyTest3100';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr = new collections.Array(1, 2, 3, 4, 5, 6, 7, 8);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testModifyArray, i, arr).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            arr.reverse()
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
     * @tc.name   CollectionsConcurrentModifyTest3200
     * @tc.number SUB_COLLECTION_CONCURRENT_MODIFY_3200
     * @tc.desc   ConcatArray lastIndexOf 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsConcurrentModifyTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsConcurrentModifyTest3200';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr = new collections.Array(1, 2, 3, 4, 5, 6, 7, 8);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testModifyArray, i, arr).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            arr.lastIndexOf(2)
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
     * @tc.name   CollectionsConcurrentModifyTest3300
     * @tc.number SUB_COLLECTION_CONCURRENT_MODIFY_3300
     * @tc.desc   ConcatArray every 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsConcurrentModifyTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsConcurrentModifyTest3300';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr = new collections.Array(1, 2, 3, 4, 5, 6, 7, 8);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testModifyArray, i, arr).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            arr.every((element: number) => element > 0)
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
     * @tc.name   CollectionsConcurrentModifyTest3400
     * @tc.number SUB_COLLECTION_CONCURRENT_MODIFY_3400
     * @tc.desc   ConcatArray some 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsConcurrentModifyTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsConcurrentModifyTest3400';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr = new collections.Array(1, 2, 3, 4, 5, 6, 7, 8);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testModifyArray, i, arr).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            arr.some((element: number) => element < 0)
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
     * @tc.name   CollectionsConcurrentModifyTest3500
     * @tc.number SUB_COLLECTION_CONCURRENT_MODIFY_3500
     * @tc.desc   ConcatArray toString 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsConcurrentModifyTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsConcurrentModifyTest3500';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr = new collections.Array(1, 2, 3, 4, 5, 6, 7, 8);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testModifyArray, i, arr).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            arr.toString()
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
     * @tc.name   CollectionsConcurrentModifyTest3600
     * @tc.number SUB_COLLECTION_CONCURRENT_MODIFY_3600
     * @tc.desc   ConcatArray toLocaleString 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsConcurrentModifyTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsConcurrentModifyTest3600';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr = new collections.Array(1, 2, 3, 4, 5, 6, 7, 8);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testModifyArray, i, arr).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            arr.toLocaleString()
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
     * @tc.name   CollectionsConcurrentModifyTest3700
     * @tc.number SUB_COLLECTION_CONCURRENT_MODIFY_3700
     * @tc.desc   ConcatArray reduceRight1 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsConcurrentModifyTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsConcurrentModifyTest3700';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr = new collections.Array(1, 2, 3, 4, 5, 6, 7, 8);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testModifyArray, i, arr).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            arr.reduceRight<number>((accumulator: number, value: number) => accumulator + value, 0)
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
     * @tc.name   CollectionsConcurrentModifyTest3800
     * @tc.number SUB_COLLECTION_CONCURRENT_MODIFY_3800
     * @tc.desc   ConcatArray reduceRight2 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsConcurrentModifyTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsConcurrentModifyTest3800';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr = new collections.Array(1, 2, 3, 4, 5, 6, 7, 8);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testModifyArray, i, arr).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            arr.reduceRight((accumulator, value) => accumulator + value);
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
     * @tc.name   CollectionsConcurrentModifyTest3900
     * @tc.number SUB_COLLECTION_CONCURRENT_MODIFY_3900
     * @tc.desc   ConcatArray slice 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsConcurrentModifyTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsConcurrentModifyTest3900';
        console.info(`${caseName} test start`);
        let count = 0;
        let arrayBuffer: collections.ArrayBuffer = new collections.ArrayBuffer(10);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testModifyArrayBuffer, i, arrayBuffer).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            arrayBuffer.slice(0, 4)
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