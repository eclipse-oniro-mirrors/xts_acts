/*
* Copyright (C) 2024 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/
import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium';
import {
  MapGetTest0008,
  MapGetTest0009,
  MapGetTest0010,
  MapGetTest0021,
  MapGetTest0030,
  MapGetTest0031,
  MapGetTest0048,
  MapGetTest0049,
  MapGetTest0050,
  MapGetTest0054,
  MapGetTest0055,
  MapGetTest0070,
  MapGetTest0082,
  MapGetTest0083,
  MapGetTest0084,
  MapGetTest0085,
  MapGetTest0086,
  MapGetTest0087,
  MapGetTest0088,
  MapGetTest0091,
  MapGetTest0092,
  MapGetTest0093,
  MapGetTest0094,
  MapGetTest0095,
  MapGetTest0096,
  MapGetTest0100
} from './MapGet';

interface GeneratedObjectLiteralInterface_1 {
  id: number;
}

interface GeneratedTypeLiteralInterface_1 {
  name: string;
}

interface GeneratedObjectLiteralInterface_2 {}

export async function sleep(ms: number): Promise<void> {
  return new Promise((resolve) => setTimeout(resolve, ms));
}

export default function MapGetTest() {
  describe('MapGetTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(30)
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
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
     * @tc.name   testMapGet0001
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0001
     * @tc.desc   Verify Map.get returns correct value for existing string key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMapGet0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map = new Map<string, number>();
      map.set('key1', 100);
      expect(map.get('key1')).assertEqual(100);
    });

    /**
     * @tc.name   testMapGet0002
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0002
     * @tc.desc   Verify Map.get returns undefined for non-existing key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMapGet0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map = new Map<string, string>();
      map.set('name', 'Alice');
      expect(map.get('age')).assertEqual(undefined);
    });

    /**
     * @tc.name   testMapGet0003
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0003
     * @tc.desc   Verify Map.get returns correct value for number key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMapGet0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map = new Map<number, string>();
      map.set(42, 'answer');
      expect(map.get(42)).assertEqual('answer');
    });

    /**
     * @tc.name   testMapGet0004
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0004
     * @tc.desc   Verify Map.get distinguishes between number and string keys with same value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMapGet0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<number | string, boolean>();
      map.set(123, true);
      map.set('123', false);
      expect(map.get(123)).assertEqual(true);
      expect(map.get('123')).assertEqual(false);
    });

    /**
     * @tc.name   testMapGet0005
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0005
     * @tc.desc   Verify Map.get returns correct value for boolean key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMapGet0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map = new Map<boolean, string>();
      map.set(true, 'yes');
      map.set(false, 'no');
      expect(map.get(true)).assertEqual('yes');
      expect(map.get(false)).assertEqual('no');
    });

    /**
     * @tc.name   testMapGet0006
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0006
     * @tc.desc   Verify Map.get works with object keys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMapGet0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const keyObj: GeneratedObjectLiteralInterface_1 = { id: 1 };
      const map = new Map<GeneratedObjectLiteralInterface_1, string>();
      map.set(keyObj, 'value1');
      expect(map.get(keyObj)).assertEqual('value1');
    });

    /**
     * @tc.name   testMapGet0007
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0007
     * @tc.desc   Verify Map.get returns undefined for different object with same properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMapGet0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<GeneratedObjectLiteralInterface_1, string>();
      map.set({ id: 1 }, 'value1');
      expect(map.get({ id: 1 })).assertEqual(undefined);
    });

    /**
     * @tc.name   testMapGet0008
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0008
     * @tc.desc   Verify Map.get works with Symbol keys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMapGet0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let Get0008 = MapGetTest0008();
      expect(Get0008.map1).assertEqual(42);
    });

    /**
     * @tc.name   testMapGet0009
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0009
     * @tc.desc   Verify Map.get distinguishes between different Symbol keys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMapGet0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let Get0009 = MapGetTest0009();
      expect(Get0009.map1).assertEqual(undefined);
    });

    /**
     * @tc.name   testMapGet0010
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0010
     * @tc.desc   Verify Map.get works with Symbol.for keys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMapGet0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let Get0010 = MapGetTest0010();
      expect(Get0010.map1).assertEqual(true);
    });

    /**
     * @tc.name   testMapGet0011
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0011
     * @tc.desc   Verify Map.get returns correct value after key is updated
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMapGet0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, number>();
      map.set('count', 1);
      map.set('count', 2);
      expect(map.get('count')).assertEqual(2);
    });

    /**
     * @tc.name   testMapGet0012
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0012
     * @tc.desc   Verify Map.get returns undefined after key is deleted
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMapGet0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, string>();
      map.set('key', 'value');
      map.delete('key');
      expect(map.get('key')).assertEqual(undefined);
    });

    /**
     * @tc.name   testMapGet0013
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0013
     * @tc.desc   Verify Map.get works with null key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMapGet0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<null, string>();
      map.set(null, 'null value');
      expect(map.get(null)).assertEqual('null value');
    });

    /**
     * @tc.name   testMapGet0014
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0014
     * @tc.desc   Verify Map.get works with undefined key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMapGet0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<undefined, number>();
      map.set(undefined, 123);
      expect(map.get(undefined)).assertEqual(123);
    });

    /**
     * @tc.name   testMapGet0015
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0015
     * @tc.desc   Verify Map.get distinguishes between null and undefined keys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMapGet0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<null | undefined, string>();
      map.set(null, 'null');
      map.set(undefined, 'undefined');
      expect(map.get(null)).assertEqual('null');
      expect(map.get(undefined)).assertEqual('undefined');
    });

    /**
     * @tc.name   testMapGet0016
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0016
     * @tc.desc   Verify Map.get works with NaN as key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMapGet0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<number, string>();
      map.set(NaN, 'not a number');
      expect(map.get(NaN)).assertEqual('not a number');
    });

    /**
     * @tc.name   testMapGet0017
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0017
     * @tc.desc   Verify Map.get returns correct value for large integer key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMapGet0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const largeKey = 9007199254740991n;
      const map = new Map<bigint, string>();
      map.set(largeKey, 'large value');
      expect(map.get(largeKey)).assertEqual('large value');
    });

    /**
     * @tc.name   testMapGet0018
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0018
     * @tc.desc   Verify Map.get works with Date objects as keys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMapGet0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dateKey = new Date('2023-01-01');
      const map = new Map<Date, number>();
      map.set(dateKey, 1);
      expect(map.get(dateKey)).assertEqual(1);
    });

    /**
     * @tc.name   testMapGet0019
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0019
     * @tc.desc   Verify Map.get distinguishes between different Date objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMapGet0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<Date, string>();
      map.set(new Date('2023-01-01'), 'value');
      expect(map.get(new Date('2023-01-01'))).assertEqual(undefined);
    });

    /**
     * @tc.name   testMapGet0020
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0020
     * @tc.desc   Verify Map.get works with RegExp keys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMapGet0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const regKey = /pattern/;
      const map = new Map<RegExp, string>();
      map.set(regKey, 'regex value');
      expect(map.get(regKey)).assertEqual('regex value');
    });

    /**
     * @tc.name   testMapGet0021
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0021
     * @tc.desc   Verify Map.get returns correct value for nested object key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMapGet0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let Get0021 = MapGetTest0021();
      expect(Get0021.map1).assertEqual('nested');
    });

    /**
     * @tc.name   testMapGet0022
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0022
     * @tc.desc   Verify Map.get works with array keys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMapGet0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arrKey = [1, 2, 3];
      const map = new Map<number[], string>();
      map.set(arrKey, 'array value');
      expect(map.get(arrKey)).assertEqual('array value');
    });

    /**
     * @tc.name   testMapGet0023
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0023
     * @tc.desc   Verify Map.get distinguishes between different arrays with same elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMapGet0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<number[], string>();
      map.set([1, 2, 3], 'value');
      expect(map.get([1, 2, 3])).assertEqual(undefined);
    });

    /**
     * @tc.name   testMapGet0024
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0024
     * @tc.desc   Verify Map.get works with function keys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMapGet0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const funcKey = () => 'hello';
      const map = new Map<() => string, number>();
      map.set(funcKey, 5);
      expect(map.get(funcKey)).assertEqual(5);
    });

    /**
     * @tc.name   testMapGet0025
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0025
     * @tc.desc   Verify Map.get returns correct value for multiple keys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMapGet0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map = new Map<string, string>();
      map.set('a', 'apple');
      map.set('b', 'banana');
      map.set('c', 'cherry');
      expect(map.get('a')).assertEqual('apple');
      expect(map.get('b')).assertEqual('banana');
      expect(map.get('c')).assertEqual('cherry');
    });

    /**
     * @tc.name   testMapGet0026
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0026
     * @tc.desc   Verify Map.get works with empty string key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMapGet0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, number>();
      map.set('', 0);
      expect(map.get('')).assertEqual(0);
    });

    /**
     * @tc.name   testMapGet0027
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0027
     * @tc.desc   Verify Map.get returns undefined for empty map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMapGet0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map = new Map<number, number>();
      expect(map.get(1)).assertEqual(undefined);
    });

    /**
     * @tc.name   testMapGet0028
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0028
     * @tc.desc   Verify Map.get works after clear
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMapGet0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, string>();
      map.set('key', 'value');
      map.clear();
      expect(map.get('key')).assertEqual(undefined);
    });

    /**
     * @tc.name   testMapGet0029
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0029
     * @tc.desc   Verify Map.get works with large number of entries
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL3
     */
    it('testMapGet0029', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, (): void => {
      const map = new Map<number, number>();
      const size = 1000;

      for (let i = 0; i < size; i++) {
        map.set(i, i * 2);
      }

      expect(map.get(0)).assertEqual(0);
      expect(map.get(500)).assertEqual(1000);
      expect(map.get(999)).assertEqual(1998);
    });

    /**
     * @tc.name   testMapGet0030
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0030
     * @tc.desc   Verify Map.get returns correct value for symbol key after many operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMapGet0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      let Get0030 = MapGetTest0030();
      expect(Get0030.map1).assertEqual('special value');
    });

    /**
     * @tc.name   testMapGet0031
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0031
     * @tc.desc   Verify Map.get works with objects modified after being used as keys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMapGet0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let Get0031 = MapGetTest0031();
      expect(Get0031.map1).assertEqual(10);
    });

    /**
     * @tc.name   testMapGet0032
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0032
     * @tc.desc   Verify Map.get returns correct value for boolean true key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMapGet0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map = new Map<boolean, string>();
      map.set(true, 'active');
      expect(map.get(true)).assertEqual('active');
    });

    /**
     * @tc.name   testMapGet0033
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0033
     * @tc.desc   Verify Map.get returns correct value for boolean false key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMapGet0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map = new Map<boolean, string>();
      map.set(false, 'inactive');
      expect(map.get(false)).assertEqual('inactive');
    });

    /**
     * @tc.name   testMapGet0034
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0034
     * @tc.desc   Verify Map.get works with negative number keys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMapGet0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map = new Map<number, string>();
      map.set(-1, 'negative one');
      map.set(-100, 'negative hundred');
      expect(map.get(-1)).assertEqual('negative one');
      expect(map.get(-100)).assertEqual('negative hundred');
    });

    /**
     * @tc.name   testMapGet0035
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0035
     * @tc.desc   Verify Map.get works with float number keys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMapGet0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map = new Map<number, string>();
      map.set(3.14, 'pi');
      map.set(2.718, 'e');
      expect(map.get(3.14)).assertEqual('pi');
      expect(map.get(2.718)).assertEqual('e');
    });

    /**
     * @tc.name   testMapGet0036
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0036
     * @tc.desc   Verify Map.get distinguishes between similar float keys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMapGet0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<number, string>();
      map.set(1.0, 'one point zero');
      map.set(1.0000001, 'almost one');
      expect(map.get(1.0)).assertEqual('one point zero');
      expect(map.get(1.0000001)).assertEqual('almost one');
    });

    /**
     * @tc.name   testMapGet0037
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0037
     * @tc.desc   Verify Map.get works with string keys containing special characters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMapGet0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, string>();
      map.set('!@#$%', 'special chars');
      map.set('a=b&c=d', 'query string');
      expect(map.get('!@#$%')).assertEqual('special chars');
      expect(map.get('a=b&c=d')).assertEqual('query string');
    });

    /**
     * @tc.name   testMapGet0038
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0038
     * @tc.desc   Verify Map.get works with Unicode string keys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMapGet0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, string>();
      map.set('café', 'coffee');
      map.set('北京', 'Beijing');
      expect(map.get('café')).assertEqual('coffee');
      expect(map.get('北京')).assertEqual('Beijing');
    });

    /**
     * @tc.name   testMapGet0039
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0039
     * @tc.desc   Verify Map.get works with Map objects as keys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMapGet0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const keyMap = new Map<number, string>([[1, 'one']]);
      const map = new Map<Map<number, string>, number>();
      map.set(keyMap, 1);
      expect(map.get(keyMap)).assertEqual(1);
    });

    /**
     * @tc.name   testMapGet0040
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0040
     * @tc.desc   Verify Map.get works with Set objects as keys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMapGet0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const keySet = new Set<string>(['a', 'b']);
      const map = new Map<Set<string>, string>();
      map.set(keySet, 'set value');
      expect(map.get(keySet)).assertEqual('set value');
    });

    /**
     * @tc.name   testMapGet0041
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0041
     * @tc.desc   Verify Map.get returns correct value for class instance keys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMapGet0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class Person {
        public name: string;

        constructor(name: string) {
          this.name = name;
        }
      }

      const person = new Person('Alice');
      const map = new Map<Person, number>();
      map.set(person, 30);

      expect(map.get(person)).assertEqual(30);
    });

    /**
     * @tc.name   testMapGet0042
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0042
     * @tc.desc   Verify Map.get distinguishes between different class instances
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMapGet0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class Person {
        public name: string;

        constructor(name: string) {
          this.name = name;
        }
      }

      const map = new Map<Person, number>();
      map.set(new Person('Alice'), 30);

      expect(map.get(new Person('Alice'))).assertEqual(undefined);
    });

    /**
     * @tc.name   testMapGet0045
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0045
     * @tc.desc   Verify Map.get works with ArrayBuffer keys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMapGet0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const bufferKey = new ArrayBuffer(8);
      const map = new Map<ArrayBuffer, string>();
      map.set(bufferKey, 'array buffer value');
      expect(map.get(bufferKey)).assertEqual('array buffer value');
    });

    /**
     * @tc.name   testMapGet0046
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0046
     * @tc.desc   Verify Map.get works with DataView keys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMapGet0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const buffer = new ArrayBuffer(16);
      const viewKey = new DataView(buffer);
      const map = new Map<DataView, number>();
      map.set(viewKey, 42);
      expect(map.get(viewKey)).assertEqual(42);
    });

    /**
     * @tc.name   testMapGet0047
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0047
     * @tc.desc   Verify Map.get works with typed array keys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMapGet0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const typedKey = new Uint8Array([1, 2, 3]);
      const map = new Map<Uint8Array, string>();
      map.set(typedKey, 'typed array value');
      expect(map.get(typedKey)).assertEqual('typed array value');
    });

    /**
     * @tc.name   testMapGet0048
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0048
     * @tc.desc   Verify Map.get returns correct value for null prototype object key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMapGet0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      let Get0048 = MapGetTest0048();
      expect(Get0048.map1).assertEqual('no prototype');
    });

    /**
     * @tc.name   testMapGet0049
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0049
     * @tc.desc   Verify Map.get works with frozen object keys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMapGet0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      let Get0049 = MapGetTest0049();
      expect(Get0049.map1).assertEqual('frozen');
    });

    /**
     * @tc.name   testMapGet0050
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0050
     * @tc.desc   Verify Map.get works with sealed object keys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMapGet0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      let Get0050 = MapGetTest0050();
      expect(Get0050.map1).assertEqual('sealed');
    });

    /**
     * @tc.name   testMapGet0051
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0051
     * @tc.desc   Verify Map.get returns correct value after re-adding key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMapGet0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, number>();
      map.set('key', 1);
      map.delete('key');
      map.set('key', 2);
      expect(map.get('key')).assertEqual(2);
    });

    /**
     * @tc.name   testMapGet0052
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0052
     * @tc.desc   Verify Map.get works with same key added multiple times
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMapGet0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<number, string>();
      map.set(1, 'one');
      map.set(1, 'uno');
      map.set(1, 'un');
      expect(map.get(1)).assertEqual('un');
    });

    /**
     * @tc.name   testMapGet0053
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0053
     * @tc.desc   Verify Map.get returns correct value for key added in constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMapGet0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map = new Map<string, number>([
        ['a', 1],
        ['b', 2],
        ['c', 3]
      ]);
      expect(map.get('b')).assertEqual(2);
    });

    /**
     * @tc.name   testMapGet0054
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0054
     * @tc.desc   Verify Map.get works with keys that have valueOf method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMapGet0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      let Get0054 = MapGetTest0054();
      expect(Get0054.map1).assertEqual('valueOf key');
    });

    /**
     * @tc.name   testMapGet0055
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0055
     * @tc.desc   Verify Map.get works with keys that have Symbol.toPrimitive
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMapGet0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      let Get0055 = MapGetTest0055();
      expect(Get0055.map1).assertEqual('primitive key');
    });

    /**
     * @tc.name   testMapGet0056
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0056
     * @tc.desc   Verify Map.get returns correct value for key in nested Map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMapGet0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const innerMap = new Map<string, number>([['x', 10], ['y', 20]]);
      const outerMap = new Map<string, Map<string, number>>();
      outerMap.set('inner', innerMap);

      expect(outerMap.get('inner')?.get('x')).assertEqual(10);
    });

    /**
     * @tc.name   testMapGet0057
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0057
     * @tc.desc   Verify Map.get works with Error objects as keys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMapGet0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const errorKey = new Error('test error');
      const map = new Map<Error, string>();
      map.set(errorKey, 'error value');
      expect(map.get(errorKey)).assertEqual('error value');
    });

    /**
     * @tc.name   testMapGet0058
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0058
     * @tc.desc   Verify Map.get distinguishes between different Error objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMapGet0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const map = new Map<Error, string>();
      map.set(new Error('test'), 'value');
      expect(map.get(new Error('test'))).assertEqual(undefined);
    });

    /**
     * @tc.name   testMapGet0059
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0059
     * @tc.desc   Verify Map.get works with Promise objects as keys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMapGet0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const promiseKey = Promise.resolve('test');
      const map = new Map<Promise<string>, number>();
      map.set(promiseKey, 1);
      expect(map.get(promiseKey)).assertEqual(1);
    });

    /**
     * @tc.name   testMapGet0060
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0060
     * @tc.desc   Verify Map.get returns correct value for function value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMapGet0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, () => number>();
      const func = () => 42;
      map.set('func', func);
      expect(map.get('func')).assertEqual(func);
      expect(map.get('func')!()).assertEqual(42);
    });

    /**
     * @tc.name   testMapGet0061
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0061
     * @tc.desc   Verify Map.get returns correct value for array value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMapGet0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, number[]>();
      const arr = [1, 2, 3];
      map.set('array', arr);
      expect(map.get('array')).assertEqual(arr);
      expect(map.get('array')![1]).assertEqual(2);
    });

    /**
     * @tc.name   testMapGet0062
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0062
     * @tc.desc   Verify Map.get returns correct value for object value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMapGet0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, GeneratedTypeLiteralInterface_1>();
      const obj: GeneratedTypeLiteralInterface_1 = { name: 'test' };
      map.set('object', obj);
      expect(map.get('object')).assertEqual(obj);
      expect(map.get('object')!.name).assertEqual('test');
    });

    /**
     * @tc.name   testMapGet0063
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0063
     * @tc.desc   Verify Map.get returns correct value for Map value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMapGet0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const valueMap = new Map<number, string>([[1, 'one']]);
      const map = new Map<string, Map<number, string>>();
      map.set('map', valueMap);
      expect(map.get('map')).assertEqual(valueMap);
      expect(map.get('map')?.get(1)).assertEqual('one');
    });

    /**
     * @tc.name   testMapGet0064
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0064
     * @tc.desc   Verify Map.get returns correct value for Set value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMapGet0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const valueSet = new Set<string>(['a', 'b']);
      const map = new Map<string, Set<string>>();
      map.set('set', valueSet);
      expect(map.get('set')).assertEqual(valueSet);
      expect(map.get('set')?.has('a')).assertTrue();
    });

    /**
     * @tc.name   testMapGet0065
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0065
     * @tc.desc   Verify Map.get returns correct value after map is copied
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMapGet0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const originalMap = new Map<string, number>([['a', 1], ['b', 2]]);
      const copiedMap = new Map(originalMap);

      expect(copiedMap.get('a')).assertEqual(1);
      expect(copiedMap.get('b')).assertEqual(2);
    });

    /**
     * @tc.name   testMapGet0066
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0066
     * @tc.desc   Verify Map.get works with keys from other realms (theoretical)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMapGet0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      // This test is theoretical as it requires multiple JavaScript realms
      // We'll simulate it with a simple check
      const key = 'cross-realm';
      const map = new Map<string, string>();
      map.set(key, 'value');
      expect(map.get(key)).assertEqual('value');
    });

    /**
     * @tc.name   testMapGet0067
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0067
     * @tc.desc   Verify Map.get returns undefined for key that was never set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMapGet0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map = new Map<string, string>();
      map.set('a', 'A');
      expect(map.get('b')).assertEqual(undefined);
    });

    /**
     * @tc.name   testMapGet0068
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0068
     * @tc.desc   Verify Map.get works with very long string keys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMapGet0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const longKey = 'a'.repeat(1000);
      const map = new Map<string, string>();
      map.set(longKey, 'long value');
      expect(map.get(longKey)).assertEqual('long value');
    });

    /**
     * @tc.name   testMapGet0069
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0069
     * @tc.desc   Verify Map.get works with key that is a Map iterator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMapGet0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const map = new Map<number, string>([[1, 'one']]);
      const iterator = map.keys();
      const keyMap = new Map<IterableIterator<number>, string>();
      keyMap.set(iterator, 'iterator value');

      expect(keyMap.get(iterator)).assertEqual('iterator value');
    });

    /**
     * @tc.name   testMapGet0070
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0070
     * @tc.desc   Verify Map.get works with generator object as key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMapGet0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      let Get0070 = MapGetTest0070();
      expect(Get0070.map1).assertEqual('generator value');
    });

    /**
     * @tc.name   testMapGet0071
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0071
     * @tc.desc   Verify Map.get returns correct value for key added in loop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMapGet0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<number, number>();

      for (let i = 0; i < 10; i++) {
        map.set(i, i * i);
      }

      expect(map.get(5)).assertEqual(25);
    });

    /**
     * @tc.name   testMapGet0072
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0072
     * @tc.desc   Verify Map.get works with key that is a WeakMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMapGet0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const weakMapKey = new WeakMap<object, string>();
      const obj: GeneratedObjectLiteralInterface_2 = {};
      weakMapKey.set(obj, 'value');

      const map = new Map<WeakMap<object, string>, number>();
      map.set(weakMapKey, 1);

      expect(map.get(weakMapKey)).assertEqual(1);
    });

    /**
     * @tc.name   testMapGet0073
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0073
     * @tc.desc   Verify Map.get works with key that is a WeakSet
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMapGet0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const weakSetKey = new WeakSet<object>();
      const obj: GeneratedObjectLiteralInterface_2 = {};
      weakSetKey.add(obj);

      const map = new Map<WeakSet<object>, number>();
      map.set(weakSetKey, 2);

      expect(map.get(weakSetKey)).assertEqual(2);
    });

    /**
     * @tc.name   testMapGet0074
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0074
     * @tc.desc   Verify Map.get returns correct value after map is modified
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMapGet0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, string>([['a', 'A'], ['b', 'B']]);

      // Modify the map
      map.set('c', 'C');
      map.delete('a');

      expect(map.get('b')).assertEqual('B');
      expect(map.get('c')).assertEqual('C');
    });

    /**
     * @tc.name   testMapGet0075
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0075
     * @tc.desc   Verify Map.get works with key that is a RegExp with flags
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMapGet0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const regKey = /test/gi;
      const map = new Map<RegExp, string>();
      map.set(regKey, 'regex with flags');
      expect(map.get(regKey)).assertEqual('regex with flags');
    });

    /**
     * @tc.name   testMapGet0076
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0076
     * @tc.desc   Verify Map.get distinguishes between RegExp with different flags
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMapGet0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<RegExp, string>();
      map.set(/test/g, 'global');
      expect(map.get(/test/i)).assertEqual(undefined);
    });

    /**
     * @tc.name   testMapGet0077
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0077
     * @tc.desc   Verify Map.get works with key that is a Date with same time value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMapGet0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date1 = new Date(2023, 0, 1);
      const date2 = new Date(2023, 0, 1); // Same time value but different object
      const map = new Map<Date, string>();
      map.set(date1, 'date value');

      expect(map.get(date2)).assertEqual(undefined);
    });

    /**
     * @tc.name   testMapGet0078
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0078
     * @tc.desc   Verify Map.get works with key that is a BigInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMapGet0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bigKey = 9007199254740991n;
      const map = new Map<bigint, string>();
      map.set(bigKey, 'big integer');
      expect(map.get(bigKey)).assertEqual('big integer');
    });

    /**
     * @tc.name   testMapGet0079
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0079
     * @tc.desc   Verify Map.get distinguishes between BigInt and Number with same value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMapGet0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<bigint | number, string>();
      map.set(42n, 'bigint');
      map.set(42, 'number');

      expect(map.get(42n)).assertEqual('bigint');
      expect(map.get(42)).assertEqual('number');
    });


    /**
     * @tc.name   testMapGet0081
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0081
     * @tc.desc   Verify Map.get returns correct value for key in large map
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL3
     */
    it('testMapGet0081', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, (): void => {
      const map = new Map<number, string>();
      const targetKey = 5000;

      for (let i = 0; i < 10000; i++) {
        map.set(i, `value${i}`);
      }

      expect(map.get(targetKey)).assertEqual(`value${targetKey}`);
    });

    /**
     * @tc.name   testMapGet0082
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0082
     * @tc.desc   Verify Map.get works with key that is a Proxy object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMapGet0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      let Get0082 = MapGetTest0082();
      expect(Get0082.map1).assertEqual('proxy value');
    });

    /**
     * @tc.name   testMapGet0083
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0083
     * @tc.desc   Verify Map.get distinguishes between Proxy and target object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMapGet0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      let Get0083 = MapGetTest0083();
      expect(Get0083.map1).assertEqual('proxy value');
    });

    /**
     * @tc.name   testMapGet0084
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0084
     * @tc.desc   Verify Map.get works with key that is a Reflect object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMapGet0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      let Get0084 = MapGetTest0084();
      expect(Get0084.map1).assertEqual('reflect value');
    });

    /**
     * @tc.name   testMapGet0085
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0085
     * @tc.desc   Verify Map.get works with key that is a Math object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMapGet0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      let Get0085 = MapGetTest0085();
      expect(Get0085.map1).assertEqual('math value');
    });

    /**
     * @tc.name   testMapGet0086
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0086
     * @tc.desc   Verify Map.get returns correct value for Symbol.iterator key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMapGet0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      let Get0086 = MapGetTest0086();
      expect(Get0086.map1).assertEqual(true);
    });

    /**
     * @tc.name   testMapGet0087
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0087
     * @tc.desc   Verify Map.get returns correct value for Symbol.toStringTag key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMapGet0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      let Get0087 = MapGetTest0087();
      expect(Get0087.map1).assertEqual(true);
    });

    /**
     * @tc.name   testMapGet0088
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0088
     * @tc.desc   Verify Map.get works with key that is a module object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMapGet0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      let Get0088 = MapGetTest0088();
      expect(Get0088.map1).assertEqual('module value');
    });

    /**
     * @tc.name   testMapGet0089
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0089
     * @tc.desc   Verify Map.get works with key that is a class
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMapGet0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      class MyClass {
      }

      const map = new Map<MyClass, string>();
      map.set(MyClass, 'class value');
      expect(map.get(MyClass)).assertEqual('class value');
    });

    /**
     * @tc.name   testMapGet0090
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0090
     * @tc.desc   Verify Map.get works with key that is a derived class
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMapGet0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      class Parent {
      }

      class Child extends Parent {
      }

      const map = new Map<Child, string>();
      map.set(Child, 'child class');

      expect(map.get(Child)).assertEqual('child class');
      expect(map.get(Parent)).assertEqual(undefined);
    });

    /**
     * @tc.name   testMapGet0091
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0091
     * @tc.desc   Verify Map.get works with key that is a function with prototype
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMapGet0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      let Get0091 = MapGetTest0091();
      expect(Get0091.map1).assertEqual('function with prototype');
    });

    /**
     * @tc.name   testMapGet0092
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0092
     * @tc.desc   Verify Map.get works with key that is an async function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMapGet0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      let Get0092 = MapGetTest0092();
      expect(Get0092.map1).assertEqual('async function');
    });

    /**
     * @tc.name   testMapGet0093
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0093
     * @tc.desc   Verify Map.get works with key that is a generator function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMapGet0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      let Get0093 = MapGetTest0093();
      expect(Get0093.map1).assertEqual('generator function');
    });

    /**
     * @tc.name   testMapGet0094
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0094
     * @tc.desc   Verify Map.get works with key that is a arrow function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMapGet0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      let Get0094 = MapGetTest0094();
      expect(Get0094.map1).assertEqual('arrow function');
    });

    /**
     * @tc.name   testMapGet0095
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0095
     * @tc.desc   Verify Map.get returns correct value for key in nested object structure
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMapGet0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      let Get0095 = MapGetTest0095();
      expect(Get0095.map1).assertEqual(42);
    });

    /**
     * @tc.name   testMapGet0096
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0096
     * @tc.desc   Verify Map.get works with key that has circular reference
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMapGet0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      let Get0096 = MapGetTest0096();
      expect(Get0096.map1).assertEqual('circular value');
    });


    /**
     * @tc.name   testMapGet0100
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0100
     * @tc.desc   Verify Map.get returns correct value for Symbol key in mixed key map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMapGet0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let Get0100 = MapGetTest0100();
      expect(Get0100.map1).assertEqual(true);
    });


    /**
     * @tc.name   testMapGet0106
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0106
     * @tc.desc   Verify Map.get works with key that is a Intl.DateTimeFormat object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMapGet0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const formatterKey = new Intl.DateTimeFormat('en-US');
      const map = new Map<Intl.DateTimeFormat, string>();
      map.set(formatterKey, 'formatter value');

      expect(map.get(formatterKey)).assertEqual('formatter value');
    });

    /**
     * @tc.name   testMapGet0107
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0107
     * @tc.desc   Verify Map.get works with key that is a Intl.NumberFormat object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMapGet0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const formatterKey = new Intl.NumberFormat('en-US');
      const map = new Map<Intl.NumberFormat, string>();
      map.set(formatterKey, 'number formatter');

      expect(map.get(formatterKey)).assertEqual('number formatter');
    });

    /**
     * @tc.name   testMapGet0110
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0110
     * @tc.desc   Verify Map.get returns correct value after many key additions and deletions
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL3
     */
    it('testMapGet0110', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, (): void => {
      const map = new Map<number, string>();
      const specialKey = 9999;
      for (let i = 0; i < 10000; i++) {
        map.set(i, `value${i}`);
      }

      for (let i = 0; i < 10000; i++) {
        if (i !== specialKey) {
          map.delete(i);
        }
      }

      expect(map.get(specialKey)).assertEqual(`value${specialKey}`);
    });
  })
}