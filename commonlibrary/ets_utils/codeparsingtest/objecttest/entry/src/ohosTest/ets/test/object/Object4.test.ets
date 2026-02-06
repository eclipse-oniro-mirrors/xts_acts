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
  Fn02_testModifyExistingAccessorProperties,
  Fn03_testMixedConfigAndConflictCheck,
  Fn04_testNonConfigurableCannotChangeEnumerable,
  Fn06_testAccessorGetterThisBinding,
  Fn07_testAccessorSetterParameter,
  Fn08_testDefineMultipleAccessors,
  Fn09_testNonEnumerableNotInObjectKeys,
  Fn100_testAccessorGetterNoInfiniteLoop,
  Fn102_testDefinePropWithPromiseValue,
  Fn103_testNonConfigurableAccessorSetterCannotOverride,
  Fn104_testDefinePropsWithOneInvalidDescriptor,
  Fn105_testNonEnumerablePropNotInDestructuring,
  Fn107_testDefinePropsPriorityOverPrototype,
  Fn108_testAccessorSetterCallGetter,
  Fn109_testDefinePropWithSymbolForKey,
  Fn110_testNonConfigurableCannotModifyAnyDescriptor,
  Fn111_testDefinePropWithArrayBufferValue,
  Fn112_testAccessorGetterReturnFunction,
  Fn113_testDefineEnumerableNonEnumerableSymbolProps,
  Fn114_testNonWritableDatePropMethodCall,
  Fn115_testDefinePropsOnTypedArray,
  Fn116_testAccessorSetterReceiveEmptyString,
  Fn117_testDefinePropWithNumberStringKey,
  Fn11_testConfigurableNonWritableCanChangeValue,
  Fn120_testAccessorGetterDependMultipleProps,
  Fn121_testDefinePropsOnErrorObject,
  Fn122_testNonWritableMapPropMethodCall,
  Fn123_testDefinePropWithSpecialSymbolKey,
  Fn124_testAccessorSetterThrowErrorNoStateChange,
  Fn125_testDefinePropWithSetIterator,
  Fn126_testNonConfigurableCannotSetEnumerableFalse,
  Fn127_testDefinePropsOnGenerator,
  Fn128_testAccessorGetterReturnSymbol,
  Fn129_testDefinePropsOnWeakMapKey,
  Fn130_testNonWritableArrayBufferPropView,
  Fn131_testConfigurableToFalseCannotRevert,
  Fn133_testNonConfigurableAccessorCannotChangeEnumerable,
  Fn134_testDefinePropsWithPartialDescriptors,
  Fn135_testEnumerablePropCopiedInObjectAssign,
  Fn136_testNonWritableWeakSetPropMethodCall,
  Fn137_testDefinePropsOnClassPrototype,
  Fn138_testAccessorSetterReceiveBoolean,
  Fn139_testDefinePropWithSymbolIteratorKey,
  Fn140_testNonConfigurableCannotModifyViaGetDescriptors,
  Fn142_testAccessorGetterReturnBigInt,
  Fn143_testDefineEnumerableNonEnumerableAccessors,
  Fn146_testAccessorSetterModifySelfThrowError,
  Fn147_testDefinePropWithUnicodeKey,
  Fn148_testNonConfigurableGeneratorPropMethodCall,
  Fn14_testEmptyDescriptorDefaultConfig,
  Fn150_testAccessorGetterDependNestedProp,
  Fn17_testPropertiesNotAffectPrototype,
  Fn18_testNonEnumerableNotInForIn,
  Fn19_testSetterWithoutParameter,
  Fn20_testDefineSymbolProperty,
  Fn21_testNonConfigurableCannotChangeToAccessor,
  Fn22_testConfigurableAccessorCanChangeToData,
  Fn23_testDefineComputedPropertyName,
  Fn24_testNonConfigurableAccessorCannotChangeGetter,
  Fn25_testConfigurableAccessorCanChangeSetter,
  Fn26_testPropertiesDoNotInheritEnumerable,
  Fn27_testDefinePropsOnEmptyObject,
  Fn29_testAccessorGetterReturnUndefined,
  Fn30_testNonEnumerableSymbolPropNotInGetOwnSymbols,
  Fn31_testNonConfigurableCannotSetWritableTrue,
  Fn33_testDefinePropsWithMultipleValueTypes,
  Fn34_testAccessorSetterReceiveUndefined,
  Fn35_testPropsRecognizedByObjectHasOwn,
  Fn37_testNoConflictBetweenAccessorAndData,
  Fn38_testDefinePropWithNullValue,
  Fn39_testAccessorGetterSyncWithDependentProp,
  Fn41_testNonConfigurableAccessorCannotChangeSetter,
  Fn42_testConfigurableDataCanChangeToAccessor,
  Fn43_testDefinePropWithArrayValue,
  Fn44_testEnumerablePropInStringify,
  Fn45_testNonWritablePropNoErrorInNonStrict,
  Fn47_testAccessorGetterCallOtherMethod,
  Fn48_testDefinePropWithFunctionValue,
  Fn49_testNonConfigurableCannotSetConfigurableTrue,
  Fn50_testConfigurableCanSetConfigurableFalse,
  Fn51_testDefinePropWithObjectValue,
  Fn52_testAccessorSetterModifyOtherProp,
  Fn53_testNonEnumerablePropNotInObjectValues,
  Fn54_testPropsOnPrototypeChainAccess,
  Fn55_testNonWritablePropErrorInStrict,
  Fn56_testDefineEmptyDescriptorProps,
  Fn57_testAccessorGetterReturnObjectRef,
  Fn58_testDefinePropWithSpecialCharKey,
  Fn60_testDefineAccessorAndDataNoConflict,
  Fn61_testConfigurableAccessorChangeBothGetterSetter,
  Fn62_testDefinePropWithBigIntValue,
  Fn63_testNonEnumerablePropNotInObjectEntries,
  Fn64_testNonConfigurableCannotBecomeConfigurable,
  Fn65_testDefinePropWithSymbolValue,
  Fn66_testAccessorSetterTypeCheck,
  Fn67_testDefineEnumerableAndNonEnumerableTogether,
  Fn69_testDefinePropsOnClassInstance,
  Fn70_testAccessorGetterThrowError,
  Fn71_testDefinePropWithRegExpValue,
  Fn72_testConfigurablePropChangeEnumerable,
  Fn73_testDefinePropWithNumberKey,
  Fn74_testAccessorSetterThrowError,
  Fn75_testDefinePropWithMapValue,
  Fn76_testNonConfigurableCannotSetEnumerableTrue,
  Fn77_testDefinePropWithSetValue,
  Fn78_testAccessorGetterDependPrototype,
  Fn79_testDefinePropsOnFrozenObject,
  Fn80_testAccessorSetterModifyPrototype,
  Fn81_testAccessorToDataPropInvalidateAccessor,
  Fn82_testDefinePropWithDateValue,
  Fn83_testNonConfigurableAccessorGetterCannotOverride,
  Fn84_testMultipleAccessorsWithDependency,
  Fn85_testEnumerableSymbolInGetOwnSymbols,
  Fn87_testDefinePropsOnSealedObject,
  Fn88_testAccessorSetterReceiveNull,
  Fn89_testDefinePropWithTemplateKey,
  Fn90_testNonConfigurableCannotSetWritableFalse,
  Fn91_testDefinePropWithWeakMapValue,
  Fn92_testAccessorGetterUndefinedHasOwn,
  Fn95_testDefinePropsOnProxy,
  Fn96_testSetterWithoutParamNoSideEffect,
  Fn97_testDefinePropWithWeakSetValue,
  Fn98_testNonConfigurableAccessorCannotChangeToData,
  Fn99_testDefinePropWithChineseKey
} from './Object4';

