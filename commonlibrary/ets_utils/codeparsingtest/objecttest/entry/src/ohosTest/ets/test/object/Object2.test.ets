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
  Fn01_testBasicPropertyCopy,
  Fn02_testSamePropertyOverride,
  Fn03_testSymbolPropertyCopy,
  Fn04_testDeepCopyFailure,
  Fn05_testIgnoreNullUndefinedSource,
  Fn06_testMultiSourceOrder,
  Fn07_testPreserveTargetNonOverlapProps,
  Fn08_testArrayAsSource,
  Fn100_testComprehensiveScenario,
  Fn101_targetLiteralSingleSourceLiteral,
  Fn102_targetLiteralMultiSourceLiteral,
  Fn103_sourceLiteralWithSymbol,
  Fn104_sourceLiteralWithNestedObj,
  Fn105_sourceLiteralWithPrimitiveValues,
  Fn106_sourceLiteralWithe,
  Fn107_sourceLiteralWithBigInt,
  Fn108_emptyTargetLiteralMultiSource,
  Fn109_sourceLiteralWithEmptyObj,
  Fn10_testIgnoreNonEnumerableProps,
  Fn110_targetLiteralWithNestedSourceLiteral,
  Fn111_sourceLiteralWithSpecialKey,
  Fn112_sourceLiteralWithGetter,
  Fn113_sourceLiteralWithSetter,
  Fn114_multiSourceLiteralWithSameSymbol,
  Fn115_sourceLiteralWithArray,
  Fn116_emptyTargetLiteralWithSymbolSource,
  Fn117_targetLiteralWithExistingProp,
  Fn118_sourceLiteralWithNestedArray,
  Fn119_multiSourceLiteralMixedTypes,
  Fn11_testStringAsSource,
  Fn120_sourceLiteralWithCircularRef,
  Fn121_sourceLiteralWithNumKey,
  Fn122_multiSourceLiteralSameNumKey,
  Fn124_arrayTargetLiteralWithNumKeySource,
  Fn125_sourceLiteralMixedNumAndNormalKey,
  Fn126_sourceLiteralNumKeyWithRefValue,
  Fn127_sourceLiteralNumKeyWithSymbolValue,
  Fn128_emptyTargetLiteralOnlyNumKeySource,
  Fn12_testNumberAsSource,
  Fn13_testBooleanAsSource,
  Fn14_testIgnorePrototypeProps,
  Fn15_testTargetNullUndefinedThrow,
  Fn16_testCopyGetterValue,
  Fn17_testIgnoreSetterWhenCopy,
  Fn18_testCopyDateProps,
  Fn19_testCopyRegExpProps,
  Fn20_testSourceEmptyObject,
  Fn21_testMultiSourceSymbolOverride,
  Fn22_testShallowCopyReference,
  Fn23_testOnlyTargetReturnSelf,
  Fn24_testCopyFunctionProps,
  Fn25_testCopyBigIntProp,
  Fn26_testCopyUndefinedValueProp,
  Fn27_testNaNAsSource,
  Fn28_testPreserveEnumerableFlag,
  Fn29_testCopyCircularReference,
  Fn30_testMultiTypePropsCopy,
  Fn31_testNullSourceThenValidSource,
  Fn32_testUndefinedSourceThenValidSource,
  Fn33_testCopySymbolToArrTarget,
  Fn34_testArraySourceIgnoreProtoMethods,
  Fn35_testFrozenTargetThrowError,
  Fn36_testIgnoreEnumerableProtoProps,
  Fn37_testCopiedPropWritable,
  Fn38_testCopyReadonlySourceProp,
  Fn41_testEmptyStringAsSource,
  Fn42_testInfinityAsSource,
  Fn43_testMultiSourceWithEmptyObject,
  Fn44_testPrimitiveValueIndependence,
  Fn45_testShallowCopyNestedArray,
  Fn46_testClassInstanceAsTarget,
  Fn47_testClassInstanceAsSource,
  Fn48_testCopyEmptyStringKey,
  Fn49_testSymbolPropOverrideInTarget,
  Fn50_testOnlyArrayTargetReturnSelf,
  Fn54_testSymbolPropShallowCopy,
  Fn55_testCopiedPropConfigurable,
  Fn56_testCopyNonConfigurableSourceProp,
  Fn57_testSpecialCharStringAsSource,
  Fn58_testMultiSourceNumIndexOverride,
  Fn59_testOnlyNullTargetThrow,
  Fn60_testOnlyUndefinedTargetThrow,
  Fn61_testClassInstanceGetterCopy,
  Fn62_testNestedObjOverrideReference,
  Fn63_testBigIntArrayAsSource,
  Fn64_testRegExpFlagsNotCopied,
  Fn65_testNonIndexPropToArrTarget,
  Fn66_testCopyfunctionPropReference,
  Fn67_testDateTimezoneOffsetNotCopied,
  Fn68_testPreserveEnumerableValue,
  Fn69_testNullSourceThenSymbolSource,
  Fn70_testOverrideClassInstanceMethod,
  Fn71_testWeakMapGetterPropCopy,
  Fn72_testWeakSetSetterPropCopy,
  Fn74_testFrozenObjectAsSource,
  Fn75_testSymbolPropWithBigInt,
  Fn77_testEmojiStringAsSource,
  Fn78_testMultiSourceFuncOverride,
  Fn79_testNullTargetThenEmptySource,
  Fn80_testUndefinedTargetThenEmptySource,
  Fn81_testClassInstanceNonEnumProp,
  Fn82_testNestedSymbolShallowCopy,
  Fn83_testBigIntObjectAsSource,
  Fn84_testRegExpLastIndexNotCopied,
  Fn85_testArrTargetNonIndexOverride,
  Fn86_testFuncWithOwnPropsCopy,
  Fn87_testDatePrototypeMethodNotCopied,
  Fn88_testSourceNonEnumPropNoCopy,
  Fn89_testUndefinedSourceThenSymbolSource,
  Fn90_testClassMethodOverriddenByProp,
  Fn91_testErrorInstanceAsSource,
  Fn92_testPromiseInstanceAsSource,
  Fn93_testSymbolToArrTarget,
  Fn94_testArrayWithCustomPropAsSource,
  Fn95_testPreserveUndefinedProp,
  Fn96_testMultiSourceNullOverride,
  Fn97_testJsonObjAsSource,
  Fn98_testJsonObjAsTarget,
  Fn99_testMapNonEnumPropNoCopy
} from './Object2';

