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

export default function collectionstest() {
  describe('collectionstest', () => {
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
     * @tc.number    : SUB_COOLLECTION_CONCAtARRRY_0100
     * @tc.name      : CollectionstestConcatArray0100
     * @tc.desc      : ConcatArray join 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionstestConcatArray0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionstestConcatArray0100';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let concatArray: collections.ConcatArray<string> = new collections.Array<string>('a', 'b', 'c');
        const normal = new NormalClass(10);
        const unboundcreate = concatArray.join;
        const boundcreate: () => void = unboundcreate.bind(normal);
        try {
          boundcreate()
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
     * @tc.number    : SUB_COOLLECTION_CONCAtARRRY_0101
     * @tc.name      : CollectionstestConcatArray0101
     * @tc.desc      : ConcatArray slice 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionstestConcatArray0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionstestConcatArray0101';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let concatArray: collections.ConcatArray<string> = new collections.Array<string>('a', 'b', 'c');
        const normal = new NormalClass(10);
        const unboundcreate = concatArray.slice;
        const boundcreate: () => void = unboundcreate.bind(normal);
        try {
          boundcreate()
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
     * @tc.number    : SUB_COOLLECTION_ARRRY_0100
     * @tc.name      : CollectionstestArray0100
     * @tc.desc      : Array create 401
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionstestArray0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionstestArray0100';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        const normal = new NormalClass(10);
        const unboundcreate = collections.Array.create;
        const boundcreate: () => void = unboundcreate.bind(normal);
        try {
          boundcreate()
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
     * @tc.number    : SUB_COOLLECTION_ARRRY_01001
     * @tc.name      : CollectionstestArray01001
     * @tc.desc      : Array create 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionstestArray01001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionstestArray01001';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        const normal = new NormalClass(10);
        const unboundcreate = collections.Array.create;
        const boundcreate: () => void = unboundcreate.bind(normal, 3, 1);
        try {
          boundcreate()
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200011)
          // flag = true
        }
        // expect(flag).assertTrue()
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.number    : SUB_COOLLECTION_ARRAY_0200
     * @tc.name      : CollectionstestArray0200
     * @tc.desc      : Array 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionstestArray0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionstestArray0200';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          collections.Array.from([1, 2, 3, 4, 5, 6, 7, 8]).forEach((value, key, array) => {
            array.copyWithin(3, 1, 3);
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
     * @tc.number    : SUB_COOLLECTION_ARRAY_0300
     * @tc.name      : CollectionstestArray0300
     * @tc.desc      : Array forEach 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionstestArray0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionstestArray0300';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        const normal = new NormalClass(10);
        let array: collections.Array<number> = collections.Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        const unboundForEach = array.forEach;
        const boundForEach: () => void = unboundForEach.bind(normal);
        try {
          boundForEach()
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
     * @tc.number    : SUB_COOLLECTION_TEST_0100
     * @tc.name      : Collectionstest0100
     * @tc.desc      : Array from 401
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('Collectionstest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'Collectionstest0100';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array: Array<Array<string>> = [['str1', 'str2', 'str3'], ['str4', 'str5', 'str6'],
            ['str7', 'str8', 'str9']];
          let sendableArray = collections.Array.from<Array<string>>(array);
          console.info('array:', sendableArray)
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
     * @tc.number    : SUB_COOLLECTION_TEST_0200
     * @tc.name      : Collectionstest0200
     * @tc.desc      : Map 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('Collectionstest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'Collectionstest0200';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          new collections.Map<number, number>([
            [1, 0],
            [2, 1],
            [3, 2],
          ]).forEach((value, key, map) => {
            map.delete(key);
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
     * @tc.number    : SUB_COOLLECTION_TEST_0300
     * @tc.name      : Collectionstest0300
     * @tc.desc      : Map 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('Collectionstest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'Collectionstest0300';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          new collections.Map<number, number>([
            [1, 0],
            [2, 1],
            [3, 2],
          ]).forEach((value, key, map) => {
            map.clear();
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
     * @tc.number    : SUB_COOLLECTION_TEST_TEST_0400
     * @tc.name      : Collectionstest0400
     * @tc.desc      : Map 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('Collectionstest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'Collectionstest0400';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        const myMap = new collections.Map<number, string>([
          [1, 'one'],
          [2, 'two'],
          [3, 'three'],
        ]);
        const normal = new NormalClass(10);
        const unboundClear = myMap.clear;
        const boundClear: () => void = unboundClear.bind(normal);
        try {
          boundClear()
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
     * @tc.number    : SUB_COOLLECTION_MAP_TEST_0400
     * @tc.name      : CollectionstestMap0400
     * @tc.desc      : Map 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionstestMap0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionstestMap0400';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        const myMap = new collections.Map<number, string>([
          [1, 'one'],
          [2, 'two'],
          [3, 'three'],
        ]);
        const normal = new NormalClass(10);
        const unbounddelete = myMap.delete;
        const bounddelete: () => void = unbounddelete.bind(normal);
        try {
          bounddelete()
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
     * @tc.number    : SUB_COOLLECTION_CONCATARRAYMAP_TEST_0600
     * @tc.name      : CollectionstestMap0600
     * @tc.desc      : Map 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionstestMap0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionstestMap0600';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        const myMap = new collections.Map<number, string>([
          [1, 'one'],
          [2, 'two'],
          [3, 'three'],
        ]);
        const normal = new NormalClass(10);
        const unboundentries = myMap.entries;
        const boundentries: () => void = unboundentries.bind(normal);
        try {
          boundentries()
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
     * @tc.number    : SUB_COOLLECTION_CONCATARRAYMAP_TEST_0700
     * @tc.name      : CollectionstestMap0700
     * @tc.desc      : Map 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionstestMap0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionstestMap0700';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        const myMap = new collections.Map<number, string>([
          [1, 'one'],
          [2, 'two'],
          [3, 'three'],
        ]);
        const normal = new NormalClass(10);
        const unboundforEach = myMap.forEach;
        const boundforEach: () => void = unboundforEach.bind(normal);
        try {
          boundforEach()
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
     * @tc.number    : SUB_COOLLECTION_SET_TEST_0100
     * @tc.name      : CollectionstestSet0100
     * @tc.desc      : Set 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionstestSet0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionstestSet0100';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        const mySet = new collections.Set<number>([0, 1, 2, 3]);
        const normal = new NormalClass(10);
        const unboundentries = mySet.entries;
        const boundentries: () => void = unboundentries.bind(normal);
        try {
          boundentries()
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
     * @tc.number    : SUB_COOLLECTION_SET_TEST_0200
     * @tc.name      : CollectionstestSet0200
     * @tc.desc      : Set 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionstestSet0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionstestSet0200';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          new collections.Set<string>(['foo', 'bar', 'baz']).add('foo').forEach((value1, value2, set) => {
            set.add('foo').entries();
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
     * @tc.number    : SUB_COOLLECTION_SET_TEST_0300
     * @tc.name      : CollectionstestSet0300
     * @tc.desc      : Set 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionstestSet0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionstestSet0300';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          new collections.Set<string>(['foo', 'bar', 'baz']).add('foo').forEach((value1, value2, set) => {
            set.add('foo').keys();
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
     * @tc.number    : SUB_COOLLECTION_SET_TEST_0400
     * @tc.name      : CollectionstestSet0400
     * @tc.desc      : Set keys 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionstestSet0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionstestSet0400';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        const mySet = new collections.Set<number>([0, 1, 2, 3]);
        const normal = new NormalClass(10);
        const unboundkeys = mySet.keys;
        const boundkeys: () => void = unboundkeys.bind(normal);
        try {
          boundkeys()
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
     * @tc.number    : SUB_COOLLECTION_SET_TEST_0500
     * @tc.name      : CollectionstestSet0500
     * @tc.desc      : Set values 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionstestSet0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionstestSet0500';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          new collections.Set<string>(['foo', 'bar', 'baz']).add('foo').forEach((value1, value2, set) => {
            set.add('foo').values();
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
     * @tc.number    : SUB_COOLLECTION_SET_TEST_0600
     * @tc.name      : CollectionstestSet0600
     * @tc.desc      : Set values 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionstestSet0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionstestSet0600';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        const mySet = new collections.Set<number>([0, 1, 2, 3]);
        const normal = new NormalClass(10);
        const unboundvalues = mySet.values;
        const boundvalues: () => void = unboundvalues.bind(normal);
        try {
          boundvalues()
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
     * @tc.number    : SUB_COOLLECTION_SET_TEST_0700
     * @tc.name      : CollectionstestSet0700
     * @tc.desc      : Set delete 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionstestSet0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionstestSet0700';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        const mySet = new collections.Set<number>([0, 1, 2, 3]);
        const normal = new NormalClass(10);
        const unboundvalues = mySet.delete;
        const boundvalues: () => void = unboundvalues.bind(normal);
        try {
          boundvalues()
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
     * @tc.number    : SUB_COOLLECTION_0500
     * @tc.name      : Collectionstest0500
     * @tc.desc      : Set delete 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('Collectionstest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'Collectionstest0500';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          new collections.Set<string>(['foo', 'bar', 'baz']).forEach((value1, value2, set) => {
            set.delete(value1);
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
     * @tc.number    : SUB_COOLLECTION_0600
     * @tc.name      : Collectionstest0600
     * @tc.desc      : Set clear 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('Collectionstest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'Collectionstest0600';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          new collections.Set<string>(['foo', 'bar', 'baz']).forEach((value1, value2, set) => {
            set.clear();
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
     * @tc.number    : SUB_COOLLECTION_SET_TEST_0800
     * @tc.name      : CollectionstestSet0800
     * @tc.desc      : Set clear 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionstestSet0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionstestSet0800';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        const mySet = new collections.Set<number>([0, 1, 2, 3]);
        const normal = new NormalClass(10);
        const unboundvalues = mySet.clear;
        const boundvalues: () => void = unboundvalues.bind(normal);
        try {
          boundvalues()
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
     * @tc.number    : SUB_COOLLECTION_SET_TEST_0900
     * @tc.name      : CollectionstestSet0900
     * @tc.desc      : Set forEach 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionstestSet0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionstestSet0900';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        const mySet = new collections.Set<number>([0, 1, 2, 3]);
        const normal = new NormalClass(10);
        const unboundforEach = mySet.forEach;
        const boundforEach: () => void = unboundforEach.bind(normal);
        try {
          boundforEach()
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
     * @tc.number    : SUB_COOLLECTION_SET_1000
     * @tc.name      : Collectionstestset1000
     * @tc.desc      : Set has 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('Collectionstestset1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'Collectionstestset1000';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          new collections.Set<string>(['foo', 'bar', 'baz']).add('foo').forEach((value1, value2, set) => {
            set.add('').has('foo');
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
     * @tc.number    : SUB_COOLLECTION_SET_TEST_1100
     * @tc.name      : CollectionstestSet1100
     * @tc.desc      : Set has 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionstestSet1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionstestSet1100';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        const mySet = new collections.Set<number>([0, 1, 2, 3]);
        const normal = new NormalClass(10);
        const unboundhas = mySet.has;
        const boundhas: () => void = unboundhas.bind(normal);
        try {
          boundhas()
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
     * @tc.number    : SUB_COOLLECTION_SET_TEST_1200
     * @tc.name      : CollectionstestSet1200
     * @tc.desc      : Set add 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionstestSet1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionstestSet1200';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        const mySet = new collections.Set<number>([0, 1, 2, 3]);
        const normal = new NormalClass(10);
        const unboundadd = mySet.add;
        const boundadd: () => void = unboundadd.bind(normal, 6);
        try {
          boundadd()
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
     * @tc.number    : SUB_COOLLECTION_SET_TEST_12001
     * @tc.name      : CollectionstestSet12001
     * @tc.desc      : Set add 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionstestSet12001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionstestSet12001';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        const mySet = new collections.Set<number>([0, 1, 2, 3]);
        const normal = new NormalClass(10);
        const unboundadd = mySet.entries;
        const boundadd: () => void = unboundadd.bind(normal);
        try {
          boundadd()
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
     * @tc.number    : SUB_COOLLECTION_SET_TEST_12002
     * @tc.name      : CollectionstestSet12002
     * @tc.desc      : Set add 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionstestSet12002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionstestSet12002';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        const mySet = new collections.Set<number>([0, 1, 2, 3]);
        const normal = new NormalClass(10);
        const unboundadd = mySet.keys;
        const boundadd: () => void = unboundadd.bind(normal);
        try {
          boundadd()
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
     * @tc.number    : SUB_COOLLECTION_SET_TEST_12003
     * @tc.name      : CollectionstestSet12003
     * @tc.desc      : Set add 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionstestSet12003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionstestSet12003';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        const mySet = new collections.Set<number>([0, 1, 2, 3]);
        const normal = new NormalClass(10);
        const unboundadd = mySet.values;
        const boundadd: () => void = unboundadd.bind(normal);
        try {
          boundadd()
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
     * @tc.number    : SUB_COOLLECTION_SET_TEST_12004
     * @tc.name      : CollectionstestSet12004
     * @tc.desc      : Set add 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionstestSet12004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionstestSet12004';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        const mySet = new collections.Set<number>([0, 1, 2, 3]);
        const normal = new NormalClass(10);
        const unboundadd = mySet.clear;
        const boundadd: () => void = unboundadd.bind(normal);
        try {
          boundadd()
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
     * @tc.number    : SUB_COOLLECTION_SET_TEST_12005
     * @tc.name      : CollectionstestSet12005
     * @tc.desc      : Set add 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionstestSet12005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionstestSet12005';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        const mySet = new collections.Set<number>([0, 1, 2, 3]);
        const normal = new NormalClass(10);
        const unboundadd = mySet.delete;
        const boundadd: () => void = unboundadd.bind(normal, 3);
        try {
          boundadd()
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
     * @tc.number    : SUB_COOLLECTION_SET_TEST_12006
     * @tc.name      : CollectionstestSet12006
     * @tc.desc      : Set add 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionstestSet12006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionstestSet12006';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        const mySet = new collections.Set<number>([0, 1, 2, 3]);
        const normal = new NormalClass(10);
        const unboundadd = mySet.forEach;
        const boundadd: () => void = unboundadd.bind(normal);
        try {
          boundadd()
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
     * @tc.number    : SUB_COOLLECTION_SET_TEST_12007
     * @tc.name      : CollectionstestSet12007
     * @tc.desc      : Set add 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionstestSet12007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionstestSet12007';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        const mySet = new collections.Set<number>([0, 1, 2, 3]);
        const normal = new NormalClass(10);
        const unboundadd = mySet.has;
        const boundadd: () => void = unboundadd.bind(normal, 2);
        try {
          boundadd()
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
     * @tc.number    : SUB_COOLLECTION_SET_0100
     * @tc.name      : CollectionstestSet0601
     * @tc.desc      : Set 10200012
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('CollectionstestSet0601', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionstestSet0601';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          const normal = new NormalClass(10);
          const unboundset = collections.Set;
          const boundset: () => void = unboundset.bind(normal);
          boundset()
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
     * @tc.number    : SUB_COOLLECTION_0700
     * @tc.name      : Collectionstest0700
     * @tc.desc      : Array slice 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('Collectionstest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'Collectionstest0700';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let arrayBuffer: collections.ArrayBuffer = new collections.ArrayBuffer(10)
          const normal = new NormalClass(10);
          const unboundslice = arrayBuffer.slice;
          const boundslice: () => void = unboundslice.bind(normal, 1, 3);
          boundslice()
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
     * @tc.number    : SUB_COOLLECTION_07001
     * @tc.name      : Collectionstest07001
     * @tc.desc      : Array slice 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('Collectionstest07001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'Collectionstest07001';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let arrayBuffer: collections.ArrayBuffer = new collections.ArrayBuffer(10)
          const normal = new NormalClass(10);
          const unboundslice = arrayBuffer.slice;
          const boundslice: () => void = unboundslice.bind(normal, 2);
          boundslice()
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
     * @tc.number    : SUB_COOLLECTION_0800
     * @tc.name      : Collectionstest0800
     * @tc.desc      : Uint32Array 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('Collectionstest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'Collectionstest0800';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let arrayLike = [1, 2, 3];
          new collections.Uint32Array(arrayLike).fill(4, 1).fill(4).forEach((value1, value2, Uint32Array) => {
            let a = Uint32Array.fill(4, 1, 2);
            console.info('Uint32Array:', a)
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
     * @tc.number    : SUB_COOLLECTION_1000
     * @tc.name      : Collectionstest1000
     * @tc.desc      : Int8Array 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('Collectionstest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'Collectionstest1000';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let arrayLike = [1, 2, 3];
          new collections.Int8Array(arrayLike).fill(4, 1).fill(4).forEach((value1, value2, Int8Array) => {
            let a = Int8Array.fill(4, 1, 2);
            console.info('Int8Array:', a)
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
     * @tc.number    : SUB_COOLLECTION_1100
     * @tc.name      : Collectionstest1100
     * @tc.desc      : Uint8Array 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('Collectionstest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'Collectionstest1100';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let arrayLike = [1, 2, 3];
          new collections.Uint8Array(arrayLike).fill(4, 1).fill(4).forEach((value1, value2, Uint8Array) => {
            let a = Uint8Array.fill(4, 1, 2);
            console.info('Uint8Array:', a)
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
     * @tc.number    : SUB_COOLLECTION_1200
     * @tc.name      : Collectionstest1200
     * @tc.desc      : Uint8ClampedArray fill 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('Collectionstest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'Collectionstest1200';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let arrayLike = [1, 2, 3];
          new collections.Uint8ClampedArray(arrayLike).fill(4, 1)
            .fill(4)
            .forEach((value1, value2, Uint8ClampedArray) => {
              let a = Uint8ClampedArray.fill(4, 1, 2);
              console.info('Uint8ClampedArray:', a)
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
     * @tc.number    : SUB_COOLLECTION_1300
     * @tc.name      : Collectionstest1300
     * @tc.desc      : Int16Array 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('Collectionstest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'Collectionstest1300';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let arrayLike = [1, 2, 3];
          new collections.Int16Array(arrayLike).fill(4, 1).fill(4).forEach((value1, value2, Int16Array) => {
            let a = Int16Array.fill(4, 1, 2);
            console.info('Int16Array:', a)
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
     * @tc.number    : SUB_COOLLECTION_1500
     * @tc.name      : Collectionstest1500
     * @tc.desc      : Int32Array 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('Collectionstest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'Collectionstest1500';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let arrayLike = [1, 2, 3];
          new collections.Int32Array(arrayLike).fill(4, 1).fill(4).forEach((value1, value2, Int32Array) => {
            let a = Int32Array.fill(4, 1, 2);
            console.info('Int32Array:', a)
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
     * @tc.number    : SUB_COOLLECTION_1600
     * @tc.name      : Collectionstest1600
     * @tc.desc      : Float32Array 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('Collectionstest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'Collectionstest1600';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let arrayLike = [1, 2, 3];
          new collections.Float32Array(arrayLike).fill(4, 1).fill(4).forEach((value1, value2, Float32Array) => {
            let a = Float32Array.fill(4, 1, 2);
            console.info('Float32Array:', a)
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
     * @tc.number    : SUB_COOLLECTION_1700
     * @tc.name      : Collectionstest1700
     * @tc.desc      : Uint32Array toString 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('Collectionstest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'Collectionstest1700';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let array = new collections.Uint32Array([1, 2, 3, 4, 5]);
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
     * @tc.number    : SUB_COOLLECTION_1900
     * @tc.name      : Collectionstest1900
     * @tc.desc      : Int8Array 10200012
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('Collectionstest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'Collectionstest1900';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          const normal = new NormalClass(10);
          const unbound = collections.Int8Array;
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
     * @tc.number    : SUB_COOLLECTION_2000
     * @tc.name      : Collectionstest2000
     * @tc.desc      : Uint8Array 10200012
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('Collectionstest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'Collectionstest2000';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          const normal = new NormalClass(10);
          const unbound = collections.Uint8Array;
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
     * @tc.number    : SUB_COOLLECTION_2100
     * @tc.name      : Collectionstest2100
     * @tc.desc      : Uint8Array 10200012
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('Collectionstest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'Collectionstest2100';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          const normal = new NormalClass(10);
          const unbound = collections.Uint8Array;
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
     * @tc.number    : SUB_COOLLECTION_2200
     * @tc.name      : Collectionstest2200
     * @tc.desc      : Int16Array 10200012
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('Collectionstest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'Collectionstest2200';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          const normal = new NormalClass(10);
          const unbound = collections.Int16Array;
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
     * @tc.number    : SUB_COOLLECTION_2300
     * @tc.name      : Collectionstest2300
     * @tc.desc      : Int16Array 10200012
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('Collectionstest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'Collectionstest2300';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          const normal = new NormalClass(10);
          const unbound = collections.Int16Array;
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
     * @tc.number    : SUB_COOLLECTION_2400
     * @tc.name      : Collectionstest2400
     * @tc.desc      : Uint16Array 10200012
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('Collectionstest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'Collectionstest2400';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          const normal = new NormalClass(10);
          const unbound = collections.Uint16Array;
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
     * @tc.number    : SUB_COOLLECTION_2500
     * @tc.name      : Collectionstest2500
     * @tc.desc      : Int32Array 10200012
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('Collectionstest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'Collectionstest2500';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          const normal = new NormalClass(10);
          const unbound = collections.Int32Array;
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
     * @tc.number    : SUB_COOLLECTION_2600
     * @tc.name      : Collectionstest2600
     * @tc.desc      : Uint32Array 10200012
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('Collectionstest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'Collectionstest2600';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          const normal = new NormalClass(10);
          const unbound = collections.Uint32Array;
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
     * @tc.number    : SUB_COOLLECTION_2700
     * @tc.name      : Collectionstest2700
     * @tc.desc      : Uint8ClampedArray 10200012
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('Collectionstest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'Collectionstest2700';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          const normal = new NormalClass(10);
          const unbound = collections.Uint8ClampedArray;
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
     * @tc.number    : SUB_COOLLECTION_2800
     * @tc.name      : Collectionstest2800
     * @tc.desc      : Float32Array 10200012
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('Collectionstest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'Collectionstest2800';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          const normal = new NormalClass(10);
          const unbound = collections.Float32Array;
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
     * @tc.number    : SUB_COOLLECTION_2900
     * @tc.name      : Collectionstest2900
     * @tc.desc      : Array 10200012
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('Collectionstest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'Collectionstest2900';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          const normal = new NormalClass(10);
          const unbound = collections.Array;
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
     * @tc.number    : SUB_COOLLECTION_3000
     * @tc.name      : Collectionstest3000
     * @tc.desc      : Array 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('Collectionstest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'Collectionstest3000';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          const normal = new NormalClass(10);
          const unbound = collections.Array;
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
     * @tc.number    : SUB_COOLLECTION_3100
     * @tc.name      : Collectionstest3100
     * @tc.desc      : Array 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('Collectionstest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'Collectionstest3100';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array: collections.Array<number> = collections.Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
          const normal = new NormalClass(10);
          const unbound = array.copyWithin;
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
     * @tc.number    : SUB_COOLLECTION_3200
     * @tc.name      : Collectionstest3200
     * @tc.desc      : Array 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('Collectionstest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'Collectionstest3200';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array: collections.Array<number> = collections.Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
          const normal = new NormalClass(10);
          const unbound = array.some;
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
     * @tc.number    : SUB_COOLLECTION_3300
     * @tc.name      : Collectionstest3300
     * @tc.desc      : Array 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('Collectionstest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'Collectionstest3300';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          collections.Array.from([-10, 20, -30, 40, -50]).forEach((value1, value2, Array) => {
            let a = Array.copyWithin(3, 1, 3).some((element: number) => element < 0);
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
     * @tc.number    : SUB_COOLLECTION_3400
     * @tc.name      : Collectionstest3400
     * @tc.desc      : Array 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('Collectionstest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'Collectionstest3400';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          collections.Array.from([-10, 20, -30, 40, -50]).forEach((value1, value2, Array) => {
            let a = Array.copyWithin(3, 1, 3).copyWithin(1, 2, 1);
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
     * @tc.number    : SUB_COOLLECTION_3500
     * @tc.name      : Collectionstest3500
     * @tc.desc      : Array 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('Collectionstest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'Collectionstest3500';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          collections.Array.from([-10, 20, -30, 40, -50]).forEach((value1, value2, Array) => {
            let a = Array.copyWithin(3, 1, 3).lastIndexOf(3);
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
     * @tc.number    : SUB_COOLLECTION_3600
     * @tc.name      : Collectionstest3600
     * @tc.desc      : Array 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('Collectionstest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'Collectionstest3600';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          collections.Array.from([-10, 20, -30, 40, -50]).forEach((value1, value2, Array) => {
            let a = Array.copyWithin(3, 1, 3).forEach((value1, value2, array) => {
              let a = array.copyWithin(3, 1, 3).lastIndexOf(3);
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
     * @tc.number    : SUB_COOLLECTION_3700
     * @tc.name      : Collectionstest3700
     * @tc.desc      : Array 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('Collectionstest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'Collectionstest3700';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array: collections.Array<number> = collections.Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
          const normal = new NormalClass(10);
          const unbound = array.lastIndexOf;
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
     * @tc.number    : SUB_COOLLECTION_37001
     * @tc.name      : Collectionstest37001
     * @tc.desc      : Array 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('Collectionstest37001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'Collectionstest37001';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array: collections.Array<number> = collections.Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
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
     * @tc.number    : SUB_COOLLECTION_37002
     * @tc.name      : Collectionstest37002
     * @tc.desc      : Array 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('Collectionstest37002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'Collectionstest37002';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array: collections.Array<number> = collections.Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
          const normal = new NormalClass(10);
          const unbound = array.map;
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
     * @tc.number    : SUB_COOLLECTION_37003
     * @tc.name      : Collectionstest37003
     * @tc.desc      : Array 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('Collectionstest37003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'Collectionstest37003';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array: collections.Array<number> = collections.Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
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
     * @tc.number    : SUB_COOLLECTION_37004
     * @tc.name      : Collectionstest37004
     * @tc.desc      : Array 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('Collectionstest37004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'Collectionstest37004';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array: collections.Array<number> = collections.Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
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
     * @tc.number    : SUB_COOLLECTION_37005
     * @tc.name      : Collectionstest37005
     * @tc.desc      : Array 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('Collectionstest37005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'Collectionstest37005';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array: collections.Array<number> = collections.Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
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
     * @tc.number    : SUB_COOLLECTION_37006
     * @tc.name      : Collectionstest37006
     * @tc.desc      : Array 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('Collectionstest37006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'Collectionstest37006';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array: collections.Array<number> = collections.Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
          const normal = new NormalClass(10);
          const unbound = array.splice;
          const bound: () => void = unbound.bind(normal, 3);
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
     * @tc.number    : SUB_COOLLECTION_37007
     * @tc.name      : Collectionstest37007
     * @tc.desc      : Array 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('Collectionstest37007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'Collectionstest37007';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array: collections.Array<number> = collections.Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
          const normal = new NormalClass(10);
          const unbound = array.extendTo;
          const bound: () => void = unbound.bind(normal, 12, 1);
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
     * @tc.number    : SUB_COOLLECTION_37008
     * @tc.name      : Collectionstest37008
     * @tc.desc      : Array 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('Collectionstest37008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'Collectionstest37008';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array: collections.Array<number> = collections.Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
          const normal = new NormalClass(10);
          const unbound = array.splice;
          const bound: () => void = unbound.bind(normal, 2, 3, 3);
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
     * @tc.number    : SUB_COOLLECTION_37009
     * @tc.name      : Collectionstest37009
     * @tc.desc      : Array 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('Collectionstest37009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'Collectionstest37009';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array: collections.Array<number> = collections.Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
          const normal = new NormalClass(10);
          const unbound = array.lastIndexOf;
          const bound: () => void = unbound.bind(normal, 2);
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
     * @tc.number    : SUB_COOLLECTION_37010
     * @tc.name      : Collectionstest37010
     * @tc.desc      : Array 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('Collectionstest37010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'Collectionstest37010';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array: collections.Array<number> = collections.Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
          const normal = new NormalClass(10);
          const unbound = array.lastIndexOf;
          const bound: () => void = unbound.bind(normal, 2, 2);
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
     * @tc.number    : SUB_COOLLECTION_3800
     * @tc.name      : Collectionstest3800
     * @tc.desc      : Array 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('Collectionstest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'Collectionstest3800';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          collections.Array.from([-10, 20, -30, 40, -50]).forEach((value1, value2, Array) => {
            let a = Array.copyWithin(3, 1, 3).forEach((value1, value2, array) => {
              let a = array.copyWithin(3, 1, 3).reduceRight((accumulator, value) => accumulator + value);
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
     * @tc.number    : SUB_COOLLECTION_3900
     * @tc.name      : Collectionstest3900
     * @tc.desc      : Array 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('Collectionstest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'Collectionstest3900';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array = new collections.Array<number>(1, 2, 3, 4, 5);
          const normal = new NormalClass(10);
          const unbound = array.reduceRight;
          const bound: () => void = unbound.bind(normal, () => {
          });
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
     * @tc.number    : SUB_COOLLECTION_39001
     * @tc.name      : Collectionstest39001
     * @tc.desc      : Array 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('Collectionstest39001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'Collectionstest39001';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array = new collections.Array<number>(1, 2, 3, 4, 5);
          const normal = new NormalClass(10);
          const unbound = array.reduceRight;
          const bound: () => void = unbound.bind(normal, () => {
          }, 1);
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
     * @tc.number    : SUB_COOLLECTION_4000
     * @tc.name      : Collectionstest4000
     * @tc.desc      : Array 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('Collectionstest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'Collectionstest4000';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          collections.Array.from([-10, 20, -30, 40, -50]).forEach((value1, value2, Array) => {
            let a = Array.copyWithin(3, 1, 3).forEach((value1, value2, array) => {
              let a = array.copyWithin(3, 1, 3).reduceRight((accumulator, value) => accumulator + value);
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
     * @tc.number    : SUB_COOLLECTION_4100
     * @tc.name      : Collectionstest4100
     * @tc.desc      : Array 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('Collectionstest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'Collectionstest4100';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array = new collections.Array<number>(1, 2, 3, 4, 5);
          const normal = new NormalClass(10);
          const unbound = array.push;
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
     * @tc.number    : SUB_COOLLECTION_4200
     * @tc.name      : Collectionstest4200
     * @tc.desc      : Array 10200201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('Collectionstest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'Collectionstest4200';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          collections.Array.from([-10, 20, -30, 40, -50]).forEach((value1, value2, Array) => {
            let a = Array.copyWithin(3, 1, 3).forEach((value1, value2, array) => {
              let a = array.copyWithin(3, 1, 3).push(4, 5);
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
     * @tc.number    : SUB_COOLLECTION_4300
     * @tc.name      : Collectionstest4300
     * @tc.desc      : Array 10200011
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('Collectionstest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'Collectionstest4300';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array = new collections.Array<number>(1, 2, 3, 4, 5);
          const normal = new NormalClass(10);
          const unbound = array.pop;
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
     * @tc.number    : Collectionstest4400
     * @tc.name      : Collectionstest4400
     * @tc.desc      : Array 10200001
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('Collectionstest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'Collectionstest4400';
        console.info(`${caseName} test start`);
        let concatArray: collections.ConcatArray<string> = new collections.Array<string>('a', 'b', 'c');
        try {
          let res = concatArray[2871622679]
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200001)
        }
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.number    : Collectionstest4500
     * @tc.name      : Collectionstest4500
     * @tc.desc      : Array 10200001
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('Collectionstest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'Collectionstest4500';
        console.info(`${caseName} test start`);
        let array: collections.Array<string> = new collections.Array<string>('a', 'b', 'c');
        try {
          let res = array[2871622679]
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200001)
        }
        console.info(`${caseName} test end`);
        done()
      })
  })
}