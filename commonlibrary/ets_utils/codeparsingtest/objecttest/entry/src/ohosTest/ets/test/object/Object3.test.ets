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
  Fn10_testHasOwnDistinguishProp,
  Fn12_testPropertiesObjectIsUndefined,
  Fn13_testProtoIsArray,
  Fn15_testProtoUpdateAffectsInstance,
  Fn16_testDefaultEnumerableInProperties,
  Fn1_testMultiLevelInheritance,
  Fn22_testDuplicatePropInProperties,
  Fn24_testCompareWithSetPrototypeOf,
  Fn25_testInvalidPropDescriptorThrows,
  Fn26_testBasicPrototypeInheritance,
  Fn27_testWithPropertiesDescriptor,
  Fn28_testInvalidProtoThrowsTypeError,
  Fn29_testCreateWithNullProto,
  Fn2_testOwnPropOverridesProto,
  Fn30_testImitateNewOperator,
  Fn33_testAccessorGetBindProtoContext,
  Fn34_testAccessorSetModifyProtoProp,
  Fn35_testProtoIsClassInstance,
  Fn36_testProtoIsClassPrototype,
  Fn37_testValueAndGetInDescriptorThrows,
  Fn38_testNullProtoHasNoConstructor,
  Fn39_testProtoConstructorChangeAffectsInstance,
  Fn3_testNonEnumerableOwnProp,
  Fn40_testEmptyPropertiesObject,
  Fn42_testDefinePropOnCreatedObj,
  Fn43_testDeepProtoUpdateAffectsInstance,
  Fn44_testEnumerablePropInForIn,
  Fn45_testNonEnumerablePropNotInForIn,
  Fn47_testCreateAndGetPrototypeOf,
  Fn48_testNonConfigurablePropCannotModifyDesc,
  Fn49_testProtoIsError,
  Fn50_testBatchCreateSameProto,
  Fn53_testAccessorGetDependsOwnProp,
  Fn54_testAccessorSetValidateInput,
  Fn57_testDescriptorValueIsUndefined,
  Fn58_testDescriptorValueIsNull,
  Fn59_testFrozenProtoCannotModifyOwnProp,
  Fn60_testSealedProtoCannotDeleteOwnProp,
  Fn61_testAssignPropToCreatedObj,
  Fn64_testNonEnumerablePropCanBecomeEnumerable,
  Fn65_testProtoCannotInheritStaticProp,
  Fn66_testCreatedObjAsProto,
  Fn67_testProtoIsErrorSubclass,
  Fn68_testConfigurablePropCanRedefine,
  Fn6_testAccessorPropInProperties,
  Fn71_testCreatedObjOwnPropInKeys,
  Fn73_testAccessorOverridesDataProp,
  Fn74_testProtoChainEndsWithNull,
  Fn75_testDestructureOwnPropFromCreatedObj,
  Fn77_testNonConfigurableCannotBecomeConfigurable,
  Fn78_testModifyProtoReferenceProp,
  Fn79_testCreatedObjOwnPropInValues,
  Fn7_testInheritFromFrozenProto,
  Fn83_testSetAndValueInDescriptorThrows,
  Fn85_testCreatedObjOwnPropInEntries,
  Fn86_testProtoIsErrorPrototype,
  Fn87_testArrowFuncGetBindsGlobal,
  Fn8_testInheritFromSealedProto,
  Fn91_testConfigurablePropCanModifyValue,
  Fn93_testProtoChainDiffWithLiteralObj,
  Fn95_testEnumerablePropForOfTraversal,
  Fn97_testGetOwnDescriptorsOnCreatedObj,
  Fn99_testArrowFuncSetBindsGlobal,
  Fn9_testAddNewOwnPropToCreatedObj
} from './Object3';

function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}


