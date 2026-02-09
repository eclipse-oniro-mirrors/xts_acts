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
import { SymbolSearchStandaloneTestUtils } from './symbolSearchStandaloneTests.js';

function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}


export default function symbolSearchTestTest() {
  describe('SymbolSearchTest', () => {
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
     * @tc.name   RegExpDefaultSymbolSearchTest001
     * @tc.number SUB_SYMBOL_SEARCH_STANDALONE_TEST_001
     * @tc.desc   Verify RegExp's default [Symbol.search] returns first match index (ignores 'g' flag)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RegExpDefaultSymbolSearchTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolSearchStandaloneTestUtils.test001_RegExpDefaultSymbolSearch();
      expect(result).assertEqual("Test Passed: RegExpDefaultSymbolSearchTest001");
    });



    /**
     * @tc.name   SymbolSearchReceivesTargetTest004
     * @tc.number SUB_SYMBOL_SEARCH_STANDALONE_TEST_004
     * @tc.desc   Verify [Symbol.search] method receives target string as argument
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SymbolSearchReceivesTargetTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolSearchStandaloneTestUtils.test004_SymbolSearchReceivesTarget();
      expect(result).assertEqual("Test Passed: SymbolSearchReceivesTargetTest004");
    });

    /**
     * @tc.name   NoMatchReturnsMinusOneTest005
     * @tc.number SUB_SYMBOL_SEARCH_STANDALONE_TEST_005
     * @tc.desc   Verify [Symbol.search] returns -1 when no match (consistent with RegExp)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('NoMatchReturnsMinusOneTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolSearchStandaloneTestUtils.test005_NoMatchReturnsMinusOne();
      expect(result).assertEqual("Test Passed: NoMatchReturnsMinusOneTest005");
    });



    /**
     * @tc.name   InheritedSymbolSearchTest007
     * @tc.number SUB_SYMBOL_SEARCH_STANDALONE_TEST_007
     * @tc.desc   Verify [Symbol.search] can be inherited via prototype chain
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('InheritedSymbolSearchTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolSearchStandaloneTestUtils.test007_InheritedSymbolSearch();
      expect(result).assertEqual("Test Passed: InheritedSymbolSearchTest007");
    });




    /**
     * @tc.name   EmptyStringTargetSearchTest010
     * @tc.number SUB_SYMBOL_SEARCH_STANDALONE_TEST_010
     * @tc.desc   Verify [Symbol.search] correctly handles empty target string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('EmptyStringTargetSearchTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolSearchStandaloneTestUtils.test010_EmptyStringTargetSearch();
      expect(result).assertEqual("Test Passed: EmptyStringTargetSearchTest010");
    });


    /**
     * @tc.name   ErrorPropagationInSearchTest012
     * @tc.number SUB_SYMBOL_SEARCH_STANDALONE_TEST_012
     * @tc.desc   Verify errors in [Symbol.search] are propagated to caller
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ErrorPropagationInSearchTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolSearchStandaloneTestUtils.test012_ErrorPropagationInSearch();
      expect(result).assertEqual("Test Passed: ErrorPropagationInSearchTest012");
    });

    /**
     * @tc.name   FrozenSearcherSymbolSearchTest013
     * @tc.number SUB_SYMBOL_SEARCH_STANDALONE_TEST_013
     * @tc.desc   Verify frozen searcher objects support [Symbol.search]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('FrozenSearcherSymbolSearchTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolSearchStandaloneTestUtils.test013_FrozenSearcherSymbolSearch();
      expect(result).assertEqual("Test Passed: FrozenSearcherSymbolSearchTest013");
    });


    /**
     * @tc.name   DynamicSearcherPropertyTest015
     * @tc.number SUB_SYMBOL_SEARCH_STANDALONE_TEST_015
     * @tc.desc   Verify dynamic searcher properties influence [Symbol.search] behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DynamicSearcherPropertyTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolSearchStandaloneTestUtils.test015_DynamicSearcherProperty();
      expect(result).assertEqual("Test Passed: DynamicSearcherPropertyTest015");
    });

    /**
     * @tc.name   UnicodeCharacterSearchTest016
     * @tc.number SUB_SYMBOL_SEARCH_STANDALONE_TEST_016
     * @tc.desc   Verify [Symbol.search] calculates Unicode character indices correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('UnicodeCharacterSearchTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolSearchStandaloneTestUtils.test016_UnicodeCharacterSearch();
      expect(result).assertEqual("Test Passed: UnicodeCharacterSearchTest016");
    });






    /**
     * @tc.name   RegexMetacharactersRawTextTest022
     * @tc.number SUB_SYMBOL_SEARCH_STANDALONE_TEST_022
     * @tc.desc   Verify custom [Symbol.search] treats regex metacharacters as raw text
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RegexMetacharactersRawTextTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolSearchStandaloneTestUtils.test022_RegexMetacharactersRawText();
      expect(result).assertEqual("Test Passed: RegexMetacharactersRawTextTest022");
    });

    /**
     * @tc.name   MultipleMatchesReturnFirstTest023
     * @tc.number SUB_SYMBOL_SEARCH_STANDALONE_TEST_023
     * @tc.desc   Verify [Symbol.search] returns only first index (even with multiple matches)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MultipleMatchesReturnFirstTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolSearchStandaloneTestUtils.test023_MultipleMatchesReturnFirst();
      expect(result).assertEqual("Test Passed: MultipleMatchesReturnFirstTest023");
    });



    /**
     * @tc.name   RegExpSubclassInheritedSearchTest025
     * @tc.number SUB_SYMBOL_SEARCH_STANDALONE_TEST_025
     * @tc.desc   Verify RegExp subclass can override and inherit [Symbol.search]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RegExpSubclassInheritedSearchTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolSearchStandaloneTestUtils.test025_RegExpSubclassInheritedSearch();
      expect(result).assertEqual("Test Passed: RegExpSubclassInheritedSearchTest025");
    });



    /**
     * @tc.name   EmptyMatchAtStringEndTest027
     * @tc.number SUB_SYMBOL_SEARCH_STANDALONE_TEST_027
     * @tc.desc   Verify [Symbol.search] returns correct index for empty match at string end
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('EmptyMatchAtStringEndTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolSearchStandaloneTestUtils.test027_EmptyMatchAtStringEnd();
      expect(result).assertEqual("Test Passed: EmptyMatchAtStringEndTest027");
    });

    /**
     * @tc.name   OverrideRegExpPrototypeSearchTest028
     * @tc.number SUB_SYMBOL_SEARCH_STANDALONE_TEST_028
     * @tc.desc   Verify overriding RegExp.prototype[Symbol.search] affects all RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OverrideRegExpPrototypeSearchTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolSearchStandaloneTestUtils.test028_OverrideRegExpPrototypeSearch();
      expect(result).assertEqual("Test Passed: OverrideRegExpPrototypeSearchTest028");
    });


    /**
     * @tc.name   SymbolSearchThisBindingTest030
     * @tc.number SUB_SYMBOL_SEARCH_STANDALONE_TEST_030
     * @tc.desc   Verify `this` in custom [Symbol.search] points to the searcher object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SymbolSearchThisBindingTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolSearchStandaloneTestUtils.test030_SymbolSearchThisBinding();
      expect(result).assertEqual("Test Passed: SymbolSearchThisBindingTest030");
    });
  })
}