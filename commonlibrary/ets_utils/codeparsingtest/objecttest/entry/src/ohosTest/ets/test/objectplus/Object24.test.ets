/*
 * Copyright (c) 2025 SwanLink (Jiangsu) Technology Development Co., LTD.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import * as Object24 from './Object24';

function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}

export default function Object24Test() {
  describe('Object24Test', () => {
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
     * @tc.name   Object24Test001
     * @tc.number SUB_BUILTINS_OBJECT24_TEST_0100
     * @tc.desc   Test the correctness of Object.keys() returning enumerable string keys of a plain object (in insertion order)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object24Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object24.Fn01_testOwnEnumerableObjKeys();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object24Test002
     * @tc.number SUB_BUILTINS_OBJECT24_TEST_0200
     * @tc.desc   Test the correctness of Object.keys() returning index keys when processing a string primitive
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object24Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object24.Fn02_testStringPrimitive();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object24Test003
     * @tc.number SUB_BUILTINS_OBJECT24_TEST_0300
     * @tc.desc   Test the correctness of Object.keys() returning an empty array when processing a number primitive
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object24Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object24.Fn03_testNumberPrimitive();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object24Test004
     * @tc.number SUB_BUILTINS_OBJECT24_TEST_0400
     * @tc.desc   Test the correctness of Object.keys() returning an empty array when processing a boolean primitive
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object24Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object24.Fn04_testBooleanPrimitive();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object24Test005
     * @tc.number SUB_BUILTINS_OBJECT24_TEST_0500
     * @tc.desc   Test the correctness of Object.keys() excluding prototype chain properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object24Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object24.Fn05_testExcludePrototypeKeys();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object24Test006
     * @tc.number SUB_BUILTINS_OBJECT24_TEST_0600
     * @tc.desc   Test the correctness of Object.keys() returning an empty array when processing an empty object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object24Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object24.Fn06_testEmptyObject();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object24Test007
     * @tc.number SUB_BUILTINS_OBJECT24_TEST_0700
     * @tc.desc   Test the correctness of Object.keys() returning index keys (excluding length) when processing an array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object24Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object24.Fn07_testArrayIndexKeys();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object24Test008
     * @tc.number SUB_BUILTINS_OBJECT24_TEST_0800
     * @tc.desc   Test the correctness of Object.keys() returning indexes + custom properties when processing an array with custom enumerable properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object24Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object24.Fn08_testArrayCustomEnumerableProp();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object24Test009
     * @tc.number SUB_BUILTINS_OBJECT24_TEST_0900
     * @tc.desc   Test the correctness of Object.keys() not returning empty slot indexes when processing a sparse array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object24Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object24.Fn09_testSparseArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object24Test010
     * @tc.number SUB_BUILTINS_OBJECT24_TEST_1000
     * @tc.desc   Test the correctness of Object.keys() not returning non-enumerable properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object24Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object24.Fn10_testNonEnumerableProp();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object24Test011
     * @tc.number SUB_BUILTINS_OBJECT24_TEST_1100
     * @tc.desc   Test the correctness of Object.keys() not returning Symbol keys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object24Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object24.Fn11_testSymbolKeyExclude();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object24Test012
     * @tc.number SUB_BUILTINS_OBJECT24_TEST_1200
     * @tc.desc   Test the correctness of Object.keys() throwing a TypeError when null is passed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object24Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object24.Fn12_testNullThrowError();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object24Test013
     * @tc.number SUB_BUILTINS_OBJECT24_TEST_1300
     * @tc.desc   Test the correctness of Object.keys() throwing a TypeError when undefined is passed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object24Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object24.Fn13_testUndefinedThrowError();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object24Test014
     * @tc.number SUB_BUILTINS_OBJECT24_TEST_1400
     * @tc.desc   Test the correctness of Object.keys() returning own enumerable properties of an ES6 class instance (excluding prototype methods)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object24Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object24.Fn14_testClassInstanceOwnProp();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object24Test015
     * @tc.number SUB_BUILTINS_OBJECT24_TEST_1500
     * @tc.desc   Test the correctness of Object.keys() excluding private properties of a class instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object24Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object24.Fn15_testClassPrivatePropExclude();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object24Test016
     * @tc.number SUB_BUILTINS_OBJECT24_TEST_1600
     * @tc.desc   Test the correctness of Object.keys() returning static enumerable properties of a class
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object24Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object24.Fn16_testClassStaticEnumerableProp();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object24Test017
     * @tc.number SUB_BUILTINS_OBJECT24_TEST_1700
     * @tc.desc   Test the correctness of Object.keys() returning an empty array when processing a default Date object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object24Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object24.Fn17_testDateObjectDefault();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object24Test018
     * @tc.number SUB_BUILTINS_OBJECT24_TEST_1800
     * @tc.desc   Test the correctness of Object.keys() returning custom properties when processing a Date object with custom enumerable properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object24Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object24.Fn18_testDateObjectOwnProp();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object24Test019
     * @tc.number SUB_BUILTINS_OBJECT24_TEST_1900
     * @tc.desc   Test the correctness of Object.keys() returning an empty array when processing a default RegExp object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object24Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object24.Fn19_testRegExpObjectDefault();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object24Test020
     * @tc.number SUB_BUILTINS_OBJECT24_TEST_2000
     * @tc.desc   Test the correctness of Object.keys() returning custom properties when processing a RegExp object with custom enumerable properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object24Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object24.Fn20_testRegExpObjectOwnProp();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object24Test021
     * @tc.number SUB_BUILTINS_OBJECT24_TEST_2100
     * @tc.desc   Test the correctness of Object.keys() returning an empty array when processing a default Math object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object24Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object24.Fn21_testMathObjectDefault();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object24Test022
     * @tc.number SUB_BUILTINS_OBJECT24_TEST_2200
     * @tc.desc   Test the correctness of Object.keys() returning custom properties when processing a Math object with custom enumerable properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object24Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object24.Fn22_testMathObjectOwnProp();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object24Test023
     * @tc.number SUB_BUILTINS_OBJECT24_TEST_2300
     * @tc.desc   Test the correctness of Object.keys() returning an empty array when processing a default Error object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object24Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object24.Fn23_testErrorObjectDefault();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object24Test024
     * @tc.number SUB_BUILTINS_OBJECT24_TEST_2400
     * @tc.desc   Test the correctness of Object.keys() returning custom properties when processing an Error object with custom enumerable properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object24Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object24.Fn24_testErrorObjectOwnProp();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object24Test025
     * @tc.number SUB_BUILTINS_OBJECT24_TEST_2500
     * @tc.desc   Test the correctness of Object.keys() returning custom properties when processing a plain function with custom enumerable properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object24Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object24.Fn25_testFunctionObjectOwnProp();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object24Test026
     * @tc.number SUB_BUILTINS_OBJECT24_TEST_2600
     * @tc.desc   Test the correctness of Object.keys() returning custom properties when processing an arrow function with custom enumerable properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object24Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object24.Fn26_testArrowFunctionOwnProp();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object24Test027
     * @tc.number SUB_BUILTINS_OBJECT24_TEST_2700
     * @tc.desc   Test the correctness of Object.keys() returning custom properties when processing a generator function with custom enumerable properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object24Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object24.Fn27_testGeneratorFunctionOwnProp();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object24Test028
     * @tc.number SUB_BUILTINS_OBJECT24_TEST_2800
     * @tc.desc   Test the correctness of Object.keys() returning custom properties when processing an async function with custom enumerable properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object24Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object24.Fn28_testAsyncFunctionOwnProp();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object24Test029
     * @tc.number SUB_BUILTINS_OBJECT24_TEST_2900
     * @tc.desc   Test the correctness of Object.keys() returning an empty array when processing a default Map object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object24Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object24.Fn29_testMapObjectDefault();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object24Test030
     * @tc.number SUB_BUILTINS_OBJECT24_TEST_3000
     * @tc.desc   Test the correctness of Object.keys() returning custom properties when processing a Map object with custom enumerable properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object24Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object24.Fn30_testMapObjectOwnProp();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object24Test031
     * @tc.number SUB_BUILTINS_OBJECT24_TEST_3100
     * @tc.desc   Test the correctness of Object.keys() returning an empty array when processing a default Set object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object24Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object24.Fn31_testSetObjectDefault();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object24Test032
     * @tc.number SUB_BUILTINS_OBJECT24_TEST_3200
     * @tc.desc   Test the correctness of Object.keys() returning custom properties when processing a Set object with custom enumerable properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object24Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object24.Fn32_testSetObjectOwnProp();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object24Test033
     * @tc.number SUB_BUILTINS_OBJECT24_TEST_3300
     * @tc.desc   Test the correctness of Object.keys() returning custom properties when processing a WeakMap object with custom enumerable properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object24Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object24.Fn33_testWeakMapObjectOwnProp();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object24Test034
     * @tc.number SUB_BUILTINS_OBJECT24_TEST_3400
     * @tc.desc   Test the correctness of Object.keys() returning custom properties when processing a WeakSet object with custom enumerable properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object24Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object24.Fn34_testWeakSetObjectOwnProp();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object24Test035
     * @tc.number SUB_BUILTINS_OBJECT24_TEST_3500
     * @tc.desc   Test the correctness of Object.keys() returning indexes + length + custom properties when processing an array-like object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object24Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object24.Fn35_testArrayLikeObject();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object24Test036
     * @tc.number SUB_BUILTINS_OBJECT24_TEST_3600
     * @tc.desc   Test the correctness of Object.keys() still returning all index keys when processing an array-like object with length less than indexes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object24Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object24.Fn36_testArrayLikeLengthLessIndex();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object24Test037
     * @tc.number SUB_BUILTINS_OBJECT24_TEST_3700
     * @tc.desc   Test the correctness of Object.keys() returning own enumerable properties when processing a frozen object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object24Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object24.Fn37_testFrozenObject();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object24Test038
     * @tc.number SUB_BUILTINS_OBJECT24_TEST_3800
     * @tc.desc   Test the correctness of Object.keys() returning own enumerable properties when processing a sealed object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object24Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object24.Fn38_testSealedObject();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object24Test039
     * @tc.number SUB_BUILTINS_OBJECT24_TEST_3900
     * @tc.desc   Test the correctness of Object.keys() returning own enumerable properties when processing a non-extensible object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object24Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object24.Fn39_testNonExtensibleObject();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object24Test040
     * @tc.number SUB_BUILTINS_OBJECT24_TEST_4000
     * @tc.desc   Test the correctness of Object.keys() only returning the bottom-level own properties when processing an object with multi-level inheritance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object24Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object24.Fn40_testMultiLevelInheritance();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object24Test041
     * @tc.number SUB_BUILTINS_OBJECT24_TEST_4100
     * @tc.desc   Test the correctness of Object.keys() excluding enumerable properties on the prototype
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object24Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object24.Fn41_testPrototypeEnumerablePropExclude();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object24Test042
     * @tc.number SUB_BUILTINS_OBJECT24_TEST_4200
     * @tc.desc   Test the correctness of Object.keys() returning numeric string keys in ascending order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object24Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object24.Fn42_testNumberStringKeysOrder();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object24Test043
     * @tc.number SUB_BUILTINS_OBJECT24_TEST_4300
     * @tc.desc   Test the correctness of Object.keys() sorting mixed numeric and string keys by rule (numeric ascending first, then string insertion order)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object24Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object24.Fn43_testMixedKeysOrder();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object24Test044
     * @tc.number SUB_BUILTINS_OBJECT24_TEST_4400
     * @tc.desc   Test the correctness of Object.keys() processing an object with empty string as property name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object24Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object24.Fn44_testEmptyStringKey();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object24Test045
     * @tc.number SUB_BUILTINS_OBJECT24_TEST_4500
     * @tc.desc   Test the correctness of Object.keys() processing an object with Unicode characters as property names
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object24Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object24.Fn45_testUnicodeCharKey();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object24Test046
     * @tc.number SUB_BUILTINS_OBJECT24_TEST_4600
     * @tc.desc   Test the correctness of Object.keys() processing an object with Chinese characters as property names
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object24Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object24.Fn46_testChineseCharKey();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object24Test047
     * @tc.number SUB_BUILTINS_OBJECT24_TEST_4700
     * @tc.desc   Test the correctness of Object.keys() processing an object with special characters (space/@/_) as property names
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object24Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object24.Fn47_testSpecialCharKey();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object24Test048
     * @tc.number SUB_BUILTINS_OBJECT24_TEST_4800
     * @tc.desc   Test the correctness of Object.keys() processing an object with property names starting with numbers (e.g., '123abc')
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object24Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object24.Fn48_testNumberStartKey();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object24Test049
     * @tc.number SUB_BUILTINS_OBJECT24_TEST_4900
     * @tc.desc   Test the correctness of Object.keys() returning newly added properties after dynamically adding properties to an object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object24Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object24.Fn49_testDynamicAddProp();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object24Test050
     * @tc.number SUB_BUILTINS_OBJECT24_TEST_5000
     * @tc.desc   Test the correctness of Object.keys() not returning deleted properties after deleting a property from an object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object24Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object24.Fn50_testDeleteProp();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object24Test051
     * @tc.number SUB_BUILTINS_OBJECT24_TEST_5100
     * @tc.desc   Test the correctness of Object.keys() only returning top-level own properties when processing a nested object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object24Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object24.Fn51_testNestedObjectOwnProp();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object24Test052
     * @tc.number SUB_BUILTINS_OBJECT24_TEST_5200
     * @tc.desc   Test the correctness of Object.keys() still returning property names when property values are undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object24Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object24.Fn52_testObjPropValueUndefined();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object24Test053
     * @tc.number SUB_BUILTINS_OBJECT24_TEST_5300
     * @tc.desc   Test the correctness of Object.keys() still returning property names when property values are null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object24Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object24.Fn53_testObjPropValueNull();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object24Test054
     * @tc.number SUB_BUILTINS_OBJECT24_TEST_5400
     * @tc.desc   Test the correctness of Object.keys() still returning property names when property values are functions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object24Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object24.Fn54_testObjPropValueFunction();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object24Test055
     * @tc.number SUB_BUILTINS_OBJECT24_TEST_5500
     * @tc.desc   Test the correctness of Object.keys() still returning property names when property values are arrays
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object24Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object24.Fn55_testObjPropValueArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object24Test056
     * @tc.number SUB_BUILTINS_OBJECT24_TEST_5600
     * @tc.desc   Test the correctness of Object.keys() still returning property names when property values are objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object24Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object24.Fn56_testObjPropValueObject();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object24Test057
     * @tc.number SUB_BUILTINS_OBJECT24_TEST_5700
     * @tc.desc   Test the correctness of Object.keys() still returning index keys when array elements are objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object24Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object24.Fn57_testArrayPropValueObject();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object24Test058
     * @tc.number SUB_BUILTINS_OBJECT24_TEST_5800
     * @tc.desc   Test the correctness of Object.keys() returning own enumerable properties of the target when processing a proxy object without interceptors
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object24Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object24.Fn58_testProxyNoInterceptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object24Test059
     * @tc.number SUB_BUILTINS_OBJECT24_TEST_5900
     * @tc.desc   Test the correctness of Object.keys() returning specified string keys when processing a proxy object with ownKeys interceptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object24Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object24.Fn59_testProxyOwnKeysInterceptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object24Test060
     * @tc.number SUB_BUILTINS_OBJECT24_TEST_6000
     * @tc.desc   Test the correctness of Object.keys() returning all property names in correct order when processing an object with 10 properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object24Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object24.Fn60_testBigObject10Props();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object24Test061
     * @tc.number SUB_BUILTINS_OBJECT24_TEST_6100
     * @tc.desc   Test the correctness of Object.keys() returning the correct number of properties when processing an object with 20 properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object24Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object24.Fn61_testBigObject20Props();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object24Test062
     * @tc.number SUB_BUILTINS_OBJECT24_TEST_6200
     * @tc.desc   Test the correctness of Object.keys() returning existing index keys when processing an array with modified length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object24Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object24.Fn62_testArrayModifyLength();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object24Test063
     * @tc.number SUB_BUILTINS_OBJECT24_TEST_6300
     * @tc.desc   Test the correctness of Object.keys() returning an empty array when processing an array with length set to 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object24Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object24.Fn63_testArrayLengthZero();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object24Test064
     * @tc.number SUB_BUILTINS_OBJECT24_TEST_6400
     * @tc.desc   Test the correctness of Object.keys() excluding non-enumerable class prototype methods
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object24Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object24.Fn64_testClassMethodExclude();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object24Test065
     * @tc.number SUB_BUILTINS_OBJECT24_TEST_6500
     * @tc.desc   Test the correctness of Object.keys() returning enumerable properties defined via Object.defineProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object24Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object24.Fn65_testObjectDefineEnumerable();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object24Test066
     * @tc.number SUB_BUILTINS_OBJECT24_TEST_6600
     * @tc.desc   Test the correctness of Object.keys() excluding multiple non-enumerable properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object24Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object24.Fn66_testMultipleNonEnumerableProps();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object24Test067
     * @tc.number SUB_BUILTINS_OBJECT24_TEST_6700
     * @tc.desc   Test the correctness of Object.keys() only returning enumerable properties when mixing enumerable and non-enumerable properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object24Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object24.Fn67_testMixedEnumerableNonEnumerable();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object24Test068
     * @tc.number SUB_BUILTINS_OBJECT24_TEST_6800
     * @tc.desc   Test the correctness of Object.keys() excluding multiple Symbol keys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object24Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object24.Fn68_testMultiSymbolKeys();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object24Test069
     * @tc.number SUB_BUILTINS_OBJECT24_TEST_6900
     * @tc.desc   Test the correctness of Object.keys() returning multiple string keys in insertion order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object24Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object24.Fn69_testMultiStringKeys();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object24Test070
     * @tc.number SUB_BUILTINS_OBJECT24_TEST_7000
     * @tc.desc   Test the correctness of Object.keys() returning an empty array when processing an empty string primitive
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object24Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object24.Fn70_testEmptyStringPrimitive();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object24Test071
     * @tc.number SUB_BUILTINS_OBJECT24_TEST_7100
     * @tc.desc   Test the correctness of Object.keys() returning ['0'] when processing a single-character string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object24Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object24.Fn71_testSingleCharString();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object24Test072
     * @tc.number SUB_BUILTINS_OBJECT24_TEST_7200
     * @tc.desc   Test the correctness of Object.keys() returning an empty array when processing a NaN primitive
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object24Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object24.Fn72_testNaNPrimitive();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object24Test073
     * @tc.number SUB_BUILTINS_OBJECT24_TEST_7300
     * @tc.desc   Test the correctness of Object.keys() returning an empty array when processing an Infinity primitive
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object24Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object24.Fn73_testInfinityPrimitive();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object24Test074
     * @tc.number SUB_BUILTINS_OBJECT24_TEST_7400
     * @tc.desc   Test the correctness of Object.keys() returning an empty array when processing a -Infinity primitive
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object24Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object24.Fn74_testNegativeInfinityPrimitive();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object24Test075
     * @tc.number SUB_BUILTINS_OBJECT24_TEST_7500
     * @tc.desc   Test the correctness of Object.keys() returning an empty array when processing a negative number primitive
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object24Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object24.Fn75_testNegativeNumberPrimitive();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object24Test076
     * @tc.number SUB_BUILTINS_OBJECT24_TEST_7600
     * @tc.desc   Test the correctness of Object.keys() returning an empty array when processing a decimal number primitive
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object24Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object24.Fn76_testDecimalNumberPrimitive();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object24Test077
     * @tc.number SUB_BUILTINS_OBJECT24_TEST_7700
     * @tc.desc   Test the correctness of Object.keys() returning non-empty slot indexes + custom properties when processing an array with empty slots and custom properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object24Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object24.Fn77_testArrayWithHoleAndProp();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object24Test078
     * @tc.number SUB_BUILTINS_OBJECT24_TEST_7800
     * @tc.desc   Test the correctness of Object.keys() returning all enumerable properties when processing an array-like object with non-index properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object24Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object24.Fn78_testArrayLikeWithNonIndexProp();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object24Test079
     * @tc.number SUB_BUILTINS_OBJECT24_TEST_7900
     * @tc.desc   Test the correctness of Object.keys() returning an empty array when processing a WeakMap object with entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object24Test079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object24.Fn79_testWeakMapWithEntries();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object24Test080
     * @tc.number SUB_BUILTINS_OBJECT24_TEST_8000
     * @tc.desc   Test the correctness of Object.keys() returning an empty array when processing a WeakSet object with values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object24Test080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object24.Fn80_testWeakSetWithValues();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object24Test081
     * @tc.number SUB_BUILTINS_OBJECT24_TEST_8100
     * @tc.desc   Test the correctness of Object.keys() not returning the non-enumerable 'name' property of a function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object24Test081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object24.Fn81_testFunctionNameNonEnumerable();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object24Test082
     * @tc.number SUB_BUILTINS_OBJECT24_TEST_8200
     * @tc.desc   Test the correctness of Object.keys() not returning the non-enumerable 'length' property of a function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object24Test082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object24.Fn82_testFunctionLengthNonEnumerable();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object24Test083
     * @tc.number SUB_BUILTINS_OBJECT24_TEST_8300
     * @tc.desc   Test the correctness of Object.keys() still returning properties when processing an arrow function (without prototype) with added properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object24Test083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object24.Fn83_testArrowFunctionNoPrototype();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object24Test084
     * @tc.number SUB_BUILTINS_OBJECT24_TEST_8400
     * @tc.desc   Test the correctness of Object.keys() returning properties when processing a generator function (with prototype) with added properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object24Test084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object24.Fn84_testGeneratorFunctionPrototype();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object24Test085
     * @tc.number SUB_BUILTINS_OBJECT24_TEST_8500
     * @tc.desc   Test the correctness of Object.keys() excluding non-enumerable static properties (getters) of a class
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object24Test085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object24.Fn85_testClassStaticNonEnumerable();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object24Test086
     * @tc.number SUB_BUILTINS_OBJECT24_TEST_8600
     * @tc.desc   Test the correctness of Object.keys() excluding inherited prototype properties of a class instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object24Test086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object24.Fn86_testClassInstanceInheritedProp();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object24Test087
     * @tc.number SUB_BUILTINS_OBJECT24_TEST_8700
     * @tc.desc   Test the correctness of Object.keys() excluding non-enumerable properties of the target when processing a proxy object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object24Test087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object24.Fn87_testProxyTargetNonEnumerable();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object24Test088
     * @tc.number SUB_BUILTINS_OBJECT24_TEST_8800
     * @tc.desc   Test the correctness of Object.keys() filtering Symbols when processing a proxy object whose ownKeys interceptor returns Symbols
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object24Test088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object24.Fn88_testProxyOwnKeysFilterSymbol();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object24Test089
     * @tc.number SUB_BUILTINS_OBJECT24_TEST_8900
     * @tc.desc   Test the correctness of Object.keys() returning correct property names when processing an object created via Object.fromEntries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object24Test089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object24.Fn89_testObjectFromEntries();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object24Test090
     * @tc.number SUB_BUILTINS_OBJECT24_TEST_9000
     * @tc.desc   Test the correctness of Object.keys() returning correct properties after adding enumerable properties via Object.assign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object24Test090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object24.Fn90_testObjectAssignProps();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object24Test091
     * @tc.number SUB_BUILTINS_OBJECT24_TEST_9100
     * @tc.desc   Test the correctness of Object.keys() returning own properties when processing an object inherited from null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object24Test091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object24.Fn91_testObjectCreateNull();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object24Test092
     * @tc.number SUB_BUILTINS_OBJECT24_TEST_9200
     * @tc.desc   Test the correctness of Object.keys() returning own properties (excluding Array prototype properties) when processing an object inherited from Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object24Test092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object24.Fn92_testObjectCreateArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object24Test093
     * @tc.number SUB_BUILTINS_OBJECT24_TEST_9300
     * @tc.desc   Test the correctness of Object.keys() not returning enumerable properties added to Array.prototype when processing an array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object24Test093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object24.Fn93_testArrayPrototypeModified();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object24Test094
     * @tc.number SUB_BUILTINS_OBJECT24_TEST_9400
     * @tc.desc   Test the correctness of Object.keys() returning an empty array when processing a BigInt primitive
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object24Test094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object24.Fn94_testBigIntPrimitive();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object24Test095
     * @tc.number SUB_BUILTINS_OBJECT24_TEST_9500
     * @tc.desc   Test the correctness of Object.keys() returning an empty array when processing a BigInt object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object24Test095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object24.Fn95_testBigIntObject();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object24Test096
     * @tc.number SUB_BUILTINS_OBJECT24_TEST_9600
     * @tc.desc   Test the correctness of Object.keys() returning an empty array when processing a Symbol primitive
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object24Test096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object24.Fn96_testSymbolPrimitive();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object24Test097
     * @tc.number SUB_BUILTINS_OBJECT24_TEST_9700
     * @tc.desc   Test the correctness of Object.keys() returning an empty array when processing a Symbol object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object24Test097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object24.Fn97_testSymbolObject();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object24Test098
     * @tc.number SUB_BUILTINS_OBJECT24_TEST_9800
     * @tc.desc   Test the correctness of Object.keys() returning '__proto__' when processing an object with own enumerable '__proto__' property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object24Test098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object24.Fn98_testObjWithProtoProp();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object24Test099
     * @tc.number SUB_BUILTINS_OBJECT24_TEST_9900
     * @tc.desc   Test the correctness of Object.keys() not returning '__proto__' when processing an object with non-enumerable '__proto__' property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object24Test099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object24.Fn99_testObjWithProtoPropNonEnumerable();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object24Test100
     * @tc.number SUB_BUILTINS_OBJECT24_TEST_10000
     * @tc.desc   Test the correctness of Object.keys() returning '__proto__' when processing an array with own enumerable '__proto__' property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object24Test100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object24.Fn100_testArrayWithProtoProp();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object24Test101
     * @tc.number SUB_BUILTINS_OBJECT24_TEST_10100
     * @tc.desc   Test the correctness of Object.keys() still returning own enumerable properties when processing an object with circular reference
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object24Test101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object24.Fn101_testObjWithCircularRef();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object24Test102
     * @tc.number SUB_BUILTINS_OBJECT24_TEST_10200
     * @tc.desc   Test the correctness of Object.keys() still returning index keys when processing an array with circular reference
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object24Test102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object24.Fn102_testArrayWithCircularRef();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object24Test103
     * @tc.number SUB_BUILTINS_OBJECT24_TEST_10300
     * @tc.desc   Test the correctness of Object.keys() excluding non-enumerable static methods of a class
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object24Test103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object24.Fn103_testClassWithStaticMethod();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object24Test104
     * @tc.number SUB_BUILTINS_OBJECT24_TEST_10400
     * @tc.desc   Test the correctness of Object.keys() returning enumerable static fields of a class
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object24Test104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object24.Fn104_testClassWithStaticField();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object24Test105
     * @tc.number SUB_BUILTINS_OBJECT24_TEST_10500
     * @tc.desc   Test the correctness of Object.keys() returning an empty array when processing a proxy object whose ownKeys interceptor returns an empty array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object24Test105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object24.Fn105_testProxyOwnKeysReturnEmpty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object24Test106
     * @tc.number SUB_BUILTINS_OBJECT24_TEST_10600
     * @tc.desc   Test the correctness of Object.keys() throwing a TypeError when processing a proxy object whose ownKeys interceptor returns duplicate keys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object24Test106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object24.Fn106_testProxyOwnKeysReturnDuplicate();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object24Test107
     * @tc.number SUB_BUILTINS_OBJECT24_TEST_10700
     * @tc.desc   Test the correctness of Object.keys() returning properties set with enumerable:true via Object.defineProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object24Test107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object24.Fn107_testObjectDefinePropertyEnumerableTrue();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object24Test108
     * @tc.number SUB_BUILTINS_OBJECT24_TEST_10800
     * @tc.desc   Test the correctness of Object.keys() excluding properties set with enumerable:false via Object.defineProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object24Test108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object24.Fn108_testObjectDefinePropertyEnumerableFalse();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object24Test109
     * @tc.number SUB_BUILTINS_OBJECT24_TEST_10900
     * @tc.desc   Test the correctness of Object.keys() still returning property names when property values are BigInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object24Test109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object24.Fn109_testObjPropValueBigInt();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object24Test110
     * @tc.number SUB_BUILTINS_OBJECT24_TEST_11000
     * @tc.desc   Test the correctness of Object.keys() still returning property names when property values are Symbol
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object24Test110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object24.Fn110_testObjPropValueSymbol();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object24Test111
     * @tc.number SUB_BUILTINS_OBJECT24_TEST_11100
     * @tc.desc   Test the correctness of Object.keys() still returning property names when property values are RegExp objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object24Test111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object24.Fn111_testObjPropValueRegExp();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object24Test112
     * @tc.number SUB_BUILTINS_OBJECT24_TEST_11200
     * @tc.desc   Test the correctness of Object.keys() still returning property names when property values are Map objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object24Test112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object24.Fn112_testObjPropValueMap();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object24Test113
     * @tc.number SUB_BUILTINS_OBJECT24_TEST_11300
     * @tc.desc   Test the correctness of Object.keys() still returning property names when property values are Set objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object24Test113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object24.Fn113_testObjPropValueSet();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object24Test114
     * @tc.number SUB_BUILTINS_OBJECT24_TEST_11400
     * @tc.desc   Test the correctness of Object.keys() returning correct property names when processing an object with extra-long property names (100 characters)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object24Test114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object24.Fn114_testLongKeyName();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object24Test115
     * @tc.number SUB_BUILTINS_OBJECT24_TEST_11500
     * @tc.desc   Test the correctness of Object.keys() returning correct property names when processing an object with emojis as property names
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object24Test115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object24.Fn115_testEmojiKeyName();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object24Test116
     * @tc.number SUB_BUILTINS_OBJECT24_TEST_11600
     * @tc.desc   Test the correctness of Object.keys() still excluding enumerable prototype properties in a multi-level inheritance chain
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object24Test116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object24.Fn116_testMultiLevelProtoEnumerable();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name   Object24Test117
     * @tc.number SUB_BUILTINS_OBJECT24_TEST_11700
     * @tc.desc   Test the correctness of Object.keys() returning property names with enumerable getters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object24Test117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object24.Fn117_testEnumerableGetterProp();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object24Test118
     * @tc.number SUB_BUILTINS_OBJECT24_TEST_11800
     * @tc.desc   Test the correctness of Object.keys() excluding properties with non-enumerable getters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object24Test118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object24.Fn118_testNonEnumerableGetterProp();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object24Test119
     * @tc.number SUB_BUILTINS_OBJECT24_TEST_11900
     * @tc.desc   Test the correctness of Object.keys() returning property names with enumerable setters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object24Test119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object24.Fn119_testEnumerableSetterProp();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object24Test120
     * @tc.number SUB_BUILTINS_OBJECT24_TEST_12000
     * @tc.desc   Test the correctness of Object.keys() excluding properties with non-enumerable setters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object24Test120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object24.Fn120_testNonEnumerableSetterProp();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object24Test121
     * @tc.number SUB_BUILTINS_OBJECT24_TEST_12100
     * @tc.desc   Test the correctness of Object.keys() returning an empty array when processing an empty class instance (no own properties)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object24Test121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object24.Fn121_testEmptyClassInstance();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object24Test123
     * @tc.number SUB_BUILTINS_OBJECT24_TEST_12300
     * @tc.desc   Test the correctness of Object.keys() returning correct property names for numeric strings like "000" (distinguished from "0")
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object24Test123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object24.Fn123_testNumberStringKeyWithZeros();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object24Test124
     * @tc.number SUB_BUILTINS_OBJECT24_TEST_12400
     * @tc.desc   Test the correctness of Object.keys() still returning property names when property values are WeakMap objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object24Test124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object24.Fn124_testObjPropValueWeakMap();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object24Test125
     * @tc.number SUB_BUILTINS_OBJECT24_TEST_12500
     * @tc.desc   Test the correctness of Object.keys() still returning property names when property values are WeakSet objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object24Test125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object24.Fn125_testObjPropValueWeakSet();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object24Test126
     * @tc.number SUB_BUILTINS_OBJECT24_TEST_12600
     * @tc.desc   Test the correctness of Object.keys() returning correct property names with mixed special characters (!@#$)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object24Test126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object24.Fn126_testMixedSpecialCharKeys();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object24Test127
     * @tc.number SUB_BUILTINS_OBJECT24_TEST_12700
     * @tc.desc   Test the correctness of Object.keys() returning own properties when they have the same name as prototype properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object24Test127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object24.Fn127_testOwnPropSameAsProto();
      expect(result).assertEqual(true);
    });
  })
}