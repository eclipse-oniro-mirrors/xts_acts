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
import { SymbolSplitStandaloneTestUtils } from './symbolSplitStandaloneTests.js';

function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}


export default function symbolSplitTestTest() {
  describe('SymbolSplitTest', () => {
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
     * @tc.name   RegExpDefaultSymbolSplitTest001
     * @tc.number SUB_SYMBOL_SPLIT_STANDALONE_TEST_001
     * @tc.desc   Verify RegExp's default [Symbol.split] splits at regex matches via String.split()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RegExpDefaultSymbolSplitTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolSplitStandaloneTestUtils.test001_RegExpDefaultSymbolSplit();
      expect(result).assertEqual("Test Passed: RegExpDefaultSymbolSplitTest001");
    });

    /**
     * @tc.name   CustomObjectSymbolSplitTest002
     * @tc.number SUB_SYMBOL_SPLIT_STANDALONE_TEST_002
     * @tc.desc   Verify custom object's [Symbol.split] overrides String.split() logic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('CustomObjectSymbolSplitTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolSplitStandaloneTestUtils.test002_CustomObjectSymbolSplit();
      expect(result).assertEqual("Test Passed: CustomObjectSymbolSplitTest002");
    });


    /**
     * @tc.name   SymbolSplitReceivesLimitTest004
     * @tc.number SUB_SYMBOL_SPLIT_STANDALONE_TEST_004
     * @tc.desc   Verify [Symbol.split] method receives split limit parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SymbolSplitReceivesLimitTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolSplitStandaloneTestUtils.test004_SymbolSplitReceivesLimit();
      expect(result).assertEqual("Test Passed: SymbolSplitReceivesLimitTest004");
    });

    /**
     * @tc.name   NoMatchReturnsOriginalArrayTest005
     * @tc.number SUB_SYMBOL_SPLIT_STANDALONE_TEST_005
     * @tc.desc   Verify [Symbol.split] returns [originalStr] when no matches
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('NoMatchReturnsOriginalArrayTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolSplitStandaloneTestUtils.test005_NoMatchReturnsOriginalArray();
      expect(result).assertEqual("Test Passed: NoMatchReturnsOriginalArrayTest005");
    });



    /**
     * @tc.name   InheritedSymbolSplitTest007
     * @tc.number SUB_SYMBOL_SPLIT_STANDALONE_TEST_007
     * @tc.desc   Verify [Symbol.split] can be inherited via prototype chain
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('InheritedSymbolSplitTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolSplitStandaloneTestUtils.test007_InheritedSymbolSplit();
      expect(result).assertEqual("Test Passed: InheritedSymbolSplitTest007");
    });




    /**
     * @tc.name   ManualCallSymbolSplitTest010
     * @tc.number SUB_SYMBOL_SPLIT_STANDALONE_TEST_010
     * @tc.desc   Verify [Symbol.split] can be called directly (not via String.split)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ManualCallSymbolSplitTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolSplitStandaloneTestUtils.test010_ManualCallSymbolSplit();
      expect(result).assertEqual("Test Passed: ManualCallSymbolSplitTest010");
    });



    /**
     * @tc.name   ErrorPropagationInSplitTest012
     * @tc.number SUB_SYMBOL_SPLIT_STANDALONE_TEST_012
     * @tc.desc   Verify errors in [Symbol.split] are propagated to caller
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ErrorPropagationInSplitTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolSplitStandaloneTestUtils.test012_ErrorPropagationInSplit();
      expect(result).assertEqual("Test Passed: ErrorPropagationInSplitTest012");
    });

    /**
     * @tc.name   FrozenSplitterSymbolSplitTest013
     * @tc.number SUB_SYMBOL_SPLIT_STANDALONE_TEST_013
     * @tc.desc   Verify frozen splitter objects support [Symbol.split]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('FrozenSplitterSymbolSplitTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolSplitStandaloneTestUtils.test013_FrozenSplitterSymbolSplit();
      expect(result).assertEqual("Test Passed: FrozenSplitterSymbolSplitTest013");
    });

    /**
     * @tc.name   UnicodeMultiByteSplitTest014
     * @tc.number SUB_SYMBOL_SPLIT_STANDALONE_TEST_014
     * @tc.desc   Verify [Symbol.split] calculates Unicode multi-byte character indices correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('UnicodeMultiByteSplitTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolSplitStandaloneTestUtils.test014_UnicodeMultiByteSplit();
      expect(result).assertEqual("Test Passed: UnicodeMultiByteSplitTest014");
    });

    /**
     * @tc.name   DynamicSplitterPropertyTest015
     * @tc.number SUB_SYMBOL_SPLIT_STANDALONE_TEST_015
     * @tc.desc   Verify dynamic splitter properties influence [Symbol.split] behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DynamicSplitterPropertyTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolSplitStandaloneTestUtils.test015_DynamicSplitterProperty();
      expect(result).assertEqual("Test Passed: DynamicSplitterPropertyTest015");
    });

    /**
     * @tc.name   NamedCaptureGroupsSplitTest016
     * @tc.number SUB_SYMBOL_SPLIT_STANDALONE_TEST_016
     * @tc.desc   Verify custom [Symbol.split] retains named capture group info
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('NamedCaptureGroupsSplitTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolSplitStandaloneTestUtils.test016_NamedCaptureGroupsSplit();
      expect(result).assertEqual("Test Passed: NamedCaptureGroupsSplitTest016");
    });

    /**
     * @tc.name   IterativeSplitReturnIteratorTest017
     * @tc.number SUB_SYMBOL_SPLIT_STANDALONE_TEST_017
     * @tc.desc   Verify custom [Symbol.split] returns iterator for lazy split
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IterativeSplitReturnIteratorTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolSplitStandaloneTestUtils.test017_IterativeSplitReturnIterator();
      expect(result).assertEqual("Test Passed: IterativeSplitReturnIteratorTest017");
    });

    /**
     * @tc.name   EmptyStringTargetSplitTest018
     * @tc.number SUB_SYMBOL_SPLIT_STANDALONE_TEST_018
     * @tc.desc   Verify [Symbol.split] correctly processes empty target string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('EmptyStringTargetSplitTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolSplitStandaloneTestUtils.test018_EmptyStringTargetSplit();
      expect(result).assertEqual("Test Passed: EmptyStringTargetSplitTest018");
    });



    /**
     * @tc.name   SubclassOverrideInheritedSplitTest020
     * @tc.number SUB_SYMBOL_SPLIT_STANDALONE_TEST_020
     * @tc.desc   Verify subclass instance overrides inherited [Symbol.split]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SubclassOverrideInheritedSplitTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolSplitStandaloneTestUtils.test020_SubclassOverrideInheritedSplit();
      expect(result).assertEqual("Test Passed: SubclassOverrideInheritedSplitTest020");
    });

    /**
     * @tc.name   RepeatedSplitCallsTest021
     * @tc.number SUB_SYMBOL_SPLIT_STANDALONE_TEST_021
     * @tc.desc   Verify repeated split calls return consistent results
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RepeatedSplitCallsTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolSplitStandaloneTestUtils.test021_RepeatedSplitCalls();
      expect(result).assertEqual("Test Passed: RepeatedSplitCallsTest021");
    });

    /**
     * @tc.name   EmptySeparatorSplitTest022
     * @tc.number SUB_SYMBOL_SPLIT_STANDALONE_TEST_022
     * @tc.desc   Verify empty separator splits string into individual characters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('EmptySeparatorSplitTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolSplitStandaloneTestUtils.test022_EmptySeparatorSplit();
      expect(result).assertEqual("Test Passed: EmptySeparatorSplitTest022");
    });

    /**
     * @tc.name   RegexMetacharactersAsSeparatorTest023
     * @tc.number SUB_SYMBOL_SPLIT_STANDALONE_TEST_023
     * @tc.desc   Verify custom [Symbol.split] treats regex metacharacters as raw text
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RegexMetacharactersAsSeparatorTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolSplitStandaloneTestUtils.test023_RegexMetacharactersAsSeparator();
      expect(result).assertEqual("Test Passed: RegexMetacharactersAsSeparatorTest023");
    });

    /**
     * @tc.name   MultiLevelInheritanceSplitTest024
     * @tc.number SUB_SYMBOL_SPLIT_STANDALONE_TEST_024
     * @tc.desc   Verify multi-level inheritance follows split priority (subclass highest)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MultiLevelInheritanceSplitTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolSplitStandaloneTestUtils.test024_MultiLevelInheritanceSplit();
      expect(result).assertEqual("Test Passed: MultiLevelInheritanceSplitTest024");
    });

    /**
     * @tc.name   NonArrayReturnFromSplitTest025
     * @tc.number SUB_SYMBOL_SPLIT_STANDALONE_TEST_025
     * @tc.desc   Verify [Symbol.split] can return non-array values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('NonArrayReturnFromSplitTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolSplitStandaloneTestUtils.test025_NonArrayReturnFromSplit();
      expect(result).assertEqual("Test Passed: NonArrayReturnFromSplitTest025");
    });



    /**
     * @tc.name   SparseStringSplitTest027
     * @tc.number SUB_SYMBOL_SPLIT_STANDALONE_TEST_027
     * @tc.desc   Verify [Symbol.split] correctly processes sparse strings
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SparseStringSplitTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolSplitStandaloneTestUtils.test027_SparseStringSplit();
      expect(result).assertEqual("Test Passed: SparseStringSplitTest027");
    });

    /**
     * @tc.name   DynamicStringModificationTest028
     * @tc.number SUB_SYMBOL_SPLIT_STANDALONE_TEST_028
     * @tc.desc   Verify split uses original string (no lazy re-evaluation of modified string)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DynamicStringModificationTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolSplitStandaloneTestUtils.test028_DynamicStringModification();
      expect(result).assertEqual("Test Passed: DynamicStringModificationTest028");
    });

    /**
     * @tc.name   ClosureBasedSplitterTest029
     * @tc.number SUB_SYMBOL_SPLIT_STANDALONE_TEST_029
     * @tc.desc   Verify closure-based splitter retains context for split logic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ClosureBasedSplitterTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolSplitStandaloneTestUtils.test029_ClosureBasedSplitter();
      expect(result).assertEqual("Test Passed: ClosureBasedSplitterTest029");
    });



  })
}