/*
* Copyright (c) 2025 SwanLink (Jiangsu) Technology Development Co., LTD.
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

// 定义对象接口类型
interface TestObject {
  id?: number;
  name?: string;
  data?: string;
  key?: string;
  prop?: string;
  a?: number;
  b?: number;
  unused?: string;
  new?: string;
  x?: number;
  y?: number;
}

// 定义数组类型
type TestArray = Array<number | string | boolean | null | undefined>;

// 定义函数接口类型
interface TestFunction extends Function {
  prop?: string;
}

//定义对象类型
class MockSymbol {
  description: string;  // 1. 先在类中声明字段

  constructor(description: string) {  // 2. 构造函数参数不加修饰符
    this.description = description;  // 3. 在构造函数体内赋值
  }
}



export default function keyedCollections_12Test() {
  describe('keyedCollections_12Test', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
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
     * @tc.number SUB_BASEDATA_SET_NUMBER_DEDUP_0100
     * @tc.name testSetNumberDeduplication0001
     * @tc.desc Verify number deduplication in Set.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testSetNumberDeduplication0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testSetNumberDeduplication0001 start');
      const set1 = new Set<number>([1, 2, 2, 3]);
      const result1 = set1.size === 3;
      console.log("1. Set-Numbers deduplicated to size 3: " + result1);
      expect(result1).assertTrue();
      done();
      console.log('testSetNumberDeduplication0001 done');
    });

    /**
     * @tc.number SUB_BASEDATA_ARRAY_NUMBER_DEDUP_0100
     * @tc.name testArrayNumberDeduplication0001
     * @tc.desc Verify manual number deduplication in Array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testArrayNumberDeduplication0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testArrayNumberDeduplication0001 start');
      const arr2: number[] = [1, 2, 2, 3];

      // Fix: Use Array.from() instead of spread operator
      const uniqueArr2 = Array.from(new Set(arr2));

      const result2 = uniqueArr2.length === 3;
      console.log("2. Array-Manually deduplicated to length 3: " + result2);
      expect(result2).assertTrue();
      done();
      console.log('testArrayNumberDeduplication0001 done');
    });

    /**
     * @tc.number SUB_BASEDATA_SET_STRING_DEDUP_0100
     * @tc.name testSetStringDeduplication0001
     * @tc.desc Verify string deduplication in Set.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testSetStringDeduplication0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testSetStringDeduplication0001 start');
      const set3 = new Set<string>(["a", "a", "b"]);
      const result3 = set3.size === 2;
      console.log("3. Set-Strings deduplicated to size 2: " + result3);
      expect(result3).assertTrue();
      done();
      console.log('testSetStringDeduplication0001 done');
    });

    /**
     * @tc.number SUB_BASEDATA_ARRAY_STRING_DUPLICATE_0100
     * @tc.name testArrayStringDuplicate0001
     * @tc.desc Verify string duplicates remain in Array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testArrayStringDuplicate0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testArrayStringDuplicate0001 start');
      const arr4: string[] = ["a", "a", "b"];
      const result4 = arr4.length === 3;
      console.log("4. Array-Strings contain duplicates: " + result4);
      expect(result4).assertTrue();
      done();
      console.log('testArrayStringDuplicate0001 done');
    });

    /**
     * @tc.number SUB_BASEDATA_SET_OBJECT_REF_0100
     * @tc.name testSetObjectReference0001
     * @tc.desc Verify different object instances are not deduplicated in Set.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testSetObjectReference0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testSetObjectReference0001 start');
      interface TestObject { id: number }
      const obj5a: TestObject = { id: 1 };
      const obj5b: TestObject = { id: 1 };
      const set5 = new Set<TestObject>([obj5a, obj5b]);
      const result5 = set5.size === 2;
      console.log("5. Set-Different object instances not deduplicated: " + result5);
      expect(result5).assertTrue();
      done();
      console.log('testSetObjectReference0001 done');
    });

    /**
     * @tc.number SUB_BASEDATA_ARRAY_OBJECT_REF_0100
     * @tc.name testArrayObjectReference0001
     * @tc.desc Verify different object instances remain after array filtering.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testArrayObjectReference0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testArrayObjectReference0001 start');
      interface TestObject { id: number }
      const obj6a: TestObject = { id: 1 };
      const obj6b: TestObject = { id: 1 };
      const arr6: TestObject[] = [obj6a, obj6b];
      const uniqueArr6 = arr6.filter((v, i, a) => a.indexOf(v) === i);
      const result6 = uniqueArr6.length === 2;
      console.log("6. Array-Different object instances remain after filtering: " + result6);
      expect(result6).assertTrue();
      done();
      console.log('testArrayObjectReference0001 done');
    });

    /**
     * @tc.number SUB_BASEDATA_SET_SAME_OBJECT_REF_0100
     * @tc.name testSetSameObjectReference0001
     * @tc.desc Verify same object references are deduplicated in Set.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testSetSameObjectReference0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testSetSameObjectReference0001 start');
      interface TestObject { id: number }
      const obj7: TestObject = { id: 1 };
      const set7 = new Set<TestObject>([obj7, obj7]);
      const result7 = set7.size === 1;
      console.log("7. Set-Same object references are deduplicated: " + result7);
      expect(result7).assertTrue();
      done();
      console.log('testSetSameObjectReference0001 done');
    });

    /**
     * @tc.number SUB_BASEDATA_ARRAY_SAME_OBJECT_REF_0100
     * @tc.name testArraySameObjectReference0001
     * @tc.desc Verify same object references remain duplicates in Array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testArraySameObjectReference0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testArraySameObjectReference0001 start');
      interface TestObject { id: number }
      const obj8: TestObject = { id: 1 };
      const arr8: TestObject[] = [obj8, obj8];
      const result8 = arr8.length === 2;
      console.log("8. Array-Same object references remain duplicates: " + result8);
      expect(result8).assertTrue();
      done();
      console.log('testArraySameObjectReference0001 done');
    });

    /**
     * @tc.number SUB_BASEDATA_SET_MIXED_TYPE_DEDUP_0100
     * @tc.name testSetMixedTypeDeduplication0001
     * @tc.desc Verify mixed type deduplication in Set.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testSetMixedTypeDeduplication0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log("testSetMixedTypeDeduplication0001 start");

      // Fix: Use explicit union type instead of any
      const set9 = new Set<number | string | boolean>([1, "1", 1, true, true]);

      const result9 = set9.size === 3;
      console.log("9. Set-Mixed types deduplicated to size 3: " + result9);
      expect(result9).assertTrue();
      done();
      console.log("testSetMixedTypeDeduplication0001 done");
    });

    /**
     * @tc.number SUB_BASEDATA_ARRAY_MIXED_TYPE_DUPLICATE_0100
     * @tc.name testArrayMixedTypeDuplicate0001
     * @tc.desc Verify mixed type duplicates remain in Array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testArrayMixedTypeDuplicate0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testArrayMixedTypeDuplicate0001 start');

      // Fix: Use explicit union type instead of any
      const arr10: (number | string | boolean)[] = [1, "1", 1, true, true];

      const result10 = arr10.length === 5;
      console.log("10. Array-Mixed types contain duplicates: " + result10);
      expect(result10).assertTrue();
      done();
      console.log('testArrayMixedTypeDuplicate0001 done');
    });

    /**
     * @tc.number SUB_BASEDATA_SET_DUPLICATE_SIZE_0100
     * @tc.name testSetDuplicateSize0001
     * @tc.desc Verify that adding duplicates doesn't change Set size.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testSetDuplicateSize0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testSetDuplicateSize0001 start');
      const set11 = new Set<string>();
      set11.add("test");
      set11.add("test");
      const result11 = set11.size === 1;
      console.log("11. Set-Adding duplicates doesn't change size: " + result11);
      expect(result11).assertTrue();
      done();
      console.log('testSetDuplicateSize0001 done');
    });

    /**
     * @tc.number SUB_BASEDATA_ARRAY_DUPLICATE_LENGTH_0100
     * @tc.name testArrayDuplicateLength0001
     * @tc.desc Verify that adding duplicates increases Array length.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testArrayDuplicateLength0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testArrayDuplicateLength0001 start');
      const arr12: string[] = [];
      arr12.push("test");
      arr12.push("test");
      const result12 = arr12.length === 2;
      console.log("12. Array-Adding duplicates increases length: " + result12);
      expect(result12).assertTrue();
      done();
      console.log('testArrayDuplicateLength0001 done');
    });

    /**
     * @tc.number SUB_BASEDATA_SET_NAN_DEDUP_0100
     * @tc.name testSetNaNDeduplication0001
     * @tc.desc Verify NaN deduplication in Set.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testSetNaNDeduplication0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testSetNaNDeduplication0001 start');
      const set13 = new Set<number>([NaN, NaN]);
      const result13 = set13.size === 1;
      console.log("13. Set-NaN values are deduplicated: " + result13);
      expect(result13).assertTrue();
      done();
      console.log('testSetNaNDeduplication0001 done');
    });

    /**
     * @tc.number SUB_BASEDATA_ARRAY_NAN_DEDUP_FAIL_0100
     * @tc.name testArrayNaNDeduplicationFail0001
     * @tc.desc Verify NaN deduplication fails in Array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testArrayNaNDeduplicationFail0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testArrayNaNDeduplicationFail0001 start');
      const arr14: number[] = [NaN, NaN];
      const uniqueArr14 = arr14.filter((v, i) => arr14.indexOf(v) === i);
      const result14 = uniqueArr14.length === 2;
      console.log("14. Array-NaN deduplication fails: " + result14);
      expect(result14).assertFalse();
      done();
      console.log('testArrayNaNDeduplicationFail0001 done');
    });

    /**
     * @tc.number SUB_BASEDATA_SET_NULL_UNDEFINED_DEDUP_0100
     * @tc.name testSetNullUndefinedDeduplication0001
     * @tc.desc Verify null and undefined deduplication in Set.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testSetNullUndefinedDeduplication0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testSetNullUndefinedDeduplication0001 start');
      const set15 = new Set<null | undefined>([null, null, undefined, undefined]);
      const result15 = set15.size === 2;
      console.log("15. Set-Null/undefined deduplicated to size 2: " + result15);
      expect(result15).assertTrue();
      done();
      console.log('testSetNullUndefinedDeduplication0001 done');
    });

    /**
     * @tc.number SUB_BASEDATA_ARRAY_NULL_UNDEFINED_DUPLICATE_0100
     * @tc.name testArrayNullUndefinedDuplicate0001
     * @tc.desc Verify null and undefined duplicates remain in Array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testArrayNullUndefinedDuplicate0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testArrayNullUndefinedDuplicate0001 start');
      const arr16: (null | undefined)[] = [null, null, undefined, undefined];
      const result16 = arr16.length === 4;
      console.log("16. Array-Null/undefined contain duplicates: " + result16);
      expect(result16).assertTrue();
      done();
      console.log('testArrayNullUndefinedDuplicate0001 done');
    });

    /**
     * @tc.number SUB_BASEDATA_SET_FUNCTION_DEDUP_0100
     * @tc.name testSetFunctionDeduplication0001
     * @tc.desc Verify function reference deduplication in Set.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testSetFunctionDeduplication0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testSetFunctionDeduplication0001 start');
      const func17 = (): void => {};
      const set17 = new Set<() => void>([func17, func17]);
      const result17 = set17.size === 1;
      console.log("17. Set-Function references are deduplicated: " + result17);
      expect(result17).assertTrue();
      done();
      console.log('testSetFunctionDeduplication0001 done');
    });

    /**
     * @tc.number SUB_BASEDATA_ARRAY_FUNCTION_DUPLICATE_0100
     * @tc.name testArrayFunctionDuplicate0001
     * @tc.desc Verify function reference duplicates remain in Array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testArrayFunctionDuplicate0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testArrayFunctionDuplicate0001 start');
      const func18 = (): void => {};
      const arr18: (() => void)[] = [func18, func18];
      const result18 = arr18.length === 2;
      console.log("18. Array-Function references contain duplicates: " + result18);
      expect(result18).assertTrue();
      done();
      console.log('testArrayFunctionDuplicate0001 done');
    });

    /**
     * @tc.number SUB_BASEDATA_SET_LARGE_ARRAY_DEDUP_0100
     * @tc.name testSetLargeArrayDeduplication0001
     * @tc.desc Verify large array deduplication efficiency in Set.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testSetLargeArrayDeduplication0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testSetLargeArrayDeduplication0001 start');

      // Fix: Create array step by step with explicit typing
      const largeArr19: number[] = new Array(10000);
      largeArr19.fill(0);
      const mappedArr19 = largeArr19.map((_, i) => i % 100);

      const set19 = new Set<number>(mappedArr19);
      const result19 = set19.size === 100;
      console.log("19. Set-Large array deduplicated to size 100: " + result19);
      expect(result19).assertTrue();
      done();
      console.log('testSetLargeArrayDeduplication0001 done');
    });

    /**
     * @tc.number SUB_BASEDATA_ARRAY_LARGE_ARRAY_DEDUP_0100
     * @tc.name testArrayLargeArrayDeduplication0001
     * @tc.desc Verify large array manual deduplication.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testArrayLargeArrayDeduplication0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testArrayLargeArrayDeduplication0001 start');

      // Fix: Create array step by step with explicit typing
      const largeArr20: number[] = new Array(10000);
      largeArr20.fill(0);
      const mappedArr20 = largeArr20.map((_, i) => i % 100);

      const uniqueArr20 = Array.from(new Set(mappedArr20));
      const result20 = uniqueArr20.length === 100;
      console.log("20. Array-Large array manually deduplicated to length 100: " + result20);
      expect(result20).assertTrue();
      done();
      console.log('testArrayLargeArrayDeduplication0001 done');
    });

    /**
     * @tc.number SUB_BASEDATA_SET_DELETE_SUCCESS_0100
     * @tc.name testSetDeleteSuccess0001
     * @tc.desc Verify direct value deletion in Set.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testSetDeleteSuccess0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testSetDeleteSuccess0001 start');
      const set21 = new Set<number>([1, 2, 3]);
      set21.delete(2);
      const result21 = !set21.has(2);
      console.log("21. Set-Value deleted successfully: " + result21);
      expect(result21).assertTrue();
      done();
      console.log('testSetDeleteSuccess0001 done');
    });

    /**
     * @tc.number SUB_BASEDATA_ARRAY_INDEX_DELETE_0100
     * @tc.name testArrayIndexDelete0001
     * @tc.desc Verify index-based deletion in Array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testArrayIndexDelete0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testArrayIndexDelete0001 start');
      const arr22: number[] = [1, 2, 3];
      const index22 = arr22.indexOf(2);
      if (index22 !== -1) arr22.splice(index22, 1);
      const result22 = !arr22.includes(2);
      console.log("22. Array-Value deleted by index successfully: " + result22);
      expect(result22).assertTrue();
      done();
      console.log('testArrayIndexDelete0001 done');
    });

    /**
     * @tc.number SUB_BASEDATA_SET_DELETE_NOT_EXIST_0100
     * @tc.name testSetDeleteNotExist0001
     * @tc.desc Verify deleting non-existent value returns false in Set.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testSetDeleteNotExist0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testSetDeleteNotExist0001 start');
      const set23 = new Set<number>([1, 2]);
      const result23 = !set23.delete(3);
      console.log("23. Set-Deleting non-existent value returns false: " + result23);
      expect(result23).assertTrue();
      done();
      console.log('testSetDeleteNotExist0001 done');
    });

    /**
     * @tc.number SUB_BASEDATA_ARRAY_DELETE_NOT_EXIST_0100
     * @tc.name testArrayDeleteNotExist0001
     * @tc.desc Verify deleting non-existent value has no effect in Array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testArrayDeleteNotExist0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testArrayDeleteNotExist0001 start');
      const arr24: number[] = [1, 2];
      const index24 = arr24.indexOf(3);
      if (index24 !== -1) arr24.splice(index24, 1);
      const result24 = arr24.length === 2;
      console.log("24. Array-Deleting non-existent value has no effect: " + result24);
      expect(result24).assertTrue();
      done();
      console.log('testArrayDeleteNotExist0001 done');
    });

    /**
     * @tc.number SUB_BASEDATA_SET_MULTI_DELETE_0100
     * @tc.name testSetMultiDelete0001
     * @tc.desc Verify multiple consecutive deletions in Set.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testSetMultiDelete0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testSetMultiDelete0001 start');
      const set25 = new Set<number>([1, 2, 3, 4]);
      set25.delete(2);
      set25.delete(3);
      const result25 = set25.size === 2;
      console.log("25. Set-Multiple deletions leave 2 values: " + result25);
      expect(result25).assertTrue();
      done();
      console.log('testSetMultiDelete0001 done');
    });

    /**
     * @tc.number SUB_BASEDATA_ARRAY_MULTI_DELETE_0100
     * @tc.name testArrayMultiDelete0001
     * @tc.desc Verify multiple consecutive deletions in Array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testArrayMultiDelete0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testArrayMultiDelete0001 start');
      const arr26: number[] = [1, 2, 3, 4];
      [2, 3].forEach(val => {
        const index = arr26.indexOf(val);
        if (index !== -1) arr26.splice(index, 1);
      });
      const result26 = arr26.length === 2;
      console.log("26. Array-Multiple deletions leave 2 values: " + result26);
      expect(result26).assertTrue();
      done();
      console.log('testArrayMultiDelete0001 done');
    });

    /**
     * @tc.number SUB_BASEDATA_SET_OBJECT_DELETE_0100
     * @tc.name testSetObjectDelete0001
     * @tc.desc Verify object deletion by reference in Set.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testSetObjectDelete0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testSetObjectDelete0001 start');
      interface TestObject { id: number }
      const obj27: TestObject = { id: 1 };
      const set27 = new Set<TestObject>([obj27]);
      set27.delete(obj27);
      const result27 = !set27.has(obj27);
      console.log("27. Set-Object deleted by reference successfully: " + result27);
      expect(result27).assertTrue();
      done();
      console.log('testSetObjectDelete0001 done');
    });

    /**
     * @tc.number SUB_BASEDATA_ARRAY_OBJECT_DELETE_0100
     * @tc.name testArrayObjectDelete0001
     * @tc.desc Verify object deletion by reference in Array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testArrayObjectDelete0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testArrayObjectDelete0001 start');
      interface TestObject { id: number }
      const obj28: TestObject = { id: 1 };
      const arr28: TestObject[] = [obj28];
      const index28 = arr28.indexOf(obj28);
      if (index28 !== -1) arr28.splice(index28, 1);
      const result28 = arr28.length === 0;
      console.log("28. Array-Object deleted by reference successfully: " + result28);
      expect(result28).assertTrue();
      done();
      console.log('testArrayObjectDelete0001 done');
    });

    /**
     * @tc.number SUB_BASEDATA_SET_CLEAR_0100
     * @tc.name testSetClear0001
     * @tc.desc Verify clear operation in Set.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testSetClear0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testSetClear0001 start');
      const set29 = new Set<number>([1, 2, 3]);
      set29.clear();
      const result29 = set29.size === 0;
      console.log("29. Set-Clear operation successful: " + result29);
      expect(result29).assertTrue();
      done();
      console.log('testSetClear0001 done');
    });

    /**
     * @tc.number SUB_BASEDATA_ARRAY_CLEAR_0100
     * @tc.name testArrayClear0001
     * @tc.desc Verify clear operation in Array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testArrayClear0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testArrayClear0001 start');
      const arr30: number[] = [1, 2, 3];
      arr30.splice(0, arr30.length);
      const result30 = arr30.length === 0;
      console.log("30. Array-Clear operation successful: " + result30);
      expect(result30).assertTrue();
      done();
      console.log('testArrayClear0001 done');
    });

    /**
     * @tc.number SUB_BASEDATA_SET_DELETE_ADD_RECOVERY_0100
     * @tc.name testSetDeleteAddRecovery0001
     * @tc.desc Verify delete and add recovery in Set.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testSetDeleteAddRecovery0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testSetDeleteAddRecovery0001 start');
      const set31 = new Set<number>([1]);
      set31.delete(1);
      set31.add(1);
      const result31 = set31.has(1);
      console.log("31. Set-Value recovered after delete and add: " + result31);
      expect(result31).assertTrue();
      done();
      console.log('testSetDeleteAddRecovery0001 done');
    });

    /**
     * @tc.number SUB_BASEDATA_ARRAY_DELETE_ADD_RECOVERY_0100
     * @tc.name testArrayDeleteAddRecovery0001
     * @tc.desc Verify delete and add recovery in Array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testArrayDeleteAddRecovery0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testArrayDeleteAddRecovery0001 start');
      const arr32: number[] = [1];
      const index32 = arr32.indexOf(1);
      if (index32 !== -1) arr32.splice(index32, 1);
      arr32.push(1);
      const result32 = arr32.includes(1);
      console.log("32. Array-Value recovered after delete and add: " + result32);
      expect(result32).assertTrue();
      done();
      console.log('testArrayDeleteAddRecovery0001 done');
    });

    /**
     * @tc.number SUB_BASEDATA_SET_LARGE_DELETE_PERF_0100
     * @tc.name testSetLargeDeletePerformance0001
     * @tc.desc Verify large Set deletion performance.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testSetLargeDeletePerformance0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testSetLargeDeletePerformance0001 start');

      // Fix: Create array step by step with explicit typing
      const numbers: number[] = [];
      for (let i = 0; i < 10000; i++) {
        numbers.push(i);
      }
      const largeSet35 = new Set<number>(numbers);

      const start35 = Date.now();
      largeSet35.delete(5000);
      const end35 = Date.now();
      const result35 = end35 - start35 < 10;
      console.log("35. Set-Fast deletion in large collection: " + result35);
      expect(result35).assertTrue();
      done();
      console.log('testSetLargeDeletePerformance0001 done');
    });

    /**
     * @tc.number SUB_BASEDATA_SET_NAN_DETECTION_0100
     * @tc.name testSetNaNDetection0001
     * @tc.desc Verify NaN detection in Set.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testSetNaNDetection0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testSetNaNDetection0001 start');
      const set36 = new Set<number>([NaN]);
      const result36 = set36.has(NaN);
      console.log("36. Set-Correctly detects NaN: " + result36);
      expect(result36).assertTrue();
      done();
      console.log('testSetNaNDetection0001 done');
    });

    /**
     * @tc.number SUB_BASEDATA_ARRAY_NAN_DETECTION_FAIL_0100
     * @tc.name testArrayNaNDetectionFail0001
     * @tc.desc Verify NaN detection failure in Array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testArrayNaNDetectionFail0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testArrayNaNDetectionFail0001 start');
      const arr37: number[] = [NaN];
      const result37 = arr37.indexOf(NaN) === -1;
      console.log("37. Array-indexOf fails to detect NaN: " + result37);
      expect(result37).assertTrue();
      done();
      console.log('testArrayNaNDetectionFail0001 done');
    });

    /**
     * @tc.number SUB_BASEDATA_SET_NUMBER_NAN_EQUALITY_0100
     * @tc.name testSetNumberNaNEquality0001
     * @tc.desc Verify Number.NaN and NaN equality in Set.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testSetNumberNaNEquality0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testSetNumberNaNEquality0001 start');
      const set38 = new Set<number>([Number.NaN]);
      const result38 = set38.has(NaN);
      console.log("38. Set-Recognizes Number.NaN and NaN as same value: " + result38);
      expect(result38).assertTrue();
      done();
      console.log('testSetNumberNaNEquality0001 done');
    });

    /**
     * @tc.number SUB_BASEDATA_ARRAY_NUMBER_NAN_INEQUALITY_0100
     * @tc.name testArrayNumberNaNInequality0001
     * @tc.desc Verify Number.NaN and NaN inequality in Array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testArrayNumberNaNInequality0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testArrayNumberNaNInequality0001 start');
      const arr39: number[] = [Number.NaN];
      const result39 = arr39.indexOf(NaN) === -1;
      console.log("39. Array-Cannot recognize Number.NaN and NaN: " + result39);
      expect(result39).assertTrue();
      done();
      console.log('testArrayNumberNaNInequality0001 done');
    });

    /**
     * @tc.number SUB_BASEDATA_SET_MIXED_NAN_DETECTION_0100
     * @tc.name testSetMixedNaNDetection0001
     * @tc.desc Verify NaN detection in mixed values Set.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testSetMixedNaNDetection0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testSetMixedNaNDetection0001 start');
      const set40 = new Set<number | string>([1, NaN, "a"]);
      const result40 = set40.has(NaN);
      console.log("40. Set-Detects NaN in mixed values: " + result40);
      expect(result40).assertTrue();
      done();
      console.log('testSetMixedNaNDetection0001 done');
    });

    /**
     * @tc.number SUB_BASEDATA_ARRAY_MIXED_NAN_DETECT_FAIL_0100
     * @tc.name testArrayMixedNaNDetectFail0001
     * @tc.desc Verify NaN detection failure in mixed Array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testArrayMixedNaNDetectFail0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testArrayMixedNaNDetectFail0001 start');
      const arr41: (number | string)[] = [1, NaN, "a"];
      const result41 = arr41.indexOf(NaN) === -1;
      console.log("41. Array-Cannot detect NaN in mixed values: " + result41);
      expect(result41).assertTrue();
      done();
      console.log('testArrayMixedNaNDetectFail0001 done');
    });

    /**
     * @tc.number SUB_BASEDATA_SET_NAN_DELETE_0100
     * @tc.name testSetNaNDelete0001
     * @tc.desc Verify NaN deletion in Set.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testSetNaNDelete0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testSetNaNDelete0001 start');
      const set42 = new Set<number>([NaN]);
      set42.delete(NaN);
      const result42 = !set42.has(NaN);
      console.log("42. Set-NaN deleted successfully: " + result42);
      expect(result42).assertTrue();
      done();
      console.log('testSetNaNDelete0001 done');
    });

    /**
     * @tc.number SUB_BASEDATA_ARRAY_NAN_DELETE_FAIL_0100
     * @tc.name testArrayNaNDeleteFail0001
     * @tc.desc Verify NaN deletion failure in Array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testArrayNaNDeleteFail0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testArrayNaNDeleteFail0001 start');
      const arr43: number[] = [NaN];
      const index43 = arr43.indexOf(NaN); // Returns -1
      if (index43 !== -1) arr43.splice(index43, 1);
      const result43 = arr43.length === 1;
      console.log("43. Array-Cannot delete NaN: " + result43);
      expect(result43).assertTrue();
      done();
      console.log('testArrayNaNDeleteFail0001 done');
    });

    /**
     * @tc.number SUB_BASEDATA_SET_NULL_DETECTION_0100
     * @tc.name testSetNullDetection0001
     * @tc.desc Verify null detection in Set.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testSetNullDetection0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testSetNullDetection0001 start');
      const set44 = new Set<null>([null]);
      const result44 = set44.has(null);
      console.log("44. Set-Correctly detects null: " + result44);
      expect(result44).assertTrue();
      done();
      console.log('testSetNullDetection0001 done');
    });

    /**
     * @tc.number SUB_BASEDATA_ARRAY_NULL_DETECTION_0100
     * @tc.name testArrayNullDetection0001
     * @tc.desc Verify null detection in Array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testArrayNullDetection0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testArrayNullDetection0001 start');
      const arr45: null[] = [null];
      const result45 = arr45.indexOf(null) === 0;
      console.log("45. Array-indexOf correctly detects null: " + result45);
      expect(result45).assertTrue();
      done();
      console.log('testArrayNullDetection0001 done');
    });

    /**
     * @tc.number SUB_BASEDATA_SET_UNDEFINED_DETECTION_0100
     * @tc.name testSetUndefinedDetection0001
     * @tc.desc Verify undefined detection in Set.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testSetUndefinedDetection0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testSetUndefinedDetection0001 start');
      const set46 = new Set<undefined>([undefined]);
      const result46 = set46.has(undefined);
      console.log("46. Set-Correctly detects undefined: " + result46);
      expect(result46).assertTrue();
      done();
      console.log('testSetUndefinedDetection0001 done');
    });

    /**
     * @tc.number SUB_BASEDATA_ARRAY_UNDEFINED_DETECTION_0100
     * @tc.name testArrayUndefinedDetection0001
     * @tc.desc Verify undefined detection in Array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testArrayUndefinedDetection0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testArrayUndefinedDetection0001 start');
      const arr47: undefined[] = [undefined];
      const result47 = arr47.indexOf(undefined) === 0;
      console.log("47. Array-indexOf correctly detects undefined: " + result47);
      expect(result47).assertTrue();
      done();
      console.log('testArrayUndefinedDetection0001 done');
    });

    /**
     * @tc.number SUB_BASEDATA_SET_ZERO_NEGATIVE_ZERO_0100
     * @tc.name testSetZeroNegativeZero0001
     * @tc.desc Verify 0 and -0 equality in Set.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testSetZeroNegativeZero0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testSetZeroNegativeZero0001 start');
      const set48 = new Set<number>([0, -0]);
      const result48 = set48.size === 1;
      console.log("48. Set-Treats 0 and -0 as same value: " + result48);
      expect(result48).assertTrue();
      done();
      console.log('testSetZeroNegativeZero0001 done');
    });

    /**
     * @tc.number SUB_BASEDATA_ARRAY_ZERO_NEGATIVE_ZERO_0100
     * @tc.name testArrayZeroNegativeZero0001
     * @tc.desc Verify 0 and -0 equality in Array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testArrayZeroNegativeZero0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testArrayZeroNegativeZero0001 start');
      const arr49: number[] = [0, -0];
      const result49 = arr49.indexOf(-0) === 0;
      console.log("49. Array-indexOf treats 0 and -0 as same value: " + result49);
      expect(result49).assertTrue();
      done();
      console.log('testArrayZeroNegativeZero0001 done');
    });
  })
}