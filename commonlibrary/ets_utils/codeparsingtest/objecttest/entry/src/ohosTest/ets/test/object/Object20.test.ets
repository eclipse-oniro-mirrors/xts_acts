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
import {   test1_getterClearsArrayDuringMap,
  test2_getterExtendsArrayDuringFilter,
  test3_getterDeletesDuringReduce,
  test4_setterModifiesArrayDuringAssignment,
  test5_multipleGettersInToSpliced,
  test6_getterInToSorted,
  test7_getterInWithMethod,
  test8_getterInFind,
  test9_getterInFindIndex,
  test10_getterInSomeEvery,
  test11_prototypeGetter,
  test12_arraySubclassGetter,
  test13_proxyArrayGetter,
  test14_arrayPrototypeModification,
  test17_iteratorGetter,
  test18_asyncModification,
  test19_concurrentGetters,
  test21_negativeIndexGetter,
  test23_largeIndexGetter,
  test24_symbolPropertyGetter,
  test25_nonNumericPropertyGetter,
  test26_flatMapGetter,
  test27_reduceRightGetter,
  test28_copyWithinGetter,
  test29_sortComparatorGetter,
  test30_typedArrayGetter } from './Object20';

function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}

export default function Object20Test() {
  describe('Object20Test', () => {
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
     * @tc.name   Object20Test001
     * @tc.number SUB_BUILTINS_Object20_TEST_0001
     * @tc.desc   Test array getter that clears array during map() iteration
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object20Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test1_getterClearsArrayDuringMap();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object20Test002
     * @tc.number SUB_BUILTINS_Object20_TEST_0002
     * @tc.desc   Test array getter that extends array during filter() iteration
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object20Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test2_getterExtendsArrayDuringFilter();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object20Test003
     * @tc.number SUB_BUILTINS_Object20_TEST_0003
     * @tc.desc   Test array getter that deletes elements during reduce() iteration
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object20Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test3_getterDeletesDuringReduce();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object20Test004
     * @tc.number SUB_BUILTINS_Object20_TEST_0004
     * @tc.desc   Test array setter that modifies array during assignment
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object20Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test4_setterModifiesArrayDuringAssignment();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object20Test005
     * @tc.number SUB_BUILTINS_Object20_TEST_0005
     * @tc.desc   Test multiple getters interact during toSpliced() operation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object20Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test5_multipleGettersInToSpliced();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object20Test006
     * @tc.number SUB_BUILTINS_Object20_TEST_0006
     * @tc.desc   Test array getter that modifies array during toSorted() operation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object20Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test6_getterInToSorted();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object20Test007
     * @tc.number SUB_BUILTINS_Object20_TEST_0007
     * @tc.desc   Test array getter that modifies array during with() method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object20Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test7_getterInWithMethod();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object20Test008
     * @tc.number SUB_BUILTINS_Object20_TEST_0008
     * @tc.desc   Test array getter that clears array during find() iteration
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object20Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test8_getterInFind();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object20Test009
     * @tc.number SUB_BUILTINS_Object20_TEST_0009
     * @tc.desc   Test array getter that deletes elements during findIndex() iteration
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object20Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test9_getterInFindIndex();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object20Test010
     * @tc.number SUB_BUILTINS_Object20_TEST_0010
     * @tc.desc   Test array getter that modifies array during some() and every() methods
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object20Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test10_getterInSomeEvery();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object20Test011
     * @tc.number SUB_BUILTINS_Object20_TEST_0011
     * @tc.desc   Test getter on prototype chain that modifies derived array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object20Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test11_prototypeGetter();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object20Test012
     * @tc.number SUB_BUILTINS_Object20_TEST_0012
     * @tc.desc   Test getter in array subclass that modifies array during iteration
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object20Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test12_arraySubclassGetter();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object20Test013
     * @tc.number SUB_BUILTINS_Object20_TEST_0013
     * @tc.desc   Test Proxy-wrapped array getter that clears array during iteration
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object20Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test13_proxyArrayGetter();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object20Test014
     * @tc.number SUB_BUILTINS_Object20_TEST_0014
     * @tc.desc   Test array getter that triggers modified Array.prototype.push
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object20Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test14_arrayPrototypeModification();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object20Test017
     * @tc.number SUB_BUILTINS_Object20_TEST_0017
     * @tc.desc   Test getter on Symbol.iterator that modifies array during for-of iteration
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object20Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test17_iteratorGetter();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object20Test018
     * @tc.number SUB_BUILTINS_Object20_TEST_0018
     * @tc.desc   Test async getter that modifies array during synchronous iteration
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object20Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test18_asyncModification();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object20Test019
     * @tc.number SUB_BUILTINS_Object20_TEST_0019
     * @tc.desc   Test concurrent getters that modify each other during array operation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object20Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test19_concurrentGetters();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object20Test021
     * @tc.number SUB_BUILTINS_Object20_TEST_0021
     * @tc.desc   Test negative index getter using Proxy that modifies array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object20Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test21_negativeIndexGetter();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object20Test023
     * @tc.number SUB_BUILTINS_Object20_TEST_0023
     * @tc.desc   Test getter on large array index that creates many elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object20Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test23_largeIndexGetter();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object20Test024
     * @tc.number SUB_BUILTINS_Object20_TEST_0024
     * @tc.desc   Test Symbol property getter that modifies numeric indices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object20Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test24_symbolPropertyGetter();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object20Test025
     * @tc.number SUB_BUILTINS_Object20_TEST_0025
     * @tc.desc   Test non-numeric property getter that modifies array during Object.keys()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object20Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test25_nonNumericPropertyGetter();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object20Test026
     * @tc.number SUB_BUILTINS_Object20_TEST_0026
     * @tc.desc   Test getter that modifies array structure during flatMap() operation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object20Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test26_flatMapGetter();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object20Test027
     * @tc.number SUB_BUILTINS_Object20_TEST_0027
     * @tc.desc   Test getters that modify array during reverse iteration with reduceRight()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object20Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test27_reduceRightGetter();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object20Test028
     * @tc.number SUB_BUILTINS_Object20_TEST_0028
     * @tc.desc   Test getter that triggers copyWithin() during array copy operation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object20Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test28_copyWithinGetter();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object20Test029
     * @tc.number SUB_BUILTINS_Object20_TEST_0029
     * @tc.desc   Test getter accessed in sort comparator function that modifies array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object20Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test29_sortComparatorGetter();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object20Test030
     * @tc.number SUB_BUILTINS_Object20_TEST_0030
     * @tc.desc   Test getter behavior on typed array-like object during iteration
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object20Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test30_typedArrayGetter();
      expect(result).assertEqual(true);
    });

  })
}