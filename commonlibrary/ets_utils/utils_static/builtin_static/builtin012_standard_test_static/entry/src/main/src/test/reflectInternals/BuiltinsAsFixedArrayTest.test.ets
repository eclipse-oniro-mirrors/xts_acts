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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium/index';
import Utils from '../Util.test';

class Point {
  x: number;
  y: number;
  constructor(x: number, y: number) {
    this.x = x;
    this.y = y;
  }
}

export default function BuiltinsAsFixedArrayTest(): void {
  describe('BuiltinsAsFixedArrayTest', () => {
     // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await Utils.msSleep(30);
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
     * @tc.name    BuiltinsAsFixedArrayTest0100
     * @tc.number  SUB_BUILTINS_AS_FIXED_ARRAY_TEST_0100
     * @tc.desc    Verify that asFixedArray returns correct length for FixedArray containing Number base values (0/-1/NaN/Infinity/-Infinity)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsAsFixedArrayTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let n0: number = 0;
      let n1: number = -1;
      let n2: number = NaN;
      let n3: number = Infinity;
      let n4: number = -Infinity;
      const arr: FixedArray<Object> = [n0, n1, n2, n3, n4];
      const result: FixedArray<Object> = reflect.internals.Types.asFixedArray<Object>(arr as Object);
      expect(result.length).assertEqual(5);
    });

    /**
     * @tc.name    BuiltinsAsFixedArrayTest0200
     * @tc.number  SUB_BUILTINS_AS_FIXED_ARRAY_TEST_0200
     * @tc.desc    Verify that asFixedArray returns correct element values for FixedArray containing Number extreme values (0/-1/MAX_SAFE_INTEGER)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsAsFixedArrayTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let n0: number = 0;
      let n1: number = -1;
      let n2: number = Number.MAX_SAFE_INTEGER;
      const arr: FixedArray<Object> = [n0, n1, n2];
      const result: FixedArray<Object> = reflect.internals.Types.asFixedArray<Object>(arr as Object);
      expect(result[0] as number).assertEqual(0);
      expect(result[1] as number).assertEqual(-1);
      expect(result[2] as number).assertEqual(Number.MAX_SAFE_INTEGER);
    });

    /**
     * @tc.name    BuiltinsAsFixedArrayTest0300
     * @tc.number  SUB_BUILTINS_AS_FIXED_ARRAY_TEST_0300
     * @tc.desc    Verify that asFixedArray returns correct length and elements for FixedArray containing empty string/ASCII/escape character Strings
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsAsFixedArrayTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: FixedArray<Object> = ["", "hello world", "line1\nline2\ttab"];
      const result: FixedArray<Object> = reflect.internals.Types.asFixedArray<Object>(arr as Object);
      expect(result.length).assertEqual(3);
      expect(result[0] as string).assertEqual("");
      expect(result[1] as string).assertEqual("hello world");
      expect(result[2] as string).assertEqual("line1\nline2\ttab");
    });

    /**
     * @tc.name    BuiltinsAsFixedArrayTest0400
     * @tc.number  SUB_BUILTINS_AS_FIXED_ARRAY_TEST_0400
     * @tc.desc    Verify that asFixedArray returns correct element values for Boolean FixedArray (true/false)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsAsFixedArrayTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let b1: boolean = true;
      let b2: boolean = false;
      let b3: boolean = true;
      const arr: FixedArray<Object> = [b1, b2, b3];
      const result: FixedArray<Object> = reflect.internals.Types.asFixedArray<Object>(arr as Object);
      expect(result.length).assertEqual(3);
      expect(result[0] as boolean).assertTrue();
      expect(result[1] as boolean).assertFalse();
      expect(result[2] as boolean).assertTrue();
    });

    /**
     * @tc.name    BuiltinsAsFixedArrayTest0500
     * @tc.number  SUB_BUILTINS_AS_FIXED_ARRAY_TEST_0500
     * @tc.desc    Verify that asFixedArray returns length 0 for empty FixedArray
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsAsFixedArrayTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: FixedArray<Object> = [];
      const result: FixedArray<Object> = reflect.internals.Types.asFixedArray<Object>(arr as Object);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.name    BuiltinsAsFixedArrayTest0600
     * @tc.number  SUB_BUILTINS_AS_FIXED_ARRAY_TEST_0600
     * @tc.desc    Verify that asFixedArray returns isNaN true for single-element NaN FixedArray
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsAsFixedArrayTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let n: number = NaN;
      const arr: FixedArray<Object> = [n];
      const result: FixedArray<Object> = reflect.internals.Types.asFixedArray<Object>(arr as Object);
      expect(result.length).assertEqual(1);
      expect(isNaN(result[0] as number)).assertTrue();
    });

    /**
     * @tc.name    BuiltinsAsFixedArrayTest0700
     * @tc.number  SUB_BUILTINS_AS_FIXED_ARRAY_TEST_0700
     * @tc.desc    Verify that asFixedArray allows correct property access for FixedArray containing objects with Number+String fields
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsAsFixedArrayTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const p1: Point = new Point(0, -1);
      const p2: Point = new Point(Number.MAX_SAFE_INTEGER, Infinity);
      const arr: FixedArray<Object> = [p1, p2];
      const result: FixedArray<Object> = reflect.internals.Types.asFixedArray<Object>(arr as Object);
      expect(result.length).assertEqual(2);
      expect((result[0] as Point).x).assertEqual(0);
      expect((result[0] as Point).y).assertEqual(-1);
      expect((result[1] as Point).x).assertEqual(Number.MAX_SAFE_INTEGER);
    });

    /**
     * @tc.name    BuiltinsAsFixedArrayTest0800
     * @tc.number  SUB_BUILTINS_AS_FIXED_ARRAY_TEST_0800
     * @tc.desc    Verify that asFixedArray returns same reference as input, only performs type conversion
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsAsFixedArrayTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let n0: number = 0;
      let n1: number = Infinity;
      let n2: number = -Infinity;
      const arr: FixedArray<Object> = [n0, n1, n2];
      const result: FixedArray<Object> = reflect.internals.Types.asFixedArray<Object>(arr as Object);
      expect(result === arr).assertTrue();
    });

    /**
     * @tc.name    BuiltinsAsFixedArrayTest0900
     * @tc.number  SUB_BUILTINS_AS_FIXED_ARRAY_TEST_0900
     * @tc.desc    Verify that multiple asFixedArray calls on FixedArray containing NaN/Infinity/-Infinity yield consistent results
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsAsFixedArrayTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let n0: number = NaN;
      let n1: number = Infinity;
      let n2: number = -Infinity;
      const arr: FixedArray<Object> = [n0, n1, n2];
      const r1: FixedArray<Object> = reflect.internals.Types.asFixedArray<Object>(arr as Object);
      const r2: FixedArray<Object> = reflect.internals.Types.asFixedArray<Object>(arr as Object);
      expect(r1.length).assertEqual(r2.length);
      expect(isNaN(r1[0] as number)).assertTrue();
      expect(isNaN(r2[0] as number)).assertTrue();
      expect(r1[1] as number).assertEqual(Infinity);
      expect(r2[1] as number).assertEqual(Infinity);
    });

    /**
     * @tc.name    BuiltinsAsFixedArrayTest1000
     * @tc.number  SUB_BUILTINS_AS_FIXED_ARRAY_TEST_1000
     * @tc.desc    Verify that asFixedArray returns correct first and last elements for Number FixedArray containing 0/-1/MAX_SAFE_INTEGER
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsAsFixedArrayTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let n0: number = 0;
      let n1: number = -1;
      let n2: number = 1;
      let n3: number = -100;
      let n4: number = 100;
      let n5: number = Infinity;
      let n6: number = -Infinity;
      let n7: number = Number.MAX_SAFE_INTEGER;
      let n8: number = Number.MIN_VALUE;
      let n9: number = NaN;
      const arr: FixedArray<Object> = [n0, n1, n2, n3, n4, n5, n6, n7, n8, n9];
      const result: FixedArray<Object> = reflect.internals.Types.asFixedArray<Object>(arr as Object);
      expect(result.length).assertEqual(10);
      expect(result[0] as number).assertEqual(0);
      expect(result[7] as number).assertEqual(Number.MAX_SAFE_INTEGER);
    });

    /**
     * @tc.name    BuiltinsAsFixedArrayTest1100
     * @tc.number  SUB_BUILTINS_AS_FIXED_ARRAY_TEST_1100
     * @tc.desc    Verify that asFixedArray result can be iterated in for loop to sum Number elements
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsAsFixedArrayTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let n0: number = 0;
      let n1: number = 1;
      let n2: number = 2;
      let n3: number = 3;
      let n4: number = 4;
      const arr: FixedArray<Object> = [n0, n1, n2, n3, n4];
      const result: FixedArray<Object> = reflect.internals.Types.asFixedArray<Object>(arr as Object);
      let sum: number = 0;
      for (let i = 0; i < result.length; i++) {
        sum += result[i] as number;
      }
      expect(sum).assertEqual(10);
    });

    /**
     * @tc.name    BuiltinsAsFixedArrayTest1200
     * @tc.number  SUB_BUILTINS_AS_FIXED_ARRAY_TEST_1200
     * @tc.desc    Verify that calling asFixedArray again on its result yields same reference as original input
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsAsFixedArrayTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      let n0: number = 0;
      let n1: number = Infinity;
      let n2: number = Number.MAX_SAFE_INTEGER;
      const arr: FixedArray<Object> = [n0, n1, n2];
      const r1: FixedArray<Object> = reflect.internals.Types.asFixedArray<Object>(arr as Object);
      const r2: FixedArray<Object> = reflect.internals.Types.asFixedArray<Object>(r1 as Object);
      expect(r1 === arr).assertTrue();
      expect(r2 === arr).assertTrue();
    });

    /**
     * @tc.name    BuiltinsAsFixedArrayTest1300
     * @tc.number  SUB_BUILTINS_AS_FIXED_ARRAY_TEST_1300
     * @tc.desc    Verify that asFixedArray correctly converts FixedArray containing empty string/escape character Strings
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsAsFixedArrayTest1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr: FixedArray<Object> = ["", "line1\nline2\ttab", "hello world"];
      const result: FixedArray<Object> = reflect.internals.Types.asFixedArray<Object>(arr as Object);
      expect(result.length).assertEqual(3);
      expect(result[0] as string).assertEqual("");
      expect(result[1] as string).assertEqual("line1\nline2\ttab");
      expect(result[2] as string).assertEqual("hello world");
    });

    /**
     * @tc.name    BuiltinsAsFixedArrayTest1400
     * @tc.number  SUB_BUILTINS_AS_FIXED_ARRAY_TEST_1400
     * @tc.desc    Verify that asFixedArray allows correct access to elements in mixed Number/String/Boolean FixedArray
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsAsFixedArrayTest1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      let num: number = 0;
      let flag: boolean = false;
      const arr: FixedArray<Object> = [num, "", flag];
      const result: FixedArray<Object> = reflect.internals.Types.asFixedArray<Object>(arr as Object);
      expect(result.length).assertEqual(3);
      expect(result[0] as number).assertEqual(0);
      expect(result[1] as string).assertEqual("");
      expect(result[2] as boolean).assertFalse();
    });

    /**
     * @tc.name    BuiltinsAsFixedArrayTest1500
     * @tc.number  SUB_BUILTINS_AS_FIXED_ARRAY_TEST_1500
     * @tc.desc    Comprehensive verification: Number/String/Boolean FixedArray groups have consistent references and correct elements
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsAsFixedArrayTest1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      let n0: number = 0;
      let n1: number = Number.MAX_SAFE_INTEGER;
      const numArr: FixedArray<Object> = [n0, n1];
      const numResult: FixedArray<Object> = reflect.internals.Types.asFixedArray<Object>(numArr as Object);
      expect(numResult === numArr).assertTrue();
      expect(numResult[0] as number).assertEqual(0);

      const strArr: FixedArray<Object> = ["", "hello world"];
      const strResult: FixedArray<Object> = reflect.internals.Types.asFixedArray<Object>(strArr as Object);
      expect(strResult === strArr).assertTrue();
      expect(strResult[1] as string).assertEqual("hello world");

      let b1: boolean = true;
      let b2: boolean = false;
      const boolArr: FixedArray<Object> = [b1, b2];
      const boolResult: FixedArray<Object> = reflect.internals.Types.asFixedArray<Object>(boolArr as Object);
      expect(boolResult === boolArr).assertTrue();
      expect(boolResult[0] as boolean).assertTrue();
      expect(boolResult[1] as boolean).assertFalse();
    });
  });
}
