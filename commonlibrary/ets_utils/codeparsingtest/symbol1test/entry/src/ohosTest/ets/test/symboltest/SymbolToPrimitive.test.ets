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
import { SymbolToPrimitiveStandaloneTestUtils } from './symbolToPrimitiveStandaloneTests.js';


function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}

export default function symbolToPrimitiveTestTest() {
  describe('SymbolToPrimitiveTest', () => {
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
     * @tc.name   CustomToPrimitiveNumberHintTest001
     * @tc.number SUB_SYMBOL_TOPRIMITIVE_STANDALONE_TEST_001
     * @tc.desc   Verify custom [Symbol.toPrimitive] returns number for "number" hint
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('CustomToPrimitiveNumberHintTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolToPrimitiveStandaloneTestUtils.test001_CustomToPrimitiveNumberHint();
      expect(result).assertEqual("Test Passed: CustomToPrimitiveNumberHintTest001");
    });

    /**
     * @tc.name   CustomToPrimitiveStringHintTest002
     * @tc.number SUB_SYMBOL_TOPRIMITIVE_STANDALONE_TEST_002
     * @tc.desc   Verify custom [Symbol.toPrimitive] returns string for "string" hint
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('CustomToPrimitiveStringHintTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolToPrimitiveStandaloneTestUtils.test002_CustomToPrimitiveStringHint();
      expect(result).assertEqual("Test Passed: CustomToPrimitiveStringHintTest002");
    });

    /**
     * @tc.name   CustomToPrimitiveDefaultHintTest003
     * @tc.number SUB_SYMBOL_TOPRIMITIVE_STANDALONE_TEST_003
     * @tc.desc   Verify custom [Symbol.toPrimitive] returns primitive for "default" hint
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('CustomToPrimitiveDefaultHintTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolToPrimitiveStandaloneTestUtils.test003_CustomToPrimitiveDefaultHint();
      expect(result).assertEqual("Test Passed: CustomToPrimitiveDefaultHintTest003");
    });

    /**
     * @tc.name   ToPrimitiveReturnsObjectThrowsTest004
     * @tc.number SUB_SYMBOL_TOPRIMITIVE_STANDALONE_TEST_004
     * @tc.desc   Verify [Symbol.toPrimitive] throws TypeError if returns object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ToPrimitiveReturnsObjectThrowsTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolToPrimitiveStandaloneTestUtils.test004_ToPrimitiveReturnsObjectThrows();
      expect(result).assertEqual("Test Passed: ToPrimitiveReturnsObjectThrowsTest004");
    });

    /**
     * @tc.name   ToPrimitiveIgnoresHintTest005
     * @tc.number SUB_SYMBOL_TOPRIMITIVE_STANDALONE_TEST_005
     * @tc.desc   Verify [Symbol.toPrimitive] can ignore hint, return consistent primitive
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ToPrimitiveIgnoresHintTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolToPrimitiveStandaloneTestUtils.test005_ToPrimitiveIgnoresHint();
      expect(result).assertEqual("Test Passed: ToPrimitiveIgnoresHintTest005");
    });

    /**
     * @tc.name   NoToPrimitiveFallbackTest006
     * @tc.number SUB_SYMBOL_TOPRIMITIVE_STANDALONE_TEST_006
     * @tc.desc   Verify object without [Symbol.toPrimitive] falls back to valueOf() → toString()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('NoToPrimitiveFallbackTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolToPrimitiveStandaloneTestUtils.test006_NoToPrimitiveFallback();
      expect(result).assertEqual("Test Passed: NoToPrimitiveFallbackTest006");
    });

    /**
     * @tc.name   DateDefaultToPrimitiveTest007
     * @tc.number SUB_SYMBOL_TOPRIMITIVE_STANDALONE_TEST_007
     * @tc.desc   Verify Date's default [Symbol.toPrimitive] treats "default" as "string"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DateDefaultToPrimitiveTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolToPrimitiveStandaloneTestUtils.test007_DateDefaultToPrimitive();
      expect(result).assertEqual("Test Passed: DateDefaultToPrimitiveTest007");
    });

    /**
     * @tc.name   SymbolObjectToPrimitiveTest008
     * @tc.number SUB_SYMBOL_TOPRIMITIVE_STANDALONE_TEST_008
     * @tc.desc   Verify Symbol object's [Symbol.toPrimitive] ignores hint, returns symbol
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SymbolObjectToPrimitiveTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolToPrimitiveStandaloneTestUtils.test008_SymbolObjectToPrimitive();
      expect(result).assertEqual("Test Passed: SymbolObjectToPrimitiveTest008");
    });

    /**
     * @tc.name   NonFunctionToPrimitiveThrowsTest009
     * @tc.number SUB_SYMBOL_TOPRIMITIVE_STANDALONE_TEST_009
     * @tc.desc   Verify non-function [Symbol.toPrimitive] throws TypeError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('NonFunctionToPrimitiveThrowsTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolToPrimitiveStandaloneTestUtils.test009_NonFunctionToPrimitiveThrows();
      expect(result).assertEqual("Test Passed: NonFunctionToPrimitiveThrowsTest009");
    });

    /**
     * @tc.name   InheritedToPrimitiveTest010
     * @tc.number SUB_SYMBOL_TOPRIMITIVE_STANDALONE_TEST_010
     * @tc.desc   Verify [Symbol.toPrimitive] can be inherited via prototype chain
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('InheritedToPrimitiveTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolToPrimitiveStandaloneTestUtils.test010_InheritedToPrimitive();
      expect(result).assertEqual("Test Passed: InheritedToPrimitiveTest010");
    });

    /**
     * @tc.name   DynamicModifyToPrimitiveTest011
     * @tc.number SUB_SYMBOL_TOPRIMITIVE_STANDALONE_TEST_011
     * @tc.desc   Verify runtime modification of [Symbol.toPrimitive] affects conversions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DynamicModifyToPrimitiveTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolToPrimitiveStandaloneTestUtils.test011_DynamicModifyToPrimitive();
      expect(result).assertEqual("Test Passed: DynamicModifyToPrimitiveTest011");
    });

    /**
     * @tc.name   FrozenObjectToPrimitiveTest012
     * @tc.number SUB_SYMBOL_TOPRIMITIVE_STANDALONE_TEST_012
     * @tc.desc   Verify frozen objects retain [Symbol.toPrimitive] functionality
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('FrozenObjectToPrimitiveTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolToPrimitiveStandaloneTestUtils.test012_FrozenObjectToPrimitive();
      expect(result).assertEqual("Test Passed: FrozenObjectToPrimitiveTest012");
    });


    /**
     * @tc.name   MultiLevelInheritanceToPrimitiveTest014
     * @tc.number SUB_SYMBOL_TOPRIMITIVE_STANDALONE_TEST_014
     * @tc.desc   Verify multi-level inheritance follows [Symbol.toPrimitive] priority (subclass highest)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MultiLevelInheritanceToPrimitiveTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolToPrimitiveStandaloneTestUtils.test014_MultiLevelInheritanceToPrimitive();
      expect(result).assertEqual("Test Passed: MultiLevelInheritanceToPrimitiveTest014");
    });








    /**
     * @tc.name   EqualityOperatorTriggersDefaultHintTest019
     * @tc.number SUB_SYMBOL_TOPRIMITIVE_STANDALONE_TEST_019
     * @tc.desc   Verify == operator triggers "default" hint for [Symbol.toPrimitive]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('EqualityOperatorTriggersDefaultHintTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolToPrimitiveStandaloneTestUtils.test019_EqualityOperatorTriggersDefaultHint();
      expect(result).assertEqual("Test Passed: EqualityOperatorTriggersDefaultHintTest019");
    });



    /**
     * @tc.name   ArrowFunctionToPrimitiveThisBindingTest022
     * @tc.number SUB_SYMBOL_TOPRIMITIVE_STANDALONE_TEST_022
     * @tc.desc   Verify arrow function as [Symbol.toPrimitive] inherits external this binding
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ArrowFunctionToPrimitiveThisBindingTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolToPrimitiveStandaloneTestUtils.test022_ArrowFunctionToPrimitiveThisBinding();
      expect(result).assertEqual("Test Passed: ArrowFunctionToPrimitiveThisBindingTest022");
    });

    /**
     * @tc.name   ClosureBasedToPrimitiveTest023
     * @tc.number SUB_SYMBOL_TOPRIMITIVE_STANDALONE_TEST_023
     * @tc.desc   Verify closure-based [Symbol.toPrimitive] retains private context
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ClosureBasedToPrimitiveTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolToPrimitiveStandaloneTestUtils.test023_ClosureBasedToPrimitive();
      expect(result).assertEqual("Test Passed: ClosureBasedToPrimitiveTest023");
    });

    /**
     * @tc.name   DynamicStateToPrimitiveTest024
     * @tc.number SUB_SYMBOL_TOPRIMITIVE_STANDALONE_TEST_024
     * @tc.desc   Verify [Symbol.toPrimitive] returns different values based on object state
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DynamicStateToPrimitiveTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolToPrimitiveStandaloneTestUtils.test024_DynamicStateToPrimitive();
      expect(result).assertEqual("Test Passed: DynamicStateToPrimitiveTest024");
    });



    /**
     * @tc.name   ToPrimitiveReturnsSpecialNumbersTest026
     * @tc.number SUB_SYMBOL_TOPRIMITIVE_STANDALONE_TEST_026
     * @tc.desc   Verify [Symbol.toPrimitive] can return NaN/Infinity for "number" hint
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ToPrimitiveReturnsSpecialNumbersTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolToPrimitiveStandaloneTestUtils.test026_ToPrimitiveReturnsSpecialNumbers();
      expect(result).assertEqual("Test Passed: ToPrimitiveReturnsSpecialNumbersTest026");
    });

    /**
     * @tc.name   ToPrimitiveReturnsEmptyStringTest027
     * @tc.number SUB_SYMBOL_TOPRIMITIVE_STANDALONE_TEST_027
     * @tc.desc   Verify [Symbol.toPrimitive] can return empty string for "string" hint
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ToPrimitiveReturnsEmptyStringTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolToPrimitiveStandaloneTestUtils.test027_ToPrimitiveReturnsEmptyString();
      expect(result).assertEqual("Test Passed: ToPrimitiveReturnsEmptyStringTest027");
    });

    /**
     * @tc.name   SubclassOverrideParentToPrimitiveTest028
     * @tc.number SUB_SYMBOL_TOPRIMITIVE_STANDALONE_TEST_028
     * @tc.desc   Verify subclass overrides parent's [Symbol.toPrimitive]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SubclassOverrideParentToPrimitiveTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolToPrimitiveStandaloneTestUtils.test028_SubclassOverrideParentToPrimitive();
      expect(result).assertEqual("Test Passed: SubclassOverrideParentToPrimitiveTest028");
    });

    /**
     * @tc.name   ManualCallToPrimitiveTest029
     * @tc.number SUB_SYMBOL_TOPRIMITIVE_STANDALONE_TEST_029
     * @tc.desc   Verify direct call to [Symbol.toPrimitive] with explicit hints
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ManualCallToPrimitiveTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolToPrimitiveStandaloneTestUtils.test029_ManualCallToPrimitive();
      expect(result).assertEqual("Test Passed: ManualCallToPrimitiveTest029");
    });

    /**
     * @tc.name   ArrayOverrideToPrimitiveTest030
     * @tc.number SUB_SYMBOL_TOPRIMITIVE_STANDALONE_TEST_030
     * @tc.desc   Verify Array can override [Symbol.toPrimitive] for custom conversion
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ArrayOverrideToPrimitiveTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolToPrimitiveStandaloneTestUtils.test030_ArrayOverrideToPrimitive();
      expect(result).assertEqual("Test Passed: ArrayOverrideToPrimitiveTest030");
    });
  })
}