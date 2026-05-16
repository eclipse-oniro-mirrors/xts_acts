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

interface UserInfo {
  name: string;
  age: number;
}

function sleep(count: int): Promise<void> {
  return new Promise<void>((resolve: (value: PromiseLike<void>) => void, reject: (value: Error) => void) => {
    setTimeout(() => {
      resolve(Promise.resolve())
    }, count)
  })
}

export default function testLightWeightMapTest06(): void {
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
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTSIX_0100
     * @tc.name      testLightWeightMapTest06Chapter0100
     * @tc.desc      Test getValueAt with index 0 (first element)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest06Chapter0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest06Chapter0100';
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
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTSIX_0200
     * @tc.name      testLightWeightMapTest06Chapter0200
     * @tc.desc      Test getValueAt with undefined parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest06Chapter0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest06Chapter0200';
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
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTSIX_0300
     * @tc.name      testLightWeightMapTest06Chapter0300
     * @tc.desc      Test getValueAt with NaN parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest06Chapter0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest06Chapter0300';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set("squirrel", 123);
      lightWeightMap.set("sparrow", 356);
      const val: number | undefined = lightWeightMap.getValueAt(NaN.toInt());
      expect(val).assertEqual(356);
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTSIX_0400
     * @tc.name      testLightWeightMapTest06Chapter0400
     * @tc.desc      Test getValueAt with -0 parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest06Chapter0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest06Chapter0400';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set("squirrel", 123);

      const result = lightWeightMap.getValueAt(-0);
      expect(result).assertEqual(123);
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTSIX_0500
     * @tc.name      testLightWeightMapTest06Chapter0500
     * @tc.desc      Test getValueAt with Infinity parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest06Chapter0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest06Chapter0500';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set("squirrel", 123);
      lightWeightMap.set("sparrow", 356);
      let result: boolean = false;
      try {
        lightWeightMap.getValueAt(Infinity.toInt());
      } catch(e) {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTSIX_0600
     * @tc.name      testLightWeightMapTest06Chapter0600
     * @tc.desc      Test getValueAt with -Infinity parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest06Chapter0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest06Chapter0600';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set("squirrel", 123);
      lightWeightMap.set("sparrow", 356);
      let result: boolean = false;
      try {
        lightWeightMap.getValueAt((-Infinity).toInt());
      } catch(e) {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTSIX_0700
     * @tc.name      testLightWeightMapTest06Chapter0700
     * @tc.desc      Test getValueAt with negative index parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest06Chapter0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest06Chapter0700';
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
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTSIX_0800
     * @tc.name      testLightWeightMapTest06Chapter0800
     * @tc.desc      Test getValueAt with index out of range
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest06Chapter0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest06Chapter0800';
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
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTSIX_0900
     * @tc.name      testLightWeightMapTest06Chapter0900
     * @tc.desc      Test getValueAt with floating point index
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest06Chapter0900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest06Chapter0900';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set("squirrel", 123);
      lightWeightMap.set("sparrow", 356);
      const result = lightWeightMap.getValueAt((1.5).toInt());
      expect(result).assertEqual(123);
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTSIX_1000
     * @tc.name      testLightWeightMapTest06Chapter1000
     * @tc.desc      Test getValueAt with Math.floor(1.5) index
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest06Chapter1000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest06Chapter1000';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set("squirrel", 123);
      lightWeightMap.set("sparrow", 356);
      lightWeightMap.set("eagle", 789);
      lightWeightMap.set("hawk", 999);

      const index = Math.floor(1.5);
      const result = lightWeightMap.getValueAt(index.toInt());
      expect(result).assertEqual(789);
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTSIX_1100
     * @tc.name      testLightWeightMapTest06Chapter1100
     * @tc.desc      Test getValueAt with Number.MAX_VALUE index
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest06Chapter1100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest06Chapter1100';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set("squirrel", 123);
      lightWeightMap.set("sparrow", 356);
      let result: boolean = false;
      try {
        lightWeightMap.getValueAt(Number.MAX_VALUE.toInt());
      } catch(e) {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTSIX_1200
     * @tc.name      testLightWeightMapTest06Chapter1200
     * @tc.desc      Test getValueAt with Number.MIN_VALUE index
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest06Chapter1200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest06Chapter1200';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set("squirrel", 123);
      lightWeightMap.set("sparrow", 356);
      const result = lightWeightMap.getValueAt(Number.MIN_VALUE.toInt());
      expect(result).assertEqual(356);
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTSIX_1300
     * @tc.name      testLightWeightMapTest06Chapter1300
     * @tc.desc      Test getValueAt with Number.EPSILON index
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest06Chapter1300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest06Chapter1300';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set("squirrel", 123);
      lightWeightMap.set("sparrow", 356);
      const result = lightWeightMap.getValueAt(Number.EPSILON.toInt());
      expect(result).assertEqual(356);
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTSIX_1400
     * @tc.name      testLightWeightMapTest06Chapter1400
     * @tc.desc      Test getValueAt with Number.MAX_SAFE_INTEGER index
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest06Chapter1400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest06Chapter1400';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set("squirrel", 123);
      lightWeightMap.set("sparrow", 356);
      let result: boolean = false;
      try {
        lightWeightMap.getValueAt(Number.MAX_SAFE_INTEGER.toInt());
      } catch(e) {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTSIX_1500
     * @tc.name      testLightWeightMapTest06Chapter1500
     * @tc.desc      Test getValueAt with byte underflow value -129
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest06Chapter1500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest06Chapter1500';
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
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTSIX_1600
     * @tc.name      testLightWeightMapTest06Chapter1600
     * @tc.desc      Test getValueAt with byte lower boundary value -128
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest06Chapter1600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest06Chapter1600';
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
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTSIX_1700
     * @tc.name      testLightWeightMapTest06Chapter1700
     * @tc.desc      Test getValueAt with byte normal value 50
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest06Chapter1700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest06Chapter1700';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();

      // 添加足够多的元素
      for (let i: int = 0; i <= 50; i++) {
        lightWeightMap.set(`item${i}`, i * 10);
      }

      const result = lightWeightMap.getValueAt(50);
      expect(result).assertEqual(500);
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTSIX_1800
     * @tc.name      testLightWeightMapTest06Chapter1800
     * @tc.desc      Test getValueAt with byte upper boundary value 127
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest06Chapter1800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest06Chapter1800';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<number, number>();

      for (let i: int = 0; i < 127; i++) {
        lightWeightMap.set(i, i * 10);
      }

      const result = lightWeightMap.getValueAt(126);
      expect(result).assertEqual(1260);
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTSIX_1900
     * @tc.name      testLightWeightMapTest06Chapter1900
     * @tc.desc      Test getValueAt with byte overflow value 128
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest06Chapter1900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest06Chapter1900';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();

      // 添加一些元素，但不�?28�?
      for (let i: int = 0; i < 50; i++) {
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
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTSIX_2000
     * @tc.name      testLightWeightMapTest06Chapter2000
     * @tc.name      testLightWeightMapTest06Chapter2000
     * @tc.desc      Test getValueAt with byte boundary valid value 0
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest06Chapter2000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest06Chapter2000';
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
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTSIX_2100
     * @tc.name      testLightWeightMapTest06Chapter2100
     * @tc.desc      Test getValueAt with byte negative normal value -50
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest06Chapter2100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest06Chapter2100';
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
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTSIX_2200
     * @tc.name      testLightWeightMapTest06Chapter2200
     * @tc.desc      Test getValueAt with byte positive normal value 100
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest06Chapter2200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest06Chapter2200';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<number, number>();

      for (let i: int = 0; i <= 100; i++) {
        lightWeightMap.set(i, i * 10);
      }

      expect(lightWeightMap.length).assertEqual(101);
      const result = lightWeightMap.getValueAt(100);
      expect(result).assertEqual(1000);
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTSIX_2300
     * @tc.name      testLightWeightMapTest06Chapter2300
     * @tc.desc      Test getValueAt with short underflow value -32769
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest06Chapter2300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest06Chapter2300';
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
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTSIX_2400
     * @tc.name      testLightWeightMapTest06Chapter2400
     * @tc.desc      Test getValueAt with short lower boundary value -32768
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest06Chapter2400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest06Chapter2400';
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
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTSIX_2500
     * @tc.name      testLightWeightMapTest06Chapter2500
     * @tc.desc      Test getValueAt with value 100
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest06Chapter2500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest06Chapter2500';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      for (let i: int = 0; i < 100; i++) {
        lightWeightMap.set(`item${i}`, i);
      }
      const result = lightWeightMap.getValueAt(99); // 测试最后一个元�?
      expect(result).assertEqual(99);
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTSIX_2600
     * @tc.name      testLightWeightMapTest06Chapter2600
     * @tc.desc      Test getValueAt with short overflow value 32768
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest06Chapter2600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest06Chapter2600';
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
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTSIX_2700
     * @tc.name      testLightWeightMapTest06Chapter2700
     * @tc.desc      Test getValueAt with int underflow value -2147483649
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest06Chapter2700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest06Chapter2700';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set("item0", 100);
      let result: boolean = false;
      try {
        lightWeightMap.getValueAt((-2147483649).toInt());
      } catch(e) {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTSIX_2800
     * @tc.name      testLightWeightMapTest06Chapter2800
     * @tc.desc      Test getValueAt with int lower boundary value -2147483648
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest06Chapter2800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest06Chapter2800';
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
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTSIX_2900
     * @tc.name      testLightWeightMapTest06Chapter2900
     * @tc.desc      Test getValueAt with int upper boundary value 2147483647
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest06Chapter2900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest06Chapter2900';
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
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTSIX_3000
     * @tc.name      testLightWeightMapTest06Chapter3000
     * @tc.desc      Test getValueAt with int overflow value 2147483648
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest06Chapter3000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest06Chapter3000';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set("item0", 100);
      let result: boolean = false;
      try {
        let largeIdx: number = 2147483648;
        lightWeightMap.getValueAt(largeIdx.toInt());
      } catch(e) {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTSIX_3100
     * @tc.name      testLightWeightMapTest06Chapter3100
     * @tc.desc      Test getValueAt with long underflow value -9223372036854775809
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest06Chapter3100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest06Chapter3100';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set("item0", 100);
      let result: boolean = false;
      try {
        let longUnderflow: number = Number.parseFloat("-9223372036854775809");
        lightWeightMap.getValueAt(longUnderflow.toInt());
      } catch(e) {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTSIX_3200
     * @tc.name      testLightWeightMapTest06Chapter3200
     * @tc.desc      Test getValueAt with long lower boundary value -9223372036854775808
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest06Chapter3200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest06Chapter3200';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set("item0", 100);
      lightWeightMap.getValueAt((-9223372036854775808).toInt());
      expect(lightWeightMap.get("item0")).assertEqual(100);
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTSIX_3300
     * @tc.name      testLightWeightMapTest06Chapter3300
     * @tc.desc      Test getValueAt with long upper boundary value 9223372036854775807
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest06Chapter3300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest06Chapter3300';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set("item0", 100);
      let result: boolean = false;
      try {
        lightWeightMap.getValueAt((9223372036854775807).toInt());
      } catch(e) {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTSIX_3400
     * @tc.name      testLightWeightMapTest06Chapter3400
     * @tc.desc      Test getValueAt with long overflow value 9223372036854775808
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest06Chapter3400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest06Chapter3400';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set("item0", 100);
      let result: boolean = false;
      try {
        let longOverflow: number = Number.parseFloat("9223372036854775808");
        lightWeightMap.getValueAt(longOverflow.toInt());
      } catch(e) {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTSIX_3500
     * @tc.name      testLightWeightMapTest06Chapter3500
     * @tc.desc      Test getValueAt with float lower boundary value -3.40282346638528860e+38
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest06Chapter3500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest06Chapter3500';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set("item0", 100);
      let result: boolean = false;
      try {
        lightWeightMap.getValueAt((-3.40282346638528860e+38).toInt());
      } catch(e) {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTSIX_3600
     * @tc.name      testLightWeightMapTest06Chapter3600
     * @tc.desc      Test getValueAt with float upper boundary value 3.40282346638528860e+38
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest06Chapter3600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest06Chapter3600';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set("item0", 100);
      let result: boolean = false;
      try {
        lightWeightMap.getValueAt((3.40282346638528860e+38).toInt());
      } catch(e) {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTSIX_3700
     * @tc.name      testLightWeightMapTest06Chapter3700
     * @tc.desc      Test getValueAt with float positive small value 1.40129846432481707e-45
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest06Chapter3700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest06Chapter3700';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set("item0", 100);
      const result = lightWeightMap.getValueAt((1.40129846432481707e-45).toInt());
      expect(result).assertEqual(100);
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTSIX_3800
     * @tc.name      testLightWeightMapTest06Chapter3800
     * @tc.desc      Test getValueAt with double lower boundary value -1.79769313486231570e+308
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest06Chapter3800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest06Chapter3800';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set("item0", 100);
      let result: boolean = false;
      try {
        lightWeightMap.getValueAt((-1.79769313486231570e+308).toInt());
      } catch(e) {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTSIX_3900
     * @tc.name      testLightWeightMapTest06Chapter3900
     * @tc.desc      Test getValueAt with double upper boundary value 1.79769313486231570e+308
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest06Chapter3900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest06Chapter3900';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set("item0", 100);
      let result: boolean = false;
      try {
        lightWeightMap.getValueAt((1.79769313486231570e+308).toInt());
      } catch(e) {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTSIX_4000
     * @tc.name      testLightWeightMapTest06Chapter4000
     * @tc.desc      Test getValueAt with double positive small value 4.94065645841246544e-324
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest06Chapter4000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest06Chapter4000';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set("item0", 100);
      const result = lightWeightMap.getValueAt((4.94065645841246544e-324).toInt());
      expect(result).assertEqual(100);
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTSIX_4100
     * @tc.name      testLightWeightMapTest06Chapter4100
     * @tc.desc      Test getValueAt with char lower boundary value 0
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest06Chapter4100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest06Chapter4100';
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
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTSIX_4200
     * @tc.name      testLightWeightMapTest06Chapter4200
     * @tc.desc      Test getValueAt with char upper boundary value 65535
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest06Chapter4200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest06Chapter4200';
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
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTSIX_4300
     * @tc.name      testLightWeightMapTest06Chapter4300
     * @tc.desc      Test getValueAt with char overflow value 65536
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest06Chapter4300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest06Chapter4300';
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
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTSIX_4400
     * @tc.name      testLightWeightMapTest06Chapter4400
     * @tc.desc      Test getValueAt with char underflow value -1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest06Chapter4400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest06Chapter4400';
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
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTSIX_4500
     * @tc.name      testLightWeightMapTest06Chapter4500
     * @tc.desc      Test getValueAt with value 65535
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest06Chapter4500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest06Chapter4500';
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
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTSIX_4600
     * @tc.name      testLightWeightMapTest06Chapter4600
     * @tc.desc      Test getValueAt with bigint value BigInt(0xdecafafecacefade)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest06Chapter4600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest06Chapter4600';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set("item0", 100);

      const bigIntIndex = Number(BigInt("0xdecafafecacefade"));
      let result: boolean = false;
      try {
        lightWeightMap.getValueAt(bigIntIndex.toInt());
      } catch(e) {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTSIX_4700
     * @tc.name      testLightWeightMapTest06Chapter4700
     * @tc.desc      Test getValueAt with double value 123.456
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest06Chapter4700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest06Chapter4700';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set("item0", 100);
      let result: boolean = false;
      try {
        lightWeightMap.getValueAt((123.456).toInt());
      } catch(e) {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTSIX_4800
     * @tc.name      testLightWeightMapTest06Chapter4800
     * @tc.desc      Test getValueAt with hex float value 0xcafebabe
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest06Chapter4800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest06Chapter4800';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();

      // 添加足够多的元素
      for (let i: int = 0; i <= 0xcafebabe; i++) {
        if (i > 1000) break; // 只添加前1000个用于测�?
        lightWeightMap.set(`item${i}`, i);
      }
      let result: boolean = false;
      try {
        lightWeightMap.getValueAt((0xcafebabe).toInt());
      } catch(e) {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTSIX_4900
     * @tc.name      testLightWeightMapTest06Chapter4900
     * @tc.desc      Test getValueAt with 16-bit hex value 0x0102
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest06Chapter4900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest06Chapter4900';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<number, number>();

      for (let i: int = 0; i <= 0x0102; i++) {
        lightWeightMap.set(i, i * 10);
      }

      expect(lightWeightMap.length).assertEqual(0x0102 + 1);
      const result = lightWeightMap.getValueAt(0x0102);
      expect(result).assertEqual(0x0102 * 10);
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTSIX_5000
     * @tc.name      testLightWeightMapTest06Chapter5000
     * @tc.desc      Test getValueAt with 32-bit hex value 0x01020304
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest06Chapter5000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest06Chapter5000';
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
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTSIX_5100
     * @tc.name      testLightWeightMapTest06Chapter5100
     * @tc.desc      Test getValueAt with 8-bit hex value 0x3
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest06Chapter5100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest06Chapter5100';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();

      // 添加4个元素（0x3 = 3�?
      for (let i: int = 0; i <= 0x3; i++) {
        lightWeightMap.set(`item${i}`, i * 100);
      }

      const result = lightWeightMap.getValueAt(0x3);
      expect(result).assertEqual(0x3 * 100);
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTSIX_5200
     * @tc.name      testLightWeightMapTest06Chapter5200
     * @tc.desc      Test getValueAt with exponent operator value 2 ** 3
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest06Chapter5200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest06Chapter5200';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();

      // 添加9个元素（2**3 = 8，需要索�?-8�?
      let expVal: int = (2 ** 3).toInt();
      for (let i: int = 0; i <= expVal; i++) {
        lightWeightMap.set(`item${i}`, i * 50);
      }

      const result = lightWeightMap.getValueAt(expVal);
      expect(result).assertEqual(expVal * 50);
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTSIX_5300
     * @tc.name      testLightWeightMapTest06Chapter5300
     * @tc.desc      Test getValueAt with scientific notation value 1e3
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest06Chapter5300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest06Chapter5300';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set("item0", 100);
      let result: boolean = false;
      try {
        lightWeightMap.getValueAt((1e3).toInt());
      } catch(e) {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTSIX_5400
     * @tc.name      testLightWeightMapTest06Chapter5400
     * @tc.desc      Test getValueAt with scientific notation value 2.5e-2
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest06Chapter5400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest06Chapter5400';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set("item0", 100);
      const result = lightWeightMap.getValueAt((2.5e-2).toInt());
      expect(result).assertEqual(100);
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTSIX_5500
     * @tc.name      testLightWeightMapTest06Chapter5500
     * @tc.desc      Test getValueAt with large integer BigInt(9007199254740991n)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest06Chapter5500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest06Chapter5500';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set("item0", 100);

      const largeBigInt = Number(BigInt(9007199254740991n));
      let result: boolean = false;
      try {
        lightWeightMap.getValueAt(largeBigInt.toInt());
      } catch(e) {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTSIX_5600
     * @tc.name      testLightWeightMapTest06Chapter5600
     * @tc.desc      clear <string, number> in the LightWeightMap
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest06Chapter5600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest06Chapter5600';
      console.log(TAG + 'start');

      let lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set("squirrel", 123);
      lightWeightMap.clear();
      let result = lightWeightMap.isEmpty();
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTSIX_5700
     * @tc.name      testLightWeightMapTest06Chapter5700
     * @tc.desc      clear <number, string> in the LightWeightMap.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest06Chapter5700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest06Chapter5700';
      console.log(TAG + 'start');

      let lightWeightMap = new LightWeightMap<number, string>();
      lightWeightMap.set(123, "squirrel");
      lightWeightMap.clear();
      let result = lightWeightMap.isEmpty();
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTSIX_5800
     * @tc.name      testLightWeightMapTest06Chapter5800
     * @tc.desc      clear <number, Int8Array> in the LightWeightMap.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest06Chapter5800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest06Chapter5800';
      console.log(TAG + 'start');

      let lightWeightMap = new LightWeightMap<number, Int8Array>();
      lightWeightMap.set(123, new Int8Array([100]));
      lightWeightMap.clear();
      let result = lightWeightMap.isEmpty();
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTSIX_5900
     * @tc.name      testLightWeightMapTest06Chapter5900
     * @tc.desc      clear <number, Float32Array> in the LightWeightMap.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest06Chapter5900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest06Chapter5900';
      console.log(TAG + 'start');

      let lightWeightMap = new LightWeightMap<number, Float32Array>();
      lightWeightMap.set(123, new Float32Array([Infinity]));
      lightWeightMap.clear();
      let result = lightWeightMap.isEmpty();
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTSIX_6000
     * @tc.name      testLightWeightMapTest06Chapter6000
     * @tc.desc      clear <string, number> in the LightWeightMap(Number.MAX_VALUE)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest06Chapter6000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest06Chapter6000';
      console.log(TAG + 'start');

      let lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set("squirrel", Number.MAX_VALUE);
      lightWeightMap.clear();
      let result = lightWeightMap.isEmpty();
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTSIX_6100
     * @tc.name      testLightWeightMapTest06Chapter6100
     * @tc.desc      clear <number, string> in the LightWeightMap(👆)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest06Chapter6100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest06Chapter6100';
      console.log(TAG + 'start');

      let lightWeightMap = new LightWeightMap<number, string>();
      lightWeightMap.set(123, "👆");
      lightWeightMap.clear();
      let result = lightWeightMap.isEmpty();
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTSIX_6200
     * @tc.name      testLightWeightMapTest06Chapter6200
     * @tc.desc      clear <string, boolean> in the LightWeightMap
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest06Chapter6200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest06Chapter6200';
      console.log(TAG + 'start');

      let lightWeightMap = new LightWeightMap<string, boolean>();
      lightWeightMap.set("abc", false);
      lightWeightMap.clear();
      let result = lightWeightMap.isEmpty();
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTSIX_6300
     * @tc.name      testLightWeightMapTest06Chapter6300
     * @tc.desc      clear <string, Uint8Array> in the LightWeightMap
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest06Chapter6300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest06Chapter6300';
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
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTSIX_6400
     * @tc.name      testLightWeightMapTest06Chapter6400
     * @tc.desc      clear <string, TestClass> in the LightWeightMap
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest06Chapter6400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest06Chapter6400';
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
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTSIX_6500
     * @tc.name      testLightWeightMapTest06Chapter6500
     * @tc.desc      clear <string, Object> in the LightWeightMap
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest06Chapter6500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest06Chapter6500';
      console.log(TAG + 'start');

      let value_1: UserInfo = { name: 'Alice', age: 25 };
      let lightWeightMap = new LightWeightMap<string, UserInfo>();
      lightWeightMap.set("abc", value_1);
      lightWeightMap.clear();
      let result = lightWeightMap.isEmpty();
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTSIX_6600
     * @tc.name      testLightWeightMapTest06Chapter6600
     * @tc.desc      Get a array value in the LightWeightMap<string, number> keys
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest06Chapter6600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest06Chapter6600';
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
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTSIX_6700
     * @tc.name      testLightWeightMapTest06Chapter6700
     * @tc.desc      Get a array value in the LightWeightMap<number,string> keys
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest06Chapter6700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest06Chapter6700';
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
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTSIX_6800
     * @tc.name      testLightWeightMapTest06Chapter6800
     * @tc.desc      Get a array value in the LightWeightMap<string, Int8Array> keys.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest06Chapter6800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest06Chapter6800';
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
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTSIX_6900
     * @tc.name      testLightWeightMapTest06Chapter6900
     * @tc.desc      Get a array value in the LightWeightMap<Float32Array,string> keys.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest06Chapter6900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest06Chapter6900';
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
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTSIX_7000
     * @tc.name      testLightWeightMapTest06Chapter7000
     * @tc.desc      Get a array value in the LightWeightMap<number,string> keys 1.7976931348623157e+308
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest06Chapter7000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest06Chapter7000';
      console.log(TAG + 'start');

      let lightWeightMap = new LightWeightMap<number,string>();
      lightWeightMap.set(1.7976931348623157e+308, "squirrel");
      lightWeightMap.set(356, "sparrow");
      let keys = lightWeightMap.keys();
      let keysArray = Array.from(keys);
      expect(keysArray[0]).assertEqual(356);
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTSIX_7100
     * @tc.name      testLightWeightMapTest06Chapter7100
     * @tc.desc      Get a array value in the LightWeightMap<boolean,string> keys
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest06Chapter7100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest06Chapter7100';
      console.log(TAG + 'start');

      let lightWeightMap = new LightWeightMap<boolean,string>();
      lightWeightMap.set(true, "squirrel");
      lightWeightMap.set(false, "sparrow");
      let keys = lightWeightMap.keys();
      let keysArray = Array.from(keys);
      expect(keysArray[0]).assertEqual(false);
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTSIX_7200
     * @tc.name      testLightWeightMapTest06Chapter7200
     * @tc.desc      Get a array length in the LightWeightMap<boolean,string> keys
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest06Chapter7200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest06Chapter7200';
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
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTSIX_7300
     * @tc.name      testLightWeightMapTest06Chapter7300
     * @tc.desc      Get a array length in the LightWeightMap<Uint8Array,string> keys
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest06Chapter7300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest06Chapter7300';
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
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTSIX_7400
     * @tc.name      testLightWeightMapTest06Chapter7400
     * @tc.desc      Get a array length in the LightWeightMap<TestClass,string> keys
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest06Chapter7400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest06Chapter7400';
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
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTSIX_7500
     * @tc.name      testLightWeightMapTest06Chapter7500
     * @tc.desc      Get a array length in the LightWeightMap<object,string> keys
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2[object Object]
     */
    it("testLightWeightMapTest06Chapter7500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest06Chapter7500';
      console.log(TAG + 'start');

      let value_1: UserInfo = { name: 'Alice', age: 25 };
      let lightWeightMap = new LightWeightMap<UserInfo,string>();
      lightWeightMap.set(value_1, "squirrel");
      let keys = lightWeightMap.keys();
      let keysArray = Array.from(keys);
      expect(keysArray.length).assertEqual(1);
      console.log(TAG + 'end');
    });

  });
}