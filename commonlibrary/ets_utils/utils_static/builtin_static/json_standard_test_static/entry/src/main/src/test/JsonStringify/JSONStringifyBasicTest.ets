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
import { describe, it, expect, TestType, Size, Level, beforeAll} from "../../../../hypium/index";

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

interface JSONStringify_Error_003{
  err:Error;
}

interface DateObj {
  date: Date;
}

interface NaNObj {
  a: number;
}

interface InfinityObj {
  a: number;
  b: number;
}

interface ABObj {
  a: number;
  b: number;
}

interface ToJSONNestedObj {
  inner: InnerObjClass;
}

interface ToJSONResult1 {
  b: number;
}

interface ToJSONResult2 {
  b: number;
  c: number;
}

interface ToJSONRecursiveResult {
  value: ToJSONRecursiveResult | number;
}

interface OuterObj {
  inner: InnerObjClass;
}

interface SimpleObj {
  a: number;
}

interface ToJSONNestedTestObj {
  x: ToJSONReplacerClass1;
  y: ToJSONReplacerClass2;
}

class ToJSONTestClass1 implements JsonSerializable {
  foo: string = "foo";
  toJSON(): string {
    return "bar";
  }
}

class ToJSONTestClass2 implements JsonSerializable {
  a: number = 1;
  toJSON(): string {
    return '{ b: 2 }';
  }
}

class ToJSONTestClass3 implements JsonSerializable {
  a: number = 1;
  toJSON(): string {
    return '42';
  }
}

class InnerObjClass implements JsonSerializable {
  a: number = 1;
  toJSON(): string {
    return '{ b: 2 }';
  }
}

class ToJSONTestClass4 implements JsonSerializable {
  a: number = 1;
  toJSON(): string {
    return '42';
  }
}

class TestObj1Class  implements JsonSerializable{
  a: number = 1;
  toJSON(): string {
    return '2';
  }
}

class TestObj2Class implements JsonSerializable {
  b: number = 3;
  toJSON(): string {
    return '4';
  }
}

class ToJSONReplacerClass1 implements JsonSerializable {
  a: number = 1;
  toJSON(): string {
    return '{ b: 2 }';
  }
}

class ToJSONReplacerClass2 implements JsonSerializable {
  a: number = 1;
  toJSON(): string {
    return '{ b: 2, c: 3 }';
  }
}

class ToJSONUndefinedClass implements JsonSerializable {
  a: number = 1;
  toJSON(): string {
    return 'undefined';
  }
}

class ToJSONFunctionClass implements JsonSerializable {
  a: number = 1;
  toJSON(): string {
    return '() => {}';
  }
}

class ToJSONArrayClass implements JsonSerializable {
  data: number[] = [1, 2, 3];
  toJSON(): string {
    return JSON.stringify(this.data);
  }
}

// class ToJSONRecursiveClass  implements JsonSerializable{
//   count: number = 1;
//   toJSON(): string {
//     if (this.count > 3) {
//       return JSON.stringify(this.count);
//     }
//     this.count++;
//     return JSON.stringify({ value: this.toJSON() } as ToJSONRecursiveClass);
//   }
// }
//
// class ToJSONReplacerTestObj  implements JsonSerializable {
//   a: number = 1;
//   toJSON(): string {
//     return JSON.stringify({ b: 2, c: 3 } as ToJSONReplacerTestObj);
//   }
// }

