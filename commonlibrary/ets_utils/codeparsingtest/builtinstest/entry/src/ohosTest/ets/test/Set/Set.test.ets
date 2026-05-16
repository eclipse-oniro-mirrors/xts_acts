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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';

export default function SetTest() {
  describe('setTest', () => {
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
     * @tc.name   testSetPrototypeAdd0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_0100
     * @tc.desc   Test the function of the interface SetPrototypeAdd.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetPrototypeAdd0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testSetPrototypeAdd0001";
      try {
        const odds = new Set(["a", "b"]);
        let value = odds.add("c");
        expect(value.has("c")).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSetPrototypeAdd0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_0200
     * @tc.desc   Test the function of the interface SetPrototypeAdd.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetPrototypeAdd0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testSetPrototypeAdd0002";
      try {
        const odds = new Set(["a", "b"]);
        let value = odds.add("c");
        expect(value.has("d")).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSetPrototypeAdd0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_0300
     * @tc.desc   Test the function of the interface SetPrototypeAdd.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetPrototypeAdd0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetPrototypeAdd0003";
      try {
        const odds = new Set([1, 2, 3, 4]);
        let value = odds.add(5);
        expect(value.has(5)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSetPrototypeAdd0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_0400
     * @tc.desc   Test the function of the interface SetPrototypeAdd.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetPrototypeAdd0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetPrototypeAdd0004";
      try {
        const odds = new Set([1, 2, 3, 4]);
        let value = odds.add(5);
        expect(value.has(6)).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSetPrototypeAdd0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_0500
     * @tc.desc   Test the function of the interface SetPrototypeAdd.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetPrototypeAdd0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetPrototypeAdd0005";
      try {
        const odds = new Set([].toString());
        let value = odds.add("c");
        expect(value.has("c")).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSetPrototypeClear0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_0600
     * @tc.desc   Test the function of the interface SetPrototypeClear.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetPrototypeClear0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetPrototypeClear0001";
      try {
        const odds = new Set([1, 2, 3, 4]);
        odds.clear();
        let value = odds.size
        expect(value).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSetPrototypeClear0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_0700
     * @tc.desc   Test the function of the interface SetPrototypeClear.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetPrototypeClear0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetPrototypeClear0002";
      try {
        const odds = new Set(["a", "b", "c"]);
        odds.clear();
        let value = odds.size
        expect(value).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSetPrototypeClear0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_0800
     * @tc.desc   Test the function of the interface SetPrototypeClear.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetPrototypeClear0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetPrototypeClear0003";
      try {
        const odds = new Set([""]);
        odds.clear();
        let value = odds.size
        expect(value).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSetPrototypeDelete0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_0900
     * @tc.desc   Test the function of the interface SetPrototypeDelete.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetPrototypeDelete0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetPrototypeDelete0001";
      try {
        const odds = new Set([1, 2, 3]);
        expect(odds.delete(3)).assertEqual(true)
        expect(odds.size).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSetPrototypeDelete0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_1000
     * @tc.desc   Test the function of the interface SetPrototypeDelete.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetPrototypeDelete0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetPrototypeDelete0002";
      try {
        const odds = new Set([1, 2, 3]);
        expect(odds.delete(4)).assertEqual(false)
        expect(odds.size).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSetPrototypeDelete0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_1100
     * @tc.desc   Test the function of the interface SetPrototypeDelete.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetPrototypeDelete0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetPrototypeDelete0003";
      try {
        const odds = new Set(["a", "b", "c"]);
        expect(odds.delete("c")).assertEqual(true)
        expect(odds.size).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSetPrototypeDelete0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_1200
     * @tc.desc   Test the function of the interface SetPrototypeDelete.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetPrototypeDelete0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetPrototypeDelete0004";
      try {
        const odds = new Set(["a", "b", "c"]);
        expect(odds.delete("d")).assertEqual(false)
        expect(odds.size).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSetPrototypeEntries0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_1300
     * @tc.desc   Test the function of the interface SetPrototypeEntries.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetPrototypeEntries0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetPrototypeEntries0001";
      try {
        const odds = new Set([1, 3, 5, 7, 9]);
        let set = odds.entries();
        expect(JSON.stringify(set.next().value)).assertEqual('[1,1]')
        expect(JSON.stringify(set.next().value)).assertEqual('[3,3]')
        expect(JSON.stringify(set.next().value)).assertEqual('[5,5]')
        expect(JSON.stringify(set.next().value)).assertEqual('[7,7]')
        expect(JSON.stringify(set.next().value)).assertEqual('[9,9]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSetPrototypeEntries0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_1400
     * @tc.desc   Test the function of the interface SetPrototypeEntries.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetPrototypeEntries0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetPrototypeEntries0002";
      try {
        const odds = new Set([undefined]);
        let set = odds.entries();
        expect(JSON.stringify(set.next().value)).assertEqual('[null,null]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSetPrototypeEntries0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_1500
     * @tc.desc   Test the function of the interface SetPrototypeEntries.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetPrototypeEntries0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetPrototypeEntries0003";
      try {
        const odds = new Set([null]);
        let set = odds.entries();
        expect(JSON.stringify(set.next().value)).assertEqual('[null,null]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSetPrototypeHas0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_1600
     * @tc.desc   Test the function of the interface SetPrototypeHas.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetPrototypeHas0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetPrototypeHas0001";
      try {
        const set1 = new Set([1, 2, 3]);
        let value = set1.has(2);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSetPrototypeHas0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_1700
     * @tc.desc   Test the function of the interface SetPrototypeHas.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetPrototypeHas0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetPrototypeHas0002";
      try {
        const set1 = new Set([1, 2, 3]);
        let value = set1.has(4);
        expect(value).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSetPrototypeHas0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_1800
     * @tc.desc   Test the function of the interface SetPrototypeHas.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetPrototypeHas0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetPrototypeHas0003";
      try {
        let set1 = new Set(['a', 'b', 'c']);
        let value = set1.has('b');
        expect(value).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSetPrototypeHas0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_1900
     * @tc.desc   Test the function of the interface SetPrototypeHas.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetPrototypeHas0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetPrototypeHas0004";
      try {
        let set1 = new Set(['a', 'b', 'c']);
        let value = set1.has('d');
        expect(value).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSetPrototypeKeys0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_2000
     * @tc.desc   Test the function of the interface SetPrototypeKeys.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetPrototypeKeys0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetPrototypeKeys0001";
      try {
        let mySet = new Set(["apple", "banana", "cat"]);
        let setIter = mySet.keys();
        let value1 = setIter.next();
        let value2 = setIter.next();
        let value3 = setIter.next();
        expect(JSON.stringify(value1)).assertEqual('{"value":"apple","done":false}')
        expect(JSON.stringify(value2)).assertEqual('{"value":"banana","done":false}')
        expect(JSON.stringify(value3)).assertEqual('{"value":"cat","done":false}');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSetPrototypeKeys0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_2100
     * @tc.desc   Test the function of the interface SetPrototypeKeys.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetPrototypeKeys0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetPrototypeKeys0002";
      try {
        let mySet = new Set([]);
        let setIter = mySet.keys();
        let value1 = setIter.next();
        expect(JSON.stringify(value1)).assertEqual('{"done":true}');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
  })
}