function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}


export default function Object2Test() {
  describe('Object2Test', () => {
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
     * @tc.name   Object2Test001
     * @tc.number SUB_BUILTINS_OBJECT2_TEST_0100
     * @tc.desc   test object assign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object2Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn01_testBasicPropertyCopy();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object2Test002
     * @tc.number SUB_BUILTINS_OBJECT2_TEST_0200
     * @tc.desc   test object assign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object2Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn02_testSamePropertyOverride();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object2Test003
     * @tc.number SUB_BUILTINS_OBJECT2_TEST_0300
     * @tc.desc   test object assign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object2Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn03_testSymbolPropertyCopy();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object2Test004
     * @tc.number SUB_BUILTINS_OBJECT2_TEST_0400
     * @tc.desc   test object assign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object2Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn04_testDeepCopyFailure();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object2Test005
     * @tc.number SUB_BUILTINS_OBJECT2_TEST_0500
     * @tc.desc   test object assign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object2Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn05_testIgnoreNullUndefinedSource();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object2Test006
     * @tc.number SUB_BUILTINS_OBJECT2_TEST_0600
     * @tc.desc   test object assign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object2Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn06_testMultiSourceOrder();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object2Test007
     * @tc.number SUB_BUILTINS_OBJECT2_TEST_0700
     * @tc.desc   test object assign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object2Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn07_testPreserveTargetNonOverlapProps();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object2Test008
     * @tc.number SUB_BUILTINS_OBJECT2_TEST_0800
     * @tc.desc   test object assign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object2Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn08_testArrayAsSource();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object2Test009
     * @tc.number SUB_BUILTINS_OBJECT2_TEST_0900
     * @tc.desc   test object assign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object2Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn08_testArrayAsSource();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object2Test010
     * @tc.number SUB_BUILTINS_OBJECT2_TEST_1000
     * @tc.desc   test object assign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object2Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn10_testIgnoreNonEnumerableProps();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object2Test011
     * @tc.number SUB_BUILTINS_OBJECT2_TEST_1100
     * @tc.desc   test object assign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object2Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn11_testStringAsSource();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object2Test012
     * @tc.number SUB_BUILTINS_OBJECT2_TEST_1200
     * @tc.desc   test object assign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object2Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn12_testNumberAsSource();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object2Test013
     * @tc.number SUB_BUILTINS_OBJECT2_TEST_1300
     * @tc.desc   test object assign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object2Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn13_testBooleanAsSource();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object2Test014
     * @tc.number SUB_BUILTINS_OBJECT2_TEST_1400
     * @tc.desc   test object assign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object2Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn14_testIgnorePrototypeProps();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object2Test015
     * @tc.number SUB_BUILTINS_OBJECT2_TEST_1500
     * @tc.desc   test object assign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object2Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn15_testTargetNullUndefinedThrow();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object2Test016
     * @tc.number SUB_BUILTINS_OBJECT2_TEST_1600
     * @tc.desc   test object assign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object2Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn16_testCopyGetterValue();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object2Test017
     * @tc.number SUB_BUILTINS_OBJECT2_TEST_1700
     * @tc.desc   test object assign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object2Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn17_testIgnoreSetterWhenCopy();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object2Test018
     * @tc.number SUB_BUILTINS_OBJECT2_TEST_1800
     * @tc.desc   test object assign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object2Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn18_testCopyDateProps();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object2Test019
     * @tc.number SUB_BUILTINS_OBJECT2_TEST_1900
     * @tc.desc   test object assign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object2Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn19_testCopyRegExpProps();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object2Test020
     * @tc.number SUB_BUILTINS_OBJECT2_TEST_2000
     * @tc.desc   test object assign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object2Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn20_testSourceEmptyObject();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object2Test021
     * @tc.number SUB_BUILTINS_OBJECT2_TEST_2100
     * @tc.desc   test object assign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object2Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn21_testMultiSourceSymbolOverride();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object2Test022
     * @tc.number SUB_BUILTINS_OBJECT2_TEST_2200
     * @tc.desc   test object assign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object2Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn22_testShallowCopyReference();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object2Test023
     * @tc.number SUB_BUILTINS_OBJECT2_TEST_2300
     * @tc.desc   test object assign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object2Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn23_testOnlyTargetReturnSelf();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object2Test024
     * @tc.number SUB_BUILTINS_OBJECT2_TEST_2400
     * @tc.desc   test object assign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object2Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn24_testCopyFunctionProps();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object2Test025
     * @tc.number SUB_BUILTINS_OBJECT2_TEST_2500
     * @tc.desc   test object assign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object2Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn25_testCopyBigIntProp();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object2Test026
     * @tc.number SUB_BUILTINS_OBJECT2_TEST_2600
     * @tc.desc   test object assign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object2Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn26_testCopyUndefinedValueProp();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object2Test027
     * @tc.number SUB_BUILTINS_OBJECT2_TEST_2700
     * @tc.desc   test object assign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object2Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn27_testNaNAsSource();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object2Test028
     * @tc.number SUB_BUILTINS_OBJECT2_TEST_2800
     * @tc.desc   test object assign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object2Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn28_testPreserveEnumerableFlag();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object2Test029
     * @tc.number SUB_BUILTINS_OBJECT2_TEST_2900
     * @tc.desc   test object assign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object2Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn29_testCopyCircularReference();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object2Test030
     * @tc.number SUB_BUILTINS_OBJECT2_TEST_3000
     * @tc.desc   test object assign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object2Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn30_testMultiTypePropsCopy();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object2Test031
     * @tc.number SUB_BUILTINS_OBJECT2_TEST_3100
     * @tc.desc   test object assign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object2Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn31_testNullSourceThenValidSource();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object2Test032
     * @tc.number SUB_BUILTINS_OBJECT2_TEST_3200
     * @tc.desc   test object assign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object2Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn32_testUndefinedSourceThenValidSource();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object2Test033
     * @tc.number SUB_BUILTINS_OBJECT2_TEST_3300
     * @tc.desc   test object assign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object2Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn33_testCopySymbolToArrTarget();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object2Test034
     * @tc.number SUB_BUILTINS_OBJECT2_TEST_3400
     * @tc.desc   test object assign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object2Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn34_testArraySourceIgnoreProtoMethods();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object2Test035
     * @tc.number SUB_BUILTINS_OBJECT2_TEST_3500
     * @tc.desc   test object assign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object2Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn35_testFrozenTargetThrowError();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object2Test036
     * @tc.number SUB_BUILTINS_OBJECT2_TEST_3600
     * @tc.desc   test object assign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object2Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn36_testIgnoreEnumerableProtoProps();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object2Test037
     * @tc.number SUB_BUILTINS_OBJECT2_TEST_3700
     * @tc.desc   test object assign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object2Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn37_testCopiedPropWritable();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object2Test038
     * @tc.number SUB_BUILTINS_OBJECT2_TEST_3800
     * @tc.desc   test object assign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object2Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn38_testCopyReadonlySourceProp();
      expect(result).assertEqual(true);
    });


    /**
     * @tc.name   Object2Test041
     * @tc.number SUB_BUILTINS_OBJECT2_TEST_4100
     * @tc.desc   test object assign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object2Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn41_testEmptyStringAsSource();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object2Test042
     * @tc.number SUB_BUILTINS_OBJECT2_TEST_4200
     * @tc.desc   test object assign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object2Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn42_testInfinityAsSource();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object2Test043
     * @tc.number SUB_BUILTINS_OBJECT2_TEST_4300
     * @tc.desc   test object assign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object2Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn43_testMultiSourceWithEmptyObject();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object2Test044
     * @tc.number SUB_BUILTINS_OBJECT2_TEST_4400
     * @tc.desc   test object assign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object2Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn44_testPrimitiveValueIndependence();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object2Test045
     * @tc.number SUB_BUILTINS_OBJECT2_TEST_4500
     * @tc.desc   test object assign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object2Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn45_testShallowCopyNestedArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object2Test046
     * @tc.number SUB_BUILTINS_OBJECT2_TEST_4600
     * @tc.desc   test object assign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object2Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn46_testClassInstanceAsTarget();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object2Test047
     * @tc.number SUB_BUILTINS_OBJECT2_TEST_4700
     * @tc.desc   test object assign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object2Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn47_testClassInstanceAsSource();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object2Test048
     * @tc.number SUB_BUILTINS_OBJECT2_TEST_4800
     * @tc.desc   test object assign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object2Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn48_testCopyEmptyStringKey();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object2Test049
     * @tc.number SUB_BUILTINS_OBJECT2_TEST_4900
     * @tc.desc   test object assign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object2Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn49_testSymbolPropOverrideInTarget();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object2Test050
     * @tc.number SUB_BUILTINS_OBJECT2_TEST_5000
     * @tc.desc   test object assign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object2Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn50_testOnlyArrayTargetReturnSelf();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object2Test054
     * @tc.number SUB_BUILTINS_OBJECT2_TEST_5400
     * @tc.desc   test object assign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object2Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn54_testSymbolPropShallowCopy();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object2Test055
     * @tc.number SUB_BUILTINS_OBJECT2_TEST_5500
     * @tc.desc   test object assign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object2Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn55_testCopiedPropConfigurable();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object2Test056
     * @tc.number SUB_BUILTINS_OBJECT2_TEST_5600
     * @tc.desc   test object assign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object2Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn56_testCopyNonConfigurableSourceProp();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object2Test057
     * @tc.number SUB_BUILTINS_OBJECT2_TEST_5700
     * @tc.desc   test object assign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object2Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn57_testSpecialCharStringAsSource();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object2Test058
     * @tc.number SUB_BUILTINS_OBJECT2_TEST_5800
     * @tc.desc   test object assign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object2Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn58_testMultiSourceNumIndexOverride();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object2Test059
     * @tc.number SUB_BUILTINS_OBJECT2_TEST_5900
     * @tc.desc   test object assign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object2Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn59_testOnlyNullTargetThrow();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object2Test060
     * @tc.number SUB_BUILTINS_OBJECT2_TEST_6000
     * @tc.desc   test object assign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object2Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn60_testOnlyUndefinedTargetThrow();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object2Test061
     * @tc.number SUB_BUILTINS_OBJECT2_TEST_6100
     * @tc.desc   test object assign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object2Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn61_testClassInstanceGetterCopy();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   Object2Test062
     * @tc.number SUB_BUILTINS_OBJECT2_TEST_6200
     * @tc.desc   test object assign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object2Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn62_testNestedObjOverrideReference();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object2Test063
     * @tc.number SUB_BUILTINS_OBJECT2_TEST_6300
     * @tc.desc   test object assign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object2Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn63_testBigIntArrayAsSource();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object2Test064
     * @tc.number SUB_BUILTINS_OBJECT2_TEST_6400
     * @tc.desc   test object assign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object2Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn64_testRegExpFlagsNotCopied();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object2Test065
     * @tc.number SUB_BUILTINS_OBJECT2_TEST_6500
     * @tc.desc   test object assign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object2Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn65_testNonIndexPropToArrTarget();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object2Test066
     * @tc.number SUB_BUILTINS_OBJECT2_TEST_6600
     * @tc.desc   test object assign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object2Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn66_testCopyfunctionPropReference();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object2Test067
     * @tc.number SUB_BUILTINS_OBJECT2_TEST_6700
     * @tc.desc   test object assign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object2Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn67_testDateTimezoneOffsetNotCopied();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object2Test068
     * @tc.number SUB_BUILTINS_OBJECT2_TEST_6800
     * @tc.desc   test object assign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object2Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn68_testPreserveEnumerableValue();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object2Test069
     * @tc.number SUB_BUILTINS_OBJECT2_TEST_6900
     * @tc.desc   test object assign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object2Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn69_testNullSourceThenSymbolSource();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object2Test070
     * @tc.number SUB_BUILTINS_OBJECT2_TEST_7000
     * @tc.desc   test object assign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object2Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn70_testOverrideClassInstanceMethod();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object2Test071
     * @tc.number SUB_BUILTINS_OBJECT2_TEST_7100
     * @tc.desc   test object assign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object2Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn71_testWeakMapGetterPropCopy();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object2Test072
     * @tc.number SUB_BUILTINS_OBJECT2_TEST_7200
     * @tc.desc   test object assign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object2Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn72_testWeakSetSetterPropCopy();
      expect(result).assertEqual(true);
    });


    /**
     * @tc.name   Object2Test074
     * @tc.number SUB_BUILTINS_OBJECT2_TEST_7400
     * @tc.desc   test object assign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object2Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn74_testFrozenObjectAsSource();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object2Test075
     * @tc.number SUB_BUILTINS_OBJECT2_TEST_7500
     * @tc.desc   test object assign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object2Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn75_testSymbolPropWithBigInt();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object2Test077
     * @tc.number SUB_BUILTINS_OBJECT2_TEST_7700
     * @tc.desc   test object assign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object2Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn77_testEmojiStringAsSource();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   Object2Test078
     * @tc.number SUB_BUILTINS_OBJECT2_TEST_7800
     * @tc.desc   test object assign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object2Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn78_testMultiSourceFuncOverride();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object2Test079
     * @tc.number SUB_BUILTINS_OBJECT2_TEST_7900
     * @tc.desc   test object assign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object2Test079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn79_testNullTargetThenEmptySource();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object2Test080
     * @tc.number SUB_BUILTINS_OBJECT2_TEST_8000
     * @tc.desc   test object assign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object2Test080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn80_testUndefinedTargetThenEmptySource();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name   Object2Test081
     * @tc.number SUB_BUILTINS_OBJECT2_TEST_8100
     * @tc.desc   test object assign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object2Test081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn81_testClassInstanceNonEnumProp();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object2Test082
     * @tc.number SUB_BUILTINS_OBJECT2_TEST_8200
     * @tc.desc   test object assign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object2Test082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn82_testNestedSymbolShallowCopy();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object2Test083
     * @tc.number SUB_BUILTINS_OBJECT2_TEST_8300
     * @tc.desc   test object assign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object2Test083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn83_testBigIntObjectAsSource();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object2Test084
     * @tc.number SUB_BUILTINS_OBJECT2_TEST_8400
     * @tc.desc   test object assign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object2Test084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn84_testRegExpLastIndexNotCopied();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object2Test085
     * @tc.number SUB_BUILTINS_OBJECT2_TEST_8500
     * @tc.desc   test object assign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object2Test085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn85_testArrTargetNonIndexOverride();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object2Test086
     * @tc.number SUB_BUILTINS_OBJECT2_TEST_8600
     * @tc.desc   test object assign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object2Test086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn86_testFuncWithOwnPropsCopy();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object2Test087
     * @tc.number SUB_BUILTINS_OBJECT2_TEST_8700
     * @tc.desc   test object assign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object2Test087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn87_testDatePrototypeMethodNotCopied();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object2Test088
     * @tc.number SUB_BUILTINS_OBJECT2_TEST_8800
     * @tc.desc   test object assign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object2Test088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn88_testSourceNonEnumPropNoCopy();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object2Test089
     * @tc.number SUB_BUILTINS_OBJECT2_TEST_8900
     * @tc.desc   test object assign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object2Test089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn89_testUndefinedSourceThenSymbolSource();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object2Test090
     * @tc.number SUB_BUILTINS_OBJECT2_TEST_9000
     * @tc.desc   test object assign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object2Test090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn90_testClassMethodOverriddenByProp();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object2Test091
     * @tc.number SUB_BUILTINS_OBJECT2_TEST_9100
     * @tc.desc   test object assign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object2Test091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn91_testErrorInstanceAsSource();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object2Test092
     * @tc.number SUB_BUILTINS_OBJECT2_TEST_9200
     * @tc.desc   test object assign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object2Test092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn92_testPromiseInstanceAsSource();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object2Test093
     * @tc.number SUB_BUILTINS_OBJECT2_TEST_9300
     * @tc.desc   test object assign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object2Test093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn93_testSymbolToArrTarget();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object2Test094
     * @tc.number SUB_BUILTINS_OBJECT2_TEST_9400
     * @tc.desc   test object assign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object2Test094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn94_testArrayWithCustomPropAsSource();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object2Test095
     * @tc.number SUB_BUILTINS_OBJECT2_TEST_9500
     * @tc.desc   test object assign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object2Test095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn95_testPreserveUndefinedProp();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object2Test096
     * @tc.number SUB_BUILTINS_OBJECT2_TEST_9600
     * @tc.desc   test object assign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object2Test096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn96_testMultiSourceNullOverride();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object2Test097
     * @tc.number SUB_BUILTINS_OBJECT2_TEST_9700
     * @tc.desc   test object assign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object2Test097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn97_testJsonObjAsSource();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   Object2Test098
     * @tc.number SUB_BUILTINS_OBJECT2_TEST_9800
     * @tc.desc   test object assign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object2Test098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn98_testJsonObjAsTarget();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object2Test099
     * @tc.number SUB_BUILTINS_OBJECT2_TEST_9900
     * @tc.desc   test object assign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object2Test099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn99_testMapNonEnumPropNoCopy();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object2Test100
     * @tc.number SUB_BUILTINS_OBJECT2_TEST_10000
     * @tc.desc   test object assign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object2Test100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn100_testComprehensiveScenario();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object2Test101
     * @tc.number SUB_BUILTINS_OBJECT2_TEST_10100
     * @tc.desc   test object assign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object2Test101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn101_targetLiteralSingleSourceLiteral();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object2Test102
     * @tc.number SUB_BUILTINS_OBJECT2_TEST_10200
     * @tc.desc   test object assign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object2Test102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn102_targetLiteralMultiSourceLiteral();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object2Test103
     * @tc.number SUB_BUILTINS_OBJECT2_TEST_10300
     * @tc.desc   test object assign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object2Test103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn103_sourceLiteralWithSymbol();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object2Test104
     * @tc.number SUB_BUILTINS_OBJECT2_TEST_10400
     * @tc.desc   test object assign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object2Test104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn104_sourceLiteralWithNestedObj();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object2Test105
     * @tc.number SUB_BUILTINS_OBJECT2_TEST_10500
     * @tc.desc   test object assign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object2Test105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn105_sourceLiteralWithPrimitiveValues();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object2Test106
     * @tc.number SUB_BUILTINS_OBJECT2_TEST_10600
     * @tc.desc   test object assign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object2Test106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn106_sourceLiteralWithe();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object2Test107
     * @tc.number SUB_BUILTINS_OBJECT2_TEST_10700
     * @tc.desc   test object assign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object2Test107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn107_sourceLiteralWithBigInt();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object2Test108
     * @tc.number SUB_BUILTINS_OBJECT2_TEST_10800
     * @tc.desc   test object assign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object2Test108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn108_emptyTargetLiteralMultiSource();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object2Test109
     * @tc.number SUB_BUILTINS_OBJECT2_TEST_10900
     * @tc.desc   test object assign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object2Test109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn109_sourceLiteralWithEmptyObj();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object2Test110
     * @tc.number SUB_BUILTINS_OBJECT2_TEST_11000
     * @tc.desc   test object assign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object2Test110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn110_targetLiteralWithNestedSourceLiteral();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object2Test111
     * @tc.number SUB_BUILTINS_OBJECT2_TEST_11100
     * @tc.desc   test object assign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object2Test111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn111_sourceLiteralWithSpecialKey();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object2Test112
     * @tc.number SUB_BUILTINS_OBJECT2_TEST_11200
     * @tc.desc   test object assign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object2Test112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn112_sourceLiteralWithGetter();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object2Test113
     * @tc.number SUB_BUILTINS_OBJECT2_TEST_11300
     * @tc.desc   test object assign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object2Test113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn113_sourceLiteralWithSetter();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object2Test114
     * @tc.number SUB_BUILTINS_OBJECT2_TEST_11400
     * @tc.desc   test object assign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object2Test114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn114_multiSourceLiteralWithSameSymbol();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object2Test115
     * @tc.number SUB_BUILTINS_OBJECT2_TEST_11500
     * @tc.desc   test object assign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object2Test115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn115_sourceLiteralWithArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object2Test116
     * @tc.number SUB_BUILTINS_OBJECT2_TEST_11600
     * @tc.desc   test object assign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object2Test116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn116_emptyTargetLiteralWithSymbolSource();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object2Test117
     * @tc.number SUB_BUILTINS_OBJECT2_TEST_11700
     * @tc.desc   test object assign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object2Test117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn117_targetLiteralWithExistingProp();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object2Test118
     * @tc.number SUB_BUILTINS_OBJECT2_TEST_11800
     * @tc.desc   test object assign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object2Test118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn118_sourceLiteralWithNestedArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object2Test119
     * @tc.number SUB_BUILTINS_OBJECT2_TEST_11900
     * @tc.desc   test object assign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object2Test119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn119_multiSourceLiteralMixedTypes();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   Object2Test120
     * @tc.number SUB_BUILTINS_OBJECT2_TEST_12000
     * @tc.desc   test object assign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object2Test120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn120_sourceLiteralWithCircularRef();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name   Object2Test121
     * @tc.number SUB_BUILTINS_OBJECT2_TEST_12100
     * @tc.desc   test object assign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object2Test121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn121_sourceLiteralWithNumKey();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object2Test122
     * @tc.number SUB_BUILTINS_OBJECT2_TEST_12200
     * @tc.desc   test object assign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object2Test122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn122_multiSourceLiteralSameNumKey();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object2Test124
     * @tc.number SUB_BUILTINS_OBJECT2_TEST_12400
     * @tc.desc   test object assign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object2Test124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn124_arrayTargetLiteralWithNumKeySource();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object2Test125
     * @tc.number SUB_BUILTINS_OBJECT2_TEST_12500
     * @tc.desc   test object assign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object2Test125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn125_sourceLiteralMixedNumAndNormalKey();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object2Test126
     * @tc.number SUB_BUILTINS_OBJECT2_TEST_12600
     * @tc.desc   test object assign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object2Test126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn126_sourceLiteralNumKeyWithRefValue();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object2Test127
     * @tc.number SUB_BUILTINS_OBJECT2_TEST_12700
     * @tc.desc   test object assign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object2Test127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn127_sourceLiteralNumKeyWithSymbolValue();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object2Test128
     * @tc.number SUB_BUILTINS_OBJECT2_TEST_12800
     * @tc.desc   test object assign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object2Test128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn128_emptyTargetLiteralOnlyNumKeySource();
      expect(result).assertEqual(true);
    });
  })
}