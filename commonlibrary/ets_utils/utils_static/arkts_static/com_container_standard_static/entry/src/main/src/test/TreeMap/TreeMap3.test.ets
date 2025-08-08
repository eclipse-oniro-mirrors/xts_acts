/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import {
  describe,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect,
  TestType,
  Level,
  Size
} from '../../../../hypium/index';
import { BusinessError } from '@ohos.base';
import TreeMap from '@ohos.util.TreeMap';
import Utils from '../Util.test';

class TestEntry {
  public id: number = 0;
}

export default function TreemapTest3() {
  describe('TreemapTest3', (): void => {
    afterEach(() => {
      await Utils.msSleep(10)
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TREEMAP_0100
     * @tc.name       : testConstructor0001
     * @tc.desc       : Test the function of the constructor function.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testConstructor0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testConstructor0001";
      try {
        let treeMap: TreeMap<number, number> = new TreeMap<number, number>();
        treeMap.set(111, 999)
        treeMap.set(222, 888)
        treeMap.set(333, 777)
        let length = treeMap.length
        expect(String(length)).assertEqual('3');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TREEMAP_0200
     * @tc.name       : testConstructor0002
     * @tc.desc       : Test the function of the constructor function.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testConstructor0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testConstructor0002";
      try {
        let treeMap: TreeMap<string, string> =
          new TreeMap<string, string>((firstValue: string, secondValue: string): number => {
            return firstValue.localeCompare(secondValue);
          });
        treeMap.set("AAA", "111")
        treeMap.set("BBB", "222")
        treeMap.set("CCC", "333")
        let length = treeMap.length
        expect(String(length)).assertEqual('3');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TREEMAP_0300
     * @tc.name       : testConstructor0003
     * @tc.desc       : Test the function of the constructor function.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testConstructor0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testConstructor0003";
      try {
        // class TestEntry {
        //   public id: number = 0;
        // }

        let ts1: TreeMap<TestEntry, string> =
          new TreeMap<TestEntry, string>((t1: TestEntry, t2: TestEntry): number => {
            return t2.id - t1.id;
          });
        let entry1: TestEntry = {
          id: 0
        };
        let entry2: TestEntry = {
          id: 1
        }
        ts1.set(entry1, "0");
        ts1.set(entry2, "1");
        expect(String(ts1.length)).assertEqual('2');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TREEMAP_0400
     * @tc.name       : testConstructor0004
     * @tc.desc       : Test the function of the constructor function.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testConstructor0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testConstructor0004";
      try {
        let ts1: TreeMap<TestEntry, string> = new TreeMap<TestEntry, string>();
        let entry1: TestEntry = {
          id: 0
        };
        let entry2: TestEntry = {
          id: 1
        }
        ts1.set(entry1, "0");
        ts1.set(entry2, "1");
        expect(String(ts1.length)).assertEqual('1');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TREEMAP_0100
     * @tc.name       : testIsEmpty0001
     * @tc.desc       : Test the function of the interface IsEmpty.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIsEmpty0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testIsEmpty0001";
      try {
        let treeMap: TreeMap<number, number> = new TreeMap<number, number>();
        let result = treeMap.isEmpty();
        expect(String(result)).assertEqual('true');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TREEMAP_0200
     * @tc.name       : testIsEmpty0002
     * @tc.desc       : Test the function of the interface IsEmpty.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIsEmpty0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testIsEmpty0002";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap<string, number>();
        treeMap.set("squirrel", 123);
        let result = treeMap.isEmpty();
        expect(String(result)).assertEqual('false');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TREEMAP_0300
     * @tc.name       : testIsEmpty0003
     * @tc.desc       : Test the function of the interface IsEmpty.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIsEmpty0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testIsEmpty0003";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap<string, number>();
        treeMap.set("squirrel", 123);
        let result = treeMap.isEmpty();
        expect(String(result)).assertEqual('false');
        treeMap.remove("squirrel");
        let result1 = treeMap.isEmpty();
        expect(String(result1)).assertEqual('true');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
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
    it('testHasKey0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testHasKey0001";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap<string, number>();
        let result = treeMap.hasKey("");
        expect(String(result)).assertEqual('false');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    // /**
    //  * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TREEMAP_0600
    //  * @tc.name       : testHasKey0002
    //  * @tc.desc       : Test the function of the interface HasKey.
    //  * @tc.size       : MediumTest
    //  * @tc.type       : Function
    //  * @tc.level      : Level 1
    //  */
    // it('testHasKey0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   const TAG = "testHasKey0002";
    //   try {
    //     let treeMap: TreeMap<string, number> = new TreeMap<string, number>();
    //     let result = treeMap.hasKey(null);
    //     expect(String(result)).assertEqual('false');
    //   } catch (err: BusinessError) {
    //     console.error(`${TAG} failed, error: ${err.code}`);
    //     expect(false).assertFail();
    //   }
    // });

    // /**
    //  * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TREEMAP_0700
    //  * @tc.name       : testHasKey0003
    //  * @tc.desc       : Test the function of the interface HasKey.
    //  * @tc.size       : MediumTest
    //  * @tc.type       : Function
    //  * @tc.level      : Level 1
    //  */
    // it('testHasKey0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   const TAG = "testHasKey0003";
    //   try {
    //     let treeMap: TreeMap<string, number> = new TreeMap<string, number>();
    //     let result = treeMap.hasKey(null);
    //     expect(String(result)).assertEqual('false');
    //   } catch (err: BusinessError) {
    //     console.error(`${TAG} failed, error: ${err.code}`);
    //     expect(false).assertFail();
    //   }
    // });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TREEMAP_0800
     * @tc.name       : testHasKey0004
     * @tc.desc       : Test the function of the interface HasKey.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testHasKey0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testHasKey0004";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap<string, number>();
        let result = treeMap.hasKey("squirrel");
        expect(String(result)).assertEqual('false');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
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
    it('testHasKey0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testHasKey0005";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap<string, number>();
        treeMap.set("squirrel", 123);
        let result = treeMap.hasKey("squirrel");
        expect(String(result)).assertEqual('true');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
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
    it('testHasKey0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testHasKey0006";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap<string, number>();
        treeMap.set("squirrel", 123);
        let result = treeMap.hasKey('goose');
        expect(String(result)).assertEqual('false');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
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
    it('testHasKey0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testHasKey0007";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap<string, number>();
        treeMap.set("squirrel", 123);
        let result = treeMap.hasKey('123');
        expect(String(result)).assertEqual('false');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
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
    // it('testHasValue0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //     const TAG = "testHasValue0001";
    //     try {
    //         let treeMap : TreeMap<string, number> = new TreeMap<string, number>();
    //         let result = treeMap.hasValue("");
    //         expect(String(result)).assertEqual('false');
    //     } catch (err: BusinessError) {
    //         console.error(`${TAG} failed, error: ${err.code}`);
    //         expect(false).assertFail();
    //     }
    // });

    // /**
    //  * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TREEMAP_1300
    //  * @tc.name       : testHasValue0002
    //  * @tc.desc       : Test the function of the interface HasValue.
    //  * @tc.size       : MediumTest
    //  * @tc.type       : Function
    //  * @tc.level      : Level 1
    //  */
    // it('testHasValue0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   const TAG = "testHasValue0002";
    //   try {
    //     let treeMap: TreeMap<string, number> = new TreeMap<string, number>();
    //     let result = treeMap.hasValue(null);
    //     expect(String(result)).assertEqual('false');
    //   } catch (err: BusinessError) {
    //     console.error(`${TAG} failed, error: ${err.code}`);
    //     expect(false).assertFail();
    //   }
    // });

    // /**
    //  * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TREEMAP_1400
    //  * @tc.name       : testHasValue0003
    //  * @tc.desc       : Test the function of the interface HasValue.
    //  * @tc.size       : MediumTest
    //  * @tc.type       : Function
    //  * @tc.level      : Level 1
    //  */
    // it('testHasValue0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   const TAG = "testHasValue0003";
    //   try {
    //     let treeMap: TreeMap<string, number> = new TreeMap<string, number>();
    //     let result = treeMap.hasValue(undefined);
    //     expect(String(result)).assertEqual('false');
    //   } catch (err: BusinessError) {
    //     console.error(`${TAG} failed, error: ${err.code}`);
    //     expect(false).assertFail();
    //   }
    // });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TREEMAP_1400
     * @tc.name       : testHasValue0004
     * @tc.desc       : Test the function of the interface HasValue.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    // it('testHasValue0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //     const TAG = "testHasValue0004";
    //     try {
    //         let treeMap : TreeMap<string, number> = new TreeMap<string, number>();
    //         let result = treeMap.hasValue("squirrel");
    //         expect(String(result)).assertEqual('false');
    //     } catch (err: BusinessError) {
    //         console.error(`${TAG} failed, error: ${err.code}`);
    //         expect(false).assertFail();
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
    it('testHasValue0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testHasValue0005";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap<string, number>();
        treeMap.set("squirrel", 123);
        let result = treeMap.hasValue(123);
        expect(String(result)).assertEqual('true');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
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
    it('testHasValue0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testHasValue0006";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap<string, number>();
        treeMap.set("squirrel", 123);
        let result = treeMap.hasValue(333);
        expect(String(result)).assertEqual('false');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
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
    it('testHasValue0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testHasValue0007";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap<string, number>();
        treeMap.set("squirrel", 123);
        treeMap.set("sparrow", 356);
        let result = treeMap.hasValue(356);
        expect(String(result)).assertEqual('true');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
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
    it('testTreeMapGet0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testTreeMapGet0001";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap<string, number>();
        let result = treeMap.get('');
        expect(String(result)).assertEqual('undefined');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    // /**
    //  * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TREEMAP_1900
    //  * @tc.name       : testTreeMapGet0002
    //  * @tc.desc       : Test the function of the interface treeMap.get.
    //  * @tc.size       : MediumTest
    //  * @tc.type       : Function
    //  * @tc.level      : Level 1
    //  */
    // it('testTreeMapGet0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   const TAG = "testTreeMapGet0002";
    //   try {
    //     let treeMap: TreeMap<string, number> = new TreeMap<string, number>();
    //     let result = treeMap.get(null);
    //     expect(String(result)).assertEqual('undefined');
    //   } catch (err: BusinessError) {
    //     console.error(`${TAG} failed, error: ${err.code}`);
    //     expect(false).assertFail();
    //   }
    // });

    // /**
    //  * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TREEMAP_2000
    //  * @tc.name       : testTreeMapGet0003
    //  * @tc.desc       : Test the function of the interface treeMap.get.
    //  * @tc.size       : MediumTest
    //  * @tc.type       : Function
    //  * @tc.level      : Level 1
    //  */
    // it('testTreeMapGet0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   const TAG = "testTreeMapGet0003";
    //   try {
    //     let treeMap: TreeMap<string, number> = new TreeMap<string, number>();
    //     let result = treeMap.get(undefined);
    //     expect(String(result)).assertEqual('undefined');
    //   } catch (err: BusinessError) {
    //     console.error(`${TAG} failed, error: ${err.code}`);
    //     expect(false).assertFail();
    //   }
    // });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TREEMAP_2100
     * @tc.name       : testTreeMapGet0004
     * @tc.desc       : Test the function of the interface treeMap.get.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTreeMapGet0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testTreeMapGet0004";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap<string, number>();
        let result = treeMap.get("key");
        expect(String(result)).assertEqual('undefined');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
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
    it('testTreeMapGet0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testTreeMapGet0005";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap<string, number>();
        treeMap.set("squirrel", 123);
        let result = treeMap.get("squirrel");
        expect(String(result)).assertEqual('123');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
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
    it('testTreeMapGet0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testTreeMapGet0006";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap<string, number>();
        treeMap.set("squirrel", 123);
        let result = treeMap.get("sparrow");
        expect(String(result)).assertEqual('undefined');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
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
    it('testTreeMapGetFirstKey0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testTreeMapGetFirstKey0001";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap<string, number>();
        let result = treeMap.getFirstKey();
        expect(String(result)).assertEqual('undefined');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
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
    it('testTreeMapGetFirstKey0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testTreeMapGetFirstKey0002";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap<string, number>();
        treeMap.set("sparrow", 356);
        let result = treeMap.getFirstKey();
        expect(String(result)).assertEqual('sparrow');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
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
    it('testTreeMapGetFirstKey0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testTreeMapGetFirstKey0003";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap<string, number>();
        treeMap.set("DEF", 123);
        treeMap.set("ABC", 356);
        let result = treeMap.getFirstKey();
        expect(String(result)).assertEqual('ABC');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
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
    it('testTreeMapGetFirstKey0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testTreeMapGetFirstKey0004";
      try {
        let treeMap: TreeMap<string, string> =
          new TreeMap<string, string>((firstValue: string, secondValue: string): number => {
            return firstValue.localeCompare(secondValue)
          });
        treeMap.set("aa", "3");
        treeMap.set("dd", "1");
        treeMap.set("cc", "2");
        treeMap.set("bb", "4");
        let result = treeMap.getFirstKey();
        expect(String(result)).assertEqual('dd');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
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
    it('testTreeMapGetFirstKey0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testTreeMapGetFirstKey0005";
      try {
        let treeMap: TreeMap<string, string> =
          new TreeMap<string, string>((firstValue: string, secondValue: string): number => {
            return secondValue.localeCompare(firstValue)
          });
        treeMap.set("aa", "3");
        treeMap.set("dd", "1");
        treeMap.set("cc", "2");
        treeMap.set("bb", "4");
        let result = treeMap.getFirstKey();
        expect(String(result)).assertEqual('aa');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
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
    it('testTreeMapGetLastKey0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testTreeMapGetLastKey0001";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap<string, number>();
        let result = treeMap.getLastKey();
        expect(String(result)).assertEqual('undefined');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
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
    it('testTreeMapGetLastKey0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testTreeMapGetLastKey0002";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap<string, number>();
        treeMap.set("DEF", 123);
        let result = treeMap.getLastKey();
        expect(String(result)).assertEqual('DEF');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
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
    it('testTreeMapGetLastKey0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testTreeMapGetLastKey0003";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap<string, number>();
        treeMap.set("HIG", 456);
        treeMap.set("DEF", 123);
        let result = treeMap.getLastKey();
        expect(String(result)).assertEqual('HIG');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
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
    it('testTreeMapGetLastKey0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testTreeMapGetLastKey0004";
      try {
        let treeMap: TreeMap<string, string> =
          new TreeMap<string, string>((firstValue: string, secondValue: string): number => {
            return secondValue.localeCompare(firstValue);
          });
        treeMap.set("HIG", "456");
        treeMap.set("DEF", "123");
        treeMap.set("XYZ", "789");
        let result = treeMap.getLastKey();
        expect(String(result)).assertEqual('XYZ');
        let result1 = treeMap.length;
        expect(String(result1)).assertEqual('3');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
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
    it('testTreeMapGetLastKey0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testTreeMapGetLastKey0005";
      try {
        let treeMap: TreeMap<string, string> =
          new TreeMap<string, string>((firstValue: string, secondValue: string): number => {
            return secondValue.localeCompare(firstValue);
          });
        treeMap.set("HIG", "456");
        treeMap.set("DEF", "123");
        treeMap.set("XYZ", "789");
        let result = treeMap.getLastKey();
        expect(String(result)).assertEqual('XYZ');
        let result1 = treeMap.length;
        expect(String(result1)).assertEqual('3');
        treeMap.clear();
        result1 = treeMap.length;
        expect(String(result1)).assertEqual('0');
        treeMap.set("ABC", '111');
        treeMap.set("JKL", '222');
        result = treeMap.getLastKey();
        expect(String(result)).assertEqual('JKL');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
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
    it('testTreeMapSetAll0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testTreeMapSetAll0001";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap<string, number>();
        let result = treeMap.length;
        expect(String(result)).assertEqual('0');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
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
    it('testTreeMapSetAll0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testTreeMapSetAll0002";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap<string, number>();
        treeMap.set("HIG", 123);
        let result = treeMap.length;
        expect(String(result)).assertEqual('1');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
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
    it('testTreeMapSetAll0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testTreeMapSetAll0003";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap<string, number>();
        treeMap.set("ABC", 123);
        treeMap.set("DEF", 456);
        treeMap.set("GHI", 789);
        treeMap.set("JKL", 222);
        treeMap.set("MNP", 333);
        let result = treeMap.length;
        expect(String(result)).assertEqual('5');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
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
    it('testTreeMapSetAll0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testTreeMapSetAll0004";
      try {
        let treeMap: TreeMap<string, string> =
          new TreeMap<string, string>((firstValue: string, secondValue: string): number => {
            return secondValue.localeCompare(firstValue);
          });
        treeMap.set("HIG", "456");
        treeMap.set("DEF", "123");
        treeMap.set("XYZ", "789");
        let result = treeMap.length;
        expect(String(result)).assertEqual('3');
        let value1 = treeMap.getFirstKey();
        let value2 = treeMap.getLastKey();
        expect(value1).assertEqual('DEF');
        expect(value2).assertEqual('XYZ');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
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
    it('testTreeMapSetAll0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testTreeMapSetAll0005";
      try {
        let treeMap: TreeMap<string, string> =
          new TreeMap<string, string>((firstValue: string, secondValue: string): number => {
            return secondValue.localeCompare(firstValue);
          });
        treeMap.set("HIG", "456");
        treeMap.set("DEF", "123");
        treeMap.set("XYZ", "789");
        let newMap: TreeMap<string, string> =
          new TreeMap<string, string>((firstValue: string, secondValue: string): number => {
            return secondValue.localeCompare(firstValue);
          });
        newMap.clear();
        newMap.setAll(treeMap);
        let result = newMap.length;
        expect(String(result)).assertEqual('3');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
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
    it('testTreeMapSetAll0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testTreeMapSetAll0006";
      try {
        let treeMap: TreeMap<string, string> =
          new TreeMap<string, string>((firstValue: string, secondValue: string): number => {
            return secondValue.localeCompare(firstValue);
          });
        treeMap.set("HIG", "456");
        treeMap.set("DEF", "123");
        treeMap.set("XYZ", "789");
        let newMap: TreeMap<string, string> =
          new TreeMap<string, string>((firstValue: string, secondValue: string): number => {
            return secondValue.localeCompare(firstValue);
          });
        newMap.clear();
        newMap.set("demo", '123');
        newMap.setAll(treeMap);
        let result = newMap.length;
        expect(String(result)).assertEqual('4');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
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
    it('testTreeMapSet0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testTreeMapSet0001";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap<string, number>();
        treeMap.set("", 123);
        let length = treeMap.length;
        expect(String(length)).assertEqual('1');
        let result = treeMap.get("");
        expect(String(result)).assertEqual('123');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
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
    it('testTreeMapSet0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testTreeMapSet0002";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap<string, number>();
        treeMap.set("a", 123);
        let length = treeMap.length;
        expect(String(length)).assertEqual('1');
        let result = treeMap.get("a");
        expect(String(result)).assertEqual('123');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    // /**
    //  * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TREEMAP_4200
    //  * @tc.name       : testTreeMapSet0003
    //  * @tc.desc       : Test the function of the interface Set.
    //  * @tc.size       : MediumTest
    //  * @tc.type       : Function
    //  * @tc.level      : Level 1
    //  */
    // it('testTreeMapSet0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   const TAG = "testTreeMapSet0003";
    //   try {
    //     let treeMap: TreeMap<string, number> = new TreeMap<string, number>();
    //     treeMap.set(null, 123);
    //     let length = treeMap.length;
    //     expect(String(length)).assertEqual('1');
    //     let result = treeMap.get(null);
    //     expect(String(result)).assertEqual('123');
    //   } catch (err: BusinessError) {
    //     console.error(`${TAG} failed, error: ${err.code}`);
    //     expect(false).assertFail();
    //   }
    // });

    // /**
    //  * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TREEMAP_4300
    //  * @tc.name       : testTreeMapSet0004
    //  * @tc.desc       : Test the function of the interface Set.
    //  * @tc.size       : MediumTest
    //  * @tc.type       : Function
    //  * @tc.level      : Level 1
    //  */
    // it('testTreeMapSet0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   const TAG = "testTreeMapSet0004";
    //   try {
    //     let treeMap: TreeMap<string, number> = new TreeMap<string, number>();
    //     treeMap.set(undefined, 123);
    //     let length = treeMap.length;
    //     expect(String(length)).assertEqual('1');
    //     let result = treeMap.get(undefined);
    //     expect(String(result)).assertEqual('123');
    //   } catch (err: BusinessError) {
    //     console.error(`${TAG} failed, error: ${err.code}`);
    //     expect(false).assertFail();
    //   }
    // });

    // /**
    //  * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TREEMAP_4400
    //  * @tc.name       : testTreeMapSet0005
    //  * @tc.desc       : Test the function of the interface Set.
    //  * @tc.size       : MediumTest
    //  * @tc.type       : Function
    //  * @tc.level      : Level 1
    //  */
    // it('testTreeMapSet0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   const TAG = "testTreeMapSet0005";
    //   try {
    //     let treeMap: TreeMap<string, number> = new TreeMap<string, number>();
    //     treeMap.set("a", null);
    //     let length = treeMap.length;
    //     expect(String(length)).assertEqual('1');
    //     let result = treeMap.get("a");
    //    expect(String(result)).assertEqual(null);
    //   } catch (err: BusinessError) {
    //     console.error(`${TAG} failed, error: ${err.code}`);
    //     expect(false).assertFail();
    //   }
    // });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TREEMAP_4500
     * @tc.name       : testTreeMapSet0006
     * @tc.desc       : Test the function of the interface Set.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTreeMapSet0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testTreeMapSet0006";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap<string, number>();
        treeMap.set("a", 1);
        let length = treeMap.length;
        expect(String(length)).assertEqual('1');
        let result = treeMap.get("a");
        expect(String(result)).assertEqual('1');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    // /**
    //  * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TREEMAP_4600
    //  * @tc.name       : testTreeMapSet0007
    //  * @tc.desc       : Test the function of the interface Set.
    //  * @tc.size       : MediumTest
    //  * @tc.type       : Function
    //  * @tc.level      : Level 1
    //  */
    // it('testTreeMapSet0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   const TAG = "testTreeMapSet0007";
    //   try {
    //     let treeMap: TreeMap<string, number> = new TreeMap<string, number>();
    //     treeMap.set("a", undefined);
    //     let length = treeMap.length;
    //     expect(String(length)).assertEqual('1');
    //     let result = treeMap.get("a");
    //     expect(String(result)).assertEqual('undefined');
    //   } catch (err: BusinessError) {
    //     console.error(`${TAG} failed, error: ${err.code}`);
    //     expect(false).assertFail();
    //   }
    // });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TREEMAP_4700
     * @tc.name       : testTreeMapSet0008
     * @tc.desc       : Test the function of the interface Set.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTreeMapSet0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testTreeMapSet0008";
      try {
        let arr = 'abc';
        let treeMap: TreeMap<string, number> = new TreeMap<string, number>();
        for (let i = 0; i < 1000; i++) {
          treeMap.set(arr + i, 123);
        }
        let length = treeMap.length;
        expect(String(length)).assertEqual('1000');
        for (let k = 0; k < 1000; k++) {
          let result = treeMap.get(arr + k);
          expect(String(result)).assertEqual('123');
        }
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
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
    it('testTreeMapRemove0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testTreeMapRemove0001";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap<string, number>();
        // treeMap.set("squirrel", 123);
        // treeMap.set("sparrow", 456);
        let result = treeMap.remove("");
        expect(String(result)).assertEqual('undefined');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    // /**
    //  * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TREEMAP_4900
    //  * @tc.name       : testTreeMapRemove0002
    //  * @tc.desc       : Test the function of the interface Set.
    //  * @tc.size       : MediumTest
    //  * @tc.type       : Function
    //  * @tc.level      : Level 1
    //  */
    // it('testTreeMapRemove0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   const TAG = "testTreeMapRemove0002";
    //   try {
    //     let treeMap: TreeMap<string, number> = new TreeMap<string, number>();
    //     let result = treeMap.remove(null);
    //     expect(String(result)).assertEqual('undefined');
    //   } catch (err: BusinessError) {
    //     console.error(`${TAG} failed, error: ${err.code}`);
    //     expect(false).assertFail();
    //   }
    // });

    // /**
    //  * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TREEMAP_5000
    //  * @tc.name       : testTreeMapRemove0003
    //  * @tc.desc       : Test the function of the interface Set.
    //  * @tc.size       : MediumTest
    //  * @tc.type       : Function
    //  * @tc.level      : Level 1
    //  */
    // it('testTreeMapRemove0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   const TAG = "testTreeMapRemove0003";
    //   try {
    //     let treeMap: TreeMap<string, number> = new TreeMap<string, number>();
    //     let result = treeMap.remove(undefined);
    //     expect(String(result)).assertEqual('undefined');
    //   } catch (err: BusinessError) {
    //     console.error(`${TAG} failed, error: ${err.code}`);
    //     expect(false).assertFail();
    //   }
    // });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TREEMAP_5100
     * @tc.name       : testTreeMapRemove0004
     * @tc.desc       : Test the function of the interface Set.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTreeMapRemove0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testTreeMapRemove0004";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap<string, number>();
        let result = treeMap.remove('key');
        expect(String(result)).assertEqual('undefined');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
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
    it('testTreeMapRemove0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testTreeMapRemove0005";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap<string, number>();
        treeMap.set("squirrel", 123);
        treeMap.set("sparrow", 456);
        let result = treeMap.remove("sparrow");
        expect(String(result)).assertEqual('456');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
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
    it('testTreeMapRemove0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testTreeMapRemove0006";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap<string, number>();
        treeMap.set("squirrel", 123);
        treeMap.set("sparrow", 456);
        let result = treeMap.remove("tiger");
        expect(String(result)).assertEqual('undefined');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
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
    it('testTreeMapGetLowerKey0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testTreeMapGetLowerKey0001";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap<string, number>();
        let result = treeMap.getLowerKey("");
        expect(String(result)).assertEqual('undefined');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    // /**
    //  * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TREEMAP_5500
    //  * @tc.name       : testTreeMapGetLowerKey0002
    //  * @tc.desc       : Test the function of the interface getLowerKey.
    //  * @tc.size       : MediumTest
    //  * @tc.type       : Function
    //  * @tc.level      : Level 1
    //  */
    // it('testTreeMapGetLowerKey0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   const TAG = "testTreeMapGetLowerKey0002";
    //   try {
    //     let treeMap: TreeMap<string, number> = new TreeMap<string, number>();
    //     let result = treeMap.getLowerKey(null);
    //     expect(String(result)).assertEqual('undefined');
    //   } catch (err: BusinessError) {
    //     console.error(`${TAG} failed, error: ${err.code}`);
    //     expect(false).assertFail();
    //   }
    // });

    // /**
    //  * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TREEMAP_5600
    //  * @tc.name       : testTreeMapGetLowerKey0003
    //  * @tc.desc       : Test the function of the interface getLowerKey.
    //  * @tc.size       : MediumTest
    //  * @tc.type       : Function
    //  * @tc.level      : Level 1
    //  */
    // it('testTreeMapGetLowerKey0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   const TAG = "testTreeMapGetLowerKey0003";
    //   try {
    //     let treeMap: TreeMap<string, number> = new TreeMap<string, number>();
    //     let result = treeMap.getLowerKey(undefined);
    //     expect(String(result)).assertEqual('undefined');
    //   } catch (err: BusinessError) {
    //     console.error(`${TAG} failed, error: ${err.code}`);
    //     expect(false).assertFail();
    //   }
    // });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TREEMAP_5700
     * @tc.name       : testTreeMapGetLowerKey0004
     * @tc.desc       : Test the function of the interface getLowerKey.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTreeMapGetLowerKey0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testTreeMapGetLowerKey0004";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap<string, number>();
        let result = treeMap.getLowerKey("key");
        expect(String(result)).assertEqual('undefined');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
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
    it('testTreeMapGetLowerKey0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testTreeMapGetLowerKey0005";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap<string, number>();
        treeMap.set("squirrel", 123);
        let result = treeMap.getLowerKey("squirrel");
        expect(String(result)).assertEqual('undefined');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
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
    it('testTreeMapGetLowerKey0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testTreeMapGetLowerKey0006";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap<string, number>();
        treeMap.set("BBB", 123);
        treeMap.set("AAA", 456);
        treeMap.set("CCC", 789);
        let result = treeMap.getLowerKey("CCC");
        expect(String(result)).assertEqual("BBB");
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
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
    it('testTreeMapGetLowerKey0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testTreeMapGetLowerKey0007";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap<string, number>();
        treeMap.set("BBB", 123);
        treeMap.set("AAA", 456);
        treeMap.set("CCC", 789);
        let result = treeMap.getLowerKey("AAA" + "1");
        expect(String(result)).assertEqual("AAA");
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
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
    it('testTreeMapGetHigherKey0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testTreeMapGetHigherKey0001";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap<string, number>();
        let result = treeMap.getHigherKey("");
        expect(String(result)).assertEqual('undefined');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    // /**
    //  * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TREEMAP_6200
    //  * @tc.name       : testTreeMapGetHigherKey0002
    //  * @tc.desc       : Test the function of the interface getHigherKey.
    //  * @tc.size       : MediumTest
    //  * @tc.type       : Function
    //  * @tc.level      : Level 1
    //  */
    // it('testTreeMapGetHigherKey0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   const TAG = "testTreeMapGetHigherKey0002";
    //   try {
    //     let treeMap: TreeMap<string, number> = new TreeMap<string, number>();
    //     let result = treeMap.getHigherKey(null);
    //     expect(String(result)).assertEqual('undefined');
    //   } catch (err: BusinessError) {
    //     console.error(`${TAG} failed, error: ${err.code}`);
    //     expect(false).assertFail();
    //   }
    // });

    // /**
    //  * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TREEMAP_6300
    //  * @tc.name       : testTreeMapGetHigherKey0003
    //  * @tc.desc       : Test the function of the interface getHigherKey.
    //  * @tc.size       : MediumTest
    //  * @tc.type       : Function
    //  * @tc.level      : Level 1
    //  */
    // it('testTreeMapGetHigherKey0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   const TAG = "testTreeMapGetHigherKey0003";
    //   try {
    //     let treeMap: TreeMap<string, number> = new TreeMap<string, number>();
    //     let result = treeMap.getHigherKey(undefined);
    //     expect(String(result)).assertEqual('undefined');
    //   } catch (err: BusinessError) {
    //     console.error(`${TAG} failed, error: ${err.code}`);
    //     expect(false).assertFail();
    //   }
    // });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TREEMAP_6400
     * @tc.name       : testTreeMapGetHigherKey0004
     * @tc.desc       : Test the function of the interface getHigherKey.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTreeMapGetHigherKey0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testTreeMapGetHigherKey0004";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap<string, number>();
        let result = treeMap.getHigherKey('key');
        expect(String(result)).assertEqual('undefined');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
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
    it('testTreeMapGetHigherKey0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testTreeMapGetHigherKey0005";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap<string, number>();
        treeMap.set("AAA", 123);
        let result = treeMap.getHigherKey('AAA');
        expect(String(result)).assertEqual('undefined');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
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
    it('testTreeMapGetHigherKey0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testTreeMapGetHigherKey0006";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap<string, number>();
        treeMap.set("BBB", 123);
        treeMap.set("AAA", 456);
        treeMap.set("CCC", 789);
        let result = treeMap.getHigherKey("BBB");
        expect(String(result)).assertEqual("CCC");
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
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
    it('testTreeMapGetHigherKey0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testTreeMapGetHigherKey0007";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap<string, number>();
        treeMap.set("BBB", 123);
        treeMap.set("AAA", 456);
        treeMap.set("CCC", 789);
        let result = treeMap.getHigherKey("BBB" + "1");
        expect(String(result)).assertEqual("CCC");
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
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
    it('testTreeMapReplaceKey0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testTreeMapReplaceKey0001";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap<string, number>();
        let result = treeMap.replace("", 123);
        expect(String(result)).assertEqual('false');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    // /**
    //  * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TREEMAP_6900
    //  * @tc.name       : testTreeMapReplaceKey0002
    //  * @tc.desc       : Test the function of the interface replace.
    //  * @tc.size       : MediumTest
    //  * @tc.type       : Function
    //  * @tc.level      : Level 1
    //  */
    // it('testTreeMapReplaceKey0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   const TAG = "testTreeMapReplaceKey0002";
    //   try {
    //     let treeMap: TreeMap<string, number> = new TreeMap<string, number>();
    //     let result = treeMap.replace(null, 123);
    //     expect(String(result)).assertEqual('false');
    //   } catch (err: BusinessError) {
    //     console.error(`${TAG} failed, error: ${err.code}`);
    //     expect(false).assertFail();
    //   }
    // });

    // /**
    //  * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TREEMAP_7000
    //  * @tc.name       : testTreeMapReplaceKey0003
    //  * @tc.desc       : Test the function of the interface replace.
    //  * @tc.size       : MediumTest
    //  * @tc.type       : Function
    //  * @tc.level      : Level 1
    //  */
    // it('testTreeMapReplaceKey0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   const TAG = "testTreeMapReplaceKey0003";
    //   try {
    //     let treeMap: TreeMap<string, number> = new TreeMap<string, number>();
    //     let result = treeMap.replace(undefined, 123);
    //     expect(String(result)).assertEqual('false');
    //   } catch (err: BusinessError) {
    //     console.error(`${TAG} failed, error: ${err.code}`);
    //     expect(false).assertFail();
    //   }
    // });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TREEMAP_7100
     * @tc.name       : testTreeMapReplaceKey0004
     * @tc.desc       : Test the function of the interface replace.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTreeMapReplaceKey0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testTreeMapReplaceKey0004";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap<string, number>();
        let result = treeMap.replace('key', 123);
        expect(String(result)).assertEqual('false');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
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
    it('testTreeMapReplaceKey0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testTreeMapReplaceKey0005";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap<string, number>();
        treeMap.set("sparrow", 123);
        let result = treeMap.replace("sparrow", 123);
        expect(String(result)).assertEqual('true');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
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
    it('testTreeMapReplaceKey0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testTreeMapReplaceKey0006";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap<string, number>();
        treeMap.set("sparrow", 123);
        let result = treeMap.replace("sparrow", 456);
        expect(String(result)).assertEqual('true');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
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
    it('testTreeMapReplaceKey0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testTreeMapReplaceKey0007";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap<string, number>();
        treeMap.set("sparrow", 123);
        let result = treeMap.replace("sparrow1", 456);
        expect(String(result)).assertEqual('false');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
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
    it('testTreeMapClear0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testTreeMapClear0001";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap<string, number>();
        let result: number | undefined = treeMap.length;
        expect(String(result)).assertEqual('0');
        result = treeMap.get('');
        expect(String(result)).assertEqual('undefined');
        let result1 = treeMap.hasKey('');
        expect(String(result1)).assertEqual('false');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
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
    it('testTreeMapClear0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testTreeMapClear0002";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap<string, number>();
        treeMap.set("squirrel", 123);
        treeMap.set("sparrow", 356);
        treeMap.clear();
        let result: number | undefined = treeMap.length;
        expect(String(result)).assertEqual('0');
        result = treeMap.get('squirrel');
        expect(String(result)).assertEqual('undefined');
        result = treeMap.get('sparrow');
        expect(String(result)).assertEqual('undefined');
        let result1 = treeMap.hasKey('squirrel');
        expect(String(result1)).assertEqual('false');

        result1 = treeMap.hasKey('sparrow');
        expect(String(result1)).assertEqual('false');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
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
    it('testTreeMapClear0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testTreeMapClear0003";
      try {
        let treeMap: TreeMap<string, string> =
          new TreeMap<string, string>((firstValue: string, secondValue: string): number => {
            return firstValue.localeCompare(secondValue);
          });
        treeMap.set("aa", "3");
        treeMap.set("dd", "1");
        treeMap.set("cc", "2");
        treeMap.set("bb", "4");
        treeMap.clear();
        let length = treeMap.length;
        expect(String(length)).assertEqual('0');
        let result = treeMap.get('aa');
        expect(String(result)).assertEqual('undefined');
        result = treeMap.get('cc');
        expect(String(result)).assertEqual('undefined');
        let result1 = treeMap.hasKey('bb');
        expect(String(result1)).assertEqual('false');
        result1 = treeMap.hasKey('dd');
        expect(String(result1)).assertEqual('false');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
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
    it('testTreeMapClear0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testTreeMapClear0004";
      try {
        let treeMap: TreeMap<string, string> =
          new TreeMap<string, string>((firstValue: string, secondValue: string): number => {
            return firstValue.localeCompare(secondValue);
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
        expect(String(length)).assertEqual('3');
        let result = treeMap.getFirstKey();
        expect(String(result)).assertEqual("CCC");
        result = treeMap.getLastKey();
        expect(String(result)).assertEqual("AAA");
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
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
    it('testTreeMapKeys0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testTreeMapClear0001";
      try {
        let treeMap: TreeMap<string, string> = new TreeMap<string, string>();
        let res = treeMap.keys();
        expect(String(res.next().done)).assertEqual('true');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
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
    it('testTreeMapKeys0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testTreeMapKeys0002";
      try {
        let treeMap: TreeMap<string, string> = new TreeMap<string, string>();
        treeMap.set('AAA', "123");
        treeMap.set('BBB', "456");
        treeMap.set('CCC', "789");
        treeMap.set('DDD', "666");
        let res = treeMap.keys();
        expect(String(res.next().value)).assertEqual('AAA');
        expect(String(res.next().value)).assertEqual('BBB');
        expect(String(res.next().value)).assertEqual('CCC');
        expect(String(res.next().value)).assertEqual('DDD');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
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
    it('testTreeMapKeys0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testTreeMapKeys0003";
      try {
        let treeMap: TreeMap<string, string> =
          new TreeMap<string, string>((firstValue: string, secondValue: string): number => {
            return firstValue.localeCompare(secondValue);
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
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
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
    it('testTreeMapValues0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testTreeMapValues0001";
      try {
        let treeMap: TreeMap<string, string> = new TreeMap<string, string>();
        let res = treeMap.values();
        expect(String(res.next().done)).assertEqual('true');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
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
    it('testTreeMapValues0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testTreeMapValues0002";
      try {
        let treeMap: TreeMap<string, string> = new TreeMap<string, string>();
        treeMap.set('AAA', "123");
        treeMap.set('BBB', "456");
        treeMap.set('CCC', "789");
        treeMap.set('DDD', "666");
        let res = treeMap.values();
        expect(String(res.next().value)).assertEqual('123');
        expect(String(res.next().value)).assertEqual('456');
        expect(String(res.next().value)).assertEqual('789');
        expect(String(res.next().value)).assertEqual('666');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
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
    it('testTreeMapValues0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testTreeMapValues0003";
      try {
        let treeMap: TreeMap<string, string> =
          new TreeMap<string, string>((firstValue: string, secondValue: string): number => {
            return firstValue.localeCompare(secondValue);
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
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
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
    it('testTreeMapForEach0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testTreeMapForEach0001";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap<string, number>();
        treeMap.forEach((value ?: number, key ?: string): void => {
          let length = treeMap.length
          expect(length).assertEqual(0)
        });
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
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
    it('testTreeMapForEach0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testTreeMapForEach0002";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap<string, number>();
        treeMap.set('AAA', 123);
        treeMap.set('BBB', 456);
        treeMap.set('CCC', 789);
        treeMap.set('DDD', 666);
        treeMap.forEach((value ?: number, key ?: string): void => {
        });
        let res = treeMap.values();
        expect(String(res.next().value)).assertEqual('123');
        expect(String(res.next().value)).assertEqual('456');
        expect(String(res.next().value)).assertEqual('789');
        expect(String(res.next().value)).assertEqual('666');
        let length = treeMap.length
        expect(String(length)).assertEqual('4')
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
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
    it('testTreeMapForEach0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testTreeMapForEach0003";
      try {
        let treeMap: TreeMap<string, string> =
          new TreeMap<string, string>((firstValue: string, secondValue: string): number => {
            return firstValue.localeCompare(secondValue);
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
        expect(String(length)).assertEqual('4');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
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
    it('testTreeMapForEach0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testTreeMapForEach0004";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap<string, number>();
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
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
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
    it('testTreeMapForEach0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testTreeMapForEach0005";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap<string, number>();
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
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
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
    it('testTreeMapForEach0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testTreeMapForEach0006";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap<string, number>();
        treeMap.set('AAA', 123);
        treeMap.set('BBB', 456);
        treeMap.set('CCC', 789);
        treeMap.set('DDD', 666);
        treeMap.forEach((value ?: number, key ?: string): void => {
        });
        treeMap.clear();
        let length = treeMap.length;
        expect(String(length)).assertEqual('0');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
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
    it('testTreeMapEntries0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testTreeMapEntries0001";
      try {
        let treeMap: TreeMap<string, string> = new TreeMap<string, string>();
        let res = treeMap.entries();
        expect(String(res.next().done)).assertEqual('true');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
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
    it('testTreeMapEntries0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testTreeMapEntries0002";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap<string, number>();
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
        expect(String(length)).assertEqual('4');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
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
    it('testTreeMapEntries0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testTreeMapEntries0003";
      try {
        let treeMap: TreeMap<string, string> =
          new TreeMap<string, string>((firstValue: string, secondValue: string): number => {
            return firstValue.localeCompare(secondValue);
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
        expect(String(length)).assertEqual('4');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
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
    it('testTreeMapEntries0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testTreeMapEntries0004";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap<string, number>();
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
        expect(String(length)).assertEqual('3');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
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
    it('testTreeMapEntries0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testTreeMapEntries0005";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap<string, number>();
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
        expect(String(length)).assertEqual('4');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
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
    it('testTreeMapEntries0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testTreeMapEntries0006";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap<string, number>();
        treeMap.set('AAA', 123);
        treeMap.set('BBB', 456);
        treeMap.set('CCC', 789);
        treeMap.set('DDD', 666);
        treeMap.entries();
        treeMap.clear();
        let length = treeMap.length;
        expect(String(length)).assertEqual('0');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
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
    it('testTreeMapForEach0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testTreeMapForEach0007";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap<string, number>();
        treeMap.set('AAA', 123);
        treeMap.set('BBB', 456);
        treeMap.set('CCC', 789);
        treeMap.set('DDD', 666);
        treeMap.forEach((): void => {
        });
        treeMap.clear();
        let length = treeMap.length;
        expect(String(length)).assertEqual('0');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
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
    it('testTreeMapForEach0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testTreeMapForEach0008";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap<string, number>();
        treeMap.set('AAA', 123);
        treeMap.forEach((value): void => {
          expect(treeMap.hasValue(value)).assertTrue();
        });
        treeMap.clear();
        let length = treeMap.length;
        expect(String(length)).assertEqual('0');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
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
    it('testTreeMapForEach0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testTreeMapForEach0009";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap<string, number>();
        treeMap.set('AAA', 123);
        treeMap.forEach((value, index, treeMap: TreeMap<string, number>): void => {
          expect(treeMap.hasValue(value)).assertTrue();
        });
        treeMap.clear();
        let length = treeMap.length;
        expect(String(length)).assertEqual('0');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    // /**
    //  * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TREEMAP_100000
    //  * @tc.name       : testTreeMapForEach0010
    //  * @tc.desc       : Test the testTreeMap of the interface forEach.
    //  * @tc.size       : MediumTest
    //  * @tc.type       : Function
    //  * @tc.level      : Level 1
    //  */
    // it('testTreeMapForEach0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   const TAG = "testTreeMapForEach0010";
    //   try {
    //     let treeMap: TreeMap<string, number> = new TreeMap<string, number>();
    //     treeMap.set('AAA', 123);
    //     treeMap.forEach((value, index, treeMap: TreeMap<string, number>): void => {
    //       expect(treeMap.hasValue(value)).assertTrue();
    //     }, treeMap);
    //     expect(treeMap.get('AAA')).assertEqual(123);
    //   } catch (err: BusinessError) {
    //     console.error(`${TAG} failed, error: ${err.code}`);
    //     expect(false).assertFail();
    //   }
    // });

  })
}