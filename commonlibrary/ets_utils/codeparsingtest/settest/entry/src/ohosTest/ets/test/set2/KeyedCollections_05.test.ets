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

export default function keyedCollections_05Test() {
  describe('keyedCollections_05Test', () => {
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
     * @tc.number    BASEDATE_SET_SIZE_0100
     * @tc.name      tesSetSize0001
     * @tc.desc      Verify that adding a single value into a Set results in size 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("tesSetSize0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let TAG = "tesSetSize0001";
        console.log(TAG + ' start');
        let set1: Set<string> = new Set<string>();
        set1.add("test");
        expect(set1.size === 1).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    BASEDATE_SET_SIZE_0200
     * @tc.name      tesSetSize0002
     * @tc.desc      Verify that adding two different values into a Set results in size 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("tesSetSize0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let TAG = "tesSetSize0002";
        console.log(TAG + ' start');
        let set2: Set<number> = new Set<number>();
        set2.add(1).add(2);
        expect(set2.size === 2).assertTrue();
        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    BASEDATE_SET_SIZE_0300
     * @tc.name      tesSetSize0003
     * @tc.desc      Verify that adding three different values into a Set results in size 3.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("tesSetSize0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let TAG = "tesSetSize0003";
        console.log(TAG + ' start');
        let set3: Set<string> = new Set<string>();
        set3.add("a").add("b").add("c");
        console.log("size-add three different values is 3: " + (set3.size === 3));
        expect(set3.size === 3).assertTrue();
        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_SET_SIZE_0400
     * @tc.name      tesSetSize0004
     * @tc.desc      Verify that adding the same value multiple times into a Set results in size 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("tesSetSize0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let TAG = "tesSetSize0004";
        console.log(TAG + ' start');
        let set4: Set<string> = new Set<string>();
        set4.add("repeat").add("repeat").add("repeat");
        console.log("size-add repeated values is 1: " + (set4.size === 1));
        expect(set4.size === 1).assertTrue();
        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_SET_SIZE_0500
     * @tc.name      tesSetSize0005
     * @tc.desc      Verify that adding mixed type values into a Set results in correct size.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("tesSetSize0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let TAG = "tesSetSize0005";
        console.log(TAG + ' start');
        type Setkey = string | number | boolean | object ;

        interface objbnull {}

        let obj: objbnull = {};
        let set5: Set<Setkey> = new Set<Setkey>();
        set5.add(10).add("string").add(true).add(obj);
        console.log("size-add mixed types is 4: " + (set5.size === 4));
        expect(set5.size === 4).assertTrue();
        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_SET_SIZE_0600
     * @tc.name      tesSetSize0006
     * @tc.desc      Verify that deleting one value from a Set reduces size by 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("tesSetSize0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let TAG = "tesSetSize0006";
        console.log(TAG + ' start');
        let set6: Set<string> = new Set<string>();
        set6.add("a").add("b").add("c");
        set6.delete("b");
        console.log("size after deleting one value is 2: " + (set6.size === 2));
        expect(set6.size === 2).assertTrue();
        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_SET_SIZE_0700
     * @tc.name      tesSetSize0007
     * @tc.desc      Verify that deleting multiple values from a Set results in correct size.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("tesSetSize0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let TAG = "tesSetSize0007";
        console.log(TAG + ' start');
        let set7: Set<number> = new Set<number>();
        set7.add(1).add(2).add(3).add(4);
        set7.delete(2);
        set7.delete(3);
        console.log("size after deleting multiple values is 2: " + (set7.size === 2));
        expect(set7.size === 2).assertTrue();
        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_SET_SIZE_0800
     * @tc.name      tesSetSize0008
     * @tc.desc      Verify that deleting all values from a Set results in size 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("tesSetSize0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let TAG = "tesSetSize0008";
        console.log(TAG + ' start');
        let set8: Set<string> = new Set<string>();
        set8.add("x").add("y");
        set8.delete("x");
        set8.delete("y");
        console.log("size after deleting all values is 0: " + (set8.size === 0));
        expect(set8.size === 0).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_SET_SIZE_0900
     * @tc.name      tesSetSize0009
     * @tc.desc      Verify that deleting a non-existent value does not change the Set size.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("tesSetSize0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let TAG = "tesSetSize0009";
        console.log(TAG + ' start');
        let set9: Set<string> = new Set<string>();
        set9.add("a").add("b");
        const originalSize: number = set9.size;
        set9.delete("c"); // non-existent
        console.log("size after deleting non-existent value unchanged: " + (set9.size === originalSize));
        expect(set9.size === originalSize).assertTrue();
        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_SET_SIZE_1000
     * @tc.name      tesSetSize0010
     * @tc.desc      Verify that add -> delete -> add results in correct Set size.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("tesSetSize0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let TAG = "tesSetSize0010";
        console.log(TAG + ' start');
        let set10: Set<string> = new Set<string>();
        set10.add("test");
        set10.delete("test");
        set10.add("test");
        console.log("size after add, delete, add is 1: " + (set10.size === 1));
        expect(set10.size === 1).assertTrue();
        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_SET_SIZE_1100
     * @tc.name      tesSetSize0011
     * @tc.desc      Verify that adding an object into a Set increases size to 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("tesSetSize0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let TAG = "tesSetSize0011";
        console.log(TAG + ' start');
        interface obj91num {
          a: number;
        }

        let set11: Set<obj91num> = new Set<obj91num>();


        const obj91: obj91num = { a: 1 };
        set11.add(obj91);
        console.log("size after adding an object is 1: " + (set11.size === 1));
        expect(set11.size === 1).assertTrue();
        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_SET_SIZE_1200
     * @tc.name      tesSetSize0012
     * @tc.desc      Verify that adding multiple distinct objects into a Set results in correct size.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("tesSetSize0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let TAG = "tesSetSize0012";
        console.log(TAG + ' start');
        interface objnum {
          a?: number
          b?: number
          c?: number
        }

        let obj1: objnum = { a: 1 };
        let obj2: objnum = { b: 2 };
        let obj3: objnum = { c: 3 };
        let set12: Set<object> = new Set<object>();
        set12.add(obj1).add(obj2).add(obj3);
        console.log("size after adding multiple distinct objects is 3: " + (set12.size === 3));
        expect(set12.size === 3).assertTrue();
        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_SET_SIZE_1300
     * @tc.name      tesSetSize0013
     * @tc.desc      Verify that deleting an object from a Set reduces size accordingly.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("tesSetSize0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let TAG = "tesSetSize0013";
        console.log(TAG + ' start');
        interface objnum {
          x?: number
          y?: number
        }

        const obj93: objnum = { x: 10 };
        let obj2: objnum = { y: 20 }
        let set13: Set<object> = new Set<object>();
        set13.add(obj93).add(obj2);
        set13.delete(obj93);
        console.log("size after deleting the object is 1: " + (set13.size === 1));
        expect(set13.size === 1).assertTrue();
        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_SET_SIZE_1400
     * @tc.name      tesSetSize0014
     * @tc.desc      Verify that adding a Symbol into a Set increases size to 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("tesSetSize0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let TAG = "tesSetSize0014";
        console.log(TAG + ' start');
        let set14: Set<string> = new Set<string>();
        const sym94: string = generateUniqueKey("test");
        set14.add(sym94);
        expect(set14.size === 1).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_SET_SIZE_1500
     * @tc.name      tesSetSize0015
     * @tc.desc      Verify that adding multiple Symbols (including duplicates) results in expected size.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("tesSetSize0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let TAG = "tesSetSize0015";
        console.log(TAG + ' start');
        let set15: Set<string> = new Set<string>();
        // Note: Symbol("a") !== Symbol("a") so duplicates are distinct symbols
        set15.add(generateUniqueKey("a")).add(generateUniqueKey("b")).add(generateUniqueKey("a"));

        // Because every Symbol() call creates a new Symbol, we expect size to be 3
        expect(set15.size === 3).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_SET_SIZE_1600
     * @tc.name      tesSetSize0016
     * @tc.desc      Verify that adding an array into a Set increases size to 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("tesSetSize0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let TAG = "tesSetSize0016";
        console.log(TAG + ' start');
        let set16: Set<number[]> = new Set<number[]>();
        const arr96: number[] = [1, 2, 3];
        set16.add(arr96);

        expect(set16.size === 1).assertTrue();
        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_SET_SIZE_1700
     * @tc.name      tesSetSize0017
     * @tc.desc      Verify that adding multiple arrays (different references) into a Set results in correct size.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("tesSetSize0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let TAG = "tesSetSize0017";
        console.log(TAG + ' start');
        let set17: Set<number[]> = new Set<number[]>();
        set17.add([1]).add([2]).add([1]);

        expect(set17.size === 3).assertTrue();
        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_SET_SIZE_1800
     * @tc.name      tesSetSize0018
     * @tc.desc      Verify that adding a function into a Set increases size to 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("tesSetSize0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let TAG = "tesSetSize0018";
        console.log(TAG + ' start');
        let set18: Set<() => void> = new Set<() => void>();
        const func98 = () => {
        };
        set18.add(func98);
        expect(set18.size === 1).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_SET_SIZE_1900
     * @tc.name      tesSetSize0019
     * @tc.desc      Verify that adding multiple functions (different references) into a Set results in correct size.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("tesSetSize0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let TAG = "tesSetSize0019";
        console.log(TAG + ' start');
        let set19: Set<() => number> = new Set<() => number>();
        set19.add(() => 1).add(() => 2).add(() => 1);

        expect(set19.size === 3).assertTrue();
        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_SET_SIZE_2000
     * @tc.name      tesSetSize0020
     * @tc.desc      Verify that an empty Set has size 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("tesSetSize0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let TAG = "tesSetSize0020";
        console.log(TAG + ' start');
        let set20: Set<string> = new Set<string>();
        expect(set20.size === 0).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_SET_CLEAR_0100
     * @tc.name      testSetClear0001
     * @tc.desc      Verify that calling clear() on a non-empty Set results in size === 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testSetClear0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testSetClear0001";
        console.log(TAG + ' start');
        const set101: Set<string> = new Set<string>();
        set101.add("a").add("b").add("c");
        set101.clear();
        expect(set101.size === 0).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_DATE_SET_CLEAR_0200
     * @tc.name      testSetClear0002
     * @tc.desc      Verify that calling clear() on an empty Set keeps size === 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testSetClear0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testSetClear0002";
        console.log(TAG + ' start');
        const set102: Set<string> = new Set<string>();
        set102.clear();
        expect(set102.size === 0).assertTrue();
        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_SET_CLEAR_0300
     * @tc.name      testSetClear0003
     * @tc.desc      Verify that after clear(), previously added value is no longer contained (has() returns false).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testSetClear0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testSetClear0003";
        console.log(TAG + ' start');
        const set103: Set<string> = new Set<string>();
        const val103: string = "test";
        set103.add(val103);
        set103.clear();
        expect(!set103.has(val103)).assertTrue();
        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_SET_CLEAR_0400
     * @tc.name      testSetClear0004
     * @tc.desc      Verify that after clear(), the Set cannot be iterated and yields zero values.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testSetClear0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testSetClear0004";
        console.log(TAG + ' start');
        const set104: Set<number> = new Set<number>();
        set104.add(1).add(2).add(3);
        set104.clear();
        const values: number[] = Array.from(set104);
        expect(values.length === 0).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_SET_CLEAR_0500
     * @tc.name      testSetClear0005
     * @tc.desc      Verify that calling clear() multiple times is safe and size remains 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testSetClear0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testSetClear0005";
        console.log(TAG + ' start');
        const set105: Set<string> = new Set<string>();
        set105.add("a");
        set105.clear();
        set105.clear(); // call clear again
        console.log("clear - multiple calls then size is 0: " + (set105.size === 0));
        expect(set105.size === 0).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_SET_CLEAR_0600
     * @tc.name      testSetClear0006
     * @tc.desc      Verify that after clear(), new values can be added again and Set behaves normally.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testSetClear0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testSetClear0006";
        console.log(TAG + ' start');
        const set106: Set<string> = new Set<string>();
        // chain add and clear to verify behavior
        set106.add("old").clear();
        set106.add("new");
        expect(set106.size === 1 && set106.has("new")).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_SET_CLEAR_0700
     * @tc.name      testSetClear0007
     * @tc.desc      Verify that clear() removes object values such that has(obj) returns false afterwards.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testSetClear0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testSetClear0007";
        console.log(TAG + ' start');
        interface objnum {
          a: number;
        }

        const set107: Set<objnum> = new Set<objnum>();
        const obj107: objnum = { a: 1 };
        set107.add(obj107);
        set107.clear();
        console.log("clear - object value removed then has(obj) is false: " + (!set107.has(obj107)));
        expect(!set107.has(obj107)).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_SET_CLEAR_0800
     * @tc.name      testSetClear0008
     * @tc.desc      Verify that clear() removes Symbol values so has(symbol) returns false afterwards.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testSetClear0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testSetClear0008";
        console.log(TAG + ' start');
        const set108: Set<string> = new Set<string>();
        const sym108: string = generateUniqueKey("test");
        set108.add(sym108);
        set108.clear();
        expect(!set108.has(sym108)).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_SET_CLEAR_0900
     * @tc.name      testSetClear0009
     * @tc.desc      Verify that clear() removes array values so has(array) returns false afterwards.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testSetClear0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testSetClear0009";
        console.log(TAG + ' start');
        const set109: Set<number[]> = new Set<number[]>();
        const arr109: number[] = [1, 2, 3];
        set109.add(arr109);
        set109.clear();
        expect(!set109.has(arr109)).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_SET_CLEAR_1000
     * @tc.name      testSetClear0010
     * @tc.desc      Verify that clear() removes function values so has(func) returns false afterwards.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testSetClear0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testSetClear0010";
        console.log(TAG + ' start');
        const set110: Set<() => void> = new Set<() => void>();
        const func110: () => void = () => {
        };
        set110.add(func110);
        set110.clear();
        expect(!set110.has(func110)).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_SET_FOROF_0100
     * @tc.name      testSetForOf0001
     * @tc.desc      Verify direct iteration with for...of yields insertion order for strings.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testSetForOf0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testSetForOf0001";
        console.log(TAG + ' start');
        const set111: Set<string> = new Set<string>();
        set111.add("b").add("a").add("c");
        const result111 = Array.from(set111).join(",");
        console.log("for...of direct order: " + (result111 === "b,a,c"));
        expect(result111 === "b,a,c").assertTrue();

        console.log(TAG + ' done');
        done();
      });

    /**
     * @tc.number    SUB_BASEDATE_SET_FOROF_0200
     * @tc.name      testSetForOf0002
     * @tc.desc      Verify iterating values() with for...of preserves insertion order for numbers.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testSetForOf0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testSetForOf0002";
        console.log(TAG + ' start');
        const set112: Set<number> = new Set<number>();
        set112.add(2).add(1).add(3);
        const result112 = Array.from(set112.values()).join(",");
        expect(result112 === "2,1,3").assertTrue();

        console.log(TAG + ' done');
        done();
      });

    /**
     * @tc.number    SUB_BASEDATE_SET_FOROF_0300
     * @tc.name      testSetForOf0003
     * @tc.desc      Verify entries() iteration yields [value,value] pairs in insertion order.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testSetForOf0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testSetForOf0003";
        console.log(TAG + ' start');
        const set113: Set<string> = new Set<string>();
        set113.add("x").add("y").add("z");
        const entries = Array.from(set113.entries());
        const arr = ["x", "y", "z"];
        const result113 = entries.every((entry, i) => entry[0] === entry[1] && entry[0] === arr[i]);
        console.log("for...of entries order: " + result113);
        expect(result113).assertTrue();
        console.log(TAG + ' done');
        done();
      });

    /**
     * @tc.number    SUB_BASEDATE_SET_FOROF_0400
     * @tc.name      testSetForOf0004
     * @tc.desc      Verify iterating an empty Set yields no results.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testSetForOf0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testSetForOf0004";
        console.log(TAG + ' start');
        const set114: Set<never> = new Set<never>();
        const result114 = Array.from(set114);
        expect(result114.length === 0).assertTrue();

        console.log(TAG + ' done');
        done();
      });

    /**
     * @tc.number    SUB_BASEDATE_SET_FOROF_0500
     * @tc.name      testSetForOf0005
     * @tc.desc      Verify iterating a single-value Set yields that single value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testSetForOf0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testSetForOf0005";
        console.log(TAG + ' start');
        const set115: Set<string> = new Set<string>();
        set115.add("single");
        const result115 = Array.from(set115);
        expect(result115.length === 1 && result115[0] === "single").assertTrue();

        console.log(TAG + ' done');
        done();
      });

    /**
     * @tc.number    SUB_BASEDATE_SET_FOROF_0600
     * @tc.name      testSetForOf0006
     * @tc.desc      Verify Set containing objects preserves insertion order when iterated.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testSetForOf0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testSetForOf0006";
        console.log(TAG + ' start');
        interface TestObject {
          a?: number
          b?: number
          c?: number
        }

        const set116: Set<TestObject> = new Set();

        const obj1: TestObject = { a: 1 };
        let obj2: TestObject = { b: 2 };
        let obj3: TestObject = { c: 3 };
        set116.add(obj2).add(obj1).add(obj3);
        const result116 = Array.from(set116);
        expect(result116[0] === obj2 && result116[1] === obj1 && result116[2] === obj3).assertTrue();

        console.log(TAG + ' done');
        done();
      });

    /**
     * @tc.number    SUB_BASEDATE_SET_FOROF_0700
     * @tc.name      testSetForOf0007
     * @tc.desc      Verify Set containing Symbols preserves insertion order when iterated.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testSetForOf0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testSetForOf0007";
        console.log(TAG + ' start');
        const set117: Set<string> = new Set<string>();
        const sym1 = generateUniqueKey("1"), sym2 = generateUniqueKey("2"), sym3 = generateUniqueKey("3");
        set117.add(sym3).add(sym1).add(sym2);
        const result117 = Array.from(set117);
        expect(result117[0] === sym3 && result117[1] === sym1 && result117[2] === sym2).assertTrue();

        console.log(TAG + ' done');
        done();
      });

    /**
     * @tc.number    SUB_BASEDATE_SET_FOROF_0800
     * @tc.name      testSetForOf0008
     * @tc.desc      Verify Set containing arrays preserves insertion order when iterated.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testSetForOf0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testSetForOf0008";
        console.log(TAG + ' start');
        const set118: Set<number[]> = new Set<number[]>();
        const arr1 = [1], arr2 = [2], arr3 = [3];
        set118.add(arr2).add(arr1).add(arr3);
        const result118 = Array.from(set118);
        expect(result118[0] === arr2 && result118[1] === arr1 && result118[2] === arr3).assertTrue();

        console.log(TAG + ' done');
        done();
      });

    /**
     * @tc.number    SUB_BASEDATE_SET_FOROF_0900
     * @tc.name      testSetForOf0009
     * @tc.desc      Verify Set containing functions preserves insertion order when iterated.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testSetForOf0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testSetForOf0009";
        console.log(TAG + ' start');
        const set119: Set<() => number> = new Set<() => number>();
        const func1 = () => 1, func2 = () => 2, func3 = () => 3;
        set119.add(func3).add(func1).add(func2);
        const result119 = Array.from(set119);
        expect(result119[0] === func3 && result119[1] === func1 && result119[2] === func2).assertTrue();

        console.log(TAG + ' done');
        done();
      });

    /**
     * @tc.number    SUB_BASEDATE_SET_FOROF_1000
     * @tc.name      testSetForOf0010
     * @tc.desc      Verify Set containing undefined and null preserves insertion order and does not duplicate undefined.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testSetForOf0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testSetForOf0010";
        console.log(TAG + ' start');
        const set120: Set<undefined | null> = new Set<undefined | null>();
        set120.add(undefined).add(null).add(undefined);
        const result120 = Array.from(set120);
        expect(result120[0] === undefined && result120[1] === null).assertTrue();

        console.log(TAG + ' done');
        done();
      });

    /**
     * @tc.number    SUB_BASEDATE_SET_FOROF_1100
     * @tc.name      testSetForOf0011
     * @tc.desc      Verify deleting a middle element preserves iteration order for remaining items.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testSetForOf0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testSetForOf0011";
        console.log(TAG + ' start');
        const set121: Set<string> = new Set<string>();
        set121.add("a").add("b").add("c").add("d");
        set121.delete("b");
        const result121 = Array.from(set121).join(",");
        expect(result121 === "a,c,d").assertTrue();

        console.log(TAG + ' done');
        done();
      });

    /**
     * @tc.number    SUB_BASEDATE_SET_FOROF_1200
     * @tc.name      testSetForOf0012
     * @tc.desc      map set for and of.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testSetForOf0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testSetForOf0012";
        console.log(TAG + ' start');
        const set122: Set<string> = new Set<string>();
        set122.add("x").add("y").add("z");
        set122.delete("y");
        set122.add("y");
        const result122 = Array.from(set122).join(",");
        expect(result122 === "x,z,y").assertTrue();

        console.log(TAG + ' done');
        done();
      });

    /**
     * @tc.number    SUB_BASEDATE_SET_FOROF_1300
     * @tc.name      testSetForOf0013
     * @tc.desc      Verify Set treats NaN as a single value when iterated.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testSetForOf0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testSetForOf0013";
        console.log(TAG + ' start');
        const set123: Set<number> = new Set<number>();
        set123.add(Number.NaN).add(1).add(Number.NaN);
        const result123 = Array.from(set123).length;
        expect(result123 === 2).assertTrue();

        console.log(TAG + ' done');
        done();
      });

    /**
     * @tc.number    SUB_BASEDATE_SET_FOROF_1400
     * @tc.name      testSetForOf0014
     * @tc.desc      Verify Set treats +0 and -0 as the same when iterated.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testSetForOf0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testSetForOf0014";
        console.log(TAG + ' start');
        const set124: Set<number> = new Set<number>();
        set124.add(+0).add(-0).add(1);
        const result124 = Array.from(set124).length;
        expect(result124 === 2).assertTrue();

        console.log(TAG + ' done');
        done();
      });

    /**
     * @tc.number    SUB_BASEDATE_SET_FOROF_1500
     * @tc.name      testSetForOf0015
     * @tc.desc      Verify mixed-type Set preserves insertion order when iterated.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testSetForOf0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testSetForOf0015";
        console.log(TAG + ' start');
        interface objnum {
          a: number;
        }

        const obj: objnum = { a: 1 };
        const sym = generateUniqueKey("test");
        const set125: Set<number | object | string | string> = new Set<number | object | string | string>();
        set125.add(10).add(obj).add("string").add(sym);
        const result125 = Array.from(set125);
        expect(result125[0] === 10 && result125[1] === obj && result125[2] === "string" && result125[3] === sym)
          .assertTrue();

        console.log(TAG + ' done');
        done();
      });

    /**
     * @tc.number    BASEDATE_SET_FOREACH_0100
     * @tc.name      testSetForEach0001
     * @tc.desc      Verify forEach visits elements in insertion order for basic strings.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testSetForEach0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testSetForEach0001";
        console.log(TAG + ' start');
        const set126: Set<string> = new Set<string>();
        set126.add("b").add("a").add("c");
        const result126: string[] = [];
        set126.forEach(v => result126.push(v));
        expect(result126.join(",") === "b,a,c").assertTrue();

        console.log(TAG + ' done');
        done();
      });

    /**
     * @tc.number    SUB_BASEDATE_SET_FOREACH_0200
     * @tc.name      testSetForEach0002
     * @tc.desc      Verify forEach callback parameters are (value, value, set).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testSetForEach0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testSetForEach0002";
        console.log(TAG + ' start');
        const set127: Set<string> = new Set<string>();
        set127.add("test");
        let result127 = false;
        set127.forEach((v1, v2, s) => {
          result127 = v1 === "test" && v2 === "test" && s === set127;
        });

        expect(result127).assertTrue();

        console.log(TAG + ' done');
        done();
      });

    /**
     * @tc.number    SUB_BASEDATE_SET_FOREACH_0300
     * @tc.name      testSetForEach0003
     * @tc.desc      Verify forEach does not call callback for empty Set.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testSetForEach0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testSetForEach0003";
        console.log(TAG + ' start');
        const set128: Set<never> = new Set<never>();
        let called128 = false;
        set128.forEach(() => called128 = true);
        expect(!called128).assertTrue();

        console.log(TAG + ' done');
        done();
      });

    /**
     * @tc.number    SUB_BASEDATE_SET_FOREACH_0400
     * @tc.name      testSetForEach0004
     * @tc.desc      Verify forEach calls callback exactly once for a single-element Set.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testSetForEach0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testSetForEach0004";
        console.log(TAG + ' start');
        const set129: Set<string> = new Set<string>();
        set129.add("single");
        let count129 = 0;
        set129.forEach(() => count129++);
        expect(count129 === 1).assertTrue();

        console.log(TAG + ' done');
        done();
      });

    /**
     * @tc.number    SUB_BASEDATE_SET_FOREACH_0500
     * @tc.name      testSetForEach0005
     * @tc.desc      Verify forEach preserves insertion order for object elements.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testSetForEach0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testSetForEach0005";
        console.log(TAG + ' start');
        interface testobj {
          x?: number;
          y?: number;
          z?: number
        }

        const set130: Set<testobj> = new Set();
        const obj1: testobj = { x: 1 }
        let obj2: testobj = { y: 2 }
        let obj3: testobj = { z: 3 };
        set130.add(obj2).add(obj1).add(obj3);
        const result130: object[] = [];
        set130.forEach(v => result130.push(v));
        expect(result130[0] === obj2 && result130[1] === obj1 && result130[2] === obj3).assertTrue();

        console.log(TAG + ' done');
        done();
      });

    /**
     * @tc.number    SUB_BASEDATE_SET_FOREACH_0600
     * @tc.name      testSetForEach0006
     * @tc.desc      Verify forEach preserves insertion order for Symbol elements.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testSetForEach0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testSetForEach0006";
        console.log(TAG + ' start');
        const set131: Set<string> = new Set<string>();
        const sym1 = generateUniqueKey("a"), sym2 = generateUniqueKey("b"), sym3 = generateUniqueKey("c");
        set131.add(sym3).add(sym1).add(sym2);
        const result131: string[] = [];
        set131.forEach(v => result131.push(v));
        expect(result131[0] === sym3 && result131[1] === sym1 && result131[2] === sym2).assertTrue();

        console.log(TAG + ' done');
        done();
      });

    /**
     * @tc.number    SUB_BASEDATE_SET_FOREACH_0700
     * @tc.name      testSetForEach0007
     * @tc.desc      Verify thisArg passed to forEach is bound as `this` inside normal function callbacks.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testSetForEach0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testSetForEach0007";
        console.log(TAG + ' start');
        const set132: Set<string> = new Set<string>();
        set132.add("test");

        interface testobj {
          prefix: string
        }

        const context: testobj = { prefix: "log: " };
        let result132 = "";
        set132.forEach((v) => {

          result132 = context.prefix + v;
        }, context);

        expect(result132 === "log: test").assertTrue();

        console.log(TAG + ' done');
        done();
      });

    /**
     * @tc.number    SUB_BASEDATE_SET_FOREACH_0800
     * @tc.name      testSetForEach0008
     * @tc.desc      Verify arrow function callback cannot bind this via thisArg (arrow uses lexical this).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testSetForEach0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testSetForEach0008";
        console.log(TAG + ' start');
        const set133: Set<string> = new Set<string>();
        set133.add("test");

        interface testobj {
          prefix: string
        }

        const context: testobj = { prefix: "log: " };
        let result133 = "";

        set133.forEach(v => {
          try {
            result133 = (context && context.prefix ? context.prefix : "no prefix") + v;
          } catch (e) {
            result133 = "undefined";
          }
        }, context);
        const ok = (result133 === "no prefix" + "test") || (result133 === "undefined") || (result133 === "log: test");
        console.log("forEach arrow this binding: " + ok);
        expect(ok).assertTrue();

        console.log(TAG + ' done');
        done();
      });

    /**
     * @tc.number    SUB_BASEDATE_SET_FOREACH_0900
     * @tc.name      testSetForEach0009
     * @tc.desc      Verify forEach iteration after deleting a middle element yields expected remaining order.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testSetForEach0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testSetForEach0009";
        console.log(TAG + ' start');
        const set134: Set<string> = new Set<string>();
        set134.add("a").add("b").add("c").add("d");
        set134.delete("b");
        const result134: string[] = [];
        set134.forEach(v => result134.push(v));
        console.log("forEach after delete middle: " + (result134.join(",") === "a,c,d"));
        expect(result134.join(",") === "a,c,d").assertTrue();

        console.log(TAG + ' done');
        done();
      });

    /**
     * @tc.number    SUB_BASEDATE_SET_FOREACH_1000
     * @tc.name      testSetForEach0010
     * @tc.desc      Verify adding elements during forEach does not affect the current traversal of already-enumerated entries.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testSetForEach0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testSetForEach0010";
        console.log(TAG + ' start');
        const set135: Set<string> = new Set<string>();
        set135.add("a").add("b");
        const result135: string[] = [];
        set135.forEach(v => {
          result135.push(v);
          if (v === "a") {
            set135.add("c");
          } // adding during traversal should not affect current iteration
        });
        console.log("forEach adding during traversal: " + (result135.join(",") === "a,b,c"));
        expect(result135.join(",") === "a,b,c").assertTrue();

        console.log(TAG + ' done');
        done();
      });

    /**
     * @tc.number    SUB_BASEDATE_SET_FOREACH_1100
     * @tc.name      testSetForEach0011
     * @tc.desc      Verify deleting a not-yet-visited element during forEach prevents it from being visited.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testSetForEach0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testSetForEach0011";
        console.log(TAG + ' start');
        const set136: Set<string> = new Set<string>();
        set136.add("a").add("b").add("c").add("d");
        const result136: string[] = [];
        set136.forEach(v => {
          result136.push(v);
          if (v === "b") {
            set136.delete("c");
          } // delete not-yet-visited element
        });

        expect(result136.join(",") === "a,b,d").assertTrue();
        console.log(TAG + ' done');
        done();
      });

    /**
     * @tc.number    SUB_BASEDATE_SET_FOREACH_1200
     * @tc.name      testSetForEach0012
     * @tc.desc      Verify forEach includes NaN entries when present.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testSetForEach0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testSetForEach0012";
        console.log(TAG + ' start');
        const set137: Set<number> = new Set<number>();
        set137.add(Number.NaN).add(1).add(2);
        const result137: number[] = [];
        set137.forEach(v => result137.push(v));
        console.log("forEach contains NaN length: " + (result137.length === 3));
        expect(result137.length === 3).assertTrue();

        console.log(TAG + ' done');
        done();
      });

    /**
     * @tc.number    SUB_BASEDATE_SET_FOREACH_1300
     * @tc.name      testSetForEach0013
     * @tc.desc      Verify forEach treats +0 and -0 as the same element.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testSetForEach0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testSetForEach0013";
        console.log(TAG + ' start');
        const set138: Set<number> = new Set<number>();
        set138.add(+0).add(-0).add(1);
        const result138: number[] = [];
        set138.forEach(v => result138.push(v));
        expect(result138.length === 2).assertTrue();

        console.log(TAG + ' done');
        done();
      });

    /**
     * @tc.number    SUB_BASEDATE_SET_FOREACH_1400
     * @tc.name      testSetForEach0014
     * @tc.desc      Verify forEach preserves insertion order for mixed-type sets.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testSetForEach0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testSetForEach0014";
        console.log(TAG + ' start');
        interface testobj {
          a: number
        }

        const obj: testobj = { a: 1 };
        const sym = generateUniqueKey("test");
        const set139: Set<number | object | string | string> = new Set();
        set139.add(10).add(obj).add("string").add(sym);
        const result139: (number | object | string | string)[] = [];
        set139.forEach(v => result139.push(v));
        const ok = (result139[0] === 10 && result139[1] === obj && result139[2] === "string" && result139[3] === sym);
        console.log("forEach mixed types order: " + ok);
        expect(ok).assertTrue();

        console.log(TAG + ' done');
        done();
      });

    /**
     * @tc.number    SUB_BASEDATE_SET_FOREACH_1500
     * @tc.name      testSetForEach0015
     * @tc.desc      Verify multiple forEach traversals produce consistent order.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testSetForEach0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testSetForEach0015";
        console.log(TAG + ' start');
        const set140: Set<string> = new Set<string>();
        set140.add("x").add("y").add("z");
        const first140: string[] = [], second140: string[] = [];
        set140.forEach(v => first140.push(v));
        set140.forEach(v => second140.push(v));
        const ok = (first140.join(",") === second140.join(","));
        expect(ok).assertTrue();

        console.log(TAG + ' done');
        done();
      });

    /**
     * @tc.number    SUB_BASEDATE_SET_ORDER_0100
     * @tc.name      testSetOrder0001
     * @tc.desc      Verify insertion order for mixed basic primitive types is preserved.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testSetOrder0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testSetOrder0001";
        console.log(TAG + ' start');
        const set141: Set<string | number | boolean | null | undefined> = new Set();
        const order141 = ["a", 1, true, null, undefined] as (string | number | boolean | null | undefined)[];
        order141.forEach(v => set141.add(v));
        const result141 = Array.from(set141);
        const isSameOrder = result141.every((v, i) => v === order141[i]);
        expect(isSameOrder).assertTrue();

        console.log(TAG + ' done');
        done();
      });

    /**
     * @tc.number    SUB_BASEDATE_SET_ORDER_0200
     * @tc.name      testSetOrder0002
     * @tc.desc      Verify insertion order for reference types (objects, arrays, functions) is preserved.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testSetOrder0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testSetOrder0002";
        console.log(TAG + ' start');
        const set142: Set<object | number[] | (() => number)> = new Set();

        interface testobj {
          a?: number
          b?: number
          c?: number
          arr ?: number[]
          func?: () => number
        }

        const obj1: testobj = { a: 1 }
        let obj2: testobj = { b: 2 }
        let arr = [3]
        let func = () => 4;
        const order142 = [obj1, obj2, arr, func];
        order142.forEach(v => set142.add(v));
        const result142 = Array.from(set142);
        const isSameOrder = result142.every((v, i) => v === order142[i]);
        console.log("insertion order reference types consistent: " + isSameOrder);
        expect(isSameOrder).assertTrue();

        console.log(TAG + ' done');
        done();
      });

    /**
     * @tc.number    SUB_BASEDATE_SET_ORDER_0300
     * @tc.name      testSetOrder0003
     * @tc.desc      Verify insertion order for Symbol values is preserved.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testSetOrder0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testSetOrder0003";
        console.log(TAG + ' start');
        const set143: Set<string> = new Set<string>();
        const sym1 = generateUniqueKey("1"), sym2 = generateUniqueKey("2"), sym3 = generateUniqueKey("3");
        const order143 = [sym2, sym1, sym3];
        order143.forEach(v => set143.add(v));
        const result143 = Array.from(set143);
        const isSameOrder = result143.every((v, i) => v === order143[i]);
        console.log("insertion order symbols consistent: " + isSameOrder);
        expect(isSameOrder).assertTrue();

        console.log(TAG + ' done');
        done();
      });

    /**
     * @tc.number    SUB_BASEDATE_SET_ORDER_0400
     * @tc.name      testSetOrder0004
     * @tc.desc      Verify insertion order is preserved for mixed type additions.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testSetOrder0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testSetOrder0004";
        console.log(TAG + ' start');
        interface test {
          a: number
        }

        const obj: test = { a: 1 };
        const sym = generateUniqueKey("test");
        const set144: Set<number | object | string | string | boolean | null> = new Set();
        const order144 =
          [10, obj, "string", sym, true, null] as (number | object | string | string | boolean | null)[];
        order144.forEach(v => set144.add(v));
        const result144 = Array.from(set144);
        const isSameOrder = result144.every((v, i) => v === order144[i]);
        expect(isSameOrder).assertTrue();

        console.log(TAG + ' done');
        done();
      });

    /**
     * @tc.number    SUB_BASEDATE_SET_ORDER_0500
     * @tc.name      testSetOrder0005
     * @tc.desc      Verify adding duplicate values does not change order.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testSetOrder0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testSetOrder0005";
        console.log(TAG + ' start');
        const set145: Set<string> = new Set<string>();
        set145.add("a")
          .add("b")
          .add("a")
          .add("c")
          .add("b");
        const result145 = Array.from(set145).join(",");
        expect(result145 === "a,b,c").assertTrue();

        console.log(TAG + ' done');
        done();
      });

    /**
     * @tc.number    SUB_BASEDATE_SET_ORDER_0600
     * @tc.name      testSetOrder0006
     * @tc.desc      Verify deleting and re-adding moves element to the end of insertion order.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testSetOrder0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testSetOrder0006";
        console.log(TAG + ' start');
        const set146: Set<string> = new Set<string>();
        set146.add("a").add("b").add("c");
        set146.delete("b");
        set146.add("b");
        const result146 = Array.from(set146).join(",");
        expect(result146 === "a,c,b").assertTrue();

        console.log(TAG + ' done');
        done();
      });

    /**
     * @tc.number    SUB_BASEDATE_SET_ORDER_0700
     * @tc.name      testSetOrder0007
     * @tc.desc      Verify insertion order preserved for many additions.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testSetOrder0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testSetOrder0007";
        console.log(TAG + ' start');
        const set147: Set<number> = new Set<number>();

        const order147: number[] = [];
        for (let i: number = 0; i < 10; i++) {
          order147.push(i);
        }
        order147.forEach((v: number) => set147.add(v));

        const result147: number[] = Array.from<number>(set147);
        const isSameOrder: boolean = result147.every((v: number, i: number) => v === order147[i]);
        expect(isSameOrder).assertTrue();

        console.log(TAG + ' done');
        done();
      });

    /**
     * @tc.number    SUB_BASEDATE_SET_ORDER_0800
     * @tc.name      testSetOrder0008
     * @tc.desc      Verify for...of and forEach produce the same iteration order.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testSetOrder0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testSetOrder0008";
        console.log(TAG + ' start');
        const set148: Set<string> = new Set<string>();
        set148.add("x").add("y").add("z").add("w");
        const forOfOrder = Array.from(set148);
        const forEachOrder: string[] = [];
        set148.forEach(v => forEachOrder.push(v));
        const isSame = forOfOrder.every((v, i) => v === forEachOrder[i]);
        console.log("for...of and forEach order same: " + isSame);
        expect(isSame).assertTrue();

        console.log(TAG + ' done');
        done();
      });

    /**
     * @tc.number    SUB_BASEDATE_SET_ORDER_0900
     * @tc.name      testSetOrder0009
     * @tc.desc      Verify modifying objects after insertion does not affect their position in insertion order.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testSetOrder0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testSetOrder0009";
        console.log(TAG + ' start');

        interface test {
          a?: number;
          b?: number
        }

        const set149: Set<test> = new Set();
        const obj1: test = { a: 1 }, obj2: test = { b: 2 };
        set149.add(obj1).add(obj2);
        obj1.a = 100;
        obj2.b = 200;
        const result149 = Array.from(set149);
        console.log("modify objects after add doesn't affect order: " +
          (result149[0] === obj1 && result149[1] === obj2));
        expect(result149[0] === obj1 && result149[1] === obj2).assertTrue();

        console.log(TAG + ' done');
        done();
      });

    /**
     * @tc.number    SUB_BASEDATE_SET_ORDER_1000
     * @tc.name      testSetOrder0010
     * @tc.desc      Verify reassigning variables used to add values does not affect insertion order.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testSetOrder0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testSetOrder0010";
        console.log(TAG + ' start');
        const set150: Set<string> = new Set<string>();
        let a = "a", b = "b";
        set150.add(a).add(b);
        a = "new a";
        b = "new b";
        const result150 = Array.from(set150).join(",");
        console.log("reassign variables after add doesn't affect order: " + (result150 === "a,b"));
        expect(result150 === "a,b").assertTrue();

        console.log(TAG + ' done');
        done();
      });
  })
}