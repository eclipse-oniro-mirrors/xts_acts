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
import { ArkTSUtils, collections, HashMap, lang, taskpool } from '@kit.ArkTS';

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

export default function collectionsSixtest() {
  describe('collectionsSixtest', () => {
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
     * @tc.number    : SUB_COOLLECTIONSIX_1400
     * @tc.name      : collectionsSixtest1400
     * @tc.desc      : Int16Array toString 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsSixtest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsSixtest1400';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let array = new collections.Int16Array([1, 2, 3, 4, 5]);
        const normal = new NormalClass(10);
        const unbound = array.toString;
        const bound: () => void = unbound.bind(normal);
        try {
          bound()
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200011)
          flag = true
        }
        expect(flag).assertTrue()
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.number    : SUB_COOLLECTIONSIX_1500
     * @tc.name      : collectionsSixtest1500
     * @tc.desc      : Int16Array.toString 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsSixtest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsSixtest1500';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array = new collections.Int16Array([1, 2, 3, 4, 5]);
          array.forEach((value, key, array) => {
            array.fill(1,4).toString()
            console.info(`m[${key}] = ${value}`);
          });
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200201)
          flag = true
        }
        expect(flag).assertTrue()
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.number    : SUB_COOLLECTIONSIX_1600
     * @tc.name      : collectionsSixtest1600
     * @tc.desc      : Int16Array toLocaleString 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsSixtest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsSixtest1600';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let array = new collections.Int16Array([1, 2, 3, 4, 5]);
        const normal = new NormalClass(10);
        const unbound = array.toLocaleString;
        const bound: () => void = unbound.bind(normal);
        try {
          bound()
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200011)
          flag = true
        }
        expect(flag).assertTrue()
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.number    : SUB_COOLLECTIONSIX_1700
     * @tc.name      : collectionsSixtest1700
     * @tc.desc      : Int16Array.toLocaleString 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsSixtest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsSixtest1700';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array = new collections.Int16Array([1, 2, 3, 4, 5]);
          array.forEach((value, key, array) => {
            array.fill(1,4).toLocaleString()
            console.info(`m[${key}] = ${value}`);
          });
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200201)
          flag = true
        }
        expect(flag).assertTrue()
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.number    : SUB_COOLLECTIONSIX_1800
     * @tc.name      : collectionsSixtest1800
     * @tc.desc      : Int16Array copyWithin 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsSixtest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsSixtest1800';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let array = new collections.Int16Array([1, 2, 3, 4, 5]);
        const normal = new NormalClass(10);
        const unbound = array.copyWithin;
        const bound: () => void = unbound.bind(normal);
        try {
          bound()
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200011)
          flag = true
        }
        expect(flag).assertTrue()
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.number    : SUB_COOLLECTIONSIX_1900
     * @tc.name      : collectionsSixtest1900
     * @tc.desc      : Int16Array.copyWithin 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsSixtest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsSixtest1900';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array = new collections.Int16Array([1, 2, 3, 4, 5]);
          array.forEach((value, key, array) => {
            array.fill(1,4).copyWithin(3, 1, 3)
            console.info(`m[${key}] = ${value}`);
          });
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200201)
          flag = true
        }
        expect(flag).assertTrue()
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.number    : SUB_COOLLECTIONSIX_2000
     * @tc.name      : collectionsSixtest2000
     * @tc.desc      : Int16Array some 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsSixtest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsSixtest2000';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let array = new collections.Int16Array([1, 2, 3, 4, 5]);
        const normal = new NormalClass(10);
        const unbound = array.some;
        const bound: () => void = unbound.bind(normal);
        try {
          bound()
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200011)
          flag = true
        }
        expect(flag).assertTrue()
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.number    : SUB_COOLLECTIONSIX_2100
     * @tc.name      : collectionsSixtest2100
     * @tc.desc      : Int16Array.some 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsSixtest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsSixtest2100';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array = new collections.Int16Array([1, 2, 3, 4, 5]);
          array.forEach((value, key, array) => {
            array.fill(1,4).some((element: number) => element < 0)
            console.info(`m[${key}] = ${value}`);
          });
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200201)
          flag = true
        }
        expect(flag).assertTrue()
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.number    : SUB_COOLLECTIONSIX_2200
     * @tc.name      : collectionsSixtest2200
     * @tc.desc      : Int16Array.every 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsSixtest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsSixtest2200';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array = new collections.Int16Array([1, 2, 3, 4, 5]);
          array.forEach((value, key, array) => {
            array.fill(1,4).every((element: number) => element < 0)
            console.info(`m[${key}] = ${value}`);
          });
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200201)
          flag = true
        }
        expect(flag).assertTrue()
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.number    : SUB_COOLLECTIONSIX_2300
     * @tc.name      : collectionsSixtest2300
     * @tc.desc      : Int16Array every 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsSixtest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsSixtest2300';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let array = new collections.Int16Array([1, 2, 3, 4, 5]);
        const normal = new NormalClass(10);
        const unbound = array.every;
        const bound: () => void = unbound.bind(normal);
        try {
          bound()
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200011)
          flag = true
        }
        expect(flag).assertTrue()
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.number    : SUB_COOLLECTIONSIX_2500
     * @tc.name      : collectionsSixtest2500
     * @tc.desc      : Int16Array fill 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsSixtest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsSixtest2500';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let array = new collections.Int16Array([1, 2, 3, 4, 5]);
        const normal = new NormalClass(10);
        const unbound = array.fill;
        const bound: () => void = unbound.bind(normal);
        try {
          bound()
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200011)
          flag = true
        }
        expect(flag).assertTrue()
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.number    : SUB_COOLLECTIONSIX_2600
     * @tc.name      : collectionsSixtest2600
     * @tc.desc      : Int16Array.filter 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsSixtest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsSixtest2600';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array = new collections.Int16Array([1, 2, 3, 4, 5]);
          array.forEach((value, key, array) => {
            array.fill(1,4).filter((element: number) => element % 2 == 0)
            console.info(`m[${key}] = ${value}`);
          });
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200201)
          flag = true
        }
        expect(flag).assertTrue()
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.number    : SUB_COOLLECTIONSIX_3200
     * @tc.name      : collectionsSixtest3200
     * @tc.desc      : Int16Array filter 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsSixtest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsSixtest3200';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let array = new collections.Int16Array([1, 2, 3, 4, 5]);
        const normal = new NormalClass(10);
        const unbound = array.filter;
        const bound: () => void = unbound.bind(normal);
        try {
          bound()
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200011)
          flag = true
        }
        expect(flag).assertTrue()
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.number    : SUB_COOLLECTIONSIX_2700
     * @tc.name      : collectionsSixtest2700
     * @tc.desc      : Int16Array.find 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsSixtest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsSixtest2700';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array = new collections.Int16Array([1, 2, 3, 4, 5]);
          array.forEach((value, key, array) => {
            array.fill(1,4).find((element: number) => element % 2 == 0)
            console.info(`m[${key}] = ${value}`);
          });
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200201)
          flag = true
        }
        expect(flag).assertTrue()
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.number    : SUB_COOLLECTIONSIX_2800
     * @tc.name      : collectionsSixtest2800
     * @tc.desc      : Int16Array find 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsSixtest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsSixtest2800';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let array = new collections.Int16Array([1, 2, 3, 4, 5]);
        const normal = new NormalClass(10);
        const unbound = array.find;
        const bound: () => void = unbound.bind(normal);
        try {
          bound()
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200011)
          flag = true
        }
        expect(flag).assertTrue()
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.number    : SUB_COOLLECTIONSIX_2900
     * @tc.name      : collectionsSixtest2900
     * @tc.desc      : Int16Array.findIndex 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsSixtest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsSixtest2900';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array = new collections.Int16Array([1, 2, 3, 4, 5]);
          array.forEach((value, key, array) => {
            array.fill(1,4).findIndex((element: number) => element % 2 == 0)
            console.info(`m[${key}] = ${value}`);
          });
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200201)
          flag = true
        }
        expect(flag).assertTrue()
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.number    : SUB_COOLLECTIONSIX_3300
     * @tc.name      : collectionsSixtest3300
     * @tc.desc      : Int16Array findIndex 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsSixtest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsSixtest3300';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let array = new collections.Int16Array([1, 2, 3, 4, 5]);
        const normal = new NormalClass(10);
        const unbound = array.findIndex;
        const bound: () => void = unbound.bind(normal);
        try {
          bound()
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200011)
          flag = true
        }
        expect(flag).assertTrue()
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.number    : SUB_COOLLECTIONSIX_3000
     * @tc.name      : collectionsSixtest3000
     * @tc.desc      : Int16Array.forEach 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsSixtest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsSixtest3000';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array = new collections.Int16Array([1, 2, 3, 4, 5]);
          array.forEach((value, key, array) => {
            array.fill(1,4).forEach((value, key, array) => {
              array.fill(1,4).findIndex((element: number) => element % 2 == 0)
              console.info(`m[${key}] = ${value}`);
            });
          });
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200201)
          flag = true
        }
        expect(flag).assertTrue()
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.number    : SUB_COOLLECTIONSIX_3100
     * @tc.name      : collectionsSixtest3100
     * @tc.desc      : Int16Array forEach 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsSixtest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsSixtest3100';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let array = new collections.Int16Array([1, 2, 3, 4, 5]);
        const normal = new NormalClass(10);
        const unbound = array.forEach;
        const bound: () => void = unbound.bind(normal);
        try {
          bound()
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200011)
          flag = true
        }
        expect(flag).assertTrue()
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.number    : SUB_COOLLECTIONSIX_3400
     * @tc.name      : collectionsSixtest3400
     * @tc.desc      : Int16Array.indexOf 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsSixtest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsSixtest3400';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array = new collections.Int16Array([1, 2, 3, 4, 5]);
          array.forEach((value, key, array) => {
            array.fill(1,4).forEach((value, key, array) => {
              array.fill(1,4).indexOf(9, 2)
              console.info(`m[${key}] = ${value}`);
            });
          });
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200201)
          flag = true
        }
        expect(flag).assertTrue()
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.number    : SUB_COOLLECTIONSIX_3500
     * @tc.name      : collectionsSixtest3500
     * @tc.desc      : Int16Array indexOf 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsSixtest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsSixtest3500';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let array = new collections.Int16Array([1, 2, 3, 4, 5]);
        const normal = new NormalClass(10);
        const unbound = array.indexOf;
        const bound: () => void = unbound.bind(normal);
        try {
          bound()
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200011)
          flag = true
        }
        expect(flag).assertTrue()
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.number    : SUB_COOLLECTIONSIX_3600
     * @tc.name      : collectionsSixtest3600
     * @tc.desc      : Int16Array.lastIndexOf 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsSixtest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsSixtest3600';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array = new collections.Int16Array([1, 2, 3, 4, 5]);
          array.forEach((value, key, array) => {
            array.fill(1,4).forEach((value, key, array) => {
              array.fill(1,4).lastIndexOf(9, 2)
              console.info(`m[${key}] = ${value}`);
            });
          });
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200201)
          flag = true
        }
        expect(flag).assertTrue()
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.number    : SUB_COOLLECTIONSIX_3700
     * @tc.name      : collectionsSixtest3700
     * @tc.desc      : Int16Array lastIndexOf 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsSixtest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsSixtest3700';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let array = new collections.Int16Array([1, 2, 3, 4, 5]);
        const normal = new NormalClass(10);
        const unbound = array.lastIndexOf;
        const bound: () => void = unbound.bind(normal);
        try {
          bound()
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200011)
          flag = true
        }
        expect(flag).assertTrue()
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.number    : SUB_COOLLECTIONSIX_3800
     * @tc.name      : collectionsSixtest3800
     * @tc.desc      : Int16Array.join 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsSixtest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsSixtest3800';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array = new collections.Int16Array([1, 2, 3, 4, 5]);
          array.forEach((value, key, array) => {
            array.fill(1,4).forEach((value, key, array) => {
              array.fill(1,4).join('9, 2')
              console.info(`m[${key}] = ${value}`);
            });
          });
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200201)
          flag = true
        }
        expect(flag).assertTrue()
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.number    : SUB_COOLLECTIONSIX_3900
     * @tc.name      : collectionsSixtest3900
     * @tc.desc      : Int16Array join 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsSixtest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsSixtest3900';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let array = new collections.Int16Array([1, 2, 3, 4, 5]);
        const normal = new NormalClass(10);
        const unbound = array.lastIndexOf;
        const bound: () => void = unbound.bind(normal);
        try {
          bound()
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200011)
          flag = true
        }
        expect(flag).assertTrue()
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.number    : SUB_COOLLECTIONSIX_4000
     * @tc.name      : collectionsSixtest4000
     * @tc.desc      : Int16Array.map 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsSixtest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsSixtest4000';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array = new collections.Int16Array([1, 2, 3, 4, 5]);
          array.forEach((value, key, array) => {
            array.fill(1,4).forEach((value, key, array) => {
              array.fill(1,4).map(Math.sqrt)
              console.info(`m[${key}] = ${value}`);
            });
          });
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200201)
          flag = true
        }
        expect(flag).assertTrue()
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.number    : SUB_COOLLECTIONSIX_4100
     * @tc.name      : collectionsSixtest4100
     * @tc.desc      : Int16Array map 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsSixtest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsSixtest4100';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let array = new collections.Int16Array([1, 2, 3, 4, 5]);
        const normal = new NormalClass(10);
        const unbound = array.map;
        const bound: () => void = unbound.bind(normal);
        try {
          bound()
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200011)
          flag = true
        }
        expect(flag).assertTrue()
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.number    : SUB_COOLLECTIONSIX_4200
     * @tc.name      : collectionsSixtest4200
     * @tc.desc      : Int16Array.reduce 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsSixtest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsSixtest4200';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array = new collections.Int16Array([1, 2, 3, 4, 5]);
          array.forEach((value, key, array) => {
            array.fill(1,4).forEach((value, key, array) => {
              array.fill(1,4).reduce((accumulator: number, value: number) => accumulator + value);
              console.info(`m[${key}] = ${value}`);
            });
          });
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200201)
          flag = true
        }
        expect(flag).assertTrue()
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.number    : SUB_COOLLECTIONSIX_4300
     * @tc.name      : collectionsSixtest4300
     * @tc.desc      : Int16Array reduce 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsSixtest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsSixtest4300';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let array = new collections.Int16Array([1, 2, 3, 4, 5]);
        const normal = new NormalClass(10);
        const unbound = array.reduce;
        const bound: () => void = unbound.bind(normal);
        try {
          bound()
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200011)
          flag = true
        }
        expect(flag).assertTrue()
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.number    : SUB_COOLLECTIONSIX_4400
     * @tc.name      : collectionsSixtest4400
     * @tc.desc      : Int16Array.reduceRight 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsSixtest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsSixtest4400';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array = new collections.Int16Array([1, 2, 3, 4, 5]);
          array.forEach((value, key, array) => {
            array.fill(1,4).forEach((value, key, array) => {
              array.fill(1,4).reduceRight((accumulator: number, value: number) => accumulator + value);
              console.info(`m[${key}] = ${value}`);
            });
          });
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200201)
          flag = true
        }
        expect(flag).assertTrue()
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.number    : SUB_COOLLECTIONSIX_4500
     * @tc.name      : collectionsSixtest4500
     * @tc.desc      : Int16Array reduceRight 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsSixtest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsSixtest4500';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let array = new collections.Int16Array([1, 2, 3, 4, 5]);
        const normal = new NormalClass(10);
        const unbound = array.reduceRight;
        const bound: () => void = unbound.bind(normal);
        try {
          bound()
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200011)
          flag = true
        }
        expect(flag).assertTrue()
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.number    : SUB_COOLLECTIONSIX_4600
     * @tc.name      : collectionsSixtest4600
     * @tc.desc      : Int16Array.reverse 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsSixtest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsSixtest4600';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array = new collections.Int16Array([1, 2, 3, 4, 5]);
          array.forEach((value, key, array) => {
            array.fill(1,4).forEach((value, key, array) => {
              array.fill(1,4).reverse();
              console.info(`m[${key}] = ${value}`);
            });
          });
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200201)
          flag = true
        }
        expect(flag).assertTrue()
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.number    : SUB_COOLLECTIONSIX_4501
     * @tc.name      : collectionsSixtest4501
     * @tc.desc      : Int16Array reverse 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsSixtest4501', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsSixtest4501';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let array = new collections.Int16Array([1, 2, 3, 4, 5]);
        const normal = new NormalClass(10);
        const unbound = array.reverse;
        const bound: () => void = unbound.bind(normal);
        try {
          bound()
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200011)
          flag = true
        }
        expect(flag).assertTrue()
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.number    : SUB_COOLLECTIONSIX_4601
     * @tc.name      : collectionsSixtest4601
     * @tc.desc      : Int16Array.set 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsSixtest4601', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsSixtest4601';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array = new collections.Int16Array([1, 2, 3, 4, 5]);
          array.forEach((value, key, array) => {
            array.fill(1,4).forEach((value, key, array) => {
              array.fill(1,4).set([1, 2, 3], 3);
              console.info(`m[${key}] = ${value}`);
            });
          });
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200201)
          flag = true
        }
        expect(flag).assertTrue()
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.number    : SUB_COOLLECTIONSIX_4700
     * @tc.name      : collectionsSixtest4700
     * @tc.desc      : Int16Array set 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsSixtest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsSixtest4700';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let array = new collections.Int16Array([1, 2, 3, 4, 5]);
        const normal = new NormalClass(10);
        const unbound = array.set;
        const bound: () => void = unbound.bind(normal);
        try {
          bound()
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200011)
          flag = true
        }
        expect(flag).assertTrue()
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.number    : SUB_COOLLECTIONSIX_4800
     * @tc.name      : collectionsSixtest4800
     * @tc.desc      : Int16Array.slice 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsSixtest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsSixtest4800';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array = new collections.Int16Array([1, 2, 3, 4, 5]);
          array.forEach((value, key, array) => {
            array.fill(1,4).forEach((value, key, array) => {
              array.fill(1,4).slice(1, 3);
              console.info(`m[${key}] = ${value}`);
            });
          });
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200201)
          flag = true
        }
        expect(flag).assertTrue()
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.number    : SUB_COOLLECTIONSIX_4900
     * @tc.name      : collectionsSixtest4900
     * @tc.desc      : Int16Array slice 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsSixtest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsSixtest4900';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let array = new collections.Int16Array([1, 2, 3, 4, 5]);
        const normal = new NormalClass(10);
        const unbound = array.slice;
        const bound: () => void = unbound.bind(normal);
        try {
          bound()
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200011)
          flag = true
        }
        expect(flag).assertTrue()
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.number    : SUB_COOLLECTIONSIX_5000
     * @tc.name      : collectionsSixtest5000
     * @tc.desc      : Int16Array.sort 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsSixtest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsSixtest5000';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array = new collections.Int16Array([1, 2, 3, 4, 5]);
          array.forEach((value, key, array) => {
            array.fill(1,4).forEach((value, key, array) => {
              array.fill(1,4).sort((a: number, b: number) => a - b);
              console.info(`m[${key}] = ${value}`);
            });
          });
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200201)
          flag = true
        }
        expect(flag).assertTrue()
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.number    : SUB_COOLLECTIONSIX_5100
     * @tc.name      : collectionsSixtest5100
     * @tc.desc      : Int16Array sort 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsSixtest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsSixtest5100';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let array = new collections.Int16Array([1, 2, 3, 4, 5]);
        const normal = new NormalClass(10);
        const unbound = array.sort;
        const bound: () => void = unbound.bind(normal);
        try {
          bound()
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200011)
          flag = true
        }
        expect(flag).assertTrue()
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.number    : SUB_COOLLECTIONSIX_5200
     * @tc.name      : collectionsSixtest5200
     * @tc.desc      : Int16Array.subarray 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsSixtest5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsSixtest5200';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array = new collections.Int16Array([1, 2, 3, 4, 5]);
          array.forEach((value, key, array) => {
            array.fill(1,4).forEach((value, key, array) => {
              array.fill(1,4).subarray();
              console.info(`m[${key}] = ${value}`);
            });
          });
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200201)
          flag = true
        }
        expect(flag).assertTrue()
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.number    : SUB_COOLLECTIONSIX_5300
     * @tc.name      : collectionsSixtest5300
     * @tc.desc      : Int16Array subarray 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsSixtest5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsSixtest5300';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let array = new collections.Int16Array([1, 2, 3, 4, 5]);
        const normal = new NormalClass(10);
        const unbound = array.subarray;
        const bound: () => void = unbound.bind(normal);
        try {
          bound()
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200011)
          flag = true
        }
        expect(flag).assertTrue()
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.number    : SUB_COOLLECTIONSIX_5400
     * @tc.name      : collectionsSixtest5400
     * @tc.desc      : Int16Array.at 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsSixtest5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsSixtest5400';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array = new collections.Int16Array([1, 2, 3, 4, 5]);
          array.forEach((value, key, array) => {
            array.fill(1,4).forEach((value, key, array) => {
              array.fill(1,4).at(2);
              console.info(`m[${key}] = ${value}`);
            });
          });
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200201)
          flag = true
        }
        expect(flag).assertTrue()
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.number    : SUB_COOLLECTIONSIX_5500
     * @tc.name      : collectionsSixtest5500
     * @tc.desc      : Int16Array at 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsSixtest5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsSixtest5500';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let array = new collections.Int16Array([1, 2, 3, 4, 5]);
        const normal = new NormalClass(10);
        const unbound = array.at;
        const bound: () => void = unbound.bind(normal);
        try {
          bound()
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200011)
          flag = true
        }
        expect(flag).assertTrue()
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.number    : SUB_COOLLECTIONSIX_5600
     * @tc.name      : collectionsSixtest5600
     * @tc.desc      : Int16Array.includes 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsSixtest5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsSixtest5600';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array = new collections.Int16Array([1, 2, 3, 4, 5]);
          array.forEach((value, key, array) => {
            array.fill(1,4).forEach((value, key, array) => {
              array.fill(1,4).includes(2);
              console.info(`m[${key}] = ${value}`);
            });
          });
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200201)
          flag = true
        }
        expect(flag).assertTrue()
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.number    : SUB_COOLLECTIONSIX_5700
     * @tc.name      : collectionsSixtest5700
     * @tc.desc      : Int16Array includes 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsSixtest5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsSixtest5700';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let array = new collections.Int16Array([1, 2, 3, 4, 5]);
        const normal = new NormalClass(10);
        const unbound = array.includes;
        const bound: () => void = unbound.bind(normal);
        try {
          bound()
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200011)
          flag = true
        }
        expect(flag).assertTrue()
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.number    : SUB_COOLLECTIONSIX_5800
     * @tc.name      : collectionsSixtest5800
     * @tc.desc      : Int16Array.entries 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsSixtest5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsSixtest5800';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array = new collections.Int16Array([1, 2, 3, 4, 5]);
          array.forEach((value, key, array) => {
            array.fill(1,4).forEach((value, key, array) => {
              array.fill(1,4).entries();
              console.info(`m[${key}] = ${value}`);
            });
          });
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200201)
          flag = true
        }
        expect(flag).assertTrue()
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.number    : SUB_COOLLECTIONSIX_5900
     * @tc.name      : collectionsSixtest5900
     * @tc.desc      : Int16Array entries 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsSixtest5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsSixtest5900';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let array = new collections.Int16Array([1, 2, 3, 4, 5]);
        const normal = new NormalClass(10);
        const unbound = array.entries;
        const bound: () => void = unbound.bind(normal);
        try {
          bound()
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200011)
          flag = true
        }
        expect(flag).assertTrue()
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.number    : SUB_COOLLECTIONSIX_6000
     * @tc.name      : collectionsSixtest6000
     * @tc.desc      : Int16Array.keys 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsSixtest6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsSixtest6000';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array = new collections.Int16Array([1, 2, 3, 4, 5]);
          array.forEach((value, key, array) => {
            array.fill(1,4).forEach((value, key, array) => {
              array.fill(1,4).keys();
              console.info(`m[${key}] = ${value}`);
            });
          });
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200201)
          flag = true
        }
        expect(flag).assertTrue()
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.number    : SUB_COOLLECTIONSIX_6100
     * @tc.name      : collectionsSixtest6100
     * @tc.desc      : Int16Array keys 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsSixtest6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsSixtest6100';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let array = new collections.Int16Array([1, 2, 3, 4, 5]);
        const normal = new NormalClass(10);
        const unbound = array.keys;
        const bound: () => void = unbound.bind(normal);
        try {
          bound()
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200011)
          flag = true
        }
        expect(flag).assertTrue()
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.number    : SUB_COOLLECTIONSIX_6200
     * @tc.name      : collectionsSixtest6200
     * @tc.desc      : Int16Array.values 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsSixtest6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsSixtest6200';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array = new collections.Int16Array([1, 2, 3, 4, 5]);
          array.forEach((value, key, array) => {
            array.fill(1,4).forEach((value, key, array) => {
              array.fill(1,4).values();
              console.info(`m[${key}] = ${value}`);
            });
          });
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200201)
          flag = true
        }
        expect(flag).assertTrue()
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.number    : SUB_COOLLECTIONSIX_6300
     * @tc.name      : collectionsSixtest6300
     * @tc.desc      : Int16Array.values 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsSixtest6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsSixtest6300';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          type ISendable = lang.ISendable;
          let jsonText = 'This is not JSON,';
          let obj = ArkTSUtils.ASON.parse(jsonText) as ISendable;
          console.info((obj as object)?.["name"]);
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(undefined)
          flag = true
        }
        expect(flag).assertTrue()
        console.info(`${caseName} test end`);
        done()
      })
  })
}