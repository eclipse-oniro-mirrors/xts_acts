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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it } from '@ohos/hypium';

export default function MapTest() {
  describe('mapTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    });
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    });
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    });
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_MAP_0100
     * @tc.name       : testMapPrototypeClear0001
     * @tc.desc       : Test the function of the interface MapPrototypeClear.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMapPrototypeClear0001', 0, () => {
      const TAG = "testMapPrototypeClear0001";
      try {
        const map1: Map<string, string> = new Map();
        map1.set('bar', 'baz');
        map1.set('1', 'foo');
        const result = map1.size;
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_MAP_0200
     * @tc.name       : testMapPrototypeClear0002
     * @tc.desc       : Test the function of the interface MapPrototypeClear.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMapPrototypeClear0002', 0, () => {
      const TAG = "testMapPrototypeClear0002";
      try {
        const map1: Map<string, string> = new Map();
        map1.set('bar', 'baz');
        map1.set('1', 'foo');
        map1.clear();
        const result = map1.size;
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_MAP_0300
     * @tc.name       : testMapPrototypeClear0003
     * @tc.desc       : Test the function of the interface MapPrototypeClear.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMapPrototypeClear0003', 0, () => {
      const TAG = "testMapPrototypeClear0003";
      try {
        const map1: Map<string, string> = new Map();
        map1.clear();
        const result = map1.size;
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_MAP_0400
     * @tc.name       : testMapPrototypeDelete0001
     * @tc.desc       : Test the function of the interface MapPrototypeDelete.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMapPrototypeDelete0001', 0, () => {
      const TAG = "testMapPrototypeDelete0001";
      try {
        const map1: Map<string, string> = new Map();
        map1.set('bar', 'foo');
        map1.delete('bar');
        const result = map1.has('bar');
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_MAP_0500
     * @tc.name       : testMapPrototypeDelete0002
     * @tc.desc       : Test the function of the interface MapPrototypeDelete.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMapPrototypeDelete0002', 0, () => {
      const TAG = "testMapPrototypeDelete0002";
      try {
        const map1: Map<string, string> = new Map();
        map1.set('bar', 'foo');
        const result = map1.has('bar');
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_MAP_0600
     * @tc.name       : testMapPrototypeDelete0003
     * @tc.desc       : Test the function of the interface MapPrototypeDelete.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMapPrototypeDelete0003', 0, () => {
      const TAG = "testMapPrototypeDelete0003";
      try {
        const map1: Map<string, string> = new Map();
        map1.delete('bar');
        const result = map1.has('bar');
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_MAP_0700
     * @tc.name       : testMapPrototypeEntries0001
     * @tc.desc       : Test the function of the interface MapPrototypeEntries.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMapPrototypeEntries0001', 0, () => {
      const TAG = "testMapPrototypeEntries0001";
      try {
        const map1: Map<string, string> = new Map();
        map1.set('0', 'foo');
        map1.set('1', 'bar');
        const iterator1 = map1.entries();
        console.log(`${TAG} result:` + JSON.stringify(iterator1));
        expect(JSON.stringify(iterator1.next().value)).assertEqual('["0","foo"]');
        expect(JSON.stringify(iterator1.next().value)).assertEqual('["1","bar"]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_MAP_0800
     * @tc.name       : testMapPrototypeForEach0001
     * @tc.desc       : Test the function of the interface MapPrototypeForEach.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMapPrototypeForEach0001', 0, () => {
      const TAG = "testMapPrototypeForEach0001";
      try {
        type MapValueType = number | ObjectType | undefined;

        interface ObjectType {}

        const logMapElements = (value: MapValueType, key: string, map: Map<string, MapValueType>): void => {
          console.log(`${TAG} result: m[${key}] = ${value}`);
          if (`m[${key}] = ${value}` == `m[foo] = 3`) {
            expect(`m[${key}] = ${value}`).assertEqual(`m[foo] = 3`);
          } else if (`m[${key}] = ${value}` == `m[bar] = [object Object]`) {
            expect(`m[${key}] = ${value}`).assertEqual(`m[bar] = [object Object]`);
          } else if (`m[${key}] = ${value}` == `m[baz] = undefined`) {
            expect(`m[${key}] = ${value}`).assertEqual(`m[baz] = undefined`);
          }
        }
        const myMap = new Map<string, MapValueType>([
          ['foo', 3],
          ['bar', {} as ObjectType],
          ['baz', undefined],
        ]);
        myMap.forEach(logMapElements);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_MAP_0900
     * @tc.name       : testMapPrototypeGet0001
     * @tc.desc       : Test the function of the interface MapPrototypeGet.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMapPrototypeGet0001', 0, () => {
      const TAG = "testMapPrototypeGet0001";
      try {
        const map1: Map<string, string> = new Map();
        map1.set('bar', 'foo');
        const result = map1.get('bar');
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual('foo');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_MAP_1000
     * @tc.name       : testMapPrototypeGet0002
     * @tc.desc       : Test the function of the interface MapPrototypeGet.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMapPrototypeGet0002', 0, () => {
      const TAG = "testMapPrototypeGet0002";
      try {
        const map1: Map<string, string> = new Map();
        map1.set('bar', 'foo');
        const result = map1.get('baz');
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_MAP_1100
     * @tc.name       : testMapPrototypeGet0003
     * @tc.desc       : Test the function of the interface MapPrototypeGet.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMapPrototypeGet0003', 0, () => {
      const TAG = "testMapPrototypeGet0003";
      try {
        const arr: [] = [];
        const myMap: Map<string, string[]> = new Map();
        myMap.set("bar", arr);
        myMap.get("bar")?.push("foo");
        const result = arr;
        console.log(`${TAG} result:` + JSON.stringify(result));
        expect(JSON.stringify(result)).assertEqual('["foo"]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_MAP_1200
     * @tc.name       : testMapPrototypeGet0004
     * @tc.desc       : Test the function of the interface MapPrototypeGet.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMapPrototypeGet0004', 0, () => {
      const TAG = "testMapPrototypeGet0004";
      try {
        const arr: [] = [];
        const myMap: Map<string, string[]> = new Map();
        myMap.set("bar", arr);
        myMap.get("bar")?.push("foo");
        const result = myMap.get("bar");
        console.log(`${TAG} result:` + JSON.stringify(result));
        expect(JSON.stringify(result)).assertEqual('["foo"]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_MAP_1300
     * @tc.name       : testMapPrototypeHas0001
     * @tc.desc       : Test the function of the interface MapPrototypeHas.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMapPrototypeHas0001', 0, () => {
      const TAG = "testMapPrototypeHas0001";
      try {
        const map1: Map<string, string> = new Map();
        map1.set('bar', 'foo');
        const result = map1.has('bar');
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_MAP_1400
     * @tc.name       : testMapPrototypeHas0002
     * @tc.desc       : Test the function of the interface MapPrototypeHas.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMapPrototypeHas0002', 0, () => {
      const TAG = "testMapPrototypeHas0002";
      try {
        const map1: Map<string, string> = new Map();
        map1.set('bar', 'foo');
        const result = map1.has('baz');
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_MAP_1500
     * @tc.name       : testMapPrototypeKeys0001
     * @tc.desc       : Test the function of the interface MapPrototypeKeys.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMapPrototypeKeys0001', 0, () => {
      const TAG = "testMapPrototypeKeys0001";
      try {
        const map1: Map<string, string> = new Map();
        map1.set('0', 'foo');
        map1.set('1', 'bar');
        const iterator1 = map1.keys();
        console.log(`${TAG} result:` + JSON.stringify(iterator1));
        expect(iterator1.next().value).assertEqual('0');
        expect(iterator1.next().value).assertEqual('1');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_MAP_1600
     * @tc.name       : testMapPrototypeSet0001
     * @tc.desc       : Test the function of the interface MapPrototypeSet.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMapPrototypeSet0001', 0, () => {
      const TAG = "testMapPrototypeSet0001";
      try {
        const map1: Map<string, string> = new Map();
        map1.set('bar', 'foo');
        const result = map1.get('bar');
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual("foo");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_MAP_1700
     * @tc.name       : testMapPrototypeSet0002
     * @tc.desc       : Test the function of the interface MapPrototypeSet.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMapPrototypeSet0002', 0, () => {
      const TAG = "testMapPrototypeSet0002";
      try {
        const map1: Map<string, string> = new Map();
        map1.set('bar', 'foo');
        const result = map1.get('baz');
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_MAP_1800
     * @tc.name       : testMapPrototypeSet0003
     * @tc.desc       : Test the function of the interface MapPrototypeSet.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMapPrototypeSet0003', 0, () => {
      const TAG = "testMapPrototypeSet0003";
      try {
        const myMap: Map<string, string> = new Map();
        myMap.set("bar", "foo");
        myMap.set('1', "foobar");
        myMap.set("bar", "baz");
        const result = myMap.get('bar');
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual("baz");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_MAP_1900
     * @tc.name       : testMapPrototypeSet0004
     * @tc.desc       : Test the function of the interface MapPrototypeSet.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMapPrototypeSet0004', 0, () => {
      const TAG = "testMapPrototypeSet0004";
      try {
        const myMap: Map<string, string> = new Map();
        myMap.set("bar", "foo");
        myMap.set('1', "foobar");
        myMap.set("bar", "baz");
        const result = myMap.get('1');
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual("foobar");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_MAP_2000
     * @tc.name       : testMapPrototypeSet0005
     * @tc.desc       : Test the function of the interface MapPrototypeSet.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMapPrototypeSet0005', 0, () => {
      const TAG = "testMapPrototypeSet0005";
      try {
        const myMap: Map<string, string> = new Map();
        myMap.set("bar", "foo");
        myMap.set('1', "foobar");
        myMap.set("bar", "baz");
        const result = myMap.get('2');
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_MAP_2100
     * @tc.name       : testMapPrototypeSet0006
     * @tc.desc       : Test the function of the interface MapPrototypeSet.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMapPrototypeSet0006', 0, () => {
      const TAG = "testMapPrototypeSet0006";
      try {
        const myMap: Map<string, string> = new Map();
        myMap.set("bar", "foo").set('1', "foobar").set('2', "baz");
        const result = myMap.get('bar');
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual("foo");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_MAP_2200
     * @tc.name       : testMapPrototypeSet0007
     * @tc.desc       : Test the function of the interface MapPrototypeSet.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMapPrototypeSet0007', 0, () => {
      const TAG = "testMapPrototypeSet0007";
      try {
        const myMap: Map<string, string> = new Map();
        myMap.set("bar", "foo").set('1', "foobar").set('2', "baz");
        const result = myMap.get('1');
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual("foobar");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_MAP_2300
     * @tc.name       : testMapPrototypeSet0008
     * @tc.desc       : Test the function of the interface MapPrototypeSet.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMapPrototypeSet0008', 0, () => {
      const TAG = "testMapPrototypeSet0008";
      try {
        const myMap: Map<string, string> = new Map();
        myMap.set("bar", "foo").set('1', "foobar").set('2', "baz");
        const result = myMap.get('2');
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual("baz");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_MAP_2400
     * @tc.name       : testMapPrototypeSet0009
     * @tc.desc       : Test the function of the interface MapPrototypeSet.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMapPrototypeSet0009', 0, () => {
      const TAG = "testMapPrototypeSet0009";
      try {
        const myMap: Map<string, string> = new Map();
        myMap.set("bar", "foo").set('1', "foobar").set('2', "baz");
        const result = myMap.get('3');
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_MAP_2500
     * @tc.name       : testMapPrototype[Symbol.iterator]0001
     * @tc.desc       : Test the function of the interface MapPrototype[Symbol.iterator].
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMapPrototype[Symbol.iterator]0001', 0, () => {
      const TAG = "testMapPrototype[Symbol.iterator]0001";
      try {
        const map1: Map<string, string> = new Map();
        map1.set('0', 'foo');
        map1.set('1', 'bar');
        const iterator1 = map1[Symbol.iterator]();
        for (const item of iterator1) {
          console.log(`${TAG} result:${item}`);
          if (`${item}` == '0,foo') {
            expect(JSON.stringify(item)).assertEqual('["0","foo"]');
          } else if (`${item}` == '1,bar') {
            expect(JSON.stringify(item)).assertEqual('["1","bar"]');
          }
        }
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_MAP_2600
     * @tc.name       : testMapPrototypeValues0001
     * @tc.desc       : Test the function of the interface MapPrototypeValues.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMapPrototypeValues0001', 0, () => {
      const TAG = "testMapPrototypeValues0001";
      try {
        const map1: Map<string, string> = new Map();
        map1.set('0', 'foo');
        map1.set('1', 'bar');
        const iterator1 = map1.values();
        console.log(`${TAG} result:` + JSON.stringify(iterator1));
        expect(iterator1.next().value).assertEqual('foo');
        expect(iterator1.next().value).assertEqual('bar');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
  })
}