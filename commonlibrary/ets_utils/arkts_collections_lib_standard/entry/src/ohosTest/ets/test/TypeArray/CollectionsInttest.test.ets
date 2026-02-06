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
import { collections, taskpool } from '@kit.ArkTS';

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

export default function collectionsInttest() {
  describe('collectionsInttest', () => {
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
     * @tc.number    : SUB_COLLECTION_THIRD_TYPEDARRAY_0100
     * @tc.name      : collectionsInttestTypedArray0100
     * @tc.desc      : toString 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsInttestTypedArray0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsInttestTypedArray0100';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let arrayLike = [1, 2, 3];
          new collections.Uint32Array(arrayLike).fill(4, 1).fill(4).forEach((value1, value2, Uint32Array) => {
            let a = Uint32Array.fill(4, 1).toString();
            console.info('Uint32Array:', a);
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
     * @tc.number    : SUB_COLLECTION_THIRD_TYPEDARRAY_0200
     * @tc.name      : collectionsInttestTypedArray0200
     * @tc.desc      : toLocaleString 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsInttestTypedArray0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsInttestTypedArray0200';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let uint32Array: collections.Uint32Array = new collections.Uint32Array();
        const normal = new NormalClass(10);
        const unboundcreate = uint32Array.toLocaleString;
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
     * @tc.number    : SUB_COLLECTION_THIRD_TYPEDARRAY_0300
     * @tc.name      : collectionsInttestTypedArray0300
     * @tc.desc      : toLocaleString 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsInttestTypedArray0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsInttestTypedArray0300';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let arrayLike = [1, 2, 3];
          new collections.Uint32Array(arrayLike).fill(4, 1).fill(4).forEach((value1, value2, Uint32Array) => {
            let a = Uint32Array.fill(4, 1).toLocaleString();
            console.info('Uint32Array:', a);
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
     * @tc.number    : SUB_COLLECTION_THIRD_TYPEDARRAY_0400
     * @tc.name      : collectionsInttestTypedArray0400
     * @tc.desc      : copyWithin 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsInttestTypedArray0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsInttestTypedArray0400';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let uint32Array: collections.Uint32Array = new collections.Uint32Array();
        const normal = new NormalClass(10);
        const unboundcreate = uint32Array.copyWithin;
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
     * @tc.number    : SUB_COLLECTION_THIRD_TYPEDARRAY_0500
     * @tc.name      : collectionsInttestTypedArray0500
     * @tc.desc      : copyWithin 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsInttestTypedArray0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsInttestTypedArray0500';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let arrayLike = [1, 2, 3];
          new collections.Uint32Array(arrayLike).fill(4, 1).fill(4).forEach((value1, value2, Uint32Array) => {
            let a = Uint32Array.fill(4, 1).copyWithin(3, 1, 3);
            console.info('Uint32Array:', a);
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
     * @tc.number    : SUB_COLLECTION_THIRD_TYPEDARRAY_0600
     * @tc.name      : collectionsInttestTypedArray0600
     * @tc.desc      : some 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsInttestTypedArray0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsInttestTypedArray0600';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let uint32Array: collections.Uint32Array = new collections.Uint32Array();
        const normal = new NormalClass(10);
        const unboundcreate = uint32Array.some;
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
     * @tc.number    : SUB_COLLECTION_THIRD_TYPEDARRAY_0700
     * @tc.name      : collectionsInttestTypedArray0700
     * @tc.desc      : some 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsInttestTypedArray0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsInttestTypedArray0700';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let arrayLike = [1, 2, 3];
          new collections.Uint32Array(arrayLike).fill(4, 1).fill(4).forEach((value1, value2, Uint32Array) => {
            let a = Uint32Array.fill(4, 1).some((element: number) => element < 0);
            console.info('Uint32Array:', a);
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
     * @tc.number    : SUB_COLLECTION_THIRD_TYPEDARRAY_0800
     * @tc.name      : collectionsInttestTypedArray0800
     * @tc.desc      : every 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsInttestTypedArray0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsInttestTypedArray0800';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let uint32Array: collections.Uint32Array = new collections.Uint32Array();
        const normal = new NormalClass(10);
        const unboundcreate = uint32Array.every;
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
     * @tc.number    : SUB_COLLECTION_THIRD_TYPEDARRAY_0900
     * @tc.name      : collectionsInttestTypedArray0900
     * @tc.desc      : every 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsInttestTypedArray0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsInttestTypedArray0900';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let arrayLike = [1, 2, 3];
          new collections.Uint32Array(arrayLike).fill(4, 1).fill(4).forEach((value1, value2, Uint32Array) => {
            let a = Uint32Array.fill(4, 1).every((element: number) => element > 0);
            console.info('Uint32Array:', a);
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
     * @tc.number    : SUB_COLLECTION_THIRD_TYPEDARRAY_1000
     * @tc.name      : collectionsInttestTypedArray1000
     * @tc.desc      : fill 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsInttestTypedArray1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsInttestTypedArray1000';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let uint32Array: collections.Uint32Array = new collections.Uint32Array();
        const normal = new NormalClass(10);
        const unboundcreate = uint32Array.fill;
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
     * @tc.number    : SUB_COLLECTION_THIRD_TYPEDARRAY_1100
     * @tc.name      : collectionsInttestTypedArray1100
     * @tc.desc      : filter 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsInttestTypedArray1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsInttestTypedArray1100';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let uint32Array: collections.Uint32Array = new collections.Uint32Array();
        const normal = new NormalClass(10);
        const unboundcreate = uint32Array.filter;
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
     * @tc.number    : SUB_COLLECTION_THIRD_TYPEDARRAY_1200
     * @tc.name      : collectionsInttestTypedArray1200
     * @tc.desc      : filter 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsInttestTypedArray1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsInttestTypedArray1200';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let arrayLike = [1, 2, 3];
          new collections.Uint32Array(arrayLike).fill(4, 1).fill(4).forEach((value1, value2, Uint32Array) => {
            let a = Uint32Array.fill(4, 1).filter((element: number) => element % 2 == 0);
            console.info('Uint32Array:', a);
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
     * @tc.number    : SUB_COLLECTION_THIRD_TYPEDARRAY_1300
     * @tc.name      : collectionsInttestTypedArray1300
     * @tc.desc      : find 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsInttestTypedArray1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsInttestTypedArray1300';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let uint32Array: collections.Uint32Array = new collections.Uint32Array();
        const normal = new NormalClass(10);
        const unboundcreate = uint32Array.find;
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
     * @tc.number    : SUB_COLLECTION_THIRD_TYPEDARRAY_1400
     * @tc.name      : collectionsInttestTypedArray1400
     * @tc.desc      : find 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsInttestTypedArray1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsInttestTypedArray1400';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let arrayLike = [1, 2, 3];
          new collections.Uint32Array(arrayLike).fill(4, 1).fill(4).forEach((value1, value2, Uint32Array) => {
            let a = Uint32Array.fill(4, 1).find((element: number) => element > 4);
            console.info('Uint32Array:', a);
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
     * @tc.number    : SUB_COLLECTION_THIRD_TYPEDARRAY_1500
     * @tc.name      : collectionsInttestTypedArray1500
     * @tc.desc      : findIndex 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsInttestTypedArray1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsInttestTypedArray1500';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let uint32Array: collections.Uint32Array = new collections.Uint32Array();
        const normal = new NormalClass(10);
        const unboundcreate = uint32Array.findIndex;
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
     * @tc.number    : SUB_COLLECTION_THIRD_TYPEDARRAY_1600
     * @tc.name      : collectionsInttestTypedArray1600
     * @tc.desc      : findIndex 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsInttestTypedArray1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsInttestTypedArray1600';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let arrayLike = [1, 2, 3];
          new collections.Uint32Array(arrayLike).fill(4, 1).fill(4).forEach((value1, value2, Uint32Array) => {
            let a = Uint32Array.fill(4, 1).findIndex((element: number) => element % 2 === 0);
            console.info('Uint32Array:', a);
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
     * @tc.number    : SUB_COLLECTION_THIRD_TYPEDARRAY_1700
     * @tc.name      : collectionsInttestTypedArray1700
     * @tc.desc      : forEach 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsInttestTypedArray1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsInttestTypedArray1700';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let uint32Array: collections.Uint32Array = new collections.Uint32Array();
        const normal = new NormalClass(10);
        const unboundcreate = uint32Array.forEach;
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
     * @tc.number    : SUB_COLLECTION_THIRD_TYPEDARRAY_1800
     * @tc.name      : collectionsInttestTypedArray1800
     * @tc.desc      : forEach 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsInttestTypedArray1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsInttestTypedArray1800';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let arrayLike = [1, 2, 3];
          new collections.Uint32Array(arrayLike).fill(4, 1).fill(4).forEach((value1, value2, Uint32Array) => {
            let a = Uint32Array.fill(4, 1).forEach((value: number, index: number, array: collections.Uint32Array) => {
              console.info(`Element ${value} at index ${index}`);
            });
            console.info('Uint32Array:', a);
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
     * @tc.number    : SUB_COLLECTION_THIRD_TYPEDARRAY_1900
     * @tc.name      : collectionsInttestTypedArray1900
     * @tc.desc      : indexOf 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsInttestTypedArray1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsInttestTypedArray1900';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let uint32Array: collections.Uint32Array = new collections.Uint32Array();
        const normal = new NormalClass(10);
        const unboundcreate = uint32Array.indexOf;
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
     * @tc.number    : SUB_COLLECTION_THIRD_TYPEDARRAY_2000
     * @tc.name      : collectionsInttestTypedArray2000
     * @tc.desc      : indexOf 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsInttestTypedArray2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsInttestTypedArray2000';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let arrayLike = [1, 2, 3];
          new collections.Uint32Array(arrayLike).fill(4, 1).fill(4).forEach((value1, value2, Uint32Array) => {
            let a = Uint32Array.fill(4, 1).indexOf(9, -2);
            console.info('Uint32Array:', a);
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
     * @tc.number    : SUB_COLLECTION_THIRD_TYPEDARRAY_2100
     * @tc.name      : collectionsInttestTypedArray2100
     * @tc.desc      : lastIndexOf 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsInttestTypedArray2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsInttestTypedArray2100';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let uint32Array: collections.Uint32Array = new collections.Uint32Array();
        const normal = new NormalClass(10);
        const unboundcreate = uint32Array.lastIndexOf;
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
     * @tc.number    : SUB_COLLECTION_THIRD_TYPEDARRAY_2200
     * @tc.name      : collectionsInttestTypedArray2200
     * @tc.desc      : lastIndexOf 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsInttestTypedArray2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsInttestTypedArray2200';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let arrayLike = [1, 2, 3];
          new collections.Uint32Array(arrayLike).fill(4, 1).fill(4).forEach((value1, value2, Uint32Array) => {
            let a = Uint32Array.fill(4, 1).lastIndexOf(7);
            console.info('Uint32Array:', a);
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
     * @tc.number    : SUB_COLLECTION_THIRD_TYPEDARRAY_2300
     * @tc.name      : collectionsInttestTypedArray2300
     * @tc.desc      : join 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsInttestTypedArray2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsInttestTypedArray2300';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let uint32Array: collections.Uint32Array = new collections.Uint32Array();
        const normal = new NormalClass(10);
        const unboundcreate = uint32Array.join;
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
     * @tc.number    : SUB_COLLECTION_THIRD_TYPEDARRAY_2400
     * @tc.name      : collectionsInttestTypedArray2400
     * @tc.desc      : join 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsInttestTypedArray2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsInttestTypedArray2400';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let arrayLike = [1, 2, 3];
          new collections.Uint32Array(arrayLike).fill(4, 1).fill(4).forEach((value1, value2, Uint32Array) => {
            let a = Uint32Array.fill(4, 1).join('-');
            console.info('Uint32Array:', a);
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
     * @tc.number    : SUB_COLLECTION_THIRD_TYPEDARRAY_2500
     * @tc.name      : collectionsInttestTypedArray2500
     * @tc.desc      : map 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsInttestTypedArray2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsInttestTypedArray2500';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let uint32Array: collections.Uint32Array = new collections.Uint32Array();
        const normal = new NormalClass(10);
        const unboundcreate = uint32Array.map;
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
     * @tc.number    : SUB_COLLECTION_THIRD_TYPEDARRAY_2600
     * @tc.name      : collectionsInttestTypedArray2600
     * @tc.desc      : map 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsInttestTypedArray2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsInttestTypedArray2600';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let arrayLike = [1, 2, 3];
          new collections.Uint32Array(arrayLike).fill(4, 1).fill(4).forEach((value1, value2, Uint32Array) => {
            let a = Uint32Array.fill(4, 1).map(Math.sqrt);
            console.info('Uint32Array:', a);
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
     * @tc.number    : SUB_COLLECTION_THIRD_TYPEDARRAY_2700
     * @tc.name      : collectionsInttestTypedArray2700
     * @tc.desc      : reduce 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsInttestTypedArray2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsInttestTypedArray2700';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let uint32Array: collections.Uint32Array = new collections.Uint32Array();
        const normal = new NormalClass(10);
        const unboundcreate = uint32Array.reduce;
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
     * @tc.number    : SUB_COLLECTION_THIRD_TYPEDARRAY_2800
     * @tc.name      : collectionsInttestTypedArray2800
     * @tc.desc      : reduce 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsInttestTypedArray2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsInttestTypedArray2800';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let arrayLike = [1, 2, 3];
          new collections.Uint32Array(arrayLike).fill(4, 1).fill(4).forEach((value1, value2, Uint32Array) => {
            let a = Uint32Array.fill(4, 1).reduce((accumulator: number, value: number) => accumulator + value);
            console.info('Uint32Array:', a);
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
     * @tc.number    : SUB_COLLECTION_THIRD_TYPEDARRAY_2900
     * @tc.name      : collectionsInttestTypedArray2900
     * @tc.desc      : reduceRight 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsInttestTypedArray2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsInttestTypedArray2900';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let uint32Array: collections.Uint32Array = new collections.Uint32Array();
        const normal = new NormalClass(10);
        const unboundcreate = uint32Array.reduceRight;
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
     * @tc.number    : SUB_COLLECTION_THIRD_TYPEDARRAY_3000
     * @tc.name      : collectionsInttestTypedArray3000
     * @tc.desc      : reduceRight 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsInttestTypedArray3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsInttestTypedArray3000';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let arrayLike = [1, 2, 3];
          new collections.Uint32Array(arrayLike).fill(4, 1).fill(4).forEach((value1, value2, Uint32Array) => {
            let a = Uint32Array.fill(4, 1).reduceRight((accumulator: number, value: number) => accumulator + value);
            console.info('Uint32Array:', a);
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
     * @tc.number    : SUB_COLLECTION_THIRD_TYPEDARRAY_3100
     * @tc.name      : collectionsInttestTypedArray3100
     * @tc.desc      : reduce 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsInttestTypedArray3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsInttestTypedArray3100';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let uint32Array: collections.Uint32Array = new collections.Uint32Array();
        const normal = new NormalClass(10);
        const unboundcreate = uint32Array.reduce;
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
     * @tc.number    : SUB_COLLECTION_THIRD_TYPEDARRAY_3200
     * @tc.name      : collectionsInttestTypedArray3200
     * @tc.desc      : reduce 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsInttestTypedArray3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsInttestTypedArray3200';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let arrayLike = [1, 2, 3];
          new collections.Uint32Array(arrayLike).fill(4, 1).fill(4).forEach((value1, value2, Uint32Array) => {
            let a = Uint32Array.fill(4, 1).reduce((accumulator: number, value: number) => accumulator + value, 1);
            console.info('Uint32Array:', a);
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
     * @tc.number    : SUB_COLLECTION_THIRD_TYPEDARRAY_3300
     * @tc.name      : collectionsInttestTypedArray3300
     * @tc.desc      : reduceRight 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsInttestTypedArray3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsInttestTypedArray3300';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let uint32Array: collections.Uint32Array = new collections.Uint32Array();
        const normal = new NormalClass(10);
        const unboundcreate = uint32Array.reduceRight;
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
     * @tc.number    : SUB_COLLECTION_THIRD_TYPEDARRAY_3400
     * @tc.name      : collectionsInttestTypedArray3400
     * @tc.desc      : reduceRight 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsInttestTypedArray3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsInttestTypedArray3400';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let arrayLike = [1, 2, 3];
          new collections.Uint32Array(arrayLike).fill(4, 1).fill(4).forEach((value1, value2, Uint32Array) => {
            let a = Uint32Array.fill(4, 1).reduceRight((accumulator: number, value: number) => accumulator + value, 1);
            console.info('Uint32Array:', a);
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
     * @tc.number    : SUB_COLLECTION_THIRD_TYPEDARRAY_3500
     * @tc.name      : collectionsInttestTypedArray3500
     * @tc.desc      : reduce 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsInttestTypedArray3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsInttestTypedArray3500';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let uint32Array: collections.Uint32Array = new collections.Uint32Array();
        const normal = new NormalClass(10);
        const unboundcreate = uint32Array.reduce;
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
     * @tc.number    : SUB_COLLECTION_THIRD_TYPEDARRAY_3600
     * @tc.name      : collectionsInttestTypedArray3600
     * @tc.desc      : reduce 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsInttestTypedArray3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsInttestTypedArray3600';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let arrayLike = [1, 2, 3];
          new collections.Uint32Array(arrayLike).fill(4, 1).fill(4).forEach((value1, value2, Uint32Array) => {
            let a = Uint32Array.fill(4, 1).reduce<string>((accumulator: string, value: number) => accumulator + value, "initialValue");
            console.info('Uint32Array:', a);
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
     * @tc.number    : SUB_COLLECTION_THIRD_TYPEDARRAY_3700
     * @tc.name      : collectionsInttestTypedArray3700
     * @tc.desc      : reverse 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsInttestTypedArray3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsInttestTypedArray3700';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let uint32Array: collections.Uint32Array = new collections.Uint32Array();
        const normal = new NormalClass(10);
        const unboundcreate = uint32Array.reverse;
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
     * @tc.number    : SUB_COLLECTION_THIRD_TYPEDARRAY_3800
     * @tc.name      : collectionsInttestTypedArray3800
     * @tc.desc      : reverse 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsInttestTypedArray3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsInttestTypedArray3800';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let arrayLike = [1, 2, 3];
          new collections.Uint32Array(arrayLike).fill(4, 1).fill(4).forEach((value1, value2, Uint32Array) => {
            let a = Uint32Array.fill(4, 1).reverse();
            console.info('Uint32Array:', a);
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
     * @tc.number    : SUB_COLLECTION_THIRD_TYPEDARRAY_3900
     * @tc.name      : collectionsInttestTypedArray3900
     * @tc.desc      : set 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsInttestTypedArray3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsInttestTypedArray3900';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let uint32Array: collections.Uint32Array = new collections.Uint32Array();
        const normal = new NormalClass(10);
        const unboundcreate = uint32Array.set;
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
     * @tc.number    : SUB_COLLECTION_THIRD_TYPEDARRAY_4000
     * @tc.name      : collectionsInttestTypedArray4000
     * @tc.desc      : set 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsInttestTypedArray4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsInttestTypedArray4000';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let arrayLike = [1, 2, 3];
          new collections.Uint32Array(arrayLike).fill(4, 1).fill(4).forEach((value1, value2, Uint32Array) => {
            let a = Uint32Array.fill(4, 1).set([1, 2, 3], 3);
            console.info('Uint32Array:', a);
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
     * @tc.number    : SUB_COLLECTION_THIRD_TYPEDARRAY_4100
     * @tc.name      : collectionsInttestTypedArray4100
     * @tc.desc      : slice 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsInttestTypedArray4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsInttestTypedArray4100';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let uint32Array: collections.Uint32Array = new collections.Uint32Array();
        const normal = new NormalClass(10);
        const unboundcreate = uint32Array.slice;
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
     * @tc.number    : SUB_COLLECTION_THIRD_TYPEDARRAY_4200
     * @tc.name      : collectionsInttestTypedArray4200
     * @tc.desc      : slice 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsInttestTypedArray4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsInttestTypedArray4200';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let arrayLike = [1, 2, 3];
          new collections.Uint32Array(arrayLike).fill(4, 1).fill(4).forEach((value1, value2, Uint32Array) => {
            let a = Uint32Array.fill(4, 1).slice(-2);
            console.info('Uint32Array:', a);
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
     * @tc.number    : SUB_COLLECTION_THIRD_TYPEDARRAY_4300
     * @tc.name      : collectionsInttestTypedArray4300
     * @tc.desc      : sort 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsInttestTypedArray4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsInttestTypedArray4300';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let uint32Array: collections.Uint32Array = new collections.Uint32Array();
        const normal = new NormalClass(10);
        const unboundcreate = uint32Array.sort;
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
     * @tc.number    : SUB_COLLECTION_THIRD_TYPEDARRAY_4400
     * @tc.name      : collectionsInttestTypedArray4400
     * @tc.desc      : sort 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsInttestTypedArray4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsInttestTypedArray4400';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let arrayLike = [1, 2, 3];
          new collections.Uint32Array(arrayLike).fill(4, 1).fill(4).forEach((value1, value2, Uint32Array) => {
            let a = Uint32Array.fill(4, 1).sort((a: number, b: number) => a - b);
            console.info('Uint32Array:', a);
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
     * @tc.number    : SUB_COLLECTION_THIRD_TYPEDARRAY_4500
     * @tc.name      : collectionsInttestTypedArray4500
     * @tc.desc      : subarray 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsInttestTypedArray4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsInttestTypedArray4500';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let uint32Array: collections.Uint32Array = new collections.Uint32Array();
        const normal = new NormalClass(10);
        const unboundcreate = uint32Array.subarray;
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
     * @tc.number    : SUB_COLLECTION_THIRD_TYPEDARRAY_4600
     * @tc.name      : collectionsInttestTypedArray4600
     * @tc.desc      : subarray 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsInttestTypedArray4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsInttestTypedArray4600';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let arrayLike = [1, 2, 3];
          new collections.Uint32Array(arrayLike).fill(4, 1).fill(4).forEach((value1, value2, Uint32Array) => {
            let a = Uint32Array.fill(4, 1).subarray();
            console.info('Uint32Array:', a);
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
     * @tc.number    : SUB_COLLECTION_THIRD_TYPEDARRAY_4700
     * @tc.name      : collectionsInttestTypedArray4700
     * @tc.desc      : at 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsInttestTypedArray4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsInttestTypedArray4700';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let uint32Array: collections.Uint32Array = new collections.Uint32Array();
        const normal = new NormalClass(10);
        const unboundcreate = uint32Array.at;
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
     * @tc.number    : SUB_COLLECTION_THIRD_TYPEDARRAY_4800
     * @tc.name      : collectionsInttestTypedArray4800
     * @tc.desc      : at 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsInttestTypedArray4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsInttestTypedArray4800';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let arrayLike = [1, 2, 3];
          new collections.Uint32Array(arrayLike).fill(4, 1).fill(4).forEach((value1, value2, Uint32Array) => {
            let a = Uint32Array.fill(4, 1).at(-1);
            console.info('Uint32Array:', a);
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
     * @tc.number    : SUB_COLLECTION_THIRD_TYPEDARRAY_4900
     * @tc.name      : collectionsInttestTypedArray4900
     * @tc.desc      : includes 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsInttestTypedArray4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsInttestTypedArray4900';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let uint32Array: collections.Uint32Array = new collections.Uint32Array();
        const normal = new NormalClass(10);
        const unboundcreate = uint32Array.includes;
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
     * @tc.number    : SUB_COLLECTION_THIRD_TYPEDARRAY_5000
     * @tc.name      : collectionsInttestTypedArray5000
     * @tc.desc      : includes 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsInttestTypedArray5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsInttestTypedArray5000';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let arrayLike = [1, 2, 3];
          new collections.Uint32Array(arrayLike).fill(4, 1).fill(4).forEach((value1, value2, Uint32Array) => {
            let a = Uint32Array.fill(4, 1).includes(3, 3);
            console.info('Uint32Array:', a);
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
     * @tc.number    : SUB_COLLECTION_THIRD_TYPEDARRAY_5100
     * @tc.name      : collectionsInttestTypedArray5100
     * @tc.desc      : entries 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsInttestTypedArray5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsInttestTypedArray5100';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let uint32Array: collections.Uint32Array = new collections.Uint32Array();
        const normal = new NormalClass(10);
        const unboundcreate = uint32Array.entries;
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
     * @tc.number    : SUB_COLLECTION_THIRD_TYPEDARRAY_5200
     * @tc.name      : collectionsInttestTypedArray5200
     * @tc.desc      : entries 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsInttestTypedArray5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsInttestTypedArray5200';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let arrayLike = [1, 2, 3];
          new collections.Uint32Array(arrayLike).fill(4, 1).fill(4).forEach((value1, value2, Uint32Array) => {
            let a = Uint32Array.fill(4, 1).entries();
            console.info('Uint32Array:', a);
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
     * @tc.number    : SUB_COLLECTION_THIRD_TYPEDARRAY_5300
     * @tc.name      : collectionsInttestTypedArray5300
     * @tc.desc      : keys 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsInttestTypedArray5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsInttestTypedArray5300';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let uint32Array: collections.Uint32Array = new collections.Uint32Array();
        const normal = new NormalClass(10);
        const unboundcreate = uint32Array.keys;
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
     * @tc.number    : SUB_COLLECTION_THIRD_TYPEDARRAY_5400
     * @tc.name      : collectionsInttestTypedArray5400
     * @tc.desc      : keys 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsInttestTypedArray5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsInttestTypedArray5400';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let arrayLike = [1, 2, 3];
          new collections.Uint32Array(arrayLike).fill(4, 1).fill(4).forEach((value1, value2, Uint32Array) => {
            let a = Uint32Array.fill(4, 1).keys();
            console.info('Uint32Array:', a);
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
     * @tc.number    : SUB_COLLECTION_THIRD_TYPEDARRAY_5500
     * @tc.name      : collectionsInttestTypedArray5500
     * @tc.desc      : values 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsInttestTypedArray5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsInttestTypedArray5500';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let uint32Array: collections.Uint32Array = new collections.Uint32Array();
        const normal = new NormalClass(10);
        const unboundcreate = uint32Array.values;
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
     * @tc.number    : SUB_COLLECTION_THIRD_TYPEDARRAY_5600
     * @tc.name      : collectionsInttestTypedArray5600
     * @tc.desc      : values 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsInttestTypedArray5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsInttestTypedArray5600';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let arrayLike = [1, 2, 3];
          new collections.Uint32Array(arrayLike).fill(4, 1).fill(4).forEach((value1, value2, Uint32Array) => {
            let a = Uint32Array.fill(4, 1).values();
            console.info('Uint32Array:', a);
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