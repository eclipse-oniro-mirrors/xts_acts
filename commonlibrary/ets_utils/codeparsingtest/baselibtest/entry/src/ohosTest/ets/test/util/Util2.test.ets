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
import util from '@ohos.util';

import {
  ArrayList,
  buffer,
  Deque,
  HashMap,
  HashSet,
  LightWeightMap,
  LightWeightSet,
  LinkedList,
  List,
  PlainArray,
  Queue,
  Stack,
  TreeMap,
  TreeSet,
  uri,
  url,
  Vector
} from '@kit.ArkTS';
import * as nameSpace from './util';
import { foo, generator } from './util';

function sleep(ms: number) {
  return new Promise<void>((resolve, reject) => setTimeout(resolve, ms));
}


export default function util2Test() {
  describe('util2Test', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(20);
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
     * @tc.name   testGetHash_001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_GETHASH_0100
     * @tc.desc   Testing the getHash interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetHash_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = 'testGetHash_001';
      try {
        let arr1 = [0, 1, 2, 3];
        let arr2 = new Array<number>();
        let result1 = util.getHash(arr1);
        let result2 = util.getHash(arr2);
        expect(result1 === result2).assertFalse();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testGetHash_002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_GETHASH_0200
     * @tc.desc   Testing the getHash interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetHash_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = 'testGetHash_001';
      try {
        let a = new ArrayList<number>();
        a.add(7)
        let result1 = util.getHash(a);
        a.add(9);
        let result2 = util.getHash(a);
        expect(result1).assertEqual(result2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testGetHash_003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_GETHASH_0300
     * @tc.desc   Testing the getHash interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetHash_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      try {
        let a = new LinkedList<number>();
        a.add(7)
        let result1 = util.getHash(a);
        a.add(9);
        let result2 = util.getHash(a);
        expect(result1).assertEqual(result2);
      } catch (err) {
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testGetHash_004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_GETHASH_0400
     * @tc.desc   Testing the getHash interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetHash_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      try {
        let a = new Set<number>();
        a.add(7)
        let result1 = util.getHash(a);
        a.add(9);
        let result2 = util.getHash(a);
        expect(result1).assertEqual(result2);
      } catch (err) {
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testGetHash_005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_GETHASH_0500
     * @tc.desc   Testing the getHash interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetHash_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      try {
        let a = new Map<number, number>();
        a.set(7, 0)
        let result1 = util.getHash(a);
        a.set(9, 2);
        let result2 = util.getHash(a);
        expect(result1).assertEqual(result2);
      } catch (err) {
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testGetHash_006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_GETHASH_0600
     * @tc.desc   Testing the getHash interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetHash_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      try {
        let a = new Map<number, number>();
        a.set(7, 0)
        let result1 = util.getHash(a);
        a.set(9, 2);
        let result2 = util.getHash(a);
        expect(result1).assertEqual(result2);
      } catch (err) {
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testGetHash_007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_GETHASH_0700
     * @tc.desc   Testing the getHash interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetHash_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      try {
        let a = new BigInt64Array(8);
        a[0] = 1n;
        let result1 = util.getHash(a);
        a[1] = 2n;
        let result2 = util.getHash(a);
        expect(result1).assertEqual(result2);
      } catch (err) {
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testGetHash_008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_GETHASH_0800
     * @tc.desc   Testing the getHash interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetHash_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      try {
        let a = new BigUint64Array(8);
        a[0] = 1n;
        let result1 = util.getHash(a);
        a[1] = 2n;
        let result2 = util.getHash(a);
        expect(result1).assertEqual(result2);
      } catch (err) {
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testGetHash_009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_GETHASH_0900
     * @tc.desc   Testing the getHash interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetHash_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      try {
        let a = new Float32Array(8);
        a[0] = 1;
        let result1 = util.getHash(a);
        a[1] = 2;
        let result2 = util.getHash(a);
        expect(result1).assertEqual(result2);
      } catch (err) {
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testGetHash_010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_GETHASH_1000
     * @tc.desc   Testing the getHash interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetHash_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      try {
        let a = new Float64Array(8);
        a[0] = 1;
        let result1 = util.getHash(a);
        a[1] = 2;
        let result2 = util.getHash(a);
        expect(result1).assertEqual(result2);
      } catch (err) {
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testGetHash_011
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_GETHASH_1100
     * @tc.desc   Testing the getHash interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetHash_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      try {
        let a = new Int8Array(8);
        a[0] = 1;
        let result1 = util.getHash(a);
        a[1] = 2;
        let result2 = util.getHash(a);
        expect(result1).assertEqual(result2);
      } catch (err) {
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testGetHash_012
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_GETHASH_1200
     * @tc.desc   Testing the getHash interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetHash_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      try {
        let a = new Int16Array(8);
        a[0] = 1;
        let result1 = util.getHash(a);
        a[1] = 2;
        let result2 = util.getHash(a);
        expect(result1).assertEqual(result2);
      } catch (err) {
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testGetHash_013
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_GETHASH_1300
     * @tc.desc   Testing the getHash interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetHash_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      try {
        let a = new Int32Array(8);
        a[0] = 1;
        let result1 = util.getHash(a);
        a[1] = 2;
        let result2 = util.getHash(a);
        expect(result1).assertEqual(result2);
      } catch (err) {
        expect().assertFail();
      }
    });


    /**
     * @tc.name   testGetHash_014
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_GETHASH_1400
     * @tc.desc   Testing the getHash interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetHash_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      try {
        let a = new Uint8Array(8);
        a[0] = 1;
        let result1 = util.getHash(a);
        a[1] = 2;
        let result2 = util.getHash(a);
        expect(result1).assertEqual(result2);
      } catch (err) {
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testGetHash_015
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_GETHASH_1500
     * @tc.desc   Testing the getHash interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetHash_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      try {
        let a = new Uint16Array(8);
        a[0] = 1;
        let result1 = util.getHash(a);
        a[1] = 2;
        let result2 = util.getHash(a);
        expect(result1).assertEqual(result2);
      } catch (err) {
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testGetHash_016
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_GETHASH_1600
     * @tc.desc   Testing the getHash interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetHash_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      try {
        let a = new Uint32Array(8);
        a[0] = 1;
        let result1 = util.getHash(a);
        a[1] = 2;
        let result2 = util.getHash(a);
        expect(result1).assertEqual(result2);
      } catch (err) {
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testGetHash_017
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_GETHASH_1700
     * @tc.desc   Testing the getHash interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetHash_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      try {
        let a = new Uint8ClampedArray(8);
        a[0] = 1;
        let result1 = util.getHash(a);
        a[1] = 2;
        let result2 = util.getHash(a);
        expect(result1).assertEqual(result2);
      } catch (err) {
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testGetHash_018
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_GETHASH_1800
     * @tc.desc   Testing the getHash interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetHash_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      try {
        let a = buffer.from([1, 2, 3]);
        let result1 = util.getHash(a);
        a.fill(1);
        let result2 = util.getHash(a);
        expect(result1).assertEqual(result2);
        let b = buffer.from([1, 2, 3]);
        expect(a === b).assertFalse();
      } catch (err) {
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testGetHash_019
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_GETHASH_1900
     * @tc.desc   Testing the getHash interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetHash_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      try {
        let a = new url.URLParams("www.baidu.com");
        a.append("1", "kuku");
        let result1 = util.getHash(a);
        a.append("2", "kuku");
        let result2 = util.getHash(a);
        expect(result1).assertEqual(result2);
        let b = new url.URLParams("www.baidu.com");
        expect(a === b).assertFalse();
      } catch (err) {
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testGetHash_020
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_GETHASH_2000
     * @tc.desc   Testing the getHash interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetHash_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      try {
        let a = new uri.URI("www.baidu.com");
        a.addQueryValue("1", "kuku");
        let result1 = util.getHash(a);
        a.addQueryValue("2", "kuku");
        let result2 = util.getHash(a);
        expect(result1).assertEqual(result2);
        let b = new uri.URI("www.baidu.com");
        expect(a === b).assertFalse();
      } catch (err) {
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testGetHash_021
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_GETHASH_2100
     * @tc.desc   Testing the getHash interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetHash_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      try {
        let a = new Deque<number>();
        a.insertFront(7);
        let result1 = util.getHash(a);
        a.insertFront(9);
        let result2 = util.getHash(a);
        expect(result1).assertEqual(result2);
        let b = new Deque<number>();
        b.insertFront(7);
        a.insertFront(9);
        expect(a === b).assertFalse();
      } catch (err) {
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testGetHash_022
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_GETHASH_2200
     * @tc.desc   Testing the getHash interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetHash_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      try {
        let a = new HashMap<string, number>();
        a.set("1", 7);
        let result1 = util.getHash(a);
        a.set("3", 7);
        let result2 = util.getHash(a);
        expect(result1).assertEqual(result2);
        let b = new HashMap<string, number>();
        b.set("1", 7);
        b.set("3", 7);
        expect(a === b).assertFalse();
      } catch (err) {
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testGetHash_023
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_GETHASH_2300
     * @tc.desc   Testing the getHash interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetHash_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      try {
        let a = new HashSet<string>();
        a.add("1");
        let result1 = util.getHash(a);
        a.add("3");
        let result2 = util.getHash(a);
        expect(result1).assertEqual(result2);
        let b = new HashSet<string>();
        b.add("1");
        b.add("3");
        expect(a === b).assertFalse();
      } catch (err) {
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testGetHash_024
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_GETHASH_2400
     * @tc.desc   Testing the getHash interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetHash_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      try {
        let a = new LightWeightMap<string, number>();
        a.set("1", 1);
        let result1 = util.getHash(a);
        a.set("3", 3);
        let result2 = util.getHash(a);
        expect(result1).assertEqual(result2);
        let b = new LightWeightMap<string, number>();
        b.set("1", 1);
        b.set("3", 3);
        expect(a === b).assertFalse();
      } catch (err) {
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testGetHash_025
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_GETHASH_2500
     * @tc.desc   Testing the getHash interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetHash_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      try {
        let a = new LightWeightSet<string>();
        a.add("1");
        let result1 = util.getHash(a);
        a.add("3");
        let result2 = util.getHash(a);
        expect(result1).assertEqual(result2);
        let b = new LightWeightSet<string>();
        b.add("1");
        b.add("3");
        expect(a === b).assertFalse();
      } catch (err) {
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testGetHash_026
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_GETHASH_2600
     * @tc.desc   Testing the getHash interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetHash_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      try {
        let a = new LinkedList<string>();
        a.add("1");
        let result1 = util.getHash(a);
        a.add("3");
        let result2 = util.getHash(a);
        expect(result1).assertEqual(result2);
        let b = new LinkedList<string>();
        b.add("1");
        b.add("3");
        expect(a === b).assertFalse();
      } catch (err) {
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testGetHash_027
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_GETHASH_2700
     * @tc.desc   Testing the getHash interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetHash_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      try {
        let a = new PlainArray<string>();
        a.add(0, "1");
        let result1 = util.getHash(a);
        a.add(1, "3");
        let result2 = util.getHash(a);
        expect(result1).assertEqual(result2);
        let b = new PlainArray<string>();
        b.add(0, "1");
        b.add(1, "3");
        expect(a === b).assertFalse();
      } catch (err) {
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testGetHash_028
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_GETHASH_2800
     * @tc.desc   Testing the getHash interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetHash_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      try {
        let a = new List<string>();
        a.add("1");
        let result1 = util.getHash(a);
        a.add("3");
        let result2 = util.getHash(a);
        expect(result1).assertEqual(result2);
        let b = new List<string>();
        b.add("1");
        b.add("3");
        expect(a === b).assertFalse();
      } catch (err) {
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testGetHash_029
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_GETHASH_2900
     * @tc.desc   Testing the getHash interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetHash_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      try {
        let a = new PlainArray<string>();
        a.add(0, "1");
        let result1 = util.getHash(a);
        a.add(3, "3");
        let result2 = util.getHash(a);
        expect(result1).assertEqual(result2);
        let b = new PlainArray<string>();
        b.add(0, "1");
        b.add(3, "3");
        expect(a === b).assertFalse();
      } catch (err) {
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testGetHash_030
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_GETHASH_3000
     * @tc.desc   Testing the getHash interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetHash_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      try {
        let a = new Queue<string>();
        a.add("1");
        let result1 = util.getHash(a);
        a.add("3");
        let result2 = util.getHash(a);
        expect(result1).assertEqual(result2);
        let b = new Queue<string>();
        b.add("1");
        b.add("3");
        expect(a === b).assertFalse();
      } catch (err) {
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testGetHash_031
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_GETHASH_3100
     * @tc.desc   Testing the getHash interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetHash_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      try {
        let a = new Stack<string>();
        a.push("1");
        let result1 = util.getHash(a);
        a.push("3");
        let result2 = util.getHash(a);
        expect(result1).assertEqual(result2);
        let b = new Stack<string>();
        b.push("1");
        b.push("3");
        expect(a === b).assertFalse();
      } catch (err) {
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testGetHash_032
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_GETHASH_3200
     * @tc.desc   Testing the getHash interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetHash_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      try {
        let a = new TreeSet<string>();
        a.add("1");
        let result1 = util.getHash(a);
        a.add("3");
        let result2 = util.getHash(a);
        expect(result1).assertEqual(result2);
        let b = new TreeSet<string>();
        b.add("1");
        b.add("3");
        expect(a === b).assertFalse();
      } catch (err) {
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testGetHash_033
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_GETHASH_3300
     * @tc.desc   Testing the getHash interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetHash_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      try {
        let a = new TreeMap<string, number>();
        a.set("1", 1);
        let result1 = util.getHash(a);
        a.set("3", 3);
        let result2 = util.getHash(a);
        expect(result1).assertEqual(result2);
        let b = new TreeMap<string, number>();
        b.set("1", 1);
        b.set("3", 3);
        expect(a === b).assertFalse();
      } catch (err) {
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testGetHash_034
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_GETHASH_3400
     * @tc.desc   Testing the getHash interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetHash_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      try {
        util.getHash(null);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   testGetHash_035
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_GETHASH_3500
     * @tc.desc   Testing the getHash interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetHash_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      try {
        util.getHash(undefined);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });
    /**
     * @tc.name   testGetHash_036
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_GETHASH_3501
     * @tc.desc   Testing the getHash interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetHash_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let type = new util.types();
      let result = type.isAsyncFunction(async () => {
      });
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   testGetHash_037
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_GETHASH_3502
     * @tc.desc   Testing the getHash interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetHash_037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let type = new util.types();
      let result = type.isAsyncFunction(() => {
      });
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   testGetHash_038
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_GETHASH_3503
     * @tc.desc   Testing the getHash interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetHash_038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let type = new util.types();
      let result = type.isGeneratorFunction(foo);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   testGetHash_039
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_GETHASH_3504
     * @tc.desc   Testing the getHash interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetHash_039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let type = new util.types();
      let b = "false"
      let result = type.isGeneratorFunction(b);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   testGetHash_040
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_GETHASH_3505
     * @tc.desc   Testing the getHash interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetHash_040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let type = new util.types();
      let result = type.isGeneratorObject(generator);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   testGetHash_041
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_GETHASH_3506
     * @tc.desc   Testing the getHash interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetHash_041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let type = new util.types();
      let b = "false"
      let result = type.isGeneratorObject(b);
      expect(result).assertEqual(false);
    });


    /**
     * @tc.name   testGetHash_042
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_GETHASH_3507
     * @tc.desc   Testing the getHash interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetHash_042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let type = new util.types();
      let result = type.isModuleNamespaceObject(nameSpace);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   testGetHash_043
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_GETHASH_3508
     * @tc.desc   Testing the getHash interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetHash_043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let type = new util.types();
      let res = "aaa";
      let result = type.isModuleNamespaceObject(res);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   testGetHash_044
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_GETHASH_3509
     * @tc.desc   Testing the getHash interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetHash_044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let type = new util.types();
      let result = type.isPromise(Promise.resolve(1));
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   testGetHash_045
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_GETHASH_3510
     * @tc.desc   Testing the getHash interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetHash_045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let type = new util.types();
      let res = "aaa";
      let result = type.isPromise(res);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   testGetHash_046
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_GETHASH_3511
     * @tc.desc   Testing the getHash interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetHash_046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let type = new util.types();
      let result = type.isRegExp(new RegExp('abc'));
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   testGetHash_047
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_GETHASH_3512
     * @tc.desc   Testing the getHash interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetHash_047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let res = "aaa";
      let type = new util.types();
      let result = type.isRegExp(res);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   testGetHash_048
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_GETHASH_3513
     * @tc.desc   Testing the getHash interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetHash_048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let res = new ArrayList<number>();
      let result1 = res.add(1);
      expect(result1).assertEqual(true);
      let result2 = res.remove(2);
      expect(result2).assertEqual(false);
      let result3 = res.remove(1);
      expect(result3).assertEqual(true);
      let result: Array<number> = res.convertToArray();
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.name   testGetHash_049
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_GETHASH_3514
     * @tc.desc   Testing the getHash interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetHash_049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let res = new HashSet<number>();
      let result1 = res.add(1);
      expect(result1).assertEqual(true);
    });

    /**
     * @tc.name   testGetHash_050
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_GETHASH_3515
     * @tc.desc   Testing the getHash interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetHash_050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let res = new LightWeightMap<number, number>();
      res.set(1, 1);
      try {
        let result1 = res.setValueAt(1, 1);
        expect(result1).assertEqual(false);
      } catch (e) {
        expect(e.code).assertEqual(10200001);
      }
    });

    /**
     * @tc.name   testGetHash_051
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_GETHASH_3516
     * @tc.desc   Testing the getHash interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetHash_051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let res = new LightWeightSet<number>();
      let result1 = res.add(1);
      expect(result1).assertEqual(true);
      let result2 = res.remove(1);
      expect(result2).assertEqual(1);
      expect(res.length).assertEqual(0);
    });

    /**
     * @tc.name   testGetHash_052
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_GETHASH_3517
     * @tc.desc   Testing the getHash interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetHash_052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let res = new LinkedList<number>();
      let result1 = res.add(1);
      expect(result1).assertEqual(true);
      let result2 = res.remove(1);
      expect(result2).assertEqual(true);
      let result3 = res.remove(31);
      expect(result3).assertEqual(false);
      expect(res.length).assertEqual(0);
    });

    /**
     * @tc.name   testGetHash_053
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_GETHASH_3518
     * @tc.desc   Testing the getHash interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetHash_053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let res = new List<number>();
      let result1 = res.add(1);
      expect(result1).assertEqual(true);
      let result2 = res.remove(1);
      expect(result2).assertEqual(true);
      let result3 = res.remove(31);
      expect(result3).assertEqual(false);
      expect(res.convertToArray().length).assertEqual(0);
    });

    /**
     * @tc.name   testGetHash_054
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_GETHASH_3519
     * @tc.desc   Testing the getHash interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetHash_054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let res = new Queue<number>();
      let result1 = res.add(1);
      expect(result1).assertEqual(true);
    });

    /**
     * @tc.name   testGetHash_055
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_GETHASH_3520
     * @tc.desc   Testing the getHash interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetHash_055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let res = new TreeSet<number>();
      let result1 = res.add(1);
      expect(result1).assertEqual(true);
    });

    /**
     * @tc.name   testGetHash_056
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_GETHASH_3521
     * @tc.desc   Testing the getHash interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetHash_056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let pro = new util.LRUCache<number | string, number | string>();
      let result = pro.values();
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.name   testGetHash_057
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_GETHASH_3522
     * @tc.desc   Testing the getHash interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetHash_057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let pro = new util.LRUCache<number | string, number | string>();
      pro.put(2, 10);
      pro.put(2, "anhu");
      pro.put("afaf", "grfb");
      let result = pro.values();
      expect(result.toString()).assertEqual("anhu,grfb");
    });

    /**
     * @tc.name   testGetHash_058
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_GETHASH_3523
     * @tc.desc   Testing the getHash interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetHash_058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let pro = new util.LRUCache<number, number>();
      pro.put(2, 10);
      pro.put(3, 1);
      let result = pro.keys();
      expect(result.toString()).assertEqual("2,3");
    });

    /**
     * @tc.name   testGetHash_059
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_GETHASH_3524
     * @tc.desc   Testing the getHash interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetHash_059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let pro = new util.LRUCache<number, number>();
      let result = pro.keys();
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.name   testGetHash_060
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_GETHASH_3525
     * @tc.desc   Testing the getHash interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetHash_060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let list = new List<number>();
      let res = list.convertToArray();
      expect(res.length).assertEqual(0);
    });

    /**
     * @tc.name   testGetHash_061
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_GETHASH_3526
     * @tc.desc   Testing the getHash interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetHash_061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let pro: util.LruBuffer<number, number> = new util.LruBuffer();
      let result = pro.length;
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   testGetHash_062
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_GETHASH_3527
     * @tc.desc   Testing the getHash interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetHash_062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let pro: util.LruBuffer<number, number> = new util.LruBuffer();
      let result = pro.keys();
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.name   testGetHash_063
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_GETHASH_3528
     * @tc.desc   Testing the getHash interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetHash_063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let pro: util.LruBuffer<number, number> = new util.LruBuffer();
      let result = pro.values();
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.name   testGetHash_064
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_GETHASH_3529
     * @tc.desc   Testing the getHash interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetHash_064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let urlObject = new url.URL('https://developer.exampleUrl/?fod=1&bard=2');
      let params = new url.URLSearchParams(urlObject.search.slice(1));
      params.append('fod', '3');
      expect(params.getAll('fod').toString()).assertEqual("1,3");
    });

    /**
     * @tc.name   testGetHash_065
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_GETHASH_3530
     * @tc.desc   Testing the getHash interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetHash_065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let urlObject = new url.URL('https://developer.exampleUrl/');
      let params = new url.URLSearchParams(urlObject.search.slice(1));
      expect(params.getAll('fod').length).assertEqual(0);
    });

    /**
     * @tc.name   testGetHash_066
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_GETHASH_3531
     * @tc.desc   Testing the getHash interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetHash_066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let vector: Vector<string | number | Array<number>> = new Vector();
      let result = vector.add("a");
      expect(result).assertEqual(true);
      let result2 = vector.remove("b");
      expect(result2).assertEqual(false);
      let result3 = vector.remove("a");
      expect(result3).assertEqual(true);
      let res = vector.convertToArray();
      expect(res.length).assertEqual(0);
    });

  })
}