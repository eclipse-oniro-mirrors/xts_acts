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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import * as Object31 from './Object31';

function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}

export default function Object31Test() {
  describe('Object31Test', () => {
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
     * @tc.name   Object31Test001
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_0100
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn01_testOwnEnumerableProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test002
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_0200
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn02_testInheritedProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test003
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_0300
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn03_testBuiltInProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test004
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_0400
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn04_testDefinedEnumerable();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test005
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_0500
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn05_testDefinedNonEnumerable();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test006
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_0600
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn06_testArrayElements();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test007
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_0700
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn07_testArrayCustomProp();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test008
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_0800
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn08_testSymbolProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test009
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_0900
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn09_testPrototypeProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test010
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_1000
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn10_testNonEnumerableOwn();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test011
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_1100
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn11_testClassInstance();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test012
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_1200
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn12_testFrozenObject();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test013
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_1300
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn13_testSealedObject();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test014
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_1400
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn14_testStringObject();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test015
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_1500
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn15_testNumberObject();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test016
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_1600
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn16_testFunctionProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test017
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_1700
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn17_testDateObject();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test018
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_1800
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn18_testRegExpObject();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test019
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_1900
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn19_testInheritedEnumerable();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test020
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_2000
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn20_testObjectKeys();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test021
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_2100
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn21_testForInEnumeration();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test022
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_2200
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn22_testArrayLength();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test023
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_2300
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn23_testMathProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test024
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_2400
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn24_testJSONProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test025
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_2500
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn25_testBooleanObject();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test026
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_2600
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn26_testSymbolEnumerable();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test027
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_2700
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn27_testSymbolNonEnumerable();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test028
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_2800
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn28_testPrototypeEnumerable();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test029
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_2900
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn29_testOverriddenPrototype();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test030
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_3000
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn30_testDatePrototype();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test031
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_3100
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn31_testArrayPrototype();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test032
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_3200
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn32_testObjectPrototype();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test033
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_3300
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn33_testEmptyObject();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test034
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_3400
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn34_testDynamicAddProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test035
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_3500
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn35_testDeletedProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test036
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_3600
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn36_testRedefinedProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test037
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_3700
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn37_testNumberPrototype();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test038
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_3800
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn38_testStringPrototype();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test039
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_3900
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn39_testFunctionPrototype();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test040
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_4000
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn40_testSetObject();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test041
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_4100
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn41_testMapObject();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test042
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_4200
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn42_testWeakSetObject();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test043
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_4300
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn43_testWeakMapObject();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test044
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_4400
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn44_testArrayLikeObject();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test045
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_4500
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn45_testArgumentsObject();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test046
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_4600
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn46_testArgumentsCallee();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test047
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_4700
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn47_testErrorObject();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test048
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_4800
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn48_testTypeErrorObject();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test049
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_4900
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn49_testPromiseObject();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test050
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_5000
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn50_testGeneratorFunction();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test051
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_5100
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn51_testAsyncFunction();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test052
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_5200
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn52_testClassStaticProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test053
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_5300
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn53_testClassPrototypeProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test054
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_5400
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn54_testProxyObject();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test055
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_5500
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn55_testReflectOwnKeys();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test056
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_5600
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn56_testObjectGetOwnPropertySymbols();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test057
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_5700
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn57_testNonEnumerableSymbol();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test058
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_5800
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn58_testArrayIterator();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test059
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_5900
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn59_testStringIterator();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test060
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_6000
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn60_testSetIterator();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test061
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_6100
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn61_testMapIterator();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test062
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_6200
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn62_testRegExpFlags();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test063
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_6300
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn63_testRegExpSource();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test064
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_6400
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn64_testArrayBuffer();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test065
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_6500
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn65_testDataView();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test066
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_6600
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn66_testInt8Array();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test067
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_6700
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn67_testUint8Array();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test068
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_6800
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn68_testFloat32Array();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test069
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_6900
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn69_testModuleNamespace();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test070
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_7000
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn70_testWeakRef();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test071
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_7100
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn71_testFinalizationRegistry();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test072
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_7200
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn72_testSharedArrayBuffer();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test073
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_7300
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn73_testAtomics();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test074
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_7400
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn74_testJSONStringify();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test075
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_7500
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn75_testObjectAssign();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test077
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_7700
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn77_testObjectSetPrototypeOf();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test078
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_7800
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn78_testEnumerableAfterDefine();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test080
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_8000
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn80_testSymbolToStringTag();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test081
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_8100
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn81_testSymbolHasInstance();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test082
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_8200
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn82_testSymbolIsConcatSpreadable();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test083
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_8300
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn83_testSymbolToPrimitive();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test084
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_8400
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn84_testSymbolSpecies();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test085
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_8500
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn85_testSymbolUnscopables();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test089
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_8900
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn89_testMathFunctions();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test090
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_9000
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn90_testDateFunctions();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test091
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_9100
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn91_testArrayFunctions();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test092
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_9200
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn92_testObjectFunctions();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test093
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_9300
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn93_testFunctionProperties();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test094
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_9400
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn94_testGeneratorObject();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test095
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_9500
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn95_testAsyncGenerator();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test096
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_9600
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn96_testBigIntObject();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test097
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_9700
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn97_testNullishCoalescing();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test098
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_9800
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn98_testOptionalChaining();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test099
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_9900
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn99_testPrivateClassField();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test100
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_10000
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn100_testStaticPrivateField();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test101
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_10100
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn101_testClassStaticMethod();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test102
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_10200
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn102_testClassInstanceMethod();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test103
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_10300
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn103_testSetPrototypeProps();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test105
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_10500
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn105_testTypedArrayByteLength();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test106
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_10600
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn106_testTypedArrayBuffer();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test107
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_10700
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn107_testMapSize();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test108
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_10800
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn108_testSetSize();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test109
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_10900
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn109_testRegExpLastIndex();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test110
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_11000
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn110_testErrorMessage();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test111
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_11100
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn111_testErrorStack();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test112
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_11200
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn112_testPromiseThen();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test113
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_11300
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn113_testGeneratorNext();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test116
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_11600
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn116_testSymbolAsyncIterator();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test117
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_11700
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn117_testCustomAsyncIterator();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test118
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_11800
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn118_testArrayBufferByteLength();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test119
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_11900
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn119_testDataViewByteOffset();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test120
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_12000
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn120_testJSONStringify();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test121
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_12100
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn121_testObjectCreate();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test122
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_12200
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn122_testFunctionName();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test123
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_12300
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn123_testFunctionLength();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test124
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_12400
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn124_testObjectGetter();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test125
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_12500
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn125_testObjectSetter();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test126
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_12600
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn126_testDefinedGetter();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test127
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_12700
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn127_testClassGetter();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test128
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_12800
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn128_testClassStaticGetter();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test129
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_12900
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn129_testArrayConcat();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test130
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_13000
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn130_testStringSlice();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test131
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_13100
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn131_testNumberValueOf();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test132
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_13200
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn132_testBooleanToString();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test133
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_13300
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn133_testDateToISOString();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test134
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_13400
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn134_testRegExpExec();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test135
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_13500
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn135_testMapSet();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test136
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_13600
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn136_testSetAdd();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test137
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_13700
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn137_testWeakMapGet();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test138
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_13800
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn138_testWeakSetDelete();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test139
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_13900
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn139_testArrayBufferSlice();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test140
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_14000
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn140_testDataViewGetInt8();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test141
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_14100
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn141_testInt16ArrayEvery();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test142
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_14200
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn142_testUint32ArrayMap();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test143
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_14300
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn143_testFloat64ArrayFilter();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test144
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_14400
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn144_testPromiseCatch();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test145
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_14500
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn145_testPromiseFinally();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test146
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_14600
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn146_testGeneratorReturn();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test147
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_14700
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn147_testGeneratorThrow();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test148
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_14800
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn148_testProxyApply();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test149
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_14900
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn149_testModuleDefault();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test150
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_15000
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn150_testWeakRefDeref();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test151
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_15100
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn151_testFinalizationRegistryRegister();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test152
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_15200
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn152_testAtomicsLoad();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test153
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_15300
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn153_testSharedArrayBufferByteLength();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test158
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_15800
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test158', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn158_testImageDataWidth();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test161
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_16100
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test161', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn161_testDateTimeFormat();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test162
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_16200
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test162', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn162_testNumberFormat();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test163
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_16300
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test163', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn163_testArrayFlat();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test164
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_16400
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test164', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn164_testStringPadStart();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test165
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_16500
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test165', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn165_testObjectEntries();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test166
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_16600
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test166', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn166_testObjectValues();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test167
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_16700
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test167', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn167_testArrayFlatMap();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test168
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_16800
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test168', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn168_testStringTrimStart();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test169
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_16900
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test169', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn169_testMapKeys();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test170
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_17000
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn170_testSetValues();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test171
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_17100
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test171', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn171_testArrayFind();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test172
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_17200
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test172', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn172_testArrayFindIndex();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test173
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_17300
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test173', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn173_testStringIncludes();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test174
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_17400
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test174', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn174_testNumberIsInteger();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test175
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_17500
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test175', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn175_testObjectIs();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test176
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_17600
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test176', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn176_testObjectAssign();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test177
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_17700
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test177', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn177_testArrayIncludes();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test178
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_17800
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test178', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn178_testStringStartsWith();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test179
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_17900
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test179', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn179_testStringEndsWith();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test180
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_18000
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn180_testArrayBufferIsView();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test181
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_18100
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test181', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn181_testDateParse();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test182
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_18200
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test182', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn182_testDateUTC();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test183
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_18300
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test183', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn183_testRegExpTest();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test184
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_18400
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test184', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn184_testRegExpToString();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test185
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_18500
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test185', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn185_testFunctionBind();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test186
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_18600
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test186', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn186_testFunctionCall();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test187
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_18700
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test187', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn187_testFunctionApply();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test188
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_18800
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test188', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn188_testObjectGetOwnPropertyNames();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test189
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_18900
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test189', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn189_testObjectGetOwnPropertySymbols();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test190
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_19000
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn190_testReflectApply();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test191
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_19100
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test191', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn191_testReflectConstruct();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test192
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_19200
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test192', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn192_testJSONParse();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test193
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_19300
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test193', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn193_testArrayFrom();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test194
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_19400
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test194', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn194_testArrayOf();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test195
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_19500
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test195', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn195_testSymbolFor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test196
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_19600
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test196', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn196_testSymbolKeyFor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test197
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_19700
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test197', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn197_testWeakMapHas();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test198
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_19800
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test198', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn198_testWeakSetHas();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test199
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_19900
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test199', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn199_testMapHas();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test200
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_20000
     * @tc.desc   test object prototype.propertyIsEnumerable()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object31.Fn200_testSetHas();
      expect(result).assertEqual(true);
    });

  })
}