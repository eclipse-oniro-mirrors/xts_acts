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
import { SymbolToStringTagStandaloneTestUtils } from './symbolToStringTagStandaloneTests.js';

function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}


export default function symbolToStringTestTest() {
  describe('SymbolToStringTest', () => {
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
     * @tc.name   DefaultObjectToStringTagTest001
     * @tc.number SUB_SYMBOL_TOSTRINGTAG_STANDALONE_TEST_001
     * @tc.desc   Verify plain object without [Symbol.toStringTag] returns default "[object Object]"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DefaultObjectToStringTagTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolToStringTagStandaloneTestUtils.test001_DefaultObjectToStringTag();
      expect(result).assertEqual("Test Passed: DefaultObjectToStringTagTest001");
    });

    /**
     * @tc.name   CustomObjectToStringTagTest002
     * @tc.number SUB_SYMBOL_TOSTRINGTAG_STANDALONE_TEST_002
     * @tc.desc   Verify custom object with [Symbol.toStringTag] returns custom type tag
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('CustomObjectToStringTagTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolToStringTagStandaloneTestUtils.test002_CustomObjectToStringTag();
      expect(result).assertEqual("Test Passed: CustomObjectToStringTagTest002");
    });

    /**
     * @tc.name   BuiltInArrayToStringTagTest003
     * @tc.number SUB_SYMBOL_TOSTRINGTAG_STANDALONE_TEST_003
     * @tc.desc   Verify built-in Array's [Symbol.toStringTag] returns "[object Array]"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BuiltInArrayToStringTagTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolToStringTagStandaloneTestUtils.test003_BuiltInArrayToStringTag();
      expect(result).assertEqual("Test Passed: BuiltInArrayToStringTagTest003");
    });

    /**
     * @tc.name   SubclassInheritToStringTagTest004
     * @tc.number SUB_SYMBOL_TOSTRINGTAG_STANDALONE_TEST_004
     * @tc.desc   Verify subclass inherits [Symbol.toStringTag] from parent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SubclassInheritToStringTagTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolToStringTagStandaloneTestUtils.test004_SubclassInheritToStringTag();
      expect(result).assertEqual("Test Passed: SubclassInheritToStringTagTest004");
    });

    /**
     * @tc.name   FrozenObjectToStringTagTest005
     * @tc.number SUB_SYMBOL_TOSTRINGTAG_STANDALONE_TEST_005
     * @tc.desc   Verify frozen object retains [Symbol.toStringTag] functionality
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('FrozenObjectToStringTagTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolToStringTagStandaloneTestUtils.test005_FrozenObjectToStringTag();
      expect(result).assertEqual("Test Passed: FrozenObjectToStringTagTest005");
    });



    /**
     * @tc.name   NullUndefinedToStringTagTest007
     * @tc.number SUB_SYMBOL_TOSTRINGTAG_STANDALONE_TEST_007
     * @tc.desc   Verify null/undefined return default tags "[object Null]"/"[object Undefined]"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('NullUndefinedToStringTagTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolToStringTagStandaloneTestUtils.test007_NullUndefinedToStringTag();
      expect(result).assertEqual("Test Passed: NullUndefinedToStringTagTest007");
    });

    /**
     * @tc.name   OverrideArrayToStringTagTest008
     * @tc.number SUB_SYMBOL_TOSTRINGTAG_STANDALONE_TEST_008
     * @tc.desc   Verify Array instance can override [Symbol.toStringTag] to custom value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OverrideArrayToStringTagTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolToStringTagStandaloneTestUtils.test008_OverrideArrayToStringTag();
      expect(result).assertEqual("Test Passed: OverrideArrayToStringTagTest008");
    });



    /**
     * @tc.name   FunctionToStringTagTest010
     * @tc.number SUB_SYMBOL_TOSTRINGTAG_STANDALONE_TEST_010
     * @tc.desc   Verify Function's default [Symbol.toStringTag] is "Function" and customizable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('FunctionToStringTagTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolToStringTagStandaloneTestUtils.test010_FunctionToStringTag();
      expect(result).assertEqual("Test Passed: FunctionToStringTagTest010");
    });

    /**
     * @tc.name   BuiltInPromiseToStringTagTest011
     * @tc.number SUB_SYMBOL_TOSTRINGTAG_STANDALONE_TEST_011
     * @tc.desc   Verify built-in Promise's [Symbol.toStringTag] returns "[object Promise]"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BuiltInPromiseToStringTagTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolToStringTagStandaloneTestUtils.test011_BuiltInPromiseToStringTag();
      expect(result).assertEqual("Test Passed: BuiltInPromiseToStringTagTest011");
    });

    /**
     * @tc.name   GetterToStringTagTest012
     * @tc.number SUB_SYMBOL_TOSTRINGTAG_STANDALONE_TEST_012
     * @tc.desc   Verify [Symbol.toStringTag] as getter returns dynamic values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('GetterToStringTagTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolToStringTagStandaloneTestUtils.test012_GetterToStringTag();
      expect(result).assertEqual("Test Passed: GetterToStringTagTest012");
    });


    /**
     * @tc.name   BuiltInMapToStringTagTest014
     * @tc.number SUB_SYMBOL_TOSTRINGTAG_STANDALONE_TEST_014
     * @tc.desc   Verify built-in Map's [Symbol.toStringTag] returns "[object Map]"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BuiltInMapToStringTagTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolToStringTagStandaloneTestUtils.test014_BuiltInMapToStringTag();
      expect(result).assertEqual("Test Passed: BuiltInMapToStringTagTest014");
    });

    /**
     * @tc.name   DeleteToStringTagFallbackTest015
     * @tc.number SUB_SYMBOL_TOSTRINGTAG_STANDALONE_TEST_015
     * @tc.desc   Verify deleting [Symbol.toStringTag] falls back to default "[object Object]"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DeleteToStringTagFallbackTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolToStringTagStandaloneTestUtils.test015_DeleteToStringTagFallback();
      expect(result).assertEqual("Test Passed: DeleteToStringTagFallbackTest015");
    });

    /**
     * @tc.name   TypedArrayToStringTagTest016
     * @tc.number SUB_SYMBOL_TOSTRINGTAG_STANDALONE_TEST_016
     * @tc.desc   Verify Uint8Array's [Symbol.toStringTag] returns "[object Uint8Array]"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TypedArrayToStringTagTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolToStringTagStandaloneTestUtils.test016_TypedArrayToStringTag();
      expect(result).assertEqual("Test Passed: TypedArrayToStringTagTest016");
    });

    /**
     * @tc.name   ErrorObjectToStringTagTest017
     * @tc.number SUB_SYMBOL_TOSTRINGTAG_STANDALONE_TEST_017
     * @tc.desc   Verify Error object's [Symbol.toStringTag] returns "[object Error]"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ErrorObjectToStringTagTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolToStringTagStandaloneTestUtils.test017_ErrorObjectToStringTag();
      expect(result).assertEqual("Test Passed: ErrorObjectToStringTagTest017");
    });

    /**
     * @tc.name   GeneratorFunctionToStringTagTest018
     * @tc.number SUB_SYMBOL_TOSTRINGTAG_STANDALONE_TEST_018
     * @tc.desc   Verify Generator instance's [Symbol.toStringTag] returns "[object Generator]"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('GeneratorFunctionToStringTagTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolToStringTagStandaloneTestUtils.test018_GeneratorFunctionToStringTag();
      expect(result).assertEqual("Test Passed: GeneratorFunctionToStringTagTest018");
    });



    /**
     * @tc.name   BuiltInWeakMapToStringTagTest020
     * @tc.number SUB_SYMBOL_TOSTRINGTAG_STANDALONE_TEST_020
     * @tc.desc   Verify built-in WeakMap's [Symbol.toStringTag] returns "[object WeakMap]"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BuiltInWeakMapToStringTagTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolToStringTagStandaloneTestUtils.test020_BuiltInWeakMapToStringTag();
      expect(result).assertEqual("Test Passed: BuiltInWeakMapToStringTagTest020");
    });



    /**
     * @tc.name   MultiLevelInheritanceOverrideTest022
     * @tc.number SUB_SYMBOL_TOSTRINGTAG_STANDALONE_TEST_022
     * @tc.desc   Verify multi-level inheritance follows [Symbol.toStringTag] override priority
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MultiLevelInheritanceOverrideTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolToStringTagStandaloneTestUtils.test022_MultiLevelInheritanceOverride();
      expect(result).assertEqual("Test Passed: MultiLevelInheritanceOverrideTest022");
    });

    /**
     * @tc.name   SymbolObjectToStringTagTest023
     * @tc.number SUB_SYMBOL_TOSTRINGTAG_STANDALONE_TEST_023
     * @tc.desc   Verify Symbol wrapper object's [Symbol.toStringTag] returns "[object Symbol]"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SymbolObjectToStringTagTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolToStringTagStandaloneTestUtils.test023_SymbolObjectToStringTag();
      expect(result).assertEqual("Test Passed: SymbolObjectToStringTagTest023");
    });

    /**
     * @tc.name   DateObjectToStringTagTest024
     * @tc.number SUB_SYMBOL_TOSTRINGTAG_STANDALONE_TEST_024
     * @tc.desc   Verify Date object's [Symbol.toStringTag] returns "[object Date]"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DateObjectToStringTagTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolToStringTagStandaloneTestUtils.test024_DateObjectToStringTag();
      expect(result).assertEqual("Test Passed: DateObjectToStringTagTest024");
    });

    /**
     * @tc.name   RegExpObjectToStringTagTest025
     * @tc.number SUB_SYMBOL_TOSTRINGTAG_STANDALONE_TEST_025
     * @tc.desc   Verify RegExp object's [Symbol.toStringTag] returns "[object RegExp]"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RegExpObjectToStringTagTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolToStringTagStandaloneTestUtils.test025_RegExpObjectToStringTag();
      expect(result).assertEqual("Test Passed: RegExpObjectToStringTagTest025");
    });

    /**
     * @tc.name   ProxyInheritToStringTagTest026
     * @tc.number SUB_SYMBOL_TOSTRINGTAG_STANDALONE_TEST_026
     * @tc.desc   Verify Proxy instance inherits [Symbol.toStringTag] from target
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ProxyInheritToStringTagTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolToStringTagStandaloneTestUtils.test026_ProxyInheritToStringTag();
      expect(result).assertEqual("Test Passed: ProxyInheritToStringTagTest026");
    });

    /**
     * @tc.name   EmptyClassToStringTagTest027
     * @tc.number SUB_SYMBOL_TOSTRINGTAG_STANDALONE_TEST_027
     * @tc.desc   Verify empty class instance returns default "[object Object]"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('EmptyClassToStringTagTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolToStringTagStandaloneTestUtils.test027_EmptyClassToStringTag();
      expect(result).assertEqual("Test Passed: EmptyClassToStringTagTest027");
    });


    /**
     * @tc.name   BuiltInSetToStringTagTest029
     * @tc.number SUB_SYMBOL_TOSTRINGTAG_STANDALONE_TEST_029
     * @tc.desc   Verify built-in Set's [Symbol.toStringTag] returns "[object Set]"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BuiltInSetToStringTagTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolToStringTagStandaloneTestUtils.test029_BuiltInSetToStringTag();
      expect(result).assertEqual("Test Passed: BuiltInSetToStringTagTest029");
    });

    /**
     * @tc.name   ToJSONDoesNotAffectToStringTagTest030
     * @tc.number SUB_SYMBOL_TOSTRINGTAG_STANDALONE_TEST_030
     * @tc.desc   Verify toJSON method does not affect [Symbol.toStringTag]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ToJSONDoesNotAffectToStringTagTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolToStringTagStandaloneTestUtils.test030_ToJSONDoesNotAffectToStringTag();
      expect(result).assertEqual("Test Passed: ToJSONDoesNotAffectToStringTagTest030");
    });
  })
}