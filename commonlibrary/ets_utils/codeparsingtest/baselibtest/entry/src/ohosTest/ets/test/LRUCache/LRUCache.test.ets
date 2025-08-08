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
import { beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { util } from '@kit.ArkTS';

function sleep(ms: number): Promise<void> {
  return new Promise<void>((resolve: () => void) => {
    setTimeout(resolve, ms);
  });
}

export default function LRUCatchTest() {
  describe('ActsLRUCatchTest', () => {
    beforeEach(() => {
      sleep(20);
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LRU_CACHE_0100
     * @tc.name       : testLRUCachePutKey0001
     * @tc.desc       : Test the functionality of the put method in the LRU Cache.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLRUCachePutKey0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testLRUCachePutKey0001";
      try {
        let pro = new util.LRUCache<string, string>(1);
        pro.put('tcy', 'Number.MAX_VALUE');
        pro.put('tcy', 'Number.MAX_VALUE');
        let result = pro.get('tcy');
        expect(result).assertEqual('Number.MAX_VALUE');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LRU_CACHE_0200
     * @tc.name       : testLRUCachePutKey0002
     * @tc.desc       : Test the functionality of the put method in the LRU Cache.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLRUCachePutKey0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testLRUCachePutKey0002";
      try {
        let pro = new util.LRUCache<number, number>(1);
        pro.put(2, 5e-324);
        pro.put(2, 5e-324);
        let result = pro.get(2);
        expect(result).assertEqual(5e-324);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LRU_CACHE_0300
     * @tc.name       : testLRUCachePutKey0003
     * @tc.desc       : Test the functionality of the put method in the LRU Cache.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLRUCachePutKey0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testLRUCachePutKey0003";
      try {
        let pro = new util.LRUCache<string, string>(1);
        pro.put('tcy', 'Number.MIN_VALUE');
        pro.put('tcy', 'Number.MIN_VALUE');
        let result = pro.get('tcy');
        expect(result).assertEqual('Number.MIN_VALUE');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LRU_CACHE_0400
     * @tc.name       : testLRUCachePutKey0004
     * @tc.desc       : Test the functionality of the put method in the LRU Cache.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLRUCachePutKey0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testLRUCachePutKey0004";
      try {
        let pro = new util.LRUCache<string, number>(1);
        pro.put('tcy', 2.220446049250313e-16);
        pro.put('tcy', 2.220446049250313e-16);
        let result = pro.get('tcy');
        expect(result).assertEqual(2.220446049250313e-16);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LRU_CACHE_0500
     * @tc.name       : testLRUCachePutKey0005
     * @tc.desc       : Test the functionality of the put method in the LRU Cache.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLRUCachePutKey0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testLRUCachePutKey0005";
      try {
        let pro = new util.LRUCache<string, string>(1);
        pro.put('tcy', 'Number.EPSILON');
        pro.put('tcy', 'Number.EPSILON');
        let result = pro.get('tcy');
        expect(result).assertEqual('Number.EPSILON');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LRU_CACHE_0600
     * @tc.name       : testLRUCachePutConstructor0001
     * @tc.desc       : Test the functionality of the put method in the LRU Cache.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLRUCachePutConstructor0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testLRUCachePutConstructor0001";
      try {
        let pro = new util.LRUCache<string, string>();
        pro.put('tcy', 'Number');
        pro.put('abc', 'efg');
        pro.put('xyz', '123');
        pro.put('mno', '456');
        pro.updateCapacity(2);
        pro.put('tcy', 'higkl');
        let result = pro.get('abc');
        expect(result).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LRU_CACHE_0700
     * @tc.name       : testLRUCachePutConstructor0002
     * @tc.desc       : Test the functionality of the put method in the LRU Cache.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLRUCachePutConstructor0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testLRUCachePutConstructor0002";
      try {
        let pro = new util.LRUCache<string, string>();
        pro.put('tcy', 'Number');
        pro.put('abc', 'efg');
        pro.put('xyz', '123');
        pro.put('mno', '456');
        pro.put('tcy', 'higkl');
        pro.updateCapacity(4);
        let result = pro.get('abc');
        expect(result).assertEqual('efg');
        result = pro.get('tcy');
        expect(result).assertEqual('higkl');
        result = pro.get('xyz');
        expect(result).assertEqual('123');
        result = pro.get('mno');
        expect(result).assertEqual('456');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LRU_CACHE_0800
     * @tc.name       : testLRUCachePutConstructor0003
     * @tc.desc       : Test the functionality of the put method in the LRU Cache.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLRUCachePutConstructor0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testLRUCachePutConstructor0003";
      try {
        let pro = new util.LRUCache<string, string>();
        pro.put('key1', 'Number');
        let result = pro.remove('key1');
        expect(result).assertEqual('Number');
        pro.put('key1', 'efg');
        result = pro.remove('key1');
        expect(result).assertEqual('efg');
        pro.put('key1', '123');
        result = pro.remove('key1');
        expect(result).assertEqual('123');
        pro.put('key1', '456');
        result = pro.remove('key1');
        expect(result).assertEqual('456');
        pro.put('key1', 'abcdefg');
        result = pro.remove('key1');
        expect(result).assertEqual('abcdefg');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LRU_CACHE_0900
     * @tc.name       : testLRUCachePutConstructor0004
     * @tc.desc       : Test the function of the constructor function.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLRUCachePutConstructor0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testLRUCachePutConstructor0004";
      try {
        let pro = new util.LRUCache<number, number>();
        let result1 = pro.put(2, 10);
        pro.clear();
        let result2 = pro.put(2, 11);
        expect(result2).assertEqual(11)
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LRU_CACHE_1000
     * @tc.name       : testLRUCachePutConstructor0005
     * @tc.desc       : Test the function of the constructor function.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLRUCachePutConstructor0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testLRUCachePutConstructor0005";
      try {
        let pro = new util.LRUCache<number, number>();
        pro.put(undefined, 1);
        let result = pro.keys();
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.code}`).assertEqual('401');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LRU_CACHE_1100
     * @tc.name       : testLRUCachePutConstructor0006
     * @tc.desc       : Test put method with key=NaN.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLRUCachePutConstructor0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testLRUCachePutConstructor0006";
      try {
        let pro = new util.LRUCache<number, number>();
        pro.put(NaN, 2);
        let result = pro.keys();
        expect(Number.isNaN(result));
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LRU_CACHE_1200
     * @tc.name       : testLRUCachePutConstructor0007
     * @tc.desc       : Test the function of the constructor function.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLRUCachePutConstructor0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testLRUCachePutConstructor0007";
      try {
        let pro = new util.LRUCache<number, number>();
        pro.put(2, null);
        let result = pro.get(2);
        expect().assertFail()
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.code}`).assertEqual('401');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LRU_CACHE_1300
     * @tc.name       : testLRUCachePutConstructor0008
     * @tc.desc       : Test the function of the constructor function.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLRUCachePutConstructor0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testLRUCachePutConstructor0008";
      try {
        let pro = new util.LRUCache<number, number>();
        pro.put(1, undefined);
        let result = pro.get(1);
        expect().assertFail()
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.code}`).assertEqual('401');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LRU_CACHE_1400
     * @tc.name       : testLRUCachePutConstructor0009
     * @tc.desc       : Test the function of the constructor function.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLRUCachePutConstructor0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testLRUCachePutConstructor0009";
      try {
        let pro = new util.LRUCache<number, number>();
        let result = pro.put(2, NaN);
        expect(Number.isNaN(result));
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LRU_CACHE_1500
     * @tc.name       : testConstructor0001
     * @tc.desc       : Test the functionality of the LRUCache() interface
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testConstructor0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testConstructor0001";
      try {
        let pro = new util.LRUCache<number, number>(2147483648);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.code).assertEqual(401);
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LRU_CACHE_1600
     * @tc.name       : testConstructor0002
     * @tc.desc       : Test the functionality of the LRUCache() interface
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testConstructor0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testConstructor0002";
      try {
        let pro = new util.LRUCache<number, number>(-100);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.code).assertEqual(401);
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LRU_CACHE_1700
     * @tc.name       : testConstructor0003
     * @tc.desc       : Test the functionality of the LRUCache() interface
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testConstructor0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testConstructor0003";
      try {
        let pro = new util.LRUCache<number, number>(64.11);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.code).assertEqual(401);
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LRU_CACHE_1800
     * @tc.name       : testConstructor0004
     * @tc.desc       : Test the functionality of the LRUCache() interface
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testConstructor0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testConstructor0004";
      try {
        let pro = new util.LRUCache<number, number>(undefined);
        let result = pro.getCapacity()
        expect(pro.getCapacity()).assertEqual(64);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LRU_CACHE_1900
     * @tc.name       : testConstructor0005
     * @tc.desc       : Test the functionality of the LRUCache() interface
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testConstructor0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testConstructor0005";
      try {
        let pro = new util.LRUCache<number, number>(0);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.code).assertEqual(401);
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LRU_CACHE_2000
     * @tc.name       : testConstructor0006
     * @tc.desc       : Test the functionality of the LRUCache() interface
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testConstructor0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testConstructor0006";
      try {
        let pro = new util.LRUCache<number, number>(NaN);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.code).assertEqual(401);
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LRU_CACHE_2100
     * @tc.name       : testLRUCacheUpdateCapacity0001
     * @tc.desc       : Test the function of the updateCapacity method with invalid capacity.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLRUCacheUpdateCapacity0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testLRUCacheUpdateCapacity0001";
      try {
        let pro = new util.LRUCache<number, number>();
        pro.updateCapacity(5e-324);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} unexpected failure, error: ${err.message}`);
        expect(err.code).assertEqual(401)
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LRU_CACHE_2200
     * @tc.name       : testLRUCacheUpdateCapacity0002
     * @tc.desc       : Test the function of the updateCapacity method with invalid capacity.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLRUCacheUpdateCapacity0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testLRUCacheUpdateCapacity0002";
      try {
        let pro = new util.LRUCache<number, number>();
        pro.updateCapacity(2.220446049250313e-16);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} unexpected failure, error: ${err.message}`);
        expect(err.code).assertEqual(401);
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LRU_CACHE_2300
     * @tc.name       : testLRUCacheUpdateCapacity0003
     * @tc.desc       : Test the function of the updateCapacity method with invalid capacity.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLRUCacheUpdateCapacity0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testLRUCacheUpdateCapacity0003";
      try {
        let pro = new util.LRUCache<number, number>();
        pro.updateCapacity(Number.MAX_VALUE);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} unexpected failure, error: ${err.message}`);
        expect(err.code).assertEqual(401);
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LRU_CACHE_2400
     * @tc.name       : testLRUCacheUpdateCapacity0004
     * @tc.desc       : Test the function of the updateCapacity method with invalid capacity.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLRUCacheUpdateCapacity0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testLRUCacheUpdateCapacity0004";
      try {
        let pro = new util.LRUCache<number, number>();
        pro.updateCapacity(Number.MIN_VALUE);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} unexpected failure, error: ${err.message}`);
        expect(err.code).assertEqual(401);
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LRU_CACHE_2500
     * @tc.name       : testLRUCacheUpdateCapacity0005
     * @tc.desc       : Test the function of the updateCapacity method with invalid capacity.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLRUCacheUpdateCapacity0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testLRUCacheUpdateCapacity0005";
      try {
        let pro = new util.LRUCache<number, number>();
        pro.updateCapacity(Number.EPSILON);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} unexpected failure, error: ${err.message}`);
        expect(err.code).assertEqual(401);
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LRU_CACHE_2600
     * @tc.name       : testLRUCacheUpdateCapacity0006
     * @tc.desc       : Test the function of the updateCapacity method with invalid capacity.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLRUCacheUpdateCapacity0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testLRUCacheUpdateCapacity0006";
      try {
        let pro = new util.LRUCache<number, number>();
        pro.updateCapacity(undefined);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} unexpected failure, error: ${err.message}`);
        expect(err.code).assertEqual(401);
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LRU_CACHE_2700
     * @tc.name       : testLRUCacheUpdateCapacity0007
     * @tc.desc       : Test the function of the UpdateCapacity
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLRUCacheUpdateCapacity0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testLRUCacheUpdateCapacity0007';
      try {
        let pro = new util.LRUCache<number, number>();
        pro.updateCapacity(-100);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.code).assertEqual(401);
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LRU_CACHE_2800
     * @tc.name       : testLRUCacheUpdateCapacity0008
     * @tc.desc       : Test the function of the updateCapacity method with invalid capacity (100.11).
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLRUCacheUpdateCapacity0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testLRUCacheUpdateCapacity0008";
      try {
        let cache = new util.LRUCache<number, number>();
        cache.updateCapacity(100.111);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
        console.error(`${TAG} failed,err:${err.message}`);
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TREEMAP_2900
     * @tc.name       : testLRUCacheUpdateCapacity0009
     * @tc.desc       : Test the function of the  UpdateCapacity
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLRUCacheUpdateCapacity0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testLRUCacheUpdateCapacity0009';
      try {
        let pro = new util.LRUCache<number, number>();
        pro.updateCapacity(2147483647);
        expect(pro.getCapacity()).assertEqual(2147483647);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.code).assertEqual('Invalid capacity');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TREEMAP_3000
     * @tc.name       : testLRUCacheUpdateCapacity0010
     * @tc.desc       : Test the function of the UpdateCapacity
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLRUCacheUpdateCapacity0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testLRUCacheUpdateCapacity0010';
      try {
        let pro = new util.LRUCache<number, number>(2147483647);
        pro.updateCapacity(2147483648);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.code).assertEqual(401);
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LRU_CACHE_3100
     * @tc.name       : testLRUCacheUpdateCapacity0011
     * @tc.desc       : Test the function of the updateCapacity method with invalid capacity (100.11).
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLRUCacheUpdateCapacity0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testLRUCacheUpdateCapacity0011";
      try {
        let cache = new util.LRUCache<number, number>();
        cache.updateCapacity(0);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
        console.error(`${TAG} failed,err:${err.message}`);
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LRU_CACHE_3200
     * @tc.name       : testLRUCacheUpdateCapacity0012
     * @tc.desc       : Verify updateCapacity with NaN triggers 401 error
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLRUCacheUpdateCapacity0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testLRUCacheUpdateCapacity0012";
      try {
        const lruCache = new util.LRUCache<string, string>(1);
        lruCache.updateCapacity(NaN);
        expect().assertFail();
      } catch (err) {
        console.info(`${TAG} expected error: ${err.message}`);
        expect(err.code).assertEqual(401);
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LRU_CACHE_3300
     * @tc.name       : testToString0001
     * @tc.desc       : Test the toString method of LRUCache with custom maxSize.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testToString0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testToString0001";
      try {
        let cache = new util.LRUCache<number, number>(2147483647);
        cache.put(2, 10);
        cache.get(2);
        cache.get(3);
        let result = cache.toString();
        expect(result).assertEqual("LRUCache[ maxSize = 2147483647, hits = 1, misses = 1, hitRate = 50% ]")
      } catch (err) {
        console.error(`${TAG} failed,err:${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LRU_CACHE_3400
     * @tc.name       : testGetCapacity0001
     * @tc.desc       : Verify maximum capacity with constructor parameter 2147483647
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGetCapacity0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testGetCapacity0001";
      try {
        const MAX_CAPACITY = 2147483647;
        const lruCache: util.LRUCache<number, string> =
          new util.LRUCache<number, string>(MAX_CAPACITY);
        const capacity = lruCache.getCapacity();
        expect(capacity).assertEqual(MAX_CAPACITY);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LRU_CACHE_3500
     * @tc.name       : testLRUCacheGetCapacity0001
     * @tc.desc       : Test the function of the interface GetCapacity.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLRUCacheGetCapacity0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testLRUCacheGetCapacity0001";
      try {
        let pro = new util.LRUCache<number, number>();
        let defaultCapacity = pro.getCapacity();
        expect(defaultCapacity).assertEqual(64);
        pro.updateCapacity(2147483647);
        let updatedCapacity = pro.getCapacity();
        expect(updatedCapacity).assertEqual(2147483647);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LRU_CACHE_3600
     * @tc.name       : testLRUCacheGetCapacity0002
     * @tc.desc       : Test the function of the interface getCapacity.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLRUCacheGetCapacity0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testLRUCacheGetCapacity0002";
      try {
        let pro = new util.LRUCache<number, number>();
        let defaultCapacity = pro.getCapacity();
        expect(defaultCapacity).assertEqual(64);
        pro.updateCapacity(1);
        let updatedCapacity = pro.getCapacity();
        expect(updatedCapacity).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LRU_CACHE_3700
     * @tc.name       : testLRUCacheGetCreateCount0001
     * @tc.desc       : Test the function of the interface getCreateCount.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLRUCacheGetCreateCount0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testLRUCacheGetCreateCount0001";
      try {
        class ChildLRUCache extends util.LRUCache<number, number> {
          constructor() {
            super();
          }

          createDefault(key: number): number {
            return key;
          }
        }

        let lru = new ChildLRUCache();
        lru.put(1, 10);
        lru.put(2, 20);
        lru.get(1);
        lru.get(2);
        let res = lru.getCreateCount();
        expect(res).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LRU_CACHE_3800
     * @tc.name       :  testLRUCacheGetMissCount0001
     * @tc.desc       : Test the function of the interface GetMissCount.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLRUCacheGetMissCount0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testLRUCacheGetMissCount0001";
      try {
        let pro = new util.LRUCache<number, number>();
        pro.put(1, 100);
        pro.put(2, 200);
        expect(pro.isEmpty()).assertFalse();
        pro.get(1);
        pro.get(2);
        expect(pro.getMissCount()).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LRU_CACHE_3900
     * @tc.name       : testLRUCacheGetMissCount0002
     * @tc.desc       : Test the function of the interface GetMissCount.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLRUCacheGetMissCount0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testLRUCacheGetMissCount0002";
      try {
        let pro = new util.LRUCache<number, string>();
        pro.put(1, 'one');
        pro.put(2, 'two');
        pro.put(3, 'three');
        const testKeys = [1, 2, 3];
        for (let key of testKeys) {
          if (pro.get(key) === undefined) {
            pro.get(key);
          }
        }
        let result = pro.getMissCount();
        expect(result).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LRU_CACHE_4000
     * @tc.name       : testLRUCacheGetMissCount0003
     * @tc.desc       : Test the function of the LRUCache.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLRUCacheGetMissCount0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testLRUCacheGetMissCount0003";
      try {
        let pro: util.LRUCache<number, string> = new util.LRUCache<number, string>();
        pro.put(1, 'one');
        pro.put(2, 'two');
        pro.put(3, 'three');
        const testKeys: number[] = [1, 2, 3];
        for (let key of testKeys) {
          pro.get(key);
        }
        let result: number = pro.getMissCount();
        expect(result).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ArkTs_LRU_CACHE_4100
     * @tc.name       : testLRUCacheGetMissCount0005
     * @tc.desc       : Test the function of the getMissCount function.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLRUCacheGetMissCount0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testLRUCacheGetMissCount0005";
      try {
        let pro = new util.LRUCache<number, number>();
        pro.put(1, 10);
        pro.put(2, 20);
        pro.put(3, 30);
        pro.remove(1);
        pro.remove(2);
        pro.remove(3);
        let result = pro.getMissCount();
        expect(result).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ArkTs_LRU_CACHE_4200
     * @tc.name       : testLRUCacheGetMissCount0006
     * @tc.desc       : Test the function of the getMissCount function.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLRUCacheGetMissCount0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testLRUCacheGetMissCount0006";
      try {
        let pro = new util.LRUCache<number, number>();
        pro.put(111, 999);
        pro.put(222, 888);
        pro.put(333, 777);
        pro.remove(444);
        pro.remove(555);
        pro.remove(666);
        let result = pro.getMissCount();
        expect(result).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ArkTs_LRU_CACHE_4300
     * @tc.name       : testLRUCacheGetMissCount0007
     * @tc.desc       : Test the function of the getMissCount function.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLRUCacheGetMissCount0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testLRUCacheGetMissCount0007";
      try {
        let cache = new util.LRUCache<number, number>();
        cache.put(1, 10);
        cache.put(2, 20);
        cache.put(3, 30);

        let containsKey1 = cache.contains(1);
        let containsKey2 = cache.contains(2);
        let containsKey3 = cache.contains(3);

        expect(containsKey1).assertTrue();
        expect(containsKey2).assertTrue();
        expect(containsKey3).assertTrue();

        let result = cache.getMissCount();
        expect(result).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ArkTs_LRU_CACHE_4400
     * @tc.name       : testLRUCacheGetMissCount0008
     * @tc.desc       : Test the function of the getMissCount function.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLRUCacheGetMissCount0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testLRUCacheGetMissCount0008";
      try {
        let cache = new util.LRUCache<number, number>();
        cache.put(1, 10);
        cache.put(2, 20);
        cache.put(3, 30);
        let nonExistentKey = 4;
        let result = cache.contains(nonExistentKey);
        expect(result).assertEqual(false);
        console.info(`${TAG}: contains(${nonExistentKey}) = ${result}`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ArkTs_LRU_CACHE_4500
     * @tc.name       : testLRUCacheGetMissCount0009
     * @tc.desc       : Test the function of the getMissCount function.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLRUCacheGetMissCount0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testLRUCacheGetMissCount0009";
      try {
        let pro: util.LRUCache<number, number> = new util.LRUCache<number, number>();
        pro.put(2, 10);
        pro.put(4, 6);
        pro.createDefault(2);
        pro.createDefault(4);
        expect(pro.getMissCount()).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ArkTs_LRU_CACHE_4600
     * @tc.name       : testLRUCacheGetMissCount0010
     * @tc.desc       : Test the function of the getMissCount function.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLRUCacheGetMissCount0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testLRUCacheGetMissCount0010";
      try {
        let pro: util.LRUCache<number, number> = new util.LRUCache<number, number>();
        pro.put(2, 10);
        pro.put(4, 6);
        pro.createDefault(5);
        pro.createDefault(7);
        expect(pro.getMissCount()).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LRU_CACHE_4700
     * @tc.name       : testLRUCacheConstructor0001
     * @tc.desc       : Test the functionality of the LRUCache constructor and basic put operations.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLRUCacheConstructor0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testLRUCacheConstructor0001";
      try {
        let lruCache: util.LRUCache<number, number> = new util.LRUCache<number, number>();
        lruCache.put(111, 999);
        lruCache.put(222, 888);
        lruCache.put(333, 777);
        let keys: number[] = lruCache.keys();
        expect(keys.includes(111)).assertTrue();
        expect(keys.includes(222)).assertTrue();
        expect(keys.includes(333)).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed,error:${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LRU_CACHE_4800
     * @tc.name       : testLRUCacheConstructor0002
     * @tc.desc       : Test the functionality of iterating over cache entries using entries method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLRUCacheConstructor0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testLRUCacheConstructor0002";
      try {
        let lruCache: util.LRUCache<number, number> = new util.LRUCache<number, number>();
        lruCache.put(111, 999);
        lruCache.put(222, 888);
        lruCache.put(333, 777);
        let entries: IterableIterator<[number, number]> = lruCache.entries();
        let entriesArray: [number, number][] = Array.from(entries);
        let found111 = false;
        let found222 = false;
        let found333 = false;
        for (let i = 0; i < entriesArray.length; i++) {
          let entry = entriesArray[i];
          if (entry[0] === 111 && entry[1] === 999) {
            found111 = true;
          }
          if (entry[0] === 222 && entry[1] === 888) {
            found222 = true;
          }
          if (entry[0] === 333 && entry[1] === 777) {
            found333 = true;
          }
        }
        expect(found111).assertTrue();
        expect(found222).assertTrue();
        expect(found333).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed,error:${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LRU_CACHE_4900
     * @tc.name       : testLRUCacheConstructor0003
     * @tc.desc       : Test LRU cache capacity modification
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLRUCacheConstructor0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testLRUCacheConstructor0003";
      try {
        let lruCache: util.LRUCache<number, number> = new util.LRUCache<number, number>();
        lruCache.put(111, 999);
        lruCache.put(222, 888);
        lruCache.put(333, 777);
        lruCache.put(444, 666);
        lruCache.updateCapacity(1);
        let keys: number[] = lruCache.keys();
        expect(keys.length).assertEqual(1);
        expect(keys.includes(444)).assertTrue();
        expect(keys.includes(111)).assertFalse();
        expect(keys.includes(222)).assertFalse();
        expect(keys.includes(333)).assertFalse();
      } catch (err) {
        console.error(`${TAG} failed,error:${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LRU_CACHE_5000
     * @tc.name       : testLRUCacheConstructor0004
     * @tc.desc       : Test the functionality of getting all existing keys using get method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLRUCacheConstructor0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testLRUCacheConstructor0004";
      try {
        let dataManager: util.LRUCache<number, string> = new util.LRUCache<number, string>();
        dataManager.put(1, "Harmony");
        dataManager.put(2, "OpenHarmony");
        dataManager.put(3, "ArkTS");
        dataManager.remove(1);
        dataManager.remove(2);
        dataManager.remove(3);
        let keys: number[] = dataManager.keys();
        expect(keys.length === 0).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed,error:${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LRU_CACHE_5100
     * @tc.name       : testLRUCacheConstructor0005
     * @tc.desc       : Test the functionality of removing all existing keys using remove method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLRUCacheConstructor0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testLRUCacheConstructor0005";
      try {
        let lruCache: util.LRUCache<number, number> = new util.LRUCache<number, number>();
        lruCache.put(111, 999);
        lruCache.put(222, 888);
        lruCache.put(333, 777);

        lruCache.remove(111);
        lruCache.remove(222);
        lruCache.remove(333);

        let keys: number[] = lruCache.keys();
        expect(keys.length === 0).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed,error:${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LRU_CACHE_5200
     * @tc.name       : testLRUCacheConstructor0006
     * @tc.desc       : Test the functionality of putting the same key multiple times and verify that only the latest value is retained.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLRUCacheConstructor0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testLRUCacheConstructor0006";
      try {
        let lruCache: util.LRUCache<number, number> = new util.LRUCache<number, number>();
        lruCache.put(111, 999);
        lruCache.put(111, 888);
        lruCache.put(111, 777);

        let keys: number[] = lruCache.keys();
        expect(keys.length === 1).assertTrue();
        expect(lruCache.get(111) === 777).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed,error:${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LRU_CACHE_5300
     * @tc.name       : testConstructor0001
     * @tc.desc       : Test the function of the constrctor function.
     * @tc.size s     : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLRUCacheConstructor0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testLRUCacheConstructor0007";
      try {
        let lruCache: util.LRUCache<number, number> = new util.LRUCache<number, number>();

        expect(lruCache.isEmpty()).assertTrue();
        lruCache.put(111, 999);
        lruCache.put(222, 888);
        lruCache.put(333, 777);

        expect(lruCache.isEmpty()).assertFalse();

        lruCache.remove(111);
        lruCache.remove(222);
        lruCache.remove(333);

        expect(lruCache.isEmpty()).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed,error:${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LRU_CACHE_5400
     * @tc.name       : testLRUCacheConstructor0008
     * @tc.desc       : Test getting all keys from LRUCache.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLRUCacheConstructor0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testLRUCacheConstructor0008";
      try {
        let lruCache: util.LRUCache<number, number> = new util.LRUCache<number, number>();
        lruCache.put(444, 666);
        lruCache.put(555, 555);
        lruCache.put(666, 444);
        let keys: number[] = lruCache.keys();
        console.log(`Keys in cache: ${keys}`);
        if (!keys.includes(444)) {
          console.error(`${TAG}: Key 444 not found.`);
          expect(false).assertTrue();
        }
        if (!keys.includes(555)) {
          console.error(`${TAG}: Key 555 not found.`);
          expect(false).assertTrue();
        }
        if (!keys.includes(666)) {
          console.error(`${TAG}: Key 666 not found.`);
          expect(false).assertTrue();
        }

        if (lruCache.get(444) !== 666) {
          console.error(`${TAG}: Value for key 444 is incorrect.`);
          expect(false).assertTrue();
        }
        if (lruCache.get(555) !== 555) {
          console.error(`${TAG}: Value for key 555 is incorrect.`);
          expect(false).assertTrue();
        }
        if (lruCache.get(666) !== 444) {
          console.error(`${TAG}: Value for key 666 is incorrect.`);
          expect(false).assertTrue();
        }
        expect(lruCache.get(444)).assertEqual(666);
        expect(lruCache.get(555)).assertEqual(555);
        expect(lruCache.get(666)).assertEqual(444);
      } catch (err) {
        console.error(`${TAG} failed,error:${err.message}`);
        expect(false).assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LRU_CACHE_5500
     * @tc.name       : testLRUCacheGetMatchCount0001
     * @tc.desc       : Test the function of the interface getMatchCount.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLRUCacheGetMatchCount0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testLRUCacheGetMatchCount0001";
      try {
        let pro = new util.LRUCache<number, number>();
        pro.put(1, 10);
        pro.put(2, 20);
        pro.put(3, 30);
        let values = pro.values();
        let result = pro.getMatchCount();
        expect(result).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed,error:${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LRU_CACHE_5600
     * @tc.name       : testLRUCacheGetMatchCount0002
     * @tc.desc       : Test the function of the interface getMatchCount.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLRUCacheGetMatchCount0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testLRUCacheGetMatchCount0002";
      try {
        let pro = new util.LRUCache<number, number>();
        pro.put(1, 10);
        pro.put(2, 20);
        pro.put(3, 30);

        pro.remove(1);
        pro.remove(2);
        pro.remove(3);
        let result = pro.getMatchCount();
        expect(result).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed,error:${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LRU_CACHE_5700
     * @tc.name       : testLRUCacheGetMatchCount0003
     * @tc.desc       : Test the function of the interface getMatchCount.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLRUCacheGetMatchCount0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testLRUCacheGetMatchCount0003";
      try {
        let pro = new util.LRUCache<number, number>();
        pro.put(1, 10);
        pro.put(2, 20);
        pro.put(3, 30);

        pro.remove(4);
        pro.remove(5);
        pro.remove(6);
        let result = pro.getMatchCount();
        expect(result).assertEqual(0);

      } catch (err) {
        console.error(`${TAG} failed,error:${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LRU_CACHE_5800
     * @tc.name       : testLRUCacheGetMatchCount0004
     * @tc.desc       : Test the function of the interface getMatchCount.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLRUCacheGetMatchCount0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testLRUCacheGetMatchCount0004";
      try {
        let pro = new util.LRUCache<number, number>();
        pro.put(1, 10);
        pro.put(2, 20);
        pro.put(3, 30);
        let result1 = pro.contains(1);
        let result2 = pro.contains(2);
        let result3 = pro.contains(3);
        let result = pro.getMatchCount();
        expect(result).assertEqual(3);

      } catch (err) {
        console.error(`${TAG} failed,error:${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LRU_CACHE_5900
     * @tc.name       : testLRUCacheGetMatchCount0005
     * @tc.desc       : Test the function of the interface getMatchCount.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLRUCacheGetMatchCount0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testLRUCacheGetMatchCount0005";
      try {
        let pro = new util.LRUCache<number, number>();
        pro.put(1, 10);
        pro.put(2, 20);
        pro.put(3, 30);
        let result1 = pro.contains(4);
        let result2 = pro.contains(5);
        let result3 = pro.contains(6);
        let result = pro.getMatchCount();
        expect(result).assertEqual(0);

      } catch (err) {
        console.error(`${TAG} failed,error:${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LRU_CACHE_6000
     * @tc.name       : testLRUCacheGetMatchCount0006
     * @tc.desc       : Test the function of the interface getMatchCount.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLRUCacheGetMatchCount0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testLRUCacheGetMatchCount0006";
      try {
        let pro = new util.LRUCache<number, number>();
        pro.put(1, 10);
        pro.put(2, 20);
        pro.put(3, 30);
        let result1 = pro.createDefault(1);
        let result2 = pro.createDefault(2);
        let result3 = pro.createDefault(3);
        let result = pro.getMatchCount();
        expect(result).assertEqual(0);

      } catch (err) {
        console.error(`${TAG} failed,error:${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LRU_CACHE_6100
     * @tc.name       : testLRUCacheGetMatchCount0007
     * @tc.desc       : Test the function of the interface getMatchCount.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLRUCacheGetMatchCount0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = " testLRUCacheGetMatchCount0007";
      try {
        let pro = new util.LRUCache<number, number>();
        pro.put(2, 10);
        let result = pro.createDefault(70);
        result = pro.createDefault(50);
        result = pro.createDefault(60);
        let result2 = pro.getMatchCount();
        expect(result2).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LRU_CACHE_6200
     * @tc.name       : testLRUCacheGetMatchCount0008
     * @tc.desc       : Test the function of the getMatchCount function.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLRUCacheGetMatchCount0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testLRUCacheGetMatchCount0008";
      try {
        let pro = new util.LRUCache<number, number>();
        pro.put(1, 100);
        pro.put(2, 200);
        pro.put(3, 300);
        let keyList = pro.keys();
        let result = pro.getMatchCount();
        expect(result).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LRU_CACHE_6300
     * @tc.name       : testLRUCacheGetMatchCount0009
     * @tc.desc       : Test the function of the Interface LRUCache.getMatchCount().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLRUCacheGetMatchCount0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testLRUCacheGetMatchCount0009";
      try {
        let pro = new util.LRUCache<number, number>();
        pro.put(2, 10);
        pro.put(5, 20);
        pro.put(7, 30);
        let pair: Iterable<Object[]> = pro.entries();
        let arrayValue = Array.from(pair);
        for (let value of arrayValue) {
        }
        let matchCount = pro.getMatchCount();
        expect(matchCount).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LRU_CACHE_6400
     * @tc.name       : testLRUCacheGetPutCount0001
     * @tc.desc       : Test the function of the Interface LRUCache.getPutCount().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLRUCacheGetPutCount0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testLRUCacheGetPutCount0001";
      try {
        let pro = new util.LRUCache<number, number>();
        pro.put(2, 10);
        pro.put(5, 20);
        pro.put(7, 30);
        pro.updateCapacity(1);
        let putCount = pro.getPutCount();
        expect(putCount).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LRU_CACHE_6500
     * @tc.name       : testLRUCacheGetPutCount0002
     * @tc.desc       : Test the function of the Interface LRUCache.getPutCount().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLRUCacheGetPutCount0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testLRUCacheGetPutCount0002";
      try {
        let pro = new util.LRUCache<number, number>();
        pro.put(2, 10);
        pro.put(5, 20);
        pro.put(7, 30);
        pro.updateCapacity(100);
        let putCount = pro.getPutCount();
        expect(putCount).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LRU_CACHE_6600
     * @tc.name       : testLRUCacheGetPutCount0003
     * @tc.desc       : Test the function of the Interface LRUCache.getPutCount() without constructor parameters
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLRUCacheGetPutCount0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testLRUCacheGetPutCount0003";
      try {
        let cache = new util.LRUCache<number, number>();
        cache.put(1, 100);
        cache.put(2, 200);
        cache.put(3, 300);
        cache.get(2);
        cache.put(1, 150);
        cache.put(2, 250);
        cache.put(3, 350);
        let structCount = cache.getPutCount();
        expect(structCount).assertEqual(6);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LRU_CACHE_6700
     * @tc.name       : testLRUCacheGetPutCount0004
     * @tc.desc
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLRUCacheGetPutCount0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testLRUCacheGetPutCount0004";
      try {
        const cache = new util.LRUCache<number, number>();
        cache.put(1, 10);
        cache.put(2, 20);
        cache.put(3, 30);
        cache.remove(1);
        cache.remove(2);
        cache.remove(3);
        cache.put(1, 100);
        cache.put(2, 400);
        cache.put(3, 500);
        const putCount = cache.getPutCount();
        expect(putCount).assertEqual(6);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LRU_CACHE_6800
     * @tc.name       : testLRUCacheGet0001
     * @tc.desc       : Test the function of the Interface LRUCache.get().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLRUCacheGet0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testLRUCacheGet0001";
      try {
        let pro = new util.LRUCache<number, number>();
        pro.put(1, NaN);
        let result = pro.get(1);
        expect(Number.isNaN(result)).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LRU_CACHE_6900
     * @tc.name       : testLRUCacheGet0002
     * @tc.desc       : Test the function of the Interface LRUCache.get().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLRUCacheGet0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testLRUCacheGet0002";
      try {
        let pro = new util.LRUCache<number, number>();
        pro.put(1, undefined);
        pro.get(1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.code}`).assertEqual('401');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LRU_CACHE_7000
     * @tc.name       : testLRUCacheRemove0001
     * @tc.desc       : Test the function of the interface Remove.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     **/
    it('testLRUCacheRemove0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testLRUCacheRemove0001";
      try {
        let pro = new util.LRUCache<number, number>();
        pro.put(1, 1);
        let result = pro.remove(NaN);
        expect(result).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LRU_CACHE_7100
     * @tc.name       : testLRUCacheRemove0002
     * @tc.desc       : Test the function of the interface Set.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     **/
    it("testLRUCacheRemove0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const tga = 'testLRUCacheRemove0002';
      try {
        let pro = new util.LRUCache<number, number>(1);
        pro.put(1, 100);
        pro.put(2, 200);
        pro.put(3, 300);

        pro.remove(undefined);
        expect().assertFail();
      } catch (err) {
        console.log(`${tga} failed, error: ${err.message}`);
        expect(err.code).assertEqual(401);
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LRU_CACHE_7200
     * @tc.name       : testLRUCachecontains0001
     * @tc.desc       : Test the function of the interface contains.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     **/
    it('testLRUCachecontains0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testLRUCachecontains0001';
      try {
        let pro = new util.LRUCache<number, number>();
        pro.put(2, 10);
        let result = pro.contains(null);
        expect(result).assertEqual(false)
      } catch (err) {
        console.error(`${TAG} failed,error:${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LRU_CACHE_7300
     * @tc.name       : testLRUCachecontains0002
     * @tc.desc       : Test the function of the interface contains.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     **/
    it('testLRUCachecontains0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testLRUCachecontains0002';
      try {
        let pro = new util.LRUCache<number, number>();
        pro.put(2, 10);
        let result = pro.contains(NaN);
        expect(result).assertEqual(false)
      } catch (err) {
        console.error(`${TAG} failed,error:${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_CREATEDEFAULT_7400
     * @tc.name       : testLRUCacheCreateDefault0001
     * @tc.desc       : Test the behavior of createDefault interface when input is NaN.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     **/
    it('testLRUCacheCreateDefault0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testLRUCacheCreateDefault0001";
      try {
        let pro = new util.LRUCache<number, number>();
        pro.put(2, 10);
        let result = pro.createDefault(null);
        expect(result).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })


    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LRU_CACHE_7500
     * @tc.name       : testLRUCacheCreateDefault0002
     * @tc.desc       : Test createDefault function with NaN input parameter.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     **/
    it('testLRUCacheCreateDefault0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testLRUCacheCreateDefault0002";
      try {
        let pro = new util.LRUCache<number, number>();
        pro.put(2, 10);
        let result = pro.createDefault(NaN);
        expect(result).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
  })
}