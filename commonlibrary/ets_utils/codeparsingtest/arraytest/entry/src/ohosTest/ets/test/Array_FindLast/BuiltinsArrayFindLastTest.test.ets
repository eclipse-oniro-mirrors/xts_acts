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

export default function BuiltinsArrayFindLastTest(): void {
  describe("BuiltinsArrayFindLastTest", () => {
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
     * @tc.name   BuiltinsArrayFindLastTest0100
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_TEST_0100
     * @tc.desc   Verify findLast finds the last element greater than 10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayFindLastTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result: boolean = Missing.ArrayFindLastBasicTest0100();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastTest0200
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_TEST_0200
     * @tc.desc   Verify findLast finds the last occurrence of duplicate value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayFindLastTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result: boolean = Missing.ArrayFindLastBasicTest0200();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastTest0300
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_TEST_0300
     * @tc.desc   Verify findLast finds unique element matching condition
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayFindLastTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result: boolean = Missing.ArrayFindLastBasicTest0300();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastTest0400
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_TEST_0400
     * @tc.desc   Verify findLast finds first element in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayFindLastTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result: boolean = Missing.ArrayFindLastBasicTest0400();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastTest0500
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_TEST_0500
     * @tc.desc   Verify findLast finds last element in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayFindLastTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result: boolean = Missing.ArrayFindLastBasicTest0500();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastTest0600
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_TEST_0600
     * @tc.desc   Verify findLast returns undefined when no match found
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayFindLastTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result: boolean = Missing.ArrayFindLastBasicTest0600();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastTest0700
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_TEST_0700
     * @tc.desc   Verify findLast returns undefined for empty array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayFindLastTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result: boolean = Missing.ArrayFindLastBasicTest0700();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastTest0800
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_TEST_0800
     * @tc.desc   Verify findLast with arrow function as callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayFindLastTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result: boolean = Missing.ArrayFindLastBasicTest0800();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastTest0900
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_TEST_0900
     * @tc.desc   Verify findLast with arrow function using object destructuring
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayFindLastTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result: boolean = Missing.ArrayFindLastBasicTest0900();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastTest1000
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_TEST_1000
     * @tc.desc   Verify findLast with named function as callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayFindLastTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result: boolean = Missing.ArrayFindLastBasicTest1000();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastTest1100
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_TEST_1100
     * @tc.desc   Verify findLast with anonymous function as callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayFindLastTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result: boolean = Missing.ArrayFindLastBasicTest1100();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastTest1200
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_TEST_1200
     * @tc.desc   Verify callback element parameter receives correct values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayFindLastTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result: boolean = Missing.ArrayFindLastCallbackTest1200();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastTest1300
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_TEST_1300
     * @tc.desc   Verify callback element parameter with various types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayFindLastTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result: boolean = Missing.ArrayFindLastCallbackTest1300();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastTest1400
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_TEST_1400
     * @tc.desc   Verify callback index parameter receives correct values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayFindLastTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result: boolean = Missing.ArrayFindLastCallbackTest1400();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastTest1500
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_TEST_1500
     * @tc.desc   Verify callback index decreases from high to low
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayFindLastTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result: boolean = Missing.ArrayFindLastCallbackTest1500();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastTest1600
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_TEST_1600
     * @tc.desc   Verify callback array parameter references original array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayFindLastTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result: boolean = Missing.ArrayFindLastCallbackTest1600();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastTest1700
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_TEST_1700
     * @tc.desc   Verify using array parameter to access other elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayFindLastTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result: boolean = Missing.ArrayFindLastCallbackTest1700();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastTest1800
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_TEST_1800
     * @tc.desc   Verify using all three callback parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayFindLastTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result: boolean = Missing.ArrayFindLastCallbackTest1800();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastTest1900
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_TEST_1900
     * @tc.desc   Verify partial parameters omitted
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayFindLastTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result: boolean = Missing.ArrayFindLastCallbackTest1900();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastTest2000
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_TEST_2000
     * @tc.desc   Verify thisArg with object context
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayFindLastTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result: boolean = Missing.ArrayFindLastThisArgTest2000();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastTest2100
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_TEST_2100
     * @tc.desc   Verify thisArg with complex object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayFindLastTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result: boolean = Missing.ArrayFindLastThisArgTest2100();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastTest2200
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_TEST_2200
     * @tc.desc   Verify thisArg with null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayFindLastTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result: boolean = Missing.ArrayFindLastThisArgTest2200();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastTest2300
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_TEST_2300
     * @tc.desc   Verify thisArg with undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayFindLastTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result: boolean = Missing.ArrayFindLastThisArgTest2300();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastTest2400
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_TEST_2400
     * @tc.desc   Verify thisArg omitted
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayFindLastTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result: boolean = Missing.ArrayFindLastThisArgTest2400();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastTest2500
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_TEST_2500
     * @tc.desc   Verify thisArg with primitive number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayFindLastTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result: boolean = Missing.ArrayFindLastThisArgTest2500();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastTest2600
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_TEST_2600
     * @tc.desc   Verify thisArg with primitive string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayFindLastTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result: boolean = Missing.ArrayFindLastThisArgTest2600();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastTest2700
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_TEST_2700
     * @tc.desc   Verify returning element itself
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayFindLastTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result: boolean = Missing.ArrayFindLastReturnTest2700();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastTest2800
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_TEST_2800
     * @tc.desc   Verify returning object element reference
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayFindLastTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result: boolean = Missing.ArrayFindLastReturnTest2800();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastTest2900
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_TEST_2900
     * @tc.desc   Verify returning array element reference
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayFindLastTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result: boolean = Missing.ArrayFindLastReturnTest2900();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastTest3000
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_TEST_3000
     * @tc.desc   Verify returning undefined when no match
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayFindLastTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result: boolean = Missing.ArrayFindLastReturnTest3000();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastTest3100
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_TEST_3100
     * @tc.desc   Verify empty array returns undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayFindLastTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result: boolean = Missing.ArrayFindLastReturnTest3100();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastTest3200
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_TEST_3200
     * @tc.desc   Verify callback always returns false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayFindLastTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result: boolean = Missing.ArrayFindLastReturnTest3200();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastTest3300
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_TEST_3300
     * @tc.desc   Verify callback returns true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayFindLastTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result: boolean = Missing.ArrayFindLastReturnTest3300();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastTest3400
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_TEST_3400
     * @tc.desc   Verify callback returns non-boolean truthy values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayFindLastTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result: boolean = Missing.ArrayFindLastReturnTest3400();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastTest3500
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_TEST_3500
     * @tc.desc   Verify callback returns number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayFindLastTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result: boolean = Missing.ArrayFindLastReturnTest3500();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastTest3600
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_TEST_3600
     * @tc.desc   Verify return value type checking
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayFindLastTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result: boolean = Missing.ArrayFindLastReturnTest3600();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastTest3700
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_TEST_3700
     * @tc.desc   Verify sparse array with holes treated as undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayFindLastTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result: boolean = Missing.ArrayFindLastSparseTest3700();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastTest3800
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_TEST_3800
     * @tc.desc   Verify finding undefined in sparse array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayFindLastTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result: boolean = Missing.ArrayFindLastSparseTest3800();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastTest3900
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_TEST_3900
     * @tc.desc   Verify sparse array with large gaps
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayFindLastTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result: boolean = Missing.ArrayFindLastSparseTest3900();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastTest4000
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_TEST_4000
     * @tc.desc   Verify sparse array created with delete
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayFindLastTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result: boolean = Missing.ArrayFindLastSparseTest4000();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastTest4100
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_TEST_4100
     * @tc.desc   Verify sparse array with all holes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayFindLastTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result: boolean = Missing.ArrayFindLastSparseTest4100();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastTest4200
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_TEST_4200
     * @tc.desc   Verify single element array matching condition
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayFindLastTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result: boolean = Missing.ArrayFindLastEdgeTest4200();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastTest4300
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_TEST_4300
     * @tc.desc   Verify single element array not matching condition
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayFindLastTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result: boolean = Missing.ArrayFindLastEdgeTest4300();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastTest4400
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_TEST_4400
     * @tc.desc   Verify large array last element
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayFindLastTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result: boolean = Missing.ArrayFindLastEdgeTest4400();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastTest4500
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_TEST_4500
     * @tc.desc   Verify large array first element
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayFindLastTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result: boolean = Missing.ArrayFindLastEdgeTest4500();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastTest4600
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_TEST_4600
     * @tc.desc   Verify array with Number.MAX_VALUE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayFindLastTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result: boolean = Missing.ArrayFindLastEdgeTest4600();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastTest4700
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_TEST_4700
     * @tc.desc   Verify array with Infinity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayFindLastTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result: boolean = Missing.ArrayFindLastEdgeTest4700();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastTest4800
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_TEST_4800
     * @tc.desc   Verify array with -Infinity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayFindLastTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result: boolean = Missing.ArrayFindLastEdgeTest4800();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastTest4900
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_TEST_4900
     * @tc.desc   Verify callback returns true immediately
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayFindLastTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result: boolean = Missing.ArrayFindLastEdgeTest4900();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastTest5000
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_TEST_5000
     * @tc.desc   Verify callback always returns false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayFindLastTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result: boolean = Missing.ArrayFindLastEdgeTest5000();
      expect(result).assertEqual(true);
    });
  });
}
