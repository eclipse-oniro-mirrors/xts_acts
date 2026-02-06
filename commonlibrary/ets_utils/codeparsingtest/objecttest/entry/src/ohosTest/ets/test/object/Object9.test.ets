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
  Fn01_testDataPropertyDescriptor,
  Fn02_testAccessorPropertyDescriptor,
  Fn03_testNonExistentOrPrototypeProperty,
  Fn04_testNonWritableDataProperty,
  Fn05_testNonEnumerableDataProperty,
  Fn06_testNonConfigurableDataProperty,
  Fn07_testAccessorOnlyGetter,
  Fn08_testAccessorOnlySetter,
  Fn09_testNonEnumerableAccessor,
  Fn101_testNonEnumerableNotInObjectValues,
  Fn102_testArrowFunctionNameDescriptor,
  Fn104_testConfigurableAccessorModifyConfigurable,
  Fn106_testDescriptorValueNaN,
  Fn108_testArraySymbolOwnProp,
  Fn10_testNonConfigurableAccessor,
  Fn110_testConfigurableToNonConfigurable,
  Fn112_testClassInstanceWritableAccessor,
  Fn114_testNonConfigurableAccessorStrictMode,
  Fn117_testConfigurableAccessorDeleteAndRedefine,
  Fn11_testNullUndefinedTarget,
  Fn120_testNonEnumerableInGetOwnDescriptors,
  Fn122_testConfigurableToNonEnumerable,
  Fn123_testArrayPrototypeUnshiftDescriptor,
  Fn124_testFrozenObjectNonConfigurable,
  Fn127_testDescriptorValueInfinity,
  Fn129_testSymbolEnumerableAccessor,
  Fn131_testNonEnumerableNotInObjectEntries,
  Fn132_testBoundFunctionNameDescriptor,
  Fn136_testDescriptorValueNegativeInfinity,
  Fn138_testArraySymbolSpeciesDescriptor,
  Fn13_testStringWrapperObject,
  Fn140_testConfigurableToNonConfigurableValue,
  Fn142_testClassPrototypeMethodDescriptor,
  Fn144_testNonConfigurableAccessorDeleteStrict,
  Fn147_testAccessorDeleteRedefineData,
  Fn14_testArrayIndexProperty,
  Fn150_testNonEnumerableNotInStringify,
  Fn151_testErrorMessageDescriptor,
  Fn153_testArrayPrototypeSliceDescriptor,
  Fn154_testSealedObjectProperty,
  Fn157_testDescriptorValueFunction,
  Fn15_testArrayLengthProperty,
  Fn161_testNonEnumerableInGetOwnSymbols,
  Fn162_testGeneratorFunctionNameDescriptor,
  Fn164_testAccessorToNonEnumerable,
  Fn166_testDescriptorValueObject,
  Fn16_testSymbolProperty,
  Fn170_testNonConfigurableWritableValue,
  Fn172_testClassStaticAccessorDescriptor,
  Fn177_testAccessorRedefineAsNonWritableData,
  Fn17_testNonWritableValueUnchangeable,
  Fn180_testNonEnumerableNotInObjectAssign,
  Fn182_testNonWritableStrictModeThrow,
  Fn183_testArrayPrototypeFilterDescriptor,
  Fn184_testFrozenAccessorProperty,
  Fn187_testDescriptorValueArray,
  Fn189_testSymbolNonConfigurableAccessor,
  Fn191_testNonEnumerableSymbolInGetOwnSymbols,
  Fn192_testAsyncFunctionNameDescriptor,
  Fn193_testWeakSetPrototypeProps,
  Fn194_testNonConfigurableAccessorModifyValue,
  Fn196_testDescriptorValueRegExp,
  Fn198_testArraySymbolIsConcatSpreadable,
  Fn199_testWeakMapPrototypeProps,
  Fn19_testAccessorDependsExternalVar,
  Fn200_testNonConfigurableNonWritable,
  Fn202_testClassPrivateMethodDescriptor,
  Fn204_testNonConfigurableAccessorModifySetterStrict,
  Fn207_testAccessorRedefineAsNonEnumerableData,
  Fn20_testEmptyValueDataProperty,
  Fn210_testNonEnumerableInGetOwnNames,
  Fn21_testFunctionPrototypeDescriptor,
  Fn22_testObjectPrototypeToString,
  Fn23_testNonEnumerableInForIn,
  Fn24_testConfigurablePropertyDeletable,
  Fn25_testAccessorSetterModifyExternal,
  Fn26_testNumberPrimitiveAutoWrap,
  Fn28_testOwnVsPrototypeSameName,
  Fn29_testNonConfigurableAccessorNoModify,
  Fn30_testAccessorWritableUndefined,
  Fn31_testEmptyObjectNonExistentProp,
  Fn33_testObjectCreateOwnProp,
  Fn34_testNonWritableNonConfigurableValue,
  Fn36_testDefinePropertiesSingleDescriptor,
  Fn38_testNonConfigurableCannotChangeEnumerable,
  Fn39_testSymbolIteratorPropertyDescriptor,
  Fn40_testWeakSetNoOwnEnumerableProps,
  Fn41_testClassInstancePropDescriptor,
  Fn43_testNonConfigurableCannotChangeConfigurable,
  Fn44_testStringPrimitiveLengthDescriptor,
  Fn45_testClassStaticPropDescriptor,
  Fn46_testArrayPrototypePushDescriptor,
  Fn47_testAccessorNoWritableConcept,
  Fn48_testWeakMapNoOwnProps,
  Fn49_testObjectAssignPropDescriptor,
  Fn50_testRegExpLastIndexDescriptor,
  Fn51_testFunctionNameDescriptor,
  Fn52_testConfigurableAccessorModifySetter,
  Fn53_testArrayHoleDescriptor,
  Fn55_testSymbolNonEnumerableProp,
  Fn56_testNonWritableStrictModeError,
  Fn57_testClassProtoMethodDescriptor,
  Fn59_testDescriptorValueNull,
  Fn60_testConfigurableDataToAccessor,
  Fn62_testClassStaticMethodDescriptor,
  Fn63_testArrayPrototypePopDescriptor,
  Fn67_testConfigurableDataModifyValue,
  Fn69_testSymbolConfigurableAccessor,
  Fn71_testNonEnumerableNotInObjectKeys,
  Fn72_testFunctionLengthDescriptor,
  Fn74_testConfigurableAccessorModifyEnumerable,
  Fn76_testConfigurablePropDeletable,
  Fn78_testArrayNonIndexOwnProp,
  Fn80_testConfigurableDataToNonWritable,
  Fn82_testClassInstanceNonEnumerableProp,
  Fn84_testNonConfigurableDataToAccessor,
  Fn87_testConfigurableAccessorDeletable,
  Fn90_testNonEnumerableAccessorInGetOwnNames,
  Fn92_testClassPrivateFieldDescriptor,
  Fn93_testArrayPrototypeShiftDescriptor,
  Fn94_testNonConfigurableAfterFreeze,
  Fn97_testConfigurableDataModifyEnumerable,
  Fn99_testSymbolNonConfigurableData
} from './Object9';

