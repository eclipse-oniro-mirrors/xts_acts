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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium/index';
import Utils from '../Util.test';

const func = () => {
  return 'test';
};

interface GeneratedObjectLiteralInterface_1 {
  id: number;
}

interface NestedObj {
  value: number;
}
interface TestObj {
  nested: NestedObj;
}

const func2 = () => {
  return 1;
};

interface TestObj2 {
  id: number;
}

class ObjWithValueOf {
  valueOf(): number {
    return 3;
  }
}

class ObjWithToString {
  toString(): string {
    return 'test';
  }
}

class ObjWithToJSON {
  toJSON(): string {
    return 'json-data';
  }
}

export default function BuiltinsArrayPrototypeConcatTest(): void {
  describe("BuiltinsArrayPrototypeConcatTest", () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await Utils.msSleep(20);
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
     * @tc.name    BuiltinsArrayPrototypeConcatTest0100
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_CONCAT_TEST_0100
     * @tc.desc    Verify that concat() connects two simple arrays
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeConcatTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr1 = [1, 2, 3];
      const arr2 = [4, 5, 6];
      const result = arr1.concat(arr2);
      expect(result).not().assertNull();
      expect(Array.isArray(result)).assertTrue();
      expect(result.length).assertEqual(6);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
      expect(result[3]).assertEqual(4);
      expect(result[4]).assertEqual(5);
      expect(result[5]).assertEqual(6);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeConcatTest0200
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_CONCAT_TEST_0200
     * @tc.desc    Verify that concat() connects multiple arrays
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeConcatTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr1 = [1, 2];
      const arr2 = [3, 4];
      const arr3 = [5, 6];
      const result = arr1.concat(arr2, arr3);
      expect(result).not().assertNull();
      expect(Array.isArray(result)).assertTrue();
      expect(result.length).assertEqual(6);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
      expect(result[3]).assertEqual(4);
      expect(result[4]).assertEqual(5);
      expect(result[5]).assertEqual(6);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeConcatTest0300
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_CONCAT_TEST_0300
     * @tc.desc    Verify that concat() with empty array as parameter
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeConcatTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr1 = [1, 2, 3];
      const arr2 = [];
      const result = arr1.concat(arr2);
      expect(result).not().assertNull();
      expect(Array.isArray(result)).assertTrue();
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeConcatTest0400
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_CONCAT_TEST_0400
     * @tc.desc    Verify that empty array calls concat()
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeConcatTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr1:number[] = [];
      const arr2 = [1, 2, 3];
      const result = arr1.concat(arr2);
      expect(result).not().assertNull();
      expect(Array.isArray(result)).assertTrue();
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeConcatTest0500
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_CONCAT_TEST_0500
     * @tc.desc    Verify that concat() connects array with primitive values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeConcatTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr1 = [1, 2, 3];
      const result = arr1.concat(4, 5);
      expect(result).not().assertNull();
      expect(Array.isArray(result)).assertTrue();
      expect(result.length).assertEqual(5);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
      expect(result[3]).assertEqual(4);
      expect(result[4]).assertEqual(5);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeConcatTest0600
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_CONCAT_TEST_0600
     * @tc.desc    Verify that concat() connects array with mixed values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeConcatTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr1 = [1, 2];
      const result = arr1.concat(3, [4, 5], 6);
      expect(result).not().assertNull();
      expect(Array.isArray(result)).assertTrue();
      expect(result.length).assertEqual(6);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
      expect(result[3]).assertEqual(4);
      expect(result[4]).assertEqual(5);
      expect(result[5]).assertEqual(6);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeConcatTest0700
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_CONCAT_TEST_0700
     * @tc.desc    Verify that concat() with no parameters returns shallow copy
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeConcatTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr1 = [1, 2, 3];
      const result = arr1.concat();
      expect(result).not().assertNull();
      expect(Array.isArray(result)).assertTrue();
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
      expect(result !== arr1).assertTrue();
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeConcatTest0800
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_CONCAT_TEST_0800
     * @tc.desc    Verify that concat() connects regular arrays
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeConcatTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr1 = [1, 2];
      const arr2 = [3, 4];
      const result = arr1.concat(arr2);
      expect(result).not().assertNull();
      expect(Array.isArray(result)).assertTrue();
      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
      expect(result[3]).assertEqual(4);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeConcatTest0900
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_CONCAT_TEST_0900
     * @tc.desc    Verify that concat() connects with number values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeConcatTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr1 = [1, 2];
      const result = arr1.concat(3, 4, 5);
      expect(result).not().assertNull();
      expect(Array.isArray(result)).assertTrue();
      expect(result.length).assertEqual(5);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
      expect(result[3]).assertEqual(4);
      expect(result[4]).assertEqual(5);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeConcatTest1000
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_CONCAT_TEST_1000
     * @tc.desc    Verify that concat() connects with string values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeConcatTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr1 = ['a', 'b'];
      const result = arr1.concat('c', 'd');
      expect(result).not().assertNull();
      expect(Array.isArray(result)).assertTrue();
      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual('a');
      expect(result[1]).assertEqual('b');
      expect(result[2]).assertEqual('c');
      expect(result[3]).assertEqual('d');
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeConcatTest1100
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_CONCAT_TEST_1100
     * @tc.desc    Verify that concat() connects with boolean values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeConcatTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr1: (number | boolean)[] = [1];
      const result = arr1.concat(true, false);
      expect(result).not().assertNull();
      expect(Array.isArray(result)).assertTrue();
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertTrue();
      expect(result[2]).assertFalse();
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeConcatTest1200
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_CONCAT_TEST_1200
     * @tc.desc    Verify that concat() connects with function objects
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeConcatTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr1: (number | (() => string))[] = [1, 2];
      const result = arr1.concat(func);
      expect(result).not().assertNull();
      expect(Array.isArray(result)).assertTrue();
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).not().assertNull();
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeConcatTest1300
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_CONCAT_TEST_1300
     * @tc.desc    Verify that concat() connects arrays with number elements
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeConcatTest1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr1 = [1, 2, 3];
      const arr2 = [4, 5, 6];
      const result = arr1.concat(arr2);
      expect(result).not().assertNull();
      expect(Array.isArray(result)).assertTrue();
      expect(result.length).assertEqual(6);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
      expect(result[3]).assertEqual(4);
      expect(result[4]).assertEqual(5);
      expect(result[5]).assertEqual(6);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeConcatTest1400
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_CONCAT_TEST_1400
     * @tc.desc    Verify that concat() connects arrays with string elements
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeConcatTest1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr1 = ['a', 'b'];
      const arr2 = ['c', 'd'];
      const result = arr1.concat(arr2);
      expect(result).not().assertNull();
      expect(Array.isArray(result)).assertTrue();
      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual('a');
      expect(result[1]).assertEqual('b');
      expect(result[2]).assertEqual('c');
      expect(result[3]).assertEqual('d');
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeConcatTest1500
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_CONCAT_TEST_1500
     * @tc.desc    Verify that concat() connects arrays with boolean elements
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeConcatTest1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr1 = [true, false];
      const arr2 = [true];
      const result = arr1.concat(arr2);
      expect(result).not().assertNull();
      expect(Array.isArray(result)).assertTrue();
      expect(result.length).assertEqual(3);
      expect(result[0]).assertTrue();
      expect(result[1]).assertFalse();
      expect(result[2]).assertTrue();
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeConcatTest1600
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_CONCAT_TEST_1600
     * @tc.desc    Verify that concat() connects arrays with object elements
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeConcatTest1600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr1 = [({ id: 1 } as GeneratedObjectLiteralInterface_1)];
      const arr2 = [({ id: 2 } as GeneratedObjectLiteralInterface_1)];
      const result = arr1.concat(arr2);
      expect(result).not().assertNull();
      expect(Array.isArray(result)).assertTrue();
      expect(result.length).assertEqual(2);
      expect(result[0]).not().assertNull();
      expect(result[1]).not().assertNull();
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeConcatTest1700
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_CONCAT_TEST_1700
     * @tc.desc    Verify that concat() connects arrays with nested array elements
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeConcatTest1700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr1 = [[1, 2]];
      const arr2 = [[3, 4]];
      const result = arr1.concat(arr2);
      expect(result).not().assertNull();
      expect(result.length).assertEqual(2);
      expect(result[0][0]).assertEqual(1);
      expect(result[0][1]).assertEqual(2);
      expect(result[1][0]).assertEqual(3);
      expect(result[1][1]).assertEqual(4);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeConcatTest1800
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_CONCAT_TEST_1800
     * @tc.desc    Verify that concat() connects arrays with function elements
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeConcatTest1800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const func1 = () => 1;
      const func2 = () => 2;
      const arr1 = [func1];
      const arr2 = [func2];
      const result = arr1.concat(arr2);
      expect(result).not().assertNull();
      expect(Array.isArray(result)).assertTrue();
      expect(result.length).assertEqual(2);
      expect(result[0]).not().assertNull();
      expect(result[1]).not().assertNull();
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeConcatTest1900
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_CONCAT_TEST_1900
     * @tc.desc    Verify that concat() connects arrays with null elements
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeConcatTest1900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr1: (number | null)[] = [null];
      const arr2: (number | null)[] = [1, null, 2];
      const result = arr1.concat(arr2);
      expect(result).not().assertNull();
      expect(Array.isArray(result)).assertTrue();
      expect(result.length).assertEqual(4);
      expect(result[0]).assertNull();
      expect(result[1]).assertEqual(1);
      expect(result[2]).assertNull();
      expect(result[3]).assertEqual(2);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeConcatTest2000
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_CONCAT_TEST_2000
     * @tc.desc    Verify that concat() connects arrays with undefined elements
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeConcatTest2000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr1: (number | undefined)[] = [undefined];
      const arr2: (number | undefined)[] = [1, undefined, 2];
      const result = arr1.concat(arr2);
      expect(result).not().assertNull();
      expect(Array.isArray(result)).assertTrue();
      expect(result.length).assertEqual(4);
      expect(result[0]).assertUndefined();
      expect(result[1]).assertEqual(1);
      expect(result[2]).assertUndefined();
      expect(result[3]).assertEqual(2);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeConcatTest2100
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_CONCAT_TEST_2100
     * @tc.desc    Verify that concat() connects arrays with mixed type elements
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeConcatTest2100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr1: (number | string | boolean)[] = [1, 'a', true];
      const arr2: (null | undefined | TestObj2)[] = [null, undefined, { id: 1 }];
      const result = (arr1 as (number | string | boolean | null | undefined | TestObj2)[]).concat(arr2);
      expect(result).not().assertNull();
      expect(Array.isArray(result)).assertTrue();
      expect(result.length).assertEqual(6);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual('a');
      expect(result[2]).assertTrue();
      expect(result[3]).assertNull();
      expect(result[4]).assertUndefined();
      expect(result[5]).not().assertNull();
      if (result[5]) {
        expect((result[5] as TestObj2).id).assertEqual(1);
      }
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeConcatTest2200
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_CONCAT_TEST_2200
     * @tc.desc    Verify that concat() connects 2D arrays
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeConcatTest2200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr1 = [[1, 2], [3, 4]];
      const arr2 = [[5, 6]];
      const result = arr1.concat(arr2);
      expect(result).not().assertNull();
      expect(result.length).assertEqual(3);
      expect(result[0][0]).assertEqual(1);
      expect(result[0][1]).assertEqual(2);
      expect(result[1][0]).assertEqual(3);
      expect(result[1][1]).assertEqual(4);
      expect(result[2][0]).assertEqual(5);
      expect(result[2][1]).assertEqual(6);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeConcatTest2300
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_CONCAT_TEST_2300
     * @tc.desc    Verify that concat() connects 2D array with 1D array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeConcatTest2300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr1 = [[1, 2]];
      const arr2 = [3, 4];
      const result = arr1.concat(arr2);
      expect(result).not().assertNull();
      expect(result.length).assertEqual(3);
      expect(result[0][0]).assertEqual(1);
      expect(result[0][1]).assertEqual(2);
      expect(result[1]).assertEqual(3);
      expect(result[2]).assertEqual(4);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeConcatTest2400
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_CONCAT_TEST_2400
     * @tc.desc    Verify that concat() connects 3D arrays
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeConcatTest2400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr1 = [[[1, 2]]];
      const arr2 = [[[3, 4]]];
      const result = arr1.concat(arr2);
      expect(result).not().assertNull();
      expect(result.length).assertEqual(2);
      expect(result[0][0][0]).assertEqual(1);
      expect(result[0][0][1]).assertEqual(2);
      expect(result[1][0][0]).assertEqual(3);
      expect(result[1][0][1]).assertEqual(4);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeConcatTest2500
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_CONCAT_TEST_2500
     * @tc.desc    Verify that concat() connects deeply nested arrays
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeConcatTest2500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr1 = [[[[1]]]];
      const arr2 = [[[[2]]]];
      const result = arr1.concat(arr2);
      expect(result).not().assertNull();
      expect(result.length).assertEqual(2);
      expect(result[0][0][0][0]).assertEqual(1);
      expect(result[1][0][0][0]).assertEqual(2);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeConcatTest2600
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_CONCAT_TEST_2600
     * @tc.desc    Verify that concat() connects arrays with different nesting levels
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeConcatTest2600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr1: (number | number[] | number[][])[] = [[1], 2, [[3]]];
      const arr2: (number | number[] | number[][])[] = [4, [5], [[6]]];
      const result = arr1.concat(arr2);
      expect(result).not().assertNull();
      expect(result.length).assertEqual(6);
      expect((result[0] as number[])[0]).assertEqual(1);
      expect(result[1] as number).assertEqual(2);
      expect((result[2] as number[][])[0][0]).assertEqual(3);
      expect(result[3] as number).assertEqual(4);
      expect((result[4] as number[])[0]).assertEqual(5);
      expect((result[5] as number[][])[0][0]).assertEqual(6);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeConcatTest2700
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_CONCAT_TEST_2700
     * @tc.desc    Verify that concat() connects arrays with sparse nested arrays
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeConcatTest2700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr1 = [[1, , 3]];
      const arr2 = [[, 5, 6]];
      const result = arr1.concat(arr2);
      expect(result).not().assertNull();
      expect(result.length).assertEqual(2);
      expect(result[0][0]).assertEqual(1);
      expect(result[0][2]).assertEqual(3);
      expect(result[1][1]).assertEqual(5);
      expect(result[1][2]).assertEqual(6);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeConcatTest2800
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_CONCAT_TEST_2800
     * @tc.desc    Verify that concat() does shallow copy of object references
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeConcatTest2800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const obj: TestObj2 = { id: 1 };
      const arr1 = [obj];
      const result = arr1.concat();
      obj.id = 2;
      expect(result[0].id).assertEqual(2);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeConcatTest2900
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_CONCAT_TEST_2900
     * @tc.desc    Verify that concat() does shallow copy of nested object references
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeConcatTest2900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const obj: TestObj = { nested: { value: 1 } };
      const arr1 = [obj];
      const result = arr1.concat();
      obj.nested.value = 2;
      expect(result[0].nested.value).assertEqual(2);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeConcatTest3000
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_CONCAT_TEST_3000
     * @tc.desc    Verify that concat() does shallow copy of nested array references
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeConcatTest3000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const inner = [1, 2, 3];
      const arr1 = [inner];
      const result = arr1.concat();
      inner.push(4);
      expect(result[0].length).assertEqual(4);
      expect(result[0][3]).assertEqual(4);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeConcatTest3100
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_CONCAT_TEST_3100
     * @tc.desc    Verify that concat() returns a new array instance
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeConcatTest3100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr1 = [1, 2, 3];
      const result = arr1.concat();
      result.push(4);
      expect(arr1.length).assertEqual(3);
      expect(result.length).assertEqual(4);
      expect(result !== arr1).assertTrue();
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeConcatTest3200
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_CONCAT_TEST_3200
     * @tc.desc    Verify that modifying result array doesn't affect original arrays
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeConcatTest3200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr1 = [1, 2, 3];
      const arr2 = [4, 5, 6];
      const result = arr1.concat(arr2);
      result[0] = 999;
      expect(arr1[0]).assertEqual(1);
      expect(result[0]).assertEqual(999);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeConcatTest3300
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_CONCAT_TEST_3300
     * @tc.desc    Verify that concat() does shallow copy of function references
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeConcatTest3300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr1 = [func2];
      const result = arr1.concat();
      expect(result[0]).assertEqual(func2);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeConcatTest3400
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_CONCAT_TEST_3400
     * @tc.desc    Verify that concat() connects with null as parameter
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeConcatTest3400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr1: (number | null)[] = [1, 2];
      const result = arr1.concat(null);
      expect(result).not().assertNull();
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertNull();
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeConcatTest3500
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_CONCAT_TEST_3500
     * @tc.desc    Verify that concat() connects with undefined as parameter
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeConcatTest3500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr1: (number | undefined)[] = [1, 2];
      const result = arr1.concat(undefined);
      expect(result).not().assertNull();
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertUndefined();
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeConcatTest3600
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_CONCAT_TEST_3600
     * @tc.desc    Verify that concat() connects null and undefined mixed
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeConcatTest3600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr1: (null | undefined)[] = [null];
      const arr2: (null | undefined)[] = [undefined];
      const result = arr1.concat(arr2);
      expect(result).not().assertNull();
      expect(result.length).assertEqual(2);
      expect(result[0]).assertNull();
      expect(result[1]).assertUndefined();
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeConcatTest3700
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_CONCAT_TEST_3700
     * @tc.desc    Verify that concat() connects arrays with empty slots
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeConcatTest3700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr1 = [1, , 3];
      const arr2 = [4, , 6];
      const result = arr1.concat(arr2);
      expect(result).not().assertNull();
      expect(result.length).assertEqual(6);
      expect(result[0]).assertEqual(1);
      expect(result[2]).assertEqual(3);
      expect(result[3]).assertEqual(4);
      expect(result[5]).assertEqual(6);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeConcatTest3800
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_CONCAT_TEST_3800
     * @tc.desc    Verify that concat() connects with array containing only empty slots
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeConcatTest3800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr1: number[] = [1, 2];
      const arr2: number[] = new Array<number>(3);
      const result = arr1.concat(arr2);
      expect(result).not().assertNull();
      expect(result.length).assertEqual(5);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeConcatTest3900
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_CONCAT_TEST_3900
     * @tc.desc    Verify that concat() connects arrays with NaN
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeConcatTest3900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr1 = [NaN];
      const arr2 = [1, 2];
      const result = arr1.concat(arr2);
      expect(result).not().assertNull();
      expect(result.length).assertEqual(3);
      expect(isNaN(result[0])).assertTrue();
      expect(result[1]).assertEqual(1);
      expect(result[2]).assertEqual(2);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeConcatTest4000
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_CONCAT_TEST_4000
     * @tc.desc    Verify that concat() connects arrays with Infinity
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeConcatTest4000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr1 = [Infinity];
      const arr2 = [-Infinity];
      const result = arr1.concat(arr2);
      expect(result).not().assertNull();
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(Infinity);
      expect(result[1]).assertEqual(-Infinity);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeConcatTest4100
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_CONCAT_TEST_4100
     * @tc.desc    Verify that concat() connects arrays with RegExp objects
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeConcatTest4100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr1 = [/abc/];
      const arr2 = [/def/gi];
      const result = arr1.concat(arr2);
      expect(result).not().assertNull();
      expect(result.length).assertEqual(2);
      expect(result[0]).not().assertNull();
      expect(result[1]).not().assertNull();
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeConcatTest4200
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_CONCAT_TEST_4200
     * @tc.desc    Verify that concat() connects arrays with Date objects
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeConcatTest4200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const date1 = new Date('2024-01-01');
      const date2 = new Date('2024-12-31');
      const arr1 = [date1];
      const arr2 = [date2];
      const result = arr1.concat(arr2);
      expect(result).not().assertNull();
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(date1);
      expect(result[1]).assertEqual(date2);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeConcatTest4300
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_CONCAT_TEST_4300
     * @tc.desc    Verify that concat() connects two empty arrays
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeConcatTest4300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr1 = [];
      const arr2 = [];
      const result = arr1.concat(arr2);
      expect(result).not().assertNull();
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeConcatTest4400
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_CONCAT_TEST_4400
     * @tc.desc    Verify that concat() connects multiple empty arrays
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeConcatTest4400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr1 = [];
      const arr2 = [];
      const arr3 = [];
      const result = arr1.concat(arr2, arr3);
      expect(result).not().assertNull();
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeConcatTest4500
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_CONCAT_TEST_4500
     * @tc.desc    Verify that concat() connects single-element arrays
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeConcatTest4500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr1 = [1];
      const arr2 = [2];
      const result = arr1.concat(arr2);
      expect(result).not().assertNull();
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeConcatTest4600
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_CONCAT_TEST_4600
     * @tc.desc    Verify that concat() connects multiple single-element arrays
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeConcatTest4600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const result = [1].concat([2], [3], [4], [5]);
      expect(result).not().assertNull();
      expect(result.length).assertEqual(5);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
      expect(result[3]).assertEqual(4);
      expect(result[4]).assertEqual(5);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeConcatTest4700
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_CONCAT_TEST_4700
     * @tc.desc    Verify that concat() connects arrays with Number.MAX_VALUE
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeConcatTest4700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr1 = [Number.MAX_VALUE];
      const arr2 = [1];
      const result = arr1.concat(arr2);
      expect(result).not().assertNull();
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(Number.MAX_VALUE);
      expect(result[1]).assertEqual(1);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeConcatTest4800
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_CONCAT_TEST_4800
     * @tc.desc    Verify that concat() connects arrays with Number.MIN_VALUE
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeConcatTest4800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr1 = [Number.MIN_VALUE];
      const arr2 = [1];
      const result = arr1.concat(arr2);
      expect(result).not().assertNull();
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(Number.MIN_VALUE);
      expect(result[1]).assertEqual(1);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeConcatTest4900
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_CONCAT_TEST_4900
     * @tc.desc    Verify that concat() connects arrays with +0 and -0
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeConcatTest4900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr1 = [+0];
      const arr2 = [-0];
      const result = arr1.concat(arr2);
      expect(result).not().assertNull();
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(0);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeConcatTest5000
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_CONCAT_TEST_5000
     * @tc.desc    Verify that concat() doesn't modify the caller array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeConcatTest5000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr1 = [1, 2, 3];
      const arr2 = [4, 5, 6];
      const original = arr1.slice();
      const result = arr1.concat(arr2);
      expect(arr1.length).assertEqual(original.length);
      for (let i = 0; i < arr1.length; i++) {
        expect(arr1[i]).assertEqual(original[i]);
      }
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeConcatTest5100
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_CONCAT_TEST_5100
     * @tc.desc    Verify that concat() doesn't modify the parameter array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeConcatTest5100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr1 = [1, 2, 3];
      const arr2 = [4, 5, 6];
      const original = arr2.slice();
      const result = arr1.concat(arr2);
      expect(arr2.length).assertEqual(original.length);
      for (let i = 0; i < arr2.length; i++) {
        expect(arr2[i]).assertEqual(original[i]);
      }
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeConcatTest5200
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_CONCAT_TEST_5200
     * @tc.desc    Verify that modifying caller array after concat doesn't affect result
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeConcatTest5200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr1 = [1, 2, 3];
      const arr2 = [4, 5, 6];
      const result = arr1.concat(arr2);
      arr1.push(999);
      expect(result.length).assertEqual(6);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
      expect(result[3]).assertEqual(4);
      expect(result[4]).assertEqual(5);
      expect(result[5]).assertEqual(6);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeConcatTest5300
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_CONCAT_TEST_5300
     * @tc.desc    Verify that modifying parameter array after concat doesn't affect result
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeConcatTest5300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr1 = [1, 2, 3];
      const arr2 = [4, 5, 6];
      const result = arr1.concat(arr2);
      arr2.push(999);
      expect(result.length).assertEqual(6);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
      expect(result[3]).assertEqual(4);
      expect(result[4]).assertEqual(5);
      expect(result[5]).assertEqual(6);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeConcatTest5400
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_CONCAT_TEST_5400
     * @tc.desc    Verify that result array can be modified
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeConcatTest5400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr1 = [1, 2, 3];
      const arr2 = [4, 5, 6];
      const result = arr1.concat(arr2);
      result.push(7);
      result[0] = 0;
      expect(result.length).assertEqual(7);
      expect(result[0]).assertEqual(0);
      expect(result[6]).assertEqual(7);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeConcatTest5500
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_CONCAT_TEST_5500
     * @tc.desc    Verify that elements can be removed from result array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeConcatTest5500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr1 = [1, 2, 3];
      const arr2 = [4, 5, 6];
      const result = arr1.concat(arr2);
      result.pop();
      expect(result.length).assertEqual(5);
      expect(result[4]).assertEqual(5);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeConcatTest5600
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_CONCAT_TEST_5600
     * @tc.desc    Verify that concat() connects three array parameters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeConcatTest5600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr1 = [1, 2];
      const arr2 = [3, 4];
      const arr3 = [5, 6];
      const result = arr1.concat(arr2, arr3);
      expect(result).not().assertNull();
      expect(result.length).assertEqual(6);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
      expect(result[3]).assertEqual(4);
      expect(result[4]).assertEqual(5);
      expect(result[5]).assertEqual(6);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeConcatTest5700
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_CONCAT_TEST_5700
     * @tc.desc    Verify that concat() connects multiple array parameters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeConcatTest5700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr1 = [1];
      const result = arr1.concat([2], [3], [4], [5], [6]);
      expect(result).not().assertNull();
      expect(result.length).assertEqual(6);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
      expect(result[3]).assertEqual(4);
      expect(result[4]).assertEqual(5);
      expect(result[5]).assertEqual(6);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeConcatTest5800
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_CONCAT_TEST_5800
     * @tc.desc    Verify that concat() connects mixed array and primitive values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeConcatTest5800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr1 = [1, 2];
      const result = arr1.concat(3, [4, 5], 6, [7, 8]);
      expect(result).not().assertNull();
      expect(result.length).assertEqual(8);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
      expect(result[3]).assertEqual(4);
      expect(result[4]).assertEqual(5);
      expect(result[5]).assertEqual(6);
      expect(result[6]).assertEqual(7);
      expect(result[7]).assertEqual(8);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeConcatTest5900
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_CONCAT_TEST_5900
     * @tc.desc    Verify that concat() handles empty arrays interspersed
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeConcatTest5900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr1 = [1];
      const result = arr1.concat([], [2], [], [3], []);
      expect(result).not().assertNull();
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeConcatTest6000
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_CONCAT_TEST_6000
     * @tc.desc    Verify that concat() handles mixed null and undefined
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeConcatTest6000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr1: (number | null | undefined)[] = [1];
      const result = arr1.concat(null, [2], undefined, [3]);
      expect(result).not().assertNull();
      expect(result.length).assertEqual(5);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertNull();
      expect(result[2]).assertEqual(2);
      expect(result[3]).assertUndefined();
      expect(result[4]).assertEqual(3);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeConcatTest6100
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_CONCAT_TEST_6100
     * @tc.desc    Verify that concat() connects repeated same array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeConcatTest6100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr1 = [1];
      const arr2 = [2, 3];
      const result = arr1.concat(arr2, arr2, arr2);
      expect(result).not().assertNull();
      expect(result.length).assertEqual(7);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
      expect(result[3]).assertEqual(2);
      expect(result[4]).assertEqual(3);
      expect(result[5]).assertEqual(2);
      expect(result[6]).assertEqual(3);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeConcatTest6200
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_CONCAT_TEST_6200
     * @tc.desc    Verify that concat() connects repeated same values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeConcatTest6200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr1 = [1];
      const result = arr1.concat(2, 2, 2, 3, 3);
      expect(result).not().assertNull();
      expect(result.length).assertEqual(6);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(2);
      expect(result[3]).assertEqual(2);
      expect(result[4]).assertEqual(3);
      expect(result[5]).assertEqual(3);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeConcatTest6300
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_CONCAT_TEST_6300
     * @tc.desc    Verify that concat() handles array with length 0
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeConcatTest6300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr1 = [1, 2, 3];
      const arr2 = [];
      arr2.length = 0;
      const result = arr1.concat(arr2);
      expect(result).not().assertNull();
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeConcatTest6400
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_CONCAT_TEST_6400
     * @tc.desc    Verify that concat() keeps string numbers as strings
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeConcatTest6400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr1: (number | string)[] = [1, 2];
      const result = arr1.concat('3', '4');
      expect(result).not().assertNull();
      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual('3');
      expect(result[3]).assertEqual('4');
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeConcatTest6500
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_CONCAT_TEST_6500
     * @tc.desc    Verify that concat() keeps booleans as booleans
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeConcatTest6500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr1:(number | boolean)[] = [1, 2];
      const result = arr1.concat(true, false);
      expect(result).not().assertNull();
      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(true);
      expect(result[3]).assertEqual(false);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeConcatTest6600
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_CONCAT_TEST_6600
     * @tc.desc    Verify that concat() doesn't call valueOf on objects
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeConcatTest6600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr1: (number | ObjWithValueOf)[] = [1, 2];
      const obj = new ObjWithValueOf();
      const result = arr1.concat(obj);
      expect(result).not().assertNull();
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(obj);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeConcatTest6700
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_CONCAT_TEST_6700
     * @tc.desc    Verify that concat() doesn't call toString on objects
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeConcatTest6700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr1: (number | ObjWithToString)[] = [1, 2];
      const obj = new ObjWithToString();
      const result = arr1.concat(obj);
      expect(result).not().assertNull();
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(obj);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeConcatTest6800
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_CONCAT_TEST_6800
     * @tc.desc    Verify that concat() doesn't convert array to string
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeConcatTest6800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr1 = [1, 2];
      const arr2 = [3, 4];
      const result = arr1.concat(arr2);
      expect(result).not().assertNull();
      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
      expect(result[3]).assertEqual(4);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeConcatTest6900
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_CONCAT_TEST_6900
     * @tc.desc    Verify that concat() doesn't call toJSON on objects
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeConcatTest6900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr1: (number | ObjWithToJSON)[] = [1, 2];
      const obj = new ObjWithToJSON();
      const result = arr1.concat(obj);
      expect(result).not().assertNull();
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(obj);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeConcatTest7000
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_CONCAT_TEST_7000
     * @tc.desc    Verify that concat() handles Date objects
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeConcatTest7000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr1: (number | Date)[] = [1, 2];
      const date1 = new Date('2024-01-01');
      const date2 = new Date('2024-12-31');
      const arr2: Date[] = [date1, date2];
      const result = arr1.concat(arr2);
      expect(result).not().assertNull();
      expect(Array.isArray(result)).assertTrue();
      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(date1);
      expect(result[3]).assertEqual(date2);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeConcatTest7100
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_CONCAT_TEST_7100
     * @tc.desc    Verify that concat() handles RegExp objects
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeConcatTest7100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr1: (number | RegExp)[] = [1, 2];
      const regex1 = new RegExp('abc');
      const regex2 = new RegExp('def', 'gi');
      const arr2: RegExp[] = [regex1, regex2];
      const result = arr1.concat(arr2);
      expect(result).not().assertNull();
      expect(Array.isArray(result)).assertTrue();
      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(regex1);
      expect(result[3]).assertEqual(regex2);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeConcatTest7200
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_CONCAT_TEST_7200
     * @tc.desc    Verify that concat() handles Number.MAX_VALUE
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeConcatTest7200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr1: number[] = [Number.MAX_VALUE];
      const arr2: number[] = [1];
      const result = arr1.concat(arr2);
      expect(result).not().assertNull();
      expect(Array.isArray(result)).assertTrue();
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(Number.MAX_VALUE);
      expect(result[1]).assertEqual(1);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeConcatTest7300
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_CONCAT_TEST_7300
     * @tc.desc    Verify that concat() handles Number.MIN_VALUE
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeConcatTest7300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr1: number[] = [Number.MIN_VALUE];
      const arr2: number[] = [1];
      const result = arr1.concat(arr2);
      expect(result).not().assertNull();
      expect(Array.isArray(result)).assertTrue();
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(Number.MIN_VALUE);
      expect(result[1]).assertEqual(1);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeConcatTest7400
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_CONCAT_TEST_7400
     * @tc.desc    Verify that concat() handles positive and negative zero
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeConcatTest7400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr1: number[] = [+0];
      const arr2: number[] = [-0];
      const result = arr1.concat(arr2);
      expect(result).not().assertNull();
      expect(Array.isArray(result)).assertTrue();
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(-0);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeConcatTest7500
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_CONCAT_TEST_7500
     * @tc.desc    Verify that concat() with multiple empty arrays
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeConcatTest7500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr1: number[] = [];
      const arr2: number[] = [];
      const arr3: number[] = [];
      const result = arr1.concat(arr2, arr3);
      expect(result).not().assertNull();
      expect(Array.isArray(result)).assertTrue();
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeConcatTest7600
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_CONCAT_TEST_7600
     * @tc.desc    Verify that concat() handles nested object references
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeConcatTest7600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const obj = { nested: { value: 1 } as NestedObj } as TestObj;
      const arr1: TestObj[] = [obj];
      const result = arr1.concat();
      obj.nested.value = 2;
      expect(result).not().assertNull();
      expect(Array.isArray(result)).assertTrue();
      expect(result.length).assertEqual(1);
      expect(result[0]).not().assertNull();
      expect(result[0].nested.value).assertEqual(2);
    });

  });
}