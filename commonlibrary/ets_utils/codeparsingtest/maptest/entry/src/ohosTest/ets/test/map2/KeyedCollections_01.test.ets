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

interface GeneratedObjectLiteralInterface_1 {
  id: string;
}

export default function keyedCollections_01Test() {
  describe('keyedCollections_01Test', () => {
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
     * @tc.number    SUB_BASEDATA_MAP_CLEAR_0100
     * @tc.name      testMapClear0001
     * @tc.desc      non-empty Map call clear() method, check size becomes 0
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapClear0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testMapClear0001";
        console.log(TAG + " start");
        const map21: Map<string, string> = new Map();
        map21.set("k1", "v1").set("k2", "v2").set("k3", "v3");
        expect(map21.size).assertEqual(3);
        map21.clear();
        expect(map21.size).assertEqual(0);
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });

    /**
     * @tc.number    SUB_BASEDATA_MAP_CLEAR_0200
     * @tc.name      testMapClear0002
     * @tc.desc      The empty Map calls the clear() method to check that the size becomes 0
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapClear0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testMapClear0002";
        console.log(TAG + " start");
        const map22: Map<string, string> = new Map();
        map22.clear();
        expect(map22.size).assertEqual(0);
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });

    /**
     * @tc.number    SUB_BASEDATA_MAP_CLEAR_0300
     * @tc.name      testMapClear0003
     * @tc.desc      Multiple calls to clear ()(non-empty before empty) size is correct
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapClear0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testMapClear0003";
        console.log(TAG + " start");
        const map23: Map<string, string> = new Map();
        map23.set("k1", "v1").set("k2", "v2").set("k3", "v3");
        map23.clear();
        expect(map23.size).assertEqual(0);
        map23.clear();
        expect(map23.size).assertEqual(0);
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });

    /**
     * @tc.number    SUB_BASEDATA_MAP_CLEAR_0400
     * @tc.name      testMapClear0004
     * @tc.desc      After clear () has () detects the original key and returns false.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapClear0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testMapClear0004";
        console.log(TAG + " start");
        const map24: Map<string, string> = new Map();
        const key24: string = "testKey";
        map24.set(key24, "v1");
        expect(map24.has(key24)).assertEqual(true)
        map24.clear();
        expect(map24.has(key24)).assertEqual(false);
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });

    /**
     * @tc.number    SUB_BASEDATA_MAP_CLEAR_0500
     * @tc.name      testMapClear0005
     * @tc.desc      After clear (), get () returns the undefined key.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapClear0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testMapClear0005";
        console.log(TAG + " start");
        const key25: GeneratedObjectLiteralInterface_1 = { id: "testKey" };
        const map25: Map<object, string> = new Map();
        map25.set(key25, "val");
        expect(map25.get(key25)).assertEqual("val");
        map25.clear();
        const result = map25.get(key25);
        expect(result).assertEqual(undefined);
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });

    /**
     * @tc.number    SUB_BASEDATA_MAP_CLEAR_0600
     * @tc.name      testMapClear0006
     * @tc.desc      The new key after clear () can be set normally
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapClear0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testMapClear0006";
        console.log(TAG + " start");
        const map26: Map<string, string> = new Map();
        map26.set("old", "val");
        expect(map26.size).assertEqual(1);
        map26.clear();
        expect(map26.size).assertEqual(0);
        map26.set("new", "val");
        expect(map26.size).assertEqual(1);
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });

    /**
     * @tc.number    SUB_BASEDATA_MAP_CLEAR_0700
     * @tc.name      testMapClear0007
     * @tc.desc      Map with object key, object key is not accessible after clear ()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapClear0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        interface MapKeyObject {
          id: number;
        }
        const TAG = "testMapClear0007";
        console.log(TAG + " start");
        const map27: Map<MapKeyObject, string> = new Map();
        const obj27: MapKeyObject = { id: 3 };
        map27.set(obj27, "val");
        expect(map27.has(obj27)).assertEqual(true);
        map27.clear();
        expect(map27.has(obj27)).assertEqual(false);
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });

    /**
     * @tc.number    SUB_BASEDATA_MAP_CLEAR_0800
     * @tc.name      testMapClear0008
     * @tc.desc      Map with nested object keys, size after clear () is 0
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapClear0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        interface InnerObject {
          b: string;
        }
        interface NestedObject {
          a: InnerObject;
        }
        const TAG = "testMapClear0008";
        console.log(TAG + " start");
        const map28: Map<NestedObject | string, string> = new Map();
        const innerObj: InnerObject = { b: "c" };
        const nestedObj28: NestedObject = { a: innerObj };
        map28.set(nestedObj28, "val").set("other", "val");
        expect(map28.size).assertEqual(2);
        map28.clear();
        expect(map28.size).assertEqual(0);
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });

    /**
     * @tc.number    SUB_BASEDATA_MAP_CLEAR_0900
     * @tc.name      testMapClear0009
     * @tc.desc      The original key returns false after clear () and delete ().
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapClear0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testMapClear0009";
        console.log(TAG + " start");
        const map29: Map<number, string> = new Map();
        const key29: number = 789;
        map29.set(key29, "val");
        map29.delete(key29);
        map29.set(key29, "val");
        expect(map29.has(key29)).assertEqual(true);
        map29.clear();
        expect(map29.delete(key29)).assertEqual(false);
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });

    /**
     * @tc.number    SUB_BASEDATA_MAP_CLEAR_1000
     * @tc.name      testMapClear0010
     * @tc.desc      Continuously add-delete-size after clear () is 0
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapClear0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testMapClear0010";
        console.log(TAG + " start");
        const map30: Map<string, string> = new Map();
        map30.set("a", "1").set("b", "2").set("c", "3");
        expect(map30.size).assertEqual(3);
        map30.delete("b");
        expect(map30.size).assertEqual(2);
        map30.clear();
        expect(map30.size).assertEqual(0);
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });

    /**
     * @tc.number    SUB_BASEDATA_MAP_FOR_Of_0100
     * @tc.name      testMapForOf0001
     * @tc.desc      Traversal entries-String keys output in insertion order
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapForOf0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testMapForOf0001";
        console.log(TAG + " start");
        const map1: Map<string, string> = new Map();
        map1.set("b", "valB").set("a", "valA").set("c", "valC");
        const entries1: [string, string][] = [];
        for (const entry of map1.entries()) {
          entries1.push(entry);
        }
        expect(entries1.length).assertEqual(3);
        const order1: boolean = entries1[0][0] === "b" &&
          entries1[1][0] === "a" &&
          entries1[2][0] === "c";
        expect(order1).assertEqual(true);
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });

    /**
     * @tc.number    SUB_BASEDATA_MAP_FOR_Of_0200
     * @tc.name      testMapForOf0002
     * @tc.desc      Traversal entries-Number keys output in order of insertion
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapForOf0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testMapForOf0002";
        console.log(TAG + " start");
        const map2: Map<number, string> = new Map();
        map2.set(3, "val3").set(1, "val1").set(2, "val2");
        const entries2: [number, string][] = [];
        for (const entry of map2.entries()) {
          entries2.push(entry);
        }
        expect(entries2.length).assertEqual(3);
        const order2: boolean = entries2[0][1] === "val3" &&
          entries2[1][1] === "val1" &&
          entries2[2][1] === "val2";
        expect(order2).assertEqual(true);
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
        console.log("2. for...of traverse entries number keys in correct order: " + order2);
      });

    /**
     * @tc.number    SUB_BASEDATA_MAP_FOR_Of_0300
     * @tc.name      testMapForOf0003
     * @tc.desc      Traversal entries-Object Keys Output in Insert Order
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapForOf0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testMapForOf0003";
        console.log(TAG + " start");
        interface MapKey {
          id: number;
        }
        const obj3a: MapKey = { id: 1 };
        const obj3b: MapKey = { id: 2 };
        const obj3c: MapKey = { id: 3 };
        const map3: Map<MapKey, string> = new Map();
        map3.set(obj3b, "valB").set(obj3a, "valA").set(obj3c, "valC");
        const entries3: [MapKey, string][] = [];
        for (const entry of map3.entries()) {
          entries3.push(entry);
        }
        expect(entries3.length).assertEqual(3);
        const order3: boolean = entries3[0][0] === obj3b &&
          entries3[1][0] === obj3a &&
          entries3[2][0] === obj3c;
        expect(order3).assertEqual(true);
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });

    /**
     * @tc.number    SUB_BASEDATA_MAP_FOR_Of_0400
     * @tc.name      testMapForOf0004
     * @tc.desc      Traversal entries-Symbol key output in insertion order
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapForOf0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testMapForOf0004";
        console.log(TAG + " start");
        interface SymbolLike {
          type: "symbol";
          description: string;
        }
        const sym4a: SymbolLike = { type: "symbol", description: "a" };
        const sym4b: SymbolLike = { type: "symbol", description: "b" };
        const sym4c: SymbolLike = { type: "symbol", description: "c" };
        const map4: Map<SymbolLike, string> = new Map();
        map4.set(sym4c, "valC").set(sym4a, "valA").set(sym4b, "valB");
        const entries4: [SymbolLike, string][] = [];
        for (const entry of map4.entries()) {
          entries4.push(entry);
        }
        expect(entries4.length).assertEqual(3);
        const order4: boolean = entries4[0][0] === sym4c &&
          entries4[1][0] === sym4a &&
          entries4[2][0] === sym4b;
        expect(order4).assertEqual(true);
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });

    /**
     * @tc.number    SUB_BASEDATA_SET_Boolean_Value_0100
     * @tc.name      testSetBooleanValue0001
     * @tc.desc      Add true validation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testSetBooleanValue0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testSetBooleanValue0001";
        console.log(TAG + " start");
        const set41: Set<boolean> = new Set();
        set41.add(true);
        expect(set41.has(true)).assertEqual(true);
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });

    /**
     * @tc.number    SUB_BASEDATA_SET_Boolean_Value_0200
     * @tc.name      testSetBooleanValue0002
     * @tc.desc      Add false validation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testSetBooleanValue0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testSetBooleanValue0002";
        console.log(TAG + " start");
        const set42: Set<boolean> = new Set();
        set42.add(false);
        expect(set42.has(false)).assertEqual(true);
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });

    /**
     * @tc.number    SUB_BASEDATA_SET_Boolean_Value_0300
     * @tc.name      testSetBooleanValue0003
     * @tc.desc      Delete true validation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testSetBooleanValue0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testSetBooleanValue0003";
        console.log(TAG + " start");
        const set43: Set<boolean> = new Set();
        set43.add(true);
        expect(set43.has(true)).assertEqual(true);
        const deleteResult: boolean = set43.delete(true);
        expect(deleteResult).assertEqual(true);
        expect(set43.has(true)).assertEqual(false);
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });

    /**
     * @tc.number    SUB_BASEDATA_SET_Boolean_Value_0400
     * @tc.name      testSetBooleanValue0004
     * @tc.desc      Delete false validation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testSetBooleanValue0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testSetBooleanValue0004";
        console.log(TAG + " start");
        const set44: Set<boolean> = new Set();
        set44.add(false);
        expect(set44.has(false)).assertEqual(true);
        const deleteResult: boolean = set44.delete(false);
        expect(deleteResult).assertEqual(true);
        expect(set44.has(false)).assertEqual(false);
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });

    /**
     * @tc.number    SUB_BASEDATA_SET_Boolean_Value_0500
     * @tc.name      testSetBooleanValue0005
     * @tc.desc      Has no authentication after delete
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testSetBooleanValue0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testSetBooleanValue0005";
        console.log(TAG + " start");
        const set45: Set<boolean> = new Set();
        set45.add(false);
        expect(set45.has(false)).assertEqual(true);
        set45.delete(false);
        const hasResult: boolean = set45.has(false);
        expect(hasResult).assertEqual(false);
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });

    /**
     * @tc.number    SUB_BASEDATA_SET_Boolean_Value_0600
     * @tc.name      testSetBooleanValue0006
     * @tc.desc      Repeat add true validation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testSetBooleanValue0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testSetBooleanValue0006";
        console.log(TAG + " start");
        const set46: Set<boolean> = new Set();
        set46.add(true);
        const sizeBefore: number = set46.size;
        expect(sizeBefore).assertEqual(1);
        set46.add(true);
        const sizeAfter: number = set46.size;
        expect(sizeAfter).assertEqual(sizeBefore);
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });

    /**
     * @tc.number    SUB_BASEDATA_SET_Boolean_Value_0700
     * @tc.name      testSetBooleanValue0007
     * @tc.desc      Add true and 1 validation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testSetBooleanValue0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testSetBooleanValue0007";
        console.log(TAG + " start");
        const set47: Set<boolean | number> = new Set();
        set47.add(true);
        set47.add(1);
        expect(set47.size).assertEqual(2);
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });

    /**
     * @tc.number    SUB_BASEDATA_SET_Boolean_Value_0800
     * @tc.name      testSetBooleanValue0008
     * @tc.desc      Add false and 0 validation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testSetBooleanValue0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testSetBooleanValue0008";
        console.log(TAG + " start");
        const set48: Set<boolean | number> = new Set();
        set48.add(false);
        set48.add(0);
        expect(set48.size).assertEqual(2);
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });

    /**
     * @tc.number    SUB_BASEDATA_SET_Boolean_Value_0900
     * @tc.name      testSetBooleanValue0009
     * @tc.desc      Remove No Boolean Validation Added
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testSetBooleanValue0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testSetBooleanValue0009";
        console.log(TAG + " start");
        const set49: Set<boolean> = new Set();
        expect(set49.size).assertEqual(0);
        const deleteResult: boolean = set49.delete(true);
        expect(deleteResult).assertEqual(false);
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });

    /**
     * @tc.number    SUB_BASEDATA_SET_Boolean_Value_1000
     * @tc.name      testSetBooleanValue0010
     * @tc.desc      Add true and false validation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testSetBooleanValue0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testSetBooleanValue0010";
        console.log(TAG + " start");
        const set50: Set<boolean> = new Set();
        set50.add(true);
        set50.add(false);
        expect(set50.size).assertEqual(2);
        expect(set50.has(true)).assertEqual(true);
        expect(set50.has(false)).assertEqual(true);
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });
  })
}