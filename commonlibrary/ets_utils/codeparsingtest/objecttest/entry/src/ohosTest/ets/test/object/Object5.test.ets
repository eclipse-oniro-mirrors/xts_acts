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
  Fn02_testEnumerable,
  Fn04_testAccessorDescriptor,
  Fn05_testDescriptorConflict,
  Fn06_testWritableTrueOnNonConfigurable,
  Fn07_testEnumerableFalseGetNames,
  Fn08_testConfigurableTrueDelete,
  Fn09_testAccessorSetInvalidFilter,
  Fn100_testConfigurableTrueModifyMultiFields,
  Fn101_testAccessorSetArrayParam,
  Fn102_testValueWeakSetOperation,
  Fn103_testEnumerableFalseClassInstance,
  Fn104_testConfigurableFalseFrozenObj,
  Fn105_testAccessorGetExternalModule,
  Fn107_testEnumerableTrueProxyCapture,
  Fn108_testConfigurableTrueModifyAccessorEnumerable,
  Fn109_testAccessorSetLimitStringLength,
  Fn10_testDescriptorConflictWritableSet,
  Fn110_testValueErrorObject,
  Fn111_testEnumerableFalseGetAllDescriptors,
  Fn112_testConfigurableFalseSwitchToDataStrict,
  Fn113_testAccessorValueFormatConvert,
  Fn114_testWritableTrueAssignSymbol,
  Fn115_testEnumerableTrueForInInherit,
  Fn116_testConfigurableTrueDeleteRedefineNonConfig,
  Fn117_testAccessorSetObserverMode,
  Fn118_testValueBlobObject,
  Fn119_testEnumerableFalseObjectValuesExclude,
  Fn120_testConfigurableFalseModifyWritableSameValue,
  Fn121_testAccessorGetLazyLoad,
  Fn122_testWritableTrueAssignBigInt,
  Fn123_testEnumerableTrueJsonNested,
  Fn124_testConfigurableTrueModifyAccessorGetAndEnumerable,
  Fn125_testAccessorSetFilterNonInteger,
  Fn126_testAccessorSetNestedObjectMerge,
  Fn127_testValueNestedMapOperation,
  Fn128_testEnumerableFalseClassStatic,
  Fn129_testConfigurableFalseSealedObj,
  Fn12_testEnumerableDefaultFalse,
  Fn130_testAccessorGetRegExpMatch,
  Fn132_testEnumerableTrueProxyHasTrap,
  Fn133_testConfigurableTrueModifyToNonConfig,
  Fn134_testAccessorSetValidateDateFormat,
  Fn135_testValueNestedSetOperation,
  Fn136_testEnumerableFalseGetSymbolsExcludeString,
  Fn137_testConfigurableFalseModifySetterStrict,
  Fn138_testAccessorTwoWayFormat,
  Fn139_testWritableTrueAssignWeakMap,
  Fn13_testConfigurableDefaultFalse,
  Fn140_testEnumerableTrueForInExcludeInheritNonEnum,
  Fn141_testConfigurableTrueDeleteRedefineAccessorNonEnum,
  Fn142_testAccessorSetValidateObjectProps,
  Fn143_testValueCustomError,
  Fn144_testEnumerableFalseAssignNestedNonEnum,
  Fn145_testConfigurableFalseModifyValueAfterWritable,
  Fn146_testAccessorGetParamCache,
  Fn14_testAccessorGetExternalVar,
  Fn15_testValueReferenceModifyInner,
  Fn16_testConfigurableFalseWritableTrueToFalse,
  Fn17_testAccessorGetSetShareState,
  Fn19_testAccessorOnlySet,
  Fn20_testConfigurableTrueModifyValue,
  Fn21_testConfigurableTrueSwitchToAccessor,
  Fn22_testConfigurableFalseSwitchToData,
  Fn23_testDefineOnInstanceNotPrototype,
  Fn24_testDefineOnFrozenObject,
  Fn26_testAccessorSetUndefinedParam,
  Fn27_testValueNullPreserve,
  Fn28_testEnumerableTrueObjectValues,
  Fn29_testConfigurableFalseModifyGetter,
  Fn30_testAccessorGetThisOtherProp,
  Fn31_testWritableTrueMultiAssign,
  Fn32_testEnumerableFalseObjectEntries,
  Fn33_testConfigurableTrueModifyEnumerable,
  Fn34_testAccessorSetModifyOtherProp,
  Fn35_testDescriptorConflictGetValWritable,
  Fn36_testValueSymbolStorage,
  Fn37_testAccessorGetSetDefaultUndefined,
  Fn39_testAccessorGetThrowError,
  Fn40_testWritableFalseStrictErrorMsg,
  Fn41_testEnumerableTrueDestructure,
  Fn42_testConfigurableTrueSwitchToData,
  Fn43_testAccessorSetFilterNaN,
  Fn44_testValueFunctionCall,
  Fn45_testEnumerableFalseJsonStringify,
  Fn46_testConfigurableFalseModifySetter,
  Fn47_testAccessorClosureState,
  Fn48_testWritableTrueAssignUndefined,
  Fn49_testEnumerableTrueGetDescriptors,
  Fn50_testConfigurableTrueDeleteRedefine,
  Fn51_testAccessorSetInfinityParam,
  Fn52_testValueBigIntStorage,
  Fn53_testEnumerableFalseHasOwn,
  Fn54_testConfigurableFalseModifyEnumerable,
  Fn55_testAccessorGetReturnFunction,
  Fn56_testWritableFalseAssignSameValue,
  Fn57_testEnumerableTrueSpreadCopy,
  Fn58_testConfigurableTrueModifyWritableFalseToTrue,
  Fn59_testAccessorSetUpdateMultiProps,
  Fn61_testValueArrayModifyElements,
  Fn62_testEnumerableFalseForOf,
  Fn63_testConfigurableFalseRedefineToAccessor,
  Fn64_testAccessorGetDependInstanceMethod,
  Fn65_testWritableTrueAssignDifferentType,
  Fn66_testEnumerableTrueKeysOrder,
  Fn67_testConfigurableTrueDeleteLiteralRedefine,
  Fn68_testAccessorSetValidateType,
  Fn69_testValueRegExpMatch,
  Fn70_testEnumerableFalseGetSymbols,
  Fn71_testConfigurableFalseModifyValueWritableFalse,
  Fn72_testAccessorTwoWayBinding,
  Fn73_testWritableTrueAssignObjectLiteral,
  Fn74_testEnumerableTrueJsonParse,
  Fn75_testConfigurableTrueModifyGetter,
  Fn76_testAccessorSetLimitRange,
  Fn77_testValueDateGetTime,
  Fn78_testEnumerableFalseObjectAssign,
  Fn79_testConfigurableTrueModifySetter,
  Fn80_testAccessorGetCacheResult,
  Fn81_testAccessorSetEmptyObjectParam,
  Fn82_testValueMapOperation,
  Fn83_testEnumerableKeysVsNames,
  Fn85_testAccessorGetReturnPromise,
  Fn86_testWritableFalseStrictDifferentType,
  Fn87_testEnumerableValuesVsEntries,
  Fn88_testConfigurableTrueModifyMixedDesc,
  Fn89_testAccessorSetFilterEmptyString,
  Fn90_testValueSetOperation,
  Fn91_testEnumerableFalseCustomToJSON,
  Fn92_testConfigurableFalseModifyWritableFalseToTrue,
  Fn94_testWritableTrueAssignFunction,
  Fn95_testEnumerableTrueDestructureDefault,
  Fn96_testConfigurableTrueDeleteRedefineDesc,
  Fn97_testAccessorSetLogOperation,
  Fn98_testValueWeakMapOperation,
  Fn99_testEnumerableFalseGetDescriptor
} from './Object5';
import {
  Fn147_testWritableTrueAssignBigIntCompare,
  Fn148_testEnumerableTrueJsonNestedArray,
  Fn149_testConfigurableTrueModifyValueAndWritable,
  Fn150_testAccessorSetFilterFutureDate,
  Fn151_testFileListValueEntries,
  Fn152_testBracketsInKeyEntries,
  Fn154_testArrayReduceEntries,
  Fn156_testBracesInKeyEntries,
  Fn158_testArrayEveryEntries,
  Fn160_testPipeInKeyEntries,
  Fn162_testHyphenNumberKeyEntries,
  Fn164_testArraySomeEntries,
  Fn166_testUnderscoreNumberKeyEntries,
  Fn167_testWebSocketValueEntries,
  Fn168_testArrayFindEntries,
  Fn169_testWorkerValueEntries,
  Fn170_testLetterSymbolMixKeyEntries,
  Fn171_testSharedWorkerValueEntries,
  Fn172_testArrayFindIndexEntries,
  Fn173_testBroadcastChannelValueEntries,
  Fn174_testMultiLangCharKeyEntries,
  Fn175_testCacheStorageValueEntries,
  Fn176_testArrayIncludesEntries,
  Fn178_testEmojiLetterMixKeyEntries,
  Fn179_testIDBDatabaseValueEntries,
  Fn180_testArrayJoinEntries,
  Fn181_testWasmInstanceValueEntries,
  Fn182_testSlashNumberKeyEntries,
  Fn183_testPointerLockControlsValueEntries,
  Fn184_testArrayReverseConsistencyEntries,
  Fn185_testDeviceOrientationEventValueEntries,
  Fn186_testColonNumberKeyEntries,
  Fn187_testGyroscopeValueEntries,
  Fn188_testArraySortStabilityEntries,
  Fn189_testMagnetometerValueEntries,
  Fn190_testSemicolonLetterKeyEntries,
  Fn191_testBarometerValueEntries,
  Fn192_testArrayFillFullEntries,
  Fn193_testLightSensorValueEntries,
  Fn194_testEqualsLetterKeyEntries,
  Fn195_testProximitySensorValueEntries,
  Fn196_testArraySpliceMultiEntries,
  Fn197_testAmbientLightSensorValueEntries,
  Fn198_testAmpersandLetterKeyEntries,
  Fn199_testGeolocationCoordinatesValueEntries,
  Fn200_testArrayFlatMapNestedEntries
} from './object5plus';

