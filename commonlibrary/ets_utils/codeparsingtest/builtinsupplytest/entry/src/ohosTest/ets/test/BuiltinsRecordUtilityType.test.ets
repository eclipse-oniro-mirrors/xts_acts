/*
* Copyright (C) 2024 HiHope Open Source Organization.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { sleep } from '../testability/pages/CommonUtils';

export default function BuiltinsRecordUtilityTypeTest() {
  describe('BuiltinsRecordUtilityTypeTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(100)
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
     * @tc.number SUB_BUILTINS_RECORD_UTILITY_TEST_0100
     * @tc.name BuiltinsRecordUtilityTypeTest0100
     * @tc.desc Record Utility Type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsRecordUtilityTypeTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsRecordUtilityTypeTest0100';
      console.log(`${caseName} test start`);
      const numberRecord: Record<string, number> = {
        "one": 1,
        "two": 2,
        "three": 3
      };
      const stringRecord: Record<number, string> = {
        1: "apple",
        2: "banana",
        3: "cherry"
      };
      console.log(JSON.stringify(numberRecord));
      console.log(JSON.stringify(stringRecord));
      type KeyType = 'name' | 'age' | 'email';
      const userRecord: Record<KeyType, string> = {} as Record<KeyType, string>;
      userRecord.name = "John Doe";
      userRecord.age = "30";
      userRecord.email = "johndoe@example.com";
      console.log(JSON.stringify(userRecord));
      expect(JSON.stringify({"one":1,"two":2,"three":3})).assertEqual(JSON.stringify(numberRecord));
      expect(JSON.stringify({"1":"apple","2":"banana","3":"cherry"})).assertEqual(JSON.stringify(stringRecord));
      expect(JSON.stringify({"name":"John Doe","age":"30","email":"johndoe@example.com"})).assertEqual(JSON.stringify(userRecord));
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.number SUB_BUILTINS_RECORD_UTILITY_TEST_0200
     * @tc.name BuiltinsRecordUtilityTypeTest0200
     * @tc.desc Record Utility Type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsRecordUtilityTypeTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsRecordUtilityTypeTest0200';
      console.log(`${caseName} test start`);
      type StringKeys = 'key1' | 'key2' | 'key3';
      const stringRecord: Record<StringKeys, string> = {} as Record<StringKeys, string>;
      stringRecord.key1 = 'value1';
      stringRecord.key2 = 'value2';
      stringRecord.key3 = 'value3';
      console.log(JSON.stringify(stringRecord));
      type NumberKeys = 1 | 2 | 3;
      const numberRecord: Record<NumberKeys, number> = {
        1: 100,
        2: 200,
        3: 300
      };
      console.log(JSON.stringify(numberRecord));
      type MixedKeys = 'name' | 'age';
      type ValueUnion = string | number;
      const mixedRecord: Record<MixedKeys, ValueUnion> = {} as  Record<MixedKeys, ValueUnion>;
      mixedRecord.name = 'John';
      mixedRecord.age = 30
      console.log(JSON.stringify(mixedRecord));
      expect(JSON.stringify({"1":100,"2":200,"3":300})).assertEqual(JSON.stringify(numberRecord));
      expect(JSON.stringify({"key1":"value1","key2":"value2","key3":"value3"})).assertEqual(JSON.stringify(stringRecord));
      expect(JSON.stringify({"name":"John","age":30})).assertEqual(JSON.stringify(mixedRecord));
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.number SUB_BUILTINS_RECORD_UTILITY_TEST_0300
     * @tc.name BuiltinsRecordUtilityTypeTest0300
     * @tc.desc Record Utility Type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsRecordUtilityTypeTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsRecordUtilityTypeTest0300';
      console.log(`${caseName} test start`);
      type RecordInt8Array = Record<'myInt8Array', Int8Array>;
      const myInt8Array = new Int8Array([1, 2, 3]);
      const int8ArrayObj: RecordInt8Array = {} as RecordInt8Array;
      int8ArrayObj.myInt8Array = myInt8Array;
      console.log(JSON.stringify(Array.from(int8ArrayObj.myInt8Array)));
      expect(int8ArrayObj.myInt8Array[1]).assertEqual(2);
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.number SUB_BUILTINS_RECORD_UTILITY_TEST_0400
     * @tc.name BuiltinsRecordUtilityTypeTest0400
     * @tc.desc Record Utility Type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsRecordUtilityTypeTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsRecordUtilityTypeTest0400';
      console.log(`${caseName} test start`);
      type RecordUint8Array = Record<'myUint8Array', Uint8Array>;
      const myUint8Array = new Uint8Array([4, 5, 6]);
      const uint8ArrayObj: RecordUint8Array = {} as RecordUint8Array;
      uint8ArrayObj.myUint8Array = myUint8Array;
      console.log(JSON.stringify(Array.from(uint8ArrayObj.myUint8Array)));
      expect(uint8ArrayObj.myUint8Array[1]).assertEqual(5);
      console.log(`${caseName} test end`);
      Done();
    })



    /**
     * @tc.number SUB_BUILTINS_RECORD_UTILITY_TEST_0500
     * @tc.name BuiltinsRecordUtilityTypeTest0500
     * @tc.desc Record Utility Type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsRecordUtilityTypeTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsRecordUtilityTypeTest0500';
      console.log(`${caseName} test start`);
      type RecordUint8ClampedArray = Record<'myUint8ClampedArray', Uint8ClampedArray>;
      const myUint8ClampedArray = new Uint8ClampedArray([7, 8, 9]);
      const uint8ClampedArrayObj: RecordUint8ClampedArray = {} as RecordUint8ClampedArray;
      uint8ClampedArrayObj.myUint8ClampedArray = myUint8ClampedArray;
      console.log(JSON.stringify(Array.from(uint8ClampedArrayObj.myUint8ClampedArray)));
      expect(uint8ClampedArrayObj.myUint8ClampedArray[1]).assertEqual(8);
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.number SUB_BUILTINS_RECORD_UTILITY_TEST_0600
     * @tc.name BuiltinsRecordUtilityTypeTest0600
     * @tc.desc Record Utility Type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsRecordUtilityTypeTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsRecordUtilityTypeTest0600';
      console.log(`${caseName} test start`);
      type RecordInt16Array = Record<'myInt16Array', Int16Array>;
      const myInt16Array = new Int16Array([10, 11, 12]);
      const int16ArrayObj: RecordInt16Array = {} as RecordInt16Array;
      int16ArrayObj.myInt16Array = myInt16Array;
      console.log(JSON.stringify(Array.from(int16ArrayObj.myInt16Array)));
      expect(int16ArrayObj.myInt16Array[1]).assertEqual(11);
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.number SUB_BUILTINS_RECORD_UTILITY_TEST_0700
     * @tc.name BuiltinsRecordUtilityTypeTest0700
     * @tc.desc Record Utility Type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsRecordUtilityTypeTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsRecordUtilityTypeTest0700';
      console.log(`${caseName} test start`);
      type RecordUint16Array = Record<'myUint16Array', Uint16Array>;
      const myUint16Array = new Uint16Array([13, 14, 15]);
      const uint16ArrayObj: RecordUint16Array = {} as RecordUint16Array;
      uint16ArrayObj.myUint16Array = myUint16Array;
      console.log(JSON.stringify(Array.from(uint16ArrayObj.myUint16Array)));
      expect(uint16ArrayObj.myUint16Array[1]).assertEqual(14);
      console.log(`${caseName} test end`);
      Done();
    })

    /**
     * @tc.number SUB_BUILTINS_RECORD_UTILITY_TEST_0800
     * @tc.name BuiltinsRecordUtilityTypeTest0800
     * @tc.desc Record Utility Type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsRecordUtilityTypeTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsRecordUtilityTypeTest0800';
      console.log(`${caseName} test start`);
      type RecordInt32Array = Record<'myInt32Array', Int32Array>;
      const myInt32Array = new Int32Array([16, 17, 18]);
      const int32ArrayObj: RecordInt32Array = {} as RecordInt32Array;
      int32ArrayObj.myInt32Array = myInt32Array;
      console.log(JSON.stringify(Array.from(int32ArrayObj.myInt32Array)));
      expect(int32ArrayObj.myInt32Array[1]).assertEqual(17);
      console.log(`${caseName} test end`);
      Done();
    })

    /**
     * @tc.number SUB_BUILTINS_RECORD_UTILITY_TEST_0900
     * @tc.name BuiltinsRecordUtilityTypeTest0900
     * @tc.desc Record Utility Type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsRecordUtilityTypeTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsRecordUtilityTypeTest0900';
      console.log(`${caseName} test start`);
      type RecordUint32Array = Record<'myUint32Array', Uint32Array>;
      const myUint32Array = new Uint32Array([19, 20, 21]);
      const uint32ArrayObj: RecordUint32Array = {} as RecordUint32Array;
      uint32ArrayObj.myUint32Array = myUint32Array;
      console.log(JSON.stringify(Array.from(uint32ArrayObj.myUint32Array)));
      expect(uint32ArrayObj.myUint32Array[1]).assertEqual(20);
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.number SUB_BUILTINS_RECORD_UTILITY_TEST_1000
     * @tc.name BuiltinsRecordUtilityTypeTest1000
     * @tc.desc Record Utility Type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsRecordUtilityTypeTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsRecordUtilityTypeTest1000';
      console.log(`${caseName} test start`);
      type RecordFloat32Array = Record<'myFloat32Array', Float32Array>;
      const myFloat32Array = new Float32Array([22.5, 23.5, 24.5]);
      const float32ArrayObj: RecordFloat32Array = {} as RecordFloat32Array;
      float32ArrayObj.myFloat32Array = myFloat32Array;
      console.log(JSON.stringify(Array.from(float32ArrayObj.myFloat32Array)));
      expect(float32ArrayObj.myFloat32Array[1]).assertEqual(23.5);
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.number SUB_BUILTINS_RECORD_UTILITY_TEST_1100
     * @tc.name BuiltinsRecordUtilityTypeTest1100
     * @tc.desc Record Utility Type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsRecordUtilityTypeTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsRecordUtilityTypeTest1100';
      console.log(`${caseName} test start`);
      type RecordFloat64Array = Record<'myFloat64Array', Float64Array>;
      const myFloat64Array = new Float64Array([25.5, 26.5, 27.5]);
      const float64ArrayObj: RecordFloat64Array = {} as RecordFloat64Array;
      float64ArrayObj.myFloat64Array = myFloat64Array;
      console.log(JSON.stringify(Array.from(float64ArrayObj.myFloat64Array)));
      expect(float64ArrayObj.myFloat64Array[1]).assertEqual(26.5);
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.number SUB_BUILTINS_RECORD_UTILITY_TEST_1200
     * @tc.name BuiltinsRecordUtilityTypeTest1200
     * @tc.desc Record Utility Type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsRecordUtilityTypeTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsRecordUtilityTypeTest1200';
      console.log(`${caseName} test start`);
      type RecordDataView = Record<'myDataView', DataView>;
      const buffer = new ArrayBuffer(8);
      const dataView = new DataView(buffer);
      dataView.setInt32(0, 12345, true);
      const dataViewObj: RecordDataView = {} as RecordDataView;
      dataViewObj.myDataView = dataView;
      console.log(`${dataViewObj.myDataView.getInt32(0, true)}`);
      expect(dataViewObj.myDataView.getInt32(0, true)).assertEqual(12345);
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.number SUB_BUILTINS_RECORD_UTILITY_TEST_1300
     * @tc.name BuiltinsRecordUtilityTypeTest1300
     * @tc.desc Record Utility Type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsRecordUtilityTypeTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsRecordUtilityTypeTest1300';
      console.log(`${caseName} test start`);
      type RecordNumber = Record<'myNumber', number>;
      const myNumber: number = 42;
      const numberObj: RecordNumber = {} as RecordNumber;
      numberObj.myNumber = myNumber;
      expect(numberObj.myNumber).assertEqual(42);
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.number SUB_BUILTINS_RECORD_UTILITY_TEST_1400
     * @tc.name BuiltinsRecordUtilityTypeTest1400
     * @tc.desc Record Utility Type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsRecordUtilityTypeTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsRecordUtilityTypeTest1400';
      console.log(`${caseName} test start`);
      type RecordString = Record<'myString', string>;
      const myString: string = 'Hello, World!';
      const stringObj: RecordString = {} as RecordString;
      stringObj.myString = myString;
      expect(stringObj.myString).assertEqual('Hello, World!');
      console.log(`${caseName} test end`);
      Done();
    })

    /**
     * @tc.number SUB_BUILTINS_RECORD_UTILITY_TEST_1500
     * @tc.name BuiltinsRecordUtilityTypeTest1500
     * @tc.desc Record Utility Type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsRecordUtilityTypeTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsRecordUtilityTypeTest1500';
      console.log(`${caseName} test start`);
      type RecordBoolean = Record<'myBoolean', boolean>;
      const myBoolean: boolean = true;
      const booleanObj: RecordBoolean = {} as RecordBoolean;
      booleanObj.myBoolean = myBoolean;
      expect(booleanObj.myBoolean).assertEqual(true);
      console.log(`${caseName} test end`);
      Done();
    })



    /**
     * @tc.number SUB_BUILTINS_RECORD_UTILITY_TEST_1600
     * @tc.name BuiltinsRecordUtilityTypeTest1600
     * @tc.desc Record Utility Type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsRecordUtilityTypeTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsRecordUtilityTypeTest1600';
      console.log(`${caseName} test start`);
      type RecordTuple = Record<'myTuple', [string, number]>;
      const myTuple: [string, number] = ['apple', 5];
      const tupleObj: RecordTuple = {} as RecordTuple;
      tupleObj.myTuple = myTuple;
      expect(tupleObj.myTuple[0]).assertEqual('apple');
      expect(tupleObj.myTuple[1]).assertEqual(5);
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.number SUB_BUILTINS_RECORD_UTILITY_TEST_1700
     * @tc.name BuiltinsRecordUtilityTypeTest1700
     * @tc.desc Record Utility Type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsRecordUtilityTypeTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsRecordUtilityTypeTest1700';
      console.log(`${caseName} test start`);
      enum Color {
        Red,
        Green,
        Blue
      }
      type RecordEnum = Record<'myColor', Color>;
      const myColor: Color = Color.Blue;
      const enumObj: RecordEnum = {} as RecordEnum;
      enumObj.myColor = myColor;
      expect(enumObj.myColor).assertEqual(Color.Blue);
      console.log(`${caseName} test end`);
      Done();
    })

    /**
     * @tc.number SUB_BUILTINS_RECORD_UTILITY_TEST_1800
     * @tc.name BuiltinsRecordUtilityTypeTest1800
     * @tc.desc Record Utility Type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsRecordUtilityTypeTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsRecordUtilityTypeTest1800';
      console.log(`${caseName} test start`);
      type RecordSet = Record<'mySet', Set<number>>;
      const mySet: Set<number> = new Set([1, 2, 3]);
      const setObj: RecordSet = {} as RecordSet;
      setObj.mySet = mySet;
      expect(setObj.mySet.has(2)).assertEqual(true);
      console.log(`${caseName} test end`);
      Done();
    })



    /**
     * @tc.number SUB_BUILTINS_RECORD_UTILITY_TEST_1900
     * @tc.name BuiltinsRecordUtilityTypeTest1900
     * @tc.desc Record Utility Type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsRecordUtilityTypeTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsRecordUtilityTypeTest1900';
      console.log(`${caseName} test start`);
      type RecordMap = Record<'myMap', Map<string, number>>;
      const myMap: Map<string, number> = new Map([['one', 1], ['two', 2]]);
      const mapObj: RecordMap = {} as RecordMap;
      mapObj.myMap = myMap;
      expect(mapObj.myMap.get('two')).assertEqual(2);
      console.log(`${caseName} test end`);
      Done();
    })



    /**
     * @tc.number SUB_BUILTINS_RECORD_UTILITY_TEST_2000
     * @tc.name BuiltinsRecordUtilityTypeTest2000
     * @tc.desc Record Utility Type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsRecordUtilityTypeTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsRecordUtilityTypeTest2000';
      console.log(`${caseName} test start`);
      type RecordBigInt = Record<'myBigInt', bigint>;
      const myBigInt: bigint = 9007199254740991n;
      const bigIntObj: RecordBigInt = {} as RecordBigInt;
      bigIntObj.myBigInt = myBigInt;
      expect(bigIntObj.myBigInt).assertEqual(9007199254740991n);
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.number SUB_BUILTINS_RECORD_UTILITY_TEST_2100
     * @tc.name BuiltinsRecordUtilityTypeTest2100
     * @tc.desc Record Utility Type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsRecordUtilityTypeTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsRecordUtilityTypeTest2100';
      console.log(`${caseName} test start`);
      interface Person {
        name: string;
        age: number;
      }
      type RecordObject = Record<'myPerson', Person>;
      const myPerson: Person = { name: 'Alice', age: 30 };
      const objectObj: RecordObject = {} as RecordObject;
      objectObj.myPerson = myPerson;
      expect(objectObj.myPerson.name).assertEqual('Alice');
      expect(objectObj.myPerson.age).assertEqual(30);
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.number SUB_BUILTINS_RECORD_UTILITY_TEST_2200
     * @tc.name BuiltinsRecordUtilityTypeTest2200
     * @tc.desc Record Utility Type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsRecordUtilityTypeTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsRecordUtilityTypeTest2200';
      console.log(`${caseName} test start`);
      type RecordNull = Record<'myNullValue', null>;
      const myNullValue: null = null;
      const nullObj: RecordNull = {} as RecordNull;
      nullObj.myNullValue = myNullValue;
      expect(nullObj.myNullValue).assertEqual(null);
      console.log(`${caseName} test end`);
      Done();
    })



    /**
     * @tc.number SUB_BUILTINS_RECORD_UTILITY_TEST_2300
     * @tc.name BuiltinsRecordUtilityTypeTest2300
     * @tc.desc Record Utility Type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsRecordUtilityTypeTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsRecordUtilityTypeTest2300';
      console.log(`${caseName} test start`);
      type RecordUndefined = Record<'myUndefinedValue', undefined>;
      const myUndefinedValue: undefined = undefined;
      const undefinedObj: RecordUndefined = {} as RecordUndefined;
      undefinedObj.myUndefinedValue = myUndefinedValue;
      expect(undefinedObj.myUndefinedValue).assertEqual(undefined);
      console.log(`${caseName} test end`);
      Done();
    })



    /**
     * @tc.number SUB_BUILTINS_RECORD_UTILITY_TEST_2400
     * @tc.name BuiltinsRecordUtilityTypeTest2400
     * @tc.desc Record Utility Type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsRecordUtilityTypeTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsRecordUtilityTypeTest2400';
      console.log(`${caseName} test start`);
      type AddFunction = (a: number, b: number) => number;
      type RecordFunction = Record<'myFunction', AddFunction>;
      const myFunction: AddFunction = (a, b) => a + b;
      const functionObj: RecordFunction = {} as RecordFunction;
      functionObj.myFunction = myFunction;
      expect(functionObj.myFunction(2, 3)).assertEqual(5);
      console.log(`${caseName} test end`);
      Done();
    })



    /**
     * @tc.number SUB_BUILTINS_RECORD_UTILITY_TEST_2500
     * @tc.name BuiltinsRecordUtilityTypeTest2500
     * @tc.desc Record Utility Type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsRecordUtilityTypeTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsRecordUtilityTypeTest2500';
      console.log(`${caseName} test start`);
      type RecordArray = Record<'myArray', number[]>;
      const myArray: number[] = [1, 2, 3];
      const arrayObj: RecordArray = {} as RecordArray;
      arrayObj.myArray = myArray;
      expect(arrayObj.myArray[1]).assertEqual(2);
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.number SUB_BUILTINS_RECORD_UTILITY_TEST_2600
     * @tc.name BuiltinsRecordUtilityTypeTest2600
     * @tc.desc Record Utility Type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsRecordUtilityTypeTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsRecordUtilityTypeTest2600';
      console.log(`${caseName} test start`);
      type RecordDate = Record<'myDate', Date>;
      const myDate: Date = new Date('2025-03-20');
      const dateObj: RecordDate = {} as RecordDate;
      dateObj.myDate = myDate;
      expect(dateObj.myDate.getFullYear()).assertEqual(2025);
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.number SUB_BUILTINS_RECORD_UTILITY_TEST_2700
     * @tc.name BuiltinsRecordUtilityTypeTest2700
     * @tc.desc Record Utility Type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsRecordUtilityTypeTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsRecordUtilityTypeTest2700';
      console.log(`${caseName} test start`);
      type RecordRegExp = Record<'myRegExp', RegExp>;
      const myRegExp: RegExp = /abc/;
      const regExpObj: RecordRegExp = {} as RecordRegExp;
      regExpObj.myRegExp = myRegExp;
      expect(regExpObj.myRegExp.test('abc')).assertEqual(true);
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.number SUB_BUILTINS_RECORD_UTILITY_TEST_2800
     * @tc.name BuiltinsRecordUtilityTypeTest2800
     * @tc.desc Record Utility Type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsRecordUtilityTypeTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsRecordUtilityTypeTest2800';
      console.log(`${caseName} test start`);
      class Animal {
        public name: string;
        constructor(name: string) {
          this.name = name;
        }
        speak() {
          return `I'm ${this.name}`;
        }
      }
      type RecordAnimal = Record<'myAnimal', Animal>;
      const myAnimal: Animal = new Animal('Dog');
      const animalObj: RecordAnimal = {} as RecordAnimal;
      animalObj.myAnimal = myAnimal;
      expect(animalObj.myAnimal.speak()).assertEqual("I'm Dog");
      console.log(`${caseName} test end`);
      Done();
    })



    /**
     * @tc.number SUB_BUILTINS_RECORD_UTILITY_TEST_2900
     * @tc.name BuiltinsRecordUtilityTypeTest2900
     * @tc.desc Record Utility Type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsRecordUtilityTypeTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsRecordUtilityTypeTest2900';
      console.log(`${caseName} test start`);
      interface Address {
        street: string;
        city: string;
      }
      interface NestedPerson {
        name: string;
        address: Address;
      }
      type RecordNestedPerson = Record<'myNestedPerson', NestedPerson>;
      const myNestedPerson: NestedPerson = {
        name: 'Charlie',
        address: { street: '123 Main St', city: 'Anytown' }
      };
      const nestedPersonObj: RecordNestedPerson = {} as RecordNestedPerson;
      nestedPersonObj.myNestedPerson = myNestedPerson;
      expect(nestedPersonObj.myNestedPerson.name).assertEqual('Charlie');
      expect(nestedPersonObj.myNestedPerson.address.street).assertEqual('123 Main St');
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.number SUB_BUILTINS_RECORD_UTILITY_TEST_3000
     * @tc.name BuiltinsRecordUtilityTypeTest3000
     * @tc.desc Record Utility Type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsRecordUtilityTypeTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsRecordUtilityTypeTest3000';
      console.log(`${caseName} test start`);
      interface OptionalPerson {
        name?: string;
        age?: number;
      }
      type RecordOptionalPerson = Record<'myOptionalPerson', OptionalPerson>;
      const myOptionalPerson: OptionalPerson = { name: 'Bob' };
      const optionalPersonObj: RecordOptionalPerson = {} as RecordOptionalPerson;
      optionalPersonObj.myOptionalPerson = myOptionalPerson;
      expect(optionalPersonObj.myOptionalPerson.name).assertEqual('Bob');
      console.log(`${caseName} test end`);
      Done();
    })
  })
}