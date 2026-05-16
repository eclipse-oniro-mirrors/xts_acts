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

function sleep(ms: number) {
  return new Promise<void>((resolve, reject) => setTimeout(resolve, ms));
}

export default function testLightWeightMapTest05() {
  describe('testLightWeightMapTest05', () => {
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
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST05_0001
     * @tc.name      testLightWeightMapTest05Chapter0001
     * @tc.desc      removeAt with normal index, expect true
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest05Chapter0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest05Chapter0001';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set('a', 1);
      lightWeightMap.set('b', 2);
      lightWeightMap.set('c', 3);
      const result = lightWeightMap.removeAt(1);
      expect(result).assertTrue();

      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST05_0002
     * @tc.name      testLightWeightMapTest05Chapter0002
     * @tc.desc      removeAt with first index (0), expect true
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest05Chapter0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest05Chapter0002';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set('a', 1);
      lightWeightMap.set('b', 2);
      const result = lightWeightMap.removeAt(0);
      expect(result).assertTrue();

      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST05_0003
     * @tc.name      testLightWeightMapTest05Chapter0003
     * @tc.desc      removeAt with last index, expect true
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest05Chapter0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest05Chapter0003';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set('a', 1);
      lightWeightMap.set('b', 2);
      lightWeightMap.set('c', 3);
      const lastIndex = lightWeightMap.length - 1;
      const result = lightWeightMap.removeAt(lastIndex);
      expect(result).assertTrue();

      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST05_0004
     * @tc.name      testLightWeightMapTest05Chapter0004
     * @tc.desc      removeAt with negative index, expect false
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest05Chapter0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest05Chapter0004';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set('a', 1);
      lightWeightMap.set('b', 2);
      const result = lightWeightMap.removeAt(-1);
      expect(result).assertFalse();

      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST05_0005
     * @tc.name      testLightWeightMapTest05Chapter0005
     * @tc.desc      removeAt with out-of-range positive index, expect false
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest05Chapter0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest05Chapter0005';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set('a', 1);
      const result = lightWeightMap.removeAt(10);
      expect(result).assertFalse();

      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST05_0006
     * @tc.name      testLightWeightMapTest05Chapter0006
     * @tc.desc      removeAt with float index (truncated), expect true
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest05Chapter0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest05Chapter0006';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set('a', 1);
      lightWeightMap.set('b', 2);
      lightWeightMap.set('c', 3);
      const result = lightWeightMap.removeAt(Math.floor(1.5)); // 截断为 1
      expect(result).assertTrue();

      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST05_0007
     * @tc.name      testLightWeightMapTest05Chapter0007
     * @tc.desc      removeAt with NaN index, expect false
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest05Chapter0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest05Chapter0007';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set('a', 1);
      let result: boolean = false;
      try {
        lightWeightMap.removeAt(NaN);
      } catch(e) {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST05_0008
     * @tc.name      testLightWeightMapTest05Chapter0008
     * @tc.desc      removeAt with Infinity index, expect false
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest05Chapter0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest05Chapter0008';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set('a', 1);
      let result: boolean = false;
      try {
        lightWeightMap.removeAt(Infinity);
      } catch(e) {
        result = true;
      }
      expect(result).assertTrue();

      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST05_0009
     * @tc.name      testLightWeightMapTest05Chapter0009
     * @tc.desc      removeAt with -Infinity index, expect false
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest05Chapter0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest05Chapter0009';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set('a', 1);
      let result: boolean = false;
      try {
        lightWeightMap.removeAt(-Infinity);
      } catch(e) {
        result = true;
      }
      expect(result).assertTrue();

      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST05_0010
     * @tc.name      testLightWeightMapTest05Chapter0010
     * @tc.desc      removeAt on empty map, expect false
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest05Chapter0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest05Chapter0010';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      const result = lightWeightMap.removeAt(0);
      expect(result).assertFalse();

      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST05_0011
     * @tc.name      testLightWeightMapTest05Chapter0011
     * @tc.desc      removeAt with large index (INT32_MAX), expect false
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest05Chapter0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest05Chapter0011';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set('k1', 1);
      lightWeightMap.set('k2', 2);
      const result = lightWeightMap.removeAt(2147483647);
      expect(result).assertFalse();

      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST05_0012
     * @tc.name      testLightWeightMapTest05Chapter0012
     * @tc.desc      removeAt with large negative index (INT32_MIN), expect false
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest05Chapter0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest05Chapter0012';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set('k1', 1);
      lightWeightMap.set('k2', 2);
      const result = lightWeightMap.removeAt(-2147483648);
      expect(result).assertFalse();

      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST05_0013
     * @tc.name      testLightWeightMapTest05Chapter0013
     * @tc.desc      removeAt all items by repeatedly removing index 0, expect true each time
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest05Chapter0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest05Chapter0013';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set('a', 1);
      lightWeightMap.set('b', 2);
      lightWeightMap.set('c', 3);

      let result = lightWeightMap.removeAt(0);
      expect(result).assertTrue();
      result = lightWeightMap.removeAt(0);
      expect(result).assertTrue();
      result = lightWeightMap.removeAt(0);
      expect(result).assertTrue();

      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST05_0014
     * @tc.name      testLightWeightMapTest05Chapter0014
     * @tc.desc      removeAt after clear, expect false
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest05Chapter0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest05Chapter0014';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set('a', 1);
      lightWeightMap.set('b', 2);
      lightWeightMap.clear();
      const result = lightWeightMap.removeAt(0);
      expect(result).assertFalse();

      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST05_0015
     * @tc.name      testLightWeightMapTest05Chapter0015
     * @tc.desc      removeAt with Math.floor(1.5) index
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest05Chapter0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest05Chapter0015';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set("a", 1);
      lightWeightMap.set("b", 2);
      const index = Math.floor(1.5); // 1
      const result = lightWeightMap.removeAt(index);
      expect(result).assertTrue();

      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST05_0016
     * @tc.name      testLightWeightMapTest05Chapter0016
     * @tc.desc      removeAt with Number.MAX_VALUE index, expect false
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest05Chapter0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest05Chapter0016';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      let result: boolean = false;
      try {
        lightWeightMap.removeAt(Number.MAX_VALUE);
      } catch(e) {
        result = true;
      }
      expect(result).assertTrue();

      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST05_0017
     * @tc.name      testLightWeightMapTest05Chapter0017
     * @tc.desc      removeAt with Number.MIN_VALUE index, expect false
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest05Chapter0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest05Chapter0017';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      let result: boolean = false;
      try {
        lightWeightMap.removeAt(Number.MIN_VALUE);
      } catch(e) {
        result = true;
      }
      expect(result).assertTrue();

      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST05_0018
     * @tc.name      testLightWeightMapTest05Chapter0018
     * @tc.desc      removeAt with Number.EPSILON index, expect false
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest05Chapter0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest05Chapter0018';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      let result: boolean = false;
      try {
        lightWeightMap.removeAt(Number.EPSILON);
      } catch(e) {
        result = true;
      }
      expect(result).assertTrue();

      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST05_0019
     * @tc.name      testLightWeightMapTest05Chapter0019
     * @tc.desc      removeAt with Number.MAX_SAFE_INTEGER index, expect false
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest05Chapter0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest05Chapter0019';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      let result: boolean = false;
      try {
        lightWeightMap.removeAt(Number.MAX_SAFE_INTEGER);
      } catch(e) {
        result = true;
      }
      expect(result).assertTrue();

      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST05_0020
     * @tc.name      testLightWeightMapTest05Chapter0020
     * @tc.desc      removeAt with byte min index (-128), expect false
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest05Chapter0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest05Chapter0020';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set("x", 1);
      const result = lightWeightMap.removeAt(-128);
      expect(result).assertFalse();

      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST05_0021
     * @tc.name      testLightWeightMapTest05Chapter0021
     * @tc.desc      removeAt with byte max index (127), expect false
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest05Chapter0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest05Chapter0021';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set("a", 1);
      lightWeightMap.set("b", 2);
      const result = lightWeightMap.removeAt(127);
      expect(result).assertFalse();

      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST05_0022
     * @tc.name      testLightWeightMapTest05Chapter0022
     * @tc.desc      removeAt with short min index (-32768), expect false
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest05Chapter0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest05Chapter0022';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set("a", 1);
      const result = lightWeightMap.removeAt(-32768);
      expect(result).assertFalse();

      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST05_0023
     * @tc.name      testLightWeightMapTest05Chapter0023
     * @tc.desc      removeAt with short max index (32767), expect false
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest05Chapter0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest05Chapter0023';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set("a", 1);
      const result = lightWeightMap.removeAt(32767);
      expect(result).assertFalse();

      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST05_0024
     * @tc.name      testLightWeightMapTest05Chapter0024
     * @tc.desc      removeAt with int min index (-2147483648), expect false
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest05Chapter0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest05Chapter0024';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set("a", 1);
      const result = lightWeightMap.removeAt(-2147483648);
      expect(result).assertFalse();

      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST05_0025
     * @tc.name      testLightWeightMapTest05Chapter0025
     * @tc.desc      removeAt with int max index (2147483647), expect false
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest05Chapter0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest05Chapter0025';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set("a", 1);
      const result = lightWeightMap.removeAt(2147483647);
      expect(result).assertFalse();

      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST05_0026
     * @tc.name      testLightWeightMapTest05Chapter0026
     * @tc.desc      removeAt with long min index (-9223372036854775808), expect false
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest05Chapter0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest05Chapter0026';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      const longMin = -9223372036854775808;
      let result: boolean = false;
      try {
        lightWeightMap.getValueAt(longMin);
      } catch(e) {
        result = true;
      }
      expect(result).assertTrue();

      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST05_0027
     * @tc.name      testLightWeightMapTest05Chapter0027
     * @tc.desc      removeAt with long max index (9223372036854775807), expect false
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest05Chapter0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest05Chapter0027';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      const longMax = 9223372036854775807;
      let result: boolean = false;
      try {
        lightWeightMap.getValueAt(longMax);
      } catch(e) {
        result = true;
      }
      expect(result).assertTrue();

      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST05_0028
     * @tc.name      testLightWeightMapTest05Chapter0028
     * @tc.desc      removeAt with float min index (1.401298e-45), expect false
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest05Chapter0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest05Chapter0028';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      const floatMin = 1.40129846432481707e-45;
      let result: boolean = false;
      try {
        lightWeightMap.getValueAt(floatMin);
      } catch(e) {
        result = true;
      }
      expect(result).assertTrue();

      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST05_0029
     * @tc.name      testLightWeightMapTest05Chapter0029
     * @tc.desc      removeAt with float max index (3.402823e+38), expect false
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest05Chapter0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest05Chapter0029';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      const floatMax = 3.40282346638528860e+38;
      let result: boolean = false;
      try {
        lightWeightMap.getValueAt(floatMax);
      } catch(e) {
        result = true;
      }
      expect(result).assertTrue();

      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST05_0030
     * @tc.name      testLightWeightMapTest05Chapter0030
     * @tc.desc      removeAt with double min index (4.940656e-324), expect false
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest05Chapter0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest05Chapter0030';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      const doubleMin = 4.94065645841246544e-324;
      let result: boolean = false;
      try {
        lightWeightMap.getValueAt(doubleMin);
      } catch(e) {
        result = true;
      }
      expect(result).assertTrue();

      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST05_0031
     * @tc.name      testLightWeightMapTest05Chapter0031
     * @tc.desc      removeAt with double max index (1.797693e+308), expect false
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest05Chapter0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest05Chapter0031';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      const doubleMax = 1.79769313486231570e+308;
      let result: boolean = false;
      try {
        lightWeightMap.getValueAt(doubleMax);
      } catch(e) {
        result = true;
      }
      expect(result).assertTrue();

      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST05_0032
     * @tc.name      testLightWeightMapTest05Chapter0032
     * @tc.desc      removeAt with char min index (0), expect true
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest05Chapter0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest05Chapter0032';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set("only", 1);
      const charMin = 0;
      const result = lightWeightMap.removeAt(charMin);
      expect(result).assertTrue();

      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST05_0033
     * @tc.name      testLightWeightMapTest05Chapter0033
     * @tc.desc      removeAt with char max index (65535), expect false
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest05Chapter0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest05Chapter0033';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      const charMax = 65535;
      const result = lightWeightMap.removeAt(charMax);
      expect(result).assertFalse();

      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST05_0034
     * @tc.name      testLightWeightMapTest05Chapter0034
     * @tc.desc      removeAt with BigInt index converted to number, expect false
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest05Chapter0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest05Chapter0034';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      let result: boolean = false;
      try {
        lightWeightMap.removeAt(Number(BigInt(0xdecafafecacefade)));
      } catch(e) {
        result = true;
      }
      expect(result).assertTrue();

      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST05_0035
     * @tc.name      testLightWeightMapTest05Chapter0035
     * @tc.desc      removeAt with 123.456 as index, expect false
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest05Chapter0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest05Chapter0035';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      let result: boolean = false;
      try {
        lightWeightMap.removeAt(123.456);
      } catch(e) {
        result = true;
      }
      expect(result).assertTrue();

      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST05_0036
     * @tc.name      testLightWeightMapTest05Chapter0036
     * @tc.desc      removeAt with hex index 0xcafebabe, expect false
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest05Chapter0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest05Chapter0036';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      let result: boolean = false;
      try {
        lightWeightMap.removeAt(0xcafebabe);
      } catch(e) {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST05_0037
     * @tc.name      testLightWeightMapTest05Chapter0037
     * @tc.desc      removeAt with exponent index 2 ** 3, expect true
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest05Chapter0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest05Chapter0037';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      for (let i = 0; i < 10; i++) {
        lightWeightMap.set(`k${i}`, i);
      }
      const idx = 2 ** 3; // 8
      const result = lightWeightMap.removeAt(idx);
      expect(result).assertTrue();

      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST05_0038
     * @tc.name      testLightWeightMapTest05Chapter0038
     * @tc.desc      removeAt with scientific notation index 1e3, expect false
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest05Chapter0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest05Chapter0038';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set("a", 1);
      const idx = 1e3;
      const result = lightWeightMap.removeAt(idx);
      expect(result).assertFalse();

      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST05_0039
     * @tc.name      testLightWeightMapTest05Chapter0039
     * @tc.desc      Check whether the LightWeightMap works normally after adding data
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest05Chapter0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest05Chapter0039';
      console.log(TAG + 'start');
      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set("squirrel", 123);
      lightWeightMap.set("sparrow", 356);
      const result = lightWeightMap.setValueAt(1, 3546);
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST05_0040
     * @tc.name      testLightWeightMapTest05Chapter0040
     * @tc.desc      Check whether the LightWeightMap works normally after adding data
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest05Chapter0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest05Chapter0040';
      console.log(TAG + 'start');
      const lightWeightMap = new LightWeightMap<string, Uint8Array>();
      lightWeightMap.set("squirrel", new Uint8Array([100]));
      lightWeightMap.set("sparrow", new Uint8Array([9]));
      const result = lightWeightMap.setValueAt(-0, new Uint8Array([20]));
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST05_0041
     * @tc.name      testLightWeightMapTest05Chapter0041
     * @tc.desc      Check whether the LightWeightMap works normally after adding data
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest05Chapter0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest05Chapter0041';
      console.log(TAG + 'start');
      const lightWeightMap = new LightWeightMap<string, Uint8Array>();
      lightWeightMap.set("squirrel", new Uint8Array([100]));
      lightWeightMap.set("sparrow", new Uint8Array([9]));
      let result:boolean = false;
      try {
        lightWeightMap.setValueAt(NaN, new Uint8Array([20]));
      }catch(e){
        result = e instanceof Error;
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST05_0042
     * @tc.name      testLightWeightMapTest05Chapter0042
     * @tc.desc      Check whether the LightWeightMap works normally after adding data
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest05Chapter0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest05Chapter0042';
      console.log(TAG + 'start');
      const lightWeightMap = new LightWeightMap<string, Uint8Array>();
      lightWeightMap.set("squirrel", new Uint8Array([100]));
      lightWeightMap.set("sparrow", new Uint8Array([9]));
      let result:boolean = false;
      try {
        lightWeightMap.setValueAt(undefined, new Uint8Array([20]));
      }catch(e){
        result = e instanceof Error;
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST05_0043
     * @tc.name      testLightWeightMapTest05Chapter0043
     * @tc.desc      Check whether the LightWeightMap works normally after adding data
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest05Chapter0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest05Chapter0043';
      console.log(TAG + 'start');
      const lightWeightMap = new LightWeightMap<string, Uint8Array>();
      lightWeightMap.set("squirrel", new Uint8Array([100]));
      lightWeightMap.set("sparrow", new Uint8Array([9]));
      let result:boolean = false;
      try {
        lightWeightMap.setValueAt(Infinity, new Uint8Array([20]));
      }catch(e){
        result = e instanceof Error;
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST05_0044
     * @tc.name      testLightWeightMapTest05Chapter0044
     * @tc.desc      Test LightWeightMap setValueAt with -Infinity (string key, Uint8Array value)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest05Chapter0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest05Chapter0044';
      console.log(TAG + 'start');
      const lightWeightMap = new LightWeightMap<string, Uint8Array>();
      lightWeightMap.set("squirrel", new Uint8Array([100]));
      lightWeightMap.set("sparrow", new Uint8Array([9]));
      let result: boolean = false;
      try {
        lightWeightMap.setValueAt(-Infinity, new Uint8Array([20]));
      } catch (e) {
        result = e instanceof Error;
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST05_0045
     * @tc.name      testLightWeightMapTest05Chapter0045
     * @tc.desc      Test LightWeightMap setValueAt with Math.floor(1.5) (object key, boolean value)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest05Chapter0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest05Chapter0045';
      console.log(TAG + 'start');

      interface MyObj {
        id: number;
        name: string;
        active: boolean;
      }

      const obj1: MyObj = { id: 1, name: "obj1", active: true };
      const obj2: MyObj = { id: 2, name: "obj2", active: false };

      const lightWeightMap = new LightWeightMap<object, boolean>();
      lightWeightMap.set(obj1, true);
      lightWeightMap.set(obj2, false);

      const result = lightWeightMap.setValueAt(Math.floor(1.5), false);
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST05_0046
     * @tc.name      testLightWeightMapTest05Chapter0046
     * @tc.desc      Test LightWeightMap setValueAt with Number.MAX_VALUE (class key, number value)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest05Chapter0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest05Chapter0046';
      console.log(TAG + 'start');
      const instance1 = new TestClass(1, "Alice");
      const instance2 = new TestClass(2, "Bob");

      const lightWeightMap = new LightWeightMap<object, number>();
      lightWeightMap.set(instance1, 1000);
      lightWeightMap.set(instance2, 2000);

      let result: boolean = false;
      try {
        lightWeightMap.setValueAt(Number.MAX_VALUE, 3000);
      } catch (e) {
        result = e instanceof Error;
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST05_0047
     * @tc.name      testLightWeightMapTest05Chapter0047
     * @tc.desc      Test LightWeightMap setValueAt with Number.MIN_VALUE (string key, boolean value)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest05Chapter0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest05Chapter0047';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, boolean>();
      lightWeightMap.set("item1", true);
      lightWeightMap.set("item2", false);
      lightWeightMap.set("item3", true);

      let result: boolean = false;
      try {
        lightWeightMap.setValueAt(Number.MIN_VALUE, false);
      } catch (e) {
        result = e instanceof Error;
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST05_0048
     * @tc.name      testLightWeightMapTest05Chapter0048
     * @tc.desc      Test LightWeightMap setValueAt with Number.EPSILON (object key, Uint8Array value)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest05Chapter0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest05Chapter0048';
      console.log(TAG + 'start');

      interface Point {
        x: number;
        y: number;
        z: number;
      }

      const point1: Point = { x: 1, y: 2, z: 3 };
      const point2: Point = { x: 4, y: 5, z: 6 };

      const lightWeightMap = new LightWeightMap<object, Uint8Array>();
      lightWeightMap.set(point1, new Uint8Array([10, 20, 30]));
      lightWeightMap.set(point2, new Uint8Array([40, 50, 60]));

      let result: boolean = false;
      try {
        lightWeightMap.setValueAt(Number.EPSILON, new Uint8Array([70, 80, 90]));
      } catch (e) {
        result = e instanceof Error;
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST05_0049
     * @tc.name      testLightWeightMapTest05Chapter0049
     * @tc.desc      Test LightWeightMap setValueAt with Number.MAX_SAFE_INTEGER (class key, boolean value)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest05Chapter0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest05Chapter0049';
      console.log(TAG + 'start');
      const instance1 = new TestClass(1, "Laptop");
      const instance2 = new TestClass(2, "Phone");
      const lightWeightMap = new LightWeightMap<object, boolean>();
      lightWeightMap.set(instance1, true);
      lightWeightMap.set(instance2, false);
      let result: boolean = false;
      try {
        lightWeightMap.setValueAt(Number.MAX_SAFE_INTEGER, true);
      } catch (e) {
        result = e instanceof Error;
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST05_0050
     * @tc.name      testLightWeightMapTest05Chapter0050
     * @tc.desc      Test LightWeightMap setValueAt with byte min value (-128) (string key, number value)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest05Chapter0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest05Chapter0050';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set("score1", 95);
      lightWeightMap.set("score2", 85);
      lightWeightMap.set("score3", 75);
      let result:boolean = false;
      try {
        lightWeightMap.setValueAt(-128, 100);
      }catch(e){
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST05_0051
     * @tc.name      testLightWeightMapTest05Chapter0051
     * @tc.desc      Test LightWeightMap setValueAt with byte max value (127) (object key, number value)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest05Chapter0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest05Chapter0051';
      console.log(TAG + 'start');

      interface Config {
        key: string;
        value: number;
        enabled: boolean;
      }

      const config1: Config = { key: "theme", value: 200, enabled: true };
      const config2: Config = { key: "notifications", value: 14, enabled: false };

      const lightWeightMap = new LightWeightMap<object, number>();
      lightWeightMap.set(config1, 1);
      lightWeightMap.set(config2, 2);
      let result:boolean = false;
      try {
        lightWeightMap.setValueAt(127, 3);
      }catch(e){
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST05_0052
     * @tc.name      testLightWeightMapTest05Chapter0052
     * @tc.desc      Test LightWeightMap setValueAt with short min value (-32768) (class key, Uint8Array value)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest05Chapter0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest05Chapter0052';
      console.log(TAG + 'start');

      const instance1 = new TestClass(1, "John");
      const instance2 = new TestClass(2, "Jane");

      const lightWeightMap = new LightWeightMap<object, Uint8Array>();
      lightWeightMap.set(instance1, new Uint8Array([85, 90, 95]));
      lightWeightMap.set(instance2, new Uint8Array([92, 88, 96]));
      let result:boolean = false;
      try{
        lightWeightMap.setValueAt(-32768, new Uint8Array([100, 100, 100]));
      }catch(e){
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST05_0053
     * @tc.name      testLightWeightMapTest05Chapter0053
     * @tc.desc      Test LightWeightMap setValueAt with short max value (32767) (string key, boolean value)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest05Chapter0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest05Chapter0053';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, boolean>();
      lightWeightMap.set("flag1", true);
      lightWeightMap.set("flag2", false);
      lightWeightMap.set("flag3", true);
      lightWeightMap.set("flag4", false);
      let result:boolean = false;
      try{
        lightWeightMap.setValueAt(32767, true);
      }catch(e){
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST05_0054
     * @tc.name      testLightWeightMapTest05Chapter0054
     * @tc.desc      Test LightWeightMap setValueAt with int min value (-2147483648) (object key, boolean value)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest05Chapter0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest05Chapter0054';
      console.log(TAG + 'start');

      interface LogEntry {
        timestamp: number;
        message: string;
        level: string;
      }

      const log1: LogEntry = { timestamp: Date.now(), message: "System started", level: "INFO" };
      const log2: LogEntry = { timestamp: Date.now() + 1000, message: "User logged in", level: "DEBUG" };

      const lightWeightMap = new LightWeightMap<object, boolean>();
      lightWeightMap.set(log1, true);
      lightWeightMap.set(log2, false);
      let result:boolean = false;
      try{
        lightWeightMap.setValueAt(-2147483648, true);
      }catch(e){
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST05_0055
     * @tc.name      testLightWeightMapTest05Chapter0055
     * @tc.desc      Test LightWeightMap setValueAt with int max value (2147483647) (class key, number value)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest05Chapter0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest05Chapter0055';
      console.log(TAG + 'start');
      const instance1 = new TestClass(1001, "Alice");
      const instance2 = new TestClass(1002, "Bob");

      const lightWeightMap = new LightWeightMap<object, number>();
      lightWeightMap.set(instance1, 50000);
      lightWeightMap.set(instance2, 60000);
      let result:boolean = false;
      try{
        lightWeightMap.setValueAt(2147483647, 75000);
      }catch(e){
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST05_0056
     * @tc.name      testLightWeightMapTest05Chapter0056
     * @tc.desc      Test LightWeightMap setValueAt with long min value (string key, Uint8Array value)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest05Chapter0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest05Chapter0056';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, Uint8Array>();
      lightWeightMap.set("data1", new Uint8Array([1, 2, 3]));
      lightWeightMap.set("data2", new Uint8Array([4, 5, 6]));

      const longMin = -9223372036854775808;
      let result: boolean = false;
      try {
        lightWeightMap.setValueAt(longMin, new Uint8Array([7, 8, 9]));
      } catch (e) {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST05_0057
     * @tc.name      testLightWeightMapTest05Chapter0057
     * @tc.desc      Test LightWeightMap setValueAt with long max value (object key, number value)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest05Chapter0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest05Chapter0057';
      console.log(TAG + 'start');

      interface Coordinate {
        x: number;
        y: number;
        z: number;
      }

      const coord1: Coordinate = { x: 10, y: 20, z: 30 };
      const coord2: Coordinate = { x: 40, y: 50, z: 60 };

      const lightWeightMap = new LightWeightMap<object, number>();
      lightWeightMap.set(coord1, 100);
      lightWeightMap.set(coord2, 200);

      const longMax = 9223372036854775807;
      let result: boolean = false;
      try {
        lightWeightMap.setValueAt(longMax, 300);
      } catch (e) {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST05_0058
     * @tc.name      testLightWeightMapTest05Chapter0058
     * @tc.desc      Test LightWeightMap setValueAt with float min value (class key, boolean value)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest05Chapter0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest05Chapter0058';
      console.log(TAG + 'start');

      const instance1 = new TestClass(1, "Book One");
      const instance2 = new TestClass(2, "Book Two");

      const lightWeightMap = new LightWeightMap<object, boolean>();
      lightWeightMap.set(instance1, true);
      lightWeightMap.set(instance2, false);

      const floatMin = 1.40129846432481707e-45;
      let result: boolean = false;
      try {
        lightWeightMap.setValueAt(floatMin, true);
      } catch (e) {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST05_0059
     * @tc.name      testLightWeightMapTest05Chapter0059
     * @tc.desc      Test LightWeightMap setValueAt with float max value (string key, number value)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest05Chapter0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest05Chapter0059';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set("temp1", 25.5);
      lightWeightMap.set("temp2", 30.2);
      lightWeightMap.set("temp3", 18.7);

      const floatMax = 3.40282346638528860e+38;
      let result: boolean = false;
      try {
        lightWeightMap.setValueAt(floatMax, 42.0);
      } catch (e) {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST05_0060
     * @tc.name      testLightWeightMapTest05Chapter0060
     * @tc.desc      Test LightWeightMap setValueAt with double min value (object key, Uint8Array value)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest05Chapter0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest05Chapter0060';
      console.log(TAG + 'start');

      interface SensorData {
        sensorId: string;
        timestamp: number;
        value: number;
      }

      const data1: SensorData = { sensorId: "S001", timestamp: Date.now(), value: 23.4 };
      const data2: SensorData = { sensorId: "S002", timestamp: Date.now(), value: 45.6 };

      const lightWeightMap = new LightWeightMap<object, Uint8Array>();
      lightWeightMap.set(data1, new Uint8Array([1, 2, 3, 4]));
      lightWeightMap.set(data2, new Uint8Array([5, 6, 7, 8]));

      const doubleMin = 4.94065645841246544e-324;
      let result: boolean = false;
      try {
        lightWeightMap.setValueAt(doubleMin, new Uint8Array([9, 10, 11, 12]));
      } catch (e) {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST05_0061
     * @tc.name      testLightWeightMapTest05Chapter0061
     * @tc.desc      Test LightWeightMap setValueAt with double max value (class key, boolean value)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest05Chapter0061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest05Chapter0061';
      console.log(TAG + 'start');
      const instance1 = new TestClass(1, "John Doe");
      const instance2 = new TestClass(2, "Jane Smith");

      const lightWeightMap = new LightWeightMap<object, boolean>();
      lightWeightMap.set(instance1, true);
      lightWeightMap.set(instance2, false);

      const doubleMax = 1.79769313486231570e+308;
      let result: boolean = false;
      try {
        lightWeightMap.setValueAt(doubleMax, true);
      } catch (e) {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST05_0062
     * @tc.name      testLightWeightMapTest05Chapter0062
     * @tc.desc      Test LightWeightMap setValueAt with char min value (string key, number value)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest05Chapter0062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest05Chapter0062';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set("code1", 65); // 'A'
      lightWeightMap.set("code2", 66); // 'B'
      lightWeightMap.set("code3", 67); // 'C'

      const charMin = 0;
      const result = lightWeightMap.setValueAt(charMin, 90); // 'Z'
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST05_0063
     * @tc.name      testLightWeightMapTest05Chapter0063
     * @tc.desc      Test LightWeightMap setValueAt with char max value (object key, boolean value)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest05Chapter0063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest05Chapter0063';
      console.log(TAG + 'start');

      interface CharacterInfo {
        charCode: number;
        char: string;
        unicode: string;
      }

      const char1: CharacterInfo = { charCode: 65, char: 'A', unicode: 'U+0041' };
      const char2: CharacterInfo = { charCode: 66, char: 'B', unicode: 'U+0042' };

      const lightWeightMap = new LightWeightMap<object, boolean>();
      lightWeightMap.set(char1, true);
      lightWeightMap.set(char2, false);

      const charMax = 65535;
      let result: boolean = false;
      try {
        lightWeightMap.setValueAt(charMax, true);
      } catch (e) {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST05_0064
     * @tc.name      testLightWeightMapTest05Chapter0064
     * @tc.desc      Test LightWeightMap setValueAt with BigInt value (class key, Uint8Array value)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest05Chapter0064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest05Chapter0064';
      console.log(TAG + 'start');
      const instance1 = new TestClass(1, "Key One");
      const instance2 = new TestClass(2, "Key Two");

      const lightWeightMap = new LightWeightMap<object, Uint8Array>();
      lightWeightMap.set(instance1, new Uint8Array([0xDE, 0xCA, 0xFA, 0xFE]));
      lightWeightMap.set(instance2, new Uint8Array([0xCA, 0xFE, 0xBA, 0xBE]));

      const bigIntValue = BigInt("0xdecafafecacefade");
      let result: boolean = false;
      try {
        const numValue = Number(bigIntValue);
        lightWeightMap.setValueAt(numValue, new Uint8Array([0xFF, 0xFF, 0xFF, 0xFF]));
      } catch (e) {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');

    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST05_0065
     * @tc.name      testLightWeightMapTest05Chapter0065
     * @tc.desc      Test LightWeightMap setValueAt with double value 123.456 (string key, boolean value)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest05Chapter0065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest05Chapter0065';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, boolean>();
      lightWeightMap.set("check1", true);
      lightWeightMap.set("check2", false);
      lightWeightMap.set("check3", true);

      const doubleValue = 123.456;
      let result: boolean = false;
      try {
        lightWeightMap.setValueAt(doubleValue, false);
      } catch (e) {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST05_0066
     * @tc.name      testLightWeightMapTest05Chapter0066
     * @tc.desc      Test LightWeightMap setValueAt with float value 0xcafebabe (string key + number value)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest05Chapter0066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest05Chapter0066';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set("hex1", 0xCA);
      lightWeightMap.set("hex2", 0xFE);
      lightWeightMap.set("hex3", 0xBA);
      lightWeightMap.set("hex4", 0xBE);

      const floatValue = 0xcafebabe;
      let result: boolean = false;
      try {
        lightWeightMap.setValueAt(floatValue, 0xFFFFFFFF);
      } catch (e) {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST05_0067
     * @tc.name      testLightWeightMapTest05Chapter0067
     * @tc.desc      Test LightWeightMap setValueAt with 16Hex 0x0102 (number key + number value)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest05Chapter0067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest05Chapter0067';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<number, number>();
      lightWeightMap.set(0x0001, 100);
      lightWeightMap.set(0x0002, 200);
      lightWeightMap.set(0x0003, 300);

      const hexValue = 0x0102;
      let result: boolean = false;
      try {
        lightWeightMap.setValueAt(hexValue, 400);
      } catch (e) {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST05_0068
     * @tc.name      testLightWeightMapTest05Chapter0068
     * @tc.desc      Test LightWeightMap setValueAt with 32Hex 0x01020304 (string key + boolean value)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest05Chapter0068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest05Chapter0068';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, boolean>();
      lightWeightMap.set("packet1", true);
      lightWeightMap.set("packet2", false);
      lightWeightMap.set("packet3", true);
      lightWeightMap.set("packet4", false);

      const hex32Value = 0x01020304;
      let result: boolean = false;
      try {
        lightWeightMap.setValueAt(hex32Value, true);
      } catch (e) {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST05_0069
     * @tc.name      testLightWeightMapTest05Chapter0069
     * @tc.desc      Test LightWeightMap setValueAt with 8Hex 0x3 (number key + boolean value)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest05Chapter0069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest05Chapter0069';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<number, boolean>();
      lightWeightMap.set(0x1, true);
      lightWeightMap.set(0x2, false);
      lightWeightMap.set(0x4, true);

      const octalValue = 0x3; // 实际上是十六进制3
      let result: boolean = false;
      try {
        lightWeightMap.setValueAt(octalValue, false);
      } catch (e) {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST05_0070
     * @tc.name      testLightWeightMapTest05Chapter0070
     * @tc.desc      Test LightWeightMap setValueAt with  2 ** 3 (string key + number value)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest05Chapter0070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest05Chapter0070';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set("square1", 1 ** 2);
      lightWeightMap.set("square2", 2 ** 2);
      lightWeightMap.set("square3", 3 ** 2);

      const exponentValue = 2 ** 3; // 8
      let result: boolean = false;
      try {
        lightWeightMap.setValueAt(exponentValue, 4 ** 2);
      } catch (e) {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST05_0071
     * @tc.name      testLightWeightMapTest05Chapter0071
     * @tc.desc      Test LightWeightMap setValueAt with 1e3 (number key + number value)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest05Chapter0071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest05Chapter0071';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<number, number>();
      lightWeightMap.set(1e1, 10);
      lightWeightMap.set(1e2, 100);
      lightWeightMap.set(1e4, 10000);

      const scientific1 = 1e3; // 1000
      let result: boolean = false;
      try {
        lightWeightMap.setValueAt(scientific1, 100000);
      } catch (e) {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST05_0072
     * @tc.name      testLightWeightMapTest05Chapter0072
     * @tc.desc      Test LightWeightMap setValueAt with 2.5e-2 (string key + boolean value)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest05Chapter0072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest05Chapter0072';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, boolean>();
      lightWeightMap.set("small1", true);
      lightWeightMap.set("small2", false);
      lightWeightMap.set("small3", true);

      const scientific2 = 2.5e-2; // 0.025
      let result: boolean = false;
      try {
        lightWeightMap.setValueAt(scientific2, false);
      } catch (e) {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST05_0073
     * @tc.name      testLightWeightMapTest05Chapter0073
     * @tc.desc      Test LightWeightMap setValueAt with 16Hex 0x0102 (number key + number value)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest05Chapter0073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest05Chapter0073';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<number, number>();
      lightWeightMap.set(0x0001, 100);
      lightWeightMap.set(0x0002, 200);
      lightWeightMap.set(0x0003, 300);

      const BigInt = 9007199254740991n;
      let result: boolean = false;
      try {
        lightWeightMap.setValueAt(Number(BigInt), 400);
      } catch (e) {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });


  });
}
