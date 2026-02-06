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

export default function collectionsSecondtest() {
  describe('collectionsSecondtest', () => {
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
     * @tc.number    : SUB_COOLLECTIONSECOND_4400
     * @tc.name      : CollectionsSecondtest4400
     * @tc.desc      : Array join 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsSecondtest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsSecondtest4400';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          collections.Array.from([-10, 20, -30, 40, -50]).forEach((value1, value2, Array) => {
            let a = Array.copyWithin(3, 1, 3).forEach((value1, value2, array) => {
              let a = array.copyWithin(3, 1, 3).join('4');
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
     * @tc.number    : SUB_COOLLECTIONSECOND_4500
     * @tc.name      : CollectionsSecondtest4500
     * @tc.desc      : Array 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsSecondtest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsSecondtest4500';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array = new collections.Array<number>(1, 2, 3, 4, 5);
          const normal = new NormalClass(10);
          const unbound = array.join;
          const bound: () => void = unbound.bind(normal);
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
     * @tc.number    : SUB_COOLLECTIONSECOND_4600
     * @tc.name      : CollectionsSecondtest4600
     * @tc.desc      : Array shift 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsSecondtest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsSecondtest4600';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          collections.Array.from([-10, 20, -30, 40, -50]).forEach((value1, value2, Array) => {
            let a = Array.copyWithin(3, 1, 3).forEach((value1, value2, array) => {
              let a = array.copyWithin(3, 1, 3).shift();
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
     * @tc.number    : SUB_COOLLECTIONSECOND_4700
     * @tc.name      : CollectionsSecondtest4700
     * @tc.desc      : Array shift 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsSecondtest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsSecondtest4700';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array = new collections.Array<number>(1, 2, 3, 4, 5);
          const normal = new NormalClass(10);
          const unbound = array.shift;
          const bound: () => void = unbound.bind(normal);
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
     * @tc.number    : SUB_COOLLECTIONSECOND_4701
     * @tc.name      : CollectionsSecondtest4701
     * @tc.desc      : Array reverse 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsSecondtest4701', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsSecondtest4701';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          collections.Array.from([-10, 20, -30, 40, -50]).forEach((value1, value2, Array) => {
            let a = Array.copyWithin(3, 1, 3).forEach((value1, value2, array) => {
              let a = array.copyWithin(3, 1, 3).reverse();
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
     * @tc.number    : SUB_COOLLECTIONSECOND_4800
     * @tc.name      : CollectionsSecondtest4800
     * @tc.desc      : Array 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsSecondtest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsSecondtest4800';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array = new collections.Array<number>(1, 2, 3, 4, 5);
          const normal = new NormalClass(10);
          const unbound = array.reverse;
          const bound: () => void = unbound.bind(normal);
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
     * @tc.number    : SUB_COOLLECTIONSECOND_4900
     * @tc.name      : CollectionsSecondtest4900
     * @tc.desc      : Array unshift 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsSecondtest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsSecondtest4900';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          collections.Array.from([-10, 20, -30, 40, -50]).forEach((value1, value2, Array) => {
            let a = Array.copyWithin(3, 1, 3).forEach((value1, value2, array) => {
              let a = array.copyWithin(3, 1, 3).unshift(0);
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
     * @tc.number    : SUB_COOLLECTIONSECOND_5000
     * @tc.name      : CollectionsSecondtest5000
     * @tc.desc      : Array 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsSecondtest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsSecondtest5000';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array = new collections.Array<number>(1, 2, 3, 4, 5);
          const normal = new NormalClass(10);
          const unbound = array.unshift;
          const bound: () => void = unbound.bind(normal);
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
     * @tc.number    : SUB_COOLLECTIONSECOND_5100
     * @tc.name      : CollectionsSecondtest5100
     * @tc.desc      : Array toString 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsSecondtest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsSecondtest5100';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          collections.Array.from([-10, 20, -30, 40, -50]).forEach((value1, value2, Array) => {
            let a = Array.copyWithin(3, 1, 3).forEach((value1, value2, array) => {
              let a = array.copyWithin(3, 1, 3).toString();
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
     * @tc.number    : SUB_COOLLECTIONSECOND_5200
     * @tc.name      : CollectionsSecondtest5200
     * @tc.desc      : Array toString 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsSecondtest5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsSecondtest5200';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array = new collections.Array<number>(1, 2, 3, 4, 5);
          const normal = new NormalClass(10);
          const unbound = array.toString;
          const bound: () => void = unbound.bind(normal);
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
     * @tc.number    : SUB_COOLLECTIONSECOND_5300
     * @tc.name      : CollectionsSecondtest5300
     * @tc.desc      : Array slice 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsSecondtest5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsSecondtest5300';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          collections.Array.from([-10, 20, -30, 40, -53]).forEach((value1, value2, Array) => {
            let a = Array.copyWithin(3, 1, 3).forEach((value1, value2, array) => {
              let a = array.copyWithin(3, 1, 3).slice(1,2);
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
     * @tc.number    : SUB_COOLLECTIONSECOND_5400
     * @tc.name      : CollectionsSecondtest5400
     * @tc.desc      : Array slice 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsSecondtest5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsSecondtest5400';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array = new collections.Array<number>(1, 2, 3, 4, 5);
          const normal = new NormalClass(10);
          const unbound = array.slice;
          const bound: () => void = unbound.bind(normal);
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
     * @tc.number    : SUB_COOLLECTIONSECOND_5500
     * @tc.name      : CollectionsSecondtest5500
     * @tc.desc      : Array sort 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsSecondtest5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsSecondtest5500';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          collections.Array.from([-10, 20, -30, 40, -50]).forEach((value1, value2, Array) => {
            let a = Array.copyWithin(3, 1, 3).forEach((value1, value2, array) => {
              let a = array.copyWithin(3, 1, 3).sort(((a: number, b: number) => a - b));
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
     * @tc.number    : SUB_COOLLECTIONSECOND_5600
     * @tc.name      : CollectionsSecondtest5600
     * @tc.desc      : Array sort 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsSecondtest5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsSecondtest5600';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array = new collections.Array<number>(1, 2, 3, 4, 5);
          const normal = new NormalClass(10);
          const unbound = array.sort;
          const bound: () => void = unbound.bind(normal);
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
     * @tc.number    : SUB_COOLLECTIONSECOND_5700
     * @tc.name      : CollectionsSecondtest5700
     * @tc.desc      : Array sort 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsSecondtest5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsSecondtest5700';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          collections.Array.from([-10, 20, -30, 40, -50]).forEach((value1, value2, Array) => {
            let a = Array.copyWithin(3, 1, 3).forEach((value1, value2, array) => {
              let a = array.copyWithin(3, 1, 3).indexOf(1);
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
     * @tc.number    : SUB_COOLLECTIONSECOND_5800
     * @tc.name      : CollectionsSecondtest5800
     * @tc.desc      : Array sort 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsSecondtest5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsSecondtest5800';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array = new collections.Array<number>(1, 2, 3, 4, 5);
          const normal = new NormalClass(10);
          const unbound = array.indexOf;
          const bound: () => void = unbound.bind(normal);
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
     * @tc.number    : SUB_COOLLECTIONSECOND_5900
     * @tc.name      : CollectionsSecondtest5900
     * @tc.desc      : Array forEach 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsSecondtest5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsSecondtest5900';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          collections.Array.from([-10, 20, -30, 40, -50]).forEach((value1, value2, Array) => {
            let a = Array.forEach((value1, value2, Array) => {
              let b = Array.sort((a: number, b: number) => b - a).forEach((value1, value2, array) => {
                console.info('array:',array)
              });
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
     * @tc.number    : SUB_COOLLECTIONSECOND_6000
     * @tc.name      : CollectionsSecondtest6000
     * @tc.desc      : Array forEach 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsSecondtest6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsSecondtest6000';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array = new collections.Array<number>(1, 2, 3, 4, 5);
          const normal = new NormalClass(10);
          const unbound = array.forEach;
          const bound: () => void = unbound.bind(normal);
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
     * @tc.number    : SUB_COOLLECTIONSECOND_6100
     * @tc.name      : CollectionsSecondtest6100
     * @tc.desc      : Array map 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsSecondtest6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsSecondtest6100';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          collections.Array.from([-10, 20, -30, 40, -50]).forEach((value1, value2, Array) => {
            let a = Array.sort((a: number, b: number) => a - b).forEach((value1, value2, Array) => {
              let b = Array.map((a: number, b: number) => b - a).forEach((value1, value2, array) => {
                console.info('array:',array)
              });
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
     * @tc.number    : SUB_COOLLECTIONSECOND_6200
     * @tc.name      : CollectionsSecondtest6200
     * @tc.desc      : Array map 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsSecondtest6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsSecondtest6200';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array = new collections.Array<number>(1, 2, 3, 4, 5);
          const normal = new NormalClass(10);
          const unbound = array.forEach;
          const bound: () => void = unbound.bind(normal);
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
     * @tc.number    : SUB_COOLLECTIONSECOND_6300
     * @tc.name      : CollectionsSecondtest6300
     * @tc.desc      : Array filter 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsSecondtest6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsSecondtest6300';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          collections.Array.from([-10, 20, -30, 40, -50]).forEach((value1, value2, Array) => {
            let a = Array.sort((a: number, b: number) => a - b).forEach((value1, value2, Array) => {
              let b = Array.filter((value : number) => value % 2 === 0).forEach((value1, value2, array) => {
                console.info('array:',array)
              });
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
     * @tc.number    : SUB_COOLLECTIONSECOND_6400
     * @tc.name      : CollectionsSecondtest6400
     * @tc.desc      : Array filter 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsSecondtest6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsSecondtest6400';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array = new collections.Array<number>(1, 2, 3, 4, 5);
          const normal = new NormalClass(10);
          const unbound = array.filter;
          const bound: () => void = unbound.bind(normal);
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
     * @tc.number    : SUB_COOLLECTIONSECOND_6500
     * @tc.name      : CollectionsSecondtest6500
     * @tc.desc      : Array reduce 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsSecondtest6500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsSecondtest6500';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          collections.Array.from([-10, 20, -30, 40, -50]).forEach((value1, value2, Array) => {
            let a = Array.sort((a: number, b: number) => a - b).forEach((value1, value2, array) => {
              array.reduce((accumulator, value) => accumulator + value);
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
     * @tc.number    : SUB_COOLLECTIONSECOND_6600
     * @tc.name      : CollectionsSecondtest6600
     * @tc.desc      : Array reduce 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsSecondtest6600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsSecondtest6600';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array = new collections.Array<number>(1, 2, 3, 4, 5);
          const normal = new NormalClass(10);
          const unbound = array.reduce;
          const bound: () => void = unbound.bind(normal);
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
     * @tc.number    : SUB_COOLLECTIONSECOND_6700
     * @tc.name      : CollectionsSecondtest6700
     * @tc.desc      : Array reduce 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsSecondtest6700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsSecondtest6700';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          collections.Array.from([-10, 20, -30, 40, -50]).forEach((value1, value2, Array) => {
            let a = Array.sort((a: number, b: number) => a - b).forEach((value1, value2, array) => {
              array.reduce((accumulator, value) => accumulator + value);
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
     * @tc.number    : SUB_COOLLECTIONSECOND_6800
     * @tc.name      : CollectionsSecondtest6800
     * @tc.desc      : Array reduce 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsSecondtest6800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsSecondtest6800';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array = new collections.Array<number>(1, 2, 3, 4, 5);
          const normal = new NormalClass(10);
          const unbound = array.reduce;
          const bound: () => void = unbound.bind(normal);
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
     * @tc.number    : SUB_COOLLECTIONSECOND_6900
     * @tc.name      : CollectionsSecondtest6900
     * @tc.desc      : Array reduce 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsSecondtest6900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsSecondtest6900';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          collections.Array.from([-10, 20, -30, 40, -50]).forEach((value1, value2, Array) => {
            let a = Array.sort((a: number, b: number) => a - b).forEach((value1, value2, array) => {
              array.reduce<number>((accumulator: number, value: number) => accumulator + value, 0);
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
     * @tc.number    : SUB_COOLLECTIONSECOND_7000
     * @tc.name      : CollectionsSecondtest7000
     * @tc.desc      : Array at 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsSecondtest7000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsSecondtest7000';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array = new collections.Array<number>(1, 2, 3, 4, 5);
          const normal = new NormalClass(10);
          const unbound = array.at;
          const bound: () => void = unbound.bind(normal);
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
     * @tc.number    : SUB_COOLLECTIONSECOND_7100
     * @tc.name      : CollectionsSecondtest7100
     * @tc.desc      : Array at 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsSecondtest7100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsSecondtest7100';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          collections.Array.from([-10, 20, -30, 40, -50]).forEach((value1, value2, Array) => {
            let a = Array.sort((a: number, b: number) => a - b).forEach((value1, value2, array) => {
              array.at(2);
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
     * @tc.number    : SUB_COOLLECTIONSECOND_7200
     * @tc.name      : CollectionsSecondtest7200
     * @tc.desc      : Array entries 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsSecondtest7200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsSecondtest7200';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array = new collections.Array<number>(1, 2, 3, 4, 5);
          const normal = new NormalClass(10);
          const unbound = array.entries;
          const bound: () => void = unbound.bind(normal);
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
     * @tc.number    : SUB_COOLLECTIONSECOND_7300
     * @tc.name      : CollectionsSecondtest7300
     * @tc.desc      : Array entries 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsSecondtest7300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsSecondtest7300';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          collections.Array.from([-10, 20, -30, 40, -50]).forEach((value1, value2, Array) => {
            let a = Array.sort((a: number, b: number) => a - b).forEach((value1, value2, array) => {
              array.entries();
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
     * @tc.number    : SUB_COOLLECTIONSECOND_7400
     * @tc.name      : CollectionsSecondtest7400
     * @tc.desc      : Array keys 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsSecondtest7400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsSecondtest7400';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array = new collections.Array<number>(1, 2, 3, 4, 5);
          const normal = new NormalClass(10);
          const unbound = array.keys;
          const bound: () => void = unbound.bind(normal);
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
     * @tc.number    : SUB_COOLLECTIONSECOND_7500
     * @tc.name      : CollectionsSecondtest7500
     * @tc.desc      : Array keys 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsSecondtest7500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsSecondtest7500';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          collections.Array.from([-10, 20, -30, 40, -50]).forEach((value1, value2, Array) => {
            let a = Array.sort((a: number, b: number) => a - b).forEach((value1, value2, array) => {
              array.keys();
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
     * @tc.number    : SUB_COOLLECTIONSECOND_7600
     * @tc.name      : CollectionsSecondtest7600
     * @tc.desc      : Array values 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsSecondtest7600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsSecondtest7600';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array = new collections.Array<number>(1, 2, 3, 4, 5);
          const normal = new NormalClass(10);
          const unbound = array.values;
          const bound: () => void = unbound.bind(normal);
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
     * @tc.number    : SUB_COOLLECTIONSECOND_7700
     * @tc.name      : CollectionsSecondtest7700
     * @tc.desc      : Array values 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsSecondtest7700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsSecondtest7700';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          collections.Array.from([-10, 20, -30, 40, -50]).forEach((value1, value2, Array) => {
            let a = Array.sort((a: number, b: number) => a - b).forEach((value1, value2, array) => {
              array.values();
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
     * @tc.number    : SUB_COOLLECTIONSECOND_7800
     * @tc.name      : CollectionsSecondtest7800
     * @tc.desc      : Array find 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsSecondtest7800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsSecondtest7800';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array = new collections.Array<number>(1, 2, 3, 4, 5);
          const normal = new NormalClass(10);
          const unbound = array.find;
          const bound: () => void = unbound.bind(normal);
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
     * @tc.number    : SUB_COOLLECTIONSECOND_7900
     * @tc.name      : CollectionsSecondtest7900
     * @tc.desc      : Array find 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsSecondtest7900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsSecondtest7900';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          collections.Array.from([-10, 20, -30, 40, -50]).forEach((value1, value2, Array) => {
            let a = Array.sort((a: number, b: number) => a - b).forEach((value1, value2, array) => {
              array.find((value: number) => value % 2 === 0);
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
     * @tc.number    : SUB_COOLLECTIONSECOND_8000
     * @tc.name      : CollectionsSecondtest8000
     * @tc.desc      : Array includes 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsSecondtest8000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsSecondtest8000';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array = new collections.Array<number>(1, 2, 3, 4, 5);
          const normal = new NormalClass(10);
          const unbound = array.includes;
          const bound: () => void = unbound.bind(normal);
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
     * @tc.number    : SUB_COOLLECTIONSECOND_8100
     * @tc.name      : CollectionsSecondtest8100
     * @tc.desc      : Array includes 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsSecondtest8100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsSecondtest8100';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          collections.Array.from([-10, 20, -30, 40, -50]).forEach((value1, value2, Array) => {
            let a = Array.sort((a: number, b: number) => a - b).forEach((value1, value2, array) => {
              array.includes(20);
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
     * @tc.number    : SUB_COOLLECTIONSECOND_8200
     * @tc.name      : CollectionsSecondtest8200
     * @tc.desc      : Array findIndex 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsSecondtest8200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsSecondtest8200';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array = new collections.Array<number>(1, 2, 3, 4, 5);
          const normal = new NormalClass(10);
          const unbound = array.findIndex;
          const bound: () => void = unbound.bind(normal);
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
     * @tc.number    : SUB_COOLLECTIONSECOND_8300
     * @tc.name      : CollectionsSecondtest8300
     * @tc.desc      : Array findIndex 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsSecondtest8300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsSecondtest8300';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          collections.Array.from([-10, 20, -30, 40, -50]).forEach((value1, value2, Array) => {
            let a = Array.sort((a: number, b: number) => a - b).forEach((value1, value2, array) => {
              array.findIndex((value: number) => value % 2 === 0);
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
     * @tc.number    : SUB_COOLLECTIONSECOND_8400
     * @tc.name      : CollectionsSecondtest8400
     * @tc.desc      : Array fill 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsSecondtest8400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsSecondtest8400';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array = new collections.Array<number>(1, 2, 3, 4, 5);
          const normal = new NormalClass(10);
          const unbound = array.fill;
          const bound: () => void = unbound.bind(normal);
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
     * @tc.number    : SUB_COOLLECTIONSECOND_8500
     * @tc.name      : CollectionsSecondtest8500
     * @tc.desc      : Array fill 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsSecondtest8500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsSecondtest8500';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          collections.Array.from([-10, 20, -30, 40, -50]).forEach((value1, value2, Array) => {
            let a = Array.sort((a: number, b: number) => a - b).forEach((value1, value2, array) => {
              array.fill(0, 1, 3);
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
     * @tc.number    : SUB_COOLLECTIONSECOND_8600
     * @tc.name      : CollectionsSecondtest8600
     * @tc.desc      : Array shrinkTo 401
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsSecondtest8600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsSecondtest8600';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array = new collections.Array<number>(1, 2, 3, 4, 5);
          const normal = new NormalClass(10);
          const unbound = array.shrinkTo;
          const bound: () => void = unbound.bind(normal);
          bound()
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(401)
          flag = true
        }
        expect(flag).assertTrue()
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.number    : SUB_COOLLECTIONSECOND_8700
     * @tc.name      : CollectionsSecondtest8700
     * @tc.desc      : Array shrinkTo 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsSecondtest8700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsSecondtest8700';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          collections.Array.from([-10, 20, -30, 40, -50]).sort((a: number, b: number) => a - b).forEach((value1, value2, Array) => {
            let a = Array.sort((a: number, b: number) => a - b).forEach((value1, value2, array) => {
              array.shrinkTo(0);
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
     * @tc.number    : SUB_COOLLECTIONSECOND_8800
     * @tc.name      : CollectionsSecondtest8800
     * @tc.desc      : Array extendTo 401
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsSecondtest8800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsSecondtest8800';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array = new collections.Array<number>(1, 2, 3, 4, 5);
          const normal = new NormalClass(10);
          const unbound = array.extendTo;
          const bound: () => void = unbound.bind(normal);
          bound()
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(401)
          flag = true
        }
        expect(flag).assertTrue()
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.number    : SUB_COOLLECTIONSECOND_8900
     * @tc.name      : CollectionsSecondtest8900
     * @tc.desc      : Array extendTo 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsSecondtest8900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsSecondtest8900';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          collections.Array.from([-10, 20, -30, 40, -50]).sort((a: number, b: number) => a - b).forEach((value1, value2, Array) => {
            let a = Array.sort((a: number, b: number) => a - b).forEach((value1, value2, array) => {
              array.extendTo(1, 10);
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
     * @tc.number    : SUB_COOLLECTIONSECOND_9000
     * @tc.name      : CollectionsSecondtest9000
     * @tc.desc      : Array concat 401
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsSecondtest9000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsSecondtest9000';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array = new collections.Array<number>(1, 2, 3, 4, 5);
          const normal = new NormalClass(10);
          const unbound = array.concat;
          const bound: () => void = unbound.bind(normal);
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
     * @tc.number    : SUB_COOLLECTIONSECOND_9100
     * @tc.name      : CollectionsSecondtest9100
     * @tc.desc      : Array concat 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsSecondtest9100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsSecondtest9100';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          collections.Array.from([-10, 20, -30, 40, -50]).sort((a: number, b: number) => a - b).forEach((value1, value2, Array) => {
            let a = Array.sort((a: number, b: number) => a - b).forEach((value1, value2, array) => {
              array.extendTo(1, 10);
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
     * @tc.number    : SUB_COOLLECTIONSECOND_9200
     * @tc.name      : CollectionsSecondtest9200
     * @tc.desc      : Array splice 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsSecondtest9200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsSecondtest9200';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array = new collections.Array<number>(1, 2, 3, 4, 5);
          const normal = new NormalClass(10);
          const unbound = array.splice;
          const bound: () => void = unbound.bind(normal);
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
     * @tc.number    : SUB_COOLLECTIONSECOND_9300
     * @tc.name      : CollectionsSecondtest9300
     * @tc.desc      : Array splice 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsSecondtest9300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsSecondtest9300';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          collections.Array.from([-10, 20, -30, 40, -50]).sort((a: number, b: number) => a - b).forEach((value1, value2, Array) => {
            let a = Array.sort((a: number, b: number) => a - b).forEach((value1, value2, array) => {
              array.splice(10);
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
     * @tc.number    : SUB_COOLLECTIONSECOND_9400
     * @tc.name      : CollectionsSecondtest9400
     * @tc.desc      : Array every 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsSecondtest9400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsSecondtest9400';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array = new collections.Array<number>(1, 2, 3, 4, 5);
          const normal = new NormalClass(10);
          const unbound = array.every;
          const bound: () => void = unbound.bind(normal);
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
     * @tc.number    : SUB_COOLLECTIONSECOND_9500
     * @tc.name      : CollectionsSecondtest9500
     * @tc.desc      : Array every 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsSecondtest9500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsSecondtest9500';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          collections.Array.from([-10, 20, -30, 40, -50]).sort((a: number, b: number) => a - b).forEach((value1, value2, Array) => {
            let a = Array.sort((a: number, b: number) => a - b).forEach((value1, value2, array) => {
              array.every((element: number) => element > 0);
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
     * @tc.number    : SUB_COOLLECTIONSECOND_9600
     * @tc.name      : CollectionsSecondtest9600
     * @tc.desc      : Array toLocaleString 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsSecondtest9600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsSecondtest9600';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array = new collections.Array<number>(1, 2, 3, 4, 5);
          const normal = new NormalClass(10);
          const unbound = array.toLocaleString;
          const bound: () => void = unbound.bind(normal);
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
     * @tc.number    : SUB_COOLLECTIONSECOND_9700
     * @tc.name      : CollectionsSecondtest9700
     * @tc.desc      : Array toLocaleString 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsSecondtest9700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsSecondtest9700';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          collections.Array.from([-10, 20, -30, 40, -50]).sort((a: number, b: number) => a - b).forEach((value1, value2, Array) => {
            let a = Array.sort((a: number, b: number) => a - b).forEach((value1, value2, array) => {
              array.toLocaleString();
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
     * @tc.number    : SUB_COOLLECTIONSECOND_9800
     * @tc.name      : CollectionsSecondtest9800
     * @tc.desc      : Map 10200012
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsSecondtest9800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsSecondtest9800';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          const normal = new NormalClass(10);
          const unbound = collections.Map
          const bound: () => void = unbound.bind(normal);
          bound()
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200012)
          flag = true
        }
        expect(flag).assertTrue()
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.number    : SUB_COOLLECTIONSECOND_9900
     * @tc.name      : CollectionsSecondtest9900
     * @tc.desc      : myMap.keys 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsSecondtest9900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsSecondtest9900';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          const myMap: collections.Map<number, string> = new collections.Map<number, string>([
            [0, "one"],
            [1, "two"],
            [2, "three"],
            [3, "four"]
          ]);
          const normal = new NormalClass(10);
          const unbound = myMap.keys
          const bound: () => void = unbound.bind(normal);
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
     * @tc.number    : SUB_COOLLECTIONSECOND_0100
     * @tc.name      : CollectionsSecondtest0100
     * @tc.desc      : myMap.values 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsSecondtest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsSecondtest0100';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          const myMap: collections.Map<number, string> = new collections.Map<number, string>([
            [0, "one"],
            [1, "two"],
            [2, "three"],
            [3, "four"]
          ]);
          const normal = new NormalClass(10);
          const unbound = myMap.values
          const bound: () => void = unbound.bind(normal);
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
     * @tc.number    : SUB_COOLLECTIONSECOND_0200
     * @tc.name      : CollectionsSecondtest0200
     * @tc.desc      : myMap.get 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsSecondtest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsSecondtest0200';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          const myMap: collections.Map<number, string> = new collections.Map<number, string>([
            [0, "one"],
            [1, "two"],
            [2, "three"],
            [3, "four"]
          ]);
          const normal = new NormalClass(10);
          const unbound = myMap.get
          const bound: () => void = unbound.bind(normal);
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
     * @tc.number    : SUB_COOLLECTIONSECOND_0300
     * @tc.name      : CollectionsSecondtest0300
     * @tc.desc      :  map.get 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsSecondtest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsSecondtest0300';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          new collections.Map<string, number>([
            ['foo', 0],
            ['bar', 1],
            ['baz', 2],
          ]).forEach((value, key, map) => {
            map.set("foo", 3).get('1')
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
     * @tc.number    : SUB_COOLLECTIONSECOND_0400
     * @tc.name      : CollectionsSecondtest0400
     * @tc.desc      :  map.keys 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsSecondtest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsSecondtest0400';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          new collections.Map<string, number>([
            ['foo', 0],
            ['bar', 1],
            ['baz', 2],
          ]).forEach((value, key, map) => {
            map.set("foo", 3).keys()
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
     * @tc.number    : SUB_COOLLECTIONSECOND_0500
     * @tc.name      : CollectionsSecondtest0500
     * @tc.desc      :  map.keys 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsSecondtest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsSecondtest0500';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          new collections.Map<string, number>([
            ['foo', 0],
            ['bar', 1],
            ['baz', 2],
          ]).forEach((value, key, map) => {
            map.set("foo", 3).entries()
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
     * @tc.number    : SUB_COOLLECTIONSECOND_0600
     * @tc.name      : CollectionsSecondtest0600
     * @tc.desc      :  map.values 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsSecondtest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsSecondtest0600';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          new collections.Map<string, number>([
            ['foo', 0],
            ['bar', 1],
            ['baz', 2],
          ]).forEach((value, key, map) => {
            map.set("foo", 3).values()
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
     * @tc.number    : SUB_COOLLECTIONSECOND_0700
     * @tc.name      : CollectionsSecondtest0700
     * @tc.desc      : myMap.has 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsSecondtest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsSecondtest0700';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          const myMap: collections.Map<number, string> = new collections.Map<number, string>([
            [0, "one"],
            [1, "two"],
            [2, "three"],
            [3, "four"]
          ]);
          const normal = new NormalClass(10);
          const unbound = myMap.has
          const bound: () => void = unbound.bind(normal);
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
     * @tc.number    : SUB_COOLLECTIONSECOND_07001
     * @tc.name      : CollectionsSecondtest07001
     * @tc.desc      : myMap.has 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsSecondtest07001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsSecondtest07001';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          const myMap: collections.Map<number, string> = new collections.Map<number, string>([
            [0, "one"],
            [1, "two"],
            [2, "three"],
            [3, "four"]
          ]);
          const normal = new NormalClass(10);
          const unbound = myMap.entries
          const bound: () => void = unbound.bind(normal);
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
     * @tc.number    : SUB_COOLLECTIONSECOND_07002
     * @tc.name      : CollectionsSecondtest07002
     * @tc.desc      : myMap.has 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsSecondtest07002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsSecondtest07002';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          const myMap: collections.Map<number, string> = new collections.Map<number, string>([
            [0, "one"],
            [1, "two"],
            [2, "three"],
            [3, "four"]
          ]);
          const normal = new NormalClass(10);
          const unbound = myMap.clear
          const bound: () => void = unbound.bind(normal);
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
     * @tc.number    : SUB_COOLLECTIONSECOND_07003
     * @tc.name      : CollectionsSecondtest07003
     * @tc.desc      : myMap.has 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsSecondtest07003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsSecondtest07003';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          const myMap: collections.Map<number, string> = new collections.Map<number, string>([
            [0, "one"],
            [1, "two"],
            [2, "three"],
            [3, "four"]
          ]);
          const normal = new NormalClass(10);
          const unbound = myMap.delete
          const bound: () => void = unbound.bind(normal);
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
     * @tc.number    : SUB_COOLLECTIONSECOND_07004
     * @tc.name      : CollectionsSecondtest07004
     * @tc.desc      : myMap.has 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsSecondtest07004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsSecondtest07004';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          const myMap: collections.Map<number, string> = new collections.Map<number, string>([
            [0, "one"],
            [1, "two"],
            [2, "three"],
            [3, "four"]
          ]);
          const normal = new NormalClass(10);
          const unbound = myMap.forEach
          const bound: () => void = unbound.bind(normal);
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
     * @tc.number    : SUB_COOLLECTIONSECOND_0800
     * @tc.name      : CollectionsSecondtest0800
     * @tc.desc      :  map.has 10800201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsSecondtest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsSecondtest0800';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          new collections.Map<string, number>([
            ['foo', 0],
            ['bar', 1],
            ['baz', 2],
          ]).forEach((value, key, map) => {
            map.set("foo", 3).has('1')
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
     * @tc.number    : SUB_COOLLECTIONSECOND_0900
     * @tc.name      : CollectionsSecondtest0900
     * @tc.desc      : myMap.set 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsSecondtest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsSecondtest0900';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          const myMap: collections.Map<number, string> = new collections.Map<number, string>([
            [0, "one"],
            [1, "two"],
            [2, "three"],
            [3, "four"]
          ]);
          const normal = new NormalClass(10);
          const unbound = myMap.set
          const bound: () => void = unbound.bind(normal);
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
     * @tc.number    : SUB_COOLLECTIONSECOND_1000
     * @tc.name      : CollectionsSecondtest1000
     * @tc.desc      :  map.set 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsSecondtest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsSecondtest1000';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          new collections.Map<string, number>([
            ['foo', 0],
            ['bar', 1],
            ['baz', 2],
          ]).forEach((value, key, map) => {
            map.set("foo", 3).has('1')
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
     * @tc.number    : SUB_COOLLECTIONSECOND_1100
     * @tc.name      : CollectionsSecondtest1100
     * @tc.desc      :  map.set 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsSecondtest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsSecondtest1100';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          new collections.Map<string, number>([
            ['foo', 0],
            ['bar', 1],
            ['baz', 2],
          ]).forEach((value, key, map) => {
            map.set("foo", 3).has('1')
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
     * @tc.number    : SUB_COOLLECTIONSECOND_1200
     * @tc.name      : CollectionsSecondtest1200
     * @tc.desc      : Map 10200012
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsSecondtest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsSecondtest1200';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          const normal = new NormalClass(10);
          const unbound = collections.ArrayBuffer
          const bound: () => void = unbound.bind(normal);
          bound()
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200012)
          flag = true
        }
        expect(flag).assertTrue()
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.number    : SUB_COOLLECTIONSECOND_1300
     * @tc.name      : CollectionsSecondtest1300
     * @tc.desc      :  map.set 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionsSecondtest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsSecondtest1300';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          new collections.Map<string, number>([
            ['foo', 0],
            ['bar', 1],
            ['baz', 2],
          ]).forEach((value, key, map) => {
            map.set("foo", 3).has('1')
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

  })
}