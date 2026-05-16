import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
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

function sleep(ms: number) {
  return new Promise<void>((resolve, reject) => setTimeout(resolve, ms));
}

export default function testLightWeightMapTest04() {
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
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST04_0001
     * @tc.name      testLightWeightMapTest04Chapter0001
     * @tc.desc      Verify setAll with String type keys and values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest04Chapter0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest04Chapter0001';
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
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST04_0002
     * @tc.name      testLightWeightMapTest04Chapter0002
     * @tc.desc      Verify setAll with String type containing special characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest04Chapter0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest04Chapter0002';
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
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST04_0003
     * @tc.name      testLightWeightMapTest04Chapter0003
     * @tc.desc      Verify setAll with Number type keys and values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest04Chapter0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest04Chapter0003';
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
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST04_0004
     * @tc.name      testLightWeightMapTest04Chapter0004
     * @tc.desc      Verify setAll with Number type special values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest04Chapter0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest04Chapter0004';
      console.log(TAG + 'start');

      const sourceMap = new LightWeightMap<number, number>();
      sourceMap.set(Number.MAX_SAFE_INTEGER, 1);
      sourceMap.set(Number.MIN_SAFE_INTEGER, 2);
      sourceMap.set(Number.MAX_VALUE, 3);
      sourceMap.set(Number.MIN_VALUE, 4);

      const targetMap = new LightWeightMap<number, number>();
      targetMap.setAll(sourceMap);

      expect(targetMap.get(Number.MAX_SAFE_INTEGER)).assertEqual(1);
      expect(targetMap.get(Number.MIN_SAFE_INTEGER)).assertEqual(2);
      expect(targetMap.get(Number.MAX_VALUE)).assertEqual(3);
      expect(targetMap.get(Number.MIN_VALUE)).assertEqual(4);

      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST04_0005
     * @tc.name      testLightWeightMapTest04Chapter0005
     * @tc.desc      Verify setAll with Boolean type keys and values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest04Chapter0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest04Chapter0005';
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
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST04_0006
     * @tc.name      testLightWeightMapTest04Chapter0006
     * @tc.desc      Verify setAll with Boolean type mixed values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest04Chapter0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest04Chapter0006';
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
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST04_0007
     * @tc.name      testLightWeightMapTest04Chapter0007
     * @tc.desc      Verify setAll with Array type values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest04Chapter0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest04Chapter0007';
      console.log(TAG + 'start');

      const sourceMap = new LightWeightMap<string, Array<number>>();
      sourceMap.set("arr1", [1, 2, 3]);
      sourceMap.set("arr2", [4, 5, 6]);
      sourceMap.set("arr3", [7, 8, 9]);

      const targetMap = new LightWeightMap<string, Array<number>>();
      targetMap.setAll(sourceMap);

      expect(targetMap.get("arr1")).assertDeepEquals([1, 2, 3]);
      expect(targetMap.get("arr2")).assertDeepEquals([4, 5, 6]);
      expect(targetMap.get("arr3")).assertDeepEquals([7, 8, 9]);

      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST04_0008
     * @tc.name      testLightWeightMapTest04Chapter0008
     * @tc.desc      Verify setAll with nested Array type values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest04Chapter0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest04Chapter0008';
      console.log(TAG + 'start');

      const sourceMap = new LightWeightMap<string, Array<Array<number>>>();
      sourceMap.set("matrix1", [[1, 2], [3, 4]]);
      sourceMap.set("matrix2", [[5, 6], [7, 8]]);

      const targetMap = new LightWeightMap<string, Array<Array<number>>>();
      targetMap.setAll(sourceMap);

      expect(targetMap.get("matrix1")).assertDeepEquals([[1, 2], [3, 4]]);
      expect(targetMap.get("matrix2")).assertDeepEquals([[5, 6], [7, 8]]);

      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST04_0009
     * @tc.name      testLightWeightMapTest04Chapter0009
     * @tc.desc      Verify setAll with Object type keys and values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest04Chapter0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest04Chapter0009';
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
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST04_0010
     * @tc.name      testLightWeightMapTest04Chapter0010
     * @tc.desc      Verify setAll with nested Object type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest04Chapter0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest04Chapter0010';
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
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST04_0011
     * @tc.name      testLightWeightMapTest04Chapter0011
     * @tc.desc      Verify setAll with Class type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest04Chapter0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest04Chapter0011';
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
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST04_0012
     * @tc.name      testLightWeightMapTest04Chapter0012
     * @tc.desc      Verify setAll with TypedArray type (Int8Array)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest04Chapter0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest04Chapter0012';
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
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST04_0013
     * @tc.name      testLightWeightMapTest04Chapter0013
     * @tc.desc      Verify setAll with TypedArray special values (Float64Array)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest04Chapter0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest04Chapter0013';
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
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST04_0014
     * @tc.name      testLightWeightMapTest04Chapter0014
     * @tc.desc      Verify setAll with boolean types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest04Chapter0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest04Chapter0014';
      console.log(TAG + 'start');
      const sourceMap = new LightWeightMap<boolean, boolean>();
      sourceMap.set(true, false);
      const targetMap = new LightWeightMap<boolean, boolean>();
      targetMap.setAll(sourceMap);
      expect(targetMap.get(true)).assertFalse();
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST04_0015
     * @tc.name      testLightWeightMapTest04Chapter0015
     * @tc.desc      Verify setAll overwrites existing keys
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest04Chapter0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest04Chapter0015';
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
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST04_0016
     * @tc.name      testLightWeightMapTest04Chapter0016
     * @tc.desc      Verify setAll with empty source map
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest04Chapter0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest04Chapter0016';
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
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST04_0017
     * @tc.name      testLightWeightMapTest04Chapter0017
     * @tc.desc      Test setAll method cannot be bound (error 10200011)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest04Chapter0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest04Chapter0017';
      console.log(TAG + 'start');
      const targetMap = new LightWeightMap<boolean, number>();
      try {
        targetMap.setAll(null);
        expect(true).assertFalse();
      } catch (error) {
        console.log(TAG + ' Caught expected error:', error);
      }
      console.log(TAG + "end");

    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST04_0018
     * @tc.name      testLightWeightMapTest04Chapter0018
     * @tc.desc      Test setAll method with empty source map
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest04Chapter0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest04Chapter0018';
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
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST04_0019
     * @tc.name      testLightWeightMapTest04Chapter0019
     * @tc.desc      Verify setAll with large number of elements
     * @tc.size      LargeTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest04Chapter0019", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest04Chapter0019';
      console.log(TAG + 'start');

      const sourceMap = new LightWeightMap<number, string>();
      const targetMap = new LightWeightMap<number, string>();

      for (let i = 0; i < 100; i++) {
        sourceMap.set(i, `value${i}`);
      }

      for (let i = 100; i < 150; i++) {
        targetMap.set(i, `original${i}`);
      }

      targetMap.setAll(sourceMap);

      for (let i = 0; i < 100; i++) {
        expect(targetMap.get(i)).assertEqual(`value${i}`);
      }

      for (let i = 100; i < 150; i++) {
        expect(targetMap.get(i)).assertEqual(`original${i}`);
      }

      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST04_0020
     * @tc.name      testLightWeightMapTest04Chapter0020
     * @tc.desc      Verify setAll with self (same map)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest04Chapter0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest04Chapter0020';
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
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST04_0021
     * @tc.name      testLightWeightMapTest04Chapter0021
     * @tc.desc      Check whether the LightWeightMap works normally after adding data
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest04Chapter0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest04Chapter0021';
      console.log(TAG + 'start');
      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set('key',100);
      expect(lightWeightMap.length).assertEqual(1);
      console.log(TAG + 'end');

    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST04_0022
     * @tc.name      testLightWeightMapTest04Chapter0022
     * @tc.desc      Check whether the LightWeightMap works normally after adding data
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest04Chapter0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest04Chapter0022';
      console.log(TAG + 'start');
      const lightWeightMap = new LightWeightMap<string, string>();
      lightWeightMap.set('key','kind');
      expect(lightWeightMap.length).assertEqual(1);
      console.log(TAG + 'end');

    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST04_0023
     * @tc.name      testLightWeightMapTest04Chapter0023
     * @tc.desc      Check whether the LightWeightMap works normally after adding data
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest04Chapter0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest04Chapter0023';
      console.log(TAG + 'start');
      const arr:Uint8Array = new Uint8Array([1,2,3,4,5]);
      const lightWeightMap = new LightWeightMap<Uint8Array, number>();
      lightWeightMap.set(arr,100);
      expect(lightWeightMap.length).assertEqual(1);
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST04_0024
     * @tc.name      testLightWeightMapTest04Chapter0024
     * @tc.desc      Check whether the LightWeightMap works normally after adding data
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest04Chapter0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest04Chapter0024';
      console.log(TAG + 'start');
      const lightWeightMap = new LightWeightMap<number, number>();
      lightWeightMap.set(50,100);
      expect(lightWeightMap.length).assertEqual(1);
      console.log(TAG + 'end');

    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST04_0025
     * @tc.name      testLightWeightMapTest04Chapter0025
     * @tc.desc      Check whether the LightWeightMap works normally after adding data
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest04Chapter0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest04Chapter0025';
      console.log(TAG + 'start');
      const instance = new TestClass(1, "test");
      const lightWeightMap = new LightWeightMap<TestClass, number>();
      lightWeightMap.set(instance, 100);
      expect(lightWeightMap.length).assertEqual(1);
      console.log(TAG + 'end');

    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST04_0026
     * @tc.name      testLightWeightMapTest04Chapter0026
     * @tc.desc      Check whether the LightWeightMap works normally after adding data
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest04Chapter0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest04Chapter0026';
      console.log(TAG + 'start');
      const lightWeightMap = new LightWeightMap<Int8Array, Int8Array>();
      const key_1 = new Int8Array([-128]);
      const value_1 = new Int8Array([127]);
      lightWeightMap.set(key_1,value_1);
      expect(lightWeightMap.length).assertEqual(1);
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST04_0027
     * @tc.name      testLightWeightMapTest04Chapter0027
     * @tc.desc      Check whether the LightWeightMap works normally after adding data
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest04Chapter0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest04Chapter0027';
      console.log(TAG + 'start');
      const lightWeightMap = new LightWeightMap<Int8Array, Int8Array>();
      const key_1 = new Int8Array([-129]);
      const value_1 = new Int8Array([128]);
      lightWeightMap.set(key_1,value_1);
      expect(lightWeightMap.length).assertEqual(1);
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST04_0028
     * @tc.name      testLightWeightMapTest04Chapter0028
     * @tc.desc      Check whether the LightWeightMap works normally after adding data
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest04Chapter0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest04Chapter0028';
      console.log(TAG + 'start');
      const lightWeightMap = new LightWeightMap<Uint8Array, Uint8Array>();
      const key_1 = new Uint8Array([0]);
      const value_1 = new Uint8Array([255]);
      lightWeightMap.set(key_1,value_1);
      expect(lightWeightMap.length).assertEqual(1);
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST04_0029
     * @tc.name      testLightWeightMapTest04Chapter0029
     * @tc.desc      Check whether the LightWeightMap works normally after adding data
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest04Chapter0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest04Chapter0029';
      console.log(TAG + 'start');
      const lightWeightMap = new LightWeightMap<Uint8Array, Uint8Array>();
      const key_1 = new Uint8Array([-1]);
      const value_1 = new Uint8Array([256]);
      lightWeightMap.set(key_1,value_1);
      expect(lightWeightMap.length).assertEqual(1);
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST04_0030
     * @tc.name      testLightWeightMapTest04Chapter0030
     * @tc.desc      Check whether the LightWeightMap works normally after adding data
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest04Chapter0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest04Chapter0030';
      console.log(TAG + 'start');
      const lightWeightMap = new LightWeightMap<Uint8ClampedArray, Uint8ClampedArray>();
      const key_1 = new Uint8ClampedArray([0]);
      const value_1 = new Uint8ClampedArray([255]);
      lightWeightMap.set(key_1,value_1);
      expect(lightWeightMap.length).assertEqual(1);
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST04_0031
     * @tc.name      testLightWeightMapTest04Chapter0031
     * @tc.desc      Check whether the LightWeightMap works normally after adding data
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest04Chapter0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest04Chapter0031';
      console.log(TAG + 'start');
      const lightWeightMap = new LightWeightMap<Uint8ClampedArray, Uint8ClampedArray>();
      const key_1 = new Uint8ClampedArray([-1]);
      const value_1 = new Uint8ClampedArray([256]);
      lightWeightMap.set(key_1,value_1);
      expect(lightWeightMap.length).assertEqual(1);
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST04_0032
     * @tc.name      testLightWeightMapTest04Chapter0032
     * @tc.desc      Check whether the LightWeightMap works normally after adding data
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest04Chapter0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest04Chapter0032';
      console.log(TAG + 'start');
      const lightWeightMap = new LightWeightMap<Int16Array, Int16Array>();
      const key_1 = new Int16Array([-32768]);
      const value_1 = new Int16Array([32767]);
      lightWeightMap.set(key_1,value_1);
      expect(lightWeightMap.length).assertEqual(1);
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST04_0033
     * @tc.name      testLightWeightMapTest04Chapter0033
     * @tc.desc      Check whether the LightWeightMap works normally after adding data
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest04Chapter0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest04Chapter0033';
      console.log(TAG + 'start');
      const lightWeightMap = new LightWeightMap<Int16Array, Int16Array>();
      const key_1 = new Int16Array([-32769]);
      const value_1 = new Int16Array([32768]);
      lightWeightMap.set(key_1,value_1);
      expect(lightWeightMap.length).assertEqual(1);
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST04_0034
     * @tc.name      testLightWeightMapTest04Chapter0034
     * @tc.desc      Check whether the LightWeightMap works normally after adding data
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest04Chapter0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest04Chapter0034';
      console.log(TAG + 'start');
      const lightWeightMap = new LightWeightMap<Uint16Array, Uint16Array>();
      const key_1 = new Uint16Array([0]);
      const value_1 = new Uint16Array([65535]);
      lightWeightMap.set(key_1,value_1);
      expect(lightWeightMap.length).assertEqual(1);
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST04_0035
     * @tc.name      testLightWeightMapTest04Chapter0035
     * @tc.desc      Check whether the LightWeightMap works normally after adding data
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest04Chapter0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest04Chapter0035';
      console.log(TAG + 'start');
      const lightWeightMap = new LightWeightMap<Uint16Array, Uint16Array>();
      const key_1 = new Uint16Array([-1]);
      const value_1 = new Uint16Array([65536]);
      lightWeightMap.set(key_1,value_1);
      expect(lightWeightMap.length).assertEqual(1);
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST04_0036
     * @tc.name      testLightWeightMapTest04Chapter0036
     * @tc.desc      Check whether the LightWeightMap works normally after adding data
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest04Chapter0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest04Chapter0036';
      console.log(TAG + 'start');
      const lightWeightMap = new LightWeightMap<Int32Array, Int32Array>();
      const key_1 = new Int32Array([-2147483648]);
      const value_1 = new Int32Array([2147483647]);
      lightWeightMap.set(key_1,value_1);
      expect(lightWeightMap.length).assertEqual(1);
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST04_0037
     * @tc.name      testLightWeightMapTest04Chapter0037
     * @tc.desc      Check whether the LightWeightMap works normally after adding data
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest04Chapter0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest04Chapter0037';
      console.log(TAG + 'start');
      const lightWeightMap = new LightWeightMap<Int32Array, Int32Array>();
      const key_1 = new Int32Array([-2147483649]);
      const value_1 = new Int32Array([2147483648]);
      lightWeightMap.set(key_1,value_1);
      expect(lightWeightMap.length).assertEqual(1);
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST04_0038
     * @tc.name      testLightWeightMapTest04Chapter0038
     * @tc.desc      Check whether the LightWeightMap works normally after adding data
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest04Chapter0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest04Chapter0038';
      console.log(TAG + 'start');
      const lightWeightMap = new LightWeightMap<Uint32Array, Uint32Array>();
      const key_1 = new Uint32Array([0]);
      const value_1 = new Uint32Array([4294967295]);
      lightWeightMap.set(key_1,value_1);
      expect(lightWeightMap.length).assertEqual(1);
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST04_0039
     * @tc.name      testLightWeightMapTest04Chapter0039
     * @tc.desc      Check whether the LightWeightMap works normally after adding data
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest04Chapter0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest04Chapter0039';
      console.log(TAG + 'start');
      const lightWeightMap = new LightWeightMap<Uint8Array, boolean>();
      const arr:Uint8Array = new Uint8Array([72,101,108]);
      lightWeightMap.set(arr,true);
      expect(lightWeightMap.length).assertEqual(1);
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST04_0040
     * @tc.name      testLightWeightMapTest04Chapter0040
     * @tc.desc      Check whether the LightWeightMap works normally after adding data
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest04Chapter0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest04Chapter0040';
      console.log(TAG + 'start');
      interface MyObj{
        a:number;
        b:string;
        c:number[];
      }
      const Obj : MyObj = {a:1,b:"test",c:[1,2,3]};
      const lightWeightMap = new LightWeightMap<Object, boolean>();
      lightWeightMap.set(Obj,false);
      expect(lightWeightMap.length).assertEqual(1);
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST04_0041
     * @tc.name      testLightWeightMapTest04Chapter0041
     * @tc.desc      Check whether the LightWeightMap works normally after adding data
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest04Chapter0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest04Chapter0041';
      console.log(TAG + 'start');
      interface MyObj{
        view: DataView;
      }
      const Obj : MyObj = {view: new DataView(new ArrayBuffer(16))};
      const lightWeightMap = new LightWeightMap<string,Object>();
      lightWeightMap.set('\n',Obj);
      expect(lightWeightMap.length).assertEqual(1);
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST04_0042
     * @tc.name      testLightWeightMapTest04Chapter0042
     * @tc.desc      Check whether the LightWeightMap works normally after adding data
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest04Chapter0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest04Chapter0042';
      console.log(TAG + 'start');
      const lightWeightMap = new LightWeightMap<Float32Array,string>();
      lightWeightMap.set(undefined,null);
      expect(lightWeightMap.length).assertEqual(1);
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST04_0043
     * @tc.name      testLightWeightMapTest04Chapter0043
     * @tc.desc      Remove with basic string key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest04Chapter0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest04Chapter0043';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set('key1', 100);
      lightWeightMap.remove('key1');
      expect(lightWeightMap.length).assertEqual(0);

      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST04_0044
     * @tc.name      testLightWeightMapTest04Chapter0044
     * @tc.desc      Remove with empty string key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest04Chapter0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest04Chapter0044';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set('', 100);
      lightWeightMap.remove('');
      expect(lightWeightMap.isEmpty()).assertTrue();

      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST04_0045
     * @tc.name      testLightWeightMapTest04Chapter0045
     * @tc.desc      Remove with special characters string key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest04Chapter0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest04Chapter0045';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set('!@#$%^&*()', 100);
      lightWeightMap.remove('!@#$%^&*()');
      expect(lightWeightMap.length).assertEqual(0);

      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST04_0046
     * @tc.name      testLightWeightMapTest04Chapter0046
     * @tc.desc      Remove with number key 0
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest04Chapter0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest04Chapter0046';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<number, string>();
      lightWeightMap.set(0, 'zero');
      lightWeightMap.remove(0);
      expect(lightWeightMap.isEmpty()).assertTrue();

      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST04_0047
     * @tc.name      testLightWeightMapTest04Chapter0047
     * @tc.desc      Remove with Number.MAX_VALUE key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest04Chapter0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest04Chapter0047';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<number, string>();
      lightWeightMap.set(Number.MAX_VALUE, 'max');
      lightWeightMap.remove(Number.MAX_VALUE);
      expect(lightWeightMap.length).assertEqual(0);

      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST04_0048
     * @tc.name      testLightWeightMapTest04Chapter0048
     * @tc.desc      Remove with Infinity key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest04Chapter0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest04Chapter0048';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<number, string>();
      lightWeightMap.set(Infinity, 'inf');
      lightWeightMap.remove(Infinity);
      expect(lightWeightMap.length).assertEqual(0);

      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST04_0049
     * @tc.name      testLightWeightMapTest04Chapter0049
     * @tc.desc      Remove with NaN key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest04Chapter0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest04Chapter0049';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<number, string>();
      lightWeightMap.set(NaN, 'nan');
      lightWeightMap.remove(NaN);
      expect(lightWeightMap.length).assertEqual(0);

      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST04_0050
     * @tc.name      testLightWeightMapTest04Chapter0050
     * @tc.desc      Remove with boolean true key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest04Chapter0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest04Chapter0050';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<boolean, string>();
      lightWeightMap.set(true, 'true_val');
      lightWeightMap.remove(true);
      expect(lightWeightMap.isEmpty()).assertTrue();

      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST04_0051
     * @tc.name      testLightWeightMapTest04Chapter0051
     * @tc.desc      Remove with boolean false key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest04Chapter0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest04Chapter0051';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<boolean, string>();
      lightWeightMap.set(false, 'false_val');
      lightWeightMap.remove(false);
      expect(lightWeightMap.length).assertEqual(0);

      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST04_0052
     * @tc.name      testLightWeightMapTest04Chapter0052
     * @tc.desc      Remove with number array key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest04Chapter0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest04Chapter0052';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<Array<number>, string>();
      const key: Array<number> = [1, 2, 3];
      lightWeightMap.set(key, 'arr');
      lightWeightMap.remove(key);
      expect(lightWeightMap.isEmpty()).assertTrue();

      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST04_0053
     * @tc.name      testLightWeightMapTest04Chapter0053
     * @tc.desc      Remove with nested array key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest04Chapter0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest04Chapter0053';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<Array<Array<number>>, string>();
      const key: Array<Array<number>> = [[1, 2], [3, 4]];
      lightWeightMap.set(key, 'nested_arr');
      lightWeightMap.remove(key);
      expect(lightWeightMap.length).assertEqual(0);

      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST04_0054
     * @tc.name      testLightWeightMapTest04Chapter0054
     * @tc.desc      Remove with simple object key (Object type)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest04Chapter0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest04Chapter0054';
      console.log(TAG + 'start');

      interface MyObj {
        a: number;
        b: string;
      }
      const obj: MyObj = { a: 1, b: 'x' };
      const lightWeightMap = new LightWeightMap<Object, string>();
      lightWeightMap.set(obj, 'obj');
      lightWeightMap.remove(obj);
      expect(lightWeightMap.isEmpty()).assertTrue();

      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST04_0055
     * @tc.name      testLightWeightMapTest04Chapter0055
     * @tc.desc      Remove with string key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest04Chapter0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest04Chapter0055';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string,boolean>();
      lightWeightMap.set('false_val', true);
      lightWeightMap.remove('false_val');
      expect(lightWeightMap.length).assertEqual(0);

      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST04_0056
     * @tc.name      testLightWeightMapTest04Chapter0056
     * @tc.desc      Remove with Int8Array key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest04Chapter0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest04Chapter0056';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<Int8Array, string>();
      const key = new Int8Array([-128, 0, 127]);
      lightWeightMap.set(key, 'int8');
      lightWeightMap.remove(key);
      expect(lightWeightMap.length).assertEqual(0);

      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST04_0057
     * @tc.name      testLightWeightMapTest04Chapter0057
     * @tc.desc      Remove with Uint8Array key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest04Chapter0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest04Chapter0057';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<Uint8Array, string>();
      const key = new Uint8Array([0, 127, 255]);
      lightWeightMap.set(key, 'uint8');
      lightWeightMap.remove(key);
      expect(lightWeightMap.isEmpty()).assertTrue();

      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST04_0058
     * @tc.name      testLightWeightMapTest04Chapter0058
     * @tc.desc      Remove with Float32Array key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest04Chapter0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest04Chapter0058';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<Float32Array, string>();
      const key = new Float32Array([1.23, -4.56, 7.89]);
      lightWeightMap.set(key, 'float32');
      lightWeightMap.remove(key);
      expect(lightWeightMap.length).assertEqual(0);

      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST04_0059
     * @tc.name      testLightWeightMapTest04Chapter0059
     * @tc.desc      Remove with class instance key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest04Chapter0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest04Chapter0059';
      console.log(TAG + 'start');
      const lightWeightMap = new LightWeightMap<TestClass, string>();
      const instance = new TestClass(42, "testInstance");
      lightWeightMap.set(instance, 'cls');
      lightWeightMap.remove(instance);
      expect(lightWeightMap.isEmpty()).assertTrue();

      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST04_0060
     * @tc.name      testLightWeightMapTest04Chapter0060
     * @tc.desc      Remove with non-existent key should not change size
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest04Chapter0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest04Chapter0060';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set('key1', 1);
      lightWeightMap.set('key2', 2);
      lightWeightMap.remove('no_key');
      expect(lightWeightMap.length).assertEqual(2);

      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST04_0061
     * @tc.name      testLightWeightMapTest04Chapter0061
     * @tc.desc      Remove after setting same key multiple times
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest04Chapter0061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest04Chapter0061';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set('dup', 1);
      lightWeightMap.set('dup', 2);
      lightWeightMap.remove('dup');
      expect(lightWeightMap.length).assertEqual(0);

      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST04_0062
     * @tc.name      testLightWeightMapTest04Chapter0062
     * @tc.desc      Remove with float min value key (1.401298e-45)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest04Chapter0062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest04Chapter0062';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<number, string>();
      const floatMin = 1.40129846432481707e-45;
      lightWeightMap.set(floatMin, 'float_min');
      lightWeightMap.remove(floatMin);
      expect(lightWeightMap.length).assertEqual(0);

      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST04_0063
     * @tc.name      testLightWeightMapTest04Chapter0063
     * @tc.desc      Remove with float max value key (3.402823e+38)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest04Chapter0063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest04Chapter0063';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<number, string>();
      const floatMax = 3.40282346638528860e+38;
      lightWeightMap.set(floatMax, 'float_max');
      lightWeightMap.remove(floatMax);
      expect(lightWeightMap.isEmpty()).assertTrue();

      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST04_0064
     * @tc.name      testLightWeightMapTest04Chapter0064
     * @tc.desc      Remove with double min value key (4.940656e-324)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest04Chapter0064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest04Chapter0064';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<number, string>();
      const doubleMin = 4.94065645841246544e-324;
      lightWeightMap.set(doubleMin, 'double_min');
      lightWeightMap.remove(doubleMin);
      expect(lightWeightMap.length).assertEqual(0);

      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST04_0065
     * @tc.name      testLightWeightMapTest04Chapter0065
     * @tc.desc      Remove with double max value key (1.797693e+308)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest04Chapter0065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest04Chapter0065';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<number, string>();
      const doubleMax = 1.79769313486231570e+308;
      lightWeightMap.set(doubleMax, 'double_max');
      lightWeightMap.remove(doubleMax);
      expect(lightWeightMap.isEmpty()).assertTrue();

      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST04_0066
     * @tc.name      testLightWeightMapTest04Chapter0066
     * @tc.desc      Remove with char min value key (0)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest04Chapter0066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest04Chapter0066';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<number, string>();
      const charMin = 0;
      lightWeightMap.set(charMin, 'char_min');
      lightWeightMap.remove(charMin);
      expect(lightWeightMap.length).assertEqual(0);

      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST04_0067
     * @tc.name      testLightWeightMapTest04Chapter0067
     * @tc.desc      Remove with char max value key (65535)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest04Chapter0067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest04Chapter0067';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<number, string>();
      const charMax = 65535;
      lightWeightMap.set(charMax, 'char_max');
      lightWeightMap.remove(charMax);
      expect(lightWeightMap.isEmpty()).assertTrue();

      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST04_0068
     * @tc.name      testLightWeightMapTest04Chapter0068
     * @tc.desc      Remove with BigInt value converted to number as key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest04Chapter0068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest04Chapter0068';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<number, string>();
      const bigIntVal = BigInt("0xdecafafecafede");
      const key = Number(bigIntVal); // 可能溢出为 Infinity
      lightWeightMap.set(key, 'bigint_key');
      lightWeightMap.remove(key);
      expect(lightWeightMap.length).assertEqual(0);

      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST04_0069
     * @tc.name      testLightWeightMapTest04Chapter0069
     * @tc.desc      Remove with hexadecimal key 0x0102
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest04Chapter0069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest04Chapter0069';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<number, string>();
      const key = 0x0102;
      lightWeightMap.set(key, 'hex_0102');
      lightWeightMap.remove(key);
      expect(lightWeightMap.isEmpty()).assertTrue();

      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST04_0070
     * @tc.name      testLightWeightMapTest04Chapter0070
     * @tc.desc      Remove with hexadecimal key 0x01020304
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest04Chapter0070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest04Chapter0070';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<number, string>();
      const key = 0x01020304;
      lightWeightMap.set(key, 'hex_32');
      lightWeightMap.remove(key);
      expect(lightWeightMap.length).assertEqual(0);

      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST04_0071
     * @tc.name      testLightWeightMapTest04Chapter0071
     * @tc.desc      Remove with small hex key 0x3 (对应 8 进制行)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest04Chapter0071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest04Chapter0071';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<number, string>();
      const key = 0x3;
      lightWeightMap.set(key, 'hex_3');
      lightWeightMap.remove(key);
      expect(lightWeightMap.isEmpty()).assertTrue();

      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST04_0072
     * @tc.name      testLightWeightMapTest04Chapter0072
     * @tc.desc      Remove with exponent key 2 ** 3
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest04Chapter0072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest04Chapter0072';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<number, string>();
      const key = 2 ** 3; // 8
      lightWeightMap.set(key, 'exp_2_3');
      lightWeightMap.remove(key);
      expect(lightWeightMap.length).assertEqual(0);

      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST04_0073
     * @tc.name      testLightWeightMapTest04Chapter0073
     * @tc.desc      Remove with scientific notation key 1e3
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest04Chapter0073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest04Chapter0073';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<number, string>();
      const key = 1e3; // 1000
      lightWeightMap.set(key, 'sci_1e3');
      lightWeightMap.remove(key);
      expect(lightWeightMap.isEmpty()).assertTrue();

      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST04_0074
     * @tc.name      testLightWeightMapTest04Chapter0074
     * @tc.desc      Remove with scientific notation key 2.5e-2
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest04Chapter0074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest04Chapter0074';
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