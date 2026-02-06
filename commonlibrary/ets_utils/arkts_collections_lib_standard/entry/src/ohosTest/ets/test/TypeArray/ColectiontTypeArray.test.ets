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
export function testTypeArray(index: number, arr: collections.Float32Array) {
  let tag = 'testTypeArray'
  try {
    for (let i = 0; i < 10; i++) {
      arr.copyWithin(2,1,2)
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
export function testTypeArray2(index: number, arr: collections.Uint32Array) {
  let tag = 'testTypeArray2'
  try {
    for (let i = 0; i < 10; i++) {
      arr.copyWithin(2,1,2)
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
export default function ColectiontTypeArray() {
  describe('ColectiontTypeArray', () => {
    beforeEach(async () => {
      await sleep(100);
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.

    /**
     * @tc.number    : SUB_COLLECTION_TYPEARRAY_TEST_0100
     * @tc.name      : CollectionsTypeArrayTest0100
     * @tc.desc      : TypeArray join 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsTypeArrayTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsTypeArrayTest0100';
        console.info(`${caseName} test start`);
        let count = 0;
        let float32Array: collections.Float32Array = new collections.Float32Array(12);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testTypeArray, i, float32Array).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            float32Array.copyWithin(3,1,3)
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
     * @tc.number    : SUB_COLLECTION_TYPEARRAY_TEST_0200
     * @tc.name      : CollectionsTypeArrayTest0200
     * @tc.desc      : TypeArray every 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsTypeArrayTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsTypeArrayTest0200';
        console.info(`${caseName} test start`);
        let count = 0;
        let float32Array: collections.Float32Array = new collections.Float32Array(12);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testTypeArray, i, float32Array).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            float32Array.every((element: number) => element > 0);
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
     * @tc.number    : SUB_COLLECTION_TYPEARRAY_TEST_0300
     * @tc.name      : CollectionsTypeArrayTest0300
     * @tc.desc      : TypeArray filter 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsTypeArrayTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsTypeArrayTest0300';
        console.info(`${caseName} test start`);
        let count = 0;
        let float32Array: collections.Float32Array = new collections.Float32Array(12);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testTypeArray, i, float32Array).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            float32Array.filter((element: number) => element > 0);
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
     * @tc.number    : SUB_COLLECTION_TYPEARRAY_TEST_0400
     * @tc.name      : CollectionsTypeArrayTest0400
     * @tc.desc      : TypeArray filter 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsTypeArrayTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsTypeArrayTest0400';
        console.info(`${caseName} test start`);
        let count = 0;
        let float32Array: collections.Float32Array = new collections.Float32Array(12);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testTypeArray, i, float32Array).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            float32Array.find((element: number) => element > 0);
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
     * @tc.number    : SUB_COLLECTION_TYPEARRAY_TEST_0500
     * @tc.name      : CollectionsTypeArrayTest0500
     * @tc.desc      : TypeArray findIndex 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsTypeArrayTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsTypeArrayTest0500';
        console.info(`${caseName} test start`);
        let count = 0;
        let float32Array: collections.Float32Array = new collections.Float32Array(12);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testTypeArray, i, float32Array).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            float32Array.findIndex((element: number) => element > 0);
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
     * @tc.number    : SUB_COLLECTION_TYPEARRAY_TEST_0600
     * @tc.name      : CollectionsTypeArrayTest0600
     * @tc.desc      : TypeArray indexOf 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsTypeArrayTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsTypeArrayTest0600';
        console.info(`${caseName} test start`);
        let count = 0;
        let float32Array: collections.Float32Array = new collections.Float32Array(12);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testTypeArray, i, float32Array).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            float32Array.indexOf(1);
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
     * @tc.number    : SUB_COLLECTION_TYPEARRAY_TEST_0700
     * @tc.name      : CollectionsTypeArrayTest0700
     * @tc.desc      : TypeArray join 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsTypeArrayTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsTypeArrayTest0700';
        console.info(`${caseName} test start`);
        let count = 0;
        let float32Array: collections.Float32Array = new collections.Float32Array(12);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testTypeArray, i, float32Array).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            float32Array.join('1');
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
     * @tc.number    : SUB_COLLECTION_TYPEARRAY_TEST_0800
     * @tc.name      : CollectionsTypeArrayTest0800
     * @tc.desc      : TypeArray map 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsTypeArrayTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsTypeArrayTest0800';
        console.info(`${caseName} test start`);
        let count = 0;
        let float32Array: collections.Float32Array = new collections.Float32Array(12);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testTypeArray, i, float32Array).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            float32Array.map(Math.sqrt);
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
     * @tc.number    : SUB_COLLECTION_TYPEARRAY_TEST_0900
     * @tc.name      : CollectionsTypeArrayTest0900
     * @tc.desc      : TypeArray reduce 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsTypeArrayTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsTypeArrayTest0900';
        console.info(`${caseName} test start`);
        let count = 0;
        let float32Array: collections.Float32Array = new collections.Float32Array(12);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testTypeArray, i, float32Array).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            float32Array.reduce<string>((accumulator: string, value: number) => accumulator + value, 'initialValue');;
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
     * @tc.number    : SUB_COLLECTION_TYPEARRAY_TEST_0901
     * @tc.name      : CollectionsTypeArrayTest0901
     * @tc.desc      : TypeArray reduce 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsTypeArrayTest0901', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsTypeArrayTest0901';
        console.info(`${caseName} test start`);
        let count = 0;
        let float32Array: collections.Float32Array = new collections.Float32Array(12);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testTypeArray, i, float32Array).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            float32Array.reduce((accumulator: number, value: number) => accumulator + value, 1);;
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
     * @tc.number    : SUB_COLLECTION_TYPEARRAY_TEST_09011
     * @tc.name      : CollectionsTypeArrayTest09011
     * @tc.desc      : TypeArray reduce 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsTypeArrayTest09011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsTypeArrayTest09011';
        console.info(`${caseName} test start`);
        let count = 0;
        let float32Array: collections.Float32Array = new collections.Float32Array(12);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testTypeArray, i, float32Array).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            float32Array.reduce((accumulator: number, value: number) => accumulator + value);;
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
     * @tc.number    : SUB_COLLECTION_TYPEARRAY_TEST_1000
     * @tc.name      : CollectionsTypeArrayTest1000
     * @tc.desc      : TypeArray reverse 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsTypeArrayTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsTypeArrayTest1000';
        console.info(`${caseName} test start`);
        let count = 0;
        let float32Array: collections.Float32Array = new collections.Float32Array(12);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testTypeArray, i, float32Array).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            float32Array.reverse();
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
     * @tc.number    : SUB_COLLECTION_TYPEARRAY_TEST_1100
     * @tc.name      : CollectionsTypeArrayTest1100
     * @tc.desc      : TypeArray set 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsTypeArrayTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsTypeArrayTest1100';
        console.info(`${caseName} test start`);
        let count = 0;
        let float32Array: collections.Float32Array = new collections.Float32Array(12);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testTypeArray, i, float32Array).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            float32Array.set([1, 2, 3], 3);
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
     * @tc.number    : SUB_COLLECTION_TYPEARRAY_TEST_1200
     * @tc.name      : CollectionsTypeArrayTest1200
     * @tc.desc      : TypeArray slice 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsTypeArrayTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsTypeArrayTest1200';
        console.info(`${caseName} test start`);
        let count = 0;
        let float32Array: collections.Float32Array = new collections.Float32Array(12);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testTypeArray, i, float32Array).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            float32Array.slice(1, 3);
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
     * @tc.number    : SUB_COLLECTION_TYPEARRAY_TEST_1201
     * @tc.name      : CollectionsTypeArrayTest1201
     * @tc.desc      : TypeArray some 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsTypeArrayTest1201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsTypeArrayTest1201';
        console.info(`${caseName} test start`);
        let count = 0;
        let float32Array: collections.Float32Array = new collections.Float32Array(12);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testTypeArray, i, float32Array).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            float32Array.some((element: number) => element < 0);
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
     * @tc.number    : SUB_COLLECTION_TYPEARRAY_TEST_1300
     * @tc.name      : CollectionsTypeArrayTest1300
     * @tc.desc      : TypeArray sort 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsTypeArrayTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsTypeArrayTest1300';
        console.info(`${caseName} test start`);
        let count = 0;
        let float32Array: collections.Float32Array = new collections.Float32Array(12);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testTypeArray, i, float32Array).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            float32Array.sort((a: number, b: number) => a - b);
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
     * @tc.number    : SUB_COLLECTION_TYPEARRAY_TEST_1400
     * @tc.name      : CollectionsTypeArrayTest1400
     * @tc.desc      : TypeArray subarray 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsTypeArrayTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsTypeArrayTest1400';
        console.info(`${caseName} test start`);
        let count = 0;
        let float32Array: collections.Float32Array = new collections.Float32Array(12);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testTypeArray, i, float32Array).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            float32Array.subarray();
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
     * @tc.number    : SUB_COLLECTION_TYPEARRAY_TEST_1500
     * @tc.name      : CollectionsTypeArrayTest1500
     * @tc.desc      : TypeArray at 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsTypeArrayTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsTypeArrayTest1500';
        console.info(`${caseName} test start`);
        let count = 0;
        let float32Array: collections.Float32Array = new collections.Float32Array(12);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testTypeArray, i, float32Array).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            float32Array.at(-1);
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
     * @tc.number    : SUB_COLLECTION_TYPEARRAY_TEST_1600
     * @tc.name      : CollectionsTypeArrayTest1600
     * @tc.desc      : TypeArray entries 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsTypeArrayTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsTypeArrayTest1600';
        console.info(`${caseName} test start`);
        let count = 0;
        let float32Array: collections.Float32Array = new collections.Float32Array(12);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testTypeArray, i, float32Array).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            float32Array.entries();
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
     * @tc.number    : SUB_COLLECTION_TYPEARRAY_TEST_1700
     * @tc.name      : CollectionsTypeArrayTest1700
     * @tc.desc      : TypeArray keys 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsTypeArrayTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsTypeArrayTest1700';
        console.info(`${caseName} test start`);
        let count = 0;
        let float32Array: collections.Float32Array = new collections.Float32Array(12);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testTypeArray, i, float32Array).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            float32Array.keys();
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
     * @tc.number    : SUB_COLLECTION_TYPEARRAY_TEST_1800
     * @tc.name      : CollectionsTypeArrayTest1800
     * @tc.desc      : TypeArray values 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsTypeArrayTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsTypeArrayTest1800';
        console.info(`${caseName} test start`);
        let count = 0;
        let float32Array: collections.Float32Array = new collections.Float32Array(12);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testTypeArray, i, float32Array).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            float32Array.values();
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
     * @tc.number    : SUB_COLLECTION_TYPEARRAY_TEST_1900
     * @tc.name      : CollectionsTypeArrayTest1900
     * @tc.desc      : TypeArray includes 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsTypeArrayTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsTypeArrayTest1900';
        console.info(`${caseName} test start`);
        let count = 0;
        let float32Array: collections.Float32Array = new collections.Float32Array(12);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testTypeArray, i, float32Array).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            float32Array.includes(1);
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
     * @tc.number    : SUB_COLLECTION_TYPEARRAY_TEST_2000
     * @tc.name      : CollectionsTypeArrayTest2000
     * @tc.desc      : TypeArray reduceRight 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsTypeArrayTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsTypeArrayTest2000';
        console.info(`${caseName} test start`);
        let count = 0;
        let float32Array: collections.Float32Array = new collections.Float32Array(12);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testTypeArray, i, float32Array).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            float32Array.reduceRight((accumulator: number, value: number) => accumulator + value);
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
     * @tc.number    : SUB_COLLECTION_TYPEARRAY_TEST_2100
     * @tc.name      : CollectionsTypeArrayTest2100
     * @tc.desc      : TypeArray reduceRight 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsTypeArrayTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsTypeArrayTest2100';
        console.info(`${caseName} test start`);
        let count = 0;
        let float32Array: collections.Float32Array = new collections.Float32Array(12);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testTypeArray, i, float32Array).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            float32Array.reduceRight<number>((accumulator: number, value: number) => accumulator + value,1);
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
     * @tc.number    : SUB_COLLECTION_TYPEARRAY_TEST_2200
     * @tc.name      : CollectionsTypeArrayTest2200
     * @tc.desc      : TypeArray toString 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsTypeArrayTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsTypeArrayTest2200';
        console.info(`${caseName} test start`);
        let count = 0;
        let float32Array: collections.Float32Array = new collections.Float32Array(12);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testTypeArray, i, float32Array).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            float32Array.toString();
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
     * @tc.number    : SUB_COLLECTION_TYPEARRAY_TEST_2300
     * @tc.name      : CollectionsTypeArrayTest2300
     * @tc.desc      : TypeArray toLocaleString 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsTypeArrayTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsTypeArrayTest2300';
        console.info(`${caseName} test start`);
        let count = 0;
        let float32Array: collections.Float32Array = new collections.Float32Array(12);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testTypeArray, i, float32Array).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            float32Array.toLocaleString();
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
     * @tc.number    : SUB_COLLECTION_TYPEARRAY_TEST_2400
     * @tc.name      : CollectionsTypeArrayTest2400
     * @tc.desc      : TypeArray toLocaleString 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsTypeArrayTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsTypeArrayTest2400';
        console.info(`${caseName} test start`);
        let count = 0;
        let float32Array: collections.Float32Array = new collections.Float32Array(12);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testTypeArray, i, float32Array).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            float32Array.lastIndexOf(0,0);
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
     * @tc.number    : SUB_COLLECTION_UINT32ARRAY_TEST_0100
     * @tc.name      : CollectionsUint32ArrayTest0100
     * @tc.desc      : TypeArray join 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsUint32ArrayTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsUint32ArrayTest0100';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr: collections.Uint32Array = new collections.Uint32Array(12);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testTypeArray2, i, arr).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            arr.copyWithin(3,1,3)
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
     * @tc.number    : SUB_COLLECTION_UINT32ARRAY_TEST_0200
     * @tc.name      : CollectionsUint32ArrayTest0200
     * @tc.desc      : TypeArray every 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsUint32ArrayTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsUint32ArrayTest0200';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr: collections.Uint32Array = new collections.Uint32Array(12);
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
     * @tc.number    : SUB_COLLECTION_UINT32ARRAY_TEST_0300
     * @tc.name      : CollectionsUint32ArrayTest0300
     * @tc.desc      : TypeArray filter 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsUint32ArrayTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsUint32ArrayTest0300';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr: collections.Uint32Array = new collections.Uint32Array(12);
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
     * @tc.number    : SUB_COLLECTION_UINT32ARRAY_TEST_0400
     * @tc.name      : CollectionsUint32ArrayTest0400
     * @tc.desc      : TypeArray filter 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsUint32ArrayTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsUint32ArrayTest0400';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr: collections.Uint32Array = new collections.Uint32Array(12);
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
     * @tc.number    : SUB_COLLECTION_UINT32ARRAY_TEST_0500
     * @tc.name      : CollectionsUint32ArrayTest0500
     * @tc.desc      : TypeArray findIndex 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsUint32ArrayTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsUint32ArrayTest0500';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr: collections.Uint32Array = new collections.Uint32Array(12);
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
     * @tc.number    : SUB_COLLECTION_UINT32ARRAY_TEST_0600
     * @tc.name      : CollectionsUint32ArrayTest0600
     * @tc.desc      : TypeArray indexOf 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsUint32ArrayTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsUint32ArrayTest0600';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr: collections.Uint32Array = new collections.Uint32Array(12);
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
     * @tc.number    : SUB_COLLECTION_UINT32ARRAY_TEST_0700
     * @tc.name      : CollectionsUint32ArrayTest0700
     * @tc.desc      : TypeArray join 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsUint32ArrayTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsUint32ArrayTest0700';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr: collections.Uint32Array = new collections.Uint32Array(12);
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
     * @tc.number    : SUB_COLLECTION_UINT32ARRAY_TEST_0800
     * @tc.name      : CollectionsUint32ArrayTest0800
     * @tc.desc      : TypeArray map 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsUint32ArrayTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsUint32ArrayTest0800';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr: collections.Uint32Array = new collections.Uint32Array(12);
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
     * @tc.number    : SUB_COLLECTION_UINT32ARRAY_TEST_0900
     * @tc.name      : CollectionsUint32ArrayTest0900
     * @tc.desc      : TypeArray reduce 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsUint32ArrayTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsUint32ArrayTest0900';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr: collections.Uint32Array = new collections.Uint32Array(12);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testTypeArray2, i, arr).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            arr.reduce<string>((accumulator: string, value: number) => accumulator + value, 'initialValue');;
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
     * @tc.number    : SUB_COLLECTION_UINT32ARRAY_TEST_0901
     * @tc.name      : CollectionsUint32ArrayTest0901
     * @tc.desc      : TypeArray reduce 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsUint32ArrayTest0901', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsUint32ArrayTest0901';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr: collections.Uint32Array = new collections.Uint32Array(12);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testTypeArray2, i, arr).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            arr.reduce((accumulator: number, value: number) => accumulator + value, 1);;
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
     * @tc.number    : SUB_COLLECTION_UINT32ARRAY_TEST_09011
     * @tc.name      : CollectionsUint32ArrayTest09011
     * @tc.desc      : TypeArray reduce 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsUint32ArrayTest09011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsUint32ArrayTest09011';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr: collections.Uint32Array = new collections.Uint32Array(12);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testTypeArray2, i, arr).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            arr.reduce((accumulator: number, value: number) => accumulator + value);;
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
     * @tc.number    : SUB_COLLECTION_UINT32ARRAY_TEST_1000
     * @tc.name      : CollectionsUint32ArrayTest1000
     * @tc.desc      : TypeArray reverse 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsUint32ArrayTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsUint32ArrayTest1000';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr: collections.Uint32Array = new collections.Uint32Array(12);
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
     * @tc.number    : SUB_COLLECTION_UINT32ARRAY_TEST_1100
     * @tc.name      : CollectionsUint32ArrayTest1100
     * @tc.desc      : TypeArray set 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsUint32ArrayTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsUint32ArrayTest1100';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr: collections.Uint32Array = new collections.Uint32Array(12);
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
     * @tc.number    : SUB_COLLECTION_UINT32ARRAY_TEST_1200
     * @tc.name      : CollectionsUint32ArrayTest1200
     * @tc.desc      : TypeArray slice 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsUint32ArrayTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsUint32ArrayTest1200';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr: collections.Uint32Array = new collections.Uint32Array(12);
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
     * @tc.number    : SUB_COLLECTION_UINT32ARRAY_TEST_1201
     * @tc.name      : CollectionsUint32ArrayTest1201
     * @tc.desc      : TypeArray some 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsUint32ArrayTest1201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsUint32ArrayTest1201';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr: collections.Uint32Array = new collections.Uint32Array(12);
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
     * @tc.number    : SUB_COLLECTION_UINT32ARRAY_TEST_1300
     * @tc.name      : CollectionsUint32ArrayTest1300
     * @tc.desc      : TypeArray sort 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsUint32ArrayTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsUint32ArrayTest1300';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr: collections.Uint32Array = new collections.Uint32Array(12);
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
     * @tc.number    : SUB_COLLECTION_UINT32ARRAY_TEST_1400
     * @tc.name      : CollectionsUint32ArrayTest1400
     * @tc.desc      : TypeArray subarray 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsUint32ArrayTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsUint32ArrayTest1400';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr: collections.Uint32Array = new collections.Uint32Array(12);
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
     * @tc.number    : SUB_COLLECTION_UINT32ARRAY_TEST_1500
     * @tc.name      : CollectionsUint32ArrayTest1500
     * @tc.desc      : TypeArray at 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsUint32ArrayTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsUint32ArrayTest1500';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr: collections.Uint32Array = new collections.Uint32Array(12);
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
     * @tc.number    : SUB_COLLECTION_UINT32ARRAY_TEST_1600
     * @tc.name      : CollectionsUint32ArrayTest1600
     * @tc.desc      : TypeArray entries 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsUint32ArrayTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsUint32ArrayTest1600';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr: collections.Uint32Array = new collections.Uint32Array(12);
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
     * @tc.number    : SUB_COLLECTION_UINT32ARRAY_TEST_1700
     * @tc.name      : CollectionsUint32ArrayTest1700
     * @tc.desc      : TypeArray keys 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsUint32ArrayTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsUint32ArrayTest1700';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr: collections.Uint32Array = new collections.Uint32Array(12);
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
     * @tc.number    : SUB_COLLECTION_UINT32ARRAY_TEST_1800
     * @tc.name      : CollectionsUint32ArrayTest1800
     * @tc.desc      : TypeArray values 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsUint32ArrayTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsUint32ArrayTest1800';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr: collections.Uint32Array = new collections.Uint32Array(12);
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
     * @tc.number    : SUB_COLLECTION_UINT32ARRAY_TEST_1900
     * @tc.name      : CollectionsUint32ArrayTest1900
     * @tc.desc      : TypeArray includes 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsUint32ArrayTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsUint32ArrayTest1900';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr: collections.Uint32Array = new collections.Uint32Array(12);
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
     * @tc.number    : SUB_COLLECTION_UINT32ARRAY_TEST_2000
     * @tc.name      : CollectionsUint32ArrayTest2000
     * @tc.desc      : TypeArray reduceRight 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsUint32ArrayTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsUint32ArrayTest2000';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr: collections.Uint32Array = new collections.Uint32Array(12);
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
     * @tc.number    : SUB_COLLECTION_UINT32ARRAY_TEST_2100
     * @tc.name      : CollectionsUint32ArrayTest2100
     * @tc.desc      : TypeArray reduceRight 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsUint32ArrayTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsUint32ArrayTest2100';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr: collections.Uint32Array = new collections.Uint32Array(12);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testTypeArray2, i, arr).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            arr.reduceRight<number>((accumulator: number, value: number) => accumulator + value,1);
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
     * @tc.number    : SUB_COLLECTION_UINT32ARRAY_TEST_2200
     * @tc.name      : CollectionsUint32ArrayTest2200
     * @tc.desc      : TypeArray toString 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsUint32ArrayTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsUint32ArrayTest2200';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr: collections.Uint32Array = new collections.Uint32Array(12);
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
     * @tc.number    : SUB_COLLECTION_UINT32ARRAY_TEST_2300
     * @tc.name      : CollectionsUint32ArrayTest2300
     * @tc.desc      : TypeArray toLocaleString 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsUint32ArrayTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsUint32ArrayTest2300';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr: collections.Uint32Array = new collections.Uint32Array(12);
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
     * @tc.number    : SUB_COLLECTION_UINT32ARRAY_TEST_2400
     * @tc.name      : CollectionsUint32ArrayTest2400
     * @tc.desc      : TypeArray toLocaleString 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsUint32ArrayTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsUint32ArrayTest2400';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr: collections.Uint32Array = new collections.Uint32Array(12);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testTypeArray2, i, arr).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            arr.lastIndexOf(0,0);
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