export default function Object3Test() {
  describe('Object3Test', () => {
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
     * @tc.name   Object3Test001
     * @tc.number SUB_BUILTINS_OBJECT3_TEST_0100
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object3Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn1_testMultiLevelInheritance();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object3Test002
     * @tc.number SUB_BUILTINS_Object3_TEST_0200
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object3Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn2_testOwnPropOverridesProto();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object3Test003
     * @tc.number SUB_BUILTINS_Object3_TEST_0300
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object3Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn3_testNonEnumerableOwnProp();
      expect(result).assertEqual(true);
    });


    /**
     * @tc.name   Object3Test006
     * @tc.number SUB_BUILTINS_Object3_TEST_0600
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object3Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn6_testAccessorPropInProperties();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object3Test007
     * @tc.number SUB_BUILTINS_Object3_TEST_0700
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object3Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn7_testInheritFromFrozenProto();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object3Test008
     * @tc.number SUB_BUILTINS_Object3_TEST_0800
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object3Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn8_testInheritFromSealedProto();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object3Test009
     * @tc.number SUB_BUILTINS_Object3_TEST_0900
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object3Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn9_testAddNewOwnPropToCreatedObj();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object3Test010
     * @tc.number SUB_BUILTINS_Object3_TEST_1000
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object3Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn10_testHasOwnDistinguishProp();
      expect(result).assertEqual(true);
    });


    /**
     * @tc.name   Object3Test012
     * @tc.number SUB_BUILTINS_Object3_TEST_1200
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object3Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn12_testPropertiesObjectIsUndefined();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object3Test013
     * @tc.number SUB_BUILTINS_Object3_TEST_1300
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object3Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn13_testProtoIsArray();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   Object3Test015
     * @tc.number SUB_BUILTINS_Object3_TEST_1500
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object3Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn15_testProtoUpdateAffectsInstance();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object3Test016
     * @tc.number SUB_BUILTINS_Object3_TEST_1600
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object3Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn16_testDefaultEnumerableInProperties();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object3Test022
     * @tc.number SUB_BUILTINS_Object3_TEST_2200
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object3Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn22_testDuplicatePropInProperties();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object3Test024
     * @tc.number SUB_BUILTINS_Object3_TEST_2400
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object3Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn24_testCompareWithSetPrototypeOf();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object3Test025
     * @tc.number SUB_BUILTINS_Object3_TEST_2500
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object3Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn25_testInvalidPropDescriptorThrows();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   Object3Test026
     * @tc.number SUB_BUILTINS_Object3_TEST_2600
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object3Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn26_testBasicPrototypeInheritance();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object3Test027
     * @tc.number SUB_BUILTINS_Object3_TEST_2700
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object3Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn27_testWithPropertiesDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object3Test028
     * @tc.number SUB_BUILTINS_Object3_TEST_2800
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object3Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn28_testInvalidProtoThrowsTypeError();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object3Test029
     * @tc.number SUB_BUILTINS_Object3_TEST_2900
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object3Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn29_testCreateWithNullProto();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object3Test030
     * @tc.number SUB_BUILTINS_Object3_TEST_3000
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object3Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn30_testImitateNewOperator();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object3Test033
     * @tc.number SUB_BUILTINS_Object3_TEST_3300
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object3Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn33_testAccessorGetBindProtoContext();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object3Test034
     * @tc.number SUB_BUILTINS_Object3_TEST_3400
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object3Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn34_testAccessorSetModifyProtoProp();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   Object3Test035
     * @tc.number SUB_BUILTINS_Object3_TEST_3500
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object3Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn35_testProtoIsClassInstance();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object3Test036
     * @tc.number SUB_BUILTINS_Object3_TEST_3600
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object3Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn36_testProtoIsClassPrototype();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object3Test037
     * @tc.number SUB_BUILTINS_Object3_TEST_3700
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object3Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn37_testValueAndGetInDescriptorThrows();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object3Test038
     * @tc.number SUB_BUILTINS_Object3_TEST_3800
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object3Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn38_testNullProtoHasNoConstructor();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name   Object3Test039
     * @tc.number SUB_BUILTINS_Object3_TEST_3900
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object3Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn39_testProtoConstructorChangeAffectsInstance();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object3Test040
     * @tc.number SUB_BUILTINS_Object3_TEST_4000
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object3Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn40_testEmptyPropertiesObject();
      expect(result).assertEqual(true);
    });


    /**
     * @tc.name   Object3Test042
     * @tc.number SUB_BUILTINS_Object3_TEST_4200
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object3Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn42_testDefinePropOnCreatedObj();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object3Test043
     * @tc.number SUB_BUILTINS_Object3_TEST_4300
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object3Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn43_testDeepProtoUpdateAffectsInstance();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object3Test044
     * @tc.number SUB_BUILTINS_Object3_TEST_4400
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object3Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn44_testEnumerablePropInForIn();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object3Test045
     * @tc.number SUB_BUILTINS_Object3_TEST_4500
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object3Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn45_testNonEnumerablePropNotInForIn();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object3Test047
     * @tc.number SUB_BUILTINS_Object3_TEST_4700
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object3Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn47_testCreateAndGetPrototypeOf();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object3Test048
     * @tc.number SUB_BUILTINS_Object3_TEST_4800
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object3Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn48_testNonConfigurablePropCannotModifyDesc();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object3Test049
     * @tc.number SUB_BUILTINS_Object3_TEST_4900
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object3Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn49_testProtoIsError();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object3Test050
     * @tc.number SUB_BUILTINS_Object3_TEST_5000
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object3Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn50_testBatchCreateSameProto();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object3Test053
     * @tc.number SUB_BUILTINS_Object3_TEST_5300
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object3Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn53_testAccessorGetDependsOwnProp();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name   Object3Test054
     * @tc.number SUB_BUILTINS_Object3_TEST_5400
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object3Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn54_testAccessorSetValidateInput();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object3Test057
     * @tc.number SUB_BUILTINS_Object3_TEST_5700
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object3Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn57_testDescriptorValueIsUndefined();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object3Test058
     * @tc.number SUB_BUILTINS_Object3_TEST_5800
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object3Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn58_testDescriptorValueIsNull();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object3Test059
     * @tc.number SUB_BUILTINS_Object3_TEST_5900
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object3Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn59_testFrozenProtoCannotModifyOwnProp();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object3Test060
     * @tc.number SUB_BUILTINS_Object3_TEST_6000
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object3Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn60_testSealedProtoCannotDeleteOwnProp();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object3Test061
     * @tc.number SUB_BUILTINS_Object3_TEST_6100
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object3Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn61_testAssignPropToCreatedObj();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object3Test064
     * @tc.number SUB_BUILTINS_Object3_TEST_6400
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object3Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn64_testNonEnumerablePropCanBecomeEnumerable();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object3Test065
     * @tc.number SUB_BUILTINS_Object3_TEST_6500
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object3Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn65_testProtoCannotInheritStaticProp();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object3Test066
     * @tc.number SUB_BUILTINS_Object3_TEST_6600
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object3Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn66_testCreatedObjAsProto();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object3Test067
     * @tc.number SUB_BUILTINS_Object3_TEST_6700
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object3Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn67_testProtoIsErrorSubclass();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object3Test068
     * @tc.number SUB_BUILTINS_Object3_TEST_6800
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object3Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn68_testConfigurablePropCanRedefine();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object3Test071
     * @tc.number SUB_BUILTINS_Object3_TEST_7100
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object3Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn71_testCreatedObjOwnPropInKeys();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object3Test073
     * @tc.number SUB_BUILTINS_Object3_TEST_7300
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object3Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn73_testAccessorOverridesDataProp();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object3Test074
     * @tc.number SUB_BUILTINS_Object3_TEST_7400
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object3Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn74_testProtoChainEndsWithNull();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object3Test075
     * @tc.number SUB_BUILTINS_Object3_TEST_7500
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object3Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn75_testDestructureOwnPropFromCreatedObj();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object3Test077
     * @tc.number SUB_BUILTINS_Object3_TEST_7700
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object3Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn77_testNonConfigurableCannotBecomeConfigurable();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object3Test078
     * @tc.number SUB_BUILTINS_Object3_TEST_7800
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object3Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn78_testModifyProtoReferenceProp();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object3Test079
     * @tc.number SUB_BUILTINS_Object3_TEST_7900
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object3Test079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn79_testCreatedObjOwnPropInValues();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object3Test083
     * @tc.number SUB_BUILTINS_Object3_TEST_8300
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object3Test083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn83_testSetAndValueInDescriptorThrows();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object3Test085
     * @tc.number SUB_BUILTINS_Object3_TEST_8500
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object3Test085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn85_testCreatedObjOwnPropInEntries();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object3Test086
     * @tc.number SUB_BUILTINS_Object3_TEST_8600
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object3Test086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn86_testProtoIsErrorPrototype();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object3Test087
     * @tc.number SUB_BUILTINS_Object3_TEST_8700
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object3Test087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn87_testArrowFuncGetBindsGlobal();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   Object3Test091
     * @tc.number SUB_BUILTINS_Object3_TEST_9100
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object3Test091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn91_testConfigurablePropCanModifyValue();
      expect(result).assertEqual(true);
    });


    /**
     * @tc.name   Object3Test093
     * @tc.number SUB_BUILTINS_Object3_TEST_9300
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object3Test093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn93_testProtoChainDiffWithLiteralObj();
      expect(result).assertEqual(true);
    });


    /**
     * @tc.name   Object3Test095
     * @tc.number SUB_BUILTINS_Object3_TEST_9500
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object3Test095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn95_testEnumerablePropForOfTraversal();
      expect(result).assertEqual(true);
    });


    /**
     * @tc.name   Object3Test097
     * @tc.number SUB_BUILTINS_Object3_TEST_9700
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object3Test097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn97_testGetOwnDescriptorsOnCreatedObj();
      expect(result).assertEqual(true);
    });


    /**
     * @tc.name   Object3Test099
     * @tc.number SUB_BUILTINS_Object3_TEST_9900
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object3Test099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn99_testArrowFuncSetBindsGlobal();
      expect(result).assertEqual(false);
    });
  })
}