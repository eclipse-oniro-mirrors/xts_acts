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
import { TreeSet } from '@kit.ArkTS';

export default function TreeSetTest() {
  describe('treeSetTest', () => {
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
     * @tc.name   testConstructor0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TREESET_0100
     * @tc.desc   Test the function of the interface Constructor.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testConstructor0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testConstructor0001";
      try {
        const treeSet: TreeSet<number> = new TreeSet();
        treeSet.add(65536);
        let length = treeSet.length
        expect(length).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testConstructor0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TREESET_0200
     * @tc.desc   Test the function of the interface Constructor.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testConstructor0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testConstructor0002";
      try {
        let treeSet: TreeSet<string> = new TreeSet<string>((firstValue: string, secondValue: string): boolean => {
          return firstValue > secondValue
        });
        treeSet.add('AAA');
        treeSet.add('BBB');
        treeSet.add('CCC');
        let length = treeSet.length
        expect(length).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testConstructor0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TREESET_0300
     * @tc.desc   Test the function of the interface Constructor.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testConstructor0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testConstructor0003";
      try {
        class TestEntry {
          public id: number = 0;
        }

        let ts1: TreeSet<TestEntry> = new TreeSet<TestEntry>((t1: TestEntry, t2: TestEntry): boolean => {
          return t1.id > t2.id;
        });
        let entry1: TestEntry = {
          id: 0
        };
        let entry2: TestEntry = {
          id: 1
        }
        ts1.add(entry1);
        ts1.add(entry2);
        let length = ts1.length
        expect(length).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testConstructor0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TREESET_0400
     * @tc.desc   Test the function of the interface Constructor.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testConstructor0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testConstructor0004";
      try {
        class TestEntry {
          public id: number = 0;
        }

        let ts1: TreeSet<TestEntry> = new TreeSet();
        let entry1: TestEntry = {
          id: 0
        };
        let entry2: TestEntry = {
          id: 1
        }
        ts1.add(entry1);
        ts1.add(entry2);
        let length = ts1.length
        expect(length).assertEqual(1);
        console.log("treeSet: ", ts1.length);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testIsEmpty0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TREESET_0500
     * @tc.desc   Test the function of the interface isEmpty.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsEmpty0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testIsEmpty0001";
      try {
        const treeSet: TreeSet<string | number | boolean | Object> = new TreeSet();
        let result = treeSet.isEmpty();
        expect(result).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testIsEmpty0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TREESET_0600
     * @tc.desc   Test the function of the interface isEmpty.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsEmpty0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testIsEmpty0002";
      try {
        let treeSet: TreeSet<string> = new TreeSet();
        treeSet.add("squirrel");
        let result = treeSet.isEmpty();
        expect(result).assertFalse();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testIsEmpty0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TREESET_0700
     * @tc.desc   Test the function of the interface isEmpty.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsEmpty0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIsEmpty0003";
      try {
        let treeSet: TreeSet<string> = new TreeSet();
        treeSet.add("squirrel");
        treeSet.remove("squirrel");
        let result = treeSet.isEmpty();
        expect(result).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testHas0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TREESET_0800
     * @tc.desc   Test the function of the interface has.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHas0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testHas0001";
      try {
        let treeSet: TreeSet<string | number | boolean | Object> = new TreeSet();
        let result = treeSet.has("");
        expect(result).assertFalse();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testHas0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TREESET_0900
     * @tc.desc   Test the function of the interface has.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHas0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testHas0002";
      try {
        let treeSet: TreeSet<string | number | boolean | Object> = new TreeSet();
        treeSet.add("squirrel");
        let result = treeSet.has("");
        expect(result).assertFalse();
        ;
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testHas0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TREESET_1000
     * @tc.desc   Test the function of the interface has.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHas0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testHas0003";
      try {
        let treeSet: TreeSet<string | number | boolean | Object> = new TreeSet();
        let result = treeSet.has(null);
        expect(result).assertFalse();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testHas0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TREESET_1100
     * @tc.desc   Test the function of the interface has.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHas0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testHas0004";
      try {
        let treeSet: TreeSet<string | number | boolean | Object> = new TreeSet();
        treeSet.add("squirrel");
        let result = treeSet.has(null);
        expect(result).assertFalse();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testHas0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TREESET_1200
     * @tc.desc   Test the function of the interface has.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHas0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testHas0005";
      try {
        let treeSet: TreeSet<string | number | boolean | Object> = new TreeSet();
        let result = treeSet.has(undefined);
        expect(result).assertFalse();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testHas0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TREESET_1300
     * @tc.desc   Test the function of the interface has.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHas0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testHas0006";
      setTimeout(() => {
        try {
          let treeSet: TreeSet<string | number | boolean | Object> = new TreeSet();
          treeSet.add("squirrel");
          let result = treeSet.has(undefined);
          expect(result).assertFalse();
        } catch (err) {
          console.error(`${TAG} failed, error: ${err}`);
          expect().assertFail();
        }
      }, 3000);
    });

    /**
     * @tc.name   testHas0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TREESET_1400
     * @tc.desc   Test the function of the interface has.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHas0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testHas0007";
      try {
        let treeSet: TreeSet<string | number | boolean | Object> = new TreeSet();
        let result = treeSet.has(123);
        expect(result).assertFalse();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testHas0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TREESET_1500
     * @tc.desc   Test the function of the interface has.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHas0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testHas0008";
      try {
        let treeSet: TreeSet<string> = new TreeSet();
        treeSet.add("squirrel");
        let result = treeSet.has("squirrel");
        expect(result).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testHas0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TREESET_1600
     * @tc.desc   Test the function of the interface has.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHas0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testHas0009";
      try {
        let treeSet: TreeSet<string> = new TreeSet();
        treeSet.add("squirrel");
        let result = treeSet.has("AA");
        expect(result).assertFalse();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testHas0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TREESET_1700
     * @tc.desc   Test the function of the interface has.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHas0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testHas0010";
      try {
        let treeSet: TreeSet<string> = new TreeSet();
        treeSet.add("squirrel");
        let resultOne = treeSet.has("squirrel");
        expect(resultOne).assertTrue();
        expect(treeSet.length).assertEqual(1);
        treeSet.add("aa");
        let resultTwo = treeSet.has("aa");
        expect(resultTwo).assertTrue();
        expect(treeSet.length).assertEqual(2);
        treeSet.remove("squirrel");
        let resultThree = treeSet.has("squirrel");
        expect(resultThree).assertFalse();
        expect(treeSet.length).assertEqual(1);
        treeSet.add("squirrel");
        treeSet.clear();
        let resultFive = treeSet.has("aa");
        expect(resultFive).assertFalse();
        let resultSix = treeSet.has("squirrel");
        expect(resultSix).assertFalse();
        expect(treeSet.length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testGetFirstValue0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TREESET_1800
     * @tc.desc   Test the function of the interface getFirstValue.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetFirstValue0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testGetFirstValue0001";
      try {
        let treeSet: TreeSet<string> = new TreeSet();
        let result = treeSet.getFirstValue();
        expect(result).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testGetFirstValue0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TREESET_1900
     * @tc.desc   Test the function of the interface getFirstValue.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetFirstValue0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testGetFirstValue0002";
      try {
        let treeSet: TreeSet<string> = new TreeSet();
        treeSet.add("squirrel");
        let result = treeSet.getFirstValue();
        expect(result).assertEqual("squirrel");
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testGetFirstValue0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TREESET_2000
     * @tc.desc   Test the function of the interface getFirstValue.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetFirstValue0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testGetFirstValue0003";
      try {
        let treeSet: TreeSet<string> = new TreeSet();
        treeSet.add("squirrel");
        treeSet.add("sparrow");
        let result = treeSet.getFirstValue();
        expect(result).assertEqual("sparrow");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testGetFirstValue0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TREESET_2100
     * @tc.desc   Test the function of the interface getFirstValue.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetFirstValue0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testGetFirstValue0004";
      try {
        let treeSet: TreeSet<string> = new TreeSet<string>((firstValue: string, secondValue: string): boolean => {
          return firstValue > secondValue
        });
        treeSet.add("b");
        treeSet.add("c");
        treeSet.add("d");
        treeSet.add("a");
        let result = treeSet.getFirstValue();
        expect(result).assertEqual("d");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testGetLastValue0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TREESET_2200
     * @tc.desc   Test the function of the interface getLastValue.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetLastValue0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testGetLastValue0001";
      try {
        let treeSet: TreeSet<string> = new TreeSet();
        let result = treeSet.getLastValue();
        expect(result).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testGetLastValue0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TREESET_2300
     * @tc.desc   Test the function of the interface getLastValue.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetLastValue0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testGetLastValue0002";
      try {
        let treeSet: TreeSet<string> = new TreeSet();
        treeSet.add("squirrel");
        let result = treeSet.getLastValue();
        expect(result).assertEqual("squirrel");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testGetLastValue0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TREESET_2400
     * @tc.desc   Test the function of the interface getLastValue.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetLastValue0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testGetLastValue0003";
      try {
        let treeSet: TreeSet<string> = new TreeSet();
        treeSet.add("squirrel");
        treeSet.add("sparrow");
        let result = treeSet.getLastValue();
        expect(result).assertEqual("squirrel");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testGetLastValue0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TREESET_2500
     * @tc.desc   Test the function of the interface getLastValue.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetLastValue0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testGetLastValue0004";
      try {
        let treeSet: TreeSet<string> = new TreeSet<string>((firstValue: string, secondValue: string): boolean => {
          return firstValue > secondValue
        });
        treeSet.add("b");
        treeSet.add("c");
        treeSet.add("d");
        treeSet.add("a");
        let result = treeSet.getLastValue();
        expect(result).assertEqual("a");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testAdd0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TREESET_2600
     * @tc.desc   Test the function of the interface add.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAdd0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testAdd0001";
      try {
        let treeSet: TreeSet<string> = new TreeSet();
        treeSet.add("");
        expect(treeSet.length).assertEqual(1);
        let result = treeSet.has("");
        expect(result).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testAdd0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TREESET_2700
     * @tc.desc   Test the function of the interface add.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAdd0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testAdd0002";
      try {
        let treeSet: TreeSet<string> = new TreeSet();
        treeSet.add("a");
        expect(treeSet.length).assertEqual(1);
        let result = treeSet.has("a");
        expect(result).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testAdd0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TREESET_2800
     * @tc.desc   Test the function of the interface add.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAdd0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testAdd0003";
      try {
        let treeSet: TreeSet<string> = new TreeSet();
        treeSet.add(null);
        expect(treeSet.length).assertEqual(1);
        let result = treeSet.has(null);
        expect(result).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testAdd0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TREESET_2900
     * @tc.desc   Test the function of the interface add.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAdd0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testAdd0004";
      try {
        let treeSet: TreeSet<string> = new TreeSet();
        treeSet.add(undefined);
        expect(treeSet.length).assertEqual(1);
        let result = treeSet.has(undefined);
        expect(result).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testAdd0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TREESET_3000
     * @tc.desc   Test the function of the interface add.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAdd0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testAdd0005";
      try {
        let treeSet: TreeSet<string> = new TreeSet();
        treeSet.add(undefined);
        expect(treeSet.length).assertEqual(1);
        let result = treeSet.has(undefined);
        expect(result).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testAdd0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TREESET_3100
     * @tc.desc   Test the function of the interface add.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAdd0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testAdd0006";
      try {
        let treeSet: TreeSet<string> = new TreeSet();
        for (let i = 0; i < 1000; i++) {
          treeSet.add("sparrow" + i);
          expect(treeSet.has("sparrow" + i)).assertTrue();
        }
        expect(treeSet.length).assertEqual(1000);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testAdd0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TREESET_3200
     * @tc.desc   Test the function of the interface add.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAdd0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testAdd0007";
      try {
        let treeSet: TreeSet<string> = new TreeSet();
        for (let i = 0; i < 1000; i++) {
          treeSet.add("sparrow" + i);
          expect(treeSet.has("sparrow" + i)).assertTrue();
        }
        expect(treeSet.length).assertEqual(1000);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testRemove0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TREESET_3300
     * @tc.desc   Test the function of the interface remove.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRemove0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testRemove0001";
      try {
        let treeSet: TreeSet<string> = new TreeSet();
        let result = treeSet.remove("");
        expect(result).assertFalse();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testRemove0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TREESET_3400
     * @tc.desc   Test the function of the interface remove.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRemove0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testRemove0002";
      try {
        let treeSet: TreeSet<string> = new TreeSet();
        treeSet.add("squirrel");
        let result = treeSet.remove("");
        expect(result).assertFalse();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testRemove0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TREESET_3500
     * @tc.desc   Test the function of the interface remove.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRemove0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testRemove0003";
      try {
        let treeSet: TreeSet<string> = new TreeSet();
        let result = treeSet.remove(null);
        expect(result).assertFalse();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testRemove0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TREESET_3600
     * @tc.desc   Test the function of the interface remove.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRemove0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testRemove0004";
      try {
        let treeSet: TreeSet<string> = new TreeSet();
        treeSet.add("squirrel");
        let result = treeSet.remove(null);
        expect(result).assertFalse();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testRemove0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TREESET_3700
     * @tc.desc   Test the function of the interface remove.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRemove0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testRemove0005";
      try {
        let treeSet: TreeSet<string> = new TreeSet();
        let result = treeSet.remove(undefined);
        expect(result).assertFalse();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testRemove0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TREESET_3800
     * @tc.desc   Test the function of the interface remove.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRemove0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testRemove0006";
      try {
        let treeSet: TreeSet<string> = new TreeSet();
        treeSet.add("squirrel");
        let result = treeSet.remove(undefined);
        expect(result).assertFalse();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testRemove0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TREESET_3900
     * @tc.desc   Test the function of the interface remove.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRemove0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testRemove0007";
      try {
        let treeSet: TreeSet<number> = new TreeSet();
        let result = treeSet.remove(123);
        expect(result).assertFalse();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testRemove0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TREESET_4000
     * @tc.desc   Test the function of the interface remove.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRemove0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testRemove0008";
      try {
        let treeSet: TreeSet<string> = new TreeSet();
        treeSet.add("squirrel");
        let result = treeSet.remove("squirrel");
        expect(result).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testRemove0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TREESET_4100
     * @tc.desc   Test the function of the interface remove.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRemove0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testRemove0009";
      try {
        let treeSet: TreeSet<string> = new TreeSet();
        treeSet.add("squirrel");
        let result = treeSet.remove("AA");
        expect(result).assertFalse();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testGetLowerValue0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TREESET_4200
     * @tc.desc   Test the function of the interface getLowerValue.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetLowerValue0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testGetLowerValue0001";
      try {
        let treeSet: TreeSet<string> = new TreeSet();
        let result = treeSet.getLowerValue("");
        expect(result).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testGetLowerValue0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TREESET_4300
     * @tc.desc   Test the function of the interface getLowerValue.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetLowerValue0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testGetLowerValue0002";
      try {
        let treeSet: TreeSet<string> = new TreeSet();
        treeSet.getLowerValue(null);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testGetLowerValue0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TREESET_4400
     * @tc.desc   Test the function of the interface getLowerValue.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetLowerValue0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testGetLowerValue0003";
      try {
        let treeSet: TreeSet<string> = new TreeSet();
        treeSet.getLowerValue(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testGetLowerValue0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TREESET_4500
     * @tc.desc   Test the function of the interface getLowerValue.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetLowerValue0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testGetLowerValue0004";
      try {
        let treeSet: TreeSet<number> = new TreeSet();
        let result = treeSet.getLowerValue(123);
        expect(result).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testGetLowerValue0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TREESET_4600
     * @tc.desc   Test the function of the interface getLowerValue.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetLowerValue0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testGetLowerValue0005";
      try {
        let treeSet: TreeSet<number> = new TreeSet();
        let result = treeSet.getLowerValue(123);
        expect(result).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testGetLowerValue0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TREESET_4700
     * @tc.desc   Test the function of the interface getLowerValue.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetLowerValue0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testGetLowerValue0006";
      try {
        let treeSet: TreeSet<string> = new TreeSet();
        treeSet.add("squirrel");
        treeSet.add("sparrow");
        let result = treeSet.getLowerValue("squirrel");
        expect(result).assertEqual("sparrow");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testGetLowerValue0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TREESET_4800
     * @tc.desc   Test the function of the interface getLowerValue.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetLowerValue0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testGetLowerValue0007";
      try {
        let treeSet: TreeSet<string> = new TreeSet<string>((firstValue: string, secondValue: string): boolean => {
          return firstValue > secondValue
        });
        treeSet.add("b");
        treeSet.add("c");
        treeSet.add("d");
        treeSet.add("a");
        let result = treeSet.getLowerValue("c");
        expect(result).assertEqual("d");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testGetHigherValue0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TREESET_4900
     * @tc.desc   Test the function of the interface getHigherValue.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetHigherValue0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testGetHigherValue0001";
      try {
        let treeSet: TreeSet<string> = new TreeSet();
        let result = treeSet.getHigherValue("");
        expect(result).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testGetHigherValue0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TREESET_5000
     * @tc.desc   Test the function of the interface getHigherValue.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetHigherValue0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testGetHigherValue0002";
      try {
        let treeSet: TreeSet<string> = new TreeSet();
        treeSet.getHigherValue(null);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testGetHigherValue0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TREESET_5100
     * @tc.desc   Test the function of the interface getHigherValue.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetHigherValue0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testGetHigherValue0003";
      try {
        let treeSet: TreeSet<string> = new TreeSet();
        treeSet.getHigherValue(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testGetHigherValue0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TREESET_5200
     * @tc.desc   Test the function of the interface getHigherValue.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetHigherValue0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testGetHigherValue0004";
      try {
        let treeSet: TreeSet<number> = new TreeSet();
        let result = treeSet.getHigherValue(123);
        expect(result).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testGetHigherValue0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TREESET_5300
     * @tc.desc   Test the function of the interface getHigherValue.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetHigherValue0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testGetHigherValue0005";
      try {
        let treeSet: TreeSet<number> = new TreeSet();
        let result = treeSet.getHigherValue(123);
        expect(result).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testGetHigherValue0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TREESET_5400
     * @tc.desc   Test the function of the interface getHigherValue.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetHigherValue0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testGetHigherValue0006";
      try {
        let treeSet: TreeSet<string> = new TreeSet();
        treeSet.add("squirrel");
        treeSet.add("sparrow");
        let result = treeSet.getHigherValue("sparrow");
        expect(result).assertEqual("squirrel");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testGetHigherValue0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TREESET_5500
     * @tc.desc   Test the function of the interface getHigherValue.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetHigherValue0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testGetHigherValue0007";
      try {
        let treeSet: TreeSet<string> = new TreeSet<string>((firstValue: string, secondValue: string): boolean => {
          return firstValue > secondValue
        });
        treeSet.add("b");
        treeSet.add("c");
        treeSet.add("d");
        treeSet.add("a");
        let result = treeSet.getHigherValue("c");
        expect(result).assertEqual("b");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testPopFirst0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TREESET_5600
     * @tc.desc   Test the function of the interface popFirst.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPopFirst0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPopFirst0001";
      try {
        let treeSet: TreeSet<string> = new TreeSet();
        let result = treeSet.popFirst();
        expect(result).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testPopFirst0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TREESET_5700
     * @tc.desc   Test the function of the interface popFirst.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPopFirst0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPopFirst0002";
      try {
        let treeSet: TreeSet<string> = new TreeSet();
        treeSet.add("squirrel");
        treeSet.add("sparrow");
        treeSet.popFirst();
        let result = treeSet.has("sparrow");
        expect(result).assertFalse();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testPopFirst0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TREESET_5800
     * @tc.desc   Test the function of the interface popFirst.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPopFirst0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPopFirst0003";
      try {
        let treeSet: TreeSet<string> = new TreeSet<string>((firstValue: string, secondValue: string): boolean => {
          return firstValue > secondValue
        });
        treeSet.add("b");
        treeSet.add("c");
        treeSet.add("d");
        treeSet.add("a");
        treeSet.popFirst();
        let result = treeSet.has("d");
        expect(result).assertFalse();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testPopFirst0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TREESET_5900
     * @tc.desc   Test the function of the interface popFirst.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPopFirst0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPopFirst0004";
      try {
        let treeSet: TreeSet<string> = new TreeSet();
        treeSet.add("squirrel");
        treeSet.popFirst();
        let result = treeSet.has("squirrel");
        expect(result).assertFalse();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testPopFirst0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TREESET_6000
     * @tc.desc   Test the function of the interface popFirst.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPopFirst0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPopFirst0005";
      try {
        let treeSet: TreeSet<string> = new TreeSet();
        treeSet.add("squirrel");
        treeSet.remove("squirrel");
        treeSet.popFirst();
        let result = treeSet.has("squirrel");
        expect(result).assertFalse();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testPopFirst0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TREESET_6100
     * @tc.desc   Test the function of the interface popFirst.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPopFirst0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPopFirst0006";
      try {
        let treeSet: TreeSet<string> = new TreeSet();
        treeSet.add("squirrel");
        treeSet.add("sparrow");
        treeSet.clear();
        let result = treeSet.popFirst();
        expect(result).assertEqual(undefined);
        let resultOne = treeSet.has("squirrel");
        expect(resultOne).assertFalse();
        let resultTwo = treeSet.has("sparrow");
        expect(resultTwo).assertFalse();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testPopLast0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TREESET_6200
     * @tc.desc   Test the function of the interface popLast.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPopLast0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPopLast0001";
      try {
        let treeSet: TreeSet<string> = new TreeSet();
        let result = treeSet.popLast();
        expect(result).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testPopLast0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TREESET_6300
     * @tc.desc   Test the function of the interface popLast.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPopLast0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPopLast0002";
      try {
        let treeSet: TreeSet<string> = new TreeSet();
        treeSet.add("squirrel");
        treeSet.add("sparrow");
        treeSet.popLast();
        let result = treeSet.has("squirrel");
        expect(result).assertFalse();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testPopLast0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TREESET_6400
     * @tc.desc   Test the function of the interface popLast.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPopLast0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPopLast0003";
      try {
        let treeSet: TreeSet<string> = new TreeSet<string>((firstValue: string, secondValue: string): boolean => {
          return firstValue > secondValue
        });
        treeSet.add("b");
        treeSet.add("c");
        treeSet.add("d");
        treeSet.add("a");
        treeSet.popLast();
        let result = treeSet.has("a");
        expect(result).assertFalse();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testPopLast0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TREESET_6500
     * @tc.desc   Test the function of the interface popLast.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPopLast0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPopLast0004";
      try {
        let treeSet: TreeSet<string> = new TreeSet();
        treeSet.add("squirrel");
        treeSet.popLast();
        let result = treeSet.has("squirrel");
        expect(result).assertFalse();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testPopLast0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TREESET_6600
     * @tc.desc   Test the function of the interface popLast.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPopLast0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPopLast0005";
      try {
        let treeSet: TreeSet<string> = new TreeSet();
        treeSet.add("squirrel");
        treeSet.remove("squirrel");
        treeSet.popLast();
        let result = treeSet.has("squirrel");
        expect(result).assertFalse();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testPopLast0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TREESET_6700
     * @tc.desc   Test the function of the interface popLast.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPopLast0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPopLast0006";
      try {
        let treeSet: TreeSet<string> = new TreeSet();
        treeSet.add("squirrel");
        treeSet.add("sparrow");
        treeSet.clear();
        let result = treeSet.popLast();
        expect(result).assertEqual(undefined);
        let resultOne = treeSet.has("squirrel");
        expect(resultOne).assertFalse();
        let resultTwo = treeSet.has("sparrow");
        expect(resultTwo).assertFalse();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testClear0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TREESET_6800
     * @tc.desc   Test the function of the interface clear.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testClear0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testClear0001";
      try {
        let treeSet: TreeSet<string> = new TreeSet();
        treeSet.clear();
        let result = treeSet.has("");
        expect(result).assertFalse();
        expect(treeSet.length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testClear0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TREESET_6900
     * @tc.desc   Test the function of the interface clear.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testClear0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testClear0002";
      try {
        let treeSet: TreeSet<string> = new TreeSet();
        treeSet.add("squirrel");
        treeSet.add("sparrow");
        treeSet.clear();
        let result = treeSet.has("squirrel");
        expect(result).assertFalse();
        let resultOne = treeSet.has("sparrow");
        expect(resultOne).assertFalse();
        expect(treeSet.length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testClear0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TREESET_7000
     * @tc.desc   Test the function of the interface clear.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testClear0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testClear0003";
      try {
        let treeSet: TreeSet<string> = new TreeSet<string>((firstValue: string, secondValue: string): boolean => {
          return firstValue > secondValue
        });
        treeSet.add("b");
        treeSet.add("c");
        treeSet.add("d");
        treeSet.add("a");
        treeSet.clear();
        let result = treeSet.has("a");
        expect(result).assertFalse();
        let resultOne = treeSet.has("b");
        expect(resultOne).assertFalse();
        let resultTwo = treeSet.has("c");
        expect(resultTwo).assertFalse();
        let resultThree = treeSet.has("d");
        expect(resultThree).assertFalse();
        expect(treeSet.length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testValues0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TREESET_7100
     * @tc.desc   Test the function of the interface values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testValues0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testValues0001";
      try {
        let treeSet: TreeSet<string> = new TreeSet();
        let it = treeSet.values();
        let result = it.next().done;
        expect(result).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testValues0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TREESET_7200
     * @tc.desc   Test the function of the interface values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testValues0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testValues0002";
      try {
        let treeSet: TreeSet<string> = new TreeSet();
        treeSet.add('AAA');
        treeSet.add('BBB');
        treeSet.add('CCC');
        treeSet.add('DDD');
        let res = treeSet.values();
        expect(res.next().value).assertEqual('AAA');
        expect(res.next().value).assertEqual('BBB');
        expect(res.next().value).assertEqual('CCC');
        expect(res.next().value).assertEqual('DDD');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testValues0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TREESET_7300
     * @tc.desc   Test the function of the interface values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testValues0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testValues0003";
      try {
        let treeSet: TreeSet<string> = new TreeSet<string>((firstValue: string, secondValue: string): boolean => {
          return firstValue > secondValue
        });
        treeSet.add('AAA');
        treeSet.add('BBB');
        treeSet.add('CCC');
        treeSet.add('DDD');
        let res = treeSet.values();
        expect(res.next().value).assertEqual('DDD');
        expect(res.next().value).assertEqual('CCC');
        expect(res.next().value).assertEqual('BBB');
        expect(res.next().value).assertEqual('AAA');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testTreeSetForEach0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TREESET_7400
     * @tc.desc   Test the function of the interface forEach.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTreeSetForEach0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeSetForEach0001";
      try {
        let treeSet: TreeSet<string> = new TreeSet();
        treeSet.forEach((value ?: string, key ?: string): void => {
          let length = treeSet.length
          expect(length).assertEqual(0)
        });
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testTreeSetForEach0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TREESET_7500
     * @tc.desc   Test the function of the interface forEach.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTreeSetForEach0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeSetForEach0002";
      try {
        let treeSet: TreeSet<string> = new TreeSet();
        treeSet.add('AAA');
        treeSet.add('BBB');
        treeSet.add('CCC');
        treeSet.add('DDD');
        treeSet.forEach((value ?: string, key ?: string): void => {
        });
        let res = treeSet.values();
        expect(res.next().value).assertEqual('AAA');
        expect(res.next().value).assertEqual('BBB');
        expect(res.next().value).assertEqual('CCC');
        expect(res.next().value).assertEqual('DDD');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testTreeSetForEach0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TREESET_7600
     * @tc.desc   Test the function of the interface forEach.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTreeSetForEach0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeSetForEach0003";
      try {
        let treeSet: TreeSet<string> = new TreeSet<string>((firstValue: string, secondValue: string): boolean => {
          return firstValue > secondValue
        });
        treeSet.add('AAA');
        treeSet.add('BBB');
        treeSet.add('CCC');
        treeSet.add('DDD');
        treeSet.forEach((value ?: string, key ?: string): void => {
        });
        let res = treeSet.values();
        expect(res.next().value).assertEqual('DDD');
        expect(res.next().value).assertEqual('CCC');
        expect(res.next().value).assertEqual('BBB');
        expect(res.next().value).assertEqual('AAA');
        let length = treeSet.length;
        expect(length).assertEqual(4)
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testTreeSetForEach0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TREESET_7700
     * @tc.desc   Test the function of the interface forEach.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTreeSetForEach0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeSetForEach0004";
      try {
        let treeSet: TreeSet<string> = new TreeSet();
        treeSet.add('AAA');
        treeSet.add('BBB');
        treeSet.add('CCC');
        treeSet.add('DDD');
        treeSet.forEach((value ?: string, key ?: string): void => {
        });
        let res = treeSet.values();
        treeSet.remove('BBB')
        expect(res.next().value).assertEqual('AAA');
        expect(res.next().value).assertEqual('CCC');
        expect(res.next().value).assertEqual('DDD');
        let length = treeSet.length;
        expect(length).assertEqual(3)
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testTreeSetForEach0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TREESET_7800
     * @tc.desc   Test the function of the interface forEach.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTreeSetForEach0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeSetForEach0004";
      try {
        let treeSet: TreeSet<string> = new TreeSet();
        treeSet.add('AAA');
        treeSet.add('BBB');
        treeSet.add('CCC');
        treeSet.add('DDD');
        treeSet.forEach((value ?: string, key ?: string): void => {
        });
        treeSet.clear()
        let length = treeSet.length;
        expect(length).assertEqual(0)
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testTreeSetEntries0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TREESET_7900
     * @tc.desc   Test the function of the interface entries.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTreeSetEntries0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeSetEntries0001";
      try {
        let treeSet: TreeSet<string> = new TreeSet();
        let it = treeSet.entries();
        let result = it.next().done;
        expect(result).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testTreeSetEntries0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TREESET_8000
     * @tc.desc   Test the function of the interface entries.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTreeSetEntries0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeSetEntries0002";
      try {
        let treeSet: TreeSet<string> = new TreeSet();
        treeSet.add('AAA');
        treeSet.add('BBB');
        treeSet.add('CCC');
        treeSet.add('DDD');
        treeSet.entries()
        let res = treeSet.values();
        expect(res.next().value).assertEqual('AAA');
        expect(res.next().value).assertEqual('BBB');
        expect(res.next().value).assertEqual('CCC');
        expect(res.next().value).assertEqual('DDD');
        let length = treeSet.length;
        expect(length).assertEqual(4)
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testTreeSetEntries0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TREESET_8100
     * @tc.desc   Test the function of the interface entries.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTreeSetEntries0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeSetEntries0003";
      try {
        let treeSet: TreeSet<string> = new TreeSet<string>((firstValue: string, secondValue: string): boolean => {
          return firstValue > secondValue
        });
        treeSet.add('AAA');
        treeSet.add('BBB');
        treeSet.add('CCC');
        treeSet.add('DDD');
        treeSet.entries();
        let res = treeSet.values();
        expect(res.next().value).assertEqual('DDD');
        expect(res.next().value).assertEqual('CCC');
        expect(res.next().value).assertEqual('BBB');
        expect(res.next().value).assertEqual('AAA');
        let length = treeSet.length;
        expect(length).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testTreeSetEntries0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TREESET_8200
     * @tc.desc   Test the function of the interface entries.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTreeSetEntries0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeSetEntries0004";
      try {
        let treeSet: TreeSet<string> = new TreeSet();
        treeSet.add('AAA');
        treeSet.add('BBB');
        treeSet.add('CCC');
        treeSet.add('DDD');
        treeSet.entries();
        let res = treeSet.values();
        treeSet.remove("CCC");
        expect(res.next().value).assertEqual('AAA');
        expect(res.next().value).assertEqual('BBB');
        expect(res.next().value).assertEqual('DDD');
        let length = treeSet.length;
        expect(length).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testTreeSetEntries0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TREESET_8300
     * @tc.desc   Test the function of the interface entries.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTreeSetEntries0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeSetEntries0005";
      try {
        let treeSet: TreeSet<string> = new TreeSet();
        treeSet.add('AAA');
        treeSet.add('BBB');
        treeSet.add('CCC');
        treeSet.add('DDD');
        treeSet.entries();
        treeSet.clear();
        let length = treeSet.length;
        expect(length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testTreeSetForEach0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TREESET_8400
     * @tc.desc   Test the function of the interface forEach.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTreeSetForEach0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeSetForEach0006";
      try {
        let treeSet: TreeSet<string> = new TreeSet();
        treeSet.add('AAA');
        treeSet.add('BBB');
        treeSet.add('CCC');
        treeSet.add('DDD');
        treeSet.forEach((): void => {
        });
        treeSet.clear();
        let length = treeSet.length;
        expect(length).assertEqual(0)
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testTreeSetForEach0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TREESET_8500
     * @tc.desc   Test the function of the interface forEach.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTreeSetForEach0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeSetForEach0007";
      try {
        let treeSet: TreeSet<string> = new TreeSet();
        treeSet.add('AAA');
        treeSet.add('BBB');
        treeSet.add('CCC');
        treeSet.add('DDD');
        treeSet.forEach((value): void => {
          expect(treeSet.has(value)).assertTrue();
        });
        treeSet.clear();
        let length = treeSet.length;
        expect(length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testTreeSetForEach0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TREESET_8600
     * @tc.desc   Test the function of the interface forEach.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTreeSetForEach0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeSetForEach0008";
      try {
        let treeSet: TreeSet<string> = new TreeSet();
        treeSet.add('AAA');
        treeSet.add('BBB');
        treeSet.add('CCC');
        treeSet.add('DDD');
        treeSet.forEach((value, index, treeSet: TreeSet<string>): void => {
          expect(treeSet.has(value)).assertTrue()
        });
        treeSet.clear();
        let length = treeSet.length;
        expect(length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testTreeSetForEach0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TREESET_8700
     * @tc.desc   Test the function of the interface forEach.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTreeSetForEach0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeSetForEach0009";
      try {
        let treeSet: TreeSet<string> = new TreeSet();
        treeSet.add('AAA');
        treeSet.add('BBB');
        treeSet.add('CCC');
        treeSet.add('DDD');
        treeSet.forEach((value, index, treeSet: TreeSet<string>): void => {
          expect(treeSet.has(value)).assertTrue();
        }, treeSet);
        expect(treeSet.getFirstValue()).assertEqual('AAA');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testTreeSetComparatorConstruct0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TREESET_8800
     * @tc.desc   Test the comparator of construct.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTreeSetComparatorConstruct0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeSetComparatorConstruct0001";
      class A {
        time: number = 0;
        constructor(time: number) {
            this.time = time;
        }
      }
      let set = new TreeSet<A>((first: A, second: A) => {
          return first.time > second.time;
      });
      try {
        const a1 = new A(1);
        const a2 = new A(2);
        const a3 = new A(3);
        const a4 = new A(4);
        const a5 = new A(5);
        set.add(a1);
        set.add(a2);
        set.add(a3);
        set.add(a4);
        set.add(a5);
        for (let i = 0; i < 5; i++) {
            set.remove(a1);
            expect(set.has(a1)).assertEqual(false);
            set.add(a1);
        }
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testTreeSetComparatorConstruct0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TREESET_8900
     * @tc.desc   Test the comparator of construct.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTreeSetComparatorConstruct0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeSetComparatorConstruct0002";
      class A {
        name: string;
        constructor(name: string) {
            this.name = name;
        }
      }
      let set = new TreeSet<A>((first: A, second: A) => {
          return first.name > second.name;
      });
      try {
        const a1 = new A('jflksad');
        const a2 = new A('jgoijsd');
        const a3 = new A('sjdalkgj');
        const a4 = new A('jglkasdg');
        const a5 = new A('vjlkwdef');
        set.add(a1);
        set.add(a2);
        set.add(a3);
        set.add(a4);
        set.add(a5);
        for (let i = 0; i < 5; i++) {
            set.remove(a1);
            expect(set.has(a1)).assertEqual(false);
            set.add(a1);
        }
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testTreeSetComparatorConstruct0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TREESET_9000
     * @tc.desc   Test the comparator of construct.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTreeSetComparatorConstruct0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeSetComparatorConstruct0003";
      class A {
        value: number;
        name: string;
        constructor(value: number, name: string) {
            this.value = value;
            this.name = name;
        }
      }
      let set = new TreeSet<A>((first: A, second: A) => {
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
        set.add(a1);
        set.add(a2);
        set.add(a3);
        set.add(a4);
        set.add(a5);
        set.add(aa1);
        set.add(aa2);
        set.add(aa3);
        set.add(aa4);
        set.add(aa5);
        for (let i = 0; i < 5; i++) {
            set.remove(a1);
            expect(set.has(a1)).assertEqual(false);
            set.add(a1);
        }
        expect(set.length).assertEqual(10);
        expect(set.has(a1)).assertEqual(true);
        set.remove(a1);
        expect(set.has(a2)).assertEqual(true);
        set.remove(a2);
        expect(set.has(aa1)).assertEqual(true);
        set.remove(aa1);
        expect(set.has(aa2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });
  })
}