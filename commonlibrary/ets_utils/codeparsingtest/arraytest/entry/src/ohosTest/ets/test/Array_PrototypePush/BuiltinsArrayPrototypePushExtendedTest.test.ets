/*
 * Copyright (c) 2026 RKH Corp.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import Utils from '../Util.test';
import * as PushMissing from './ArrayPrototypePushMissingTest';

export default function BuiltinsArrayPrototypePushExtendedTest(): void {
  describe("BuiltinsArrayPrototypePushExtendedTest", () => {
    beforeAll(() => {
      // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    })
    beforeEach(async () => {
      await Utils.msSleep(20);
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(async() => {
      await Utils.msSleep(10)
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.name   BuiltinsArrayPrototypePushExtendedTest0100
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_PUSH_EXTENDED_TEST_0100
     * @tc.desc   Verify push() with Symbol type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypePushExtendedTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = PushMissing.PushSymbolTypeTest0100();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePushExtendedTest0200
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_PUSH_EXTENDED_TEST_0200
     * @tc.desc   Verify push() with BigInt type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypePushExtendedTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = PushMissing.PushBigIntTypeTest0200();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePushExtendedTest0300
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_PUSH_EXTENDED_TEST_0300
     * @tc.desc   Verify push() on array-like object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypePushExtendedTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = PushMissing.PushArrayLikeTest0300();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePushExtendedTest0400
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_PUSH_EXTENDED_TEST_0400
     * @tc.desc   Verify push() on regular object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypePushExtendedTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = PushMissing.PushRegularObjectTest0400();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePushExtendedTest0500
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_PUSH_EXTENDED_TEST_0500
     * @tc.desc   Verify push() on string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypePushExtendedTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = PushMissing.PushStringReadOnlyTest0500();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePushExtendedTest0600
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_PUSH_EXTENDED_TEST_0600
     * @tc.desc   Verify push() on arguments object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypePushExtendedTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = PushMissing.PushArgumentsTest0600();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePushExtendedTest0700
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_PUSH_EXTENDED_TEST_0700
     * @tc.desc   Verify push() on TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypePushExtendedTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = PushMissing.PushTypedArrayTest0700();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePushExtendedTest0800
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_PUSH_EXTENDED_TEST_0800
     * @tc.desc   Verify push() with custom object with length property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypePushExtendedTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = PushMissing.PushCustomObjectTest0800();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePushExtendedTest0900
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_PUSH_EXTENDED_TEST_0900
     * @tc.desc   Verify push() with negative length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypePushExtendedTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = PushMissing.PushNegativeLengthTest0900();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePushExtendedTest1000
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_PUSH_EXTENDED_TEST_1000
     * @tc.desc   Verify push() with non-number length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypePushExtendedTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = PushMissing.PushNonNumberLengthTest1000();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePushExtendedTest1100
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_PUSH_EXTENDED_TEST_1100
     * @tc.desc   Verify push() on frozen array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypePushExtendedTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = PushMissing.PushFrozenArrayTest1100();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePushExtendedTest1200
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_PUSH_EXTENDED_TEST_1200
     * @tc.desc   Verify push() on sealed array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypePushExtendedTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = PushMissing.PushSealedArrayTest1200();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePushExtendedTest1300
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_PUSH_EXTENDED_TEST_1300
     * @tc.desc   Verify push() with read-only length property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypePushExtendedTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = PushMissing.PushReadOnlyLengthTest1300();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePushExtendedTest1400
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_PUSH_EXTENDED_TEST_1400
     * @tc.desc   Verify push() with read-only index property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypePushExtendedTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = PushMissing.PushReadOnlyIndexTest1400();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePushExtendedTest1500
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_PUSH_EXTENDED_TEST_1500
     * @tc.desc   Verify push() with Proxy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypePushExtendedTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = PushMissing.PushProxyTest1500();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePushExtendedTest1600
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_PUSH_EXTENDED_TEST_1600
     * @tc.desc   Verify push() with Proxy that blocks operation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypePushExtendedTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = PushMissing.PushProxyBlockTest1600();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePushExtendedTest1700
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_PUSH_EXTENDED_TEST_1700
     * @tc.desc   Verify push() with modified Array.prototype.push
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypePushExtendedTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = PushMissing.PushModifiedPrototypeTest1700();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePushExtendedTest1800
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_PUSH_EXTENDED_TEST_1800
     * @tc.desc   Verify push() on array subclass
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypePushExtendedTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = PushMissing.PushArraySubclassTest1800();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePushExtendedTest1900
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_PUSH_EXTENDED_TEST_1900
     * @tc.desc   Verify push() with large number of elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypePushExtendedTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = PushMissing.PushLargeElementsTest1900();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePushExtendedTest2000
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_PUSH_EXTENDED_TEST_2000
     * @tc.desc   Verify push() with spread of many elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypePushExtendedTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = PushMissing.PushSpreadManyTest2000();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePushExtendedTest2100
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_PUSH_EXTENDED_TEST_2100
     * @tc.desc   Verify push() on sparse array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypePushExtendedTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = PushMissing.PushSparseArrayTest2100();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePushExtendedTest2200
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_PUSH_EXTENDED_TEST_2200
     * @tc.desc   Verify push() on dense array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypePushExtendedTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = PushMissing.PushDenseArrayTest2200();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePushExtendedTest2300
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_PUSH_EXTENDED_TEST_2300
     * @tc.desc   Verify push() vs concat performance scenario
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypePushExtendedTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = PushMissing.PushVsConcatTest2300();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePushExtendedTest2400
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_PUSH_EXTENDED_TEST_2400
     * @tc.desc   Verify push() vs direct assignment
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypePushExtendedTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = PushMissing.PushVsDirectAssignmentTest2400();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePushExtendedTest2500
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_PUSH_EXTENDED_TEST_2500
     * @tc.desc   Verify push() with pre-allocated array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypePushExtendedTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = PushMissing.PushPreallocatedTest2500();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePushExtendedTest2600
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_PUSH_EXTENDED_TEST_2600
     * @tc.desc   Verify push() with dynamic expansion
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypePushExtendedTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = PushMissing.PushDynamicExpansionTest2600();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePushExtendedTest2700
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_PUSH_EXTENDED_TEST_2700
     * @tc.desc   Verify push() in data collection scenario
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypePushExtendedTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = PushMissing.PushDataCollectionTest2700();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePushExtendedTest2800
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_PUSH_EXTENDED_TEST_2800
     * @tc.desc   Verify push() in event logging scenario
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypePushExtendedTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = PushMissing.PushEventLoggingTest2800();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePushExtendedTest2900
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_PUSH_EXTENDED_TEST_2900
     * @tc.desc   Verify push() in queue implementation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypePushExtendedTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = PushMissing.PushQueueTest2900();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePushExtendedTest3000
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_PUSH_EXTENDED_TEST_3000
     * @tc.desc   Verify push() in priority queue implementation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypePushExtendedTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = PushMissing.PushPriorityQueueTest3000();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePushExtendedTest3100
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_PUSH_EXTENDED_TEST_3100
     * @tc.desc   Verify push() in stack implementation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypePushExtendedTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = PushMissing.PushStackTest3100();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePushExtendedTest3200
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_PUSH_EXTENDED_TEST_3200
     * @tc.desc   Verify push() in object array conversion
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypePushExtendedTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = PushMissing.PushObjectArrayTest3200();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePushExtendedTest3300
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_PUSH_EXTENDED_TEST_3300
     * @tc.desc   Verify push() in filtered collection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypePushExtendedTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = PushMissing.PushFilteredCollectionTest3300();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePushExtendedTest3400
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_PUSH_EXTENDED_TEST_3400
     * @tc.desc   Verify push() in tree structure construction
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypePushExtendedTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = PushMissing.PushTreeConstructionTest3400();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePushExtendedTest3500
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_PUSH_EXTENDED_TEST_3500
     * @tc.desc   Verify push() in matrix construction
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypePushExtendedTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = PushMissing.PushMatrixConstructionTest3500();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePushExtendedTest3600
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_PUSH_EXTENDED_TEST_3600
     * @tc.desc   Verify push() in batch processing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypePushExtendedTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = PushMissing.PushBatchProcessingTest3600();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePushExtendedTest3700
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_PUSH_EXTENDED_TEST_3700
     * @tc.desc   Verify push() in result accumulation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypePushExtendedTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = PushMissing.PushResultAccumulationTest3700();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePushExtendedTest3800
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_PUSH_EXTENDED_TEST_3800
     * @tc.desc   Verify push() with empty array multiple times
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypePushExtendedTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = PushMissing.PushEmptyArrayMultipleTest4000();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePushExtendedTest3900
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_PUSH_EXTENDED_TEST_3900
     * @tc.desc   Verify push() after manual length modification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypePushExtendedTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = PushMissing.PushAfterLengthModificationTest4100();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePushExtendedTest4000
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_PUSH_EXTENDED_TEST_4000
     * @tc.desc   Verify push() adds to max index + 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypePushExtendedTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = PushMissing.PushAddsToMaxIndexTest4200();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePushExtendedTest4100
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_PUSH_EXTENDED_TEST_4100
     * @tc.desc   Verify push() on sparse array with large index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypePushExtendedTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = PushMissing.PushSparseArrayLargeIndexTest4300();
      expect(result).assertEqual(true);
    });
  });
}