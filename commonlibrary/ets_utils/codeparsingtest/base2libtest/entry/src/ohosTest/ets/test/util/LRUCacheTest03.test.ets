import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { util } from '@kit.ArkTS';

const sleep = (time: number): Promise<void> => {
  return new Promise<void>((resolve) => {
    setTimeout(resolve, time);
  });
};

export default function LRUCache03Test() {
  describe('LRUCache03Test', () => {
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
     * @tc.number    SUB_UTIL_LRU_CACHE03_0100
     * @tc.name      testLRUCacheGetMissCount03_0001
     * @tc.desc      Verify fetching an evicted key results in a miss
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheGetMissCount03_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheGetMissCount03_0001";
      console.log(TAG + " start");

      const cache = new util.LRUCache<string, string>(2);
      cache.put("key1", "value1");
      cache.put("key2", "value2");

      // Access key1 to make key2 LRU? No, key1 was put first, then key2.
      // LRU order: key1 (oldest), key2 (newest).
      // If we add key3, key1 should be evicted.
      cache.put("key3", "value3");

      // key1 should be evicted (miss)
      cache.get("key1");
      expect(cache.getMissCount()).assertEqual(1);

      // key2 should exist (hit)
      cache.get("key2");
      expect(cache.getMissCount()).assertEqual(1);

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE03_0200
     * @tc.name      testLRUCacheGetMissCount03_0002
     * @tc.desc      Verify clear operation does not reset miss count (assuming stats persist)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheGetMissCount03_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheGetMissCount03_0002";
      console.log(TAG + " start");

      const cache = new util.LRUCache<string, string>(5);
      cache.get("key1"); // Miss -> 1
      const beforeClear = cache.getMissCount();

      cache.clear();
      expect(cache.getMissCount()).assertEqual(beforeClear);

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE03_0300
     * @tc.name      testLRUCacheGetMissCount03_0003
     * @tc.desc      Verify retrieving items after clear results in misses
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheGetMissCount03_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheGetMissCount03_0003";
      console.log(TAG + " start");

      const cache = new util.LRUCache<string, string>(5);
      cache.put("key1", "value1");

      // Hit
      cache.get("key1");
      expect(cache.getMissCount()).assertEqual(0);

      cache.clear();

      // Now key1 is gone -> Miss
      cache.get("key1");
      expect(cache.getMissCount()).assertEqual(1);

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE03_0400
     * @tc.name      testLRUCacheGetMissCount03_0004
     * @tc.desc      Verify all gets on empty cache result in misses
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheGetMissCount03_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheGetMissCount03_0004";
      console.log(TAG + " start");

      const cache = new util.LRUCache<string, string>(5);

      cache.get("nonexistent1");
      expect(cache.getMissCount()).assertEqual(1);

      cache.get("nonexistent2");
      expect(cache.getMissCount()).assertEqual(2);

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE03_0500
     * @tc.name      testLRUCacheGetMissCount03_0005
     * @tc.desc      Verify miss count works with different supported value types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheGetMissCount03_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheGetMissCount03_0005";
      console.log(TAG + " start");

      const cache = new util.LRUCache<string, string | number | boolean>(5);

      cache.put("string", "value");

      // Hit
      cache.get("string");
      expect(cache.getMissCount()).assertEqual(0);

      // Miss
      cache.get("number");
      expect(cache.getMissCount()).assertEqual(1);

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE03_0600
     * @tc.name      testLRUCacheGetMissCount03_0006
     * @tc.desc      Verify miss count works with different key types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheGetMissCount03_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheGetMissCount03_0006";
      console.log(TAG + " start");

      const cache = new util.LRUCache<number, string>(5);
      cache.put(1, "value1");

      // Miss
      cache.get(2);
      expect(cache.getMissCount()).assertEqual(1);

      // Hit
      cache.get(1);
      expect(cache.getMissCount()).assertEqual(1);

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE03_0700
     * @tc.name      testLRUCacheGetMissCount03_0007
     * @tc.desc      Verify update does not cause miss, and subsequent get is hit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheGetMissCount03_0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheGetMissCount03_0007";
      console.log(TAG + " start");

      const cache = new util.LRUCache<string, string>(2);
      cache.put("key1", "value1");

      // Update
      cache.put("key1", "newValue");

      // Should be Hit
      cache.get("key1");
      expect(cache.getMissCount()).assertEqual(0);

      // Miss
      cache.get("key2");
      expect(cache.getMissCount()).assertEqual(1);

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE03_0800
     * @tc.name      testLRUCacheGetMissCount03_0008
     * @tc.desc      Verify miss count interactions with capacity 1 cache eviction
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheGetMissCount03_0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheGetMissCount03_0008";
      console.log(TAG + " start");

      const cache = new util.LRUCache<string, string>(1);
      cache.put("key1", "value1");

      // Hit
      cache.get("key1");
      expect(cache.getMissCount()).assertEqual(0);

      // Evict key1
      cache.put("key2", "value2");

      // key1 Miss
      cache.get("key1");
      expect(cache.getMissCount()).assertEqual(1);

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE03_0900
     * @tc.name      testLRUCacheGetMissCount03_0009
     * @tc.desc      Verify miss counts are independent across cache instances
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheGetMissCount03_0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheGetMissCount03_0009";
      console.log(TAG + " start");

      const cache1 = new util.LRUCache<string, string>(3);
      const cache2 = new util.LRUCache<string, string>(3);

      cache1.get("miss1");
      expect(cache1.getMissCount()).assertEqual(1);
      expect(cache2.getMissCount()).assertEqual(0);

      cache2.get("miss2");
      cache2.get("miss3");
      expect(cache1.getMissCount()).assertEqual(1);
      expect(cache2.getMissCount()).assertEqual(2);

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE03_1000
     * @tc.name      testLRUCacheGetMissCount03_0010
     * @tc.desc      Verify miss count accuracy under stress operations
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheGetMissCount03_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheGetMissCount03_0010";
      console.log(TAG + " start");

      const cache = new util.LRUCache<string, string>(10);
      const operations = 100;

      for (let i = 0; i < operations; i++) {
        cache.get(`key${i}`);
      }

      expect(cache.getMissCount()).assertEqual(operations);

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE03_1100
     * @tc.name      testLRUCacheGetMissCount03_0011
     * @tc.desc      Verify miss count in complex cache workflow
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheGetMissCount03_0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheGetMissCount03_0011";
      console.log(TAG + " start");

      const cache = new util.LRUCache<string, string>(3);

      cache.put("key1", "value1");
      cache.put("key2", "value2");

      // Hit key1 -> 0
      cache.get("key1");
      expect(cache.getMissCount()).assertEqual(0);

      // Miss key3 -> 1
      cache.get("key3");
      expect(cache.getMissCount()).assertEqual(1);

      cache.put("key3", "value3");
      // Evict key2 (key1 accessed recently, key2 oldest) -> keys: 1, 3, 4
      cache.put("key4", "value4");

      // Miss key2 -> 2
      cache.get("key2");
      expect(cache.getMissCount()).assertEqual(2);

      cache.clear();

      // Miss key1 -> 3
      cache.get("key1");
      expect(cache.getMissCount()).assertEqual(3);

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE03_1200
     * @tc.name      testLRUCacheGetMissCount03_0012
     * @tc.desc      Verify initial miss count is 0 for new LRUCache
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheGetMissCount03_0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheGetMissCount03_0012";
      console.log(TAG + " start");

      const cache = new util.LRUCache<string, string>(5);
      // Initial miss count should be 0
      expect(cache.getMissCount()).assertEqual(0);

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE03_1300
     * @tc.name      testLRUCacheGetMissCount03_0013
     * @tc.desc      Verify get operation for non-existent key increments miss count
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheGetMissCount03_0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheGetMissCount03_0013";
      console.log(TAG + " start");

      const cache = new util.LRUCache<string, string>(5);

      // Cache is empty, get should miss
      cache.get("key1");
      expect(cache.getMissCount()).assertEqual(1);

      cache.get("key2");
      expect(cache.getMissCount()).assertEqual(2);

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE03_1400
     * @tc.name      testLRUCacheGetMissCount03_0014
     * @tc.desc      Verify get operation for existing key does not increment miss count
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheGetMissCount03_0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheGetMissCount03_0014";
      console.log(TAG + " start");

      const cache = new util.LRUCache<string, string>(5);
      cache.put("key1", "value1");

      // Hit: key1 exists
      cache.get("key1");
      expect(cache.getMissCount()).assertEqual(0);

      // Miss: key2 does not exist
      cache.get("key2");
      expect(cache.getMissCount()).assertEqual(1);

      // Hit: key1 still exists
      cache.get("key1");
      expect(cache.getMissCount()).assertEqual(1);

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE03_1500
     * @tc.name      testLRUCacheGetMissCount03_0015
     * @tc.desc      Verify put operations do not affect miss count
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheGetMissCount03_0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheGetMissCount03_0015";
      console.log(TAG + " start");

      const cache = new util.LRUCache<string, string>(5);

      // Miss
      cache.get("key1");
      const initialMissCount = cache.getMissCount(); // 1

      cache.put("key1", "value1");
      cache.put("key2", "value2");

      // Put should not change miss count
      expect(cache.getMissCount()).assertEqual(initialMissCount);

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE03_1600
     * @tc.name      testLRUCacheRemovalCount03_0016
     * @tc.desc      [Consolidated] Verify basic eviction logic
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheRemovalCount03_0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheRemovalCount03_0016";
      console.log(TAG + " start");

      const cache = new util.LRUCache<string, string>(2);

      expect(cache.getRemovalCount()).assertEqual(0);

      cache.put("A", "1");
      cache.put("B", "2");
      expect(cache.getRemovalCount()).assertEqual(0);

      cache.put("A", "new_1");
      expect(cache.getRemovalCount()).assertEqual(0);

      cache.put("C", "3");
      expect(cache.getRemovalCount()).assertEqual(1);

      cache.put("D", "4");
      expect(cache.getRemovalCount()).assertEqual(2);

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE03_1700
     * @tc.name      testLRUCacheRemovalCount03_0017
     * @tc.desc      [Consolidated] Verify get() operations affect eviction order
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheRemovalCount03_0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheRemovalCount03_0017";
      console.log(TAG + " start");

      const cache = new util.LRUCache<string, string>(3);
      cache.put("A", "1");
      cache.put("B", "2");
      cache.put("C", "3");

      cache.get("A");

      cache.put("D", "4");
      expect(cache.getRemovalCount()).assertEqual(1);

      expect(cache.get("A")).assertEqual("1");
      expect(cache.get("B")).assertUndefined();

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE03_1800
     * @tc.name      testLRUCacheRemovalCount03_0018
     * @tc.desc      [Consolidated] Verify removal count behavior when capacity changes
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheRemovalCount03_0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheRemovalCount03_0018";
      console.log(TAG + " start");

      const cache = new util.LRUCache<string, string>(5);

      ["A", "B", "C", "D", "E"].forEach(k => cache.put(k, k));
      expect(cache.getRemovalCount()).assertEqual(0);
      cache.updateCapacity(2);
      expect(cache.getRemovalCount()).assertEqual(3);

      expect(cache.get("A")).assertUndefined();
      expect(cache.get("D")).assertEqual("D");
      expect(cache.get("E")).assertEqual("E");
      cache.updateCapacity(5);

      cache.put("F", "F");
      cache.put("G", "G");
      expect(cache.getRemovalCount()).assertEqual(3);

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE03_1900
     * @tc.name      testLRUCacheRemovalCount03_0019
     * @tc.desc      [Consolidated] Verify removal count persists through clear() operations
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheRemovalCount03_0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheRemovalCount03_0019";
      console.log(TAG + " start");

      const cache = new util.LRUCache<string, string>(2);

      cache.put("1", "1");
      cache.put("2", "2");
      cache.put("3", "3");
      cache.put("4", "4");
      expect(cache.getRemovalCount()).assertEqual(2);

      cache.clear();

      expect(cache.getRemovalCount()).assertEqual(2);

      cache.put("5", "5");
      cache.put("6", "6");
      cache.put("7", "7");

      expect(cache.getRemovalCount()).assertEqual(3);

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE03_2000
     * @tc.name      testLRUCacheRemovalCount03_0020
     * @tc.desc      [Consolidated] Verify removal count logic at edge capacities (0 and 1).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheRemovalCount03_0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheRemovalCount03_0020";
      console.log(TAG + " start");


      const cache1 = new util.LRUCache<string, string>(1);
      cache1.put("A", "A");
      expect(cache1.getRemovalCount()).assertEqual(0);
      cache1.put("B", "B"); // Evicts A
      expect(cache1.getRemovalCount()).assertEqual(1);
      cache1.put("C", "C"); // Evicts B
      expect(cache1.getRemovalCount()).assertEqual(2);

      try {
        const cache0 = new util.LRUCache<string, string>(0);
        cache0.put("X", "X");
        let count = cache0.getRemovalCount();
        console.log(TAG + " Capacity 0 count: " + count);
      } catch (e) {
        console.log(TAG + " Capacity 0 not supported: " + e);
      }

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE03_2100
     * @tc.name      testLRUCacheRemovalCount03_0021
     * @tc.desc      [Consolidated] Verify manual remove() does NOT increase removal count,
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheRemovalCount03_0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheRemovalCount03_0021";
      console.log(TAG + " start");

      const cache = new util.LRUCache<string, string>(2);
      cache.put("A", "1");
      cache.put("B", "2");

      cache.remove("A");

      expect(cache.getRemovalCount()).assertEqual(0);

      cache.put("C", "3");
      expect(cache.getRemovalCount()).assertEqual(0);

      cache.put("D", "4");
      expect(cache.getRemovalCount()).assertEqual(1);

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE03_2200
     * @tc.name      testLRUCacheRemovalCount03_0022
     * @tc.desc      [Consolidated] Verify re-adding a key that was previously evicted counts as a new entry
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheRemovalCount03_0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheRemovalCount03_0022";
      console.log(TAG + " start");

      const cache = new util.LRUCache<string, string>(2);
      cache.put("A", "1");
      cache.put("B", "2");

      cache.put("C", "3");
      expect(cache.getRemovalCount()).assertEqual(1);

      cache.put("A", "new_1");
      expect(cache.getRemovalCount()).assertEqual(2);

      cache.put("B", "new_2");
      expect(cache.getRemovalCount()).assertEqual(3);

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE03_2300
     * @tc.name      testLRUCacheRemovalCount03_0023
     * @tc.desc      [Consolidated] Stress test with large loop to verify removal count accuracy.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheRemovalCount03_0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheRemovalCount03_0023";
      console.log(TAG + " start");

      const capacity = 50;
      const loopCount = 500;
      const cache = new util.LRUCache<number, number>(capacity);

      for (let i = 0; i < loopCount; i++) {
        cache.put(i, i);
      }

      expect(cache.getRemovalCount()).assertEqual(loopCount - capacity);

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE03_2400
     * @tc.name      testLRUCacheRemovalCount03_0024
     * @tc.desc      [Consolidated] Verify removal count in a mixed workflow (Put, Get, Remove, Clear).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheRemovalCount03_0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheRemovalCount03_0024";
      console.log(TAG + " start");

      const cache = new util.LRUCache<string, string>(3);

      cache.put("A", "A");
      cache.put("B", "B");
      cache.put("C", "C");

      cache.get("A");

      cache.put("D", "D");
      expect(cache.getRemovalCount()).assertEqual(1);

      cache.remove("C");
      expect(cache.getRemovalCount()).assertEqual(1);

      cache.put("E", "E");
      cache.put("F", "F");
      expect(cache.getRemovalCount()).assertEqual(2);

      cache.clear();
      expect(cache.getRemovalCount()).assertEqual(2);

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE03_2500
     * @tc.name      testLRUCacheRemovalCount03_0025
     * @tc.desc      [Consolidated] Verify removal counts are isolated across multiple cache instances.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheRemovalCount03_0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheRemovalCount03_0025";
      console.log(TAG + " start");

      const cacheSmall = new util.LRUCache<string, string>(2);
      const cacheBig = new util.LRUCache<string, string>(10);

      cacheSmall.put("1", "1");
      cacheSmall.put("2", "2");
      cacheSmall.put("3", "3");

      cacheBig.put("1", "1");
      cacheBig.put("2", "2");
      cacheBig.put("3", "3");

      expect(cacheSmall.getRemovalCount()).assertEqual(1);
      expect(cacheBig.getRemovalCount()).assertEqual(0);

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE03_2600
     * @tc.name      testLRUCacheRemovalCount03_0026
     * @tc.desc      [Consolidated] Verify removal count with mixed key types (number/string).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheRemovalCount03_0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheRemovalCount03_0026";
      console.log(TAG + " start");

      const cache = new util.LRUCache<string | number, string>(2);

      cache.put("A", "ValA");
      cache.put(1, "Val1");

      cache.put("B", "ValB");
      expect(cache.getRemovalCount()).assertEqual(1);

      cache.put(2, "Val2");
      expect(cache.getRemovalCount()).assertEqual(2);

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE03_2700
     * @tc.name      testLRUCacheGetMatchCount03_0027
     * @tc.desc      Verify ping-pong eviction at capacity 1 (High churn rate leads to low match count)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheGetMatchCount03_0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheGetMatchCount03_0027";
      console.log(TAG + " start");

      const cache = new util.LRUCache<string, string>(1);

      cache.put("A", "1");
      cache.get("A"); // Hit +1

      cache.put("B", "2"); // Evicts A
      cache.get("A"); // Miss (A is gone)
      cache.get("B"); // Hit +1 (Total 2)

      cache.put("A", "3"); // Evicts B
      cache.get("B"); // Miss (B is gone)
      cache.get("A"); // Hit +1 (Total 3)

      expect(cache.getMatchCount()).assertEqual(3);

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE03_2800
     * @tc.name      testLRUCacheGetMatchCount03_0028
     * @tc.desc      Verify hot item residency: Constantly accessed item should stay and accumulate hits despite other churn
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheGetMatchCount03_0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheGetMatchCount03_0028";
      console.log(TAG + " start");

      const cache = new util.LRUCache<string, string>(3);
      cache.put("HotItem", "keep_me");

      cache.put("A", "1");
      cache.put("B", "2");

      cache.get("HotItem");

      cache.put("C", "3");

      cache.get("HotItem");

      expect(cache.getMatchCount()).assertEqual(2);
      expect(cache.get("HotItem")).assertEqual("keep_me");

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE03_2900
     * @tc.name      testLRUCacheGetMatchCount03_0029
     * @tc.desc      Verify updating a key's value preserves its hit count on subsequent access
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheGetMatchCount03_0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheGetMatchCount03_0029";
      console.log(TAG + " start");

      const cache = new util.LRUCache<string, string>(5);
      cache.put("key", "v1");

      cache.get("key");

      cache.put("key", "v2");

      const val = cache.get("key");

      expect(val).assertEqual("v2");
      expect(cache.getMatchCount()).assertEqual(2);

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE03_3000
     * @tc.name      testLRUCacheGetMatchCount03_0030
     * @tc.desc      Verify manual removal interrupts match sequence
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheGetMatchCount03_0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheGetMatchCount03_0030";
      console.log(TAG + " start");

      const cache = new util.LRUCache<string, string>(5);
      cache.put("A", "1");

      cache.get("A");

      cache.remove("A");

      cache.get("A");
      cache.put("A", "2");
      cache.get("A");

      expect(cache.getMatchCount()).assertEqual(2);

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE03_3100
     * @tc.name      testLRUCacheGetMatchCount03_0031
     * @tc.desc      Verify clear() preserves accumulation but resets data state (Rebirth scenario)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheGetMatchCount03_0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheGetMatchCount03_0031";
      console.log(TAG + " start");

      const cache = new util.LRUCache<string, string>(5);
      cache.put("A", "1");
      cache.get("A");

      cache.clear();

      cache.get("A");

      cache.put("A", "1");
      cache.get("A");

      expect(cache.getMatchCount()).assertEqual(2);

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE03_3200
     * @tc.name      testLRUCacheGetMatchCount03_0032
     * @tc.desc      Verify querying multiple non-existent keys repeatedly does not increase match count
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheGetMatchCount03_0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheGetMatchCount03_0032";
      console.log(TAG + " start");

      const cache = new util.LRUCache<string, string>(5);
      cache.put("A", "1");

      for (let i = 0; i < 10; i++) {
        cache.get("NonExistent" + i);
      }

      expect(cache.getMatchCount()).assertEqual(0);

      cache.get("A");
      expect(cache.getMatchCount()).assertEqual(1);

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE03_3300
     * @tc.name      testLRUCacheGetMatchCount03_0033
     * @tc.desc      Verify object reference consistency leads to hits (Key is Object)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheGetMatchCount03_0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheGetMatchCount03_0033";
      console.log(TAG + " start");

      interface KeyObj {
        id: number;
      }

      const cache = new util.LRUCache<KeyObj, string>(5);

      const k1: KeyObj = { id: 1 };
      const k2: KeyObj = { id: 2 };

      cache.put(k1, "val1");

      cache.get(k1);
      cache.get(k2);

      const k1Copy: KeyObj = { id: 1 };
      cache.get(k1Copy);

      expect(cache.getMatchCount()).assertEqual(1);

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE03_3400
     * @tc.name      testLRUCacheGetMatchCount03_0034
     * @tc.desc      Verify sparse access pattern on large cache
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheGetMatchCount03_0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheGetMatchCount03_0034";
      console.log(TAG + " start");

      const cache = new util.LRUCache<number, number>(20);

      for (let i = 0; i < 20; i += 2) {
        cache.put(i, i);
      }

      for (let i = 0; i < 10; i++) {
        cache.get(i);
      }

      expect(cache.getMatchCount()).assertEqual(5);

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE03_3500
     * @tc.name      testLRUCacheGetMatchCount03_0035
     * @tc.desc      Verify capacity increase preserves existing keys and allows hits
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheGetMatchCount03_0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheGetMatchCount03_0035";
      console.log(TAG + " start");

      const cache = new util.LRUCache<string, string>(2);
      cache.put("A", "1");
      cache.put("B", "2");

      cache.updateCapacity(5);

      cache.get("A");
      cache.get("B");

      cache.put("C", "3");
      cache.get("C");

      expect(cache.getMatchCount()).assertEqual(3);

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE03_3600
     * @tc.name      testLRUCacheGetMatchCount03_0036
     * @tc.desc      Verify capacity decrease forces eviction and prevents subsequent matches
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheGetMatchCount03_0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheGetMatchCount03_0036";
      console.log(TAG + " start");

      const cache = new util.LRUCache<string, string>(3);
      cache.put("A", "1");
      cache.put("B", "2");
      cache.put("C", "3");

      cache.get("A");

      cache.updateCapacity(2);

      cache.get("B");
      cache.get("C");
      cache.get("A");

      expect(cache.getMatchCount()).assertEqual(3);

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE03_3700
     * @tc.name      testLRUCacheGetMatchCount03_0037
     * @tc.desc      Verify cyclic overwrite scenario (Circular buffer logic)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheGetMatchCount03_0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheGetMatchCount03_0037";
      console.log(TAG + " start");

      const cache = new util.LRUCache<number, number>(3);

      cache.put(0, 0);
      cache.put(1, 1);
      cache.put(2, 2);

      cache.put(3, 3);

      cache.get(0);
      cache.get(1);

      cache.put(4, 4);

      cache.get(2);
      cache.get(3);
      cache.get(4);

      expect(cache.getMatchCount()).assertEqual(3);

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE03_3800
     * @tc.name      testLRUCacheGetMatchCount03_0038
     * @tc.desc      Verify changing value type for same key preserves hit capability
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheGetMatchCount03_0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheGetMatchCount03_0038";
      console.log(TAG + " start");

      const cache = new util.LRUCache<string, string | number>(5);

      cache.put("K", "StringVal");
      cache.get("K");

      cache.put("K", 999);
      cache.get("K");

      expect(cache.getMatchCount()).assertEqual(2);

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE03_3900
     * @tc.name      testLRUCacheGetMatchCount03_0039
     * @tc.desc      Verify high volume consecutive hits on a single key (Stress Hit)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheGetMatchCount03_0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheGetMatchCount03_0039";
      console.log(TAG + " start");

      const cache = new util.LRUCache<string, string>(5);
      cache.put("Target", "HitMe");

      const loops = 50;
      for(let i = 0; i < loops; i++) {
        cache.get("Target");
      }

      expect(cache.getMatchCount()).assertEqual(loops);

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE03_4000
     * @tc.name      testLRUCacheGetMatchCount03_0040
     * @tc.desc      Verify complex interleaved operations (Put/Get/Remove mixture)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheGetMatchCount03_0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheGetMatchCount03_0040";
      console.log(TAG + " start");

      const cache = new util.LRUCache<string, string>(3);

      cache.put("A", "1");
      cache.get("A"); // Hit 1

      cache.put("B", "2");
      cache.remove("A");
      cache.get("A");

      cache.get("B");

      cache.put("C", "3");
      cache.put("D", "4");

      cache.get("B");
      cache.get("C");
      cache.get("D");

      expect(cache.getMatchCount()).assertEqual(5);

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE03_4100
     * @tc.name      testLRUCacheGetPutCount03_0041
     * @tc.desc      Verify basic put count increment including updates to existing keys
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheGetPutCount03_0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheGetPutCount03_0041";
      console.log(TAG + " start");

      const cache = new util.LRUCache<string, string>(5);

      // New Put
      cache.put("A", "1");
      expect(cache.getPutCount()).assertEqual(1);

      // New Put
      cache.put("B", "2");
      expect(cache.getPutCount()).assertEqual(2);

      // Update existing key (Should still increment put count)
      cache.put("A", "3");
      expect(cache.getPutCount()).assertEqual(3);

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE03_4200
     * @tc.name      testLRUCacheGetPutCount03_0042
     * @tc.desc      Verify put count increments correctly when evictions occur
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheGetPutCount03_0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheGetPutCount03_0042";
      console.log(TAG + " start");

      const cache = new util.LRUCache<string, string>(2);

      cache.put("A", "1");
      cache.put("B", "2");
      expect(cache.getPutCount()).assertEqual(2);

      // Trigger eviction of A
      cache.put("C", "3");
      expect(cache.getPutCount()).assertEqual(3);

      // Trigger eviction of B
      cache.put("D", "4");
      expect(cache.getPutCount()).assertEqual(4);

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE03_4300
     * @tc.name      testLRUCacheGetPutCount03_0043
     * @tc.desc      Verify get() and remove() operations do not affect put count
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheGetPutCount03_0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheGetPutCount03_0043";
      console.log(TAG + " start");

      const cache = new util.LRUCache<string, string>(5);

      cache.put("A", "1"); // Put = 1

      cache.get("A");      // Should not change put count
      expect(cache.getPutCount()).assertEqual(1);

      cache.remove("A");   // Should not change put count
      expect(cache.getPutCount()).assertEqual(1);

      cache.put("B", "2"); // Put = 2
      expect(cache.getPutCount()).assertEqual(2);

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE03_4400
     * @tc.name      testLRUCacheGetPutCount03_0044
     * @tc.desc      Verify clear() operation does not reset put count (Persistence check)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheGetPutCount03_0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheGetPutCount03_0044";
      console.log(TAG + " start");

      const cache = new util.LRUCache<string, string>(5);
      cache.put("A", "1");
      cache.put("B", "2");

      const countBeforeClear = cache.getPutCount(); // 2
      expect(countBeforeClear).assertEqual(2);

      cache.clear();

      // Count should persist
      expect(cache.getPutCount()).assertEqual(2);

      // Operations after clear
      cache.put("C", "3");
      expect(cache.getPutCount()).assertEqual(3);

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE03_4500
     * @tc.name      testLRUCacheGetPutCount03_0045
     * @tc.desc      Verify high churn at Capacity 1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheGetPutCount03_0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheGetPutCount03_0045";
      console.log(TAG + " start");

      const cache = new util.LRUCache<string, string>(1);

      // Rapid sequence
      cache.put("A", "1");
      cache.put("B", "2");
      cache.put("C", "3");
      cache.put("A", "4"); // Re-add A

      expect(cache.getPutCount()).assertEqual(4);

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE03_4600
     * @tc.name      testLRUCacheGetPutCount03_0046
     * @tc.desc      Verify put count correctness in large loop (Stress Test)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheGetPutCount03_0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheGetPutCount03_0046";
      console.log(TAG + " start");

      const cache = new util.LRUCache<number, number>(10);
      const iterations = 500;

      for (let i = 0; i < iterations; i++) {
        cache.put(i, i * 10);
      }

      expect(cache.getPutCount()).assertEqual(iterations);

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE03_4700
     * @tc.name      testLRUCacheGetPutCount03_0047
     * @tc.desc      Verify updateCapacity does not affect put count
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheGetPutCount03_0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheGetPutCount03_0047";
      console.log(TAG + " start");

      const cache = new util.LRUCache<string, string>(5);
      cache.put("A", "1");
      cache.put("B", "2");

      // Shrink capacity (triggers eviction)
      cache.updateCapacity(1);

      // Count should remain 2
      expect(cache.getPutCount()).assertEqual(2);

      // Put new item
      cache.put("C", "3");
      expect(cache.getPutCount()).assertEqual(3);

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE03_4800
     * @tc.name      testLRUCacheGetPutCount03_0048
     * @tc.desc      Verify put count with Object keys
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheGetPutCount03_0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheGetPutCount03_0048";
      console.log(TAG + " start");

      interface KeyObj { id: number }
      const cache = new util.LRUCache<KeyObj, string>(5);

      const k1: KeyObj = { id: 1 };
      const k2: KeyObj = { id: 2 };

      cache.put(k1, "Val1");
      cache.put(k2, "Val2");

      expect(cache.getPutCount()).assertEqual(2);

      // Put same object reference (Update)
      cache.put(k1, "UpdatedVal1");
      expect(cache.getPutCount()).assertEqual(3);

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE03_4900
     * @tc.name      testLRUCacheGetPutCount03_0049
     * @tc.desc      Verify put count with diverse Value types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheGetPutCount03_0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheGetPutCount03_0049";
      console.log(TAG + " start");

      interface ComplexObj { data: number[] }
      const cache = new util.LRUCache<string, number | boolean | string | ComplexObj>(5);

      cache.put("num", 100);
      cache.put("bool", true);
      cache.put("str", "hello");

      const objVal: ComplexObj = { data: [1, 2] };
      cache.put("obj", objVal);

      expect(cache.getPutCount()).assertEqual(4);

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE03_5000
     * @tc.name      testLRUCacheGetPutCount03_0050
     * @tc.desc      Verify 'Fill and Replace All' scenario
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheGetPutCount03_0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheGetPutCount03_0050";
      console.log(TAG + " start");

      const cache = new util.LRUCache<string, string>(3);

      // Fill
      cache.put("A", "old");
      cache.put("B", "old");
      cache.put("C", "old");
      expect(cache.getPutCount()).assertEqual(3);

      // Replace all values
      cache.put("A", "new");
      cache.put("B", "new");
      cache.put("C", "new");

      expect(cache.getPutCount()).assertEqual(6);

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE03_5100
     * @tc.name      testLRUCacheGetPutCount03_0051
     * @tc.desc      Verify multiple instances have isolated put counts
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheGetPutCount03_0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheGetPutCount03_0051";
      console.log(TAG + " start");

      const cache1 = new util.LRUCache<string, string>(5);
      const cache2 = new util.LRUCache<string, string>(5);

      cache1.put("A", "1");
      cache1.put("B", "2");

      cache2.put("X", "9");

      expect(cache1.getPutCount()).assertEqual(2);
      expect(cache2.getPutCount()).assertEqual(1);

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE03_5200
     * @tc.name      testLRUCacheGetPutCount03_0052
     * @tc.desc      Verify putting same key and same value strictly increments count (Operation based)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheGetPutCount03_0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheGetPutCount03_0052";
      console.log(TAG + " start");

      const cache = new util.LRUCache<string, string>(5);

      cache.put("Key", "Val");
      expect(cache.getPutCount()).assertEqual(1);

      // Identical put
      cache.put("Key", "Val");
      expect(cache.getPutCount()).assertEqual(2);

      // Identical put again
      cache.put("Key", "Val");
      expect(cache.getPutCount()).assertEqual(3);

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE03_5300
     * @tc.name      testLRUCacheGetPutCount03_0053
     * @tc.desc      Verify put count behavior with Capacity 0 (If supported, should still count ops)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheGetPutCount03_0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheGetPutCount03_0053";
      console.log(TAG + " start");

      // Assuming capacity 0 is valid and just evicts immediately
      try {
        const cache = new util.LRUCache<string, string>(0);

        cache.put("A", "1");
        cache.put("B", "2");

        expect(cache.getPutCount()).assertEqual(2);
      } catch (e) {
        console.log(TAG + " Capacity 0 not supported, skipping check.");
      }

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE03_5400
     * @tc.name      testLRUCacheGetPutCount03_0054
     * @tc.desc      Verify put count with mixed key types (number vs string)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheGetPutCount03_0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheGetPutCount03_0054";
      console.log(TAG + " start");

      const cache = new util.LRUCache<string | number, string>(5);

      cache.put(1, "Number");
      cache.put("1", "String"); // Distinct key

      expect(cache.getPutCount()).assertEqual(2);

      cache.put(1, "NumberUpdate");
      expect(cache.getPutCount()).assertEqual(3);

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE03_5500
     * @tc.name      testLRUCacheGetPutCount03_0055
     * @tc.desc      Verify complex mixed workflow
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheGetPutCount03_0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheGetPutCount03_0055";
      console.log(TAG + " start");

      const cache = new util.LRUCache<string, string>(3);

      cache.put("A", "1"); // 1
      cache.get("A");
      cache.put("B", "2"); // 2
      cache.remove("A");
      cache.put("C", "3"); // 3
      cache.put("D", "4"); // 4
      cache.updateCapacity(10);
      cache.put("E", "5"); // 5
      cache.clear();
      cache.put("F", "6"); // 6

      expect(cache.getPutCount()).assertEqual(6);

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE03_5600
     * @tc.name      testLRUCacheIsEmpty03_0056
     * @tc.desc      [Consolidated] Verify basic empty and non-empty states after construction and insertion.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheIsEmpty03_0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheIsEmpty03_0056";
      console.log(TAG + " start");

      // 1. New cache should be empty
      const cache = new util.LRUCache<number, string>(10);
      expect(cache.isEmpty()).assertTrue();

      // 2. After single put, should not be empty
      cache.put(1, 'a');
      expect(cache.isEmpty()).assertFalse();

      // 3. After multiple puts, should not be empty
      cache.put(2, 'b');
      expect(cache.isEmpty()).assertFalse();

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE03_5700
     * @tc.name      testLRUCacheIsEmpty03_0057
     * @tc.desc      [Consolidated] Verify transition to empty state via removal and clearing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheIsEmpty03_0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheIsEmpty03_0057";
      console.log(TAG + " start");

      const cache = new util.LRUCache<string, string>(5);
      cache.put("A", "1");

      // 1. Remove last item -> Empty
      cache.remove("A");
      expect(cache.isEmpty()).assertTrue();

      // 2. Refill and Clear -> Empty
      cache.put("B", "2");
      cache.put("C", "3");
      expect(cache.isEmpty()).assertFalse();

      cache.clear();
      expect(cache.isEmpty()).assertTrue();

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE03_5800
     * @tc.name      testLRUCacheIsEmpty03_0058
     * @tc.desc      [Consolidated] Verify isEmpty behavior with capacity updates (Shrink to 1, Expand).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheIsEmpty03_0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheIsEmpty03_0058";
      console.log(TAG + " start");

      const cache = new util.LRUCache<number, string>(3);
      cache.put(1, 'a');
      cache.put(2, 'b');

      // 1. Update Capacity to 1 (Smallest valid capacity)
      // Logic: Cache had 2 items. Shrinking to 1 will evict one (LRU).
      // It will NOT be empty, it will hold 1 item.
      cache.updateCapacity(1);

      expect(cache.isEmpty()).assertFalse();
      expect(cache.length).assertEqual(1);

      // 2. Clear it manually to verify isEmpty works after resizing
      cache.clear();
      expect(cache.isEmpty()).assertTrue();

      // 3. Update Capacity back to 3 and fill
      cache.updateCapacity(3);
      expect(cache.isEmpty()).assertTrue(); // Still empty initially

      cache.put(3, 'c');
      expect(cache.isEmpty()).assertFalse();

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE03_5900
     * @tc.name      testLRUCacheIsEmpty03_0059
     * @tc.desc      [Consolidated] Verify isEmpty remains false during eviction and capacity shrinking.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheIsEmpty03_0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheIsEmpty03_0059";
      console.log(TAG + " start");

      const cache = new util.LRUCache<number, string>(2);
      cache.put(1, 'a');
      cache.put(2, 'b');

      // 1. Eviction due to overflow
      cache.put(3, 'c'); // Evicts 1
      expect(cache.isEmpty()).assertFalse();
      expect(cache.length).assertEqual(2); // Full capacity

      // 2. Update Capacity to 1 (Shrink)
      cache.updateCapacity(1);
      expect(cache.isEmpty()).assertFalse();
      expect(cache.length).assertEqual(1);

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE03_6000
     * @tc.name      testLRUCacheIsEmpty03_0060
     * @tc.desc      [Consolidated] Verify read operations (get, keys, values, toString) do not affect empty state.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheIsEmpty03_0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheIsEmpty03_0060";
      console.log(TAG + " start");

      const cache = new util.LRUCache<number, string>(5);
      cache.put(1, 'a');

      // Perform various read operations
      cache.get(1);
      cache.get(999); // Miss
      cache.keys();
      cache.values();
      cache.entries();
      cache.toString();

      // State should remain non-empty
      expect(cache.isEmpty()).assertFalse();

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE03_6100
     * @tc.name      testLRUCacheIsEmpty03_0061
     * @tc.desc      Verify isEmpty with various key and value types (Object keys, primitive values).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheIsEmpty03_0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheIsEmpty03_0061";
      console.log(TAG + " start");

      interface KeyObj { id: number }
      const cache = new util.LRUCache<KeyObj | string, number | boolean>(5);

      // 1. String key
      cache.put("key", 100);
      expect(cache.isEmpty()).assertFalse();

      cache.clear();

      // 2. Object key
      const k1: KeyObj = { id: 1 };
      cache.put(k1, true);
      expect(cache.isEmpty()).assertFalse();

      cache.remove(k1);
      expect(cache.isEmpty()).assertTrue();

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE03_6200
     * @tc.name      testLRUCacheIsEmpty03_0062
     * @tc.desc      Verify ping-pong lifecycle: Empty -> Add -> Empty -> Add -> Empty.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheIsEmpty03_0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheIsEmpty03_0062";
      console.log(TAG + " start");

      const cache = new util.LRUCache<string, string>(5);
      expect(cache.isEmpty()).assertTrue(); // Start Empty

      cache.put("A", "1");
      expect(cache.isEmpty()).assertFalse(); // Not Empty

      cache.remove("A");
      expect(cache.isEmpty()).assertTrue(); // Empty

      cache.put("B", "2");
      expect(cache.isEmpty()).assertFalse(); // Not Empty

      cache.clear();
      expect(cache.isEmpty()).assertTrue(); // Empty

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE03_6300
     * @tc.name      testLRUCacheIsEmpty03_0063
     * @tc.desc      Verify correlation between length property and isEmpty method.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheIsEmpty03_0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheIsEmpty03_0063";
      console.log(TAG + " start");

      const cache = new util.LRUCache<number, number>(5);

      // Length 0 -> isEmpty true
      expect(cache.length).assertEqual(0);
      expect(cache.isEmpty()).assertTrue();

      cache.put(1, 1);

      // Length > 0 -> isEmpty false
      expect(cache.length).assertEqual(1);
      expect(cache.isEmpty()).assertFalse();

      cache.clear();

      // Length 0 -> isEmpty true
      expect(cache.length).assertEqual(0);
      expect(cache.isEmpty()).assertTrue();

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE03_6400
     * @tc.name      testLRUCacheIsEmpty03_0064
     * @tc.desc      Verify updating an existing key's value does not change isEmpty state.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheIsEmpty03_0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheIsEmpty03_0064";
      console.log(TAG + " start");

      const cache = new util.LRUCache<string, string>(5);
      cache.put("key", "value1");
      expect(cache.isEmpty()).assertFalse();

      // Update value
      cache.put("key", "value2");
      expect(cache.isEmpty()).assertFalse();
      expect(cache.length).assertEqual(1);

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE03_6500
     * @tc.name      testLRUCacheIsEmpty03_0065
     * @tc.desc      Verify operations on non-existent keys on an empty cache do not affect empty state.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheIsEmpty03_0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheIsEmpty03_0065";
      console.log(TAG + " start");

      const cache = new util.LRUCache<string, string>(5);

      // Get non-existent
      cache.get("missing");
      expect(cache.isEmpty()).assertTrue();

      // Remove non-existent
      cache.remove("missing");
      expect(cache.isEmpty()).assertTrue();

      console.log(TAG + " end");
    });

  });
}