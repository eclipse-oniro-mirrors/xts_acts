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
  Fn01_testDefaultObjectExtensible,
  Fn02_testPreventedObjectExtensible,
  Fn04_testNullPrototypeObjectExtensible,
  Fn06_testDefaultArrayExtensible,
  Fn07_testPreventedArrayExtensible,
  Fn08_testModifyArrAfterPreventExtensible,
  Fn09_testDefaultDateExtensible,
  Fn100_testMultiplePreventExtensionsOnObj,
  Fn103_testDefaultImageDataExtensible,
  Fn104_testPreventedImageDataExtensible,
  Fn105_testObjectHasOwnOnNonExtensibleObj,
  Fn106_testDefaultOffscreenCanvasExtensible,
  Fn107_testPreventedOffscreenCanvasExtensible,
  Fn108_testAddEnumerablePropToNonExtensibleObj,
  Fn10_testPreventedDateExtensible,
  Fn111_testModifyPropConfigOnNonExtensibleObj,
  Fn114_testJsonStringifyNonExtensibleObj,
  Fn117_testCallInheritedMethodOnNonExtensibleObj,
  Fn11_testDefaultRegExpExtensible,
  Fn120_testNonExtensibleObjAsFuncParam,
  Fn123_testGetOwnPropertyNamesOnNonExtensibleObj,
  Fn126_testAddNonEnumerablePropToNonExtensibleObj,
  Fn12_testPreventedRegExpExtensible,
  Fn132_testIsFrozenOnNonExtensibleObj,
  Fn135_testIsSealedOnNonExtensibleObj,
  Fn138_testNonExtensibleObjAsMapKey,
  Fn143_testGetOwnPropertySymbolsOnNonExtensibleObj,
  Fn146_testAddGetterToNonExtensibleObj,
  Fn147_testDefaultShareDataContainerExtensible,
  Fn148_testPreventedShareDataContainerExtensible,
  Fn149_testNonExtensibleObjAsSetElement,
  Fn14_testUndefinedParameter,
  Fn152_testReflectIsExtensibleOnNonExtensibleObj,
  Fn155_testDeletePropOnNonExtensibleObj,
  Fn156_testDefaultGeolocationPositionExtensible,
  Fn157_testPreventedGeolocationPositionExtensible,
  Fn158_testModifyNestedPropOnNonExtensibleObj,
  Fn15_testNullParameter,
  Fn163_testAssignSelfPropOnNonExtensibleObj,
  Fn166_testAddSetterToNonExtensibleObj,
  Fn169_testNonExtensibleObjAsWeakMapKey,
  Fn16_testFrozenObjectExtensible,
  Fn172_testReflectPreventExtensionsOnNonExtensibleObj,
  Fn175_testAddPropToProtoChainOfNonExtensibleObj,
  Fn17_testSealedObjectExtensible,
  Fn18_testDeletePropAfterPreventExtensible,
  Fn19_testNestedObjectExtensible,
  Fn20_testClassInstanceExtensible,
  Fn22_testDefaultMapExtensible,
  Fn23_testPreventedMapExtensible,
  Fn24_testDefaultSetExtensible,
  Fn25_testPreventedSetExtensible,
  Fn26_testDefaultWeakMapExtensible,
  Fn27_testPreventedWeakMapExtensible,
  Fn28_testDefaultWeakSetExtensible,
  Fn29_testPreventedWeakSetExtensible,
  Fn30_testDefaultFunctionExtensible,
  Fn31_testPreventedFunctionExtensible,
  Fn32_testDefaultArrowFuncExtensible,
  Fn33_testPreventedArrowFuncExtensible,
  Fn34_testDefaultPromiseExtensible,
  Fn35_testPreventedPromiseExtensible,
  Fn36_testDefaultGeneratorExtensible,
  Fn37_testPreventedGeneratorExtensible,
  Fn38_testDefaultTypedArrayExtensible,
  Fn39_testPreventedTypedArrayExtensible,
  Fn44_testInheritedFromNonExtensibleObj,
  Fn45_testChildPreventExtensibleAffectParent,
  Fn46_testDefinePropAfterPreventExtensible,
  Fn47_testDefaultClassProtoExtensible,
  Fn48_testPreventedClassProtoExtensible,
  Fn49_testExtendedBuiltInClassInstanceExtensible,
  Fn50_testPreventedExtendedBuiltInClassInstanceExtensible,
  Fn55_testDefaultArrayBufferExtensible,
  Fn56_testPreventedArrayBufferExtensible,
  Fn57_testDefaultDataViewExtensible,
  Fn58_testPreventedDataViewExtensible,
  Fn66_testAddAccessorPropOnNonExtensibleObj,
  Fn67_testDefaultClassStaticExtensible,
  Fn68_testPreventedClassStaticExtensible,
  Fn70_testDefaultProxyExtensible,
  Fn71_testPreventedProxyExtensible,
  Fn72_testProxyTargetNonExtensible,
  Fn76_testAddMapEntryAfterPreventExtensible,
  Fn77_testAddSetElementAfterPreventExtensible,
  Fn78_testNonExtensibleChildWithExtensibleProto,
  Fn79_testGetPropDescriptorsOnNonExtensibleObj,
  Fn80_testCrossGlobalObjectExtensible,
  Fn85_testObjectKeysOnNonExtensibleObj,
  Fn86_testObjectValuesOnNonExtensibleObj,
  Fn87_testObjectEntriesOnNonExtensibleObj,
  Fn88_testNonExtensibleChildWithNonExtensibleProto,
  Fn91_testSpreadNonExtensibleObj,
  Fn92_testAssignNonExtensibleAndExtensible,
  Fn93_testHasOwnPropertyOnNonExtensibleObj,
  Fn94_testIsPrototypeOfOnNonExtensibleObj,
  Fn95_testForInLoopOnNonExtensibleObj,
  Fn96_testGetPrototypeOfOnNonExtensibleObj,
  Fn98_testToStringOnNonExtensibleObj,
  Fn99_testValueOfOnNonExtensibleObj
} from './Object17';


