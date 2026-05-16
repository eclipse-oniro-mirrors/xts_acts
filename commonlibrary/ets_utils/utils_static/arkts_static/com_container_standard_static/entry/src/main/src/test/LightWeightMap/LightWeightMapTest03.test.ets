/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium/index';
import { LightWeightMap } from '@kit.ArkTS';

class TestClass {
  private id: number;
  private name: string;

  constructor(id: number, name: string) {
    this.id = id;
    this.name = name;
  }

  getId(): number {
    return this.id;
  }

  getName(): string {
    return this.name;
  }
}

interface keyobject {
  id: number;
  name: string;
}

interface NestedUser {
  id: number;
  profile: UserProfile;
}

interface UserProfile {
  name: string;
  age: number;
}

interface UserContainer {
  user: NestedUser;
}

function sleep(count: int): Promise<void> {
  return new Promise<void>((resolve: (value: PromiseLike<void>) => void, reject: (value: Error) => void) => {
    setTimeout(() => {
      resolve(Promise.resolve())
    }, count)
  })
}

export default function testLightWeightMapTest03(): void {
  describe('testLightWeightMapTest03', () => {
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
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTTHREE_0100
     * @tc.name      testLightWeightMapTest03Chapter0100
     * @tc.desc      Verify get with String type key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest03Chapter0100';
      console.log(TAG + 'start');
      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set("apple", 10);
      lightWeightMap.set("banana", 20);
      lightWeightMap.set("cherry", 30);
      const result = lightWeightMap.get("banana");
      expect(result).assertEqual(20);
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTTHREE_0200
     * @tc.name      testLightWeightMapTest03Chapter0200
     * @tc.desc      Verify get with String type key containing special characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest03Chapter0200';
      console.log(TAG + 'start');
      const lightWeightMap = new LightWeightMap<string, string>();
      lightWeightMap.set("key with spaces", "value1");
      lightWeightMap.set("key-with-hyphen", "value2");
      lightWeightMap.set("key_with_underscore", "value3");
      lightWeightMap.set("key123", "value4");
      const result = lightWeightMap.get("key with spaces");
      expect(result).assertEqual("value1");
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTTHREE_0300
     * @tc.name      testLightWeightMapTest03Chapter0300
     * @tc.desc      Verify get with Number type key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest03Chapter0300';
      console.log(TAG + 'start');
      const lightWeightMap = new LightWeightMap<number, string>();
      lightWeightMap.set(0, "zero");
      lightWeightMap.set(1, "one");
      lightWeightMap.set(-1, "negative one");
      lightWeightMap.set(3.14, "pi");
      const result = lightWeightMap.get(1);
      expect(result).assertEqual("one");
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTTHREE_0400
     * @tc.name      testLightWeightMapTest03Chapter0400
     * @tc.desc      Verify get with Number type special values as key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest03Chapter0400';
      console.log(TAG + 'start');
      const lightWeightMap = new LightWeightMap<number, string>();
      lightWeightMap.set(Number.MAX_SAFE_INTEGER, "max safe integer");
      lightWeightMap.set(Number.MIN_SAFE_INTEGER, "min safe integer");
      lightWeightMap.set(Number.MAX_VALUE, "max value");
      lightWeightMap.set(Number.MIN_VALUE, "min value");
      const result = lightWeightMap.get(Number.MAX_SAFE_INTEGER);
      expect(result).assertEqual("max safe integer");
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTTHREE_0500
     * @tc.name      testLightWeightMapTest03Chapter0500
     * @tc.desc      Verify get with Boolean type key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest03Chapter0500';
      console.log(TAG + 'start');
      const lightWeightMap = new LightWeightMap<boolean, number>();
      lightWeightMap.set(true, 100);
      lightWeightMap.set(false, 0);
      const result = lightWeightMap.get(true);
      expect(result).assertEqual(100);
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTTHREE_0600
     * @tc.name      testLightWeightMapTest03Chapter0600
     * @tc.desc      Verify get with Array type key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest03Chapter0600';
      console.log(TAG + 'start');
      const key1: number[] = [1, 2, 3];
      const key2: number[] = [4, 5, 6];
      const lightWeightMap = new LightWeightMap<number[], string>();
      lightWeightMap.set(key1, "numbers array");
      lightWeightMap.set(key2, "strings array");
      const result = lightWeightMap.get(key1);
      expect(result).assertEqual("numbers array");
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTTHREE_0700
     * @tc.name      testLightWeightMapTest03Chapter0700
     * @tc.desc      Verify get with nested Array type key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest03Chapter0700';
      console.log(TAG + 'start');
      const key1 = [['1', '2'], ['3', '4']];
      const key2 = [['a', 'b'], ['c', 'd']];
      const lightWeightMap = new LightWeightMap<Array<Array<string>>, string>();
      lightWeightMap.set(key1, "nested numbers array");
      lightWeightMap.set(key2, "nested strings array");
      const result = lightWeightMap.get(key1);
      expect(result).assertEqual("nested numbers array");
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTTHREE_0800
     * @tc.name      testLightWeightMapTest03Chapter0800
     * @tc.desc      Verify get with Object type key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest03Chapter0800';
      console.log(TAG + 'start');
      const key1: keyobject= { id: 1, name: 'key1' };
      const key2: keyobject= { id: 2, name: 'key2' };

      const lightWeightMap = new LightWeightMap<object, number>();
      lightWeightMap.set(key1, 100);
      lightWeightMap.set(key2, 200);
      const result = lightWeightMap.get(key1);
      expect(result).assertEqual(100);
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTTHREE_0900
     * @tc.name      testLightWeightMapTest03Chapter0900
     * @tc.desc      Verify get with nested Object type key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter0900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest03Chapter0900';
      console.log(TAG + 'start');
      const key1: keyobject= { id: 1, name: 'key1' };
      const key2: keyobject= { id: 2, name: 'key2' };
      const lightWeightMap = new LightWeightMap<object, string>();
      lightWeightMap.set(key1, "complex object 1");
      lightWeightMap.set(key2, "complex object 2");
      const result = lightWeightMap.get(key1);
      expect(result).assertEqual("complex object 1");
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTTHREE_1000
     * @tc.name      testLightWeightMapTest03Chapter1000
     * @tc.desc      Verify get with Class type key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter1000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest03Chapter1000';
      console.log(TAG + 'start');
      const instance1 = new TestClass(1, "first");
      const instance2 = new TestClass(2, "second");
      const lightWeightMap = new LightWeightMap<TestClass, string>();
      lightWeightMap.set(instance1, "first instance");
      lightWeightMap.set(instance2, "second instance");
      const result = lightWeightMap.get(instance1);
      expect(result).assertEqual("first instance");
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTTHREE_1100
     * @tc.name      testLightWeightMapTest03Chapter1100
     * @tc.desc      Verify get with TypedArray type key (Int8Array)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter1100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest03Chapter1100';
      console.log(TAG + 'start');
      const key1 = new Int8Array([1, 2, 3, 4, 5]);
      const key2 = new Int8Array([-128, 0, 127]);
      const lightWeightMap = new LightWeightMap<Int8Array, string>();
      lightWeightMap.set(key1, "positive Int8Array");
      lightWeightMap.set(key2, "boundary Int8Array");
      const result = lightWeightMap.get(key1);
      expect(result).assertEqual("positive Int8Array");
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTTHREE_1200
     * @tc.name      testLightWeightMapTest03Chapter1200
     * @tc.desc      Verify get with TypedArray special values (Float64Array)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter1200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest03Chapter1200';
      console.log(TAG + 'start');
      const key1 = new Float64Array([NaN, Infinity, -Infinity]);
      const key2 = new Float64Array([0, -0, Number.MAX_VALUE, Number.MIN_VALUE]);
      const lightWeightMap = new LightWeightMap<Float64Array, string>();
      lightWeightMap.set(key1, "special float values");
      lightWeightMap.set(key2, "boundary float values");
      const result = lightWeightMap.get(key1);
      expect(result).assertEqual("special float values");
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTTHREE_1300
     * @tc.name      testLightWeightMapTest03Chapter1300
     * @tc.desc      Verify get returns undefined for non-existent key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter1300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest03Chapter1300';
      console.log(TAG + 'start');
      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set("existing", 100);
      const result = lightWeightMap.get("non-existent");
      expect(result).assertUndefined();
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTTHREE_1400
     * @tc.name      testLightWeightMapTest03Chapter1400
     * @tc.desc      Verify get with boolean values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter1400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest03Chapter1400';
      console.log(TAG + 'start');
      const lightWeightMap = new LightWeightMap<boolean, number>();
      lightWeightMap.set(true, 100);
      const result = lightWeightMap.get(true);
      expect(result).assertEqual(100);


      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTTHREE_1500
     * @tc.name      testLightWeightMapTest03Chapter1500
     * @tc.desc      Verify get with same key overwrites previous value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter1500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest03Chapter1500';
      console.log(TAG + 'start');
      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set("key", 100);
      lightWeightMap.set("key", 200); // Overwrite
      const result = lightWeightMap.get("key");
      expect(result).assertEqual(200);
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTTHREE_1600
     * @tc.name      testLightWeightMapTest03Chapter1600
     * @tc.desc      Verify get with large number of elements
     * @tc.size      LargeTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter1600", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest03Chapter1600';
      console.log(TAG + 'start');
      const lightWeightMap = new LightWeightMap<number, string>();

      for (let i: int = 0; i < 1000; i++) {
        lightWeightMap.set(i, `value${i}`);
      }

      const result1 = lightWeightMap.get(500);
      const result2 = lightWeightMap.get(999);

      expect(result1).assertEqual("value500");
      expect(result2).assertEqual("value999");
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTTHREE_1700
     * @tc.name      testLightWeightMapTest03Chapter1700
     * @tc.desc      Verify getIndexOfKey with String type key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter1700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest03Chapter1700';
      console.log(TAG + 'start');
      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set("apple", 10);
      lightWeightMap.set("banana", 20);
      lightWeightMap.set("cherry", 30);
      const result = lightWeightMap.getIndexOfKey("banana");
      expect(result).assertEqual(1);
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTTHREE_1800
     * @tc.name      testLightWeightMapTest03Chapter1800
     * @tc.desc      Verify getIndexOfKey with String type key containing special characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter1800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest03Chapter1800';
      console.log(TAG + 'start');
      const lightWeightMap = new LightWeightMap<string, string>();
      lightWeightMap.set("key with spaces", "value1");
      lightWeightMap.set("key-with-hyphen", "value2");
      lightWeightMap.set("key_with_underscore", "value3");
      const result = lightWeightMap.getIndexOfKey("key with spaces");
      expect(result).assertEqual(0);
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTTHREE_1900
     * @tc.name      testLightWeightMapTest03Chapter1900
     * @tc.desc      Verify getIndexOfKey with Number type key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter1900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest03Chapter1900';
      console.log(TAG + 'start');
      const lightWeightMap = new LightWeightMap<number, string>();
      lightWeightMap.set(10, "ten");
      lightWeightMap.set(20, "twenty");
      lightWeightMap.set(5, "five");
      const result = lightWeightMap.getIndexOfKey(10);
      expect(result).assertEqual(1);
      const idx1 = lightWeightMap.getIndexOfKey(5);
      expect(idx1).assertEqual(0);
      const idx2 = lightWeightMap.getIndexOfKey(20);
      expect(idx2).assertEqual(2);
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTTHREE_2000
     * @tc.name      testLightWeightMapTest03Chapter2000
     * @tc.desc      Verify getIndexOfKey with Number type special values as key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter2000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest03Chapter2000';
      console.log(TAG + 'start');
      const lightWeightMap = new LightWeightMap<number, string>();
      lightWeightMap.set(Number.MAX_SAFE_INTEGER, "max safe integer");
      const result = lightWeightMap.getIndexOfKey(Number.MAX_SAFE_INTEGER);
      expect(result).assertEqual(0);
      lightWeightMap.clear();
      lightWeightMap.set(Number.MIN_SAFE_INTEGER, "min safe integer");
      const result1 = lightWeightMap.getIndexOfKey(Number.MIN_SAFE_INTEGER);
      expect(result1).assertEqual(0);
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTTHREE_2100
     * @tc.name      testLightWeightMapTest03Chapter2100
     * @tc.desc      Verify getIndexOfKey with Boolean type key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter2100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest03Chapter2100';
      console.log(TAG + 'start');
      const lightWeightMap = new LightWeightMap<boolean, number>();
      lightWeightMap.set(true, 100);
      lightWeightMap.set(false, 0);
      const idxFalse = lightWeightMap.getIndexOfKey(false);
      expect(idxFalse).assertEqual(0);
      const idxTrue = lightWeightMap.getIndexOfKey(true);
      expect(idxTrue).assertEqual(1);
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTTHREE_2200
     * @tc.name      testLightWeightMapTest03Chapter2200
     * @tc.desc      Verify getIndexOfKey with Array type key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter2200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest03Chapter2200';
      console.log(TAG + 'start');
      const key1 = ['1', '2', '3'];
      const key2 = ['a', 'b', 'c'];
      const lightWeightMap = new LightWeightMap<Array<string>, string>();
      lightWeightMap.set(key1, "numbers array");
      lightWeightMap.set(key2, "strings array");
      const result:boolean = lightWeightMap.getIndexOfKey(key2) === 0 || lightWeightMap.getIndexOfKey(key2) === 1;
      expect(result).assertTrue();
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTTHREE_2300
     * @tc.name      testLightWeightMapTest03Chapter2300
     * @tc.desc      Verify getIndexOfKey with nested Array type key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter2300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest03Chapter2300';
      console.log(TAG + 'start');
      const key1: number[][] = [[1, 2], [3, 4]];
      const key2: number[][] = [[5, 6], [7, 8]];
      const lightWeightMap = new LightWeightMap<number[][], string>();
      lightWeightMap.set(key1, "nested numbers array");
      lightWeightMap.set(key2, "nested strings array");
      const result:boolean = lightWeightMap.getIndexOfKey(key2) === 0 || lightWeightMap.getIndexOfKey(key2) === 1;
      expect(result).assertTrue();
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTTHREE_2400
     * @tc.name      testLightWeightMapTest03Chapter2400
     * @tc.desc      Verify getIndexOfKey with Object type key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter2400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest03Chapter2400';
      console.log(TAG + 'start');
      const key1: keyobject= { id: 1, name: 'key1' };
      const key2: keyobject= { id: 2, name: 'key2' };

      const lightWeightMap = new LightWeightMap<object, number>();
      lightWeightMap.set(key1, 100);
      lightWeightMap.set(key2, 200);
      const result:boolean = lightWeightMap.getIndexOfKey(key2) === 0 || lightWeightMap.getIndexOfKey(key2) === 1;
      expect(result).assertTrue();
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTTHREE_2500
     * @tc.name      testLightWeightMapTest03Chapter2500
     * @tc.desc      Verify getIndexOfKey with nested Object type key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter2500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest03Chapter2500';
      console.log(TAG + 'start');
      const key1: keyobject= { id: 1, name: 'key1' };
      const key2: keyobject= { id: 2, name: 'key2' };
      const lightWeightMap = new LightWeightMap<object, string>();
      lightWeightMap.set(key1, "complex object 1");
      lightWeightMap.set(key2, "complex object 2");
      const result:boolean = lightWeightMap.getIndexOfKey(key2) === 0 || lightWeightMap.getIndexOfKey(key2) === 1;
      expect(result).assertTrue();
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTTHREE_2600
     * @tc.name      testLightWeightMapTest03Chapter2600
     * @tc.desc      Verify getIndexOfKey with Class type key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter2600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest03Chapter2600';
      console.log(TAG + 'start');
      const instance1 = new TestClass(1, "first");
      const instance2 = new TestClass(2, "second");
      const lightWeightMap = new LightWeightMap<TestClass, string>();
      lightWeightMap.set(instance1, "first instance");
      lightWeightMap.set(instance2, "second instance");
      const result:boolean = lightWeightMap.getIndexOfKey(instance2) === 0 || lightWeightMap.getIndexOfKey(instance2) === 1;
      expect(result).assertTrue();
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTTHREE_2700
     * @tc.name      testLightWeightMapTest03Chapter2700
     * @tc.desc      Verify getIndexOfKey with TypedArray type key (Int8Array)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter2700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest03Chapter2700';
      console.log(TAG + 'start');
      const key1 = new Int8Array([1, 2, 3, 4, 5]);
      const key2 = new Int8Array([-128, 0, 127]);
      const lightWeightMap = new LightWeightMap<Int8Array, string>();
      lightWeightMap.set(key1, "positive Int8Array");
      lightWeightMap.set(key2, "boundary Int8Array");
      const result:boolean = lightWeightMap.getIndexOfKey(key2) === 0 || lightWeightMap.getIndexOfKey(key2) === 1;
      expect(result).assertTrue();
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTTHREE_2800
     * @tc.name      testLightWeightMapTest03Chapter2800
     * @tc.desc      Verify getIndexOfKey with TypedArray special values (Float64Array)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter2800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest03Chapter2800';
      console.log(TAG + 'start');
      const key1 = new Float64Array([NaN, Infinity, -Infinity]);
      const key2 = new Float64Array([0, -0, Number.MAX_VALUE]);
      const lightWeightMap = new LightWeightMap<Float64Array, string>();
      lightWeightMap.set(key1, "special float values");
      lightWeightMap.set(key2, "boundary float values");
      const result:boolean = lightWeightMap.getIndexOfKey(key2) === 0 || lightWeightMap.getIndexOfKey(key2) === 1;
      expect(result).assertTrue();
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTTHREE_2900
     * @tc.name      testLightWeightMapTest03Chapter2900
     * @tc.desc      Verify getIndexOfKey returns -1 for non-existent key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter2900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest03Chapter2900';
      console.log(TAG + 'start');
      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set("existing", 100);
      lightWeightMap.set("another", 200);
      const result = lightWeightMap.getIndexOfKey("non-existent");
      expect(result).assertEqual(-1);
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTTHREE_3000
     * @tc.name      testLightWeightMapTest03Chapter3000
     * @tc.desc      Verify getIndexOfKey returns first occurrence for duplicate keys
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter3000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest03Chapter3000';
      console.log(TAG + 'start');
      const lightWeightMap = new LightWeightMap<string, number>();
      // LightWeightMap不允许重复key，所以测试相同value不同key的情�?
      lightWeightMap.set("key1", 100);
      lightWeightMap.set("key2", 200);
      lightWeightMap.set("key3", 100); // 相同value不同key
      const result1 = lightWeightMap.getIndexOfKey("key1");
      const result2 = lightWeightMap.getIndexOfKey("key3");
      expect(result1).assertEqual(0);
      expect(result2).assertEqual(2);
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTTHREE_3100
     * @tc.name      testLightWeightMapTest03Chapter3100
     * @tc.desc      Verify getIndexOfKey with boolean values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter3100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest03Chapter3100';
      console.log(TAG + 'start');
      const lightWeightMap = new LightWeightMap<boolean, boolean>();
      lightWeightMap.set(true, true);
      const result = lightWeightMap.getIndexOfKey(true);
      expect(result).assertEqual(0);
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTTHREE_3200
     * @tc.name      testLightWeightMapTest03Chapter3200
     * @tc.desc      Verify getIndexOfKey with empty map
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter3200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest03Chapter3200';
      console.log(TAG + 'start');
      const lightWeightMap = new LightWeightMap<string, number>();
      const result = lightWeightMap.getIndexOfKey("any");
      expect(result).assertEqual(-1);
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTTHREE_3300
     * @tc.name      testLightWeightMapTest03Chapter3300
     * @tc.desc      Verify getIndexOfKey with large number of elements
     * @tc.size      LargeTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter3300", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest03Chapter3300';
      console.log(TAG + 'start');
      const lightWeightMap = new LightWeightMap<number, string>();

      for (let i: int = 0; i < 1000; i++) {
        lightWeightMap.set(i, `value${i}`);
      }

      const result1 = lightWeightMap.getIndexOfKey(500);
      const result2 = lightWeightMap.getIndexOfKey(999);
      const result3 = lightWeightMap.getIndexOfKey(1000);

      expect(result1).assertEqual(500);
      expect(result2).assertEqual(999);
      expect(result3).assertEqual(-1);
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTTHREE_3400
     * @tc.name      testLightWeightMapTest03Chapter3400
     * @tc.desc      Verify getIndexOfValue with String type value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter3400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest03Chapter3400';
      console.log(TAG + 'start');
      const lightWeightMap = new LightWeightMap<string, string>();
      lightWeightMap.set("key1", "apple");
      lightWeightMap.set("key2", "banana");
      lightWeightMap.set("key3", "cherry");
      const result = lightWeightMap.getIndexOfValue("banana");
      expect(result).assertEqual(1);
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTTHREE_3500
     * @tc.name      testLightWeightMapTest03Chapter3500
     * @tc.desc      Verify getIndexOfValue with String type value containing special characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter3500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest03Chapter3500';
      console.log(TAG + 'start');
      const lightWeightMap = new LightWeightMap<string, string>();
      lightWeightMap.set("key1", "value with spaces");
      lightWeightMap.set("key2", "value-with-hyphen");
      lightWeightMap.set("key3", "value_with_underscore");
      const result = lightWeightMap.getIndexOfValue("value with spaces");
      expect(result).assertEqual(0);
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTTHREE_3600
     * @tc.name      testLightWeightMapTest03Chapter3600
     * @tc.desc      Verify getIndexOfValue with Number type value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter3600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest03Chapter3600';
      console.log(TAG + 'start');
      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set("key1", 0);
      lightWeightMap.set("key2", 1);
      lightWeightMap.set("key3", -1);
      const result = lightWeightMap.getIndexOfValue(1);
      expect(result).assertEqual(1);
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTTHREE_3700
     * @tc.name      testLightWeightMapTest03Chapter3700
     * @tc.desc      Verify getIndexOfValue with Number type special values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter3700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest03Chapter3700';
      console.log(TAG + 'start');
      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set("key1", Number.MAX_SAFE_INTEGER);
      lightWeightMap.set("key2", Number.MIN_SAFE_INTEGER);
      lightWeightMap.set("key3", 0);
      const result = lightWeightMap.getIndexOfValue(Number.MAX_SAFE_INTEGER);
      expect(result).assertEqual(0);
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTTHREE_3800
     * @tc.name      testLightWeightMapTest03Chapter3800
     * @tc.desc      Verify getIndexOfValue with Boolean type value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter3800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest03Chapter3800';
      console.log(TAG + 'start');
      const lightWeightMap = new LightWeightMap<string, boolean>();
      lightWeightMap.set("key1", true);
      lightWeightMap.set("key2", false);
      lightWeightMap.set("key3", true);
      const result = lightWeightMap.getIndexOfValue(false);
      expect(result).assertEqual(1);
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTTHREE_3900
     * @tc.name      testLightWeightMapTest03Chapter3900
     * @tc.desc      Verify getIndexOfValue with Array type value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter3900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest03Chapter3900';
      console.log(TAG + 'start');
      const lightWeightMap = new LightWeightMap<string, Array<number>>();
      lightWeightMap.set("key1", [1, 2, 3]);
      lightWeightMap.set("key2", [4, 5, 6]);
      lightWeightMap.set("key3", [7, 8, 9]);
      const result = lightWeightMap.getIndexOfValue([4, 5, 6]);
      expect(result).assertEqual(-1);
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTTHREE_4000
     * @tc.name      testLightWeightMapTest03Chapter4000
     * @tc.desc      Verify getIndexOfValue with nested Array type value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter4000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest03Chapter4000';
      console.log(TAG + 'start');
      const lightWeightMap = new LightWeightMap<string, Array<Array<number>>>();
      lightWeightMap.set("key1", [[1, 2], [3, 4]]);
      lightWeightMap.set("key2", [[5, 6], [7, 8]]);
      const result = lightWeightMap.getIndexOfValue([[5, 6], [7, 8]]);
      expect(result).assertEqual(-1);
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTTHREE_4100
     * @tc.name      testLightWeightMapTest03Chapter4100
     * @tc.desc      Verify getIndexOfValue with Object type value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter4100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest03Chapter4100';
      console.log(TAG + 'start');
      const obj1: keyobject = { id: 1, name: "object1" };
      const obj2: keyobject = { id: 2, name: "object2" };
      const obj3: keyobject = { id: 3, name: "object3" };
      const lightWeightMap = new LightWeightMap<string, keyobject>();
      lightWeightMap.set("key1", obj1);
      lightWeightMap.set("key2", obj2);
      lightWeightMap.set("key3", obj3);
      const searchObj: keyobject = { id: 2, name: "object2" };
      const result = lightWeightMap.getIndexOfValue(searchObj);
      expect(result).assertEqual(-1);
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTTHREE_4200
     * @tc.name      testLightWeightMapTest03Chapter4200
     * @tc.desc      Verify getIndexOfValue with nested Object type value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter4200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest03Chapter4200';
      console.log(TAG + 'start');
      const lightWeightMap = new LightWeightMap<string, UserContainer>();
      const userObj1: UserContainer = {
        user: {
          id: 1,
          profile: {
            name: "Alice",
            age: 25
          }
        }
      };
      const userObj2: UserContainer = {
        user: {
          id: 2,
          profile: {
            name: "Bob",
            age: 30
          }
        }
      };
      lightWeightMap.set("key1", userObj1);
      lightWeightMap.set("key2", userObj2);
      const searchObj: UserContainer = {
        user: {
          id: 2,
          profile: {
            name: "Bob",
            age: 30
          }
        }
      };
      const result = lightWeightMap.getIndexOfValue(searchObj);
      expect(result).assertEqual(-1);
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTTHREE_4300
     * @tc.name      testLightWeightMapTest03Chapter4300
     * @tc.desc      Verify getIndexOfValue with Class type value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter4300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest03Chapter4300';
      console.log(TAG + 'start');
      const instance1 = new TestClass(1, "first");
      const instance2 = new TestClass(2, "second");
      const instance3 = new TestClass(3, "third");
      const lightWeightMap = new LightWeightMap<string, TestClass>();
      lightWeightMap.set("key1", instance1);
      lightWeightMap.set("key2", instance2);
      lightWeightMap.set("key3", instance3);
      const result = lightWeightMap.getIndexOfValue(instance2);
      expect(result).assertEqual(1);
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTTHREE_4400
     * @tc.name      testLightWeightMapTest03Chapter4400
     * @tc.desc      Verify getIndexOfValue with TypedArray type value (Int8Array)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter4400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest03Chapter4400';
      console.log(TAG + 'start');
      const lightWeightMap = new LightWeightMap<string, Int8Array>();
      lightWeightMap.set("key1", new Int8Array([1, 2, 3, 4, 5]));
      lightWeightMap.set("key2", new Int8Array([-128, 0, 127]));
      lightWeightMap.set("key3", new Int8Array([10, 20, 30]));
      const result = lightWeightMap.getIndexOfValue(new Int8Array([-128, 0, 127]));
      expect(result).assertEqual(-1);
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTTHREE_4500
     * @tc.name      testLightWeightMapTest03Chapter4500
     * @tc.desc      Verify getIndexOfValue with TypedArray special values (Float64Array)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter4500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest03Chapter4500';
      console.log(TAG + 'start');
      const lightWeightMap = new LightWeightMap<string, Float64Array>();
      lightWeightMap.set("key1", new Float64Array([NaN, Infinity, -Infinity]));
      lightWeightMap.set("key2", new Float64Array([0, -0, Number.MAX_VALUE]));
      const result = lightWeightMap.getIndexOfValue(new Float64Array([0, -0, Number.MAX_VALUE]));
      expect(result).assertEqual(-1);
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTTHREE_4600
     * @tc.name      testLightWeightMapTest03Chapter4600
     * @tc.desc      Verify getIndexOfValue returns -1 for non-existent value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter4600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest03Chapter4600';
      console.log(TAG + 'start');
      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set("key1", 100);
      lightWeightMap.set("key2", 200);
      const result = lightWeightMap.getIndexOfValue(300);
      expect(result).assertEqual(-1);
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTTHREE_4700
     * @tc.name      testLightWeightMapTest03Chapter4700
     * @tc.desc      Verify getIndexOfValue returns first occurrence for duplicate values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter4700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest03Chapter4700';
      console.log(TAG + 'start');
      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set("key1", 100);
      lightWeightMap.set("key2", 200);
      lightWeightMap.set("key3", 100); // 重复的value
      const result = lightWeightMap.getIndexOfValue(100);
      expect(result).assertEqual(0);
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTTHREE_4800
     * @tc.name      testLightWeightMapTest03Chapter4800
     * @tc.desc      Verify getIndexOfValue with boolean values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter4800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest03Chapter4800';
      console.log(TAG + 'start');
      const lightWeightMap = new LightWeightMap<boolean, boolean>();
      lightWeightMap.set(true, true);
      const result = lightWeightMap.getIndexOfValue(true);
      expect(result).assertEqual(0);
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTTHREE_4900
     * @tc.name      testLightWeightMapTest03Chapter4900
     * @tc.desc      Verify getIndexOfValue with empty map
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter4900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest03Chapter4900';
      console.log(TAG + 'start');
      const lightWeightMap = new LightWeightMap<string, number>();
      const result = lightWeightMap.getIndexOfValue(100);
      expect(result).assertEqual(-1);
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTTHREE_5000
     * @tc.name      testLightWeightMapTest03Chapter5000
     * @tc.desc      Verify getIndexOfValue with null  values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter5000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest03Chapter5000';
      console.log(TAG + 'start');
      const lightWeightMap = new LightWeightMap<string, number | null>();
      lightWeightMap.set("key1", null);
      const result1 = lightWeightMap.getIndexOfValue(null);
      expect(result1).assertEqual(0);
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTTHREE_5100
     * @tc.name      testLightWeightMapTest03Chapter5100
     * @tc.desc      Verify getIndexOfValue with large number of elements
     * @tc.size      LargeTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter5100", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest03Chapter5100';
      console.log(TAG + 'start');
      const lightWeightMap = new LightWeightMap<string, number>();

      for (let i: int = 0; i < 1000; i++) {
        lightWeightMap.set(`key${i}`, i);
      }

      const result1 = lightWeightMap.getIndexOfValue(500);
      const result2 = lightWeightMap.getIndexOfValue(999);
      const result3 = lightWeightMap.getIndexOfValue(1000); // 不存在的value

      expect(result1).assertEqual(500);
      expect(result2).assertEqual(999);
      expect(result3).assertEqual(-1);
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTTHREE_5200
     * @tc.name      testLightWeightMapTest03Chapter5200
     * @tc.desc      Verify LightWeightMap supports number value 0
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter5200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

        const TAG = 'testLightWeightMapTest03Chapter5200';
        console.log(TAG + ' start');

        const lightWeightMap = new LightWeightMap<string, number>();
        lightWeightMap.set('k', 0);
        expect(lightWeightMap.get('k')).assertEqual(0);

        console.log(TAG + ' end');
      });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTTHREE_5300
     * @tc.name      testLightWeightMapTest03Chapter5300
     * @tc.desc      Verify LightWeightMap supports undefined value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter5300",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

        const TAG = 'testLightWeightMapTest03Chapter5300';
        console.log(TAG + ' start');


        const lightWeightMap = new LightWeightMap<string, number | undefined>();
        lightWeightMap.set('k', undefined);
        expect(lightWeightMap.get('k')).assertEqual(undefined);

        console.log(TAG + ' end');
      });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTTHREE_5400
     * @tc.name      testLightWeightMapTest03Chapter5400
     * @tc.desc      Verify LightWeightMap supports NaN value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter5400",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

        const TAG = 'testLightWeightMapTest03Chapter5400';
        console.log(TAG + ' start');


        const lightWeightMap = new LightWeightMap<string, number>();
        lightWeightMap.set('k', NaN);
        const val: number = lightWeightMap.get('k') as number;
        expect(Number.isNaN(val)).assertTrue();

        console.log(TAG + ' end');
      });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTTHREE_5500
     * @tc.name      testLightWeightMapTest03Chapter5500
     * @tc.desc      Verify LightWeightMap supports -0 value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter5500",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

        const TAG = 'testLightWeightMapTest03Chapter5500';
        console.log(TAG + ' start');


        const lightWeightMap = new LightWeightMap<string, number>();
        lightWeightMap.set('k', -0);

        const value: number | undefined = lightWeightMap.get('k');
        expect(value).assertEqual(0);
        let numValue: number = value!;
        expect(1.0 / numValue).assertEqual(Number.NEGATIVE_INFINITY);

        console.log(TAG + ' end');
      });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTTHREE_5600
     * @tc.name      testLightWeightMapTest03Chapter5600
     * @tc.desc      Verify LightWeightMap supports Infinity
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter5600",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

        const TAG = 'testLightWeightMapTest03Chapter5600';
        console.log(TAG + ' start');


        const lightWeightMap = new LightWeightMap<string, number>();
        lightWeightMap.set('k', Infinity);
        expect(lightWeightMap.get('k')).assertEqual(Infinity);

        console.log(TAG + ' end');
      });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTTHREE_5700
     * @tc.name      testLightWeightMapTest03Chapter5700
     * @tc.desc      Verify LightWeightMap supports -Infinity
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter5700",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

        const TAG = 'testLightWeightMapTest03Chapter5700';
        console.log(TAG + ' start');


        const lightWeightMap = new LightWeightMap<string, number>();
        lightWeightMap.set('k', -Infinity);
        expect(lightWeightMap.get('k')).assertEqual(-Infinity);

        console.log(TAG + ' end');
      });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTTHREE_5800
     * @tc.name      testLightWeightMapTest03Chapter5800
     * @tc.desc      Verify LightWeightMap supports Math.floor result
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter5800",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

        const TAG = 'testLightWeightMapTest03Chapter5800';
        console.log(TAG + ' start');


        const lightWeightMap = new LightWeightMap<string, number>();
        const value = Math.floor(1.5);
        lightWeightMap.set('k', value);
        expect(lightWeightMap.get('k')).assertEqual(1);

        console.log(TAG + ' end');
      });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTTHREE_5900
     * @tc.name      testLightWeightMapTest03Chapter5900
     * @tc.desc      Verify LightWeightMap supports Number.MAX_VALUE
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter5900",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

        const TAG = 'testLightWeightMapTest03Chapter5900';
        console.log(TAG + ' start');


        const lightWeightMap = new LightWeightMap<string, number>();
        lightWeightMap.set('k', Number.MAX_VALUE);
        expect(lightWeightMap.get('k')).assertEqual(Number.MAX_VALUE);

        console.log(TAG + ' end');
      });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTTHREE_6000
     * @tc.name      testLightWeightMapTest03Chapter6000
     * @tc.desc      Verify LightWeightMap supports Number.MIN_VALUE
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter6000",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

        const TAG = 'testLightWeightMapTest03Chapter6000';
        console.log(TAG + ' start');


        const lightWeightMap = new LightWeightMap<string, number>();
        lightWeightMap.set('k', Number.MIN_VALUE);
        expect(lightWeightMap.get('k')).assertEqual(Number.MIN_VALUE);

        console.log(TAG + ' end');
      });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTTHREE_6100
     * @tc.name      testLightWeightMapTest03Chapter6100
     * @tc.desc      Verify LightWeightMap supports Number.EPSILON
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter6100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

        const TAG = 'testLightWeightMapTest03Chapter6100';
        console.log(TAG + ' start');
        const lightWeightMap = new LightWeightMap<string, number>();
        lightWeightMap.set('k', Number.EPSILON);
        expect(lightWeightMap.get('k')).assertEqual(Number.EPSILON);

        console.log(TAG + ' end');
      });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTTHREE_6200
     * @tc.name      testLightWeightMapTest03Chapter6200
     * @tc.desc      Verify LightWeightMap supports Number.MAX_SAFE_INTEGER
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter6200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

        const TAG = 'testLightWeightMapTest03Chapter6200';
        console.log(TAG + ' start');
        const lightWeightMap = new LightWeightMap<string, number>();
        lightWeightMap.set('k', Number.MAX_SAFE_INTEGER);
        expect(lightWeightMap.get('k')).assertEqual(Number.MAX_SAFE_INTEGER);

        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTTHREE_6300
     * @tc.name      testLightWeightMapTest03Chapter6300
     * @tc.desc      Verify LightWeightMap supports byte range
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter6300",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

        const TAG = 'testLightWeightMapTest03Chapter6300';
        console.log(TAG + ' start');

        const lightWeightMap = new LightWeightMap<string, number>();
        lightWeightMap.set('min', -128);
        expect(lightWeightMap.get('min')).assertEqual(-128);

        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTTHREE_6400
     * @tc.name      testLightWeightMapTest03Chapter6400
     * @tc.desc      Verify LightWeightMap supports short range
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter6400",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

        const TAG = 'testLightWeightMapTest03Chapter6400';
        console.log(TAG + ' start');
        const lightWeightMap = new LightWeightMap<string, number>();
        lightWeightMap.set('min', -32768);
        expect(lightWeightMap.get('min')).assertEqual(-32768);
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTTHREE_6500
     * @tc.name      testLightWeightMapTest03Chapter6500
     * @tc.desc      Verify LightWeightMap supports int range
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter6500",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

        const TAG = 'testLightWeightMapTest03Chapter6500';
        console.log(TAG + ' start');
        const lightWeightMap = new LightWeightMap<string, number>();
        lightWeightMap.set('min', -2147483648);
        expect(lightWeightMap.get('min')).assertEqual(-2147483648);
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTTHREE_6600
     * @tc.name      testLightWeightMapTest03Chapter6600
     * @tc.desc      Verify LightWeightMap supports long range
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter6600",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

        const TAG = 'testLightWeightMapTest03Chapter6600';
        console.log(TAG + ' start');
        const lightWeightMap = new LightWeightMap<string, bigint>();
        const min = -9223372036854775808n;
        lightWeightMap.set('min', min);
        expect(lightWeightMap.get('min')).assertEqual(min);
        console.log(TAG + ' end');
      });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTTHREE_6700
     * @tc.name      testLightWeightMapTest03Chapter6700
     * @tc.desc      Verify LightWeightMap supports float range
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter6700",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

        const TAG = 'testLightWeightMapTest03Chapter6700';
        console.log(TAG + ' start');
        const lightWeightMap = new LightWeightMap<string, number>();
        lightWeightMap.set('min', 1.401298464e-45);
        expect(lightWeightMap.get('max')).assertEqual(undefined);
        console.log(TAG + ' end');
      });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTTHREE_6800
     * @tc.name      testLightWeightMapTest03Chapter6800
     * @tc.desc      Verify LightWeightMap supports double range
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter6800",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

        const TAG = 'testLightWeightMapTest03Chapter6800';
        console.log(TAG + ' start');
        const lightWeightMap = new LightWeightMap<string, number>();
        lightWeightMap.set('min', 4.940656458e-324);
        expect(lightWeightMap.get('min')).assertEqual(4.940656458e-324);
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTTHREE_6900
     * @tc.name      testLightWeightMapTest03Chapter6900
     * @tc.desc      Verify LightWeightMap supports char range
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter6900",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

        const TAG = 'testLightWeightMapTest03Chapter6900';
        console.log(TAG + ' start');
        const lightWeightMap = new LightWeightMap<string, number>();
        lightWeightMap.set('min', 0);
        expect(lightWeightMap.get('min')).assertEqual(0);
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTTHREE_7000
     * @tc.name      testLightWeightMapTest03Chapter7000
     * @tc.desc      Verify LightWeightMap supports BigInt hex value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter7000",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

        const TAG = 'testLightWeightMapTest03Chapter7000';
        console.log(TAG + ' start');
        const lightWeightMap = new LightWeightMap<string, number>();
        const value = 0xdecafafecafede;

        lightWeightMap.set('k', value);
        expect(lightWeightMap.get('k')).assertEqual(value);

        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTTHREE_7100
     * @tc.name      testLightWeightMapTest03Chapter7100
     * @tc.desc      Verify LightWeightMap supports double value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter7100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

        const TAG = 'testLightWeightMapTest03Chapter7100';
        console.log(TAG + ' start');
        const lightWeightMap = new LightWeightMap<string, number>();
        lightWeightMap.set('k', 123.456);

        expect(lightWeightMap.get('k')).assertEqual(123.456);

        console.log(TAG + ' end');
      });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTTHREE_7200
     * @tc.name      testLightWeightMapTest03Chapter7200
     * @tc.desc      Verify LightWeightMap supports hex number
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter7200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

        const TAG = 'testLightWeightMapTest03Chapter7200';
        console.log(TAG + ' start');
        const lightWeightMap = new LightWeightMap<string, number>();
        lightWeightMap.set('k', 0xcafebabe);

        expect(lightWeightMap.get('k')).assertEqual(0xcafebabe);

        console.log(TAG + ' end');
      });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTTHREE_7300
     * @tc.name      testLightWeightMapTest03Chapter7300
     * @tc.desc      Verify LightWeightMap supports hex literal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter7300",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

        const TAG = 'testLightWeightMapTest03Chapter7300';
        console.log(TAG + ' start');
        const lightWeightMap = new LightWeightMap<string, number>();
        lightWeightMap.set('k', 0x0102);

        expect(lightWeightMap.get('k')).assertEqual(258);

        console.log(TAG + ' end');
      });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTTHREE_7400
     * @tc.name      testLightWeightMapTest03Chapter7400
     * @tc.desc      Verify LightWeightMap supports 32-bit integer
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter7400",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

        const TAG = 'testLightWeightMapTest03Chapter7400';
        console.log(TAG + ' start');


        const lightWeightMap = new LightWeightMap<string, number>();
        lightWeightMap.set('k', 0x01020304);

        expect(lightWeightMap.get('k')).assertEqual(16909060);

        console.log(TAG + ' end');
      });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTTHREE_7500
     * @tc.name      testLightWeightMapTest03Chapter7500
     * @tc.desc      Verify LightWeightMap supports octal literal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter7500",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

        const TAG = 'testLightWeightMapTest03Chapter7500';
        console.log(TAG + ' start');


        const lightWeightMap = new LightWeightMap<string, number>();
        lightWeightMap.set('k', 0o3);

        expect(lightWeightMap.get('k')).assertEqual(3);

        console.log(TAG + ' end');
      });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTTHREE_7600
     * @tc.name      testLightWeightMapTest03Chapter7600
     * @tc.desc      Verify LightWeightMap supports exponent operator
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter7600",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

        const TAG = 'testLightWeightMapTest03Chapter7600';
        console.log(TAG + ' start');


        const lightWeightMap = new LightWeightMap<string, number>();
        lightWeightMap.set('k', 2 ** 3);

        expect(lightWeightMap.get('k')).assertEqual(8);

        console.log(TAG + ' end');
      });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTTHREE_7700
     * @tc.name      testLightWeightMapTest03Chapter7700
     * @tc.desc      Verify LightWeightMap supports scientific notation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter7700",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

        const TAG = 'testLightWeightMapTest03Chapter7700';
        console.log(TAG + ' start');


        const lightWeightMap = new LightWeightMap<string, number>();
        lightWeightMap.set('a', 1e3);
        lightWeightMap.set('b', 2.5e-2);

        expect(lightWeightMap.get('a')).assertEqual(1000);
        expect(lightWeightMap.get('b')).assertEqual(0.025);

        console.log(TAG + ' end');
      });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTTHREE_7800
     * @tc.name      testLightWeightMapTest03Chapter7800
     * @tc.desc      Verify LightWeightMap supports BigInt value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter7800",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

        const TAG = 'testLightWeightMapTest03Chapter7800';
        console.log(TAG + ' start');


        const lightWeightMap = new LightWeightMap<string, bigint>();
        const value = 9007199254740991n;

        lightWeightMap.set('k', value);
        expect(lightWeightMap.get('k')).assertEqual(value);

        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTTHREE_7900
     * @tc.name      testLightWeightMapTest03Chapter7900
     * @tc.desc      Verify LightWeightMap supports byte range
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter7900",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

        const TAG = 'testLightWeightMapTest03Chapter7900';
        console.log(TAG + ' start');
        const lightWeightMap = new LightWeightMap<string, number>();
        lightWeightMap.set('max', 127);
        expect(lightWeightMap.get('min')).assertEqual(undefined);

        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTTHREE_8000
     * @tc.name      testLightWeightMapTest03Chapter8000
     * @tc.desc      Verify LightWeightMap supports short range
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter8000",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'testLightWeightMapTest03Chapter8000';
        console.log(TAG + ' start');
        const lightWeightMap = new LightWeightMap<string, number>();
        lightWeightMap.set('max', 32767);
        expect(lightWeightMap.get('max')).assertEqual(32767);

        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTTHREE_8100
     * @tc.name      testLightWeightMapTest03Chapter8100
     * @tc.desc      Verify LightWeightMap supports int range
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter8100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'testLightWeightMapTest03Chapter8100';
        console.log(TAG + ' start');
        const lightWeightMap = new LightWeightMap<string, number>();
        lightWeightMap.set('max', 2147483647);
        expect(lightWeightMap.get('max')).assertEqual(2147483647);

        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTTHREE_8200
     * @tc.name      testLightWeightMapTest03Chapter8200
     * @tc.desc      Verify LightWeightMap supports long range
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter8200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'testLightWeightMapTest03Chapter8200';
        console.log(TAG + ' start');
        const lightWeightMap = new LightWeightMap<string, bigint>();
        const max =  9223372036854775807n;
        lightWeightMap.set('max', max);
        expect(lightWeightMap.get('max')).assertEqual(max);
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTTHREE_8300
     * @tc.name      testLightWeightMapTest03Chapter8300
     * @tc.desc      Verify LightWeightMap supports float range
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter8300",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

        const TAG = 'testLightWeightMapTest03Chapter8300';
        console.log(TAG + ' start');
        const lightWeightMap = new LightWeightMap<string, number>();
        lightWeightMap.set('max', 3.402823466e+38);
        expect(lightWeightMap.get('max')).assertEqual(3.402823466e+38);
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTTHREE_8400
     * @tc.name      testLightWeightMapTest03Chapter8400
     * @tc.desc      Verify LightWeightMap supports double range
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter8400",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'testLightWeightMapTest03Chapter8400';
        console.log(TAG + ' start');
        const lightWeightMap = new LightWeightMap<string, number>();
        lightWeightMap.set('max', 1.7976931348623157e+308);
        expect(lightWeightMap.get('max')).assertEqual(1.7976931348623157e+308);
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTTHREE_8500
     * @tc.name      testLightWeightMapTest03Chapter8500
     * @tc.desc      Verify LightWeightMap supports char range
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter8500",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

        const TAG = 'testLightWeightMapTest03Chapter8500';
        console.log(TAG + ' start');
        const lightWeightMap = new LightWeightMap<string, number>();
        lightWeightMap.set('max', 65535);
        expect(lightWeightMap.get('max')).assertEqual(65535);

        console.log(TAG + ' end');
      });


  });
}
