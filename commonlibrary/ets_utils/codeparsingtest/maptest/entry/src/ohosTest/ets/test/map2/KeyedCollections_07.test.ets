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

interface GeneratedObjectLiteralInterface_String {
  b: string;
}

interface GeneratedObjectLiteralInterface_2 {
  a: GeneratedObjectLiteralInterface_String;
}

interface GeneratedObjectLiteralInterface_number {
  z: number;
}

interface GeneratedObjectLiteralInterface_4 {
  y: GeneratedObjectLiteralInterface_number;
}

interface GeneratedObjectLiteralInterface_5 {
  x: GeneratedObjectLiteralInterface_4;
}


function generateUniqueKey(description: string): string {
  let entropy: number[] = [
    Math.floor(Math.random() * 0xffffffff),
    Math.floor(Math.random() * 0xffffffff)
  ];
  return `${description}_${Date.now()}_${entropy[0].toString(36)}${entropy[1].toString(36)}}`;
}


export default function keyedCollections_07Test() {
  describe('keyedCollections_07Test', () => {
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
     * @tc.number    SUB_BASEDATE_MAP_DELETE_1600
     * @tc.name      testMapDelete0016
     * @tc.desc      Verify that deleting a non-existent function key from Map returns false.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapDelete0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let TAG = "testMapDelete0016";
        console.log(TAG + ' start');

        const map71: Map<Function, string> = new Map<Function, string>();
        const result = !map71.delete(() => {
        });
        console.log("71. delete non-existent function key: " + result);
        expect(result).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_MAP_DELETE_1700
     * @tc.name      testMapDelete0017
     * @tc.desc      Verify that deleting the same key twice returns false the second time.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapDelete0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let TAG = "testMapDelete0017";
        console.log(TAG + ' start');
        const map72: Map<string, string> = new Map<string, string>();
        map72.set("testKey", "testValue");
        map72.delete("testKey");
        const result = !map72.delete("testKey");
        console.log("72. delete same key twice returns false: " + result);
        expect(result).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_MAP_HAS_2100
     * @tc.name      testMapHas0021
     * @tc.desc      Verify that after deleting a key, has() returns false for that key.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapHas0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let TAG = "testMapHas0021";
        console.log(TAG + ' start');
        const map73: Map<number, string> = new Map<number, string>();
        map73.set(123, "numValue");
        map73.delete(123);
        const result = !map73.has(123);
        console.log("73. has() after delete returns false: " + result);
        expect(result).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_MAP_SET_1100
     * @tc.name      testMapSet0011
     * @tc.desc      Verify that an empty string key can be set and detected in Map.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapSet0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let TAG = "testMapSet0011";
        console.log(TAG + ' start');
        const map74: Map<string, string> = new Map<string, string>();
        map74.set("", "emptyStrValue");
        const result = map74.has("");
        console.log("74. empty string key set success: " + result);
        expect(result).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_MAP_GET_2600
     * @tc.name      testMapGet0026
     * @tc.desc      Verify that get() with an empty string key returns the correct value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapGet0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let TAG = "testMapGet0026";
        console.log(TAG + ' start');

        const map75: Map<string, string> = new Map<string, string>();
        map75.set("", "emptyStrData");
        const result = (map75.get("") === "emptyStrData");
        console.log("75. get empty string key returns correct value: " + result);
        expect(result).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_MAP_SET_1200
     * @tc.name      testMapSet0012
     * @tc.desc      Verify that a very large number key can be set and detected in Map.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapSet0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let TAG = "testMapSet0012";
        console.log(TAG + ' start');
        const map76: Map<number, string> = new Map<number, string>();
        const bigNum = 999999999999999;
        map76.set(bigNum, "bigNumValue");
        const result = map76.has(bigNum);
        console.log("76. big number key set success: " + result);
        expect(result).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_MAP_GET_2700
     * @tc.name      testMapGet0027
     * @tc.desc      Verify that get() with a very large number key returns the correct value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapGet0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let TAG = "testMapGet0027";
        console.log(TAG + ' start');
        const map77: Map<number, string> = new Map<number, string>();
        const bigNum77 = 1000000000000;
        map77.set(bigNum77, "bigNumData");
        const result = (map77.get(bigNum77) === "bigNumData");
        console.log("77. get big number key returns correct value: " + result);
        expect(result).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_MAP_SET_1300
     * @tc.name      testMapSet0013
     * @tc.desc      Verify that a nested object key can be set and detected in Map.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapSet0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let TAG = "testMapSet0013";
        console.log(TAG + ' start');

        const map78: Map<object, string> = new Map<object, string>();
        const nestedObj: GeneratedObjectLiteralInterface_2 =
          { a: ({ b: "c" } as GeneratedObjectLiteralInterface_String) };
        map78.set(nestedObj, "nestedValue");
        const result = map78.has(nestedObj);
        console.log("78. nested object key set success: " + result);
        expect(result).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_MAP_GET_2800
     * @tc.name      testMapGet0028
     * @tc.desc      Verify that get() with a nested object key returns the correct value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapGet0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let TAG = "testMapGet0028";
        console.log(TAG + ' start');
        const map79: Map<object, string> = new Map<object, string>();
        const nestedObj79: GeneratedObjectLiteralInterface_5 = {
          x: ({
            y: ({ z: 1 } as GeneratedObjectLiteralInterface_number)
          } as GeneratedObjectLiteralInterface_4)
        };
        map79.set(nestedObj79, "nestedData");
        const result = (map79.get(nestedObj79) === "nestedData");
        console.log("79. get nested object key returns correct value: " + result);
        expect(result).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_MAP_DELETE_1800
     * @tc.name      testMapDelete0018
     * @tc.desc      Verify that deleting multiple different type keys updates the Map correctly.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapDelete0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let TAG = "testMapDelete0018";
        console.log(TAG + ' start');

        type MapKey = string | number | object;
        interface GeneratedObjectLiteralInterface_null {}

        const OBJECT_KEY: GeneratedObjectLiteralInterface_null = {};
        const map80: Map<MapKey, string> = new Map<MapKey, string>();
        map80.set("str", "s").set(123, "n").set(OBJECT_KEY, "o");
        map80.delete("str");
        map80.delete(123);
        const res = !map80.has("str") && !map80.has(123);
        console.log("80. delete multiple keys validation: " + res);
        expect(res).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    BASEDATE_SUB_MAP_SIZE_0100
     * @tc.name      testMapSize0001
     * @tc.desc      Verify that size equals 1 after adding one key-value pair.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapSize0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let TAG = "testMapSize0001";
        console.log(TAG + ' start');
        const map81: Map<string, string> = new Map<string, string>();
        map81.set("key1", "value1");
        const result = (map81.size === 1);
        console.log("81. size after 1 insert: " + result);
        expect(result).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    BASEDATE_MAP_SIZE_0200
     * @tc.name      testMapSize0002
     * @tc.desc      Verify size equals 2 after inserting two different type key-value pairs
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapSize0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testMapSize0002";
        console.log(TAG + " start");
        const map2: Map<number | string, string> = new Map();
        map2.set(123, "numVal").set(generateUniqueKey("symKey"), "symVal");
        console.log("Size equals 2: " + (map2.size === 2));
        expect(map2.size === 2).assertTrue();

        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });

    /**
     * @tc.number    BASEDATE_SUB_MAP_SIZE_0300
     * @tc.name      testMapSize0003
     * @tc.desc      Verify size equals 3 after inserting three key-value pairs including object key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapSize0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testMapSize0003";
        console.log(TAG + " start");

        const map3: Map<string | object | null, string> = new Map();
        const obj3: GeneratedObjectLiteralInterface_number = { z: 1 };
        map3.set("strKey", "s").set(obj3, "o").set(null, "n");
        console.log("Size equals 3: " + (map3.size === 3));
        expect(map3.size === 3).assertTrue();

        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });

    /**
     * @tc.number    BASEDATE_MAP_SIZE_0400
     * @tc.name      testMapSize0004
     * @tc.desc      Verify size equals 5 after inserting five key-value pairs in a loop
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapSize0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testMapSize0004";
        console.log(TAG + " start");

        const map4: Map<string, string> = new Map();
        for (let i = 0; i < 5; i++) {
          map4.set(`key${i}`, `val${i}`);
        }
        console.log("Size equals 5: " + (map4.size === 5));
        expect(map4.size === 5).assertTrue();

        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });

    /**
     * @tc.number    BASEDATE_MAP_SIZE_0500
     * @tc.name      testMapSize0005
     * @tc.desc      Verify size remains unchanged when inserting duplicate string key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapSize0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testMapSize0005";
        console.log(TAG + " start");

        const map5: Map<string, string> = new Map();
        map5.set("repeatKey", "val1");
        map5.set("repeatKey", "val2"); // duplicate key
        console.log("Size remains 1: " + (map5.size === 1));
        expect(map5.size === 1).assertTrue();

        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });

    /**
     * @tc.number    SUB_BASEDATE_MAP_SIZE_0600
     * @tc.name      testMapSize0006
     * @tc.desc      Verify size increases with different object instances as keys
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapSize0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testMapSize0006";
        console.log(TAG + " start");

        const map6: Map<object, string> = new Map();
        interface GeneratedObjectLiteralInterface_9 {
          id: number;
        }

        interface GeneratedObjectLiteralInterface_10 {
          id: number;
        }
        let obj: GeneratedObjectLiteralInterface_9 = { id: 2 };
        let obj2: GeneratedObjectLiteralInterface_10 = { id: 2 };
        map6.set(obj, "valA");
        map6.set(obj2, "valB");
        console.log("Size equals 2: " + (map6.size === 2));
        expect(map6.size === 2).assertTrue();

        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });

    /**
     * @tc.number    SUB_BASEDATE_MAP_SIZE_0700
     * @tc.name      testMapSize0007
     * @tc.desc      Verify size remains unchanged when inserting duplicate symbol key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapSize0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testMapSize0007";
        console.log(TAG + " start");

        const map7: Map<string, string> = new Map();
        const sym7 = generateUniqueKey("repeatSym");
        map7.set(sym7, "valX");
        map7.set(sym7, "valY");
        console.log("Size remains 1: " + (map7.size === 1));
        expect(map7.size === 1).assertTrue();

        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });

    /**
     * @tc.number    SUB_BASEDATE_MAP_SIZE_0800
     * @tc.name      testMapSize0008
     * @tc.desc      Verify size decreases by 1 after deleting existing string key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapSize0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testMapSize0008";
        console.log(TAG + " start");

        const map8: Map<string, string> = new Map();
        map8.set("delKey", "val").set("keepKey", "val");
        map8.delete("delKey");
        console.log("Size decreases to 1: " + (map8.size === 1));
        expect(map8.size === 1).assertTrue();

        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });

    /**
     * @tc.number    SUB_BASEDATE_MAP_SIZE_0900
     * @tc.name      testMapSize0009
     * @tc.desc      Verify size decreases by 1 after deleting existing object key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapSize0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testMapSize0009";
        console.log(TAG + " start");

        const map9: Map<object | string, string> = new Map();
        interface GeneratedObjectLiteralInterface_bool {
          del: boolean;
        }
        const obj9: GeneratedObjectLiteralInterface_bool = { del: true };
        map9.set(obj9, "val").set("otherKey", "val");
        map9.delete(obj9);
        console.log("Size decreases to 1: " + (map9.size === 1));
        expect(map9.size === 1).assertTrue();

        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });

    /**
     * @tc.number    SUB_BASEDATE_MAP_SIZE_1000
     * @tc.name      testMapSize0010
     * @tc.desc      Verify size remains unchanged after deleting non-existing key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapSize0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testMapSize0010";
        console.log(TAG + " start");

        const map10: Map<string, string> = new Map();
        map10.set("keyA", "val").set("keyB", "val");
        map10.delete("keyC"); // non-existing
        console.log("Size remains 2: " + (map10.size === 2));
        expect(map10.size === 2).assertTrue();

        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });


    /**
     * @tc.number    SUB_BASEDATE_MAP_SIZE_1100
     * @tc.name      testMapSize0011
     * @tc.desc      Verify that deleting 2 existing keys (number + symbol) decreases size by 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapSize0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let TAG = "testMapSize0011";
        console.log(TAG + ' start');

        type Mapkey = string | number ;
        let map11: Map<Mapkey, string> = new Map<Mapkey, string>();
        const sym11 = generateUniqueKey("delSym");
        map11.set(456, "numVal").set(sym11, "symVal").set("keep", "val");
        map11.delete(456);
        map11.delete(sym11);
        console.log("Delete 2 existing keys, size is 1: " + (map11.size === 1));
        expect(map11.size === 1).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_MAP_SIZE_1200
     * @tc.name      testMapSize0012
     * @tc.desc      Verify that deleting 3 keys including one non-existing keeps size correct.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapSize0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let TAG = "testMapSize0012";
        console.log(TAG + ' start');

        let map12: Map<string, string> = new Map<string, string>();
        map12.set("a", "1").set("b", "2").set("c", "3").set("d", "4");
        map12.delete("a");
        map12.delete("b");
        map12.delete("x"); // non-existing
        console.log("Delete with one non-existing, size is 2: " + (map12.size === 2));
        expect(map12.size === 2).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_MAP_SIZE_1300
     * @tc.name      testMapSize0013
     * @tc.desc      Verify that clearing and adding a new key results in size = 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapSize0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let TAG = "testMapSize0013";
        console.log(TAG + ' start');

        let map13: Map<string, string> = new Map<string, string>();
        map13.set("oldKey", "val");
        map13.clear();
        map13.set("newKey", "val");
        console.log("Clear then add new key, size is 1: " + (map13.size === 1));
        expect(map13.size === 1).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_MAP_SIZE_1400
     * @tc.name      testMapSize0014
     * @tc.desc      Verify that updating an existing key’s value does not change size.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapSize0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let TAG = "testMapSize0014";
        console.log(TAG + ' start');

        let map14: Map<string, string> = new Map<string, string>();
        map14.set("updateKey", "oldVal");
        map14.set("updateKey", "newVal");
        console.log("Update value only, size unchanged: " + (map14.size === 1));
        expect(map14.size === 1).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_MAP_SIZE_1500
     * @tc.name      testMapSize0015
     * @tc.desc      Verify that adding an empty string key results in correct size.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapSize0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let TAG = "testMapSize0015";
        console.log(TAG + ' start');

        let map15: Map<string, string> = new Map<string, string>();
        map15.set("", "emptyStrVal");
        console.log("Add empty string key, size is 1: " + (map15.size === 1));
        expect(map15.size === 1).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_MAP_SIZE_1600
     * @tc.name      testMapSize0016
     * @tc.desc      Verify that deleting an empty string key results in size = 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapSize0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let TAG = "testMapSize0016";
        console.log(TAG + ' start');

        let map16: Map<string, string> = new Map<string, string>();
        map16.set("", "val");
        map16.delete("");
        console.log("Delete empty string key, size is 0: " + (map16.size === 0));
        expect(map16.size === 0).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_MAP_SIZE_1700
     * @tc.name      testMapSize0017
     * @tc.desc      Verify that adding an undefined key increases size to 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapSize0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let TAG = "testMapSize0017";
        console.log(TAG + ' start');

        let map17: Map<undefined, string> = new Map<undefined, string>();
        map17.set(undefined, "undefVal");
        console.log("Add undefined key, size is 1: " + (map17.size === 1));
        expect(map17.size === 1).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_MAP_SIZE_1800
     * @tc.name      testMapSize0018
     * @tc.desc      Verify that deleting an undefined key decreases size by 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapSize0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let TAG = "testMapSize0018";
        console.log(TAG + ' start');

        type Mapkey2 = undefined | null ;
        let map18: Map<Mapkey2, string> = new Map<Mapkey2, string>();
        map18.set(undefined, "val").set(null, "val");
        map18.delete(undefined);
        console.log("Delete undefined key, size is 1: " + (map18.size === 1));
        expect(map18.size === 1).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_MAP_SIZE_1900
     * @tc.name      testMapSize0019
     * @tc.desc      Verify that adding a function key increases size to 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapSize0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let TAG = "testMapSize0019";
        console.log(TAG + ' start');

        let map19: Map<Function, string> = new Map<Function, string>();
        const func19 = () => {
        };
        map19.set(func19, "funcVal");
        console.log("Add function key, size is 1: " + (map19.size === 1));
        expect(map19.size === 1).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_MAP_SIZE_2000
     * @tc.name      testMapSize0020
     * @tc.desc      Verify that deleting a function key decreases size to 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapSize0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let TAG = "testMapSize0020";
        console.log(TAG + ' start');

        let map20: Map<Function, string> = new Map<Function, string>();
        const func20 = () => {
        };
        map20.set(func20, "val");
        map20.delete(func20);
        console.log("Delete function key, size is 0: " + (map20.size === 0));
        expect(map20.size === 0).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });


    /**
     * @tc.number    SUB_BASEDATE_MAP_HAS_2200
     * @tc.name      testMapHas0022
     * @tc.desc      Verify that for...of iteration over Map keys outputs object keys in insertion order.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapHas0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let TAG = "testMapHas0022";
        console.log(TAG + " start");

        const map11: Map<object, string> = new Map<object, string>();
        const obj11x: GeneratedObjectLiteralInterface_String = { b: "X" },
          obj11y: GeneratedObjectLiteralInterface_String = { b: "Y" };
        map11.set(obj11y, "valY").set(obj11x, "valX");
        const keys11 = Array.from(map11.keys());
        const order11 = keys11[0] === obj11y && keys11[1] === obj11x;
        console.log("for...of keys object order correct: " + order11);
        expect(order11).assertTrue();

        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });

    /**
     * @tc.number    SUB_BASEDATE_MAP_HAS_2300
     * @tc.name      testMapHas0023
     * @tc.desc      Verify that for...of iteration over Map keys outputs Symbol keys in insertion order.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapHas0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let TAG = "testMapHas0023";
        console.log(TAG + " start");

        const map12: Map<string, string> = new Map<string, string>();
        const sym12m = generateUniqueKey("m"), sym12n = generateUniqueKey("n");
        map12.set(sym12n, "valN").set(sym12m, "valM");
        const keys12 = Array.from(map12.keys());
        const order12 = keys12[0] === sym12n && keys12[1] === sym12m;
        console.log("for...of keys Symbol order correct: " + order12);
        expect(order12).assertTrue();

        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });

    /**
     * @tc.number    SUB_BASEDATE_MAP_HAS_2400
     * @tc.name      testMapHas0024
     * @tc.desc      Verify that for...of iteration over keys in an empty Map outputs nothing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapHas0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let TAG = "testMapHas0024";
        console.log(TAG + " start");

        const map13: Map<null, null> = new Map<null, null>();
        const keys13 = Array.from(map13.keys());
        console.log("for...of keys empty Map outputs nothing: " + (keys13.length === 0));
        expect(keys13.length === 0).assertTrue();

        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });

    /**
     * @tc.number    SUB_BASEDATE_MAP_HAS_2500
     * @tc.name      testMapHas0025
     * @tc.desc      Verify that for...of iteration over keys outputs each key only once when keys are overwritten.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapHas0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let TAG = "testMapHas0025";
        console.log(TAG + " start");

        const map14: Map<string, string> = new Map<string, string>();
        map14.set("repeat", "val1")
          .set("repeat", "val2");
        const keys14 = Array.from(map14.keys());
        const order14 = keys14.length === 1 && keys14[0] === "repeat";
        console.log("for...of keys repeated key outputs once: " + order14);
        expect(order14).assertTrue();

        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });

    /**
     * @tc.number    SUB_BASEDATE_MAP_GET_2900
     * @tc.name      testMapGet0029
     * @tc.desc      Verify that for...of iteration over Map values outputs string values in insertion order.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapGet0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let TAG = "testMapGet0029";
        console.log(TAG + " start");

        const map15: Map<string, string> = new Map<string, string>();
        map15.set("k1", "first")
          .set("k2", "second")
          .set("k3", "third");
        const values15 = Array.from(map15.values());
        const order15 = values15[0] === "first" && values15[1] === "second" && values15[2] === "third";
        console.log("for...of values string order correct: " + order15);
        expect(order15).assertTrue();

        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });

    /**
     * @tc.number    SUB_BASEDATE_MAP_GET_3000
     * @tc.name      testMapGet0030
     * @tc.desc      Verify that for...of iteration over Map values outputs numeric values in insertion order.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapGet0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let TAG = "testMapGet0030";
        console.log(TAG + " start");

        const map16: Map<string, number> = new Map<string, number>();
        map16.set("kA", 50).set("kB", 20).set("kC", 80);
        const values16 = Array.from(map16.values());
        const order16 = values16[0] === 50 && values16[1] === 20 && values16[2] === 80;
        console.log("for...of values number order correct: " + order16);
        expect(order16).assertTrue();

        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });

    /**
     * @tc.number    SUB_BASEDATE_MAP_GET_3100
     * @tc.name      testMapGet0031
     * @tc.desc      Verify that for...of iteration over Map values outputs object values in insertion order.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapGet0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let TAG = "testMapGet0031";
        console.log(TAG + " start");

        const map17: Map<string, object> = new Map<string, object>();
        const val17a: GeneratedObjectLiteralInterface_String = { b: "A" },
          val17b: GeneratedObjectLiteralInterface_String = { b: "B" };
        map17.set("k1", val17b).set("k2", val17a);
        const values17 = Array.from(map17.values());
        const order17 = values17[0] === val17b && values17[1] === val17a;
        console.log("for...of values object order correct: " + order17);
        expect(order17).assertTrue();

        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });

    /**
     * @tc.number    SUB_BASEDATE_MAP_SIZE_2300
     * @tc.name      testMapSize0023
     * @tc.desc      Verify that for...of iteration over Map values outputs the last value when key is overwritten.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapSize0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let TAG = "testMapSize0023";
        console.log(TAG + " start");

        const map18: Map<string, string> = new Map<string, string>();
        map18.set("k", "oldVal").set("k", "newVal");
        const values18 = Array.from(map18.values());
        console.log("for...of values overwritten key outputs latest: " + (values18[0] === "newVal"));
        expect(values18[0] === "newVal").assertTrue();

        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });

    /**
     * @tc.number    SUB_BASEDATE_MAP_SIZE_2200
     * @tc.name      testMapSize0022
     * @tc.desc      Verify that for...of iteration over Map values outputs nothing for an empty Map.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapSize0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let TAG = "testMapSize0022";
        console.log(TAG + " start");

        const map19: Map<number, number> = new Map<number, number>();
        const values19 = Array.from(map19.values());
        console.log("for...of values empty Map outputs nothing: " + (values19.length === 0));
        expect(values19.length === 0).assertTrue();

        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });

    /**
     * @tc.number    SUB_BASEDATE_MAP_SIZE_2100
     * @tc.name      testMapSize0021
     * @tc.desc      Verify that for...of direct iteration over Map outputs key-value pairs in insertion order.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapSize0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let TAG = "testMapSize0021";
        console.log(TAG + " start");

        const map20: Map<string, number> = new Map<string, number>();
        map20.set("a", 1).set("b", 2).set("c", 3);
        const traversal20: string[] = [];
        for (const entry of map20.entries()) {
          const k = entry[0];
          const v = entry[1];
          traversal20.push(k + ":" + v);
        }
        console.log("for...of direct Map iteration order correct: " + (traversal20.join(",") === "a:1,b:2,c:3"));
        expect(traversal20.join(",") === "a:1,b:2,c:3").assertTrue();

        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });

    /**
     * @tc.number    SUB_BASEDATE_MAP_SET_1400
     * @tc.name      testMapSet0014
     * @tc.desc      Verify that forEach() traverses string key-value pairs in insertion order.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapSet0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let TAG = "testMapSet0014";
        console.log(TAG + ' start');

        const map21: Map<string, string> = new Map();
        map21.set("one", "1").set("two", "2").set("three", "3");
        const log21: string[] = [];
        map21.forEach((v, k) => log21.push(`${k}:${v}`));
        console.log("forEach traverses string keys in order: " + (log21.join(",") === "one:1,two:2,three:3"));
        expect(log21.join(",") === "one:1,two:2,three:3").assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_MAP_SET_1500
     * @tc.name      testMapSet0015
     * @tc.desc      Verify that forEach() traverses number key-value pairs in insertion order.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapSet0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let TAG = "testMapSet0015";
        console.log(TAG + ' start');

        const map22: Map<number, string> = new Map();
        map22.set(2, "two").set(1, "one").set(3, "three");
        const log22: string[] = [];
        map22.forEach((v, k) => log22.push(`${k}:${v}`));
        console.log("forEach traverses number keys in order: " + (log22.join(",") === "2:two,1:one,3:three"));
        expect(log22.join(",") === "2:two,1:one,3:three").assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_MAP_SET_1600
     * @tc.name      testMapSet0016
     * @tc.desc      Verify that forEach() traverses object key-value pairs in insertion order.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapSet0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let TAG = "testMapSet0016";
        console.log(TAG + ' start');

        const map23: Map<GeneratedObjectLiteralInterface_number, string> = new Map();
        const obj23a: GeneratedObjectLiteralInterface_number = { z: 10 };
        let obj23b: GeneratedObjectLiteralInterface_number = { z: 20 };
        map23.set(obj23b, "valB").set(obj23a, "valA");
        const log23: string[] = [];
        map23.forEach((value: string, key: GeneratedObjectLiteralInterface_number) => {
          log23.push(key.z + ":" + value);
        });
        console.log("forEach traverses object keys in order: " + (log23.join(",") === "20:valB,10:valA"));
        expect(log23.join(",") === "20:valB,10:valA").assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_MAP_SET_1700
     * @tc.name      testMapSet0017
     * @tc.desc      Verify that forEach() traverses Symbol key-value pairs in insertion order.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapSet0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let TAG = "testMapSet0017";
        console.log(TAG + ' start');

        const map24: Map<string, string> = new Map();
        const sym24x = "x";
        const sym24y = "y";
        map24.set(sym24y, "valY").set(sym24x, "valX");
        const log24: string[] = [];
        map24.forEach((v, k) => log24.push(`${k}:${v}`));
        console.log("forEach traverses Symbol keys in order: " + (log24.join(",") === "y:valY,x:valX"));
        expect(log24.join(",")).assertEqual("y:valY,x:valX");

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_MAP_SET_1800
     * @tc.name      testMapSet0018
     * @tc.desc      Verify that forEach() traverses mixed-type keys in insertion order.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapSet0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let TAG = "testMapSet0018";
        console.log(TAG + ' start');

        type MapKey = null | number | string ;
        const map25: Map<MapKey, string> = new Map();
        const sym25 = generateUniqueKey("sym");
        map25.set(null, "valN").set(123, "valM").set(sym25, "valS");
        const log25: string[] = [];
        map25.forEach((v, k) => log25.push(`${k}:${v}`));
        const expected25 = `null:valN,123:valM,${sym25.toString()}:valS`;
        expect(log25.join(",") === expected25).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_MAP_SET_1900
     * @tc.name      testMapSet0019
     * @tc.desc      Verify that forEach() on an empty Map does not execute the callback.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapSet0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let TAG = "testMapSet0019";
        console.log(TAG + ' start');

        const map26: Map<string, string> = new Map();
        let isCalled26 = false;
        map26.forEach(() => isCalled26 = true);
        console.log("forEach on empty Map executes no callback: " + !isCalled26);
        expect(!isCalled26).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_MAP_SET_2000
     * @tc.name      testMapSet0020
     * @tc.desc      Verify that forEach() callback is executed exactly once for a single key-value pair.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapSet0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let TAG = "testMapSet0020";
        console.log(TAG + ' start');

        const map27: Map<string, string> = new Map();
        map27.set("single", "val");
        let callCount27 = 0;
        map27.forEach(() => callCount27++);
        console.log("forEach single key-value callback executed once: " + (callCount27 === 1));
        expect(callCount27 === 1).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_MAP_SET_2100
     * @tc.name      testMapSet0021
     * @tc.desc      Verify that forEach() callback receives parameters in the correct order (value, key, map).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapSet0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let TAG = "testMapSet0021";
        console.log(TAG + ' start');

        const map28: Map<string, string> = new Map();
        map28.set("testK", "testV");
        let paramCorrect28 = false;
        map28.forEach((v, k, m) => {
          paramCorrect28 = v === "testV" && k === "testK" && m === map28;
        });
        console.log("forEach callback parameters order correct: " + paramCorrect28);
        expect(paramCorrect28).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_MAP_SET_2200
     * @tc.name      testMapSet0022
     * @tc.desc      Verify that forEach() thisArg binding works correctly.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapSet0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let TAG = "testMapSet0022";
        console.log(TAG + ' start');

        const map29: Map<string, string> = new Map();
        map29.set("k", "v");
        const thisArg29: GeneratedObjectLiteralInterface_String = { b: "log:" };
        let thisCorrect29 = false;

        map29.forEach((v: string) => {
          thisCorrect29 = thisArg29.b + v === "log:v";
        }, thisArg29);
        console.log("forEach thisArg binding correct: " + thisCorrect29);
        expect(thisCorrect29).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_MAP_SET_2300
     * @tc.name      testMapSet0023
     * @tc.desc      Verify that forEach() executes callback once for overwritten keys.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapSet0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let TAG = "testMapSet0023";
        console.log(TAG + ' start');

        const map30: Map<string, string> = new Map();
        map30.set("k", "val1").set("k", "val2");
        let callCount30 = 0;
        map30.forEach(() => callCount30++);
        console.log("forEach executes callback once for overwritten key: " + (callCount30 === 1));
        expect(callCount30 === 1).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_MAP_SET_2400
     * @tc.name      testMapSet0024
     * @tc.desc      Verify that for...of iteration and forEach() maintain the same traversal order.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapSet0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let TAG = "testMapSet0024";
        console.log(TAG + ' start');

        const map31: Map<string, string> = new Map();
        map31.set("p", "valP").set("q", "valQ").set("r", "valR");
        const forOfOrder31 = Array.from(map31.keys());
        const forEachOrder31: string[] = [];
        map31.forEach((v, k) => forEachOrder31.push(k));
        console.log("forOfOrder31:", JSON.stringify(forOfOrder31));
        console.log("forEachOrder31:", JSON.stringify(forEachOrder31));
        for (let i: number = 0; i < 3; i++) {
          console.log('valuek:' + forOfOrder31 + " : valuei" + forEachOrder31[i]);
        }
        const isSame = forOfOrder31.every((k, i) => {
          return k === forEachOrder31[i];
        }
        );
        console.log("for...of and forEach() traversal order is consistent: " + isSame);
        expect(isSame).assertEqual(true);

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_MAP_DELETE_1900
     * @tc.name      testMapDelete0019
     * @tc.desc      Verify that after deleting a middle key, for...of entries traversal maintains correct order.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapDelete0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let TAG = "testMapDelete0019";
        console.log(TAG + ' start');

        const map32: Map<string, string> = new Map();
        map32.set("1", "v1").set("2", "v2").set("3", "v3");
        map32.delete("2");
        const entries32 = Array.from(map32.entries());
        entries32.forEach((entry) => {
          console.log(`Key: ${entry[0]}, Value: ${JSON.stringify(entry[1])}`);
        });
        const order32 = entries32[0][0] === "1" && entries32[1][0] === "3";
        console.log("after deleting middle key, for...of entries order correct: " + order32);
        expect(order32).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_MAP_DELETE_2000
     * @tc.name      testMapDelete0020
     * @tc.desc      Verify that after deleting the last key, forEach() maintains correct remaining key order.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapDelete0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let TAG = "testMapDelete0020";
        console.log(TAG + ' start');

        const map33: Map<string, string> = new Map();
        map33.set("a", "va").set("b", "vb").set("c", "vc");
        map33.delete("c");
        const log33: string[] = [];
        map33.forEach((v, k) => log33.push(k));
        console.log("after deleting last key, forEach() order correct: " + (log33.join(",") === "a,b"));
        expect(log33.join(",") === "a,b").assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_MAP_SET_2500
     * @tc.name      testMapSet0025
     * @tc.desc      Verify that after adding a new key, for...of keys traversal includes the new key in correct order.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapSet0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let TAG = "testMapSet0025";
        console.log(TAG + ' start');

        const map34: Map<string, string> = new Map();
        map34.set("x", "vx").set("y", "vy");
        map34.set("z", "vz"); // new key
        const keys34 = Array.from(map34.keys());
        console.log("after adding new key, for...of keys traversal order correct: " + (keys34.join(",") === "x,y,z"));
        expect(keys34.join(",") === "x,y,z").assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_MAP_SET_2600
     * @tc.name      testMapSet0026
     * @tc.desc      Verify that after adding a new key, forEach() traversal includes the new key in correct order.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapSet0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let TAG = "testMapSet0026";
        console.log(TAG + ' start');

        const map35: Map<string, string> = new Map();
        map35.set("m", "vm").set("n", "vn");
        map35.set("o", "vo"); // new key
        const log35: string[] = [];
        map35.forEach((v, k) => log35.push(k));
        console.log("after adding new key, forEach() traversal order correct: " + (log35.join(",") === "m,n,o"));
        expect(log35.join(",") === "m,n,o").assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_MAP_GET_3600
     * @tc.name      testMapGet0036
     * @tc.desc      Verify that nested object values are iterated in insertion order using for...of values.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapGet0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let TAG = "testMapGet0036";
        console.log(TAG + ' start');

        const map36: Map<string, object> = new Map();

        interface InnerObject {
          b?: number;
          d?: number;
        }

        interface NestedObject {
          a?: InnerObject;
          c?: InnerObject;
        }

        const nested36a: NestedObject = { a: { b: 1 } } as NestedObject;
        const nested36b: NestedObject = { c: { d: 2 } } as NestedObject;
        map36.set("k1", nested36b).set("k2", nested36a);
        const values36 = Array.from(map36.values());
        const order36 = values36[0] === nested36b && values36[1] === nested36a;
        console.log("nested object values for...of order correct: " + order36);
        expect(order36).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_MAP_GET_3700
     * @tc.name      testMapGet0037
     * @tc.desc      Verify that nested object values are traversed in insertion order using forEach().
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapGet0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let TAG = "testMapGet0037";
        console.log(TAG + ' start');

        const map37: Map<string, object> = new Map();

        interface InnerObject37 {
          y?: number;
          w?: number;
        }

        interface NestedObject {
          x?: InnerObject37;
          z?: InnerObject37;
        }

        const nested37x: NestedObject = { x: { y: 3 } }, nested37y: NestedObject = { z: { w: 4 } };
        map37.set("kA", nested37y).set("kB", nested37x);
        const log37: boolean[] = [];
        map37.forEach((v) => log37.push(v === nested37y));
        console.log("nested object values forEach order correct: " + (log37[0] && !log37[1]));
        expect(log37[0] && !log37[1]).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_MAP_GET_3800
     * @tc.name      testMapGet0038
     * @tc.desc      Verify that function keys are iterated in insertion order using for...of entries.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapGet0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let TAG = "testMapGet0038";
        console.log(TAG + ' start');

        const map38: Map<Function, string> = new Map();
        const func38a = () => "a", func38b = () => "b";
        map38.set(func38b, "vb").set(func38a, "va");
        const entries38 = Array.from(map38.entries());
        const order38 = entries38[0][0] === func38b && entries38[1][0] === func38a;
        console.log("function keys for...of entries order correct: " + order38);
        expect(order38).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_MAP_GET_3900
     * @tc.name      testMapGet0039
     * @tc.desc      Verify that function keys are traversed in insertion order using forEach().
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapGet0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let TAG = "testMapGet0039";
        console.log(TAG + ' start');

        const map39: Map<Function, string> = new Map();
        const func39m = () => "m", func39n = () => "n";
        map39.set(func39n, "vn").set(func39m, "vm");
        const log39: boolean[] = [];
        map39.forEach((v, k) => log39.push(k === func39n));
        console.log("function keys forEach order correct: " + (log39[0] && !log39[1]));
        expect(log39[0] && !log39[1]).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_MAP_GET_4000
     * @tc.name      testMapGet0040
     * @tc.desc      Verify that multiple traversals maintain the same order.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapGet0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let TAG = "testMapGet0040";
        console.log(TAG + ' start');

        const map40: Map<string, string> = new Map();
        map40.set("1", "v1").set("2", "v2").set("3", "v3");
        const firstOrder = Array.from(map40.entries());
        const secondOrder = Array.from(map40.entries());
        const isSameOrder = firstOrder.every((entry, i) => {
          const entry2 = secondOrder[i];
          return entry[0] === entry2[0] && entry[1] === entry2[1];
        });
        console.log("multiple traversals maintain same order: " + isSameOrder);
        expect(isSameOrder).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_MAP_SET_2800
     * @tc.name      testMapSet0028
     * @tc.desc      Verify that Map entries with null and undefined keys maintain insertion order and overriding undefined works correctly.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapSet0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let TAG = "testMapSet0028";
        console.log(TAG + ' start');

        const map5: Map<undefined | null, string> = new Map<undefined | null, string>();
        map5.set(undefined, "valU").set(null, "valN").set(undefined, "valU2"); // override undefined
        const entries5 = Array.from(map5.entries());
        const order5 = entries5[0][0] === undefined && entries5[1][0] === null;
        console.log("for...of entries null/undefined key order correct: " + order5);
        expect(order5).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_MAP_SET_2700
     * @tc.name      testMapSet0027
     * @tc.desc      Verify that Map entries with mixed key types maintain insertion order in for...of iteration.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapSet0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let TAG = "testMapSet0027";
        console.log(TAG + ' start');

        type MapKey = string | obj6Inter | number;
        const map6: Map<MapKey, string> = new Map<MapKey, string>();
        const sym6 = generateUniqueKey("sym");

        interface obj6Inter {
          id: number
        }

        const obj6: obj6Inter = { id: 4 };
        map6.set("str", "valS").set(123, "valN").set(sym6, "valSym").set(obj6, "valO");
        const entries6 = Array.from(map6.entries());
        const order6 = entries6[0][0] === "str" && entries6[1][0] === 123 &&
          entries6[2][0] === sym6 && (entries6[3][0] as obj6Inter).id === 4;
        console.log("for...of entries mixed key types order correct: " + order6);
        expect(order6).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_MAP_GET_4100
     * @tc.name      testMapGet0041
     * @tc.desc      Verify that iterating over an empty Map using for...of entries results in no output.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapGet0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let TAG = "testMapGet0041";
        console.log(TAG + ' start');

        const map7: Map<number, number> = new Map<number, number>();
        const entries7 = Array.from(map7.entries());
        console.log("for...of entries empty Map no output: " + (entries7.length === 0));
        expect(entries7.length === 0).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_MAP_GET_4200
     * @tc.name      testMapGet0042
     * @tc.desc      Verify that a Map with a single key-value pair outputs correctly in for...of entries iteration.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapGet0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let TAG = "testMapGet0042";
        console.log(TAG + ' start');

        const map8: Map<string, string> = new Map<string, string>();
        map8.set("onlyKey", "onlyVal");
        const entries8 = Array.from(map8.entries());
        const hasOnly = entries8.length === 1 && entries8[0][0] === "onlyKey" && entries8[0][1] === "onlyVal";
        console.log("for...of entries single key-value correct: " + hasOnly);
        expect(hasOnly).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_MAP_KEYS_2400
     * @tc.name      testMapKeys0024
     * @tc.desc      Verify that iterating over Map keys using for...of maintains insertion order for string keys.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapKeys0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let TAG = "testMapKeys0024";
        console.log(TAG + ' start');

        const map9: Map<string, string> = new Map<string, string>();
        map9.set("x", "valX").set("y", "valY").set("z", "valZ");
        const keys9 = Array.from(map9.keys());
        const order9 = keys9[0] === "x" && keys9[1] === "y" && keys9[2] === "z";
        console.log("for...of keys string key order correct: " + order9);
        expect(order9).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_MAP_KEYS_2500
     * @tc.name      testMapKeys0025
     * @tc.desc      Verify that iterating over Map keys using for...of maintains insertion order for numeric keys.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapKeys0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let TAG = "testMapKeys0025";
        console.log(TAG + ' start');

        const map10: Map<number, string> = new Map<number, string>();
        map10.set(10, "val10").set(5, "val5").set(15, "val15");
        const keys10 = Array.from(map10.keys());
        const order10 = keys10[0] === 10 && keys10[1] === 5 && keys10[2] === 15;
        console.log("for...of keys numeric key order correct: " + order10);
        expect(order10).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

  })
}
