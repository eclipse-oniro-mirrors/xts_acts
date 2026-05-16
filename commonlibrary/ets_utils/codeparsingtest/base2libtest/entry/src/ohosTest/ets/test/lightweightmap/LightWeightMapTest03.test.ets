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

function sleep(ms: number) {
  return new Promise<void>((resolve, reject) => setTimeout(resolve, ms));
}

export default function testLightWeightMapTest03() {
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
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST03_0001
     * @tc.name      testLightWeightMapTest03Chapter0001
     * @tc.desc      Verify get with String type key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest03Chapter0001';
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
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST03_0002
     * @tc.name      testLightWeightMapTest03Chapter0002
     * @tc.desc      Verify get with String type key containing special characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest03Chapter0002';
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
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST03_0003
     * @tc.name      testLightWeightMapTest03Chapter0003
     * @tc.desc      Verify get with Number type key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest03Chapter0003';
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
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST03_0004
     * @tc.name      testLightWeightMapTest03Chapter0004
     * @tc.desc      Verify get with Number type special values as key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest03Chapter0004';
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
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST03_0005
     * @tc.name      testLightWeightMapTest03Chapter0005
     * @tc.desc      Verify get with Boolean type key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest03Chapter0005';
      console.log(TAG + 'start');
      const lightWeightMap = new LightWeightMap<boolean, number>();
      lightWeightMap.set(true, 100);
      lightWeightMap.set(false, 0);
      const result = lightWeightMap.get(true);
      expect(result).assertEqual(100);
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST03_0006
     * @tc.name      testLightWeightMapTest03Chapter0006
     * @tc.desc      Verify get with Array type key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest03Chapter0006';
      console.log(TAG + 'start');
      const key1 = [1, 2, 3];
      const key2 = [4, 5, 6];
      const lightWeightMap = new LightWeightMap<Array<number>, string>();
      lightWeightMap.set(key1, "numbers array");
      lightWeightMap.set(key2, "strings array");
      const result = lightWeightMap.get(key1);
      expect(result).assertEqual("numbers array");
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST03_0007
     * @tc.name      testLightWeightMapTest03Chapter0007
     * @tc.desc      Verify get with nested Array type key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest03Chapter0007';
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
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST03_0008
     * @tc.name      testLightWeightMapTest03Chapter0008
     * @tc.desc      Verify get with Object type key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest03Chapter0008';
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
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST03_0009
     * @tc.name      testLightWeightMapTest03Chapter0009
     * @tc.desc      Verify get with nested Object type key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest03Chapter0009';
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
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST03_0010
     * @tc.name      testLightWeightMapTest03Chapter0010
     * @tc.desc      Verify get with Class type key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest03Chapter0010';
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
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST03_0011
     * @tc.name      testLightWeightMapTest03Chapter0011
     * @tc.desc      Verify get with TypedArray type key (Int8Array)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest03Chapter0011';
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
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST03_0012
     * @tc.name      testLightWeightMapTest03Chapter0012
     * @tc.desc      Verify get with TypedArray special values (Float64Array)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest03Chapter0012';
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
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST03_0013
     * @tc.name      testLightWeightMapTest03Chapter0013
     * @tc.desc      Verify get returns undefined for non-existent key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest03Chapter0013';
      console.log(TAG + 'start');
      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set("existing", 100);
      const result = lightWeightMap.get("non-existent");
      expect(result).assertUndefined();
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST03_0014
     * @tc.name      testLightWeightMapTest03Chapter0014
     * @tc.desc      Verify get with boolean values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest03Chapter0014';
      console.log(TAG + 'start');
      const lightWeightMap = new LightWeightMap<boolean, number>();
      lightWeightMap.set(true, 100);
      const result = lightWeightMap.get(true);
      expect(result).assertEqual(100);


      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST03_0015
     * @tc.name      testLightWeightMapTest03Chapter0015
     * @tc.desc      Verify get with same key overwrites previous value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest03Chapter0015';
      console.log(TAG + 'start');
      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set("key", 100);
      lightWeightMap.set("key", 200); // Overwrite
      const result = lightWeightMap.get("key");
      expect(result).assertEqual(200);
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST03_0016
     * @tc.name      testLightWeightMapTest03Chapter0016
     * @tc.desc      Verify get with large number of elements
     * @tc.size      LargeTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter0016", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest03Chapter0016';
      console.log(TAG + 'start');
      const lightWeightMap = new LightWeightMap<number, string>();

      for (let i = 0; i < 1000; i++) {
        lightWeightMap.set(i, `value${i}`);
      }

      const result1 = lightWeightMap.get(500);
      const result2 = lightWeightMap.get(999);

      expect(result1).assertEqual("value500");
      expect(result2).assertEqual("value999");
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST03_0017
     * @tc.name      testLightWeightMapTest03Chapter0017
     * @tc.desc      Verify getIndexOfKey with String type key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest03Chapter0017';
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
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST03_0018
     * @tc.name      testLightWeightMapTest03Chapter0018
     * @tc.desc      Verify getIndexOfKey with String type key containing special characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest03Chapter0018';
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
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST03_0019
     * @tc.name      testLightWeightMapTest03Chapter0019
     * @tc.desc      Verify getIndexOfKey with Number type key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest03Chapter0019';
      console.log(TAG + 'start');
      const lightWeightMap = new LightWeightMap<number, string>();
      lightWeightMap.set(0, "zero");
      lightWeightMap.set(1, "one");
      lightWeightMap.set(-1, "negative one");
      const result = lightWeightMap.getIndexOfKey(0);
      expect(result).assertEqual(1);
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST03_0020
     * @tc.name      testLightWeightMapTest03Chapter0020
     * @tc.desc      Verify getIndexOfKey with Number type special values as key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest03Chapter0020';
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
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST03_0021
     * @tc.name      testLightWeightMapTest03Chapter0021
     * @tc.desc      Verify getIndexOfKey with Boolean type key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest03Chapter0021';
      console.log(TAG + 'start');
      const lightWeightMap = new LightWeightMap<boolean, number>();
      lightWeightMap.set(true, 100);
      lightWeightMap.set(false, 0);
      const result = lightWeightMap.getIndexOfKey(true);
      expect(result).assertEqual(0);
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST03_0022
     * @tc.name      testLightWeightMapTest03Chapter0022
     * @tc.desc      Verify getIndexOfKey with Array type key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest03Chapter0022';
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
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST03_0023
     * @tc.name      testLightWeightMapTest03Chapter0023
     * @tc.desc      Verify getIndexOfKey with nested Array type key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest03Chapter0023';
      console.log(TAG + 'start');
      const key1 = [[1, 2], [3, 4]];
      const key2 = [[5, 6], [7, 8]];
      const lightWeightMap = new LightWeightMap<Array<Array<number>>, string>();
      lightWeightMap.set(key1, "nested numbers array");
      lightWeightMap.set(key2, "nested strings array");
      const result:boolean = lightWeightMap.getIndexOfKey(key2) === 0 || lightWeightMap.getIndexOfKey(key2) === 1;
      expect(result).assertTrue();
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST03_0024
     * @tc.name      testLightWeightMapTest03Chapter0024
     * @tc.desc      Verify getIndexOfKey with Object type key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest03Chapter0024';
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
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST03_0025
     * @tc.name      testLightWeightMapTest03Chapter0025
     * @tc.desc      Verify getIndexOfKey with nested Object type key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest03Chapter0025';
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
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST03_0026
     * @tc.name      testLightWeightMapTest03Chapter0026
     * @tc.desc      Verify getIndexOfKey with Class type key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest03Chapter0026';
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
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST03_0027
     * @tc.name      testLightWeightMapTest03Chapter0027
     * @tc.desc      Verify getIndexOfKey with TypedArray type key (Int8Array)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest03Chapter0027';
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
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST03_0028
     * @tc.name      testLightWeightMapTest03Chapter0028
     * @tc.desc      Verify getIndexOfKey with TypedArray special values (Float64Array)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest03Chapter0028';
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
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST03_0029
     * @tc.name      testLightWeightMapTest03Chapter0029
     * @tc.desc      Verify getIndexOfKey returns -1 for non-existent key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest03Chapter0029';
      console.log(TAG + 'start');
      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set("existing", 100);
      lightWeightMap.set("another", 200);
      const result = lightWeightMap.getIndexOfKey("non-existent");
      expect(result).assertEqual(-1);
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST03_0030
     * @tc.name      testLightWeightMapTest03Chapter0030
     * @tc.desc      Verify getIndexOfKey returns first occurrence for duplicate keys
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest03Chapter0030';
      console.log(TAG + 'start');
      const lightWeightMap = new LightWeightMap<string, number>();
      // LightWeightMap不允许重复key，所以测试相同value不同key的情况
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
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST03_0031
     * @tc.name      testLightWeightMapTest03Chapter0031
     * @tc.desc      Verify getIndexOfKey with boolean values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest03Chapter0031';
      console.log(TAG + 'start');
      const lightWeightMap = new LightWeightMap<boolean, boolean>();
      lightWeightMap.set(true, true);
      const result = lightWeightMap.getIndexOfKey(true);
      expect(result).assertEqual(0);
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST03_0032
     * @tc.name      testLightWeightMapTest03Chapter0032
     * @tc.desc      Verify getIndexOfKey with empty map
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest03Chapter0032';
      console.log(TAG + 'start');
      const lightWeightMap = new LightWeightMap<string, number>();
      const result = lightWeightMap.getIndexOfKey("any");
      expect(result).assertEqual(-1);
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST03_0033
     * @tc.name      testLightWeightMapTest03Chapter0033
     * @tc.desc      Verify getIndexOfKey with large number of elements
     * @tc.size      LargeTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter0033", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest03Chapter0033';
      console.log(TAG + 'start');
      const lightWeightMap = new LightWeightMap<number, string>();

      for (let i = 0; i < 1000; i++) {
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
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST03_0034
     * @tc.name      testLightWeightMapTest03Chapter0034
     * @tc.desc      Verify getIndexOfValue with String type value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest03Chapter0034';
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
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST03_0035
     * @tc.name      testLightWeightMapTest03Chapter0035
     * @tc.desc      Verify getIndexOfValue with String type value containing special characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest03Chapter0035';
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
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST03_0036
     * @tc.name      testLightWeightMapTest03Chapter0036
     * @tc.desc      Verify getIndexOfValue with Number type value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest03Chapter0036';
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
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST03_0037
     * @tc.name      testLightWeightMapTest03Chapter0037
     * @tc.desc      Verify getIndexOfValue with Number type special values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest03Chapter0037';
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
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST03_0038
     * @tc.name      testLightWeightMapTest03Chapter0038
     * @tc.desc      Verify getIndexOfValue with Boolean type value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest03Chapter0038';
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
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST03_0039
     * @tc.name      testLightWeightMapTest03Chapter0039
     * @tc.desc      Verify getIndexOfValue with Array type value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest03Chapter0039';
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
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST03_0040
     * @tc.name      testLightWeightMapTest03Chapter0040
     * @tc.desc      Verify getIndexOfValue with nested Array type value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest03Chapter0040';
      console.log(TAG + 'start');
      const lightWeightMap = new LightWeightMap<string, Array<Array<number>>>();
      lightWeightMap.set("key1", [[1, 2], [3, 4]]);
      lightWeightMap.set("key2", [[5, 6], [7, 8]]);
      const result = lightWeightMap.getIndexOfValue([[5, 6], [7, 8]]);
      expect(result).assertEqual(-1);
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST03_0041
     * @tc.name      testLightWeightMapTest03Chapter0041
     * @tc.desc      Verify getIndexOfValue with Object type value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest03Chapter0041';
      console.log(TAG + 'start');
      const lightWeightMap = new LightWeightMap<string, object>();
      lightWeightMap.set("key1", { id: 1, name: "object1" });
      lightWeightMap.set("key2", { id: 2, name: "object2" });
      lightWeightMap.set("key3", { id: 3, name: "object3" });
      const result = lightWeightMap.getIndexOfValue({ id: 2, name: "object2" });
      expect(result).assertEqual(-1);
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST03_0042
     * @tc.name      testLightWeightMapTest03Chapter0042
     * @tc.desc      Verify getIndexOfValue with nested Object type value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest03Chapter0042';
      console.log(TAG + 'start');
      const lightWeightMap = new LightWeightMap<string, object>();
      lightWeightMap.set("key1", {
        user: {
          id: 1,
          profile: {
            name: "Alice",
            age: 25
          }
        }
      });
      lightWeightMap.set("key2", {
        user: {
          id: 2,
          profile: {
            name: "Bob",
            age: 30
          }
        }
      });
      const result = lightWeightMap.getIndexOfValue({
        user: {
          id: 2,
          profile: {
            name: "Bob",
            age: 30
          }
        }
      });
      expect(result).assertEqual(-1);
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST03_0043
     * @tc.name      testLightWeightMapTest03Chapter0043
     * @tc.desc      Verify getIndexOfValue with Class type value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest03Chapter0043';
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
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST03_0044
     * @tc.name      testLightWeightMapTest03Chapter0044
     * @tc.desc      Verify getIndexOfValue with TypedArray type value (Int8Array)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest03Chapter0044';
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
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST03_0045
     * @tc.name      testLightWeightMapTest03Chapter0045
     * @tc.desc      Verify getIndexOfValue with TypedArray special values (Float64Array)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest03Chapter0045';
      console.log(TAG + 'start');
      const lightWeightMap = new LightWeightMap<string, Float64Array>();
      lightWeightMap.set("key1", new Float64Array([NaN, Infinity, -Infinity]));
      lightWeightMap.set("key2", new Float64Array([0, -0, Number.MAX_VALUE]));
      const result = lightWeightMap.getIndexOfValue(new Float64Array([0, -0, Number.MAX_VALUE]));
      expect(result).assertEqual(-1);
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST03_0046
     * @tc.name      testLightWeightMapTest03Chapter0046
     * @tc.desc      Verify getIndexOfValue returns -1 for non-existent value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest03Chapter0046';
      console.log(TAG + 'start');
      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set("key1", 100);
      lightWeightMap.set("key2", 200);
      const result = lightWeightMap.getIndexOfValue(300);
      expect(result).assertEqual(-1);
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST03_0047
     * @tc.name      testLightWeightMapTest03Chapter0047
     * @tc.desc      Verify getIndexOfValue returns first occurrence for duplicate values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest03Chapter0047';
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
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST03_0048
     * @tc.name      testLightWeightMapTest03Chapter0048
     * @tc.desc      Verify getIndexOfValue with boolean values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest03Chapter0048';
      console.log(TAG + 'start');
      const lightWeightMap = new LightWeightMap<boolean, boolean>();
      lightWeightMap.set(true, true);
      const result = lightWeightMap.getIndexOfValue(true);
      expect(result).assertEqual(0);
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST03_0049
     * @tc.name      testLightWeightMapTest03Chapter0049
     * @tc.desc      Verify getIndexOfValue with empty map
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest03Chapter0049';
      console.log(TAG + 'start');
      const lightWeightMap = new LightWeightMap<string, number>();
      const result = lightWeightMap.getIndexOfValue(100);
      expect(result).assertEqual(-1);
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST03_0050
     * @tc.name      testLightWeightMapTest03Chapter0050
     * @tc.desc      Verify getIndexOfValue with null  values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest03Chapter0050';
      console.log(TAG + 'start');
      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set("key1", null);
      const result1 = lightWeightMap.getIndexOfValue(null);
      expect(result1).assertEqual(0);
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST03_0051
     * @tc.name      testLightWeightMapTest03Chapter0051
     * @tc.desc      Verify getIndexOfValue with large number of elements
     * @tc.size      LargeTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter0051", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest03Chapter0051';
      console.log(TAG + 'start');
      const lightWeightMap = new LightWeightMap<string, number>();

      for (let i = 0; i < 1000; i++) {
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
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST03_0052
     * @tc.name      testLightWeightMapTest03Chapter0052
     * @tc.desc      Verify LightWeightMap supports number value 0
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter0052",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

        const TAG = 'testLightWeightMapTest03Chapter0052';
        console.log(TAG + ' start');

        const lightWeightMap = new LightWeightMap<string, number>();
        lightWeightMap.set('k', 0);
        expect(lightWeightMap.get('k')).assertEqual(0);

        console.log(TAG + ' end');
      });
    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST03_0053
     * @tc.name      testLightWeightMapTest03Chapter0053
     * @tc.desc      Verify LightWeightMap supports undefined value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter0053",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

        const TAG = 'testLightWeightMapTest03Chapter0053';
        console.log(TAG + ' start');


        const lightWeightMap = new LightWeightMap<string, number | undefined>();
        lightWeightMap.set('k', undefined);
        expect(lightWeightMap.get('k')).assertEqual(undefined);

        console.log(TAG + ' end');
      });
    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST03_0054
     * @tc.name      testLightWeightMapTest03Chapter0054
     * @tc.desc      Verify LightWeightMap supports NaN value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter0054",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

        const TAG = 'testLightWeightMapTest03Chapter0054';
        console.log(TAG + ' start');


        const lightWeightMap = new LightWeightMap<string, number>();
        lightWeightMap.set('k', NaN);
        expect(Number.isNaN(lightWeightMap.get('k'))).assertTrue();

        console.log(TAG + ' end');
      });
    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST03_0055
     * @tc.name      testLightWeightMapTest03Chapter0055
     * @tc.desc      Verify LightWeightMap supports -0 value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter0055",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

        const TAG = 'testLightWeightMapTest03Chapter0055';
        console.log(TAG + ' start');


        const lightWeightMap = new LightWeightMap<string, number>();
        lightWeightMap.set('k', -0);

        const value = lightWeightMap.get('k');
        expect(value).assertEqual(0);
        expect(1 / value).assertEqual(-Infinity);

        console.log(TAG + ' end');
      });
    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST03_0056
     * @tc.name      testLightWeightMapTest03Chapter0056
     * @tc.desc      Verify LightWeightMap supports Infinity
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter0056",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

        const TAG = 'testLightWeightMapTest03Chapter0056';
        console.log(TAG + ' start');


        const lightWeightMap = new LightWeightMap<string, number>();
        lightWeightMap.set('k', Infinity);
        expect(lightWeightMap.get('k')).assertEqual(Infinity);

        console.log(TAG + ' end');
      });
    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST03_0057
     * @tc.name      testLightWeightMapTest03Chapter0057
     * @tc.desc      Verify LightWeightMap supports -Infinity
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter0057",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

        const TAG = 'testLightWeightMapTest03Chapter0057';
        console.log(TAG + ' start');


        const lightWeightMap = new LightWeightMap<string, number>();
        lightWeightMap.set('k', -Infinity);
        expect(lightWeightMap.get('k')).assertEqual(-Infinity);

        console.log(TAG + ' end');
      });
    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST03_0058
     * @tc.name      testLightWeightMapTest03Chapter0058
     * @tc.desc      Verify LightWeightMap supports Math.floor result
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter0058",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

        const TAG = 'testLightWeightMapTest03Chapter0058';
        console.log(TAG + ' start');


        const lightWeightMap = new LightWeightMap<string, number>();
        const value = Math.floor(1.5);
        lightWeightMap.set('k', value);
        expect(lightWeightMap.get('k')).assertEqual(1);

        console.log(TAG + ' end');
      });
    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST03_0059
     * @tc.name      testLightWeightMapTest03Chapter0059
     * @tc.desc      Verify LightWeightMap supports Number.MAX_VALUE
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter0059",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

        const TAG = 'testLightWeightMapTest03Chapter0059';
        console.log(TAG + ' start');


        const lightWeightMap = new LightWeightMap<string, number>();
        lightWeightMap.set('k', Number.MAX_VALUE);
        expect(lightWeightMap.get('k')).assertEqual(Number.MAX_VALUE);

        console.log(TAG + ' end');
      });
    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST03_0060
     * @tc.name      testLightWeightMapTest03Chapter0060
     * @tc.desc      Verify LightWeightMap supports Number.MIN_VALUE
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter0060",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

        const TAG = 'testLightWeightMapTest03Chapter0060';
        console.log(TAG + ' start');


        const lightWeightMap = new LightWeightMap<string, number>();
        lightWeightMap.set('k', Number.MIN_VALUE);
        expect(lightWeightMap.get('k')).assertEqual(Number.MIN_VALUE);

        console.log(TAG + ' end');
      });
    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST03_0061
     * @tc.name      testLightWeightMapTest03Chapter0061
     * @tc.desc      Verify LightWeightMap supports Number.EPSILON
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter0061",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

        const TAG = 'testLightWeightMapTest03Chapter0061';
        console.log(TAG + ' start');
        const lightWeightMap = new LightWeightMap<string, number>();
        lightWeightMap.set('k', Number.EPSILON);
        expect(lightWeightMap.get('k')).assertEqual(Number.EPSILON);

        console.log(TAG + ' end');
      });
    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST03_0062
     * @tc.name      testLightWeightMapTest03Chapter0062
     * @tc.desc      Verify LightWeightMap supports Number.MAX_SAFE_INTEGER
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter0062",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

        const TAG = 'testLightWeightMapTest03Chapter0062';
        console.log(TAG + ' start');
        const lightWeightMap = new LightWeightMap<string, number>();
        lightWeightMap.set('k', Number.MAX_SAFE_INTEGER);
        expect(lightWeightMap.get('k')).assertEqual(Number.MAX_SAFE_INTEGER);

        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST03_0063
     * @tc.name      testLightWeightMapTest03Chapter0063
     * @tc.desc      Verify LightWeightMap supports byte range
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter0063",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

        const TAG = 'testLightWeightMapTest03Chapter0063';
        console.log(TAG + ' start');

        const lightWeightMap = new LightWeightMap<string, number>();
        lightWeightMap.set('min', -128);
        expect(lightWeightMap.get('min')).assertEqual(-128);

        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST03_0064
     * @tc.name      testLightWeightMapTest03Chapter0064
     * @tc.desc      Verify LightWeightMap supports short range
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter0064",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

        const TAG = 'testLightWeightMapTest03Chapter0064';
        console.log(TAG + ' start');
        const lightWeightMap = new LightWeightMap<string, number>();
        lightWeightMap.set('min', -32768);
        expect(lightWeightMap.get('min')).assertEqual(-32768);
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST03_0065
     * @tc.name      testLightWeightMapTest03Chapter0065
     * @tc.desc      Verify LightWeightMap supports int range
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter0065",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

        const TAG = 'testLightWeightMapTest03Chapter0065';
        console.log(TAG + ' start');
        const lightWeightMap = new LightWeightMap<string, number>();
        lightWeightMap.set('min', -2147483648);
        expect(lightWeightMap.get('min')).assertEqual(-2147483648);
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST03_0066
     * @tc.name      testLightWeightMapTest03Chapter0066
     * @tc.desc      Verify LightWeightMap supports long range
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter0066",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

        const TAG = 'testLightWeightMapTest03Chapter0066';
        console.log(TAG + ' start');
        const lightWeightMap = new LightWeightMap<string, bigint>();
        const min = -9223372036854775808n;
        lightWeightMap.set('min', min);
        expect(lightWeightMap.get('min')).assertEqual(min);
        console.log(TAG + ' end');
      });
    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST03_0067
     * @tc.name      testLightWeightMapTest03Chapter0067
     * @tc.desc      Verify LightWeightMap supports float range
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter0067",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

        const TAG = 'testLightWeightMapTest03Chapter0067';
        console.log(TAG + ' start');
        const lightWeightMap = new LightWeightMap<string, number>();
        lightWeightMap.set('min', 1.401298464e-45);
        expect(lightWeightMap.get('max')).assertEqual(undefined);
        console.log(TAG + ' end');
      });
    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST03_0068
     * @tc.name      testLightWeightMapTest03Chapter0068
     * @tc.desc      Verify LightWeightMap supports double range
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter0068",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

        const TAG = 'testLightWeightMapTest03Chapter0068';
        console.log(TAG + ' start');
        const lightWeightMap = new LightWeightMap<string, number>();
        lightWeightMap.set('min', 4.940656458e-324);
        expect(lightWeightMap.get('min')).assertEqual(4.940656458e-324);
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST03_0069
     * @tc.name      testLightWeightMapTest03Chapter0069
     * @tc.desc      Verify LightWeightMap supports char range
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter0069",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

        const TAG = 'testLightWeightMapTest03Chapter0069';
        console.log(TAG + ' start');
        const lightWeightMap = new LightWeightMap<string, number>();
        lightWeightMap.set('min', 0);
        expect(lightWeightMap.get('min')).assertEqual(0);
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST03_0070
     * @tc.name      testLightWeightMapTest03Chapter0070
     * @tc.desc      Verify LightWeightMap supports BigInt hex value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter0070",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

        const TAG = 'testLightWeightMapTest03Chapter0070';
        console.log(TAG + ' start');
        const lightWeightMap = new LightWeightMap<string, bigint>();
        const value = BigInt('0xdecafafecafede');

        lightWeightMap.set('k', value);
        expect(lightWeightMap.get('k')).assertEqual(value);

        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST03_0071
     * @tc.name      testLightWeightMapTest03Chapter0071
     * @tc.desc      Verify LightWeightMap supports double value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter0071",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

        const TAG = 'testLightWeightMapTest03Chapter0071';
        console.log(TAG + ' start');
        const lightWeightMap = new LightWeightMap<string, number>();
        lightWeightMap.set('k', 123.456);

        expect(lightWeightMap.get('k')).assertEqual(123.456);

        console.log(TAG + ' end');
      });
    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST03_0072
     * @tc.name      testLightWeightMapTest03Chapter0072
     * @tc.desc      Verify LightWeightMap supports hex number
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter0072",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

        const TAG = 'testLightWeightMapTest03Chapter0072';
        console.log(TAG + ' start');
        const lightWeightMap = new LightWeightMap<string, number>();
        lightWeightMap.set('k', 0xcafebabe);

        expect(lightWeightMap.get('k')).assertEqual(0xcafebabe);

        console.log(TAG + ' end');
      });
    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST03_0073
     * @tc.name      testLightWeightMapTest03Chapter0073
     * @tc.desc      Verify LightWeightMap supports hex literal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter0073",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

        const TAG = 'testLightWeightMapTest03Chapter0073';
        console.log(TAG + ' start');
        const lightWeightMap = new LightWeightMap<string, number>();
        lightWeightMap.set('k', 0x0102);

        expect(lightWeightMap.get('k')).assertEqual(258);

        console.log(TAG + ' end');
      });
    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST03_0074
     * @tc.name      testLightWeightMapTest03Chapter0074
     * @tc.desc      Verify LightWeightMap supports 32-bit integer
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter0074",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

        const TAG = 'testLightWeightMapTest03Chapter0074';
        console.log(TAG + ' start');


        const lightWeightMap = new LightWeightMap<string, number>();
        lightWeightMap.set('k', 0x01020304);

        expect(lightWeightMap.get('k')).assertEqual(16909060);

        console.log(TAG + ' end');
      });
    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST03_0075
     * @tc.name      testLightWeightMapTest03Chapter0075
     * @tc.desc      Verify LightWeightMap supports octal literal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter0075",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

        const TAG = 'testLightWeightMapTest03Chapter0075';
        console.log(TAG + ' start');


        const lightWeightMap = new LightWeightMap<string, number>();
        lightWeightMap.set('k', 0o3);

        expect(lightWeightMap.get('k')).assertEqual(3);

        console.log(TAG + ' end');
      });
    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST03_0076
     * @tc.name      testLightWeightMapTest03Chapter0076
     * @tc.desc      Verify LightWeightMap supports exponent operator
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter0076",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

        const TAG = 'testLightWeightMapTest03Chapter0076';
        console.log(TAG + ' start');


        const lightWeightMap = new LightWeightMap<string, number>();
        lightWeightMap.set('k', 2 ** 3);

        expect(lightWeightMap.get('k')).assertEqual(8);

        console.log(TAG + ' end');
      });
    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST03_0077
     * @tc.name      testLightWeightMapTest03Chapter0077
     * @tc.desc      Verify LightWeightMap supports scientific notation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter0077",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

        const TAG = 'testLightWeightMapTest03Chapter0077';
        console.log(TAG + ' start');


        const lightWeightMap = new LightWeightMap<string, number>();
        lightWeightMap.set('a', 1e3);
        lightWeightMap.set('b', 2.5e-2);

        expect(lightWeightMap.get('a')).assertEqual(1000);
        expect(lightWeightMap.get('b')).assertEqual(0.025);

        console.log(TAG + ' end');
      });
    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST03_0078
     * @tc.name      testLightWeightMapTest03Chapter0078
     * @tc.desc      Verify LightWeightMap supports BigInt value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter0078",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

        const TAG = 'testLightWeightMapTest03Chapter0078';
        console.log(TAG + ' start');


        const lightWeightMap = new LightWeightMap<string, bigint>();
        const value = 9007199254740991n;

        lightWeightMap.set('k', value);
        expect(lightWeightMap.get('k')).assertEqual(value);

        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST03_0079
     * @tc.name      testLightWeightMapTest03Chapter0079
     * @tc.desc      Verify LightWeightMap supports byte range
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter0079",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

        const TAG = 'testLightWeightMapTest03Chapter0079';
        console.log(TAG + ' start');
        const lightWeightMap = new LightWeightMap<string, number>();
        lightWeightMap.set('max', 127);
        expect(lightWeightMap.get('min')).assertEqual(undefined);

        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST03_0080
     * @tc.name      testLightWeightMapTest03Chapter0080
     * @tc.desc      Verify LightWeightMap supports short range
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter0080",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'testLightWeightMapTest03Chapter0080';
        console.log(TAG + ' start');
        const lightWeightMap = new LightWeightMap<string, number>();
        lightWeightMap.set('max', 32767);
        expect(lightWeightMap.get('max')).assertEqual(32767);

        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST03_0081
     * @tc.name      testLightWeightMapTest03Chapter0081
     * @tc.desc      Verify LightWeightMap supports int range
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter0081",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'testLightWeightMapTest03Chapter0081';
        console.log(TAG + ' start');
        const lightWeightMap = new LightWeightMap<string, number>();
        lightWeightMap.set('max', 2147483647);
        expect(lightWeightMap.get('max')).assertEqual(2147483647);

        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST03_0082
     * @tc.name      testLightWeightMapTest03Chapter0082
     * @tc.desc      Verify LightWeightMap supports long range
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter0082",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'testLightWeightMapTest03Chapter0082';
        console.log(TAG + ' start');
        const lightWeightMap = new LightWeightMap<string, bigint>();
        const max =  9223372036854775807n;
        lightWeightMap.set('max', max);
        expect(lightWeightMap.get('max')).assertEqual(max);
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST03_0083
     * @tc.name      testLightWeightMapTest03Chapter0083
     * @tc.desc      Verify LightWeightMap supports float range
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter0083",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

        const TAG = 'testLightWeightMapTest03Chapter0083';
        console.log(TAG + ' start');
        const lightWeightMap = new LightWeightMap<string, number>();
        lightWeightMap.set('max', 3.402823466e+38);
        expect(lightWeightMap.get('max')).assertEqual(3.402823466e+38);
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST03_0084
     * @tc.name      testLightWeightMapTest03Chapter0084
     * @tc.desc      Verify LightWeightMap supports double range
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter0084",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'testLightWeightMapTest03Chapter0084';
        console.log(TAG + ' start');
        const lightWeightMap = new LightWeightMap<string, number>();
        lightWeightMap.set('max', 1.7976931348623157e+308);
        expect(lightWeightMap.get('max')).assertEqual(1.7976931348623157e+308);
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST03_0085
     * @tc.name      testLightWeightMapTest03Chapter0085
     * @tc.desc      Verify LightWeightMap supports char range
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest03Chapter0085",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

        const TAG = 'testLightWeightMapTest03Chapter0085';
        console.log(TAG + ' start');
        const lightWeightMap = new LightWeightMap<string, number>();
        lightWeightMap.set('max', 65535);
        expect(lightWeightMap.get('max')).assertEqual(65535);

        console.log(TAG + ' end');
      });


  });
}
