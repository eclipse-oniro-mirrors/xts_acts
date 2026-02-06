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
  Fn01_testEmptyObject,
  Fn02_testStringPropertiesOnly,
  Fn03_testWithOwnSymbolProperties,
  Fn04_testNonEnumerableSymbol,
  Fn05_testMixedEnumerableSymbol,
  Fn06_testPrototypeChainSymbol,
  Fn07_testReturnArrayIndependence,
  Fn08_testMultipleSameDescSymbol,
  Fn09_testSharedSymbol,
  Fn100_testWeakSetWithElementsSymbol,
  Fn101_testSymbolWithSharedValue,
  Fn102_testIntlNumberFormatSymbol,
  Fn103_testSymbolNotInJsonParse,
  Fn106_testDataViewWithOffsetSymbol,
  Fn107_testEverySymbolInArray,
  Fn108_testClosedRangeSymbol,
  Fn109_testSymbolAddedByCall,
  Fn10_testNullParameter,
  Fn111_testSymbolWithSetValue,
  Fn112_testIntlRelativeTimeFormatSymbol,
  Fn113_testSealedCheckWithSymbol,
  Fn115_testSymbolInProxyWithSetHandler,
  Fn116_testTypedArrayAfterModifySymbol,
  Fn117_testPrototypeGetWithSymbol,
  Fn118_testIntlLocaleSymbol,
  Fn119_testNonWritableNonConfigSymbol,
  Fn11_testUndefinedParameter,
  Fn120_testWeakMapAfterDeleteSymbol,
  Fn121_testSymbolWithMapValue,
  Fn123_testReduceSymbolCount,
  Fn124_testConfiguredNumberFormatSymbol,
  Fn125_testStaticClassSymbol,
  Fn126_testTransferredArrayBufferSymbol,
  Fn127_testReflectGetWithSymbol,
  Fn128_testStyledDateTimeFormatSymbol,
  Fn129_testSymbolInProxyWithGetHandler,
  Fn12_testPrimitiveParameter,
  Fn130_testWeakSetAfterDeleteSymbol,
  Fn131_testSymbolWithWeakMapValue,
  Fn132_testIntlDisplayNamesSymbol,
  Fn133_testExtensibleCheckWithSymbol,
  Fn135_testSymbolWithClassSetter,
  Fn136_testDataViewMultiTypeRWSymbol,
  Fn137_testIndexOfSymbolInArray,
  Fn13_testPrimitivePrototypeSymbol,
  Fn141_testSymbolWithWeakSetValue,
  Fn143_testModifySymbolValueWithDefineProperty,
  Fn144_testCurrencyNumberFormatSymbol,
  Fn146_testCopiedTypedArraySymbol,
  Fn147_testModifySymbolValueWithReflectSet,
  Fn148_testTimeStyledDateTimeFormatSymbol,
  Fn149_testFullConfigurableSymbol,
  Fn14_testSymbolWithUndefinedValue,
  Fn150_testWeakMapAfterGcSymbol,
  Fn151_testSymbolWithPromiseValue,
  Fn152_testSensitiveCollatorSymbol,
  Fn153_testLastIndexOfSymbolInArray,
  Fn155_testSymbolInProxyWithHasHandler,
  Fn156_testTypedArrayFromAbSymbol,
  Fn157_testPreventExtensionsNewSymbol,
  Fn158_testTypePluralRulesSymbol,
  Fn15_testSymbolOrderConsistency,
  Fn160_testWeakSetAfterGcSymbol,
  Fn161_testSymbolWithErrorValue,
  Fn162_testNumberStyledRelativeTimeFormatSymbol,
  Fn165_testSymbolFromArrowClassMethod,
  Fn166_testZeroLengthDataViewSymbol,
  Fn167_testConcatSymbolArray,
  Fn168_testExtendedLocaleSymbol,
  Fn169_testNonEnumWritableSymbol,
  Fn16_testDeletedSymbolProperty,
  Fn170_testWeakMapAfterMultiOpsSymbol,
  Fn173_testFrozenCannotModifyDescriptor,
  Fn174_testFallbackDisplayNamesSymbol,
  Fn175_testSymbolFromInheritedMethod,
  Fn176_testZeroLengthTypedArraySymbol,
  Fn177_testReflectDeleteSealedSymbol,
  Fn179_testSymbolInProxyWithDeleteHandler,
  Fn17_testNonConfigurableSymbol,
  Fn180_testWeakSetAfterMultiOpsSymbol,
  Fn181_testSymbolWithArrayBufferValue,
  Fn183_testSliceSymbolArray,
  Fn184_testPercentNumberFormatSymbol,
  Fn185_testSymbolFromStaticInheritedMethod,
  Fn186_testDataViewFromTypedArraySymbol,
  Fn187_testIsSealedCheckWithSymbol,
  Fn188_testTimezoneDateTimeFormatSymbol,
  Fn189_testSymbolInProxyWithDefineHandler,
  Fn18_testMixedSymbolAndStringProp,
  Fn190_testTypedArrayFromTypedArraySymbol,
  Fn19_testSymbolArrayIndexAccess,
  Fn20_testArrayObjectSymbol,
  Fn21_testFunctionObjectSymbol,
  Fn22_testSymbolWithObjectValue,
  Fn23_testMultipleCallsReturnDifferentArrays,
  Fn24_testDateObjectSymbol,
  Fn25_testSymbolFromObjectAssign,
  Fn26_testRegExpObjectSymbol,
  Fn27_testWritableSymbolProperty,
  Fn28_testTenDifferentSymbols,
  Fn29_testMapObjectSymbol,
  Fn30_testSymbolWithSpecialChars,
  Fn31_testSymbolsFromDefineProperties,
  Fn32_testSetObjectSymbol,
  Fn33_testSymbolWithSymbolValue,
  Fn34_testMultiLevelPrototypeSymbol,
  Fn35_testPromiseObjectSymbol,
  Fn36_testSymbolFromDestructuring,
  Fn37_testFrozenObjectSymbol,
  Fn39_testSymbolAndStringSameDesc,
  Fn40_testSealedObjectSymbol,
  Fn41_testArrayBufferSymbol,
  Fn42_testSymbolNotInObjectKeys,
  Fn43_testSymbolWithFunctionValue,
  Fn44_testTypedArraySymbol,
  Fn45_testSymbolNotInForIn,
  Fn46_testDeletePartialSymbols,
  Fn47_testErrorObjectSymbol,
  Fn48_testSymbolNotInJsonStringify,
  Fn49_testObjectWithNullPrototypeSymbol,
  Fn50_testCustomClassInstanceSymbol,
  Fn51_testWeakMapObjectSymbol,
  Fn52_testSymbolWithArrayValue,
  Fn53_testSymbolNotInGetOwnPropertyNames,
  Fn54_testWeakSetObjectSymbol,
  Fn55_testSymbolFromObjectCreateProps,
  Fn56_testDataViewObjectSymbol,
  Fn57_testIterateSymbolArray,
  Fn58_testSetWithElementsSymbol,
  Fn59_testSymbolWithGetter,
  Fn60_testMapWithEntriesSymbol,
  Fn61_testHasOwnSymbolProperty,
  Fn62_testTypeErrorInstanceSymbol,
  Fn63_testSymbolWithSetter,
  Fn65_testGetSymbolDescriptor,
  Fn66_testDifferentLenArrayBufferSymbol,
  Fn67_testSymbolFromClassMethod,
  Fn68_testFloat64ArraySymbol,
  Fn69_testPreventExtensionsSymbol,
  Fn70_testPendingPromiseSymbol,
  Fn71_testNonEnumNonConfigSymbol,
  Fn72_testRegExpWithFlagsSymbol,
  Fn73_testSymbolInSpreadOperator,
  Fn74_testDifferentDateSymbol,
  Fn75_testSymbolWithNullValue,
  Fn76_testArrowFunctionSymbol,
  Fn77_testFilterSymbolArray,
  Fn78_testGeneratorFunctionSymbol,
  Fn79_testMixedConfigSymbols,
  Fn80_testAsyncFunctionSymbol,
  Fn81_testAsyncGeneratorFunctionSymbol,
  Fn82_testSymbolWithBigIntValue,
  Fn83_testGetSymbolDescriptors,
  Fn85_testSymbolFromStaticClassMethod,
  Fn87_testFrozenSymbolValueUnchangeable,
  Fn89_testCustomSymbolSameAsBuiltIn,
  Fn91_testFindSymbolInArray,
  Fn92_testIntlDateTimeFormatSymbol,
  Fn93_testSymbolInProxyObject,
  Fn94_testArrayBufferSliceSymbol,
  Fn95_testSymbolInReflectOwnKeys,
  Fn96_testTypedArraySubarraySymbol,
  Fn97_testEnumNonConfigSymbol,
  Fn98_testWeakMapWithEntriesSymbol,
  Fn99_testSymbolAssignToFrozenObject
} from './Object12';

