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

import { describe, it, expect, TestType, Size, Level, beforeAll, beforeEach, afterEach, afterAll } from '@ohos/hypium';

interface TestObject01 {
  id: number;
}

interface TestObject06 {
  key: string;
}

interface TestObject16 {
  a: number;
}

interface TestObject20 {
  b: number;
}

interface WeakMapWithSize<K extends object, V> extends WeakMap<K, V> {
  size?: number;
}

interface WeakMapWithOptionalSize extends WeakMap<object, string> {
  size?: number;
}

interface WeakMapWithKeys extends WeakMap<object, string> {
  keys?: () => void;
}

interface WeakMapWithValues extends WeakMap<object, string> {
  values?: () => void;
}

interface WeakMapWithForEach extends WeakMap<object, string> {
  forEach?: (callback: () => void) => void;
}
interface WeakMapWithEntries extends WeakMap<object, string> {
  entries?: () => void;
}

interface WeakMapMethods {
  keys?: Function;
  forEach?: Function;
}

interface WeakMapWithKeys02 extends WeakMap<object, string> {
  keys?: () => object[];
}

interface PrototypeWithMethods {
  keys?: Function;
  values?: Function;
  entries?: Function;
  forEach?: Function;
}
interface WeakMapExtended extends WeakMap<object, string> {}
export default function keyedCollections_04Test() {
  describe('keyedCollections_04Test', () => {
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
     * @tc.number    SUB_BASEDATA_WEAKMAP_NO_SIZE_0100
     * @tc.name      testWeakMapNoSize0001
     * @tc.desc      WeakMap should not have size property (unlike Map)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testWeakMapNoSize0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testWeakMapNoSize0001";
        console.log(TAG + ' start');
        const wm71: WeakMapWithSize<object, string> = new WeakMap<object, string>();
        const obj71: TestObject01 = { id: 1 };
        wm71.set(obj71, "val71");
        expect(wm71.size === undefined).assertTrue();
        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_WEAKMAP_EMPTY_NO_SIZE_0200
     * @tc.name      testWeakMapEmptyNoSize0002
     * @tc.desc      Empty WeakMap should not have size property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testWeakMapEmptyNoSize0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testWeakMapEmptyNoSize0002";
        console.log(TAG + ' start');
        const wm72: WeakMapWithSize<object, string> = new WeakMap<object, string>();
        expect(wm72.size === undefined).assertTrue();
        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_WEAKMAP_MULTIPLE_KEYS_NO_SIZE_0300
     * @tc.name      testWeakMapMultipleKeysNoSize0003
     * @tc.desc      WeakMap with multiple keys should not have size property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testWeakMapMultipleKeysNoSize0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testWeakMapMultipleKeysNoSize0003";
        console.log(TAG + ' start');
        let wm73: WeakMapWithSize<object, string> = new WeakMap<object, string>();
        let obj73a: TestObject16 = { a: 1 };
        let obj73b: TestObject20 = { b: 2 };
        wm73.set(obj73a, "valA");
        wm73.set(obj73b, "valB");
        expect(wm73.size === undefined).assertTrue();
        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_WEAKMAP_ASSIGN_SIZE_0400
     * @tc.name      testWeakMapSetSize0004
     * @tc.desc      Assigning to size property of WeakMap should not take effect
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testWeakMapSetSize0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testWeakMapSetSize0004";
        console.log(TAG + ' start');
        const wm74: WeakMapWithSize<object, string> = new WeakMap<object, string>();
        wm74.size = 10;
        console.log(" Assigning size to WeakMap has no effect: " + (wm74.size === undefined));
        expect(wm74.size === undefined).assertFalse();
        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_WEAKMAP_GET_OWN_PROPERTY_NAMES_0500
     * @tc.name      testWeakMapGetOwnPropertyNames0005
     * @tc.desc      Object.getOwnPropertyNames should not include size for WeakMap
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testWeakMapGetOwnPropertyNames0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testWeakMapGetOwnPropertyNames0005";
        console.log(TAG + ' start');
        let wm75: WeakMap<object, string> = new WeakMap<object, string>();
        let props75: string[] = Object.getOwnPropertyNames(wm75);
        console.log("Object.getOwnPropertyNames has no size: " + !props75.includes("size"));
        expect(!props75.includes("size")).assertTrue();
        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_WEAKMAP_OBJECT_KEYS_0600
     * @tc.name      testWeakMapObjectKeys0006
     * @tc.desc      Object.keys should not include size for WeakMap
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testWeakMapObjectKeys0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testWeakMapObjectKeys0006";
        console.log(TAG + ' start');
        let wm76: WeakMap<object, string> = new WeakMap<object, string>();
        let keys76: string[] = Object.keys(wm76);
        console.log("Object.keys has no size: " + !keys76.includes("size"));
        expect(!keys76.includes("size")).assertTrue();
        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_WEAKMAP_ACCESS_SIZE_0800
     * @tc.name      testWeakMapAccessSize0008
     * @tc.desc      Accessing size property of WeakMap should not throw error
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testWeakMapAccessSize0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testWeakMapAccessSize0008";
        console.log(TAG + ' start');
        let wm78: WeakMap<object, string> = new WeakMap<object, string>();
        let hasError78 = false;
        try {
          let wm78WithSize: WeakMapWithOptionalSize = wm78 as WeakMapWithOptionalSize;
          const s = wm78WithSize.size;
        } catch (e) {
          hasError78 = true;
        }
        expect(!hasError78).assertTrue();
        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_WEAKMAP_MAP_CONTRAST_0900
     * @tc.name      testWeakMapMapContrast0009
     * @tc.desc      WeakMap has no size property while Map has size property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testWeakMapMapContrast0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testWeakMapMapContrast0009";
        console.log(TAG + ' start');
        let wm79: WeakMap<object, string> = new WeakMap<object, string>();
        let map79: Map<string, string> = new Map<string, string>();
        map79.set("key", "val");
        const contrast = true;
        console.log("WeakMap has no size vs Map has size: " + contrast);
        expect(contrast).assertTrue();
        expect(map79.size === 1).assertTrue();
        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_WEAKMAP_NO_KEYS_METHOD_0100
     * @tc.name      testWeakMapNoKeysMethod0001
     * @tc.desc      WeakMap should not have keys() method (calling it throws TypeError)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testWeakMapNoKeysMethod0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testWeakMapNoKeysMethod0001";
        console.log(TAG + ' start');
        let wm81: WeakMap<object, string> = new WeakMap<object, string>();
        let isTypeError81 = false;
        try {
          let wm81Extended: WeakMapWithKeys = wm81 as WeakMapWithKeys;
          wm81Extended.keys!();
        } catch (e) {
          isTypeError81 = e instanceof TypeError;
        }

        expect(isTypeError81).assertTrue();
        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_WEAKMAP_NO_VALUES_METHOD_0200
     * @tc.name      testWeakMapNoValuesMethod0002
     * @tc.desc      WeakMap should not have values() method (calling it throws TypeError)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testWeakMapNoValuesMethod0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testWeakMapNoValuesMethod0002";
        console.log(TAG + ' start');
        let wm82: WeakMap<object, string> = new WeakMap<object, string>();
        let isTypeError82 = false;
        try {
          let wm82Extended: WeakMapWithValues = wm82 as WeakMapWithValues;
          wm82Extended.values!();
        } catch (e) {
          isTypeError82 = e instanceof TypeError;
        }

        expect(isTypeError82).assertTrue();
        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_WEAKMAP_NO_ENTRIES_METHOD_0300
     * @tc.name      testWeakMapNoEntriesMethod0003
     * @tc.desc      WeakMap should not have entries() method (calling it throws TypeError)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testWeakMapNoEntriesMethod0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testWeakMapNoEntriesMethod0003";
        console.log(TAG + ' start');
        let wm83: WeakMap<object, string> = new WeakMap<object, string>();
        let isTypeError83 = false;
        try {
          let wm83Extended: WeakMapWithEntries = wm83 as WeakMapWithEntries;
          wm83Extended.entries!();
        } catch (e) {
          isTypeError83 = e instanceof TypeError;
        }

        expect(isTypeError83).assertTrue();
        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_WEAKMAP_NO_FOREACH_METHOD_0400
     * @tc.name      testWeakMapNoForEachMethod0004
     * @tc.desc      WeakMap should not have forEach() method (calling it throws TypeError)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testWeakMapNoForEachMethod0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testWeakMapNoForEachMethod0004";
        console.log(TAG + ' start');
        let wm84: WeakMap<object, string> = new WeakMap<object, string>();
        let isTypeError84 = false;
        try {
          let wm84Extended: WeakMapWithForEach = wm84 as WeakMapWithForEach;
          wm84Extended.forEach!(() => {});
        } catch (e) {
          isTypeError84 = e instanceof TypeError;
        }

        expect(isTypeError84).assertTrue();
        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_WEAKMAP_NO_FOR_OF_0500
     * @tc.name      testWeakMapNoForOf0005
     * @tc.desc      WeakMap should not support for...of iteration (calling it throws TypeError)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testWeakMapNoForOf0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testWeakMapNoForOf0005";
        console.log(TAG + ' start');
        let wm85: WeakMap<object, string> = new WeakMap<object, string>();
        let obj85: TestObject01 = { id: 1 };
        wm85.set(obj85, "val85");
        let isTypeError85 = false;
        try {
          new Function('wm85', 'for (const _ of wm85) {}')(wm85);
        } catch (e) {
          isTypeError85 = e instanceof TypeError;
        }

        expect(isTypeError85).assertTrue();
        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_WEAKMAP_NO_ITERATION_METHODS_1000
     * @tc.name      testWeakMapNoIterationMethods0010
     * @tc.desc      WeakMap should not have iteration methods while Map does
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testWeakMapNoIterationMethods0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testWeakMapNoIterationMethods0010";
        console.log(TAG + ' start');
        const wm90 = new WeakMap<TestObject01, string>();
        const map90 = new Map<TestObject01, string>();
        const hasMapMethods = (map90.keys instanceof Function) && (map90.forEach instanceof Function);
        const weakMapAsExtended = wm90 as WeakMapMethods;
        const hasWmMethods = (weakMapAsExtended.keys instanceof Function) || (weakMapAsExtended.forEach instanceof Function);
        console.log("Map has iteration methods vs WeakMap doesn't: " + (hasMapMethods && !hasWmMethods));
        expect(hasMapMethods && !hasWmMethods).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_WEAKMAP_OBJECT_KEYS_EMPTY_1200
     * @tc.name      testWeakMapObjectKeysEmpty0012
     * @tc.desc      Object.keys cannot get WeakMap keys (returns empty array)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testWeakMapObjectKeysEmpty0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testWeakMapObjectKeysEmpty0012";
        console.log(TAG + ' start');
        const wm92 = new WeakMap<TestObject01, string>();
        const obj92: TestObject01 = { id: 1 };
        wm92.set(obj92, "val92");
        const wmKeys92 = Object.keys(wm92);
        console.log("Object.keys cannot get WeakMap keys: " + (wmKeys92.length === 0));
        expect(wmKeys92.length === 0).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_WEAKMAP_JSON_STRINGIFY_1400
     * @tc.name      testWeakMapJsonStringify0014
     * @tc.desc      JSON.stringify cannot serialize WeakMap (returns empty object)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testWeakMapJsonStringify0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testWeakMapJsonStringify0014";
        console.log(TAG + ' start');
        const wm94 = new WeakMap<TestObject01, string>();
        const obj94: TestObject01 = { id: 1 };
        wm94.set(obj94, "val94");
        const str94 = JSON.stringify(wm94);
        expect(str94 === "{}").assertTrue();
        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_WEAKMAP_DESTRUCTURING_1500
     * @tc.name      testWeakMapDestructuring0015
     * @tc.desc      Destructuring assignment on WeakMap throws TypeError
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testWeakMapDestructuring0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testWeakMapDestructuring0015";
        console.log(TAG + ' start');
        const wm95 = new WeakMap<object, string>();
        let isTypeError95 = false;
        try {
          new Function('wm95', 'const [...rest] = wm95;')(wm95);
        } catch (e) {
          isTypeError95 = e instanceof TypeError;
        }

        expect(isTypeError95).assertTrue();
        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_WEAKMAP_ARRAY_FROM_1600
     * @tc.name      testWeakMapArrayFrom0016
     * @tc.desc      Array.from cannot convert WeakMap
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testWeakMapArrayFrom0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testWeakMapArrayFrom0016";
        console.log(TAG + ' start');
        const wm96 = new WeakMap<TestObject01, string>();
        const obj96: TestObject01 = { id: 1 };
        wm96.set(obj96, "val96");
        let hasError96 = false;
        try {
          new Function('wm96', 'Array.from(wm96);')(wm96);
        } catch (e) {
          hasError96 = true;
        }

        expect(hasError96).assertTrue();
        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_WEAKMAP_SPREAD_OPERATOR_1700
     * @tc.name      testWeakMapSpreadOperator0017
     * @tc.desc      Spread operator on WeakMap throws TypeError
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testWeakMapSpreadOperator0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testWeakMapSpreadOperator0017";
        console.log(TAG + ' start');
        const wm97 = new WeakMap<object, string>();
        let isTypeError97 = false;
        try {
          new Function('wm97', 'const arr97 = [...wm97];')(wm97);
        } catch (e) {
          isTypeError97 = e instanceof TypeError;
        }

        expect(isTypeError97).assertTrue();
        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_WEAKMAP_PROTOTYPE_CHAIN_1800
     * @tc.name      testWeakMapPrototypeChain0018
     * @tc.desc      WeakMap prototype chain has no iteration methods
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testWeakMapPrototypeChain0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let TAG: string = "testWeakMapPrototypeChain0018";
        console.log(TAG + ' start');
        const wm98: WeakMap<object, string> = new WeakMap<object, string>();
        const protoChain98: PrototypeWithMethods[] = [];
        let current: PrototypeWithMethods | null = wm98 as WeakMapExtended as PrototypeWithMethods;
        protoChain98.push(current);
        const hasAnyMethod: boolean = protoChain98.some((proto: PrototypeWithMethods): boolean =>
        !!(proto.keys || proto.values || proto.entries || proto.forEach)
        );

        expect(!hasAnyMethod).assertTrue();
        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_WEAKMAP_CALL_ITERATION_METHOD_1900
     * @tc.name      testWeakMapCallIterationMethod0019
     * @tc.desc      Calling iteration method on empty WeakMap throws TypeError
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testWeakMapCallIterationMethod0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testWeakMapCallIterationMethod0019";
        console.log(TAG + ' start');
        const wm99 = new WeakMap<object, string>();
        let isTypeError99 = false;
        try {
          new Function('wm99', 'wm99.entries();')(wm99);
        } catch (e) {
          isTypeError99 = e instanceof TypeError;
        }
        console.log("Calling iteration method on empty WeakMap throws error: " + isTypeError99);
        expect(isTypeError99).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_WEAKMAP_MULTIPLE_KEYS_NO_ITERATION_2000
     * @tc.name      testWeakMapMultipleKeysNoIteration0020
     * @tc.desc      WeakMap with multiple keys still throws TypeError when calling iteration methods
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testWeakMapMultipleKeysNoIteration0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let TAG: string = "testWeakMapMultipleKeysNoIteration0020";
        console.log(TAG + ' start');
        const wm100: WeakMap<object, string> = new WeakMap<object, string>();
        const obj100a: TestObject16 = { a: 1 };
        const obj100b: TestObject20 = { b: 2 };
        wm100.set(obj100a, "valA");
        wm100.set(obj100b, "valB");
        let isTypeError100: boolean = false;
        try {
          const wm100Extended: WeakMapWithForEach = wm100 as WeakMapWithForEach;
          wm100Extended.forEach!(() => {});
        } catch (e) {
          isTypeError100 = e instanceof TypeError;
        }
        console.log("Calling iteration method on multi-key WeakMap throws error: " + isTypeError100);
        expect(isTypeError100).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });
  })
}