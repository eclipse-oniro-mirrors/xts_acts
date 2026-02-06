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
import { SymbolAsyncIteratorStandaloneTestUtils } from './symbolAsyncIteratorStandaloneTests.js';


function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}

export default function symbolAsyncIteratorTestTest() {
  describe('SymbolAsyncIteratorTest', () => {
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
     * @tc.name   BasicAsyncIterableTest001
     * @tc.number SUB_SYMBOL_ASYNCITERATOR_STANDALONE_TEST_001
     * @tc.desc   Verify basic async iterable with Symbol.asyncIterator works with for await...of
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BasicAsyncIterableTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolAsyncIteratorStandaloneTestUtils.test001_BasicAsyncIterable();
      expect(result).assertEqual("Test Passed: BasicAsyncIterableTest001");
    });

    /**
     * @tc.name   AsyncIteratorNextShapeTest002
     * @tc.number SUB_SYMBOL_ASYNCITERATOR_STANDALONE_TEST_002
     * @tc.desc   Verify async iterator next() returns Promise with { value, done } shape
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AsyncIteratorNextShapeTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolAsyncIteratorStandaloneTestUtils.test002_AsyncIteratorNextShape();
      expect(result).assertEqual("Test Passed: AsyncIteratorNextShapeTest002");
    });

    /**
     * @tc.name   EmptyAsyncIterableTest003
     * @tc.number SUB_SYMBOL_ASYNCITERATOR_STANDALONE_TEST_003
     * @tc.desc   Verify empty async iterable returns no values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('EmptyAsyncIterableTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolAsyncIteratorStandaloneTestUtils.test003_EmptyAsyncIterable();
      expect(result).assertEqual("Test Passed: EmptyAsyncIterableTest003");
    });

    /**
     * @tc.name   AsyncIteratorReturnMethodTest004
     * @tc.number SUB_SYMBOL_ASYNCITERATOR_STANDALONE_TEST_004
     * @tc.desc   Verify async iterator return() method stops iteration early
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AsyncIteratorReturnMethodTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolAsyncIteratorStandaloneTestUtils.test004_AsyncIteratorReturnMethod();
      expect(result).assertEqual("Test Passed: AsyncIteratorReturnMethodTest004");
    });

    /**
     * @tc.name   AsyncIteratorThrowErrorTest005
     * @tc.number SUB_SYMBOL_ASYNCITERATOR_STANDALONE_TEST_005
     * @tc.desc   Verify async iterator error (rejected Promise) propagates
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AsyncIteratorThrowErrorTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolAsyncIteratorStandaloneTestUtils.test005_AsyncIteratorThrowError();
      expect(result).assertEqual("Test Passed: AsyncIteratorThrowErrorTest005");
    });

    /**
     * @tc.name   ClassAsyncIterableTest006
     * @tc.number SUB_SYMBOL_ASYNCITERATOR_STANDALONE_TEST_006
     * @tc.desc   Verify class implementing Symbol.asyncIterator creates async iterable instances
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ClassAsyncIterableTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolAsyncIteratorStandaloneTestUtils.test006_ClassAsyncIterable();
      expect(result).assertEqual("Test Passed: ClassAsyncIterableTest006");
    });

    /**
     * @tc.name   AsyncIteratorNextWithArgumentTest007
     * @tc.number SUB_SYMBOL_ASYNCITERATOR_STANDALONE_TEST_007
     * @tc.desc   Verify async iterator next() accepts and uses optional argument
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AsyncIteratorNextWithArgumentTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolAsyncIteratorStandaloneTestUtils.test007_AsyncIteratorNextWithArgument();
      expect(result).assertEqual("Test Passed: AsyncIteratorNextWithArgumentTest007");
    });



  })
}