function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}


export default function Object12Test() {
  describe('Object12Test', () => {
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
     * @tc.name   Object12Test001
     * @tc.number SUB_BUILTINS_Object12_TEST_0100
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn01_testEmptyObject();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object12Test002
     * @tc.number SUB_BUILTINS_Object12_TEST_0200
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn02_testStringPropertiesOnly();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name   Object12Test003
     * @tc.number SUB_BUILTINS_Object12_TEST_0300
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn03_testWithOwnSymbolProperties();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object12Test004
     * @tc.number SUB_BUILTINS_Object12_TEST_0400
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn04_testNonEnumerableSymbol();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object12Test005
     * @tc.number SUB_BUILTINS_Object12_TEST_0500
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn05_testMixedEnumerableSymbol();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object12Test006
     * @tc.number SUB_BUILTINS_Object12_TEST_0600
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn06_testPrototypeChainSymbol();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object12Test007
     * @tc.number SUB_BUILTINS_Object12_TEST_0700
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn07_testReturnArrayIndependence();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object12Test008
     * @tc.number SUB_BUILTINS_Object12_TEST_0800
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn08_testMultipleSameDescSymbol();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object12Test009
     * @tc.number SUB_BUILTINS_Object12_TEST_0900
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn09_testSharedSymbol();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object12Test010
     * @tc.number SUB_BUILTINS_Object12_TEST_1000
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn10_testNullParameter();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object12Test011
     * @tc.number SUB_BUILTINS_Object12_TEST_1100
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn11_testUndefinedParameter();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object12Test012
     * @tc.number SUB_BUILTINS_Object12_TEST_1200
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn12_testPrimitiveParameter();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object12Test013
     * @tc.number SUB_BUILTINS_Object12_TEST_1300
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn13_testPrimitivePrototypeSymbol();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object12Test014
     * @tc.number SUB_BUILTINS_Object12_TEST_1400
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn14_testSymbolWithUndefinedValue();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object12Test015
     * @tc.number SUB_BUILTINS_Object12_TEST_1500
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn15_testSymbolOrderConsistency();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object12Test016
     * @tc.number SUB_BUILTINS_Object12_TEST_1600
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn16_testDeletedSymbolProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object12Test017
     * @tc.number SUB_BUILTINS_Object12_TEST_1700
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn17_testNonConfigurableSymbol();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object12Test018
     * @tc.number SUB_BUILTINS_Object12_TEST_1800
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn18_testMixedSymbolAndStringProp();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object12Test019
     * @tc.number SUB_BUILTINS_Object12_TEST_1900
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn19_testSymbolArrayIndexAccess();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object12Test020
     * @tc.number SUB_BUILTINS_Object12_TEST_2000
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn20_testArrayObjectSymbol();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object12Test021
     * @tc.number SUB_BUILTINS_Object12_TEST_2100
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn21_testFunctionObjectSymbol();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object12Test022
     * @tc.number SUB_BUILTINS_Object12_TEST_2200
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn22_testSymbolWithObjectValue();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object12Test023
     * @tc.number SUB_BUILTINS_Object12_TEST_2300
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn23_testMultipleCallsReturnDifferentArrays();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object12Test024
     * @tc.number SUB_BUILTINS_Object12_TEST_2400
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn24_testDateObjectSymbol();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object12Test025
     * @tc.number SUB_BUILTINS_Object12_TEST_2500
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn25_testSymbolFromObjectAssign();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object12Test026
     * @tc.number SUB_BUILTINS_Object12_TEST_2600
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn26_testRegExpObjectSymbol();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object12Test027
     * @tc.number SUB_BUILTINS_Object12_TEST_2700
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn27_testWritableSymbolProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object12Test028
     * @tc.number SUB_BUILTINS_Object12_TEST_2800
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn28_testTenDifferentSymbols();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object12Test029
     * @tc.number SUB_BUILTINS_Object12_TEST_2900
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn29_testMapObjectSymbol();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object12Test030
     * @tc.number SUB_BUILTINS_Object12_TEST_3000
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn30_testSymbolWithSpecialChars();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name   Object12Test031
     * @tc.number SUB_BUILTINS_Object12_TEST_3100
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn31_testSymbolsFromDefineProperties();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object12Test032
     * @tc.number SUB_BUILTINS_Object12_TEST_3200
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn32_testSetObjectSymbol();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object12Test033
     * @tc.number SUB_BUILTINS_Object12_TEST_3300
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn33_testSymbolWithSymbolValue();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object12Test034
     * @tc.number SUB_BUILTINS_Object12_TEST_3400
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn34_testMultiLevelPrototypeSymbol();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object12Test035
     * @tc.number SUB_BUILTINS_Object12_TEST_3500
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn35_testPromiseObjectSymbol();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object12Test036
     * @tc.number SUB_BUILTINS_Object12_TEST_3600
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn36_testSymbolFromDestructuring();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object12Test037
     * @tc.number SUB_BUILTINS_Object12_TEST_3700
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn37_testFrozenObjectSymbol();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object12Test039
     * @tc.number SUB_BUILTINS_Object12_TEST_3900
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn39_testSymbolAndStringSameDesc();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object12Test040
     * @tc.number SUB_BUILTINS_Object12_TEST_4000
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn40_testSealedObjectSymbol();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object12Test041
     * @tc.number SUB_BUILTINS_Object12_TEST_4100
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn41_testArrayBufferSymbol();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object12Test042
     * @tc.number SUB_BUILTINS_Object12_TEST_4200
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn42_testSymbolNotInObjectKeys();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object12Test043
     * @tc.number SUB_BUILTINS_Object12_TEST_4300
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn43_testSymbolWithFunctionValue();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object12Test044
     * @tc.number SUB_BUILTINS_Object12_TEST_4400
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn44_testTypedArraySymbol();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object12Test045
     * @tc.number SUB_BUILTINS_Object12_TEST_4500
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn45_testSymbolNotInForIn();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object12Test046
     * @tc.number SUB_BUILTINS_Object12_TEST_4600
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn46_testDeletePartialSymbols();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object12Test047
     * @tc.number SUB_BUILTINS_Object12_TEST_4700
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn47_testErrorObjectSymbol();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object12Test048
     * @tc.number SUB_BUILTINS_Object12_TEST_4800
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn48_testSymbolNotInJsonStringify();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object12Test049
     * @tc.number SUB_BUILTINS_Object12_TEST_4900
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn49_testObjectWithNullPrototypeSymbol();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object12Test050
     * @tc.number SUB_BUILTINS_Object12_TEST_5000
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn50_testCustomClassInstanceSymbol();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object12Test051
     * @tc.number SUB_BUILTINS_Object12_TEST_5100
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn51_testWeakMapObjectSymbol();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object12Test052
     * @tc.number SUB_BUILTINS_Object12_TEST_5200
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn52_testSymbolWithArrayValue();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object12Test053
     * @tc.number SUB_BUILTINS_Object12_TEST_5300
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn53_testSymbolNotInGetOwnPropertyNames();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object12Test054
     * @tc.number SUB_BUILTINS_Object12_TEST_5400
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn54_testWeakSetObjectSymbol();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object12Test055
     * @tc.number SUB_BUILTINS_Object12_TEST_5500
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn55_testSymbolFromObjectCreateProps();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object12Test056
     * @tc.number SUB_BUILTINS_Object12_TEST_5600
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn56_testDataViewObjectSymbol();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object12Test057
     * @tc.number SUB_BUILTINS_Object12_TEST_5700
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn57_testIterateSymbolArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object12Test058
     * @tc.number SUB_BUILTINS_Object12_TEST_5800
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn58_testSetWithElementsSymbol();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object12Test059
     * @tc.number SUB_BUILTINS_Object12_TEST_5900
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn59_testSymbolWithGetter();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object12Test060
     * @tc.number SUB_BUILTINS_Object12_TEST_6000
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn60_testMapWithEntriesSymbol();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name   Object12Test061
     * @tc.number SUB_BUILTINS_Object12_TEST_6100
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Fn61_testHasOwnSymbolProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object12Test062
     * @tc.number SUB_BUILTINS_Object12_TEST_6200
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn62_testTypeErrorInstanceSymbol();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object12Test063
     * @tc.number SUB_BUILTINS_Object12_TEST_6300
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn63_testSymbolWithSetter();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object12Test065
     * @tc.number SUB_BUILTINS_Object12_TEST_6500
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn65_testGetSymbolDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object12Test066
     * @tc.number SUB_BUILTINS_Object12_TEST_6600
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn66_testDifferentLenArrayBufferSymbol();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object12Test067
     * @tc.number SUB_BUILTINS_Object12_TEST_6700
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn67_testSymbolFromClassMethod();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object12Test068
     * @tc.number SUB_BUILTINS_Object12_TEST_6800
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn68_testFloat64ArraySymbol();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object12Test069
     * @tc.number SUB_BUILTINS_Object12_TEST_6900
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn69_testPreventExtensionsSymbol();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object12Test070
     * @tc.number SUB_BUILTINS_Object12_TEST_7000
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn70_testPendingPromiseSymbol();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object12Test071
     * @tc.number SUB_BUILTINS_Object12_TEST_7100
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn71_testNonEnumNonConfigSymbol();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object12Test072
     * @tc.number SUB_BUILTINS_Object12_TEST_7200
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn72_testRegExpWithFlagsSymbol();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object12Test073
     * @tc.number SUB_BUILTINS_Object12_TEST_7300
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn73_testSymbolInSpreadOperator();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object12Test074
     * @tc.number SUB_BUILTINS_Object12_TEST_7400
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn74_testDifferentDateSymbol();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object12Test075
     * @tc.number SUB_BUILTINS_Object12_TEST_7500
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn75_testSymbolWithNullValue();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object12Test076
     * @tc.number SUB_BUILTINS_Object12_TEST_7600
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn76_testArrowFunctionSymbol();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object12Test077
     * @tc.number SUB_BUILTINS_Object12_TEST_7700
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn77_testFilterSymbolArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object12Test078
     * @tc.number SUB_BUILTINS_Object12_TEST_7800
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn78_testGeneratorFunctionSymbol();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object12Test079
     * @tc.number SUB_BUILTINS_Object12_TEST_7900
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn79_testMixedConfigSymbols();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object12Test080
     * @tc.number SUB_BUILTINS_Object12_TEST_8000
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn80_testAsyncFunctionSymbol();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object12Test081
     * @tc.number SUB_BUILTINS_Object12_TEST_8100
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn81_testAsyncGeneratorFunctionSymbol();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object12Test082
     * @tc.number SUB_BUILTINS_Object12_TEST_8200
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn82_testSymbolWithBigIntValue();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object12Test083
     * @tc.number SUB_BUILTINS_Object12_TEST_8300
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn83_testGetSymbolDescriptors();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object12Test085
     * @tc.number SUB_BUILTINS_Object12_TEST_8500
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn85_testSymbolFromStaticClassMethod();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object12Test087
     * @tc.number SUB_BUILTINS_Object12_TEST_8700
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn87_testFrozenSymbolValueUnchangeable();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object12Test089
     * @tc.number SUB_BUILTINS_Object12_TEST_8900
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn89_testCustomSymbolSameAsBuiltIn();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object12Test091
     * @tc.number SUB_BUILTINS_Object12_TEST_9100
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn91_testFindSymbolInArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object12Test092
     * @tc.number SUB_BUILTINS_Object12_TEST_9200
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn92_testIntlDateTimeFormatSymbol();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object12Test093
     * @tc.number SUB_BUILTINS_Object12_TEST_9300
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn93_testSymbolInProxyObject();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object12Test094
     * @tc.number SUB_BUILTINS_Object12_TEST_9400
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn94_testArrayBufferSliceSymbol();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object12Test095
     * @tc.number SUB_BUILTINS_Object12_TEST_9500
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn95_testSymbolInReflectOwnKeys();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object12Test096
     * @tc.number SUB_BUILTINS_Object12_TEST_9600
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn96_testTypedArraySubarraySymbol();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object12Test097
     * @tc.number SUB_BUILTINS_Object12_TEST_9700
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn97_testEnumNonConfigSymbol();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object12Test098
     * @tc.number SUB_BUILTINS_Object12_TEST_9800
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn98_testWeakMapWithEntriesSymbol();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object12Test099
     * @tc.number SUB_BUILTINS_Object12_TEST_9900
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn99_testSymbolAssignToFrozenObject();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object12Test100
     * @tc.number SUB_BUILTINS_Object12_TEST_10000
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn100_testWeakSetWithElementsSymbol();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object12Test101
     * @tc.number SUB_BUILTINS_Object12_TEST_10100
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn101_testSymbolWithSharedValue();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object12Test102
     * @tc.number SUB_BUILTINS_Object12_TEST_10200
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn102_testIntlNumberFormatSymbol();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object12Test103
     * @tc.number SUB_BUILTINS_Object12_TEST_10300
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn103_testSymbolNotInJsonParse();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object12Test106
     * @tc.number SUB_BUILTINS_Object12_TEST_10600
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn106_testDataViewWithOffsetSymbol();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object12Test107
     * @tc.number SUB_BUILTINS_Object12_TEST_10700
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn107_testEverySymbolInArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object12Test108
     * @tc.number SUB_BUILTINS_Object12_TEST_10800
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn108_testClosedRangeSymbol();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object12Test109
     * @tc.number SUB_BUILTINS_Object12_TEST_10900
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn109_testSymbolAddedByCall();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object12Test111
     * @tc.number SUB_BUILTINS_Object12_TEST_11100
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn111_testSymbolWithSetValue();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object12Test112
     * @tc.number SUB_BUILTINS_Object12_TEST_11200
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn112_testIntlRelativeTimeFormatSymbol();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object12Test113
     * @tc.number SUB_BUILTINS_Object12_TEST_11300
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn113_testSealedCheckWithSymbol();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object12Test115
     * @tc.number SUB_BUILTINS_Object12_TEST_11500
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn115_testSymbolInProxyWithSetHandler();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object12Test116
     * @tc.number SUB_BUILTINS_Object12_TEST_11600
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn116_testTypedArrayAfterModifySymbol();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object12Test117
     * @tc.number SUB_BUILTINS_Object12_TEST_11700
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn117_testPrototypeGetWithSymbol();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object12Test118
     * @tc.number SUB_BUILTINS_Object12_TEST_11800
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn118_testIntlLocaleSymbol();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object12Test119
     * @tc.number SUB_BUILTINS_Object12_TEST_11900
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn119_testNonWritableNonConfigSymbol();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object12Test120
     * @tc.number SUB_BUILTINS_Object12_TEST_12000
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn120_testWeakMapAfterDeleteSymbol();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object12Test121
     * @tc.number SUB_BUILTINS_Object12_TEST_12100
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn121_testSymbolWithMapValue();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object12Test123
     * @tc.number SUB_BUILTINS_Object12_TEST_12300
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn123_testReduceSymbolCount();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object12Test124
     * @tc.number SUB_BUILTINS_Object12_TEST_12400
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn124_testConfiguredNumberFormatSymbol();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object12Test125
     * @tc.number SUB_BUILTINS_Object12_TEST_12500
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn125_testStaticClassSymbol();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object12Test126
     * @tc.number SUB_BUILTINS_Object12_TEST_12600
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn126_testTransferredArrayBufferSymbol();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object12Test127
     * @tc.number SUB_BUILTINS_Object12_TEST_12700
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn127_testReflectGetWithSymbol();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object12Test128
     * @tc.number SUB_BUILTINS_Object12_TEST_12800
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn128_testStyledDateTimeFormatSymbol();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object12Test129
     * @tc.number SUB_BUILTINS_Object12_TEST_12900
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn129_testSymbolInProxyWithGetHandler();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object12Test130
     * @tc.number SUB_BUILTINS_Object12_TEST_13000
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn130_testWeakSetAfterDeleteSymbol();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object12Test131
     * @tc.number SUB_BUILTINS_Object12_TEST_13100
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn131_testSymbolWithWeakMapValue();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object12Test132
     * @tc.number SUB_BUILTINS_Object12_TEST_13200
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn132_testIntlDisplayNamesSymbol();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object12Test133
     * @tc.number SUB_BUILTINS_Object12_TEST_13300
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn133_testExtensibleCheckWithSymbol();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object12Test135
     * @tc.number SUB_BUILTINS_Object12_TEST_13500
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn135_testSymbolWithClassSetter();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object12Test136
     * @tc.number SUB_BUILTINS_Object12_TEST_13600
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn136_testDataViewMultiTypeRWSymbol();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object12Test137
     * @tc.number SUB_BUILTINS_Object12_TEST_13700
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn137_testIndexOfSymbolInArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object12Test141
     * @tc.number SUB_BUILTINS_Object12_TEST_14100
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn141_testSymbolWithWeakSetValue();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object12Test143
     * @tc.number SUB_BUILTINS_Object12_TEST_14300
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn143_testModifySymbolValueWithDefineProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object12Test144
     * @tc.number SUB_BUILTINS_Object12_TEST_14400
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn144_testCurrencyNumberFormatSymbol();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object12Test146
     * @tc.number SUB_BUILTINS_Object12_TEST_14600
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn146_testCopiedTypedArraySymbol();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object12Test147
     * @tc.number SUB_BUILTINS_Object12_TEST_14700
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn147_testModifySymbolValueWithReflectSet();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object12Test148
     * @tc.number SUB_BUILTINS_Object12_TEST_14800
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn148_testTimeStyledDateTimeFormatSymbol();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object12Test149
     * @tc.number SUB_BUILTINS_Object12_TEST_14900
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn149_testFullConfigurableSymbol();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object12Test150
     * @tc.number SUB_BUILTINS_Object12_TEST_15000
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn150_testWeakMapAfterGcSymbol();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object12Test151
     * @tc.number SUB_BUILTINS_Object12_TEST_15100
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn151_testSymbolWithPromiseValue();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object12Test152
     * @tc.number SUB_BUILTINS_Object12_TEST_15200
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn152_testSensitiveCollatorSymbol();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object12Test153
     * @tc.number SUB_BUILTINS_Object12_TEST_15300
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn153_testLastIndexOfSymbolInArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object12Test155
     * @tc.number SUB_BUILTINS_Object12_TEST_15500
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn155_testSymbolInProxyWithHasHandler();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object12Test156
     * @tc.number SUB_BUILTINS_Object12_TEST_15600
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn156_testTypedArrayFromAbSymbol();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object12Test157
     * @tc.number SUB_BUILTINS_Object12_TEST_15700
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn157_testPreventExtensionsNewSymbol();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object12Test158
     * @tc.number SUB_BUILTINS_Object12_TEST_15800
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test158', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn158_testTypePluralRulesSymbol();
      expect(result).assertEqual(true);
    });


    /**
     * @tc.name   Object12Test160
     * @tc.number SUB_BUILTINS_Object12_TEST_16000
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn160_testWeakSetAfterGcSymbol();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object12Test161
     * @tc.number SUB_BUILTINS_Object12_TEST_16100
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test161', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn161_testSymbolWithErrorValue();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object12Test162
     * @tc.number SUB_BUILTINS_Object12_TEST_16200
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test162', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn162_testNumberStyledRelativeTimeFormatSymbol();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object12Test165
     * @tc.number SUB_BUILTINS_Object12_TEST_16500
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test165', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn165_testSymbolFromArrowClassMethod();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object12Test166
     * @tc.number SUB_BUILTINS_Object12_TEST_16600
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test166', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn166_testZeroLengthDataViewSymbol();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object12Test167
     * @tc.number SUB_BUILTINS_Object12_TEST_16700
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test167', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn167_testConcatSymbolArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object12Test168
     * @tc.number SUB_BUILTINS_Object12_TEST_16800
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test168', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn168_testExtendedLocaleSymbol();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object12Test169
     * @tc.number SUB_BUILTINS_Object12_TEST_16900
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test169', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn169_testNonEnumWritableSymbol();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object12Test170
     * @tc.number SUB_BUILTINS_Object12_TEST_17000
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn170_testWeakMapAfterMultiOpsSymbol();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object12Test173
     * @tc.number SUB_BUILTINS_Object12_TEST_17300
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test173', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn173_testFrozenCannotModifyDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object12Test174
     * @tc.number SUB_BUILTINS_Object12_TEST_17400
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test174', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn174_testFallbackDisplayNamesSymbol();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object12Test175
     * @tc.number SUB_BUILTINS_Object12_TEST_17500
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test175', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn175_testSymbolFromInheritedMethod();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object12Test176
     * @tc.number SUB_BUILTINS_Object12_TEST_17600
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test176', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn176_testZeroLengthTypedArraySymbol();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object12Test177
     * @tc.number SUB_BUILTINS_Object12_TEST_17700
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test177', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn177_testReflectDeleteSealedSymbol();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object12Test179
     * @tc.number SUB_BUILTINS_Object12_TEST_17900
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test179', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn179_testSymbolInProxyWithDeleteHandler();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object12Test180
     * @tc.number SUB_BUILTINS_Object12_TEST_18000
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn180_testWeakSetAfterMultiOpsSymbol();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object12Test181
     * @tc.number SUB_BUILTINS_Object12_TEST_18100
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test181', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn181_testSymbolWithArrayBufferValue();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object12Test183
     * @tc.number SUB_BUILTINS_Object12_TEST_18300
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test183', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn183_testSliceSymbolArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object12Test184
     * @tc.number SUB_BUILTINS_Object12_TEST_18400
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test184', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn184_testPercentNumberFormatSymbol();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object12Test185
     * @tc.number SUB_BUILTINS_Object12_TEST_18500
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test185', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn185_testSymbolFromStaticInheritedMethod();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object12Test186
     * @tc.number SUB_BUILTINS_Object12_TEST_18600
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test186', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn186_testDataViewFromTypedArraySymbol();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object12Test187
     * @tc.number SUB_BUILTINS_Object12_TEST_18700
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test187', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn187_testIsSealedCheckWithSymbol();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object12Test188
     * @tc.number SUB_BUILTINS_Object12_TEST_18800
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test188', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn188_testTimezoneDateTimeFormatSymbol();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object12Test189
     * @tc.number SUB_BUILTINS_Object12_TEST_18900
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test189', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn189_testSymbolInProxyWithDefineHandler();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object12Test190
     * @tc.number SUB_BUILTINS_Object12_TEST_19000
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object12Test190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn190_testTypedArrayFromTypedArraySymbol();
      expect(result).assertEqual(true);
    });

  })
}