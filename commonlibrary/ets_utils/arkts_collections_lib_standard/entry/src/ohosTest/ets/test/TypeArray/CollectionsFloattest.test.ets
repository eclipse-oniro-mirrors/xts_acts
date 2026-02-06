/*
* Copyright (C) 2025 HiHope Open Source Organization.
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
import { collections } from '@kit.ArkTS';

export function sleep(time: number): Promise<void> {
  return new Promise((re, je) => {
    setTimeout(() => {
      re()
    }, time)
  })
}

class NormalClass {
  public value: number;

  constructor(value: number) {
    this.value = value;
  }
}

export default function CollectionsFloattest() {
  describe('CollectionsFloattest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(200);
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
     * @tc.number    : SUB_COLLECTION_SECOND_TYPEDARRAY_0200
     * @tc.name      : CollectionsFloattestTypedArray0200
     * @tc.desc      : toString 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsFloattestTypedArray0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsFloattestTypedArray0200';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let arrayLike = [1, 2, 3];
          new collections.Float32Array(arrayLike).fill(4, 1).fill(4).forEach((value1, value2, Float32Array) => {
            let a = Float32Array.fill(4, 1).toString();
            console.info('Float32Array:', a);
          });
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200201);
          flag = true;
        }
        expect(flag).assertTrue();
        console.info(`${caseName} test end`);
        done();
      })


    /**
     * @tc.number    : SUB_COLLECTION_SECOND_TYPEDARRAY_0300
     * @tc.name      : CollectionsFloattestTypedArray0300
     * @tc.desc      : toLocaleString 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsFloattestTypedArray0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsFloattestTypedArray0300';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let float32Array: collections.Float32Array = new collections.Float32Array();
        const normal = new NormalClass(10);
        const unboundcreate = float32Array.toLocaleString;
        const boundcreate: () => void = unboundcreate.bind(normal);
        try {
          boundcreate();
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200011);
          flag = true;
        }
        expect(flag).assertTrue();
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.number    : SUB_COLLECTION_SECOND_TYPEDARRAY_0400
     * @tc.name      : CollectionsFloattestTypedArray0400
     * @tc.desc      : toLocaleString 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsFloattestTypedArray0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsFloattestTypedArray0400';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let arrayLike = [1, 2, 3];
          new collections.Float32Array(arrayLike).fill(4, 1).fill(4).forEach((value1, value2, Float32Array) => {
            let a = Float32Array.fill(4, 1).toLocaleString();
            console.info('Float32Array:', a);
          });
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200201);
          flag = true;
        }
        expect(flag).assertTrue();
        console.info(`${caseName} test end`);
        done()
      })


    /**
     * @tc.number    : SUB_COLLECTION_SECOND_TYPEDARRAY_0500
     * @tc.name      : CollectionsFloattestTypedArray0500
     * @tc.desc      : copyWithin 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsFloattestTypedArray0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsFloattestTypedArray0500';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let float32Array: collections.Float32Array = new collections.Float32Array();
        const normal = new NormalClass(10);
        const unboundcreate = float32Array.copyWithin;
        const boundcreate: () => void = unboundcreate.bind(normal, 1, 2);
        try {
          boundcreate();
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200011);
          flag = true;
        }
        expect(flag).assertTrue();
        console.info(`${caseName} test end`);
        done();
      })


    /**
     * @tc.number    : SUB_COLLECTION_SECOND_TYPEDARRAY_0600
     * @tc.name      : CollectionsFloattestTypedArray0600
     * @tc.desc      : copyWithin 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsFloattestTypedArray0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsFloattestTypedArray0600';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let arrayLike = [1, 2, 3];
          new collections.Float32Array(arrayLike).fill(4, 1).fill(4).forEach((value1, value2, Float32Array) => {
            let a = Float32Array.fill(4, 1).copyWithin(1, 1, 3);
            console.info('Float32Array:', a);
          });
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200201);
          flag = true;
        }
        expect(flag).assertTrue();
        console.info(`${caseName} test end`);
        done();
      })


    /**
     * @tc.number    : SUB_COLLECTION_SECOND_TYPEDARRAY_0700
     * @tc.name      : CollectionsFloattestTypedArray0700
     * @tc.desc      : constructor 10200012
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsFloattestTypedArray0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsFloattestTypedArray0700';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          const normal = new NormalClass(10);
          const unboundcreate = collections.Float32Array;
          const boundcreate: () => void = unboundcreate.bind(normal);
          boundcreate();
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200012);
          flag = true;
        }
        expect(flag).assertTrue();
        console.info(`${caseName} test end`);
        done();
      })


    /**
     * @tc.number    : SUB_COLLECTION_SECOND_TYPEDARRAY_0800
     * @tc.name      : CollectionsFloattestTypedArray0800
     * @tc.desc      : constructor 10200012
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsFloattestTypedArray0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsFloattestTypedArray0800';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          const normal = new NormalClass(10);
          const unboundcreate = collections.Float32Array;
          const boundcreate: () => void = unboundcreate.bind(normal, 12);
          boundcreate();
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200012);
          flag = true;
        }
        expect(flag).assertTrue();
        console.info(`${caseName} test end`);
        done();
      })


    /**
     * @tc.number    : SUB_COLLECTION_SECOND_TYPEDARRAY_0900
     * @tc.name      : CollectionsFloattestTypedArray0900
     * @tc.desc      : constructor 10200012
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsFloattestTypedArray0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsFloattestTypedArray0900';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          const normal = new NormalClass(10);
          const unboundcreate = collections.Float32Array;
          let arrayLike = [1, 3, 5];
          const boundcreate: () => void = unboundcreate.bind(normal, arrayLike);
          boundcreate()
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200012);
          flag = true;
        }
        expect(flag).assertTrue();
        console.info(`${caseName} test end`);
        done();
      })


    /**
     * @tc.number    : SUB_COLLECTION_SECOND_TYPEDARRAY_1000
     * @tc.name      : CollectionsFloattestTypedArray1000
     * @tc.desc      : some 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsFloattestTypedArray1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsFloattestTypedArray1000';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let float32Array: collections.Float32Array = new collections.Float32Array();
        const normal = new NormalClass(10);
        const unboundcreate = float32Array.some;
        const boundcreate: () => void = unboundcreate.bind(normal);
        try {
          boundcreate();
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200011);
          flag = true;
        }
        expect(flag).assertTrue();
        console.info(`${caseName} test end`);
        done();
      })


    /**
     * @tc.number    : SUB_COLLECTION_SECOND_TYPEDARRAY_1100
     * @tc.name      : CollectionsFloattestTypedArray1100
     * @tc.desc      : some 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsFloattestTypedArray1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsFloattestTypedArray1100';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let arrayLike = [-10, 20, -30, 40, -50];
          new collections.Float32Array(arrayLike).fill(4, 1).fill(4).forEach((value1, value2, Float32Array) => {
            let a = Float32Array.fill(4, 1).some((element: number) => element < 0);
            console.info('Float32Array:', a);
          });
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200201)
          flag = true;
        }
        expect(flag).assertTrue();
        console.info(`${caseName} test end`);
        done();
      })


    /**
     * @tc.number    : SUB_COLLECTION_SECOND_TYPEDARRAY_1200
     * @tc.name      : CollectionsFloattestTypedArray1200
     * @tc.desc      : every 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsFloattestTypedArray1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsFloattestTypedArray1200';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let float32Array: collections.Float32Array = new collections.Float32Array();
        const normal = new NormalClass(10);
        const unboundcreate = float32Array.every;
        const boundcreate: () => void = unboundcreate.bind(normal, () => {
        });
        try {
          boundcreate();
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200011);
          flag = true;
        }
        expect(flag).assertTrue();
        console.info(`${caseName} test end`);
        done();
      })


    /**
     * @tc.number    : SUB_COLLECTION_SECOND_TYPEDARRAY_1300
     * @tc.name      : CollectionsFloattestTypedArray1300
     * @tc.desc      : every 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsFloattestTypedArray1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsFloattestTypedArray1300';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let arrayLike = [-10, 20, -30, 40, -50];
          new collections.Float32Array(arrayLike).fill(4, 1).fill(4).forEach((value1, value2, Float32Array) => {
            let a = Float32Array.fill(4, 1).every((element: number) => element > 0);
            console.info('Float32Array:', a);
          });
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200201)
          flag = true;
        }
        expect(flag).assertTrue();
        console.info(`${caseName} test end`);
        done();
      })


    /**
     * @tc.number    : SUB_COLLECTION_SECOND_TYPEDARRAY_1400
     * @tc.name      : CollectionsFloattestTypedArray1400
     * @tc.desc      : fill 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsFloattestTypedArray1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsFloattestTypedArray1400';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let float32Array: collections.Float32Array = new collections.Float32Array();
        const normal = new NormalClass(10);
        const unboundcreate = float32Array.fill;
        const boundcreate: () => void = unboundcreate.bind(normal, 1);
        try {
          boundcreate();
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200011);
          flag = true;
        }
        expect(flag).assertTrue();
        console.info(`${caseName} test end`);
        done();
      })


    /**
     * @tc.number    : SUB_COLLECTION_SECOND_TYPEDARRAY_1500
     * @tc.name      : CollectionsFloattestTypedArray1500
     * @tc.desc      : fill 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsFloattestTypedArray1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsFloattestTypedArray1500';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let arrayLike = [1, 2, 3];
          new collections.Float32Array(arrayLike).fill(4, 1).fill(4).forEach((value1, value2, Float32Array) => {
            let a = Float32Array.fill(4, 1);
            console.info('Float32Array:', a);
          });
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200201)
          flag = true;
        }
        expect(flag).assertTrue();
        console.info(`${caseName} test end`);
        done();
      })


    /**
     * @tc.number    : SUB_COLLECTION_SECOND_TYPEDARRAY_1600
     * @tc.name      : CollectionsFloattestTypedArray1600
     * @tc.desc      : filter 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsFloattestTypedArray1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsFloattestTypedArray1600';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let float32Array: collections.Float32Array = new collections.Float32Array();
        const normal = new NormalClass(10);
        const unboundcreate = float32Array.filter;
        const boundcreate: () => void = unboundcreate.bind(normal,()=>{});
        try {
          boundcreate();
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200011);
          flag = true;
        }
        expect(flag).assertTrue();
        console.info(`${caseName} test end`);
        done();
      })


    /**
     * @tc.number    : SUB_COLLECTION_SECOND_TYPEDARRAY_1700
     * @tc.name      : CollectionsFloattestTypedArray1700
     * @tc.desc      : filter 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsFloattestTypedArray1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsFloattestTypedArray1700';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let arrayLike = [1, 2, 3];
          new collections.Float32Array(arrayLike).fill(4, 1).fill(4).forEach((value1, value2, Float32Array) => {
            let a = Float32Array.fill(4, 1).fill(4).filter((element: number) => element % 2 == 0);
            console.info('Float32Array:', a);
          });
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200201)
          flag = true;
        }
        expect(flag).assertTrue();
        console.info(`${caseName} test end`);
        done();
      })


    /**
     * @tc.number    : SUB_COLLECTION_SECOND_TYPEDARRAY_1800
     * @tc.name      : CollectionsFloattestTypedArray1800
     * @tc.desc      : find 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsFloattestTypedArray1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsFloattestTypedArray1800';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let float32Array: collections.Float32Array = new collections.Float32Array();
        const normal = new NormalClass(10);
        const unboundcreate = float32Array.find;
        const boundcreate: () => void = unboundcreate.bind(normal,()=>{});
        try {
          boundcreate();
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200011);
          flag = true;
        }
        expect(flag).assertTrue();
        console.info(`${caseName} test end`);
        done();
      })


    /**
     * @tc.number    : SUB_COLLECTION_SECOND_TYPEDARRAY_1900
     * @tc.name      : CollectionsFloattestTypedArray1900
     * @tc.desc      : find 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsFloattestTypedArray1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsFloattestTypedArray1900';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let arrayLike = [1, 2, 3];
          new collections.Float32Array(arrayLike).fill(4, 1).fill(4).forEach((value1, value2, Float32Array) => {
            let a = Float32Array.fill(4).find((element: number) => element > 2);
            console.info('Float32Array:', a);
          });
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200201)
          flag = true;
        }
        expect(flag).assertTrue();
        console.info(`${caseName} test end`);
        done();
      })


    /**
     * @tc.number    : SUB_COLLECTION_SECOND_TYPEDARRAY_2000
     * @tc.name      : CollectionsFloattestTypedArray2000
     * @tc.desc      : findIndex 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsFloattestTypedArray2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsFloattestTypedArray2000';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let float32Array: collections.Float32Array = new collections.Float32Array();
        const normal = new NormalClass(10);
        const unboundcreate = float32Array.findIndex;
        const boundcreate: () => void = unboundcreate.bind(normal,()=>{});
        try {
          boundcreate();
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200011);
          flag = true;
        }
        expect(flag).assertTrue();
        console.info(`${caseName} test end`);
        done();
      })


    /**
     * @tc.number    : SUB_COLLECTION_SECOND_TYPEDARRAY_2100
     * @tc.name      : CollectionsFloattestTypedArray2100
     * @tc.desc      : findIndex 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsFloattestTypedArray2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsFloattestTypedArray2100';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let arrayLike = [1, 2, 3];
          new collections.Float32Array(arrayLike).fill(4, 1).fill(4).forEach((value1, value2, Float32Array) => {
            let a = Float32Array.fill(4).findIndex((element: number) => element % 2 === 0);
            console.info('Float32Array:', a);
          });
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200201)
          flag = true;
        }
        expect(flag).assertTrue();
        console.info(`${caseName} test end`);
        done();
      })


    /**
     * @tc.number    : SUB_COLLECTION_SECOND_TYPEDARRAY_2200
     * @tc.name      : CollectionsFloattestTypedArray2200
     * @tc.desc      : forEach 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsFloattestTypedArray2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsFloattestTypedArray2200';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let float32Array: collections.Float32Array = new collections.Float32Array();
        const normal = new NormalClass(10);
        const unboundcreate = float32Array.forEach;
        const boundcreate: () => void = unboundcreate.bind(normal);
        try {
          boundcreate();
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200011);
          flag = true;
        }
        expect(flag).assertTrue();
        console.info(`${caseName} test end`);
        done();
      })


    /**
     * @tc.number    : SUB_COLLECTION_SECOND_TYPEDARRAY_2300
     * @tc.name      : CollectionsFloattestTypedArray2300
     * @tc.desc      : forEach 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsFloattestTypedArray2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsFloattestTypedArray2300';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let arrayLike = [1, 2, 3];
          new collections.Float32Array(arrayLike).fill(4, 1).fill(4).forEach((value1, value2, Float32Array) => {
            let a = Float32Array.fill(4).forEach((value: number, index: number, array: collections.Uint32Array) => {
              console.info(`Element ${value} at index ${index}`);
            });
            console.info('Float32Array:', a);
          });
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200201);
          flag = true;
        }
        expect(flag).assertTrue();
        console.info(`${caseName} test end`);
        done();
      })


    /**
     * @tc.number    : SUB_COLLECTION_SECOND_TYPEDARRAY_2400
     * @tc.name      : CollectionsFloattestTypedArray2400
     * @tc.desc      : indexOf 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsFloattestTypedArray2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsFloattestTypedArray2400';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let float32Array: collections.Float32Array = new collections.Float32Array();
        const normal = new NormalClass(10);
        const unboundcreate = float32Array.indexOf;
        const boundcreate: () => void = unboundcreate.bind(normal,1);
        try {
          boundcreate();
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200011);
          flag = true;
        }
        expect(flag).assertTrue();
        console.info(`${caseName} test end`);
        done();
      })


    /**
     * @tc.number    : SUB_COLLECTION_SECOND_TYPEDARRAY_2500
     * @tc.name      : CollectionsFloattestTypedArray2500
     * @tc.desc      : indexOf 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsFloattestTypedArray2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsFloattestTypedArray2500';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let arrayLike = [1, 2, 3];
          new collections.Float32Array(arrayLike).fill(4, 1).fill(4).forEach((value1, value2, Float32Array) => {
            let a = Float32Array.fill(4).indexOf(3);
            console.info('Float32Array:', a);
          });
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200201);
          flag = true;
        }
        expect(flag).assertTrue();
        console.info(`${caseName} test end`);
        done();
      })


    /**
     * @tc.number    : SUB_COLLECTION_SECOND_TYPEDARRAY_2600
     * @tc.name      : CollectionsFloattestTypedArray2600
     * @tc.desc      : lastIndexOf 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsFloattestTypedArray2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsFloattestTypedArray2600';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let float32Array: collections.Float32Array = new collections.Float32Array();
        const normal = new NormalClass(10);
        const unboundcreate = float32Array.lastIndexOf;
        const boundcreate: () => void = unboundcreate.bind(normal);
        try {
          boundcreate();
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200011);
          flag = true;
        }
        expect(flag).assertTrue();
        console.info(`${caseName} test end`);
        done();
      })


    /**
     * @tc.number    : SUB_COLLECTION_SECOND_TYPEDARRAY_2700
     * @tc.name      : CollectionsFloattestTypedArray2700
     * @tc.desc      : lastIndexOf 10200001
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsFloattestTypedArray2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsFloattestTypedArray2700';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let arrayLike = [1, 2, 3];
          new collections.Float32Array(arrayLike).fill(4, 1).fill(4).forEach((value1, value2, Float32Array) => {
            let a = Float32Array.fill(4).lastIndexOf(3);
            console.info('Float32Array:', a);
          });
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200201);
          flag = true;
        }
        expect(flag).assertTrue();
        console.info(`${caseName} test end`);
        done();
      })


    /**
     * @tc.number    : SUB_COLLECTION_SECOND_TYPEDARRAY_2800
     * @tc.name      : CollectionsFloattestTypedArray2800
     * @tc.desc      : join 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsFloattestTypedArray2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsFloattestTypedArray2800';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let float32Array: collections.Float32Array = new collections.Float32Array();
        const normal = new NormalClass(10);
        const unboundcreate = float32Array.join;
        const boundcreate: () => void = unboundcreate.bind(normal);
        try {
          boundcreate();
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200011);
          flag = true;
        }
        expect(flag).assertTrue();
        console.info(`${caseName} test end`);
        done();
      })


    /**
     * @tc.number    : SUB_COLLECTION_SECOND_TYPEDARRAY_3000
     * @tc.name      : CollectionsFloattestTypedArray3000
     * @tc.desc      : map 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsFloattestTypedArray3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsFloattestTypedArray3000';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let float32Array: collections.Float32Array = new collections.Float32Array();
        const normal = new NormalClass(10);
        const unboundcreate = float32Array.map;
        const boundcreate: () => void = unboundcreate.bind(normal,()=>{});
        try {
          boundcreate();
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200011);
          flag = true;
        }
        expect(flag).assertTrue();
        console.info(`${caseName} test end`);
        done();
      })


    /**
     * @tc.number    : SUB_COLLECTION_SECOND_TYPEDARRAY_3100
     * @tc.name      : CollectionsFloattestTypedArray3100
     * @tc.desc      : map 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsFloattestTypedArray3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsFloattestTypedArray3100';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let arrayLike = [1, 2, 3];
          new collections.Float32Array(arrayLike).fill(4, 1).fill(4).forEach((value1, value2, Float32Array) => {
            let a = Float32Array.fill(4).map(Math.sqrt);
            console.info('Float32Array:', a);
          });
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200201);
          flag = true;
        }
        expect(flag).assertTrue();
        console.info(`${caseName} test end`);
        done();
      })


    /**
     * @tc.number    : SUB_COLLECTION_SECOND_TYPEDARRAY_3200
     * @tc.name      : CollectionsFloattestTypedArray3200
     * @tc.desc      : reduce 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsFloattestTypedArray3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsFloattestTypedArray3200';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let float32Array: collections.Float32Array = new collections.Float32Array();
        const normal = new NormalClass(10);
        const unboundcreate = float32Array.reduce;
        const boundcreate: () => void = unboundcreate.bind(normal,()=>{});
        try {
          boundcreate();
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200011);
          flag = true;
        }
        expect(flag).assertTrue();
        console.info(`${caseName} test end`);
        done();
      })


    /**
     * @tc.number    : SUB_COLLECTION_SECOND_TYPEDARRAY_3300
     * @tc.name      : CollectionsFloattestTypedArray3300
     * @tc.desc      : reduce 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsFloattestTypedArray3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsFloattestTypedArray3300';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let arrayLike = [1, 2, 3];
          new collections.Float32Array(arrayLike).fill(4, 1).fill(4).forEach((value1, value2, Float32Array) => {
            let a = Float32Array.fill(4).reduce((accumulator: number, value: number) => accumulator + value);
            console.info('Float32Array:', a);
          });
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200201);
          flag = true;
        }
        expect(flag).assertTrue();
        console.info(`${caseName} test end`);
        done();
      })


    /**
     * @tc.number    : SUB_COLLECTION_SECOND_TYPEDARRAY_3400
     * @tc.name      : CollectionsFloattestTypedArray3400
     * @tc.desc      : reduceRight 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsFloattestTypedArray3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsFloattestTypedArray3400';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let float32Array: collections.Float32Array = new collections.Float32Array();
        const normal = new NormalClass(10);
        const unboundcreate = float32Array.reduceRight;
        const boundcreate: () => void = unboundcreate.bind(normal);
        try {
          boundcreate();
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200011);
          flag = true;
        }
        expect(flag).assertTrue();
        console.info(`${caseName} test end`);
        done();
      })


    /**
     * @tc.number    : SUB_COLLECTION_SECOND_TYPEDARRAY_3500
     * @tc.name      : CollectionsFloattestTypedArray3500
     * @tc.desc      : reduceRight 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsFloattestTypedArray3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsFloattestTypedArray3500';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let arrayLike = [1, 2, 3];
          new collections.Float32Array(arrayLike).fill(4, 1).fill(4).forEach((value1, value2, Float32Array) => {
            let a = Float32Array.fill(4).reduceRight((accumulator: number, value: number) => accumulator + value);
            console.info('Float32Array:', a);
          });
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200201);
          flag = true;
        }
        expect(flag).assertTrue();
        console.info(`${caseName} test end`);
        done();
      })


    /**
     * @tc.number    : SUB_COLLECTION_SECOND_TYPEDARRAY_3600
     * @tc.name      : CollectionsFloattestTypedArray3600
     * @tc.desc      : reduce 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsFloattestTypedArray3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsFloattestTypedArray3600';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let float32Array: collections.Float32Array = new collections.Float32Array();
        const normal = new NormalClass(10);
        const unboundcreate = float32Array.reduce;
        const boundcreate: () => void = unboundcreate.bind(normal);
        try {
          boundcreate();
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200011);
          flag = true;
        }
        expect(flag).assertTrue();
        console.info(`${caseName} test end`);
        done();
      })


    /**
     * @tc.number    : SUB_COLLECTION_SECOND_TYPEDARRAY_3700
     * @tc.name      : CollectionsFloattestTypedArray3700
     * @tc.desc      : reduce 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsFloattestTypedArray3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsFloattestTypedArray3700';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let arrayLike = [1, 2, 3];
          new collections.Float32Array(arrayLike).fill(4, 1).fill(4).forEach((value1, value2, Float32Array) => {
            let a = Float32Array.fill(4).reduce((accumulator: number, value: number) => accumulator + value, 1);
            console.info('Float32Array:', a);
          });
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200201);
          flag = true;
        }
        expect(flag).assertTrue();
        console.info(`${caseName} test end`);
        done();
      })


    /**
     * @tc.number    : SUB_COLLECTION_SECOND_TYPEDARRAY_3800
     * @tc.name      : CollectionsFloattestTypedArray3800
     * @tc.desc      : reduceRight 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsFloattestTypedArray3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsFloattestTypedArray3800';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let float32Array: collections.Float32Array = new collections.Float32Array();
        const normal = new NormalClass(10);
        const unboundcreate = float32Array.reduceRight;
        const boundcreate: () => void = unboundcreate.bind(normal);
        try {
          boundcreate();
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200011);
          flag = true;
        }
        expect(flag).assertTrue();
        console.info(`${caseName} test end`);
        done();
      })


    /**
     * @tc.number    : SUB_COLLECTION_SECOND_TYPEDARRAY_3900
     * @tc.name      : CollectionsFloattestTypedArray3900
     * @tc.desc      : reduceRight 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsFloattestTypedArray3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsFloattestTypedArray3900';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let arrayLike = [1, 2, 3];
          new collections.Float32Array(arrayLike).fill(4, 1).fill(4).forEach((value1, value2, Float32Array) => {
            let a = Float32Array.fill(4).reduceRight((accumulator: number, value: number) => accumulator + value, 1);
            console.info('Float32Array:', a);
          });
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200201);
          flag = true;
        }
        expect(flag).assertTrue();
        console.info(`${caseName} test end`);
        done();
      })


    /**
     * @tc.number    : SUB_COLLECTION_SECOND_TYPEDARRAY_4000
     * @tc.name      : CollectionsFloattestTypedArray4000
     * @tc.desc      : reduce 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsFloattestTypedArray4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsFloattestTypedArray4000';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let float32Array: collections.Float32Array = new collections.Float32Array();
        const normal = new NormalClass(10);
        const unboundcreate = float32Array.reduce;
        const boundcreate: () => void = unboundcreate.bind(normal);
        try {
          boundcreate();
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200011);
          flag = true;
        }
        expect(flag).assertTrue();
        console.info(`${caseName} test end`);
        done();
      })


    /**
     * @tc.number    : SUB_COLLECTION_SECOND_TYPEDARRAY_4100
     * @tc.name      : CollectionsFloattestTypedArray4100
     * @tc.desc      : reduce 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsFloattestTypedArray4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsFloattestTypedArray4100';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let arrayLike = [1, 2, 3];
          new collections.Float32Array(arrayLike).fill(4, 1).fill(4).forEach((value1, value2, Float32Array) => {
            let a = Float32Array.fill(4)
              .reduce<string>((accumulator: string, value: number) => accumulator + value, 'initialValue');
            console.info('Float32Array:', a);
          });
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200201);
          flag = true;
        }
        expect(flag).assertTrue();
        console.info(`${caseName} test end`);
        done();
      })


    /**
     * @tc.number    : SUB_COLLECTION_SECOND_TYPEDARRAY_4200
     * @tc.name      : CollectionsFloattestTypedArray4200
     * @tc.desc      : reverse 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsFloattestTypedArray4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsFloattestTypedArray4200';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let float32Array: collections.Float32Array = new collections.Float32Array();
        const normal = new NormalClass(10);
        const unboundcreate = float32Array.reverse;
        const boundcreate: () => void = unboundcreate.bind(normal);
        try {
          boundcreate();
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200011);
          flag = true;
        }
        expect(flag).assertTrue();
        console.info(`${caseName} test end`);
        done();
      })


    /**
     * @tc.number    : SUB_COLLECTION_SECOND_TYPEDARRAY_4300
     * @tc.name      : CollectionsFloattestTypedArray4300
     * @tc.desc      : reverse 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsFloattestTypedArray4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsFloattestTypedArray4300';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let arrayLike = [1, 2, 3];
          new collections.Float32Array(arrayLike).fill(4, 1).fill(4).forEach((value1, value2, Float32Array) => {
            let a = Float32Array.fill(4).reverse();
            console.info('Float32Array:', a);
          });
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200201);
          flag = true;
        }
        expect(flag).assertTrue();
        console.info(`${caseName} test end`);
        done();
      })


    /**
     * @tc.number    : SUB_COLLECTION_SECOND_TYPEDARRAY_4400
     * @tc.name      : CollectionsFloattestTypedArray4400
     * @tc.desc      : set 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsFloattestTypedArray4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsFloattestTypedArray4400';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let float32Array: collections.Float32Array = new collections.Float32Array();
        const normal = new NormalClass(10);
        const unboundcreate = float32Array.set;
        const boundcreate: () => void = unboundcreate.bind(normal);
        try {
          boundcreate();
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200011);
          flag = true;
        }
        expect(flag).assertTrue();
        console.info(`${caseName} test end`);
        done();
      })


    /**
     * @tc.number    : SUB_COLLECTION_SECOND_TYPEDARRAY_4500
     * @tc.name      : CollectionsFloattestTypedArray4500
     * @tc.desc      : set 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsFloattestTypedArray4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsFloattestTypedArray4500';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let arrayLike = [1, 2, 3];
          new collections.Float32Array(arrayLike).fill(4, 1).fill(4).forEach((value1, value2, Float32Array) => {
            let a = Float32Array.fill(4).set([1, 2, 3], 3);
            console.info('Float32Array:', a);
          });
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200201);
          flag = true;
        }
        expect(flag).assertTrue();
        console.info(`${caseName} test end`);
        done();
      })


    /**
     * @tc.number    : SUB_COLLECTION_SECOND_TYPEDARRAY_4600
     * @tc.name      : CollectionsFloattestTypedArray4600
     * @tc.desc      : slice 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsFloattestTypedArray4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsFloattestTypedArray4600';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let float32Array: collections.Float32Array = new collections.Float32Array();
        const normal = new NormalClass(10);
        const unboundcreate = float32Array.slice;
        const boundcreate: () => void = unboundcreate.bind(normal);
        try {
          boundcreate();
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200011);
          flag = true;
        }
        expect(flag).assertTrue();
        console.info(`${caseName} test end`);
        done();
      })


    /**
     * @tc.number    : SUB_COLLECTION_SECOND_TYPEDARRAY_4700
     * @tc.name      : CollectionsFloattestTypedArray4700
     * @tc.desc      : slice 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsFloattestTypedArray4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsFloattestTypedArray4700';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let arrayLike = [1, 2, 3];
          new collections.Float32Array(arrayLike).fill(4, 1).fill(4).forEach((value1, value2, Float32Array) => {
            let a = Float32Array.fill(4).slice(1, 3);
            console.info('Float32Array:', a);
          });
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200201);
          flag = true;
        }
        expect(flag).assertTrue();
        console.info(`${caseName} test end`);
        done();
      })


    /**
     * @tc.number    : SUB_COLLECTION_SECOND_TYPEDARRAY_4800
     * @tc.name      : CollectionsFloattestTypedArray4800
     * @tc.desc      : sort 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsFloattestTypedArray4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsFloattestTypedArray4800';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let float32Array: collections.Float32Array = new collections.Float32Array();
        const normal = new NormalClass(10);
        const unboundcreate = float32Array.sort;
        const boundcreate: () => void = unboundcreate.bind(normal);
        try {
          boundcreate();
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200011);
          flag = true;
        }
        expect(flag).assertTrue();
        console.info(`${caseName} test end`);
        done();
      })


    /**
     * @tc.number    : SUB_COLLECTION_SECOND_TYPEDARRAY_4900
     * @tc.name      : CollectionsFloattestTypedArray4900
     * @tc.desc      : sort 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsFloattestTypedArray4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsFloattestTypedArray4900';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let arrayLike = [1, 2, 3];
          new collections.Float32Array(arrayLike).fill(4, 1).fill(4).forEach((value1, value2, Float32Array) => {
            let a = Float32Array.fill(4).sort((a: number, b: number) => a - b);
            console.info('Float32Array:', a);
          });
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200201);
          flag = true;
        }
        expect(flag).assertTrue();
        console.info(`${caseName} test end`);
        done();
      })


    /**
     * @tc.number    : SUB_COLLECTION_SECOND_TYPEDARRAY_5000
     * @tc.name      : CollectionsFloattestTypedArray5000
     * @tc.desc      : subarray 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsFloattestTypedArray5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsFloattestTypedArray5000';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let float32Array: collections.Float32Array = new collections.Float32Array();
        const normal = new NormalClass(10);
        const unboundcreate = float32Array.subarray;
        const boundcreate: () => void = unboundcreate.bind(normal);
        try {
          boundcreate();
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200011);
          flag = true;
        }
        expect(flag).assertTrue();
        console.info(`${caseName} test end`);
        done();
      })


    /**
     * @tc.number    : SUB_COLLECTION_SECOND_TYPEDARRAY_5100
     * @tc.name      : CollectionsFloattestTypedArray5100
     * @tc.desc      : subarray 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsFloattestTypedArray5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsFloattestTypedArray5100';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let arrayLike = [1, 2, 3];
          new collections.Float32Array(arrayLike).fill(4, 1).fill(4).forEach((value1, value2, Float32Array) => {
            let a = Float32Array.fill(4).subarray();
            console.info('Float32Array:', a);
          });
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200201);
          flag = true;
        }
        expect(flag).assertTrue();
        console.info(`${caseName} test end`);
        done();
      })


    /**
     * @tc.number    : SUB_COLLECTION_SECOND_TYPEDARRAY_5200
     * @tc.name      : CollectionsFloattestTypedArray5200
     * @tc.desc      : at 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsFloattestTypedArray5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsFloattestTypedArray5200';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let float32Array: collections.Float32Array = new collections.Float32Array();
        const normal = new NormalClass(10);
        const unboundcreate = float32Array.at;
        const boundcreate: () => void = unboundcreate.bind(normal);
        try {
          boundcreate();
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200011);
          flag = true;
        }
        expect(flag).assertTrue();
        console.info(`${caseName} test end`);
        done();
      })


    /**
     * @tc.number    : SUB_COLLECTION_SECOND_TYPEDARRAY_5300
     * @tc.name      : CollectionsFloattestTypedArray5300
     * @tc.desc      : at 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsFloattestTypedArray5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsFloattestTypedArray5300';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let arrayLike = [1, 2, 3];
          new collections.Float32Array(arrayLike).fill(4, 1).fill(4).forEach((value1, value2, Float32Array) => {
            let a = Float32Array.fill(4).at(-1);
            console.info('Float32Array:', a);
          });
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200201);
          flag = true;
        }
        expect(flag).assertTrue();
        console.info(`${caseName} test end`);
        done();
      })


    /**
     * @tc.number    : SUB_COLLECTION_SECOND_TYPEDARRAY_5400
     * @tc.name      : CollectionsFloattestTypedArray5400
     * @tc.desc      : includes 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsFloattestTypedArray5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsFloattestTypedArray5400';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let float32Array: collections.Float32Array = new collections.Float32Array();
        const normal = new NormalClass(10);
        const unboundcreate = float32Array.includes;
        const boundcreate: () => void = unboundcreate.bind(normal);
        try {
          boundcreate();
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200011);
          flag = true;
        }
        expect(flag).assertTrue();
        console.info(`${caseName} test end`);
        done();
      })


    /**
     * @tc.number    : SUB_COLLECTION_SECOND_TYPEDARRAY_5500
     * @tc.name      : CollectionsFloattestTypedArray5500
     * @tc.desc      : includes 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsFloattestTypedArray5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsFloattestTypedArray5500';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let arrayLike = [1, 2, 3];
          new collections.Float32Array(arrayLike).fill(4, 1).fill(4).forEach((value1, value2, Float32Array) => {
            let a = Float32Array.fill(4).includes(4);
            console.info('Float32Array:', a);
          });
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200201);
          flag = true;
        }
        expect(flag).assertTrue();
        console.info(`${caseName} test end`);
        done();
      })


    /**
     * @tc.number    : SUB_COLLECTION_SECOND_TYPEDARRAY_5600
     * @tc.name      : CollectionsFloattestTypedArray5600
     * @tc.desc      : entries 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsFloattestTypedArray5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsFloattestTypedArray5600';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let float32Array: collections.Float32Array = new collections.Float32Array();
        const normal = new NormalClass(10);
        const unboundcreate = float32Array.entries;
        const boundcreate: () => void = unboundcreate.bind(normal);
        try {
          boundcreate();
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200011);
          flag = true;
        }
        expect(flag).assertTrue();
        console.info(`${caseName} test end`);
        done();
      })


    /**
     * @tc.number    : SUB_COLLECTION_SECOND_TYPEDARRAY_5700
     * @tc.name      : CollectionsFloattestTypedArray5700
     * @tc.desc      : entries 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsFloattestTypedArray5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsFloattestTypedArray5700';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let arrayLike = [1, 2, 3];
          new collections.Float32Array(arrayLike).fill(4, 1).fill(4).forEach((value1, value2, Float32Array) => {
            let a = Float32Array.fill(4).entries();
            console.info('Float32Array:', a);
          });
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200201);
          flag = true;
        }
        expect(flag).assertTrue();
        console.info(`${caseName} test end`);
        done();
      })


    /**
     * @tc.number    : SUB_COLLECTION_SECOND_TYPEDARRAY_5800
     * @tc.name      : CollectionsFloattestTypedArray5800
     * @tc.desc      : keys 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsFloattestTypedArray5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsFloattestTypedArray5800';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let float32Array: collections.Float32Array = new collections.Float32Array();
        const normal = new NormalClass(10);
        const unboundcreate = float32Array.keys;
        const boundcreate: () => void = unboundcreate.bind(normal);
        try {
          boundcreate();
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200011);
          flag = true;
        }
        expect(flag).assertTrue();
        console.info(`${caseName} test end`);
        done();
      })


    /**
     * @tc.number    : SUB_COLLECTION_SECOND_TYPEDARRAY_5900
     * @tc.name      : CollectionsFloattestTypedArray5900
     * @tc.desc      : keys 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsFloattestTypedArray5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsFloattestTypedArray5900';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let arrayLike = [1, 2, 3];
          new collections.Float32Array(arrayLike).fill(4, 1).fill(4).forEach((value1, value2, Float32Array) => {
            let a = Float32Array.fill(4).keys();
            console.info('Float32Array:', a);
          });
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200201);
          flag = true;
        }
        expect(flag).assertTrue();
        console.info(`${caseName} test end`);
        done();
      })


    /**
     * @tc.number    : SUB_COLLECTION_SECOND_TYPEDARRAY_6000
     * @tc.name      : CollectionsFloattestTypedArray6000
     * @tc.desc      : values 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsFloattestTypedArray6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsFloattestTypedArray6000';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let float32Array: collections.Float32Array = new collections.Float32Array();
        const normal = new NormalClass(10);
        const unboundcreate = float32Array.values;
        const boundcreate: () => void = unboundcreate.bind(normal);
        try {
          boundcreate();
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200011);
          flag = true;
        }
        expect(flag).assertTrue();
        console.info(`${caseName} test end`);
        done();
      })


    /**
     * @tc.number    : SUB_COLLECTION_SECOND_TYPEDARRAY_6100
     * @tc.name      : CollectionsFloattestTypedArray6100
     * @tc.desc      : values 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsFloattestTypedArray6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsFloattestTypedArray6100';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let arrayLike = [1, 2, 3];
          new collections.Float32Array(arrayLike).fill(4, 1).fill(4).forEach((value1, value2, Float32Array) => {
            let a = Float32Array.fill(4).values();
            console.info('Float32Array:', a);
          });
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200201);
          flag = true;
        }
        expect(flag).assertTrue();
        console.info(`${caseName} test end`);
        done();
      })
  })
}