function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}

export default function Object17Test() {
  describe('Object17Test', () => {
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
     * @tc.name   Object17Test001
     * @tc.number SUB_BUILTINS_Object17_TEST_0100
     * @tc.desc   test object create (direct and inherited property)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object17Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn01_testDefaultObjectExtensible();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object17Test002
     * @tc.number SUB_BUILTINS_Object17_TEST_0200
     * @tc.desc   test object create (null prototype)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object17Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn02_testPreventedObjectExtensible();
      expect(result).assertEqual(true);
    });


    /**
     * @tc.name   Object17Test004
     * @tc.number SUB_BUILTINS_Object17_TEST_0400
     * @tc.desc   test null prototype object extensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object17Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn04_testNullPrototypeObjectExtensible();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object17Test006
     * @tc.number SUB_BUILTINS_Object17_TEST_0600
     * @tc.desc   test default array extensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object17Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn06_testDefaultArrayExtensible();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object17Test007
     * @tc.number SUB_BUILTINS_Object17_TEST_0700
     * @tc.desc   test prevented array extensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object17Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn07_testPreventedArrayExtensible();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object17Test008
     * @tc.number SUB_BUILTINS_Object17_TEST_0800
     * @tc.desc   test modify array after prevent extensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object17Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      //是问题 node上为true
      let result = Fn08_testModifyArrAfterPreventExtensible();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object17Test009
     * @tc.number SUB_BUILTINS_Object17_TEST_0900
     * @tc.desc   test default date extensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object17Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      //是问题 node上为true
      let result = Fn09_testDefaultDateExtensible();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object17Test010
     * @tc.number SUB_BUILTINS_Object17_TEST_1000
     * @tc.desc   test prevented date extensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object17Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn10_testPreventedDateExtensible();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object17Test011
     * @tc.number SUB_BUILTINS_Object17_TEST_1100
     * @tc.desc   test default regexp extensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object17Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn11_testDefaultRegExpExtensible();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object17Test012
     * @tc.number SUB_BUILTINS_Object17_TEST_1200
     * @tc.desc   test prevented regexp extensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object17Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn12_testPreventedRegExpExtensible();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object17Test014
     * @tc.number SUB_BUILTINS_Object17_TEST_1400
     * @tc.desc   test undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object17Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn14_testUndefinedParameter();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object17Test015
     * @tc.number SUB_BUILTINS_Object17_TEST_1500
     * @tc.desc   test null parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object17Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn15_testNullParameter();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object17Test016
     * @tc.number SUB_BUILTINS_Object17_TEST_1600
     * @tc.desc   test frozen object extensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object17Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn16_testFrozenObjectExtensible();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object17Test017
     * @tc.number SUB_BUILTINS_Object17_TEST_1700
     * @tc.desc   test sealed object extensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object17Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn17_testSealedObjectExtensible();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object17Test018
     * @tc.number SUB_BUILTINS_Object17_TEST_1800
     * @tc.desc   test delete property after prevent extensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object17Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn18_testDeletePropAfterPreventExtensible();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object17Test019
     * @tc.number SUB_BUILTINS_Object17_TEST_1900
     * @tc.desc   test nested object extensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object17Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn19_testNestedObjectExtensible();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object17Test020
     * @tc.number SUB_BUILTINS_Object17_TEST_2000
     * @tc.desc   test class instance extensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object17Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn20_testClassInstanceExtensible();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object17Test022
     * @tc.number SUB_BUILTINS_Object17_TEST_2200
     * @tc.desc   test default map extensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object17Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn22_testDefaultMapExtensible();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object17Test023
     * @tc.number SUB_BUILTINS_Object17_TEST_2300
     * @tc.desc   test prevented map extensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object17Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn23_testPreventedMapExtensible();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object17Test024
     * @tc.number SUB_BUILTINS_Object17_TEST_2400
     * @tc.desc   test default set extensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object17Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn24_testDefaultSetExtensible();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object17Test025
     * @tc.number SUB_BUILTINS_Object17_TEST_2500
     * @tc.desc   test prevented set extensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object17Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn25_testPreventedSetExtensible();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object17Test026
     * @tc.number SUB_BUILTINS_Object17_TEST_2600
     * @tc.desc   test default weakmap extensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object17Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn26_testDefaultWeakMapExtensible();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object17Test027
     * @tc.number SUB_BUILTINS_Object17_TEST_2700
     * @tc.desc   test prevented weakmap extensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object17Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn27_testPreventedWeakMapExtensible();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object17Test028
     * @tc.number SUB_BUILTINS_Object17_TEST_2800
     * @tc.desc   test default weakset extensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object17Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn28_testDefaultWeakSetExtensible();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object17Test029
     * @tc.number SUB_BUILTINS_Object17_TEST_2900
     * @tc.desc   test prevented weakset extensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object17Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn29_testPreventedWeakSetExtensible();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object17Test030
     * @tc.number SUB_BUILTINS_Object17_TEST_3000
     * @tc.desc   test default function extensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object17Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn30_testDefaultFunctionExtensible();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name   Object17Test031
     * @tc.number SUB_BUILTINS_Object17_TEST_3100
     * @tc.desc   test prevented function extensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object17Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn31_testPreventedFunctionExtensible();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object17Test032
     * @tc.number SUB_BUILTINS_Object17_TEST_3200
     * @tc.desc   test default arrow function extensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object17Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn32_testDefaultArrowFuncExtensible();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object17Test033
     * @tc.number SUB_BUILTINS_Object17_TEST_3300
     * @tc.desc   test prevented arrow function extensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object17Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn33_testPreventedArrowFuncExtensible();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object17Test034
     * @tc.number SUB_BUILTINS_Object17_TEST_3400
     * @tc.desc   test default promise extensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object17Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn34_testDefaultPromiseExtensible();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object17Test035
     * @tc.number SUB_BUILTINS_Object17_TEST_3500
     * @tc.desc   test prevented promise extensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object17Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn35_testPreventedPromiseExtensible();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object17Test036
     * @tc.number SUB_BUILTINS_Object17_TEST_3600
     * @tc.desc   test default generator extensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object17Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn36_testDefaultGeneratorExtensible();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object17Test037
     * @tc.number SUB_BUILTINS_Object17_TEST_3700
     * @tc.desc   test prevented generator extensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object17Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn37_testPreventedGeneratorExtensible();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object17Test038
     * @tc.number SUB_BUILTINS_Object17_TEST_3800
     * @tc.desc   test default typed array extensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object17Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn38_testDefaultTypedArrayExtensible();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object17Test039
     * @tc.number SUB_BUILTINS_Object17_TEST_3900
     * @tc.desc   test prevented typed array extensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object17Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn39_testPreventedTypedArrayExtensible();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object17Test044
     * @tc.number SUB_BUILTINS_Object17_TEST_4400
     * @tc.desc   test inherited from non-extensible object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object17Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn44_testInheritedFromNonExtensibleObj();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object17Test045
     * @tc.number SUB_BUILTINS_Object17_TEST_4500
     * @tc.desc   test child prevent extensible affect parent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object17Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn45_testChildPreventExtensibleAffectParent();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object17Test046
     * @tc.number SUB_BUILTINS_Object17_TEST_4600
     * @tc.desc   test define property after prevent extensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object17Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn46_testDefinePropAfterPreventExtensible();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object17Test047
     * @tc.number SUB_BUILTINS_Object17_TEST_4700
     * @tc.desc   test default class prototype extensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object17Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn47_testDefaultClassProtoExtensible();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object17Test048
     * @tc.number SUB_BUILTINS_Object17_TEST_4800
     * @tc.desc   test prevented class prototype extensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object17Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn48_testPreventedClassProtoExtensible();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object17Test049
     * @tc.number SUB_BUILTINS_Object17_TEST_4900
     * @tc.desc   test extended built-in class instance extensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object17Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn49_testExtendedBuiltInClassInstanceExtensible();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object17Test050
     * @tc.number SUB_BUILTINS_Object17_TEST_5000
     * @tc.desc   test prevented extended built-in class instance extensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object17Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn50_testPreventedExtendedBuiltInClassInstanceExtensible();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object17Test055
     * @tc.number SUB_BUILTINS_Object17_TEST_5500
     * @tc.desc   test default array buffer extensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object17Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn55_testDefaultArrayBufferExtensible();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object17Test056
     * @tc.number SUB_BUILTINS_Object17_TEST_5600
     * @tc.desc   test prevented array buffer extensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object17Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn56_testPreventedArrayBufferExtensible();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object17Test057
     * @tc.number SUB_BUILTINS_Object17_TEST_5700
     * @tc.desc   test default data view extensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object17Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn57_testDefaultDataViewExtensible();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object17Test058
     * @tc.number SUB_BUILTINS_Object17_TEST_5800
     * @tc.desc   test prevented data view extensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object17Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn58_testPreventedDataViewExtensible();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object17Test066
     * @tc.number SUB_BUILTINS_Object17_TEST_6600
     * @tc.desc   test add accessor property on non-extensible object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object17Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn66_testAddAccessorPropOnNonExtensibleObj();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object17Test067
     * @tc.number SUB_BUILTINS_Object17_TEST_6700
     * @tc.desc   test default class static extensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object17Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn67_testDefaultClassStaticExtensible();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object17Test068
     * @tc.number SUB_BUILTINS_Object17_TEST_6800
     * @tc.desc   test prevented class static extensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object17Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn68_testPreventedClassStaticExtensible();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object17Test070
     * @tc.number SUB_BUILTINS_Object17_TEST_7000
     * @tc.desc   test default proxy extensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object17Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn70_testDefaultProxyExtensible();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object17Test071
     * @tc.number SUB_BUILTINS_Object17_TEST_7100
     * @tc.desc   test prevented proxy extensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object17Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn71_testPreventedProxyExtensible();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object17Test072
     * @tc.number SUB_BUILTINS_Object17_TEST_7200
     * @tc.desc   test proxy target non-extensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object17Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn72_testProxyTargetNonExtensible();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object17Test076
     * @tc.number SUB_BUILTINS_Object17_TEST_7600
     * @tc.desc   test add map entry after prevent extensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object17Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn76_testAddMapEntryAfterPreventExtensible();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object17Test077
     * @tc.number SUB_BUILTINS_Object17_TEST_7700
     * @tc.desc   test add set element after prevent extensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object17Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn77_testAddSetElementAfterPreventExtensible();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object17Test078
     * @tc.number SUB_BUILTINS_Object17_TEST_7800
     * @tc.desc   test non-extensible child with extensible prototype
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object17Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn78_testNonExtensibleChildWithExtensibleProto();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object17Test079
     * @tc.number SUB_BUILTINS_Object17_TEST_7900
     * @tc.desc   test get property descriptors on non-extensible object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object17Test079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn79_testGetPropDescriptorsOnNonExtensibleObj();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object17Test080
     * @tc.number SUB_BUILTINS_Object17_TEST_8000
     * @tc.desc   test cross global object extensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object17Test080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn80_testCrossGlobalObjectExtensible();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object17Test085
     * @tc.number SUB_BUILTINS_Object17_TEST_8500
     * @tc.desc   test object keys on non-extensible object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object17Test085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn85_testObjectKeysOnNonExtensibleObj();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object17Test086
     * @tc.number SUB_BUILTINS_Object17_TEST_8600
     * @tc.desc   test object values on non-extensible object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object17Test086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn86_testObjectValuesOnNonExtensibleObj();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object17Test087
     * @tc.number SUB_BUILTINS_Object17_TEST_8700
     * @tc.desc   test object entries on non-extensible object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object17Test087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn87_testObjectEntriesOnNonExtensibleObj();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object17Test088
     * @tc.number SUB_BUILTINS_Object17_TEST_8800
     * @tc.desc   test non-extensible child with non-extensible prototype
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object17Test088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn88_testNonExtensibleChildWithNonExtensibleProto();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object17Test091
     * @tc.number SUB_BUILTINS_Object17_TEST_9100
     * @tc.desc   test spread non-extensible object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object17Test091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn91_testSpreadNonExtensibleObj();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object17Test092
     * @tc.number SUB_BUILTINS_Object17_TEST_9200
     * @tc.desc   test assign non-extensible and extensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object17Test092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn92_testAssignNonExtensibleAndExtensible();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object17Test093
     * @tc.number SUB_BUILTINS_Object17_TEST_9300
     * @tc.desc   test has own property on non-extensible object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object17Test093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn93_testHasOwnPropertyOnNonExtensibleObj();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object17Test094
     * @tc.number SUB_BUILTINS_Object17_TEST_9400
     * @tc.desc   test is prototype of on non-extensible object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object17Test094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn94_testIsPrototypeOfOnNonExtensibleObj();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object17Test095
     * @tc.number SUB_BUILTINS_Object17_TEST_9500
     * @tc.desc   test for-in loop on non-extensible object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object17Test095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn95_testForInLoopOnNonExtensibleObj();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object17Test096
     * @tc.number SUB_BUILTINS_Object17_TEST_9600
     * @tc.desc   test get prototype of on non-extensible object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object17Test096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn96_testGetPrototypeOfOnNonExtensibleObj();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object17Test098
     * @tc.number SUB_BUILTINS_Object17_TEST_9800
     * @tc.desc   test to string on non-extensible object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object17Test098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn98_testToStringOnNonExtensibleObj();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object17Test099
     * @tc.number SUB_BUILTINS_Object17_TEST_9900
     * @tc.desc   test value of on non-extensible object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object17Test099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn99_testValueOfOnNonExtensibleObj();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object17Test100
     * @tc.number SUB_BUILTINS_Object17_TEST_10000
     * @tc.desc   test multiple prevent extensions on object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object17Test100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn100_testMultiplePreventExtensionsOnObj();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object17Test103
     * @tc.number SUB_BUILTINS_Object17_TEST_10300
     * @tc.desc   test default image data extensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object17Test103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn103_testDefaultImageDataExtensible();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object17Test104
     * @tc.number SUB_BUILTINS_Object17_TEST_10400
     * @tc.desc   test prevented image data extensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object17Test104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn104_testPreventedImageDataExtensible();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object17Test105
     * @tc.number SUB_BUILTINS_Object17_TEST_10500
     * @tc.desc   test object has own on non-extensible object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object17Test105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Fn105_testObjectHasOwnOnNonExtensibleObj();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object17Test106
     * @tc.number SUB_BUILTINS_Object17_TEST_10600
     * @tc.desc   test default offscreen canvas extensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object17Test106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn106_testDefaultOffscreenCanvasExtensible();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object17Test107
     * @tc.number SUB_BUILTINS_Object17_TEST_10700
     * @tc.desc   test prevented offscreen canvas extensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object17Test107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn107_testPreventedOffscreenCanvasExtensible();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object17Test108
     * @tc.number SUB_BUILTINS_Object17_TEST_10800
     * @tc.desc   test add enumerable property to non-extensible object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object17Test108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn108_testAddEnumerablePropToNonExtensibleObj();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object17Test111
     * @tc.number SUB_BUILTINS_Object17_TEST_11100
     * @tc.desc   test modify property config on non-extensible object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object17Test111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn111_testModifyPropConfigOnNonExtensibleObj();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object17Test114
     * @tc.number SUB_BUILTINS_Object17_TEST_11400
     * @tc.desc   test json stringify non-extensible object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object17Test114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn114_testJsonStringifyNonExtensibleObj();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object17Test117
     * @tc.number SUB_BUILTINS_Object17_TEST_11700
     * @tc.desc   test call inherited method on non-extensible object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object17Test117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn117_testCallInheritedMethodOnNonExtensibleObj();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object17Test120
     * @tc.number SUB_BUILTINS_Object17_TEST_12000
     * @tc.desc   test non-extensible object as function parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object17Test120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn120_testNonExtensibleObjAsFuncParam();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object17Test123
     * @tc.number SUB_BUILTINS_Object17_TEST_12300
     * @tc.desc   test get own property names on non-extensible object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object17Test123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn123_testGetOwnPropertyNamesOnNonExtensibleObj();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object17Test126
     * @tc.number SUB_BUILTINS_Object17_TEST_12600
     * @tc.desc   test add non-enumerable property to non-extensible object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object17Test126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn126_testAddNonEnumerablePropToNonExtensibleObj();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object17Test132
     * @tc.number SUB_BUILTINS_Object17_TEST_13200
     * @tc.desc   test isFrozen on non-extensible object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object17Test132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn132_testIsFrozenOnNonExtensibleObj();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object17Test135
     * @tc.number SUB_BUILTINS_Object17_TEST_13500
     * @tc.desc   test isSealed on non-extensible object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object17Test135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn135_testIsSealedOnNonExtensibleObj();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object17Test138
     * @tc.number SUB_BUILTINS_Object17_TEST_13800
     * @tc.desc   test non-extensible object as Map key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object17Test138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn138_testNonExtensibleObjAsMapKey();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object17Test143
     * @tc.number SUB_BUILTINS_Object17_TEST_14300
     * @tc.desc   test get own property symbols on non-extensible object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object17Test143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn143_testGetOwnPropertySymbolsOnNonExtensibleObj();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object17Test146
     * @tc.number SUB_BUILTINS_Object17_TEST_14600
     * @tc.desc   test add getter to non-extensible object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object17Test146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn146_testAddGetterToNonExtensibleObj();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object17Test147
     * @tc.number SUB_BUILTINS_Object17_TEST_14700
     * @tc.desc   test default ShareDataContainer extensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object17Test147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn147_testDefaultShareDataContainerExtensible();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object17Test148
     * @tc.number SUB_BUILTINS_Object17_TEST_14800
     * @tc.desc   test prevented ShareDataContainer extensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object17Test148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn148_testPreventedShareDataContainerExtensible();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object17Test149
     * @tc.number SUB_BUILTINS_Object17_TEST_14900
     * @tc.desc   test non-extensible object as Set element
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object17Test149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn149_testNonExtensibleObjAsSetElement();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object17Test152
     * @tc.number SUB_BUILTINS_Object17_TEST_15200
     * @tc.desc   test Reflect.isExtensible on non-extensible object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object17Test152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn152_testReflectIsExtensibleOnNonExtensibleObj();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object17Test155
     * @tc.number SUB_BUILTINS_Object17_TEST_15500
     * @tc.desc   test delete property on non-extensible object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object17Test155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn155_testDeletePropOnNonExtensibleObj();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object17Test156
     * @tc.number SUB_BUILTINS_Object17_TEST_15600
     * @tc.desc   test default GeolocationPosition extensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object17Test156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn156_testDefaultGeolocationPositionExtensible();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object17Test157
     * @tc.number SUB_BUILTINS_Object17_TEST_15700
     * @tc.desc   test prevented GeolocationPosition extensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object17Test157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn157_testPreventedGeolocationPositionExtensible();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object17Test158
     * @tc.number SUB_BUILTINS_Object17_TEST_15800
     * @tc.desc   test modify nested property on non-extensible object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object17Test158', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn158_testModifyNestedPropOnNonExtensibleObj();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object17Test163
     * @tc.number SUB_BUILTINS_Object17_TEST_16300
     * @tc.desc   test assign self property on non-extensible object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object17Test163', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn163_testAssignSelfPropOnNonExtensibleObj();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object17Test166
     * @tc.number SUB_BUILTINS_Object17_TEST_16600
     * @tc.desc   test add setter to non-extensible object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object17Test166', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn166_testAddSetterToNonExtensibleObj();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object17Test169
     * @tc.number SUB_BUILTINS_Object17_TEST_16900
     * @tc.desc   test non-extensible object as WeakMap key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object17Test169', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn169_testNonExtensibleObjAsWeakMapKey();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object17Test172
     * @tc.number SUB_BUILTINS_Object17_TEST_17200
     * @tc.desc   test Reflect.preventExtensions on non-extensible object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object17Test172', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn172_testReflectPreventExtensionsOnNonExtensibleObj();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object17Test175
     * @tc.number SUB_BUILTINS_Object17_TEST_17500
     * @tc.desc   test add property to prototype chain of non-extensible object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object17Test175', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn175_testAddPropToProtoChainOfNonExtensibleObj();
      expect(result).assertEqual(true);
    });

  })
}