import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
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

function sleep(ms: number) {
  return new Promise<void>((resolve, reject) => setTimeout(resolve, ms));
}

export default function testLightWeightMapTest01() {
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
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST01_0001
     * @tc.name      testLightWeightMapTest01Chapter0001
     * @tc.desc      Verify normal construction
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest01Chapter0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest01Chapter0001';
      console.log(TAG + 'start');
      const lightWeightMap = new LightWeightMap<string, number>();
      expect(lightWeightMap.length).assertEqual(0);
      console.log(TAG + 'end');

    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST01_0002
     * @tc.name      testLightWeightMapTest01Chapter0002
     * @tc.desc      Verify normal construction
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest01Chapter0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest01Chapter0002';
      console.log(TAG + 'start');
      const lightWeightMap = new LightWeightMap<string, string>();
      expect(lightWeightMap.length).assertEqual(0);
      console.log(TAG + 'end');

    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST01_0003
     * @tc.name      testLightWeightMapTest01Chapter0003
     * @tc.desc      Verify normal construction
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest01Chapter0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest01Chapter0003';
      console.log(TAG + 'start');
      const lightWeightMap = new LightWeightMap<string, string>();
      expect(lightWeightMap instanceof LightWeightMap).assertTrue();
      console.log(TAG + 'end');

    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST01_0004
     * @tc.name      testLightWeightMapTest01Chapter0004
     * @tc.desc      Verify normal construction
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest01Chapter0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest01Chapter0004';
      console.log(TAG + 'start');
      const lightWeightMap = new LightWeightMap<number, string>();
      expect(lightWeightMap.constructor.name).assertEqual("LightWeightMap");
      console.log(TAG + 'end');

    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST01_0005
     * @tc.name      testLightWeightMapTest01Chapter0005
     * @tc.desc      Verify normal construction
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest01Chapter0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest01Chapter0005';
      console.log(TAG + 'start');
      const lightWeightMap = new LightWeightMap<string, Array<number>>();
      expect(LightWeightMap.prototype.constructor).assertEqual(LightWeightMap);
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST01_0006
     * @tc.name      testLightWeightMapTest01Chapter0006
     * @tc.desc      Verify normal construction
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest01Chapter0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest01Chapter0006';
      console.log(TAG + 'start');
      const lightWeightMap = new LightWeightMap<string, Array<number>>();
      lightWeightMap.set('array1', [1, 2, 3]);
      expect(lightWeightMap.get('array1')).assertDeepEquals([1, 2, 3]);
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST01_0007
     * @tc.name      testLightWeightMapTest01Chapter0007
     * @tc.desc      Verify that the newly created LightWeightMap is empty
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest01Chapter0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest01Chapter0007';
      console.log(TAG + 'start');
      //用例逻辑
      const lightWeightMap = new LightWeightMap<string, boolean>();
      const isEmpty = lightWeightMap.isEmpty();
      expect(isEmpty).assertTrue();

      console.log(TAG + "end");

    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST01_0008
     * @tc.name      testLightWeightMapTest01Chapter0008
     * @tc.desc      Verify that the newly created LightWeightMap has a length of 0
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest01Chapter0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest01Chapter0008';
      console.log(TAG + 'start');
      //用例逻辑
      const lightWeightMap = new LightWeightMap<boolean, number>();
      expect(lightWeightMap.length).assertEqual(0);

      console.log(TAG + "end");

    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST01_0009
     * @tc.name      testLightWeightMapTest01Chapter0009
     * @tc.desc      Verify that the created LightWeightMap is not empty after adding key-value pairs
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest01Chapter0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest01Chapter0009';
      console.log(TAG + 'start');
      //用例逻辑
      const lightWeightMap = new LightWeightMap<number, number>();
      lightWeightMap.set(100, 100);
      const isEmpty = lightWeightMap.isEmpty();
      expect(isEmpty).assertFalse();

      console.log(TAG + "end");

    });


    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST01_0010
     * @tc.name      testLightWeightMapTest01Chapter0010
     * @tc.desc      Verify that the created LightWeightMap is not empty after adding key-value pairs
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest01Chapter0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest01Chapter0010';
      console.log(TAG + 'start');
      const lightWeightMap = new LightWeightMap<string, string>();
      lightWeightMap.set('key1', 'value1');
      const isEmpty = lightWeightMap.isEmpty();
      expect(isEmpty).assertFalse();
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST01_0011
     * @tc.name      testLightWeightMapTest01Chapter0011
     * @tc.desc      Verify that newly created LightWeightMap is empty
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest01Chapter0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest01Chapter0011';
      console.log(TAG + 'start');
      const lightWeightMap = new LightWeightMap<string, number>();
      const isEmpty = lightWeightMap.isEmpty();
      expect(isEmpty).assertTrue();
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST01_0012
     * @tc.name      testLightWeightMapTest01Chapter0012
     * @tc.desc      Verify isEmpty returns false after adding multiple elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest01Chapter0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest01Chapter0012';
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
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST01_0013
     * @tc.name      testLightWeightMapTest01Chapter0013
     * @tc.desc      Verify isEmpty returns true after clearing all elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest01Chapter0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest01Chapter0013';
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
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST01_0014
     * @tc.name      testLightWeightMapTest01Chapter0014
     * @tc.desc      Verify isEmpty returns true after removing all elements one by one
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest01Chapter0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest01Chapter0014';
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
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST01_0015
     * @tc.name      testLightWeightMapTest01Chapter0015
     * @tc.desc      Verify isEmpty works with different generic types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest01Chapter0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest01Chapter0015';
      console.log(TAG + 'start');
      const map3 = new LightWeightMap<object, number>();
      expect(map3.isEmpty()).assertTrue();
      map3.set({id: 1}, 100);
      expect(map3.isEmpty()).assertFalse();
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST01_0016
     * @tc.name      testLightWeightMapTest01Chapter0016
     * @tc.desc      Verify isEmpty works with complex data types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest01Chapter0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest01Chapter0016';
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
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST01_0017
     * @tc.name      testLightWeightMapTest01Chapter0017
     * @tc.desc      Test isEmpty method cannot be bound (error 10200011)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest01Chapter0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest01Chapter0017';
      console.log(TAG + 'start');
      const lightWeightMap = new LightWeightMap<boolean, boolean>();
      lightWeightMap.set(true, false);

      expect(lightWeightMap.isEmpty()).assertFalse();
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST01_0018
     * @tc.name      testLightWeightMapTest01Chapter0018
     * @tc.desc      Verify isEmpty with repeated add and remove operations
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest01Chapter0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest01Chapter0018';
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
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST01_0019
     * @tc.name      testLightWeightMapTest01Chapter0019
     * @tc.desc      Verify isEmpty with large number of elements
     * @tc.size      LargeTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest01Chapter0019", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest01Chapter0019';
      console.log(TAG + 'start');
      const lightWeightMap = new LightWeightMap<number, string>();
      expect(lightWeightMap.isEmpty()).assertTrue();

      for (let i = 0; i < 10; i++) {
        lightWeightMap.set(i, `value${i}`);
      }

      expect(lightWeightMap.isEmpty()).assertFalse();

      lightWeightMap.clear();
      const isEmpty = lightWeightMap.isEmpty();
      expect(isEmpty).assertTrue();
      console.log(TAG + "end");
    });

  /**
   * @tc.number    SUB_LIGHTWEIGHTMAP_TEST01_0020
   * @tc.name      testLightWeightMapTest01Chapter0020
   * @tc.desc      Verify that an empty map contains an empty map
   * @tc.size      MediumTest
   * @tc.type      Function
   * @tc.level     Level 2
   */
  it("testLightWeightMapTest01Chapter0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    const TAG = 'testLightWeightMapTest01Chapter0020';
    console.log(TAG + 'start');
    const lightWeightMap = new LightWeightMap<string, number>();
    const emptyMap = new LightWeightMap<string, number>();
    const result = lightWeightMap.hasAll(emptyMap);
    expect(result).assertTrue();
    console.log(TAG + "end");
  });

  /**
   * @tc.number    SUB_LIGHTWEIGHTMAP_TEST01_0021
   * @tc.name      testLightWeightMapTest01Chapter0021
   * @tc.desc      Verify that a Non-empty map contains an empty map
   * @tc.size      MediumTest
   * @tc.type      Function
   * @tc.level     Level 2
   */
  it("testLightWeightMapTest01Chapter0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    const TAG = 'testLightWeightMapTest01Chapter0021';
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
   * @tc.number    SUB_LIGHTWEIGHTMAP_TEST01_0022
   * @tc.name      testLightWeightMapTest01Chapter0022
   * @tc.desc      Verify hasAll with string keys and number values
   * @tc.size      MediumTest
   * @tc.type      Function
   * @tc.level     Level 2
   */
  it("testLightWeightMapTest01Chapter0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    const TAG = 'testLightWeightMapTest01Chapter0022';
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
   * @tc.number    SUB_LIGHTWEIGHTMAP_TEST01_0023
   * @tc.name      testLightWeightMapTest01Chapter0023
   * @tc.desc      Verify hasAll returns false when values mismatch
   * @tc.size      MediumTest
   * @tc.type      Function
   * @tc.level     Level 2
   */
  it("testLightWeightMapTest01Chapter0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    const TAG = 'testLightWeightMapTest01Chapter0023';
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
   * @tc.number    SUB_LIGHTWEIGHTMAP_TEST01_0024
   * @tc.name      testLightWeightMapTest01Chapter0024
   * @tc.desc      Verify hasAll with number keys and string values
   * @tc.size      MediumTest
   * @tc.type      Function
   * @tc.level     Level 2
   */
  it("testLightWeightMapTest01Chapter0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    const TAG = 'testLightWeightMapTest01Chapter0024';
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
   * @tc.number    SUB_LIGHTWEIGHTMAP_TEST01_0025
   * @tc.name      testLightWeightMapTest01Chapter0025
   * @tc.desc      Verify hasAll with boolean values
   * @tc.size      MediumTest
   * @tc.type      Function
   * @tc.level     Level 2
   */
  it("testLightWeightMapTest01Chapter0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    const TAG = 'testLightWeightMapTest01Chapter0025';
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
   * @tc.number    SUB_LIGHTWEIGHTMAP_TEST01_0026
   * @tc.name      testLightWeightMapTest01Chapter0026
   * @tc.desc      Verify hasAll with array values
   * @tc.size      MediumTest
   * @tc.type      Function
   * @tc.level     Level 2
   */
  it("testLightWeightMapTest01Chapter0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    const TAG = 'testLightWeightMapTest01Chapter0026';
    console.log(TAG + 'start');
    const lightWeightMap = new LightWeightMap<string, Array<number>>();
    const arr1 = [1, 2, 3];
    const arr2 = [4, 5, 6];
    const arr3 = [7, 8, 9];
    lightWeightMap.set('arr1', arr1);
    lightWeightMap.set('arr2', arr2);
    lightWeightMap.set('arr3', arr3);

    const testMap = new LightWeightMap<string, Array<number>>();
    testMap.set('arr1', arr1);
    testMap.set('arr2', arr2);

    const result = lightWeightMap.hasAll(testMap);
    expect(result).assertTrue();
    console.log(TAG + "end");
  });

  /**
   * @tc.number    SUB_LIGHTWEIGHTMAP_TEST01_0027
   * @tc.name      testLightWeightMapTest01Chapter0027
   * @tc.desc      Verify hasAll with object values
   * @tc.size      MediumTest
   * @tc.type      Function
   * @tc.level     Level 2
   */
  it("testLightWeightMapTest01Chapter0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    const TAG = 'testLightWeightMapTest01Chapter0027';
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
   * @tc.number    SUB_LIGHTWEIGHTMAP_TEST01_0028
   * @tc.name      testLightWeightMapTest01Chapter0028
   * @tc.desc      Verify hasAll with object keys
   * @tc.size      MediumTest
   * @tc.type      Function
   * @tc.level     Level 2
   */
  it("testLightWeightMapTest01Chapter0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    const TAG = 'testLightWeightMapTest01Chapter0028';
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
   * @tc.number    SUB_LIGHTWEIGHTMAP_TEST01_0029
   * @tc.name      testLightWeightMapTest01Chapter0029
   * @tc.desc      Verify hasAll with class instances as values
   * @tc.size      MediumTest
   * @tc.type      Function
   * @tc.level     Level 2
   */
  it("testLightWeightMapTest01Chapter0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    const TAG = 'testLightWeightMapTest01Chapter0029';
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
   * @tc.number    SUB_LIGHTWEIGHTMAP_TEST01_0030
   * @tc.name      testLightWeightMapTest01Chapter0030
   * @tc.desc      Verify hasAll with TypedArray values (Int8Array)
   * @tc.size      MediumTest
   * @tc.type      Function
   * @tc.level     Level 2
   */
  it("testLightWeightMapTest01Chapter0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    const TAG = 'testLightWeightMapTest01Chapter0030';
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
   * @tc.number    SUB_LIGHTWEIGHTMAP_TEST01_0031
   * @tc.name      testLightWeightMapTest01Chapter0031
   * @tc.desc      Verify hasAll with TypedArray special values (Float64Array with NaN, Infinity)
   * @tc.size      MediumTest
   * @tc.type      Function
   * @tc.level     Level 2
   */
  it("testLightWeightMapTest01Chapter0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    const TAG = 'testLightWeightMapTest01Chapter0031';
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
   * @tc.number    SUB_LIGHTWEIGHTMAP_TEST01_0032
   * @tc.name      testLightWeightMapTest01Chapter0032
   * @tc.desc      Verify hasAll returns false when test map has extra keys
   * @tc.size      MediumTest
   * @tc.type      Function
   * @tc.level     Level 2
   */
  it("testLightWeightMapTest01Chapter0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    const TAG = 'testLightWeightMapTest01Chapter0032';
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
   * @tc.number    SUB_LIGHTWEIGHTMAP_TEST01_0033
   * @tc.name      testLightWeightMapTest01Chapter0033
   * @tc.desc      Verify hasAll returns false for partial match
   * @tc.size      MediumTest
   * @tc.type      Function
   * @tc.level     Level 2
   */
  it("testLightWeightMapTest01Chapter0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    const TAG = 'testLightWeightMapTest01Chapter0033';
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
   * @tc.number    SUB_LIGHTWEIGHTMAP_TEST01_0034
   * @tc.name      testLightWeightMapTest01Chapter0034
   * @tc.desc      Verify hasAll with Uint8Array TypedArray
   * @tc.size      MediumTest
   * @tc.type      Function
   * @tc.level     Level 2
   */
  it("testLightWeightMapTest01Chapter0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    const TAG = 'testLightWeightMapTest01Chapter0034';
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
   * @tc.number    SUB_LIGHTWEIGHTMAP_TEST01_0035
   * @tc.name      testLightWeightMapTest01Chapter0035
   * @tc.desc      Verify hasAll with mixed data types
   * @tc.size      MediumTest
   * @tc.type      Function
   * @tc.level     Level 2
   */
  it("testLightWeightMapTest01Chapter0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    const TAG = 'testLightWeightMapTest01Chapter0035';
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
   * @tc.number    SUB_LIGHTWEIGHTMAP_TEST01_0036
   * @tc.name      testLightWeightMapTest01Chapter0036
   * @tc.desc      Verify hasAll with null values
   * @tc.size      MediumTest
   * @tc.type      Function
   * @tc.level     Level 2
   */
  it("testLightWeightMapTest01Chapter0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    const TAG = 'testLightWeightMapTest01Chapter0036';
    console.log(TAG + 'start');
    const lightWeightMap = new LightWeightMap<string, number>();
    lightWeightMap.set('nullVal', null);

    const testMap = new LightWeightMap<string, number>();
    testMap.set('nullVal', null);

    const result = lightWeightMap.hasAll(testMap);
    expect(result).assertTrue();
    console.log(TAG + "end");
  });

  /**
   * @tc.number    SUB_LIGHTWEIGHTMAP_TEST01_0037
   * @tc.name      testLightWeightMapTest01Chapter0037
   * @tc.desc      Verify hasAll with self comparison
   * @tc.size      MediumTest
   * @tc.type      Function
   * @tc.level     Level 2
   */
  it("testLightWeightMapTest01Chapter0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    const TAG = 'testLightWeightMapTest01Chapter0037';
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
   * @tc.number    SUB_LIGHTWEIGHTMAP_TEST01_0038
   * @tc.name      testLightWeightMapTest01Chapter0038
   * @tc.desc      Verify hasAll with identical map
   * @tc.size      MediumTest
   * @tc.type      Function
   * @tc.level     Level 2
   */
  it("testLightWeightMapTest01Chapter0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    const TAG = 'testLightWeightMapTest01Chapter0038';
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
   * @tc.number    SUB_LIGHTWEIGHTMAP_TEST01_0039
   * @tc.name      testLightWeightMapTest01Chapter0039
   * @tc.desc      Verify hasAll with large number of elements
   * @tc.size      LargeTest
   * @tc.type      Function
   * @tc.level     Level 2
   */
    it("testLightWeightMapTest01Chapter0039", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest01Chapter0039';
      console.log(TAG + 'start');
      const lightWeightMap = new LightWeightMap<number, string>();
      const testMap = new LightWeightMap<number, string>();

      for (let i = 0; i < 100; i++) {
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