function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}


export default function Object5Test() {
  describe('Object5Test', () => {
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
     * @tc.name   Object5Test002
     * @tc.number SUB_BUILTINS_OBJECT5_TEST_0200
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object5Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Fn02_testEnumerable();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object5Test004
     * @tc.number SUB_BUILTINS_OBJECT5_TEST_0400
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object5Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn04_testAccessorDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object5Test005
     * @tc.number SUB_BUILTINS_OBJECT5_TEST_0500
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object5Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn05_testDescriptorConflict();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object5Test006
     * @tc.number SUB_BUILTINS_OBJECT5_TEST_0600
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object5Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn06_testWritableTrueOnNonConfigurable();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object5Test007
     * @tc.number SUB_BUILTINS_OBJECT5_TEST_0700
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object5Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn07_testEnumerableFalseGetNames();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object5Test008
     * @tc.number SUB_BUILTINS_OBJECT5_TEST_0800
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object5Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn08_testConfigurableTrueDelete();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object5Test009
     * @tc.number SUB_BUILTINS_OBJECT5_TEST_0900
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object5Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn09_testAccessorSetInvalidFilter();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object5Test010
     * @tc.number SUB_BUILTINS_OBJECT5_TEST_1000
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object5Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn10_testDescriptorConflictWritableSet();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object5Test012
     * @tc.number SUB_BUILTINS_OBJECT5_TEST_1200
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object5Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn12_testEnumerableDefaultFalse();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object5Test013
     * @tc.number SUB_BUILTINS_OBJECT5_TEST_1300
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object5Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn13_testConfigurableDefaultFalse();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object5Test014
     * @tc.number SUB_BUILTINS_OBJECT5_TEST_1400
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object5Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn14_testAccessorGetExternalVar();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object5Test015
     * @tc.number SUB_BUILTINS_OBJECT5_TEST_1500
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object5Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn15_testValueReferenceModifyInner();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object5Test016
     * @tc.number SUB_BUILTINS_OBJECT5_TEST_1600
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object5Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn16_testConfigurableFalseWritableTrueToFalse();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   Object5Test017
     * @tc.number SUB_BUILTINS_OBJECT5_TEST_1700
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object5Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn17_testAccessorGetSetShareState();
      expect(result).assertEqual(true);
    });


    /**
     * @tc.name   Object5Test019
     * @tc.number SUB_BUILTINS_OBJECT5_TEST_1900
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object5Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn19_testAccessorOnlySet();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object5Test020
     * @tc.number SUB_BUILTINS_OBJECT5_TEST_2000
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object5Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn20_testConfigurableTrueModifyValue();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object5Test021
     * @tc.number SUB_BUILTINS_OBJECT5_TEST_2100
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object5Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn21_testConfigurableTrueSwitchToAccessor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object5Test022
     * @tc.number SUB_BUILTINS_OBJECT5_TEST_2200
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object5Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn22_testConfigurableFalseSwitchToData();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object5Test023
     * @tc.number SUB_BUILTINS_OBJECT5_TEST_2300
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object5Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn23_testDefineOnInstanceNotPrototype();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object5Test024
     * @tc.number SUB_BUILTINS_OBJECT5_TEST_2400
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object5Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn24_testDefineOnFrozenObject();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object5Test026
     * @tc.number SUB_BUILTINS_OBJECT5_TEST_2600
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object5Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn26_testAccessorSetUndefinedParam();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object5Test027
     * @tc.number SUB_BUILTINS_OBJECT5_TEST_2700
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object5Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn27_testValueNullPreserve();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object5Test028
     * @tc.number SUB_BUILTINS_OBJECT5_TEST_2800
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object5Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn28_testEnumerableTrueObjectValues();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object5Test029
     * @tc.number SUB_BUILTINS_OBJECT5_TEST_2900
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object5Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn29_testConfigurableFalseModifyGetter();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object5Test030
     * @tc.number SUB_BUILTINS_OBJECT5_TEST_3000
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object5Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn30_testAccessorGetThisOtherProp();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object5Test031
     * @tc.number SUB_BUILTINS_OBJECT5_TEST_3100
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object5Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn31_testWritableTrueMultiAssign();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object5Test032
     * @tc.number SUB_BUILTINS_OBJECT5_TEST_3200
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object5Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn32_testEnumerableFalseObjectEntries();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object5Test033
     * @tc.number SUB_BUILTINS_OBJECT5_TEST_3300
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object5Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn33_testConfigurableTrueModifyEnumerable();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object5Test034
     * @tc.number SUB_BUILTINS_OBJECT5_TEST_3400
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object5Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn34_testAccessorSetModifyOtherProp();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object5Test035
     * @tc.number SUB_BUILTINS_OBJECT5_TEST_3500
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object5Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn35_testDescriptorConflictGetValWritable();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object5Test036
     * @tc.number SUB_BUILTINS_OBJECT5_TEST_3600
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object5Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn36_testValueSymbolStorage();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object5Test037
     * @tc.number SUB_BUILTINS_OBJECT5_TEST_3700
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object5Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn37_testAccessorGetSetDefaultUndefined();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object5Test039
     * @tc.number SUB_BUILTINS_OBJECT5_TEST_3900
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object5Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn39_testAccessorGetThrowError();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object5Test040
     * @tc.number SUB_BUILTINS_OBJECT5_TEST_4000
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object5Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn40_testWritableFalseStrictErrorMsg();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object5Test041
     * @tc.number SUB_BUILTINS_OBJECT5_TEST_4100
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object5Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn41_testEnumerableTrueDestructure();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object5Test042
     * @tc.number SUB_BUILTINS_OBJECT5_TEST_4200
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object5Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn42_testConfigurableTrueSwitchToData();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object5Test043
     * @tc.number SUB_BUILTINS_OBJECT5_TEST_4300
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object5Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn43_testAccessorSetFilterNaN();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object5Test044
     * @tc.number SUB_BUILTINS_OBJECT5_TEST_4400
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object5Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn44_testValueFunctionCall();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object5Test045
     * @tc.number SUB_BUILTINS_OBJECT5_TEST_4500
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object5Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn45_testEnumerableFalseJsonStringify();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object5Test046
     * @tc.number SUB_BUILTINS_OBJECT5_TEST_4600
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object5Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn46_testConfigurableFalseModifySetter();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object5Test047
     * @tc.number SUB_BUILTINS_OBJECT5_TEST_4700
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object5Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn47_testAccessorClosureState();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object5Test048
     * @tc.number SUB_BUILTINS_OBJECT5_TEST_4800
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object5Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn48_testWritableTrueAssignUndefined();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object5Test049
     * @tc.number SUB_BUILTINS_OBJECT5_TEST_4900
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object5Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn49_testEnumerableTrueGetDescriptors();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object5Test050
     * @tc.number SUB_BUILTINS_OBJECT5_TEST_5000
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object5Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn50_testConfigurableTrueDeleteRedefine();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name   Object5Test051
     * @tc.number SUB_BUILTINS_OBJECT5_TEST_5100
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object5Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn51_testAccessorSetInfinityParam();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object5Test052
     * @tc.number SUB_BUILTINS_OBJECT5_TEST_5200
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object5Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn52_testValueBigIntStorage();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object5Test053
     * @tc.number SUB_BUILTINS_OBJECT5_TEST_5300
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object5Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn53_testEnumerableFalseHasOwn();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object5Test054
     * @tc.number SUB_BUILTINS_OBJECT5_TEST_5400
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object5Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn54_testConfigurableFalseModifyEnumerable();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object5Test055
     * @tc.number SUB_BUILTINS_OBJECT5_TEST_5500
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object5Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn55_testAccessorGetReturnFunction();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object5Test056
     * @tc.number SUB_BUILTINS_OBJECT5_TEST_5600
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object5Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn56_testWritableFalseAssignSameValue();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   Object5Test057
     * @tc.number SUB_BUILTINS_OBJECT5_TEST_5700
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object5Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn57_testEnumerableTrueSpreadCopy();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object5Test058
     * @tc.number SUB_BUILTINS_OBJECT5_TEST_5800
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object5Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn58_testConfigurableTrueModifyWritableFalseToTrue();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object5Test059
     * @tc.number SUB_BUILTINS_OBJECT5_TEST_5900
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object5Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn59_testAccessorSetUpdateMultiProps();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object5Test061
     * @tc.number SUB_BUILTINS_OBJECT5_TEST_6100
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object5Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn61_testValueArrayModifyElements();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object5Test062
     * @tc.number SUB_BUILTINS_OBJECT5_TEST_6200
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object5Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn62_testEnumerableFalseForOf();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object5Test063
     * @tc.number SUB_BUILTINS_OBJECT5_TEST_6300
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object5Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn63_testConfigurableFalseRedefineToAccessor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object5Test064
     * @tc.number SUB_BUILTINS_OBJECT5_TEST_6400
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object5Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn64_testAccessorGetDependInstanceMethod();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object5Test065
     * @tc.number SUB_BUILTINS_OBJECT5_TEST_6500
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object5Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn65_testWritableTrueAssignDifferentType();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object5Test066
     * @tc.number SUB_BUILTINS_OBJECT5_TEST_6600
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object5Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn66_testEnumerableTrueKeysOrder();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object5Test067
     * @tc.number SUB_BUILTINS_OBJECT5_TEST_6700
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object5Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn67_testConfigurableTrueDeleteLiteralRedefine();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object5Test068
     * @tc.number SUB_BUILTINS_OBJECT5_TEST_6800
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object5Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn68_testAccessorSetValidateType();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object5Test069
     * @tc.number SUB_BUILTINS_OBJECT5_TEST_6900
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object5Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn69_testValueRegExpMatch();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object5Test070
     * @tc.number SUB_BUILTINS_OBJECT5_TEST_7000
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object5Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn70_testEnumerableFalseGetSymbols();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object5Test071
     * @tc.number SUB_BUILTINS_OBJECT5_TEST_7100
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object5Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn71_testConfigurableFalseModifyValueWritableFalse();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object5Test072
     * @tc.number SUB_BUILTINS_OBJECT5_TEST_7200
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object5Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn72_testAccessorTwoWayBinding();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object5Test073
     * @tc.number SUB_BUILTINS_OBJECT5_TEST_7300
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object5Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn73_testWritableTrueAssignObjectLiteral();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object5Test074
     * @tc.number SUB_BUILTINS_OBJECT5_TEST_7400
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object5Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn74_testEnumerableTrueJsonParse();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object5Test075
     * @tc.number SUB_BUILTINS_OBJECT5_TEST_7500
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object5Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn75_testConfigurableTrueModifyGetter();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object5Test076
     * @tc.number SUB_BUILTINS_OBJECT5_TEST_7600
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object5Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn76_testAccessorSetLimitRange();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object5Test077
     * @tc.number SUB_BUILTINS_OBJECT5_TEST_7700
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object5Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn77_testValueDateGetTime();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object5Test078
     * @tc.number SUB_BUILTINS_OBJECT5_TEST_7800
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object5Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn78_testEnumerableFalseObjectAssign();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object5Test079
     * @tc.number SUB_BUILTINS_OBJECT5_TEST_7900
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object5Test079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn79_testConfigurableTrueModifySetter();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object5Test080
     * @tc.number SUB_BUILTINS_OBJECT5_TEST_8000
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object5Test080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn80_testAccessorGetCacheResult();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name   Object5Test081
     * @tc.number SUB_BUILTINS_OBJECT5_TEST_8100
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object5Test081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn81_testAccessorSetEmptyObjectParam();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object5Test082
     * @tc.number SUB_BUILTINS_OBJECT5_TEST_8200
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object5Test082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn82_testValueMapOperation();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object5Test083
     * @tc.number SUB_BUILTINS_OBJECT5_TEST_8300
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object5Test083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn83_testEnumerableKeysVsNames();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object5Test085
     * @tc.number SUB_BUILTINS_OBJECT5_TEST_8500
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object5Test085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn85_testAccessorGetReturnPromise();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object5Test086
     * @tc.number SUB_BUILTINS_OBJECT5_TEST_8600
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object5Test086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn86_testWritableFalseStrictDifferentType();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object5Test087
     * @tc.number SUB_BUILTINS_OBJECT5_TEST_8700
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object5Test087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn87_testEnumerableValuesVsEntries();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object5Test088
     * @tc.number SUB_BUILTINS_OBJECT5_TEST_8800
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object5Test088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn88_testConfigurableTrueModifyMixedDesc();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object5Test089
     * @tc.number SUB_BUILTINS_OBJECT5_TEST_8900
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object5Test089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn89_testAccessorSetFilterEmptyString();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object5Test090
     * @tc.number SUB_BUILTINS_OBJECT5_TEST_9000
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object5Test090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn90_testValueSetOperation();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object5Test091
     * @tc.number SUB_BUILTINS_OBJECT5_TEST_9100
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object5Test091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn91_testEnumerableFalseCustomToJSON();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object5Test092
     * @tc.number SUB_BUILTINS_OBJECT5_TEST_9200
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object5Test092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn92_testConfigurableFalseModifyWritableFalseToTrue();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object5Test094
     * @tc.number SUB_BUILTINS_OBJECT5_TEST_9400
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object5Test094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn94_testWritableTrueAssignFunction();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object5Test095
     * @tc.number SUB_BUILTINS_OBJECT5_TEST_9500
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object5Test095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn95_testEnumerableTrueDestructureDefault();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object5Test096
     * @tc.number SUB_BUILTINS_OBJECT5_TEST_9600
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object5Test096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn96_testConfigurableTrueDeleteRedefineDesc();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object5Test097
     * @tc.number SUB_BUILTINS_OBJECT5_TEST_9700
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object5Test097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn97_testAccessorSetLogOperation();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object5Test098
     * @tc.number SUB_BUILTINS_OBJECT5_TEST_9800
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object5Test098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn98_testValueWeakMapOperation();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object5Test099
     * @tc.number SUB_BUILTINS_OBJECT5_TEST_9900
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object5Test099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn99_testEnumerableFalseGetDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object5Test100
     * @tc.number SUB_BUILTINS_OBJECT5_TEST_10000
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object5Test100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn100_testConfigurableTrueModifyMultiFields();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object5Test101
     * @tc.number SUB_BUILTINS_OBJECT5_TEST_10100
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object5Test101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn101_testAccessorSetArrayParam();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object5Test102
     * @tc.number SUB_BUILTINS_OBJECT5_TEST_10200
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object5Test102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn102_testValueWeakSetOperation();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object5Test103
     * @tc.number SUB_BUILTINS_OBJECT5_TEST_10300
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object5Test103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn103_testEnumerableFalseClassInstance();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object5Test104
     * @tc.number SUB_BUILTINS_OBJECT5_TEST_10400
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object5Test104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn104_testConfigurableFalseFrozenObj();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object5Test105
     * @tc.number SUB_BUILTINS_OBJECT5_TEST_10500
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object5Test105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn105_testAccessorGetExternalModule();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object5Test107
     * @tc.number SUB_BUILTINS_OBJECT5_TEST_10700
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object5Test107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn107_testEnumerableTrueProxyCapture();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object5Test108
     * @tc.number SUB_BUILTINS_OBJECT5_TEST_10800
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object5Test108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn108_testConfigurableTrueModifyAccessorEnumerable();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object5Test109
     * @tc.number SUB_BUILTINS_OBJECT5_TEST_10900
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object5Test109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn109_testAccessorSetLimitStringLength();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object5Test110
     * @tc.number SUB_BUILTINS_OBJECT5_TEST_11000
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object5Test110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn110_testValueErrorObject();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name   Object5Test111
     * @tc.number SUB_BUILTINS_OBJECT5_TEST_11100
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object5Test111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn111_testEnumerableFalseGetAllDescriptors();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object5Test112
     * @tc.number SUB_BUILTINS_OBJECT5_TEST_11200
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object5Test112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn112_testConfigurableFalseSwitchToDataStrict();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object5Test113
     * @tc.number SUB_BUILTINS_OBJECT5_TEST_11300
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object5Test113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn113_testAccessorValueFormatConvert();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object5Test114
     * @tc.number SUB_BUILTINS_OBJECT5_TEST_11400
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object5Test114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn114_testWritableTrueAssignSymbol();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object5Test115
     * @tc.number SUB_BUILTINS_OBJECT5_TEST_11500
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object5Test115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn115_testEnumerableTrueForInInherit();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object5Test116
     * @tc.number SUB_BUILTINS_OBJECT5_TEST_11600
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object5Test116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn116_testConfigurableTrueDeleteRedefineNonConfig();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object5Test117
     * @tc.number SUB_BUILTINS_OBJECT5_TEST_11700
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object5Test117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn117_testAccessorSetObserverMode();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object5Test118
     * @tc.number SUB_BUILTINS_OBJECT5_TEST_11800
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object5Test118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn118_testValueBlobObject();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object5Test119
     * @tc.number SUB_BUILTINS_OBJECT5_TEST_11900
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object5Test119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn119_testEnumerableFalseObjectValuesExclude();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object5Test120
     * @tc.number SUB_BUILTINS_OBJECT5_TEST_12000
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object5Test120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn120_testConfigurableFalseModifyWritableSameValue();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   Object5Test121
     * @tc.number SUB_BUILTINS_OBJECT5_TEST_12100
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object5Test121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn121_testAccessorGetLazyLoad();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object5Test122
     * @tc.number SUB_BUILTINS_OBJECT5_TEST_12200
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object5Test122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn122_testWritableTrueAssignBigInt();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object5Test123
     * @tc.number SUB_BUILTINS_OBJECT5_TEST_12300
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object5Test123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn123_testEnumerableTrueJsonNested();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object5Test124
     * @tc.number SUB_BUILTINS_OBJECT5_TEST_12400
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object5Test124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn124_testConfigurableTrueModifyAccessorGetAndEnumerable();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object5Test125
     * @tc.number SUB_BUILTINS_OBJECT5_TEST_12500
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object5Test125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn125_testAccessorSetFilterNonInteger();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object5Test126
     * @tc.number SUB_BUILTINS_OBJECT5_TEST_12600
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object5Test126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn126_testAccessorSetNestedObjectMerge();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object5Test127
     * @tc.number SUB_BUILTINS_OBJECT5_TEST_12700
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object5Test127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn127_testValueNestedMapOperation();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object5Test128
     * @tc.number SUB_BUILTINS_OBJECT5_TEST_12800
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object5Test128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn128_testEnumerableFalseClassStatic();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object5Test129
     * @tc.number SUB_BUILTINS_OBJECT5_TEST_12900
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object5Test129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn129_testConfigurableFalseSealedObj();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object5Test130
     * @tc.number SUB_BUILTINS_OBJECT5_TEST_13000
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object5Test130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn130_testAccessorGetRegExpMatch();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object5Test132
     * @tc.number SUB_BUILTINS_OBJECT5_TEST_13200
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object5Test132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn132_testEnumerableTrueProxyHasTrap();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object5Test133
     * @tc.number SUB_BUILTINS_OBJECT5_TEST_13300
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object5Test133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn133_testConfigurableTrueModifyToNonConfig();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object5Test134
     * @tc.number SUB_BUILTINS_OBJECT5_TEST_13400
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object5Test134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn134_testAccessorSetValidateDateFormat();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   Object5Test135
     * @tc.number SUB_BUILTINS_OBJECT5_TEST_13500
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object5Test135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn135_testValueNestedSetOperation();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object5Test136
     * @tc.number SUB_BUILTINS_OBJECT5_TEST_13600
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object5Test136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn136_testEnumerableFalseGetSymbolsExcludeString();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object5Test137
     * @tc.number SUB_BUILTINS_OBJECT5_TEST_13700
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object5Test137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn137_testConfigurableFalseModifySetterStrict();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object5Test138
     * @tc.number SUB_BUILTINS_OBJECT5_TEST_13800
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object5Test138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn138_testAccessorTwoWayFormat();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object5Test139
     * @tc.number SUB_BUILTINS_OBJECT5_TEST_13900
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object5Test139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn139_testWritableTrueAssignWeakMap();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object5Test140
     * @tc.number SUB_BUILTINS_OBJECT5_TEST_14000
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object5Test140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn140_testEnumerableTrueForInExcludeInheritNonEnum();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object5Test141
     * @tc.number SUB_BUILTINS_OBJECT5_TEST_14100
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object5Test141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn141_testConfigurableTrueDeleteRedefineAccessorNonEnum();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object5Test142
     * @tc.number SUB_BUILTINS_OBJECT5_TEST_14200
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object5Test142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn142_testAccessorSetValidateObjectProps();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object5Test143
     * @tc.number SUB_BUILTINS_OBJECT5_TEST_14300
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object5Test143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn143_testValueCustomError();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object5Test144
     * @tc.number SUB_BUILTINS_OBJECT5_TEST_14400
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object5Test144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn144_testEnumerableFalseAssignNestedNonEnum();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   Object5Test145
     * @tc.number SUB_BUILTINS_OBJECT5_TEST_14500
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object5Test145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn145_testConfigurableFalseModifyValueAfterWritable();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   Object5Test146
     * @tc.number SUB_BUILTINS_OBJECT5_TEST_14600
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object5Test146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn146_testAccessorGetParamCache();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object5Test147
     * @tc.number SUB_BUILTINS_OBJECT5_TEST_14700
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object5Test147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn147_testWritableTrueAssignBigIntCompare();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object5Test148
     * @tc.number SUB_BUILTINS_OBJECT5_TEST_14800
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object5Test148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn148_testEnumerableTrueJsonNestedArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object5Test149
     * @tc.number SUB_BUILTINS_OBJECT5_TEST_14900
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object5Test149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn149_testConfigurableTrueModifyValueAndWritable();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object5Test150
     * @tc.number SUB_BUILTINS_OBJECT5_TEST_15000
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object5Test150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn150_testAccessorSetFilterFutureDate();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name   Object31Test151
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_15100
     * @tc.desc   test object entries with FileList value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Fn151_testFileListValueEntries();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test152
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_15200
     * @tc.desc   test object entries with brackets in key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Fn152_testBracketsInKeyEntries();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test154
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_15400
     * @tc.desc   test object entries with array reduce
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Fn154_testArrayReduceEntries();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test156
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_15600
     * @tc.desc   test object entries with braces in key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Fn156_testBracesInKeyEntries();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test158
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_15800
     * @tc.desc   test object entries with array every
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test158', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Fn158_testArrayEveryEntries();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test160
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_16000
     * @tc.desc   test object entries with pipe in key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Fn160_testPipeInKeyEntries();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test162
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_16200
     * @tc.desc   test object entries with hyphen number key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test162', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Fn162_testHyphenNumberKeyEntries();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test164
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_16400
     * @tc.desc   test object entries with array some
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test164', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Fn164_testArraySomeEntries();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test166
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_16600
     * @tc.desc   test object entries with underscore number key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test166', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Fn166_testUnderscoreNumberKeyEntries();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test167
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_16700
     * @tc.desc   test object entries with WebSocket value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test167', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Fn167_testWebSocketValueEntries();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test168
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_16800
     * @tc.desc   test object entries with array find
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test168', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Fn168_testArrayFindEntries();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test169
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_16900
     * @tc.desc   test object entries with Worker value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test169', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Fn169_testWorkerValueEntries();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test170
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_17000
     * @tc.desc   test object entries with letter symbol mix key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Fn170_testLetterSymbolMixKeyEntries();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test171
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_17100
     * @tc.desc   test object entries with SharedWorker value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test171', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Fn171_testSharedWorkerValueEntries();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test172
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_17200
     * @tc.desc   test object entries with array find index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test172', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Fn172_testArrayFindIndexEntries();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test173
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_17300
     * @tc.desc   test object entries with BroadcastChannel value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test173', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Fn173_testBroadcastChannelValueEntries();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test174
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_17400
     * @tc.desc   test object entries with multi language char key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test174', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Fn174_testMultiLangCharKeyEntries();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test175
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_17500
     * @tc.desc   test object entries with CacheStorage value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test175', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Fn175_testCacheStorageValueEntries();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test176
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_17600
     * @tc.desc   test object entries with array includes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test176', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Fn176_testArrayIncludesEntries();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test178
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_17800
     * @tc.desc   test object entries with emoji letter mix key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test178', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Fn178_testEmojiLetterMixKeyEntries();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test179
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_17900
     * @tc.desc   test object entries with IDBDatabase value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test179', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let result: boolean = await Fn179_testIDBDatabaseValueEntries();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test180
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_18000
     * @tc.desc   test object entries with array join
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Fn180_testArrayJoinEntries();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test181
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_18100
     * @tc.desc   test object entries with Wasm instance value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test181', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Fn181_testWasmInstanceValueEntries();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test182
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_18200
     * @tc.desc   test object entries with slash number key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test182', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Fn182_testSlashNumberKeyEntries();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test183
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_18300
     * @tc.desc   test object entries with PointerLockControls value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test183', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Fn183_testPointerLockControlsValueEntries();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test184
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_18400
     * @tc.desc   test object entries with array reverse consistency
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test184', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Fn184_testArrayReverseConsistencyEntries();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name   Object31Test185
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_18500
     * @tc.desc   test object entries with DeviceOrientationEvent value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test185', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Fn185_testDeviceOrientationEventValueEntries();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test186
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_18600
     * @tc.desc   test object entries with colon number key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test186', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Fn186_testColonNumberKeyEntries();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test187
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_18700
     * @tc.desc   test object entries with Gyroscope value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test187', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Fn187_testGyroscopeValueEntries();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test188
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_18800
     * @tc.desc   test object entries with array sort stability
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test188', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Fn188_testArraySortStabilityEntries();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test189
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_18900
     * @tc.desc   test object entries with Magnetometer value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test189', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Fn189_testMagnetometerValueEntries();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test190
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_19000
     * @tc.desc   test object entries with semicolon letter key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Fn190_testSemicolonLetterKeyEntries();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test191
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_19100
     * @tc.desc   test object entries with Barometer value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test191', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Fn191_testBarometerValueEntries();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test192
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_19200
     * @tc.desc   test object entries with array fill full
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test192', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Fn192_testArrayFillFullEntries();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test193
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_19300
     * @tc.desc   test object entries with LightSensor value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test193', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Fn193_testLightSensorValueEntries();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test194
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_19400
     * @tc.desc   test object entries with equals letter key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test194', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Fn194_testEqualsLetterKeyEntries();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test195
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_19500
     * @tc.desc   test object entries with ProximitySensor value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test195', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Fn195_testProximitySensorValueEntries();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test196
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_19600
     * @tc.desc   test object entries with array splice multi
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test196', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Fn196_testArraySpliceMultiEntries();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test197
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_19700
     * @tc.desc   test object entries with AmbientLightSensor value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test197', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Fn197_testAmbientLightSensorValueEntries();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test198
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_19800
     * @tc.desc   test object entries with ampersand letter key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test198', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Fn198_testAmpersandLetterKeyEntries();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test199
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_19900
     * @tc.desc   test object entries with GeolocationCoordinates value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test199', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Fn199_testGeolocationCoordinatesValueEntries();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object31Test200
     * @tc.number SUB_BUILTINS_OBJECT31_TEST_20000
     * @tc.desc   test object entries with array flatMap nested
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object31Test200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Fn200_testArrayFlatMapNestedEntries();
      expect(result).assertEqual(true);
    });

  })
}