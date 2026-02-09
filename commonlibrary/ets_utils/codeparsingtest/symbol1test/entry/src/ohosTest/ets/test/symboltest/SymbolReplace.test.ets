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
import { SymbolReplaceStandaloneTestUtils } from './symbolReplaceStandaloneTests.js';

function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}


export default function symbolReplaceTestTest() {
  describe('SymbolReplaceTest', () => {
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
     * @tc.name   RegExpDefaultSymbolReplaceTest001
     * @tc.number SUB_SYMBOL_REPLACE_STANDALONE_TEST_001
     * @tc.desc   Verify RegExp's default [Symbol.replace] works with String.replace (global replacement)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RegExpDefaultSymbolReplaceTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolReplaceStandaloneTestUtils.test001_RegExpDefaultSymbolReplace();
      expect(result).assertEqual("Test Passed: RegExpDefaultSymbolReplaceTest001");
    });

    /**
     * @tc.name   CustomObjectSymbolReplaceTest002
     * @tc.number SUB_SYMBOL_REPLACE_STANDALONE_TEST_002
     * @tc.desc   Verify custom object's [Symbol.replace] overrides String.replace
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('CustomObjectSymbolReplaceTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolReplaceStandaloneTestUtils.test002_CustomObjectSymbolReplace();
      expect(result).assertEqual("Test Passed: CustomObjectSymbolReplaceTest002");
    });





    /**
     * @tc.name   SymbolReplaceWithFunctionReplaceValTest005
     * @tc.number SUB_SYMBOL_REPLACE_STANDALONE_TEST_005
     * @tc.desc   Verify custom [Symbol.replace] supports replace value as function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SymbolReplaceWithFunctionReplaceValTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolReplaceStandaloneTestUtils.test005_SymbolReplaceWithFunctionReplaceVal();
      expect(result).assertEqual("Test Passed: SymbolReplaceWithFunctionReplaceValTest005");
    });


    /**
     * @tc.name   InheritedSymbolReplaceTest007
     * @tc.number SUB_SYMBOL_REPLACE_STANDALONE_TEST_007
     * @tc.desc   Verify [Symbol.replace] can be inherited via prototype chain
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('InheritedSymbolReplaceTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolReplaceStandaloneTestUtils.test007_InheritedSymbolReplace();
      expect(result).assertEqual("Test Passed: InheritedSymbolReplaceTest007");
    });

    /**
     * @tc.name   RegExpNonGlobalSymbolReplaceTest008
     * @tc.number SUB_SYMBOL_REPLACE_STANDALONE_TEST_008
     * @tc.desc   Verify RegExp without 'g' flag replaces only first match via [Symbol.replace]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RegExpNonGlobalSymbolReplaceTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolReplaceStandaloneTestUtils.test008_RegExpNonGlobalSymbolReplace();
      expect(result).assertEqual("Test Passed: RegExpNonGlobalSymbolReplaceTest008");
    });

    /**
     * @tc.name   SymbolReplaceWithCaptureGroupsTest009
     * @tc.number SUB_SYMBOL_REPLACE_STANDALONE_TEST_009
     * @tc.desc   Verify custom [Symbol.replace] supports regex capture groups in replace value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SymbolReplaceWithCaptureGroupsTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolReplaceStandaloneTestUtils.test009_SymbolReplaceWithCaptureGroups();
      expect(result).assertEqual("Test Passed: SymbolReplaceWithCaptureGroupsTest009");
    });

    /**
     * @tc.name   SymbolReplaceWithEmptyMatchTest010
     * @tc.number SUB_SYMBOL_REPLACE_STANDALONE_TEST_010
     * @tc.desc   Verify custom [Symbol.replace] correctly processes empty match
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SymbolReplaceWithEmptyMatchTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolReplaceStandaloneTestUtils.test010_SymbolReplaceWithEmptyMatch();
      expect(result).assertEqual("Test Passed: SymbolReplaceWithEmptyMatchTest010");
    });


    /**
     * @tc.name   SpecialReplaceSequencesTest012
     * @tc.number SUB_SYMBOL_REPLACE_STANDALONE_TEST_012
     * @tc.desc   Verify custom [Symbol.replace] handles special replace sequences ($&, $`, $')
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SpecialReplaceSequencesTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolReplaceStandaloneTestUtils.test012_SpecialReplaceSequences();
      expect(result).assertEqual("Test Passed: SpecialReplaceSequencesTest012");
    });



    /**
     * @tc.name   IterativeReplacementTest014
     * @tc.number SUB_SYMBOL_REPLACE_STANDALONE_TEST_014
     * @tc.desc   Verify custom [Symbol.replace] implements iterative replacement
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IterativeReplacementTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolReplaceStandaloneTestUtils.test014_IterativeReplacement();
      expect(result).assertEqual("Test Passed: IterativeReplacementTest014");
    });

    /**
     * @tc.name   ErrorPropagationInReplaceTest015
     * @tc.number SUB_SYMBOL_REPLACE_STANDALONE_TEST_015
     * @tc.desc   Verify errors in [Symbol.replace] are propagated to caller
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ErrorPropagationInReplaceTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolReplaceStandaloneTestUtils.test015_ErrorPropagationInReplace();
      expect(result).assertEqual("Test Passed: ErrorPropagationInReplaceTest015");
    });

    /**
     * @tc.name   FrozenReplacerSymbolReplaceTest016
     * @tc.number SUB_SYMBOL_REPLACE_STANDALONE_TEST_016
     * @tc.desc   Verify frozen replacer objects support [Symbol.replace]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('FrozenReplacerSymbolReplaceTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolReplaceStandaloneTestUtils.test016_FrozenReplacerSymbolReplace();
      expect(result).assertEqual("Test Passed: FrozenReplacerSymbolReplaceTest016");
    });

    /**
     * @tc.name   ReplaceFunctionWithArgsTest017
     * @tc.number SUB_SYMBOL_REPLACE_STANDALONE_TEST_017
     * @tc.desc   Verify replace function receives capture groups/index in [Symbol.replace]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ReplaceFunctionWithArgsTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolReplaceStandaloneTestUtils.test017_ReplaceFunctionWithArgs();
      expect(result).assertEqual("Test Passed: ReplaceFunctionWithArgsTest017");
    });

    /**
     * @tc.name   MultiByteCharacterReplaceTest018
     * @tc.number SUB_SYMBOL_REPLACE_STANDALONE_TEST_018
     * @tc.desc   Verify [Symbol.replace] correctly handles multi-byte characters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MultiByteCharacterReplaceTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolReplaceStandaloneTestUtils.test018_MultiByteCharacterReplace();
      expect(result).assertEqual("Test Passed: MultiByteCharacterReplaceTest018");
    });



    /**
     * @tc.name   NamedCaptureGroupsReplaceTest020
     * @tc.number SUB_SYMBOL_REPLACE_STANDALONE_TEST_020
     * @tc.desc   Verify custom [Symbol.replace] supports named capture group placeholders
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('NamedCaptureGroupsReplaceTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolReplaceStandaloneTestUtils.test020_NamedCaptureGroupsReplace();
      expect(result).assertEqual("Test Passed: NamedCaptureGroupsReplaceTest020");
    });



    /**
     * @tc.name   RegExpLastIndexResetAfterReplaceTest023
     * @tc.number SUB_SYMBOL_REPLACE_STANDALONE_TEST_023
     * @tc.desc   Verify RegExp.lastIndex is reset to 0 after global replacement
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RegExpLastIndexResetAfterReplaceTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolReplaceStandaloneTestUtils.test023_RegExpLastIndexResetAfterReplace();
      expect(result).assertEqual("Test Passed: RegExpLastIndexResetAfterReplaceTest023");
    });

    /**
     * @tc.name   NonStringReturnFromReplaceTest024
     * @tc.number SUB_SYMBOL_REPLACE_STANDALONE_TEST_024
     * @tc.desc   Verify [Symbol.replace] can return non-string values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('NonStringReturnFromReplaceTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolReplaceStandaloneTestUtils.test024_NonStringReturnFromReplace();
      expect(result).assertEqual("Test Passed: NonStringReturnFromReplaceTest024");
    });

    /**
     * @tc.name   NullUndefinedAsReplaceValTest025
     * @tc.number SUB_SYMBOL_REPLACE_STANDALONE_TEST_025
     * @tc.desc   Verify null/undefined as replaceVal are converted to strings
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('NullUndefinedAsReplaceValTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolReplaceStandaloneTestUtils.test025_NullUndefinedAsReplaceVal();
      expect(result).assertEqual("Test Passed: NullUndefinedAsReplaceValTest025");
    });

    /**
     * @tc.name   SymbolReplaceThisBindingTest026
     * @tc.number SUB_SYMBOL_REPLACE_STANDALONE_TEST_026
     * @tc.desc   Verify `this` in custom [Symbol.replace] points to the replacer object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SymbolReplaceThisBindingTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolReplaceStandaloneTestUtils.test026_SymbolReplaceThisBinding();
      expect(result).assertEqual("Test Passed: SymbolReplaceThisBindingTest026");
    });

    /**
     * @tc.name   OverrideRegExpPrototypeReplaceTest027
     * @tc.number SUB_SYMBOL_REPLACE_STANDALONE_TEST_027
     * @tc.desc   Verify overriding RegExp.prototype[Symbol.replace] affects all RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OverrideRegExpPrototypeReplaceTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolReplaceStandaloneTestUtils.test027_OverrideRegExpPrototypeReplace();
      expect(result).assertEqual("Test Passed: OverrideRegExpPrototypeReplaceTest027");
    });

    /**
     * @tc.name   EmptyStringTargetReplaceTest028
     * @tc.number SUB_SYMBOL_REPLACE_STANDALONE_TEST_028
     * @tc.desc   Verify custom [Symbol.replace] handles empty target string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('EmptyStringTargetReplaceTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolReplaceStandaloneTestUtils.test028_EmptyStringTargetReplace();
      expect(result).assertEqual("Test Passed: EmptyStringTargetReplaceTest028");
    });

    /**
     * @tc.name   SubclassOverrideInheritedReplaceTest029
     * @tc.number SUB_SYMBOL_REPLACE_STANDALONE_TEST_029
     * @tc.desc   Verify subclass instance overrides inherited [Symbol.replace]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SubclassOverrideInheritedReplaceTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolReplaceStandaloneTestUtils.test029_SubclassOverrideInheritedReplace();
      expect(result).assertEqual("Test Passed: SubclassOverrideInheritedReplaceTest029");
    });

    /**
     * @tc.name   ManualCallSymbolReplaceTest030
     * @tc.number SUB_SYMBOL_REPLACE_STANDALONE_TEST_030
     * @tc.desc   Verify [Symbol.replace] can be called directly (not via String.replace)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ManualCallSymbolReplaceTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolReplaceStandaloneTestUtils.test030_ManualCallSymbolReplace();
      expect(result).assertEqual("Test Passed: ManualCallSymbolReplaceTest030");
    });
  })
}