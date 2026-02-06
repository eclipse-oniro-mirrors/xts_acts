/*
 * Copyright (c) 2024 SwanLink (Jiangsu) Technology Development Co., LTD.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { collections } from '@kit.ArkTS';

export default function MapTest() {
  describe('MapTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_MAP_0100
     * @tc.name       : testCollectionsMap0001
     * @tc.desc       : Testing Collections of Map, create 1:1~10:10, use for of.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsMap0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsMap0001";
      try {
          const testMap = new collections.Map<number, number>(
            [[1, 1],
            [2, 2],
            [3, 3],
            [4, 4],
            [5, 5],
            [6, 6],
            [7, 7],
            [8, 8],
            [9, 9],
            [10, 10]
            ]);
          console.info("testMap is: ", testMap);
          let tempNum: number = 0;
          for (let entry of testMap.entries()) {
              tempNum = tempNum + 1;
              console.log('testMap entry is:' + entry);
              expect(entry[0]).assertEqual(tempNum);
              expect(entry[1]).assertEqual(tempNum);
          }
      } catch (err) {
       console.error(`${TAG} failed, error: ${err}`);
       expect().assertFail();
      }
      done()
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_MAP_0200
     * @tc.name       : testCollectionsMap0002
     * @tc.desc       : Testing Collections of Map, create <number, number>, use for of.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsMap0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsMap0002";
      try {
          const testMap = new collections.Map<number, number>();
          testMap.set(0, 1);
          testMap.set(1, 2);
          console.info("testMap is: ", testMap);
          let tempNum: number = 0;
          for (let entry of testMap.entries()) {
              tempNum = tempNum + 1;
              console.log('testMap entry is:' + entry);
             expect(entry[0]).assertEqual(tempNum-1);
              expect(entry[1]).assertEqual(tempNum);
        }
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_MAP_0300
     * @tc.name       : testCollectionsMap0003
     * @tc.desc       : Testing Collections of Map, create <number, userdefined>, use for of.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsMap0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsMap0003";
      try {
          @Sendable
          class User {
            name: string = 'a';
            age:number = 12;
          };
          const userMap = new collections.Map<number, User>();
          const user1 = new User();
          userMap.set(1, user1);
          console.info("userMap is: ", userMap);
          let tempNum: number = 0;
          for (let entry of userMap.entries()) {
              tempNum = tempNum + 1;
              console.log('testMap entry is:' + entry);
          }
        expect(tempNum).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_MAP_0400
     * @tc.name       : testCollectionsMap0004
     * @tc.desc       : Testing Collections of Map, create <number, string>, entries use for of.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsMap0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsMap0004";
      try {
          const testMap = new collections.Map<number, string>();
          let tempNum: number = 0;
          for (let entry of testMap.entries()) {
              tempNum = tempNum + 1;
          }
          expect(tempNum).assertEqual(0);
      } catch (err) {
          console.error(`${TAG} failed, error: ${err}`);
          expect().assertFail();
      }
      done()
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_MAP_0500
     * @tc.name       : testCollectionsMap0005
     * @tc.desc       : Testing Collections of Map, create <number, string>, set, entries use for of.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsMap0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsMap0005";
      try {
        const testMap = new collections.Map<number, string>();
        testMap.set(0, '0');
        testMap.set(1, '1');
        let tempNum: number = 0;
        for (let entry of testMap.entries()) {
          tempNum = tempNum + 1;
        }
        expect(tempNum).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_MAP_0600
     * @tc.name       : testCollectionsMap0006
     * @tc.desc       : Testing Collections of Map, create <number, string>, delete key, entries use for of.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsMap0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsMap0006";
      try {
        const testMap = new collections.Map<number, string>();
        testMap.set(0, '0');
        testMap.set(1, '1');
        testMap.delete(0);
        let tempNum: number = 0;
        for (let entry of testMap.entries()) {
            console.info("entry[1] is:" + entry[1]);
            expect(entry[1]).assertEqual('1');
            tempNum = tempNum + 1;
        }
        console.info("testMap is:" + testMap);
        expect(tempNum).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_MAP_0700
     * @tc.name       : testCollectionsMap0007
     * @tc.desc       : Testing Collections of Map, create <number, string>, clear map, entries use for of.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsMap0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsMap0007";
      try {
        const testMap = new collections.Map<number, string>();
        testMap.set(0, '0');
        testMap.set(1, '1');
        testMap.clear();
        let tempNum: number = 0;
        for (let entry of testMap.entries()) {
          console.info("entry[1] is:" + entry[1]);
          expect().assertFail();
          tempNum = tempNum + 1;
        }
        console.info("testMap is:" + testMap);
        expect(tempNum).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_MAP_0800
     * @tc.name       : testCollectionsMap0008
     * @tc.desc       : Testing Collections of Map, create <number, string>, set map[], keys use for of.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsMap0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsMap0008";
      try {
          const testMap = new collections.Map<number, string>();
          const iterator = testMap.keys();
          expect(iterator.next().done).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_MAP_0900
     * @tc.name       : testCollectionsMap0009
     * @tc.desc       : Testing Collections of Map, create <number, string>, set map, keys use for of.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsMap0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsMap0009";
      try {
          const testMap = new collections.Map<number, string>();
          testMap.set(0, '0');
          testMap.set(1, '1');
          const iterator = testMap.keys();
          expect(iterator.next().value).assertEqual(0);
          expect(iterator.next().value).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_MAP_1000
     * @tc.name       : testCollectionsMap0010
     * @tc.desc       : Testing Collections of Map, create <number, string>, set map[], values use for of.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsMap0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsMap0010";
      try {
          const testMap = new collections.Map<number, string>();
          const iterator = testMap.values();
          expect(iterator.next().done).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_MAP_1100
     * @tc.name       : testCollectionsMap0011
     * @tc.desc       : Testing Collections of Map, create <number, string>, set map, values use for of.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsMap0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsMap0011";
      try {
          const testMap = new collections.Map<number, string>();
          testMap.set(0, '0');
          testMap.set(1, '1');
          const iterator = testMap.values();
          expect(iterator.next().value).assertEqual('0');
          expect(iterator.next().value).assertEqual('1');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_MAP_1200
     * @tc.name       : testCollectionsMap0012
     * @tc.desc       : Testing Collections of Map, create <number, string>, set map, values use for of.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsMap0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsMap0012";
      try {
        const testMap = new collections.Map<number, string>()
        testMap.set(0, '0');
        const iterator = testMap.values();
        expect(iterator.next().value).assertEqual('0');
        testMap.set(1, 'test');
        const iterator1 = testMap.values();
        expect(iterator1.next().value).assertEqual('0');
        expect(iterator1.next().value).assertEqual('test');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_MAP_1300
     * @tc.name       : testCollectionsMap0013
     * @tc.desc       : Testing Collections of Map, create <number, string>, set->delete map, values use for of.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsMap0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsMap0013";
      try {
        const testMap = new collections.Map<number, string>()
        testMap.set(0, '0');
        const iterator = testMap.values();
        expect(iterator.next().value).assertEqual('0');
        testMap.set(1, 'test');
        testMap.delete(1);
        const iterator1 = testMap.values();
        expect(iterator1.next().value).assertEqual('0');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_MAP_1400
     * @tc.name       : testCollectionsMap0014
     * @tc.desc       : Testing Collections of Map, create <number, string>, set->clear map, values use for of.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsMap0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsMap0014";
      try {
        const testMap = new collections.Map<number, string>()
        testMap.set(0, '0');
        const iterator = testMap.values();
        expect(iterator.next().value).assertEqual('0');
        testMap.set(1, 'test');
        testMap.clear();
        const iterator1 = testMap.values();
        expect(iterator1.next().done).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_MAP_1500
     * @tc.name       : testCollectionsMap0015
     * @tc.desc       : Testing Collections of Map, create <number, string> [], clear map, get undefined,has false.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsMap0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsMap0015";
      try {
        const testMap = new collections.Map<number, string>()
        testMap.clear();
        expect(testMap.size).assertEqual(0);
        expect(testMap.get(1)).assertEqual(undefined);
        expect(testMap.has(1)).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_MAP_1600
     * @tc.name       : testCollectionsMap0016
     * @tc.desc       : Testing Collections of Map, create <number, string> [1,'0'],[2,'1'],
     * clear map, get undefined,has false.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsMap0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsMap0016";
      try {
        const testMap = new collections.Map<number, string>()
        testMap.set(1,'0');
        testMap.set(2,'1');
        testMap.clear();
        expect(testMap.size).assertEqual(0);
        expect(testMap.get(1)).assertEqual(undefined);
        expect(testMap.has(2)).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_MAP_1700
     * @tc.name       : testCollectionsMap0017
     * @tc.desc       : Testing Collections of Map, create <number, string> [1,'0'],[2,'1'],
     * clear map, get undefined,has false.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsMap0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsMap0017";
      try {
        const testMap = new collections.Map<number, string>()
        testMap.set(1,'0');
        testMap.set(2,'1');
        testMap.clear();
        testMap.set(3,'4');
        expect(testMap.size).assertEqual(1);
        expect(testMap.get(3)).assertEqual('4');
        expect(testMap.has(3)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_MAP_1800
     * @tc.name       : testCollectionsMap0018
     * @tc.desc       : Testing Collections of Map, create <string, string> [],delete ''.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsMap0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsMap0018";
      try {
        const testMap = new collections.Map<string, string>()
        expect(testMap.delete("")).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_MAP_1900
     * @tc.name       : testCollectionsMap0019
     * @tc.desc       : Testing Collections of Map, create <string, string> ['0','1'],delete ''.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsMap0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsMap0019";
      try {
        const testMap = new collections.Map<string, string>();
        testMap.set('0','1');
        expect(testMap.delete("")).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_MAP_2000
     * @tc.name       : testCollectionsMap0020
     * @tc.desc       : Testing Collections of Map, create <null, string> [],delete null.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsMap0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsMap0020";
      try {
        const testMap = new collections.Map<null, string>();
        expect(testMap.delete(null)).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_MAP_2100
     * @tc.name       : testCollectionsMap0021
     * @tc.desc       : Testing Collections of Map, create <null, string> [null, '0'],delete null.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsMap0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsMap0021";
      try {
        const testMap = new collections.Map<null, string>();
        testMap.set(null,'0');
        expect(testMap.delete(null)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_MAP_2200
     * @tc.name       : testCollectionsMap0022
     * @tc.desc       : Testing Collections of Map, create <undefined, string> [],delete undefined.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsMap0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsMap0022";
      try {
        const testMap = new collections.Map<undefined, string>();
        expect(testMap.delete(undefined)).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_MAP_2300
     * @tc.name       : testCollectionsMap0023
     * @tc.desc       : Testing Collections of Map, create <undefined, string> [],delete undefined.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsMap0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsMap0023";
      try {
        const testMap = new collections.Map<undefined, string>();
        testMap.set(undefined,'0');
        expect(testMap.delete(undefined)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_MAP_2400
     * @tc.name       : testCollectionsMap0024
     * @tc.desc       : Testing Collections of Map, create <number, string> [],delete 1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsMap0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsMap0024";
      try {
        const testMap = new collections.Map<number, string>();
        expect(testMap.delete(1)).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_MAP_2500
     * @tc.name       : testCollectionsMap0025
     * @tc.desc       : Testing Collections of Map, create <number, string> [1,'a'],delete 1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsMap0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsMap0025";
      try {
        const testMap = new collections.Map<number, string>();
        testMap.set(1,'a');
        expect(testMap.delete(1)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_MAP_2600
     * @tc.name       : testCollectionsMap0026
     * @tc.desc       : Testing Collections of Map, create <number, string> [1,'a'],delete 2.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsMap0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsMap0026";
      try {
        const testMap = new collections.Map<number, string>();
        testMap.set(1,'a');
        expect(testMap.delete(2)).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_MAP_2700
     * @tc.name       : testCollectionsMap0027
     * @tc.desc       : Testing Collections of Map, create <number, string> [1,'a'],delete -> set -> clear.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsMap0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsMap0027";
      try {
        const testMap = new collections.Map<number, string>();
        testMap.set(1,'a');
        expect(testMap.delete(1)).assertEqual(true);
        testMap.set(2,'b');
        console.info("testMap is: ", testMap);
        expect(testMap.delete(1)).assertEqual(false);
        expect(testMap.delete(2)).assertEqual(true);
        testMap.clear();
        expect(testMap.delete(2)).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_MAP_2800
     * @tc.name       : testCollectionsMap0028
     * @tc.desc       : Testing Collections of Map, create <number, string> [], forEach.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsMap0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsMap0028";
      try {
        let tempNum: number = 0;
        new collections.Map<number, string>([]).forEach((value, key, map) => {
          console.info(`m[${key}] = ${value}`);
          tempNum = tempNum + 1;
        });
        expect(tempNum).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_MAP_2900
     * @tc.name       : testCollectionsMap0029
     * @tc.desc       : Testing Collections of Map, create <number, string> [], forEach.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsMap0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsMap0029";
      try {
        let tempNum: number = 0;
        new collections.Map<number, string>([
          [0, 'foo'],
          [1, 'bar'],
        ]).forEach((value, key, map) => {
          console.info(`m[${key}] = ${value}`);
          if (key == 0) {
            expect(value).assertEqual('foo');
          }
          if (key == 1) {
            expect(value).assertEqual('bar');
          }
          tempNum = tempNum + 1;
        });
        expect(tempNum).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_MAP_3000
     * @tc.name       : testCollectionsMap0030
     * @tc.desc       : Testing Collections of Map, create <number, string> [[0,'foo'],[1,'bar']], forEach delete.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsMap0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsMap0030";
      try {
        let tempNum: number = 0;
        new collections.Map<number, string>([
          [0, 'foo'],
          [1, 'bar'],
        ]).forEach((value, key, map) => {
          console.info(`m[${key}] = ${value}`);
          map.delete(key);
          tempNum = tempNum + 1;
        });
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`).assertEqual('Concurrent modification exception');
      }
      done()
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_MAP_3100
     * @tc.name       : testCollectionsMap0031
     * @tc.desc       : Testing Collections of Map, create <number, string> [[0,'foo'],[1,'bar']], forEach clear().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsMap0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsMap0031";
      try {
        let tempNum: number = 0;
        new collections.Map<number, string>([
          [0, 'foo'],
          [1, 'bar'],
        ]).forEach((value, key, map) => {
          console.info(`m[${key}] = ${value}`);
          map.clear();
          tempNum = tempNum + 1;
        });
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`).assertEqual('Concurrent modification exception');
      }
      done()
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_MAP_3200
     * @tc.name       : testCollectionsMap0032
     * @tc.desc       : Testing Collections of Map, create <string, string> [], map.get().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsMap0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsMap0032";
      try {
        const testMap = new collections.Map<string, string>();
        expect(testMap.get("")).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_MAP_3300
     * @tc.name       : testCollectionsMap0033
     * @tc.desc       : Testing Collections of Map, create <number, string> [0,'a'], map.get().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsMap0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsMap0033";
      try {
        const testMap = new collections.Map<string, string>();
        testMap.set('0','a');
        console.info("testMap is: ", testMap);
        expect(testMap.get("")).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_MAP_3400
     * @tc.name       : testCollectionsMap0034
     * @tc.desc       : Testing Collections of Map, create <number, string> [], map.get(null).
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsMap0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsMap0034";
      try {
        const testMap = new collections.Map<null, string>();
        expect(testMap.get(null)).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_MAP_3500
     * @tc.name       : testCollectionsMap0035
     * @tc.desc       : Testing Collections of Map, create <null, string> [null,'a'], map.get(null).
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsMap0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsMap0035";
      try {
        const testMap = new collections.Map<null, string>();
        testMap.set(null,'a');
        console.info("testMap is: ", testMap);
        expect(testMap.get(null)).assertEqual('a');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_MAP_3600
     * @tc.name       : testCollectionsMap0036
     * @tc.desc       : Testing Collections of Map, create <undefined, string> [], map.get(undefined).
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsMap0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsMap0036";
      try {
        const testMap = new collections.Map<undefined, string>();
        console.info("testMap is: ", testMap);
        expect(testMap.get(undefined)).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_MAP_3700
     * @tc.name       : testCollectionsMap0037
     * @tc.desc       : Testing Collections of Map, create <undefined, string> [undefined,'a'], map.get(undefined).
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsMap0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsMap0037";
      try {
        const testMap = new collections.Map<undefined, string>();
        testMap.set(undefined, 'a');
        console.info("testMap is: ", testMap);
        expect(testMap.get(undefined)).assertEqual('a');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_MAP_3800
     * @tc.name       : testCollectionsMap0038
     * @tc.desc       : Testing Collections of Map, create <number, string> [1,'a'], map.get(1).
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsMap0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsMap0038";
      try {
        const testMap = new collections.Map<number, string>();
        testMap.set(1, 'a');
        console.info("testMap is: ", testMap);
        expect(testMap.get(1)).assertEqual('a');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_MAP_3900
     * @tc.name       : testCollectionsMap0039
     * @tc.desc       : Testing Collections of Map, create <number, string> [1,'a'], map.get(2).
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsMap0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsMap0039";
      try {
        const testMap = new collections.Map<number, string>();
        testMap.set(1, 'a');
        console.info("testMap is: ", testMap);
        expect(testMap.get(2)).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_MAP_4000
     * @tc.name       : testCollectionsMap0040
     * @tc.desc       : Testing Collections of Map, create <number, string> [1,'a'], delete->set->clear,map.get(1).
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsMap0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsMap0040";
      try {
        const testMap = new collections.Map<number, string>();
        testMap.set(1, 'a');
        console.info("testMap is: ", testMap);
        expect(testMap.get(1)).assertEqual('a');
        testMap.delete(1);
        expect(testMap.get(1)).assertEqual(undefined);
        testMap.set(2, 'b');
        expect(testMap.get(2)).assertEqual('b');
        testMap.clear();
        expect(testMap.get(2)).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_MAP_4100
     * @tc.name       : testCollectionsMap0041
     * @tc.desc       : Testing Collections of Map, create <string, string> [], map.has("").
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsMap0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsMap0041";
      try {
        const testMap = new collections.Map<string, string>();
        expect(testMap.has("")).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_MAP_4200
     * @tc.name       : testCollectionsMap0042
     * @tc.desc       : Testing Collections of Map, create <string, string> ['0','a'], map.has("").
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsMap0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsMap0042";
      try {
        const testMap = new collections.Map<string, string>();
        testMap.set('0','a');
        console.info("testMap is: ", testMap);
        expect(testMap.has("")).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_MAP_4300
     * @tc.name       : testCollectionsMap0043
     * @tc.desc       : Testing Collections of Map, create <null, string> [], map.has(null).
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsMap0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsMap0043";
      try {
        const testMap = new collections.Map<null, string>();
        console.info("testMap is: ", testMap);
        expect(testMap.has(null)).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_MAP_4400
     * @tc.name       : testCollectionsMap0044
     * @tc.desc       : Testing Collections of Map, create <null, string> [null, 'a'], map.has(null).
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsMap0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsMap0044";
      try {
        const testMap = new collections.Map<null, string>();
        testMap.set(null, 'a');
        console.info("testMap is: ", testMap);
        expect(testMap.has(null)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_MAP_4500
     * @tc.name       : testCollectionsMap0045
     * @tc.desc       : Testing Collections of Map, create <undefined, string> [], map.has(undfined).
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsMap0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsMap0045";
      try {
        const testMap = new collections.Map<undefined, string>();
        console.info("testMap is: ", testMap);
        expect(testMap.has(undefined)).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_MAP_4600
     * @tc.name       : testCollectionsMap0046
     * @tc.desc       : Testing Collections of Map, create <undefined, string> [undefined, 'a'], map.has(undfined).
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsMap0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsMap0046";
      try {
        const testMap = new collections.Map<undefined, string>();
        testMap.set(undefined, 'a');
        console.info("testMap is: ", testMap);
        expect(testMap.has(undefined)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_MAP_4700
     * @tc.name       : testCollectionsMap0047
     * @tc.desc       : Testing Collections of Map, create <number, string> [], map.has(1).
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsMap0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsMap0047";
      try {
        const testMap = new collections.Map<number, string>();
        console.info("testMap is: ", testMap);
        expect(testMap.has(1)).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_MAP_4800
     * @tc.name       : testCollectionsMap0048
     * @tc.desc       : Testing Collections of Map, create <number, string> [1,'a'], map.has(1).
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsMap0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsMap0048";
      try {
        const testMap = new collections.Map<number, string>();
        testMap.set(1,'a');
        console.info("testMap is: ", testMap);
        expect(testMap.has(1)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_MAP_4900
     * @tc.name       : testCollectionsMap0049
     * @tc.desc       : Testing Collections of Map, create <number, string> [1,'a'], map.has(2).
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsMap0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsMap0049";
      try {
        const testMap = new collections.Map<number, string>();
        testMap.set(1,'a');
        console.info("testMap is: ", testMap);
        expect(testMap.has(2)).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_MAP_5000
     * @tc.name       : testCollectionsMap0050
     * @tc.desc       : Testing Collections of Map, create <number, string> [1,'a'], delete->set->clear,map.has().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsMap0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsMap0050";
      try {
        const testMap = new collections.Map<number, string>();
        testMap.set(1,'a');
        console.info("testMap is: ", testMap);
        expect(testMap.has(1)).assertEqual(true);
        testMap.delete(1);
        expect(testMap.has(1)).assertEqual(false);
        testMap.set(2,'b');
        expect(testMap.has(2)).assertEqual(true);
        testMap.clear();
        expect(testMap.has(2)).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_MAP_5100
     * @tc.name       : testCollectionsMap0051
     * @tc.desc       : Testing Collections of Map, set <string, string> ["",'a'], size 1,get true.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsMap0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsMap0051";
      try {
        const testMap = new collections.Map<string, string>();
        testMap.set("",'a');
        console.info("testMap is: ", testMap);
        expect(testMap.size).assertEqual(1);
        expect(testMap.get("")).assertEqual('a');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_MAP_5200
     * @tc.name       : testCollectionsMap0052
     * @tc.desc       : Testing Collections of Map, set <string, string> ["a","0"], size 1,get true.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsMap0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsMap0052";
      try {
        const testMap = new collections.Map<string, string>();
        testMap.set("a","0");
        console.info("testMap is: ", testMap);
        expect(testMap.size).assertEqual(1);
        expect(testMap.get("a")).assertEqual('0');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_MAP_5300
     * @tc.name       : testCollectionsMap0053
     * @tc.desc       : Testing Collections of Map, set <null, string> [null,"0"], size 1,get true.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsMap0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsMap0053";
      try {
        const testMap = new collections.Map<null, string>();
        testMap.set(null,"0");
        console.info("testMap is: ", testMap);
        expect(testMap.size).assertEqual(1);
        expect(testMap.get(null)).assertEqual('0');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_MAP_5400
     * @tc.name       : testCollectionsMap0054
     * @tc.desc       : Testing Collections of Map, set <undefined, string> [undefined,"0"], size 1,get true.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsMap0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsMap0054";
      try {
        const testMap = new collections.Map<undefined, string>();
        testMap.set(undefined,"0");
        console.info("testMap is: ", testMap);
        expect(testMap.size).assertEqual(1);
        expect(testMap.get(undefined)).assertEqual('0');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_MAP_5500
     * @tc.name       : testCollectionsMap0055
     * @tc.desc       : Testing Collections of Map, set <string, string> ['xxxxx',"0"], size 1,get true.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsMap0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsMap0055";
      try {
        const testMap = new collections.Map<string, string>();
        let tempStr: string = new Array(2048).join('a');
        testMap.set(tempStr,"0");
        console.info("testMap is: ", testMap);
        expect(testMap.size).assertEqual(1);
        expect(testMap.get(tempStr)).assertEqual('0');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_MAP_5600
     * @tc.name       : testCollectionsMap0056
     * @tc.desc       : Testing Collections of Map, set <string, null> ['0',null], size 1,get true.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsMap0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsMap0056";
      try {
        const testMap = new collections.Map<string, null>();
        testMap.set('0', null);
        console.info("testMap is: ", testMap);
        expect(testMap.size).assertEqual(1);
        expect(testMap.get('0')).assertEqual(null);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_MAP_5700
     * @tc.name       : testCollectionsMap0057
     * @tc.desc       : Testing Collections of Map, set <string, number> ['0',1], size 1,get true.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsMap0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsMap0057";
      try {
        const testMap = new collections.Map<string, number>();
        testMap.set('0', 1);
        console.info("testMap is: ", testMap);
        expect(testMap.size).assertEqual(1);
        expect(testMap.get('0')).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_MAP_5800
     * @tc.name       : testCollectionsMap0058
     * @tc.desc       : Testing Collections of Map, set <string, undefined> ['0',undefined], size 1,get true.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsMap0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsMap0058";
      try {
        const testMap = new collections.Map<string, undefined>();
        testMap.set('0', undefined);
        console.info("testMap is: ", testMap);
        expect(testMap.size).assertEqual(1);
        expect(testMap.get('0')).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_MAP_5900
     * @tc.name       : testCollectionsMap0059
     * @tc.desc       : Testing Collections of Map, set <number, string> [] 1000, size 1000,get true.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsMap0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsMap0059";
      try {
          const testMap: collections.Map<number, string> = new collections.Map<number, string>();
          for (let i = 0; i < 1000; i++) {
              testMap.set(i,'a');
          }
          console.info("testMap is: ", testMap);
          expect(testMap.size).assertEqual(1000);
          expect(testMap.get(0)).assertEqual('a');
      } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
      }
      done()
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_MAP_6000
     * @tc.name       : testCollectionsMap0060
     * @tc.desc       : Testing Collections of Map, set <number, string> [], delete->set->clear.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsMap0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsMap0060";
      try {
        const testMap: collections.Map<number, string> = new collections.Map<number, string>();
        testMap.set(1,'a');
        testMap.delete(1);
        console.info("testMap is: ", testMap);
        expect(testMap.size).assertEqual(0);
        testMap.set(2,'b');
        console.info("testMap is: ", testMap);
        expect(testMap.size).assertEqual(1);
        testMap.clear();
        expect(testMap.size).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
  })
}