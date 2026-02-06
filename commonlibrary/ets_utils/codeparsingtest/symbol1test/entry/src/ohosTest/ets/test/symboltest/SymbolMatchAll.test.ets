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
import { SymbolMatchAllStandaloneTestUtils } from './symbolMatchAllStandaloneTests.js';


function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}

export default function symbolMatchAllTestTest() {
  describe('SymbolMatchAllTest', () => {
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
     * @tc.name   RegExpDefaultSymbolMatchAllTest001
     * @tc.number SUB_SYMBOL_MATCHALL_STANDALONE_TEST_001
     * @tc.desc   Verify RegExp's default [Symbol.matchAll] returns iterator (requires 'g' flag)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RegExpDefaultSymbolMatchAllTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolMatchAllStandaloneTestUtils.test001_RegExpDefaultSymbolMatchAll();
      expect(result).assertEqual("Test Passed: RegExpDefaultSymbolMatchAllTest001");
    });

    /**
     * @tc.name   CustomObjectSymbolMatchAllTest002
     * @tc.number SUB_SYMBOL_MATCHALL_STANDALONE_TEST_002
     * @tc.desc   Verify custom object's [Symbol.matchAll] overrides String.matchAll
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('CustomObjectSymbolMatchAllTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolMatchAllStandaloneTestUtils.test002_CustomObjectSymbolMatchAll();
      expect(result).assertEqual("Test Passed: CustomObjectSymbolMatchAllTest002");
    });



    /**
     * @tc.name   SymbolMatchAllIteratorForOfTest004
     * @tc.number SUB_SYMBOL_MATCHALL_STANDALONE_TEST_004
     * @tc.desc   Verify [Symbol.matchAll] iterator supports for...of traversal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SymbolMatchAllIteratorForOfTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolMatchAllStandaloneTestUtils.test004_SymbolMatchAllIteratorForOf();
      expect(result).assertEqual("Test Passed: SymbolMatchAllIteratorForOfTest004");
    });

    /**
     * @tc.name   CustomIteratorNonArrayEntriesTest005
     * @tc.number SUB_SYMBOL_MATCHALL_STANDALONE_TEST_005
     * @tc.desc   Verify custom [Symbol.matchAll] returns non-array iterator entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('CustomIteratorNonArrayEntriesTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolMatchAllStandaloneTestUtils.test005_CustomIteratorNonArrayEntries();
      expect(result).assertEqual("Test Passed: CustomIteratorNonArrayEntriesTest005");
    });


    /**
     * @tc.name   SymbolMatchAllIteratorNonReusableTest007
     * @tc.number SUB_SYMBOL_MATCHALL_STANDALONE_TEST_007
     * @tc.desc   Verify [Symbol.matchAll] iterator is single-use (non-reusable)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SymbolMatchAllIteratorNonReusableTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolMatchAllStandaloneTestUtils.test007_SymbolMatchAllIteratorNonReusable();
      expect(result).assertEqual("Test Passed: SymbolMatchAllIteratorNonReusableTest007");
    });



    /**
     * @tc.name   InheritedSymbolMatchAllTest009
     * @tc.number SUB_SYMBOL_MATCHALL_STANDALONE_TEST_009
     * @tc.desc   Verify [Symbol.matchAll] can be inherited via prototype chain
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('InheritedSymbolMatchAllTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolMatchAllStandaloneTestUtils.test009_InheritedSymbolMatchAll();
      expect(result).assertEqual("Test Passed: InheritedSymbolMatchAllTest009");
    });





    /**
     * @tc.name   CustomIteratorThrowsErrorTest013
     * @tc.number SUB_SYMBOL_MATCHALL_STANDALONE_TEST_013
     * @tc.desc   Verify errors in custom [Symbol.matchAll] iterator are propagated
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('CustomIteratorThrowsErrorTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolMatchAllStandaloneTestUtils.test013_CustomIteratorThrowsError();
      expect(result).assertEqual("Test Passed: CustomIteratorThrowsErrorTest013");
    });






    /**
     * @tc.name   NamedCaptureGroupsTest017
     * @tc.number SUB_SYMBOL_MATCHALL_STANDALONE_TEST_017
     * @tc.desc   Verify [Symbol.matchAll] returns 'groups' property for named capture groups
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('NamedCaptureGroupsTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolMatchAllStandaloneTestUtils.test017_NamedCaptureGroups();
      expect(result).assertEqual("Test Passed: NamedCaptureGroupsTest017");
    });

    /**
     * @tc.name   SparseMatchResultsTest018
     * @tc.number SUB_SYMBOL_MATCHALL_STANDALONE_TEST_018
     * @tc.desc   Verify [Symbol.matchAll] collects sparse (non-consecutive) matches
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SparseMatchResultsTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolMatchAllStandaloneTestUtils.test018_SparseMatchResults();
      expect(result).assertEqual("Test Passed: SparseMatchResultsTest018");
    });

    /**
     * @tc.name   SubclassOverrideInheritedMatchAllTest019
     * @tc.number SUB_SYMBOL_MATCHALL_STANDALONE_TEST_019
     * @tc.desc   Verify subclass instance overrides inherited [Symbol.matchAll]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SubclassOverrideInheritedMatchAllTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolMatchAllStandaloneTestUtils.test019_SubclassOverrideInheritedMatchAll();
      expect(result).assertEqual("Test Passed: SubclassOverrideInheritedMatchAllTest019");
    });

    /**
     * @tc.name   FrozenRegExpSymbolMatchAllTest020
     * @tc.number SUB_SYMBOL_MATCHALL_STANDALONE_TEST_020
     * @tc.desc   Verify frozen RegExp objects support [Symbol.matchAll]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('FrozenRegExpSymbolMatchAllTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolMatchAllStandaloneTestUtils.test020_FrozenRegExpSymbolMatchAll();
      expect(result).assertEqual("Test Passed: FrozenRegExpSymbolMatchAllTest020");
    });

    /**
     * @tc.name   DynamicStringModificationTest021
     * @tc.number SUB_SYMBOL_MATCHALL_STANDALONE_TEST_021
     * @tc.desc   Verify [Symbol.matchAll] uses original string (no lazy re-evaluation)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DynamicStringModificationTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolMatchAllStandaloneTestUtils.test021_DynamicStringModification();
      expect(result).assertEqual("Test Passed: DynamicStringModificationTest021");
    });

    /**
     * @tc.name   SymbolMatchAllFalseWithStartsWithTest022
     * @tc.number SUB_SYMBOL_MATCHALL_STANDALONE_TEST_022
     * @tc.desc   Verify [Symbol.matchAll]=false marks object as non-regex for String.startsWith
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SymbolMatchAllFalseWithStartsWithTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolMatchAllStandaloneTestUtils.test022_SymbolMatchAllFalseWithStartsWith();
      expect(result).assertEqual("Test Passed: SymbolMatchAllFalseWithStartsWithTest022");
    });

    /**
     * @tc.name   CustomIteratorEarlyTerminationTest023
     * @tc.number SUB_SYMBOL_MATCHALL_STANDALONE_TEST_023
     * @tc.desc   Verify custom [Symbol.matchAll] iterator can terminate early
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('CustomIteratorEarlyTerminationTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolMatchAllStandaloneTestUtils.test023_CustomIteratorEarlyTermination();
      expect(result).assertEqual("Test Passed: CustomIteratorEarlyTerminationTest023");
    });





    /**
     * @tc.name   SymbolMatchAllThisBindingTest026
     * @tc.number SUB_SYMBOL_MATCHALL_STANDALONE_TEST_026
     * @tc.desc   Verify `this` in custom [Symbol.matchAll] points to the matcher object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SymbolMatchAllThisBindingTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolMatchAllStandaloneTestUtils.test026_SymbolMatchAllThisBinding();
      expect(result).assertEqual("Test Passed: SymbolMatchAllThisBindingTest026");
    });



  })
}