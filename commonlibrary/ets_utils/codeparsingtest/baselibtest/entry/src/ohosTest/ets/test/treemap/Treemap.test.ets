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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium'
import { TreeMap } from '@kit.ArkTS';

export default function TreemapTest() {
  describe('treeMapTest', () => {
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TREEMAP_0100
     * @tc.name       : testConstructor0001
     * @tc.desc       : Test the function of the constructor function.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testConstructor0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testConstructor0001";
      try {
        let treeMap: TreeMap<number, number> = new TreeMap();
        treeMap.set(111, 999)
        treeMap.set(222, 888)
        treeMap.set(333, 777)
        let length = treeMap.length
        expect(length).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TREEMAP_0200
     * @tc.name       : testConstructor0002
     * @tc.desc       : Test the function of the constructor function.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testConstructor0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testConstructor0002";
      try {
        let treeMap: TreeMap<string, string> =
          new TreeMap<string, string>((firstValue: string, secondValue: string): boolean => {
            return firstValue > secondValue
          });
        treeMap.set("AAA", "111")
        treeMap.set("BBB", "222")
        treeMap.set("CCC", "333")
        let length = treeMap.length
        expect(length).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TREEMAP_0300
     * @tc.name       : testConstructor0003
     * @tc.desc       : Test the function of the constructor function.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testConstructor0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testConstructor0003";
      try {
        class TestEntry {
          public id: number = 0;
        }

        let ts1: TreeMap<TestEntry, string> =
          new TreeMap<TestEntry, string>((t1: TestEntry, t2: TestEntry): boolean => {
            return t1.id < t2.id;
          });
        let entry1: TestEntry = {
          id: 0
        };
        let entry2: TestEntry = {
          id: 1
        }
        ts1.set(entry1, "0");
        ts1.set(entry2, "1");
        expect(ts1.length).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TREEMAP_0400
     * @tc.name       : testConstructor0004
     * @tc.desc       : Test the function of the constructor function.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testConstructor0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testConstructor0004";
      try {
        class TestEntry {
          public id: number = 0;
        }

        let ts1: TreeMap<TestEntry, string> = new TreeMap();
        let entry1: TestEntry = {
          id: 0
        };
        let entry2: TestEntry = {
          id: 1
        }
        ts1.set(entry1, "0");
        ts1.set(entry2, "1");
        expect(ts1.length).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TREEMAP_0100
     * @tc.name       : testIsEmpty0001
     * @tc.desc       : Test the function of the interface IsEmpty.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testIsEmpty0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testIsEmpty0001";
      try {
        let treeMap: TreeMap<number, number> = new TreeMap();
        let result = treeMap.isEmpty();
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TREEMAP_0200
     * @tc.name       : testIsEmpty0002
     * @tc.desc       : Test the function of the interface IsEmpty.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testIsEmpty0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testIsEmpty0002";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap();
        treeMap.set("squirrel", 123);
        let result = treeMap.isEmpty();
        expect(result).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TREEMAP_0300
     * @tc.name       : testIsEmpty0003
     * @tc.desc       : Test the function of the interface IsEmpty.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testIsEmpty0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testIsEmpty0003";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap();
        treeMap.set("squirrel", 123);
        let result = treeMap.isEmpty();
        expect(result).assertEqual(false);
        treeMap.remove("squirrel");
        let result1 = treeMap.isEmpty();
        expect(result1).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TREEMAP_0500
     * @tc.name       : testHasKey0001
     * @tc.desc       : Test the function of the interface HasKey.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testHasKey0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testHasKey0001";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap();
        let result = treeMap.hasKey("");
        expect(result).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TREEMAP_0600
     * @tc.name       : testHasKey0002
     * @tc.desc       : Test the function of the interface HasKey.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testHasKey0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testHasKey0002";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap();
        let result = treeMap.hasKey(null);
        expect(result).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TREEMAP_0700
     * @tc.name       : testHasKey0003
     * @tc.desc       : Test the function of the interface HasKey.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testHasKey0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testHasKey0003";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap();
        let result = treeMap.hasKey(null);
        expect(result).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TREEMAP_0800
     * @tc.name       : testHasKey0004
     * @tc.desc       : Test the function of the interface HasKey.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testHasKey0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testHasKey0004";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap();
        let result = treeMap.hasKey("squirrel");
        expect(result).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TREEMAP_0900
     * @tc.name       : testHasKey0005
     * @tc.desc       : Test the function of the interface HasKey.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testHasKey0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testHasKey0005";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap();
        treeMap.set("squirrel", 123);
        let result = treeMap.hasKey("squirrel");
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TREEMAP_1000
     * @tc.name       : testHasKey0006
     * @tc.desc       : Test the function of the interface HasKey.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testHasKey0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testHasKey0006";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap();
        treeMap.set("squirrel", 123);
        let result = treeMap.hasKey('goose');
        expect(result).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TREEMAP_1100
     * @tc.name       : testHasKey0007
     * @tc.desc       : Test the function of the interface HasKey.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testHasKey0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testHasKey0007";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap();
        treeMap.set("squirrel", 123);
        let result = treeMap.hasKey('123');
        expect(result).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TREEMAP_1200
     * @tc.name       : testHasValue0001
     * @tc.desc       : Test the function of the interface HasValue.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    // it('testHasValue0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //     const TAG = "testHasValue0001";
    //     try {
    //         let treeMap : TreeMap<string, number> = new TreeMap();
    //         let result = treeMap.hasValue("");
    //         expect(result).assertEqual(false);
    //     } catch (err) {
    //         console.error(`${TAG} failed, error: ${err.code}`);
    //         expect().assertFail();
    //     }
    // });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TREEMAP_1300
     * @tc.name       : testHasValue0002
     * @tc.desc       : Test the function of the interface HasValue.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testHasValue0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testHasValue0002";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap();
        let result = treeMap.hasValue(null);
        expect(result).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TREEMAP_1400
     * @tc.name       : testHasValue0003
     * @tc.desc       : Test the function of the interface HasValue.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testHasValue0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testHasValue0003";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap();
        let result = treeMap.hasValue(undefined);
        expect(result).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TREEMAP_1400
     * @tc.name       : testHasValue0004
     * @tc.desc       : Test the function of the interface HasValue.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    // it('testHasValue0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //     const TAG = "testHasValue0004";
    //     try {
    //         let treeMap : TreeMap<string, number> = new TreeMap();
    //         let result = treeMap.hasValue("squirrel");
    //         expect(result).assertEqual(false);
    //     } catch (err) {
    //         console.error(`${TAG} failed, error: ${err.code}`);
    //         expect().assertFail();
    //     }
    // });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TREEMAP_1500
     * @tc.name       : testHasValue0005
     * @tc.desc       : Test the function of the interface HasValue.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testHasValue0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testHasValue0005";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap();
        treeMap.set("squirrel", 123);
        let result = treeMap.hasValue(123);
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TREEMAP_1600
     * @tc.name       : testHasValue0006
     * @tc.desc       : Test the function of the interface HasValue.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testHasValue0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testHasValue0006";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap();
        treeMap.set("squirrel", 123);
        let result = treeMap.hasValue(333);
        expect(result).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TREEMAP_1700
     * @tc.name       : testHasValue0007
     * @tc.desc       : Test the function of the interface HasValue.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testHasValue0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testHasValue0007";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap();
        treeMap.set("squirrel", 123);
        treeMap.set("sparrow", 356);
        let result = treeMap.hasValue(356);
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TREEMAP_1800
     * @tc.name       : testTreeMapGet0001
     * @tc.desc       : Test the function of the interface treeMap.get.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTreeMapGet0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapGet0001";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap();
        let result = treeMap.get('');
        expect(result).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TREEMAP_1900
     * @tc.name       : testTreeMapGet0002
     * @tc.desc       : Test the function of the interface treeMap.get.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTreeMapGet0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapGet0002";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap();
        let result = treeMap.get(null);
        expect(result).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TREEMAP_2000
     * @tc.name       : testTreeMapGet0003
     * @tc.desc       : Test the function of the interface treeMap.get.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTreeMapGet0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapGet0003";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap();
        let result = treeMap.get(undefined);
        expect(result).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TREEMAP_2100
     * @tc.name       : testTreeMapGet0004
     * @tc.desc       : Test the function of the interface treeMap.get.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTreeMapGet0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapGet0004";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap();
        let result = treeMap.get("key");
        expect(result).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TREEMAP_2200
     * @tc.name       : testTreeMapGet0005
     * @tc.desc       : Test the function of the interface treeMap.get.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTreeMapGet0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapGet0005";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap();
        treeMap.set("squirrel", 123);
        let result = treeMap.get("squirrel");
        expect(result).assertEqual(123);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TREEMAP_2300
     * @tc.name       : testTreeMapGet0006
     * @tc.desc       : Test the function of the interface treeMap.get.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTreeMapGet0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapGet0006";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap();
        treeMap.set("squirrel", 123);
        let result = treeMap.get("sparrow");
        expect(result).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TREEMAP_2400
     * @tc.name       : testTreeMapGetFirstKey0001
     * @tc.desc       : Test the function of the interface getFirstKey.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTreeMapGetFirstKey0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapGetFirstKey0001";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap();
        let result = treeMap.getFirstKey();
        expect(result).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TREEMAP_2500
     * @tc.name       : testTreeMapGetFirstKey0002
     * @tc.desc       : Test the function of the interface getFirstKey.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTreeMapGetFirstKey0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapGetFirstKey0002";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap();
        treeMap.set("sparrow", 356);
        let result = treeMap.getFirstKey();
        expect(result).assertEqual('sparrow');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TREEMAP_2600
     * @tc.name       : testTreeMapGetFirstKey0003
     * @tc.desc       : Test the function of the interface getFirstKey.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTreeMapGetFirstKey0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapGetFirstKey0003";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap();
        treeMap.set("DEF", 123);
        treeMap.set("ABC", 356);
        let result = treeMap.getFirstKey();
        expect(result).assertEqual('ABC');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TREEMAP_2700
     * @tc.name       : testTreeMapGetFirstKey0004
     * @tc.desc       : Test the function of the interface getFirstKey.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTreeMapGetFirstKey0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapGetFirstKey0004";
      try {
        let treeMap: TreeMap<string, string> =
          new TreeMap<string, string>((firstValue: string, secondValue: string): boolean => {
            return firstValue > secondValue
          });
        treeMap.set("aa", "3");
        treeMap.set("dd", "1");
        treeMap.set("cc", "2");
        treeMap.set("bb", "4");
        let result = treeMap.getFirstKey();
        expect(result).assertEqual('dd');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TREEMAP_2800
     * @tc.name       : testTreeMapGetFirstKey0005
     * @tc.desc       : Test the function of the interface getFirstKey.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTreeMapGetFirstKey0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapGetFirstKey0005";
      try {
        let treeMap: TreeMap<string, string> =
          new TreeMap<string, string>((firstValue: string, secondValue: string): boolean => {
            return firstValue < secondValue
          });
        treeMap.set("aa", "3");
        treeMap.set("dd", "1");
        treeMap.set("cc", "2");
        treeMap.set("bb", "4");
        let result = treeMap.getFirstKey();
        expect(result).assertEqual('aa');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TREEMAP_2900
     * @tc.name       : testTreeMapGetLastKey0001
     * @tc.desc       : Test the function of the interface GetLastKey.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTreeMapGetLastKey0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapGetLastKey0001";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap();
        let result = treeMap.getLastKey();
        expect(result).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TREEMAP_3000
     * @tc.name       : testTreeMapGetLastKey0002
     * @tc.desc       : Test the function of the interface GetLastKey.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTreeMapGetLastKey0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapGetLastKey0002";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap();
        treeMap.set("DEF", 123);
        let result = treeMap.getLastKey();
        expect(result).assertEqual('DEF');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TREEMAP_3100
     * @tc.name       : testTreeMapGetLastKey0003
     * @tc.desc       : Test the function of the interface GetLastKey.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTreeMapGetLastKey0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapGetLastKey0003";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap();
        treeMap.set("HIG", 456);
        treeMap.set("DEF", 123);
        let result = treeMap.getLastKey();
        expect(result).assertEqual('HIG');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TREEMAP_3200
     * @tc.name       : testTreeMapGetLastKey0004
     * @tc.desc       : Test the function of the interface GetLastKey.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTreeMapGetLastKey0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapGetLastKey0004";
      try {
        let treeMap: TreeMap<string, string> =
          new TreeMap<string, string>((firstValue: string, secondValue: string): boolean => {
            return firstValue < secondValue
          });
        treeMap.set("HIG", "456");
        treeMap.set("DEF", "123");
        treeMap.set("XYZ", "789");
        let result = treeMap.getLastKey();
        expect(result).assertEqual('XYZ');
        let result1 = treeMap.length;
        expect(result1).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TREEMAP_3300
     * @tc.name       : testTreeMapGetLastKey0005
     * @tc.desc       : Test the function of the interface GetLastKey.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTreeMapGetLastKey0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapGetLastKey0005";
      try {
        let treeMap: TreeMap<string, string> =
          new TreeMap<string, string>((firstValue: string, secondValue: string): boolean => {
            return firstValue < secondValue
          });
        treeMap.set("HIG", "456");
        treeMap.set("DEF", "123");
        treeMap.set("XYZ", "789");
        let result = treeMap.getLastKey();
        expect(result).assertEqual('XYZ');
        let result1 = treeMap.length;
        expect(result1).assertEqual(3);
        treeMap.clear();
        result1 = treeMap.length;
        expect(result1).assertEqual(0);
        treeMap.set("ABC", '111');
        treeMap.set("JKL", '222');
        result = treeMap.getLastKey();
        expect(result).assertEqual('JKL');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TREEMAP_3400
     * @tc.name       : testTreeMapSetAll0001
     * @tc.desc       : Test the function of the interface SetAll.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTreeMapSetAll0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapSetAll0001";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap();
        let result = treeMap.length;
        expect(result).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TREEMAP_3500
     * @tc.name       : testTreeMapSetAll0002
     * @tc.desc       : Test the function of the interface SetAll.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTreeMapSetAll0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapSetAll0002";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap();
        treeMap.set("HIG", 123);
        let result = treeMap.length;
        expect(result).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TREEMAP_3600
     * @tc.name       : testTreeMapSetAll0003
     * @tc.desc       : Test the function of the interface SetAll.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTreeMapSetAll0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapSetAll0003";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap();
        treeMap.set("ABC", 123);
        treeMap.set("DEF", 456);
        treeMap.set("GHI", 789);
        treeMap.set("JKL", 222);
        treeMap.set("MNP", 333);
        let result = treeMap.length;
        expect(result).assertEqual(5);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TREEMAP_3700
     * @tc.name       : testTreeMapSetAll0004
     * @tc.desc       : Test the function of the interface SetAll.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTreeMapSetAll0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapSetAll0004";
      try {
        let treeMap: TreeMap<string, string> =
          new TreeMap<string, string>((firstValue: string, secondValue: string): boolean => {
            return firstValue < secondValue
          });
        treeMap.set("HIG", "456");
        treeMap.set("DEF", "123");
        treeMap.set("XYZ", "789");
        let result = treeMap.length;
        expect(result).assertEqual(3);
        let value1 = treeMap.getFirstKey();
        let value2 = treeMap.getLastKey();
        expect(value1).assertEqual('DEF');
        expect(value2).assertEqual('XYZ');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TREEMAP_3800
     * @tc.name       : testTreeMapSetAll0005
     * @tc.desc       : Test the function of the interface SetAll.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTreeMapSetAll0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapSetAll0005";
      try {
        let treeMap: TreeMap<string, string> =
          new TreeMap<string, string>((firstValue: string, secondValue: string): boolean => {
            return firstValue < secondValue
          });
        treeMap.set("HIG", "456");
        treeMap.set("DEF", "123");
        treeMap.set("XYZ", "789");
        let newMap: TreeMap<string, string> =
          new TreeMap<string, string>((firstValue: string, secondValue: string): boolean => {
            return firstValue < secondValue
          });
        newMap.clear();
        newMap.setAll(treeMap);
        let result = newMap.length;
        expect(result).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TREEMAP_3900
     * @tc.name       : testTreeMapSetAll0006
     * @tc.desc       : Test the function of the interface SetAll.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTreeMapSetAll0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapSetAll0006";
      try {
        let treeMap: TreeMap<string, string> =
          new TreeMap<string, string>((firstValue: string, secondValue: string): boolean => {
            return firstValue < secondValue
          });
        treeMap.set("HIG", "456");
        treeMap.set("DEF", "123");
        treeMap.set("XYZ", "789");
        let newMap: TreeMap<string, string> =
          new TreeMap<string, string>((firstValue: string, secondValue: string): boolean => {
            return firstValue < secondValue
          });
        newMap.clear();
        newMap.set("demo", '123');
        newMap.setAll(treeMap);
        let result = newMap.length;
        expect(result).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TREEMAP_4000
     * @tc.name       : testTreeMapSet0001
     * @tc.desc       : Test the function of the interface Set.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTreeMapSet0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapSet0001";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap();
        treeMap.set("", 123);
        let length = treeMap.length;
        expect(length).assertEqual(1);
        let result = treeMap.get("");
        expect(result).assertEqual(123);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TREEMAP_4100
     * @tc.name       : testTreeMapSet0002
     * @tc.desc       : Test the function of the interface Set.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTreeMapSet0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapSet0002";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap();
        treeMap.set("a", 123);
        let length = treeMap.length;
        expect(length).assertEqual(1);
        let result = treeMap.get("a");
        expect(result).assertEqual(123);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TREEMAP_4200
     * @tc.name       : testTreeMapSet0003
     * @tc.desc       : Test the function of the interface Set.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTreeMapSet0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapSet0003";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap();
        treeMap.set(null, 123);
        let length = treeMap.length;
        expect(length).assertEqual(1);
        let result = treeMap.get(null);
        expect(result).assertEqual(123);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TREEMAP_4300
     * @tc.name       : testTreeMapSet0004
     * @tc.desc       : Test the function of the interface Set.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTreeMapSet0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapSet0004";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap();
        treeMap.set(undefined, 123);
        let length = treeMap.length;
        expect(length).assertEqual(1);
        let result = treeMap.get(undefined);
        expect(result).assertEqual(123);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TREEMAP_4400
     * @tc.name       : testTreeMapSet0005
     * @tc.desc       : Test the function of the interface Set.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTreeMapSet0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapSet0005";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap();
        treeMap.set("a", null);
        let length = treeMap.length;
        expect(length).assertEqual(1);
        let result = treeMap.get("a");
        expect(result).assertEqual(null);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TREEMAP_4500
     * @tc.name       : testTreeMapSet0006
     * @tc.desc       : Test the function of the interface Set.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTreeMapSet0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapSet0006";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap();
        treeMap.set("a", 1);
        let length = treeMap.length;
        expect(length).assertEqual(1);
        let result = treeMap.get("a");
        expect(result).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TREEMAP_4600
     * @tc.name       : testTreeMapSet0007
     * @tc.desc       : Test the function of the interface Set.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTreeMapSet0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapSet0007";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap();
        treeMap.set("a", undefined);
        let length = treeMap.length;
        expect(length).assertEqual(1);
        let result = treeMap.get("a");
        expect(result).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TREEMAP_4700
     * @tc.name       : testTreeMapSet0008
     * @tc.desc       : Test the function of the interface Set.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTreeMapSet0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapSet0008";
      try {
        let arr = 'abc';
        let treeMap: TreeMap<string, number> = new TreeMap();
        for (let i = 0; i < 1000; i++) {
          treeMap.set(arr + i, 123);
        }
        let length = treeMap.length;
        expect(length).assertEqual(1000);
        for (let k = 0; k < 1000; k++) {
          let result = treeMap.get(arr + k);
          expect(result).assertEqual(123);
        }
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TREEMAP_4800
     * @tc.name       : testTreeMapRemove0001
     * @tc.desc       : Test the function of the interface Set.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTreeMapRemove0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapRemove0001";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap();
        // treeMap.set("squirrel", 123);
        // treeMap.set("sparrow", 456);
        let result = treeMap.remove("");
        expect(result).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TREEMAP_4900
     * @tc.name       : testTreeMapRemove0002
     * @tc.desc       : Test the function of the interface Set.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTreeMapRemove0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapRemove0002";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap();
        let result = treeMap.remove(null);
        expect(result).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TREEMAP_5000
     * @tc.name       : testTreeMapRemove0003
     * @tc.desc       : Test the function of the interface Set.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTreeMapRemove0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapRemove0003";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap();
        let result = treeMap.remove(undefined);
        expect(result).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TREEMAP_5100
     * @tc.name       : testTreeMapRemove0004
     * @tc.desc       : Test the function of the interface Set.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTreeMapRemove0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapRemove0004";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap();
        let result = treeMap.remove('key');
        expect(result).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TREEMAP_5200
     * @tc.name       : testTreeMapRemove0005
     * @tc.desc       : Test the function of the interface Set.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTreeMapRemove0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapRemove0005";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap();
        treeMap.set("squirrel", 123);
        treeMap.set("sparrow", 456);
        let result = treeMap.remove("sparrow");
        expect(result).assertEqual(456);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TREEMAP_5300
     * @tc.name       : testTreeMapRemove0006
     * @tc.desc       : Test the function of the interface Set.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTreeMapRemove0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapRemove0006";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap();
        treeMap.set("squirrel", 123);
        treeMap.set("sparrow", 456);
        let result = treeMap.remove("tiger");
        expect(result).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TREEMAP_5400
     * @tc.name       : testTreeMapGetLowerKey0001
     * @tc.desc       : Test the function of the interface getLowerKey.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTreeMapGetLowerKey0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapGetLowerKey0001";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap();
        let result = treeMap.getLowerKey("");
        expect(result).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TREEMAP_5500
     * @tc.name       : testTreeMapGetLowerKey0002
     * @tc.desc       : Test the function of the interface getLowerKey.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTreeMapGetLowerKey0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapGetLowerKey0002";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap();
        let result = treeMap.getLowerKey(null);
        expect(result).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TREEMAP_5600
     * @tc.name       : testTreeMapGetLowerKey0003
     * @tc.desc       : Test the function of the interface getLowerKey.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTreeMapGetLowerKey0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapGetLowerKey0003";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap();
        let result = treeMap.getLowerKey(undefined);
        expect(result).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TREEMAP_5700
     * @tc.name       : testTreeMapGetLowerKey0004
     * @tc.desc       : Test the function of the interface getLowerKey.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTreeMapGetLowerKey0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapGetLowerKey0004";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap();
        let result = treeMap.getLowerKey("key");
        expect(result).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TREEMAP_5800
     * @tc.name       : testTreeMapGetLowerKey0005
     * @tc.desc       : Test the function of the interface getLowerKey.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTreeMapGetLowerKey0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapGetLowerKey0005";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap();
        treeMap.set("squirrel", 123);
        let result = treeMap.getLowerKey("squirrel");
        expect(result).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TREEMAP_5900
     * @tc.name       : testTreeMapGetLowerKey0006
     * @tc.desc       : Test the function of the interface getLowerKey.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTreeMapGetLowerKey0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapGetLowerKey0006";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap();
        treeMap.set("BBB", 123);
        treeMap.set("AAA", 456);
        treeMap.set("CCC", 789);
        let result = treeMap.getLowerKey("CCC");
        expect(result).assertEqual("BBB");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TREEMAP_6000
     * @tc.name       : testTreeMapGetLowerKey0007
     * @tc.desc       : Test the function of the interface getLowerKey.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTreeMapGetLowerKey0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapGetLowerKey0007";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap();
        treeMap.set("BBB", 123);
        treeMap.set("AAA", 456);
        treeMap.set("CCC", 789);
        let result = treeMap.getLowerKey("AAA" + "1");
        expect(result).assertEqual("AAA");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TREEMAP_6100
     * @tc.name       : testTreeMapGetHigherKey0001
     * @tc.desc       : Test the function of the interface getHigherKey.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTreeMapGetHigherKey0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapGetHigherKey0001";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap();
        let result = treeMap.getHigherKey("");
        expect(result).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TREEMAP_6200
     * @tc.name       : testTreeMapGetHigherKey0002
     * @tc.desc       : Test the function of the interface getHigherKey.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTreeMapGetHigherKey0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapGetHigherKey0002";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap();
        let result = treeMap.getHigherKey(null);
        expect(result).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TREEMAP_6300
     * @tc.name       : testTreeMapGetHigherKey0003
     * @tc.desc       : Test the function of the interface getHigherKey.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTreeMapGetHigherKey0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapGetHigherKey0003";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap();
        let result = treeMap.getHigherKey(undefined);
        expect(result).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TREEMAP_6400
     * @tc.name       : testTreeMapGetHigherKey0004
     * @tc.desc       : Test the function of the interface getHigherKey.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTreeMapGetHigherKey0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapGetHigherKey0004";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap();
        let result = treeMap.getHigherKey('key');
        expect(result).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TREEMAP_6500
     * @tc.name       : testTreeMapGetHigherKey0005
     * @tc.desc       : Test the function of the interface getHigherKey.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTreeMapGetHigherKey0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapGetHigherKey0005";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap();
        treeMap.set("AAA", 123);
        let result = treeMap.getHigherKey('AAA');
        expect(result).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TREEMAP_6600
     * @tc.name       : testTreeMapGetHigherKey0006
     * @tc.desc       : Test the function of the interface getHigherKey.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTreeMapGetHigherKey0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapGetHigherKey0006";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap();
        treeMap.set("BBB", 123);
        treeMap.set("AAA", 456);
        treeMap.set("CCC", 789);
        let result = treeMap.getHigherKey("BBB");
        expect(result).assertEqual("CCC");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TREEMAP_6700
     * @tc.name       : testTreeMapGetHigherKey0007
     * @tc.desc       : Test the function of the interface getHigherKey.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTreeMapGetHigherKey0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapGetHigherKey0007";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap();
        treeMap.set("BBB", 123);
        treeMap.set("AAA", 456);
        treeMap.set("CCC", 789);
        let result = treeMap.getHigherKey("BBB" + "1");
        expect(result).assertEqual("CCC");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TREEMAP_6800
     * @tc.name       : testTreeMapReplaceKey0001
     * @tc.desc       : Test the function of the interface replace.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTreeMapReplaceKey0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapReplaceKey0001";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap();
        let result = treeMap.replace("", 123);
        expect(result).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TREEMAP_6900
     * @tc.name       : testTreeMapReplaceKey0002
     * @tc.desc       : Test the function of the interface replace.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTreeMapReplaceKey0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapReplaceKey0002";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap();
        let result = treeMap.replace(null, 123);
        expect(result).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TREEMAP_7000
     * @tc.name       : testTreeMapReplaceKey0003
     * @tc.desc       : Test the function of the interface replace.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTreeMapReplaceKey0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapReplaceKey0003";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap();
        let result = treeMap.replace(undefined, 123);
        expect(result).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TREEMAP_7100
     * @tc.name       : testTreeMapReplaceKey0004
     * @tc.desc       : Test the function of the interface replace.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTreeMapReplaceKey0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapReplaceKey0004";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap();
        let result = treeMap.replace('key', 123);
        expect(result).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TREEMAP_7200
     * @tc.name       : testTreeMapReplaceKey0005
     * @tc.desc       : Test the function of the interface replace.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTreeMapReplaceKey0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapReplaceKey0005";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap();
        treeMap.set("sparrow", 123);
        let result = treeMap.replace("sparrow", 123);
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TREEMAP_7300
     * @tc.name       : testTreeMapReplaceKey0006
     * @tc.desc       : Test the function of the interface replace.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTreeMapReplaceKey0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapReplaceKey0006";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap();
        treeMap.set("sparrow", 123);
        let result = treeMap.replace("sparrow", 456);
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TREEMAP_7400
     * @tc.name       : testTreeMapReplaceKey0007
     * @tc.desc       : Test the function of the interface replace.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTreeMapReplaceKey0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapReplaceKey0007";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap();
        treeMap.set("sparrow", 123);
        let result = treeMap.replace("sparrow1", 456);
        expect(result).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TREEMAP_7500
     * @tc.name       : testTreeMapClear0001
     * @tc.desc       : Test the function of the interface clear.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTreeMapClear0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapClear0001";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap();
        let result = treeMap.length;
        expect(result).assertEqual(0);
        result = treeMap.get('');
        expect(result).assertEqual(undefined);
        let result1 = treeMap.hasKey('');
        expect(result1).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TREEMAP_7600
     * @tc.name       : testTreeMapClear0002
     * @tc.desc       : Test the function of the interface clear.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTreeMapClear0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapClear0002";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap();
        treeMap.set("squirrel", 123);
        treeMap.set("sparrow", 356);
        treeMap.clear();
        let result = treeMap.length;
        expect(result).assertEqual(0);
        result = treeMap.get('squirrel');
        expect(result).assertEqual(undefined);
        result = treeMap.get('sparrow');
        expect(result).assertEqual(undefined);
        let result1 = treeMap.hasKey('squirrel');
        expect(result1).assertEqual(false);
        result1 = treeMap.hasKey('sparrow');
        expect(result1).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TREEMAP_7700
     * @tc.name       : testTreeMapClear0003
     * @tc.desc       : Test the function of the interface clear.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTreeMapClear0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapClear0003";
      try {
        let treeMap: TreeMap<string, string> =
          new TreeMap<string, string>((firstValue: string, secondValue: string): boolean => {
            return firstValue > secondValue
          });
        treeMap.set("aa", "3");
        treeMap.set("dd", "1");
        treeMap.set("cc", "2");
        treeMap.set("bb", "4");
        treeMap.clear();
        let length = treeMap.length;
        expect(length).assertEqual(0);
        let result = treeMap.get('aa');
        expect(result).assertEqual(undefined);
        result = treeMap.get('cc');
        expect(result).assertEqual(undefined);
        let result1 = treeMap.hasKey('bb');
        expect(result1).assertEqual(false);
        result1 = treeMap.hasKey('dd');
        expect(result1).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TREEMAP_7800
     * @tc.name       : testTreeMapClear0004
     * @tc.desc       : Test the function of the interface clear.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTreeMapClear0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapClear0004";
      try {
        let treeMap: TreeMap<string, string> =
          new TreeMap<string, string>((firstValue: string, secondValue: string): boolean => {
            return firstValue > secondValue
          });
        treeMap.set("aa", "3");
        treeMap.set("dd", "1");
        treeMap.set("cc", "2");
        treeMap.set("bb", "4");
        treeMap.clear();
        treeMap.set("AAA", "111");
        treeMap.set("BBB", "222");
        treeMap.set("CCC", "333");
        let length = treeMap.length;
        expect(length).assertEqual(3);
        let result = treeMap.getFirstKey();
        expect(result).assertEqual("CCC");
        result = treeMap.getLastKey();
        expect(result).assertEqual("AAA");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TREEMAP_7900
     * @tc.name       : testTreeMapKeys0001
     * @tc.desc       : Test the testTreeMap of the interface keys.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTreeMapKeys0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapClear0001";
      try {
        let treeMap: TreeMap<string, string> = new TreeMap();
        let res = treeMap.keys();
        expect(res.next().done).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TREEMAP_8000
     * @tc.name       : testTreeMapKeys0002
     * @tc.desc       : Test the testTreeMap of the interface keys.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTreeMapKeys0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapKeys0002";
      try {
        let treeMap: TreeMap<string, string> = new TreeMap();
        treeMap.set('AAA', "123");
        treeMap.set('BBB', "456");
        treeMap.set('CCC', "789");
        treeMap.set('DDD', "666");
        let res = treeMap.keys();
        expect(res.next().value).assertEqual('AAA');
        expect(res.next().value).assertEqual('BBB');
        expect(res.next().value).assertEqual('CCC');
        expect(res.next().value).assertEqual('DDD');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });


    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TREEMAP_8100
     * @tc.name       : testTreeMapKeys0003
     * @tc.desc       : Test the testTreeMap of the interface keys.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTreeMapKeys0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapKeys0003";
      try {
        let treeMap: TreeMap<string, string> =
          new TreeMap<string, string>((firstValue: string, secondValue: string): boolean => {
            return firstValue > secondValue
          });
        treeMap.set('AAA', "123");
        treeMap.set('BBB', "456");
        treeMap.set('CCC', "789");
        treeMap.set('DDD', "666");
        let res = treeMap.keys();
        expect(res.next().value).assertEqual('DDD');
        expect(res.next().value).assertEqual('CCC');
        expect(res.next().value).assertEqual('BBB');
        expect(res.next().value).assertEqual('AAA');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TREEMAP_8200
     * @tc.name       : testTreeMapValues0001
     * @tc.desc       : Test the testTreeMap of the interface values.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTreeMapValues0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapValues0001";
      try {
        let treeMap: TreeMap<string, string> = new TreeMap();
        let res = treeMap.values();
        expect(res.next().done).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TREEMAP_8300
     * @tc.name       : testTreeMapValues0002
     * @tc.desc       : Test the testTreeMap of the interface values.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTreeMapValues0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapValues0002";
      try {
        let treeMap: TreeMap<string, string> = new TreeMap();
        treeMap.set('AAA', "123");
        treeMap.set('BBB', "456");
        treeMap.set('CCC', "789");
        treeMap.set('DDD', "666");
        let res = treeMap.values();
        expect(res.next().value).assertEqual('123');
        expect(res.next().value).assertEqual('456');
        expect(res.next().value).assertEqual('789');
        expect(res.next().value).assertEqual('666');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TREEMAP_8400
     * @tc.name       : testTreeMapValues0003
     * @tc.desc       : Test the testTreeMap of the interface values.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTreeMapValues0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapValues0003";
      try {
        let treeMap: TreeMap<string, string> =
          new TreeMap<string, string>((firstValue: string, secondValue: string): boolean => {
            return firstValue > secondValue
          });
        treeMap.set('AAA', "123");
        treeMap.set('BBB', "456");
        treeMap.set('CCC', "789");
        treeMap.set('DDD', "666");
        let res = treeMap.values();
        expect(res.next().value).assertEqual('666');
        expect(res.next().value).assertEqual('789');
        expect(res.next().value).assertEqual('456');
        expect(res.next().value).assertEqual('123');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TREEMAP_8500
     * @tc.name       : testTreeMapForEach0001
     * @tc.desc       : Test the testTreeMap of the interface forEach.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTreeMapForEach0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapForEach0001";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap();
        treeMap.forEach((value ?: number, key ?: string): void => {
          let length = treeMap.length
          expect(length).assertEqual(0)
        });
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TREEMAP_8600
     * @tc.name       : testTreeMapForEach0002
     * @tc.desc       : Test the testTreeMap of the interface forEach.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTreeMapForEach0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapForEach0002";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap();
        treeMap.set('AAA', 123);
        treeMap.set('BBB', 456);
        treeMap.set('CCC', 789);
        treeMap.set('DDD', 666);
        treeMap.forEach((value ?: number, key ?: string): void => {
        });
        let res = treeMap.values();
        expect(res.next().value).assertEqual(123);
        expect(res.next().value).assertEqual(456);
        expect(res.next().value).assertEqual(789);
        expect(res.next().value).assertEqual(666);
        let length = treeMap.length
        expect(length).assertEqual(4)
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TREEMAP_8700
     * @tc.name       : testTreeMapForEach0003
     * @tc.desc       : Test the testTreeMap of the interface forEach.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTreeMapForEach0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapForEach0003";
      try {
        let treeMap: TreeMap<string, string> =
          new TreeMap<string, string>((firstValue: string, secondValue: string): boolean => {
            return firstValue > secondValue
          });
        treeMap.set('AAA', '123');
        treeMap.set('BBB', '456');
        treeMap.set('CCC', '789');
        treeMap.set('DDD', '666');
        treeMap.forEach((value ?: string, key ?: string): void => {
        });
        let res = treeMap.values();
        expect(res.next().value).assertEqual('666');
        expect(res.next().value).assertEqual('789');
        expect(res.next().value).assertEqual('456');
        expect(res.next().value).assertEqual('123');
        let length = treeMap.length
        expect(length).assertEqual(4)
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TREEMAP_8800
     * @tc.name       : testTreeMapForEach0004
     * @tc.desc       : Test the testTreeMap of the interface forEach.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTreeMapForEach0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapForEach0004";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap();
        treeMap.set('AAA', 123);
        treeMap.set('BBB', 456);
        treeMap.set('CCC', 789);
        treeMap.set('DDD', 666);
        treeMap.forEach((value ?: number, key ?: string): void => {
        });
        treeMap.remove("BBB")
        let res = treeMap.values();
        expect(res.next().value).assertEqual(123);
        expect(res.next().value).assertEqual(789);
        expect(res.next().value).assertEqual(666);
        let length = treeMap.length
        expect(length).assertEqual(3)
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TREEMAP_8900
     * @tc.name       : testTreeMapForEach0005
     * @tc.desc       : Test the testTreeMap of the interface forEach.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTreeMapForEach0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapForEach0005";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap();
        treeMap.set('AAA', 123);
        treeMap.set('BBB', 456);
        treeMap.set('CCC', 789);
        treeMap.set('DDD', 666);
        treeMap.forEach((value ?: number, key ?: string): void => {
        });
        treeMap.replace("BBB", 555)
        let res = treeMap.values();
        expect(res.next().value).assertEqual(123);
        expect(res.next().value).assertEqual(555);
        expect(res.next().value).assertEqual(789);
        expect(res.next().value).assertEqual(666);
        let length = treeMap.length
        expect(length).assertEqual(4)
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TREEMAP_9000
     * @tc.name       : testTreeMapForEach0006
     * @tc.desc       : Test the testTreeMap of the interface forEach.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTreeMapForEach0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapForEach0006";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap();
        treeMap.set('AAA', 123);
        treeMap.set('BBB', 456);
        treeMap.set('CCC', 789);
        treeMap.set('DDD', 666);
        treeMap.forEach((value ?: number, key ?: string): void => {
        });
        treeMap.clear();
        let length = treeMap.length;
        expect(length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TREEMAP_9100
     * @tc.name       : testTreeMapEntries0001
     * @tc.desc       : Test the testTreeMap of the interface entries.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTreeMapEntries0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapEntries0001";
      try {
        let treeMap: TreeMap<string, string> = new TreeMap();
        let res = treeMap.entries();
        expect(res.next().done).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TREEMAP_9200
     * @tc.name       : testTreeMapEntries0002
     * @tc.desc       : Test the testTreeMapForEach of the interface entries.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTreeMapEntries0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapEntries0002";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap();
        treeMap.set('AAA', 123);
        treeMap.set('BBB', 456);
        treeMap.set('CCC', 789);
        treeMap.set('DDD', 666);
        treeMap.entries();
        let res = treeMap.values();
        expect(res.next().value).assertEqual(123);
        expect(res.next().value).assertEqual(456);
        expect(res.next().value).assertEqual(789);
        expect(res.next().value).assertEqual(666);
        let length = treeMap.length;
        expect(length).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TREEMAP_9300
     * @tc.name       : testTreeMapEntries0003
     * @tc.desc       : Test the testTreeMap of the interface entries.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTreeMapEntries0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapEntries0003";
      try {
        let treeMap: TreeMap<string, string> =
          new TreeMap<string, string>((firstValue: string, secondValue: string): boolean => {
            return firstValue > secondValue
          });
        treeMap.set('AAA', '123');
        treeMap.set('BBB', '456');
        treeMap.set('CCC', '789');
        treeMap.set('DDD', '666');
        treeMap.entries();
        let res = treeMap.values();
        expect(res.next().value).assertEqual('666');
        expect(res.next().value).assertEqual('789');
        expect(res.next().value).assertEqual('456');
        expect(res.next().value).assertEqual('123');
        let length = treeMap.length;
        expect(length).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TREEMAP_9400
     * @tc.name       : testTreeMapEntries0004
     * @tc.desc       : Test the testTreeMap of the interface entries.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTreeMapEntries0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapEntries0004";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap();
        treeMap.set('AAA', 123);
        treeMap.set('BBB', 456);
        treeMap.set('CCC', 789);
        treeMap.set('DDD', 666);
        treeMap.entries();
        treeMap.remove("BBB");
        let res = treeMap.values();
        expect(res.next().value).assertEqual(123);
        expect(res.next().value).assertEqual(789);
        expect(res.next().value).assertEqual(666);
        let length = treeMap.length;
        expect(length).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TREEMAP_9500
     * @tc.name       : testTreeMapForEach0005
     * @tc.desc       : Test the testTreeMap of the interface entryies.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTreeMapEntries0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapEntries0005";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap();
        treeMap.set('AAA', 123);
        treeMap.set('BBB', 456);
        treeMap.set('CCC', 789);
        treeMap.set('DDD', 666);
        treeMap.entries();
        treeMap.replace("BBB", 555);
        let res = treeMap.values();
        expect(res.next().value).assertEqual(123);
        expect(res.next().value).assertEqual(555);
        expect(res.next().value).assertEqual(789);
        expect(res.next().value).assertEqual(666);
        let length = treeMap.length;
        expect(length).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TREEMAP_9600
     * @tc.name       : testTreeMapEntries0006
     * @tc.desc       : Test the testTreeMap of the interface entryies.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTreeMapEntries0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapEntries0006";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap();
        treeMap.set('AAA', 123);
        treeMap.set('BBB', 456);
        treeMap.set('CCC', 789);
        treeMap.set('DDD', 666);
        treeMap.entries();
        treeMap.clear();
        let length = treeMap.length;
        expect(length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TREEMAP_9700
     * @tc.name       : testTreeMapForEach0007
     * @tc.desc       : Test the testTreeMap of the interface forEach.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTreeMapForEach0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapForEach0007";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap();
        treeMap.set('AAA', 123);
        treeMap.set('BBB', 456);
        treeMap.set('CCC', 789);
        treeMap.set('DDD', 666);
        treeMap.forEach((): void => {
        });
        treeMap.clear();
        let length = treeMap.length;
        expect(length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TREEMAP_9800
     * @tc.name       : testTreeMapForEach0008
     * @tc.desc       : Test the testTreeMap of the interface forEach.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTreeMapForEach0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapForEach0008";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap();
        treeMap.set('AAA', 123);
        treeMap.forEach((value): void => {
          expect(treeMap.hasValue(value)).assertTrue();
        });
        treeMap.clear();
        let length = treeMap.length;
        expect(length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TREEMAP_9900
     * @tc.name       : testTreeMapForEach0009
     * @tc.desc       : Test the testTreeMap of the interface forEach.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTreeMapForEach0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapForEach0009";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap();
        treeMap.set('AAA', 123);
        treeMap.forEach((value, index, treeMap: TreeMap<string, number>): void => {
          expect(treeMap.hasValue(value)).assertTrue();
        });
        treeMap.clear();
        let length = treeMap.length;
        expect(length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TREEMAP_100000
     * @tc.name       : testTreeMapForEach0010
     * @tc.desc       : Test the testTreeMap of the interface forEach.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTreeMapForEach0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapForEach0010";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap();
        treeMap.set('AAA', 123);
        treeMap.forEach((value, index, treeMap: TreeMap<string, number>): void => {
          expect(treeMap.hasValue(value)).assertTrue();
        }, treeMap);
        expect(treeMap.get('AAA')).assertEqual(123);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TREEMAP_101000
     * @tc.name       : testTreeMapComparatorConstruct0001
     * @tc.desc       : Test the comparator of construct.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTreeMapComparatorConstruct0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapComparatorConstruct0001";
      class A {
        time: number = 0;
        constructor(time: number) {
            this.time = time;
        }
      }
      let mp: TreeMap<A, number> = new TreeMap((first: A, second: A) => {
          return first.time > second.time;
      });
      try {
        const a1 = new A(1);
        const a2 = new A(2);
        const a3 = new A(3);
        const a4 = new A(4);
        const a5 = new A(5);
        mp.set(a1, 1);
        mp.set(a2, 2);
        mp.set(a3, 3);
        mp.set(a4, 4);
        mp.set(a5, 5);
        for (let i = 0; i < 5; i++) {
            mp.remove(a1);
            expect(mp.hasKey(a1)).assertEqual(false);
            mp.set(a1, 1);
        }
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TREESET_102000
     * @tc.name       : testTreeMapComparatorConstruct0002
     * @tc.desc       : Test the comparator of construct.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTreeMapComparatorConstruct0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapComparatorConstruct0002";
      class A {
        name: string;
        constructor(name: string) {
            this.name = name;
        }
      }
      let mp: TreeMap<A, number> = new TreeMap((first: A, second: A) => {
          return first.name > second.name;
      });
      try {
        const a1 = new A('jflksad');
        const a2 = new A('jgoijsd');
        const a3 = new A('sjdalkgj');
        const a4 = new A('jglkasdg');
        const a5 = new A('vjlkwdef');
        mp.set(a1, 1);
        mp.set(a2, 2);
        mp.set(a3, 3);
        mp.set(a4, 4);
        mp.set(a5, 5);
        for (let i = 0; i < 5; i++) {
            mp.remove(a1);
            expect(mp.hasKey(a1)).assertEqual(false);
            mp.set(a1, 1);
        }
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TREEMAP_103000
     * @tc.name       : testTreeMapComparatorConstruct0003
     * @tc.desc       : Test the comparator of construct.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTreeMapComparatorConstruct0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapComparatorConstruct0003";
      class A {
        value: number;
        name: string;
        constructor(value: number, name: string) {
            this.value = value;
            this.name = name;
        }
      }
      let mp: TreeMap<A, number> = new TreeMap((first: A, second: A) => {
        if (first.value == second.value) {
          return first.name > second.name;
        }
        return first.value > second.value;
      });
      try {
        const a1 = new A(1, 'abc');
        const a2 = new A(2, 'abc');
        const a3 = new A(3, 'abc');
        const a4 = new A(4, 'abc');
        const a5 = new A(5, 'abc');
        const aa1 = new A(1, 'aac');
        const aa2 = new A(2, 'aac');
        const aa3 = new A(3, 'aac');
        const aa4 = new A(4, 'aac');
        const aa5 = new A(5, 'aac');
        mp.set(a1, 1);
        mp.set(a2, 2);
        mp.set(a3, 3);
        mp.set(a4, 4);
        mp.set(a5, 5);
        mp.set(aa1, 1);
        mp.set(aa2, 1);
        mp.set(aa3, 1);
        mp.set(aa4, 1);
        mp.set(aa5, 1);
        for (let i = 0; i < 5; i++) {
            mp.remove(a1);
            expect(mp.hasKey(a1)).assertEqual(false);
            mp.set(a1, 1);
        }
        expect(mp.length).assertEqual(10);
        expect(mp.hasKey(a1)).assertEqual(true);
        mp.remove(a1);
        expect(mp.hasKey(a2)).assertEqual(true);
        mp.remove(a2);
        expect(mp.hasKey(aa1)).assertEqual(true);
        mp.remove(aa1);
        expect(mp.hasKey(aa2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });
  })
}