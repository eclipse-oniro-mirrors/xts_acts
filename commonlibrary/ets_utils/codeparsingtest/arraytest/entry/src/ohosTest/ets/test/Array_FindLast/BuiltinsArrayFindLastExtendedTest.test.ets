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
import * as Missing from './ArrayFindLastMissingTest';

export default function BuiltinsArrayFindLastExtendedTest(): void {
  describe("BuiltinsArrayFindLastExtendedTest", () => {
    beforeAll(() => {
    })
    beforeEach(async () => {
    })
    afterEach(async () => {
      await Utils.msSleep(10)
    })
    afterAll(() => {
    })

    /**
     * @tc.name   BuiltinsArrayFindLastExtendedTest0100
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_EXTENDED_TEST_0100
     * @tc.desc   Verify callback throws error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastExtendedTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Missing.ArrayFindLastErrorTest5100();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastExtendedTest0200
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_EXTENDED_TEST_0200
     * @tc.desc   Verify callbackFn is not a function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastExtendedTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Missing.ArrayFindLastErrorTest5200();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastExtendedTest0300
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_EXTENDED_TEST_0300
     * @tc.desc   Verify callbackFn is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastExtendedTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Missing.ArrayFindLastErrorTest5300();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastExtendedTest0400
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_EXTENDED_TEST_0400
     * @tc.desc   Verify callbackFn is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastExtendedTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Missing.ArrayFindLastErrorTest5400();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastExtendedTest0500
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_EXTENDED_TEST_0500
     * @tc.desc   Verify calling on null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastExtendedTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Missing.ArrayFindLastErrorTest5500();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastExtendedTest0600
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_EXTENDED_TEST_0600
     * @tc.desc   Verify calling on undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastExtendedTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Missing.ArrayFindLastErrorTest5600();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastExtendedTest0700
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_EXTENDED_TEST_0700
     * @tc.desc   Verify modifying already visited elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastExtendedTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Missing.ArrayFindLastModifyTest5700();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastExtendedTest0800
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_EXTENDED_TEST_0800
     * @tc.desc   Verify modifying current element
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastExtendedTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Missing.ArrayFindLastModifyTest5800();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastExtendedTest0900
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_EXTENDED_TEST_0900
     * @tc.desc   Verify modifying unvisited elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastExtendedTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Missing.ArrayFindLastModifyTest5900();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastExtendedTest1000
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_EXTENDED_TEST_1000
     * @tc.desc   Verify adding elements during iteration
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastExtendedTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Missing.ArrayFindLastModifyTest6000();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastExtendedTest1100
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_EXTENDED_TEST_1100
     * @tc.desc   Verify reducing array length during iteration
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastExtendedTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Missing.ArrayFindLastModifyTest6100();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastExtendedTest1200
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_EXTENDED_TEST_1200
     * @tc.desc   Verify basic array-like object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastExtendedTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Missing.ArrayFindLastLikeTest6200();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastExtendedTest1300
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_EXTENDED_TEST_1300
     * @tc.desc   Verify string as array-like
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastExtendedTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Missing.ArrayFindLastLikeTest6300();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastExtendedTest1400
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_EXTENDED_TEST_1400
     * @tc.desc   Verify arguments object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastExtendedTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Missing.ArrayFindLastLikeTest6400();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastExtendedTest1500
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_EXTENDED_TEST_1500
     * @tc.desc   Verify TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastExtendedTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Missing.ArrayFindLastLikeTest6500();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastExtendedTest1600
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_EXTENDED_TEST_1600
     * @tc.desc   Verify array-like with length greater than actual elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastExtendedTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Missing.ArrayFindLastLikeTest6600();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastExtendedTest1700
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_EXTENDED_TEST_1700
     * @tc.desc   Verify findLast vs find difference
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastExtendedTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Missing.ArrayFindLastInteractionTest6700();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastExtendedTest1800
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_EXTENDED_TEST_1800
     * @tc.desc   Verify findLast with findLastIndex
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastExtendedTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Missing.ArrayFindLastInteractionTest6800();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastExtendedTest1900
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_EXTENDED_TEST_1900
     * @tc.desc   Verify findLast vs filter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastExtendedTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Missing.ArrayFindLastInteractionTest6900();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastExtendedTest2000
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_EXTENDED_TEST_2000
     * @tc.desc   Verify findLast vs some
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastExtendedTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Missing.ArrayFindLastInteractionTest7000();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastExtendedTest2100
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_EXTENDED_TEST_2100
     * @tc.desc   Verify findLast with map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastExtendedTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Missing.ArrayFindLastInteractionTest7100();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastExtendedTest2200
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_EXTENDED_TEST_2200
     * @tc.desc   Verify findLast with reverse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastExtendedTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Missing.ArrayFindLastInteractionTest7200();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastExtendedTest2300
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_EXTENDED_TEST_2300
     * @tc.desc   Verify chained method calls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastExtendedTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Missing.ArrayFindLastInteractionTest7300();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastExtendedTest2400
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_EXTENDED_TEST_2400
     * @tc.desc   Verify findLast vs lastIndexOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastExtendedTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Missing.ArrayFindLastInteractionTest7400();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastExtendedTest2500
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_EXTENDED_TEST_2500
     * @tc.desc   Verify finding NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastExtendedTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Missing.ArrayFindLastSpecialTest7500();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastExtendedTest2600
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_EXTENDED_TEST_2600
     * @tc.desc   Verify NaN not equal to itself
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastExtendedTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Missing.ArrayFindLastSpecialTest7600();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastExtendedTest2700
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_EXTENDED_TEST_2700
     * @tc.desc   Verify finding null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastExtendedTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Missing.ArrayFindLastSpecialTest7700();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastExtendedTest2800
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_EXTENDED_TEST_2800
     * @tc.desc   Verify finding undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastExtendedTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Missing.ArrayFindLastSpecialTest7800();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastExtendedTest2900
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_EXTENDED_TEST_2900
     * @tc.desc   Verify distinguishing null and undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastExtendedTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Missing.ArrayFindLastSpecialTest7900();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastExtendedTest3000
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_EXTENDED_TEST_3000
     * @tc.desc   Verify finding boolean true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastExtendedTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Missing.ArrayFindLastSpecialTest8000();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastExtendedTest3100
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_EXTENDED_TEST_3100
     * @tc.desc   Verify finding falsy values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastExtendedTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Missing.ArrayFindLastSpecialTest8100();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastExtendedTest3200
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_EXTENDED_TEST_3200
     * @tc.desc   Verify finding Symbol
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastExtendedTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Missing.ArrayFindLastSpecialTest8200();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastExtendedTest3300
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_EXTENDED_TEST_3300
     * @tc.desc   Verify finding BigInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastExtendedTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Missing.ArrayFindLastSpecialTest8300();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastExtendedTest3400
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_EXTENDED_TEST_3400
     * @tc.desc   Verify finding object by reference
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastExtendedTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Missing.ArrayFindLastSpecialTest8400();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastExtendedTest3500
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_EXTENDED_TEST_3500
     * @tc.desc   Verify finding object by id property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastExtendedTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Missing.ArrayFindLastSpecialTest8500();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastExtendedTest3600
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_EXTENDED_TEST_3600
     * @tc.desc   Verify array containing functions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastExtendedTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Missing.ArrayFindLastSpecialTest8600();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastExtendedTest3700
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_EXTENDED_TEST_3700
     * @tc.desc   Verify array containing RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastExtendedTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Missing.ArrayFindLastSpecialTest8700();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastExtendedTest3800
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_EXTENDED_TEST_3800
     * @tc.desc   Verify array containing Date objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastExtendedTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Missing.ArrayFindLastSpecialTest8800();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastExtendedTest3900
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_EXTENDED_TEST_3900
     * @tc.desc   Verify nested arrays
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastExtendedTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Missing.ArrayFindLastSpecialTest8900();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastExtendedTest4000
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_EXTENDED_TEST_4000
     * @tc.desc   Verify cyclic reference
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastExtendedTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Missing.ArrayFindLastSpecialTest9000();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastExtendedTest4100
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_EXTENDED_TEST_4100
     * @tc.desc   Verify array containing WeakMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastExtendedTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Missing.ArrayFindLastSpecialTest9100();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastExtendedTest4200
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_EXTENDED_TEST_4200
     * @tc.desc   Verify array-like with negative length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastExtendedTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Missing.ArrayFindLastLikeTest9200();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastExtendedTest4300
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_EXTENDED_TEST_4300
     * @tc.desc   Verify array-like with non-integer length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastExtendedTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Missing.ArrayFindLastLikeTest9300();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastExtendedTest4400
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_EXTENDED_TEST_4400
     * @tc.desc   Verify callback returns Error object (truthy)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastExtendedTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Missing.ArrayFindLastErrorTest9400();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastExtendedTest4500
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_EXTENDED_TEST_4500
     * @tc.desc   Verify calling on primitive number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastExtendedTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Missing.ArrayFindLastErrorTest9500();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastExtendedTest4600
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_EXTENDED_TEST_4600
     * @tc.desc   Verify sparse array with only first and last elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastExtendedTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Missing.ArrayFindLastSparseTest9600();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastExtendedTest4700
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_EXTENDED_TEST_4700
     * @tc.desc   Verify delete operation during iteration
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastExtendedTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Missing.ArrayFindLastModifyTest9700();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastExtendedTest4800
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_EXTENDED_TEST_4800
     * @tc.desc   Verify using splice during iteration
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastExtendedTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Missing.ArrayFindLastModifyTest9800();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastExtendedTest4900
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_EXTENDED_TEST_4900
     * @tc.desc   Verify clearing array during iteration
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastExtendedTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Missing.ArrayFindLastModifyTest9900();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastExtendedTest5000
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_EXTENDED_TEST_5000
     * @tc.desc   Verify arrow function ignores thisArg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastExtendedTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Missing.ArrayFindLastThisArgTest10000();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastExtendedTest5100
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_EXTENDED_TEST_5100
     * @tc.desc   Verify skip undefined to find other values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastExtendedTest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Missing.ArrayFindLastSparseTest10100();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastExtendedTest5200
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_EXTENDED_TEST_5200
     * @tc.desc   Verify Number.MIN_VALUE handling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastExtendedTest5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Missing.ArrayFindLastEdgeTest10200();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastExtendedTest5300
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_EXTENDED_TEST_5300
     * @tc.desc   Verify callback is not callable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastExtendedTest5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Missing.ArrayFindLastErrorTest10300();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastExtendedTest5400
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_EXTENDED_TEST_5400
     * @tc.desc   Verify unshift adds elements during iteration
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastExtendedTest5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Missing.ArrayFindLastModifyTest10400();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastExtendedTest5500
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_EXTENDED_TEST_5500
     * @tc.desc   Verify increasing array length during iteration
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastExtendedTest5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Missing.ArrayFindLastModifyTest10500();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastExtendedTest5600
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_EXTENDED_TEST_5600
     * @tc.desc   Verify string find uppercase letters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastExtendedTest5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Missing.ArrayFindLastLikeTest10600();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastExtendedTest5700
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_EXTENDED_TEST_5700
     * @tc.desc   Verify empty arguments object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastExtendedTest5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Missing.ArrayFindLastLikeTest10700();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastExtendedTest5800
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_EXTENDED_TEST_5800
     * @tc.desc   Verify custom array-like object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastExtendedTest5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Missing.ArrayFindLastLikeTest10800();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastExtendedTest5900
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_EXTENDED_TEST_5900
     * @tc.desc   Verify array-like with length 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastExtendedTest5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Missing.ArrayFindLastLikeTest10900();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastExtendedTest6000
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_EXTENDED_TEST_6000
     * @tc.desc   Verify callback using mapping logic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastExtendedTest6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Missing.ArrayFindLastInteractionTest11000();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastExtendedTest6100
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_EXTENDED_TEST_6100
     * @tc.desc   Verify findLast vs reverse+find
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastExtendedTest6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Missing.ArrayFindLastInteractionTest11100();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastExtendedTest6200
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_EXTENDED_TEST_6200
     * @tc.desc   Verify Symbol.for handling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastExtendedTest6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Missing.ArrayFindLastSpecialTest11200();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastExtendedTest6300
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_EXTENDED_TEST_6300
     * @tc.desc   Verify BigInt mixed with Number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastExtendedTest6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Missing.ArrayFindLastSpecialTest11300();
      expect(result).assertEqual(true);
    });
  });
}
