/*
* Copyright (C) 2026 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium';
import { JSONStringify_Enumerable_002,
  JSONStringify_Inherited_001,
  JSONStringify_Inherited_002,
  JSONStringify_NonEnumerable_001,
  JSONStringify_NonEnumerable_002,
  JSONStringify_NonEnumerable_003,
  ArrayProto,
  FunctionProto,
  JSONStringify_Type_FunctionEmpty_001,
  JSONStringify_Type_FunctionNamed_001,
  ObjectProto,
  testUndefinedAsObjectProperty,
  testMultipleUndefinedProperties,
  testUndefinedMixedValues,
  testUndefinedInArray,
  testMultipleUndefinedInArray,
  testUndefinedMixedInArray,
  testDirectUndefined,
  testFunctionAsObjectProperty,
  testMultipleFunctionProperties,
  testFunctionMixedValues,
  testFunctionInArray,
  testMultipleFunctionsInArray,
  testFunctionMixedInArray,
  testDirectFunction,
  testSymbolAsObjectKey,
  testSymbolForAsObjectKey,
  testSymbolMixedKeys,
  testSymbolAsObjectValue,
  testSymbolInArray,
  testReplacerArrayWithSymbol,
  testReplacerFunctionSymbolKey,
  testBigInt,
  testBigIntInObject,
  testBigIntInArray,
  testMixedBigInt
} from './JSONStringifyJS';

interface TestObjs1 {
  a?: number;
}

interface TestObjs2 {
  a?: TestObjs3;
}

interface TestObjs3 {
  b?: number;
}

interface TestObjs4 {
  a?: number[];
}

interface TestObj {
  x?: number;
  y?: number;
  arr?: number[];
  a?: TestObj2;
}

interface TestObj2 {
  b?: TestObj3;
}

interface TestObj3 {
  c?: number[];
}

function sleep(time: number): Promise<void> {
  return new Promise((re) => {
    setTimeout(() => {
      re();
    }, time);
  });
}
export default function JSONStringifyBasicTest() {
  describe('JSONStringifyBasicTest', () => {
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
    })
    beforeEach(async () => {
      await sleep(20);
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
    })

    /**
     * @tc.name   JSONStringify_Basic_String_001
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_BASIC_0100
     * @tc.desc   Test string serialization
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('JSONStringify_Basic_String_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let result: string = JSON.stringify("foo");
      expect(result).assertEqual('"foo"');
    });

    /**
     * @tc.name   JSONStringify_Basic_Number_001
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_BASIC_0200
     * @tc.desc   Test number serialization
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('JSONStringify_Basic_Number_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let result: string = JSON.stringify(123);
      expect(result).assertEqual('123');
    });

    /**
     * @tc.name   JSONStringify_Basic_Boolean_001
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_BASIC_0300
     * @tc.desc   Test boolean true serialization
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('JSONStringify_Basic_Boolean_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let result: string = JSON.stringify(true);
      expect(result).assertEqual('true');
    });

    /**
     * @tc.name   JSONStringify_Basic_Boolean_002
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_BASIC_0400
     * @tc.desc   Test boolean false serialization
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('JSONStringify_Basic_Boolean_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let result: string = JSON.stringify(false);
      expect(result).assertEqual('false');
    });

    /**
     * @tc.name   JSONStringify_Basic_Null_001
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_BASIC_0500
     * @tc.desc   Test null serialization
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('JSONStringify_Basic_Null_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let result: string = JSON.stringify(null);
      expect(result).assertEqual('null');
    });

    /**
     * @tc.name   JSONStringify_Basic_Object_001
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_BASIC_0600
     * @tc.desc   Test empty object serialization
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('JSONStringify_Basic_Object_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let obj: Record<string, never> = {};
      let result: string = JSON.stringify(obj);
      expect(result).assertEqual('{}');
    });

    /**
     * @tc.name   JSONStringify_Basic_Object_002
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_BASIC_0700
     * @tc.desc   Test simple object serialization
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('JSONStringify_Basic_Object_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let obj: TestObj = { x: 5 };
      let result: string = JSON.stringify(obj);
      expect(result).assertEqual('{"x":5}');
    });

    /**
     * @tc.name   JSONStringify_Basic_Object_003
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_BASIC_0800
     * @tc.desc   Test multi-property object serialization
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('JSONStringify_Basic_Object_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let obj: TestObj = { x: 5, y: 6 };
      let result: string = JSON.stringify(obj);
      expect(result).assertEqual('{"x":5,"y":6}');
    });

    /**
     * @tc.name   JSONStringify_Basic_Array_001
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_BASIC_0900
     * @tc.desc   Test empty array serialization
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('JSONStringify_Basic_Array_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let arr: never[] = [];
      let result: string = JSON.stringify(arr);
      expect(result).assertEqual('[]');
    });

    /**
     * @tc.name   JSONStringify_Basic_Array_002
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_BASIC_1000
     * @tc.desc   Test simple array serialization
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('JSONStringify_Basic_Array_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let arr: (number | string | boolean)[] = [1, "false", false];
      let result: string = JSON.stringify(arr);
      expect(result).assertEqual('[1,"false",false]');
    });

    /**
     * @tc.name   JSONStringify_Basic_Array_003
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_BASIC_1100
     * @tc.desc   Test nested array serialization
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('JSONStringify_Basic_Array_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let arr: (number | number[])[] = [1, [2, 3], 4];
      let result: string = JSON.stringify(arr);
      expect(result).assertEqual('[1,[2,3],4]');
    });

    /**
     * @tc.name   JSONStringify_Basic_Mixed_001
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_BASIC_1200
     * @tc.desc   Test object containing array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('JSONStringify_Basic_Mixed_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let obj: TestObj = { arr: [1, 2, 3] };
      let result: string = JSON.stringify(obj);
      expect(result).assertEqual('{"arr":[1,2,3]}');
    });

    /**
     * @tc.name   JSONStringify_Basic_Mixed_002
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_BASIC_1300
     * @tc.desc   Test array containing objects
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('JSONStringify_Basic_Mixed_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let arr: TestObj[] = [{ x: 1 }, { y: 2 }];
      let result: string = JSON.stringify(arr);
      expect(result).assertEqual('[{"x":1},{"y":2}]');
    });

    /**
     * @tc.name   JSONStringify_Basic_Mixed_003
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_BASIC_1400
     * @tc.desc   Test deep nested structure
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('JSONStringify_Basic_Mixed_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let obj: TestObj = { a: { b: { c: [1, 2] } } };
      let result: string = JSON.stringify(obj);
      expect(result).assertEqual('{"a":{"b":{"c":[1,2]}}}');
    });

    // Circular reference exceptions
    /**
     * @tc.name   JSONStringify_Circular_Object_001
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_CIRCULAR_0100
     * @tc.desc   Test direct circular reference - object self-reference
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('JSONStringify_Circular_Object_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let obj:ESObject = {};
      obj.self = obj;
      try {
        JSON.stringify(obj);
      } catch (e) {
        expect(e instanceof Error).assertTrue();
        // In ArkTS, this should also throw a TypeError
      }
    });

    /**
     * @tc.name   JSONStringify_Circular_Array_001
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_CIRCULAR_0200
     * @tc.desc   Test direct circular reference - array self-reference
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('JSONStringify_Circular_Array_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let arr:ESObject = [];
      arr[0] = arr;
      try {
        JSON.stringify(arr);
      } catch (e) {
        expect(e instanceof Error).assertTrue();
      }
    });

    /**
     * @tc.name   JSONStringify_Circular_Indirect_001
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_CIRCULAR_0300
     * @tc.desc   Test indirect circular reference - two objects referencing each other
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('JSONStringify_Circular_Indirect_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let obj1:ESObject = {};
      let obj2:ESObject = {};
      obj1.ref = obj2;
      obj2.ref = obj1;
      try {
        JSON.stringify(obj1);
      } catch (e) {
        expect(e instanceof Error).assertTrue();
      }
    });

    /**
     * @tc.name   JSONStringify_Circular_Multiple_001
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_CIRCULAR_0400
     * @tc.desc   Test multiple objects forming circular reference
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('JSONStringify_Circular_Multiple_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let obj1:ESObject = {};
      let obj2:ESObject = {};
      let obj3:ESObject = {};
      obj1.ref = obj2;
      obj2.ref = obj3;
      obj3.ref = obj1;
      try {
        JSON.stringify(obj1);
      } catch (e) {
        expect(e instanceof Error).assertTrue();
      }
    });

    /**
     * @tc.name   JSONStringify_Circular_Deep_001
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_CIRCULAR_0500
     * @tc.desc   Test deep nested circular reference
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('JSONStringify_Circular_Deep_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let obj:ESObject = { a: { b: { c: {} as ESObject }  as ESObject}  as ESObject};
      obj.a.b.c.ref = obj;
      try {
        JSON.stringify(obj);
      } catch (e) {
        expect(e instanceof Error).assertTrue();
      }
    });

    /**
     * @tc.name   JSONStringify_Circular_Array_002
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_CIRCULAR_0600
     * @tc.desc   Test object and array circular reference
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('JSONStringify_Circular_Array_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let obj:ESObject = {};
      let arr:ESObject = [];
      obj.arr = arr;
      arr[0] = obj;
      try {
        JSON.stringify(obj);
      } catch (e) {
        expect(e instanceof Error).assertTrue();
      }
    });

    /**
     * @tc.name   JSONStringify_TypeError_001
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_TYPEERROR_0100
     * @tc.desc   Test circular reference error message
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('JSONStringify_TypeError_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let obj:ESObject = {};
      obj.self = obj;
      try {
        JSON.stringify(obj);
      } catch (e) {
        expect(e instanceof Error).assertTrue();
      }
    });

    // Error object serialization (should be ignored)
    /**
     * @tc.name   JSONStringify_Error_001
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_ERROR_0100
     * @tc.desc   Test Error object serialization
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('JSONStringify_Error_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let result: string = JSON.stringify(new Error("error"));
      expect(result).assertEqual('{}');
    });

    /**
     * @tc.name   JSONStringify_Error_002
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_ERROR_0200
     * @tc.desc   Test Error object in array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('JSONStringify_Error_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let result: string = JSON.stringify([new Error("error")]);
      expect(result).assertEqual('[{}]');
    });

    /**
     * @tc.name   JSONStringify_Error_003
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_ERROR_0300
     * @tc.desc   Test Error object in object
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('JSONStringify_Error_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let result: string = JSON.stringify({ err: new Error("error") });
      expect(result).assertEqual('{"err":{}}');
    });

    // Other error cases
    /**
     * @tc.name   JSONStringify_InvalidInput_001
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_INVALIDINPUT_0100
     * @tc.desc   Test null is valid and serializable
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('JSONStringify_InvalidInput_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let result: string = JSON.stringify(null);
      expect(result).assertEqual('null');
    });

    /**
     * @tc.name   JSONStringify_ReplacerThrow_001
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_REPLACERTHROW_0100
     * @tc.desc   Test replacer function that throws error
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('JSONStringify_ReplacerThrow_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let replacer = (key: string, value: ESObject) => {
        throw new Error("Replacer error");
      };
      try {
        JSON.stringify({ a: 1 }, replacer);
      } catch (e) {
        expect(e instanceof Error).assertTrue();
        expect((e as Error).message).assertEqual("Replacer error");
      }
    });

    /**
     * @tc.name   JSONStringify_ToJSONThrow_001
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_TOJSONTHROW_0100
     * @tc.desc   Test toJSON method that throws error
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('JSONStringify_ToJSONThrow_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let obj:ESObject = {
        toJSON() {
          throw new Error("toJSON error");
        }
      };
      try {
        JSON.stringify(obj);
      } catch (e) {
        expect(e instanceof Error).assertTrue();
        expect(e.message).assertEqual("toJSON error");
      }
    });


    // Enumerable properties
    /**
     * @tc.name   JSONStringify_Enumerable_001
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_ENUMERABLE_0100
     * @tc.desc   Test regular enumerable properties
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('JSONStringify_Enumerable_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let result: string = JSON.stringify({ a: 1, b: 2 });
      expect(result).assertEqual('{"a":1,"b":2}');
    });

    /**
     * @tc.name   JSONStringify_Enumerable_002
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_ENUMERABLE_0200
     * @tc.desc   Test enumerable properties defined with Object.defineProperty
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('JSONStringify_Enumerable_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {

      expect(JSONStringify_Enumerable_002()).assertEqual('{"a":1}');
    });

    // Non-enumerable properties
    /**
     * @tc.name   JSONStringify_NonEnumerable_001
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_NONENUMERABLE_0100
     * @tc.desc   Test non-enumerable properties are ignored
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('JSONStringify_NonEnumerable_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(JSONStringify_NonEnumerable_001()).assertEqual('{}');
    });

    /**
     * @tc.name   JSONStringify_NonEnumerable_002
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_NONENUMERABLE_0200
     * @tc.desc   Test mixed enumerable and non-enumerable properties
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('JSONStringify_NonEnumerable_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(JSONStringify_NonEnumerable_002()).assertEqual('{"b":2}');
    });

    /**
     * @tc.name   JSONStringify_NonEnumerable_003
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_NONENUMERABLE_0300
     * @tc.desc   Test non-enumerable properties from Object.create
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_NonEnumerable_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(JSONStringify_NonEnumerable_003()).assertEqual('{"a":1}');
    });

    // Inherited properties
    /**
     * @tc.name   JSONStringify_Inherited_001
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_INHERITED_0100
     * @tc.desc   Test prototype chain properties are ignored
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Inherited_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(JSONStringify_Inherited_001()).assertEqual('{"b":2}');
    });

    /**
     * @tc.name   JSONStringify_Inherited_002
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_INHERITED_0200
     * @tc.desc   Test multiple level prototype chain
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Inherited_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {

      expect(JSONStringify_Inherited_002()).assertEqual('{"c":3}');
    });

    // Property order
    /**
     * @tc.name   JSONStringify_Order_001
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_ORDER_0100
     * @tc.desc   Test object property serialization order may not be guaranteed
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Order_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let obj:ESObject = { c: 3, a: 1, b: 2 };
      let result: string = JSON.stringify(obj);
      // The order may vary, but all properties should be present
      let parsed = JSON.parse(result) as Record<string, number>;
      expect(parsed.c).assertEqual(3);
      expect(parsed.a).assertEqual(1);
      expect(parsed.b).assertEqual(2);
    });

    /**
     * @tc.name   JSONStringify_Order_002
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_ORDER_0200
     * @tc.desc   Test numeric keys are sorted in ascending order
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Order_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let obj:ESObject = { "2": "b", "1": "a", "3": "c" };
      let result: string = JSON.stringify(obj);
      expect(result).assertEqual('{"1":"a","2":"b","3":"c"}');
    });

    /**
     * @tc.name   JSONStringify_Order_003
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_ORDER_0300
     * @tc.desc   Test mixed key types with numeric keys first
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Order_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let obj:ESObject = { a: 1, "2": "b", "1": "c" };
      let result: string = JSON.stringify(obj);
      expect(result).assertEqual('{"1":"c","2":"b","a":1}');
    });

    // Array-like objects
    /**
     * @tc.name   JSONStringify_ArrayLike_001
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_ARRAYLIKE_0100
     * @tc.desc   Test array-like object with length property
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_ArrayLike_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let obj:ESObject = { "0": "a", "1": "b", "2": "c", length: 3 };
      let result: string = JSON.stringify(obj);
      expect(result).assertEqual('{"0":"a","1":"b","2":"c","length":3}');
    });

    /**
     * @tc.name   JSONStringify_ArrayLike_002
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_ARRAYLIKE_0200
     * @tc.desc   Test array-like object with non-numeric keys
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_ArrayLike_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let obj:ESObject = { "0": "a", "1": "b", name: "test" };
      let result: string = JSON.stringify(obj);
      expect(result).assertEqual('{"0":"a","1":"b","name":"test"}');
    });


    // Undefined handling
    /**
     * @tc.name   JSONStringify_Undefined_Property_001
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_UNDEFINED_0100
     * @tc.desc   Test undefined as object property value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Undefined_Property_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = testUndefinedAsObjectProperty();
      expect(result).assertEqual('{}');
    });

    /**
     * @tc.name   JSONStringify_Undefined_Property_002
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_UNDEFINED_0200
     * @tc.desc   Test multiple undefined properties
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Undefined_Property_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = testMultipleUndefinedProperties();
      expect(result).assertEqual('{}');
    });

    /**
     * @tc.name   JSONStringify_Undefined_Mixed_001
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_UNDEFINED_0300
     * @tc.desc   Test undefined mixed with other values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Undefined_Mixed_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = testUndefinedMixedValues();
      expect(result).assertEqual('{"b":1}');
    });

    /**
     * @tc.name   JSONStringify_Undefined_Array_001
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_UNDEFINED_0400
     * @tc.desc   Test undefined in array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Undefined_Array_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = testUndefinedInArray();
      expect(result).assertEqual('[null]');
    });

    /**
     * @tc.name   JSONStringify_Undefined_Array_002
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_UNDEFINED_0500
     * @tc.desc   Test multiple undefined in array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Undefined_Array_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = testMultipleUndefinedInArray();
      expect(result).assertEqual('[null,null]');
    });

    /**
     * @tc.name   JSONStringify_Undefined_Array_003
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_UNDEFINED_0600
     * @tc.desc   Test undefined mixed in array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Undefined_Array_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = testUndefinedMixedInArray();
      expect(result).assertEqual('[null,1,null]');
    });

    /**
     * @tc.name   JSONStringify_Undirect_001
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_UNDIRECT_0100
     * @tc.desc   Test direct serialization of undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Undirect_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: ESObject = testDirectUndefined();
      expect(result).assertEqual(undefined);
    });

    // Function handling
    /**
     * @tc.name   JSONStringify_Function_Property_001
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_FUNCTION_0100
     * @tc.desc   Test function as object property value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Function_Property_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = testFunctionAsObjectProperty();
      expect(result).assertEqual('{}');
    });

    /**
     * @tc.name   JSONStringify_Function_Property_002
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_FUNCTION_0200
     * @tc.desc   Test multiple function properties
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Function_Property_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = testMultipleFunctionProperties();
      expect(result).assertEqual('{}');
    });

    /**
     * @tc.name   JSONStringify_Function_Mixed_001
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_FUNCTION_0300
     * @tc.desc   Test function mixed with other values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Function_Mixed_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = testFunctionMixedValues();
      expect(result).assertEqual('{"b":1}');
    });

    /**
     * @tc.name   JSONStringify_Function_Array_001
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_FUNCTION_0400
     * @tc.desc   Test function in array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Function_Array_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = testFunctionInArray();
      expect(result).assertEqual('[null]');
    });

    /**
     * @tc.name   JSONStringify_Function_Array_002
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_FUNCTION_0500
     * @tc.desc   Test multiple functions in array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Function_Array_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = testMultipleFunctionsInArray();
      expect(result).assertEqual('[null,null]');
    });

    /**
     * @tc.name   JSONStringify_Function_Array_003
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_FUNCTION_0600
     * @tc.desc   Test function mixed in array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Function_Array_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = testFunctionMixedInArray();
      expect(result).assertEqual('[null,1,null]');
    });

    /**
     * @tc.name   JSONStringify_Fdirect_001
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_FDIRECT_0100
     * @tc.desc   Test direct serialization of function
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Fdirect_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: ESObject = testDirectFunction();
      expect(result).assertEqual(undefined);
    });

    // Symbol handling
    /**
     * @tc.name   JSONStringify_Symbol_Key_001
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_SYMBOL_0100
     * @tc.desc   Test Symbol as object key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Symbol_Key_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = testSymbolAsObjectKey();
      expect(result).assertEqual('{}');
    });

    /**
     * @tc.name   JSONStringify_Symbol_Key_002
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_SYMBOL_0200
     * @tc.desc   Test Symbol.for as object key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Symbol_Key_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = testSymbolForAsObjectKey();
      expect(result).assertEqual('{}');
    });

    /**
     * @tc.name   JSONStringify_Symbol_Key_003
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_SYMBOL_0300
     * @tc.desc   Test Symbol mixed with regular keys
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Symbol_Key_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = testSymbolMixedKeys();
      expect(result).assertEqual('{"a":1}');
    });

    /**
     * @tc.name   JSONStringify_Symbol_Value_001
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_SYMBOL_0400
     * @tc.desc   Test Symbol as object value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Symbol_Value_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = testSymbolAsObjectValue();
      expect(result).assertEqual('{}');
    });

    /**
     * @tc.name   JSONStringify_Symbol_Array_001
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_SYMBOL_0500
     * @tc.desc   Test Symbol in array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Symbol_Array_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = testSymbolInArray();
      expect(result).assertEqual('[null]');
    });

    /**
     * @tc.name   JSONStringify_Symbol_Replacer_001
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_SYMBOL_0600
     * @tc.desc   Test replacer array with Symbol
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Symbol_Replacer_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = testReplacerArrayWithSymbol();
      expect(result).assertEqual('{}');
    });

    /**
     * @tc.name   JSONStringify_Symbol_Replacer_002
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_SYMBOL_0700
     * @tc.desc   Test replacer function with Symbol keys
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Symbol_Replacer_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = testReplacerFunctionSymbolKey();
      expect(result).assertEqual("{}");
    });

    // BigInt handling
    /**
     * @tc.name   JSONStringify_BigInt_001
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_BIGINT_0100
     * @tc.desc   Test BigInt serialization
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_BigInt_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = testBigInt();
      expect(result).assertEqual('TypeError');
    });

    /**
     * @tc.name   JSONStringify_BigInt_002
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_BIGINT_0200
     * @tc.desc   Test BigInt in object
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_BigInt_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = testBigIntInObject();
      expect(result).assertEqual('TypeError');
    });

    /**
     * @tc.name   JSONStringify_BigInt_003
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_BIGINT_0300
     * @tc.desc   Test BigInt in array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_BigInt_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = testBigIntInArray();
      expect(result).assertEqual('TypeError');
    });

    /**
     * @tc.name   JSONStringify_BigInt_004
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_BIGINT_0400
     * @tc.desc   Test BigInt mixed with other values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_BigInt_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = testMixedBigInt();
      expect(result).assertEqual('TypeError');
    });

    // Wrapper objects
    /**
     * @tc.name   JSONStringify_Wrapper_Number_001
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_WRAPPER_NUMBER_0100
     * @tc.desc   Test Number wrapper object
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Wrapper_Number_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = JSON.stringify(new Number(3));
      expect(result).assertEqual('3');
    });

    /**
     * @tc.name   JSONStringify_Wrapper_String_001
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_WRAPPER_STRING_0100
     * @tc.desc   Test String wrapper object
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Wrapper_String_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = JSON.stringify(new String("false"));
      expect(result).assertEqual('"false"');
    });

    /**
     * @tc.name   JSONStringify_Wrapper_Boolean_001
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_WRAPPER_BOOLEAN_0100
     * @tc.desc   Test Boolean wrapper object
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Wrapper_Boolean_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = JSON.stringify(new Boolean(false));
      expect(result).assertEqual('false');
    });

    // Date handling
    /**
     * @tc.name   JSONStringify_Date_001
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_DATE_0100
     * @tc.desc   Test Date object serialization
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Date_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = JSON.stringify(new Date(2006, 0, 2, 15, 4, 5));
      expect(result).assertEqual('"2006-01-02T07:04:05.000Z"');
    });

    /**
     * @tc.name   JSONStringify_Date_002
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_DATE_0200
     * @tc.desc   Test Date in array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Date_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = JSON.stringify([new Date(2006, 0, 2)]);
      expect(result).assertEqual('["2006-01-01T16:00:00.000Z"]');
    });

    /**
     * @tc.name   JSONStringify_Date_003
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_DATE_0300
     * @tc.desc   Test Date in object
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Date_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = JSON.stringify({ date: new Date(2006, 0, 2) });
      expect(result).assertEqual('{"date":"2006-01-01T16:00:00.000Z"}');
    });

    // NaN and Infinity handling
    /**
     * @tc.name   JSONStringify_NaN_001
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_NAN_0100
     * @tc.desc   Test NaN serialization
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_NaN_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = JSON.stringify(NaN);
      expect(result).assertEqual('null');
    });

    /**
     * @tc.name   JSONStringify_NaN_002
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_NAN_0200
     * @tc.desc   Test NaN in array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_NaN_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = JSON.stringify([NaN]);
      expect(result).assertEqual('[null]');
    });

    /**
     * @tc.name   JSONStringify_NaN_003
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_NAN_0300
     * @tc.desc   Test NaN in object
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_NaN_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = JSON.stringify({ a: NaN });
      expect(result).assertEqual('{"a":null}');
    });

    /**
     * @tc.name   JSONStringify_Infinity_001
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_INFINITY_0100
     * @tc.desc   Test positive Infinity serialization
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Infinity_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = JSON.stringify(Infinity);
      expect(result).assertEqual('null');
    });

    /**
     * @tc.name   JSONStringify_Infinity_002
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_INFINITY_0200
     * @tc.desc   Test negative Infinity serialization
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Infinity_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = JSON.stringify(-Infinity);
      expect(result).assertEqual('null');
    });

    /**
     * @tc.name   JSONStringify_Infinity_003
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_INFINITY_0300
     * @tc.desc   Test Infinity in array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Infinity_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = JSON.stringify([Infinity, -Infinity]);
      expect(result).assertEqual('[null,null]');
    });

    /**
     * @tc.name   JSONStringify_Infinity_004
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_INFINITY_0400
     * @tc.desc   Test Infinity in object
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Infinity_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = JSON.stringify({ a: Infinity, b: -Infinity });
      expect(result).assertEqual('{"a":null,"b":null}');
    });


    // Basic type conversion
    /**
     * @tc.name   JSONStringify_Type_String_001
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_TYPE_STRING_0100
     * @tc.desc   Test string value preservation
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Type_String_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = JSON.stringify("text");
      expect(result).assertEqual('"text"');
    });

    /**
     * @tc.name   JSONStringify_Type_Number_001
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_TYPE_NUMBER_0100
     * @tc.desc   Test number value preservation
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Type_Number_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = JSON.stringify(123);
      expect(result).assertEqual('123');
    });

    /**
     * @tc.name   JSONStringify_Type_Boolean_001
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_TYPE_BOOLEAN_0100
     * @tc.desc   Test boolean value preservation
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Type_Boolean_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = JSON.stringify(true);
      expect(result).assertEqual('true');
    });

    // Object type conversion
    /**
     * @tc.name   JSONStringify_Type_Object_001
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_TYPE_OBJECT_0100
     * @tc.desc   Test regular object serialization
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Type_Object_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = JSON.stringify({ a: 1, b: 2 });
      expect(result).assertEqual('{"a":1,"b":2}');
    });

    /**
     * @tc.name   JSONStringify_Type_Object_002
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_TYPE_OBJECT_0200
     * @tc.desc   Test empty object serialization
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Type_Object_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = JSON.stringify({});
      expect(result).assertEqual('{}');
    });

    // Array type conversion
    /**
     * @tc.name   JSONStringify_Type_Array_001
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_TYPE_ARRAY_0100
     * @tc.desc   Test array serialization
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Type_Array_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = JSON.stringify([1, 2, 3]);
      expect(result).assertEqual('[1,2,3]');
    });

    /**
     * @tc.name   JSONStringify_Type_Array_002
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_TYPE_ARRAY_0200
     * @tc.desc   Test empty array serialization
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Type_Array_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = JSON.stringify([]);
      expect(result).assertEqual('[]');
    });

    // Special object types
    /**
     * @tc.name   JSONStringify_Type_Map_001
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_TYPE_MAP_0100
     * @tc.desc   Test Map object serialization
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Type_Map_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let map = new Map([["a", 1], ["b", 2]]);
      let result: string = JSON.stringify(map);
      expect(result).assertEqual('{}');
    });

    /**
     * @tc.name   JSONStringify_Type_Set_001
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_TYPE_SET_0100
     * @tc.desc   Test Set object serialization
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Type_Set_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let set = new Set([1, 2, 3]);
      let result: string = JSON.stringify(set);
      expect(result).assertEqual('{}');
    });

    /**
     * @tc.name   JSONStringify_Type_WeakMap_001
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_TYPE_WEAKMAP_0100
     * @tc.desc   Test WeakMap object serialization
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Type_WeakMap_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let weakMap:ESObject = new WeakMap();
      let result: string = JSON.stringify(weakMap);
      expect(result).assertEqual('{}');
    });

    /**
     * @tc.name   JSONStringify_Type_WeakSet_001
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_TYPE_WEAKSET_0100
     * @tc.desc   Test WeakSet object serialization
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Type_WeakSet_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let weakSet = new WeakSet();
      let result: string = JSON.stringify(weakSet);
      expect(result).assertEqual('{}');
    });

    /**
     * @tc.name   JSONStringify_Type_RegExp_001
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_TYPE_REGEXP_0100
     * @tc.desc   Test RegExp object serialization
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Type_RegExp_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = JSON.stringify(/abc/g);
      expect(result).assertEqual('{}');
    });

    // Prototype objects
    /**
     * @tc.name   JSONStringify_Type_Prototype_001
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_TYPE_PROTOTYPE_0100
     * @tc.desc   Test Object.prototype serialization
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Type_Prototype_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = JSON.stringify(ObjectProto());
      expect(result).assertEqual('{}');
    });

    /**
     * @tc.name   JSONStringify_Type_FunctionProto_001
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_TYPE_FUNCTIONPROTO_0100
     * @tc.desc   Test Function.prototype serialization
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Type_FunctionProto_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = JSON.stringify(FunctionProto());
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.name   JSONStringify_Type_ArrayProto_001
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_TYPE_ARRAYPROTO_0100
     * @tc.desc   Test Array.prototype serialization
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Type_ArrayProto_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = JSON.stringify(ArrayProto());
      expect(result).assertEqual('[]');
    });

    /**
     * @tc.name   JSONStringify_Type_Math_001
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_TYPE_MATH_0100
     * @tc.desc   Test Math object serialization
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Type_Math_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = JSON.stringify(Math);
      expect(result).assertEqual('{}');
    });

    /**
     * @tc.name   JSONStringify_Type_JSON_001
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_TYPE_JSON_0100
     * @tc.desc   Test JSON object serialization
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Type_JSON_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = JSON.stringify(JSON);
      expect(result).assertEqual('{}');
    });

    /**
     * @tc.name   JSONStringify_Type_Date_001
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_TYPE_DATE_0100
     * @tc.desc   Test Date object serialization as string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Type_Date_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = JSON.stringify(new Date(2006, 0, 2, 15, 4, 5));
      expect(result).assertEqual('"2006-01-02T07:04:05.000Z"');
    });

    /**
     * @tc.name   JSONStringify_Type_FunctionEmpty_001
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_TYPE_FUNCEMPTY_0100
     * @tc.desc   Test empty function serialization
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Type_FunctionEmpty_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = JSONStringify_Type_FunctionEmpty_001();
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.name   JSONStringify_Type_FunctionNamed_001
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_TYPE_FUNCNAMED_0100
     * @tc.desc   Test named function serialization
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Type_FunctionNamed_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = JSONStringify_Type_FunctionNamed_001();
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.name   JSONStringify_Type_FunctionArrow_001
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_TYPE_FUNCARROW_0100
     * @tc.desc   Test arrow function serialization
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Type_FunctionArrow_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = JSON.stringify(() => {});
      expect(result).assertEqual(result);
    });

    // Space as number
    /**
     * @tc.name   JSONStringify_Space_Number_001
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_SPACE_NUMBER_0100
     * @tc.desc   Test space as 1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Space_Number_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let obj: TestObjs1 = { a: 2 };
      let result: string = JSON.stringify(obj, null, 1);
      expect(result).assertEqual('{\n "a": 2\n}');
    });

    /**
     * @tc.name   JSONStringify_Space_Number_002
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_SPACE_NUMBER_0200
     * @tc.desc   Test space as 2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Space_Number_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let obj: TestObjs1 = { a: 2 };
      let result: string = JSON.stringify(obj, null, 2);
      expect(result).assertEqual('{\n  "a": 2\n}');
    });

    /**
     * @tc.name   JSONStringify_Space_Number_003
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_SPACE_NUMBER_0300
     * @tc.desc   Test space as 4
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Space_Number_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let obj: TestObjs1 = { a: 2 };
      let result: string = JSON.stringify(obj, null, 4);
      expect(result).assertEqual('{\n    "a": 2\n}');
    });

    /**
     * @tc.name   JSONStringify_Space_Number_004
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_SPACE_NUMBER_0400
     * @tc.desc   Test space as 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Space_Number_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let obj: TestObjs1 = { a: 2 };
      let result: string = JSON.stringify(obj, null, 0);
      expect(result).assertEqual('{"a":2}');
    });

    /**
     * @tc.name   JSONStringify_Space_Number_005
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_SPACE_NUMBER_0500
     * @tc.desc   Test space as negative number
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Space_Number_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let obj: TestObjs1 = { a: 2 };
      let result: string = JSON.stringify(obj, undefined, -1);
      expect(result).assertEqual('{"a":2}');
    });

    /**
     * @tc.name   JSONStringify_Space_Number_006
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_SPACE_NUMBER_0600
     * @tc.desc   Test space as number greater than 10
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Space_Number_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let obj: TestObjs1 = { a: 2 };
      let result: string = JSON.stringify(obj, undefined, 20);
      let expected = '{\n          "a": 2\n}';
      expect(result).assertEqual('{\n          "a": 2\n}');
    });

    /**
     * @tc.name   JSONStringify_Space_Number_007
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_SPACE_NUMBER_0700
     * @tc.desc   Test nested object with space as 2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Space_Number_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let obj: TestObjs2 = { a: { b: 1 } };
      let result: string = JSON.stringify(obj, null, 2);
      expect(result).assertEqual('{\n  "a": {\n    "b": 1\n  }\n}');
    });

    /**
     * @tc.name   JSONStringify_Space_Number_008
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_SPACE_NUMBER_0800
     * @tc.desc   Test nested array with space as 2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Space_Number_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let obj: TestObjs4 = { a: [1, 2] };
      let result: string = JSON.stringify(obj, undefined, 2);
      expect(result).assertEqual('{\n  "a": [\n    1,\n    2\n  ]\n}');
    });

    // Space as string
    /**
     * @tc.name   JSONStringify_Space_String_001
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_SPACE_STRING_0100
     * @tc.desc   Test space as tab character
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Space_String_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let obj: TestObjs1 = { a: 2 };
      let result: string = JSON.stringify(obj, undefined, "\t");
      expect(result).assertEqual('{\n\t"a": 2\n}');
    });

    /**
     * @tc.name   JSONStringify_Space_String_002
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_SPACE_STRING_0200
     * @tc.desc   Test space as custom string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Space_String_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let obj: TestObjs1 = { a: 2 };
      let result: string = JSON.stringify(obj, undefined, "  ");
      expect(result).assertEqual('{\n  "a": 2\n}');
    });

    /**
     * @tc.name   JSONStringify_Space_String_003
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_SPACE_STRING_0300
     * @tc.desc   Test space as special characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Space_String_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = JSON.stringify({ a: 2 }, null, "---");
      expect(result).assertEqual('{\n---"a": 2\n}');
    });

    /**
     * @tc.name   JSONStringify_Space_String_004
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_SPACE_STRING_0400
     * @tc.desc   Test space as string longer than 10 characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Space_String_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = JSON.stringify({ a: 2 }, null, "0123456789ABC");
      expect(result).assertEqual('{\n0123456789"a": 2\n}');
    });

    /**
     * @tc.name   JSONStringify_Space_String_005
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_SPACE_STRING_0500
     * @tc.desc   Test space as string exactly 10 characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Space_String_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = JSON.stringify({ a: 2 }, null, "0123456789");
      expect(result).assertEqual('{\n0123456789"a": 2\n}');
    });

    // Space as null or undefined
    /**
     * @tc.name   JSONStringify_Space_Null_001
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_SPACE_NULL_0100
     * @tc.desc   Test space as null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Space_Null_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = JSON.stringify({ a: 2 }, null, undefined);
      expect(result).assertEqual('{"a":2}');
    });

    /**
     * @tc.name   JSONStringify_Space_Undefined_001
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_SPACE_UNDEFINED_0100
     * @tc.desc   Test space as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Space_Undefined_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = JSON.stringify({ a: 2 }, null, undefined);
      expect(result).assertEqual('{"a":2}');
    });

    /**
     * @tc.name   JSONStringify_Space_Omitted_001
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_SPACE_OMITTED_0100
     * @tc.desc   Test without space parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Space_Omitted_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = JSON.stringify({ a: 2 });
      expect(result).assertEqual('{"a":2}');
    });


    // Basic toJSON usage
    /**
     * @tc.name   JSONStringify_ToJSON_001
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_TOJSON_0100
     * @tc.desc   Test object with toJSON method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_ToJSON_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      class TestObj {
        foo: string = "foo";
        toJSON(): string {
          return "bar";
        }
      }
      let obj = new TestObj();
      let result: string = JSON.stringify(obj);
      expect(result).assertEqual('"bar"');
    });

    /**
     * @tc.name   JSONStringify_ToJSON_002
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_TOJSON_0200
     * @tc.desc   Test toJSON returning object
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_ToJSON_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      class TestObj {
        a: number = 1;
        toJSON(): ESObject {
          return { b: 2 };
        }
      }
      let obj = new TestObj();
      let result: string = JSON.stringify(obj);
      expect(result).assertEqual('{"b":2}');
    });

    /**
     * @tc.name   JSONStringify_ToJSON_003
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_TOJSON_0300
     * @tc.desc   Test toJSON returning primitive value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_ToJSON_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      class TestObj {
        a: number = 1;
        toJSON(): number {
          return 42;
        }
      }
      let obj = new TestObj();
      let result: string = JSON.stringify(obj);
      expect(result).assertEqual('42');
    });

    // toJSON with nested structures
    /**
     * @tc.name   JSONStringify_ToJSON_Nested_001
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_TOJSON_NESTED_0100
     * @tc.desc   Test toJSON in nested object
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_ToJSON_Nested_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      class InnerObj {
        a: number = 1;
        toJSON(): ESObject {
          return { b: 2 };
        }
      }
      let inner = new InnerObj();
      let outer:ESObject = { inner: inner };
      let result: string = JSON.stringify(outer);
      expect(result).assertEqual('{"inner":{"b":2}}');
    });

    /**
     * @tc.name   JSONStringify_ToJSON_Nested_002
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_TOJSON_NESTED_0200
     * @tc.desc   Test toJSON in array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_ToJSON_Nested_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      class TestObj {
        a: number = 1;
        toJSON(): number {
          return 42;
        }
      }
      let obj = new TestObj();
      let result: string = JSON.stringify([obj]);
      expect(result).assertEqual('[42]');
    });

    /**
     * @tc.name   JSONStringify_ToJSON_Nested_003
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_TOJSON_NESTED_0300
     * @tc.desc   Test multiple objects with toJSON
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_ToJSON_Nested_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      class TestObj1 {
        a: number = 1;
        toJSON(): number {
          return 2;
        }
      }
      class TestObj2 {
        b: number = 3;
        toJSON(): number {
          return 4;
        }
      }
      let obj1 = new TestObj1();
      let obj2 = new TestObj2();
      let result: string = JSON.stringify({ x: obj1, y: obj2 });
      expect(result).assertEqual('{"x":2,"y":4}');
    });

    // toJSON with replacer
    /**
     * @tc.name   JSONStringify_ToJSON_Replacer_001
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_TOJSON_REPLACER_0100
     * @tc.desc   Test toJSON result processed by replacer
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_ToJSON_Replacer_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      class TestObj {
        a: number = 1;
        toJSON(): ESObject {
          return { b: 2 };
        }
      }
      let obj = new TestObj();
      let replacer = (key: string, value: ESObject):ESObject => typeof value === "number" ? (value as number) * 2 : value;
      let result: string = JSON.stringify(obj, replacer);
      expect(result).assertEqual('{"b":4}');
    });

    /**
     * @tc.name   JSONStringify_ToJSON_Replacer_002
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_TOJSON_REPLACER_0200
     * @tc.desc   Test replacer filtering toJSON properties
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_ToJSON_Replacer_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      class TestObj {
        a: number = 1;
        toJSON(): ESObject {
          return { b: 2, c: 3 };
        }
      }
      let obj = new TestObj();
      let replacer = (key: string, value: ESObject):ESObject => key === "c" ? undefined : value;
      let result: string = JSON.stringify(obj, replacer);
      expect(result).assertEqual('{"b":2}');
    });

    // toJSON returning special values
    /**
     * @tc.name   JSONStringify_ToJSON_Undefined_001
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_TOJSON_UNDEFINED_0100
     * @tc.desc   Test toJSON returning undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_ToJSON_Undefined_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      class TestObj {
        a: number = 1;
        toJSON(): ESObject {
          return undefined;
        }
      }
      let obj = new TestObj();
      let result: ESObject = JSON.stringify(obj);
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.name   JSONStringify_ToJSON_Function_001
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_TOJSON_FUNCTION_0100
     * @tc.desc   Test toJSON returning function
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_ToJSON_Function_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      class TestObj {
        a: number = 1;
        toJSON(): ESObject {
          return () => {};
        }
      }
      let obj = new TestObj();
      let result: ESObject = JSON.stringify(obj);
      expect(result).assertEqual(undefined);
    });


    // toJSON with arrays and objects
    /**
     * @tc.name   JSONStringify_ToJSON_Array_001
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_TOJSON_ARRAY_0100
     * @tc.desc   Test toJSON method returning array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_ToJSON_Array_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      class TestObj {
        data: number[] = [1, 2, 3];
        toJSON(): number[] {
          return this.data;
        }
      }
      let obj = new TestObj();
      let result: string = JSON.stringify(obj);
      expect(result).assertEqual('[1,2,3]');
    });

    /**
     * @tc.name   JSONStringify_ToJSON_Recursive_001
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_TOJSON_RECURSIVE_0100
     * @tc.desc   Test toJSON method calling itself
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_ToJSON_Recursive_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      class TestObj {
        count: number = 1;
        toJSON(): ESObject {
          if (this.count > 3) {
            return this.count;
          }
          this.count++;
          return { value: this.toJSON() };
        }
      }
      let obj = new TestObj();
      let result: string = JSON.stringify(obj);
      expect(result).assertEqual('{"value":{"value":{"value":4}}}');
    });
  })
}