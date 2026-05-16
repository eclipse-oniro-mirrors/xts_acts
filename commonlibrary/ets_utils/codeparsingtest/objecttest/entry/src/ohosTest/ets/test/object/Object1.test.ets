/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import {
  bigIntKey98,
  calculate49,
  elem159,
  elemObj47,
  Fn21,
  Fn21_1,
  Fn31,
  Fn32,
  Fn43,
  Fn43_1,
  Fn46,
  Fn47,
  Fn48,
  Fn53,
  Fn54,
  Fn63,
  Fn64,
  fn76,
  fn77,
  futureTimestamp80,
  generator,
  getObj28,
  greet93,
  key1,
  keyA63,
  keyB63,
  keyObj46,
  obj127,
  obj192,
  obj292,
  originalArr20,
  originalArr27,
  originalArr42,
  originalArr5,
  originalArr66,
  originalArr71,
  originalArr72,
  originalArr83,
  originalArr92,
  originalBoolObj24,
  originalBoolObj52,
  originalDate13,
  originalDate44,
  originalDate61,
  originalDate80,
  originalDate94,
  originalFn6,
  originalMap15,
  originalMap39,
  originalMap58,
  originalMap76,
  originalMap98,
  originalNumObj22,
  originalObj19,
  originalObj29,
  originalObj30,
  originalObj31,
  originalObj32,
  originalObj33,
  originalObj4,
  originalObj48,
  originalObj53,
  originalObj54,
  originalObj65,
  originalObj82,
  originalObj85,
  originalRegExp14,
  originalRegExp45,
  originalRegExp62,
  originalRegExp81,
  originalSet16,
  originalSet40,
  originalSet59,
  originalSet77,
  originalStrObj23,
  originalSymbol26,
  originalSymbol51,
  originalSymbol8,
  originalTypedArr17,
  originalTypedArr41,
  originalTypedArr55,
  originalTypedArr56,
  originalTypedArr78,
  originalTypedArr87,
  originalTypedArr96,
  originalWeakMap46,
  originalWeakSet47,
  result1,
  result10,
  result100,
  result11,
  result12,
  result13,
  result14,
  result15,
  result16,
  result17,
  result19,
  result2,
  result20,
  result21,
  result22,
  result23,
  result24,
  result25,
  result26,
  result27,
  result28,
  result29,
  result29_1,
  result3,
  result30,
  result30_1,
  result31,
  result32,
  result33,
  result34,
  result35,
  result36,
  result37,
  result38,
  result39,
  result3_1,
  result4,
  result40,
  result41,
  result42,
  result43,
  result44,
  result45,
  result46,
  result47,
  result48,
  result49,
  result5,
  result50,
  result51,
  result52,
  result53,
  result54,
  result55,
  result56,
  result57,
  result58,
  result59,
  result6,
  result61,
  result62,
  result63,
  result65,
  result65_1,
  result66,
  result67,
  result68,
  result69,
  result69_1,
  result69_2,
  result7,
  result71,
  result71_1,
  result72,
  result72_1,
  result73,
  result74,
  result75,
  result76,
  result77,
  result78,
  result79,
  result8,
  result80,
  result81,
  result82,
  result83,
  result84,
  result85,
  result85_1,
  result87,
  result88,
  result88_1,
  result8_1,
  result9,
  result92,
  result93,
  result94,
  result95,
  result96,
  result98,
  sum67,
  symKey33,
  symKey85,
  timestamp61,
  weakMapResult99,
  wrappedBigInt25,
  wrappedSymbol26
} from './Object1';

function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}


