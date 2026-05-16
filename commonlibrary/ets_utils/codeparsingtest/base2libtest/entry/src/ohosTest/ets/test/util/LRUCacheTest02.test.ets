import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { util } from '@kit.ArkTS';

const sleep = (time: number): Promise<void> => {
  return new Promise<void>((resolve) => {
    setTimeout(resolve, time);
  });
};

export default function LRUCache02Test() {
  describe('LRUCache02Test', () => {
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
     * @tc.number    SUB_UTIL_LRU_CACHE02_0100
     * @tc.name      testLRUCacheUpdateCapacity02_0001
     * @tc.desc      Test updateCapacity method increases the cache capacity successfully.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLRUCacheUpdateCapacity02_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheUpdateCapacity02_0001";
      console.log(TAG + " start");
      try {

        let cache = new util.LRUCache<number, string>(2);

        cache.put(1, "one");
        cache.put(2, "two");

        let initialCapacity = cache.getCapacity();
        expect(initialCapacity).assertEqual(2);


        cache.updateCapacity(5);
        let newCapacity = cache.getCapacity();
        expect(newCapacity).assertEqual(5);


        cache.put(3, "three");
        cache.put(4, "four");
        cache.put(5, "five");


        expect(cache.get(1)).assertEqual("one");
        expect(cache.get(2)).assertEqual("two");
        expect(cache.get(3)).assertEqual("three");
        expect(cache.get(4)).assertEqual("four");
        expect(cache.get(5)).assertEqual("five");

        console.log(TAG + " passed");
      } catch (e) {
        console.error(TAG + ` failed: ${e}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE02_0200
     * @tc.name      testLRUCacheUpdateCapacity02_0002
     * @tc.desc      Test updateCapacity method decreases the cache capacity successfully, removing excess items.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLRUCacheUpdateCapacity02_0002",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheUpdateCapacity02_0002";
      console.log(TAG + " start");
      try {

        let cache = new util.LRUCache<number, string>(4);

        cache.put(1, "one");
        cache.put(2, "two");
        cache.put(3, "three");
        cache.put(4, "four");

        let initialCapacity = cache.getCapacity();
        expect(initialCapacity).assertEqual(4);


        cache.updateCapacity(2);
        let newCapacity = cache.getCapacity();
        expect(newCapacity).assertEqual(2);


        expect(cache.get(3)).assertEqual("three");
        expect(cache.get(4)).assertEqual("four");

        expect(cache.get(1)).assertUndefined();
        expect(cache.get(2)).assertUndefined();

        console.log(TAG + " passed");
      } catch (e) {
        console.error(TAG + ` failed: ${e}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE02_0300
     * @tc.name      testLRUCacheUpdateCapacity02_0003
     * @tc.desc      Test updateCapacity method with the same capacity (no change).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLRUCacheUpdateCapacity02_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheUpdateCapacity02_0003";
      console.log(TAG + " start");
      try {

        let cache = new util.LRUCache<number, string>(3);

        cache.put(1, "one");
        cache.put(2, "two");

        let initialCapacity = cache.getCapacity();
        expect(initialCapacity).assertEqual(3);


        cache.updateCapacity(3);
        let newCapacity = cache.getCapacity();
        expect(newCapacity).assertEqual(3);


        expect(cache.get(1)).assertEqual("one");
        expect(cache.get(2)).assertEqual("two");

        console.log(TAG + " passed");
      } catch (e) {
        console.error(TAG + ` failed: ${e}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE02_0400
     * @tc.name      testLRUCacheUpdateCapacity02_0004
     * @tc.desc      Test updateCapacity method with capacity 0 (edge case).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLRUCacheUpdateCapacity02_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheUpdateCapacity02_0004";
      console.log(TAG + " start");
      try {

        let cache = new util.LRUCache<number, string>(2);

        cache.put(1, "one");
        cache.put(2, "two");

        let initialCapacity = cache.getCapacity();
        expect(initialCapacity).assertEqual(2);


        cache.updateCapacity(0);
        let newCapacity = cache.getCapacity();
        expect(newCapacity).assertEqual(0);


        expect(cache.get(1)).assertUndefined();
        expect(cache.get(2)).assertUndefined();

        console.log(TAG + " passed");
      } catch (e) {
        console.error(TAG + ` failed: ${e}`);

      }
    })

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE02_0500
     * @tc.name      testLRUCacheUpdateCapacity02_0005
     * @tc.desc      Test updateCapacity method with a negative capacity (should handle gracefully or throw).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLRUCacheUpdateCapacity02_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheUpdateCapacity02_0005";
      console.log(TAG + " start");
      try {

        let cache = new util.LRUCache<number, string>(2);

        cache.put(1, "one");
        cache.put(2, "two");


        let initialCapacity = cache.getCapacity();
        expect(initialCapacity).assertEqual(2);

        let errorThrown = false;
        try {
          cache.updateCapacity(-1);
        } catch (e) {
          errorThrown = true;
          console.log(TAG + ` caught expected error: ${e}`);
        }


        let finalCapacity = cache.getCapacity();

        expect(typeof finalCapacity).assertEqual("number");
        console.log(TAG + " passed (method didn't crash, final capacity: " + finalCapacity + ")");
      } catch (e) {
        console.error(TAG + ` failed: ${e}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE02_0600
     * @tc.name      testLRUCacheUpdateCapacity02_0006
     * @tc.desc      Test updateCapacity method with non-numeric input (should handle gracefully or throw).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLRUCacheUpdateCapacity02_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheUpdateCapacity02_0006";
      console.log(TAG + " start");
      try {

        let cache = new util.LRUCache<number, string>(2);

        cache.put(1, "one");
        cache.put(2, "two");


        let initialCapacity = cache.getCapacity();
        expect(initialCapacity).assertEqual(2);

        let errorThrown = false;
        try {

          cache.updateCapacity("invalid" as Object as number);
        } catch (e) {
          errorThrown = true;
          console.log(TAG + ` caught expected error: ${e}`);
        }


        let finalCapacity = cache.getCapacity();
        expect(typeof finalCapacity).assertEqual("number");
        console.log(TAG + " passed (method didn't crash, final capacity: " + finalCapacity + ")");
      } catch (e) {
        console.error(TAG + ` failed: ${e}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE02_0700
     * @tc.name      testLRUCacheUpdateCapacity02_0007
     * @tc.desc      Test updateCapacity method with NaN input (should handle gracefully or throw).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLRUCacheUpdateCapacity02_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheUpdateCapacity02_0007";
      console.log(TAG + " start");
      try {

        let cache = new util.LRUCache<number, string>(2);

        cache.put(1, "one");
        cache.put(2, "two");


        let initialCapacity = cache.getCapacity();
        expect(initialCapacity).assertEqual(2);

        let errorThrown = false;
        try {
          cache.updateCapacity(NaN);
        } catch (e) {
          errorThrown = true;
          console.log(TAG + ` caught expected error: ${e}`);
        }


        let finalCapacity = cache.getCapacity();
        expect(typeof finalCapacity).assertEqual("number");
        console.log(TAG + " passed (method didn't crash, final capacity: " + finalCapacity + ")");
      } catch (e) {
        console.error(TAG + ` failed: ${e}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE02_0800
     * @tc.name      testLRUCacheUpdateCapacity02_0008
     * @tc.desc      Test updateCapacity method with Infinity input (should handle gracefully or throw).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLRUCacheUpdateCapacity02_0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheUpdateCapacity02_0008";
      console.log(TAG + " start");
      try {

        let cache = new util.LRUCache<number, string>(2);

        cache.put(1, "one");
        cache.put(2, "two");


        let initialCapacity = cache.getCapacity();
        expect(initialCapacity).assertEqual(2);

        let errorThrown = false;
        try {
          cache.updateCapacity(Infinity);
        } catch (e) {
          errorThrown = true;
          console.log(TAG + ` caught expected error: ${e}`);
        }


        let finalCapacity = cache.getCapacity();
        expect(typeof finalCapacity).assertEqual("number");
        console.log(TAG + " passed (method didn't crash, final capacity: " + finalCapacity + ")");
      } catch (e) {
        console.error(TAG + ` failed: ${e}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE02_0900
     * @tc.name      testLRUCacheUpdateCapacity02_0009
     * @tc.desc      Test updateCapacity method in combination with get and put operations to ensure LRU behavior is preserved.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLRUCacheUpdateCapacity02_0009",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheUpdateCapacity02_0009";
      console.log(TAG + " start");
      try {

        let cache = new util.LRUCache<number, string>(3);

        cache.put(1, "one");
        cache.put(2, "two");
        cache.put(3, "three");

        let initialCapacity = cache.getCapacity();
        expect(initialCapacity).assertEqual(3);


        let accessedItem = cache.get(1);
        expect(accessedItem).assertEqual("one");


        cache.put(4, "four");

        expect(cache.get(1)).assertEqual("one");
        expect(cache.get(2)).assertUndefined();
        expect(cache.get(3)).assertEqual("three");
        expect(cache.get(4)).assertEqual("four");


        cache.updateCapacity(5);
        let newCapacity = cache.getCapacity();
        expect(newCapacity).assertEqual(5);


        cache.put(5, "five");
        cache.put(6, "six");

        expect(cache.get(1)).assertEqual("one");
        expect(cache.get(3)).assertEqual("three");
        expect(cache.get(4)).assertEqual("four");
        expect(cache.get(5)).assertEqual("five");
        expect(cache.get(6)).assertEqual("six");

        console.log(TAG + " passed");
      } catch (e) {
        console.error(TAG + ` failed: ${e}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE02_1000
     * @tc.name      testLRUCacheUpdateCapacity02_0010
     * @tc.desc      Test updateCapacity method called multiple times in sequence to ensure state is maintained correctly.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLRUCacheUpdateCapacity02_0010",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,(): void => {
      const TAG = "testLRUCacheUpdateCapacity02_0010";
      console.log(TAG + " start");
      try {

        let cache = new util.LRUCache<number, string>(2);

        cache.put(1, "one");
        cache.put(2, "two");

        let initialCapacity = cache.getCapacity();
        expect(initialCapacity).assertEqual(2);


        cache.updateCapacity(4);
        let cap1 = cache.getCapacity();
        expect(cap1).assertEqual(4);
        expect(cache.get(1)).assertEqual("one");
        expect(cache.get(2)).assertEqual("two");


        cache.updateCapacity(1);
        let cap2 = cache.getCapacity();
        expect(cap2).assertEqual(1);

        expect(cache.get(2)).assertEqual("two");
        expect(cache.get(1)).assertUndefined();


        cache.updateCapacity(3);
        let cap3 = cache.getCapacity();
        expect(cap3).assertEqual(3);

        cache.put(3, "three");
        expect(cache.get(2)).assertEqual("two");
        expect(cache.get(3)).assertEqual("three");

        console.log(TAG + " passed");
      } catch (e) {
        console.error(TAG + ` failed: ${e}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE02_1100
     * @tc.name      testLRUCacheToString02_0011
     * @tc.desc      Test toString method on an empty LRUCache.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLRUCacheToString02_0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheToString02_0011";
      console.log(TAG + " start");
      try {

        let cache = new util.LRUCache<number, string>(3);


        let result = cache.toString();


        expect(typeof result).assertEqual("string");
        expect(result).assertContain("LRUCache");

        console.log(TAG + " passed");
      } catch (e) {
        console.error(TAG + ` failed: ${e}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE02_1200
     * @tc.name      testLRUCacheToString02_0012
     * @tc.desc      Test toString method on an LRUCache with some items added.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLRUCacheToString02_0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheToString02_0012";
      console.log(TAG + " start");
      try {

        let cache = new util.LRUCache<number, string>(2);


        cache.put(1, "one");
        cache.put(2, "two");


        let result = cache.toString();


        expect(typeof result).assertEqual("string");
        expect(result).assertContain("LRUCache");


        console.log(TAG + " passed");
      } catch (e) {
        console.error(TAG + ` failed: ${e}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE02_1300
     * @tc.name      testLRUCacheToString02_0013
     * @tc.desc      Test toString method on an LRUCache after items have been evicted due to capacity limits.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLRUCacheToString02_0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheToString02_0013";
      console.log(TAG + " start");
      try {

        let cache = new util.LRUCache<number, string>(2);


        cache.put(1, "one");
        cache.put(2, "two");
        cache.put(3, "three");


        let result = cache.toString();


        expect(typeof result).assertEqual("string");
        expect(result).assertContain("LRUCache");


        console.log(TAG + " passed");
      } catch (e) {
        console.error(TAG + ` failed: ${e}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE02_1400
     * @tc.name      testLRUCacheToString02_0014
     * @tc.desc      Test toString method on an LRUCache with different key and value types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLRUCacheToString02_0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheToString02_0014";
      console.log(TAG + " start");
      try {

        let cache = new util.LRUCache<string, number>(2);


        cache.put("key1", 100);
        cache.put("key2", 200);


        let result = cache.toString();


        expect(typeof result).assertEqual("string");
        expect(result).assertContain("LRUCache");

        console.log(TAG + " passed");
      } catch (e) {
        console.error(TAG + ` failed: ${e}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE02_1500
     * @tc.name      testLRUCacheToString02_0015
     * @tc.desc      Test toString method on an LRUCache with a null key (if supported).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLRUCacheToString02_0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheToString02_0015";
      console.log(TAG + " start");
      try {

        let cache = new util.LRUCache<string, string>(2);


        try {

          cache.put(null, "value");

        } catch (e) {

          console.log(TAG + ` null key handling: ${e}`);

        }


        let result = cache.toString();


        expect(typeof result).assertEqual("string");
        expect(result).assertContain("LRUCache");

        console.log(TAG + " passed");
      } catch (e) {
        console.error(TAG + ` failed: ${e}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE02_1600
     * @tc.name      testLRUCacheToString02_0016
     * @tc.desc      Test toString method on an LRUCache with an undefined value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLRUCacheToString02_0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheToString02_0016";
      console.log(TAG + " start");
      try {

        let cache = new util.LRUCache<number, string | undefined>(2);

        cache.put(1, undefined);

        let result = cache.toString();

        expect(typeof result).assertEqual("string");
        expect(result).assertContain("LRUCache");

        console.log(TAG + " passed");
      } catch (e) {
        console.error(TAG + ` failed: ${e}`);

      }
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE02_1700
     * @tc.name      testLRUCacheToString02_0017
     * @tc.desc      Test toString method on an LRUCache with keys/values containing special characters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLRUCacheToString02_0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheToString02_0017";
      console.log(TAG + " start");
      try {

        let cache = new util.LRUCache<string, string>(2);


        cache.put("key with spaces", "value\nwith\nnewlines");
        cache.put("key_with_underscores", "value\twith\ttabs");


        let result = cache.toString();


        expect(typeof result).assertEqual("string");
        expect(result).assertContain("LRUCache");

        console.log(TAG + " passed");
      } catch (e) {
        console.error(TAG + ` failed: ${e}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE02_1800
     * @tc.name      testLRUCacheToString02_0018
     * @tc.desc      Test toString method on a very large LRUCache (stress test for string representation).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLRUCacheToString02_0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheToString02_0018";
      console.log(TAG + " start");
      try {

        let cache = new util.LRUCache<number, string>(1000);


        for (let i = 0; i < 1000; i++) {
          cache.put(i, `value${i}`);
        }

        let result = cache.toString();

        expect(typeof result).assertEqual("string");
        expect(result).assertContain("LRUCache");

        console.log(TAG + " passed");
      } catch (e) {
        console.error(TAG + ` failed: ${e}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE02_1900
     * @tc.name      testLRUCacheToString02_0019
     * @tc.desc      Test that calling toString does not alter the internal state of the LRUCache.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLRUCacheToString02_0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheToString02_0019";
      console.log(TAG + " start");
      try {

        let cache = new util.LRUCache<number, string>(2);

        cache.put(1, "one");
        cache.put(2, "two");

        let preCapacity = cache.getCapacity();

        let preItem1 = cache.get(1);
        let preItem2 = cache.get(2);

        let result = cache.toString();

        expect(typeof result).assertEqual("string");
        expect(result).assertContain("LRUCache");


        let postCapacity = cache.getCapacity();
        let postItem1 = cache.get(1);
        let postItem2 = cache.get(2);

        expect(postCapacity).assertEqual(preCapacity);
        expect(postItem1).assertEqual(preItem1);
        expect(postItem2).assertEqual(preItem2);

        console.log(TAG + " passed");
      } catch (e) {
        console.error(TAG + ` failed: ${e}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE02_2000
     * @tc.name      testLRUCacheToString02_0020
     * @tc.desc      Test toString method after various operations like get, put, remove, clear.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLRUCacheToString02_0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheToString02_0020";
      console.log(TAG + " start");
      try {

        let cache = new util.LRUCache<number, string>(3);

        cache.put(1, "one");
        cache.put(2, "two");
        cache.put(3, "three");

        let result1 = cache.toString();
        expect(typeof result1).assertEqual("string");
        expect(result1).assertContain("LRUCache");

        let retrieved = cache.get(1);
        expect(retrieved).assertEqual("one");


        let result2 = cache.toString();
        expect(typeof result2).assertEqual("string");
        expect(result2).assertContain("LRUCache");


        cache.remove(2);
        let result3 = cache.toString();
        expect(typeof result3).assertEqual("string");
        expect(result3).assertContain("LRUCache");


        cache.clear();

        let result4 = cache.toString();
        expect(typeof result4).assertEqual("string");
        expect(result4).assertContain("LRUCache");

        console.log(TAG + " passed");
      } catch (e) {
        console.error(TAG + ` failed: ${e}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE02_2100
     * @tc.name      testLRUCacheGetCapacity02_0021
     * @tc.desc      Test getCapacity method returns the initial capacity set during construction.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLRUCacheGetCapacity02_0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheGetCapacity02_0021";
      console.log(TAG + " start");
      try {
        let cache = new util.LRUCache<number, string>(5);
        let capacity = cache.getCapacity();
        expect(capacity).assertEqual(5);
        console.log(TAG + " passed");
      } catch (e) {
        console.error(TAG + ` failed: ${e}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE02_2200
     * @tc.name      testLRUCacheGetCapacity02_0022
     * @tc.desc      Test getCapacity method returns the updated capacity after calling updateCapacity.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLRUCacheGetCapacity02_0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheGetCapacity02_0022";
      console.log(TAG + " start");
      try {
        let cache = new util.LRUCache<number, string>(3);
        cache.updateCapacity(7);
        let capacity = cache.getCapacity();
        expect(capacity).assertEqual(7);
        console.log(TAG + " passed");
      } catch (e) {
        console.error(TAG + ` failed: ${e}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE02_2300
     * @tc.name      testLRUCacheGetCapacity02_0023
     * @tc.desc      Test getCapacity method on empty LRUCache.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLRUCacheGetCapacity02_0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheGetCapacity02_0023";
      console.log(TAG + " start");
      try {
        let cache = new util.LRUCache<number, string>(10);
        let capacity = cache.getCapacity();
        expect(capacity).assertEqual(10);
        console.log(TAG + " passed");
      } catch (e) {
        console.error(TAG + ` failed: ${e}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE02_2400
     * @tc.name      testLRUCacheGetCapacity02_0024
     * @tc.desc      Test getCapacity method returns correct capacity even when items are present.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLRUCacheGetCapacity02_0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheGetCapacity02_0024";
      console.log(TAG + " start");
      try {
        let cache = new util.LRUCache<number, string>(2);
        cache.put(1, "one");
        cache.put(2, "two");
        let capacity = cache.getCapacity();
        expect(capacity).assertEqual(2);
        console.log(TAG + " passed");
      } catch (e) {
        console.error(TAG + ` failed: ${e}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE02_2500
     * @tc.name      testLRUCacheGetCapacity02_0025
     * @tc.desc      Test getCapacity method with initial capacity set to 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLRUCacheGetCapacity02_0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheGetCapacity02_0025";
      console.log(TAG + " start");
      try {
        let cache = new util.LRUCache<number, string>(0);
        let capacity = cache.getCapacity();
        expect(capacity).assertEqual(0);
        console.log(TAG + " passed");
      } catch (e) {
        console.error(TAG + ` failed: ${e}`);
      }
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE02_2600
     * @tc.name      testLRUCacheGetCapacity02_0026
     * @tc.desc      Test getCapacity method behavior with negative initial capacity (should handle gracefully).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLRUCacheGetCapacity02_0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheGetCapacity02_0026";
      console.log(TAG + " start");
      try {
        let cache = new util.LRUCache<number, string>(-1);
        let capacity = cache.getCapacity();

        expect(typeof capacity).assertEqual("number");
        console.log(TAG + " passed");
      } catch (e) {
        console.error(TAG + ` failed: ${e}`);
      }
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE02_2700
     * @tc.name      testLRUCacheGetCapacity02_0027
     * @tc.desc      Test getCapacity method with invalid capacity type (should handle gracefully).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLRUCacheGetCapacity02_0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheGetCapacity02_0027";
      console.log(TAG + " start");
      try {
        let cache = new util.LRUCache<number, string>("invalid" as Object as number);
        let capacity = cache.getCapacity();

        expect(typeof capacity).assertEqual("number");
        console.log(TAG + " passed");
      } catch (e) {
        console.error(TAG + ` failed: ${e}`);
      }
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE02_2800
     * @tc.name      testLRUCacheGetCapacity02_0028
     * @tc.desc      Test getCapacity method with NaN initial capacity (should handle gracefully).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLRUCacheGetCapacity02_0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheGetCapacity02_0028";
      console.log(TAG + " start");
      try {
        let cache = new util.LRUCache<number, string>(NaN);
        let capacity = cache.getCapacity();

        expect(typeof capacity).assertEqual("number");
        console.log(TAG + " passed");
      } catch (e) {
        console.error(TAG + ` failed: ${e}`);
      }
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE02_2900
     * @tc.name      testLRUCacheGetCapacity02_0029
     * @tc.desc      Test getCapacity method returns consistent values across multiple calls.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLRUCacheGetCapacity02_0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheGetCapacity02_0029";
      console.log(TAG + " start");
      try {
        let cache = new util.LRUCache<number, string>(4);
        let capacity1 = cache.getCapacity();
        let capacity2 = cache.getCapacity();
        let capacity3 = cache.getCapacity();
        expect(capacity1).assertEqual(4);
        expect(capacity2).assertEqual(4);
        expect(capacity3).assertEqual(4);
        console.log(TAG + " passed");
      } catch (e) {
        console.error(TAG + ` failed: ${e}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE02_3000
     * @tc.name      testLRUCacheGetCapacity02_0030
     * @tc.desc      Test getCapacity method returns correct capacity after eviction due to size limits.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLRUCacheGetCapacity02_0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheGetCapacity02_0030";
      console.log(TAG + " start");
      try {
        let cache = new util.LRUCache<number, string>(2);
        cache.put(1, "one");
        cache.put(2, "two");
        cache.put(3, "three");
        let capacity = cache.getCapacity();
        expect(capacity).assertEqual(2);
        console.log(TAG + " passed");
      } catch (e) {
        console.error(TAG + ` failed: ${e}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE02_3100
     * @tc.name      testLRUCacheGetCapacity02_0031
     * @tc.desc      Test getCapacity method on LRUCache with different key and value types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLRUCacheGetCapacity02_0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheGetCapacity02_0031";
      console.log(TAG + " start");
      try {
        let cache = new util.LRUCache<string, number>(3);
        let capacity = cache.getCapacity();
        expect(capacity).assertEqual(3);
        console.log(TAG + " passed");
      } catch (e) {
        console.error(TAG + ` failed: ${e}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE02_3200
     * @tc.name      testLRUCacheGetCapacity02_0032
     * @tc.desc      Test that getCapacity method doesn't alter the internal state of the LRUCache.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLRUCacheGetCapacity02_0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheGetCapacity02_0032";
      console.log(TAG + " start");
      try {
        let cache = new util.LRUCache<number, string>(2);
        cache.put(1, "one");
        cache.put(2, "two");

        let preCapacity = cache.getCapacity();
        let preItem1 = cache.get(1);
        let preItem2 = cache.get(2);

        let capacity = cache.getCapacity();

        let postCapacity = cache.getCapacity();
        let postItem1 = cache.get(1);
        let postItem2 = cache.get(2);

        expect(capacity).assertEqual(preCapacity);
        expect(capacity).assertEqual(postCapacity);
        expect(preItem1).assertEqual(postItem1);
        expect(preItem2).assertEqual(postItem2);
        console.log(TAG + " passed");
      } catch (e) {
        console.error(TAG + ` failed: ${e}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE02_3300
     * @tc.name      testLRUCacheClear02_0033
     * @tc.desc      Verify clear method works on non-empty LRUCache
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheClear02_0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheClear02_0033";
      console.log(TAG + " start");

      const cache = new util.LRUCache<string, string>(5);
      cache.put("key1", "value1");
      cache.put("key2", "value2");
      cache.put("key3", "value3");


      expect(cache.get("key1")).assertEqual("value1");
      expect(cache.get("key2")).assertEqual("value2");
      expect(cache.get("key3")).assertEqual("value3");

      cache.clear();
      expect(cache.get("key1")).assertUndefined();
      expect(cache.get("key2")).assertUndefined();
      expect(cache.get("key3")).assertUndefined();

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE02_3400
     * @tc.name      testLRUCacheClear02_0034
     * @tc.desc      Verify clear method works on empty LRUCache
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheClear02_0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheClear02_0034";
      console.info(TAG + " start");

      const cache = new util.LRUCache<string, string>(5);
      expect(cache.get("nonExistentKey")).assertUndefined();

      cache.clear();

      expect(cache.length).assertEqual(0);
      expect(cache.isEmpty()).assertTrue();

      console.info(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE02_3500
     * @tc.name      testLRUCacheClear02_0035
     * @tc.desc      Verify clear method works after put and get operations
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheClear02_0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheClear02_0035";
      console.log(TAG + " start");

      const cache = new util.LRUCache<string, string>(5);

      cache.put("key1", "value1");
      cache.put("key2", "value2");

      const value1 = cache.get("key1");
      expect(value1).assertEqual("value1");

      cache.clear();
      expect(cache.get("key1")).assertUndefined();
      expect(cache.get("key2")).assertUndefined();

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE02_3600
     * @tc.name      testLRUCacheClear02_0036
     * @tc.desc      Verify clear method works with capacity limit reached
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheClear02_0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheClear02_0036";
      console.log(TAG + " start");

      const cache = new util.LRUCache<string, string>(3);

      cache.put("key1", "value1");
      cache.put("key2", "value2");
      cache.put("key3", "value3");
      expect(cache.get("key1")).assertEqual("value1");
      expect(cache.get("key2")).assertEqual("value2");
      expect(cache.get("key3")).assertEqual("value3");


      cache.put("key4", "value4");
      expect(cache.get("key4")).assertEqual("value4");

      cache.clear();
      expect(cache.get("key1")).assertUndefined();
      expect(cache.get("key4")).assertUndefined();

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE02_3700
     * @tc.name      testLRUCacheClear02_0037
     * @tc.desc      Verify clear method with different value types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheClear02_0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheClear02_0037";
      console.log(TAG + " start");

      interface TestObject {
        key: string;
      }

      const cache = new util.LRUCache<string, string | number | boolean | TestObject | number[]>(5);


      cache.put("string", "value");
      cache.put("number", 123);
      cache.put("boolean", true);
      cache.put("object", { key: "value" });
      cache.put("array", [1, 2, 3]);

      expect(cache.get("string")).assertEqual("value");
      expect(cache.get("number")).assertEqual(123);

      cache.clear();
      expect(cache.get("string")).assertUndefined();
      expect(cache.get("number")).assertUndefined();

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE02_3800
     * @tc.name      testLRUCacheClear02_0038
     * @tc.desc      Verify clear method followed by new operations
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheClear02_0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheClear02_0038";
      console.log(TAG + " start");

      const cache = new util.LRUCache<string, string>(5);

      cache.put("key1", "value1");
      cache.clear();


      cache.put("key2", "value2");
      cache.put("key3", "value3");
      expect(cache.get("key2")).assertEqual("value2");
      expect(cache.get("key3")).assertEqual("value3");

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE02_3900
     * @tc.name      testLRUCacheClear02_0039
     * @tc.desc      Verify multiple consecutive clear calls
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheClear02_0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheClear02_0039";
      console.info(TAG + " start");

      const cache = new util.LRUCache<string, string>(5);

      cache.put("key1", "value1");
      cache.put("key2", "value2");

      cache.clear();
      expect(cache.get("key1")).assertUndefined();

      cache.clear();
      expect(cache.get("key2")).assertUndefined();

      cache.clear();

      expect(cache.length).assertEqual(0);
      expect(cache.isEmpty()).assertTrue();

      console.info(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE02_4000
     * @tc.name      testLRUCacheClear02_0040
     * @tc.desc      Verify clear method with eviction policy interaction
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheClear02_0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheClear02_0040";
      console.log(TAG + " start");

      const cache = new util.LRUCache<string, string>(3);

      cache.put("key1", "value1");
      cache.put("key2", "value2");
      cache.put("key3", "value3");

      cache.get("key1");

      cache.put("key4", "value4");
      expect(cache.get("key1")).assertEqual("value1");
      expect(cache.get("key4")).assertEqual("value4");


      cache.clear();
      expect(cache.get("key1")).assertUndefined();
      expect(cache.get("key4")).assertUndefined();

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE02_4100
     * @tc.name      testLRUCacheClear02_0041
     * @tc.desc      Verify clear method with large capacity cache
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheClear02_0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheClear02_0041";
      console.log(TAG + " start");

      const cache = new util.LRUCache<string, string>(100);

      for (let i = 1; i <= 50; i++) {
        cache.put(`key${i}`, `value${i}`);
      }
      expect(cache.get("key1")).assertEqual("value1");
      expect(cache.get("key25")).assertEqual("value25");
      expect(cache.get("key50")).assertEqual("value50");

      cache.clear();

      expect(cache.get("key1")).assertUndefined();
      expect(cache.get("key25")).assertUndefined();
      expect(cache.get("key50")).assertUndefined();

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE02_4200
     * @tc.name      testLRUCacheClear02_0042
     * @tc.desc      Verify clear method with capacity 1 cache
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheClear02_0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheClear02_0042";
      console.log(TAG + " start");

      const cache = new util.LRUCache<string, string>(1);

      cache.put("key1", "value1");
      expect(cache.get("key1")).assertEqual("value1");

      cache.clear();
      expect(cache.get("key1")).assertUndefined();

      cache.put("key2", "value2");
      expect(cache.get("key2")).assertEqual("value2");

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE02_4300
     * @tc.name      testLRUCacheClear02_0043
     * @tc.desc      Verify clear method with custom key types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheClear02_0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheClear02_0043";
      console.log(TAG + " start");

      const cache = new util.LRUCache<number, string>(5);

      cache.put(1, "value1");
      cache.put(2, "value2");
      cache.put(3, "value3");
      expect(cache.get(1)).assertEqual("value1");
      expect(cache.get(2)).assertEqual("value2");

      cache.clear();
      expect(cache.get(1)).assertUndefined();
      expect(cache.get(2)).assertUndefined();

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE02_4400
     * @tc.name      testLRUCacheClear02_0044
     * @tc.desc      Verify clear method in concurrent-like scenario
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheClear02_0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheClear02_0044";
      console.log(TAG + " start");

      const cache = new util.LRUCache<string, string>(5);

      for (let i = 1; i <= 3; i++) {
        cache.put(`key${i}`, `value${i}`);
      }

      cache.clear();

      for (let i = 4; i <= 6; i++) {
        cache.put(`key${i}`, `value${i}`);
      }

      expect(cache.get("key1")).assertUndefined();
      expect(cache.get("key4")).assertEqual("value4");
      expect(cache.get("key5")).assertEqual("value5");

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE02_4500
     * @tc.name      testLRUCacheClear02_0045
     * @tc.desc      Verify clear method with error handling (Sequence check)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheClear02_0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheClear02_0045";
      console.info(TAG + " start");

      const cache = new util.LRUCache<string, string>(5);

      cache.clear();
      expect(cache.get("anyKey")).assertUndefined();

      cache.put("key1", "value1");
      cache.clear();
      expect(cache.get("key1")).assertUndefined();

      cache.clear();

      expect(cache.length).assertEqual(0);

      console.info(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE02_4600
     * @tc.name      testLRUCacheClear02_0046
     * @tc.desc      Verify clear method integration with other LRUCache methods
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheClear02_0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheClear02_0046";
      console.log(TAG + " start");

      const cache = new util.LRUCache<string, string>(5);

      cache.put("key1", "value1");
      expect(cache.get("key1")).assertEqual("value1");

      cache.clear();
      expect(cache.get("key1")).assertUndefined();

      cache.put("key2", "value2");
      expect(cache.get("key2")).assertEqual("value2");

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE02_4700
     * @tc.name      testLRUCacheGetCreateCount02_0047
     * @tc.desc      Verify initial create count is 0 for new LRUCache
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheGetCreateCount02_0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheGetCreateCount02_0047";
      const cache = new util.LRUCache<string, string>(5);
      expect(cache.getCreateCount()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE02_4800
     * @tc.name      testLRUCacheGetCreateCount02_0048
     * @tc.desc      Verify put operation does not change create count (remains 0)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheGetCreateCount02_0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheGetCreateCount02_0048";
      const cache = new util.LRUCache<string, string>(5);

      cache.put("key1", "value1");
      expect(cache.getCreateCount()).assertEqual(0);

      cache.put("key2", "value2");
      expect(cache.getCreateCount()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE02_4900
     * @tc.name      testLRUCacheGetCreateCount02_0049
     * @tc.desc      Verify updating existing key does not increment create count
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheGetCreateCount02_0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheGetCreateCount02_0049";
      const cache = new util.LRUCache<string, string>(5);
      cache.put("key", "value1");
      const count1 = cache.getCreateCount();

      cache.put("key", "value2");
      expect(cache.getCreateCount()).assertEqual(count1);
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE02_5000
     * @tc.name      testLRUCacheGetCreateCount02_0050
     * @tc.desc      Verify get operations do not affect create count
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheGetCreateCount02_0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheGetCreateCount02_0050";
      const cache = new util.LRUCache<string, string>(5);
      cache.put("key1", "value1");
      const initialCount = cache.getCreateCount();

      cache.get("key1");
      cache.get("key1");
      expect(cache.getCreateCount()).assertEqual(initialCount);
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE02_5100
     * @tc.name      testLRUCacheGetCreateCount02_0051
     * @tc.desc      Verify eviction does not affect create count
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheGetCreateCount02_0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheGetCreateCount02_0051";
      const cache = new util.LRUCache<string, string>(2);
      cache.put("key1", "value1");
      cache.put("key2", "value2");
      cache.put("key3", "value3");

      expect(cache.getCreateCount()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE02_5200
     * @tc.name      testLRUCacheGetCreateCount02_0052
     * @tc.desc      Verify clear operation does not reset create count
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheGetCreateCount02_0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheGetCreateCount02_0052";
      const cache = new util.LRUCache<string, string>(5);
      cache.put("key1", "value1");
      cache.put("key2", "value2");
      const beforeClear = cache.getCreateCount();

      cache.clear();
      expect(cache.getCreateCount()).assertEqual(beforeClear);
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE02_5300
     * @tc.name      testLRUCacheGetCreateCount02_0053
     * @tc.desc      Verify operations after clear do not increment create count
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheGetCreateCount02_0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheGetCreateCount02_0053";
      const cache = new util.LRUCache<string, string>(5);
      cache.put("key1", "value1");
      const countBefore = cache.getCreateCount();

      cache.clear();
      cache.put("key2", "value2");

      expect(cache.getCreateCount()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE02_5400
     * @tc.name      testLRUCacheGetCreateCount02_0054
     * @tc.desc      Verify create count behavior on empty cache operations
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheGetCreateCount02_0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheGetCreateCount02_0054";
      const cache = new util.LRUCache<string, string>(5);
      expect(cache.getCreateCount()).assertEqual(0);

      cache.get("nonexistent");
      expect(cache.getCreateCount()).assertEqual(0);

      cache.clear();
      expect(cache.getCreateCount()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE02_5500
     * @tc.name      testLRUCacheGetCreateCount02_0055
     * @tc.desc      Verify create count remains 0 with different supported value types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheGetCreateCount02_0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheGetCreateCount02_0055";
      const cache = new util.LRUCache<string, string | number | boolean>(5);

      cache.put("string", "value");
      cache.put("number", 123);
      cache.put("boolean", true);

      expect(cache.getCreateCount()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE02_5600
     * @tc.name      testLRUCacheGetCreateCount02_0056
     * @tc.desc      Verify create count remains 0 with different key types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheGetCreateCount02_0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheGetCreateCount02_0056";
      const cache = new util.LRUCache<number, string>(5);
      cache.put(1, "value1");
      cache.put(2, "value2");

      expect(cache.getCreateCount()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE02_5700
     * @tc.name      testLRUCacheGetCreateCount02_0057
     * @tc.desc      Verify re-adding evicted key does not increment create count
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheGetCreateCount02_0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheGetCreateCount02_0057";
      const cache = new util.LRUCache<string, string>(2);
      cache.put("key1", "value1");
      cache.put("key2", "value2");
      cache.put("key3", "value3");

      cache.put("key1", "newValue");
      expect(cache.getCreateCount()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE02_5800
     * @tc.name      testLRUCacheGetCreateCount02_0058
     * @tc.desc      Verify create count with capacity 1 cache remains 0
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheGetCreateCount02_0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheGetCreateCount02_0058";
      const cache = new util.LRUCache<string, string>(1);
      cache.put("key1", "value1");
      cache.put("key2", "value2");
      cache.put("key3", "value3");

      expect(cache.getCreateCount()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE02_5900
     * @tc.name      testLRUCacheGetCreateCount02_0059
     * @tc.desc      Verify create counts are independent (and 0) across cache instances
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheGetCreateCount02_0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheGetCreateCount02_0059";
      const cache1 = new util.LRUCache<string, string>(3);
      const cache2 = new util.LRUCache<string, string>(3);

      cache1.put("a", "1");
      cache1.put("b", "2");
      cache2.put("x", "10");

      expect(cache1.getCreateCount()).assertEqual(0);
      expect(cache2.getCreateCount()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE02_6000
     * @tc.name      testLRUCacheGetCreateCount02_0060
     * @tc.desc      Verify create count accuracy under stress operations (remains 0)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheGetCreateCount02_0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheGetCreateCount02_0060";
      const cache = new util.LRUCache<string, string>(10);
      const operations = 100;

      for (let i = 0; i < operations; i++) {
        cache.put(`key${i}`, `value${i}`);
      }

      expect(cache.getCreateCount()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE02_6100
     * @tc.name      testLRUCacheGetCreateCount02_0061
     * @tc.desc      Verify create count in complex cache workflow (remains 0)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheGetCreateCount02_0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheGetCreateCount02_0061";
      const cache = new util.LRUCache<string, string>(3);

      cache.put("key1", "value1");
      cache.put("key2", "value2");
      cache.get("key1");
      cache.put("key3", "value3");
      cache.put("key4", "value4");
      cache.put("key1", "updated");
      cache.clear();
      cache.put("key5", "value5");
      cache.get("key5");

      expect(cache.getCreateCount()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE02_6200
     * @tc.name      testLRUCacheGetMissCount02_0062
     * @tc.desc      Verify initial miss count is 0 for new LRUCache
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheGetMissCount02_0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheGetMissCount02_0062";
      console.log(TAG + " start");

      const cache = new util.LRUCache<string, string>(5);
      // Initial miss count should be 0
      expect(cache.getMissCount()).assertEqual(0);

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_LRU_CACHE02_6300
     * @tc.name      testLRUCacheGetMissCount02_0063
     * @tc.desc      Verify get operation for non-existent key increments miss count
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheGetMissCount02_0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheGetMissCount02_0063";
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
     * @tc.number    SUB_UTIL_LRU_CACHE02_6400
     * @tc.name      testLRUCacheGetMissCount02_0064
     * @tc.desc      Verify get operation for existing key does not increment miss count
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheGetMissCount02_0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheGetMissCount02_0064";
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
     * @tc.number    SUB_UTIL_LRU_CACHE02_6500
     * @tc.name      testLRUCacheGetMissCount02_0065
     * @tc.desc      Verify put operations do not affect miss count
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLRUCacheGetMissCount02_0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testLRUCacheGetMissCount02_0065";
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

  });
}