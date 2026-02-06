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
import taskpool from '@ohos.taskpool';
import util from '@ohos.util';
import worker, { MessageEvents } from '@ohos.worker';
import {
  ArrayList,
  buffer,
  Deque,
  HashMap,
  HashSet,
  JSON,
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
  url
} from '@kit.ArkTS';

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
      await sleep(50);
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_GETHASH_0100
     * @tc.name       : testGetHash_001
     * @tc.desc       : Testing the getHash interface
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_GETHASH_0200
     * @tc.name       : testGetHash_002
     * @tc.desc       : Testing the getHash interface
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_GETHASH_0300
     * @tc.name       : testGetHash_003
     * @tc.desc       : Testing the getHash interface
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_GETHASH_0400
     * @tc.name       : testGetHash_004
     * @tc.desc       : Testing the getHash interface
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_GETHASH_0500
     * @tc.name       : testGetHash_005
     * @tc.desc       : Testing the getHash interface
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_GETHASH_0600
     * @tc.name       : testGetHash_006
     * @tc.desc       : Testing the getHash interface
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_GETHASH_0700
     * @tc.name       : testGetHash_007
     * @tc.desc       : Testing the getHash interface
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_GETHASH_0800
     * @tc.name       : testGetHash_008
     * @tc.desc       : Testing the getHash interface
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_GETHASH_0900
     * @tc.name       : testGetHash_009
     * @tc.desc       : Testing the getHash interface
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_GETHASH_1000
     * @tc.name       : testGetHash_010
     * @tc.desc       : Testing the getHash interface
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_GETHASH_1100
     * @tc.name       : testGetHash_011
     * @tc.desc       : Testing the getHash interface
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_GETHASH_1200
     * @tc.name       : testGetHash_012
     * @tc.desc       : Testing the getHash interface
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_GETHASH_1300
     * @tc.name       : testGetHash_013
     * @tc.desc       : Testing the getHash interface
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_GETHASH_1400
     * @tc.name       : testGetHash_014
     * @tc.desc       : Testing the getHash interface
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_GETHASH_1500
     * @tc.name       : testGetHash_015
     * @tc.desc       : Testing the getHash interface
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_GETHASH_1600
     * @tc.name       : testGetHash_016
     * @tc.desc       : Testing the getHash interface
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_GETHASH_1700
     * @tc.name       : testGetHash_017
     * @tc.desc       : Testing the getHash interface
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_GETHASH_1800
     * @tc.name       : testGetHash_018
     * @tc.desc       : Testing the getHash interface
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_GETHASH_1900
     * @tc.name       : testGetHash_019
     * @tc.desc       : Testing the getHash interface
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_GETHASH_2000
     * @tc.name       : testGetHash_020
     * @tc.desc       : Testing the getHash interface
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_GETHASH_2100
     * @tc.name       : testGetHash_021
     * @tc.desc       : Testing the getHash interface
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_GETHASH_2200
     * @tc.name       : testGetHash_022
     * @tc.desc       : Testing the getHash interface
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_GETHASH_2300
     * @tc.name       : testGetHash_023
     * @tc.desc       : Testing the getHash interface
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_GETHASH_2400
     * @tc.name       : testGetHash_024
     * @tc.desc       : Testing the getHash interface
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_GETHASH_2500
     * @tc.name       : testGetHash_025
     * @tc.desc       : Testing the getHash interface
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_GETHASH_2600
     * @tc.name       : testGetHash_026
     * @tc.desc       : Testing the getHash interface
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_GETHASH_2700
     * @tc.name       : testGetHash_027
     * @tc.desc       : Testing the getHash interface
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_GETHASH_2800
     * @tc.name       : testGetHash_028
     * @tc.desc       : Testing the getHash interface
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_GETHASH_2900
     * @tc.name       : testGetHash_029
     * @tc.desc       : Testing the getHash interface
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_GETHASH_3000
     * @tc.name       : testGetHash_030
     * @tc.desc       : Testing the getHash interface
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_GETHASH_3100
     * @tc.name       : testGetHash_031
     * @tc.desc       : Testing the getHash interface
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_GETHASH_3200
     * @tc.name       : testGetHash_032
     * @tc.desc       : Testing the getHash interface
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_GETHASH_3300
     * @tc.name       : testGetHash_033
     * @tc.desc       : Testing the getHash interface
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_GETHASH_3400
     * @tc.name       : testGetHash_034
     * @tc.desc       : Testing the getHash interface
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_GETHASH_3500
     * @tc.name       : testGetHash_035
     * @tc.desc       : Testing the getHash interface
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testGetHash_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      try {
        util.getHash(undefined);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });
  })
}