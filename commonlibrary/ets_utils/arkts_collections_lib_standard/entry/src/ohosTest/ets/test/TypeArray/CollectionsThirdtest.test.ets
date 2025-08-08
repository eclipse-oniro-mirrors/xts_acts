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

export default function collectionsThirdtest() {
  describe('collectionsThirdtest', () => {
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
     * @tc.number    : SUB_COOLLECTIONTHIRD_1400
     * @tc.name      : collectionsThirdtest1400
     * @tc.desc      : Int8Array toString 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsThirdtest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsThirdtest1400';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let array = new collections.Int8Array([1, 2, 3, 4, 5]);
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
     * @tc.number    : SUB_COOLLECTIONTHIRD_1500
     * @tc.name      : collectionsThirdtest1500
     * @tc.desc      :  Int8Array.toString 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsThirdtest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsThirdtest1500';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array = new collections.Int8Array([1, 2, 3, 4, 5]);
          array.forEach((value, key, array) => {
            array.fill(1, 4).toString()
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
     * @tc.number    : SUB_COOLLECTIONTHIRD_1600
     * @tc.name      : collectionsThirdtest1600
     * @tc.desc      : Int8Array toLocaleString 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsThirdtest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsThirdtest1600';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let array = new collections.Int8Array([1, 2, 3, 4, 5]);
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
     * @tc.number    : SUB_COOLLECTIONTHIRD_1700
     * @tc.name      : collectionsThirdtest1700
     * @tc.desc      : Int8Array.toLocaleString 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsThirdtest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsThirdtest1700';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array = new collections.Int8Array([1, 2, 3, 4, 5]);
          array.forEach((value, key, array) => {
            array.fill(1, 4).toLocaleString()
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
     * @tc.number    : SUB_COOLLECTIONTHIRD_1800
     * @tc.name      : collectionsThirdtest1800
     * @tc.desc      : Int8Array copyWithin 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsThirdtest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsThirdtest1800';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let array = new collections.Int8Array([1, 2, 3, 4, 5]);
        const normal = new NormalClass(10);
        const unbound = array.copyWithin;
        const bound: () => void = unbound.bind(normal, 2, 0);
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
     * @tc.number    : SUB_COOLLECTIONTHIRD_18001
     * @tc.name      : collectionsThirdtest18001
     * @tc.desc      : Int8Array copyWithin 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsThirdtest18001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsThirdtest18001';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let array = new collections.Int8Array([1, 2, 3, 4, 5]);
        const normal = new NormalClass(10);
        const unbound = array.copyWithin;
        const bound: () => void = unbound.bind(normal, 2, 0, 3);
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
     * @tc.number    : SUB_COOLLECTIONTHIRD_1900
     * @tc.name      : collectionsThirdtest1900
     * @tc.desc      : Int8Array.copyWithin 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsThirdtest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsThirdtest1900';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array = new collections.Int8Array([1, 2, 3, 4, 5]);
          array.forEach((value, key, array) => {
            array.fill(1, 4).copyWithin(3, 1, 3)
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
     * @tc.number    : SUB_COOLLECTIONTHIRD_2000
     * @tc.name      : collectionsThirdtest2000
     * @tc.desc      : Int8Array some 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsThirdtest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsThirdtest2000';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let array = new collections.Int8Array([1, 2, 3, 4, 5]);
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
     * @tc.number    : SUB_COOLLECTIONTHIRD_2100
     * @tc.name      : collectionsThirdtest2100
     * @tc.desc      : Int8Array.some 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsThirdtest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsThirdtest2100';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array = new collections.Int8Array([1, 2, 3, 4, 5]);
          array.forEach((value, key, array) => {
            array.fill(1, 4).some((element: number) => element < 0)
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
     * @tc.number    : SUB_COOLLECTIONTHIRD_2200
     * @tc.name      : collectionsThirdtest2200
     * @tc.desc      : Int8Array.every 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsThirdtest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsThirdtest2200';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array = new collections.Int8Array([1, 2, 3, 4, 5]);
          array.forEach((value, key, array) => {
            array.fill(1, 4).every((element: number) => element < 0)
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
     * @tc.number    : SUB_COOLLECTIONTHIRD_2300
     * @tc.name      : collectionsThirdtest2300
     * @tc.desc      : Int8Array every 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsThirdtest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsThirdtest2300';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let array = new collections.Int8Array([1, 2, 3, 4, 5]);
        const normal = new NormalClass(10);
        const unbound = array.every;
        const bound: () => void = unbound.bind(normal, () => {
        });
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
     * @tc.number    : SUB_COOLLECTIONTHIRD_2400
     * @tc.name      : collectionsThirdtest2400
     * @tc.desc      : Int8Array.fill 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsThirdtest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsThirdtest2400';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array = new collections.Int8Array([1, 2, 3, 4, 5]);
          array.forEach((value, key, array) => {
            array.fill(1, 4).fill(4, 1)
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
     * @tc.number    : SUB_COOLLECTIONTHIRD_2500
     * @tc.name      : collectionsThirdtest2500
     * @tc.desc      : Int8Array fill 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsThirdtest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsThirdtest2500';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let array = new collections.Int8Array([1, 2, 3, 4, 5]);
        const normal = new NormalClass(10);
        const unbound = array.fill;
        const bound: () => void = unbound.bind(normal, 2);
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
     * @tc.number    : SUB_COOLLECTIONTHIRD_2600
     * @tc.name      : collectionsThirdtest2600
     * @tc.desc      : Int8Array.filter 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsThirdtest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsThirdtest2600';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array = new collections.Int8Array([1, 2, 3, 4, 5]);
          array.forEach((value, key, array) => {
            array.fill(1, 4).filter((element: number) => element % 2 == 0)
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
     * @tc.number    : SUB_COOLLECTIONTHIRD_3200
     * @tc.name      : collectionsThirdtest3200
     * @tc.desc      : Int8Array filter 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsThirdtest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsThirdtest3200';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let array = new collections.Int8Array([1, 2, 3, 4, 5]);
        const normal = new NormalClass(10);
        const unbound = array.filter;
        const bound: () => void = unbound.bind(normal, () => {
        });
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
     * @tc.number    : SUB_COOLLECTIONTHIRD_2700
     * @tc.name      : collectionsThirdtest2700
     * @tc.desc      : Int8Array.find 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsThirdtest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsThirdtest2700';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array = new collections.Int8Array([1, 2, 3, 4, 5]);
          array.forEach((value, key, array) => {
            array.fill(1, 4).find((element: number) => element % 2 == 0)
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
     * @tc.number    : SUB_COOLLECTIONTHIRD_2800
     * @tc.name      : collectionsThirdtest2800
     * @tc.desc      : Int8Array find 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsThirdtest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsThirdtest2800';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let array = new collections.Int8Array([1, 2, 3, 4, 5]);
        const normal = new NormalClass(10);
        const unbound = array.find;
        const bound: () => void = unbound.bind(normal, () => {
        });
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
     * @tc.number    : SUB_COOLLECTIONTHIRD_2900
     * @tc.name      : collectionsThirdtest2900
     * @tc.desc      : Int8Array.findIndex 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsThirdtest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsThirdtest2900';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array = new collections.Int8Array([1, 2, 3, 4, 5]);
          array.forEach((value, key, array) => {
            array.fill(1, 4).findIndex((element: number) => element % 2 == 0)
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
     * @tc.number    : SUB_COOLLECTIONTHIRD_3300
     * @tc.name      : collectionsThirdtest3300
     * @tc.desc      : Int8Array findIndex 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsThirdtest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsThirdtest3300';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let array = new collections.Int8Array([1, 2, 3, 4, 5]);
        const normal = new NormalClass(10);
        const unbound = array.findIndex;
        const bound: () => void = unbound.bind(normal, () => {
        });
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
     * @tc.number    : SUB_COOLLECTIONTHIRD_3000
     * @tc.name      : collectionsThirdtest3000
     * @tc.desc      : Int8Array.forEach 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsThirdtest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsThirdtest3000';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array = new collections.Int8Array([1, 2, 3, 4, 5]);
          array.forEach((value, key, array) => {
            array.fill(1, 4).forEach((value, key, array) => {
              array.fill(1, 4).findIndex((element: number) => element % 2 == 0)
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
     * @tc.number    : SUB_COOLLECTIONTHIRD_3100
     * @tc.name      : collectionsThirdtest3100
     * @tc.desc      : Int8Array forEach 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsThirdtest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsThirdtest3100';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let array = new collections.Int8Array([1, 2, 3, 4, 5]);
        const normal = new NormalClass(10);
        const unbound = array.forEach;
        const bound: () => void = unbound.bind(normal, () => {
        });
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
     * @tc.number    : SUB_COOLLECTIONTHIRD_3400
     * @tc.name      : collectionsThirdtest3400
     * @tc.desc      : Int8Array.indexOf 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsThirdtest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsThirdtest3400';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array = new collections.Int8Array([1, 2, 3, 4, 5]);
          array.forEach((value, key, array) => {
            array.fill(1, 4).forEach((value, key, array) => {
              array.fill(1, 4).indexOf(9, 2)
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
     * @tc.number    : SUB_COOLLECTIONTHIRD_3500
     * @tc.name      : collectionsThirdtest3500
     * @tc.desc      : Int8Array indexOf 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsThirdtest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsThirdtest3500';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let array = new collections.Int8Array([1, 2, 3, 4, 5]);
        const normal = new NormalClass(10);
        const unbound = array.indexOf;
        const bound: () => void = unbound.bind(normal, 1);
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
     * @tc.number    : SUB_COOLLECTIONTHIRD_3600
     * @tc.name      : collectionsThirdtest3600
     * @tc.desc      : Int8Array.lastIndexOf 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsThirdtest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsThirdtest3600';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array = new collections.Int8Array([1, 2, 3, 4, 5]);
          array.forEach((value, key, array) => {
            array.fill(1, 4).forEach((value, key, array) => {
              array.fill(1, 4).lastIndexOf(9, 2)
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
     * @tc.number    : SUB_COOLLECTIONTHIRD_3700
     * @tc.name      : collectionsThirdtest3700
     * @tc.desc      : Int8Array lastIndexOf 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsThirdtest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsThirdtest3700';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let array = new collections.Int8Array([1, 2, 3, 4, 5]);
        const normal = new NormalClass(10);
        const unbound = array.lastIndexOf;
        const bound: () => void = unbound.bind(normal, 2);
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
     * @tc.number    : SUB_COOLLECTIONTHIRD_3800
     * @tc.name      : collectionsThirdtest3800
     * @tc.desc      : Int8Array.join 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsThirdtest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsThirdtest3800';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array = new collections.Int8Array([1, 2, 3, 4, 5]);
          array.forEach((value, key, array) => {
            array.fill(1, 4).forEach((value, key, array) => {
              array.fill(1, 4).join('9, 2')
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
     * @tc.number    : SUB_COOLLECTIONTHIRD_3900
     * @tc.name      : collectionsThirdtest3900
     * @tc.desc      : Int8Array join 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsThirdtest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsThirdtest3900';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let array = new collections.Int8Array([1, 2, 3, 4, 5]);
        const normal = new NormalClass(10);
        const unbound = array.lastIndexOf;
        const bound: () => void = unbound.bind(normal, 2, 3);
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
     * @tc.number    : SUB_COOLLECTIONTHIRD_4000
     * @tc.name      : collectionsThirdtest4000
     * @tc.desc      : Int8Array.map 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsThirdtest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsThirdtest4000';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array = new collections.Int8Array([1, 2, 3, 4, 5]);
          array.forEach((value, key, array) => {
            array.fill(1, 4).forEach((value, key, array) => {
              array.fill(1, 4).map(Math.sqrt)
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
     * @tc.number    : SUB_COOLLECTIONTHIRD_4100
     * @tc.name      : collectionsThirdtest4100
     * @tc.desc      : Int8Array map 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsThirdtest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsThirdtest4100';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let array = new collections.Int8Array([1, 2, 3, 4, 5]);
        const normal = new NormalClass(10);
        const unbound = array.map;
        const bound: () => void = unbound.bind(normal,()=>{});
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
     * @tc.number    : SUB_COOLLECTIONTHIRD_4200
     * @tc.name      : collectionsThirdtest4200
     * @tc.desc      : Int8Array.reduce 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsThirdtest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsThirdtest4200';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array = new collections.Int8Array([1, 2, 3, 4, 5]);
          array.forEach((value, key, array) => {
            array.fill(1, 4).forEach((value, key, array) => {
              array.fill(1, 4).reduce((accumulator: number, value: number) => accumulator + value);
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
     * @tc.number    : SUB_COOLLECTIONTHIRD_4300
     * @tc.name      : collectionsThirdtest4300
     * @tc.desc      : Int8Array reduce 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsThirdtest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsThirdtest4300';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let array = new collections.Int8Array([1, 2, 3, 4, 5]);
        const normal = new NormalClass(10);
        const unbound = array.reduce;
        const bound: () => void = unbound.bind(normal,()=>{});
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
     * @tc.number    : SUB_COOLLECTIONTHIRD_4400
     * @tc.name      : collectionsThirdtest4400
     * @tc.desc      : Int8Array.reduceRight 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsThirdtest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsThirdtest4400';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array = new collections.Int8Array([1, 2, 3, 4, 5]);
          array.forEach((value, key, array) => {
            array.fill(1, 4).forEach((value, key, array) => {
              array.fill(1, 4).reduceRight((accumulator: number, value: number) => accumulator + value);
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
     * @tc.number    : SUB_COOLLECTIONTHIRD_4500
     * @tc.name      : collectionsThirdtest4500
     * @tc.desc      : Int8Array reduceRight 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsThirdtest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsThirdtest4500';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let array = new collections.Int8Array([1, 2, 3, 4, 5]);
        const normal = new NormalClass(10);
        const unbound = array.reduceRight;
        const bound: () => void = unbound.bind(normal,()=>{});
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
     * @tc.number    : SUB_COOLLECTIONTHIRD_4600
     * @tc.name      : collectionsThirdtest4600
     * @tc.desc      : Int8Array.reverse 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsThirdtest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsThirdtest4600';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array = new collections.Int8Array([1, 2, 3, 4, 5]);
          array.forEach((value, key, array) => {
            array.fill(1, 4).forEach((value, key, array) => {
              array.fill(1, 4).reverse();
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
     * @tc.number    : SUB_COOLLECTIONTHIRD_4501
     * @tc.name      : collectionsThirdtest4501
     * @tc.desc      : Int8Array reverse 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsThirdtest4501', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsThirdtest4501';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let array = new collections.Int8Array([1, 2, 3, 4, 5]);
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
     * @tc.number    : SUB_COOLLECTIONTHIRD_4601
     * @tc.name      : collectionsThirdtest4601
     * @tc.desc      : Int8Array.set 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsThirdtest4601', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsThirdtest4601';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array = new collections.Int8Array([1, 2, 3, 4, 5]);
          array.forEach((value, key, array) => {
            array.fill(1, 4).forEach((value, key, array) => {
              array.fill(1, 4).set([1, 2, 3], 3);
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
     * @tc.number    : SUB_COOLLECTIONTHIRD_4700
     * @tc.name      : collectionsThirdtest4700
     * @tc.desc      : Int8Array set 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsThirdtest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsThirdtest4700';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let array = new collections.Int8Array([1, 2, 3, 4, 5]);
        const normal = new NormalClass(10);
        const unbound = array.set;
        const bound: () => void = unbound.bind(normal,[1,2]);
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
     * @tc.number    : SUB_COOLLECTIONTHIRD_4800
     * @tc.name      : collectionsThirdtest4800
     * @tc.desc      : Int8Array.slice 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsThirdtest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsThirdtest4800';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array = new collections.Int8Array([1, 2, 3, 4, 5]);
          array.forEach((value, key, array) => {
            array.fill(1, 4).forEach((value, key, array) => {
              array.fill(1, 4).slice(1, 3);
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
     * @tc.number    : SUB_COOLLECTIONTHIRD_4900
     * @tc.name      : collectionsThirdtest4900
     * @tc.desc      : Int8Array slice 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsThirdtest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsThirdtest4900';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let array = new collections.Int8Array([1, 2, 3, 4, 5]);
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
     * @tc.number    : SUB_COOLLECTIONTHIRD_5000
     * @tc.name      : collectionsThirdtest5000
     * @tc.desc      : Int8Array.sort 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsThirdtest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsThirdtest5000';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array = new collections.Int8Array([1, 2, 3, 4, 5]);
          array.forEach((value, key, array) => {
            array.fill(1, 4).forEach((value, key, array) => {
              array.fill(1, 4).sort((a: number, b: number) => a - b);
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
     * @tc.number    : SUB_COOLLECTIONTHIRD_5100
     * @tc.name      : collectionsThirdtest5100
     * @tc.desc      : Int8Array sort 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsThirdtest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsThirdtest5100';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let array = new collections.Int8Array([1, 2, 3, 4, 5]);
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
     * @tc.number    : SUB_COOLLECTIONTHIRD_5200
     * @tc.name      : collectionsThirdtest5200
     * @tc.desc      : Int8Array.subarray 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsThirdtest5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsThirdtest5200';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array = new collections.Int8Array([1, 2, 3, 4, 5]);
          array.forEach((value, key, array) => {
            array.fill(1, 4).forEach((value, key, array) => {
              array.fill(1, 4).subarray();
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
     * @tc.number    : SUB_COOLLECTIONTHIRD_5300
     * @tc.name      : collectionsThirdtest5300
     * @tc.desc      : Int8Array subarray 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsThirdtest5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsThirdtest5300';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let array = new collections.Int8Array([1, 2, 3, 4, 5]);
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
     * @tc.number    : SUB_COOLLECTIONTHIRD_5400
     * @tc.name      : collectionsThirdtest5400
     * @tc.desc      : Int8Array.at 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsThirdtest5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsThirdtest5400';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array = new collections.Int8Array([1, 2, 3, 4, 5]);
          array.forEach((value, key, array) => {
            array.fill(1, 4).forEach((value, key, array) => {
              array.fill(1, 4).at(2);
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
     * @tc.number    : SUB_COOLLECTIONTHIRD_5500
     * @tc.name      : collectionsThirdtest5500
     * @tc.desc      : Int8Array at 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsThirdtest5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsThirdtest5500';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let array = new collections.Int8Array([1, 2, 3, 4, 5]);
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
     * @tc.number    : SUB_COOLLECTIONTHIRD_5600
     * @tc.name      : collectionsThirdtest5600
     * @tc.desc      : Int8Array.includes 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsThirdtest5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsThirdtest5600';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array = new collections.Int8Array([1, 2, 3, 4, 5]);
          array.forEach((value, key, array) => {
            array.fill(1, 4).forEach((value, key, array) => {
              array.fill(1, 4).includes(2);
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
     * @tc.number    : SUB_COOLLECTIONTHIRD_5700
     * @tc.name      : collectionsThirdtest5700
     * @tc.desc      : Int8Array includes 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsThirdtest5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsThirdtest5700';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let array = new collections.Int8Array([1, 2, 3, 4, 5]);
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
     * @tc.number    : SUB_COOLLECTIONTHIRD_5800
     * @tc.name      : collectionsThirdtest5800
     * @tc.desc      : Int8Array.entries 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsThirdtest5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsThirdtest5800';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array = new collections.Int8Array([1, 2, 3, 4, 5]);
          array.forEach((value, key, array) => {
            array.fill(1, 4).forEach((value, key, array) => {
              array.fill(1, 4).entries();
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
     * @tc.number    : SUB_COOLLECTIONTHIRD_5900
     * @tc.name      : collectionsThirdtest5900
     * @tc.desc      : Int8Array entries 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsThirdtest5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsThirdtest5900';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let array = new collections.Int8Array([1, 2, 3, 4, 5]);
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
     * @tc.number    : SUB_COOLLECTIONTHIRD_6000
     * @tc.name      : collectionsThirdtest6000
     * @tc.desc      : Int8Array.keys 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsThirdtest6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsThirdtest6000';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array = new collections.Int8Array([1, 2, 3, 4, 5]);
          array.forEach((value, key, array) => {
            array.fill(1, 4).forEach((value, key, array) => {
              array.fill(1, 4).keys();
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
     * @tc.number    : SUB_COOLLECTIONTHIRD_6100
     * @tc.name      : collectionsThirdtest6100
     * @tc.desc      : Int8Array keys 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsThirdtest6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsThirdtest6100';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let array = new collections.Int8Array([1, 2, 3, 4, 5]);
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
     * @tc.number    : SUB_COOLLECTIONTHIRD_6200
     * @tc.name      : collectionsThirdtest6200
     * @tc.desc      : Int8Array.values 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('collectionsThirdtest6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsThirdtest6200';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array = new collections.Int8Array([1, 2, 3, 4, 5]);
          array.forEach((value, key, array) => {
            array.fill(1, 4).forEach((value, key, array) => {
              array.fill(1, 4).values();
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