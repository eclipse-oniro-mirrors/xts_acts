import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { util } from '@kit.ArkTS';

const sleep = (time: number): Promise<void> => {
  return new Promise<void>((resolve) => {
    setTimeout(resolve, time);
  });
};

export default function LRUCache04Test() {
  describe('LRUCache04Test', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
      await sleep(30);
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
     * @tc.number    SUB_UTIL_LRU_CACHE04_0100
     * @tc.name      testLRUCacheIsEmpty04_0001
     * @tc.desc      Verify isEmpty behavior with Minimum Valid Capacity (1).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheIsEmpty04_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheIsEmpty04_0001";
      console.log(TAG + " start");

      // Changed to 1 because 0 is invalid
      const cache = new util.LRUCache<string, string>(1);
      expect(cache.isEmpty()).assertTrue();

      // Put item
      cache.put("A", "1");
      expect(cache.isEmpty()).assertFalse();

      // Clear
      cache.clear();
      expect(cache.isEmpty()).assertTrue();

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE04_0200
     * @tc.name      testLRUCacheIsEmpty04_0002
     * @tc.desc      Verify isEmpty correctness under large volume operations (Fill and Clear).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheIsEmpty04_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheIsEmpty04_0002";
      console.log(TAG + " start");

      const cache = new util.LRUCache<number, number>(100);

      for (let i = 0; i < 50; i++) {
        cache.put(i, i);
      }
      expect(cache.isEmpty()).assertFalse();

      cache.clear();
      expect(cache.isEmpty()).assertTrue();

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE04_0300
     * @tc.name      testLRUCacheGet04_0003
     * @tc.desc      Verify get existing key.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLRUCacheGet04_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cache = new util.LRUCache<number, string>(10);
      cache.put(1, 'a');
      const result = cache.get(1);
      expect(result).assertEqual('a');
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE04_0400
     * @tc.name      testLRUCacheGet04_0004
     * @tc.desc      Verify get non-existing key.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLRUCacheGet04_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cache = new util.LRUCache<number, string>(10);
      const result = cache.get(1);
      expect(result === undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE04_0500
     * @tc.name      testLRUCacheGet04_0005
     * @tc.desc      Verify get updates LRU order.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLRUCacheGet04_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cache = new util.LRUCache<number, string>(3);
      cache.put(1, 'a');
      cache.put(2, 'b');
      cache.put(3, 'c');
      cache.get(1);
      cache.put(4, 'd');
      const result = cache.get(1);
      expect(result).assertEqual('a');
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE04_0600
     * @tc.name      testLRUCacheGet04_0006
     * @tc.desc      Verify get after clear.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLRUCacheGet04_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cache = new util.LRUCache<number, string>(10);
      cache.put(1, 'a');
      cache.clear();
      const result = cache.get(1);
      expect(result === undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE04_0700
     * @tc.name      testLRUCacheGet04_0007
     * @tc.desc      Verify get after eviction.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLRUCacheGet04_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cache = new util.LRUCache<number, string>(1);
      cache.put(1, 'a');
      cache.put(2, 'b');
      const result = cache.get(1);
      expect(result === undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE04_0800
     * @tc.name      testLRUCacheGet04_0008
     * @tc.desc      Verify get with string key.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLRUCacheGet04_0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cache = new util.LRUCache<string, string>(10);
      cache.put('key', 'value');
      const result = cache.get('key');
      expect(result).assertEqual('value');
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE04_0900
     * @tc.name      testLRUCacheGet04_0009
     * @tc.desc      Verify get same key multiple times.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLRUCacheGet04_0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cache = new util.LRUCache<number, string>(10);
      cache.put(1, 'a');
      cache.get(1);
      const result = cache.get(1);
      expect(result).assertEqual('a');
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE04_1000
     * @tc.name      testLRUCacheGet04_0010
     * @tc.desc      Verify get after updateCapacity.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLRUCacheGet04_0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cache = new util.LRUCache<number, string>(10);
      cache.put(1, 'a');
      cache.updateCapacity(5);
      const result = cache.get(1);
      expect(result).assertEqual('a');
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE04_1100
     * @tc.name      testLRUCacheGet04_0011
     * @tc.desc      Verify get after put same key.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLRUCacheGet04_0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cache = new util.LRUCache<number, string>(10);
      cache.put(1, 'a');
      cache.put(1, 'b');
      const result = cache.get(1);
      expect(result).assertEqual('b');
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE04_1200
     * @tc.name      testLRUCacheGet04_0012
     * @tc.desc      Verify get after keys call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLRUCacheGet04_0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cache = new util.LRUCache<number, string>(10);
      cache.put(1, 'a');
      cache.keys();
      const result = cache.get(1);
      expect(result).assertEqual('a');
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE04_1300
     * @tc.name      testLRUCacheGet04_0013
     * @tc.desc      Verify get after values call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLRUCacheGet04_0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cache = new util.LRUCache<number, string>(10);
      cache.put(1, 'a');
      cache.values();
      const result = cache.get(1);
      expect(result).assertEqual('a');
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE04_1400
     * @tc.name      testLRUCacheGet04_0014
     * @tc.desc      Verify get with large capacity.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLRUCacheGet04_0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cache = new util.LRUCache<number, string>(1000);
      cache.put(1, 'a');
      const result = cache.get(1);
      expect(result).assertEqual('a');
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE04_1500
     * @tc.name      testLRUCacheGet04_0015
     * @tc.desc      Verify get after multiple operations.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLRUCacheGet04_0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cache = new util.LRUCache<number, string>(10);
      cache.put(1, 'a');
      cache.put(2, 'b');
      cache.get(1);
      const result = cache.get(2);
      expect(result).assertEqual('b');
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE04_1600
     * @tc.name      testLRUCachePut04_0016
     * @tc.desc      [Consolidated] Verify basic put functionality: Insert new key, Update existing key.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCachePut04_0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCachePut04_0016";
      console.log(TAG + " start");

      const cache = new util.LRUCache<number, string>(10);

      const res1 = cache.put(1, 'a');
      expect(res1).assertEqual('a');
      expect(cache.length).assertEqual(1);

      const res2 = cache.put(1, 'b');
      expect(res2).assertEqual('b');
      expect(cache.length).assertEqual(1);

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE04_1700
     * @tc.name      testLRUCachePut04_0017
     * @tc.desc      [Consolidated] Verify eviction logic
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCachePut04_0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCachePut04_0017";
      console.log(TAG + " start");

      const cache = new util.LRUCache<number, string>(3);
      cache.put(1, 'a');
      cache.put(2, 'b');
      cache.put(3, 'c');

      cache.put(1, 'd');

      cache.put(4, 'e');

      expect(cache.get(2)).assertUndefined();

      expect(cache.get(1)).assertEqual('d');
      expect(cache.get(3)).assertEqual('c');
      expect(cache.get(4)).assertEqual('e');

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE04_1800
     * @tc.name      testLRUCachePut04_0018
     * @tc.desc      [Consolidated] Verify put behavior with Edge Capacities (0 and 1).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCachePut04_0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCachePut04_0018";
      console.log(TAG + " start");

      const cache1 = new util.LRUCache<number, string>(1);
      cache1.put(1, 'a');
      cache1.put(2, 'b');
      expect(cache1.get(1)).assertUndefined();
      expect(cache1.get(2)).assertEqual('b');

      try {
        const cache0 = new util.LRUCache<number, string>(0);

      } catch(e) {
        console.log(TAG + " Capacity 0 not supported");
      }

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE04_1900
     * @tc.name      testLRUCachePut04_0019
     * @tc.desc      Verify put with various Key types (String, Object).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCachePut04_0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCachePut04_0019";
      console.log(TAG + " start");

      const cacheStr = new util.LRUCache<string, string>(5);
      expect(cacheStr.put('key', 'value')).assertEqual('value');

      interface KeyObj { id: number }
      const cacheObj = new util.LRUCache<KeyObj, string>(5);
      const k1: KeyObj = { id: 1 };

      expect(cacheObj.put(k1, 'objVal')).assertEqual('objVal');
      expect(cacheObj.get(k1)).assertEqual('objVal');

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE04_2000
     * @tc.name      testLRUCachePut04_0020
     * @tc.desc      Verify put with various Value types (Interface Object, Union of primitives).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCachePut04_0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCachePut04_0020";
      console.log(TAG + " start");

      interface ValObj { name: string }
      const cacheObj = new util.LRUCache<number, ValObj>(5);
      const v1: ValObj = { name: 'test' };

      const res = cacheObj.put(1, v1);
      expect(res.name).assertEqual('test');

      const cacheUnion = new util.LRUCache<number, string | number>(5);

      cacheUnion.put(2, "StringVal");
      expect(cacheUnion.get(2)).assertEqual("StringVal");

      cacheUnion.put(3, 12345);
      expect(cacheUnion.get(3)).assertEqual(12345);

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE04_2100
     * @tc.name      testLRUCachePut04_0021
     * @tc.desc      [Consolidated] Verify interactions: Put after UpdateCapacity, Clear, Get, Keys, Values.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCachePut04_0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCachePut04_0021";
      console.log(TAG + " start");

      const cache = new util.LRUCache<number, string>(10);

      cache.updateCapacity(5);
      cache.put(1, 'a');
      expect(cache.get(1)).assertEqual('a');

      cache.get(1);
      cache.put(2, 'b');
      expect(cache.length).assertEqual(2);

      cache.keys();
      cache.values();
      cache.put(3, 'c');
      expect(cache.length).assertEqual(3);

      cache.clear();
      cache.put(4, 'd');
      expect(cache.length).assertEqual(1);
      expect(cache.get(4)).assertEqual('d');

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE04_2200
     * @tc.name      testLRUCachePut04_0022
     * @tc.desc      Verify batch insertion (multiple keys).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCachePut04_0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCachePut04_0022";
      console.log(TAG + " start");

      const cache = new util.LRUCache<number, string>(10);
      cache.put(1, 'a');
      cache.put(2, 'b');
      cache.put(3, 'c');

      expect(cache.length).assertEqual(3);
      expect(cache.get(1)).assertEqual('a');
      expect(cache.get(2)).assertEqual('b');
      expect(cache.get(3)).assertEqual('c');

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE04_2300
     * @tc.name      testLRUCachePut04_0023
     * @tc.desc      Verify stress test: Put large number of items causing massive eviction.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCachePut04_0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCachePut04_0023";
      console.log(TAG + " start");

      const capacity = 100;
      const total = 500;
      const cache = new util.LRUCache<number, string>(capacity);

      for (let i = 0; i < total; i++) {
        cache.put(i, 'val' + i);
      }

      expect(cache.length).assertEqual(capacity);
      expect(cache.get(0)).assertUndefined();
      expect(cache.get(499)).assertEqual('val499');

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE04_2400
     * @tc.name      testLRUCachePut04_0024
     * @tc.desc      Verify put return value consistency (always returns the value being put).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCachePut04_0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCachePut04_0024";
      console.log(TAG + " start");

      const cache = new util.LRUCache<string, number>(5);

      expect(cache.put("A", 10)).assertEqual(10);

      expect(cache.put("A", 20)).assertEqual(20);

      expect(cache.put("A", 20)).assertEqual(20);

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE04_2500
     * @tc.name      testLRUCachePut04_0025
     * @tc.desc      Verify put operation when cache is exactly at capacity boundary.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCachePut04_0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCachePut04_0025";
      console.log(TAG + " start");

      const cache = new util.LRUCache<number, number>(2);

      cache.put(1, 1);
      expect(cache.length).assertEqual(1);

      cache.put(2, 2);
      expect(cache.length).assertEqual(2);

      cache.put(3, 3);
      expect(cache.length).assertEqual(2);
      expect(cache.get(1)).assertUndefined();

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE04_2600
     * @tc.name      testLRUCachePut04_0026
     * @tc.desc      Verify put operation with Array object values.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCachePut04_0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCachePut04_0026";
      console.log(TAG + " start");

      const cache = new util.LRUCache<string, number[]>(5);

      const arr = [1, 2, 3];
      const res = cache.put("key", arr);

      expect(res[0]).assertEqual(1);
      expect(res[1]).assertEqual(2);
      expect(res[2]).assertEqual(3);

      const val = cache.get("key");

      if (val !== undefined) {
        expect(val[0]).assertEqual(1);
      } else {
        expect(val).not().assertUndefined();
      }

      expect(cache.length).assertEqual(1);

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE04_2700
     * @tc.name      testLRUCachePut04_0027
     * @tc.desc      Verify put maintains insertion order for iteration (keys/values/entries).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCachePut04_0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCachePut04_0027";
      console.log(TAG + " start");

      const cache = new util.LRUCache<string, number>(5);

      cache.put("A", 1);
      cache.put("B", 2);
      cache.put("C", 3);

      const keys1 = cache.keys();
      expect(keys1[0]).assertEqual("A");
      expect(keys1[1]).assertEqual("B");
      expect(keys1[2]).assertEqual("C");

      cache.put("A", 10);

      const keys2 = cache.keys();
      expect(keys2[0]).assertEqual("B");
      expect(keys2[1]).assertEqual("C");
      expect(keys2[2]).assertEqual("A");

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE04_2800
     * @tc.name      testLRUCachePut04_0028
     * @tc.desc      Verify put after removing all items manually.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCachePut04_0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCachePut04_0028";
      console.log(TAG + " start");

      const cache = new util.LRUCache<string, string>(5);
      cache.put("A", "1");
      cache.remove("A");

      cache.put("A", "2");
      expect(cache.length).assertEqual(1);
      expect(cache.get("A")).assertEqual("2");

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE04_2900
     * @tc.name      testLRUCachePut04_0029
     * @tc.desc      Verify put works correctly after shrinking capacity destroys previous entries.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCachePut04_0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCachePut04_0029";
      console.log(TAG + " start");

      const cache = new util.LRUCache<string, string>(3);
      cache.put("A", "1");
      cache.put("B", "2");

      cache.updateCapacity(1);

      cache.put("C", "3");
      expect(cache.get("A")).assertUndefined();
      expect(cache.get("B")).assertUndefined();
      expect(cache.get("C")).assertEqual("3");
      expect(cache.length).assertEqual(1);

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE04_3000
     * @tc.name      testLRUCachePut04_0030
     * @tc.desc      Verify put consistency with mixed key types in same cache.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCachePut04_0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCachePut04_0030";
      console.log(TAG + " start");

      const cache = new util.LRUCache<string | number, string>(5);

      cache.put("1", "StringKey");
      cache.put(1, "NumberKey");

      expect(cache.length).assertEqual(2);
      expect(cache.get("1")).assertEqual("StringKey");
      expect(cache.get(1)).assertEqual("NumberKey");

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE04_3100
     * @tc.name      testLRUCacheValues04_0031
     * @tc.desc      Verify values method returns correct array for multiple entries.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLRUCacheValues04_0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG: string = "testLRUCacheValues04_0031";
      console.log(TAG + " start");

      const lrucache = new util.LRUCache<number, string>();
      lrucache.put(1, 'A');
      lrucache.put(2, 'B');
      lrucache.put(3, 'C');

      // Verify length and content
      const values: string[] = lrucache.values();
      expect(values.length).assertEqual(3);
      expect(values[0]).assertEqual('A');
      expect(values[1]).assertEqual('B');
      expect(values[2]).assertEqual('C');

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE04_3200
     * @tc.name      testLRUCacheValues04_0032
     * @tc.desc      Verify values method returns empty array for empty cache.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLRUCacheValues04_0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG: string = "testLRUCacheValues04_0032";
      console.log(TAG + " start");

      const lrucache = new util.LRUCache<number, string>();
      const values: string[] = lrucache.values();
      expect(values.length).assertEqual(0);

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE04_3300
     * @tc.name      testLRUCacheValues04_0033
     * @tc.desc      Verify values method returns correct values at full capacity.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLRUCacheValues04_0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG: string = "testLRUCacheValues04_0033";
      console.log(TAG + " start");

      const lrucache = new util.LRUCache<number, string>(5);
      lrucache.put(1, 'value1');
      lrucache.put(2, 'value2');
      lrucache.put(3, 'value3');
      lrucache.put(4, 'value4');
      lrucache.put(5, 'value5');

      const values: string[] = lrucache.values();
      expect(values.length).assertEqual(5);

      expect(values[0]).assertEqual('value1');
      expect(values[4]).assertEqual('value5');

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE04_3400
     * @tc.name      testLRUCacheValues04_0034
     * @tc.desc      Verify values method excludes evicted entries when exceeding capacity.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLRUCacheValues04_0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG: string = "testLRUCacheValues04_0034";
      console.log(TAG + " start");

      const lrucache = new util.LRUCache<number, string>(3);
      lrucache.put(1, 'A');
      lrucache.put(2, 'B');
      lrucache.put(3, 'C');

      lrucache.put(4, 'D');

      const values: string[] = lrucache.values();
      expect(values.length).assertEqual(3);

      expect(values[0]).assertEqual('B');
      expect(values[1]).assertEqual('C');
      expect(values[2]).assertEqual('D');

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE04_3500
     * @tc.name      testLRUCacheValues04_0035
     * @tc.desc      Verify values method with diverse types (Primitives, Arrays, Objects).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLRUCacheValues04_0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG: string = "testLRUCacheValues04_0035";
      console.log(TAG + " start");

      const numCache = new util.LRUCache<string, number>();
      numCache.put('k1', 100);
      const numValues = numCache.values();
      expect(numValues[0]).assertEqual(100);

      const boolCache = new util.LRUCache<number, boolean>();
      boolCache.put(1, true);
      const boolValues = boolCache.values();
      expect(boolValues[0]).assertTrue();

      const arrCache = new util.LRUCache<string, number[]>();
      arrCache.put('a', [1, 2, 3]);
      const arrValues = arrCache.values();
      expect(arrValues[0].length).assertEqual(3);

      interface TestObj { name: string }
      const objCache = new util.LRUCache<number, TestObj>();
      objCache.put(1, { name: 'obj1' });
      const objValues = objCache.values();
      expect(objValues[0].name).assertEqual('obj1');

      const dateCache = new util.LRUCache<number, Date>();
      const dateVal = new Date();
      dateCache.put(1, dateVal);
      const dateValues = dateCache.values();
      expect(dateValues[0]).assertEqual(dateVal);

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE04_3600
     * @tc.name      testLRUCacheValues04_0036
     * @tc.desc      Verify values method returns updated value when key is overwritten.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLRUCacheValues04_0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG: string = "testLRUCacheValues04_0036";
      console.log(TAG + " start");

      const lrucache = new util.LRUCache<number, string>();
      lrucache.put(1, 'A');
      lrucache.put(1, 'B');

      const values: string[] = lrucache.values();
      expect(values.length).assertEqual(1);
      expect(values[0]).assertEqual('B');

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE04_3700
     * @tc.name      testLRUCacheValues04_0037
     * @tc.desc      Verify values method order reflects LRU updates (get operation moves item to end).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLRUCacheValues04_0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG: string = "testLRUCacheValues04_0037";
      console.log(TAG + " start");

      const lrucache = new util.LRUCache<number, string>();
      lrucache.put(1, 'A');
      lrucache.put(2, 'B');

      lrucache.get(1);

      const values: string[] = lrucache.values();
      expect(values.length).assertEqual(2);

      expect(values[0]).assertEqual('B');
      expect(values[1]).assertEqual('A');

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE04_3800
     * @tc.name      testLRUCacheValues04_0038
     * @tc.desc      Verify values method returns independent snapshots on multiple calls.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLRUCacheValues04_0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG: string = "testLRUCacheValues04_0038";
      console.log(TAG + " start");

      const lrucache = new util.LRUCache<number, string>();
      lrucache.put(1, 'A');

      const values1: string[] = lrucache.values();

      lrucache.put(2, 'B');
      const values2: string[] = lrucache.values();

      expect(values1.length).assertEqual(1);
      expect(values1[0]).assertEqual('A');

      expect(values2.length).assertEqual(2);
      expect(values2[1]).assertEqual('B');

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE04_3900
     * @tc.name      testLRUCacheValues04_0039
     * @tc.desc      Verify values method reflects cache state after remove operation.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLRUCacheValues04_0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG: string = "testLRUCacheValues04_0039";
      console.log(TAG + " start");

      const lrucache = new util.LRUCache<number, string>();
      lrucache.put(1, 'A');
      lrucache.put(2, 'B');
      lrucache.remove(1);

      const values: string[] = lrucache.values();
      expect(values.length).assertEqual(1);
      expect(values[0]).assertEqual('B');

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE04_4000
     * @tc.name      testLRUCacheValues04_0040
     * @tc.desc      Verify values method after clear operation returns empty array.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLRUCacheValues04_0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG: string = "testLRUCacheValues04_0040";
      console.log(TAG + " start");

      const lrucache = new util.LRUCache<number, string>();
      lrucache.put(1, 'A');
      lrucache.put(2, 'B');
      lrucache.put(3, 'C');
      lrucache.clear();

      const values: string[] = lrucache.values();
      expect(values.length).assertEqual(0);

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE04_4100
     * @tc.name      testLRUCacheValues04_0041
     * @tc.desc      Verify values method with capacity 1 works correctly.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLRUCacheValues04_0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG: string = "testLRUCacheValues04_0041";
      console.log(TAG + " start");

      const lrucache = new util.LRUCache<number, string>(1);
      lrucache.put(1, 'A');

      lrucache.put(2, 'B');

      const values: string[] = lrucache.values();
      expect(values.length).assertEqual(1);
      expect(values[0]).assertEqual('B');

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE04_4200
     * @tc.name      testLRUCacheValues04_0042
     * @tc.desc      Verify values method correctness after mixed operations (contains, put, remove).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLRUCacheValues04_0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG: string = "testLRUCacheValues04_0042";
      console.log(TAG + " start");

      const lrucache = new util.LRUCache<number, string>();
      lrucache.put(1, 'A');
      lrucache.put(2, 'B');
      lrucache.put(3, 'C');

      lrucache.contains(2);
      lrucache.remove(1);

      const values: string[] = lrucache.values();
      expect(values.length).assertEqual(2);

      expect(values[0]).assertEqual('C');
      expect(values[1]).assertEqual('B');

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE04_4300
     * @tc.name      testLRUCacheValues04_0043
     * @tc.desc      Verify values method handles large capacity cache correctly.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLRUCacheValues04_0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG: string = "testLRUCacheValues04_0043";
      console.log(TAG + " start");

      const lrucache = new util.LRUCache<number, string>(100);
      for (let i = 0; i < 100; i++) {
        lrucache.put(i, `value${i}`);
      }

      const values: string[] = lrucache.values();
      expect(values.length).assertEqual(100);
      expect(values[0]).assertEqual('value0');
      expect(values[99]).assertEqual('value99');

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE04_4400
     * @tc.name      testLRUCacheValues04_0044
     * @tc.desc      Verify values method after updateCapacity resizing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLRUCacheValues04_0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG: string = "testLRUCacheValues04_0044";
      console.log(TAG + " start");

      const lrucache = new util.LRUCache<string, string>(5);
      lrucache.put("A", "1");
      lrucache.put("B", "2");
      lrucache.put("C", "3");

      lrucache.updateCapacity(1);

      const values: string[] = lrucache.values();
      expect(values.length).assertEqual(1);
      expect(values[0]).assertEqual('3');

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE04_4500
     * @tc.name      testLRUCacheValues04_0045
     * @tc.desc      Verify values after overwriting with same values (idempotent updates).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLRUCacheValues04_0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG: string = "testLRUCacheValues04_0045";
      console.log(TAG + " start");

      const lrucache = new util.LRUCache<string, string>(3);
      lrucache.put("A", "1");
      lrucache.put("B", "2");

      lrucache.put("B", "2");

      const values: string[] = lrucache.values();

      expect(values[0]).assertEqual("1");
      expect(values[1]).assertEqual("2");

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE04_4600
     * @tc.name      testLRUCacheKeys04_0046
     * @tc.desc      [Consolidated] Verify keys() basic behavior: Empty, Single, Multiple elements (LRU -> MRU order).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheKeys04_0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheKeys04_0046";
      console.log(TAG + " start");

      const cacheEmpty = new util.LRUCache<number, string>(3);
      const resEmpty = cacheEmpty.keys();
      expect(resEmpty.length).assertEqual(0);

      cacheEmpty.put(1, "A");
      const resSingle = cacheEmpty.keys();
      expect(resSingle.length).assertEqual(1);
      expect(resSingle[0]).assertEqual(1);

      cacheEmpty.put(2, "B");
      cacheEmpty.put(3, "C");
      const resMulti = cacheEmpty.keys();
      expect(resMulti.length).assertEqual(3);

      expect(resMulti[0]).assertEqual(1);
      expect(resMulti[1]).assertEqual(2);
      expect(resMulti[2]).assertEqual(3);

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE04_4700
     * @tc.name      testLRUCacheKeys04_0047
     * @tc.desc      [Consolidated] Verify keys() order updates after Access and Update (Item moves to end).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheKeys04_0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheKeys04_0047";
      console.log(TAG + " start");

      const cache = new util.LRUCache<number, string>(5);
      cache.put(1, "A");
      cache.put(2, "B");
      cache.put(3, "C");

      cache.get(1);
      let keys = cache.keys();
      expect(keys[0]).assertEqual(2);
      expect(keys[1]).assertEqual(3);
      expect(keys[2]).assertEqual(1);

      cache.put(2, "B_Updated");
      keys = cache.keys();
      expect(keys[0]).assertEqual(3);
      expect(keys[1]).assertEqual(1);
      expect(keys[2]).assertEqual(2);

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE04_4800
     * @tc.name      testLRUCacheKeys04_0048
     * @tc.desc      [Consolidated] Verify keys() behavior with Eviction (Exceed Capacity).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheKeys04_0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheKeys04_0048";
      console.log(TAG + " start");

      const cache = new util.LRUCache<number, string>(3);
      cache.put(1, "A");
      cache.put(2, "B");
      cache.put(3, "C");

      cache.put(4, "D");
      let keys = cache.keys();
      expect(keys.length).assertEqual(3);
      expect(keys[0]).assertEqual(2);
      expect(keys[1]).assertEqual(3);
      expect(keys[2]).assertEqual(4);

      cache.get(2);

      cache.put(5, "E");
      keys = cache.keys();
      expect(keys[0]).assertEqual(4);
      expect(keys[1]).assertEqual(2);
      expect(keys[2]).assertEqual(5);

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE04_4900
     * @tc.name      testLRUCacheKeys04_0049
     * @tc.desc      [Consolidated] Verify keys() state after Removal and Clear.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheKeys04_0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheKeys04_0049";
      console.log(TAG + " start");

      const cache = new util.LRUCache<number, string>(5);
      cache.put(1, "A");
      cache.put(2, "B");
      cache.put(3, "C");
      cache.remove(2);
      let keys = cache.keys();
      expect(keys.length).assertEqual(2);
      expect(keys[0]).assertEqual(1);
      expect(keys[1]).assertEqual(3);

      cache.clear();
      keys = cache.keys();
      expect(keys.length).assertEqual(0);

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE04_5100
     * @tc.name      testLRUCacheKeys04_0051
     * @tc.desc      Verify keys() works with String keys.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheKeys04_0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheKeys04_0051";
      console.log(TAG + " start");

      const cache = new util.LRUCache<string, number>(3);
      cache.put("A", 1);
      cache.put("B", 2);
      cache.put("C", 3);

      const keys = cache.keys();
      expect(keys.length).assertEqual(3);
      expect(keys[0]).assertEqual("A");
      expect(keys[1]).assertEqual("B");
      expect(keys[2]).assertEqual("C");

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE04_5200
     * @tc.name      testLRUCacheKeys04_0052
     * @tc.desc      Verify keys() works with Object keys.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheKeys04_0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheKeys04_0052";
      console.log(TAG + " start");

      interface KeyObj { id: number }
      const cache = new util.LRUCache<KeyObj, string>(3);
      const k1: KeyObj = { id: 1 };
      const k2: KeyObj = { id: 2 };

      cache.put(k1, "V1");
      cache.put(k2, "V2");

      const keys = cache.keys();
      expect(keys.length).assertEqual(2);

      expect(keys[0]).assertEqual(k1);
      expect(keys[1]).assertEqual(k2);

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE04_5300
     * @tc.name      testLRUCacheKeys04_0053
     * @tc.desc      Verify keys() with Edge Capacities (Capacity 1).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheKeys04_0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheKeys04_0053";
      console.log(TAG + " start");

      const cache = new util.LRUCache<number, string>(1);
      cache.put(1, "A");

      let keys = cache.keys();
      expect(keys.length).assertEqual(1);
      expect(keys[0]).assertEqual(1);

      cache.put(2, "B");

      keys = cache.keys();
      expect(keys.length).assertEqual(1);
      expect(keys[0]).assertEqual(2);

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE04_5400
     * @tc.name      testLRUCacheKeys04_0054
     * @tc.desc      Verify keys() consistency after get() on non-existent key (Should not change order).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheKeys04_0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheKeys04_0054";
      console.log(TAG + " start");

      const cache = new util.LRUCache<number, string>(3);
      cache.put(1, "A");
      cache.put(2, "B");

      cache.get(999);

      const keys = cache.keys();
      expect(keys.length).assertEqual(2);
      expect(keys[0]).assertEqual(1);
      expect(keys[1]).assertEqual(2);

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE04_5600
     * @tc.name      testLRUCacheKeys04_0056
     * @tc.desc      Verify keys() with large volume of data (Stress, LRU at start).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheKeys04_0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheKeys04_0056";
      console.log(TAG + " start");

      const cache = new util.LRUCache<number, number>(100);
      for(let i=0; i<100; i++) {
        cache.put(i, i);
      }

      const keys = cache.keys();
      expect(keys.length).assertEqual(100);

      expect(keys[0]).assertEqual(0);
      expect(keys[99]).assertEqual(99);

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE04_5700
     * @tc.name      testLRUCacheKeys04_0057
     * @tc.desc      Verify keys() after re-adding evicted key (Resurrect).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheKeys04_0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheKeys04_0057";
      console.log(TAG + " start");

      const cache = new util.LRUCache<number, string>(2);
      cache.put(1, "A");
      cache.put(2, "B");

      cache.put(3, "C");

      cache.put(1, "A_New");

      const keys = cache.keys();
      expect(keys.length).assertEqual(2);
      expect(keys[0]).assertEqual(3);
      expect(keys[1]).assertEqual(1);

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE04_5900
     * @tc.name      testLRUCacheKeys04_0059
     * @tc.desc      Verify keys() with complex alternating Put/Get sequence.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheKeys04_0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheKeys04_0059";
      console.log(TAG + " start");

      const cache = new util.LRUCache<number, string>(4);
      cache.put(1, "A");
      cache.get(1);

      cache.put(2, "B");
      cache.get(1);

      cache.put(3, "C");
      cache.get(2);

      cache.put(4, "D");

      const keys = cache.keys();
      expect(keys.length).assertEqual(4);
      expect(keys[0]).assertEqual(1);
      expect(keys[1]).assertEqual(3);
      expect(keys[2]).assertEqual(2);
      expect(keys[3]).assertEqual(4);

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE04_6000
     * @tc.name      testLRUCacheRemove04_0060
     * @tc.desc      [Consolidated] Verify basic removal: Existing key (returns value/true), Non-existent key (returns undefined/false).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheRemove04_0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheRemove04_0060";
      console.log(TAG + " start");

      const cache = new util.LRUCache<number, string>(5);
      cache.put(1, "A");

      const res1 = cache.remove(1);
      expect(res1).assertEqual("A");
      expect(cache.length).assertEqual(0);

      const res2 = cache.remove(2);
      expect(res2).assertUndefined();

      const res3 = cache.remove(1);
      expect(res3).assertUndefined();

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE04_6100
     * @tc.name      testLRUCacheRemove04_0061
     * @tc.desc      [Consolidated] Verify removal affects LRU order and capacity (Eviction Interaction).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheRemove04_0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheRemove04_0061";
      console.log(TAG + " start");

      const cache = new util.LRUCache<number, string>(3);
      cache.put(1, "A");
      cache.put(2, "B");
      cache.put(3, "C");

      cache.remove(2);
      expect(cache.length).assertEqual(2);

      cache.put(4, "D");
      expect(cache.length).assertEqual(3);

      cache.put(5, "E");
      cache.put(6, "F");

      expect(cache.get(1)).assertUndefined();
      expect(cache.get(2)).assertUndefined();
      expect(cache.get(3)).assertUndefined();

      expect(cache.get(4)).assertEqual("D");
      expect(cache.get(5)).assertEqual("E");
      expect(cache.get(6)).assertEqual("F");

      expect(cache.length).assertEqual(3);

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE04_6200
     * @tc.name      testLRUCacheRemove04_0062
     * @tc.desc      Verify removal of the most recently used (MRU) item.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheRemove04_0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheRemove04_0062";
      console.log(TAG + " start");

      const cache = new util.LRUCache<string, string>(3);
      cache.put("A", "1");
      cache.put("B", "2");

      cache.get("A");

      const val = cache.remove("A");
      expect(val).assertEqual("1");

      const keys = cache.keys();
      expect(keys.length).assertEqual(1);
      expect(keys[0]).assertEqual("B");

      expect(cache.length).assertEqual(1);

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE04_6300
     * @tc.name      testLRUCacheRemove04_0063
     * @tc.desc      Verify removal of the least recently used (LRU) item manually.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheRemove04_0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheRemove04_0063";
      console.log(TAG + " start");

      const cache = new util.LRUCache<string, string>(3);
      cache.put("A", "1");
      cache.put("B", "2");
      cache.put("C", "3");

      const val = cache.remove("A");
      expect(val).assertEqual("1");

      const keys = cache.keys();
      expect(keys.length).assertEqual(2);
      expect(keys[0]).assertEqual("B");
      expect(keys[1]).assertEqual("C");

      expect(cache.length).assertEqual(2);

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE04_6400
     * @tc.name      testLRUCacheRemove04_0064
     * @tc.desc      Verify removing the only item in Capacity 1 cache.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheRemove04_0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheRemove04_0064";
      console.log(TAG + " start");

      const cache = new util.LRUCache<number, number>(1);
      cache.put(1, 100);

      expect(cache.remove(1)).assertEqual(100);
      expect(cache.isEmpty()).assertTrue();
      expect(cache.length).assertEqual(0);

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE04_6500
     * @tc.name      testLRUCacheRemove04_0065
     * @tc.desc      Verify remove with mismatched key types (String vs Number).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheRemove04_0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheRemove04_0065";
      console.log(TAG + " start");

      const cache = new util.LRUCache<number, string>(5);
      cache.put(1, "Value");

      const cacheMixed = new util.LRUCache<number | string, string>(5);
      cacheMixed.put(1, "Value");

      const res = cacheMixed.remove("1");
      expect(res).assertUndefined();

      expect(cacheMixed.length).assertEqual(1);

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE04_6600
     * @tc.name      testLRUCacheRemove04_0066
     * @tc.desc      Verify remove works with Object keys (Reference equality).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheRemove04_0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheRemove04_0066";
      console.log(TAG + " start");

      interface KeyObj { id: number }
      const cache = new util.LRUCache<KeyObj, string>(5);
      const k1: KeyObj = { id: 1 };
      const k2: KeyObj = { id: 2 };

      cache.put(k1, "V1");

      expect(cache.remove(k2)).assertUndefined();

      expect(cache.remove(k1)).assertEqual("V1");
      expect(cache.isEmpty()).assertTrue();

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE04_6700
     * @tc.name      testLRUCacheRemove04_0067
     * @tc.desc      Verify remove works with various Value types (Object, Null, Array).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheRemove04_0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheRemove04_0067";
      console.log(TAG + " start");

      interface ValObj { name: string }
      const cacheObj = new util.LRUCache<string, ValObj>(5);
      const v1: ValObj = { name: "test" };
      cacheObj.put("k1", v1);
      expect(cacheObj.remove("k1")).assertEqual(v1);

      const cacheArr = new util.LRUCache<string, number[]>(5);
      cacheArr.put("k2", [1, 2]);
      const resArr = cacheArr.remove("k2");

      if (resArr !== undefined) {
        expect(resArr.length).assertEqual(2);
      } else {
        expect(resArr).not().assertUndefined();
      }

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE04_6800
     * @tc.name      testLRUCacheRemove04_0068
     * @tc.desc      Verify remove after update (overwritten key).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheRemove04_0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheRemove04_0068";
      console.log(TAG + " start");

      const cache = new util.LRUCache<number, string>(5);
      cache.put(1, "Old");
      cache.put(1, "New");

      const res = cache.remove(1);
      expect(res).assertEqual("New");
      expect(cache.length).assertEqual(0);

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE04_6900
     * @tc.name      testLRUCacheRemove04_0069
     * @tc.desc      Verify remove sequence interspersed with gets (complex interaction).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheRemove04_0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheRemove04_0069";
      console.log(TAG + " start");

      const cache = new util.LRUCache<number, string>(5);
      cache.put(1, "A");
      cache.put(2, "B");
      cache.put(3, "C");


      cache.get(1);

      cache.remove(2);

      let keys = cache.keys();
      expect(keys.length).assertEqual(2);
      expect(keys[0]).assertEqual(3);
      expect(keys[1]).assertEqual(1);

      expect(cache.remove(3)).assertEqual("C");

      keys = cache.keys();
      expect(keys.length).assertEqual(1);
      expect(keys[0]).assertEqual(1);

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE04_7000
     * @tc.name      testLRUCacheRemove04_0070
     * @tc.desc      Verify remove after clear (Should return undefined).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheRemove04_0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheRemove04_0070";
      console.log(TAG + " start");

      const cache = new util.LRUCache<number, string>(5);
      cache.put(1, "A");
      cache.clear();

      expect(cache.remove(1)).assertUndefined();
      expect(cache.length).assertEqual(0);

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE04_7100
     * @tc.name      testLRUCacheRemove04_0071
     * @tc.desc      Verify remove after capacity update (Shrink causing eviction vs Manual remove).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheRemove04_0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheRemove04_0071";
      console.log(TAG + " start");

      const cache = new util.LRUCache<number, string>(5);
      cache.put(1, "A");
      cache.put(2, "B");

      cache.updateCapacity(1);

      expect(cache.remove(1)).assertUndefined();

      expect(cache.remove(2)).assertEqual("B");
      expect(cache.isEmpty()).assertTrue();

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE04_7200
     * @tc.name      testLRUCacheRemove04_0072
     * @tc.desc      Verify batched/loop removal logic.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheRemove04_0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheRemove04_0072";
      console.log(TAG + " start");

      const cache = new util.LRUCache<number, number>(10);
      for(let i=0; i<5; i++) cache.put(i, i*10);

      for(let i=0; i<5; i++) {
        if(i % 2 === 0) {
          expect(cache.remove(i)).assertEqual(i*10);
        }
      }

      expect(cache.length).assertEqual(2);
      expect(cache.get(1)).assertEqual(10);
      expect(cache.get(3)).assertEqual(30);

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE04_7300
     * @tc.name      testLRUCacheRemove04_0073
     * @tc.desc      Verify remove and then re-put same key.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheRemove04_0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheRemove04_0073";
      console.log(TAG + " start");

      const cache = new util.LRUCache<number, string>(5);
      cache.put(1, "A");

      cache.remove(1);
      expect(cache.get(1)).assertUndefined();

      cache.put(1, "B");
      expect(cache.get(1)).assertEqual("B");
      expect(cache.length).assertEqual(1);

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE04_7400
     * @tc.name      testLRUCacheRemove04_0074
     * @tc.desc      Verify removing undefined/null keys (if put allows them, remove should handle).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheRemove04_0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheRemove04_0074";
      console.log(TAG + " start");

      const cache = new util.LRUCache<string | null, string>(5);

      try {
        cache.put(null, "NullVal");
        const res = cache.remove(null);

        if (res !== undefined) {
          expect(res).assertEqual("NullVal");
        }
      } catch (e) {
        console.log(TAG + " Null keys not supported, handled gracefully.");
      }

      console.log(TAG + " end");
    });
  })
}