import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { util } from '@kit.ArkTS';

const sleep = (time: number): Promise<void> => {
  return new Promise<void>((resolve) => {
    setTimeout(resolve, time);
  });
};

export default function LRUCache05Test() {
  describe('LRUCache05Test', () => {
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
    
    class ConfigurableCache<K, V> extends util.LRUCache<K, V> {
      private logic: (key: K) => V;

      constructor(capacity: number, logic: (key: K) => V) {
        super(capacity);
        this.logic = logic;
      }
      createDefault(key: K): V {
        
        return this.logic(key);
      }
    }

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE05_0100
     * @tc.name      testLRUCacheContains05_0001
     * @tc.desc      Verify contains returns true for an existing key (Basic Hit).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheContains05_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheContains05_0001";
      console.log(TAG + " start");

      let pro = new util.LRUCache<number, number>();
      pro.put(2, 10);

      let result = pro.contains(2);
      console.info('result = ' + result);

      expect(result).assertTrue();

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE05_0200
     * @tc.name      testLRUCacheContains05_0002
     * @tc.desc      Verify contains returns false for a non-existent key (Basic Miss).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheContains05_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheContains05_0002";
      console.log(TAG + " start");

      let pro = new util.LRUCache<number, number>();
      pro.put(2, 10);
      
      let result = pro.contains(99);
      console.info('result = ' + result);

      expect(result).assertFalse();

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE05_0300
     * @tc.name      testLRUCacheContains05_0003
     * @tc.desc      Verify contains returns false when cache is empty.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheContains05_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheContains05_0003";
      console.log(TAG + " start");

      let pro = new util.LRUCache<number, string>();

      let result = pro.contains(1);
      console.info('result = ' + result);

      expect(result).assertFalse();
      expect(pro.length).assertEqual(0);

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE05_0400
     * @tc.name      testLRUCacheContains05_0004
     * @tc.desc      Verify contains returns false after a key has been removed.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheContains05_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheContains05_0004";
      console.log(TAG + " start");

      let pro = new util.LRUCache<number, string>();
      pro.put(1, "A");
      
      expect(pro.contains(1)).assertTrue();
      
      pro.remove(1);

      let result = pro.contains(1);
      console.info('result = ' + result);

      expect(result).assertFalse();

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE05_0500
     * @tc.name      testLRUCacheContains05_0005
     * @tc.desc      Verify contains returns false for all keys after clear().
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheContains05_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheContains05_0005";
      console.log(TAG + " start");

      let pro = new util.LRUCache<number, string>();
      pro.put(1, "A");
      pro.put(2, "B");

      pro.clear();

      expect(pro.contains(1)).assertFalse();
      expect(pro.contains(2)).assertFalse();

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE05_0600
     * @tc.name      testLRUCacheContains05_0006
     * @tc.desc      Verify contains returns true after updating a key's value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheContains05_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheContains05_0006";
      console.log(TAG + " start");

      let pro = new util.LRUCache<number, string>();
      pro.put(1, "Version1");
      pro.put(1, "Version2");

      let result = pro.contains(1);
      console.info('result = ' + result);

      expect(result).assertTrue();
      expect(pro.get(1)).assertEqual("Version2");

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE05_0700
     * @tc.name      testLRUCacheContains05_0007
     * @tc.desc      Verify contains returns false for evicted keys (Capacity Overflow).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheContains05_0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheContains05_0007";
      console.log(TAG + " start");

      let pro = new util.LRUCache<number, string>(2);
      pro.put(1, "A");
      pro.put(2, "B");

      pro.put(3, "C");

      expect(pro.contains(1)).assertFalse();
      expect(pro.contains(2)).assertTrue();
      expect(pro.contains(3)).assertTrue();

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE05_0800
     * @tc.name      testLRUCacheContains05_0008
     * @tc.desc      Verify contains behavior with Capacity 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheContains05_0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheContains05_0008";
      console.log(TAG + " start");

      let pro = new util.LRUCache<number, string>(1);
      pro.put(1, "A");
      expect(pro.contains(1)).assertTrue();

      pro.put(2, "B");

      expect(pro.contains(1)).assertFalse();
      expect(pro.contains(2)).assertTrue();

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE05_0900
     * @tc.name      testLRUCacheContains05_0009
     * @tc.desc      Verify contains works correctly with String keys.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheContains05_0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheContains05_0009";
      console.log(TAG + " start");

      let pro = new util.LRUCache<string, number>();
      pro.put("KeyA", 100);

      expect(pro.contains("KeyA")).assertTrue();
      expect(pro.contains("KeyB")).assertFalse();

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE05_1000
     * @tc.name      testLRUCacheContains05_0010
     * @tc.desc      Verify contains works with Object keys (Reference Equality).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheContains05_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheContains05_0010";
      console.log(TAG + " start");

      interface KeyObj { id: number }
      let pro = new util.LRUCache<KeyObj, string>();

      let k1: KeyObj = { id: 1 };
      let k2: KeyObj = { id: 1 };

      pro.put(k1, "Val1");

      expect(pro.contains(k1)).assertTrue();
      expect(pro.contains(k2)).assertFalse();

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE05_1100
     * @tc.name      testLRUCacheContains05_0011
     * @tc.desc      Verify contains with Object Values (checking key presence independent of value type).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheContains05_0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheContains05_0011";
      console.log(TAG + " start");

      class ValObj { name: string = "test" }
      let pro = new util.LRUCache<string, ValObj>();
      let val = new ValObj();

      pro.put("objKey", val);

      let result = pro.contains("objKey");
      console.info('result = ' + result);

      expect(result).assertTrue();

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE05_1200
     * @tc.name      testLRUCacheContains05_0012
     * @tc.desc      Verify contains works after accessing key via get().
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheContains05_0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheContains05_0012";
      console.log(TAG + " start");

      let pro = new util.LRUCache<number, string>(5);
      pro.put(1, "A");

      pro.get(1);

      expect(pro.contains(1)).assertTrue();

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE05_1300
     * @tc.name      testLRUCacheContains05_0013
     * @tc.desc      Verify contains works with mixed sequence of operations.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheContains05_0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheContains05_0013";
      console.log(TAG + " start");

      let pro = new util.LRUCache<number, string>(3);
      pro.put(1, "A");
      pro.put(2, "B");

      expect(pro.contains(1)).assertTrue();

      pro.remove(1);
      expect(pro.contains(1)).assertFalse();

      pro.put(1, "A_New");
      expect(pro.contains(1)).assertTrue();

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE05_1400
     * @tc.name      testLRUCacheContains05_0014
     * @tc.desc      Verify contains after updateCapacity triggers eviction.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheContains05_0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheContains05_0014";
      console.log(TAG + " start");

      let pro = new util.LRUCache<number, string>(5);
      pro.put(1, "A");
      pro.put(2, "B");
      pro.put(3, "C");

      pro.updateCapacity(1);

      expect(pro.contains(1)).assertFalse();
      expect(pro.contains(2)).assertFalse();
      expect(pro.contains(3)).assertTrue();

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE05_1500
     * @tc.name      testLRUCacheCreateDefault05_0015
     * @tc.desc      Verify base createDefault returns undefined (Default behavior).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheCreateDefault05_0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheCreateDefault05_0015";
      console.log(TAG + " start");

      let pro = new util.LRUCache<number, number>();

      let result = pro.createDefault(50);
      console.info('result = ' + result);

      expect(result).assertUndefined();

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE05_1600
     * @tc.name      testLRUCacheCreateDefault05_0016
     * @tc.desc      Verify overridden createDefault returns correct value when called directly.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheCreateDefault05_0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheCreateDefault05_0016";
      console.log(TAG + " start");

      const cache = new ConfigurableCache<number, number>(5, (key) => {
        return key * 2;
      });

      const res = cache.createDefault(10);
      expect(res).assertEqual(20);

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE05_1700
     * @tc.name      testLRUCacheCreateDefault05_0017
     * @tc.desc      Verify get() triggers createDefault and caches the value (Cache Miss -> Hit).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheCreateDefault05_0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheCreateDefault05_0017";
      console.log(TAG + " start");

      const cache = new ConfigurableCache<number, string>(5, (key) => {
        return "Value_" + key;
      });

      const val = cache.get(1);

      expect(val).assertEqual("Value_1");

      expect(cache.length).assertEqual(1);
      expect(cache.contains(1)).assertTrue();

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE05_1800
     * @tc.name      testLRUCacheCreateDefault05_0018
     * @tc.desc      Verify createDefault is NOT called if key already exists (Cache Hit).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheCreateDefault05_0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheCreateDefault05_0018";
      console.log(TAG + " start");

      let callCount = 0;
      const cache = new ConfigurableCache<number, string>(5, (key) => {
        callCount++;
        return "Created";
      });

      cache.put(1, "Existing");

      const val = cache.get(1);

      expect(val).assertEqual("Existing");
      expect(callCount).assertEqual(0);

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE05_1900
     * @tc.name      testLRUCacheCreateDefault05_0019
     * @tc.desc      Verify get() returns undefined if createDefault returns undefined (Creation Fail).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheCreateDefault05_0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheCreateDefault05_0019";
      console.log(TAG + " start");

      const cache = new ConfigurableCache<number, string | undefined>(5, (key: number): string | undefined => {
        return undefined;
      });

      const val = cache.get(99);

      expect(val).assertUndefined();
      expect(cache.length).assertEqual(0);

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE05_2000
     * @tc.name      testLRUCacheCreateDefault05_0020
     * @tc.desc      Verify subsequent get() calls use the cached value (createDefault called once).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheCreateDefault05_0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheCreateDefault05_0020";
      console.log(TAG + " start");

      let callCount = 0;
      const cache = new ConfigurableCache<number, number>(5, (key) => {
        callCount++;
        return key * 10;
      });

      expect(cache.get(1)).assertEqual(10);
      expect(callCount).assertEqual(1);

      expect(cache.get(1)).assertEqual(10);
      expect(callCount).assertEqual(1);

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE05_2100
     * @tc.name      testLRUCacheCreateDefault05_0021
     * @tc.desc      Verify creation via get() triggers Eviction when capacity is full.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheCreateDefault05_0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheCreateDefault05_0021";
      console.log(TAG + " start");

      const cache = new ConfigurableCache<number, string>(2, (key) => {
        return "Val" + key;
      });

      cache.put(1, "A");
      cache.put(2, "B");


      cache.get(3);

      expect(cache.length).assertEqual(2);
      expect(cache.contains(1)).assertFalse();
      expect(cache.contains(3)).assertTrue();

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE05_2200
     * @tc.name      testLRUCacheCreateDefault05_0022
     * @tc.desc      Verify createDefault with Object return values.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheCreateDefault05_0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheCreateDefault05_0022";
      console.log(TAG + " start");

      interface User { id: number; name: string }
      const cache = new ConfigurableCache<number, User>(5, (key: number): User => {
        return { id: key, name: "User" + key };
      });

      const user = cache.get(100);

      if (user) {
        expect(user.id).assertEqual(100);
        expect(user.name).assertEqual("User100");

        const userAgain = cache.get(100);
        expect(user).assertEqual(userAgain);
      } else {

        expect().assertFail();
      }

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE05_2300
     * @tc.name      testLRUCacheCreateDefault05_0023
     * @tc.desc      Verify createDefault works with String keys.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheCreateDefault05_0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheCreateDefault05_0023";
      console.log(TAG + " start");

      const cache = new ConfigurableCache<string, number>(5, (key) => {
        return key.length;
      });

      expect(cache.get("Hello")).assertEqual(5);
      expect(cache.get("Hi")).assertEqual(2);
      expect(cache.length).assertEqual(2);

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE05_2400
     * @tc.name      testLRUCacheCreateDefault05_0024
     * @tc.desc      Verify Exception in createDefault is propagated.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheCreateDefault05_0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheCreateDefault05_0024";
      console.log(TAG + " start");

      const cache = new ConfigurableCache<number, string>(5, (key) => {
        throw new Error("Creation Error");
      });

      try {
        cache.get(1);
        expect().assertFail();
      } catch (e) {
        console.info("Expected error caught: " + e.message);
      }

      expect(cache.length).assertEqual(0);

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE05_2500
     * @tc.name      testLRUCacheCreateDefault05_0025
     * @tc.desc      Verify created items are placed at MRU (Most Recently Used) position.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheCreateDefault05_0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheCreateDefault05_0025";
      console.log(TAG + " start");

      const cache = new ConfigurableCache<number, string>(3, (key) => {
        return "V" + key;
      });

      cache.put(1, "A");
      cache.put(2, "B");

      cache.get(3);

      const keys = cache.keys();
      expect(keys[2]).assertEqual(3);
      expect(keys[0]).assertEqual(1);

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE05_2600
     * @tc.name      testLRUCacheCreateDefault05_0026
     * @tc.desc      Verify createDefault with side effects (external counter).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheCreateDefault05_0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheCreateDefault05_0026";
      console.log(TAG + " start");

      let counter = 0;
      const cache = new ConfigurableCache<string, number>(5, (key) => {
        counter += 1;
        return counter;
      });

      expect(cache.get("A")).assertEqual(1);
      expect(cache.get("B")).assertEqual(2);
      expect(counter).assertEqual(2);

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE05_2700
     * @tc.name      testLRUCacheCreateDefault05_0027
     * @tc.desc      Verify Batch creation via loop.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheCreateDefault05_0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheCreateDefault05_0027";
      console.log(TAG + " start");

      const cache = new ConfigurableCache<number, number>(10, (key) => key);

      for(let i=0; i<10; i++) {
        cache.get(i);
      }

      expect(cache.length).assertEqual(10);
      expect(cache.get(0)).assertEqual(0);
      expect(cache.get(9)).assertEqual(9);

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE05_2800
     * @tc.name      testLRUCacheEntries05_0028
     * @tc.desc      Verify entries returns correct key-value pairs in insertion order.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheEntries05_0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheEntries05_0028";
      console.log(TAG + " start");

      let pro = new util.LRUCache<number, number>();
      pro.put(2, 10);
      pro.put(3, 15);

      let entries: Array<[number, number]> = [];
      let iter = pro.entries();
      for (let item of iter) {
        entries.push(item);
      }

      expect(entries.length).assertEqual(2);

      expect(entries[0][0]).assertEqual(2);
      expect(entries[0][1]).assertEqual(10);

      expect(entries[1][0]).assertEqual(3);
      expect(entries[1][1]).assertEqual(15);

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE05_2900
     * @tc.name      testLRUCacheEntries05_0029
     * @tc.desc      Verify entries returns empty array for empty cache.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheEntries05_0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheEntries05_0029";
      console.log(TAG + " start");

      let pro = new util.LRUCache<number, number>();

      let entries: Array<[number, number]> = [];
      let iter = pro.entries();
      for (let item of iter) {
        entries.push(item);
      }

      expect(entries.length).assertEqual(0);

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE05_3000
     * @tc.name      testLRUCacheEntries05_0030
     * @tc.desc      Verify entries with a single item.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheEntries05_0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheEntries05_0030";
      console.log(TAG + " start");

      let pro = new util.LRUCache<number, string>();
      pro.put(1, "A");

      let entries: Array<[number, string]> = [];
      let iter = pro.entries();
      for (let item of iter) {
        entries.push(item);
      }

      expect(entries.length).assertEqual(1);
      expect(entries[0][0]).assertEqual(1);
      expect(entries[0][1]).assertEqual("A");

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE05_3100
     * @tc.name      testLRUCacheEntries05_0031
     * @tc.desc      Verify entries reflect eviction order (Capacity Overflow).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheEntries05_0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheEntries05_0031";
      console.log(TAG + " start");

      let pro = new util.LRUCache<number, string>(2);
      pro.put(1, "A");
      pro.put(2, "B");

      pro.put(3, "C");

      let entries: Array<[number, string]> = [];
      let iter = pro.entries();
      for (let item of iter) {
        entries.push(item);
      }

      expect(entries.length).assertEqual(2);

      expect(entries[0][0]).assertEqual(2);
      expect(entries[0][1]).assertEqual("B");

      expect(entries[1][0]).assertEqual(3);
      expect(entries[1][1]).assertEqual("C");

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE05_3200
     * @tc.name      testLRUCacheEntries05_0032
     * @tc.desc      Verify entries order changes after access via get().
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheEntries05_0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheEntries05_0032";
      console.log(TAG + " start");

      let pro = new util.LRUCache<number, string>(3);
      pro.put(1, "A");
      pro.put(2, "B");
      pro.put(3, "C");

      pro.get(1);

      let entries: Array<[number, string]> = [];
      let iter = pro.entries();
      for (let item of iter) {
        entries.push(item);
      }

      expect(entries.length).assertEqual(3);

      expect(entries[0][0]).assertEqual(2);
      expect(entries[1][0]).assertEqual(3);
      expect(entries[2][0]).assertEqual(1);

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE05_3300
     * @tc.name      testLRUCacheEntries05_0033
     * @tc.desc      Verify entries order changes after updating an existing key.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheEntries05_0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheEntries05_0033";
      console.log(TAG + " start");

      let pro = new util.LRUCache<number, string>(3);
      pro.put(1, "A");
      pro.put(2, "B");

      pro.put(1, "A_New");

      let entries: Array<[number, string]> = [];
      let iter = pro.entries();
      for (let item of iter) {
        entries.push(item);
      }

      expect(entries.length).assertEqual(2);
      
      expect(entries[0][0]).assertEqual(2);
      expect(entries[0][1]).assertEqual("B");
      
      expect(entries[1][0]).assertEqual(1);
      expect(entries[1][1]).assertEqual("A_New");

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE05_3400
     * @tc.name      testLRUCacheEntries05_0034
     * @tc.desc      Verify entries after removing an item.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheEntries05_0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheEntries05_0034";
      console.log(TAG + " start");

      let pro = new util.LRUCache<number, string>(3);
      pro.put(1, "A");
      pro.put(2, "B");
      pro.put(3, "C");

      pro.remove(2);

      let entries: Array<[number, string]> = [];
      let iter = pro.entries();
      for (let item of iter) {
        entries.push(item);
      }

      expect(entries.length).assertEqual(2);

      expect(entries[0][0]).assertEqual(1);
      expect(entries[1][0]).assertEqual(3);

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE05_3500
     * @tc.name      testLRUCacheEntries05_0035
     * @tc.desc      Verify entries is empty after clear().
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheEntries05_0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheEntries05_0035";
      console.log(TAG + " start");

      let pro = new util.LRUCache<number, string>();
      pro.put(1, "A");
      pro.put(2, "B");

      pro.clear();

      let entries: Array<[number, string]> = [];
      let iter = pro.entries();
      for (let item of iter) {
        entries.push(item);
      }

      expect(entries.length).assertEqual(0);

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE05_3600
     * @tc.name      testLRUCacheEntries05_0036
     * @tc.desc      Verify entries with String keys.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheEntries05_0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheEntries05_0036";
      console.log(TAG + " start");

      let pro = new util.LRUCache<string, number>();
      pro.put("one", 1);
      pro.put("two", 2);

      let entries: Array<[string, number]> = [];
      let iter = pro.entries();
      for (let item of iter) {
        entries.push(item);
      }

      expect(entries.length).assertEqual(2);

      expect(entries[0][0]).assertEqual("one");
      expect(entries[0][1]).assertEqual(1);
      expect(entries[1][0]).assertEqual("two");

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE05_3700
     * @tc.name      testLRUCacheEntries05_0037
     * @tc.desc      Verify entries with Object values (Reference check).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheEntries05_0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheEntries05_0037";
      console.log(TAG + " start");

      class User { name: string = "" }
      let pro = new util.LRUCache<number, User>();

      let u1 = new User(); u1.name = "Alice";
      let u2 = new User(); u2.name = "Bob";

      pro.put(1, u1);
      pro.put(2, u2);

      let entries: Array<[number, User]> = [];
      let iter = pro.entries();
      for (let item of iter) {
        entries.push(item);
      }

      expect(entries.length).assertEqual(2);

      // Verify value references
      expect(entries[0][1]).assertEqual(u1);
      expect(entries[1][1]).assertEqual(u2);

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE05_3800
     * @tc.name      testLRUCacheEntries05_0038
     * @tc.desc      Verify entries with Array values.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheEntries05_0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheEntries05_0038";
      console.log(TAG + " start");

      let pro = new util.LRUCache<string, number[]>();
      pro.put("arr1", [1, 2]);
      pro.put("arr2", [3, 4]);

      let entries: Array<[string, number[]]> = [];
      let iter = pro.entries();
      for (let item of iter) {
        entries.push(item);
      }

      expect(entries.length).assertEqual(2);

      expect(entries[0][0]).assertEqual("arr1");
      expect(entries[0][1].length).assertEqual(2);
      expect(entries[0][1][0]).assertEqual(1);

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE05_3900
     * @tc.name      testLRUCacheEntries05_0039
     * @tc.desc      Verify entries with Capacity 1 (Constant overwrite).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheEntries05_0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheEntries05_0039";
      console.log(TAG + " start");

      let pro = new util.LRUCache<number, string>(1);
      pro.put(1, "A");

      let entries1: Array<[number, string]> = [];
      for (let item of pro.entries()) {
        entries1.push(item);
      }
      expect(entries1.length).assertEqual(1);
      expect(entries1[0][0]).assertEqual(1);

      pro.put(2, "B"); // Evicts 1

      let entries2: Array<[number, string]> = [];
      for (let item of pro.entries()) {
        entries2.push(item);
      }
      expect(entries2.length).assertEqual(1);
      expect(entries2[0][0]).assertEqual(2);
      expect(entries2[0][1]).assertEqual("B");

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE05_4000
     * @tc.name      testLRUCacheEntries05_0040
     * @tc.desc      Verify entries using loop/iteration (Typical Usage).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheEntries05_0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheEntries05_0040";
      console.log(TAG + " start");

      let pro = new util.LRUCache<number, number>(5);
      for(let i=0; i<3; i++) {
        pro.put(i, i*10);
      }

      let iter = pro.entries();
      let count = 0;

      for(let entry of iter) {
        let key = entry[0];
        let val = entry[1];
        expect(val).assertEqual(key * 10);
        count++;
      }
      expect(count).assertEqual(3);

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE05_4100
     * @tc.name      testLRUCacheEntries05_0041
     * @tc.desc      Verify multiple calls to entries() return independent snapshots (new Iterators).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheEntries05_0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheEntries05_0041";
      console.log(TAG + " start");

      let pro = new util.LRUCache<number, string>(5);
      pro.put(1, "A");

      let entries1: Array<[number, string]> = [];
      for (let item of pro.entries()) {
        entries1.push(item);
      }

      pro.put(2, "B");

      let entries2: Array<[number, string]> = [];
      for (let item of pro.entries()) {
        entries2.push(item);
      }

      expect(entries1.length).assertEqual(1);
      expect(entries2.length).assertEqual(2);

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE05_4200
     * @tc.name      testLRUCacheSymbol05_0042
     * @tc.desc      Verify default iterator (Symbol.iterator) yields [key, value] pairs in insertion order.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheSymbol05_0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheSymbol05_0042";
      console.log(TAG + " start");

      let pro = new util.LRUCache<number, number>();
      pro.put(2, 10);
      pro.put(3, 15);

      // Use for...of to invoke [Symbol.iterator]
      let result: Array<[number, number]> = [];
      for (let value of pro) {
        result.push(value);
      }

      // LRU order: 2(10) -> 3(15)
      expect(result.length).assertEqual(2);

      expect(result[0][0]).assertEqual(2);
      expect(result[0][1]).assertEqual(10);

      expect(result[1][0]).assertEqual(3);
      expect(result[1][1]).assertEqual(15);

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE05_4300
     * @tc.name      testLRUCacheSymbol05_0043
     * @tc.desc      Verify iterator works correctly on an empty cache.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheSymbol05_0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheSymbol05_0043";
      console.log(TAG + " start");

      let pro = new util.LRUCache<number, number>();

      let count = 0;
      for (let value of pro) {
        count++;
      }

      expect(count).assertEqual(0);

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE05_4400
     * @tc.name      testLRUCacheSymbol05_0044
     * @tc.desc      Verify iterator with a single item.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheSymbol05_0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheSymbol05_0044";
      console.log(TAG + " start");

      let pro = new util.LRUCache<number, string>();
      pro.put(1, "One");

      let result: Array<[number, string]> = [];
      for (let value of pro) {
        result.push(value);
      }

      expect(result.length).assertEqual(1);
      expect(result[0][0]).assertEqual(1);
      expect(result[0][1]).assertEqual("One");

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE05_4500
     * @tc.name      testLRUCacheSymbol05_0045
     * @tc.desc      Verify iterator reflects eviction order (Capacity Overflow).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheSymbol05_0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheSymbol05_0045";
      console.log(TAG + " start");

      let pro = new util.LRUCache<number, string>(2);
      pro.put(1, "A");
      pro.put(2, "B");
      // [1:A, 2:B]

      // Add 3 -> Evict 1. Remaining: [2:B, 3:C]
      pro.put(3, "C");

      let result: Array<[number, string]> = [];
      for (let value of pro) {
        result.push(value);
      }

      expect(result.length).assertEqual(2);
      // LRU is 2
      expect(result[0][0]).assertEqual(2);
      expect(result[0][1]).assertEqual("B");
      // MRU is 3
      expect(result[1][0]).assertEqual(3);
      expect(result[1][1]).assertEqual("C");

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE05_4600
     * @tc.name      testLRUCacheSymbol05_0046
     * @tc.desc      Verify iterator order updates after access via get() (LRU update).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheSymbol05_0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheSymbol05_0046";
      console.log(TAG + " start");

      let pro = new util.LRUCache<number, string>(3);
      pro.put(1, "A");
      pro.put(2, "B");
      pro.put(3, "C");
     
      pro.get(1);

      let result: Array<[number, string]> = [];
      for (let value of pro) {
        result.push(value);
      }

      expect(result.length).assertEqual(3);
      expect(result[0][0]).assertEqual(2);
      expect(result[1][0]).assertEqual(3);
      expect(result[2][0]).assertEqual(1);

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE05_4700
     * @tc.name      testLRUCacheSymbol05_0047
     * @tc.desc      Verify iterator order updates after updating an existing key.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheSymbol05_0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheSymbol05_0047";
      console.log(TAG + " start");

      let pro = new util.LRUCache<number, string>(3);
      pro.put(1, "A");
      pro.put(2, "B");
      
      pro.put(1, "A_New");

      let result: Array<[number, string]> = [];
      for (let value of pro) {
        result.push(value);
      }

      expect(result.length).assertEqual(2);
      expect(result[0][0]).assertEqual(2);
      expect(result[1][0]).assertEqual(1);
      expect(result[1][1]).assertEqual("A_New");

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE05_4800
     * @tc.name      testLRUCacheSymbol05_0048
     * @tc.desc      Verify iterator reflects removal of items.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheSymbol05_0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheSymbol05_0048";
      console.log(TAG + " start");

      let pro = new util.LRUCache<number, string>(3);
      pro.put(1, "A");
      pro.put(2, "B");
      pro.put(3, "C");

      pro.remove(2);

      let result: Array<[number, string]> = [];
      for (let value of pro) {
        result.push(value);
      }

      expect(result.length).assertEqual(2);
      expect(result[0][0]).assertEqual(1);
      expect(result[1][0]).assertEqual(3);

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE05_4900
     * @tc.name      testLRUCacheSymbol05_0049
     * @tc.desc      Verify iterator yields nothing after clear().
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheSymbol05_0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheSymbol05_0049";
      console.log(TAG + " start");

      let pro = new util.LRUCache<number, string>();
      pro.put(1, "A");
      pro.put(2, "B");

      pro.clear();

      let count = 0;
      for (let value of pro) {
        count++;
      }

      expect(count).assertEqual(0);

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE05_5000
     * @tc.name      testLRUCacheSymbol05_0050
     * @tc.desc      Verify iterator works with String keys.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheSymbol05_0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheSymbol05_0050";
      console.log(TAG + " start");

      let pro = new util.LRUCache<string, number>();
      pro.put("one", 1);
      pro.put("two", 2);

      let result: Array<[string, number]> = [];
      for (let value of pro) {
        result.push(value);
      }

      expect(result.length).assertEqual(2);
      expect(result[0][0]).assertEqual("one");
      expect(result[1][0]).assertEqual("two");

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE05_5100
     * @tc.name      testLRUCacheSymbol05_0051
     * @tc.desc      Verify iterator works with Object values (Reference check).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheSymbol05_0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheSymbol05_0051";
      console.log(TAG + " start");

      class User { name: string = "" }
      let pro = new util.LRUCache<number, User>();

      let u1 = new User(); u1.name = "Alice";
      let u2 = new User(); u2.name = "Bob";

      pro.put(1, u1);
      pro.put(2, u2);

      let result: Array<[number, User]> = [];
      for (let value of pro) {
        result.push(value);
      }

      expect(result.length).assertEqual(2);
      expect(result[0][1]).assertEqual(u1);
      expect(result[1][1]).assertEqual(u2);

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE05_5200
     * @tc.name      testLRUCacheSymbol05_0052
     * @tc.desc      Verify manual usage of [Symbol.iterator] via next().
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheSymbol05_0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheSymbol05_0052";
      console.log(TAG + " start");

      let pro = new util.LRUCache<number, string>(5);
      pro.put(1, "A");
      pro.put(2, "B");

      let iter = pro[Symbol.iterator]();

      let next1 = iter.next();
      expect(next1.done).assertFalse();
      expect(next1.value[0]).assertEqual(1);
      expect(next1.value[1]).assertEqual("A");

      let next2 = iter.next();
      expect(next2.done).assertFalse();
      expect(next2.value[0]).assertEqual(2);

      let next3 = iter.next();
      expect(next3.done).assertTrue();
      expect(next3.value).assertUndefined();

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE05_5300
     * @tc.name      testLRUCacheSymbol05_0053
     * @tc.desc      Verify independent iterators (multiple loops do not affect each other).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheSymbol05_0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheSymbol05_0053";
      console.log(TAG + " start");

      let pro = new util.LRUCache<number, number>();
      pro.put(1, 10);

      // Loop 1
      let count1 = 0;
      for (let v of pro) { count1++; }

      // Loop 2
      let count2 = 0;
      for (let v of pro) { count2++; }

      expect(count1).assertEqual(1);
      expect(count2).assertEqual(1);

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE05_5400
     * @tc.name      testLRUCacheSymbol05_0054
     * @tc.desc      Verify iterator behavior with Capacity 1 (overwrite).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheSymbol05_0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheSymbol05_0054";
      console.log(TAG + " start");

      let pro = new util.LRUCache<number, string>(1);
      pro.put(1, "A");

      let res1: Array<[number, string]> = [];
      for (let v of pro) res1.push(v);
      expect(res1[0][0]).assertEqual(1);

      pro.put(2, "B"); 

      let res2: Array<[number, string]> = [];
      for (let v of pro) res2.push(v);

      expect(res2.length).assertEqual(1);
      expect(res2[0][0]).assertEqual(2);
      expect(res2[0][1]).assertEqual("B");

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE05_5500
     * @tc.name      testLRUCacheSymbol05_0055
     * @tc.desc      Verify iterator with large volume (Stress).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheSymbol05_0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheSymbol05_0055";
      console.log(TAG + " start");

      let pro = new util.LRUCache<number, number>(100);
      for(let i=0; i<100; i++) {
        pro.put(i, i);
      }

      let result: Array<[number, number]> = [];
      for (let value of pro) {
        result.push(value);
      }

      expect(result.length).assertEqual(100);
      expect(result[0][0]).assertEqual(0); // Oldest
      expect(result[99][0]).assertEqual(99); // Newest

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE05_5600
     * @tc.name      testLRUCacheSymbol05_0056
     * @tc.desc      Verify iterator with Mixed Types (string keys and number values).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheSymbol05_0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheSymbol05_0056";
      console.log(TAG + " start");

      let pro = new util.LRUCache<string, number>();
      pro.put("A", 1);
      pro.put("B", 2);

      let result: Array<[string, number]> = [];
      for (let value of pro) {
        result.push(value);
      }

      expect(result.length).assertEqual(2);
      expect(result[0][0]).assertEqual("A");
      expect(result[1][0]).assertEqual("B");

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE05_5700
     * @tc.name      testLRUCacheAfterRemoval05_0057
     * @tc.desc      Verify Eviction behavior (Capacity Overflow) by checking cache state.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheAfterRemoval05_0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheAfterRemoval05_0057";
      console.info(TAG + " start");
      
      const lru = new util.LRUCache<number, number>(2);
      lru.put(1, 1);
      lru.put(2, 2);

      lru.put(3, 3);

      expect(lru.length).assertEqual(2);

      expect(lru.contains(1)).assertFalse();
      expect(lru.get(1)).assertUndefined();

      expect(lru.contains(2)).assertTrue();
      expect(lru.contains(3)).assertTrue();

      console.info(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE05_5800
     * @tc.name      testLRUCacheAfterRemoval05_0058
     * @tc.desc      Verify Manual Removal (remove/delete) updates state correctly.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheAfterRemoval05_0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheAfterRemoval05_0058";
      console.info(TAG + " start");

      const lru = new util.LRUCache<number, string>(5);
      lru.put(1, "A");

      const removedVal = lru.remove(1);

      expect(removedVal).assertEqual("A");
      expect(lru.length).assertEqual(0);
      expect(lru.contains(1)).assertFalse();

      console.info(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE05_5900
     * @tc.name      testLRUCacheAfterRemoval05_0059
     * @tc.desc      Verify Key Update (put existing key) updates value correctly.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheAfterRemoval05_0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheAfterRemoval05_0059";
      console.info(TAG + " start");

      const lru = new util.LRUCache<number, string>(5);
      lru.put(1, "Old");
      expect(lru.get(1)).assertEqual("Old");

      lru.put(1, "New");

      expect(lru.length).assertEqual(1);
      expect(lru.get(1)).assertEqual("New");

      console.info(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE05_6000
     * @tc.name      testLRUCacheAfterRemoval05_0060
     * @tc.desc      Verify Clear operation resets the cache state.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheAfterRemoval05_0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheAfterRemoval05_0060";
      console.info(TAG + " start");

      const lru = new util.LRUCache<number, string>(5);
      lru.put(1, "A");
      lru.put(2, "B");

      lru.clear();

      expect(lru.isEmpty()).assertTrue();
      expect(lru.length).assertEqual(0);
      expect(lru.get(1)).assertUndefined();
      expect(lru.get(2)).assertUndefined();

      console.info(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE05_6100
     * @tc.name      testLRUCacheAfterRemoval05_0061
     * @tc.desc      Verify String Keys are handled correctly.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheAfterRemoval05_0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheAfterRemoval05_0061";
      console.info(TAG + " start");

      const lru = new util.LRUCache<string, number>(2);
      lru.put("KeyA", 100);
      lru.put("KeyB", 200);
      lru.put("KeyC", 300);

      expect(lru.contains("KeyA")).assertFalse();
      expect(lru.get("KeyB")).assertEqual(200);
      expect(lru.get("KeyC")).assertEqual(300);

      console.info(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE05_6200
     * @tc.name      testLRUCacheAfterRemoval05_0062
     * @tc.desc      Verify Object Values are stored and retrieved by reference.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheAfterRemoval05_0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheAfterRemoval05_0062";
      console.info(TAG + " start");

      interface TestObj { id: number }
      const lru = new util.LRUCache<number, TestObj>(5);

      const obj1: TestObj = { id: 1 };
      lru.put(1, obj1);

      const retrieved = lru.get(1);
      
      expect(retrieved).assertEqual(obj1);

      if (retrieved) {
        expect(retrieved.id).assertEqual(1);
      }

      lru.remove(1);
      expect(lru.get(1)).assertUndefined();

      console.info(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE05_6300
     * @tc.name      testLRUCacheAfterRemoval05_0063
     * @tc.desc      Verify behavior with Array values (Update logic).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheAfterRemoval05_0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheAfterRemoval05_0063";
      console.info(TAG + " start");

      const lru = new util.LRUCache<string, number[]>(5);
      lru.put("Arr", [1, 2]);

      const newArr = [3, 4];
      lru.put("Arr", newArr);

      const result = lru.get("Arr");

      expect(result).assertEqual(newArr);
      if (result) {
        expect(result.length).assertEqual(2);
        expect(result[0]).assertEqual(3);
      } else {
        expect().assertFail();
      }

      console.info(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE05_6400
     * @tc.name      testLRUCacheAfterRemoval05_0064
     * @tc.desc      Verify behavior with Capacity 1 (Ping-Pong eviction).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheAfterRemoval05_0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheAfterRemoval05_0064";
      console.info(TAG + " start");

      const lru = new util.LRUCache<number, string>(1);

      lru.put(1, "A");
      expect(lru.contains(1)).assertTrue();

      lru.put(2, "B");
      expect(lru.contains(1)).assertFalse();
      expect(lru.contains(2)).assertTrue();

      lru.put(3, "C"); 
      expect(lru.contains(2)).assertFalse();
      expect(lru.contains(3)).assertTrue();
      expect(lru.get(3)).assertEqual("C");

      console.info(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE05_6500
     * @tc.name      testLRUCacheAfterRemoval05_0065
     * @tc.desc      Verify removing non-existent key behaves correctly (No Op).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheAfterRemoval05_0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheAfterRemoval05_0065";
      console.info(TAG + " start");

      const lru = new util.LRUCache<number, string>(5);
      lru.put(1, "A");

      const result = lru.remove(99);

      expect(result).assertUndefined();
      expect(lru.length).assertEqual(1);
      expect(lru.get(1)).assertEqual("A");

      console.info(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE05_6600
     * @tc.name      testLRUCacheAfterRemoval05_0066
     * @tc.desc      Verify clearing empty cache is safe.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheAfterRemoval05_0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheAfterRemoval05_0066";
      console.info(TAG + " start");

      const lru = new util.LRUCache<number, string>(5);
      expect(lru.length).assertEqual(0);

      lru.clear();

      expect(lru.isEmpty()).assertTrue();
      expect(lru.length).assertEqual(0);

      console.info(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE05_6700
     * @tc.name      testLRUCacheAfterRemoval05_0067
     * @tc.desc      Verify re-insertion logic (Manual Resurrection).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheAfterRemoval05_0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheAfterRemoval05_0067";
      console.info(TAG + " start");
      
      const lru = new util.LRUCache<number, string>(5);
      lru.put(1, "Resurrect");

      lru.remove(1);
      expect(lru.contains(1)).assertFalse();

      lru.put(99, "Resurrect");

      expect(lru.contains(1)).assertFalse();
      expect(lru.contains(99)).assertTrue();
      expect(lru.get(99)).assertEqual("Resurrect");

      console.info(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE05_6800
     * @tc.name      testLRUCacheAfterRemoval05_0068
     * @tc.desc      Verify mixed sequence: Update then Evict (State Check).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheAfterRemoval05_0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheAfterRemoval05_0068";
      console.info(TAG + " start");

      const lru = new util.LRUCache<number, string>(1);
      lru.put(1, "Version1");

      lru.put(1, "Version2");
      expect(lru.get(1)).assertEqual("Version2");

      lru.put(2, "B");

      expect(lru.contains(1)).assertFalse();
      expect(lru.get(2)).assertEqual("B");

      console.info(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE05_6900
     * @tc.name      testLRUCacheAfterRemoval05_0069
     * @tc.desc      Verify multiple items eviction logic.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheAfterRemoval05_0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheAfterRemoval05_0069";
      console.info(TAG + " start");

      const lru = new util.LRUCache<number, string>(2);
      lru.put(1, "A");
      lru.put(2, "B");

      lru.put(3, "C");
      lru.put(4, "D");

      expect(lru.contains(1)).assertFalse();
      expect(lru.contains(2)).assertFalse();

      expect(lru.contains(3)).assertTrue();
      expect(lru.contains(4)).assertTrue();

      console.info(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE05_7000
     * @tc.name      testLRUCacheAfterRemoval05_0070
     * @tc.desc      Verify basic object put/remove lifecycle.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheAfterRemoval05_0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheAfterRemoval05_0070";
      console.info(TAG + " start");

      class ValidObj {
        name: string = "";
      }

      const lru = new util.LRUCache<string, ValidObj>(5);
      const obj1 = new ValidObj();
      obj1.name = "First";

      const obj2 = new ValidObj();
      obj2.name = "Second";

      lru.put("Key", obj1);
      expect(lru.get("Key")).assertEqual(obj1);

      lru.put("Key", obj2);
      expect(lru.get("Key")).assertEqual(obj2);

      lru.remove("Key");
      expect(lru.get("Key")).assertUndefined();
      expect(lru.length).assertEqual(0);

      console.info(TAG + " end");
    });
  });
}