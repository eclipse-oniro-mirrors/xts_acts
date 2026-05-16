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

interface MyObj {
  id: number;
  name: string;
  active: boolean;
}

interface Point {
  x: number;
  y: number;
  z: number;
}

interface Config {
  key: string;
  value: number;
  enabled: boolean;
}

interface LogEntry {
  timestamp: number;
  message: string;
  level: string;
}

interface Coordinate {
  x: number;
  y: number;
  z: number;
}

interface SensorData {
  sensorId: string;
  timestamp: number;
  value: number;
}

interface CharacterInfo {
  charCode: number;
  charVal: string;
  unicode: string;
}

function sleep(count: int): Promise<void> {
  return new Promise<void>((resolve: (value: PromiseLike<void>) => void, reject: (value: Error) => void) => {
    setTimeout(() => {
      resolve(Promise.resolve())
    }, count)
  })
}

export default function testLightWeightMapTest05(): void {
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
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTFIVE_0100
     * @tc.name      testLightWeightMapTest05Chapter0100
     * @tc.desc      removeAt with normal index, expect true
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest05Chapter0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest05Chapter0100';
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
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTFIVE_0200
     * @tc.name      testLightWeightMapTest05Chapter0200
     * @tc.desc      removeAt with first index (0), expect true
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest05Chapter0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest05Chapter0200';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set('a', 1);
      lightWeightMap.set('b', 2);
      const result = lightWeightMap.removeAt(0);
      expect(result).assertTrue();

      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTFIVE_0300
     * @tc.name      testLightWeightMapTest05Chapter0300
     * @tc.desc      removeAt with last index, expect true
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest05Chapter0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest05Chapter0300';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set('a', 1);
      lightWeightMap.set('b', 2);
      lightWeightMap.set('c', 3);
      const lastIndex: int = lightWeightMap.length - 1;
      const result = lightWeightMap.removeAt(lastIndex);
      expect(result).assertTrue();

      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTFIVE_0400
     * @tc.name      testLightWeightMapTest05Chapter0400
     * @tc.desc      removeAt with negative index, expect false
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest05Chapter0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest05Chapter0400';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set('a', 1);
      lightWeightMap.set('b', 2);
      const result = lightWeightMap.removeAt(-1);
      expect(result).assertFalse();

      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTFIVE_0500
     * @tc.name      testLightWeightMapTest05Chapter0500
     * @tc.desc      removeAt with out-of-range positive index, expect false
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest05Chapter0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest05Chapter0500';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set('a', 1);
      const result = lightWeightMap.removeAt(10);
      expect(result).assertFalse();

      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTFIVE_0600
     * @tc.name      testLightWeightMapTest05Chapter0600
     * @tc.desc      removeAt with float index (truncated), expect true
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest05Chapter0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest05Chapter0600';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set('a', 1);
      lightWeightMap.set('b', 2);
      lightWeightMap.set('c', 3);
      const result = lightWeightMap.removeAt(Math.floor(1.5).toInt()); // 截断�?1
      expect(result).assertTrue();

      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTFIVE_0700
     * @tc.name      testLightWeightMapTest05Chapter0700
     * @tc.desc      removeAt with NaN index, expect false
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest05Chapter0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest05Chapter0700';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set('a', 1);
      lightWeightMap.removeAt(NaN.toInt());
      lightWeightMap.set('b', 2);
      expect(lightWeightMap.get('b')).assertEqual(2);
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTFIVE_0800
     * @tc.name      testLightWeightMapTest05Chapter0800
     * @tc.desc      removeAt with Infinity index, expect false
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest05Chapter0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest05Chapter0800';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set('a', 1);
      lightWeightMap.removeAt(Infinity.toInt());
      lightWeightMap.set('b', 2);
      expect(lightWeightMap.get('b')).assertEqual(2);

      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTFIVE_0900
     * @tc.name      testLightWeightMapTest05Chapter0900
     * @tc.desc      removeAt with -Infinity index, expect false
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest05Chapter0900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest05Chapter0900';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set('a', 1);
      lightWeightMap.removeAt((-Infinity).toInt());
      lightWeightMap.set('b', 2);
      expect(lightWeightMap.get('b')).assertEqual(2);

      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTFIVE_1000
     * @tc.name      testLightWeightMapTest05Chapter1000
     * @tc.desc      removeAt on empty map, expect false
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest05Chapter1000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest05Chapter1000';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      const result = lightWeightMap.removeAt(0);
      expect(result).assertFalse();

      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTFIVE_1100
     * @tc.name      testLightWeightMapTest05Chapter1100
     * @tc.desc      removeAt with large index (INT32_MAX), expect false
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest05Chapter1100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest05Chapter1100';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set('k1', 1);
      lightWeightMap.set('k2', 2);
      const result = lightWeightMap.removeAt(2147483647);
      expect(result).assertFalse();

      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTFIVE_1200
     * @tc.name      testLightWeightMapTest05Chapter1200
     * @tc.desc      removeAt with large negative index (INT32_MIN), expect false
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest05Chapter1200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest05Chapter1200';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set('k1', 1);
      lightWeightMap.set('k2', 2);
      const result = lightWeightMap.removeAt(-2147483648);
      expect(result).assertFalse();

      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTFIVE_1300
     * @tc.name      testLightWeightMapTest05Chapter1300
     * @tc.desc      removeAt all items by repeatedly removing index 0, expect true each time
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest05Chapter1300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest05Chapter1300';
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
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTFIVE_1400
     * @tc.name      testLightWeightMapTest05Chapter1400
     * @tc.desc      removeAt after clear, expect false
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest05Chapter1400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest05Chapter1400';
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
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTFIVE_1500
     * @tc.name      testLightWeightMapTest05Chapter1500
     * @tc.desc      removeAt with Math.floor(1.5) index
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest05Chapter1500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest05Chapter1500';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set("a", 1);
      lightWeightMap.set("b", 2);
      const index = Math.floor(1.5); // 1
      const result = lightWeightMap.removeAt(index.toInt());
      expect(result).assertTrue();

      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTFIVE_1600
     * @tc.name      testLightWeightMapTest05Chapter1600
     * @tc.desc      removeAt with Number.MAX_VALUE index, expect false
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest05Chapter1600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest05Chapter1600';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      const result = lightWeightMap.removeAt(Number.MAX_VALUE.toInt());
      expect(result).assertFalse();

      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTFIVE_1700
     * @tc.name      testLightWeightMapTest05Chapter1700
     * @tc.desc      removeAt with Number.MIN_VALUE index, expect false
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest05Chapter1700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest05Chapter1700';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      const result = lightWeightMap.removeAt(Number.MIN_VALUE.toInt());
      expect(result).assertFalse();

      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTFIVE_1800
     * @tc.name      testLightWeightMapTest05Chapter1800
     * @tc.desc      removeAt with Number.EPSILON index, expect false
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest05Chapter1800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest05Chapter1800';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      const result = lightWeightMap.removeAt(Number.EPSILON.toInt());
      expect(result).assertFalse();

      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTFIVE_1900
     * @tc.name      testLightWeightMapTest05Chapter1900
     * @tc.desc      removeAt with Number.MAX_SAFE_INTEGER index, expect false
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest05Chapter1900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest05Chapter1900';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      const result = lightWeightMap.removeAt(Number.MAX_SAFE_INTEGER.toInt());
      expect(result).assertFalse();

      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTFIVE_2000
     * @tc.name      testLightWeightMapTest05Chapter2000
     * @tc.desc      removeAt with byte min index (-128), expect false
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest05Chapter2000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest05Chapter2000';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set("x", 1);
      const result = lightWeightMap.removeAt(-128);
      expect(result).assertFalse();

      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTFIVE_2100
     * @tc.name      testLightWeightMapTest05Chapter2100
     * @tc.desc      removeAt with byte max index (127), expect false
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest05Chapter2100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest05Chapter2100';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set("a", 1);
      lightWeightMap.set("b", 2);
      const result = lightWeightMap.removeAt(127);
      expect(result).assertFalse();

      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTFIVE_2200
     * @tc.name      testLightWeightMapTest05Chapter2200
     * @tc.desc      removeAt with short min index (-32768), expect false
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest05Chapter2200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest05Chapter2200';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set("a", 1);
      const result = lightWeightMap.removeAt(-32768);
      expect(result).assertFalse();

      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTFIVE_2300
     * @tc.name      testLightWeightMapTest05Chapter2300
     * @tc.desc      removeAt with short max index (32767), expect false
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest05Chapter2300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest05Chapter2300';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set("a", 1);
      const result = lightWeightMap.removeAt(32767);
      expect(result).assertFalse();

      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTFIVE_2400
     * @tc.name      testLightWeightMapTest05Chapter2400
     * @tc.desc      removeAt with int min index (-2147483648), expect false
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest05Chapter2400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest05Chapter2400';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set("a", 1);
      const result = lightWeightMap.removeAt(-2147483648);
      expect(result).assertFalse();

      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTFIVE_2500
     * @tc.name      testLightWeightMapTest05Chapter2500
     * @tc.desc      removeAt with int max index (2147483647), expect false
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest05Chapter2500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest05Chapter2500';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set("a", 1);
      const result = lightWeightMap.removeAt(2147483647);
      expect(result).assertFalse();

      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTFIVE_2600
     * @tc.name      testLightWeightMapTest05Chapter2600
     * @tc.desc      removeAt with long min index (-9223372036854775808), expect false
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest05Chapter2600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest05Chapter2600';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      const longMin = -9223372036854775808;
      let result: boolean = false;
      try {
        lightWeightMap.getValueAt(longMin.toInt());
      } catch(e) {
        result = true;
      }
      expect(result).assertTrue();

      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTFIVE_2700
     * @tc.name      testLightWeightMapTest05Chapter2700
     * @tc.desc      removeAt with long max index (9223372036854775807), expect false
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest05Chapter2700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest05Chapter2700';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      const longMax = 9223372036854775807;
      let result: boolean = false;
      try {
        lightWeightMap.getValueAt(longMax.toInt());
      } catch(e) {
        result = true;
      }
      expect(result).assertTrue();

      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTFIVE_2800
     * @tc.name      testLightWeightMapTest05Chapter2800
     * @tc.desc      removeAt with float min index (1.401298e-45), expect false
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest05Chapter2800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest05Chapter2800';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      const floatMin = 1.40129846432481707e-45;
      let result: boolean = false;
      try {
        lightWeightMap.getValueAt(floatMin.toInt());
      } catch(e) {
        result = true;
      }
      expect(result).assertTrue();

      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTFIVE_2900
     * @tc.name      testLightWeightMapTest05Chapter2900
     * @tc.desc      removeAt with float max index (3.402823e+38), expect false
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest05Chapter2900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest05Chapter2900';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      const floatMax = 3.40282346638528860e+38;
      let result: boolean = false;
      try {
        lightWeightMap.getValueAt(floatMax.toInt());
      } catch(e) {
        result = true;
      }
      expect(result).assertTrue();

      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTFIVE_3000
     * @tc.name      testLightWeightMapTest05Chapter3000
     * @tc.desc      removeAt with double min index (4.940656e-324), expect false
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest05Chapter3000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest05Chapter3000';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      const doubleMin = 4.94065645841246544e-324;
      let result: boolean = false;
      try {
        lightWeightMap.getValueAt(doubleMin.toInt());
      } catch(e) {
        result = true;
      }
      expect(result).assertTrue();

      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTFIVE_3100
     * @tc.name      testLightWeightMapTest05Chapter3100
     * @tc.desc      removeAt with double max index (1.797693e+308), expect false
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest05Chapter3100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest05Chapter3100';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      const doubleMax = 1.79769313486231570e+308;
      let result: boolean = false;
      try {
        lightWeightMap.getValueAt(doubleMax.toInt());
      } catch(e) {
        result = true;
      }
      expect(result).assertTrue();

      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTFIVE_3200
     * @tc.name      testLightWeightMapTest05Chapter3200
     * @tc.desc      removeAt with char min index (0), expect true
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest05Chapter3200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest05Chapter3200';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set("only", 1);
      const charMin: int = 0;
      const result = lightWeightMap.removeAt(charMin);
      expect(result).assertTrue();

      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTFIVE_3300
     * @tc.name      testLightWeightMapTest05Chapter3300
     * @tc.desc      removeAt with char max index (65535), expect false
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest05Chapter3300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest05Chapter3300';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      const charMax: int = 65535;
      const result = lightWeightMap.removeAt(charMax);
      expect(result).assertFalse();

      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTFIVE_3400
     * @tc.name      testLightWeightMapTest05Chapter3400
     * @tc.desc      removeAt with BigInt index converted to number, expect false
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest05Chapter3400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest05Chapter3400';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      const removed = lightWeightMap.removeAt(100);
      expect(removed).assertEqual(false);

      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTFIVE_3500
     * @tc.name      testLightWeightMapTest05Chapter3500
     * @tc.desc      removeAt with 123.456 as index, expect false
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest05Chapter3500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest05Chapter3500';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      const removed = lightWeightMap.removeAt(123);
      expect(removed).assertEqual(false);

      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTFIVE_3600
     * @tc.name      testLightWeightMapTest05Chapter3600
     * @tc.desc      removeAt with hex index 0xcafebabe, expect false
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest05Chapter3600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest05Chapter3600';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      const removed = lightWeightMap.removeAt(100);
      expect(removed).assertEqual(false);
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTFIVE_3700
     * @tc.name      testLightWeightMapTest05Chapter3700
     * @tc.desc      removeAt with exponent index 2 ** 3, expect true
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest05Chapter3700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest05Chapter3700';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      for (let i: int = 0; i < 10; i++) {
        lightWeightMap.set(`k${i}`, i);
      }
      const idx: int = (2 ** 3).toInt();
      const result = lightWeightMap.removeAt(idx);
      expect(result).assertTrue();

      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTFIVE_3800
     * @tc.name      testLightWeightMapTest05Chapter3800
     * @tc.desc      removeAt with scientific notation index 1e3, expect false
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest05Chapter3800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest05Chapter3800';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set("a", 1);
      const idx = 1e3;
      const result = lightWeightMap.removeAt(idx.toInt());
      expect(result).assertFalse();

      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTFIVE_3900
     * @tc.name      testLightWeightMapTest05Chapter3900
     * @tc.desc      Check whether the LightWeightMap works normally after adding data
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest05Chapter3900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest05Chapter3900';
      console.log(TAG + 'start');
      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set("squirrel", 123);
      lightWeightMap.set("sparrow", 356);
      const result = lightWeightMap.setValueAt(1, 3546);
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTFIVE_4000
     * @tc.name      testLightWeightMapTest05Chapter4000
     * @tc.desc      Check whether the LightWeightMap works normally after adding data
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest05Chapter4000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest05Chapter4000';
      console.log(TAG + 'start');
      const lightWeightMap = new LightWeightMap<string, Uint8Array>();
      lightWeightMap.set("squirrel", new Uint8Array([100]));
      lightWeightMap.set("sparrow", new Uint8Array([9]));
      const result = lightWeightMap.setValueAt(-0, new Uint8Array([20]));
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTFIVE_4100
     * @tc.name      testLightWeightMapTest05Chapter4100
     * @tc.desc      Check whether the LightWeightMap works normally after adding data
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest05Chapter4100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest05Chapter4100';
      console.log(TAG + 'start');
      const lightWeightMap = new LightWeightMap<string, Uint8Array>();
      lightWeightMap.set("squirrel", new Uint8Array([100]));
      lightWeightMap.set("sparrow", new Uint8Array([9]));
      lightWeightMap.setValueAt(0, new Uint8Array([20]));
      expect(lightWeightMap.getValueAt(0)![0]).assertEqual(20);
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTFIVE_4200
     * @tc.name      testLightWeightMapTest05Chapter4200
     * @tc.desc      removeAt with negative index
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest05Chapter4200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest05Chapter4200';
      console.log(TAG + 'start');
      const lightWeightMap = new LightWeightMap<string, Uint8Array>();
      lightWeightMap.set("squirrel", new Uint8Array([100]));
      lightWeightMap.set("sparrow", new Uint8Array([9]));
      let result:boolean = false;
      try {
        lightWeightMap.setValueAt(-1, new Uint8Array([20]));
      }catch(e){
        result = e instanceof Error;
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTFIVE_4300
     * @tc.name      testLightWeightMapTest05Chapter4300
     * @tc.desc      Check whether the LightWeightMap works normally after adding data
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest05Chapter4300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest05Chapter4300';
      console.log(TAG + 'start');
      const lightWeightMap = new LightWeightMap<string, Uint8Array>();
      lightWeightMap.set("squirrel", new Uint8Array([100]));
      lightWeightMap.set("sparrow", new Uint8Array([9]));
      let result:boolean = false;
      try {
        lightWeightMap.setValueAt(Infinity.toInt(), new Uint8Array([20]));
      }catch(e){
        result = e instanceof Error;
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTFIVE_4400
     * @tc.name      testLightWeightMapTest05Chapter4400
     * @tc.desc      Test LightWeightMap setValueAt with -Infinity (string key, Uint8Array value)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest05Chapter4400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest05Chapter4400';
      console.log(TAG + 'start');
      const lightWeightMap = new LightWeightMap<string, Uint8Array>();
      lightWeightMap.set("squirrel", new Uint8Array([100]));
      lightWeightMap.set("sparrow", new Uint8Array([9]));
      let result: boolean = false;
      try {
        lightWeightMap.setValueAt((-Infinity).toInt(), new Uint8Array([20]));
      } catch (e) {
        result = e instanceof Error;
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTFIVE_4500
     * @tc.name      testLightWeightMapTest05Chapter4500
     * @tc.desc      Test LightWeightMap setValueAt with Math.floor(1.5) (object key, boolean value)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest05Chapter4500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest05Chapter4500';
      console.log(TAG + 'start');

      const obj1: MyObj = { id: 1, name: "obj1", active: true };
      const obj2: MyObj = { id: 2, name: "obj2", active: false };

      const lightWeightMap = new LightWeightMap<object, boolean>();
      lightWeightMap.set(obj1, true);
      lightWeightMap.set(obj2, false);

      const result = lightWeightMap.setValueAt(Math.floor(1.5).toInt(), false);
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTFIVE_4600
     * @tc.name      testLightWeightMapTest05Chapter4600
     * @tc.desc      Test LightWeightMap setValueAt with Number.MAX_VALUE (class key, number value)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest05Chapter4600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest05Chapter4600';
      console.log(TAG + 'start');
      const instance1 = new TestClass(1, "Alice");
      const instance2 = new TestClass(2, "Bob");

      const lightWeightMap = new LightWeightMap<object, number>();
      lightWeightMap.set(instance1, 1000);
      lightWeightMap.set(instance2, 2000);

      let result: boolean = false;
      try {
        lightWeightMap.setValueAt(Number.MAX_VALUE.toInt(), 3000);
      } catch (e) {
        result = e instanceof Error;
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTFIVE_4700
     * @tc.name      testLightWeightMapTest05Chapter4700
     * @tc.desc      Test LightWeightMap setValueAt with Number.MIN_VALUE (string key, boolean value)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest05Chapter4700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest05Chapter4700';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, boolean>();
      lightWeightMap.set("item1", true);
      lightWeightMap.set("item2", false);
      lightWeightMap.set("item3", true);

      lightWeightMap.setValueAt(0, false);
      expect(lightWeightMap.getValueAt(0)).assertEqual(false);
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTFIVE_4800
     * @tc.name      testLightWeightMapTest05Chapter4800
     * @tc.desc      Test LightWeightMap setValueAt with Number.EPSILON (object key, Uint8Array value)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest05Chapter4800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest05Chapter4800';
      console.log(TAG + 'start');

      const point1: Point = { x: 1, y: 2, z: 3 };
      const point2: Point = { x: 4, y: 5, z: 6 };

      const lightWeightMap = new LightWeightMap<object, Uint8Array>();
      lightWeightMap.set(point1, new Uint8Array([10, 20, 30]));
      lightWeightMap.set(point2, new Uint8Array([40, 50, 60]));

      lightWeightMap.setValueAt(0, new Uint8Array([70, 80, 90]));
      expect(lightWeightMap.getValueAt(0)![0]).assertEqual(70);
      expect(lightWeightMap.getValueAt(0)![1]).assertEqual(80);
      expect(lightWeightMap.getValueAt(0)![2]).assertEqual(90);
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTFIVE_4900
     * @tc.name      testLightWeightMapTest05Chapter4900
     * @tc.desc      Test LightWeightMap setValueAt with Number.MAX_SAFE_INTEGER (class key, boolean value)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest05Chapter4900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest05Chapter4900';
      console.log(TAG + 'start');
      const instance1 = new TestClass(1, "Laptop");
      const instance2 = new TestClass(2, "Phone");
      const lightWeightMap = new LightWeightMap<object, boolean>();
      lightWeightMap.set(instance1, true);
      lightWeightMap.set(instance2, false);
      let result: boolean = false;
      try {
        lightWeightMap.setValueAt(Number.MAX_SAFE_INTEGER.toInt(), true);
      } catch (e) {
        result = e instanceof Error;
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTFIVE_5000
     * @tc.name      testLightWeightMapTest05Chapter5000
     * @tc.desc      Test LightWeightMap setValueAt with byte min value (-128) (string key, number value)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest05Chapter5000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest05Chapter5000';
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
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTFIVE_5100
     * @tc.name      testLightWeightMapTest05Chapter5100
     * @tc.desc      Test LightWeightMap setValueAt with byte max value (127) (object key, number value)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest05Chapter5100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest05Chapter5100';
      console.log(TAG + 'start');

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
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTFIVE_5200
     * @tc.name      testLightWeightMapTest05Chapter5200
     * @tc.desc      Test LightWeightMap setValueAt with short min value (-32768) (class key, Uint8Array value)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest05Chapter5200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest05Chapter5200';
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
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTFIVE_5300
     * @tc.name      testLightWeightMapTest05Chapter5300
     * @tc.desc      Test LightWeightMap setValueAt with short max value (32767) (string key, boolean value)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest05Chapter5300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest05Chapter5300';
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
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTFIVE_5400
     * @tc.name      testLightWeightMapTest05Chapter5400
     * @tc.desc      Test LightWeightMap setValueAt with int min value (-2147483648) (object key, boolean value)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest05Chapter5400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest05Chapter5400';
      console.log(TAG + 'start');

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
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTFIVE_5500
     * @tc.name      testLightWeightMapTest05Chapter5500
     * @tc.desc      Test LightWeightMap setValueAt with int max value (2147483647) (class key, number value)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest05Chapter5500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest05Chapter5500';
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
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTFIVE_5600
     * @tc.name      testLightWeightMapTest05Chapter5600
     * @tc.desc      Test LightWeightMap setValueAt with long min value (string key, Uint8Array value)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest05Chapter5600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest05Chapter5600';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, Uint8Array>();
      lightWeightMap.set("data1", new Uint8Array([1, 2, 3]));
      lightWeightMap.set("data2", new Uint8Array([4, 5, 6]));

      lightWeightMap.setValueAt(0, new Uint8Array([7, 8, 9]));
      expect(lightWeightMap.getValueAt(0)![0]).assertEqual(7);
      expect(lightWeightMap.getValueAt(0)![1]).assertEqual(8);
      expect(lightWeightMap.getValueAt(0)![2]).assertEqual(9);
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTFIVE_5700
     * @tc.name      testLightWeightMapTest05Chapter5700
     * @tc.desc      Test LightWeightMap setValueAt with long max value (object key, number value)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest05Chapter5700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest05Chapter5700';
      console.log(TAG + 'start');

      const coord1: Coordinate = { x: 10, y: 20, z: 30 };
      const coord2: Coordinate = { x: 40, y: 50, z: 60 };

      const lightWeightMap = new LightWeightMap<object, number>();
      lightWeightMap.set(coord1, 100);
      lightWeightMap.set(coord2, 200);

      const longMax = 9223372036854775807;
      let result: boolean = false;
      try {
        lightWeightMap.setValueAt(longMax.toInt(), 300);
      } catch (e) {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTFIVE_5800
     * @tc.name      testLightWeightMapTest05Chapter5800
     * @tc.desc      Test LightWeightMap setValueAt with float min value (class key, boolean value)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest05Chapter5800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest05Chapter5800';
      console.log(TAG + 'start');

      const instance1 = new TestClass(1, "Book One");
      const instance2 = new TestClass(2, "Book Two");

      const lightWeightMap = new LightWeightMap<object, boolean>();
      lightWeightMap.set(instance1, true);
      lightWeightMap.set(instance2, false);

      lightWeightMap.setValueAt(0, false);
      expect(lightWeightMap.getValueAt(0)).assertEqual(false);
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTFIVE_5900
     * @tc.name      testLightWeightMapTest05Chapter5900
     * @tc.desc      Test LightWeightMap setValueAt with float max value (string key, number value)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest05Chapter5900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest05Chapter5900';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set("temp1", 25.5);
      lightWeightMap.set("temp2", 30.2);
      lightWeightMap.set("temp3", 18.7);

      const floatMax = 3.40282346638528860e+38;
      let result: boolean = false;
      try {
        lightWeightMap.setValueAt(floatMax.toInt(), 42.0);
      } catch (e) {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTFIVE_6000
     * @tc.name      testLightWeightMapTest05Chapter6000
     * @tc.desc      Test LightWeightMap setValueAt with double min value (object key, Uint8Array value)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest05Chapter6000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest05Chapter6000';
      console.log(TAG + 'start');

      const data1: SensorData = { sensorId: "S001", timestamp: Date.now(), value: 23.4 };
      const data2: SensorData = { sensorId: "S002", timestamp: Date.now(), value: 45.6 };

      const lightWeightMap = new LightWeightMap<object, Uint8Array>();
      lightWeightMap.set(data1, new Uint8Array([1, 2, 3, 4]));
      lightWeightMap.set(data2, new Uint8Array([5, 6, 7, 8]));

      lightWeightMap.setValueAt(0, new Uint8Array([9, 10, 11, 12]));
      expect(lightWeightMap.getValueAt(0)![0]).assertEqual(9);
      expect(lightWeightMap.getValueAt(0)![1]).assertEqual(10);
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTFIVE_6100
     * @tc.name      testLightWeightMapTest05Chapter6100
     * @tc.desc      Test LightWeightMap setValueAt with double max value (class key, boolean value)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest05Chapter6100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest05Chapter6100';
      console.log(TAG + 'start');
      const instance1 = new TestClass(1, "John Doe");
      const instance2 = new TestClass(2, "Jane Smith");

      const lightWeightMap = new LightWeightMap<object, boolean>();
      lightWeightMap.set(instance1, true);
      lightWeightMap.set(instance2, false);

      const doubleMax = 1.79769313486231570e+308;
      let result: boolean = false;
      try {
        lightWeightMap.setValueAt(doubleMax.toInt(), true);
      } catch (e) {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTFIVE_6200
     * @tc.name      testLightWeightMapTest05Chapter6200
     * @tc.desc      Test LightWeightMap setValueAt with char min value (string key, number value)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest05Chapter6200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest05Chapter6200';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set("code1", 65); // 'A'
      lightWeightMap.set("code2", 66); // 'B'
      lightWeightMap.set("code3", 67); // 'C'

      const charMin: int = 0;
      const result = lightWeightMap.setValueAt(charMin, 90); // 'Z'
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTFIVE_6300
     * @tc.name      testLightWeightMapTest05Chapter6300
     * @tc.desc      Test LightWeightMap setValueAt with char max value (object key, boolean value)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest05Chapter6300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest05Chapter6300';
      console.log(TAG + 'start');

      const char1: CharacterInfo = { charCode: 65, charVal: 'A', unicode: 'U+0041' };
      const char2: CharacterInfo = { charCode: 66, charVal: 'B', unicode: 'U+0042' };

      const lightWeightMap = new LightWeightMap<object, boolean>();
      lightWeightMap.set(char1, true);
      lightWeightMap.set(char2, false);

      const charMax: int = 65535;
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
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTFIVE_6400
     * @tc.name      testLightWeightMapTest05Chapter6400
     * @tc.desc      Test LightWeightMap setValueAt with BigInt value (class key, Uint8Array value)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest05Chapter6400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest05Chapter6400';
      console.log(TAG + 'start');
      const instance1 = new TestClass(1, "Key One");
      const instance2 = new TestClass(2, "Key Two");

      const lightWeightMap = new LightWeightMap<object, Uint8Array>();
      lightWeightMap.set(instance1, new Uint8Array([0xDE, 0xCA, 0xFA, 0xFE]));
      lightWeightMap.set(instance2, new Uint8Array([0xCA, 0xFE, 0xBA, 0xBE]));

      const numValue = Number.parseInt("decafafecacefade", 16);
      let result: boolean = false;
      try {
        lightWeightMap.setValueAt(numValue.toInt(), new Uint8Array([0xFF, 0xFF, 0xFF, 0xFF]));
      } catch (e) {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTFIVE_6500
     * @tc.name      testLightWeightMapTest05Chapter6500
     * @tc.desc      Test LightWeightMap setValueAt with double value 123.456 (string key, boolean value)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest05Chapter6500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest05Chapter6500';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, boolean>();
      lightWeightMap.set("check1", true);
      lightWeightMap.set("check2", false);
      lightWeightMap.set("check3", true);

      const doubleValue = 123.456;
      let result: boolean = false;
      try {
        lightWeightMap.setValueAt(doubleValue.toInt(), false);
      } catch (e) {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTFIVE_6600
     * @tc.name      testLightWeightMapTest05Chapter6600
     * @tc.desc      Test LightWeightMap setValueAt with float value 0xcafebabe (string key + number value)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest05Chapter6600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest05Chapter6600';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set("hex1", 0xCA);
      lightWeightMap.set("hex2", 0xFE);
      lightWeightMap.set("hex3", 0xBA);
      lightWeightMap.set("hex4", 0xBE);

      const floatValue = 0xcafebabe;
      let result: boolean = false;
      try {
        lightWeightMap.setValueAt(floatValue.toInt(), 0xFFFFFFFF);
      } catch (e) {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTFIVE_6700
     * @tc.name      testLightWeightMapTest05Chapter6700
     * @tc.desc      Test LightWeightMap setValueAt with 16Hex 0x0102 (number key + number value)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest05Chapter6700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest05Chapter6700';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<number, number>();
      lightWeightMap.set(0x0001, 100);
      lightWeightMap.set(0x0002, 200);
      lightWeightMap.set(0x0003, 300);

      const hexValue: int = 0x0102;
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
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTFIVE_6800
     * @tc.name      testLightWeightMapTest05Chapter6800
     * @tc.desc      Test LightWeightMap setValueAt with 32Hex 0x01020304 (string key + boolean value)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest05Chapter6800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest05Chapter6800';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, boolean>();
      lightWeightMap.set("packet1", true);
      lightWeightMap.set("packet2", false);
      lightWeightMap.set("packet3", true);
      lightWeightMap.set("packet4", false);

      const hex32Value: int = 0x01020304;
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
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTFIVE_6900
     * @tc.name      testLightWeightMapTest05Chapter6900
     * @tc.desc      Test LightWeightMap setValueAt with 8Hex 0x3 (number key + boolean value)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest05Chapter6900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest05Chapter6900';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<number, boolean>();
      lightWeightMap.set(0x1, true);
      lightWeightMap.set(0x2, false);
      lightWeightMap.set(0x4, true);

      const octalValue: int = 0x3; // 实际上是十六进制3
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
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTFIVE_7000
     * @tc.name      testLightWeightMapTest05Chapter7000
     * @tc.desc      Test LightWeightMap setValueAt with  2 ** 3 (string key + number value)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest05Chapter7000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest05Chapter7000';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set("square1", 1 ** 2);
      lightWeightMap.set("square2", 2 ** 2);
      lightWeightMap.set("square3", 3 ** 2);

      const exponentValue: int = 8;
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
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTFIVE_7100
     * @tc.name      testLightWeightMapTest05Chapter7100
     * @tc.desc      Test LightWeightMap setValueAt with 1e3 (number key + number value)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest05Chapter7100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest05Chapter7100';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<number, number>();
      lightWeightMap.set(1e1, 10);
      lightWeightMap.set(1e2, 100);
      lightWeightMap.set(1e4, 10000);

      const scientific1 = 1e3; // 1000
      let result: boolean = false;
      try {
        lightWeightMap.setValueAt(scientific1.toInt(), 100000);
      } catch (e) {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTFIVE_7200
     * @tc.name      testLightWeightMapTest05Chapter7200
     * @tc.desc      Test LightWeightMap setValueAt with 2.5e-2 (string key + boolean value)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest05Chapter7200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest05Chapter7200';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, boolean>();
      lightWeightMap.set("small1", true);
      lightWeightMap.set("small2", false);
      lightWeightMap.set("small3", true);

      lightWeightMap.setValueAt(0, false);
      expect(lightWeightMap.getValueAt(0)).assertEqual(false);
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTFIVE_7300
     * @tc.name      testLightWeightMapTest05Chapter7300
     * @tc.desc      Test LightWeightMap setValueAt with 16Hex 0x0102 (number key + number value)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest05Chapter7300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest05Chapter7300';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<number, number>();
      lightWeightMap.set(0x0001, 100);
      lightWeightMap.set(0x0002, 200);
      lightWeightMap.set(0x0003, 300);

      const bigIntVal: number = 9007199254740991;
      let result: boolean = false;
      try {
        lightWeightMap.setValueAt(bigIntVal.toInt(), 400);
      } catch (e) {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });


  });
}
