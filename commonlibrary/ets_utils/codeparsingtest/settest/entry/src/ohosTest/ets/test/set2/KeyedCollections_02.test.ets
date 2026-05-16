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

interface SymbolLike {
  id: string;
  description?: string;
}
interface BuiltInSymbols {
  iterator: SymbolLike;
}
function createSymbol(description?: string): SymbolLike {
  return {
    id: `symbol_${Date.now()}_${Math.random().toString(36).slice(2, 10)}`,
    description
  };
}
const symbolRegistry = new Map<string, SymbolLike>();
function createSharedSymbol(key: string): SymbolLike {
  if (!symbolRegistry.has(key)) {
    symbolRegistry.set(key, createSymbol(key));
  }
  return symbolRegistry.get(key)!;
}
const builtInSymbols: BuiltInSymbols = {
  iterator: createSymbol("iterator")
};
function getSetValues<T>(set: Set<T>): T[] {
  const values: T[] = [];
  set.forEach(item => values.push(item));
  return values;
}
function arrayContains<T>(array: T[], target: T, comparator: (a: T, b: T) => boolean): boolean {
  return array.some(item => comparator(item, target));
}
export default function keyedCollections_02Test() {
  describe('keyedCollections_02Test', () => {
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
     * @tc.number    SUB_SET_ADD_STRING_0100
     * @tc.name      test_Set_Add_String_0001
     * @tc.desc      Set add string value and verify success
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Set_Add_String_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Set_Add_String_0001 start');
        const set1 = new Set<string>();
        set1.add("hello");
        let result: boolean = set1.has("hello");
        expect(result).assertTrue();
        console.log('test_Set_Add_String_0001 done');
        done();
        console.log('test_Set_Add_String_0001 end');
      });

    /**
     * @tc.number    SUB_SET_HAS_STRING_0200
     * @tc.name      test_Set_Has_String_0002
     * @tc.desc      Set has string value and verify existence
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Set_Has_String_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Set_Has_String_0002 start');
        const set2 = new Set<string>();
        set2.add("world");
        let result: boolean = set2.has("world");
        expect(result).assertTrue();
        console.log('test_Set_Has_String_0002 done');
        done();
        console.log('test_Set_Has_String_0002 end');
      });

    /**
     * @tc.number    SUB_SET_DELETE_STRING_0300
     * @tc.name      test_Set_Delete_String_0003
     * @tc.desc      Set delete string value and verify success
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Set_Delete_String_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Set_Delete_String_0003 start');
        const set3 = new Set<string>();
        set3.add("test");
        let result: boolean = set3.delete("test");
        expect(result).assertTrue();
        console.log('test_Set_Delete_String_0003 done');
        done();
        console.log('test_Set_Delete_String_0003 end');
      });

    /**
     * @tc.number    SUB_SET_DELETE_HAS_STRING_0400
     * @tc.name      test_Set_Delete_Has_String_0004
     * @tc.desc      Set delete string value and verify has returns false
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Set_Delete_Has_String_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Set_Delete_Has_String_0004 start');
        const set4 = new Set<string>();
        set4.add("example");
        set4.delete("example");
        let result: boolean = !set4.has("example");
        expect(result).assertTrue();
        console.log('test_Set_Delete_Has_String_0004 done');
        done();
        console.log('test_Set_Delete_Has_String_0004 end');
      });

    /**
     * @tc.number    SUB_SET_ADD_MULTIPLE_STRINGS_0500
     * @tc.name      test_Set_Add_Multiple_Strings_0005
     * @tc.desc      Set add multiple different string values and verify count
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Set_Add_Multiple_Strings_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Set_Add_Multiple_Strings_0005 start');
        const set5 = new Set<string>();
        set5.add("a").add("b").add("c");
        let result: boolean = set5.size === 3;
        expect(result).assertTrue();
        console.log('test_Set_Add_Multiple_Strings_0005 done');
        done();
        console.log('test_Set_Add_Multiple_Strings_0005 end');
      });

    /**
     * @tc.number    SUB_SET_ADD_SAME_STRING_0600
     * @tc.name      test_Set_Add_Same_String_0006
     * @tc.desc      Set add same string value multiple times and verify size remains unchanged
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Set_Add_Same_String_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Set_Add_Same_String_0006 start');
        const set6 = new Set<string>();
        set6.add("repeat");
        const sizeBefore = set6.size;
        set6.add("repeat");
        let result: boolean = set6.size === sizeBefore;
        expect(result).assertTrue();
        console.log('test_Set_Add_Same_String_0006 done');
        done();
        console.log('test_Set_Add_Same_String_0006 end');
      });

    /**
     * @tc.number    SUB_SET_DELETE_UNADDED_STRING_0700
     * @tc.name      test_Set_Delete_Unadded_String_0007
     * @tc.desc      Set delete unadded string value and verify returns false
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Set_Delete_Unadded_String_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Set_Delete_Unadded_String_0007 start');
        const set7 = new Set<string>();
        const result: boolean = !set7.delete("notadded");
        expect(result).assertTrue();
        console.log('test_Set_Delete_Unadded_String_0007 done');
        done();
        console.log('test_Set_Delete_Unadded_String_0007 end');
      });

    /**
     * @tc.number    SUB_SET_ADD_EMPTY_STRING_0800
     * @tc.name      test_Set_Add_Empty_String_0008
     * @tc.desc      Set add empty string value and verify success
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Set_Add_Empty_String_0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Set_Add_Empty_String_0008 start');
        const set8 = new Set<string>();
        set8.add("");
        let result: boolean = set8.has("");
        expect(result).assertTrue();
        console.log('test_Set_Add_Empty_String_0008 done');
        done();
        console.log('test_Set_Add_Empty_String_0008 end');
      });

    /**
     * @tc.number    SUB_SET_ADD_SPECIAL_CHARS_0900
     * @tc.name      test_Set_Add_Special_Chars_0009
     * @tc.desc      Set add string with special characters and verify success
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Set_Add_Special_Chars_0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Set_Add_Special_Chars_0009 start');
        const set9 = new Set<string>();
        set9.add("!@#$%");
        let result: boolean = set9.has("!@#$%");
        expect(result).assertTrue();
        console.log('test_Set_Add_Special_Chars_0009 done');
        done();
        console.log('test_Set_Add_Special_Chars_0009 end');
      });

    /**
     * @tc.number    SUB_SET_ADD_MODIFY_VAR_1000
     * @tc.name      test_Set_Add_Modify_Var_0010
     * @tc.desc      Set add string value and verify modifying variable does not affect set
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Set_Add_Modify_Var_0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Set_Add_Modify_Var_0010 start');
        const set10 = new Set<string>();
        let str = "original";
        set10.add(str);
        str = "modified";
        let result: boolean = set10.has("original");
        expect(result).assertTrue();
        console.log('test_Set_Add_Modify_Var_0010 done');
        done();
        console.log('test_Set_Add_Modify_Var_0010 end');
      });

    /**
     * @tc.number    SUB_SET_ADD_INTEGER_1100
     * @tc.name      test_Set_Add_Integer_0011
     * @tc.desc      Set add integer value and verify success
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Set_Add_Integer_0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Set_Add_Integer_0011 start');
        const set11 = new Set<number>();
        set11.add(42);
        let result: boolean = set11.has(42);
        expect(result).assertTrue();
        console.log('test_Set_Add_Integer_0011 done');
        done();
        console.log('test_Set_Add_Integer_0011 end');
      });

    /**
     * @tc.number    SUB_SET_ADD_NEGATIVE_NUMBER_1200
     * @tc.name      test_Set_Add_Negative_Number_0012
     * @tc.desc      Set add negative number value and verify success
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Set_Add_Negative_Number_0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Set_Add_Negative_Number_0012 start');
        const set12 = new Set<number>();
        set12.add(-7);
        let result: boolean = set12.has(-7);
        expect(result).assertTrue();
        console.log('test_Set_Add_Negative_Number_0012 done');
        done();
        console.log('test_Set_Add_Negative_Number_0012 end');
      });

    /**
     * @tc.number    SUB_SET_ADD_FLOAT_1300
     * @tc.name      test_Set_Add_Float_0013
     * @tc.desc      Set add float value and verify success
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Set_Add_Float_0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Set_Add_Float_0013 start');
        const set13 = new Set<number>();
        set13.add(3.1415);
        let result: boolean = set13.has(3.1415);
        expect(result).assertTrue();
        console.log('test_Set_Add_Float_0013 done');
        done();
        console.log('test_Set_Add_Float_0013 end');
      });

    /**
     * @tc.number    SUB_SET_DELETE_NUMBER_1400
     * @tc.name      test_Set_Delete_Number_0014
     * @tc.desc      Set delete number value and verify success
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Set_Delete_Number_0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Set_Delete_Number_0014 start');
        const set14 = new Set<number>();
        set14.add(100);
        let result: boolean = set14.delete(100);
        expect(result).assertTrue();
        console.log('test_Set_Delete_Number_0014 done');
        done();
        console.log('test_Set_Delete_Number_0014 end');
      });

    /**
     * @tc.number    SUB_SET_DELETE_HAS_NUMBER_1500
     * @tc.name      test_Set_Delete_Has_Number_0015
     * @tc.desc      Set delete number value and verify has returns false
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Set_Delete_Has_Number_0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Set_Delete_Has_Number_0015 start');
        const set15 = new Set<number>();
        set15.add(999);
        set15.delete(999);
        let result: boolean = !set15.has(999);
        expect(result).assertTrue();
        console.log('test_Set_Delete_Has_Number_0015 done');
        done();
        console.log('test_Set_Delete_Has_Number_0015 end');
      });

    /**
     * @tc.number    SUB_SET_ADD_NAN_1600
     * @tc.name      test_Set_Add_NaN_0016
     * @tc.desc      Set add NaN value and verify success
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Set_Add_NaN_0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Set_Add_NaN_0016 start');
        const set16 = new Set<number>();
        set16.add(NaN);
        let result: boolean =  set16.has(Number.NaN);
        expect(result).assertTrue();
        console.log('test_Set_Add_NaN_0016 done');
        done();
        console.log('test_Set_Add_NaN_0016 end');
      });

    /**
     * @tc.number    SUB_SET_ADD_POSITIVE_NEGATIVE_ZERO_1700
     * @tc.name      test_Set_Add_Positive_Negative_Zero_0017
     * @tc.desc      Set add +0 and -0 and verify size is 1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Set_Add_Positive_Negative_Zero_0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Set_Add_Positive_Negative_Zero_0017 start');
        const set17 = new Set<number>();
        set17.add(+0);
        set17.add(-0);
        let result: boolean = set17.size === 1;
        expect(result).assertTrue();
        console.log('test_Set_Add_Positive_Negative_Zero_0017 done');
        done();
        console.log('test_Set_Add_Positive_Negative_Zero_0017 end');
      });

    /**
     * @tc.number    SUB_SET_ADD_NAN_TWICE_1800
     * @tc.name      test_Set_Add_NaN_Twice_0018
     * @tc.desc      Set add NaN multiple times and verify size remains 1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Set_Add_NaN_Twice_0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Set_Add_NaN_Twice_0018 start');
        const set18 = new Set<number>();
        set18.add(NaN);
        set18.add(NaN);
        let result: boolean = set18.size === 1;
        expect(result).assertTrue();
        console.log('test_Set_Add_NaN_Twice_0018 done');
        done();
        console.log('test_Set_Add_NaN_Twice_0018 end');
      });

    /**
     * @tc.number    SUB_SET_DELETE_UNADDED_NUMBER_1900
     * @tc.name      test_Set_Delete_Unadded_Number_0019
     * @tc.desc      Set delete unadded number value and verify returns false
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Set_Delete_Unadded_Number_0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Set_Delete_Unadded_Number_0019 start');
        const set19 = new Set<number>();
        const result: boolean = !set19.delete(12345);
        expect(result).assertTrue();
        console.log('test_Set_Delete_Unadded_Number_0019 done');
        done();
        console.log('test_Set_Delete_Unadded_Number_0019 end');
      });

    /**
     * @tc.number    SUB_SET_ADD_BIG_NUMBER_2000
     * @tc.name      test_Set_Add_Big_Number_0020
     * @tc.desc      Set add big number value and verify success
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Set_Add_Big_Number_0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Set_Add_Big_Number_0020 start');
        const set20 = new Set<number>();
        const bigNum = 1e20;
        set20.add(bigNum);
        let result: boolean = set20.has(bigNum);
        expect(result).assertTrue();
        console.log('test_Set_Add_Big_Number_0020 done');
        done();
        console.log('test_Set_Add_Big_Number_0020 end');
      });

    /**
     * @tc.number    SUB_SET_ADD_OBJECT_2100
     * @tc.name      test_Set_Add_Object_0021
     * @tc.desc      Set add plain object and verify success
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Set_Add_Object_0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Set_Add_Object_0021 start');
        interface Person{
          name:string;
        }
        const set21 = new Set<Person>();
        const obj21: Person= { name: "John" };
        set21.add(obj21);
        let result: boolean = set21.has(obj21);
        expect(result).assertTrue();
        console.log('test_Set_Add_Object_0021 done');
        done();
        console.log('test_Set_Add_Object_0021 end');
      });

    /**
     * @tc.number    SUB_SET_HAS_OBJECT_2200
     * @tc.name      test_Set_Has_Object_0022
     * @tc.desc      Set add object and verify has returns true
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Set_Has_Object_0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Set_Has_Object_0022 start');
        interface Person {
          age: number;
        }
        const set22 = new Set<Person>();
        const obj22: Person = { age: 30 };
        set22.add(obj22);
        let result: boolean = set22.has(obj22);
        expect(result).assertTrue();
        console.log('test_Set_Has_Object_0022 done');
        done();
        console.log('test_Set_Has_Object_0022 end');
      });

    /**
     * @tc.number    SUB_SET_DELETE_OBJECT_2300
     * @tc.name      test_Set_Delete_Object_0023
     * @tc.desc      Set delete object and verify success
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Set_Delete_Object_0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Set_Delete_Object_0023 start');
        interface Location {
          city: string;
        }
        const set23 = new Set<Location>();
        const obj23: Location = { city: "New York" };
        set23.add(obj23);
        let result: boolean = set23.delete(obj23);
        expect(result).assertTrue();
        console.log('test_Set_Delete_Object_0023 done');
        done();
        console.log('test_Set_Delete_Object_0023 end');
      });

    /**
     * @tc.number    SUB_SET_DELETE_HAS_OBJECT_2400
     * @tc.name      test_Set_Delete_Has_Object_0024
     * @tc.desc      Set delete object and verify has returns false
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Set_Delete_Has_Object_0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Set_Delete_Has_Object_0024 start');
        interface Country {
          country: string;
        }
        const set24 = new Set<Country>();
        const obj24: Country = { country: "USA" };
        set24.add(obj24);
        set24.delete(obj24);
        let result: boolean = !set24.has(obj24);
        expect(result).assertTrue();
        console.log('test_Set_Delete_Has_Object_0024 done');
        done();
        console.log('test_Set_Delete_Has_Object_0024 end');
      });

    /**
     * @tc.number    SUB_SET_ADD_MODIFY_OBJECT_2500
     * @tc.name      test_Set_Add_Modify_Object_0025
     * @tc.desc      Set add object and verify modifying property does not affect set
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Set_Add_Modify_Object_0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Set_Add_Modify_Object_0025 start');
        interface Item {
          id: number;
        }
        const set25 = new Set<Item>();
        const obj25: Item = { id: 1 };
        set25.add(obj25);
        obj25.id = 2;
        let result: boolean = set25.has(obj25);
        expect(result).assertTrue();
        console.log('test_Set_Add_Modify_Object_0025 done');
        done();
        console.log('test_Set_Add_Modify_Object_0025 end');
      });

    /**
     * @tc.number    SUB_SET_ADD_SAME_CONTENT_DIFFERENT_INSTANCES_2600
     * @tc.name      test_Set_Add_Same_Content_Different_Instances_0026
     * @tc.desc      Set add objects with same content but different instances and verify size is 2
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Set_Add_Same_Content_Different_Instances_0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Set_Add_Same_Content_Different_Instances_0026 start');
        interface TestObject {
          value: string;
        }
        const set26 = new Set<TestObject>();
        const obj26a: TestObject = { value: "test" };
        const obj26b: TestObject = { value: "test" };
        set26.add(obj26a);
        set26.add(obj26b);
        let result: boolean = set26.size === 2;
        expect(result).assertTrue();
        console.log('test_Set_Add_Same_Content_Different_Instances_0026 done');
        done();
        console.log('test_Set_Add_Same_Content_Different_Instances_0026 end');
      });

    /**
     * @tc.number    SUB_SET_DELETE_DIFFERENT_INSTANCE_2700
     * @tc.name      test_Set_Delete_Different_Instance_0027
     * @tc.desc      Set delete object with same content but different instance and verify failure
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Set_Delete_Different_Instance_0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Set_Delete_Different_Instance_0027 start');
        interface KeyValue {
          key: string;
        }
        const set27 = new Set<KeyValue>();
        const obj27a: KeyValue = { key: "value" };
        const obj27b: KeyValue = { key: "value" };
        set27.add(obj27a);
        let result: boolean = !set27.delete(obj27b);
        expect(result).assertTrue();
        console.log('test_Set_Delete_Different_Instance_0027 done');
        done();
        console.log('test_Set_Delete_Different_Instance_0027 end');
      });

    /**
     * @tc.number    SUB_SET_ADD_NESTED_OBJECT_2800
     * @tc.name      test_Set_Add_Nested_Object_0028
     * @tc.desc      Set add nested object and verify success
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Set_Add_Nested_Object_0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Set_Add_Nested_Object_0028 start');
        interface Innermost {
          c: number;
        }
        interface Middle {
          b: Innermost;
        }
        interface Outer {
          a: Middle;
        }
        const set28 = new Set<Outer>();
        const nestedObj: Outer = { a: { b: { c: 1 } } };
        set28.add(nestedObj);
        let result: boolean = set28.has(nestedObj);
        expect(result).assertTrue();
        console.log('test_Set_Add_Nested_Object_0028 done');
        done();
        console.log('test_Set_Add_Nested_Object_0028 end');
      });

    /**
     * @tc.number    SUB_SET_ADD_REASSIGN_OBJECT_2900
     * @tc.name      test_Set_Add_Reassign_Object_0029
     * @tc.desc      Set add object and verify reassigning variable to new object does not affect set
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Set_Add_Reassign_Object_0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Set_Add_Reassign_Object_0029 start');
        interface InitialObject {
          initial: string;
        }
        const set29 = new Set<InitialObject>();
        let obj29: InitialObject = { initial: "value" };
        set29.add(obj29);
        obj29 = { initial: "value" } as InitialObject;
        let result: boolean = set29.has({ initial: "value" });
        expect(result).assertFalse();
        console.log('test_Set_Add_Reassign_Object_0029 done');
        done();
        console.log('test_Set_Add_Reassign_Object_0029 end');
      });

    /**
     * @tc.number    SUB_SET_DELETE_UNADDED_OBJECT_3000
     * @tc.name      test_Set_Delete_Unadded_Object_0030
     * @tc.desc      Set delete unadded object and verify returns false
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Set_Delete_Unadded_Object_0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Set_Delete_Unadded_Object_0030 start');
        interface UnusedObject {
          unused: string;
        }
        const set30 = new Set<UnusedObject>();
        const obj30: UnusedObject = { unused: "object" };
        let result: boolean = !set30.delete(obj30);
        expect(result).assertTrue();
        console.log('test_Set_Delete_Unadded_Object_0030 done');
        done();
        console.log('test_Set_Delete_Unadded_Object_0030 end');
      });

    /**
     * @tc.number    SUB_SET_SYMBOL_ADD_NORMAL_3100
     * @tc.name      test_Set_Symbol_AddNormal_0031
     * @tc.desc      Set add normal unique object and verify existence (simulate Symbol feature)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Set_Symbol_AddNormal_0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Set_Symbol_AddNormal_0031 start');
        const set31 = new Set<SymbolLike>();
        const sym31: SymbolLike = createSymbol("test");
        set31.add(sym31);

        const result: boolean = set31.has(sym31);
        expect(result).assertTrue();
        console.log('test_Set_Symbol_AddNormal_0031 done');
        done();
        console.log('test_Set_Symbol_AddNormal_0031 end');
      });

    /**
     * @tc.number    SUB_SET_SYMBOL_HAS_EXIST_3200
     * @tc.name      test_Set_Symbol_HasExist_0032
     * @tc.desc      Verify Set has() returns true for existing unique object (simulate Symbol feature)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Set_Symbol_HasExist_0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Set_Symbol_HasExist_0032 start');
        const set32 = new Set<SymbolLike>();
        const sym32: SymbolLike = createSymbol("demo");
        set32.add(sym32);

        const result: boolean = set32.has(sym32);
        expect(result).assertTrue();
        console.log('test_Set_Symbol_HasExist_0032 done');
        done();
        console.log('test_Set_Symbol_HasExist_0032 end');
      });

    /**
     * @tc.number    SUB_SET_SYMBOL_DELETE_SUCCESS_3300
     * @tc.name      test_Set_Symbol_DeleteSuccess_0033
     * @tc.desc      Verify Set delete() returns true for existing unique object (simulate Symbol feature)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Set_Symbol_DeleteSuccess_0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Set_Symbol_DeleteSuccess_0033 start');
        const set33 = new Set<SymbolLike>();
        const sym33: SymbolLike = createSymbol("delete");
        set33.add(sym33);

        const result: boolean = set33.delete(sym33);
        expect(result).assertTrue();
        console.log('test_Set_Symbol_DeleteSuccess_0033 done');
        done();
        console.log('test_Set_Symbol_DeleteSuccess_0033 end');
      });

    /**
     * @tc.number    SUB_SET_SYMBOL_DELETE_HAS_NOTEXIST_3400
     * @tc.name      test_Set_Symbol_DeleteHasNotExist_0034
     * @tc.desc      Verify Set has() returns false after delete (simulate Symbol feature)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Set_Symbol_DeleteHasNotExist_0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Set_Symbol_DeleteHasNotExist_0034 start');
        const set34 = new Set<SymbolLike>();
        const sym34: SymbolLike = createSymbol("removed");
        set34.add(sym34);
        set34.delete(sym34);

        const result: boolean = !set34.has(sym34);
        expect(result).assertTrue();
        console.log('test_Set_Symbol_DeleteHasNotExist_0034 done');
        done();
        console.log('test_Set_Symbol_DeleteHasNotExist_0034 end');
      });

    /**
     * @tc.number    SUB_SET_SYMBOL_ITERATE_EXIST_3500
     * @tc.name      test_Set_Symbol_IterateExist_0035
     * @tc.desc      Verify added unique object exists in iteration (simulate Symbol feature)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Set_Symbol_IterateExist_0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Set_Symbol_IterateExist_0035 start');
        const set35 = new Set<SymbolLike>();
        const sym35: SymbolLike = createSymbol("iterate");
        set35.add(sym35);

        const values = getSetValues(set35);
        const result: boolean = arrayContains(values, sym35, (a, b) => a.id === b.id);

        expect(result).assertTrue();
        console.log('test_Set_Symbol_IterateExist_0035 done');
        done();
        console.log('test_Set_Symbol_IterateExist_0035 end');
      });

    /**
     * @tc.number    SUB_SET_SYMBOL_ADD_DIFFERENT_3600
     * @tc.name      test_Set_Symbol_AddDifferent_0036
     * @tc.desc      Verify different objects with same description are treated as distinct (simulate Symbol feature)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Set_Symbol_AddDifferent_0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Set_Symbol_AddDifferent_0036 start');
        const set36 = new Set<SymbolLike>();
        const sym36a: SymbolLike = createSymbol("same");
        const sym36b: SymbolLike = createSymbol("same");

        set36.add(sym36a);
        set36.add(sym36b);
        const result: boolean = set36.size === 2;

        expect(result).assertTrue();
        console.log('test_Set_Symbol_AddDifferent_0036 done');
        done();
        console.log('test_Set_Symbol_AddDifferent_0036 end');
      });

    /**
     * @tc.number    SUB_SET_SYMBOL_ADD_SHARED_3700
     * @tc.name      test_Set_Symbol_AddShared_0037
     * @tc.desc      Verify shared objects are treated as same in Set (simulate Symbol.for feature)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Set_Symbol_AddShared_0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Set_Symbol_AddShared_0037 start');
        const set37 = new Set<SymbolLike>();
        const sym37a: SymbolLike = createSharedSymbol("shared");
        const sym37b: SymbolLike = createSharedSymbol("shared");

        set37.add(sym37a);
        set37.add(sym37b);
        const result: boolean = set37.size === 1;

        expect(result).assertTrue();
        console.log('test_Set_Symbol_AddShared_0037 done');
        done();
        console.log('test_Set_Symbol_AddShared_0037 end');
      });

    /**
     * @tc.number    SUB_SET_SYMBOL_DELETE_NOTADDED_3800
     * @tc.name      test_Set_Symbol_DeleteNotAdded_0038
     * @tc.desc      Verify delete() returns false for non-existent object (simulate Symbol feature)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Set_Symbol_DeleteNotAdded_0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Set_Symbol_DeleteNotAdded_0038 start');
        const set38 = new Set<SymbolLike>();
        const sym38: SymbolLike = createSymbol("notadded");

        const result: boolean = !set38.delete(sym38);
        expect(result).assertTrue();
        console.log('test_Set_Symbol_DeleteNotAdded_0038 done');
        done();
        console.log('test_Set_Symbol_DeleteNotAdded_0038 end');
      });

    /**
     * @tc.number    SUB_SET_SYMBOL_ADD_BUILTIN_3900
     * @tc.name      test_Set_Symbol_AddBuiltIn_0039
     * @tc.desc      Verify adding built-in unique object works (simulate built-in Symbol feature)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Set_Symbol_AddBuiltIn_0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Set_Symbol_AddBuiltIn_0039 start');
        const set39 = new Set<SymbolLike>();
        const sym39: SymbolLike = builtInSymbols.iterator;
        set39.add(sym39);

        const result: boolean = set39.has(sym39);
        expect(result).assertTrue();
        console.log('test_Set_Symbol_AddBuiltIn_0039 done');
        done();
        console.log('test_Set_Symbol_AddBuiltIn_0039 end');
      });

    /**
     * @tc.number    SUB_SET_SYMBOL_ADD_DUPLICATE_4000
     * @tc.name      test_Set_Symbol_AddDuplicate_0040
     * @tc.desc      Verify duplicate add of same object doesn't change size (simulate Symbol feature)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Set_Symbol_AddDuplicate_0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Set_Symbol_AddDuplicate_0040 start');
        const set40 = new Set<SymbolLike>();
        const sym40: SymbolLike = createSymbol("repeat");
        set40.add(sym40);
        set40.add(sym40);

        const result: boolean = set40.size === 1;
        expect(result).assertTrue();
        console.log('test_Set_Symbol_AddDuplicate_0040 done');
        done();
        console.log('test_Set_Symbol_AddDuplicate_0040 end');
      });
  })
}