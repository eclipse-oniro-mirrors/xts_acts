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

interface valueobject {
  type: string;
  score: number;
}

interface MyObj040 {
  a: number;
  b: string;
  c: number[];
}

interface MyObj041 {
  view: DataView;
}

interface MyObj054 {
  a: number;
  b: string;
}

function sleep(count: int): Promise<void> {
  return new Promise<void>((resolve: (value: PromiseLike<void>) => void, reject: (value: Error) => void) => {
    setTimeout(() => {
      resolve(Promise.resolve())
    }, count)
  })
}
export default function testLightWeightMapTest04(): void {
  describe('testLightWeightMapTest04', () => {
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
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTFOUR_0100
     * @tc.name      testLightWeightMapTest04Chapter0100
     * @tc.desc      Verify setAll with String type keys and values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest04Chapter0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest04Chapter0100';
      console.log(TAG + 'start');

      const sourceMap = new LightWeightMap<string, string>();
      sourceMap.set("key1", "value1");
      sourceMap.set("key2", "value2");
      sourceMap.set("key3", "value3");

      const targetMap = new LightWeightMap<string, string>();
      targetMap.setAll(sourceMap);

      expect(targetMap.get("key1")).assertEqual("value1");

      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTFOUR_0200
     * @tc.name      testLightWeightMapTest04Chapter0200
     * @tc.desc      Verify setAll with String type containing special characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest04Chapter0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest04Chapter0200';
      console.log(TAG + 'start');

      const sourceMap = new LightWeightMap<string, string>();
      sourceMap.set("key with spaces", "value with spaces");
      sourceMap.set("key-with-hyphen", "value-with-hyphen");
      sourceMap.set("key_underscore", "value_underscore");
      sourceMap.set("key123", "value456");

      const targetMap = new LightWeightMap<string, string>();
      targetMap.setAll(sourceMap);

      expect(targetMap.get("key with spaces")).assertEqual("value with spaces");
      expect(targetMap.get("key-with-hyphen")).assertEqual("value-with-hyphen");
      expect(targetMap.get("key_underscore")).assertEqual("value_underscore");
      expect(targetMap.get("key123")).assertEqual("value456");

      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTFOUR_0300
     * @tc.name      testLightWeightMapTest04Chapter0300
     * @tc.desc      Verify setAll with Number type keys and values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest04Chapter0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest04Chapter0300';
      console.log(TAG + 'start');

      const sourceMap = new LightWeightMap<number, number>();
      sourceMap.set(1, 100);
      sourceMap.set(2, 200);
      sourceMap.set(3, 300);
      sourceMap.set(-1, -100);
      sourceMap.set(0, 0);

      const targetMap = new LightWeightMap<number, number>();
      targetMap.setAll(sourceMap);

      expect(targetMap.get(1)).assertEqual(100);
      expect(targetMap.get(2)).assertEqual(200);
      expect(targetMap.get(3)).assertEqual(300);
      expect(targetMap.get(-1)).assertEqual(-100);
      expect(targetMap.get(0)).assertEqual(0);

      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTFOUR_0400
     * @tc.name      testLightWeightMapTest04Chapter0400
     * @tc.desc      Verify setAll with Number type special values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest04Chapter0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest04Chapter0400';
      console.log(TAG + 'start');

      const sourceMap = new LightWeightMap<number, number>();
      sourceMap.set(100, 1);
      sourceMap.set(-100, 2);
      sourceMap.set(200, 3);
      sourceMap.set(-200, 4);

      const targetMap = new LightWeightMap<number, number>();
      targetMap.setAll(sourceMap);

      expect(targetMap.get(100)).assertEqual(1);
      expect(targetMap.get(-100)).assertEqual(2);
      expect(targetMap.get(200)).assertEqual(3);
      expect(targetMap.get(-200)).assertEqual(4);

      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTFOUR_0500
     * @tc.name      testLightWeightMapTest04Chapter0500
     * @tc.desc      Verify setAll with Boolean type keys and values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest04Chapter0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest04Chapter0500';
      console.log(TAG + 'start');

      const sourceMap = new LightWeightMap<boolean, boolean>();
      sourceMap.set(true, false);
      sourceMap.set(false, true);

      const targetMap = new LightWeightMap<boolean, boolean>();
      targetMap.setAll(sourceMap);

      expect(targetMap.get(true)).assertFalse();
      expect(targetMap.get(false)).assertTrue();

      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTFOUR_0600
     * @tc.name      testLightWeightMapTest04Chapter0600
     * @tc.desc      Verify setAll with Boolean type mixed values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest04Chapter0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest04Chapter0600';
      console.log(TAG + 'start');

      const sourceMap = new LightWeightMap<string, boolean>();
      sourceMap.set("key1", true);
      sourceMap.set("key2", false);
      sourceMap.set("key3", true);

      const targetMap = new LightWeightMap<string, boolean>();
      targetMap.setAll(sourceMap);

      expect(targetMap.get("key1")).assertTrue();
      expect(targetMap.get("key2")).assertFalse();
      expect(targetMap.get("key3")).assertTrue();

      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTFOUR_0700
     * @tc.name      testLightWeightMapTest04Chapter0700
     * @tc.desc      Verify setAll with Array type values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest04Chapter0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest04Chapter0700';
      console.log(TAG + 'start');

      const arr1: Array<number> = [1, 2, 3];
      const arr2: Array<number> = [4, 5, 6];
      const arr3: Array<number> = [7, 8, 9];
      const sourceMap = new LightWeightMap<string, Array<number>>();
      sourceMap.set("arr1", arr1);
      sourceMap.set("arr2", arr2);
      sourceMap.set("arr3", arr3);

      const targetMap = new LightWeightMap<string, Array<number>>();
      targetMap.setAll(sourceMap);

      const getArr1: Array<number> | undefined = targetMap.get("arr1");
      expect(getArr1 !== undefined).assertTrue();
      expect(getArr1!.length).assertEqual(3);
      expect(getArr1![0]).assertEqual(1);
      expect(getArr1![1]).assertEqual(2);
      expect(getArr1![2]).assertEqual(3);

      const getArr2: Array<number> | undefined = targetMap.get("arr2");
      expect(getArr2 !== undefined).assertTrue();
      expect(getArr2!.length).assertEqual(3);
      expect(getArr2![0]).assertEqual(4);

      const getArr3: Array<number> | undefined = targetMap.get("arr3");
      expect(getArr3 !== undefined).assertTrue();
      expect(getArr3!.length).assertEqual(3);
      expect(getArr3![0]).assertEqual(7);

      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTFOUR_0800
     * @tc.name      testLightWeightMapTest04Chapter0800
     * @tc.desc      Verify setAll with nested Array type values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest04Chapter0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest04Chapter0800';
      console.log(TAG + 'start');

      const sourceMap = new LightWeightMap<string, Array<Array<number>>>();
      sourceMap.set("matrix1", [[1, 2], [3, 4]]);
      sourceMap.set("matrix2", [[5, 6], [7, 8]]);

      const targetMap = new LightWeightMap<string, Array<Array<number>>>();
      targetMap.setAll(sourceMap);

      const matrix1 = targetMap.get("matrix1")!;
      expect(matrix1.length).assertEqual(2);
      expect(matrix1[0][0]).assertEqual(1);
      expect(matrix1[0][1]).assertEqual(2);
      expect(matrix1[1][0]).assertEqual(3);
      expect(matrix1[1][1]).assertEqual(4);
      const matrix2 = targetMap.get("matrix2")!;
      expect(matrix2.length).assertEqual(2);
      expect(matrix2[0][0]).assertEqual(5);
      expect(matrix2[0][1]).assertEqual(6);
      expect(matrix2[1][0]).assertEqual(7);
      expect(matrix2[1][1]).assertEqual(8);

      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTFOUR_0900
     * @tc.name      testLightWeightMapTest04Chapter0900
     * @tc.desc      Verify setAll with Object type keys and values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest04Chapter0900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest04Chapter0900';
      console.log(TAG + 'start');

      const key1: keyobject= { id: 1, name: 'key1' };
      const key2: keyobject= { id: 2, name: 'key2' };
      const key3: keyobject= { id: 3, name: 'key3' };
      const value1: valueobject = { type: "A", score: 100 };
      const value2: valueobject = { type: "B", score: 200 };
      const value3: valueobject = { type: "C", score: 300 };

      const sourceMap = new LightWeightMap<object, object>();
      sourceMap.set(key1, value1);
      sourceMap.set(key2, value2);
      sourceMap.set(key3, value3);

      const targetMap = new LightWeightMap<object, object>();
      targetMap.setAll(sourceMap);

      expect(targetMap.get(key1)).assertDeepEquals(value1);
      expect(targetMap.get(key2)).assertDeepEquals(value2);
      expect(targetMap.get(key3)).assertDeepEquals(value3);

      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTFOUR_1000
     * @tc.name      testLightWeightMapTest04Chapter1000
     * @tc.desc      Verify setAll with nested Object type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest04Chapter1000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest04Chapter1000';
      console.log(TAG + 'start');

      const key1: keyobject= { id: 1, name: 'key1' };
      const key2: keyobject= { id: 2, name: 'key2' };
      const value1: valueobject = { type: "A", score: 100 };
      const value2: valueobject = { type: "B", score: 200 };

      const sourceMap = new LightWeightMap<object, object>();
      sourceMap.set(key1, value1);
      sourceMap.set(key2, value2);

      const targetMap = new LightWeightMap<object, object>();
      targetMap.setAll(sourceMap);

      expect(targetMap.get(key1)).assertDeepEquals(value1);
      expect(targetMap.get(key2)).assertDeepEquals(value2);

      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTFOUR_1100
     * @tc.name      testLightWeightMapTest04Chapter1100
     * @tc.desc      Verify setAll with Class type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest04Chapter1100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest04Chapter1100';
      console.log(TAG + 'start');

      const instance1 = new TestClass(1, "first");
      const instance2 = new TestClass(2, "second");
      const instance3 = new TestClass(3, "third");

      const value1: valueobject = { type: "A", score: 100 };
      const value2: valueobject = { type: "B", score: 200 };
      const value3: valueobject = { type: "C", score: 300 };

      const sourceMap = new LightWeightMap<TestClass, object>();
      sourceMap.set(instance1, value1);
      sourceMap.set(instance2, value2);
      sourceMap.set(instance3, value3);

      const targetMap = new LightWeightMap<TestClass, object>();
      targetMap.setAll(sourceMap);

      expect(targetMap.get(instance1)).assertDeepEquals(value1);
      expect(targetMap.get(instance2)).assertDeepEquals(value2);
      expect(targetMap.get(instance3)).assertDeepEquals(value3);

      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTFOUR_1200
     * @tc.name      testLightWeightMapTest04Chapter1200
     * @tc.desc      Verify setAll with TypedArray type (Int8Array)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest04Chapter1200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest04Chapter1200';
      console.log(TAG + 'start');

      const key1 = new Int8Array([1, 2, 3]);
      const key2 = new Int8Array([4, 5, 6]);
      const key3 = new Int8Array([7, 8, 9]);

      const sourceMap = new LightWeightMap<Int8Array, string>();
      sourceMap.set(key1, "array1");
      sourceMap.set(key2, "array2");
      sourceMap.set(key3, "array3");

      const targetMap = new LightWeightMap<Int8Array, string>();
      targetMap.setAll(sourceMap);

      expect(targetMap.get(key1)).assertEqual("array1");
      expect(targetMap.get(key2)).assertEqual("array2");
      expect(targetMap.get(key3)).assertEqual("array3");

      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTFOUR_1300
     * @tc.name      testLightWeightMapTest04Chapter1300
     * @tc.desc      Verify setAll with TypedArray special values (Float64Array)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest04Chapter1300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest04Chapter1300';
      console.log(TAG + 'start');

      const key1 = new Float64Array([NaN, Infinity, -Infinity]);
      const key2 = new Float64Array([0, -0, Number.MAX_VALUE]);
      const key3 = new Float64Array([Number.MIN_VALUE, 1.5, 2.5]);

      const sourceMap = new LightWeightMap<Float64Array, string>();
      sourceMap.set(key1, "special values");
      sourceMap.set(key2, "boundary values");
      sourceMap.set(key3, "normal values");

      const targetMap = new LightWeightMap<Float64Array, string>();
      targetMap.setAll(sourceMap);

      expect(targetMap.get(key1)).assertEqual("special values");
      expect(targetMap.get(key2)).assertEqual("boundary values");
      expect(targetMap.get(key3)).assertEqual("normal values");

      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTFOUR_1400
     * @tc.name      testLightWeightMapTest04Chapter1400
     * @tc.desc      Verify setAll with boolean types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest04Chapter1400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest04Chapter1400';
      console.log(TAG + 'start');
      const sourceMap = new LightWeightMap<boolean, boolean>();
      sourceMap.set(true, false);
      const targetMap = new LightWeightMap<boolean, boolean>();
      targetMap.setAll(sourceMap);
      expect(targetMap.get(true)).assertFalse();
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTFOUR_1500
     * @tc.name      testLightWeightMapTest04Chapter1500
     * @tc.desc      Verify setAll overwrites existing keys
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest04Chapter1500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest04Chapter1500';
      console.log(TAG + 'start');

      const sourceMap = new LightWeightMap<string, number>();
      sourceMap.set("key1", 100);
      sourceMap.set("key2", 200);
      sourceMap.set("key3", 300);

      const targetMap = new LightWeightMap<string, number>();
      targetMap.set("key1", 50);
      targetMap.set("key4", 400);

      targetMap.setAll(sourceMap);

      expect(targetMap.get("key1")).assertEqual(100);
      expect(targetMap.get("key2")).assertEqual(200);
      expect(targetMap.get("key3")).assertEqual(300);
      expect(targetMap.get("key4")).assertEqual(400);

      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTFOUR_1600
     * @tc.name      testLightWeightMapTest04Chapter1600
     * @tc.desc      Verify setAll with empty source map
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest04Chapter1600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest04Chapter1600';
      console.log(TAG + 'start');

      const sourceMap = new LightWeightMap<string, number>();

      const targetMap = new LightWeightMap<string, number>();
      targetMap.set("key1", 100);
      targetMap.set("key2", 200);

      targetMap.setAll(sourceMap);

      expect(targetMap.get("key1")).assertEqual(100);
      expect(targetMap.get("key2")).assertEqual(200);

      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTFOUR_1700
     * @tc.name      testLightWeightMapTest04Chapter1700
     * @tc.desc      Test setAll method cannot be bound (error 10200011)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest04Chapter1700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest04Chapter1700';
      console.log(TAG + 'start');
      const targetMap = new LightWeightMap<boolean, number>();
      targetMap.set(true, 1);
      const emptyMap: LightWeightMap<boolean, number> = new LightWeightMap<boolean, number>();
      targetMap.setAll(emptyMap);
      expect(targetMap.length).assertEqual(1);
      expect(targetMap.get(true)).assertEqual(1);
      console.log(TAG + "end");

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTFOUR_1800
     * @tc.name      testLightWeightMapTest04Chapter1800
     * @tc.desc      Test setAll method with empty source map
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest04Chapter1800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest04Chapter1800';
      console.log(TAG + 'start');
      const sourceMap = new LightWeightMap<boolean, number>();

      const targetMap = new LightWeightMap<boolean, number>();
      targetMap.set(true, 100);
      targetMap.set(false, 200);

      targetMap.setAll(sourceMap);

      expect(targetMap.get(true)).assertEqual(100);
      expect(targetMap.get(false)).assertEqual(200);

      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTFOUR_1900
     * @tc.name      testLightWeightMapTest04Chapter1900
     * @tc.desc      Verify setAll with large number of elements
     * @tc.size      LargeTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest04Chapter1900", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest04Chapter1900';
      console.log(TAG + 'start');

      const sourceMap = new LightWeightMap<number, string>();
      const targetMap = new LightWeightMap<number, string>();

      for (let i: int = 0; i < 100; i++) {
        sourceMap.set(i, `value${i}`);
      }

      for (let i: int = 100; i < 150; i++) {
        targetMap.set(i, `original${i}`);
      }

      targetMap.setAll(sourceMap);

      for (let i: int = 0; i < 100; i++) {
        expect(targetMap.get(i)).assertEqual(`value${i}`);
      }

      for (let i: int = 100; i < 150; i++) {
        expect(targetMap.get(i)).assertEqual(`original${i}`);
      }

      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTFOUR_2000
     * @tc.name      testLightWeightMapTest04Chapter2000
     * @tc.desc      Verify setAll with self (same map)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest04Chapter2000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest04Chapter2000';
      console.log(TAG + 'start');

      const map = new LightWeightMap<string, number>();
      map.set("key1", 100);
      map.set("key2", 200);
      map.set("key3", 300);

      map.setAll(map);

      expect(map.get("key1")).assertEqual(100);
      expect(map.get("key2")).assertEqual(200);
      expect(map.get("key3")).assertEqual(300);

      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTFOUR_2100
     * @tc.name      testLightWeightMapTest04Chapter2100
     * @tc.desc      Check whether the LightWeightMap works normally after adding data
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest04Chapter2100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest04Chapter2100';
      console.log(TAG + 'start');
      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set('key',100);
      expect(lightWeightMap.length).assertEqual(1);
      console.log(TAG + 'end');

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTFOUR_2200
     * @tc.name      testLightWeightMapTest04Chapter2200
     * @tc.desc      Check whether the LightWeightMap works normally after adding data
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest04Chapter2200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest04Chapter2200';
      console.log(TAG + 'start');
      const lightWeightMap = new LightWeightMap<string, string>();
      lightWeightMap.set('key','kind');
      expect(lightWeightMap.length).assertEqual(1);
      console.log(TAG + 'end');

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTFOUR_2300
     * @tc.name      testLightWeightMapTest04Chapter2300
     * @tc.desc      Check whether the LightWeightMap works normally after adding data
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest04Chapter2300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest04Chapter2300';
      console.log(TAG + 'start');
      const arr:Uint8Array = new Uint8Array([1,2,3,4,5]);
      const lightWeightMap = new LightWeightMap<Uint8Array, number>();
      lightWeightMap.set(arr,100);
      expect(lightWeightMap.length).assertEqual(1);
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTFOUR_2400
     * @tc.name      testLightWeightMapTest04Chapter2400
     * @tc.desc      Check whether the LightWeightMap works normally after adding data
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest04Chapter2400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest04Chapter2400';
      console.log(TAG + 'start');
      const lightWeightMap = new LightWeightMap<number, number>();
      lightWeightMap.set(50,100);
      expect(lightWeightMap.length).assertEqual(1);
      console.log(TAG + 'end');

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTFOUR_2500
     * @tc.name      testLightWeightMapTest04Chapter2500
     * @tc.desc      Check whether the LightWeightMap works normally after adding data
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest04Chapter2500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest04Chapter2500';
      console.log(TAG + 'start');
      const instance = new TestClass(1, "test");
      const lightWeightMap = new LightWeightMap<TestClass, number>();
      lightWeightMap.set(instance, 100);
      expect(lightWeightMap.length).assertEqual(1);
      console.log(TAG + 'end');

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTFOUR_2600
     * @tc.name      testLightWeightMapTest04Chapter2600
     * @tc.desc      Check whether the LightWeightMap works normally after adding data
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest04Chapter2600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest04Chapter2600';
      console.log(TAG + 'start');
      const lightWeightMap = new LightWeightMap<Int8Array, Int8Array>();
      const key_1 = new Int8Array([-128]);
      const value_1 = new Int8Array([127]);
      lightWeightMap.set(key_1,value_1);
      expect(lightWeightMap.length).assertEqual(1);
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTFOUR_2700
     * @tc.name      testLightWeightMapTest04Chapter2700
     * @tc.desc      Check whether the LightWeightMap works normally after adding data
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest04Chapter2700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest04Chapter2700';
      console.log(TAG + 'start');
      const lightWeightMap = new LightWeightMap<Int8Array, Int8Array>();
      const key_1 = new Int8Array([-129]);
      const value_1 = new Int8Array([128]);
      lightWeightMap.set(key_1,value_1);
      expect(lightWeightMap.length).assertEqual(1);
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTFOUR_2800
     * @tc.name      testLightWeightMapTest04Chapter2800
     * @tc.desc      Check whether the LightWeightMap works normally after adding data
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest04Chapter2800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest04Chapter2800';
      console.log(TAG + 'start');
      const lightWeightMap = new LightWeightMap<Uint8Array, Uint8Array>();
      const key_1 = new Uint8Array([0]);
      const value_1 = new Uint8Array([255]);
      lightWeightMap.set(key_1,value_1);
      expect(lightWeightMap.length).assertEqual(1);
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTFOUR_2900
     * @tc.name      testLightWeightMapTest04Chapter2900
     * @tc.desc      Check whether the LightWeightMap works normally after adding data
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest04Chapter2900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest04Chapter2900';
      console.log(TAG + 'start');
      const lightWeightMap = new LightWeightMap<Uint8Array, Uint8Array>();
      const key_1 = new Uint8Array([-1]);
      const value_1 = new Uint8Array([256]);
      lightWeightMap.set(key_1,value_1);
      expect(lightWeightMap.length).assertEqual(1);
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTFOUR_3000
     * @tc.name      testLightWeightMapTest04Chapter3000
     * @tc.desc      Check whether the LightWeightMap works normally after adding data
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest04Chapter3000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest04Chapter3000';
      console.log(TAG + 'start');
      const lightWeightMap = new LightWeightMap<Uint8ClampedArray, Uint8ClampedArray>();
      const key_1 = new Uint8ClampedArray([0]);
      const value_1 = new Uint8ClampedArray([255]);
      lightWeightMap.set(key_1,value_1);
      expect(lightWeightMap.length).assertEqual(1);
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTFOUR_3100
     * @tc.name      testLightWeightMapTest04Chapter3100
     * @tc.desc      Check whether the LightWeightMap works normally after adding data
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest04Chapter3100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest04Chapter3100';
      console.log(TAG + 'start');
      const lightWeightMap = new LightWeightMap<Uint8ClampedArray, Uint8ClampedArray>();
      const key_1 = new Uint8ClampedArray([-1]);
      const value_1 = new Uint8ClampedArray([256]);
      lightWeightMap.set(key_1,value_1);
      expect(lightWeightMap.length).assertEqual(1);
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTFOUR_3200
     * @tc.name      testLightWeightMapTest04Chapter3200
     * @tc.desc      Check whether the LightWeightMap works normally after adding data
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest04Chapter3200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest04Chapter3200';
      console.log(TAG + 'start');
      const lightWeightMap = new LightWeightMap<Int16Array, Int16Array>();
      const key_1 = new Int16Array([-32768]);
      const value_1 = new Int16Array([32767]);
      lightWeightMap.set(key_1,value_1);
      expect(lightWeightMap.length).assertEqual(1);
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTFOUR_3300
     * @tc.name      testLightWeightMapTest04Chapter3300
     * @tc.desc      Check whether the LightWeightMap works normally after adding data
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest04Chapter3300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest04Chapter3300';
      console.log(TAG + 'start');
      const lightWeightMap = new LightWeightMap<Int16Array, Int16Array>();
      const key_1 = new Int16Array([-32769]);
      const value_1 = new Int16Array([32768]);
      lightWeightMap.set(key_1,value_1);
      expect(lightWeightMap.length).assertEqual(1);
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTFOUR_3400
     * @tc.name      testLightWeightMapTest04Chapter3400
     * @tc.desc      Check whether the LightWeightMap works normally after adding data
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest04Chapter3400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest04Chapter3400';
      console.log(TAG + 'start');
      const lightWeightMap = new LightWeightMap<Uint16Array, Uint16Array>();
      const key_1 = new Uint16Array([0]);
      const value_1 = new Uint16Array([65535]);
      lightWeightMap.set(key_1,value_1);
      expect(lightWeightMap.length).assertEqual(1);
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTFOUR_3500
     * @tc.name      testLightWeightMapTest04Chapter3500
     * @tc.desc      Check whether the LightWeightMap works normally after adding data
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest04Chapter3500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest04Chapter3500';
      console.log(TAG + 'start');
      const lightWeightMap = new LightWeightMap<Uint16Array, Uint16Array>();
      const key_1 = new Uint16Array([-1]);
      const value_1 = new Uint16Array([65536]);
      lightWeightMap.set(key_1,value_1);
      expect(lightWeightMap.length).assertEqual(1);
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTFOUR_3600
     * @tc.name      testLightWeightMapTest04Chapter3600
     * @tc.desc      Check whether the LightWeightMap works normally after adding data
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest04Chapter3600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest04Chapter3600';
      console.log(TAG + 'start');
      const lightWeightMap = new LightWeightMap<Int32Array, Int32Array>();
      const key_1 = new Int32Array([-2147483648]);
      const value_1 = new Int32Array([2147483647]);
      lightWeightMap.set(key_1,value_1);
      expect(lightWeightMap.length).assertEqual(1);
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTFOUR_3700
     * @tc.name      testLightWeightMapTest04Chapter3700
     * @tc.desc      Check whether the LightWeightMap works normally after adding data
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest04Chapter3700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest04Chapter3700';
      console.log(TAG + 'start');
      const lightWeightMap = new LightWeightMap<Int32Array, Int32Array>();
      const key_1 = new Int32Array([-2147483649]);
      const value_1 = new Int32Array([2147483648]);
      lightWeightMap.set(key_1,value_1);
      expect(lightWeightMap.length).assertEqual(1);
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTFOUR_3800
     * @tc.name      testLightWeightMapTest04Chapter3800
     * @tc.desc      Check whether the LightWeightMap works normally after adding data
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest04Chapter3800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest04Chapter3800';
      console.log(TAG + 'start');
      const lightWeightMap = new LightWeightMap<Uint32Array, Uint32Array>();
      const key_1 = new Uint32Array([0]);
      const value_1 = new Uint32Array([4294967295]);
      lightWeightMap.set(key_1,value_1);
      expect(lightWeightMap.length).assertEqual(1);
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTFOUR_3900
     * @tc.name      testLightWeightMapTest04Chapter3900
     * @tc.desc      Check whether the LightWeightMap works normally after adding data
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest04Chapter3900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest04Chapter3900';
      console.log(TAG + 'start');
      const lightWeightMap = new LightWeightMap<Uint8Array, boolean>();
      const arr:Uint8Array = new Uint8Array([72,101,108]);
      lightWeightMap.set(arr,true);
      expect(lightWeightMap.length).assertEqual(1);
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTFOUR_4000
     * @tc.name      testLightWeightMapTest04Chapter4000
     * @tc.desc      Check whether the LightWeightMap works normally after adding data
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest04Chapter4000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest04Chapter4000';
      console.log(TAG + 'start');
      const Obj : MyObj040 = {a:1,b:"test",c:[1,2,3]};
      const lightWeightMap = new LightWeightMap<Object, boolean>();
      lightWeightMap.set(Obj,false);
      expect(lightWeightMap.length).assertEqual(1);
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTFOUR_4100
     * @tc.name      testLightWeightMapTest04Chapter4100
     * @tc.desc      Check whether the LightWeightMap works normally after adding data
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest04Chapter4100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest04Chapter4100';
      console.log(TAG + 'start');
      const Obj : MyObj041 = {view: new DataView(new ArrayBuffer(16))};
      const lightWeightMap = new LightWeightMap<string,Object>();
      lightWeightMap.set('\n',Obj);
      expect(lightWeightMap.length).assertEqual(1);
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTFOUR_4200
     * @tc.name      testLightWeightMapTest04Chapter4200
     * @tc.desc      Check whether the LightWeightMap works normally after adding data
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest04Chapter4200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest04Chapter4200';
      console.log(TAG + 'start');
      const lightWeightMap = new LightWeightMap<Float32Array | undefined, string | null>();
      lightWeightMap.set(undefined,null);
      expect(lightWeightMap.length).assertEqual(1);
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTFOUR_4300
     * @tc.name      testLightWeightMapTest04Chapter4300
     * @tc.desc      Remove with basic string key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest04Chapter4300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest04Chapter4300';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set('key1', 100);
      lightWeightMap.remove('key1');
      expect(lightWeightMap.length).assertEqual(0);

      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTFOUR_4400
     * @tc.name      testLightWeightMapTest04Chapter4400
     * @tc.desc      Remove with empty string key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest04Chapter4400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest04Chapter4400';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set('', 100);
      lightWeightMap.remove('');
      expect(lightWeightMap.isEmpty()).assertTrue();

      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTFOUR_4500
     * @tc.name      testLightWeightMapTest04Chapter4500
     * @tc.desc      Remove with special characters string key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest04Chapter4500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest04Chapter4500';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set('!@#$%^&*()', 100);
      lightWeightMap.remove('!@#$%^&*()');
      expect(lightWeightMap.length).assertEqual(0);

      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTFOUR_4600
     * @tc.name      testLightWeightMapTest04Chapter4600
     * @tc.desc      Remove with number key 0
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest04Chapter4600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest04Chapter4600';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<number, string>();
      lightWeightMap.set(0, 'zero');
      lightWeightMap.remove(0);
      expect(lightWeightMap.isEmpty()).assertTrue();

      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTFOUR_4700
     * @tc.name      testLightWeightMapTest04Chapter4700
     * @tc.desc      Remove with Number.MAX_VALUE key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest04Chapter4700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest04Chapter4700';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<number, string>();
      lightWeightMap.set(Number.MAX_VALUE, 'max');
      lightWeightMap.remove(Number.MAX_VALUE);
      expect(lightWeightMap.length).assertEqual(0);

      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTFOUR_4800
     * @tc.name      testLightWeightMapTest04Chapter4800
     * @tc.desc      Remove with Infinity key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest04Chapter4800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest04Chapter4800';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<number, string>();
      lightWeightMap.set(Infinity, 'inf');
      lightWeightMap.remove(Infinity);
      expect(lightWeightMap.length).assertEqual(0);

      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTFOUR_4900
     * @tc.name      testLightWeightMapTest04Chapter4900
     * @tc.desc      Remove with NaN key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest04Chapter4900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest04Chapter4900';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<number, string>();
      lightWeightMap.set(999, 'special');
      lightWeightMap.remove(999);
      expect(lightWeightMap.length).assertEqual(0);

      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTFOUR_5000
     * @tc.name      testLightWeightMapTest04Chapter5000
     * @tc.desc      Remove with boolean true key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest04Chapter5000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest04Chapter5000';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<boolean, string>();
      lightWeightMap.set(true, 'true_val');
      lightWeightMap.remove(true);
      expect(lightWeightMap.isEmpty()).assertTrue();

      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTFOUR_5100
     * @tc.name      testLightWeightMapTest04Chapter5100
     * @tc.desc      Remove with boolean false key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest04Chapter5100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest04Chapter5100';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<boolean, string>();
      lightWeightMap.set(false, 'false_val');
      lightWeightMap.remove(false);
      expect(lightWeightMap.length).assertEqual(0);

      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTFOUR_5200
     * @tc.name      testLightWeightMapTest04Chapter5200
     * @tc.desc      Remove with number array key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest04Chapter5200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest04Chapter5200';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<Array<number>, string>();
      const key: Array<number> = [1, 2, 3];
      lightWeightMap.set(key, 'arr');
      lightWeightMap.remove(key);
      expect(lightWeightMap.isEmpty()).assertTrue();

      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTFOUR_5300
     * @tc.name      testLightWeightMapTest04Chapter5300
     * @tc.desc      Remove with nested array key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest04Chapter5300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest04Chapter5300';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<Array<Array<number>>, string>();
      const key: Array<Array<number>> = [[1, 2], [3, 4]];
      lightWeightMap.set(key, 'nested_arr');
      lightWeightMap.remove(key);
      expect(lightWeightMap.length).assertEqual(0);

      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTFOUR_5400
     * @tc.name      testLightWeightMapTest04Chapter5400
     * @tc.desc      Remove with simple object key (Object type)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest04Chapter5400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest04Chapter5400';
      console.log(TAG + 'start');

      const obj: MyObj054 = { a: 1, b: 'x' };
      const lightWeightMap = new LightWeightMap<Object, string>();
      lightWeightMap.set(obj, 'obj');
      lightWeightMap.remove(obj);
      expect(lightWeightMap.isEmpty()).assertTrue();

      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTFOUR_5500
     * @tc.name      testLightWeightMapTest04Chapter5500
     * @tc.desc      Remove with string key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest04Chapter5500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest04Chapter5500';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string,boolean>();
      lightWeightMap.set('false_val', true);
      lightWeightMap.remove('false_val');
      expect(lightWeightMap.length).assertEqual(0);

      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTFOUR_5600
     * @tc.name      testLightWeightMapTest04Chapter5600
     * @tc.desc      Remove with Int8Array key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest04Chapter5600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest04Chapter5600';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<Int8Array, string>();
      const key = new Int8Array([-128, 0, 127]);
      lightWeightMap.set(key, 'int8');
      lightWeightMap.remove(key);
      expect(lightWeightMap.length).assertEqual(0);

      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTFOUR_5700
     * @tc.name      testLightWeightMapTest04Chapter5700
     * @tc.desc      Remove with Uint8Array key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest04Chapter5700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest04Chapter5700';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<Uint8Array, string>();
      const key = new Uint8Array([0, 127, 255]);
      lightWeightMap.set(key, 'uint8');
      lightWeightMap.remove(key);
      expect(lightWeightMap.isEmpty()).assertTrue();

      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTFOUR_5800
     * @tc.name      testLightWeightMapTest04Chapter5800
     * @tc.desc      Remove with Float32Array key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest04Chapter5800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest04Chapter5800';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<Float32Array, string>();
      const key = new Float32Array([1.23, -4.56, 7.89]);
      lightWeightMap.set(key, 'float32');
      lightWeightMap.remove(key);
      expect(lightWeightMap.length).assertEqual(0);

      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTFOUR_5900
     * @tc.name      testLightWeightMapTest04Chapter5900
     * @tc.desc      Remove with class instance key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest04Chapter5900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest04Chapter5900';
      console.log(TAG + 'start');
      const lightWeightMap = new LightWeightMap<TestClass, string>();
      const instance = new TestClass(42, "testInstance");
      lightWeightMap.set(instance, 'cls');
      lightWeightMap.remove(instance);
      expect(lightWeightMap.isEmpty()).assertTrue();

      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTFOUR_6000
     * @tc.name      testLightWeightMapTest04Chapter6000
     * @tc.desc      Remove with non-existent key should not change size
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest04Chapter6000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest04Chapter6000';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set('key1', 1);
      lightWeightMap.set('key2', 2);
      lightWeightMap.remove('no_key');
      expect(lightWeightMap.length).assertEqual(2);

      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTFOUR_6100
     * @tc.name      testLightWeightMapTest04Chapter6100
     * @tc.desc      Remove after setting same key multiple times
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest04Chapter6100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest04Chapter6100';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set('dup', 1);
      lightWeightMap.set('dup', 2);
      lightWeightMap.remove('dup');
      expect(lightWeightMap.length).assertEqual(0);

      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTFOUR_6200
     * @tc.name      testLightWeightMapTest04Chapter6200
     * @tc.desc      Remove with float min value key (1.401298e-45)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest04Chapter6200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest04Chapter6200';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<number, string>();
      const floatMin = 1.40129846432481707e-45;
      lightWeightMap.set(floatMin, 'float_min');
      lightWeightMap.remove(floatMin);
      expect(lightWeightMap.length).assertEqual(0);

      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTFOUR_6300
     * @tc.name      testLightWeightMapTest04Chapter6300
     * @tc.desc      Remove with float max value key (3.402823e+38)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest04Chapter6300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest04Chapter6300';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<number, string>();
      const floatMax = 3.40282346638528860e+38;
      lightWeightMap.set(floatMax, 'float_max');
      lightWeightMap.remove(floatMax);
      expect(lightWeightMap.isEmpty()).assertTrue();

      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTFOUR_6400
     * @tc.name      testLightWeightMapTest04Chapter6400
     * @tc.desc      Remove with double min value key (4.940656e-324)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest04Chapter6400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest04Chapter6400';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<number, string>();
      const doubleMin = 4.94065645841246544e-324;
      lightWeightMap.set(doubleMin, 'double_min');
      lightWeightMap.remove(doubleMin);
      expect(lightWeightMap.length).assertEqual(0);

      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTFOUR_6500
     * @tc.name      testLightWeightMapTest04Chapter6500
     * @tc.desc      Remove with double max value key (1.797693e+308)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest04Chapter6500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest04Chapter6500';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<number, string>();
      const doubleMax = 1.79769313486231570e+308;
      lightWeightMap.set(doubleMax, 'double_max');
      lightWeightMap.remove(doubleMax);
      expect(lightWeightMap.isEmpty()).assertTrue();

      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTFOUR_6600
     * @tc.name      testLightWeightMapTest04Chapter6600
     * @tc.desc      Remove with char min value key (0)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest04Chapter6600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest04Chapter6600';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<number, string>();
      const charMin: int = 0;
      lightWeightMap.set(charMin, 'char_min');
      lightWeightMap.remove(charMin);
      expect(lightWeightMap.length).assertEqual(0);

      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTFOUR_6700
     * @tc.name      testLightWeightMapTest04Chapter6700
     * @tc.desc      Remove with char max value key (65535)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest04Chapter6700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest04Chapter6700';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<number, string>();
      const charMax: int = 65535;
      lightWeightMap.set(charMax, 'char_max');
      lightWeightMap.remove(charMax);
      expect(lightWeightMap.isEmpty()).assertTrue();

      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTFOUR_6800
     * @tc.name      testLightWeightMapTest04Chapter6800
     * @tc.desc      Remove with BigInt value converted to number as key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest04Chapter6800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest04Chapter6800';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<number, string>();
      const key = 0xdecafafecafede;
      lightWeightMap.set(key, 'bigint_key');
      lightWeightMap.remove(key);
      expect(lightWeightMap.length).assertEqual(0);

      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTFOUR_6900
     * @tc.name      testLightWeightMapTest04Chapter6900
     * @tc.desc      Remove with hexadecimal key 0x0102
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest04Chapter6900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest04Chapter6900';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<number, string>();
      const key: int = 0x0102;
      lightWeightMap.set(key, 'hex_0102');
      lightWeightMap.remove(key);
      expect(lightWeightMap.isEmpty()).assertTrue();

      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTFOUR_7000
     * @tc.name      testLightWeightMapTest04Chapter7000
     * @tc.desc      Remove with hexadecimal key 0x01020304
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest04Chapter7000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest04Chapter7000';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<number, string>();
      const key: int = 0x01020304;
      lightWeightMap.set(key, 'hex_32');
      lightWeightMap.remove(key);
      expect(lightWeightMap.length).assertEqual(0);

      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTFOUR_7100
     * @tc.name      testLightWeightMapTest04Chapter7100
     * @tc.desc      Remove with small hex key 0x3 (对应 8 进制�?
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest04Chapter7100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest04Chapter7100';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<number, string>();
      const key: int = 0x3;
      lightWeightMap.set(key, 'hex_3');
      lightWeightMap.remove(key);
      expect(lightWeightMap.isEmpty()).assertTrue();

      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTFOUR_7200
     * @tc.name      testLightWeightMapTest04Chapter7200
     * @tc.desc      Remove with exponent key 2 ** 3
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest04Chapter7200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest04Chapter7200';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<number, string>();
      const key: int = 8;
      lightWeightMap.set(key, 'exp_2_3');
      lightWeightMap.remove(key);
      expect(lightWeightMap.length).assertEqual(0);

      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTFOUR_7300
     * @tc.name      testLightWeightMapTest04Chapter7300
     * @tc.desc      Remove with scientific notation key 1e3
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest04Chapter7300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest04Chapter7300';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<number, string>();
      const key = 1e3; // 1000
      lightWeightMap.set(key, 'sci_1e3');
      lightWeightMap.remove(key);
      expect(lightWeightMap.isEmpty()).assertTrue();

      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTFOUR_7400
     * @tc.name      testLightWeightMapTest04Chapter7400
     * @tc.desc      Remove with scientific notation key 2.5e-2
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest04Chapter7400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest04Chapter7400';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<number, string>();
      const key = 2.5e-2; // 0.025
      lightWeightMap.set(key, 'sci_2_5e-2');
      lightWeightMap.remove(key);
      expect(lightWeightMap.length).assertEqual(0);

      console.log(TAG + 'end');
    });


  });
}