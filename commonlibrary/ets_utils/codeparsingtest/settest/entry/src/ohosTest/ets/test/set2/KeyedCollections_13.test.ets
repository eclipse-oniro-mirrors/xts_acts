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


export default function keyedCollections_13Test() {
  describe('keyedCollections_13Test', () => {
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
     * @tc.number SUB_BASEDATA_SET_ARRAY_ADD_0100
     * @tc.name testSetArrayAdd0001
     * @tc.desc Verify array addition in Set.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testSetArrayAdd0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testSetArrayAdd0001 start');
      const set51 = new Set<number[]>();
      const arr51: number[] = [1, 2, 3];
      set51.add(arr51);
      const result51 = set51.has(arr51);
      console.log("51. Set-Array value added successfully: " + result51);
      expect(result51).assertTrue();
      done();
      console.log('testSetArrayAdd0001 done');
    });

    /**
     * @tc.number SUB_BASEDATA_SET_ARRAY_HAS_0100
     * @tc.name testSetArrayHas0001
     * @tc.desc Verify array existence check in Set.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testSetArrayHas0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testSetArrayHas0001 start');
      const set52 = new Set<string[]>();
      const arr52: string[] = ["a", "b"];
      set52.add(arr52);
      const result52 = set52.has(arr52);
      console.log("52. Set-Array value exists: " + result52);
      expect(result52).assertTrue();
      done();
      console.log('testSetArrayHas0001 done');
    });

    /**
     * @tc.number SUB_BASEDATA_SET_ARRAY_DELETE_SUCCESS_0100
     * @tc.name testSetArrayDeleteSuccess0001
     * @tc.desc Verify array deletion success in Set.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testSetArrayDeleteSuccess0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testSetArrayDeleteSuccess0001 start');
      const set53 = new Set<boolean[]>();
      const arr53: boolean[] = [true, false];
      set53.add(arr53);
      const result53 = set53.delete(arr53);
      console.log("53. Set-Array value deleted successfully: " + result53);
      expect(result53).assertTrue();
      done();
      console.log('testSetArrayDeleteSuccess0001 done');
    });

    /**
     * @tc.number SUB_BASEDATA_SET_ARRAY_DELETE_NOT_EXIST_0100
     * @tc.name testSetArrayDeleteNotExist0001
     * @tc.desc Verify array deletion non-existence in Set.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testSetArrayDeleteNotExist0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testSetArrayDeleteNotExist0001 start');
      const set54 = new Set<(null | undefined)[]>();
      const arr54: (null | undefined)[] = [null, undefined];
      set54.add(arr54);
      set54.delete(arr54);
      const result54 = !set54.has(arr54);
      console.log("54. Set-Array value does not exist after deletion: " + result54);
      expect(result54).assertTrue();
      done();
      console.log('testSetArrayDeleteNotExist0001 done');
    });

    /**
     * @tc.number SUB_BASEDATA_SET_ARRAY_MODIFY_AFTER_ADD_0100
     * @tc.name testSetArrayModifyAfterAdd0001
     * @tc.desc Verify array modification after addition in Set.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testSetArrayModifyAfterAdd0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testSetArrayModifyAfterAdd0001 start');
      const set55 = new Set<number[]>();
      const arr55: number[] = [10, 20];
      set55.add(arr55);
      arr55.push(30);
      const result55 = set55.has(arr55);
      console.log("55. Set-Array value exists after modification: " + result55);
      expect(result55).assertTrue();
      done();
      console.log('testSetArrayModifyAfterAdd0001 done');
    });

    /**
     * @tc.number SUB_BASEDATA_SET_ARRAY_SAME_CONTENT_DIFFERENT_0100
     * @tc.name testSetArraySameContentDifferent0001
     * @tc.desc Verify different array instances with same content in Set.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testSetArraySameContentDifferent0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testSetArraySameContentDifferent0001 start');
      const set56 = new Set<number[]>();
      const arr56a: number[] = [1, 2];
      const arr56b: number[] = [1, 2];
      set56.add(arr56a);
      set56.add(arr56b);
      const result56 = set56.size === 2;
      console.log("56. Set-Different array instances with same content: " + result56);
      expect(result56).assertTrue();
      done();
      console.log('testSetArraySameContentDifferent0001 done');
    });

    /**
     * @tc.number SUB_BASEDATA_SET_ARRAY_DELETE_DIFFERENT_INSTANCE_0100
     * @tc.name testSetArrayDeleteDifferentInstance0001
     * @tc.desc Verify deletion of different array instance in Set.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testSetArrayDeleteDifferentInstance0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testSetArrayDeleteDifferentInstance0001 start');
      const set57 = new Set<number[]>();
      const arr57a: number[] = [3, 4];
      const arr57b: number[] = [3, 4];
      set57.add(arr57a);
      const result57 = !set57.delete(arr57b);
      console.log("57. Set-Cannot delete different array instance: " + result57);
      expect(result57).assertTrue();
      done();
      console.log('testSetArrayDeleteDifferentInstance0001 done');
    });

    /**
     * @tc.number SUB_BASEDATA_SET_ARRAY_EMPTY_0100
     * @tc.name testSetArrayEmpty0001
     * @tc.desc Verify empty array addition in Set.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testSetArrayEmpty0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testSetArrayEmpty0001 start');
      const set58 = new Set<number[]>();
      const arr58: number[] = [];
      set58.add(arr58);
      const result58 = set58.has(arr58);
      console.log("58. Set-Empty array added successfully: " + result58);
      expect(result58).assertTrue();
      done();
      console.log('testSetArrayEmpty0001 done');
    });

    /**
     * @tc.number SUB_BASEDATA_SET_ARRAY_NESTED_0100
     * @tc.name testSetArrayNested0001
     * @tc.desc Verify nested array addition in Set.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testSetArrayNested0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testSetArrayNested0001 start');
      const set59 = new Set<Array<number | number[]>>();
      const nestedArr: Array<number | number[]> = [1, [2, 3], 4];
      set59.add(nestedArr);
      const result59 = set59.has(nestedArr);
      console.log("59. Set-Nested array added successfully: " + result59);
      expect(result59).assertTrue();
      done();
      console.log('testSetArrayNested0001 done');
    });

    /**
     * @tc.number SUB_BASEDATA_SET_ARRAY_DELETE_NOT_ADDED_0100
     * @tc.name testSetArrayDeleteNotAdded0001
     * @tc.desc Verify deletion of not added array in Set.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testSetArrayDeleteNotAdded0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testSetArrayDeleteNotAdded0001 start');
      const set60 = new Set<number[]>();
      const arr60: number[] = [5, 6];
      const result60 = !set60.delete(arr60);
      console.log("60. Set-Cannot delete not added array: " + result60);
      expect(result60).assertTrue();
      done();
      console.log('testSetArrayDeleteNotAdded0001 done');
    });

    /**
     * @tc.number SUB_BASEDATA_SET_FUNCTION_ADD_0100
     * @tc.name testSetFunctionAdd0001
     * @tc.desc Verify function addition in Set.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testSetFunctionAdd0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testSetFunctionAdd0001 start');
      const set61 = new Set<() => string>();
      const func61 = (): string => "hello";
      set61.add(func61);
      const result61 = set61.has(func61);
      console.log("61. Set-Function added successfully: " + result61);
      expect(result61).assertTrue();
      done();
      console.log('testSetFunctionAdd0001 done');
    });

    /**
     * @tc.number SUB_BASEDATA_SET_FUNCTION_HAS_0100
     * @tc.name testSetFunctionHas0001
     * @tc.desc Verify function existence check in Set.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testSetFunctionHas0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testSetFunctionHas0001 start');
      const set62 = new Set<() => string>();

      // Fix: Move function definition outside
      const func62 = (): string => "world";

      set62.add(func62);
      const result62 = set62.has(func62);
      console.log("62. Set-Function exists: " + result62);
      expect(result62).assertTrue();
      done();
      console.log('testSetFunctionHas0001 done');
    });

    /**
     * @tc.number SUB_BASEDATA_SET_FUNCTION_DELETE_SUCCESS_0100
     * @tc.name testSetFunctionDeleteSuccess0001
     * @tc.desc Verify function deletion success in Set.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testSetFunctionDeleteSuccess0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testSetFunctionDeleteSuccess0001 start');
      const set63 = new Set<() => string>();

      // Fix: Use arrow function instead of function expression
      const func63 = (): string => "delete";

      set63.add(func63);
      const result63 = set63.delete(func63);
      console.log("63. Set-Function deleted successfully: " + result63);
      expect(result63).assertTrue();
      done();
      console.log('testSetFunctionDeleteSuccess0001 done');
    });

    /**
     * @tc.number SUB_BASEDATA_SET_FUNCTION_DELETE_NOT_EXIST_0100
     * @tc.name testSetFunctionDeleteNotExist0001
     * @tc.desc Verify function deletion non-existence in Set.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testSetFunctionDeleteNotExist0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testSetFunctionDeleteNotExist0001 start');
      const set64 = new Set<() => string>();
      const func64 = (): string => "removed";
      set64.add(func64);
      set64.delete(func64);
      const result64 = !set64.has(func64);
      console.log("64. Set-Function does not exist after deletion: " + result64);
      expect(result64).assertTrue();
      done();
      console.log('testSetFunctionDeleteNotExist0001 done');
    });

    /**
     * @tc.number SUB_BASEDATA_SET_FUNCTION_MODIFY_AFTER_ADD_0100
     * @tc.name testSetFunctionModifyAfterAdd0001
     * @tc.desc Verify function modification after addition in Set.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testSetFunctionModifyAfterAdd0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testSetFunctionModifyAfterAdd0001 start');
      const set65 = new Set<() => string>();
      const func65 = (): string => "original";
      set65.add(func65);

      // Fix: Use explicit type declaration instead of any
      interface ExtendedFunction extends Function {
        newProp?: string;
      }
      (func65 as ExtendedFunction).newProp = "modified";

      const result65 = set65.has(func65);
      console.log("65. Set-Function exists after modification: " + result65);
      expect(result65).assertTrue();
      done();
      console.log('testSetFunctionModifyAfterAdd0001 done');
    });

    /**
     * @tc.number SUB_BASEDATA_SET_FUNCTION_SAME_CONTENT_DIFFERENT_0100
     * @tc.name testSetFunctionSameContentDifferent0001
     * @tc.desc Verify different function instances with same content in Set.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testSetFunctionSameContentDifferent0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testSetFunctionSameContentDifferent0001 start');
      const set66 = new Set<() => string>();
      const func66a = (): string => "same";
      const func66b = (): string => "same";
      set66.add(func66a);
      set66.add(func66b);
      const result66 = set66.size === 2;
      console.log("66. Set-Different function instances with same content: " + result66);
      expect(result66).assertTrue();
      done();
      console.log('testSetFunctionSameContentDifferent0001 done');
    });

    /**
     * @tc.number SUB_BASEDATA_SET_FUNCTION_DELETE_DIFFERENT_INSTANCE_0100
     * @tc.name testSetFunctionDeleteDifferentInstance0001
     * @tc.desc Verify deletion of different function instance in Set.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testSetFunctionDeleteDifferentInstance0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testSetFunctionDeleteDifferentInstance0001 start');
      const set67 = new Set<() => string>();
      const func67a = (): string => "test";
      const func67b = (): string => "test";
      set67.add(func67a);
      const result67 = !set67.delete(func67b);
      console.log("67. Set-Cannot delete different function instance: " + result67);
      expect(result67).assertTrue();
      done();
      console.log('testSetFunctionDeleteDifferentInstance0001 done');
    });

    /**
     * @tc.number SUB_BASEDATA_SET_FUNCTION_ARROW_NORMAL_0100
     * @tc.name testSetFunctionArrowNormal0001
     * @tc.desc Verify arrow and normal function addition in Set.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testSetFunctionArrowNormal0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testSetFunctionArrowNormal0001 start');
      const set68 = new Set<() => string>();
      const arrowFunc = (): string => "arrow";

      // Fix: Move function definition outside or use arrow function
      const normalFunc = (): string => "normal";

      set68.add(arrowFunc);
      set68.add(normalFunc);
      const result68 = set68.size === 2;
      console.log("68. Set-Both arrow and normal functions added: " + result68);
      expect(result68).assertTrue();
      done();
      console.log('testSetFunctionArrowNormal0001 done');
    });

    /**
     * @tc.number SUB_BASEDATA_SET_FUNCTION_ANONYMOUS_0100
     * @tc.name testSetFunctionAnonymous0001
     * @tc.desc Verify anonymous function addition in Set.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testSetFunctionAnonymous0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testSetFunctionAnonymous0001 start');
      const set69 = new Set<() => void>();

      // Fix: Use arrow function instead of function expression
      const func69 = (): void => {};

      set69.add(func69);
      const result69 = set69.has(func69);
      console.log("69. Set-Anonymous function added successfully: " + result69);
      expect(result69).assertTrue();
      done();
      console.log('testSetFunctionAnonymous0001 done');
    });

    /**
     * @tc.number SUB_BASEDATA_SET_FUNCTION_DELETE_NOT_ADDED_0100
     * @tc.name testSetFunctionDeleteNotAdded0001
     * @tc.desc Verify deletion of not added function in Set.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testSetFunctionDeleteNotAdded0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testSetFunctionDeleteNotAdded0001 start');
      const set70 = new Set<() => string>();
      const func70 = (): string => "notadded";
      const result70 = !set70.delete(func70);
      console.log("70. Set-Cannot delete not added function: " + result70);
      expect(result70).assertTrue();
      done();
      console.log('testSetFunctionDeleteNotAdded0001 done');
    });

    /**
     * @tc.number SUB_BASEDATA_SET_NULL_ADD_0100
     * @tc.name testSetNullAdd0001
     * @tc.desc Verify null addition in Set.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testSetNullAdd0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testSetNullAdd0001 start');
      const set71 = new Set<null>();
      set71.add(null);
      const result71 = set71.has(null);
      console.log("71. Set-Null value added successfully: " + result71);
      expect(result71).assertTrue();
      done();
      console.log('testSetNullAdd0001 done');
    });

    /**
     * @tc.number SUB_BASEDATA_SET_NULL_DELETE_0100
     * @tc.name testSetNullDelete0001
     * @tc.desc Verify null deletion in Set.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testSetNullDelete0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testSetNullDelete0001 start');
      const set72 = new Set<null>();
      set72.add(null);
      const result72 = set72.delete(null);
      console.log("72. Set-Null value deleted successfully: " + result72);
      expect(result72).assertTrue();
      done();
      console.log('testSetNullDelete0001 done');
    });

    /**
     * @tc.number SUB_BASEDATA_SET_NULL_DELETE_NOT_EXIST_0100
     * @tc.name testSetNullDeleteNotExist0001
     * @tc.desc Verify null deletion non-existence in Set.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testSetNullDeleteNotExist0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testSetNullDeleteNotExist0001 start');
      const set73 = new Set<null>();
      set73.add(null);
      set73.delete(null);
      const result73 = !set73.has(null);
      console.log("73. Set-Null value does not exist after deletion: " + result73);
      expect(result73).assertTrue();
      done();
      console.log('testSetNullDeleteNotExist0001 done');
    });

    /**
     * @tc.number SUB_BASEDATA_SET_NULL_DUPLICATE_ADD_0100
     * @tc.name testSetNullDuplicateAdd0001
     * @tc.desc Verify duplicate null addition in Set.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testSetNullDuplicateAdd0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testSetNullDuplicateAdd0001 start');
      const set74 = new Set<null>();
      set74.add(null);
      set74.add(null);
      const result74 = set74.size === 1;
      console.log("74. Set-Duplicate null values deduplicated: " + result74);
      expect(result74).assertTrue();
      done();
      console.log('testSetNullDuplicateAdd0001 done');
    });

    /**
     * @tc.number SUB_BASEDATA_SET_UNDEFINED_ADD_0100
     * @tc.name testSetUndefinedAdd0001
     * @tc.desc Verify undefined addition in Set.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testSetUndefinedAdd0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testSetUndefinedAdd0001 start');
      const set75 = new Set<undefined>();
      set75.add(undefined);
      const result75 = set75.has(undefined);
      console.log("75. Set-Undefined value added successfully: " + result75);
      expect(result75).assertTrue();
      done();
      console.log('testSetUndefinedAdd0001 done');
    });

    /**
     * @tc.number SUB_BASEDATA_SET_UNDEFINED_DELETE_0100
     * @tc.name testSetUndefinedDelete0001
     * @tc.desc Verify undefined deletion in Set.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testSetUndefinedDelete0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testSetUndefinedDelete0001 start');
      const set76 = new Set<undefined>();
      set76.add(undefined);
      const result76 = set76.delete(undefined);
      console.log("76. Set-Undefined value deleted successfully: " + result76);
      expect(result76).assertTrue();
      done();
      console.log('testSetUndefinedDelete0001 done');
    });

    /**
     * @tc.number SUB_BASEDATA_SET_UNDEFINED_DELETE_NOT_EXIST_0100
     * @tc.name testSetUndefinedDeleteNotExist0001
     * @tc.desc Verify undefined deletion non-existence in Set.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testSetUndefinedDeleteNotExist0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testSetUndefinedDeleteNotExist0001 start');
      const set77 = new Set<undefined>();
      set77.add(undefined);
      set77.delete(undefined);
      const result77 = !set77.has(undefined);
      console.log("77. Set-Undefined value does not exist after deletion: " + result77);
      expect(result77).assertTrue();
      done();
      console.log('testSetUndefinedDeleteNotExist0001 done');
    });

    /**
     * @tc.number SUB_BASEDATA_SET_UNDEFINED_DUPLICATE_ADD_0100
     * @tc.name testSetUndefinedDuplicateAdd0001
     * @tc.desc Verify duplicate undefined addition in Set.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testSetUndefinedDuplicateAdd0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testSetUndefinedDuplicateAdd0001 start');
      const set78 = new Set<undefined>();
      set78.add(undefined);
      set78.add(undefined);
      const result78 = set78.size === 1;
      console.log("78. Set-Duplicate undefined values deduplicated: " + result78);
      expect(result78).assertTrue();
      done();
      console.log('testSetUndefinedDuplicateAdd0001 done');
    });

    /**
     * @tc.number SUB_BASEDATA_SET_NULL_UNDEFINED_BOTH_0100
     * @tc.name testSetNullUndefinedBoth0001
     * @tc.desc Verify both null and undefined addition in Set.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testSetNullUndefinedBoth0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testSetNullUndefinedBoth0001 start');
      const set79 = new Set<null | undefined>();
      set79.add(null);
      set79.add(undefined);
      const result79 = set79.size === 2;
      console.log("79. Set-Both null and undefined values added: " + result79);
      expect(result79).assertTrue();
      done();
      console.log('testSetNullUndefinedBoth0001 done');
    });

    /**
     * @tc.number SUB_BASEDATA_SET_DELETE_NOT_ADDED_NULL_0100
     * @tc.name testSetDeleteNotAddedNull0001
     * @tc.desc Verify deletion of not added null in Set.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testSetDeleteNotAddedNull0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testSetDeleteNotAddedNull0001 start');
      const set80 = new Set<null | undefined>();
      set80.add(undefined);
      const result80 = !set80.delete(null);
      console.log("80. Set-Cannot delete not added null: " + result80);
      expect(result80).assertTrue();
      done();
      console.log('testSetDeleteNotAddedNull0001 done');
    });
  })
}
