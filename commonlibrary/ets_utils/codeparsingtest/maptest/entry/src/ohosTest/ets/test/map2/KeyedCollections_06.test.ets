/*
* Copyright (c) 2025 SwanLink (Jiangsu) Technology Development Co., LTD.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';

interface test {
  prop ?: string | null | number
  key ?: object | undefined
}

export default function keyedCollections_06Test() {
  describe('keyedCollections_06Test', () => {
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
     * @tc.number    SUB_BASEDATE_MAP_GET_0100
     * @tc.name      testMapGet0001
     * @tc.desc      Verify that getting a key from an empty Map returns undefined.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapGet0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testMapGet0001";
        console.log(TAG + ' start');
        const map1: Map<string, string> = new Map<string, string>();
        console.log("Empty Map - get returns undefined: " + (map1.get("anyKey") === undefined));
        expect(map1.get("anyKey") === undefined).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_MAP_DELETE_0100
     * @tc.name      testMapDelete0001
     * @tc.desc      Verify that deleting a key from an empty Map returns false.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapDelete0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testMapDelete0001";
        console.log(TAG + ' start');
        const map2: Map<string, string> = new Map<string, string>();
        expect(!map2.delete("anyKey")).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    BASEDATE_MAP_HAS_0100
     * @tc.name      testMapHas0001
     * @tc.desc      Verify that has() on an empty Map returns false.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapHas0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testMapHas0001";
        console.log(TAG + ' start');
        const map3: Map<string, string> = new Map<string, string>();
        expect(!map3.has("anyKey")).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_MAP_SIZE_0100
     * @tc.name      testMapSize0001
     * @tc.desc      Verify that keys() iteration on an empty Map yields zero length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapSize0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testMapSize0001";
        console.log(TAG + ' start');
        const map4: Map<string, string> = new Map<string, string>();
        expect((Array.from(map4.keys()).length === 0)).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_MAP_SIZE_0200
     * @tc.name      testMapSize0002
     * @tc.desc      Verify that values() iteration on an empty Map yields zero length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapSize0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testMapSize0002";
        console.log(TAG + ' start');
        const map5: Map<string, string> = new Map<string, string>();
        console.log("Empty Map - values length is 0: " + (Array.from(map5.values()).length === 0));
        expect((Array.from(map5.values()).length === 0)).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_MAP_SIZE_0300
     * @tc.name      testMapSize0003
     * @tc.desc      Verify that entries() iteration on an empty Map yields zero length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapSize0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testMapSize0003";
        console.log(TAG + ' start');
        const map6: Map<string, string> = new Map<string, string>();
        console.log("Empty Map - entries length is 0: " + (Array.from(map6.entries()).length === 0));
        expect((Array.from(map6.entries()).length === 0)).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_MAP_FOREACH_0100
     * @tc.name      testMapForEach0001
     * @tc.desc      Verify that forEach on an empty Map does not call the callback.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapForEach0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testMapForEach0001";
        console.log(TAG + ' start');
        const map7: Map<string, string> = new Map<string, string>();
        let called7: boolean = false;
        map7.forEach(() => {
          called7 = true;
        });
        console.log("Empty Map - forEach did not call callback: " + !called7);
        expect(!called7).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    BASEDATE_SUB_MAP_SIZE_0400
     * @tc.name      testMapSize0004
     * @tc.desc      Verify that size of an empty Map is zero.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapSize0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testMapSize0004";
        console.log(TAG + ' start');
        const map8: Map<string, string> = new Map<string, string>();
        console.log("Empty Map - size is 0: " + (map8.size === 0));
        expect((map8.size === 0)).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_MAP_CLEAR_0100
     * @tc.name      testMapClear0001
     * @tc.desc      Verify that clear() on an empty Map does not throw an exception.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapClear0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testMapClear0001";
        console.log(TAG + ' start');
        const map9: Map<string, string> = new Map<string, string>();
        let error9: boolean = false;
        try {
          map9.clear();
        } catch (e) {
          error9 = true;
        }
        console.log("Empty Map - clear did not throw: " + !error9);
        expect(!error9).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    BASEDATE_MAP_SET_0100
     * @tc.name      testMapSet0001
     * @tc.desc      Verify that setting a key on an empty Map increases size to 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapSet0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testMapSet0001";
        console.log(TAG + ' start');
        const map10: Map<string, string> = new Map<string, string>();
        map10.set("key", "val");
        console.log("Empty Map - after set size is 1: " + (map10.size === 1));
        expect((map10.size === 1)).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });



    /**
     * @tc.number    SUB_BASEDATE_SET_HAS_0100
     * @tc.name      testSetHas0001
     * @tc.desc      Verify that has() on an empty Set returns false.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testSetHas0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testSetHas0001";
        console.log(TAG + ' start');
        const set11: Set<string> = new Set<string>();
        console.log("Empty Set - has returns false: " + !set11.has("anyVal"));
        expect(!set11.has("anyVal")).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    BASEDATE_SET_DELETE_0100
     * @tc.name      testSetDelete0001
     * @tc.desc      Verify that deleting a value from an empty Set returns false.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testSetDelete0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testSetDelete0001";
        console.log(TAG + ' start');
        const set12: Set<string> = new Set<string>();
        expect(!set12.delete("anyVal")).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_SET_SIZE_2100
     * @tc.name      testSetSize0021
     * @tc.desc      Verify that keys() iteration on an empty Set yields zero length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testSetSize0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testSetSize0021";
        console.log(TAG + ' start');
        const set13: Set<string> = new Set<string>();
        expect((Array.from(set13.keys()).length === 0)).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_SET_SIZE_2200
     * @tc.name      testSetSize0022
     * @tc.desc      Verify that values() iteration on an empty Set yields zero length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testSetSize0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testSetSize0022";
        console.log(TAG + ' start');
        const set14: Set<string> = new Set<string>();
        expect((Array.from(set14.values()).length === 0)).assertTrue();
        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_SET_SIZE_2300
     * @tc.name      testSetSize0023
     * @tc.desc      Verify that entries() iteration on an empty Set yields zero length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testSetSize0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testSetSize0023";
        console.log(TAG + ' start');
        const set15: Set<string> = new Set<string>();
        expect((Array.from(set15.entries()).length === 0)).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_SET_FOREACH_0100
     * @tc.name      testSetForEach0001
     * @tc.desc      Verify that forEach on an empty Set does not call the callback.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testSetForEach0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testSetForEach0001";
        console.log(TAG + ' start');
        const set16: Set<string> = new Set<string>();
        let called16: boolean = false;
        set16.forEach(() => {
          called16 = true;
        });
        console.log("Empty Set - forEach did not call callback: " + !called16);
        expect(!called16).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_SET_SIZE_2400
     * @tc.name      testSetSize0024
     * @tc.desc      Verify that size of an empty Set is zero.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testSetSize0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testSetSize0024";
        console.log(TAG + ' start');
        const set17: Set<string> = new Set<string>();
        console.log("Empty Set - size is 0: " + (set17.size === 0));
        expect((set17.size === 0)).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_DATE_SET_CLEAR_0100
     * @tc.name      testSetClear0001
     * @tc.desc      Verify that clear() on an empty Set does not throw an exception.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testSetClear0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testSetClear0001";
        console.log(TAG + ' start');
        const set18: Set<string> = new Set<string>();
        let error18: boolean = false;
        try {
          set18.clear();
        } catch (e) {
          error18 = true;
        }
        console.log("Empty Set - clear did not throw: " + !error18);
        expect(!error18).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    BASEDATE_SET_SET_0100
     * @tc.name      testSetSet0001
     * @tc.desc      Verify that adding an element to an empty Set increases size to 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testSetSet0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testSetSet0001";
        console.log(TAG + ' start');
        const set19: Set<string> = new Set<string>();
        set19.add("val");
        console.log("Empty Set - after add size is 1: " + (set19.size === 1));
        expect((set19.size === 1)).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    BASEDATE_SET_SET_0200
     * @tc.name      testSetSet0002
     * @tc.desc      Verify that adding duplicate values to a Set keeps the size at 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testSetSet0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testSetSet0002";
        console.log(TAG + ' start');
        const set20: Set<string> = new Set<string>();
        set20.add("val").add("val");
        console.log("Empty Set - duplicate add size remains 1: " + (set20.size === 1));
        expect((set20.size === 1)).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_MAP_CLEAR_0200
     * @tc.name      testMapClear0002
     * @tc.desc      Verify that clearing a Map that had elements will result in size 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapClear0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testMapClear0002";
        console.log(TAG + ' start');
        const map21: Map<string, string> = new Map<string, string>();
        map21.set("a", "1");
        map21.set("b", "2");
        map21.clear();
        console.log("Map after clear - size is 0: " + (map21.size === 0));
        expect(map21.size === 0).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_MAP_ITERATOR_0100
     * @tc.name      testMapIterator0001
     * @tc.desc      Verify that iterator.next() on keys() of an empty Map returns done === true.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapIterator0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testMapIterator0001";
        console.log(TAG + ' start');
        const map22: Map<string, string> = new Map<string, string>();
        const itKeys = map22.keys();
        const first = itKeys.next();
        console.log("Empty Map keys iterator - done is true: " + (first.done === true));
        expect(first.done === true).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    BASEDATE_MAP_HAS_0300
     * @tc.name      testMapHas0003
     * @tc.desc      Verify that has(undefined) on an empty Map returns false.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapHas0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testMapHas0003";
        console.log(TAG + ' start');
        const map23: Map<undefined, undefined> = new Map<undefined, undefined>();
        console.log("Empty Map - has(undefined) returns false: " + !map23.has(undefined));
        expect(!map23.has(undefined)).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    BASEDATE_MAP_GET_0300
     * @tc.name      testMapGet0003
     * @tc.desc      Verify that get(undefined) on an empty Map returns undefined.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapGet0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testMapGet0003";
        console.log(TAG + ' start');
        const map24: Map<undefined, undefined> = new Map<undefined, undefined>();
        console.log("Empty Map - get(undefined) returns undefined: " + (map24.get(undefined) === undefined));
        expect(map24.get(undefined) === undefined).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_SET_CLEAR_0200
     * @tc.name      testSetClear0002
     * @tc.desc      Verify that clearing a Set which had elements will result in size 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testSetClear0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testSetClear0002";
        console.log(TAG + ' start');
        const set21: Set<string> = new Set<string>();
        set21.add("x");
        set21.add("y");
        set21.clear();
        console.log("Set after clear - size is 0: " + (set21.size === 0));
        expect(set21.size === 0).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_SET_ITERATOR_0100
     * @tc.name      testSetIterator0001
     * @tc.desc      Verify that iterator.next() on values() of an empty Set returns done === true.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testSetIterator0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testSetIterator0001";
        console.log(TAG + ' start');
        const set22: Set<string> = new Set<string>();
        const itVals = set22.values();
        const first = itVals.next();
        console.log("Empty Set values iterator - done is true: " + (first.done === true));
        expect(first.done === true).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    BASEDATE_SET_HAS_0200
     * @tc.name      testSetHas0002
     * @tc.desc      Verify that has(undefined) on an empty Set returns false.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testSetHas0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testSetHas0002";
        console.log(TAG + ' start');
        const set23: Set<undefined> = new Set<undefined>();
        console.log("Empty Set - has(undefined) returns false: " + !set23.has(undefined));
        expect(!set23.has(undefined)).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_SET_DELETE_0200
     * @tc.name      testSetDelete0002
     * @tc.desc      Verify that adding then deleting an element results in delete returning true and size 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testSetDelete0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testSetDelete0002";
        console.log(TAG + ' start');
        const set24: Set<string> = new Set<string>();
        set24.add("toRemove");
        const deleted = set24.delete("toRemove");
        console.log("Set add then delete - delete returned true and size is 0: " +
          (deleted === true && set24.size === 0));
        expect(deleted === true && set24.size === 0).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_MAP_SIZE_0500
     * @tc.name      testMapSize0005
     * @tc.desc      Verify that keys() on a Map that was cleared yields zero length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapSize0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testMapSize0005";
        console.log(TAG + ' start');
        const map25: Map<string, string> = new Map<string, string>();
        map25.set("k", "v");
        map25.clear();
        console.log("Map after clear - keys length is 0: " + (Array.from(map25.keys()).length === 0));
        expect((Array.from(map25.keys()).length === 0)).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_SET_SIZE_2500
     * @tc.name      testSetSize0025
     * @tc.desc      Verify that entries() on a Set that was cleared yields zero length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testSetSize0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testSetSize0025";
        console.log(TAG + ' start');
        const set25: Set<string> = new Set<string>();
        set25.add("a");
        set25.clear();
        console.log("Set after clear - entries length is 0: " + (Array.from(set25.entries()).length === 0));
        expect((Array.from(set25.entries()).length === 0)).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_ANI_MAP_GET_0800
     * @tc.name      testMapGet0008
     * @tc.desc      Verify that after modifying a property of an object used as a Map key, get() still returns the correct value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapGet0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testMapGet0008";
        console.log(TAG + ' start');
        const map71: Map<object, string> = new Map<object, string>();

        interface testobj {
          prop: string
        }

        const obj71: testobj = Object({ prop: "old" });
        map71.set(obj71, "val");
        obj71.prop = "new";
        console.log("Map object key property changed but get still works: " + (map71.get(obj71) === "val"));
        expect(map71.get(obj71) === "val").assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_ANI_MAP_HAS_0600
     * @tc.name      testMapHas0006
     * @tc.desc      Verify that after adding a property to an object used as a Map key, has() still returns true.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapHas0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testMapHas0006";
        console.log(TAG + ' start');
        const map72: Map<object, string> = new Map<object, string>();

        interface TestObj {
          fixedProp?: string;
        }

        class TestObject implements TestObj {
          private dynamicData = new Map<string, string>();
          public fixedProp: string = '';

          constructor() {
          }

          setDynamicProperty(key: string, value: string): void {
            this.dynamicData.set(key, value);
          }

          getDynamicProperty(key: string): string | undefined {
            return this.dynamicData.get(key);
          }
        }

        const obj72 = new TestObject();
        map72.set(obj72, "val");
        obj72.setDynamicProperty("newProp", "test");
        console.log("Map object key property added but has still true: " + map72.has(obj72));
        expect(map72.has(obj72)).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });
  })
}