function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}


export default function Object9Test() {
  describe('Object9Test', () => {
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
     * @tc.name   Object9Test001
     * @tc.number SUB_BUILTINS_Object9_TEST_0100
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object9Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn01_testDataPropertyDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object9Test002
     * @tc.number SUB_BUILTINS_Object9_TEST_0200
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object9Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn02_testAccessorPropertyDescriptor();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name   Object9Test003
     * @tc.number SUB_BUILTINS_Object9_TEST_0300
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object9Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn03_testNonExistentOrPrototypeProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object9Test004
     * @tc.number SUB_BUILTINS_Object9_TEST_0400
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object9Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn04_testNonWritableDataProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object9Test005
     * @tc.number SUB_BUILTINS_Object9_TEST_0500
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object9Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn05_testNonEnumerableDataProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object9Test006
     * @tc.number SUB_BUILTINS_Object9_TEST_0600
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object9Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn06_testNonConfigurableDataProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object9Test007
     * @tc.number SUB_BUILTINS_Object9_TEST_0700
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object9Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn07_testAccessorOnlyGetter();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object9Test008
     * @tc.number SUB_BUILTINS_Object9_TEST_0800
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object9Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn08_testAccessorOnlySetter();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object9Test009
     * @tc.number SUB_BUILTINS_Object9_TEST_0900
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object9Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn09_testNonEnumerableAccessor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object9Test010
     * @tc.number SUB_BUILTINS_Object9_TEST_1000
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object9Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn10_testNonConfigurableAccessor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object9Test011
     * @tc.number SUB_BUILTINS_Object9_TEST_1100
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object9Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn11_testNullUndefinedTarget();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object9Test013
     * @tc.number SUB_BUILTINS_Object9_TEST_1300
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object9Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn13_testStringWrapperObject();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object9Test014
     * @tc.number SUB_BUILTINS_Object9_TEST_1400
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object9Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn14_testArrayIndexProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object9Test015
     * @tc.number SUB_BUILTINS_Object9_TEST_1500
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object9Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn15_testArrayLengthProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object9Test016
     * @tc.number SUB_BUILTINS_Object9_TEST_1600
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object9Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn16_testSymbolProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object9Test017
     * @tc.number SUB_BUILTINS_Object9_TEST_1700
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object9Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn17_testNonWritableValueUnchangeable();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object9Test019
     * @tc.number SUB_BUILTINS_Object9_TEST_1900
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object9Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn19_testAccessorDependsExternalVar();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object9Test020
     * @tc.number SUB_BUILTINS_Object9_TEST_2000
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object9Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn20_testEmptyValueDataProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object9Test021
     * @tc.number SUB_BUILTINS_Object9_TEST_2100
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object9Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn21_testFunctionPrototypeDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object9Test022
     * @tc.number SUB_BUILTINS_Object9_TEST_2200
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object9Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn22_testObjectPrototypeToString();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   Object9Test023
     * @tc.number SUB_BUILTINS_Object9_TEST_2300
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object9Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn23_testNonEnumerableInForIn();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object9Test024
     * @tc.number SUB_BUILTINS_Object9_TEST_2400
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object9Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn24_testConfigurablePropertyDeletable();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object9Test025
     * @tc.number SUB_BUILTINS_Object9_TEST_2500
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object9Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn25_testAccessorSetterModifyExternal();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object9Test026
     * @tc.number SUB_BUILTINS_Object9_TEST_2600
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object9Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn26_testNumberPrimitiveAutoWrap();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   Object9Test028
     * @tc.number SUB_BUILTINS_Object9_TEST_2800
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object9Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn28_testOwnVsPrototypeSameName();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object9Test029
     * @tc.number SUB_BUILTINS_Object9_TEST_2900
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object9Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn29_testNonConfigurableAccessorNoModify();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object9Test030
     * @tc.number SUB_BUILTINS_Object9_TEST_3000
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object9Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn30_testAccessorWritableUndefined();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name   Object9Test031
     * @tc.number SUB_BUILTINS_Object9_TEST_3100
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object9Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn31_testEmptyObjectNonExistentProp();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object9Test033
     * @tc.number SUB_BUILTINS_Object9_TEST_3300
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object9Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn33_testObjectCreateOwnProp();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object9Test034
     * @tc.number SUB_BUILTINS_Object9_TEST_3400
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object9Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn34_testNonWritableNonConfigurableValue();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object9Test036
     * @tc.number SUB_BUILTINS_Object9_TEST_3600
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object9Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn36_testDefinePropertiesSingleDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object9Test038
     * @tc.number SUB_BUILTINS_Object9_TEST_3800
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object9Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn38_testNonConfigurableCannotChangeEnumerable();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object9Test039
     * @tc.number SUB_BUILTINS_Object9_TEST_3900
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object9Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn39_testSymbolIteratorPropertyDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object9Test040
     * @tc.number SUB_BUILTINS_Object9_TEST_4000
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object9Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn40_testWeakSetNoOwnEnumerableProps();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object9Test041
     * @tc.number SUB_BUILTINS_Object9_TEST_4100
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object9Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn41_testClassInstancePropDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object9Test043
     * @tc.number SUB_BUILTINS_Object9_TEST_4300
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object9Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn43_testNonConfigurableCannotChangeConfigurable();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object9Test044
     * @tc.number SUB_BUILTINS_Object9_TEST_4400
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object9Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn44_testStringPrimitiveLengthDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object9Test045
     * @tc.number SUB_BUILTINS_Object9_TEST_4500
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object9Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn45_testClassStaticPropDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object9Test046
     * @tc.number SUB_BUILTINS_Object9_TEST_4600
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object9Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn46_testArrayPrototypePushDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object9Test047
     * @tc.number SUB_BUILTINS_Object9_TEST_4700
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object9Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn47_testAccessorNoWritableConcept();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object9Test048
     * @tc.number SUB_BUILTINS_Object9_TEST_4800
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object9Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn48_testWeakMapNoOwnProps();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object9Test049
     * @tc.number SUB_BUILTINS_Object9_TEST_4900
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object9Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn49_testObjectAssignPropDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object9Test050
     * @tc.number SUB_BUILTINS_Object9_TEST_5000
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object9Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn50_testRegExpLastIndexDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object9Test051
     * @tc.number SUB_BUILTINS_Object9_TEST_5100
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object9Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn51_testFunctionNameDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object9Test052
     * @tc.number SUB_BUILTINS_Object9_TEST_5200
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object9Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn52_testConfigurableAccessorModifySetter();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object9Test053
     * @tc.number SUB_BUILTINS_Object9_TEST_5300
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object9Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn53_testArrayHoleDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object9Test055
     * @tc.number SUB_BUILTINS_Object9_TEST_5500
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object9Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn55_testSymbolNonEnumerableProp();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object9Test056
     * @tc.number SUB_BUILTINS_Object9_TEST_5600
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object9Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn56_testNonWritableStrictModeError();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object9Test057
     * @tc.number SUB_BUILTINS_Object9_TEST_5700
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object9Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn57_testClassProtoMethodDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object9Test059
     * @tc.number SUB_BUILTINS_Object9_TEST_5900
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object9Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn59_testDescriptorValueNull();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object9Test060
     * @tc.number SUB_BUILTINS_Object9_TEST_6000
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object9Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn60_testConfigurableDataToAccessor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object9Test062
     * @tc.number SUB_BUILTINS_Object9_TEST_6200
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object9Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn62_testClassStaticMethodDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object9Test063
     * @tc.number SUB_BUILTINS_Object9_TEST_6300
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object9Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn63_testArrayPrototypePopDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object9Test067
     * @tc.number SUB_BUILTINS_Object9_TEST_6700
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object9Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn67_testConfigurableDataModifyValue();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object9Test069
     * @tc.number SUB_BUILTINS_Object9_TEST_6900
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object9Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn69_testSymbolConfigurableAccessor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object9Test071
     * @tc.number SUB_BUILTINS_Object9_TEST_7100
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object9Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn71_testNonEnumerableNotInObjectKeys();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object9Test072
     * @tc.number SUB_BUILTINS_Object9_TEST_7200
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object9Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn72_testFunctionLengthDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object9Test074
     * @tc.number SUB_BUILTINS_Object9_TEST_7400
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object9Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn74_testConfigurableAccessorModifyEnumerable();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object9Test076
     * @tc.number SUB_BUILTINS_Object9_TEST_7600
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object9Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn76_testConfigurablePropDeletable();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object9Test078
     * @tc.number SUB_BUILTINS_Object9_TEST_7800
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object9Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn78_testArrayNonIndexOwnProp();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object9Test080
     * @tc.number SUB_BUILTINS_Object9_TEST_8000
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object9Test080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn80_testConfigurableDataToNonWritable();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object9Test082
     * @tc.number SUB_BUILTINS_Object9_TEST_8200
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object9Test082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn82_testClassInstanceNonEnumerableProp();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object9Test084
     * @tc.number SUB_BUILTINS_Object9_TEST_8400
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object9Test084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn84_testNonConfigurableDataToAccessor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object9Test087
     * @tc.number SUB_BUILTINS_Object9_TEST_8700
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object9Test087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn87_testConfigurableAccessorDeletable();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object9Test090
     * @tc.number SUB_BUILTINS_Object9_TEST_9000
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object9Test090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn90_testNonEnumerableAccessorInGetOwnNames();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object9Test092
     * @tc.number SUB_BUILTINS_Object9_TEST_9200
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object9Test092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn92_testClassPrivateFieldDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object9Test093
     * @tc.number SUB_BUILTINS_Object9_TEST_9300
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object9Test093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn93_testArrayPrototypeShiftDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object9Test094
     * @tc.number SUB_BUILTINS_Object9_TEST_9400
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object9Test094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn94_testNonConfigurableAfterFreeze();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object9Test097
     * @tc.number SUB_BUILTINS_Object9_TEST_9700
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object9Test097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn97_testConfigurableDataModifyEnumerable();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object9Test099
     * @tc.number SUB_BUILTINS_Object9_TEST_9900
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object9Test099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn99_testSymbolNonConfigurableData();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object9Test101
     * @tc.number SUB_BUILTINS_Object9_TEST_10100
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object9Test101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn101_testNonEnumerableNotInObjectValues();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object9Test102
     * @tc.number SUB_BUILTINS_Object9_TEST_10200
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object9Test102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn102_testArrowFunctionNameDescriptor();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   Object9Test104
     * @tc.number SUB_BUILTINS_Object9_TEST_10400
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object9Test104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn104_testConfigurableAccessorModifyConfigurable();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object9Test106
     * @tc.number SUB_BUILTINS_Object9_TEST_10600
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object9Test106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn106_testDescriptorValueNaN();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object9Test108
     * @tc.number SUB_BUILTINS_Object9_TEST_10800
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object9Test108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn108_testArraySymbolOwnProp();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object9Test110
     * @tc.number SUB_BUILTINS_Object9_TEST_11000
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object9Test110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn110_testConfigurableToNonConfigurable();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   Object9Test112
     * @tc.number SUB_BUILTINS_Object9_TEST_11200
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object9Test112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn112_testClassInstanceWritableAccessor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object9Test114
     * @tc.number SUB_BUILTINS_Object9_TEST_11400
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object9Test114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn114_testNonConfigurableAccessorStrictMode();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object9Test117
     * @tc.number SUB_BUILTINS_Object9_TEST_11700
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object9Test117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn117_testConfigurableAccessorDeleteAndRedefine();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   Object9Test120
     * @tc.number SUB_BUILTINS_Object9_TEST_12000
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object9Test120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn120_testNonEnumerableInGetOwnDescriptors();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object9Test122
     * @tc.number SUB_BUILTINS_Object9_TEST_12200
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object9Test122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn122_testConfigurableToNonEnumerable();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object9Test123
     * @tc.number SUB_BUILTINS_Object9_TEST_12300
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object9Test123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn123_testArrayPrototypeUnshiftDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object9Test124
     * @tc.number SUB_BUILTINS_Object9_TEST_12400
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object9Test124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn124_testFrozenObjectNonConfigurable();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object9Test127
     * @tc.number SUB_BUILTINS_Object9_TEST_12700
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object9Test127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn127_testDescriptorValueInfinity();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object9Test129
     * @tc.number SUB_BUILTINS_Object9_TEST_12900
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object9Test129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn129_testSymbolEnumerableAccessor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object9Test131
     * @tc.number SUB_BUILTINS_Object9_TEST_13100
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object9Test131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn131_testNonEnumerableNotInObjectEntries();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object9Test132
     * @tc.number SUB_BUILTINS_Object9_TEST_13200
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object9Test132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn132_testBoundFunctionNameDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object9Test136
     * @tc.number SUB_BUILTINS_Object9_TEST_13600
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object9Test136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn136_testDescriptorValueNegativeInfinity();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object9Test138
     * @tc.number SUB_BUILTINS_Object9_TEST_13800
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object9Test138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn138_testArraySymbolSpeciesDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object9Test140
     * @tc.number SUB_BUILTINS_Object9_TEST_14000
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object9Test140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn140_testConfigurableToNonConfigurableValue();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object9Test142
     * @tc.number SUB_BUILTINS_Object9_TEST_14200
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object9Test142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn142_testClassPrototypeMethodDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object9Test144
     * @tc.number SUB_BUILTINS_Object9_TEST_14400
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object9Test144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn144_testNonConfigurableAccessorDeleteStrict();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object9Test147
     * @tc.number SUB_BUILTINS_Object9_TEST_14700
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object9Test147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn147_testAccessorDeleteRedefineData();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object9Test150
     * @tc.number SUB_BUILTINS_Object9_TEST_15000
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object9Test150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn150_testNonEnumerableNotInStringify();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name   Object9Test151
     * @tc.number SUB_BUILTINS_Object9_TEST_15100
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object9Test151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn151_testErrorMessageDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object9Test153
     * @tc.number SUB_BUILTINS_Object9_TEST_15300
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object9Test153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn153_testArrayPrototypeSliceDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object9Test154
     * @tc.number SUB_BUILTINS_Object9_TEST_15400
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object9Test154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn154_testSealedObjectProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object9Test157
     * @tc.number SUB_BUILTINS_Object9_TEST_15700
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object9Test157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn157_testDescriptorValueFunction();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object9Test161
     * @tc.number SUB_BUILTINS_Object9_TEST_16100
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object9Test161', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn161_testNonEnumerableInGetOwnSymbols();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object9Test162
     * @tc.number SUB_BUILTINS_Object9_TEST_16200
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object9Test162', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn162_testGeneratorFunctionNameDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object9Test164
     * @tc.number SUB_BUILTINS_Object9_TEST_16400
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object9Test164', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn164_testAccessorToNonEnumerable();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object9Test166
     * @tc.number SUB_BUILTINS_Object9_TEST_16600
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object9Test166', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn166_testDescriptorValueObject();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object9Test170
     * @tc.number SUB_BUILTINS_Object9_TEST_17000
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object9Test170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn170_testNonConfigurableWritableValue();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object9Test172
     * @tc.number SUB_BUILTINS_Object9_TEST_17200
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object9Test172', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn172_testClassStaticAccessorDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object9Test177
     * @tc.number SUB_BUILTINS_Object9_TEST_17700
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object9Test177', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn177_testAccessorRedefineAsNonWritableData();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object9Test180
     * @tc.number SUB_BUILTINS_Object9_TEST_18000
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object9Test180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn180_testNonEnumerableNotInObjectAssign();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object9Test182
     * @tc.number SUB_BUILTINS_Object9_TEST_18200
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object9Test182', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn182_testNonWritableStrictModeThrow();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object9Test183
     * @tc.number SUB_BUILTINS_Object9_TEST_18300
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object9Test183', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn183_testArrayPrototypeFilterDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object9Test184
     * @tc.number SUB_BUILTINS_Object9_TEST_18400
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object9Test184', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn184_testFrozenAccessorProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object9Test187
     * @tc.number SUB_BUILTINS_Object9_TEST_18700
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object9Test187', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn187_testDescriptorValueArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object9Test189
     * @tc.number SUB_BUILTINS_Object9_TEST_18900
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object9Test189', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn189_testSymbolNonConfigurableAccessor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object9Test191
     * @tc.number SUB_BUILTINS_Object9_TEST_19100
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object9Test191', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn191_testNonEnumerableSymbolInGetOwnSymbols();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object9Test192
     * @tc.number SUB_BUILTINS_Object9_TEST_19200
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object9Test192', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn192_testAsyncFunctionNameDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object9Test193
     * @tc.number SUB_BUILTINS_Object9_TEST_19300
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object9Test193', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn193_testWeakSetPrototypeProps();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object9Test194
     * @tc.number SUB_BUILTINS_Object9_TEST_19400
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object9Test194', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn194_testNonConfigurableAccessorModifyValue();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object9Test196
     * @tc.number SUB_BUILTINS_Object9_TEST_19600
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object9Test196', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Fn196_testDescriptorValueRegExp();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object9Test198
     * @tc.number SUB_BUILTINS_Object9_TEST_19800
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object9Test198', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn198_testArraySymbolIsConcatSpreadable();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object9Test199
     * @tc.number SUB_BUILTINS_Object9_TEST_19900
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object9Test199', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn199_testWeakMapPrototypeProps();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object9Test200
     * @tc.number SUB_BUILTINS_Object9_TEST_20000
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object9Test200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn200_testNonConfigurableNonWritable();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object9Test202
     * @tc.number SUB_BUILTINS_Object9_TEST_20200
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object9Test202', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn202_testClassPrivateMethodDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object9Test204
     * @tc.number SUB_BUILTINS_Object9_TEST_20400
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object9Test204', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn204_testNonConfigurableAccessorModifySetterStrict();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object9Test207
     * @tc.number SUB_BUILTINS_Object9_TEST_20700
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object9Test207', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn207_testAccessorRedefineAsNonEnumerableData();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object9Test210
     * @tc.number SUB_BUILTINS_Object9_TEST_21000
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object9Test210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn210_testNonEnumerableInGetOwnNames();
      expect(result).assertEqual(true);
    });
  })
}