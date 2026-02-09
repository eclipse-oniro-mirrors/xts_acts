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


function generateUniqueKey(description: string): string {
  let entropy: number[] = [
    Math.floor(Math.random() * 0xffffffff),
    Math.floor(Math.random() * 0xffffffff)
  ];
  return `${description}_${Date.now()}_${entropy[0].toString(36)}${entropy[1].toString(36)}}`;
}

export default function keyedCollections_08Test() {
  describe('keyedCollections_08Test', () => {
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
     * @tc.number    SUB_BASEDATA_MAP_SET_0100
     * @tc.name      testMapSet0001
     * @tc.desc      Verify that a string key can be set into a Map and detected by has().
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapSet0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let TAG = "testMapSet0001";
      console.log(TAG + ' start');

      let map1: Map<string, string> = new Map<string, string>();
      map1.set("username", "Alice");


      expect(map1.has("username")).assertTrue();

      console.log(TAG + ' done');
      done();
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_BASEDATA_MAP_HAS_0100
     * @tc.name      testMapHas0001
     * @tc.desc      Verify that a string key previously set in a Map can be detected using has().
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapHas0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let TAG = "testMapHas0001";
      console.log(TAG + ' start');

        let map2: Map<string, number> = new Map<string, number>();
        map2.set("age", 25);


        expect(map2.has("age")).assertTrue();

      console.log(TAG + ' done');
      done();
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_BASEDATA_MAP_GET_0100
     * @tc.name      testMapGet0001
     * @tc.desc      Verify that a string key can be retrieved using get() and the value matches the expected result.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapGet0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let TAG = "testMapGet0001";
      console.log(TAG + ' start');

        let map3: Map<string, string> = new Map<string, string>();
        map3.set("city", "Beijing");


        expect(map3.get("city") === "Beijing").assertTrue();

      console.log(TAG + ' done');
      done();
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_BASEDATA_MAP_DELETE_0100
     * @tc.name      testMapDelete0001
     * @tc.desc      Verify that a string key can be deleted from a Map successfully.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapDelete0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let TAG = "testMapDelete0001";
      console.log(TAG + ' start');

        let map4: Map<string, string> = new Map<string, string>();
        map4.set("gender", "female");

        expect(map4.delete("gender")).assertTrue();



      console.log(TAG + ' done');
      done();
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_BASEDATA_MAP_HAS_0200
     * @tc.name      testMapHas0002
     * @tc.desc      Verify that after deleting a string key, has() returns false.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapHas0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let TAG = "testMapHas0002";
      console.log(TAG + ' start');

        let map5: Map<string, string> = new Map<string, string>();
        map5.set("email", "alice@test.com");
        map5.delete("email");


        expect(!map5.has("email")).assertTrue();

      console.log(TAG + ' done');
      done();
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_BASEDATA_MAP_GET_0200
     * @tc.name      testMapGet0002
     * @tc.desc      Verify that getting a value with a string key not set returns undefined.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapGet0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let TAG = "testMapGet0002";
      console.log(TAG + ' start');

        let map6: Map<string, string> = new Map<string, string>();


        expect(map6.get("unsetStrKey") === undefined).assertTrue();

      console.log(TAG + ' done');
      done();
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_BASEDATA_MAP_DELETE_0200
     * @tc.name      testMapDelete0002
     * @tc.desc      Verify that deleting a string key not set in a Map returns false.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapDelete0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let TAG = "testMapDelete0002";
      console.log(TAG + ' start');

        let map7: Map<string, string> = new Map<string, string>();


        expect(!map7.delete("unsetStrKey2")).assertTrue();

      console.log(TAG + ' done');
      done();
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_BASEDATA_MAP_GET_0300
     * @tc.name      testMapGet0003
     * @tc.desc      Verify that after deleting a string key, getting it returns undefined.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapGet0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let TAG = "testMapGet0003";
      console.log(TAG + ' start');

        let map8: Map<string, string> = new Map<string, string>();
        map8.set("phone", "123456");
        map8.delete("phone");


        expect(map8.get("phone") === undefined).assertTrue();

      console.log(TAG + ' done');
      done();
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_BASEDATA_MAP_SET_0200
     * @tc.name      testMapSet0002
     * @tc.desc      Verify that a number key can be set into a Map and detected by has().
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapSet0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let TAG = "testMapSet0002";
      console.log(TAG + ' start');

        let map9: Map<number, string> = new Map<number, string>();
        map9.set(100, "score");


        expect(map9.has(100)).assertTrue();

      console.log(TAG + ' done');
      done();
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_BASEDATA_MAP_HAS_0300
     * @tc.name      testMapHas0003
     * @tc.desc      Verify that a number key previously set in a Map can be detected using has().
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapHas0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let TAG = "testMapHas0003";
      console.log(TAG + ' start');

        let map10: Map<number, string> = new Map<number, string>();
        map10.set(-50, "temperature");


        expect(map10.has(-50)).assertTrue();

      console.log(TAG + ' done');
      done();
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_BASEDATA_MAP_GET_0400
     * @tc.name      testMapGet0004
     * @tc.desc      Verify that a number key can be retrieved using get() and the value matches the expected result.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapGet0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let TAG = "testMapGet0004";
      console.log(TAG + ' start');

        let map11: Map<number, string> = new Map<number, string>();
        map11.set(3.14, "pi");


        expect(map11.get(3.14) === "pi").assertTrue();

      console.log(TAG + ' done');
      done();
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_BASEDATA_MAP_DELETE_0300
     * @tc.name      testMapDelete0003
     * @tc.desc      Verify that a number key can be deleted from a Map successfully.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapDelete0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let TAG = "testMapDelete0003";
      console.log(TAG + ' start');

        let map12: Map<number, string> = new Map<number, string>();
        map12.set(0, "zero");

        expect(map12.delete(0)).assertTrue();



      console.log(TAG + ' done');
      done();
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_BASEDATA_MAP_HAS_0400
     * @tc.name      testMapHas0004
     * @tc.desc      Verify that after deleting a number key, has() returns false.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapHas0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let TAG = "testMapHas0004";
      console.log(TAG + ' start');

        let map13: Map<number, string> = new Map<number, string>();
        map13.set(Infinity, "infinite");
        map13.delete(Infinity);


        expect(!map13.has(Infinity)).assertTrue();

      console.log(TAG + ' done');
      done();
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_BASEDATA_MAP_GET_0500
     * @tc.name      testMapGet0005
     * @tc.desc      Verify that getting a value with a number key not set returns undefined.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapGet0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let TAG = "testMapGet0005";
      console.log(TAG + ' start');

        let map14: Map<number, string> = new Map<number, string>();


        expect(map14.get(999) === undefined).assertTrue();

      console.log(TAG + ' done');
      done();
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_BASEDATA_MAP_DELETE_0400
     * @tc.name      testMapDelete0004
     * @tc.desc      Verify that deleting a number key not set in a Map returns false.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapDelete0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let TAG = "testMapDelete0004";
      console.log(TAG + ' start');

        let map15: Map<number, string> = new Map<number, string>();


        expect(!map15.delete(-1000)).assertTrue();

      console.log(TAG + ' done');
      done();
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_BASEDATA_MAP_GET_0600
     * @tc.name      testMapGet0006
     * @tc.desc      Verify that after deleting a number key, get() returns undefined.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapGet0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let TAG = "testMapGet0006";
      console.log(TAG + ' start');

        let map16: Map<number, string> = new Map<number, string>();
        map16.set(NaN, "not-a-number");
        map16.delete(NaN);


        expect(map16.get(NaN) === undefined).assertTrue();

      console.log(TAG + ' done');
      done();
      console.log(TAG + ' end');
    });



    /**
     * @tc.number    SUB_BASEDATA_MAP_SET_0300
     * @tc.name      testMapSet0003
     * @tc.desc      Verify that an object key can be set into a Map and detected by has().
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapSet0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let TAG = "testMapSet0003";
      console.log(TAG + ' start');

        let map17: Map<object, string> = new Map<object, string>();

        interface GeneratedObjectLiteralInterface_5 {
          id: number;
        }

        const obj17: GeneratedObjectLiteralInterface_5 = { id: 1 };
        map17.set(obj17, "user1");


        expect(map17.has(obj17)).assertTrue();

      console.log(TAG + ' done');
      done();
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_BASEDATA_MAP_HAS_0500
     * @tc.name      testMapHas0005
     * @tc.desc      Verify that an object key previously set in a Map can be detected using has().
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapHas0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let TAG = "testMapHas0005";
      console.log(TAG + ' start');

        let map18: Map<object, string> = new Map<object, string>();

        interface GeneratedObjectLiteralInterface_6 {
          name: string;
        }
        const obj18: GeneratedObjectLiteralInterface_6 = { name: "Bob" };
        map18.set(obj18, "profile");


        expect(map18.has(obj18)).assertTrue();

      console.log(TAG + ' done');
      done();
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_BASEDATA_MAP_GET_0700
     * @tc.name      testMapGet0007
     * @tc.desc      Verify that an object key can be retrieved using get() and the value matches the expected result.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapGet0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let TAG = "testMapGet0007";
      console.log(TAG + ' start');

        let map19: Map<object, string> = new Map<object, string>();

        interface GeneratedObjectLiteralInterface_7 {
          role: string;
        }
        const obj19: GeneratedObjectLiteralInterface_7 = { role: "admin" };
        map19.set(obj19, "permission-all");


        expect(map19.get(obj19) === "permission-all").assertTrue();

      console.log(TAG + ' done');
      done();
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_BASEDATA_MAP_DELETE_0500
     * @tc.name      testMapDelete0005
     * @tc.desc      Verify that an object key can be deleted from a Map successfully.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapDelete0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let TAG = "testMapDelete0005";
      console.log(TAG + ' start');

        let map20: Map<object, string> = new Map<object, string>();

        interface GeneratedObjectLiteralInterface_8 {
          project: string;
        }
        const obj20: GeneratedObjectLiteralInterface_8 = { project: "test" };
        map20.set(obj20, "active");

        expect(map20.delete(obj20)).assertTrue();



      console.log(TAG + ' done');
      done();
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_BASEDATA_MAP_HAS_0600
     * @tc.name      testMapHas0006
     * @tc.desc      Verify that after deleting an object key, has() returns false.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapHas0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let TAG = "testMapHas0006";
      console.log(TAG + ' start');

        let map21: Map<object, string> = new Map<object, string>();


        interface GeneratedObjectLiteralInterface_9 {
          task: string;
        }
        const obj21: GeneratedObjectLiteralInterface_9 = { task: "deploy" };
        map21.set(obj21, "pending");
        map21.delete(obj21);


        expect(!map21.has(obj21)).assertTrue();

      console.log(TAG + ' done');
      done();
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_BASEDATA_MAP_GET_0800
     * @tc.name      testMapGet0008
     * @tc.desc      Verify that getting a different object instance returns undefined even if content is same.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapGet0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let TAG = "testMapGet0008";
      console.log(TAG + ' start');

        let map22: Map<object, string> = new Map<object, string>();

        interface GeneratedObjectLiteralInterface_10 {
          id: number;
        }
        const obj22a: GeneratedObjectLiteralInterface_10 = { id: 2 };
        map22.set(obj22a, "user2");

        interface GeneratedObjectLiteralInterface_11 {
          id: number;
        }

        const obj22b: GeneratedObjectLiteralInterface_11 = { id: 2 };


        expect(map22.get(obj22b) === undefined).assertTrue();

      console.log(TAG + ' done');
      done();
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_BASEDATA_MAP_DELETE_0600
     * @tc.name      testMapDelete0006
     * @tc.desc      Verify that deleting an object key not set returns false.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapDelete0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let TAG = "testMapDelete0006";
      console.log(TAG + ' start');

        let map23: Map<object, string> = new Map<object, string>();

        interface GeneratedObjectLiteralInterface_12 {
          name: string;
        }

        const obj23: GeneratedObjectLiteralInterface_12 = { name: "Charlie" };


        expect(!map23.delete(obj23)).assertTrue();

      console.log(TAG + ' done');
      done();
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_BASEDATA_MAP_GET_0900
     * @tc.name      testMapGet0009
     * @tc.desc      Verify that after deleting an object key, get() returns undefined.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapGet0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let TAG = "testMapGet0009";
      console.log(TAG + ' start');

        let map24: Map<object, string> = new Map<object, string>();
        interface GeneratedObjectLiteralInterface_13 {
          age: number;
        }
        const obj24: GeneratedObjectLiteralInterface_13 = { age: 30 };
        map24.set(obj24, "adult");
        map24.delete(obj24);


        expect(map24.get(obj24) === undefined).assertTrue();

      console.log(TAG + ' done');
      done();
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_BASEDATA_MAP_SET_0400
     * @tc.name      testMapSet0004
     * @tc.desc      Verify that a Symbol key can be set into a Map and detected by has().
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapSet0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let TAG = "testMapSet0004";
      console.log(TAG + ' start');

        let a = generateUniqueKey("uniqueKey")
        const map25 = new Map<string, string>();
        map25.set(a, "symbolValue");


        expect(map25.has(a)).assertTrue();

      console.log(TAG + ' done');
      done();
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_BASEDATA_MAP_HAS_0700
     * @tc.name      testMapHas0007
     * @tc.desc      Verify that a Symbol key previously set in a Map can be detected using has().
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapHas0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let TAG = "testMapHas0007";
      console.log(TAG + ' start');

        const GLOBAL_KEY = generateUniqueKey("$unique_key_sharedKey");
        let map26: Map<string, string> = new Map<string, string>();

        map26.set(GLOBAL_KEY, "sharedValue");



        expect(map26.has(GLOBAL_KEY)).assertTrue();

      console.log(TAG + ' done');
      done();
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_BASEDATA_MAP_GET_1000
     * @tc.name      testMapGet0010
     * @tc.desc      Verify that a Symbol key can be retrieved using get() and the value matches the expected result.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapGet0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let TAG = "testMapGet0010";
      console.log(TAG + ' start');

        const ITERATOR_KEY = generateUniqueKey("$iterator");

        let map27: Map<string, string> = new Map<string, string>();
        map27.set(ITERATOR_KEY, "iteratorFunc");


        expect(map27.get(ITERATOR_KEY) === "iteratorFunc").assertTrue();

      console.log(TAG + ' done');
      done();
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_BASEDATA_MAP_DELETE_0800
     * @tc.name      testMapDelete0008
     * @tc.desc      Verify that a Symbol key can be deleted successfully from Map.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapDelete0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let TAG = "testMapDelete0008";
      console.log(TAG + ' start');

        const TEMP_KEY = generateUniqueKey("tempKey");
        let map28: Map<string, string> = new Map<string, string>();

        map28.set(TEMP_KEY, "tempValue");

        expect(map28.delete(TEMP_KEY)).assertTrue();



      console.log(TAG + ' done');
      done();
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_BASEDATA_MAP_HAS_0800
     * @tc.name      testMapHas0008
     * @tc.desc      Verify that after deleting a Symbol key, has() returns false.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapHas0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let TAG = "testMapHas0008";
      console.log(TAG + ' start');

        const DELETE_KEY = generateUniqueKey("deleteKey");
        let map29: Map<string, string> = new Map<string, string>();

        map29.set(DELETE_KEY, "deleteValue");
        map29.delete(DELETE_KEY);


        expect(!map29.has(DELETE_KEY)).assertTrue();

      console.log(TAG + ' done');
      done();
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_BASEDATA_MAP_GET_1100
     * @tc.name      testMapGet0011
     * @tc.desc      Verify that getting a different Symbol instance returns undefined even if description is same.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapGet0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let TAG = "testMapGet0011";
      console.log(TAG + ' start');

        let map30: Map<string, string> = new Map<string, string>();
        const sym30a = generateUniqueKey("a");
        map30.set(sym30a, "aValue");
        const sym30b = generateUniqueKey("a");


        expect(map30.get(sym30b) === undefined).assertTrue();

      console.log(TAG + ' done');
      done();
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_BASEDATA_MAP_GET_1200
     * @tc.name      testMapGet0012
     * @tc.desc      Verify that getting a Symbol key not set returns undefined.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapGet0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let TAG = "testMapGet0012";
      console.log(TAG + ' start');

        let map31: Map<string, string> = new Map<string, string>();
        const sym31 = generateUniqueKey("unsetSym");


        expect(map31.get(sym31) === undefined).assertTrue();

      console.log(TAG + ' done');
      done();
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_BASEDATA_MAP_GET_1300
     * @tc.name      testMapGet0013
     * @tc.desc      Verify that after deleting a Symbol key, get() returns undefined.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapGet0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let TAG = "testMapGet0013";
      console.log(TAG + ' start');

        let map32: Map<string, string> = new Map<string, string>();
        const sym32 = generateUniqueKey("delSym");
        map32.set(sym32, "delVal");
        map32.delete(sym32);


        expect(map32.get(sym32) === undefined).assertTrue();

      console.log(TAG + ' done');
      done();
      console.log(TAG + ' end');
    });


    /**
     * @tc.number    SUB_BASEDATA_MAP_SET_0500
     * @tc.name      testMapSet0005
     * @tc.desc      Verify that null can be used as a key and detected by has().
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapSet0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let TAG = "testMapSet0005";
      console.log(TAG + ' start');

        let map33: Map<null, string> = new Map<null, string>();
        map33.set(null, "nullValue");


        expect(map33.has(null)).assertTrue();

      console.log(TAG + ' done');
      done();
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_BASEDATA_MAP_HAS_0900
     * @tc.name      testMapHas0009
     * @tc.desc      Verify that null key previously set in Map can be detected using has().
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapHas0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let TAG = "testMapHas0009";
      console.log(TAG + ' start');

        let map34: Map<null, string> = new Map<null, string>();
        map34.set(null, "emptyRef");


        expect(map34.has(null)).assertTrue();

      console.log(TAG + ' done');
      done();
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_BASEDATA_MAP_GET_1400
     * @tc.name      testMapGet0014
     * @tc.desc      Verify that getting a null key returns the correct value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapGet0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let TAG = "testMapGet0014";
      console.log(TAG + ' start');

        let map35: Map<null, string> = new Map<null, string>();
        map35.set(null, "nullData");


        expect(map35.get(null) === "nullData").assertTrue();

      console.log(TAG + ' done');
      done();
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_BASEDATA_MAP_DELETE_0900
     * @tc.name      testMapDelete0009
     * @tc.desc      Verify that null key can be deleted successfully from Map.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapDelete0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let TAG = "testMapDelete0009";
      console.log(TAG + ' start');

        let map36: Map<null, string> = new Map<null, string>();
        map36.set(null, "toDelete");

        expect(map36.delete(null)).assertTrue();



      console.log(TAG + ' done');
      done();
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_BASEDATA_MAP_HAS_1000
     * @tc.name      testMapHas0010
     * @tc.desc      Verify that after deleting null key, has() returns false.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapHas0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let TAG = "testMapHas0010";
      console.log(TAG + ' start');

        let map37: Map<null, string> = new Map<null, string>();
        map37.set(null, "deletedNull");
        map37.delete(null);


        expect(!map37.has(null)).assertTrue();

      console.log(TAG + ' done');
      done();
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_BASEDATA_MAP_GET_1500
     * @tc.name      testMapGet0015
     * @tc.desc      Verify that getting a null key not set returns undefined.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapGet0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let TAG = "testMapGet0015";
      console.log(TAG + ' start');

        let map38: Map<null, string> = new Map<null, string>();


        expect(map38.get(null) === undefined).assertTrue();

      console.log(TAG + ' done');
      done();
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_BASEDATA_MAP_SET_0600
     * @tc.name      testMapSet0006
     * @tc.desc      Verify that undefined can be used as a key and detected by has().
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapSet0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let TAG = "testMapSet0006";
      console.log(TAG + ' start');

        let map39: Map<undefined, string> = new Map<undefined, string>();
        map39.set(undefined, "undefinedValue");


        expect(map39.has(undefined)).assertTrue();

      console.log(TAG + ' done');
      done();
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_BASEDATA_MAP_HAS_1100
     * @tc.name      testMapHas0011
     * @tc.desc      Verify that undefined key previously set in Map can be detected using has().
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapHas0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let TAG = "testMapHas0011";
      console.log(TAG + ' start');

        let map40: Map<undefined, string> = new Map<undefined, string>();
        map40.set(undefined, "noValue");


        expect(map40.has(undefined)).assertTrue();

      console.log(TAG + ' done');
      done();
      console.log(TAG + ' end');
    });



    /**
     * @tc.number    SUB_BASEDATA_MAP_GET_1600
     * @tc.name      testMapGet0016
     * @tc.desc      Verify that getting an undefined key returns the correct value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapGet0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let TAG = "testMapGet0016";
      console.log(TAG + ' start');

        let map41: Map<undefined, string> = new Map<undefined, string>();
        map41.set(undefined, "emptyValue");


        expect(map41.get(undefined) === "emptyValue").assertTrue();

      console.log(TAG + ' done');
      done();
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_BASEDATA_MAP_DELETE_1000
     * @tc.name      testMapDelete0010
     * @tc.desc      Verify that undefined key can be deleted successfully from Map.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapDelete0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let TAG = "testMapDelete0010";
      console.log(TAG + ' start');

        let map42: Map<undefined, string> = new Map<undefined, string>();
        map42.set(undefined, "delUndefined");

        expect(map42.delete(undefined)).assertTrue();



      console.log(TAG + ' done');
      done();
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_BASEDATA_MAP_HAS_1200
     * @tc.name      testMapHas0012
     * @tc.desc      Verify that after deleting undefined key, has() returns false.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapHas0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let TAG = "testMapHas0012";
      console.log(TAG + ' start');

        let map43: Map<undefined, string> = new Map<undefined, string>();
        map43.set(undefined, "deletedUndefined");
        map43.delete(undefined);


        expect(!map43.has(undefined)).assertTrue();

      console.log(TAG + ' done');
      done();
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_BASEDATA_MAP_GET_1700
     * @tc.name      testMapGet0017
     * @tc.desc      Verify that getting an undefined key not set returns undefined.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapGet0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let TAG = "testMapGet0017";
      console.log(TAG + ' start');

        let map44: Map<undefined, string> = new Map<undefined, string>();


        expect(map44.get(undefined) === undefined).assertTrue();

      console.log(TAG + ' done');
      done();
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_BASEDATA_MAP_SET_0700
     * @tc.name      testMapSet0007
     * @tc.desc      Verify that boolean key true can be set successfully.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapSet0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let TAG = "testMapSet0007";
      console.log(TAG + ' start');

        let map45: Map<boolean, string> = new Map<boolean, string>();
        map45.set(true, "isActive");


        expect(map45.has(true)).assertTrue();

      console.log(TAG + ' done');
      done();
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_BASEDATA_MAP_HAS_1300
     * @tc.name      testMapHas0013
     * @tc.desc      Verify that boolean key true exists in the Map after set.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapHas0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let TAG = "testMapHas0013";
      console.log(TAG + ' start');

        let map46: Map<boolean, string> = new Map<boolean, string>();
        map46.set(true, "yes");


        expect(map46.has(true)).assertTrue();

      console.log(TAG + ' done');
      done();
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_BASEDATA_MAP_GET_1800
     * @tc.name      testMapGet0018
     * @tc.desc      Verify that getting boolean key true returns the correct value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapGet0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let TAG = "testMapGet0018";
      console.log(TAG + ' start');

        let map47: Map<boolean, string> = new Map<boolean, string>();
        map47.set(true, "enabled");


        expect(map47.get(true) === "enabled").assertTrue();

      console.log(TAG + ' done');
      done();
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_BASEDATA_MAP_DELETE_1100
     * @tc.name      testMapDelete0011
     * @tc.desc      Verify that deleting boolean key true works correctly.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapDelete0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let TAG = "testMapDelete0011";
      console.log(TAG + ' start');

        let map48: Map<boolean, string> = new Map<boolean, string>();
        map48.set(true, "toRemoveTrue");

        expect(map48.delete(true)).assertTrue();



      console.log(TAG + ' done');
      done();
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_BASEDATA_MAP_HAS_1400
     * @tc.name      testMapHas0014
     * @tc.desc      Verify that after deleting boolean key true, has() returns false.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapHas0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let TAG = "testMapHas0014";
      console.log(TAG + ' start');

        let map49: Map<boolean, string> = new Map<boolean, string>();
        map49.set(true, "deletedTrue");
        map49.delete(true);


        expect(!map49.has(true)).assertTrue();

      console.log(TAG + ' done');
      done();
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_BASEDATA_MAP_SET_0800
     * @tc.name      testMapSet0008
     * @tc.desc      Verify that boolean key false can be set successfully.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapSet0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let TAG = "testMapSet0008";
      console.log(TAG + ' start');

        let map50: Map<boolean, string> = new Map<boolean, string>();
        map50.set(false, "isInactive");


        expect(map50.has(false)).assertTrue();

      console.log(TAG + ' done');
      done();
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_BASEDATA_MAP_HAS_1500
     * @tc.name      testMapHas0015
     * @tc.desc      Verify that boolean key false exists in the Map after set.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapHas0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let TAG = "testMapHas0015";
      console.log(TAG + ' start');

        let map51: Map<boolean, string> = new Map<boolean, string>();
        map51.set(false, "no");


        expect(map51.has(false)).assertTrue();

      console.log(TAG + ' done');
      done();
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_BASEDATA_MAP_GET_1900
     * @tc.name      testMapGet0019
     * @tc.desc      Verify that getting boolean key false returns the correct value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapGet0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let TAG = "testMapGet0019";
      console.log(TAG + ' start');

        let map52: Map<boolean, string> = new Map<boolean, string>();
        map52.set(false, "disabled");


        expect(map52.get(false) === "disabled").assertTrue();

      console.log(TAG + ' done');
      done();
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_BASEDATA_MAP_DELETE_1200
     * @tc.name      testMapDelete0012
     * @tc.desc      Verify that deleting boolean key false works correctly.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapDelete0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let TAG = "testMapDelete0012";
      console.log(TAG + ' start');

        let map53: Map<boolean, string> = new Map<boolean, string>();
        map53.set(false, "toRemoveFalse");

        expect(map53.delete(false)).assertTrue();



      console.log(TAG + ' done');
      done();
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_BASEDATA_MAP_HAS_1600
     * @tc.name      testMapHas0016
     * @tc.desc      Verify that after deleting boolean key false, has() returns false.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapHas0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let TAG = "testMapHas0016";
      console.log(TAG + ' start');

        let map54: Map<boolean, string> = new Map<boolean, string>();
        map54.set(false, "deletedFalse");
        map54.delete(false);


        expect(!map54.has(false)).assertTrue();

      console.log(TAG + ' done');
      done();
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_BASEDATA_MAP_SET_0900
     * @tc.name      testMapSet0009
     * @tc.desc      Verify that an array key can be set successfully.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapSet0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let TAG = "testMapSet0009";
      console.log(TAG + ' start');

        let arr56: number[] = [1, 2, 3];
        let map56: Map<number[], string> = new Map<number[], string>();
        map56.set(arr56, "arrayValue");


        expect(map56.has(arr56)).assertTrue();

      console.log(TAG + ' done');
      done();
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_BASEDATA_MAP_HAS_1700
     * @tc.name      testMapHas0017
     * @tc.desc      Verify that array key exists in Map after set.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapHas0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let TAG = "testMapHas0017";
      console.log(TAG + ' start');

        let arr57: string[] = ["a", "b"];
        let map57: Map<string[], string> = new Map<string[], string>();
        map57.set(arr57, "arrayData");


        expect(map57.has(arr57)).assertTrue();

      console.log(TAG + ' done');
      done();
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_BASEDATA_MAP_GET_2000
     * @tc.name      testMapGet0020
     * @tc.desc      Verify that getting array key returns the correct value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapGet0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let TAG = "testMapGet0020";
      console.log(TAG + ' start');

        let arr58: boolean[] = [true, false];
        let map58: Map<boolean[], string> = new Map<boolean[], string>();
        map58.set(arr58, "arrayBool");


        expect(map58.get(arr58) === "arrayBool").assertTrue();

      console.log(TAG + ' done');
      done();
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_BASEDATA_MAP_DELETE_1300
     * @tc.name      testMapDelete0013
     * @tc.desc      Verify that deleting array key works correctly.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapDelete0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let TAG = "testMapDelete0013";
      console.log(TAG + ' start');

        let arr59: (null | undefined)[] = [null, undefined];
        let map59: Map<(null | undefined)[], string> = new Map<(null | undefined)[], string>();
        map59.set(arr59, "arrayNullUndefined");

        expect(map59.delete(arr59)).assertTrue();



      console.log(TAG + ' done');
      done();
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_BASEDATA_MAP_HAS_1800
     * @tc.name      testMapHas0018
     * @tc.desc      Verify that after deleting array key, has() returns false.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapHas0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let TAG = "testMapHas0018";
      console.log(TAG + ' start');

        let arr60: number[] = [10, 20];
        let map60: Map<number[], string> = new Map<number[], string>();
        map60.set(arr60, "arrayNum");
        map60.delete(arr60);


        expect(!map60.has(arr60)).assertTrue();

      console.log(TAG + ' done');
      done();
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_BASEDATA_MAP_GET_2100
     * @tc.name      testMapGet0021
     * @tc.desc      Verify that using a different array instance as key cannot retrieve the value (returns undefined).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapGet0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let TAG = "testMapGet0021";
        console.log(TAG + ' start');

          let map61: Map<number[], string> = new Map();
          const arr61a: number[] = [1, 2];
          map61.set(arr61a, "arrAValue");
          const arr61b: number[] = [1, 2];


          expect(map61.get(arr61b) === undefined).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_MAP_SET_1000
     * @tc.name      testMapSet0010
     * @tc.desc      Verify that a function key can be set and detected by has().
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapSet0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let TAG = "testMapSet0010";
        console.log(TAG + ' start');

          let map62: Map<Function, string> = new Map();
          const func62 = () => "testFunc";
          map62.set(func62, "funcValue");


          expect(map62.has(func62)).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_MAP_HAS_1900
     * @tc.name      testMapHas0019
     * @tc.desc      Verify that a function key previously set in a Map exists using has().
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapHas0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let TAG = "testMapHas0019";
        console.log(TAG + ' start');

          let map63: Map<Function, string> = new Map();
          const func63 = () => {
            return "funcData";
          };
          map63.set(func63, "funcInfo");


          expect(map63.has(func63)).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_MAP_GET_2200
     * @tc.name      testMapGet0022
     * @tc.desc      Verify that a function key can be retrieved correctly using get().
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapGet0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let TAG = "testMapGet0022";
        console.log(TAG + ' start');

          let map64: Map<Function, string> = new Map();
          const func64 = (x: number) => x * 2;
          map64.set(func64, "doubleFunc");


          expect(map64.get(func64) === "doubleFunc").assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_MAP_DELETE_1400
     * @tc.name      testMapDelete0014
     * @tc.desc      Verify that a function key can be deleted successfully from a Map.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapDelete0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let TAG = "testMapDelete0014";
        console.log(TAG + ' start');

          let map65: Map<Function, string> = new Map();
          const func65 = () => "toDeleteFunc";
          map65.set(func65, "funcToRemove");

          expect(map65.delete(func65)).assertTrue();



        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_MAP_HAS_2000
     * @tc.name      testMapHas0020
     * @tc.desc      Verify that after deleting a function key, has() returns false.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapHas0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let TAG = "testMapHas0020";
        console.log(TAG + ' start');

          let map66: Map<Function, string> = new Map();
          const func66 = () => "deletedFunc";
          map66.set(func66, "funcDeleted");
          map66.delete(func66);


          expect(!map66.has(func66)).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_MAP_GET_2300
     * @tc.name      testMapGet0023
     * @tc.desc      Verify that using a different function instance as key cannot retrieve the value (returns undefined).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapGet0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let TAG = "testMapGet0023";
        console.log(TAG + ' start');

          let map67: Map<Function, string> = new Map();
          const func67a = () => "funcA";
          map67.set(func67a, "funcAValue");
          const func67b = () => "funcA"; // 不同实例


          expect(map67.get(func67b) === undefined).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_MAP_GET_2400
     * @tc.name      testMapGet0024
     * @tc.desc      Verify that getting a value with an unset object key returns undefined.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapGet0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let TAG = "testMapGet0024";
        console.log(TAG + ' start');

          let map68: Map<object, string> = new Map();
          interface GeneratedObjectLiteralInterface_14 {}

          const OBJECT_KEY: GeneratedObjectLiteralInterface_14 = {};



          expect(map68.get(OBJECT_KEY) === undefined).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_MAP_GET_2500
     * @tc.name      testMapGet0025
     * @tc.desc      Verify that getting a value with an unset array key returns undefined.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapGet0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let TAG = "testMapGet0025";
        console.log(TAG + ' start');

          let map69: Map<number[], string> = new Map();


          expect(map69.get([]) === undefined).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_MAP_DELETE_1500
     * @tc.name      testMapDelete0015
     * @tc.desc      Verify that deleting an unset Symbol key returns false.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testMapDelete0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let TAG = "testMapDelete0015";
        console.log(TAG + ' start');

          let map70: Map<string, string> = new Map();


          expect(!map70.delete(generateUniqueKey("unset"))).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });
  })
}