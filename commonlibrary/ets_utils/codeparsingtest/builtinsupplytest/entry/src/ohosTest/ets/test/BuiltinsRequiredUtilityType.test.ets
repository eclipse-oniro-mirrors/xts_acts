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
import { hasProperty, sleep } from '../testability/pages/CommonUtils';

export default function BuiltinsRequiredUtilityTypeTest() {
  describe('BuiltinsRequiredUtilityTypeTest', () => {
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
     * @tc.number SUB_BUILTINS_REQUIRED_UTILITY_TEST_0100
     * @tc.name BuiltinsRequiredUtilityTypeTest0100
     * @tc.desc Required Utility Type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsRequiredUtilityTypeTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'BuiltinsRequiredUtilityTypeTest0100';
        console.log(`${caseName} test start`);
        interface Person {
          name?: string;
          age?: number;
          address?: string;
        }
        type RequiredPerson = Required<Person>;
        const person: RequiredPerson = {
          name: '',
          age: 0,
          address: ''
        };
        console.log(JSON.stringify(person));
        expect(JSON.stringify({
          "name": "", "age": 0, "address": ""
        })).assertEqual(JSON.stringify(person));
        console.log(`${caseName} test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_REQUIRED_UTILITY_TEST_0200
     * @tc.name BuiltinsRequiredUtilityTypeTest0200
     * @tc.desc Required Utility Type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsRequiredUtilityTypeTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'BuiltinsRequiredUtilityTypeTest0200';
        console.log(`${caseName} test start`);
        interface Book {
          title?: string;
          author?: string;
          year?: number;
        }
        type RequiredBook = Required<Book>;
        const myBook: RequiredBook = {
          title: '',
          author: '',
          year: 10,
        };
        console.log(JSON.stringify(myBook));
        expect(10).assertEqual(myBook.year);
        console.log(`${caseName} test end`);
        Done();
      })


    /**
     * @tc.number SUB_BUILTINS_REQUIRED_UTILITY_TEST_0300
     * @tc.name BuiltinsRequiredUtilityTypeTest0300
     * @tc.desc Required Utility Type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsRequiredUtilityTypeTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'BuiltinsRequiredUtilityTypeTest0300';
        console.log(`${caseName} test start`);
        interface UserName {
          name?: string;
          sex?: string
          age?: number;
        }
        type RequiredUser = Required<UserName>;
        const myUser: RequiredUser = {
          name: 'xi',
          sex: 'nan',
          age: 10,
        };
        console.log(JSON.stringify(myUser));
        expect('xi').assertEqual(myUser.name);
        expect('nan').assertEqual(myUser.sex);
        expect(10).assertEqual(myUser.age);
        console.log(`${caseName} test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_REQUIRED_UTILITY_TEST_0400
     * @tc.name BuiltinsRequiredUtilityTypeTest0400
     * @tc.desc Required Utility Type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsRequiredUtilityTypeTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'BuiltinsRequiredUtilityTypeTest0400';
        console.log(`${caseName} test start`);
        interface UserAge {
          name?: string;
          sex?: string
          age?: number;
        }
        type RequiredUser = Required<UserAge>;
        const myUser: RequiredUser = {
          name: 'xi',
          sex: 'nan',
          age: 0,
        };
        let age = 20
        myUser.age = age + 10
        console.log(JSON.stringify(myUser));
        expect(30).assertEqual(myUser.age);
        console.log(`${caseName} test end`);
        Done();
      })


    /**
     * @tc.number SUB_BUILTINS_REQUIRED_UTILITY_TEST_0500
     * @tc.name BuiltinsRequiredUtilityTypeTest0500
     * @tc.desc Required Utility Type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsRequiredUtilityTypeTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
        const caseName = 'BuiltinsRequiredUtilityTypeTest0500';
        console.log(`${caseName} test start`);
        interface StringType {
          value?: string;
        }
        type RequiredString = Required<StringType>;
        const myString: RequiredString = {
          value: 'test string',
        };
        console.log(JSON.stringify(myString));
        expect(myString.value).assertEqual('test string');
        console.log(`${caseName} test end`);
        Done();
      })


    /**
     * @tc.number SUB_BUILTINS_REQUIRED_UTILITY_TEST_0600
     * @tc.name BuiltinsRequiredUtilityTypeTest0600
     * @tc.desc Required Utility Type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsRequiredUtilityTypeTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsRequiredUtilityTypeTest0600';
      console.log(`${caseName} test start`);
      interface NumberType {
        value?: number;
      }
      type RequiredNumber = Required<NumberType>;
      const myNumber: RequiredNumber = {
        value: 123,
      };
      console.log(JSON.stringify(myNumber));
      expect(myNumber.value).assertEqual(123);
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.number SUB_BUILTINS_REQUIRED_UTILITY_TEST_0700
     * @tc.name BuiltinsRequiredUtilityTypeTest0700
     * @tc.desc Required Utility Type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsRequiredUtilityTypeTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsRequiredUtilityTypeTest0700';
      console.log(`${caseName} test start`);
      interface BooleanType {
        value?: boolean;
      }
      type RequiredBoolean = Required<BooleanType>;
      const myBoolean: RequiredBoolean = {
        value: true,
      };
      console.log(JSON.stringify(myBoolean));
      expect(myBoolean.value).assertEqual(true);
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.number SUB_BUILTINS_REQUIRED_UTILITY_TEST_0800
     * @tc.name BuiltinsRequiredUtilityTypeTest0800
     * @tc.desc Required Utility Type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsRequiredUtilityTypeTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsRequiredUtilityTypeTest0800';
      console.log(`${caseName} test start`);
      interface DataViewInterface {
        myDataView: DataView;
      }
      type RequiredDataViewInterface = Required<DataViewInterface>;
      const buffer = new ArrayBuffer(8);
      const myDataView = new DataView(buffer);
      myDataView.setInt32(0, 123456);
      const dataViewObj: RequiredDataViewInterface = { myDataView: myDataView ?? new DataView(new ArrayBuffer(0)) };
      console.log(`${dataViewObj.myDataView.getInt32(0)}`);
      if (dataViewObj.myDataView) {
        expect(dataViewObj.myDataView.getInt32(0)).assertEqual(123456);
      } else {
        throw new Error('myDataView is undefined');
      }
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.number SUB_BUILTINS_REQUIRED_UTILITY_TEST_0900
     * @tc.name BuiltinsRequiredUtilityTypeTest0900
     * @tc.desc Required Utility Type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsRequiredUtilityTypeTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsRequiredUtilityTypeTest0900';
      console.log(`${caseName} test start`);
      interface NullType {
        value?: null;
      }
      type RequiredNull = Required<NullType>;
      const myNull: RequiredNull = {
        value: null,
      };
      console.log(JSON.stringify(myNull));
      expect(myNull.value).assertEqual(null);
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.number SUB_BUILTINS_REQUIRED_UTILITY_TEST_1000
     * @tc.name BuiltinsRequiredUtilityTypeTest1000
     * @tc.desc Required Utility Type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsRequiredUtilityTypeTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsRequiredUtilityTypeTest1000';
      console.log(`${caseName} test start`);
      interface UndefinedType {
        value: undefined;
      }
      type RequiredUndefined = Required<UndefinedType>;
      const myUndefined: RequiredUndefined = {
        value: undefined,
      };
      console.log(JSON.stringify(myUndefined));
      expect(myUndefined.value).assertEqual(undefined);
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.number SUB_BUILTINS_REQUIRED_UTILITY_TEST_1100
     * @tc.name BuiltinsRequiredUtilityTypeTest1100
     * @tc.desc Required Utility Type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsRequiredUtilityTypeTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsRequiredUtilityTypeTest1100';
      console.log(`${caseName} test start`);
      interface ArrayType {
        value?: number[];
      }
      type RequiredArray = Required<ArrayType>;
      const myArray: RequiredArray = {
        value: [1, 2, 3],
      };
      console.log(JSON.stringify(myArray));
      expect(JSON.stringify(myArray.value)).assertEqual(JSON.stringify([1, 2, 3]));
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.number SUB_BUILTINS_REQUIRED_UTILITY_TEST_1200
     * @tc.name BuiltinsRequiredUtilityTypeTest1200
     * @tc.desc Required Utility Type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsRequiredUtilityTypeTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsRequiredUtilityTypeTest1200';
      console.log(`${caseName} test start`);
      interface InnerObject {
        prop1: string;
        prop2: number;
      }
      interface ObjectType {
        value?: InnerObject;
      }
      type RequiredObject = Required<ObjectType>;
      const myObject: RequiredObject = {
        value: {
          prop1: 'test',
          prop2: 456,
        },
      };
      console.log(JSON.stringify(myObject));
      expect(JSON.stringify(myObject.value)).assertEqual(JSON.stringify({ prop1: 'test', prop2: 456 }));
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.number SUB_BUILTINS_REQUIRED_UTILITY_TEST_1300
     * @tc.name BuiltinsRequiredUtilityTypeTest1300
     * @tc.desc Required Utility Type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsRequiredUtilityTypeTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsRequiredUtilityTypeTest1300';
      console.log(`${caseName} test start`);
      interface BigIntType {
        value?: bigint;
      }
      type RequiredBigInt = Required<BigIntType>;
      const myBigInt: RequiredBigInt = {
        value: 12345678901234567890n,
      };
      console.log(myBigInt.value.toString());
      expect(typeof myBigInt.value).assertEqual('bigint');
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.number SUB_BUILTINS_REQUIRED_UTILITY_TEST_1400
     * @tc.name BuiltinsRequiredUtilityTypeTest1400
     * @tc.desc Required Utility Type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsRequiredUtilityTypeTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsRequiredUtilityTypeTest1400';
      console.log(`${caseName} test start`);
      interface FunctionType {
        value?: (a: number, b: number) => number;
      }
      type RequiredFunction = Required<FunctionType>;
      const myFunction: RequiredFunction = {
        value: (a, b) => a + b,
      };
      console.log(myFunction.value.toString());
      expect(typeof myFunction.value).assertEqual('function');
      expect(myFunction.value(1, 2)).assertEqual(3);
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.number SUB_BUILTINS_REQUIRED_UTILITY_TEST_1500
     * @tc.name BuiltinsRequiredUtilityTypeTest1500
     * @tc.desc Required Utility Type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsRequiredUtilityTypeTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsRequiredUtilityTypeTest1500';
      console.log(`${caseName} test start`);
      interface TupleType {
        value?: [string, number];
      }
      type RequiredTuple = Required<TupleType>;
      const myTuple: RequiredTuple = {
        value: ['test', 123],
      };
      console.log(JSON.stringify(myTuple));
      expect(JSON.stringify(myTuple.value)).assertEqual(JSON.stringify(['test', 123]));
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.number SUB_BUILTINS_REQUIRED_UTILITY_TEST_1600
     * @tc.name BuiltinsRequiredUtilityTypeTest1600
     * @tc.desc Required Utility Type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsRequiredUtilityTypeTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsRequiredUtilityTypeTest1600';
      console.log(`${caseName} test start`);
      enum Color {
        Red,
        Green,
        Blue
      }
      interface EnumType {
        value?: Color;
      }
      type RequiredEnum = Required<EnumType>;
      const myEnum: RequiredEnum = {
        value: Color.Green,
      };
      expect(myEnum.value).assertEqual(Color.Green);
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.number SUB_BUILTINS_REQUIRED_UTILITY_TEST_1700
     * @tc.name BuiltinsRequiredUtilityTypeTest1700
     * @tc.desc Required Utility Type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsRequiredUtilityTypeTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsRequiredUtilityTypeTest1700';
      console.log(`${caseName} test start`);
      interface VoidType {
        value?: () => void;
      }
      type RequiredVoid = Required<VoidType>;
      const myVoid: RequiredVoid = {
        value: () => { },
      };
      console.log(typeof myVoid.value);
      expect(typeof myVoid.value).assertEqual('function');
      console.log(`${caseName} test end`);
      Done();
    })



    /**
     * @tc.number SUB_BUILTINS_REQUIRED_UTILITY_TEST_1800
     * @tc.name BuiltinsRequiredUtilityTypeTest1800
     * @tc.desc Required Utility Type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsRequiredUtilityTypeTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsRequiredUtilityTypeTest1800';
      console.log(`${caseName} test start`);
      type StringOrNumber = string | number;
      interface UnionTypeType {
        value?: StringOrNumber;
      }
      type RequiredUnionType = Required<UnionTypeType>;
      const myUnionType: RequiredUnionType = {
        value: 123,
      };
      console.log(typeof myUnionType.value);
      expect(typeof myUnionType.value).assertEqual('number');
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.number SUB_BUILTINS_REQUIRED_UTILITY_TEST_1900
     * @tc.name BuiltinsRequiredUtilityTypeTest1900
     * @tc.desc Required Utility Type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsRequiredUtilityTypeTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsRequiredUtilityTypeTest1900';
      console.log(`${caseName} test start`);
      interface Uint8ClampedArrayInterface {
        myUint8ClampedArray: Uint8ClampedArray;
      }
      type RequiredUint8ClampedArrayInterface = Required<Uint8ClampedArrayInterface>;
      const myUint8ClampedArray = new Uint8ClampedArray([35, 40, 45]);
      const uint8ClampedArrayObj: RequiredUint8ClampedArrayInterface = { myUint8ClampedArray: myUint8ClampedArray ?? new Uint8ClampedArray() };
      console.log(JSON.stringify(Array.from(uint8ClampedArrayObj.myUint8ClampedArray ?? new Uint8ClampedArray())));
      if (uint8ClampedArrayObj.myUint8ClampedArray) {
        expect(uint8ClampedArrayObj.myUint8ClampedArray[1]).assertEqual(40);
      } else {
        throw new Error('myUint8ClampedArray is undefined');
      }
      console.log(`${caseName} test end`);
      Done();
    })

    /**
     * @tc.number SUB_BUILTINS_REQUIRED_UTILITY_TEST_2000
     * @tc.name BuiltinsRequiredUtilityTypeTest2000
     * @tc.desc Required Utility Type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsRequiredUtilityTypeTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsRequiredUtilityTypeTest2000';
      console.log(`${caseName} test start`);
      interface Int8ArrayInterface {
        myInt8Array: Int8Array;
      }
      type PartialInt8ArrayInterface = Required<Int8ArrayInterface>;
      const myInt8Array = new Int8Array([1, 2, 3]);
      const int8ArrayObj: PartialInt8ArrayInterface = { myInt8Array: myInt8Array ?? new Int8Array() };
      console.log(JSON.stringify(Array.from(int8ArrayObj.myInt8Array ?? new Int8Array())));
      if (int8ArrayObj.myInt8Array) {
        expect(int8ArrayObj.myInt8Array[1]).assertEqual(2);
      }else {
        throw new Error('myUint8ClampedArray is undefined');
      }
      console.log(`${caseName} test end`);
      Done();
    })

    /**
     * @tc.number SUB_BUILTINS_REQUIRED_UTILITY_TEST_2100
     * @tc.name BuiltinsRequiredUtilityTypeTest2100
     * @tc.desc Required Utility Type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsRequiredUtilityTypeTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsRequiredUtilityTypeTest2100';
      console.log(`${caseName} test start`);
      interface Uint8ArrayInterface {
        myUint8Array: Uint8Array;
      }
      type RequiredUint8ArrayInterface = Required<Uint8ArrayInterface>;
      const myUint8Array = new Uint8Array([1, 2, 3]);
      const uint8ArrayObj: RequiredUint8ArrayInterface = { myUint8Array: myUint8Array ?? new Uint8Array() };
      console.log(JSON.stringify(Array.from(uint8ArrayObj.myUint8Array ?? new Uint8Array())));
      if (uint8ArrayObj.myUint8Array) {
        expect(uint8ArrayObj.myUint8Array[1]).assertEqual(2);
      } else {
        throw new Error('myUint8Array is undefined');
      }
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.number SUB_BUILTINS_REQUIRED_UTILITY_TEST_2200
     * @tc.name BuiltinsRequiredUtilityTypeTest2200
     * @tc.desc Required Utility Type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsRequiredUtilityTypeTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsRequiredUtilityTypeTest2200';
      console.log(`${caseName} test start`);
      interface Int16ArrayInterface {
        myInt16Array: Int16Array;
      }
      type RequiredInt16ArrayInterface = Required<Int16ArrayInterface>;
      const myInt16Array = new Int16Array([1, 2, 3]);
      const int16ArrayObj: RequiredInt16ArrayInterface = { myInt16Array: myInt16Array ?? new Int16Array() };
      console.log(JSON.stringify(Array.from(int16ArrayObj.myInt16Array ?? new Int16Array())));
      if (int16ArrayObj.myInt16Array) {
        expect(int16ArrayObj.myInt16Array[1]).assertEqual(2);
      } else {
        throw new Error('myInt16Array is undefined');
      }
      console.log(`${caseName} test end`);
      Done();
    })

    /**
     * @tc.number SUB_BUILTINS_REQUIRED_UTILITY_TEST_2300
     * @tc.name BuiltinsRequiredUtilityTypeTest2300
     * @tc.desc Required Utility Type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsRequiredUtilityTypeTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsRequiredUtilityTypeTest2300';
      console.log(`${caseName} test start`);
      interface Uint16ArrayInterface {
        myUint16Array: Uint16Array;
      }
      type RequiredUint16ArrayInterface = Required<Uint16ArrayInterface>;
      const myUint16Array = new Uint16Array([65, 70, 75]);
      const uint16ArrayObj: RequiredUint16ArrayInterface = { myUint16Array: myUint16Array ?? new Uint16Array() };
      console.log(JSON.stringify(Array.from(uint16ArrayObj.myUint16Array ?? new Uint16Array())));
      if (uint16ArrayObj.myUint16Array) {
        expect(uint16ArrayObj.myUint16Array[1]).assertEqual(70);
      } else {
        throw new Error('myUint16Array is undefined');
      }
      console.log(`${caseName} test end`);
      Done();
    })

    /**
     * @tc.number SUB_BUILTINS_REQUIRED_UTILITY_TEST_2400
     * @tc.name BuiltinsRequiredUtilityTypeTest2400
     * @tc.desc Required Utility Type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsRequiredUtilityTypeTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsRequiredUtilityTypeTest2400';
      console.log(`${caseName} test start`);
      interface Int32ArrayInterface {
        myInt32Array: Int32Array;
      }
      type RequiredInt32ArrayInterface = Required<Int32ArrayInterface>;
      const myInt32Array = new Int32Array([80, 85, 90]);
      const int32ArrayObj: RequiredInt32ArrayInterface = { myInt32Array: myInt32Array ?? new Int32Array() };
      console.log(JSON.stringify(Array.from(int32ArrayObj.myInt32Array ?? new Int32Array())));
      if (int32ArrayObj.myInt32Array) {
        expect(int32ArrayObj.myInt32Array[1]).assertEqual(85);
      } else {
        throw new Error('myInt32Array is undefined');
      }
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.number SUB_BUILTINS_REQUIRED_UTILITY_TEST_2500
     * @tc.name BuiltinsRequiredUtilityTypeTest2500
     * @tc.desc Required Utility Type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsRequiredUtilityTypeTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsRequiredUtilityTypeTest2500';
      console.log(`${caseName} test start`);
      interface Uint32ArrayInterface {
        myUint32Array: Uint32Array;
      }
      type RequiredUint32ArrayInterface = Required<Uint32ArrayInterface>;
      const myUint32Array = new Uint32Array([95, 100, 105]);
      const uint32ArrayObj: RequiredUint32ArrayInterface = { myUint32Array: myUint32Array ?? new Uint32Array() };
      console.log(JSON.stringify(Array.from(uint32ArrayObj.myUint32Array ?? new Uint32Array())));
      if (uint32ArrayObj.myUint32Array) {
        expect(uint32ArrayObj.myUint32Array[1]).assertEqual(100);
      } else {
        throw new Error('myUint32Array is undefined');
      }
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.number SUB_BUILTINS_REQUIRED_UTILITY_TEST_2600
     * @tc.name BuiltinsRequiredUtilityTypeTest2600
     * @tc.desc Required Utility Type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsRequiredUtilityTypeTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsRequiredUtilityTypeTest2600';
      console.log(`${caseName} test start`);
      interface Float32ArrayInterface {
        myFloat32Array: Float32Array;
      }
      type RequiredFloat32ArrayInterface = Required<Float32ArrayInterface>;
      const myFloat32Array = new Float32Array([110.5, 115.2, 120.7]);
      const float32ArrayObj: RequiredFloat32ArrayInterface = { myFloat32Array: myFloat32Array ?? new Float32Array() };
      console.log(JSON.stringify(Array.from(float32ArrayObj.myFloat32Array ?? new Float32Array())));
      if (float32ArrayObj.myFloat32Array) {
        expect(float32ArrayObj.myFloat32Array[1]).assertEqual(115.19999694824219);
      } else {
        throw new Error('myFloat32Array is undefined');
      }
      console.log(`${caseName} test end`);
      Done();
    })



    /**
     * @tc.number SUB_BUILTINS_REQUIRED_UTILITY_TEST_2700
     * @tc.name BuiltinsRequiredUtilityTypeTest2700
     * @tc.desc Required Utility Type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsRequiredUtilityTypeTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsRequiredUtilityTypeTest2700';
      console.log(`${caseName} test start`);
      interface Float64ArrayInterface {
        myFloat64Array: Float64Array;
      }
      type RequiredFloat64ArrayInterface = Required<Float64ArrayInterface>;
      const myFloat64Array = new Float64Array([125.3, 130.8, 135.1]);
      const float64ArrayObj: RequiredFloat64ArrayInterface = { myFloat64Array: myFloat64Array ?? new Float64Array() };
      console.log(JSON.stringify(Array.from(float64ArrayObj.myFloat64Array ?? new Float64Array())));
      if (float64ArrayObj.myFloat64Array) {
        expect(float64ArrayObj.myFloat64Array[1]).assertEqual(130.8);
      } else {
        throw new Error('myFloat64Array is undefined');
      }
      console.log(`${caseName} test end`);
      Done();
    })



    /**
     * @tc.number SUB_BUILTINS_REQUIRED_UTILITY_TEST_2800
     * @tc.name BuiltinsRequiredUtilityTypeTest2800
     * @tc.desc Required Utility Type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsRequiredUtilityTypeTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsRequiredUtilityTypeTest2800';
      console.log(`${caseName} test start`);
      interface MapInterface {
        myMap: Map<string, number>;
      }
      type RequiredMapInterface = Required<MapInterface>;
      const myMap = new Map<string, number>();
      myMap.set('one', 1);
      myMap.set('two', 2);
      const mapObj: RequiredMapInterface = { myMap: myMap ?? new Map<string, number>() };
      console.log(`${Array.from(mapObj.myMap.entries())}`);
      if (mapObj.myMap) {
        expect(mapObj.myMap.get('two')).assertEqual(2);
      } else {
        throw new Error('myMap is undefined');
      }
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.number SUB_BUILTINS_REQUIRED_UTILITY_TEST_2900
     * @tc.name BuiltinsRequiredUtilityTypeTest2900
     * @tc.desc Required Utility Type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsRequiredUtilityTypeTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsRequiredUtilityTypeTest2900';
      console.log(`${caseName} test start`);
      interface SetInterface {
        mySet: Set<number>;
      }
      type RequiredSetInterface = Required<SetInterface>;
      const mySet = new Set<number>();
      mySet.add(10);
      mySet.add(20);
      const setObj: RequiredSetInterface = { mySet: mySet ?? new Set<number>() };
      console.log(`${Array.from(setObj.mySet.values())}`);
      if (setObj.mySet) {
        expect(setObj.mySet.has(20)).assertEqual(true);
      } else {
        throw new Error('mySet is undefined');
      }
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.number SUB_BUILTINS_REQUIRED_UTILITY_TEST_3000
     * @tc.name BuiltinsRequiredUtilityTypeTest3000
     * @tc.desc Required Utility Type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsRequiredUtilityTypeTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsRequiredUtilityTypeTest3000';
      console.log(`${caseName} test start`);
      interface DateInterface {
        myDate: Date;
      }
      type RequiredDateInterface = Required<DateInterface>;
      const myDate = new Date('2025-01-01');
      const dateObj: RequiredDateInterface = { myDate: myDate ?? new Date() };
      console.log(dateObj.myDate.toISOString());
      if (dateObj.myDate) {
        expect(dateObj.myDate.getFullYear()).assertEqual(2025);
      } else {
        throw new Error('myDate is undefined');
      }
      console.log(`${caseName} test end`);
      Done();
    })

  })
}