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
export function testModifyUint8ClampedArray(index: number, arr: collections.Uint8ClampedArray) {
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
export default function CollectionsUint8ClampedArray() {
  describe('CollectionsUint8ClampedArray', () => {
    beforeEach(async () => {
      await sleep(100);
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.

    /**
     * @tc.number    : SUB_COLLECTION_UINT8CLAMPEDARRAY_TEST_6401
     * @tc.name      : CollectionsUint8ClampedArrayTest6401
     * @tc.desc      : ConcatArray copyWithin 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsUint8ClampedArrayTest6401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsModifyTest6401';
        console.info(`${caseName} test start`);
        let count = 0;
        let uint8ClampedArray: collections.Uint8ClampedArray = new collections.Uint8ClampedArray();
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testModifyUint8ClampedArray, i, uint8ClampedArray).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            uint8ClampedArray.copyWithin(3,1,3)
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
     * @tc.number    : SUB_COLLECTION_UINT8CLAMPEDARRAY_TEST_6402
     * @tc.name      : CollectionsUint8ClampedArrayTest6402
     * @tc.desc      : ConcatArray every 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsUint8ClampedArrayTest6402', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsModifyTest6402';
        console.info(`${caseName} test start`);
        let count = 0;
        let uint8ClampedArray: collections.Uint8ClampedArray = new collections.Uint8ClampedArray();
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testModifyUint8ClampedArray, i, uint8ClampedArray).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            uint8ClampedArray.every((element: number) => element > 0)
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
     * @tc.number    : SUB_COLLECTION_UINT8CLAMPEDARRAY_TEST_6403
     * @tc.name      : CollectionsUint8ClampedArrayTest6403
     * @tc.desc      : ConcatArray filter 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsUint8ClampedArrayTest6403', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsModifyTest6403';
        console.info(`${caseName} test start`);
        let count = 0;
        let uint8ClampedArray: collections.Uint8ClampedArray = new collections.Uint8ClampedArray();
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testModifyUint8ClampedArray, i, uint8ClampedArray).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            uint8ClampedArray.filter((element: number) => element % 2 == 0)
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
     * @tc.number    : SUB_COLLECTION_UINT8CLAMPEDARRAY_TEST_6404
     * @tc.name      : CollectionsUint8ClampedArrayTest6404
     * @tc.desc      : ConcatArray find 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsUint8ClampedArrayTest6404', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsModifyTest6404';
        console.info(`${caseName} test start`);
        let count = 0;
        let uint8ClampedArray: collections.Uint8ClampedArray = new collections.Uint8ClampedArray();
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testModifyUint8ClampedArray, i, uint8ClampedArray).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            uint8ClampedArray.find((element: number) => element > 2)
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
     * @tc.number    : SUB_COLLECTION_UINT8CLAMPEDARRAY_TEST_6405
     * @tc.name      : CollectionsUint8ClampedArrayTest6405
     * @tc.desc      : ConcatArray findIndex 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsUint8ClampedArrayTest6405', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsModifyTest6405';
        console.info(`${caseName} test start`);
        let count = 0;
        let uint8ClampedArray: collections.Uint8ClampedArray = new collections.Uint8ClampedArray();
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testModifyUint8ClampedArray, i, uint8ClampedArray).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            uint8ClampedArray.findIndex((value: number) => value % 2 === 0)
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
     * @tc.number    : SUB_COLLECTION_UINT8CLAMPEDARRAY_TEST_6406
     * @tc.name      : CollectionsUint8ClampedArrayTest6406
     * @tc.desc      : ConcatArray indexOf 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsUint8ClampedArrayTest6406', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsModifyTest6406';
        console.info(`${caseName} test start`);
        let count = 0;
        let uint8ClampedArray: collections.Uint8ClampedArray = new collections.Uint8ClampedArray();
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testModifyUint8ClampedArray, i, uint8ClampedArray).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            uint8ClampedArray.indexOf(3)
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
     * @tc.number    : SUB_COLLECTION_UINT8CLAMPEDARRAY_TEST_6407
     * @tc.name      : CollectionsUint8ClampedArrayTest6407
     * @tc.desc      : ConcatArray join 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsUint8ClampedArrayTest6407', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsModifyTest6407';
        console.info(`${caseName} test start`);
        let count = 0;
        let uint8ClampedArray: collections.Uint8ClampedArray = new collections.Uint8ClampedArray();
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testModifyUint8ClampedArray, i, uint8ClampedArray).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            uint8ClampedArray.join('-')
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
     * @tc.number    : SUB_COLLECTION_UINT8CLAMPEDARRAY_TEST_6408
     * @tc.name      : CollectionsUint8ClampedArrayTest6408
     * @tc.desc      : ConcatArray map 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsUint8ClampedArrayTest6408', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsModifyTest6408';
        console.info(`${caseName} test start`);
        let count = 0;
        let uint8ClampedArray: collections.Uint8ClampedArray = new collections.Uint8ClampedArray();
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testModifyUint8ClampedArray, i, uint8ClampedArray).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            uint8ClampedArray.map(Math.sqrt)
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
     * @tc.number    : SUB_COLLECTION_UINT8CLAMPEDARRAY_TEST_6409
     * @tc.name      : CollectionsUint8ClampedArrayTest6409
     * @tc.desc      : ConcatArray reduce1 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsUint8ClampedArrayTest6409', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsModifyTest6409';
        console.info(`${caseName} test start`);
        let count = 0;
        let uint8ClampedArray: collections.Uint8ClampedArray = new collections.Uint8ClampedArray(12);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testModifyUint8ClampedArray, i, uint8ClampedArray).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            uint8ClampedArray.reduce((accumulator: number, value: number) => accumulator + value)
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
     * @tc.number    : SUB_COLLECTION_UINT8CLAMPEDARRAY_TEST_6410
     * @tc.name      : CollectionsUint8ClampedArrayTest6410
     * @tc.desc      : ConcatArray reduce2 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsUint8ClampedArrayTest6410', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsModifyTest6410';
        console.info(`${caseName} test start`);
        let count = 0;
        let uint8ClampedArray: collections.Uint8ClampedArray = new collections.Uint8ClampedArray(12);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testModifyUint8ClampedArray, i, uint8ClampedArray).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            uint8ClampedArray.reduce<string>((accumulator: string, value: number) => accumulator + value, 'initialValue')
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
     * @tc.number    : SUB_COLLECTION_UINT8CLAMPEDARRAY_TEST_6411
     * @tc.name      : CollectionsUint8ClampedArrayTest6411
     * @tc.desc      : ConcatArray reverse 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsUint8ClampedArrayTest6411', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsModifyTest6411';
        console.info(`${caseName} test start`);
        let count = 0;
        let uint8ClampedArray: collections.Uint8ClampedArray = new collections.Uint8ClampedArray();
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testModifyUint8ClampedArray, i, uint8ClampedArray).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            uint8ClampedArray.reverse()
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
     * @tc.number    : SUB_COLLECTION_UINT8CLAMPEDARRAY_TEST_6412
     * @tc.name      : CollectionsUint8ClampedArrayTest6412
     * @tc.desc      : ConcatArray set 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsUint8ClampedArrayTest6412', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsModifyTest6412';
        console.info(`${caseName} test start`);
        let count = 0;
        let uint8ClampedArray: collections.Uint8ClampedArray = new collections.Uint8ClampedArray(12);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testModifyUint8ClampedArray, i, uint8ClampedArray).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            uint8ClampedArray.set([1, 2, 3], 3)
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
     * @tc.number    : SUB_COLLECTION_UINT8CLAMPEDARRAY_TEST_6413
     * @tc.name      : CollectionsUint8ClampedArrayTest6413
     * @tc.desc      : ConcatArray slice 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsUint8ClampedArrayTest6413', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsModifyTest6413';
        console.info(`${caseName} test start`);
        let count = 0;
        let uint8ClampedArray: collections.Uint8ClampedArray = new collections.Uint8ClampedArray();
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testModifyUint8ClampedArray, i, uint8ClampedArray).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            uint8ClampedArray.slice(2)
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
     * @tc.number    : SUB_COLLECTION_UINT8CLAMPEDARRAY_TEST_6414
     * @tc.name      : CollectionsUint8ClampedArrayTest6414
     * @tc.desc      : ConcatArray some 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsUint8ClampedArrayTest6414', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsModifyTest6414';
        console.info(`${caseName} test start`);
        let count = 0;
        let uint8ClampedArray: collections.Uint8ClampedArray = new collections.Uint8ClampedArray();
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testModifyUint8ClampedArray, i, uint8ClampedArray).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            uint8ClampedArray.some((element: number) => element < 0)
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
     * @tc.number    : SUB_COLLECTION_UINT8CLAMPEDARRAY_TEST_6415
     * @tc.name      : CollectionsUint8ClampedArrayTest6415
     * @tc.desc      : ConcatArray sort 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsUint8ClampedArrayTest6415', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsModifyTest6415';
        console.info(`${caseName} test start`);
        let count = 0;
        let uint8ClampedArray: collections.Uint8ClampedArray = new collections.Uint8ClampedArray();
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testModifyUint8ClampedArray, i, uint8ClampedArray).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            uint8ClampedArray.sort((a: number, b: number) => a - b)
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
     * @tc.number    : SUB_COLLECTION_UINT8CLAMPEDARRAY_TEST_6416
     * @tc.name      : CollectionsUint8ClampedArrayTest6416
     * @tc.desc      : ConcatArray subarray 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsUint8ClampedArrayTest6416', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsModifyTest6416';
        console.info(`${caseName} test start`);
        let count = 0;
        let uint8ClampedArray: collections.Uint8ClampedArray = new collections.Uint8ClampedArray();
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testModifyUint8ClampedArray, i, uint8ClampedArray).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            uint8ClampedArray.subarray(1,2)
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
     * @tc.number    : SUB_COLLECTION_UINT8CLAMPEDARRAY_TEST_6417
     * @tc.name      : CollectionsUint8ClampedArrayTest6417
     * @tc.desc      : ConcatArray at 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsUint8ClampedArrayTest6417', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsModifyTest6417';
        console.info(`${caseName} test start`);
        let count = 0;
        let uint8ClampedArray: collections.Uint8ClampedArray = new collections.Uint8ClampedArray();
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testModifyUint8ClampedArray, i, uint8ClampedArray).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            uint8ClampedArray.at(3)
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
     * @tc.number    : SUB_COLLECTION_UINT8CLAMPEDARRAY_TEST_6418
     * @tc.name      : CollectionsUint8ClampedArrayTest6418
     * @tc.desc      : ConcatArray entries 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsUint8ClampedArrayTest6418', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsModifyTest6418';
        console.info(`${caseName} test start`);
        let count = 0;
        let uint8ClampedArray: collections.Uint8ClampedArray = new collections.Uint8ClampedArray();
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testModifyUint8ClampedArray, i, uint8ClampedArray).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            uint8ClampedArray.keys()
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
     * @tc.number    : SUB_COLLECTION_UINT8CLAMPEDARRAY_TEST_64181
     * @tc.name      : CollectionsUint8ClampedArrayTest64181
     * @tc.desc      : ConcatArray entries 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsUint8ClampedArrayTest64181', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsModifyTest64181';
        console.info(`${caseName} test start`);
        let count = 0;
        let uint8ClampedArray: collections.Uint8ClampedArray = new collections.Uint8ClampedArray();
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testModifyUint8ClampedArray, i, uint8ClampedArray).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            uint8ClampedArray.entries()
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
     * @tc.number    : SUB_COLLECTION_UINT8CLAMPEDARRAY_TEST_6419
     * @tc.name      : CollectionsUint8ClampedArrayTest6419
     * @tc.desc      : ConcatArray keys 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsUint8ClampedArrayTest6419', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsModifyTest6419';
        console.info(`${caseName} test start`);
        let count = 0;
        let uint8ClampedArray: collections.Uint8ClampedArray = new collections.Uint8ClampedArray();
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testModifyUint8ClampedArray, i, uint8ClampedArray).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            uint8ClampedArray.copyWithin(3,1,3)
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
     * @tc.number    : SUB_COLLECTION_UINT8CLAMPEDARRAY_TEST_6420
     * @tc.name      : CollectionsUint8ClampedArrayTest6420
     * @tc.desc      : ConcatArray values 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsUint8ClampedArrayTest6420', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsModifyTest6420';
        console.info(`${caseName} test start`);
        let count = 0;
        let uint8ClampedArray: collections.Uint8ClampedArray = new collections.Uint8ClampedArray();
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testModifyUint8ClampedArray, i, uint8ClampedArray).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            uint8ClampedArray.values()
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
     * @tc.number    : SUB_COLLECTION_UINT8CLAMPEDARRAY_TEST_6421
     * @tc.name      : CollectionsUint8ClampedArrayTest6421
     * @tc.desc      : ConcatArray includes 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsUint8ClampedArrayTest6421', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsModifyTest6421';
        console.info(`${caseName} test start`);
        let count = 0;
        let uint8ClampedArray: collections.Uint8ClampedArray = new collections.Uint8ClampedArray();
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testModifyUint8ClampedArray, i, uint8ClampedArray).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            uint8ClampedArray.includes(2)
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
     * @tc.number    : SUB_COLLECTION_UINT8CLAMPEDARRAY_TEST_6422
     * @tc.name      : CollectionsUint8ClampedArrayTest6422
     * @tc.desc      : ConcatArray reduceRight1 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsUint8ClampedArrayTest6422', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsModifyTest6422';
        console.info(`${caseName} test start`);
        let count = 0;
        let uint8ClampedArray: collections.Uint8ClampedArray = new collections.Uint8ClampedArray();
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testModifyUint8ClampedArray, i, uint8ClampedArray).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            uint8ClampedArray.reduceRight((accumulator: number, value: number) => accumulator + value, 1)
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
     * @tc.number    : SUB_COLLECTION_UINT8CLAMPEDARRAY_TEST_6423
     * @tc.name      : CollectionsUint8ClampedArrayTest6423
     * @tc.desc      : ConcatArray reduceRight2 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsUint8ClampedArrayTest6423', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsModifyTest6423';
        console.info(`${caseName} test start`);
        let count = 0;
        let uint8ClampedArray: collections.Uint8ClampedArray = new collections.Uint8ClampedArray(12);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testModifyUint8ClampedArray, i, uint8ClampedArray).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            uint8ClampedArray.reduceRight((accumulator: number, value: number) => accumulator + value)
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
     * @tc.number    : SUB_COLLECTION_UINT8CLAMPEDARRAY_TEST_6424
     * @tc.name      : CollectionsUint8ClampedArrayTest6424
     * @tc.desc      : ConcatArray toString 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsUint8ClampedArrayTest6424', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsModifyTest6424';
        console.info(`${caseName} test start`);
        let count = 0;
        let uint8ClampedArray: collections.Uint8ClampedArray = new collections.Uint8ClampedArray();
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testModifyUint8ClampedArray, i, uint8ClampedArray).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            uint8ClampedArray.toString()
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
     * @tc.number    : SUB_COLLECTION_UINT8CLAMPEDARRAY_TEST_6425
     * @tc.name      : CollectionsUint8ClampedArrayTest6425
     * @tc.desc      : ConcatArray toLocaleString 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsUint8ClampedArrayTest6425', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsModifyTest6425';
        console.info(`${caseName} test start`);
        let count = 0;
        let uint8ClampedArray: collections.Uint8ClampedArray = new collections.Uint8ClampedArray();
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testModifyUint8ClampedArray, i, uint8ClampedArray).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            uint8ClampedArray. toLocaleString()
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
     * @tc.number    : SUB_COLLECTION_UINT8CLAMPEDARRAY_TEST_6426
     * @tc.name      : CollectionsUint8ClampedArrayTest6426
     * @tc.desc      : ConcatArray toLocaleString 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsUint8ClampedArrayTest6426', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsModifyTest6426';
        console.info(`${caseName} test start`);
        let count = 0;
        let uint8ClampedArray: collections.Uint8ClampedArray = new collections.Uint8ClampedArray();
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testModifyUint8ClampedArray, i, uint8ClampedArray).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            uint8ClampedArray. lastIndexOf(0,0)
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