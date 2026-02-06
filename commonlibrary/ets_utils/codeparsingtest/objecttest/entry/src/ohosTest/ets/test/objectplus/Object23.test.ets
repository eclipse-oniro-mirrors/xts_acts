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
import * as Object23 from './Object23';

function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}


export default function Object23Test() {
  describe('Object23Test', () => {
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
     * @tc.name   Object23Test001
     * @tc.number SUB_BUILTINS_OBJECT23_TEST_0100
     * @tc.desc   test object isSealed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object23Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object23.Fn01_testUnsealedNormalObject();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object23Test002
     * @tc.number SUB_BUILTINS_OBJECT23_TEST_0200
     * @tc.desc   test object isSealed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object23Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object23.Fn02_testSealedObject();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object23Test003
     * @tc.number SUB_BUILTINS_OBJECT23_TEST_0300
     * @tc.desc   test object isSealed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object23Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object23.Fn03_testPrimitiveValueAsParam();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object23Test004
     * @tc.number SUB_BUILTINS_OBJECT23_TEST_0400
     * @tc.desc   test object isSealed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object23Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object23.Fn04_testUnsealedEmptyObject();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object23Test005
     * @tc.number SUB_BUILTINS_OBJECT23_TEST_0500
     * @tc.desc   test object isSealed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object23Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object23.Fn05_testSealedEmptyObject();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object23Test006
     * @tc.number SUB_BUILTINS_OBJECT23_TEST_0600
     * @tc.desc   test object isSealed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object23Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object23.Fn06_testUnsealedArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object23Test007
     * @tc.number SUB_BUILTINS_OBJECT23_TEST_0700
     * @tc.desc   test object isSealed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object23Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object23.Fn07_testSealedArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object23Test008
     * @tc.number SUB_BUILTINS_OBJECT23_TEST_0800
     * @tc.desc   test object isSealed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object23Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object23.Fn08_testUnsealedFunction();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object23Test009
     * @tc.number SUB_BUILTINS_OBJECT23_TEST_0900
     * @tc.desc   test object isSealed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object23Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object23.Fn09_testSealedFunction();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object23Test010
     * @tc.number SUB_BUILTINS_OBJECT23_TEST_1000
     * @tc.desc   test object isSealed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object23Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object23.Fn10_testUnsealedDate();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object23Test011
     * @tc.number SUB_BUILTINS_OBJECT23_TEST_1100
     * @tc.desc   test object isSealed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object23Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object23.Fn11_testSealedDate();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object23Test012
     * @tc.number SUB_BUILTINS_OBJECT23_TEST_1200
     * @tc.desc   test object isSealed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object23Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object23.Fn12_testUnsealedRegExp();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object23Test013
     * @tc.number SUB_BUILTINS_OBJECT23_TEST_1300
     * @tc.desc   test object isSealed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object23Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object23.Fn13_testSealedRegExp();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object23Test014
     * @tc.number SUB_BUILTINS_OBJECT23_TEST_1400
     * @tc.desc   test object isSealed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object23Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object23.Fn14_testUnsealedMap();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object23Test015
     * @tc.number SUB_BUILTINS_OBJECT23_TEST_1500
     * @tc.desc   test object isSealed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object23Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object23.Fn15_testSealedMap();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object23Test016
     * @tc.number SUB_BUILTINS_OBJECT23_TEST_1600
     * @tc.desc   test object isSealed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object23Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object23.Fn16_testUnsealedSet();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object23Test017
     * @tc.number SUB_BUILTINS_OBJECT23_TEST_1700
     * @tc.desc   test object isSealed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object23Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object23.Fn17_testSealedSet();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object23Test018
     * @tc.number SUB_BUILTINS_OBJECT23_TEST_1800
     * @tc.desc   test object isSealed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object23Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object23.Fn18_testUnsealedClassInstance();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object23Test019
     * @tc.number SUB_BUILTINS_OBJECT23_TEST_1900
     * @tc.desc   test object isSealed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object23Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object23.Fn19_testSealedClassInstance();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object23Test020
     * @tc.number SUB_BUILTINS_OBJECT23_TEST_2000
     * @tc.desc   test object isSealed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object23Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object23.Fn20_testFrozenObjectIsSealed();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object23Test021
     * @tc.number SUB_BUILTINS_OBJECT23_TEST_2100
     * @tc.desc   test object isSealed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object23Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object23.Fn21_testNonExtensibleWithConfigTrue();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object23Test022
     * @tc.number SUB_BUILTINS_OBJECT23_TEST_2200
     * @tc.desc   test object isSealed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object23Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object23.Fn22_testNonExtensibleAllConfigFalse();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object23Test024
     * @tc.number SUB_BUILTINS_OBJECT23_TEST_2400
     * @tc.desc   test object isSealed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object23Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object23.Fn24_testSealedObjModifyWritableProp();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object23Test026
     * @tc.number SUB_BUILTINS_OBJECT23_TEST_2600
     * @tc.desc   test object isSealed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object23Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object23.Fn26_testNestedOuterSealedInnerUnsealed();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object23Test027
     * @tc.number SUB_BUILTINS_OBJECT23_TEST_2700
     * @tc.desc   test object isSealed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object23Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object23.Fn27_testNestedOuterSealedInnerSealed();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object23Test028
     * @tc.number SUB_BUILTINS_OBJECT23_TEST_2800
     * @tc.desc   test object isSealed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object23Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object23.Fn28_testUnsealedPrototype();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object23Test029
     * @tc.number SUB_BUILTINS_OBJECT23_TEST_2900
     * @tc.desc   test object isSealed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object23Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object23.Fn29_testSealedPrototype();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object23Test030
     * @tc.number SUB_BUILTINS_OBJECT23_TEST_3000
     * @tc.desc   test object isSealed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object23Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object23.Fn30_testInstanceInheritSealedProto();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object23Test031
     * @tc.number SUB_BUILTINS_OBJECT23_TEST_3100
     * @tc.desc   test object isSealed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object23Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object23.Fn31_testUnsealedArgumentsNonStrict();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object23Test032
     * @tc.number SUB_BUILTINS_OBJECT23_TEST_3200
     * @tc.desc   test object isSealed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object23Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object23.Fn32_testSealedArgumentsNonStrict();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object23Test033
     * @tc.number SUB_BUILTINS_OBJECT23_TEST_3300
     * @tc.desc   test object isSealed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object23Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object23.Fn33_testUnsealedTypedArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object23Test035
     * @tc.number SUB_BUILTINS_OBJECT23_TEST_3500
     * @tc.desc   test object isSealed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object23Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object23.Fn35_testUnsealedWeakMap();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object23Test036
     * @tc.number SUB_BUILTINS_OBJECT23_TEST_3600
     * @tc.desc   test object isSealed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object23Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object23.Fn36_testSealedWeakMap();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object23Test037
     * @tc.number SUB_BUILTINS_OBJECT23_TEST_3700
     * @tc.desc   test object isSealed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object23Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object23.Fn37_testUnsealedWeakSet();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object23Test038
     * @tc.number SUB_BUILTINS_OBJECT23_TEST_3800
     * @tc.desc   test object isSealed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object23Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object23.Fn38_testSealedWeakSet();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object23Test039
     * @tc.number SUB_BUILTINS_OBJECT23_TEST_3900
     * @tc.desc   test object isSealed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object23Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object23.Fn39_testUnsealedObjWithSymbolProp();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object23Test040
     * @tc.number SUB_BUILTINS_OBJECT23_TEST_4000
     * @tc.desc   test object isSealed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object23Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object23.Fn40_testSealedObjWithSymbolProp();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object23Test041
     * @tc.number SUB_BUILTINS_OBJECT23_TEST_4100
     * @tc.desc   test object isSealed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object23Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object23.Fn41_testUnsealedObjWithNonEnumProp();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object23Test042
     * @tc.number SUB_BUILTINS_OBJECT23_TEST_4200
     * @tc.desc   test object isSealed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object23Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object23.Fn42_testSealedObjWithNonEnumProp();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object23Test043
     * @tc.number SUB_BUILTINS_OBJECT23_TEST_4300
     * @tc.desc   test object isSealed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object23Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object23.Fn43_testUnsealedObjWithNonWritableProp();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object23Test044
     * @tc.number SUB_BUILTINS_OBJECT23_TEST_4400
     * @tc.desc   test object isSealed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object23Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object23.Fn44_testSealedObjWithNonWritableProp();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object23Test045
     * @tc.number SUB_BUILTINS_OBJECT23_TEST_4500
     * @tc.desc   test object isSealed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object23Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object23.Fn45_testSealedObjModifyConfigurable();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object23Test046
     * @tc.number SUB_BUILTINS_OBJECT23_TEST_4600
     * @tc.desc   test object isSealed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object23Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object23.Fn46_testSealedObjModifyEnumerable();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object23Test047
     * @tc.number SUB_BUILTINS_OBJECT23_TEST_4700
     * @tc.desc   test object isSealed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object23Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object23.Fn47_testUnsealedObjWithGetter();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object23Test048
     * @tc.number SUB_BUILTINS_OBJECT23_TEST_4800
     * @tc.desc   test object isSealed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object23Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object23.Fn48_testSealedObjWithGetter();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object23Test049
     * @tc.number SUB_BUILTINS_OBJECT23_TEST_4900
     * @tc.desc   test object isSealed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object23Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object23.Fn49_testUnsealedObjWithSetter();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object23Test050
     * @tc.number SUB_BUILTINS_OBJECT23_TEST_5000
     * @tc.desc   test object isSealed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object23Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object23.Fn50_testSealedObjWithSetter();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object23Test051
     * @tc.number SUB_BUILTINS_OBJECT23_TEST_5100
     * @tc.desc   test object isSealed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object23Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object23.Fn51_testNullAsParam();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object23Test052
     * @tc.number SUB_BUILTINS_OBJECT23_TEST_5200
     * @tc.desc   test object isSealed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object23Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object23.Fn52_testUndefinedAsParam();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object23Test053
     * @tc.number SUB_BUILTINS_OBJECT23_TEST_5300
     * @tc.desc   test object isSealed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object23Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object23.Fn53_testStringPrimitiveAsParam();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object23Test054
     * @tc.number SUB_BUILTINS_OBJECT23_TEST_5400
     * @tc.desc   test object isSealed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object23Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object23.Fn54_testBooleanTrueAsParam();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object23Test055
     * @tc.number SUB_BUILTINS_OBJECT23_TEST_5500
     * @tc.desc   test object isSealed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object23Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object23.Fn55_testBooleanFalseAsParam();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object23Test056
     * @tc.number SUB_BUILTINS_OBJECT23_TEST_5600
     * @tc.desc   test object isSealed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object23Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object23.Fn56_testBigIntPrimitiveAsParam();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object23Test057
     * @tc.number SUB_BUILTINS_OBJECT23_TEST_5700
     * @tc.desc   test object isSealed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object23Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object23.Fn57_testSymbolPrimitiveAsParam();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object23Test058
     * @tc.number SUB_BUILTINS_OBJECT23_TEST_5800
     * @tc.desc   test object isSealed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object23Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object23.Fn58_testUnsealedStringObject();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object23Test059
     * @tc.number SUB_BUILTINS_OBJECT23_TEST_5900
     * @tc.desc   test object isSealed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object23Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object23.Fn59_testSealedStringObject();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object23Test060
     * @tc.number SUB_BUILTINS_OBJECT23_TEST_6000
     * @tc.desc   test object isSealed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object23Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object23.Fn60_testUnsealedNumberObject();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object23Test061
     * @tc.number SUB_BUILTINS_OBJECT23_TEST_6100
     * @tc.desc   test object isSealed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object23Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object23.Fn61_testSealedNumberObject();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object23Test062
     * @tc.number SUB_BUILTINS_OBJECT23_TEST_6200
     * @tc.desc   test object isSealed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object23Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object23.Fn62_testUnsealedBooleanObject();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object23Test063
     * @tc.number SUB_BUILTINS_OBJECT23_TEST_6300
     * @tc.desc   test object isSealed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object23Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object23.Fn63_testSealedBooleanObject();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object23Test064
     * @tc.number SUB_BUILTINS_OBJECT23_TEST_6400
     * @tc.desc   test object isSealed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object23Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object23.Fn64_testUnsealedEmptyArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object23Test065
     * @tc.number SUB_BUILTINS_OBJECT23_TEST_6500
     * @tc.desc   test object isSealed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object23Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object23.Fn65_testSealedEmptyArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object23Test067
     * @tc.number SUB_BUILTINS_OBJECT23_TEST_6700
     * @tc.desc   test object isSealed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object23Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object23.Fn67_testUnsealedPromise();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object23Test068
     * @tc.number SUB_BUILTINS_OBJECT23_TEST_6800
     * @tc.desc   test object isSealed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object23Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object23.Fn68_testSealedPromise();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object23Test069
     * @tc.number SUB_BUILTINS_OBJECT23_TEST_6900
     * @tc.desc   test object isSealed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object23Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object23.Fn69_testUnsealedGenerator();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object23Test070
     * @tc.number SUB_BUILTINS_OBJECT23_TEST_7000
     * @tc.desc   test object isSealed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object23Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object23.Fn70_testSealedGenerator();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object23Test071
     * @tc.number SUB_BUILTINS_OBJECT23_TEST_7100
     * @tc.desc   test object isSealed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object23Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object23.Fn71_testUnsealedAsyncFunction();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object23Test072
     * @tc.number SUB_BUILTINS_OBJECT23_TEST_7200
     * @tc.desc   test object isSealed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object23Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object23.Fn72_testSealedAsyncFunction();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object23Test073
     * @tc.number SUB_BUILTINS_OBJECT23_TEST_7300
     * @tc.desc   test object isSealed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object23Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object23.Fn73_testUnsealedObjWithGetterSetter();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object23Test074
     * @tc.number SUB_BUILTINS_OBJECT23_TEST_7400
     * @tc.desc   test object isSealed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object23Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object23.Fn74_testSealedObjWithGetterSetter();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object23Test075
     * @tc.number SUB_BUILTINS_OBJECT23_TEST_7500
     * @tc.desc   test object isSealed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object23Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object23.Fn75_testSealedObjModifyGetter();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object23Test076
     * @tc.number SUB_BUILTINS_OBJECT23_TEST_7600
     * @tc.desc   test object isSealed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object23Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object23.Fn76_testSealedObjModifySetter();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object23Test077
     * @tc.number SUB_BUILTINS_OBJECT23_TEST_7700
     * @tc.desc   test object isSealed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object23Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object23.Fn77_testUnsealedNoProtoObj();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object23Test078
     * @tc.number SUB_BUILTINS_OBJECT23_TEST_7800
     * @tc.desc   test object isSealed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object23Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object23.Fn78_testSealedNoProtoObj();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object23Test079
     * @tc.number SUB_BUILTINS_OBJECT23_TEST_7900
     * @tc.desc   test object isSealed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object23Test079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object23.Fn79_testSealedInstanceInheritUnsealedProto();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object23Test080
     * @tc.number SUB_BUILTINS_OBJECT23_TEST_8000
     * @tc.desc   test object isSealed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object23Test080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object23.Fn80_testUnsealedProxy();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object23Test081
     * @tc.number SUB_BUILTINS_OBJECT23_TEST_8100
     * @tc.desc   test object isSealed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object23Test081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object23.Fn81_testSealedProxy();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object23Test082
     * @tc.number SUB_BUILTINS_OBJECT23_TEST_8200
     * @tc.desc   test object isSealed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object23Test082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object23.Fn82_testProxySealedTarget();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object23Test083
     * @tc.number SUB_BUILTINS_OBJECT23_TEST_8300
     * @tc.desc   test object isSealed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object23Test083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object23.Fn83_testSealedProxyUnsealedTarget();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object23Test084
     * @tc.number SUB_BUILTINS_OBJECT23_TEST_8400
     * @tc.desc   test object isSealed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object23Test084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object23.Fn84_testUnsealedObjWithBigIntProp();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object23Test085
     * @tc.number SUB_BUILTINS_OBJECT23_TEST_8500
     * @tc.desc   test object isSealed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object23Test085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object23.Fn85_testSealedObjWithBigIntProp();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object23Test086
     * @tc.number SUB_BUILTINS_OBJECT23_TEST_8600
     * @tc.desc   test object isSealed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object23Test086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object23.Fn86_testUnsealedClassStaticPropObj();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object23Test087
     * @tc.number SUB_BUILTINS_OBJECT23_TEST_8700
     * @tc.desc   test object isSealed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object23Test087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object23.Fn87_testSealedClassStaticPropObj();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object23Test088
     * @tc.number SUB_BUILTINS_OBJECT23_TEST_8800
     * @tc.desc   test object isSealed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object23Test088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object23.Fn88_testNonExtensiblePartialConfigFalse();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object23Test089
     * @tc.number SUB_BUILTINS_OBJECT23_TEST_8900
     * @tc.desc   test object isSealed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object23Test089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object23.Fn89_testNonExtensibleAllConfigFalseMultiProp();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object23Test096
     * @tc.number SUB_BUILTINS_OBJECT23_TEST_9600
     * @tc.desc   test object isSealed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object23Test096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object23.Fn96_testUnsealedObjWithCircularRef();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object23Test097
     * @tc.number SUB_BUILTINS_OBJECT23_TEST_9700
     * @tc.desc   test object isSealed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object23Test097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object23.Fn97_testSealedObjWithCircularRef();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object23Test098
     * @tc.number SUB_BUILTINS_OBJECT23_TEST_9800
     * @tc.desc   test object isSealed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object23Test098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object23.Fn98_testUnsealedModuleExportObj();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object23Test099
     * @tc.number SUB_BUILTINS_OBJECT23_TEST_9900
     * @tc.desc   test object isSealed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object23Test099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object23.Fn99_testSealedModuleExportObj();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object23Test100
     * @tc.number SUB_BUILTINS_OBJECT23_TEST_10000
     * @tc.desc   test object isSealed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object23Test100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object23.Fn100_testUnsealedError();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object23Test101
     * @tc.number SUB_BUILTINS_OBJECT23_TEST_10100
     * @tc.desc   test object isSealed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object23Test101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object23.Fn101_testSealedError();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object23Test102
     * @tc.number SUB_BUILTINS_OBJECT23_TEST_10200
     * @tc.desc   test object isSealed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object23Test102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object23.Fn102_testUnsealedTypeError();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object23Test103
     * @tc.number SUB_BUILTINS_OBJECT23_TEST_10300
     * @tc.desc   test object isSealed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object23Test103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object23.Fn103_testSealedTypeError();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object23Test104
     * @tc.number SUB_BUILTINS_OBJECT23_TEST_10400
     * @tc.desc   test object isSealed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object23Test104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object23.Fn104_testUnsealedRangeError();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object23Test105
     * @tc.number SUB_BUILTINS_OBJECT23_TEST_10500
     * @tc.desc   test object isSealed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object23Test105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object23.Fn105_testSealedRangeError();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object23Test106
     * @tc.number SUB_BUILTINS_OBJECT23_TEST_10600
     * @tc.desc   test object isSealed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object23Test106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object23.Fn106_testUnsealedDateWithTime();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object23Test107
     * @tc.number SUB_BUILTINS_OBJECT23_TEST_10700
     * @tc.desc   test object isSealed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object23Test107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object23.Fn107_testSealedDateWithTime();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object23Test108
     * @tc.number SUB_BUILTINS_OBJECT23_TEST_10800
     * @tc.desc   test object isSealed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object23Test108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object23.Fn108_testUnsealedRegExpWithFlags();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object23Test109
     * @tc.number SUB_BUILTINS_OBJECT23_TEST_10900
     * @tc.desc   test object isSealed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object23Test109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object23.Fn109_testSealedRegExpWithFlags();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object23Test110
     * @tc.number SUB_BUILTINS_OBJECT23_TEST_11000
     * @tc.desc   test object isSealed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object23Test110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object23.Fn110_testUnsealedUint16Array();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object23Test112
     * @tc.number SUB_BUILTINS_OBJECT23_TEST_11200
     * @tc.desc   test object isSealed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object23Test112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object23.Fn112_testUnsealedFloat32Array();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object23Test114
     * @tc.number SUB_BUILTINS_OBJECT23_TEST_11400
     * @tc.desc   test object isSealed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object23Test114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object23.Fn114_testUnsealedMapWithData();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object23Test115
     * @tc.number SUB_BUILTINS_OBJECT23_TEST_11500
     * @tc.desc   test object isSealed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object23Test115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object23.Fn115_testSealedMapWithData();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object23Test116
     * @tc.number SUB_BUILTINS_OBJECT23_TEST_11600
     * @tc.desc   test object isSealed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object23Test116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object23.Fn116_testUnsealedSetWithData();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object23Test117
     * @tc.number SUB_BUILTINS_OBJECT23_TEST_11700
     * @tc.desc   test object isSealed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object23Test117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object23.Fn117_testSealedSetWithData();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object23Test118
     * @tc.number SUB_BUILTINS_OBJECT23_TEST_11800
     * @tc.desc   test object isSealed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object23Test118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object23.Fn118_testUnsealedClassInstanceWithProp();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object23Test119
     * @tc.number SUB_BUILTINS_OBJECT23_TEST_11900
     * @tc.desc   test object isSealed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object23Test119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object23.Fn119_testSealedClassInstanceWithProp();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object23Test120
     * @tc.number SUB_BUILTINS_OBJECT23_TEST_12000
     * @tc.desc   test object isSealed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object23Test120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object23.Fn120_testUnsealedInheritedClassInstance();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object23Test121
     * @tc.number SUB_BUILTINS_OBJECT23_TEST_12100
     * @tc.desc   test object isSealed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object23Test121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object23.Fn121_testSealedInheritedClassInstance();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object23Test122
     * @tc.number SUB_BUILTINS_OBJECT23_TEST_12200
     * @tc.desc   test object isSealed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object23Test122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object23.Fn122_testSealedVsFrozen();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object23Test123
     * @tc.number SUB_BUILTINS_OBJECT23_TEST_12300
     * @tc.desc   test object isSealed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object23Test123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object23.Fn123_testSealedVsNonExtensible();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object23Test124
     * @tc.number SUB_BUILTINS_OBJECT23_TEST_12400
     * @tc.desc   test object isSealed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object23Test124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object23.Fn124_testUnsealedProxyForArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object23Test125
     * @tc.number SUB_BUILTINS_OBJECT23_TEST_12500
     * @tc.desc   test object isSealed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object23Test125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object23.Fn125_testSealedProxyForArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object23Test126
     * @tc.number SUB_BUILTINS_OBJECT23_TEST_12600
     * @tc.desc   test object isSealed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object23Test126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object23.Fn126_testUnsealedProxyForMap();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object23Test127
     * @tc.number SUB_BUILTINS_OBJECT23_TEST_12700
     * @tc.desc   test object isSealed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object23Test127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object23.Fn127_testSealedProxyForMap();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object23Test128
     * @tc.number SUB_BUILTINS_OBJECT23_TEST_12800
     * @tc.desc   test object isSealed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object23Test128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object23.Fn128_testUnsealedProxyForSet();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object23Test129
     * @tc.number SUB_BUILTINS_OBJECT23_TEST_12900
     * @tc.desc   test object isSealed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object23Test129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object23.Fn129_testSealedProxyForSet();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object23Test130
     * @tc.number SUB_BUILTINS_OBJECT23_TEST_13000
     * @tc.desc   test object isSealed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object23Test130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object23.Fn130_testUnsealedEmptyMap();
      expect(result).assertEqual(true);
    });
  })
}