function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}


export default function Object4Test() {
  describe('Object4Test', () => {
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
     * @tc.name   Object4Test002
     * @tc.number SUB_BUILTINS_OBJECT4_TEST_0200
     * @tc.desc   test modify existing accessor properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object4Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn02_testModifyExistingAccessorProperties();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object4Test003
     * @tc.number SUB_BUILTINS_OBJECT4_TEST_0300
     * @tc.desc   test mixed config and conflict check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object4Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn03_testMixedConfigAndConflictCheck();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object4Test004
     * @tc.number SUB_BUILTINS_OBJECT4_TEST_0400
     * @tc.desc   test non-configurable cannot change enumerable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object4Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn04_testNonConfigurableCannotChangeEnumerable();
      expect(result).assertEqual(true);
    });


    /**
     * @tc.name   Object4Test006
     * @tc.number SUB_BUILTINS_OBJECT4_TEST_0600
     * @tc.desc   test accessor getter this binding
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object4Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn06_testAccessorGetterThisBinding();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object4Test007
     * @tc.number SUB_BUILTINS_OBJECT4_TEST_0700
     * @tc.desc   test accessor setter parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object4Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn07_testAccessorSetterParameter();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object4Test008
     * @tc.number SUB_BUILTINS_OBJECT4_TEST_0800
     * @tc.desc   test define multiple accessors
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object4Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn08_testDefineMultipleAccessors();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object4Test009
     * @tc.number SUB_BUILTINS_OBJECT4_TEST_0900
     * @tc.desc   test non-enumerable not in object keys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object4Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn09_testNonEnumerableNotInObjectKeys();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object4Test011
     * @tc.number SUB_BUILTINS_OBJECT4_TEST_1100
     * @tc.desc   test configurable non-writable can change value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object4Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn11_testConfigurableNonWritableCanChangeValue();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object4Test014
     * @tc.number SUB_BUILTINS_OBJECT4_TEST_1400
     * @tc.desc   test empty descriptor default config
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object4Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn14_testEmptyDescriptorDefaultConfig();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object4Test017
     * @tc.number SUB_BUILTINS_OBJECT4_TEST_1700
     * @tc.desc   test properties not affect prototype
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object4Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn17_testPropertiesNotAffectPrototype();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object4Test018
     * @tc.number SUB_BUILTINS_OBJECT4_TEST_1800
     * @tc.desc   test non-enumerable not in for-in
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object4Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn18_testNonEnumerableNotInForIn();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object4Test019
     * @tc.number SUB_BUILTINS_OBJECT4_TEST_1900
     * @tc.desc   test setter without parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object4Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn19_testSetterWithoutParameter();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object4Test020
     * @tc.number SUB_BUILTINS_OBJECT4_TEST_2000
     * @tc.desc   test define symbol property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object4Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn20_testDefineSymbolProperty();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name   Object4Test021
     * @tc.number SUB_BUILTINS_OBJECT4_TEST_2100
     * @tc.desc   test non-configurable cannot change to accessor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object4Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn21_testNonConfigurableCannotChangeToAccessor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object4Test022
     * @tc.number SUB_BUILTINS_OBJECT4_TEST_2200
     * @tc.desc   test configurable accessor can change to data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object4Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn22_testConfigurableAccessorCanChangeToData();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object4Test023
     * @tc.number SUB_BUILTINS_OBJECT4_TEST_2300
     * @tc.desc   test define computed property name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object4Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn23_testDefineComputedPropertyName();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object4Test024
     * @tc.number SUB_BUILTINS_OBJECT4_TEST_2400
     * @tc.desc   test non-configurable accessor cannot change getter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object4Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn24_testNonConfigurableAccessorCannotChangeGetter();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object4Test025
     * @tc.number SUB_BUILTINS_OBJECT4_TEST_2500
     * @tc.desc   test configurable accessor can change setter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object4Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn25_testConfigurableAccessorCanChangeSetter();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object4Test026
     * @tc.number SUB_BUILTINS_OBJECT4_TEST_2600
     * @tc.desc   test properties do not inherit enumerable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object4Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn26_testPropertiesDoNotInheritEnumerable();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object4Test027
     * @tc.number SUB_BUILTINS_OBJECT4_TEST_2700
     * @tc.desc   test define props on empty object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object4Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn27_testDefinePropsOnEmptyObject();
      expect(result).assertEqual(true);
    });


    /**
     * @tc.name   Object4Test029
     * @tc.number SUB_BUILTINS_OBJECT4_TEST_2900
     * @tc.desc   test accessor getter return undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object4Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn29_testAccessorGetterReturnUndefined();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object4Test030
     * @tc.number SUB_BUILTINS_OBJECT4_TEST_3000
     * @tc.desc   test non-enumerable symbol prop not in get own symbols
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object4Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn30_testNonEnumerableSymbolPropNotInGetOwnSymbols();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object4Test031
     * @tc.number SUB_BUILTINS_OBJECT4_TEST_3100
     * @tc.desc   test non-configurable cannot set writable true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object4Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn31_testNonConfigurableCannotSetWritableTrue();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object4Test033
     * @tc.number SUB_BUILTINS_OBJECT4_TEST_3300
     * @tc.desc   test define props with multiple value types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object4Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn33_testDefinePropsWithMultipleValueTypes();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object4Test034
     * @tc.number SUB_BUILTINS_OBJECT4_TEST_3400
     * @tc.desc   test accessor setter receive undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object4Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn34_testAccessorSetterReceiveUndefined();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object4Test035
     * @tc.number SUB_BUILTINS_OBJECT4_TEST_3500
     * @tc.desc   test props recognized by object has own
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object4Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Fn35_testPropsRecognizedByObjectHasOwn();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   Object4Test037
     * @tc.number SUB_BUILTINS_OBJECT4_TEST_3700
     * @tc.desc   test no conflict between accessor and data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object4Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn37_testNoConflictBetweenAccessorAndData();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object4Test038
     * @tc.number SUB_BUILTINS_OBJECT4_TEST_3800
     * @tc.desc   test define prop with null value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object4Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn38_testDefinePropWithNullValue();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object4Test039
     * @tc.number SUB_BUILTINS_OBJECT4_TEST_3900
     * @tc.desc   test accessor getter sync with dependent prop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object4Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn39_testAccessorGetterSyncWithDependentProp();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object4Test041
     * @tc.number SUB_BUILTINS_OBJECT4_TEST_4100
     * @tc.desc   test non-configurable accessor cannot change setter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object4Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn41_testNonConfigurableAccessorCannotChangeSetter();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object4Test042
     * @tc.number SUB_BUILTINS_OBJECT4_TEST_4200
     * @tc.desc   test configurable data can change to accessor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object4Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn42_testConfigurableDataCanChangeToAccessor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object4Test043
     * @tc.number SUB_BUILTINS_OBJECT4_TEST_4300
     * @tc.desc   test define prop with array value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object4Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn43_testDefinePropWithArrayValue();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object4Test044
     * @tc.number SUB_BUILTINS_OBJECT4_TEST_4400
     * @tc.desc   test enumerable prop in stringify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object4Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn44_testEnumerablePropInStringify();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object4Test045
     * @tc.number SUB_BUILTINS_OBJECT4_TEST_4500
     * @tc.desc   test non-writable prop no error in non-strict
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object4Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn45_testNonWritablePropNoErrorInNonStrict();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   Object4Test047
     * @tc.number SUB_BUILTINS_OBJECT4_TEST_4700
     * @tc.desc   test accessor getter call other method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object4Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn47_testAccessorGetterCallOtherMethod();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object4Test048
     * @tc.number SUB_BUILTINS_OBJECT4_TEST_4800
     * @tc.desc   test define prop with function value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object4Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn48_testDefinePropWithFunctionValue();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object4Test049
     * @tc.number SUB_BUILTINS_OBJECT4_TEST_4900
     * @tc.desc   test non-configurable cannot set configurable true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object4Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn49_testNonConfigurableCannotSetConfigurableTrue();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object4Test050
     * @tc.number SUB_BUILTINS_OBJECT4_TEST_5000
     * @tc.desc   test configurable can set configurable false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object4Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn50_testConfigurableCanSetConfigurableFalse();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name   Object4Test051
     * @tc.number SUB_BUILTINS_OBJECT4_TEST_5100
     * @tc.desc   test define prop with object value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object4Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn51_testDefinePropWithObjectValue();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object4Test052
     * @tc.number SUB_BUILTINS_OBJECT4_TEST_5200
     * @tc.desc   test accessor setter modify other prop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object4Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn52_testAccessorSetterModifyOtherProp();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object4Test053
     * @tc.number SUB_BUILTINS_OBJECT4_TEST_5300
     * @tc.desc   test non-enumerable prop not in object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object4Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn53_testNonEnumerablePropNotInObjectValues();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object4Test054
     * @tc.number SUB_BUILTINS_OBJECT4_TEST_5400
     * @tc.desc   test props on prototype chain access
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object4Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn54_testPropsOnPrototypeChainAccess();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object4Test055
     * @tc.number SUB_BUILTINS_OBJECT4_TEST_5500
     * @tc.desc   test non-writable prop error in strict
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object4Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn55_testNonWritablePropErrorInStrict();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object4Test056
     * @tc.number SUB_BUILTINS_OBJECT4_TEST_5600
     * @tc.desc   test define empty descriptor props
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object4Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn56_testDefineEmptyDescriptorProps();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object4Test057
     * @tc.number SUB_BUILTINS_OBJECT4_TEST_5700
     * @tc.desc   test accessor getter return object ref
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object4Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn57_testAccessorGetterReturnObjectRef();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object4Test058
     * @tc.number SUB_BUILTINS_OBJECT4_TEST_5800
     * @tc.desc   test define prop with special char key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object4Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn58_testDefinePropWithSpecialCharKey();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object4Test060
     * @tc.number SUB_BUILTINS_OBJECT4_TEST_6000
     * @tc.desc   test define accessor and data no conflict
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object4Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn60_testDefineAccessorAndDataNoConflict();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object4Test061
     * @tc.number SUB_BUILTINS_OBJECT4_TEST_6100
     * @tc.desc   test configurable accessor change both getter setter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object4Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn61_testConfigurableAccessorChangeBothGetterSetter();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object4Test062
     * @tc.number SUB_BUILTINS_OBJECT4_TEST_6200
     * @tc.desc   test define prop with bigint value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object4Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn62_testDefinePropWithBigIntValue();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object4Test063
     * @tc.number SUB_BUILTINS_OBJECT4_TEST_6300
     * @tc.desc   test non-enumerable prop not in object entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object4Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn63_testNonEnumerablePropNotInObjectEntries();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object4Test064
     * @tc.number SUB_BUILTINS_OBJECT4_TEST_6400
     * @tc.desc   test non-configurable cannot become configurable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object4Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn64_testNonConfigurableCannotBecomeConfigurable();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object4Test065
     * @tc.number SUB_BUILTINS_OBJECT4_TEST_6500
     * @tc.desc   test define prop with symbol value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object4Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn65_testDefinePropWithSymbolValue();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object4Test066
     * @tc.number SUB_BUILTINS_OBJECT4_TEST_6600
     * @tc.desc   test accessor setter type check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object4Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn66_testAccessorSetterTypeCheck();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object4Test067
     * @tc.number SUB_BUILTINS_OBJECT4_TEST_6700
     * @tc.desc   test define enumerable and non-enumerable together
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object4Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn67_testDefineEnumerableAndNonEnumerableTogether();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object4Test069
     * @tc.number SUB_BUILTINS_OBJECT4_TEST_6900
     * @tc.desc   test define props on class instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object4Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn69_testDefinePropsOnClassInstance();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object4Test070
     * @tc.number SUB_BUILTINS_OBJECT4_TEST_7000
     * @tc.desc   test accessor getter throw error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object4Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn70_testAccessorGetterThrowError();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object4Test071
     * @tc.number SUB_BUILTINS_OBJECT4_TEST_7100
     * @tc.desc   test define prop with regexp value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object4Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Fn71_testDefinePropWithRegExpValue();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object4Test072
     * @tc.number SUB_BUILTINS_OBJECT4_TEST_7200
     * @tc.desc   test configurable prop change enumerable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object4Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn72_testConfigurablePropChangeEnumerable();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object4Test073
     * @tc.number SUB_BUILTINS_OBJECT4_TEST_7300
     * @tc.desc   test define prop with number key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object4Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn73_testDefinePropWithNumberKey();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object4Test074
     * @tc.number SUB_BUILTINS_OBJECT4_TEST_7400
     * @tc.desc   test accessor setter throw error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object4Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn74_testAccessorSetterThrowError();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object4Test075
     * @tc.number SUB_BUILTINS_OBJECT4_TEST_7500
     * @tc.desc   test define prop with map value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object4Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn75_testDefinePropWithMapValue();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object4Test076
     * @tc.number SUB_BUILTINS_OBJECT4_TEST_7600
     * @tc.desc   test non-configurable cannot set enumerable true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object4Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn76_testNonConfigurableCannotSetEnumerableTrue();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object4Test077
     * @tc.number SUB_BUILTINS_OBJECT4_TEST_7700
     * @tc.desc   test define prop with set value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object4Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Fn77_testDefinePropWithSetValue();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object4Test078
     * @tc.number SUB_BUILTINS_OBJECT4_TEST_7800
     * @tc.desc   test accessor getter depend prototype
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object4Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn78_testAccessorGetterDependPrototype();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object4Test079
     * @tc.number SUB_BUILTINS_OBJECT4_TEST_7900
     * @tc.desc   test define props on frozen object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object4Test079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn79_testDefinePropsOnFrozenObject();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object4Test080
     * @tc.number SUB_BUILTINS_OBJECT4_TEST_8000
     * @tc.desc   test accessor setter modify prototype
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object4Test080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn80_testAccessorSetterModifyPrototype();
      expect(result).assertEqual(false);
    });
    /**
     * @tc.name   Object4Test081
     * @tc.number SUB_BUILTINS_OBJECT4_TEST_8100
     * @tc.desc   test accessor to data prop invalidate accessor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object4Test081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn81_testAccessorToDataPropInvalidateAccessor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object4Test082
     * @tc.number SUB_BUILTINS_OBJECT4_TEST_8200
     * @tc.desc   test define prop with date value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object4Test082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn82_testDefinePropWithDateValue();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object4Test083
     * @tc.number SUB_BUILTINS_OBJECT4_TEST_8300
     * @tc.desc   test non-configurable accessor getter cannot override
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object4Test083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn83_testNonConfigurableAccessorGetterCannotOverride();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object4Test084
     * @tc.number SUB_BUILTINS_OBJECT4_TEST_8400
     * @tc.desc   test multiple accessors with dependency
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object4Test084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn84_testMultipleAccessorsWithDependency();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object4Test085
     * @tc.number SUB_BUILTINS_OBJECT4_TEST_8500
     * @tc.desc   test enumerable symbol in get own symbols
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object4Test085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn85_testEnumerableSymbolInGetOwnSymbols();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object4Test087
     * @tc.number SUB_BUILTINS_OBJECT4_TEST_8700
     * @tc.desc   test define props on sealed object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object4Test087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn87_testDefinePropsOnSealedObject();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object4Test088
     * @tc.number SUB_BUILTINS_OBJECT4_TEST_8800
     * @tc.desc   test accessor setter receive null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object4Test088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn88_testAccessorSetterReceiveNull();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object4Test089
     * @tc.number SUB_BUILTINS_OBJECT4_TEST_8900
     * @tc.desc   test define prop with template key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object4Test089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn89_testDefinePropWithTemplateKey();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object4Test090
     * @tc.number SUB_BUILTINS_OBJECT4_TEST_9000
     * @tc.desc   test non-configurable cannot set writable false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object4Test090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn90_testNonConfigurableCannotSetWritableFalse();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   Object4Test091
     * @tc.number SUB_BUILTINS_OBJECT4_TEST_9100
     * @tc.desc   test define prop with weakmap value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object4Test091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn91_testDefinePropWithWeakMapValue();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object4Test092
     * @tc.number SUB_BUILTINS_OBJECT4_TEST_9200
     * @tc.desc   test accessor getter undefined has own
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object4Test092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Fn92_testAccessorGetterUndefinedHasOwn();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object4Test095
     * @tc.number SUB_BUILTINS_OBJECT4_TEST_9500
     * @tc.desc   test define props on proxy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object4Test095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn95_testDefinePropsOnProxy();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object4Test096
     * @tc.number SUB_BUILTINS_OBJECT4_TEST_9600
     * @tc.desc   test setter without param no side effect
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object4Test096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn96_testSetterWithoutParamNoSideEffect();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object4Test097
     * @tc.number SUB_BUILTINS_OBJECT4_TEST_9700
     * @tc.desc   test define prop with weakset value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object4Test097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Fn97_testDefinePropWithWeakSetValue();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object4Test098
     * @tc.number SUB_BUILTINS_OBJECT4_TEST_9800
     * @tc.desc   test non-configurable accessor cannot change to data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object4Test098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn98_testNonConfigurableAccessorCannotChangeToData();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object4Test099
     * @tc.number SUB_BUILTINS_OBJECT4_TEST_9900
     * @tc.desc   test define prop with chinese key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object4Test099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn99_testDefinePropWithChineseKey();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object4Test100
     * @tc.number SUB_BUILTINS_OBJECT4_TEST_10000
     * @tc.desc   test accessor getter no infinite loop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object4Test100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn100_testAccessorGetterNoInfiniteLoop();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object4Test102
     * @tc.number SUB_BUILTINS_OBJECT4_TEST_10200
     * @tc.desc   test define prop with promise value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object4Test102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let result: boolean = await Fn102_testDefinePropWithPromiseValue();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object4Test103
     * @tc.number SUB_BUILTINS_OBJECT4_TEST_10300
     * @tc.desc   test non-configurable accessor setter cannot override
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object4Test103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn103_testNonConfigurableAccessorSetterCannotOverride();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object4Test104
     * @tc.number SUB_BUILTINS_OBJECT4_TEST_10400
     * @tc.desc   test define props with one invalid descriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object4Test104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn104_testDefinePropsWithOneInvalidDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object4Test105
     * @tc.number SUB_BUILTINS_OBJECT4_TEST_10500
     * @tc.desc   test non-enumerable prop not in destructuring
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object4Test105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn105_testNonEnumerablePropNotInDestructuring();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   Object4Test107
     * @tc.number SUB_BUILTINS_OBJECT4_TEST_10700
     * @tc.desc   test define props priority over prototype
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object4Test107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn107_testDefinePropsPriorityOverPrototype();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object4Test108
     * @tc.number SUB_BUILTINS_OBJECT4_TEST_10800
     * @tc.desc   test accessor setter call getter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object4Test108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn108_testAccessorSetterCallGetter();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object4Test109
     * @tc.number SUB_BUILTINS_OBJECT4_TEST_10900
     * @tc.desc   test define prop with symbol for key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object4Test109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn109_testDefinePropWithSymbolForKey();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object4Test110
     * @tc.number SUB_BUILTINS_OBJECT4_TEST_11000
     * @tc.desc   test non-configurable cannot modify any descriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object4Test110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn110_testNonConfigurableCannotModifyAnyDescriptor();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   Object4Test111
     * @tc.number SUB_BUILTINS_OBJECT4_TEST_11100
     * @tc.desc   test define prop with array buffer value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object4Test111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn111_testDefinePropWithArrayBufferValue();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object4Test112
     * @tc.number SUB_BUILTINS_OBJECT4_TEST_11200
     * @tc.desc   test accessor getter return function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object4Test112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn112_testAccessorGetterReturnFunction();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object4Test113
     * @tc.number SUB_BUILTINS_OBJECT4_TEST_11300
     * @tc.desc   test define enumerable non-enumerable symbol props
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object4Test113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn113_testDefineEnumerableNonEnumerableSymbolProps();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object4Test114
     * @tc.number SUB_BUILTINS_OBJECT4_TEST_11400
     * @tc.desc   test non-writable date prop method call
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object4Test114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn114_testNonWritableDatePropMethodCall();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object4Test115
     * @tc.number SUB_BUILTINS_OBJECT4_TEST_11500
     * @tc.desc   test define props on typed array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object4Test115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn115_testDefinePropsOnTypedArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object4Test116
     * @tc.number SUB_BUILTINS_OBJECT4_TEST_11600
     * @tc.desc   test accessor setter receive empty string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object4Test116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn116_testAccessorSetterReceiveEmptyString();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object4Test117
     * @tc.number SUB_BUILTINS_OBJECT4_TEST_11700
     * @tc.desc   test define prop with number string key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object4Test117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn117_testDefinePropWithNumberStringKey();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object4Test120
     * @tc.number SUB_BUILTINS_OBJECT4_TEST_12000
     * @tc.desc   test accessor getter depend multiple props
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object4Test120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn120_testAccessorGetterDependMultipleProps();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object4Test121
     * @tc.number SUB_BUILTINS_OBJECT4_TEST_12100
     * @tc.desc   test define props on error object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object4Test121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn121_testDefinePropsOnErrorObject();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object4Test122
     * @tc.number SUB_BUILTINS_OBJECT4_TEST_12200
     * @tc.desc   test non-writable map prop method call
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object4Test122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn122_testNonWritableMapPropMethodCall();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object4Test123
     * @tc.number SUB_BUILTINS_OBJECT4_TEST_12300
     * @tc.desc   test define prop with special symbol key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object4Test123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn123_testDefinePropWithSpecialSymbolKey();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object4Test124
     * @tc.number SUB_BUILTINS_OBJECT4_TEST_12400
     * @tc.desc   test accessor setter throw error no state change
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object4Test124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn124_testAccessorSetterThrowErrorNoStateChange();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object4Test125
     * @tc.number SUB_BUILTINS_OBJECT4_TEST_12500
     * @tc.desc   test define prop with set iterator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object4Test125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn125_testDefinePropWithSetIterator();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object4Test126
     * @tc.number SUB_BUILTINS_OBJECT4_TEST_12600
     * @tc.desc   test non-configurable cannot set enumerable false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object4Test126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn126_testNonConfigurableCannotSetEnumerableFalse();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object4Test127
     * @tc.number SUB_BUILTINS_OBJECT4_TEST_12700
     * @tc.desc   test define props on generator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object4Test127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn127_testDefinePropsOnGenerator();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object4Test128
     * @tc.number SUB_BUILTINS_OBJECT4_TEST_12800
     * @tc.desc   test accessor getter return symbol
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object4Test128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn128_testAccessorGetterReturnSymbol();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object4Test129
     * @tc.number SUB_BUILTINS_OBJECT4_TEST_12900
     * @tc.desc   test define props on weak map key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object4Test129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn129_testDefinePropsOnWeakMapKey();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object4Test130
     * @tc.number SUB_BUILTINS_OBJECT4_TEST_13000
     * @tc.desc   test non-writable array buffer prop view
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object4Test130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn130_testNonWritableArrayBufferPropView();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name   Object4Test131
     * @tc.number SUB_BUILTINS_OBJECT4_TEST_13100
     * @tc.desc   test configurable to false cannot revert
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object4Test131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn131_testConfigurableToFalseCannotRevert();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object4Test133
     * @tc.number SUB_BUILTINS_OBJECT4_TEST_13300
     * @tc.desc   test non-configurable accessor cannot change enumerable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object4Test133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn133_testNonConfigurableAccessorCannotChangeEnumerable();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object4Test134
     * @tc.number SUB_BUILTINS_OBJECT4_TEST_13400
     * @tc.desc   test define props with partial descriptors
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object4Test134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn134_testDefinePropsWithPartialDescriptors();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object4Test135
     * @tc.number SUB_BUILTINS_OBJECT4_TEST_13500
     * @tc.desc   test enumerable prop copied in object assign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object4Test135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn135_testEnumerablePropCopiedInObjectAssign();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object4Test136
     * @tc.number SUB_BUILTINS_OBJECT4_TEST_13600
     * @tc.desc   test non-writable weak set prop method call
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object4Test136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn136_testNonWritableWeakSetPropMethodCall();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object4Test137
     * @tc.number SUB_BUILTINS_OBJECT4_TEST_13700
     * @tc.desc   test define props on class prototype
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object4Test137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn137_testDefinePropsOnClassPrototype();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object4Test138
     * @tc.number SUB_BUILTINS_OBJECT4_TEST_13800
     * @tc.desc   test accessor setter receive boolean
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object4Test138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn138_testAccessorSetterReceiveBoolean();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object4Test139
     * @tc.number SUB_BUILTINS_OBJECT4_TEST_13900
     * @tc.desc   test define prop with symbol iterator key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object4Test139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn139_testDefinePropWithSymbolIteratorKey();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object4Test140
     * @tc.number SUB_BUILTINS_OBJECT4_TEST_14000
     * @tc.desc   test non-configurable cannot modify via get descriptors
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object4Test140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn140_testNonConfigurableCannotModifyViaGetDescriptors();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object4Test142
     * @tc.number SUB_BUILTINS_OBJECT4_TEST_14200
     * @tc.desc   test accessor getter return bigint
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object4Test142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn142_testAccessorGetterReturnBigInt();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object4Test143
     * @tc.number SUB_BUILTINS_OBJECT4_TEST_14300
     * @tc.desc   test define enumerable non-enumerable accessors
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object4Test143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn143_testDefineEnumerableNonEnumerableAccessors();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object4Test146
     * @tc.number SUB_BUILTINS_OBJECT4_TEST_14600
     * @tc.desc   test accessor setter modify self throw error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object4Test146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn146_testAccessorSetterModifySelfThrowError();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object4Test147
     * @tc.number SUB_BUILTINS_OBJECT4_TEST_14700
     * @tc.desc   test define prop with unicode key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object4Test147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn147_testDefinePropWithUnicodeKey();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object4Test148
     * @tc.number SUB_BUILTINS_OBJECT4_TEST_14800
     * @tc.desc   test non-configurable generator prop method call
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object4Test148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn148_testNonConfigurableGeneratorPropMethodCall();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object4Test150
     * @tc.number SUB_BUILTINS_OBJECT4_TEST_15000
     * @tc.desc   test accessor getter depend nested prop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object4Test150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn150_testAccessorGetterDependNestedProp();
      expect(result).assertEqual(true);
    });

  })
}