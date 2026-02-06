/*
* Copyright (C) 2025 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the 'License');
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an 'AS IS' BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { SymbolIsConcatSpreadableStandaloneTestUtils } from './symbolIsConcatSpreadableStandaloneTests.js';

function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}


export default function symbolIsConcatSpreadableTest() {
  describe('symbolIsConcatSpreadableTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(50);
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
     * @tc.name   ArrayDefaultSpreadTest001
     * @tc.number SUB_SYMBOL_ISCONCATSPREADABLE_STANDALONE_TEST_001
     * @tc.desc   Verify arrays are spread by default in concat()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ArrayDefaultSpreadTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolIsConcatSpreadableStandaloneTestUtils.test001_ArrayDefaultSpread();
      expect(result).assertEqual("Test Passed: ArrayDefaultSpreadTest001");
    });

    /**
     * @tc.name   ArraySetFalseNotSpreadTest002
     * @tc.number SUB_SYMBOL_ISCONCATSPREADABLE_STANDALONE_TEST_002
     * @tc.desc   Verify arrays with isConcatSpreadable=false are not spread
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ArraySetFalseNotSpreadTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolIsConcatSpreadableStandaloneTestUtils.test002_ArraySetFalseNotSpread();
      expect(result).assertEqual("Test Passed: ArraySetFalseNotSpreadTest002");
    });

    /**
     * @tc.name   ArrayLikeSetTrueSpreadTest003
     * @tc.number SUB_SYMBOL_ISCONCATSPREADABLE_STANDALONE_TEST_003
     * @tc.desc   Verify array-like objects with isConcatSpreadable=true are spread
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ArrayLikeSetTrueSpreadTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolIsConcatSpreadableStandaloneTestUtils.test003_ArrayLikeSetTrueSpread();
      expect(result).assertEqual("Test Passed: ArrayLikeSetTrueSpreadTest003");
    });

    /**
     * @tc.name   ArrayLikeDefaultNotSpreadTest004
     * @tc.number SUB_SYMBOL_ISCONCATSPREADABLE_STANDALONE_TEST_004
     * @tc.desc   Verify array-like objects are not spread by default
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ArrayLikeDefaultNotSpreadTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolIsConcatSpreadableStandaloneTestUtils.test004_ArrayLikeDefaultNotSpread();
      expect(result).assertEqual("Test Passed: ArrayLikeDefaultNotSpreadTest004");
    });




    /**
     * @tc.name   NestedArraySpreadControlTest007
     * @tc.number SUB_SYMBOL_ISCONCATSPREADABLE_STANDALONE_TEST_007
     * @tc.desc   Verify nested arrays respect isConcatSpreadable setting
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('NestedArraySpreadControlTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolIsConcatSpreadableStandaloneTestUtils.test007_NestedArraySpreadControl();
      expect(result).assertEqual("Test Passed: NestedArraySpreadControlTest007");
    });


    /**
     * @tc.name   NonBooleanCoercionTest009
     * @tc.number SUB_SYMBOL_ISCONCATSPREADABLE_STANDALONE_TEST_009
     * @tc.desc   Verify non-boolean values are coerced to control spread
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('NonBooleanCoercionTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolIsConcatSpreadableStandaloneTestUtils.test009_NonBooleanCoercion();
      expect(result).assertEqual("Test Passed: NonBooleanCoercionTest009");
    });

    /**
     * @tc.name   ArrayLikeSetFalseNotSpreadTest011
     * @tc.number SUB_SYMBOL_ISCONCATSPREADABLE_STANDALONE_TEST_011
     * @tc.desc   Verify array-like objects with isConcatSpreadable=false are not spread
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ArrayLikeSetFalseNotSpreadTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolIsConcatSpreadableStandaloneTestUtils.test011_ArrayLikeSetFalseNotSpread();
      expect(result).assertEqual("Test Passed: ArrayLikeSetFalseNotSpreadTest011");
    });

    /**
     * @tc.name   EmptyArrayLikeSetTrueSpreadTest012
     * @tc.number SUB_SYMBOL_ISCONCATSPREADABLE_STANDALONE_TEST_012
     * @tc.desc   Verify empty array-like with isConcatSpreadable=true spreads to empty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('EmptyArrayLikeSetTrueSpreadTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolIsConcatSpreadableStandaloneTestUtils.test012_EmptyArrayLikeSetTrueSpread();
      expect(result).assertEqual("Test Passed: EmptyArrayLikeSetTrueSpreadTest012");
    });


    /**
     * @tc.name   FunctionArrayLikeSpreadTest014
     * @tc.number SUB_SYMBOL_ISCONCATSPREADABLE_STANDALONE_TEST_014
     * @tc.desc   Verify function (array-like) with isConcatSpreadable=true is spread
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('FunctionArrayLikeSpreadTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolIsConcatSpreadableStandaloneTestUtils.test014_FunctionArrayLikeSpread();
      expect(result).assertEqual("Test Passed: FunctionArrayLikeSpreadTest014");
    });

    /**
     * @tc.name   SetToNullCoercionTest015
     * @tc.number SUB_SYMBOL_ISCONCATSPREADABLE_STANDALONE_TEST_015
     * @tc.desc   Verify isConcatSpreadable=null is coerced to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SetToNullCoercionTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolIsConcatSpreadableStandaloneTestUtils.test015_SetToNullCoercion();
      expect(result).assertEqual("Test Passed: SetToNullCoercionTest015");
    });

    /**
     * @tc.name   SetToUndefinedDefaultTest016
     * @tc.number SUB_SYMBOL_ISCONCATSPREADABLE_STANDALONE_TEST_016
     * @tc.desc   Verify isConcatSpreadable=undefined uses default behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SetToUndefinedDefaultTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolIsConcatSpreadableStandaloneTestUtils.test016_SetToUndefinedDefault();
      expect(result).assertEqual("Test Passed: SetToUndefinedDefaultTest016");
    });


    /**
     * @tc.name   MixedTypesConcatTest018
     * @tc.number SUB_SYMBOL_ISCONCATSPREADABLE_STANDALONE_TEST_018
     * @tc.desc   Verify mixed types concat respect individual spread settings
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MixedTypesConcatTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolIsConcatSpreadableStandaloneTestUtils.test018_MixedTypesConcat();
      expect(result).assertEqual("Test Passed: MixedTypesConcatTest018");
    });

    /**
     * @tc.name   FrozenArrayLikeSpreadTest019
     * @tc.number SUB_SYMBOL_ISCONCATSPREADABLE_STANDALONE_TEST_019
     * @tc.desc   Verify frozen array-like with isConcatSpreadable=true is spread
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('FrozenArrayLikeSpreadTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolIsConcatSpreadableStandaloneTestUtils.test019_FrozenArrayLikeSpread();
      expect(result).assertEqual("Test Passed: FrozenArrayLikeSpreadTest019");
    });



    /**
     * @tc.name   ArraySubclassDefaultSpreadTest021
     * @tc.number SUB_SYMBOL_ISCONCATSPREADABLE_STANDALONE_TEST_021
     * @tc.desc   Verify array subclass instance defaults to spread
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ArraySubclassDefaultSpreadTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolIsConcatSpreadableStandaloneTestUtils.test021_ArraySubclassDefaultSpread();
      expect(result).assertEqual("Test Passed: ArraySubclassDefaultSpreadTest021");
    });

    /**
     * @tc.name   ArraySubclassSetFalseNotSpreadTest022
     * @tc.number SUB_SYMBOL_ISCONCATSPREADABLE_STANDALONE_TEST_022
     * @tc.desc   Verify array subclass instance with isConcatSpreadable=false is not spread
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ArraySubclassSetFalseNotSpreadTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolIsConcatSpreadableStandaloneTestUtils.test022_ArraySubclassSetFalseNotSpread();
      expect(result).assertEqual("Test Passed: ArraySubclassSetFalseNotSpreadTest022");
    });

    /**
     * @tc.name   SetToStringTrueCoercionTest023
     * @tc.number SUB_SYMBOL_ISCONCATSPREADABLE_STANDALONE_TEST_023
     * @tc.desc   Verify isConcatSpreadable="true" is coerced to true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SetToStringTrueCoercionTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolIsConcatSpreadableStandaloneTestUtils.test023_SetToStringTrueCoercion();
      expect(result).assertEqual("Test Passed: SetToStringTrueCoercionTest023");
    });







    /**
     * @tc.name   DynamicArrayLikeSpreadTest029
     * @tc.number SUB_SYMBOL_ISCONCATSPREADABLE_STANDALONE_TEST_029
     * @tc.desc   Verify dynamic array-like spreads latest properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DynamicArrayLikeSpreadTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolIsConcatSpreadableStandaloneTestUtils.test029_DynamicArrayLikeSpread();
      expect(result).assertEqual("Test Passed: DynamicArrayLikeSpreadTest029");
    });

    /**
     * @tc.name   InheritedSpreadSettingTest030
     * @tc.number SUB_SYMBOL_ISCONCATSPREADABLE_STANDALONE_TEST_030
     * @tc.desc   Verify array-like inherits spread setting from prototype
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('InheritedSpreadSettingTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolIsConcatSpreadableStandaloneTestUtils.test030_InheritedSpreadSetting();
      expect(result).assertEqual("Test Passed: InheritedSpreadSettingTest030");
    });

  })
}