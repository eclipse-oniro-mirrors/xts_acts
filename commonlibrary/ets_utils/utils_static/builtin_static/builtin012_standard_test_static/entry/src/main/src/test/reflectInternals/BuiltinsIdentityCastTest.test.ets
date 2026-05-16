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

class Item {
  name: string;
  value: number;
  constructor(name: string, value: number) {
    this.name = name;
    this.value = value;
  }
}

export default function BuiltinsIdentityCastTest(): void {
  describe('BuiltinsIdentityCastTest', () => {
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
     * @tc.name    BuiltinsIdentityCastTest0100
     * @tc.number  SUB_BUILTINS_IDENTITY_CAST_TEST_0100
     * @tc.desc    Verify that identity_cast returns correct length for Array containing Number base values (0/-1/NaN/Infinity/-Infinity)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsIdentityCastTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let n0: number = 0;
      let n1: number = -1;
      let n2: number = NaN;
      let n3: number = Infinity;
      let n4: number = -Infinity;
      const arr: Array<number> = [n0, n1, n2, n3, n4];
      const result: ArrayLike<number> = reflect.internals.Types.identity_cast<number>(arr);
      expect(result.length).assertEqual(5);
    });

    /**
     * @tc.name    BuiltinsIdentityCastTest0200
     * @tc.number  SUB_BUILTINS_IDENTITY_CAST_TEST_0200
     * @tc.desc    Verify that identity_cast returns correct element values for Array containing Number extreme values (0/-1/MAX_SAFE_INTEGER)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsIdentityCastTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let n0: number = 0;
      let n1: number = -1;
      let n2: number = Number.MAX_SAFE_INTEGER;
      const arr: Array<number> = [n0, n1, n2];
      const result: ArrayLike<number> = reflect.internals.Types.identity_cast<number>(arr);
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(-1);
      expect(result[2]).assertEqual(Number.MAX_SAFE_INTEGER);
    });

    /**
     * @tc.name    BuiltinsIdentityCastTest0300
     * @tc.number  SUB_BUILTINS_IDENTITY_CAST_TEST_0300
     * @tc.desc    Verify that identity_cast returns correct results for String Array containing empty string/ASCII/escape characters (parameter.md - String empty/ASCII/escape characters)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsIdentityCastTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: Array<string> = ["", "hello world", "line1\nline2\ttab"];
      const result: ArrayLike<string> = reflect.internals.Types.identity_cast<string>(arr);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual("");
      expect(result[1]).assertEqual("hello world");
      expect(result[2]).assertEqual("line1\nline2\ttab");
    });

    /**
     * @tc.name    BuiltinsIdentityCastTest0400
     * @tc.number  SUB_BUILTINS_IDENTITY_CAST_TEST_0400
     * @tc.desc    Verify that identity_cast returns correct element values for Boolean Array (true/false)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsIdentityCastTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: Array<boolean> = [true, false, true];
      const result: ArrayLike<boolean> = reflect.internals.Types.identity_cast<boolean>(arr);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertTrue();
      expect(result[1]).assertFalse();
      expect(result[2]).assertTrue();
    });

    /**
     * @tc.name    BuiltinsIdentityCastTest0500
     * @tc.number  SUB_BUILTINS_IDENTITY_CAST_TEST_0500
     * @tc.desc    Verify that identity_cast returns length 0 for empty Array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsIdentityCastTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: Array<number> = [];
      const result: ArrayLike<number> = reflect.internals.Types.identity_cast<number>(arr);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.name    BuiltinsIdentityCastTest0600
     * @tc.number  SUB_BUILTINS_IDENTITY_CAST_TEST_0600
     * @tc.desc    Verify that identity_cast returns isNaN true for single-element NaN Array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsIdentityCastTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let n: number = NaN;
      const arr: Array<number> = [n];
      const result: ArrayLike<number> = reflect.internals.Types.identity_cast<number>(arr);
      expect(result.length).assertEqual(1);
      expect(isNaN(result[0])).assertTrue();
    });

    /**
     * @tc.name    BuiltinsIdentityCastTest0700
     * @tc.number  SUB_BUILTINS_IDENTITY_CAST_TEST_0700
     * @tc.desc    Verify that identity_cast returns same reference as input for Number Infinity/-Infinity Array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsIdentityCastTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let n0: number = 0;
      let n1: number = Infinity;
      let n2: number = -Infinity;
      const arr: Array<number> = [n0, n1, n2];
      const result: ArrayLike<number> = reflect.internals.Types.identity_cast<number>(arr);
      expect(result === arr).assertTrue();
    });

    /**
     * @tc.name    BuiltinsIdentityCastTest0800
     * @tc.number  SUB_BUILTINS_IDENTITY_CAST_TEST_0800
     * @tc.desc    Verify that identity_cast results reflect changes made to Number Array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsIdentityCastTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let n0: number = 0;
      let n1: number = Infinity;
      let n2: number = NaN;
      const arr: Array<number> = [n0, n1, n2];
      const result: ArrayLike<number> = reflect.internals.Types.identity_cast<number>(arr);
      arr[0] = Number.MAX_SAFE_INTEGER;
      expect(result[0]).assertEqual(Number.MAX_SAFE_INTEGER);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.name    BuiltinsIdentityCastTest0900
     * @tc.number  SUB_BUILTINS_IDENTITY_CAST_TEST_0900
     * @tc.desc    Verify that identity_cast returns correct results for String Array containing empty string and escape characters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsIdentityCastTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: Array<string> = ["", "line1\nline2\ttab", "hello world"];
      const result: ArrayLike<string> = reflect.internals.Types.identity_cast<string>(arr);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual("");
      expect(result[1]).assertEqual("line1\nline2\ttab");
      expect(result[2]).assertEqual("hello world");
    });

    /**
     * @tc.name    BuiltinsIdentityCastTest1000
     * @tc.number  SUB_BUILTINS_IDENTITY_CAST_TEST_1000
     * @tc.desc    Verify that identity_cast returns correct properties for object Array containing Number + String fields
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsIdentityCastTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: Array<Item> = [new Item("zero", 0), new Item("max", Number.MAX_SAFE_INTEGER)];
      const result: ArrayLike<Item> = reflect.internals.Types.identity_cast<Item>(arr);
      expect(result.length).assertEqual(2);
      expect((result[0] as Item).name).assertEqual("zero");
      expect((result[0] as Item).value).assertEqual(0);
      expect((result[1] as Item).name).assertEqual("max");
      expect((result[1] as Item).value).assertEqual(Number.MAX_SAFE_INTEGER);
    });

    /**
     * @tc.name    BuiltinsIdentityCastTest1100
     * @tc.number  SUB_BUILTINS_IDENTITY_CAST_TEST_1100
     * @tc.desc    Verify that identity_cast result can be iterated via for-of to sum Number elements
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsIdentityCastTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let n0: number = 0;
      let n1: number = 1;
      let n2: number = 2;
      const arr: Array<number> = [n0, n1, n2];
      const result: ArrayLike<number> = reflect.internals.Types.identity_cast<number>(arr);
      let sum: number = 0;
      for (const item of result) {
        sum += item;
      }
      expect(sum).assertEqual(3);
    });

    /**
     * @tc.name    BuiltinsIdentityCastTest1200
     * @tc.number  SUB_BUILTINS_IDENTITY_CAST_TEST_1200
     * @tc.desc    Verify that identity_cast returns correct length and first/last elements for larger Number Array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsIdentityCastTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr: Array<number> = new Array<number>();
      for (let i = 0; i < 100; i++) {
        arr.push(i);
      }
      const result: ArrayLike<number> = reflect.internals.Types.identity_cast<number>(arr);
      expect(result.length).assertEqual(100);
      expect(result[0]).assertEqual(0);
      expect(result[99]).assertEqual(99);
    });

    /**
     * @tc.name    BuiltinsIdentityCastTest1300
     * @tc.number  SUB_BUILTINS_IDENTITY_CAST_TEST_1300
     * @tc.desc    Verify that multiple identity_cast calls on Array containing NaN/Infinity/-Infinity yield consistent results
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsIdentityCastTest1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      let n0: number = NaN;
      let n1: number = Infinity;
      let n2: number = -Infinity;
      const arr: Array<number> = [n0, n1, n2];
      const r1: ArrayLike<number> = reflect.internals.Types.identity_cast<number>(arr);
      const r2: ArrayLike<number> = reflect.internals.Types.identity_cast<number>(arr);
      expect(r1.length).assertEqual(r2.length);
      expect(isNaN(r1[0])).assertTrue();
      expect(isNaN(r2[0])).assertTrue();
      expect(r1[1]).assertEqual(Infinity);
      expect(r2[1]).assertEqual(Infinity);
    });

    /**
     * @tc.name    BuiltinsIdentityCastTest1400
     * @tc.number  SUB_BUILTINS_IDENTITY_CAST_TEST_1400
     * @tc.desc    Verify that identity_cast returns correct results for nested Number Array containing 0/MAX_SAFE_INTEGER
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsIdentityCastTest1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      let n0: number = 0;
      let n1: number = Number.MAX_SAFE_INTEGER;
      const inner1: Array<number> = [n0, n1];
      let n2: number = -1;
      let n3: number = Infinity;
      const inner2: Array<number> = [n2, n3];
      const arr: Array<Array<number>> = [inner1, inner2];
      const result: ArrayLike<Array<number>> = reflect.internals.Types.identity_cast<Array<number>>(arr);
      expect(result.length).assertEqual(2);
      expect((result[0] as Array<number>)[0]).assertEqual(0);
      expect((result[0] as Array<number>)[1]).assertEqual(Number.MAX_SAFE_INTEGER);
      expect((result[1] as Array<number>)[0]).assertEqual(-1);
    });

    /**
     * @tc.name    BuiltinsIdentityCastTest1500
     * @tc.number  SUB_BUILTINS_IDENTITY_CAST_TEST_1500
     * @tc.desc    Verify that consecutive identity_cast calls on Number Array containing 0/MAX_SAFE_INTEGER return same reference
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsIdentityCastTest1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      let n0: number = 0;
      let n1: number = Number.MAX_SAFE_INTEGER;
      const arr: Array<number> = [n0, n1];
      const r1: ArrayLike<number> = reflect.internals.Types.identity_cast<number>(arr);
      const r2: ArrayLike<number> = reflect.internals.Types.identity_cast<number>(r1 as Array<number>);
      expect(r1 === arr).assertTrue();
      expect(r2 === arr).assertTrue();
    });
  });
}
