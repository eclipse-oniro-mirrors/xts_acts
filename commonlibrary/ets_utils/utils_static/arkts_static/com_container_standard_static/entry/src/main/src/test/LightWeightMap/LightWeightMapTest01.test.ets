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
  private value: number;

  constructor(value: number) {
    this.value = value;
  }

  getValue(): number {
    return this.value;
  }

  equals(other: TestClass): boolean {
    return this.value === other.value;
  }
}

interface keyobject {
  id: number;
  name: string;
}

function sleep(count: int): Promise<void> {
  return new Promise<void>((resolve: (value: PromiseLike<void>) => void, reject: (value: Error) => void) => {
    setTimeout(() => {
      resolve(Promise.resolve())
    }, count)
  })
}

export default function testLightWeightMapTest01(): void {
  describe('testLightWeightMapTest01', () => {
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
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTONE_0100
     * @tc.name      testLightWeightMapTest01Chapter0100
     * @tc.desc      Verify normal construction
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest01Chapter0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest01Chapter0100';
      console.log(TAG + 'start');
      const lightWeightMap = new LightWeightMap<string, number>();
      expect(lightWeightMap.length).assertEqual(0);
      console.log(TAG + 'end');

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTONE_0200
     * @tc.name      testLightWeightMapTest01Chapter0200
     * @tc.desc      Verify normal construction
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest01Chapter0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest01Chapter0200';
      console.log(TAG + 'start');
      const lightWeightMap = new LightWeightMap<string, string>();
      expect(lightWeightMap.length).assertEqual(0);
      console.log(TAG + 'end');

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTONE_0300
     * @tc.name      testLightWeightMapTest01Chapter0300
     * @tc.desc      Verify normal construction
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest01Chapter0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest01Chapter0300';
      console.log(TAG + 'start');
      const lightWeightMap = new LightWeightMap<string, string>();
      expect(lightWeightMap instanceof LightWeightMap).assertTrue();
      console.log(TAG + 'end');

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTONE_0400
     * @tc.name      testLightWeightMapTest01Chapter0400
     * @tc.desc      Verify normal construction
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest01Chapter0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest01Chapter0400';
      console.log(TAG + 'start');
      const lightWeightMap = new LightWeightMap<number, string>();
      expect(lightWeightMap.length).assertEqual(0);
      console.log(TAG + 'end');

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTONE_0500
     * @tc.name      testLightWeightMapTest01Chapter0500
     * @tc.desc      Verify normal construction
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest01Chapter0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest01Chapter0500';
      console.log(TAG + 'start');
      const lightWeightMap = new LightWeightMap<string, Array<number>>();
      expect(lightWeightMap instanceof LightWeightMap).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTONE_0600
     * @tc.name      testLightWeightMapTest01Chapter0600
     * @tc.desc      Verify normal construction
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest01Chapter0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest01Chapter0600';
      console.log(TAG + 'start');
      const lightWeightMap = new LightWeightMap<string, Array<number>>();
      const arr: Array<number> = [1, 2, 3];
      lightWeightMap.set('array1', arr);
      const retrieved: Array<number> | undefined = lightWeightMap.get('array1');
      expect(retrieved !== undefined).assertTrue();
      expect(retrieved!.length).assertEqual(3);
      expect(retrieved![0]).assertEqual(1);
      expect(retrieved![1]).assertEqual(2);
      expect(retrieved![2]).assertEqual(3);
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTONE_0700
     * @tc.name      testLightWeightMapTest01Chapter0700
     * @tc.desc      Verify that the newly created LightWeightMap is empty
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest01Chapter0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest01Chapter0700';
      console.log(TAG + 'start');
      //用例逻辑
      const lightWeightMap = new LightWeightMap<string, boolean>();
      const isEmpty = lightWeightMap.isEmpty();
      expect(isEmpty).assertTrue();

      console.log(TAG + "end");

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTONE_0800
     * @tc.name      testLightWeightMapTest01Chapter0800
     * @tc.desc      Verify that the newly created LightWeightMap has a length of 0
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest01Chapter0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest01Chapter0800';
      console.log(TAG + 'start');
      //用例逻辑
      const lightWeightMap = new LightWeightMap<boolean, number>();
      expect(lightWeightMap.length).assertEqual(0);

      console.log(TAG + "end");

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTONE_0900
     * @tc.name      testLightWeightMapTest01Chapter0900
     * @tc.desc      Verify that the created LightWeightMap is not empty after adding key-value pairs
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest01Chapter0900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest01Chapter0900';
      console.log(TAG + 'start');
      //用例逻辑
      const lightWeightMap = new LightWeightMap<number, number>();
      lightWeightMap.set(100, 100);
      const isEmpty = lightWeightMap.isEmpty();
      expect(isEmpty).assertFalse();

      console.log(TAG + "end");

    });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTONE_1000
     * @tc.name      testLightWeightMapTest01Chapter1000
     * @tc.desc      Verify that the created LightWeightMap is not empty after adding key-value pairs
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest01Chapter1000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest01Chapter1000';
      console.log(TAG + 'start');
      const lightWeightMap = new LightWeightMap<string, string>();
      lightWeightMap.set('key1', 'value1');
      const isEmpty = lightWeightMap.isEmpty();
      expect(isEmpty).assertFalse();
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTONE_1100
     * @tc.name      testLightWeightMapTest01Chapter1100
     * @tc.desc      Verify that newly created LightWeightMap is empty
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest01Chapter1100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest01Chapter1100';
      console.log(TAG + 'start');
      const lightWeightMap = new LightWeightMap<string, number>();
      const isEmpty = lightWeightMap.isEmpty();
      expect(isEmpty).assertTrue();
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTONE_1200
     * @tc.name      testLightWeightMapTest01Chapter1200
     * @tc.desc      Verify isEmpty returns false after adding multiple elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest01Chapter1200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest01Chapter1200';
      console.log(TAG + 'start');
      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set('key1', 100);
      lightWeightMap.set('key2', 200);
      lightWeightMap.set('key3', 300);
      const isEmpty = lightWeightMap.isEmpty();
      expect(isEmpty).assertFalse();
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTONE_1300
     * @tc.name      testLightWeightMapTest01Chapter1300
     * @tc.desc      Verify isEmpty returns true after clearing all elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest01Chapter1300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest01Chapter1300';
      console.log(TAG + 'start');
      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set('key1', 100);
      lightWeightMap.set('key2', 200);
      lightWeightMap.set('key3', 300);
      lightWeightMap.clear();
      const isEmpty = lightWeightMap.isEmpty();
      expect(isEmpty).assertTrue();
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTONE_1400
     * @tc.name      testLightWeightMapTest01Chapter1400
     * @tc.desc      Verify isEmpty returns true after removing all elements one by one
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest01Chapter1400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest01Chapter1400';
      console.log(TAG + 'start');
      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set('key1', 100);
      lightWeightMap.set('key2', 200);
      lightWeightMap.set('key3', 300);
      lightWeightMap.remove('key1');
      lightWeightMap.remove('key2');
      lightWeightMap.remove('key3');
      const isEmpty = lightWeightMap.isEmpty();
      expect(isEmpty).assertTrue();
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTONE_1500
     * @tc.name      testLightWeightMapTest01Chapter1500
     * @tc.desc      Verify isEmpty works with different generic types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest01Chapter1500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest01Chapter1500';
      console.log(TAG + 'start');
      const map3 = new LightWeightMap<object, number>();
      expect(map3.isEmpty()).assertTrue();
      const objKey: keyobject = {id: 1, name: ''};
      map3.set(objKey, 100);
      expect(map3.isEmpty()).assertFalse();
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTONE_1600
     * @tc.name      testLightWeightMapTest01Chapter1600
     * @tc.desc      Verify isEmpty works with complex data types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest01Chapter1600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest01Chapter1600';
      console.log(TAG + 'start');
      const lightWeightMap = new LightWeightMap<string, Array<number>>();
      expect(lightWeightMap.isEmpty()).assertTrue();

      lightWeightMap.set('array1', [1, 2, 3]);
      lightWeightMap.set('array2', [4, 5, 6]);

      expect(lightWeightMap.isEmpty()).assertFalse();
      lightWeightMap.remove('array1');
      expect(lightWeightMap.isEmpty()).assertFalse();

      lightWeightMap.remove('array2');
      const isEmpty = lightWeightMap.isEmpty();
      expect(isEmpty).assertTrue();
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTONE_1700
     * @tc.name      testLightWeightMapTest01Chapter1700
     * @tc.desc      Test isEmpty method cannot be bound (error 10200011)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest01Chapter1700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest01Chapter1700';
      console.log(TAG + 'start');
      const lightWeightMap = new LightWeightMap<boolean, boolean>();
      lightWeightMap.set(true, false);

      expect(lightWeightMap.isEmpty()).assertFalse();
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTONE_1800
     * @tc.name      testLightWeightMapTest01Chapter1800
     * @tc.desc      Verify isEmpty with repeated add and remove operations
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest01Chapter1800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest01Chapter1800';
      console.log(TAG + 'start');
      const lightWeightMap = new LightWeightMap<string, number>();
      expect(lightWeightMap.isEmpty()).assertTrue();

      lightWeightMap.set('key1', 100);
      expect(lightWeightMap.isEmpty()).assertFalse();

      lightWeightMap.remove('key1');
      expect(lightWeightMap.isEmpty()).assertTrue();

      lightWeightMap.set('key2', 200);
      expect(lightWeightMap.isEmpty()).assertFalse();

      lightWeightMap.remove('key2');
      const isEmpty = lightWeightMap.isEmpty();
      expect(isEmpty).assertTrue();
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTONE_1900
     * @tc.name      testLightWeightMapTest01Chapter1900
     * @tc.desc      Verify isEmpty with large number of elements
     * @tc.size      LargeTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest01Chapter1900", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest01Chapter1900';
      console.log(TAG + 'start');
      const lightWeightMap = new LightWeightMap<number, string>();
      expect(lightWeightMap.isEmpty()).assertTrue();

      for (let i: int = 0; i < 10; i++) {
        lightWeightMap.set(i, `value${i}`);
      }

      expect(lightWeightMap.isEmpty()).assertFalse();

      lightWeightMap.clear();
      const isEmpty = lightWeightMap.isEmpty();
      expect(isEmpty).assertTrue();
      console.log(TAG + "end");
    });

  /**
   * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTONE_2000
   * @tc.name      testLightWeightMapTest01Chapter2000
   * @tc.desc      Verify that an empty map contains an empty map
   * @tc.size      MediumTest
   * @tc.type      Function
   * @tc.level     Level 2
   */
  it("testLightWeightMapTest01Chapter2000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    const TAG = 'testLightWeightMapTest01Chapter2000';
    console.log(TAG + 'start');
    const lightWeightMap = new LightWeightMap<string, number>();
    const emptyMap = new LightWeightMap<string, number>();
    const result = lightWeightMap.hasAll(emptyMap);
    expect(result).assertTrue();
    console.log(TAG + "end");
  });

  /**
   * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTONE_2100
   * @tc.name      testLightWeightMapTest01Chapter2100
   * @tc.desc      Verify that a Non-empty map contains an empty map
   * @tc.size      MediumTest
   * @tc.type      Function
   * @tc.level     Level 2
   */
  it("testLightWeightMapTest01Chapter2100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    const TAG = 'testLightWeightMapTest01Chapter2100';
    console.log(TAG + 'start');
    const lightWeightMap = new LightWeightMap<string, number>();
    lightWeightMap.set('a', 1);
    lightWeightMap.set('b', 2);
    lightWeightMap.set('c', 3);
    const emptyMap = new LightWeightMap<string, number>();
    const result = lightWeightMap.hasAll(emptyMap);
    expect(result).assertTrue();
    console.log(TAG + "end");
  });

  /**
   * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTONE_2200
   * @tc.name      testLightWeightMapTest01Chapter2200
   * @tc.desc      Verify hasAll with string keys and number values
   * @tc.size      MediumTest
   * @tc.type      Function
   * @tc.level     Level 2
   */
  it("testLightWeightMapTest01Chapter2200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    const TAG = 'testLightWeightMapTest01Chapter2200';
    console.log(TAG + 'start');
    const lightWeightMap = new LightWeightMap<string, number>();
    lightWeightMap.set('apple', 1);
    lightWeightMap.set('banana', 2);
    lightWeightMap.set('cherry', 3);
    lightWeightMap.set('date', 4);

    const testMap = new LightWeightMap<string, number>();
    testMap.set('apple', 1);
    testMap.set('banana', 2);

    const result = lightWeightMap.hasAll(testMap);
    expect(result).assertTrue();
    console.log(TAG + "end");
  });

  /**
   * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTONE_2300
   * @tc.name      testLightWeightMapTest01Chapter2300
   * @tc.desc      Verify hasAll returns false when values mismatch
   * @tc.size      MediumTest
   * @tc.type      Function
   * @tc.level     Level 2
   */
  it("testLightWeightMapTest01Chapter2300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    const TAG = 'testLightWeightMapTest01Chapter2300';
    console.log(TAG + 'start');
    const lightWeightMap = new LightWeightMap<string, number>();
    lightWeightMap.set('apple', 1);
    lightWeightMap.set('banana', 2);

    const testMap = new LightWeightMap<string, number>();
    testMap.set('apple', 1);
    testMap.set('banana', 3); // Wrong value

    const result = lightWeightMap.hasAll(testMap);
    expect(result).assertFalse();
    console.log(TAG + "end");
  });

  /**
   * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTONE_2400
   * @tc.name      testLightWeightMapTest01Chapter2400
   * @tc.desc      Verify hasAll with number keys and string values
   * @tc.size      MediumTest
   * @tc.type      Function
   * @tc.level     Level 2
   */
  it("testLightWeightMapTest01Chapter2400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    const TAG = 'testLightWeightMapTest01Chapter2400';
    console.log(TAG + 'start');
    const lightWeightMap = new LightWeightMap<number, string>();
    lightWeightMap.set(1, 'one');
    lightWeightMap.set(2, 'two');
    lightWeightMap.set(3, 'three');
    lightWeightMap.set(4, 'four');

    const testMap = new LightWeightMap<number, string>();
    testMap.set(2, 'two');
    testMap.set(4, 'four');

    const result = lightWeightMap.hasAll(testMap);
    expect(result).assertTrue();
    console.log(TAG + "end");
  });

  /**
   * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTONE_2500
   * @tc.name      testLightWeightMapTest01Chapter2500
   * @tc.desc      Verify hasAll with boolean values
   * @tc.size      MediumTest
   * @tc.type      Function
   * @tc.level     Level 2
   */
  it("testLightWeightMapTest01Chapter2500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    const TAG = 'testLightWeightMapTest01Chapter2500';
    console.log(TAG + 'start');
    const lightWeightMap = new LightWeightMap<string, boolean>();
    lightWeightMap.set('flag1', true);
    lightWeightMap.set('flag2', false);
    lightWeightMap.set('flag3', true);

    const testMap = new LightWeightMap<string, boolean>();
    testMap.set('flag1', true);
    testMap.set('flag2', false);

    const result = lightWeightMap.hasAll(testMap);
    expect(result).assertTrue();
    console.log(TAG + "end");
  });

  /**
   * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTONE_2600
   * @tc.name      testLightWeightMapTest01Chapter2600
   * @tc.desc      Verify hasAll with array values
   * @tc.size      MediumTest
   * @tc.type      Function
   * @tc.level     Level 2
   */
  it("testLightWeightMapTest01Chapter2600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    const TAG = 'testLightWeightMapTest01Chapter2600';
    console.log(TAG + 'start');
    const lightWeightMap = new LightWeightMap<string, number[]>();
    const arr1: number[] = [1, 2, 3];
    const arr2: number[] = [4, 5, 6];
    const arr3: number[] = [7, 8, 9];
    lightWeightMap.set('arr1', arr1);
    lightWeightMap.set('arr2', arr2);
    lightWeightMap.set('arr3', arr3);

    const testMap = new LightWeightMap<string, number[]>();
    testMap.set('arr1', arr1);
    testMap.set('arr2', arr2);

    const result = lightWeightMap.hasAll(testMap);
    expect(result).assertTrue();
    console.log(TAG + "end");
  });

  /**
   * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTONE_2700
   * @tc.name      testLightWeightMapTest01Chapter2700
   * @tc.desc      Verify hasAll with object values
   * @tc.size      MediumTest
   * @tc.type      Function
   * @tc.level     Level 2
   */
  it("testLightWeightMapTest01Chapter2700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    const TAG = 'testLightWeightMapTest01Chapter2700';
    console.log(TAG + 'start');
    const lightWeightMap = new LightWeightMap<string, object>();
    const obj1: keyobject= { id: 1, name: 'key1' };
    const obj2: keyobject= { id: 2, name: 'key2' };
    const obj3: keyobject= { id: 3, name: 'key3' };

    lightWeightMap.set('obj1',obj1);
    lightWeightMap.set('obj2',obj2);
    lightWeightMap.set('obj3',obj3);

    const testMap = new LightWeightMap<string, object>();
    testMap.set('obj1', obj1);
    testMap.set('obj2', obj2);

    const result = lightWeightMap.hasAll(testMap);
    expect(result).assertTrue();
    console.log(TAG + "end");
  });

  /**
   * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTONE_2800
   * @tc.name      testLightWeightMapTest01Chapter2800
   * @tc.desc      Verify hasAll with object keys
   * @tc.size      MediumTest
   * @tc.type      Function
   * @tc.level     Level 2
   */
  it("testLightWeightMapTest01Chapter2800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    const TAG = 'testLightWeightMapTest01Chapter2800';
    console.log(TAG + 'start');
    const key1: keyobject= { id: 1, name: 'key1' };
    const key2: keyobject= { id: 1, name: 'key1' };
    const key3: keyobject= { id: 1, name: 'key1' };

    const lightWeightMap = new LightWeightMap<object, string>();
    lightWeightMap.set(key1, 'value1');
    lightWeightMap.set(key2, 'value2');
    lightWeightMap.set(key3, 'value3');

    const testMap = new LightWeightMap<object, string>();
    testMap.set(key1, 'value1');
    testMap.set(key2, 'value2');

    const result = lightWeightMap.hasAll(testMap);
    expect(result).assertTrue();
    console.log(TAG + "end");
  });

  /**
   * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTONE_2900
   * @tc.name      testLightWeightMapTest01Chapter2900
   * @tc.desc      Verify hasAll with class instances as values
   * @tc.size      MediumTest
   * @tc.type      Function
   * @tc.level     Level 2
   */
  it("testLightWeightMapTest01Chapter2900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    const TAG = 'testLightWeightMapTest01Chapter2900';
    console.log(TAG + 'start');
    const lightWeightMap = new LightWeightMap<string, TestClass>();
    const class1 = new TestClass(100);
    const class2 = new TestClass(200);
    const class3 = new TestClass(300);
    lightWeightMap.set('class1', class1);
    lightWeightMap.set('class2', class2);
    lightWeightMap.set('class3', class3);

    const testMap = new LightWeightMap<string, TestClass>();
    testMap.set('class1', class1);
    testMap.set('class2', class2);

    const result = lightWeightMap.hasAll(testMap);
    expect(result).assertTrue();
    console.log(TAG + "end");
  });

  /**
   * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTONE_3000
   * @tc.name      testLightWeightMapTest01Chapter3000
   * @tc.desc      Verify hasAll with TypedArray values (Int8Array)
   * @tc.size      MediumTest
   * @tc.type      Function
   * @tc.level     Level 2
   */
  it("testLightWeightMapTest01Chapter3000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    const TAG = 'testLightWeightMapTest01Chapter3000';
    console.log(TAG + 'start');
    const lightWeightMap = new LightWeightMap<string, Int8Array>();
    lightWeightMap.set('typed1', new Int8Array([1, 2, 3]));
    lightWeightMap.set('typed2', new Int8Array([4, 5, 6]));

    const testMap = new LightWeightMap<string, Int8Array>();

    const result = lightWeightMap.hasAll(testMap);
    expect(result).assertTrue();
    console.log(TAG + "end");
  });

  /**
   * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTONE_3100
   * @tc.name      testLightWeightMapTest01Chapter3100
   * @tc.desc      Verify hasAll with TypedArray special values (Float64Array with NaN, Infinity)
   * @tc.size      MediumTest
   * @tc.type      Function
   * @tc.level     Level 2
   */
  it("testLightWeightMapTest01Chapter3100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    const TAG = 'testLightWeightMapTest01Chapter3100';
    console.log(TAG + 'start');
    const lightWeightMap = new LightWeightMap<string, Float64Array>();
    const special1 = new Float64Array([1.5, NaN, Infinity]);
    const special2 = new Float64Array([-Infinity, 0, -0]);
    const special3 = new Float64Array([Number.MAX_VALUE, Number.MIN_VALUE]);
    lightWeightMap.set('special1', special1);
    lightWeightMap.set('special2', special2);
    lightWeightMap.set('special3', special3);

    const testMap = new LightWeightMap<string, Float64Array>();
    testMap.set('special1', special1);
    testMap.set('special2', special2);

    const result = lightWeightMap.hasAll(testMap);
    expect(result).assertTrue();
    console.log(TAG + "end");
  });

  /**
   * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTONE_3200
   * @tc.name      testLightWeightMapTest01Chapter3200
   * @tc.desc      Verify hasAll returns false when test map has extra keys
   * @tc.size      MediumTest
   * @tc.type      Function
   * @tc.level     Level 2
   */
  it("testLightWeightMapTest01Chapter3200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    const TAG = 'testLightWeightMapTest01Chapter3200';
    console.log(TAG + 'start');
    const lightWeightMap = new LightWeightMap<string, number>();
    lightWeightMap.set('a', 1);
    lightWeightMap.set('b', 2);

    const testMap = new LightWeightMap<string, number>();
    testMap.set('a', 1);
    testMap.set('b', 2);
    testMap.set('c', 3); // Extra key

    const result = lightWeightMap.hasAll(testMap);
    expect(result).assertFalse();
    console.log(TAG + "end");
  });

  /**
   * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTONE_3300
   * @tc.name      testLightWeightMapTest01Chapter3300
   * @tc.desc      Verify hasAll returns false for partial match
   * @tc.size      MediumTest
   * @tc.type      Function
   * @tc.level     Level 2
   */
  it("testLightWeightMapTest01Chapter3300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    const TAG = 'testLightWeightMapTest01Chapter3300';
    console.log(TAG + 'start');
    const lightWeightMap = new LightWeightMap<string, number>();
    lightWeightMap.set('a', 1);
    lightWeightMap.set('b', 2);
    lightWeightMap.set('c', 3);

    const testMap = new LightWeightMap<string, number>();
    testMap.set('a', 1);
    testMap.set('b', 2);
    testMap.set('d', 4); // Non-existent key

    const result = lightWeightMap.hasAll(testMap);
    expect(result).assertFalse();
    console.log(TAG + "end");
  });

  /**
   * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTONE_3400
   * @tc.name      testLightWeightMapTest01Chapter3400
   * @tc.desc      Verify hasAll with Uint8Array TypedArray
   * @tc.size      MediumTest
   * @tc.type      Function
   * @tc.level     Level 2
   */
  it("testLightWeightMapTest01Chapter3400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    const TAG = 'testLightWeightMapTest01Chapter3400';
    console.log(TAG + 'start');
    const arr1 =  new Uint8Array([255, 128, 64]);
    const lightWeightMap = new LightWeightMap<string, Uint8Array>();
    lightWeightMap.set('uint8', arr1);

    const testMap = new LightWeightMap<string, Uint8Array>();
    testMap.set('uint8', arr1);

    const result = lightWeightMap.hasAll(testMap);
    expect(result).assertTrue();
    console.log(TAG + "end");
  });

  /**
   * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTONE_3500
   * @tc.name      testLightWeightMapTest01Chapter3500
   * @tc.desc      Verify hasAll with mixed data types
   * @tc.size      MediumTest
   * @tc.type      Function
   * @tc.level     Level 2
   */
  it("testLightWeightMapTest01Chapter3500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    const TAG = 'testLightWeightMapTest01Chapter3500';
    console.log(TAG + 'start');
    const lightWeightMap = new LightWeightMap<string, boolean>();
    lightWeightMap.set('bool', true);

    const testMap = new LightWeightMap<string, boolean>();
    testMap.set('bool', true);

    const result = lightWeightMap.hasAll(testMap);
    expect(result).assertTrue();
    console.log(TAG + "end");
  });

  /**
   * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTONE_3600
   * @tc.name      testLightWeightMapTest01Chapter3600
   * @tc.desc      Verify hasAll with null values
   * @tc.size      MediumTest
   * @tc.type      Function
   * @tc.level     Level 2
   */
  it("testLightWeightMapTest01Chapter3600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    const TAG = 'testLightWeightMapTest01Chapter3600';
    console.log(TAG + 'start');
      const lightWeightMap = new LightWeightMap<string, number | null>();
      lightWeightMap.set('nullVal', null);
      expect(lightWeightMap.hasKey('nullVal')).assertTrue();
      const val: number | null | undefined = lightWeightMap.get('nullVal');
      expect(val === null).assertTrue();
    console.log(TAG + "end");
  });

  /**
   * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTONE_3700
   * @tc.name      testLightWeightMapTest01Chapter3700
   * @tc.desc      Verify hasAll with self comparison
   * @tc.size      MediumTest
   * @tc.type      Function
   * @tc.level     Level 2
   */
  it("testLightWeightMapTest01Chapter3700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    const TAG = 'testLightWeightMapTest01Chapter3700';
    console.log(TAG + 'start');
    const lightWeightMap = new LightWeightMap<string, number>();
    lightWeightMap.set('a', 1);
    lightWeightMap.set('b', 2);
    lightWeightMap.set('c', 3);

    const result = lightWeightMap.hasAll(lightWeightMap);
    expect(result).assertTrue();
    console.log(TAG + "end");
  });

  /**
   * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTONE_3800
   * @tc.name      testLightWeightMapTest01Chapter3800
   * @tc.desc      Verify hasAll with identical map
   * @tc.size      MediumTest
   * @tc.type      Function
   * @tc.level     Level 2
   */
  it("testLightWeightMapTest01Chapter3800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    const TAG = 'testLightWeightMapTest01Chapter3800';
    console.log(TAG + 'start');
    const lightWeightMap1 = new LightWeightMap<string, number>();
    lightWeightMap1.set('x', 10);
    lightWeightMap1.set('y', 20);
    lightWeightMap1.set('z', 30);

    const lightWeightMap2 = new LightWeightMap<string, number>();
    lightWeightMap2.set('x', 10);
    lightWeightMap2.set('y', 20);
    lightWeightMap2.set('z', 30);

    const result = lightWeightMap1.hasAll(lightWeightMap2);
    expect(result).assertTrue();
    console.log(TAG + "end");
  });

  /**
   * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTONE_3900
   * @tc.name      testLightWeightMapTest01Chapter3900
   * @tc.desc      Verify hasAll with large number of elements
   * @tc.size      LargeTest
   * @tc.type      Function
   * @tc.level     Level 2
   */
    it("testLightWeightMapTest01Chapter3900", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest01Chapter3900';
      console.log(TAG + 'start');
      const lightWeightMap = new LightWeightMap<number, string>();
      const testMap = new LightWeightMap<number, string>();

      for (let i: int = 0; i < 100; i++) {
        lightWeightMap.set(i, `value${i}`);
        if (i % 2 === 0) {
          testMap.set(i, `value${i}`);
        }
      }

      const result = lightWeightMap.hasAll(testMap);
      expect(result).assertTrue();
      console.log(TAG + "end");
      });
    });
  }
