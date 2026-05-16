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

export default function testLightWeightMapTest06() {
  describe('testLightWeightMapTest06', () => {
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
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST06_0001
     * @tc.name      testLightWeightMapTest06Chapter0001
     * @tc.desc      Test getValueAt with index 0 (first element)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest06Chapter0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest06Chapter0001';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set("squirrel", 123);
      lightWeightMap.set("sparrow", 356);
      lightWeightMap.set("eagle", 789);

      const result = lightWeightMap.getValueAt(0);
      expect(result).assertEqual(789);
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST06_0002
     * @tc.name      testLightWeightMapTest06Chapter0002
     * @tc.desc      Test getValueAt with undefined parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest06Chapter0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest06Chapter0002';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set("squirrel", 123);
      lightWeightMap.set("sparrow", 356);
      let result: boolean = false;
      try {
        lightWeightMap.getValueAt(undefined);
      } catch(e) {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST06_0003
     * @tc.name      testLightWeightMapTest06Chapter0003
     * @tc.desc      Test getValueAt with NaN parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest06Chapter0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest06Chapter0003';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set("squirrel", 123);
      lightWeightMap.set("sparrow", 356);
      let result: boolean = false;
      try {
        lightWeightMap.getValueAt(NaN);
      } catch(e) {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST06_0004
     * @tc.name      testLightWeightMapTest06Chapter0004
     * @tc.desc      Test getValueAt with -0 parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest06Chapter0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest06Chapter0004';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set("squirrel", 123);

      const result = lightWeightMap.getValueAt(-0);
      expect(result).assertEqual(123);
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST06_0005
     * @tc.name      testLightWeightMapTest06Chapter0005
     * @tc.desc      Test getValueAt with Infinity parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest06Chapter0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest06Chapter0005';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set("squirrel", 123);
      lightWeightMap.set("sparrow", 356);
      let result: boolean = false;
      try {
        lightWeightMap.getValueAt(Infinity);
      } catch(e) {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST06_0006
     * @tc.name      testLightWeightMapTest06Chapter0006
     * @tc.desc      Test getValueAt with -Infinity parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest06Chapter0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest06Chapter0006';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set("squirrel", 123);
      lightWeightMap.set("sparrow", 356);
      let result: boolean = false;
      try {
        lightWeightMap.getValueAt(-Infinity);
      } catch(e) {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST06_0007
     * @tc.name      testLightWeightMapTest06Chapter0007
     * @tc.desc      Test getValueAt with negative index parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest06Chapter0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest06Chapter0007';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set("squirrel", 123);
      lightWeightMap.set("sparrow", 356);
      let result: boolean = false;
      try {
        lightWeightMap.getValueAt(-1);
      } catch(e) {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST06_0008
     * @tc.name      testLightWeightMapTest06Chapter0008
     * @tc.desc      Test getValueAt with index out of range
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest06Chapter0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest06Chapter0008';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set("squirrel", 123);
      lightWeightMap.set("sparrow", 356);
      let result: boolean = false;
      try {
        lightWeightMap.getValueAt(5);
      } catch(e) {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST06_0009
     * @tc.name      testLightWeightMapTest06Chapter0009
     * @tc.desc      Test getValueAt with floating point index
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest06Chapter0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest06Chapter0009';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set("squirrel", 123);
      lightWeightMap.set("sparrow", 356);
      let result: boolean = false;
      try {
        lightWeightMap.getValueAt(1.5);
      } catch(e) {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST06_0010
     * @tc.name      testLightWeightMapTest06Chapter0010
     * @tc.desc      Test getValueAt with Math.floor(1.5) index
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest06Chapter0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest06Chapter0010';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set("squirrel", 123);
      lightWeightMap.set("sparrow", 356);
      lightWeightMap.set("eagle", 789);
      lightWeightMap.set("hawk", 999);

      const index = Math.floor(1.5);
      const result = lightWeightMap.getValueAt(index);
      expect(result).assertEqual(789);
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST06_0011
     * @tc.name      testLightWeightMapTest06Chapter0011
     * @tc.desc      Test getValueAt with Number.MAX_VALUE index
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest06Chapter0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest06Chapter0011';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set("squirrel", 123);
      lightWeightMap.set("sparrow", 356);
      let result: boolean = false;
      try {
        lightWeightMap.getValueAt(Number.MAX_VALUE);
      } catch(e) {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST06_0012
     * @tc.name      testLightWeightMapTest06Chapter0012
     * @tc.desc      Test getValueAt with Number.MIN_VALUE index
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest06Chapter0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest06Chapter0012';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set("squirrel", 123);
      lightWeightMap.set("sparrow", 356);
      let result: boolean = false;
      try {
        lightWeightMap.getValueAt(Number.MIN_VALUE);
      } catch(e) {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST06_0013
     * @tc.name      testLightWeightMapTest06Chapter0013
     * @tc.desc      Test getValueAt with Number.EPSILON index
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest06Chapter0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest06Chapter0013';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set("squirrel", 123);
      lightWeightMap.set("sparrow", 356);
      let result: boolean = false;
      try {
        lightWeightMap.getValueAt(Number.EPSILON);
      } catch(e) {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST06_0014
     * @tc.name      testLightWeightMapTest06Chapter0014
     * @tc.desc      Test getValueAt with Number.MAX_SAFE_INTEGER index
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest06Chapter0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest06Chapter0014';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set("squirrel", 123);
      lightWeightMap.set("sparrow", 356);
      let result: boolean = false;
      try {
        lightWeightMap.getValueAt(Number.MAX_SAFE_INTEGER);
      } catch(e) {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST06_0015
     * @tc.name      testLightWeightMapTest06Chapter0015
     * @tc.desc      Test getValueAt with byte underflow value -129
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest06Chapter0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest06Chapter0015';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set("item0", 100);
      lightWeightMap.set("item1", 200);
      lightWeightMap.set("item2", 300);
      let result: boolean = false;
      try {
        lightWeightMap.getValueAt(-129);
      } catch(e) {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST06_0016
     * @tc.name      testLightWeightMapTest06Chapter0016
     * @tc.desc      Test getValueAt with byte lower boundary value -128
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest06Chapter0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest06Chapter0016';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set("item0", 100);
      lightWeightMap.set("item1", 200);
      lightWeightMap.set("item2", 300);
      let result: boolean = false;
      try {
        lightWeightMap.getValueAt(-128);
      } catch(e) {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST06_0017
     * @tc.name      testLightWeightMapTest06Chapter0017
     * @tc.desc      Test getValueAt with byte normal value 50
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest06Chapter0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest06Chapter0017';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();

      // 添加足够多的元素
      for (let i = 0; i <= 50; i++) {
        lightWeightMap.set(`item${i}`, i * 10);
      }

      const result = lightWeightMap.getValueAt(50);
      expect(result).assertEqual(500);
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST06_0018
     * @tc.name      testLightWeightMapTest06Chapter0018
     * @tc.desc      Test getValueAt with byte upper boundary value 127
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest06Chapter0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest06Chapter0018';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();

      // 添加127个元素
      for (let i = 0; i < 127; i++) {
        lightWeightMap.set(`item${i}`, i * 10);
      }

      const result = lightWeightMap.getValueAt(126); // 索引从0开始，所以127个元素的最后一个索引是126
      expect(result).assertEqual(1260);
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST06_0019
     * @tc.name      testLightWeightMapTest06Chapter0019
     * @tc.desc      Test getValueAt with byte overflow value 128
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest06Chapter0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest06Chapter0019';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();

      // 添加一些元素，但不到128个
      for (let i = 0; i < 50; i++) {
        lightWeightMap.set(`item${i}`, i * 10);
      }
      let result: boolean = false;
      try {
        lightWeightMap.getValueAt(128);
      } catch(e) {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST06_0020
     * @tc.name      testLightWeightMapTest06Chapter0020
     * @tc.name      testLightWeightMapTest06Chapter0020
     * @tc.desc      Test getValueAt with byte boundary valid value 0
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest06Chapter0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest06Chapter0020';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set("item0", 100);
      lightWeightMap.set("item1", 200);
      lightWeightMap.set("item2", 300);

      const result = lightWeightMap.getValueAt(0);
      expect(result).assertEqual(100);
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST06_0021
     * @tc.name      testLightWeightMapTest06Chapter0021
     * @tc.desc      Test getValueAt with byte negative normal value -50
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest06Chapter0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest06Chapter0021';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set("item0", 100);
      lightWeightMap.set("item1", 200);
      let result: boolean = false;
      try {
        lightWeightMap.getValueAt(-50);
      } catch(e) {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST06_0022
     * @tc.name      testLightWeightMapTest06Chapter0022
     * @tc.desc      Test getValueAt with byte positive normal value 100
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest06Chapter0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest06Chapter0022';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();

      // 添加101个元素（索引0-100）
      for (let i = 0; i <= 100; i++) {
        lightWeightMap.set(`item${i}`, i * 10);
      }

      const result = lightWeightMap.getValueAt(100);
      expect(result).assertEqual(1000);
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST06_0023
     * @tc.name      testLightWeightMapTest06Chapter0023
     * @tc.desc      Test getValueAt with short underflow value -32769
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest06Chapter0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest06Chapter0023';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set("item0", 100);
      let result: boolean = false;
      try {
        lightWeightMap.getValueAt(-32769);
      } catch(e) {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST06_0024
     * @tc.name      testLightWeightMapTest06Chapter0024
     * @tc.desc      Test getValueAt with short lower boundary value -32768
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest06Chapter0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest06Chapter0024';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set("item0", 100);
      let result: boolean = false;
      try {
        lightWeightMap.getValueAt(-32768);
      } catch(e) {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST06_0025
     * @tc.name      testLightWeightMapTest06Chapter0025
     * @tc.desc      Test getValueAt with value 100
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest06Chapter0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest06Chapter0025';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      for (let i = 0; i < 100; i++) {
        lightWeightMap.set(`item${i}`, i);
      }
      const result = lightWeightMap.getValueAt(99); // 测试最后一个元素
      expect(result).assertEqual(99);
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST06_0026
     * @tc.name      testLightWeightMapTest06Chapter0026
     * @tc.desc      Test getValueAt with short overflow value 32768
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest06Chapter0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest06Chapter0026';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set("item0", 100);
      let result: boolean = false;
      try {
        lightWeightMap.getValueAt(32768);
      } catch(e) {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST06_0027
     * @tc.name      testLightWeightMapTest06Chapter0027
     * @tc.desc      Test getValueAt with int underflow value -2147483649
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest06Chapter0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest06Chapter0027';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set("item0", 100);
      let result: boolean = false;
      try {
        lightWeightMap.getValueAt(-2147483649);
      } catch(e) {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST06_0028
     * @tc.name      testLightWeightMapTest06Chapter0028
     * @tc.desc      Test getValueAt with int lower boundary value -2147483648
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest06Chapter0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest06Chapter0028';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set("item0", 100);
      let result: boolean = false;
      try {
        lightWeightMap.getValueAt(-2147483648);
      } catch(e) {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST06_0029
     * @tc.name      testLightWeightMapTest06Chapter0029
     * @tc.desc      Test getValueAt with int upper boundary value 2147483647
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest06Chapter0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest06Chapter0029';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();

      // 注意：由于JavaScript数字精度和内存限制，这里只测试边界值，不实际添加那么多元素
      lightWeightMap.set("item0", 100);
      let result: boolean = false;
      try {
        lightWeightMap.getValueAt(2147483647);
      } catch(e) {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST06_0030
     * @tc.name      testLightWeightMapTest06Chapter0030
     * @tc.desc      Test getValueAt with int overflow value 2147483648
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest06Chapter0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest06Chapter0030';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set("item0", 100);
      let result: boolean = false;
      try {
        lightWeightMap.getValueAt(2147483648);
      } catch(e) {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST06_0031
     * @tc.name      testLightWeightMapTest06Chapter0031
     * @tc.desc      Test getValueAt with long underflow value -9223372036854775809
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest06Chapter0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest06Chapter0031';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set("item0", 100);
      let result: boolean = false;
      try {
        lightWeightMap.getValueAt(-9223372036854775809);
      } catch(e) {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST06_0032
     * @tc.name      testLightWeightMapTest06Chapter0032
     * @tc.desc      Test getValueAt with long lower boundary value -9223372036854775808
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest06Chapter0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest06Chapter0032';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set("item0", 100);
      let result: boolean = false;
      try {
        lightWeightMap.getValueAt(-9223372036854775808);
      } catch(e) {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST06_0033
     * @tc.name      testLightWeightMapTest06Chapter0033
     * @tc.desc      Test getValueAt with long upper boundary value 9223372036854775807
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest06Chapter0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest06Chapter0033';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set("item0", 100);
      let result: boolean = false;
      try {
        lightWeightMap.getValueAt(9223372036854775807);
      } catch(e) {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST06_0034
     * @tc.name      testLightWeightMapTest06Chapter0034
     * @tc.desc      Test getValueAt with long overflow value 9223372036854775808
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest06Chapter0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest06Chapter0034';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set("item0", 100);
      let result: boolean = false;
      try {
        lightWeightMap.getValueAt(9223372036854775808);
      } catch(e) {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST06_0035
     * @tc.name      testLightWeightMapTest06Chapter0035
     * @tc.desc      Test getValueAt with float lower boundary value -3.40282346638528860e+38
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest06Chapter0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest06Chapter0035';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set("item0", 100);
      let result: boolean = false;
      try {
        lightWeightMap.getValueAt(-3.40282346638528860e+38);
      } catch(e) {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST06_0036
     * @tc.name      testLightWeightMapTest06Chapter0036
     * @tc.desc      Test getValueAt with float upper boundary value 3.40282346638528860e+38
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest06Chapter0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest06Chapter0036';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set("item0", 100);
      let result: boolean = false;
      try {
        lightWeightMap.getValueAt(3.40282346638528860e+38);
      } catch(e) {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST06_0037
     * @tc.name      testLightWeightMapTest06Chapter0037
     * @tc.desc      Test getValueAt with float positive small value 1.40129846432481707e-45
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest06Chapter0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest06Chapter0037';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set("item0", 100);
      let result: boolean = false;
      try {
        lightWeightMap.getValueAt(1.40129846432481707e-45);
      } catch(e) {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST06_0038
     * @tc.name      testLightWeightMapTest06Chapter0038
     * @tc.desc      Test getValueAt with double lower boundary value -1.79769313486231570e+308
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest06Chapter0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest06Chapter0038';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set("item0", 100);
      let result: boolean = false;
      try {
        lightWeightMap.getValueAt(-1.79769313486231570e+308);
      } catch(e) {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST06_0039
     * @tc.name      testLightWeightMapTest06Chapter0039
     * @tc.desc      Test getValueAt with double upper boundary value 1.79769313486231570e+308
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest06Chapter0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest06Chapter0039';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set("item0", 100);
      let result: boolean = false;
      try {
        lightWeightMap.getValueAt(1.79769313486231570e+308);
      } catch(e) {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST06_0040
     * @tc.name      testLightWeightMapTest06Chapter0040
     * @tc.desc      Test getValueAt with double positive small value 4.94065645841246544e-324
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest06Chapter0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest06Chapter0040';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set("item0", 100);
      let result: boolean = false;
      try {
        lightWeightMap.getValueAt(4.94065645841246544e-324);
      } catch(e) {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST06_0041
     * @tc.name      testLightWeightMapTest06Chapter0041
     * @tc.desc      Test getValueAt with char lower boundary value 0
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest06Chapter0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest06Chapter0041';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set("item0", 100);
      lightWeightMap.set("item1", 200);
      lightWeightMap.set("item2", 300);

      const result = lightWeightMap.getValueAt(0);
      expect(result).assertEqual(100);
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST06_0042
     * @tc.name      testLightWeightMapTest06Chapter0042
     * @tc.desc      Test getValueAt with char upper boundary value 65535
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest06Chapter0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest06Chapter0042';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, Uint16Array>();

      let arr = new Uint16Array([0,100,65535]);
      lightWeightMap.set('arr1',arr);
      let values = lightWeightMap.values();
      let result: boolean = false;
      for (let value of values) {
        if (value[0] === 0 && value[2] === 65535) {
          result = true;
        }
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST06_0043
     * @tc.name      testLightWeightMapTest06Chapter0043
     * @tc.desc      Test getValueAt with char overflow value 65536
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest06Chapter0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest06Chapter0043';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set("item0", 100);
      let result: boolean = false;
      try {
        lightWeightMap.getValueAt(65536);
      } catch(e) {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST06_0044
     * @tc.name      testLightWeightMapTest06Chapter0044
     * @tc.desc      Test getValueAt with char underflow value -1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest06Chapter0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest06Chapter0044';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set("item0", 100);
      let result: boolean = false;
      try {
        lightWeightMap.getValueAt(-1);
      } catch(e) {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST06_0045
     * @tc.name      testLightWeightMapTest06Chapter0045
     * @tc.desc      Test getValueAt with value 65535
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest06Chapter0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest06Chapter0045';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set("item0", 100);
      let result: boolean = false;
      try {
        lightWeightMap.getValueAt(65535);
      } catch(e) {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST06_0046
     * @tc.name      testLightWeightMapTest06Chapter0046
     * @tc.desc      Test getValueAt with bigint value BigInt(0xdecafafecacefade)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest06Chapter0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest06Chapter0046';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set("item0", 100);

      const bigIntIndex = Number(BigInt("0xdecafafecacefade"));
      let result: boolean = false;
      try {
        lightWeightMap.getValueAt(bigIntIndex);
      } catch(e) {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST06_0047
     * @tc.name      testLightWeightMapTest06Chapter0047
     * @tc.desc      Test getValueAt with double value 123.456
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest06Chapter0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest06Chapter0047';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set("item0", 100);
      let result: boolean = false;
      try {
        lightWeightMap.getValueAt(123.456);
      } catch(e) {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST06_0048
     * @tc.name      testLightWeightMapTest06Chapter0048
     * @tc.desc      Test getValueAt with hex float value 0xcafebabe
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest06Chapter0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest06Chapter0048';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();

      // 添加足够多的元素
      for (let i = 0; i <= 0xcafebabe; i++) {
        if (i > 1000) break; // 只添加前1000个用于测试
        lightWeightMap.set(`item${i}`, i);
      }
      let result: boolean = false;
      try {
        lightWeightMap.getValueAt(0xcafebabe);
      } catch(e) {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST06_0049
     * @tc.name      testLightWeightMapTest06Chapter0049
     * @tc.desc      Test getValueAt with 16-bit hex value 0x0102
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest06Chapter0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest06Chapter0049';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();

      // 添加足够多的元素
      for (let i = 0; i <= 0x0102; i++) {
        lightWeightMap.set(`item${i}`, i * 10);
      }

      const result = lightWeightMap.getValueAt(0x0102);
      expect(result).assertEqual(0x0102 * 10);
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST06_0050
     * @tc.name      testLightWeightMapTest06Chapter0050
     * @tc.desc      Test getValueAt with 32-bit hex value 0x01020304
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest06Chapter0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest06Chapter0050';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set("item0", 100);
      let result: boolean = false;
      try {
        lightWeightMap.getValueAt(0x01020304);
      } catch(e) {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST06_0051
     * @tc.name      testLightWeightMapTest06Chapter0051
     * @tc.desc      Test getValueAt with 8-bit hex value 0x3
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest06Chapter0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest06Chapter0051';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();

      // 添加4个元素（0x3 = 3）
      for (let i = 0; i <= 0x3; i++) {
        lightWeightMap.set(`item${i}`, i * 100);
      }

      const result = lightWeightMap.getValueAt(0x3);
      expect(result).assertEqual(0x3 * 100);
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST06_0052
     * @tc.name      testLightWeightMapTest06Chapter0052
     * @tc.desc      Test getValueAt with exponent operator value 2 ** 3
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest06Chapter0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest06Chapter0052';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();

      // 添加9个元素（2**3 = 8，需要索引0-8）
      for (let i = 0; i <= 2 ** 3; i++) {
        lightWeightMap.set(`item${i}`, i * 50);
      }

      const result = lightWeightMap.getValueAt(2 ** 3);
      expect(result).assertEqual((2 ** 3) * 50);
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST06_0053
     * @tc.name      testLightWeightMapTest06Chapter0053
     * @tc.desc      Test getValueAt with scientific notation value 1e3
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest06Chapter0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest06Chapter0053';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set("item0", 100);
      let result: boolean = false;
      try {
        lightWeightMap.getValueAt(1e3);
      } catch(e) {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST06_0054
     * @tc.name      testLightWeightMapTest06Chapter0054
     * @tc.desc      Test getValueAt with scientific notation value 2.5e-2
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest06Chapter0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest06Chapter0054';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set("item0", 100);
      let result: boolean = false;
      try {
        lightWeightMap.getValueAt(2.5e-2);
      } catch(e) {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST06_0055
     * @tc.name      testLightWeightMapTest06Chapter0055
     * @tc.desc      Test getValueAt with large integer BigInt(9007199254740991n)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest06Chapter0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest06Chapter0055';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set("item0", 100);

      const largeBigInt = Number(BigInt(9007199254740991n));
      let result: boolean = false;
      try {
        lightWeightMap.getValueAt(largeBigInt);
      } catch(e) {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST06_0056
     * @tc.name      testLightWeightMapTest06Chapter0056
     * @tc.desc      clear <string, number> in the LightWeightMap
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest06Chapter0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest06Chapter0056';
      console.log(TAG + 'start');

      let lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set("squirrel", 123);
      lightWeightMap.clear();
      let result = lightWeightMap.isEmpty();
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST06_0057
     * @tc.name      testLightWeightMapTest06Chapter0057
     * @tc.desc      clear <number, string> in the LightWeightMap.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest06Chapter0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest06Chapter0057';
      console.log(TAG + 'start');

      let lightWeightMap = new LightWeightMap<number, string>();
      lightWeightMap.set(123, "squirrel");
      lightWeightMap.clear();
      let result = lightWeightMap.isEmpty();
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST06_0058
     * @tc.name      testLightWeightMapTest06Chapter0058
     * @tc.desc      clear <number, Int8Array> in the LightWeightMap.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest06Chapter0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest06Chapter0058';
      console.log(TAG + 'start');

      let lightWeightMap = new LightWeightMap<number, Int8Array>();
      lightWeightMap.set(123, new Int8Array([100]));
      lightWeightMap.clear();
      let result = lightWeightMap.isEmpty();
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST06_0059
     * @tc.name      testLightWeightMapTest06Chapter0059
     * @tc.desc      clear <number, Float32Array> in the LightWeightMap.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest06Chapter0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest06Chapter0059';
      console.log(TAG + 'start');

      let lightWeightMap = new LightWeightMap<number, Float32Array>();
      lightWeightMap.set(123, new Float32Array([Infinity]));
      lightWeightMap.clear();
      let result = lightWeightMap.isEmpty();
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST06_0060
     * @tc.name      testLightWeightMapTest06Chapter0060
     * @tc.desc      clear <string, number> in the LightWeightMap(Number.MAX_VALUE)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest06Chapter0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest06Chapter0060';
      console.log(TAG + 'start');

      let lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set("squirrel", Number.MAX_VALUE);
      lightWeightMap.clear();
      let result = lightWeightMap.isEmpty();
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST06_0061
     * @tc.name      testLightWeightMapTest06Chapter0061
     * @tc.desc      clear <number, string> in the LightWeightMap(👆)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest06Chapter0061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest06Chapter0061';
      console.log(TAG + 'start');

      let lightWeightMap = new LightWeightMap<number, string>();
      lightWeightMap.set(123, "👆");
      lightWeightMap.clear();
      let result = lightWeightMap.isEmpty();
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST06_0062
     * @tc.name      testLightWeightMapTest06Chapter0062
     * @tc.desc      clear <string, boolean> in the LightWeightMap
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest06Chapter0062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest06Chapter0062';
      console.log(TAG + 'start');

      let lightWeightMap = new LightWeightMap<string, boolean>();
      lightWeightMap.set("abc", false);
      lightWeightMap.clear();
      let result = lightWeightMap.isEmpty();
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST06_0063
     * @tc.name      testLightWeightMapTest06Chapter0063
     * @tc.desc      clear <string, Uint8Array> in the LightWeightMap
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest06Chapter0063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest06Chapter0063';
      console.log(TAG + 'start');

      const value_1 = new Uint8Array([72, 101, 108, 108, 111, 87, 111, 114, 108, 100, 49, 50, 51, 63]);
      let lightWeightMap = new LightWeightMap<string, Uint8Array>();
      lightWeightMap.set("abc", value_1);
      lightWeightMap.clear();
      let result = lightWeightMap.isEmpty();
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST06_0064
     * @tc.name      testLightWeightMapTest06Chapter0064
     * @tc.desc      clear <string, TestClass> in the LightWeightMap
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest06Chapter0064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest06Chapter0064';
      console.log(TAG + 'start');

      let value_1 = new TestClass(1, "First");
      let lightWeightMap = new LightWeightMap<string, TestClass>();
      lightWeightMap.set("abc", value_1);
      lightWeightMap.clear();
      let result = lightWeightMap.isEmpty();
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST06_0065
     * @tc.name      testLightWeightMapTest06Chapter0065
     * @tc.desc      clear <string, Object> in the LightWeightMap
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest06Chapter0065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest06Chapter0065';
      console.log(TAG + 'start');

      let value_1 = new Object({ name: 'Alice', age: 25 });
      let lightWeightMap = new LightWeightMap<string, Object>();
      lightWeightMap.set("abc", value_1);
      lightWeightMap.clear();
      let result = lightWeightMap.isEmpty();
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST06_0066
     * @tc.name      testLightWeightMapTest06Chapter0066
     * @tc.desc      Get a array value in the LightWeightMap<string, number> keys
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest06Chapter0066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest06Chapter0066';
      console.log(TAG + 'start');

      let lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set("squirrel", 123);
      lightWeightMap.set("sparrow", 356);
      let keys = lightWeightMap.keys();
      let keysArray = Array.from(keys);
      expect(keysArray.length).assertEqual(2);
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST06_0067
     * @tc.name      testLightWeightMapTest06Chapter0067
     * @tc.desc      Get a array value in the LightWeightMap<number,string> keys
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest06Chapter0067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest06Chapter0067';
      console.log(TAG + 'start');

      let lightWeightMap = new LightWeightMap<number,string>();
      lightWeightMap.set(123, "squirrel");
      lightWeightMap.set(356, "sparrow");
      let keys = lightWeightMap.keys();
      let keysArray = Array.from(keys);
      expect(keysArray.length).assertEqual(2);
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST06_0068
     * @tc.name      testLightWeightMapTest06Chapter0068
     * @tc.desc      Get a array value in the LightWeightMap<string, Int8Array> keys.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest06Chapter0068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest06Chapter0068';
      console.log(TAG + 'start');

      const value_1 = new Int8Array([100]);
      let lightWeightMap = new LightWeightMap<string, Int8Array>();
      lightWeightMap.set("squirrel", value_1);
      lightWeightMap.set("sparrow", value_1);
      let keys = lightWeightMap.keys();
      let keysArray = Array.from(keys);
      expect(keysArray.length).assertEqual(2);
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST06_0069
     * @tc.name      testLightWeightMapTest06Chapter0069
     * @tc.desc      Get a array value in the LightWeightMap<Float32Array,string> keys.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest06Chapter0069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest06Chapter0069';
      console.log(TAG + 'start');

      const value_1 = new Float32Array([Infinity]);
      let lightWeightMap = new LightWeightMap<Float32Array,string>();
      lightWeightMap.set(value_1,"squirrel");
      let keys = lightWeightMap.keys();
      let keysArray = Array.from(keys);
      expect(keysArray[0][0]).assertEqual(Infinity);
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST06_0070
     * @tc.name      testLightWeightMapTest06Chapter0070
     * @tc.desc      Get a array value in the LightWeightMap<number,string> keys 1.7976931348623157e+308
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest06Chapter0070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest06Chapter0070';
      console.log(TAG + 'start');

      let lightWeightMap = new LightWeightMap<number,string>();
      lightWeightMap.set(1.7976931348623157e+308, "squirrel");
      lightWeightMap.set(356, "sparrow");
      let keys = lightWeightMap.keys();
      let keysArray = Array.from(keys);
      expect(keysArray[0]).assertEqual(1.7976931348623157e+308);
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST06_0071
     * @tc.name      testLightWeightMapTest06Chapter0071
     * @tc.desc      Get a array value in the LightWeightMap<boolean,string> keys
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest06Chapter0071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest06Chapter0071';
      console.log(TAG + 'start');

      let lightWeightMap = new LightWeightMap<boolean,string>();
      lightWeightMap.set(true, "squirrel");
      lightWeightMap.set(false, "sparrow");
      let keys = lightWeightMap.keys();
      let keysArray = Array.from(keys);
      expect(keysArray[0]).assertEqual(true);
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST06_0072
     * @tc.name      testLightWeightMapTest06Chapter0072
     * @tc.desc      Get a array length in the LightWeightMap<boolean,string> keys
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest06Chapter0072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest06Chapter0072';
      console.log(TAG + 'start');

      let lightWeightMap = new LightWeightMap<boolean,string>();
      lightWeightMap.set(true, "squirrel");
      lightWeightMap.set(false, "sparrow");
      let keys = lightWeightMap.keys();
      let keysArray = Array.from(keys);
      expect(keysArray.length).assertEqual(2);
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST06_0073
     * @tc.name      testLightWeightMapTest06Chapter0073
     * @tc.desc      Get a array length in the LightWeightMap<Uint8Array,string> keys
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest06Chapter0073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest06Chapter0073';
      console.log(TAG + 'start');

      const value_1 = new Uint8Array([72, 101, 108, 108, 111, 87, 111, 114, 108, 100, 49, 50, 51, 63]);
      let lightWeightMap = new LightWeightMap<Uint8Array,string>();
      lightWeightMap.set(value_1, "squirrel");
      let keys = lightWeightMap.keys();
      let keysArray = Array.from(keys);
      expect(keysArray[0][0]).assertEqual(72);
      expect(keysArray[0][1]).assertEqual(101);
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST06_0074
     * @tc.name      testLightWeightMapTest06Chapter0074
     * @tc.desc      Get a array length in the LightWeightMap<TestClass,string> keys
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest06Chapter0074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest06Chapter0074';
      console.log(TAG + 'start');

      let value_1 = new TestClass(1, "First");
      let lightWeightMap = new LightWeightMap<TestClass,string>();
      lightWeightMap.set(value_1, "squirrel");
      let keys = lightWeightMap.keys();
      let keysArray = Array.from(keys);
      expect(keysArray.length).assertEqual(1);
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST06_0075
     * @tc.name      testLightWeightMapTest06Chapter0075
     * @tc.desc      Get a array length in the LightWeightMap<object,string> keys
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2[object Object]
     */
    it("testLightWeightMapTest06Chapter0075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest06Chapter0075';
      console.log(TAG + 'start');

      let value_1 = new Object({ name: 'Alice', age: 25 });
      let lightWeightMap = new LightWeightMap<object,string>();
      lightWeightMap.set(value_1, "squirrel");
      let keys = lightWeightMap.keys();
      let keysArray = Array.from(keys);
      expect(keysArray.length).assertEqual(1);
      console.log(TAG + 'end');
    });

  });
}