export default function JSONStringifyBasicTest() {
  describe('JSONStringifyBasicTest', () => {
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
    })

    /**
     * @tc.name   JSONStringify_Basic_String_001
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_BASIC_0100
     * @tc.desc   Test string serialization
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Basic_String_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = JSON.stringify("foo");
      expect(result).assertEqual('"foo"');
    });

    /**
     * @tc.name   JSONStringify_Basic_Number_001
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_BASIC_0200
     * @tc.desc   Test number serialization
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Basic_Number_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = JSON.stringify(123);
      expect(result).assertEqual('123');
    });

    /**
     * @tc.name   JSONStringify_Basic_Boolean_001
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_BASIC_0300
     * @tc.desc   Test boolean true serialization
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Basic_Boolean_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = JSON.stringify(true);
      expect(result).assertEqual('true');
    });

    /**
     * @tc.name   JSONStringify_Basic_Boolean_002
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_BASIC_0400
     * @tc.desc   Test boolean false serialization
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Basic_Boolean_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = JSON.stringify(false);
      expect(result).assertEqual('false');
    });

    /**
     * @tc.name   JSONStringify_Basic_Null_001
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_BASIC_0500
     * @tc.desc   Test null serialization
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Basic_Null_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = JSON.stringify(null);
      expect(result).assertEqual('null');
    });

    /**
     * @tc.name   JSONStringify_Basic_Object_001
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_BASIC_0600
     * @tc.desc   Test empty object serialization
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Basic_Object_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Basic_Object_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Basic_Object_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let obj: TestObj = { x: 5, y: 6 };
      let result: string = JSON.stringify(obj);
      expect(result).assertEqual('{"x":5,"y":6}');
    });

    /**
     * @tc.name   JSONStringify_Basic_Array_002
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_BASIC_1000
     * @tc.desc   Test simple array serialization
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Basic_Array_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Basic_Array_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Basic_Mixed_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Basic_Mixed_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Basic_Mixed_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Circular_Object_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let obj: Record<string, Object> = {};
      obj['self'] = obj;
      try {
        JSON.stringify(obj);
      } catch (e) {
        expect(e instanceof Error).assertTrue();
        // In ArkTS, this should also throw a TypeError
      }
    });

    /**
     * @tc.name   JSONStringify_Circular_Indirect_001
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_CIRCULAR_0300
     * @tc.desc   Test indirect circular reference - two objects referencing each other
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Circular_Indirect_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let obj1: Record<string, Object> = {};
      let obj2: Record<string, Object> = {};
      obj1['ref'] = obj2;
      obj2['ref'] = obj1;
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
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Circular_Multiple_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let obj1: Record<string, Object> = {};
      let obj2: Record<string, Object> = {};
      let obj3: Record<string, Object> = {};
      obj1['ref'] = obj2;
      obj2['ref'] = obj3;
      obj3['ref'] = obj1;
      try {
        JSON.stringify(obj1);
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
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Circular_Array_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let obj: Record<string, Object> = {};
      let arr: Object[] = new Array<Object>();;
      obj['arr'] = arr;
      arr.push(obj);
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
     * @tc.level  LEVEL1
     */
    it('JSONStringify_TypeError_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let obj: Record<string, Object> = {};
      obj['self'] = obj;
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
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Error_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = JSON.stringify(new Error("error"));
      expect(result).assertEqual('{}');
    });

    /**
     * @tc.name   JSONStringify_Error_002
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_ERROR_0200
     * @tc.desc   Test Error object in array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Error_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = JSON.stringify([new Error("error")]);
      expect(result).assertEqual('[{}]');
    });

    /**
     * @tc.name   JSONStringify_Error_003
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_ERROR_0300
     * @tc.desc   Test Error object in object
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Error_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {

      let result: string = JSON.stringify({ err: new Error("error") } as JSONStringify_Error_003);
      expect(result).assertEqual('{"err":{}}');
    });

    // Other error cases
    /**
     * @tc.name   JSONStringify_InvalidInput_001
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_INVALIDINPUT_0100
     * @tc.desc   Test null is valid and serializable
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_InvalidInput_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = JSON.stringify(null);
      expect(result).assertEqual('null');
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
      let obj: Record<string, string> = {};
      obj['2'] = "b";
      obj['1'] = "a";
      obj['3'] = "c";
      let result: string = JSON.stringify(obj);
      expect(result).assertEqual('{"2":"b","1":"a","3":"c"}');
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
      let obj: Record<string, number|string> = {};
      obj['a'] = 1;
      obj['2'] = "b";
      obj['1'] = "c";
      let result: string = JSON.stringify(obj);
      expect(result).assertEqual('{"a":1,"2":"b","1":"c"}');
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
      let obj: Record<string, Any> = {};
      obj['0'] = "a";
      obj['1'] = "b";
      obj['2'] = "c";
      obj['length'] = 3;
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
      let obj: Record<string, string> = {};
      obj['0'] = "a";
      obj['1'] = "b";
      obj['name'] = "test";
      let result: string = JSON.stringify(obj);
      expect(result).assertEqual('{"0":"a","1":"b","name":"test"}');
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
      let obj: DateObj = { date: new Date(2006, 0, 2) };
      let result: string = JSON.stringify(obj);
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
      let obj: NaNObj = { a: NaN };
      let result: string = JSON.stringify(obj);
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
      let obj: InfinityObj = { a: Infinity, b: -Infinity };
      let result: string = JSON.stringify(obj);
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
      let obj: ABObj = { a: 1, b: 2 };
      let result: string = JSON.stringify(obj);
      expect(result).assertEqual('{"a":1,"b":2}');
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
      let map: Map<string, number> = new Map<string, number>([["a", 1], ["b", 2]]);
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
      let set: Set<number> = new Set<number>([1, 2, 3]);
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
      let weakMap: WeakMap<Object, Object> = new WeakMap<Object, Object>();
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
      let weakSet: WeakSet<Object> = new WeakSet<Object>();
      let result: string = JSON.stringify(weakSet);
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
      let obj: SimpleObj = { a: 2 };
      let result: string = JSON.stringify(obj, null, "---");
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
      let obj: SimpleObj = { a: 2 };
      let result: string = JSON.stringify(obj, null, "0123456789ABC");
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
      let obj: SimpleObj = { a: 2 };
      let result: string = JSON.stringify(obj, null, "0123456789");
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
      let obj: SimpleObj = { a: 2 };
      let result: string = JSON.stringify(obj, null, undefined);
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
      let obj: SimpleObj = { a: 2 };
      let result: string = JSON.stringify(obj, null, undefined);
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
      let obj: SimpleObj = { a: 2 };
      let result: string = JSON.stringify(obj);
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
      let obj = new ToJSONTestClass1();
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
      let obj = new ToJSONTestClass2();
      let result: string = JSON.stringify(obj);
      expect(result).assertEqual('"{ b: 2 }"');
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
      let obj = new ToJSONTestClass3();
      let result: string = JSON.stringify(obj);
      expect(result).assertEqual('"42"');
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
      let inner = new InnerObjClass();
      let outer: OuterObj = { inner: inner };
      let result: string = JSON.stringify(outer);
      expect(result).assertEqual('{"inner":"{ b: 2 }"}');
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
      let obj = new ToJSONTestClass3();
      let result: string = JSON.stringify([obj]);
      expect(result).assertEqual('["42"]');
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
      let obj1 = new ToJSONReplacerClass1();
      let obj2 = new ToJSONReplacerClass2();
      let wrapper: ToJSONNestedTestObj = { x: obj1, y: obj2 };
      let result: string = JSON.stringify(wrapper);
      expect(result).assertEqual('{"x":"{ b: 2 }","y":"{ b: 2, c: 3 }"}');
    });

    // // toJSON with replacer
    /**
     * @tc.name   JSONStringify_ToJSON_Replacer_001
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_TOJSON_REPLACER_0100
     * @tc.desc   Test toJSON result processed by replacer
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_ToJSON_Replacer_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let obj = new ToJSONReplacerClass2();
      let replacer = (key: string, value: Any): Any => {
        if (typeof value === "number") {
          return (value as number) * 2;
        }
        return value as ToJSONReplacerClass2;
      };
      let result: string = JSON.stringify(obj, replacer);
      expect(result).assertEqual('"{ b: 2, c: 3 }"');
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
      let obj = new ToJSONUndefinedClass();
      let result: string | undefined = JSON.stringify(obj);
      expect(result).assertEqual('"undefined"');
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
      let obj = new ToJSONFunctionClass();
      let result: string | undefined = JSON.stringify(obj);
      expect(result).assertEqual('"() => {}"');
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
      let obj = new ToJSONArrayClass();
      let result: string = JSON.stringify(obj);
      expect(result).assertEqual('"[1,2,3]"');
    });

  })
}