'use static'
/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../hypium/index';
import Utils from './Util.test';

interface GeneratedObjectLiteralInterface_1 {
  id: number;
}

interface GeneratedTypeLiteralInterface_1 {
  name: string;
}

interface GeneratedObjectLiteralInterface_2 {}

class Person {
  public name: string;

  constructor(name: string) {
    this.name = name;
  }
}

class MyClass {
}
class Parent {
}

class Child extends Parent {
}

export default function MapGetTest() {
  describe('MapGetTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(async () => {
      await Utils.msSleep(30);
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0001
     * @tc.name testMapGet0001
     * @tc.desc Verify Map.get returns correct value for existing string key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testMapGet0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map = new Map<string, number>();
      map.set('key1', 100);
      expect(map.get('key1')).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0002
     * @tc.name testMapGet0002
     * @tc.desc Verify Map.get returns undefined for non-existing key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testMapGet0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map = new Map<string, string>();
      map.set('name', 'Alice');
      expect(map.get('age')).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0003
     * @tc.name testMapGet0003
     * @tc.desc Verify Map.get returns correct value for number key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testMapGet0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map = new Map<number, string>();
      map.set(42, 'answer');
      expect(map.get(42)).assertEqual('answer');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0004
     * @tc.name testMapGet0004
     * @tc.desc Verify Map.get distinguishes between number and string keys with same value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMapGet0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<number | string, boolean>();
      map.set(123, true);
      map.set('123', false);
      expect(map.get(123)).assertEqual(true);
      expect(map.get('123')).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0005
     * @tc.name testMapGet0005
     * @tc.desc Verify Map.get returns correct value for boolean key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testMapGet0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map = new Map<boolean, string>();
      map.set(true, 'yes');
      map.set(false, 'no');
      expect(map.get(true)).assertEqual('yes');
      expect(map.get(false)).assertEqual('no');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0006
     * @tc.name testMapGet0006
     * @tc.desc Verify Map.get works with object keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMapGet0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const keyObj: GeneratedObjectLiteralInterface_1 = { id: 1 };
      const map = new Map<GeneratedObjectLiteralInterface_1, string>();
      map.set(keyObj, 'value1');
      expect(map.get(keyObj)).assertEqual('value1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0007
     * @tc.name testMapGet0007
     * @tc.desc Verify Map.get returns undefined for different object with same properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMapGet0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<GeneratedObjectLiteralInterface_1, string>();
      map.set({ id: 1 }, 'value1');
      expect(map.get({ id: 1 })).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0011
     * @tc.name testMapGet0011
     * @tc.desc Verify Map.get returns correct value after key is updated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMapGet0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, number>();
      map.set('count', 1);
      map.set('count', 2);
      expect(map.get('count')).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0012
     * @tc.name testMapGet0012
     * @tc.desc Verify Map.get returns undefined after key is deleted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMapGet0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, string>();
      map.set('key', 'value');
      map.delete('key');
      expect(map.get('key')).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0013
     * @tc.name testMapGet0013
     * @tc.desc Verify Map.get works with null key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMapGet0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<null, string>();
      map.set(null, 'null value');
      expect(map.get(null)).assertEqual('null value');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0014
     * @tc.name testMapGet0014
     * @tc.desc Verify Map.get works with undefined key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMapGet0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<undefined, number>();
      map.set(undefined, 123);
      expect(map.get(undefined)).assertEqual(123);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0015
     * @tc.name testMapGet0015
     * @tc.desc Verify Map.get distinguishes between null and undefined keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMapGet0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<null | undefined, string>();
      map.set(null, 'null');
      map.set(undefined, 'undefined');
      expect(map.get(null)).assertEqual('null');
      expect(map.get(undefined)).assertEqual('undefined');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0016
     * @tc.name testMapGet0016
     * @tc.desc Verify Map.get works with NaN as key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMapGet0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<number, string>();
      map.set(NaN, 'not a number');
      expect(map.get(NaN)).assertEqual('not a number');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0017
     * @tc.name testMapGet0017
     * @tc.desc Verify Map.get returns correct value for large integer key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMapGet0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const largeKey = 9007199254740991n;
      const map = new Map<bigint, string>();
      map.set(largeKey, 'large value');
      expect(map.get(largeKey)).assertEqual('large value');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0018
     * @tc.name testMapGet0018
     * @tc.desc Verify Map.get works with Date objects as keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMapGet0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dateKey = new Date('2023-01-01');
      const map = new Map<Date, number>();
      map.set(dateKey, 1);
      expect(map.get(dateKey)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0019
     * @tc.name testMapGet0019
     * @tc.desc Verify Map.get distinguishes between different Date objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMapGet0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<Date, string>();
      map.set(new Date('2023-01-01'), 'value');
      expect(map.get(new Date('2023-01-01'))).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0020
     * @tc.name testMapGet0020
     * @tc.desc Verify Map.get works with RegExp keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMapGet0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const regKey = new RegExp("pattern");
      const map = new Map<RegExp, string>();
      map.set(regKey, 'regex value');
      expect(map.get(regKey)).assertEqual('regex value');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0022
     * @tc.name testMapGet0022
     * @tc.desc Verify Map.get works with array keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMapGet0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arrKey = [1, 2, 3];
      const map = new Map<int[], string>();
      map.set(arrKey, 'array value');
      expect(map.get(arrKey)).assertEqual('array value');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0023
     * @tc.name testMapGet0023
     * @tc.desc Verify Map.get distinguishes between different arrays with same elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMapGet0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<number[], string>();
      map.set([1, 2, 3], 'value');
      expect(map.get([1, 2, 3])).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0024
     * @tc.name testMapGet0024
     * @tc.desc Verify Map.get works with function keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMapGet0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const funcKey = () => 'hello';
      const map = new Map<() => string, number>();
      map.set(funcKey, 5);
      expect(map.get(funcKey)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0025
     * @tc.name testMapGet0025
     * @tc.desc Verify Map.get returns correct value for multiple keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
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
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0026
     * @tc.name testMapGet0026
     * @tc.desc Verify Map.get works with empty string key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMapGet0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, number>();
      map.set('', 0);
      expect(map.get('')).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0027
     * @tc.name testMapGet0027
     * @tc.desc Verify Map.get returns undefined for empty map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testMapGet0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map = new Map<number, number>();
      expect(map.get(1)).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0028
     * @tc.name testMapGet0028
     * @tc.desc Verify Map.get works after clear
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMapGet0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, string>();
      map.set('key', 'value');
      map.clear();
      expect(map.get('key')).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0029
     * @tc.name testMapGet0029
     * @tc.desc Verify Map.get works with large number of entries
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 3
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
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0032
     * @tc.name testMapGet0032
     * @tc.desc Verify Map.get returns correct value for boolean true key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testMapGet0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map = new Map<boolean, string>();
      map.set(true, 'active');
      expect(map.get(true)).assertEqual('active');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0033
     * @tc.name testMapGet0033
     * @tc.desc Verify Map.get returns correct value for boolean false key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testMapGet0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map = new Map<boolean, string>();
      map.set(false, 'inactive');
      expect(map.get(false)).assertEqual('inactive');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0034
     * @tc.name testMapGet0034
     * @tc.desc Verify Map.get works with negative number keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testMapGet0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map = new Map<number, string>();
      map.set(-1, 'negative one');
      map.set(-100, 'negative hundred');
      expect(map.get(-1)).assertEqual('negative one');
      expect(map.get(-100)).assertEqual('negative hundred');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0035
     * @tc.name testMapGet0035
     * @tc.desc Verify Map.get works with float number keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testMapGet0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map = new Map<number, string>();
      map.set(3.14, 'pi');
      map.set(2.718, 'e');
      expect(map.get(3.14)).assertEqual('pi');
      expect(map.get(2.718)).assertEqual('e');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0036
     * @tc.name testMapGet0036
     * @tc.desc Verify Map.get distinguishes between similar float keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMapGet0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<number, string>();
      map.set(1.0, 'one point zero');
      map.set(1.0000001, 'almost one');
      expect(map.get(1.0)).assertEqual('one point zero');
      expect(map.get(1.0000001)).assertEqual('almost one');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0037
     * @tc.name testMapGet0037
     * @tc.desc Verify Map.get works with string keys containing special characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMapGet0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, string>();
      map.set('!@#$%', 'special chars');
      map.set('a=b&c=d', 'query string');
      expect(map.get('!@#$%')).assertEqual('special chars');
      expect(map.get('a=b&c=d')).assertEqual('query string');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0038
     * @tc.name testMapGet0038
     * @tc.desc Verify Map.get works with Unicode string keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMapGet0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, string>();
      map.set('café', 'coffee');
      map.set('北京', 'Beijing');
      expect(map.get('café')).assertEqual('coffee');
      expect(map.get('北京')).assertEqual('Beijing');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0039
     * @tc.name testMapGet0039
     * @tc.desc Verify Map.get works with Map objects as keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testMapGet0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const keyMap = new Map<number, string>([[1, 'one']]);
      const map = new Map<Map<number, string>, number>();
      map.set(keyMap, 1);
      expect(map.get(keyMap)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0040
     * @tc.name testMapGet0040
     * @tc.desc Verify Map.get works with Set objects as keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testMapGet0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const keySet = new Set<string>(['a', 'b']);
      const map = new Map<Set<string>, string>();
      map.set(keySet, 'set value');
      expect(map.get(keySet)).assertEqual('set value');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0041
     * @tc.name testMapGet0041
     * @tc.desc Verify Map.get returns correct value for class instance keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMapGet0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const person = new Person('Alice');
      const map = new Map<Person, number>();
      map.set(person, 30);

      expect(map.get(person)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0042
     * @tc.name testMapGet0042
     * @tc.desc Verify Map.get distinguishes between different class instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMapGet0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<Person, number>();
      map.set(new Person('Alice'), 30);

      expect(map.get(new Person('Alice'))).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0045
     * @tc.name testMapGet0045
     * @tc.desc Verify Map.get works with ArrayBuffer keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testMapGet0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const bufferKey = new ArrayBuffer(8);
      const map = new Map<ArrayBuffer, string>();
      map.set(bufferKey, 'array buffer value');
      expect(map.get(bufferKey)).assertEqual('array buffer value');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0046
     * @tc.name testMapGet0046
     * @tc.desc Verify Map.get works with DataView keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testMapGet0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const buffer = new ArrayBuffer(16);
      const viewKey = new DataView(buffer);
      const map = new Map<DataView, number>();
      map.set(viewKey, 42);
      expect(map.get(viewKey)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0047
     * @tc.name testMapGet0047
     * @tc.desc Verify Map.get works with typed array keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testMapGet0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const typedKey = new Uint8Array([1, 2, 3]);
      const map = new Map<Uint8Array, string>();
      map.set(typedKey, 'typed array value');
      expect(map.get(typedKey)).assertEqual('typed array value');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0051
     * @tc.name testMapGet0051
     * @tc.desc Verify Map.get returns correct value after re-adding key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMapGet0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, number>();
      map.set('key', 1);
      map.delete('key');
      map.set('key', 2);
      expect(map.get('key')).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0052
     * @tc.name testMapGet0052
     * @tc.desc Verify Map.get works with same key added multiple times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMapGet0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<number, string>();
      map.set(1, 'one');
      map.set(1, 'uno');
      map.set(1, 'un');
      expect(map.get(1)).assertEqual('un');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0053
     * @tc.name testMapGet0053
     * @tc.desc Verify Map.get returns correct value for key added in constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
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
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0056
     * @tc.name testMapGet0056
     * @tc.desc Verify Map.get returns correct value for key in nested Map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testMapGet0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const innerMap = new Map<string, number>([['x', 10], ['y', 20]]);
      const outerMap = new Map<string, Map<string, number>>();
      outerMap.set('inner', innerMap);

      expect(outerMap.get('inner')?.get('x')).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0057
     * @tc.name testMapGet0057
     * @tc.desc Verify Map.get works with Error objects as keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testMapGet0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const errorKey = new Error('test error');
      const map = new Map<Error, string>();
      map.set(errorKey, 'error value');
      expect(map.get(errorKey)).assertEqual('error value');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0058
     * @tc.name testMapGet0058
     * @tc.desc Verify Map.get distinguishes between different Error objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testMapGet0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const map = new Map<Error, string>();
      map.set(new Error('test'), 'value');
      expect(map.get(new Error('test'))).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0059
     * @tc.name testMapGet0059
     * @tc.desc Verify Map.get works with Promise objects as keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testMapGet0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const promiseKey = Promise.resolve('test');
      const map = new Map<Promise<string>, number>();
      map.set(promiseKey, 1);
      expect(map.get(promiseKey)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0060
     * @tc.name testMapGet0060
     * @tc.desc Verify Map.get returns correct value for function value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMapGet0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, () => int>();
      const func = () => 42;
      map.set('func', func);
      expect(map.get('func')).assertEqual(func);
      expect(map.get('func')!()).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0061
     * @tc.name testMapGet0061
     * @tc.desc Verify Map.get returns correct value for array value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMapGet0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, int[]>();
      const arr = [1, 2, 3];
      map.set('array', arr);
      expect(map.get('array')).assertEqual(arr);
      expect(map.get('array')![1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0062
     * @tc.name testMapGet0062
     * @tc.desc Verify Map.get returns correct value for object value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMapGet0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, GeneratedTypeLiteralInterface_1>();
      const obj: GeneratedTypeLiteralInterface_1 = { name: 'test' };
      map.set('object', obj);
      expect(map.get('object')).assertEqual(obj);
      expect(map.get('object')!.name).assertEqual('test');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0063
     * @tc.name testMapGet0063
     * @tc.desc Verify Map.get returns correct value for Map value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testMapGet0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const valueMap = new Map<number, string>([[1, 'one']]);
      const map = new Map<string, Map<number, string>>();
      map.set('map', valueMap);
      expect(map.get('map')).assertEqual(valueMap);
      expect(map.get('map')?.get(1)).assertEqual('one');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0064
     * @tc.name testMapGet0064
     * @tc.desc Verify Map.get returns correct value for Set value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testMapGet0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const valueSet = new Set<string>(['a', 'b']);
      const map = new Map<string, Set<string>>();
      map.set('set', valueSet);
      expect(map.get('set')).assertEqual(valueSet);
      expect(map.get('set')?.has('a')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0065
     * @tc.name testMapGet0065
     * @tc.desc Verify Map.get returns correct value after map is copied
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testMapGet0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const originalMap = new Map<string, number>([['a', 1], ['b', 2]]);
      const copiedMap = new Map<string, number>(originalMap);

      expect(copiedMap.get('a')).assertEqual(1);
      expect(copiedMap.get('b')).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0066
     * @tc.name testMapGet0066
     * @tc.desc Verify Map.get works with keys from other realms (theoretical)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
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
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0067
     * @tc.name testMapGet0067
     * @tc.desc Verify Map.get returns undefined for key that was never set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testMapGet0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map = new Map<string, string>();
      map.set('a', 'A');
      expect(map.get('b')).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0068
     * @tc.name testMapGet0068
     * @tc.desc Verify Map.get works with very long string keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMapGet0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const longKey = 'a'.repeat(1000);
      const map = new Map<string, string>();
      map.set(longKey, 'long value');
      expect(map.get(longKey)).assertEqual('long value');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0069
     * @tc.name testMapGet0069
     * @tc.desc Verify Map.get works with key that is a Map iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testMapGet0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const map = new Map<number, string>([[1, 'one']]);
      const iterator = map.keys();
      const keyMap = new Map<IterableIterator<number>, string>();
      keyMap.set(iterator, 'iterator value');

      expect(keyMap.get(iterator)).assertEqual('iterator value');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0071
     * @tc.name testMapGet0071
     * @tc.desc Verify Map.get returns correct value for key added in loop
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMapGet0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<number, number>();

      for (let i = 0; i < 10; i++) {
        map.set(i, i * i);
      }

      expect(map.get(5)).assertEqual(25);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0072
     * @tc.name testMapGet0072
     * @tc.desc Verify Map.get works with key that is a WeakMap
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
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
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0073
     * @tc.name testMapGet0073
     * @tc.desc Verify Map.get works with key that is a WeakSet
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
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
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0074
     * @tc.name testMapGet0074
     * @tc.desc Verify Map.get returns correct value after map is modified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
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
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0075
     * @tc.name testMapGet0075
     * @tc.desc Verify Map.get works with key that is a RegExp with flags
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMapGet0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const regKey = new RegExp("test","gi");
      const map = new Map<RegExp, string>();
      map.set(regKey, 'regex with flags');
      expect(map.get(regKey)).assertEqual('regex with flags');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0076
     * @tc.name testMapGet0076
     * @tc.desc Verify Map.get distinguishes between RegExp with different flags
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMapGet0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<RegExp, string>();
      const regKey = new RegExp("test","g");
      const regKey2 = new RegExp("test","i");
      map.set(regKey, 'global');
      expect(map.get(regKey2)).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0077
     * @tc.name testMapGet0077
     * @tc.desc Verify Map.get works with key that is a Date with same time value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMapGet0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date1 = new Date(2023, 0, 1);
      const date2 = new Date(2023, 0, 1); // Same time value but different object
      const map = new Map<Date, string>();
      map.set(date1, 'date value');

      expect(map.get(date2)).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0078
     * @tc.name testMapGet0078
     * @tc.desc Verify Map.get works with key that is a BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMapGet0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bigKey = 9007199254740991n;
      const map = new Map<bigint, string>();
      map.set(bigKey, 'big integer');
      expect(map.get(bigKey)).assertEqual('big integer');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0079
     * @tc.name testMapGet0079
     * @tc.desc Verify Map.get distinguishes between BigInt and Number with same value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMapGet0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<bigint | number, string>();
      map.set(42n, 'bigint');
      map.set(42, 'number');

      expect(map.get(42n)).assertEqual('bigint');
      expect(map.get(42)).assertEqual('number');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0081
     * @tc.name testMapGet0081
     * @tc.desc Verify Map.get returns correct value for key in large map
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 3
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
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0106
     * @tc.name testMapGet0106
     * @tc.desc Verify Map.get works with key that is a Intl.DateTimeFormat object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testMapGet0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const formatterKey = new Intl.DateTimeFormat('en-US');
      const map = new Map<Intl.DateTimeFormat, string>();
      map.set(formatterKey, 'formatter value');

      expect(map.get(formatterKey)).assertEqual('formatter value');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0107
     * @tc.name testMapGet0107
     * @tc.desc Verify Map.get works with key that is a Intl.NumberFormat object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testMapGet0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const formatterKey = new Intl.NumberFormat('en-US');
      const map = new Map<Intl.NumberFormat, string>();
      map.set(formatterKey, 'number formatter');

      expect(map.get(formatterKey)).assertEqual('number formatter');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_Get_0110
     * @tc.name testMapGet0110
     * @tc.desc Verify Map.get returns correct value after many key additions and deletions
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 3
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