export default function Object1Test() {
  describe('Object1Test', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(30);
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
     * @tc.name   Object1Test001
     * @tc.number SUB_BUILTINS_OBJECT1_TEST_0100
     * @tc.desc   Call Object() with no parameters, verify returning empty object and its prototype
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object1Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(typeof result1).assertEqual('object');
      expect(JSON.stringify(result1)).assertEqual('{}');
    });

    /**
     * @tc.name   Object1Test002
     * @tc.number SUB_BUILTINS_OBJECT1_TEST_0200
     * @tc.desc   Call Object() with null as parameter, verify returning empty object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object1Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(typeof result2).assertEqual('object');
      expect(JSON.stringify(result2)).assertEqual('{}');
    });

    /**
     * @tc.name   Object1Test003
     * @tc.number SUB_BUILTINS_OBJECT1_TEST_0300
     * @tc.desc   Call Object() with undefined as parameter, verify returning empty object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object1Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(typeof result3).assertEqual('object');
      expect(JSON.stringify(result3)).assertEqual('{}');
    });

    /**
     * @tc.name   Object1Test004
     * @tc.number SUB_BUILTINS_OBJECT1_TEST_0400
     * @tc.desc   Call Object() with a plain object as parameter, verify returning original object and its properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object1Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(result4).assertEqual(originalObj4);
      expect(result4.name).assertEqual('test');
      expect(result4.age).assertEqual(20);
    });

    /**
     * @tc.name   Object1Test005
     * @tc.number SUB_BUILTINS_OBJECT1_TEST_0500
     * @tc.desc   Call Object() with an array as parameter, verify returning original array and its characteristics
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object1Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(result5).assertEqual(originalArr5);
      expect(result5.length).assertEqual(3);
      expect(result5[1]).assertEqual(20);
      expect(Array.isArray(result5)).assertEqual(true);
    });

    /**
     * @tc.name   Object1Test006
     * @tc.number SUB_BUILTINS_OBJECT1_TEST_0600
     * @tc.desc   Call Object() with a function as parameter, verify returning original function and its callability
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object1Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(result6).assertEqual(originalFn6);
      expect(result6(2, 3)).assertEqual(5);
      expect(typeof result6).assertEqual('function');
    });

    /**
     * @tc.name   Object1Test007
     * @tc.number SUB_BUILTINS_OBJECT1_TEST_0700
     * @tc.desc   Call Object() with a BigInt as parameter, verify wrapped object and its characteristics
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object1Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(typeof result7).assertEqual('object');
      expect(result7.valueOf()).assertEqual(456n);
    });

    /**
     * @tc.name   Object1Test008
     * @tc.number SUB_BUILTINS_OBJECT1_TEST_0800
     * @tc.desc   Call Object() with a Symbol as parameter, verify wrapped object and its characteristics
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object1Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(typeof result8).assertEqual('object');
      expect(result8_1 === originalSymbol8).assertEqual(true);
    });

    /**
     * @tc.name   Object1Test009
     * @tc.number SUB_BUILTINS_OBJECT1_TEST_0900
     * @tc.desc   Call Object() with a Number primitive as parameter, verify wrapped object and its prototype methods
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object1Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(typeof result9).assertEqual('object');
      expect(result9.valueOf()).assertEqual(789);
      expect(result9.toFixed(2)).assertEqual('789.00');
    });

    /**
     * @tc.name   Object1Test010
     * @tc.number SUB_BUILTINS_OBJECT1_TEST_1000
     * @tc.desc   Call Object() with a String primitive as parameter, verify wrapped object and its prototype methods
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object1Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(typeof result10).assertEqual('object');
      expect(result10.valueOf()).assertEqual('javascript');
      expect(result10.slice(0, 4)).assertEqual('java');
    });

    /**
     * @tc.name   Object1Test011
     * @tc.number SUB_BUILTINS_OBJECT1_TEST_1100
     * @tc.desc   Call Object() with a Boolean primitive (true), verify wrapped object and value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object1Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(typeof result11).assertEqual('object');
      expect(result11.valueOf()).assertEqual(true);
      expect(result11.toString()).assertEqual('true');
    });

    /**
     * @tc.name   Object1Test012
     * @tc.number SUB_BUILTINS_OBJECT1_TEST_1200
     * @tc.desc   Call Object() with a Boolean primitive (false), verify wrapped object and value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object1Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(typeof result12).assertEqual('object');
      expect(result12.valueOf()).assertEqual(false);
      expect(result12.toString()).assertEqual('false');
    });

    /**
     * @tc.name   Object1Test013
     * @tc.number SUB_BUILTINS_OBJECT1_TEST_1300
     * @tc.desc   Call Object() with a Date object, verify returning original Date and its value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object1Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(result13).assertEqual(originalDate13);
      expect(result13.getTime()).assertEqual(originalDate13.getTime());
      expect(result13.toISOString()).assertEqual('2024-01-01T00:00:00.000Z');
    });

    /**
     * @tc.name   Object1Test014
     * @tc.number SUB_BUILTINS_OBJECT1_TEST_1400
     * @tc.desc   Call Object() with a RegExp object, verify returning original RegExp and its properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object1Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(result14).assertEqual(originalRegExp14);
      expect(result14.source).assertEqual('test');
      expect(result14.flags).assertEqual('g');
    });

    /**
     * @tc.name   Object1Test015
     * @tc.number SUB_BUILTINS_OBJECT1_TEST_1500
     * @tc.desc   Call Object() with a Map object, verify returning original Map and its size
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object1Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(result15).assertEqual(originalMap15);
      expect(result15.size).assertEqual(1);
      expect(result15.get('key1')).assertEqual('val1');
    });

    /**
     * @tc.name   Object1Test016
     * @tc.number SUB_BUILTINS_OBJECT1_TEST_1600
     * @tc.desc   Call Object() with a Set object, verify returning original Set and its size
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object1Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(result16).assertEqual(originalSet16);
      expect(result16.size).assertEqual(1);
      expect(result16.has('val1')).assertEqual(true);
    });

    /**
     * @tc.name   Object1Test017
     * @tc.number SUB_BUILTINS_OBJECT1_TEST_1700
     * @tc.desc   Call Object() with a Uint8Array, verify returning original array and its length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object1Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(result17).assertEqual(originalTypedArr17);
      expect(result17.length).assertEqual(2);
      expect(result17[0]).assertEqual(1);
    });

    /**
     * @tc.name   Object1Test019
     * @tc.number SUB_BUILTINS_OBJECT1_TEST_1900
     * @tc.desc   Call Object() with a nested object, verify returning original object and nested properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object1Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(result19).assertEqual(originalObj19);
      expect(result19.a.b).assertEqual(10);
      expect(result19.a).assertEqual(originalObj19.a);
    });

    /**
     * @tc.name   Object1Test020
     * @tc.number SUB_BUILTINS_OBJECT1_TEST_2000
     * @tc.desc   Call Object() with an empty array, verify returning original array and length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object1Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(result20).assertEqual(originalArr20);
      expect(result20.length).assertEqual(0);
      expect(Array.isArray(result20)).assertEqual(true);
    });

    /**
     * @tc.name   Object1Test021
     * @tc.number SUB_BUILTINS_OBJECT1_TEST_2100
     * @tc.desc   Call Object() with a function with prototype properties, verify returning original function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object1Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      Fn21_1();
      expect(result21).assertEqual(Fn21);
      expect(result21.prototype.method()).assertEqual('test');
      expect(typeof result21).assertEqual('function');
    });

    /**
     * @tc.name   Object1Test022
     * @tc.number SUB_BUILTINS_OBJECT1_TEST_2200
     * @tc.desc   Call Object() with a Number object (new Number()), verify returning original object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object1Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(result22).assertEqual(originalNumObj22);
      expect(result22.valueOf()).assertEqual(123);
      expect(typeof result22).assertEqual('object');
    });

    /**
     * @tc.name   Object1Test023
     * @tc.number SUB_BUILTINS_OBJECT1_TEST_2300
     * @tc.desc   Call Object() with a String object (new String()), verify returning original object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object1Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(result23).assertEqual(originalStrObj23);
      expect(result23.valueOf()).assertEqual('test');
      expect(result23.length).assertEqual(4);
    });

    /**
     * @tc.name   Object1Test024
     * @tc.number SUB_BUILTINS_OBJECT1_TEST_2400
     * @tc.desc   Call Object() with a Boolean object (new Boolean()), verify returning original object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object1Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(result24).assertEqual(originalBoolObj24);
      expect(result24.valueOf()).assertEqual(true);
      expect(typeof result24).assertEqual('object');
    });

    /**
     * @tc.name   Object1Test025
     * @tc.number SUB_BUILTINS_OBJECT1_TEST_2500
     * @tc.desc   Call Object() with a BigInt object (wrapped), verify valueOf() matches original BigInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object1Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(result25).assertEqual(wrappedBigInt25);
      expect(result25.valueOf()).assertEqual(987n);
      expect(typeof result25).assertEqual('object');
    });

    /**
     * @tc.name   Object1Test026
     * @tc.number SUB_BUILTINS_OBJECT1_TEST_2600
     * @tc.desc   Call Object() with a Symbol object (wrapped), verify valueOf() matches original Symbol
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object1Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(typeof result26).assertEqual('object');
      expect(result26 === wrappedSymbol26).assertEqual(true);
      expect(result26.valueOf() === originalSymbol26).assertEqual(true);
    });

    /**
     * @tc.name   Object1Test027
     * @tc.number SUB_BUILTINS_OBJECT1_TEST_2700
     * @tc.desc   Call Object() with an array of objects, verify returning original array and elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object1Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(result27).assertEqual(originalArr27);
      expect(result27[0]).assertEqual(obj127);
      expect(result27[1].y).assertEqual(2);
    });

    /**
     * @tc.name   Object1Test028
     * @tc.number SUB_BUILTINS_OBJECT1_TEST_2800
     * @tc.desc   Call Object() with a function that returns an object, verify function callability
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object1Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(result28).assertEqual(getObj28);
      expect(result28().prop).assertEqual('val');
      expect(typeof result28).assertEqual('function');
    });

    /**
     * @tc.name   Object1Test029
     * @tc.number SUB_BUILTINS_OBJECT1_TEST_2900
     * @tc.desc   Call Object() with a frozen object, verify returning original frozen object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object1Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(result29).assertEqual(originalObj29);
      expect(result29_1).assertEqual(true);
      expect(result29.a).assertEqual(1);
    });

    /**
     * @tc.name   Object1Test030
     * @tc.number SUB_BUILTINS_OBJECT1_TEST_3000
     * @tc.desc   Call Object() with a sealed object, verify returning original sealed object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object1Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(result30).assertEqual(originalObj30);
      expect(result30_1).assertEqual(true);
      expect(result30.b).assertEqual(2);
    });

    /**
     * @tc.name   Object1Test031
     * @tc.number SUB_BUILTINS_OBJECT1_TEST_3100
     * @tc.desc   Call Object() with a non-enumerable property object, verify property existence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object1Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      Fn31();
      expect(result31).assertEqual(originalObj31);
      expect(result31.nonEnum).assertEqual(3);
      expect(Object.keys(result31).includes('nonEnum')).assertEqual(false);
    });

    /**
     * @tc.name   Object1Test032
     * @tc.number SUB_BUILTINS_OBJECT1_TEST_3200
     * @tc.desc   Call Object() with a read-only property object, verify property immutability
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object1Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      Fn32()
      expect(result32).assertEqual(originalObj32);
    });

    /**
     * @tc.name   Object1Test033
     * @tc.number SUB_BUILTINS_OBJECT1_TEST_3300
     * @tc.desc   Call Object() with a Symbol-keyed property object, verify property access
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object1Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(result33).assertEqual(originalObj33);
      expect(result33[symKey33]).assertEqual('symVal');
      expect(result3_1).assertEqual(true);
    });

    /**
     * @tc.name   Object1Test034
     * @tc.number SUB_BUILTINS_OBJECT1_TEST_3400
     * @tc.desc   Call Object() with a large Number primitive, verify wrapped object value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object1Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(typeof result34).assertEqual('object');
      expect(result34.valueOf()).assertEqual(999999999999999);
      expect(result34.toString()).assertEqual('999999999999999');
    });
    /**
     * @tc.name   Object1Test035
     * @tc.number SUB_BUILTINS_OBJECT1_TEST_3500
     * @tc.desc   Call Object() with a negative Number primitive, verify wrapped object value and methods
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object1Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(typeof result35).assertEqual('object');
      expect(result35.valueOf()).assertEqual(-456);
      expect(result35.toString()).assertEqual('-456');
    });

    /**
     * @tc.name   Object1Test036
     * @tc.number SUB_BUILTINS_OBJECT1_TEST_3600
     * @tc.desc   Call Object() with a floating-point Number primitive, verify wrapped object value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object1Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(typeof result36).assertEqual('object');
      expect(result36.valueOf()).assertEqual(3.1415);
      expect(result36.toFixed(2)).assertEqual('3.14');
    });

    /**
     * @tc.name   Object1Test037
     * @tc.number SUB_BUILTINS_OBJECT1_TEST_3700
     * @tc.desc   Call Object() with an empty string primitive, verify wrapped object and length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object1Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(typeof result37).assertEqual('object');
      expect(result37.valueOf()).assertEqual('');
      expect(result37.length).assertEqual(0);
      expect(result37.trim()).assertEqual('');
    });

    /**
     * @tc.name   Object1Test038
     * @tc.number SUB_BUILTINS_OBJECT1_TEST_3800
     * @tc.desc   Call Object() with a string with special characters, verify wrapped object value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object1Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(typeof result38).assertEqual('object');
      expect(result38.valueOf()).assertEqual('!@#$%^&*()');
      expect(result38.includes('@')).assertEqual(true);
      expect(result38.length).assertEqual(10);
    });

    /**
     * @tc.name   Object1Test039
     * @tc.number SUB_BUILTINS_OBJECT1_TEST_3900
     * @tc.desc   Call Object() with a Map with multiple entries, verify original Map properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object1Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(result39).assertEqual(originalMap39);
      expect(result39.size).assertEqual(3);
      expect(result39.get('k2')).assertEqual('v2');
      expect(result39.has('k3')).assertEqual(true);
    });

    /**
     * @tc.name   Object1Test040
     * @tc.number SUB_BUILTINS_OBJECT1_TEST_4000
     * @tc.desc   Call Object() with a Set with duplicate values (auto-removed), verify Set size
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object1Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(result40).assertEqual(originalSet40);
      expect(result40.size).assertEqual(3);
      expect(result40.has('v1')).assertEqual(true);
      expect(result40.has('v4')).assertEqual(false);
    });

    /**
     * @tc.name   Object1Test041
     * @tc.number SUB_BUILTINS_OBJECT1_TEST_4100
     * @tc.desc   Call Object() with a Uint32Array, verify original typed array values and length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object1Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(result41).assertEqual(originalTypedArr41);
      expect(result41.length).assertEqual(3);
      expect(result41[1]).assertEqual(200);
      expect(result41.BYTES_PER_ELEMENT).assertEqual(4);
    });

    /**
     * @tc.name   Object1Test042
     * @tc.number SUB_BUILTINS_OBJECT1_TEST_4200
     * @tc.desc   Call Object() with a nested array, verify original array and nested elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object1Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(result42).assertEqual(originalArr42);
      expect(result42[1][0]).assertEqual(2);
      expect(result42[2][1][0]).assertEqual(5);
      expect(result42.length).assertEqual(3);
    });

    /**
     * @tc.name   Object1Test043
     * @tc.number SUB_BUILTINS_OBJECT1_TEST_4300
     * @tc.desc   Call Object() with a function with static properties, verify static property access
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object1Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      Fn43_1();
      expect(result43).assertEqual(Fn43);
      expect(result43.staticProp).assertEqual('staticVal');
      expect(typeof result43).assertEqual('function');
    });

    /**
     * @tc.name   Object1Test044
     * @tc.number SUB_BUILTINS_OBJECT1_TEST_4400
     * @tc.desc   Call Object() with a Date object of current time, verify time consistency
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object1Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(result44).assertEqual(originalDate44);
      expect(result44.getTime()).assertEqual(originalDate44.getTime());
      expect(result44.toDateString()).assertEqual(originalDate44.toDateString());
    });

    /**
     * @tc.name   Object1Test045
     * @tc.number SUB_BUILTINS_OBJECT1_TEST_4500
     * @tc.desc   Call Object() with a RegExp with multiple flags, verify flag consistency
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object1Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(result45).assertEqual(originalRegExp45);
      expect(result45.source).assertEqual('abc');
      expect(result45.flags).assertEqual('gi');
      expect(result45.test('ABC')).assertEqual(true);
    });

    /**
     * @tc.name   Object1Test046
     * @tc.number SUB_BUILTINS_OBJECT1_TEST_4600
     * @tc.desc   Call Object() with a weak Map (WeakMap), verify returning original WeakMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object1Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      Fn46();
      expect(result46).assertEqual(originalWeakMap46);
      expect(result46.get(keyObj46)).assertEqual('weakVal');
      expect(result46 instanceof WeakMap).assertEqual(true);
    });

    /**
     * @tc.name   Object1Test047
     * @tc.number SUB_BUILTINS_OBJECT1_TEST_4700
     * @tc.desc   Call Object() with a WeakSet, verify returning original WeakSet
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object1Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      Fn47();
      expect(result47).assertEqual(originalWeakSet47);
      expect(result47.has(elemObj47)).assertEqual(true);
      expect(result47 instanceof WeakSet).assertEqual(true);
    });

    /**
     * @tc.name   Object1Test048
     * @tc.number SUB_BUILTINS_OBJECT1_TEST_4800
     * @tc.desc   Call Object() with an object with inherited properties, verify inherited property access
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object1Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      Fn48();
      expect(result48).assertEqual(originalObj48);
      expect(result48.childProp).assertEqual('childVal');
      expect(result48.parentProp).assertEqual('parentVal');
    });

    /**
     * @tc.name   Object1Test049
     * @tc.number SUB_BUILTINS_OBJECT1_TEST_4900
     * @tc.desc   Call Object() with a function that takes parameters, verify function execution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object1Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(result49).assertEqual(calculate49);
      expect(result49(2, 3, 4)).assertEqual(14);
      expect(typeof result49).assertEqual('function');
    });

    /**
     * @tc.name   Object1Test050
     * @tc.number SUB_BUILTINS_OBJECT1_TEST_5000
     * @tc.desc   Call Object() with a BigInt of large value, verify wrapped object value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object1Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(typeof result50).assertEqual('object');
      expect(result50.valueOf()).assertEqual(98765432109876543210n);
      expect(result50.toString()).assertEqual('98765432109876543210');
    });

    /**
     * @tc.name   Object1Test051
     * @tc.number SUB_BUILTINS_OBJECT1_TEST_5100
     * @tc.desc   Call Object() with a Symbol with empty description, verify wrapped object value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object1Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(typeof result51).assertEqual('object');
      expect(result51.valueOf() === originalSymbol51).assertEqual(true);
      expect(result51.toString() === 'Symbol()').assertEqual(true);
    });

    /**
     * @tc.name   Object1Test052
     * @tc.number SUB_BUILTINS_OBJECT1_TEST_5200
     * @tc.desc   Call Object() with a Boolean object (new Boolean(false)), verify value and type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object1Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(result52).assertEqual(originalBoolObj52);
      expect(result52.valueOf()).assertEqual(false);
      expect(typeof result52).assertEqual('object');
      expect(result52.toString()).assertEqual('false');
    });

    /**
     * @tc.name   Object1Test053
     * @tc.number SUB_BUILTINS_OBJECT1_TEST_5300
     * @tc.desc   Call Object() with an object with a getter property, verify getter functionality
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object1Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(result53).assertEqual(originalObj53);
      expect(result53.doubleNum).assertEqual(20);
      Fn53();
      expect(result53.doubleNum).assertEqual(40);
    });

    /**
     * @tc.name   Object1Test054
     * @tc.number SUB_BUILTINS_OBJECT1_TEST_5400
     * @tc.desc   Call Object() with an object with a setter property, verify setter functionality
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object1Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(result54).assertEqual(originalObj54);
      Fn54();
      expect(originalObj54._name).assertEqual('Test User');
      expect(result54._name).assertEqual('Test User');
    });
    /**
     * @tc.name   Object1Test055
     * @tc.number SUB_BUILTINS_OBJECT1_TEST_5500
     * @tc.desc   Call Object() with a Float32Array, verify original typed array values and BYTES_PER_ELEMENT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object1Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(result55).assertEqual(originalTypedArr55);
      expect(result55.length).assertEqual(3);
      expect(Math.abs(result55[1] - 2.2) < 0.0001).assertEqual(true);
      expect(result55.BYTES_PER_ELEMENT).assertEqual(4);
    });

    /**
     * @tc.name   Object1Test056
     * @tc.number SUB_BUILTINS_OBJECT1_TEST_5600
     * @tc.desc   Call Object() with a Float64Array, verify original typed array value accuracy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object1Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(result56).assertEqual(originalTypedArr56);
      expect(result56[2]).assertEqual(0.3);
      expect(result56.length).assertEqual(3);
    });

    /**
     * @tc.name   Object1Test057
     * @tc.number SUB_BUILTINS_OBJECT1_TEST_5700
     * @tc.desc   Call Object() with a string containing Unicode characters, verify wrapped object value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object1Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(typeof result57).assertEqual('object');
      expect(result57.valueOf()).assertEqual('🌍 Unicode 测试');
      expect(result57.length).assertEqual(13);
      expect(result57.includes('🌍')).assertEqual(true);
    });

    /**
     * @tc.name   Object1Test058
     * @tc.number SUB_BUILTINS_OBJECT1_TEST_5800
     * @tc.desc   Call Object() with a Map that has object keys, verify key-value access
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object1Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(result58).assertEqual(originalMap58);
      expect(result58.get(key1)).assertEqual('val1');
      expect(result58.has({ id: 1 })).assertEqual(false);
    });

    /**
     * @tc.name   Object1Test059
     * @tc.number SUB_BUILTINS_OBJECT1_TEST_5900
     * @tc.desc   Call Object() with a Set that contains object elements, verify element existence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object1Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(result59).assertEqual(originalSet59);
      expect(result59.has(elem159)).assertEqual(true);
      expect(result59.has({ id: 2 })).assertEqual(false);
    });

    /**
     * @tc.name   Object1Test061
     * @tc.number SUB_BUILTINS_OBJECT1_TEST_6100
     * @tc.desc   Call Object() with a Date object set to a past timestamp, verify date string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object1Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(result61).assertEqual(originalDate61);
      expect(result61.getTime()).assertEqual(timestamp61);
      expect(result61.toISOString().startsWith('2021-05-03')).assertEqual(true);
    });

    /**
     * @tc.name   Object1Test062
     * @tc.number SUB_BUILTINS_OBJECT1_TEST_6200
     * @tc.desc   Call Object() with a RegExp that matches numbers, verify test() functionality
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object1Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(result62).assertEqual(originalRegExp62);
      expect(result62.test('abc123def')).assertEqual(true);
      expect(result62.test('abcdef')).assertEqual(false);
    });

    /**
     * @tc.name   Object1Test063
     * @tc.number SUB_BUILTINS_OBJECT1_TEST_6300
     * @tc.desc   Call Object() with a WeakMap that has multiple object keys, verify value access
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object1Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      Fn63();
      expect(result63.get(keyA63)).assertEqual('valA');
      expect(result63.get(keyB63)).assertEqual('valB');
    });

    /**
     * @tc.name   Object1Test064
     * @tc.number SUB_BUILTINS_OBJECT1_TEST_6400
     * @tc.desc   Call Object() with a WeakSet that has multiple object elements, verify existence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object1Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list: Array<string> = Fn64();
      expect(JSON.stringify(list)).assertEqual("[true,true,{}]");
    });

    /**
     * @tc.name   Object1Test065
     * @tc.number SUB_BUILTINS_OBJECT1_TEST_6500
     * @tc.desc   Call Object() with an object with a computed property name, verify property access
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object1Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(result65).assertEqual(originalObj65);
      expect(result65.computedProp).assertEqual('computedVal');
      expect(result65_1).assertEqual('computedVal');
    });

    /**
     * @tc.name   Object1Test066
     * @tc.number SUB_BUILTINS_OBJECT1_TEST_6600
     * @tc.desc   Call Object() with an array of primitives (mixed types), verify element values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object1Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(result66).assertEqual(originalArr66);
      expect(result66[0]).assertEqual(123);
      expect(result66[2]).assertEqual(true);
      expect(result66[5]).assertEqual(456n);
    });

    /**
     * @tc.name   Object1Test067
     * @tc.number SUB_BUILTINS_OBJECT1_TEST_6700
     * @tc.desc   Call Object() with a function that uses rest parameters, verify parameter handling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object1Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(result67).assertEqual(sum67);
      expect(result67(1, 2, 3, 4)).assertEqual(10);
      expect(result67(5)).assertEqual(5);
    });

    /**
     * @tc.name   Object1Test068
     * @tc.number SUB_BUILTINS_OBJECT1_TEST_6800
     * @tc.desc   Call Object() with a BigInt that is the result of an operation, verify wrapped value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object1Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(typeof result68).assertEqual('object');
      expect(result68.valueOf()).assertEqual(56088n);
      expect(result68.toString()).assertEqual('56088');
    });

    /**
     * @tc.name   Object1Test069
     * @tc.number SUB_BUILTINS_OBJECT1_TEST_6900
     * @tc.desc   Call Object() with a Symbol that is the result of Symbol.for(), verify consistency
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object1Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(typeof result69).assertEqual('object');
      expect(result69.valueOf() === result69_1).assertEqual(true);
      expect(result69_2 === 'sharedSym').assertEqual(true);
    });

    /**
     * @tc.name   Object1Test071
     * @tc.number SUB_BUILTINS_OBJECT1_TEST_7100
     * @tc.desc   Call Object() with a frozen array, verify original array and frozen state
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object1Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(result71).assertEqual(originalArr71);
      expect(result71_1).assertEqual(true);
      expect(result71[1]).assertEqual(2);
    });

    /**
     * @tc.name   Object1Test072
     * @tc.number SUB_BUILTINS_OBJECT1_TEST_7200
     * @tc.desc   Call Object() with a sealed array, verify original array and sealed state
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object1Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(result72).assertEqual(originalArr72);
      expect(result72_1).assertEqual(true);
      result72[0] = 7;
      expect(result72[0]).assertEqual(7);
    });

    /**
     * @tc.name   Object1Test073
     * @tc.number SUB_BUILTINS_OBJECT1_TEST_7300
     * @tc.desc   Call Object() with a string with leading/trailing spaces, verify trim() functionality
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object1Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(typeof result73).assertEqual('object');
      expect(result73.valueOf()).assertEqual('  leading and trailing spaces  ');
      expect(result73.trim()).assertEqual('leading and trailing spaces');
    });

    /**
     * @tc.name   Object1Test074
     * @tc.number SUB_BUILTINS_OBJECT1_TEST_7400
     * @tc.desc   Call Object() with a Number primitive (Infinity), verify wrapped object value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object1Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(typeof result74).assertEqual('object');
      expect(result74.valueOf()).assertEqual(Infinity);
      expect(result74.toString()).assertEqual('Infinity');
    });

    /**
     * @tc.name   Object1Test075
     * @tc.number SUB_BUILTINS_OBJECT1_TEST_7500
     * @tc.desc   Call Object() with a Number primitive (NaN), verify wrapped object value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object1Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(typeof result75).assertEqual('object');
      expect(isNaN(result75.valueOf())).assertEqual(true);
      expect(result75.toString()).assertEqual('NaN');
    });

    /**
     * @tc.name   Object1Test076
     * @tc.number SUB_BUILTINS_OBJECT1_TEST_7600
     * @tc.desc   Call Object() with a cleared Map, verify original Map's size and empty state
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object1Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(result76).assertEqual(originalMap76);
      fn76();
      expect(result76.size).assertEqual(0);
      expect(result76.has('k1')).assertEqual(false);
    });

    /**
     * @tc.name   Object1Test077
     * @tc.number SUB_BUILTINS_OBJECT1_TEST_7700
     * @tc.desc   Call Object() with a cleared Set, verify original Set's size and empty state
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object1Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      fn77();
      expect(result77).assertEqual(originalSet77);
      expect(result77.size).assertEqual(0);
      expect(result77.has('v2')).assertEqual(false);
    });

    /**
     * @tc.name   Object1Test078
     * @tc.number SUB_BUILTINS_OBJECT1_TEST_7800
     * @tc.desc   Call Object() with a Uint16Array, verify original typed array values and byte size
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object1Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(result78).assertEqual(originalTypedArr78);
      expect(result78[1]).assertEqual(512);
      expect(result78.length).assertEqual(3);
      expect(result78.BYTES_PER_ELEMENT).assertEqual(2);
    });

    /**
     * @tc.name   Object1Test079
     * @tc.number SUB_BUILTINS_OBJECT1_TEST_7900
     * @tc.desc   Call Object() with a function that returns a generator, verify generator functionality
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object1Test079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(generator.next().value).assertEqual(1);
      expect(generator.next().value).assertEqual(2);
      expect(typeof result79).assertEqual('function');
    });

    /**
     * @tc.name   Object1Test080
     * @tc.number SUB_BUILTINS_OBJECT1_TEST_8000
     * @tc.desc   Call Object() with a Date object set to a future timestamp, verify date consistency
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object1Test080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(result80).assertEqual(originalDate80);
      expect(result80.getTime()).assertEqual(futureTimestamp80);
      expect(result80.getFullYear()).assertEqual(2024);
    });

    /**
     * @tc.name   Object1Test081
     * @tc.number SUB_BUILTINS_OBJECT1_TEST_8100
     * @tc.desc   Call Object() with a RegExp that matches special characters, verify test() result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object1Test081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(result81).assertEqual(originalRegExp81);
      expect(result81.test('test.regex?')).assertEqual(true);
      expect(result81.test('testregex')).assertEqual(false);
      expect(result81.source).assertEqual('[\\.\\*\\?\\+\\(\\)]');
    });

    /**
     * @tc.name   Object1Test082
     * @tc.number SUB_BUILTINS_OBJECT1_TEST_8200
     * @tc.desc   Call Object() with an object with a method, verify method callability
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object1Test082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(result82).assertEqual(originalObj82);
      expect(result82.greet()).assertEqual('Hello, Test');
      result82.name = 'Updated';
      expect(result82.greet()).assertEqual('Hello, Updated');
    });

    /**
     * @tc.name   Object1Test083
     * @tc.number SUB_BUILTINS_OBJECT1_TEST_8300
     * @tc.desc   Call Object() with an array with holes (sparse array), verify hole preservation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object1Test083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(result83).assertEqual(originalArr83);
      expect(result83.length).assertEqual(3);
      expect(result83[0]).assertEqual(1);
      expect(result83[2]).assertEqual(3);
    });

    /**
     * @tc.name   Object1Test084
     * @tc.number SUB_BUILTINS_OBJECT1_TEST_8400
     * @tc.desc   Call Object() with a BigInt that is negative, verify wrapped object value and sign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object1Test084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(typeof result84).assertEqual('object');
      expect(result84.valueOf()).assertEqual(-789n);
      expect(result84.toString()).assertEqual('-789');
      expect(result84.valueOf() < 0n).assertEqual(true);
    });

    /**
     * @tc.name   Object1Test085
     * @tc.number SUB_BUILTINS_OBJECT1_TEST_8500
     * @tc.desc   Call Object() with a Symbol used as an object key, verify key access
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object1Test085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(result85).assertEqual(originalObj85);
      expect(result85[symKey85]).assertEqual('symVal85');
      const symbols85 = result85_1;
      expect(symbols85.length).assertEqual(1);
      expect(symbols85[0] === symKey85).assertEqual(true);
    });

    /**
     * @tc.name   Object1Test087
     * @tc.number SUB_BUILTINS_OBJECT1_TEST_8700
     * @tc.desc   Call Object() with a Float32Array with negative values, verify value accuracy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object1Test087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(result87).assertEqual(originalTypedArr87);
      expect(Math.abs(result87[0] - (-1.5)) < 0.0001).assertEqual(true);
      expect(Math.abs(result87[1] - (-2.75)) < 0.0001).assertEqual(true);
      expect(result87.length).assertEqual(3);
    });

    /**
     * @tc.name   Object1Test088
     * @tc.number SUB_BUILTINS_OBJECT1_TEST_8800
     * @tc.desc   Call Object() with a string that is a number, verify wrapped object methods
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object1Test088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(typeof result88).assertEqual('object');
      expect(result88_1).assertEqual('12345');
      expect(result88.padStart(8, '0')).assertEqual('00012345');
    });


    /**
     * @tc.name   Object1Test092
     * @tc.number SUB_BUILTINS_OBJECT1_TEST_9200
     * @tc.desc   Call Object() with an array of objects (mutable), verify mutation reflects in result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object1Test092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(result92).assertEqual(originalArr92);
      obj192.val = 100;
      expect(result92[0].val).assertEqual(100);
      result92[1].val = 200;
      expect(obj292.val).assertEqual(200);
    });

    /**
     * @tc.name   Object1Test093
     * @tc.number SUB_BUILTINS_OBJECT1_TEST_9300
     * @tc.desc   Call Object() with a function that has a default parameter, verify default value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object1Test093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(result93).assertEqual(greet93);
      expect(result93('Alice')).assertEqual('Hello, Alice');
      expect(result93()).assertEqual('Hello, Guest');
    });

    /**
     * @tc.name   Object1Test094
     * @tc.number SUB_BUILTINS_OBJECT1_TEST_9400
     * @tc.desc   Call Object() with a Date object that is invalid, verify invalid state
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object1Test094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(result94).assertEqual(originalDate94);
      expect(isNaN(result94.getTime())).assertEqual(true);
      expect(result94.toString()).assertEqual('Invalid Date');
    });

    /**
     * @tc.name   Object1Test095
     * @tc.number SUB_BUILTINS_OBJECT1_TEST_9500
     * @tc.desc   Call Object() with a Symbol that is Symbol.iterator, verify wrapped object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object1Test095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(typeof result95).assertEqual('object');
      expect(result95.valueOf() === Symbol.iterator).assertEqual(true);
      expect(result95.toString()).assertEqual('Symbol(Symbol.iterator)');
      expect(result95.valueOf() === Symbol.iterator).assertEqual(true);
    });
    /**
     * @tc.name   Object1Test096
     * @tc.number SUB_BUILTINS_OBJECT1_TEST_9600
     * @tc.desc   Call Object() with a Uint8ClampedArray, verify value clamping behavior preservation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object1Test096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(result96).assertEqual(originalTypedArr96);
      expect(result96[0]).assertEqual(255);
      expect(result96[1]).assertEqual(0);
      expect(result96[2]).assertEqual(128);
      expect(result96.BYTES_PER_ELEMENT).assertEqual(1);
    });


    /**
     * @tc.name   Object1Test098
     * @tc.number SUB_BUILTINS_OBJECT1_TEST_9800
     * @tc.desc   Call Object() with a Map that has a BigInt key, verify key-value lookup
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object1Test098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(result98).assertEqual(originalMap98);
      expect(result98.get(bigIntKey98)).assertEqual('bigIntVal');
      expect(result98.get(12345)).assertEqual(undefined);
      expect(result98.size).assertEqual(1);
    });

    /**
     * @tc.name   Object1Test099
     * @tc.number SUB_BUILTINS_OBJECT1_TEST_9900
     * @tc.desc   Call Object() with a function that returns a WeakMap, verify function output
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object1Test099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(weakMapResult99 instanceof WeakMap).assertEqual(true);
      expect(weakMapResult99.has({})).assertEqual(false);
    });

    /**
     * @tc.name   Object1Test100
     * @tc.number SUB_BUILTINS_OBJECT1_TEST_10000
     * @tc.desc   Call Object() with a string with line breaks, verify wrapped object value and length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object1Test100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(typeof result100).assertEqual('object');
      expect(result100.valueOf()).assertEqual('line1\nline2\r\nline3');
      expect(result100.length).assertEqual(18);
      expect(result100.includes('\n')).assertEqual(true);
      expect(result100.includes('\r')).assertEqual(true);
    });
  })
}

