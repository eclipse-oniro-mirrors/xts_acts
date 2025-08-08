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

export default function collectionsFifthtest() {
  describe('collectionsFifthtest', () => {
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
     * @tc.number    : SUB_COOLLECTIONFIFTH_1400
     * @tc.name      : collectionsFifthtest1400
     * @tc.desc      : Int16Array toString 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsFifthtest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsFifthtest1400';
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
     * @tc.number    : SUB_COOLLECTIONFIFTH_1500
     * @tc.name      : collectionsFifthtest1500
     * @tc.desc      : Int16Array.toString 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsFifthtest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsFifthtest1500';
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
     * @tc.number    : SUB_COOLLECTIONFIFTH_1600
     * @tc.name      : collectionsFifthtest1600
     * @tc.desc      : Int16Array toLocaleString 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsFifthtest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsFifthtest1600';
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
     * @tc.number    : SUB_COOLLECTIONFIFTH_1700
     * @tc.name      : collectionsFifthtest1700
     * @tc.desc      : Int16Array.toLocaleString 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsFifthtest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsFifthtest1700';
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
     * @tc.number    : SUB_COOLLECTIONFIFTH_1800
     * @tc.name      : collectionsFifthtest1800
     * @tc.desc      : Int16Array copyWithin 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsFifthtest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsFifthtest1800';
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
     * @tc.number    : SUB_COOLLECTIONFIFTH_1900
     * @tc.name      : collectionsFifthtest1900
     * @tc.desc      : Int16Array.copyWithin 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsFifthtest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsFifthtest1900';
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
     * @tc.number    : SUB_COOLLECTIONFIFTH_2000
     * @tc.name      : collectionsFifthtest2000
     * @tc.desc      : Int16Array some 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsFifthtest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsFifthtest2000';
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
     * @tc.number    : SUB_COOLLECTIONFIFTH_2100
     * @tc.name      : collectionsFifthtest2100
     * @tc.desc      : Int16Array.some 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsFifthtest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsFifthtest2100';
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
     * @tc.number    : SUB_COOLLECTIONFIFTH_2200
     * @tc.name      : collectionsFifthtest2200
     * @tc.desc      : Int16Array.every 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsFifthtest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsFifthtest2200';
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
     * @tc.number    : SUB_COOLLECTIONFIFTH_2300
     * @tc.name      : collectionsFifthtest2300
     * @tc.desc      : Int16Array every 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsFifthtest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsFifthtest2300';
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
     * @tc.number    : SUB_COOLLECTIONFIFTH_2500
     * @tc.name      : collectionsFifthtest2500
     * @tc.desc      : Int16Array fill 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsFifthtest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsFifthtest2500';
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
     * @tc.number    : SUB_COOLLECTIONFIFTH_2600
     * @tc.name      : collectionsFifthtest2600
     * @tc.desc      : Int16Array.filter 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsFifthtest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsFifthtest2600';
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
     * @tc.number    : SUB_COOLLECTIONFIFTH_3200
     * @tc.name      : collectionsFifthtest3200
     * @tc.desc      : Int16Array filter 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsFifthtest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsFifthtest3200';
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
     * @tc.number    : SUB_COOLLECTIONFIFTH_2700
     * @tc.name      : collectionsFifthtest2700
     * @tc.desc      : Int16Array.find 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsFifthtest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsFifthtest2700';
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
     * @tc.number    : SUB_COOLLECTIONFIFTH_2800
     * @tc.name      : collectionsFifthtest2800
     * @tc.desc      : Int16Array find 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsFifthtest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsFifthtest2800';
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
     * @tc.number    : SUB_COOLLECTIONFIFTH_2900
     * @tc.name      : collectionsFifthtest2900
     * @tc.desc      : Int16Array.findIndex 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsFifthtest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsFifthtest2900';
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
     * @tc.number    : SUB_COOLLECTIONFIFTH_3300
     * @tc.name      : collectionsFifthtest3300
     * @tc.desc      : Int16Array findIndex 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsFifthtest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsFifthtest3300';
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
     * @tc.number    : SUB_COOLLECTIONFIFTH_3000
     * @tc.name      : collectionsFifthtest3000
     * @tc.desc      : Int16Array.forEach 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsFifthtest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsFifthtest3000';
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
     * @tc.number    : SUB_COOLLECTIONFIFTH_3100
     * @tc.name      : collectionsFifthtest3100
     * @tc.desc      : Int16Array forEach 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsFifthtest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsFifthtest3100';
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
     * @tc.number    : SUB_COOLLECTIONFIFTH_3400
     * @tc.name      : collectionsFifthtest3400
     * @tc.desc      : Int16Array.indexOf 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsFifthtest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsFifthtest3400';
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
     * @tc.number    : SUB_COOLLECTIONFIFTH_3500
     * @tc.name      : collectionsFifthtest3500
     * @tc.desc      : Int16Array indexOf 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsFifthtest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsFifthtest3500';
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
     * @tc.number    : SUB_COOLLECTIONFIFTH_3600
     * @tc.name      : collectionsFifthtest3600
     * @tc.desc      : Int16Array.lastIndexOf 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsFifthtest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsFifthtest3600';
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
     * @tc.number    : SUB_COOLLECTIONFIFTH_3700
     * @tc.name      : collectionsFifthtest3700
     * @tc.desc      : Int16Array lastIndexOf 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsFifthtest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsFifthtest3700';
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
     * @tc.number    : SUB_COOLLECTIONFIFTH_3800
     * @tc.name      : collectionsFifthtest3800
     * @tc.desc      : Int16Array.join 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsFifthtest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsFifthtest3800';
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
     * @tc.number    : SUB_COOLLECTIONFIFTH_3900
     * @tc.name      : collectionsFifthtest3900
     * @tc.desc      : Int16Array join 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsFifthtest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsFifthtest3900';
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
     * @tc.number    : SUB_COOLLECTIONFIFTH_4000
     * @tc.name      : collectionsFifthtest4000
     * @tc.desc      : Int16Array.map 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsFifthtest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsFifthtest4000';
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
     * @tc.number    : SUB_COOLLECTIONFIFTH_4100
     * @tc.name      : collectionsFifthtest4100
     * @tc.desc      : Int16Array map 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsFifthtest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsFifthtest4100';
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
     * @tc.number    : SUB_COOLLECTIONFIFTH_4200
     * @tc.name      : collectionsFifthtest4200
     * @tc.desc      : Int16Array.reduce 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsFifthtest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsFifthtest4200';
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
     * @tc.number    : SUB_COOLLECTIONFIFTH_4300
     * @tc.name      : collectionsFifthtest4300
     * @tc.desc      : Int16Array reduce 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsFifthtest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsFifthtest4300';
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
     * @tc.number    : SUB_COOLLECTIONFIFTH_4400
     * @tc.name      : collectionsFifthtest4400
     * @tc.desc      : Int16Array.reduceRight 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsFifthtest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsFifthtest4400';
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
     * @tc.number    : SUB_COOLLECTIONFIFTH_4500
     * @tc.name      : collectionsFifthtest4500
     * @tc.desc      : Int16Array reduceRight 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsFifthtest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsFifthtest4500';
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
     * @tc.number    : SUB_COOLLECTIONFIFTH_4600
     * @tc.name      : collectionsFifthtest4600
     * @tc.desc      : Int16Array.reverse 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsFifthtest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsFifthtest4600';
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
     * @tc.number    : SUB_COOLLECTIONFIFTH_4501
     * @tc.name      : collectionsFifthtest4501
     * @tc.desc      : Int16Array reverse 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsFifthtest4501', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsFifthtest4501';
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
     * @tc.number    : SUB_COOLLECTIONFIFTH_4601
     * @tc.name      : collectionsFifthtest4601
     * @tc.desc      : Int16Array.set 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsFifthtest4601', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsFifthtest4601';
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
     * @tc.number    : SUB_COOLLECTIONFIFTH_4700
     * @tc.name      : collectionsFifthtest4700
     * @tc.desc      : Int16Array set 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsFifthtest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsFifthtest4700';
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
     * @tc.number    : SUB_COOLLECTIONFIFTH_4800
     * @tc.name      : collectionsFifthtest4800
     * @tc.desc      : Int16Array.slice 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsFifthtest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsFifthtest4800';
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
     * @tc.number    : SUB_COOLLECTIONFIFTH_4900
     * @tc.name      : collectionsFifthtest4900
     * @tc.desc      : Int16Array slice 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsFifthtest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsFifthtest4900';
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
     * @tc.number    : SUB_COOLLECTIONFIFTH_5000
     * @tc.name      : collectionsFifthtest5000
     * @tc.desc      : Int16Array.sort 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsFifthtest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsFifthtest5000';
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
     * @tc.number    : SUB_COOLLECTIONFIFTH_5100
     * @tc.name      : collectionsFifthtest5100
     * @tc.desc      : Int16Array sort 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsFifthtest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsFifthtest5100';
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
     * @tc.number    : SUB_COOLLECTIONFIFTH_5200
     * @tc.name      : collectionsFifthtest5200
     * @tc.desc      : Int16Array.subarray 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsFifthtest5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsFifthtest5200';
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
     * @tc.number    : SUB_COOLLECTIONFIFTH_5300
     * @tc.name      : collectionsFifthtest5300
     * @tc.desc      : Int16Array subarray 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsFifthtest5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsFifthtest5300';
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
     * @tc.number    : SUB_COOLLECTIONFIFTH_5400
     * @tc.name      : collectionsFifthtest5400
     * @tc.desc      : Int16Array.at 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsFifthtest5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsFifthtest5400';
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
     * @tc.number    : SUB_COOLLECTIONFIFTH_5500
     * @tc.name      : collectionsFifthtest5500
     * @tc.desc      : Int16Array at 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsFifthtest5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsFifthtest5500';
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
     * @tc.number    : SUB_COOLLECTIONFIFTH_5600
     * @tc.name      : collectionsFifthtest5600
     * @tc.desc      : Int16Array.includes 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsFifthtest5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsFifthtest5600';
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
     * @tc.number    : SUB_COOLLECTIONFIFTH_5700
     * @tc.name      : collectionsFifthtest5700
     * @tc.desc      : Int16Array includes 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsFifthtest5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsFifthtest5700';
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
     * @tc.number    : SUB_COOLLECTIONFIFTH_5800
     * @tc.name      : collectionsFifthtest5800
     * @tc.desc      : Int16Array.entries 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsFifthtest5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsFifthtest5800';
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
     * @tc.number    : SUB_COOLLECTIONFIFTH_5900
     * @tc.name      : collectionsFifthtest5900
     * @tc.desc      : Int16Array entries 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsFifthtest5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsFifthtest5900';
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
     * @tc.number    : SUB_COOLLECTIONFIFTH_6000
     * @tc.name      : collectionsFifthtest6000
     * @tc.desc      : Int16Array.keys 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsFifthtest6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsFifthtest6000';
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
     * @tc.number    : SUB_COOLLECTIONFIFTH_6100
     * @tc.name      : collectionsFifthtest6100
     * @tc.desc      : Int16Array keys 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsFifthtest6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsFifthtest6100';
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
     * @tc.number    : SUB_COOLLECTIONFIFTH_6200
     * @tc.name      : collectionsFifthtest6200
     * @tc.desc      : Int16Array.values 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsFifthtest6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsFifthtest6200';
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
    
  })
}