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
class MyClass {
}
export default function MapConstructorTest() {
  describe('MapConstructorTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(()=> {
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
     * @tc.number MAP_CONSTRUCTOR_TEST_001
     * @tc.name MapConstructorTest001
     * @tc.desc Create empty Map using constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapConstructorTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: Map<number, number> = new Map<number, number>();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number MAP_CONSTRUCTOR_TEST_002
     * @tc.name MapConstructorTest002
     * @tc.desc Create Map from array of key-value pairs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapConstructorTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map = new Map<string, int>([['a', 1], ['b', 2]]);
      expect(map.size).assertEqual(2);
    });

    /**
     * @tc.number MAP_CONSTRUCTOR_TEST_003
     * @tc.name MapConstructorTest003
     * @tc.desc Create Map from another Map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapConstructorTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const original = new Map<string, string>([['key', 'value']]);
      const map = new Map<string, string>(original);
      expect(map.get('key')).assertEqual('value');
    });

    /**
     * @tc.number MAP_CONSTRUCTOR_TEST_007
     * @tc.name MapConstructorTest007
     * @tc.desc Create Map with null as parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapConstructorTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map = new Map<string, string>(null);
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number MAP_CONSTRUCTOR_TEST_008
     * @tc.name MapConstructorTest008
     * @tc.desc Create Map with undefined as parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapConstructorTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map = new Map<string, string>(undefined);
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number MAP_CONSTRUCTOR_TEST_011
     * @tc.name MapConstructorTest011
     * @tc.desc Map with boolean keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapConstructorTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map = new Map<boolean, string>([[true, 'yes'], [false, 'no']]);
      expect(map.get(true)).assertEqual('yes');
      expect(map.get(false)).assertEqual('no');
    });

    /**
     * @tc.number MAP_CONSTRUCTOR_TEST_012
     * @tc.name MapConstructorTest012
     * @tc.desc Map with number keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapConstructorTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map = new Map<number, string>([[1, 'one'], [2, 'two']]);
      expect(map.get(1)).assertEqual('one');
      expect(map.get(2)).assertEqual('two');
    });

    /**
     * @tc.number MAP_CONSTRUCTOR_TEST_014
     * @tc.name MapConstructorTest014
     * @tc.desc Map with NaN as key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapConstructorTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map = new Map<number, string>([[NaN, 'not a number']]);
      expect(map.get(NaN)).assertEqual('not a number');
    });

    /**
     * @tc.number MAP_CONSTRUCTOR_TEST_017
     * @tc.name MapConstructorTest017
     * @tc.desc Map with duplicate primitive keys in iterable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapConstructorTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map = new Map<string, int>([['a', 1], ['a', 2], ['a', 3]]);
      expect(map.size).assertEqual(1);
      expect(map.get('a')).assertEqual(3);
    });

    /**
     * @tc.number MAP_CONSTRUCTOR_TEST_019
     * @tc.name MapConstructorTest019
     * @tc.desc Map with nested arrays as keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    // it('MapConstructorTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   const arr1 = [1, 2];
    //   const arr2 = [1, 2];
    //   const map = new Map<Array<int>, string>([[arr1, 'val1'], [arr2, 'val2']]);
    //   expect(map.size).assertEqual(2);
    //   expect(map.get(arr1)).assertEqual('val1');
    //   expect(map.get(arr2)).assertEqual('val2');
    // });

    /**
     * @tc.number MAP_CONSTRUCTOR_TEST_023
     * @tc.name MapConstructorTest023
     * @tc.desc Check Map is instance of Map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapConstructorTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: Map<string, number> = new Map<string, number>();
      expect(map instanceof Map).assertEqual(true);
    });

    /**
     * @tc.number MAP_CONSTRUCTOR_TEST_024
     * @tc.name MapConstructorTest024
     * @tc.desc Check Map is instance of Object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapConstructorTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: Map<string, number> = new Map<string, number>();
      expect(map instanceof Object).assertEqual(true);
    });

    /**
     * @tc.number MAP_CONSTRUCTOR_TEST_026
     * @tc.name MapConstructorTest026
     * @tc.desc Create Map with Date objects as keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapConstructorTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const date1 = new Date(2020, 0, 1);
      const date2 = new Date(2020, 0, 1);
      const map = new Map<Date, string>([[date1, 'first'], [date2, 'second']]);
      expect(map.size).assertEqual(2);
      expect(map.get(date1)).assertEqual('first');
      expect(map.get(date2)).assertEqual('second');
    });

    /**
     * @tc.number MAP_CONSTRUCTOR_TEST_027
     * @tc.name MapConstructorTest027
     * @tc.desc Create Map with RegExp objects as keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapConstructorTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex1 = new RegExp("test");
      const regex2 = new RegExp("test");
      const map = new Map<RegExp, string>([[regex1, 'one'], [regex2, 'two']]);
      expect(map.size).assertEqual(2);
      expect(map.get(regex1)).assertEqual('one');
      expect(map.get(regex2)).assertEqual('two');
    });

    /**
     * @tc.number MAP_CONSTRUCTOR_TEST_033
     * @tc.name MapConstructorTest033
     * @tc.desc Map with key as Function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapConstructorTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const keyFunc = () => {};
      const map = new Map<() => void,string>([[keyFunc, 'value']]);
      expect(map.get(keyFunc)).assertEqual('value');
    });

    /**
     * @tc.number MAP_CONSTRUCTOR_TEST_037
     * @tc.name MapConstructorTest037
     * @tc.desc Map with key as null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapConstructorTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map = new Map<null, string>([[null, 'null value']]);
      expect(map.get(null)).assertEqual('null value');
    });

    /**
     * @tc.number MAP_CONSTRUCTOR_TEST_038
     * @tc.name MapConstructorTest038
     * @tc.desc Map with key as undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapConstructorTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map = new Map<void,string>([[undefined, 'undefined value']]);
      expect(map.get(undefined)).assertEqual('undefined value');
    });

    /**
     * @tc.number MAP_CONSTRUCTOR_TEST_039
     * @tc.name MapConstructorTest039
     * @tc.desc Map with key as Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapConstructorTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map = new Map<number,string>([[Infinity, 'infinity value']]);
      expect(map.get(Infinity)).assertEqual('infinity value');
    });

    /**
     * @tc.number MAP_CONSTRUCTOR_TEST_040
     * @tc.name MapConstructorTest040
     * @tc.desc Map with key as -Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapConstructorTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map = new Map<number,string>([[-Infinity, 'negative infinity value']]);
      expect(map.get(-Infinity)).assertEqual('negative infinity value');
    });

    /**
     * @tc.number MAP_CONSTRUCTOR_TEST_042
     * @tc.name MapConstructorTest042
     * @tc.desc Map with key as bigint
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapConstructorTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const key = 123n;
      const map = new Map<bigint,string>([[key, 'bigint value']]);
      expect(map.get(key)).assertEqual('bigint value');
    });

    /**
     * @tc.number MAP_CONSTRUCTOR_TEST_044
     * @tc.name MapConstructorTest044
     * @tc.desc Map with empty string key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapConstructorTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map = new Map<string,string>([['', 'empty string']]);
      expect(map.get('')).assertEqual('empty string');
    });

    /**
     * @tc.number MAP_CONSTRUCTOR_TEST_045
     * @tc.name MapConstructorTest045
     * @tc.desc Map with whitespace string keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapConstructorTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map = new Map<string,string>([[' ', 'space'], ['\t', 'tab'], ['\n', 'newline']]);
      expect(map.get(' ')).assertEqual('space');
      expect(map.get('\t')).assertEqual('tab');
      expect(map.get('\n')).assertEqual('newline');
    });

    /**
     * @tc.number MAP_CONSTRUCTOR_TEST_046
     * @tc.name MapConstructorTest046
     * @tc.desc Map with special character keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapConstructorTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map = new Map<string, string>([['!', 'exclamation'], ['@', 'at'], ['#', 'hash']]);
      expect(map.get('!')).assertEqual('exclamation');
      expect(map.get('@')).assertEqual('at');
      expect(map.get('#')).assertEqual('hash');
    });

    /**
     * @tc.number MAP_CONSTRUCTOR_TEST_047
     * @tc.name MapConstructorTest047
     * @tc.desc Map with Unicode character keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapConstructorTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map = new Map<string, string>([['€', 'euro'], ['π', 'pi'], ['😊', 'smile']]);
      expect(map.get('€')).assertEqual('euro');
      expect(map.get('π')).assertEqual('pi');
      expect(map.get('😊')).assertEqual('smile');
    });

    /**
     * @tc.number MAP_CONSTRUCTOR_TEST_050
     * @tc.name MapConstructorTest050
     * @tc.desc Map with key as WeakSet
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapConstructorTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const keyWeakSet = new WeakSet<number>();
      const map = new Map<WeakSet<number>, string>([[keyWeakSet, 'value']]);
      expect(map.get(keyWeakSet)).assertEqual('value');
    });

    /**
     * @tc.number MAP_CONSTRUCTOR_TEST_051
     * @tc.name MapConstructorTest051
     * @tc.desc Map with key as ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapConstructorTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const buffer = new ArrayBuffer(8);
      const map = new Map<ArrayBuffer, string>([[buffer, 'buffer value']]);
      expect(map.get(buffer)).assertEqual('buffer value');
    });

    /**
     * @tc.number MAP_CONSTRUCTOR_TEST_052
     * @tc.name MapConstructorTest052
     * @tc.desc Map with key as DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapConstructorTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const view = new DataView(new ArrayBuffer(8));
      const map = new Map<DataView, string>([[view, 'view value']]);
      expect(map.get(view)).assertEqual('view value');
    });

    /**
     * @tc.number MAP_CONSTRUCTOR_TEST_053
     * @tc.name MapConstructorTest053
     * @tc.desc Map with key as TypedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapConstructorTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const typedArray = new Uint8Array([1, 2, 3]);
      const map = new Map<Uint8Array, string>([[typedArray, 'typed array value']]);
      expect(map.get(typedArray)).assertEqual('typed array value');
    });

    /**
     * @tc.number MAP_CONSTRUCTOR_TEST_055
     * @tc.name MapConstructorTest055
     * @tc.desc Map with key as Error object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapConstructorTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const error = new Error('test');
      const map = new Map<Error, string>([[error, 'error value']]);
      expect(map.get(error)).assertEqual('error value');
    });

    /**
     * @tc.number MAP_CONSTRUCTOR_TEST_056
     * @tc.name MapConstructorTest056
     * @tc.desc Map with key as Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapConstructorTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const promise = Promise.resolve();
      const map = new Map<Any, string>([[promise, 'promise value']]);
      expect(map.get(promise)).assertEqual('promise value');
    });

    /**
     * @tc.number MAP_CONSTRUCTOR_TEST_060
     * @tc.name MapConstructorTest060
     * @tc.desc Map with key as regex result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapConstructorTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const result = new RegExp("t(e)st").exec('test');
      if (result) {
        const map = new Map<Any, string>([[result, 'result value']]);
        expect(map.get(result)).assertEqual('result value');
      } else {
        expect(true).assertEqual(false); // Should not reach here
      }
    });

    /**
     * @tc.number MAP_CONSTRUCTOR_TEST_104
     * @tc.name MapConstructorTest104
     * @tc.desc Map with key as a primitive wrapper object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapConstructorTest104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const numObj = new Number(123);
      const map = new Map<Number, string>([[numObj, 'number object']]);
      expect(map.get(numObj)).assertEqual('number object');
    });

    /**
     * @tc.number MAP_CONSTRUCTOR_TEST_105
     * @tc.name MapConstructorTest105
     * @tc.desc Map with key as a string object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapConstructorTest105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const strObj = new String('test');
      const map = new Map<String,string>([[strObj, 'string object']]);
      expect(map.get(strObj)).assertEqual('string object');
    });

    /**
     * @tc.number MAP_CONSTRUCTOR_TEST_106
     * @tc.name MapConstructorTest106
     * @tc.desc Map with key as a boolean object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapConstructorTest106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const boolObj = new Boolean(true);
      const map = new Map<Boolean,string>([[boolObj, 'boolean object']]);
      expect(map.get(boolObj)).assertEqual('boolean object');
    });

  })
}
