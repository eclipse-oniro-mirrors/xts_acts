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
import { SymbolIteratorStandaloneTestUtils } from './symbolIteratorStandaloneTests.js';


function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}

export default function symbolIteratorTestTest() {
  describe('SymbolIteratorTest', () => {
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
     * @tc.name   BasicIterableTest001
     * @tc.number SUB_SYMBOL_ITERATOR_STANDALONE_TEST_001
     * @tc.desc   Verify basic iterable with Symbol.iterator works with for...of
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BasicIterableTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolIteratorStandaloneTestUtils.test001_BasicIterable();
      expect(result).assertEqual("Test Passed: BasicIterableTest001");
    });

    /**
     * @tc.name   IteratorNextShapeTest002
     * @tc.number SUB_SYMBOL_ITERATOR_STANDALONE_TEST_002
     * @tc.desc   Verify iterator next() returns { value, done } shape
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IteratorNextShapeTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolIteratorStandaloneTestUtils.test002_IteratorNextShape();
      expect(result).assertEqual("Test Passed: IteratorNextShapeTest002");
    });

    /**
     * @tc.name   EmptyIterableTest003
     * @tc.number SUB_SYMBOL_ITERATOR_STANDALONE_TEST_003
     * @tc.desc   Verify empty iterable returns no values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('EmptyIterableTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolIteratorStandaloneTestUtils.test003_EmptyIterable();
      expect(result).assertEqual("Test Passed: EmptyIterableTest003");
    });

    /**
     * @tc.name   IteratorReturnMethodTest004
     * @tc.number SUB_SYMBOL_ITERATOR_STANDALONE_TEST_004
     * @tc.desc   Verify iterator return() method stops iteration early
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IteratorReturnMethodTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolIteratorStandaloneTestUtils.test004_IteratorReturnMethod();
      expect(result).assertEqual("Test Passed: IteratorReturnMethodTest004");
    });

    /**
     * @tc.name   IteratorThrowErrorTest005
     * @tc.number SUB_SYMBOL_ITERATOR_STANDALONE_TEST_005
     * @tc.desc   Verify sync error in iterator next() propagates
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IteratorThrowErrorTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolIteratorStandaloneTestUtils.test005_IteratorThrowError();
      expect(result).assertEqual("Test Passed: IteratorThrowErrorTest005");
    });

    /**
     * @tc.name   ClassIterableTest006
     * @tc.number SUB_SYMBOL_ITERATOR_STANDALONE_TEST_006
     * @tc.desc   Verify class implementing Symbol.iterator creates iterable instances
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ClassIterableTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolIteratorStandaloneTestUtils.test006_ClassIterable();
      expect(result).assertEqual("Test Passed: ClassIterableTest006");
    });

    /**
     * @tc.name   IteratorNextWithArgumentTest007
     * @tc.number SUB_SYMBOL_ITERATOR_STANDALONE_TEST_007
     * @tc.desc   Verify sync iterator next() accepts optional argument
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IteratorNextWithArgumentTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolIteratorStandaloneTestUtils.test007_IteratorNextWithArgument();
      expect(result).assertEqual("Test Passed: IteratorNextWithArgumentTest007");
    });

    /**
     * @tc.name   NestedIterableTest008
     * @tc.number SUB_SYMBOL_ITERATOR_STANDALONE_TEST_008
     * @tc.desc   Verify nested iterables can be traversed with nested for...of
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('NestedIterableTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolIteratorStandaloneTestUtils.test008_NestedIterable();
      expect(result).assertEqual("Test Passed: NestedIterableTest008");
    });

    /**
     * @tc.name   IterableWithArrayFromTest009
     * @tc.number SUB_SYMBOL_ITERATOR_STANDALONE_TEST_009
     * @tc.desc   Verify iterable can be converted to array via Array.from
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IterableWithArrayFromTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolIteratorStandaloneTestUtils.test009_IterableWithArrayFrom();
      expect(result).assertEqual("Test Passed: IterableWithArrayFromTest009");
    });

    /**
     * @tc.name   SymbolIteratorNonEnumerableTest010
     * @tc.number SUB_SYMBOL_ITERATOR_STANDALONE_TEST_010
     * @tc.desc   Verify [Symbol.iterator] property is non-enumerable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SymbolIteratorNonEnumerableTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolIteratorStandaloneTestUtils.test010_SymbolIteratorNonEnumerable();
      expect(result).assertEqual("Test Passed: SymbolIteratorNonEnumerableTest010");
    });

    /**
     * @tc.name   IteratorThrowMethodTest011
     * @tc.number SUB_SYMBOL_ITERATOR_STANDALONE_TEST_011
     * @tc.desc   Verify iterator throw() method propagates error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IteratorThrowMethodTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolIteratorStandaloneTestUtils.test011_IteratorThrowMethod();
      expect(result).assertEqual("Test Passed: IteratorThrowMethodTest011");
    });



    /**
     * @tc.name   IterableInheritFromPrototypeTest013
     * @tc.number SUB_SYMBOL_ITERATOR_STANDALONE_TEST_013
     * @tc.desc   Verify iterable can inherit [Symbol.iterator] from prototype chain
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IterableInheritFromPrototypeTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolIteratorStandaloneTestUtils.test013_IterableInheritFromPrototype();
      expect(result).assertEqual("Test Passed: IterableInheritFromPrototypeTest013");
    });

    /**
     * @tc.name   StatelessIteratorMultipleTraversalsTest014
     * @tc.number SUB_SYMBOL_ITERATOR_STANDALONE_TEST_014
     * @tc.desc   Verify stateless iterator supports multiple traversals
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('StatelessIteratorMultipleTraversalsTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolIteratorStandaloneTestUtils.test014_StatelessIteratorMultipleTraversals();
      expect(result).assertEqual("Test Passed: StatelessIteratorMultipleTraversalsTest014");
    });

    /**
     * @tc.name   NativeStringIterableTest015
     * @tc.number SUB_SYMBOL_ITERATOR_STANDALONE_TEST_015
     * @tc.desc   Verify native string is iterable via Symbol.iterator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('NativeStringIterableTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolIteratorStandaloneTestUtils.test015_NativeStringIterable();
      expect(result).assertEqual("Test Passed: NativeStringIterableTest015");
    });

    /**
     * @tc.name   IteratorNextAfterDoneTest016
     * @tc.number SUB_SYMBOL_ITERATOR_STANDALONE_TEST_016
     * @tc.desc   Verify next() after done: true returns consistent result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IteratorNextAfterDoneTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolIteratorStandaloneTestUtils.test016_IteratorNextAfterDone();
      expect(result).assertEqual("Test Passed: IteratorNextAfterDoneTest016");
    });

    /**
     * @tc.name   IteratorReturnReturnValueTest017
     * @tc.number SUB_SYMBOL_ITERATOR_STANDALONE_TEST_017
     * @tc.desc   Verify iterator return() returns { value, done } shape
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IteratorReturnReturnValueTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolIteratorStandaloneTestUtils.test017_IteratorReturnReturnValue();
      expect(result).assertEqual("Test Passed: IteratorReturnReturnValueTest017");
    });

    /**
     * @tc.name   NativeSetIterableTest018
     * @tc.number SUB_SYMBOL_ITERATOR_STANDALONE_TEST_018
     * @tc.desc   Verify native Set is iterable via Symbol.iterator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('NativeSetIterableTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolIteratorStandaloneTestUtils.test018_NativeSetIterable();
      expect(result).assertEqual("Test Passed: NativeSetIterableTest018");
    });

    /**
     * @tc.name   NativeMapIterableTest019
     * @tc.number SUB_SYMBOL_ITERATOR_STANDALONE_TEST_019
     * @tc.desc   Verify native Map is iterable via Symbol.iterator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('NativeMapIterableTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolIteratorStandaloneTestUtils.test019_NativeMapIterable();
      expect(result).assertEqual("Test Passed: NativeMapIterableTest019");
    });

    /**
     * @tc.name   IteratorForOfContinueTest020
     * @tc.number SUB_SYMBOL_ITERATOR_STANDALONE_TEST_020
     * @tc.desc   Verify iterator works with continue in for...of
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IteratorForOfContinueTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolIteratorStandaloneTestUtils.test020_IteratorForOfContinue();
      expect(result).assertEqual("Test Passed: IteratorForOfContinueTest020");
    });

    /**
     * @tc.name   StatefulIteratorPreserveStateTest021
     * @tc.number SUB_SYMBOL_ITERATOR_STANDALONE_TEST_021
     * @tc.desc   Verify stateful iterator preserves state across next() calls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('StatefulIteratorPreserveStateTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolIteratorStandaloneTestUtils.test021_StatefulIteratorPreserveState();
      expect(result).assertEqual("Test Passed: StatefulIteratorPreserveStateTest021");
    });

    /**
     * @tc.name   SymbolIteratorConfigurableTest022
     * @tc.number SUB_SYMBOL_ITERATOR_STANDALONE_TEST_022
     * @tc.desc   Verify [Symbol.iterator] property is configurable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SymbolIteratorConfigurableTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolIteratorStandaloneTestUtils.test022_SymbolIteratorConfigurable();
      expect(result).assertEqual("Test Passed: SymbolIteratorConfigurableTest022");
    });



    /**
     * @tc.name   IteratorDoneWithValueTest025
     * @tc.number SUB_SYMBOL_ITERATOR_STANDALONE_TEST_025
     * @tc.desc   Verify iterator can return non-undefined value when done: true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IteratorDoneWithValueTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolIteratorStandaloneTestUtils.test025_IteratorDoneWithValue();
      expect(result).assertEqual("Test Passed: IteratorDoneWithValueTest025");
    });


    /**
     * @tc.name   IterableToMapTest027
     * @tc.number SUB_SYMBOL_ITERATOR_STANDALONE_TEST_027
     * @tc.desc   Verify iterable of pairs can be converted to Map via constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IterableToMapTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolIteratorStandaloneTestUtils.test027_IterableToMap();
      expect(result).assertEqual("Test Passed: IterableToMapTest027");
    });

    /**
     * @tc.name   GeneratorAsIteratorTest028
     * @tc.number SUB_SYMBOL_ITERATOR_STANDALONE_TEST_028
     * @tc.desc   Verify generator function can be used as [Symbol.iterator]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('GeneratorAsIteratorTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolIteratorStandaloneTestUtils.test028_GeneratorAsIterator();
      expect(result).assertEqual("Test Passed: GeneratorAsIteratorTest028");
    });

    /**
     * @tc.name   DynamicValueIteratorTest029
     * @tc.number SUB_SYMBOL_ITERATOR_STANDALONE_TEST_029
     * @tc.desc   Verify iterator can generate dynamic values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DynamicValueIteratorTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolIteratorStandaloneTestUtils.test029_DynamicValueIterator();
      expect(result).assertEqual("Test Passed: DynamicValueIteratorTest029");
    });

    /**
     * @tc.name   IterableAsFunctionArgumentsTest030
     * @tc.number SUB_SYMBOL_ITERATOR_STANDALONE_TEST_030
     * @tc.desc   Verify iterable can be spread as function arguments
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IterableAsFunctionArgumentsTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolIteratorStandaloneTestUtils.test030_IterableAsFunctionArguments();
      expect(result).assertEqual("Test Passed: IterableAsFunctionArgumentsTest030");
    });

  })
}