/**
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../hypium/index';
import Utils from './Util.test';
import { BusinessError } from '@ohos.base';
let domain: number = 0x0000;
let tag: string = 'testTag';
export default function constructorTest() {
  describe("constructorTest", (): void => {
    // Dewm25 fines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
	   await Utils.msSleep(100);
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
     * @tc.number  CORE_NULLVALUE_001
     * @tc.name    testNullValueConstructor0001
     * @tc.desc    Verify INSTANCE is singleton
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testNullValueConstructor0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testNullValueConstructor0001";
      try {
        let instance1 = NullValue.INSTANCE;
        let instance2 = NullValue.INSTANCE;
        expect(instance1 === instance2).assertEqual(true);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  CORE_NULLVALUE_002
     * @tc.name    testNullValueConstructor0002
     * @tc.desc    Verify getType() returns NullType.REF
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testNullValueConstructor0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testNullValueConstructor0002";
      try {
        expect(NullValue.INSTANCE.getType()).assertEqual(NullType.REF);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  CORE_NULLVALUE_003
     * @tc.name    testNullValueConstructor0003
     * @tc.desc    Verify toString() returns expected string
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testNullValueConstructor0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testNullValueConstructor0003";
      try {
        expect(NullValue.INSTANCE.toString()).assertEqual("null");
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  CORE_NULLVALUE_004
     * @tc.name    testNullValueConstructor0004
     * @tc.desc    Verify toLocaleString() equals toString()
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testNullValueConstructor0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testNullValueConstructor0004";
      try {
        let instance = NullValue.INSTANCE;
        expect(instance.toLocaleString()).assertEqual(instance.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  CORE_NULLVALUE_005
     * @tc.name    testNullValueConstructor0005
     * @tc.desc    Verify toPrint() returns expected string
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testNullValueConstructor0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testNullValueConstructor0005";
      try {
        expect(NullValue.INSTANCE.toPrint(0)).assertEqual("null");
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  CORE_NULLVALUE_006
     * @tc.name    testNullValueConstructor0006
     * @tc.desc    Verify toPrint() with different depths
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testNullValueConstructor0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testNullValueConstructor0006";
      try {
        let instance = NullValue.INSTANCE;
        expect(instance.toPrint(0)).assertEqual("null");
        expect(instance.toPrint(1)).assertEqual("null");
        expect(instance.toPrint(2)).assertEqual("null");
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  CORE_UNDEFINEDVALUE_001
     * @tc.name    testUndefinedValueConstructor0001
     * @tc.desc    Verify INSTANCE is singleton
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testUndefinedValueConstructor0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testUndefinedValueConstructor0001";
      try {
        let instance1 = UndefinedValue.INSTANCE;
        let instance2 = UndefinedValue.INSTANCE;
        expect(instance1 === instance2).assertEqual(true);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  CORE_UNDEFINEDVALUE_002
     * @tc.name    testUndefinedValueConstructor0002
     * @tc.desc    Verify getType() returns UndefinedType.REF
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testUndefinedValueConstructor0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testUndefinedValueConstructor0002";
      try {
        expect(UndefinedValue.INSTANCE.getType()).assertEqual(UndefinedType.REF);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  CORE_UNDEFINEDVALUE_003
     * @tc.name    testUndefinedValueConstructor0003
     * @tc.desc    Verify toString() returns "undefined"
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testUndefinedValueConstructor0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testUndefinedValueConstructor0003";
      try {
        expect(UndefinedValue.INSTANCE.toString()).assertEqual("undefined");
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  CORE_UNDEFINEDVALUE_004
     * @tc.name    testUndefinedValueConstructor0004
     * @tc.desc    Verify toLocaleString() equals toString()
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testUndefinedValueConstructor0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testUndefinedValueConstructor0004";
      try {
        let instance = UndefinedValue.INSTANCE;
        expect(instance.toLocaleString()).assertEqual(instance.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  CORE_UNDEFINEDVALUE_005
     * @tc.name    testUndefinedValueConstructor0005
     * @tc.desc    Verify toPrint() returns "undefined"
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testUndefinedValueConstructor0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testUndefinedValueConstructor0005";
      try {
        expect(UndefinedValue.INSTANCE.toPrint(0)).assertEqual("undefined");
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  CORE_UNDEFINEDVALUE_006
     * @tc.name    testUndefinedValueConstructor0006
     * @tc.desc    Verify toPrint() with different depths
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testUndefinedValueConstructor0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testUndefinedValueConstructor0006";
      try {
        let instance = UndefinedValue.INSTANCE;
        expect(instance.toPrint(0)).assertEqual("undefined");
        expect(instance.toPrint(1)).assertEqual("undefined");
        expect(instance.toPrint(2)).assertEqual("undefined");
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
    * @tc.number  CORE_VOIDVALUE_001
    * @tc.name    testVoidValueConstructor0001
    * @tc.desc    Testing VoidValue constructor creates singleton instance
    * @tc.size    MEDIUMTEST
    * @tc.type    FUNCTION
    * @tc.level   LEVEL1
    */
    it('testVoidValueConstructor0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testVoidValueConstructor0001";
      try {
        const instance1 = VoidValue.INSTANCE;
        const instance2 = VoidValue.INSTANCE;
        expect(instance1 === instance2).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  CORE_VOIDVALUE_002
     * @tc.name    testVoidValueConstructor0002
     * @tc.desc    Testing VoidValue constructor returns instance with correct type
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testVoidValueConstructor0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testVoidValueConstructor0002";
      try {
        let instance = new VoidValue();
        expect(instance.getType().toString()).assertEqual('void');
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  CORE_VOIDVALUE_003
     * @tc.name    testVoidValueConstructor0003
     * @tc.desc    Testing VoidValue constructor returns instance with correct toString
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testVoidValueConstructor0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testVoidValueConstructor0003";
      try {
        let instance = new VoidValue();
        expect(instance.toString()).assertEqual('void');
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  CORE_VOIDVALUE_004_01
     * @tc.name    testVoidValueConstructor0004
     * @tc.desc    Testing VoidValue constructor returns instance with correct toLocaleString
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testVoidValueConstructor0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testVoidValueConstructor0004";
      try {
        let instance = new VoidValue();
        expect(instance.toLocaleString()).assertEqual('void');
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  CORE_VOIDVALUE_005
     * @tc.name    testVoidValueConstructor0005
     * @tc.desc    Testing VoidValue constructor returns instance with correct toPrint
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testVoidValueConstructor0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testVoidValueConstructor0005";
      try {
        let instance = new VoidValue();
        expect(instance.toPrint(0)).assertEqual('void');
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  CORE_VOIDVALUE_006
     * @tc.name    testVoidValueConstructor0006
     * @tc.desc    Verify VoidValue instance creation
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testVoidValueConstructor0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      try {
        let instance = new VoidValue();
        expect(instance.getType().toString()).assertEqual("void");
        expect(instance.toString()).assertEqual("void");
      } catch (err) {
        expect().assertFail();
      }
    });

    /**
     * @tc.number  CORE_VOIDVALUE_007_02
     * @tc.name    testVoidValueConstructor0007
     * @tc.desc    Testing VoidValue constructor functionality
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testVoidValueConstructor0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testVoidValueConstructor0007";
      try {
        let instance1 = new VoidValue();
        let instance2 = new VoidValue();
        expect(instance1 instanceof VoidValue).assertTrue();
        expect(instance2 instanceof VoidValue).assertTrue();
      } catch (err: BusinessError) {
        console.error(`${TAG} error msg: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  CORE_VALUE1_001
     * @tc.name    testGetDataBoolean
     * @tc.desc    Testing getData() with Boolean value (strict type-safe)
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testGetDataBoolean', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testGetDataBoolean";
      try {
        let boolValue = new BooleanValue(BooleanType.REF, true);
        let result = boolValue.getData();
        if (typeof result !== 'boolean' && !(result instanceof Boolean)) {
          expect().assertFail();
          return;
        }
        const boolObj = new Boolean(result);
        expect(boolObj.valueOf()).assertTrue();
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  CORE_VALUE1_002
     * @tc.name    testGetDataInt
     * @tc.desc    Testing getData() with Int value
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testGetDataInt', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testGetDataInt";
      try {
        let intValue = new IntValue(IntType.REF, 123);
        let result = intValue.getData();
        if (!(result instanceof Int)) {
          expect().assertFail();
          return;
        }
        expect(Number(result)).assertEqual(123);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  CORE_VALUE1_003
     * @tc.name    testGetDataString
     * @tc.desc    Testing getData() with String value
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testGetDataString', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testGetDataString";
      try {
        let strValue = new StringValue(StringType.REF, "Hello");
        let result = strValue.getData();
        if (typeof result !== 'string') {
          expect().assertFail();
          return;
        }
        expect(result as string).assertEqual("Hello");
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  CORE_VALUE1_004
     * @tc.name    testGetDataNull
     * @tc.desc    Testing getData() with Null value
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testGetDataNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testGetDataNull";
      try {
        let nullValue = NullValue.INSTANCE;
        let result = nullValue.getData();
        expect(result === null).assertTrue();
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  CORE_VALUE1_005
     * @tc.name    testGetDataUndefined
     * @tc.desc    Testing getData() with Undefined value
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testGetDataUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testGetDataUndefined";
      try {
        let undefinedValue = UndefinedValue.INSTANCE;
        let result = undefinedValue.getData();
        expect(result === undefined).assertTrue();
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  CORE_VALUE1_006
     * @tc.name    testGetDataByte
     * @tc.desc    Testing getData() with Byte value
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testGetDataByte', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testGetDataByte";
      try {
        let byteValue = new ByteValue(ByteType.REF, 127);
        let result = byteValue.getData();
        if (!(result instanceof Byte)) {
          expect().assertFail();
          return;
        }
        expect(Byte.valueOf(result)).assertEqual(127);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  CORE_VALUE1_007
     * @tc.name    testGetDataShort
     * @tc.desc    Testing getData() with Short value
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testGetDataShort', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testGetDataShort";
      try {
        let byteValue = new ByteValue(ByteType.REF, 127);
        let result = byteValue.getData();
        if (!(result instanceof Byte)) {
          expect().assertFail();
          return;
        }
        expect(Number(result)).assertEqual(127);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  CORE_VALUE1_008
     * @tc.name    testGetDataLong
     * @tc.desc    Testing getData() with Long value
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testGetDataLong', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testGetDataLong";
      try {
        let longValue = new LongValue(LongType.REF, 2147483647);
        let result = longValue.getData();
        if (!(result instanceof Long)) {
          expect().assertFail();
          return;
        }
        expect(Number(result)).assertEqual(2147483647);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  CORE_VALUE1_009
     * @tc.name    testGetDataFloat
     * @tc.desc    Testing getData() with Float value
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testGetDataFloat', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testGetDataFloat";
      try {
        let floatValue = new FloatValue(FloatType.REF, 3.14 as float);
        let result = floatValue.getData();
        if (!(result instanceof float)) {
          expect().assertFail();
          return;
        }
        expect(Math.abs(Number(result) - 3.14) < 0.0001).assertTrue();
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  CORE_VALUE2_001
     * @tc.name    testGetType0001
     * @tc.desc    Testing getType with BooleanValue.
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testGetType0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testGetType0001";
      try {
        let value = new BooleanValue(BooleanType.REF, true);
        expect(value.getType()).assertEqual(BooleanType.REF);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  CORE_VALUE2_002
     * @tc.name    testGetType0002
     * @tc.desc    Testing getType with IntValue.
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testGetType0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testGetType0002";
      try {
        let value = new IntValue(IntType.REF, 123);
        expect(value.getType()).assertEqual(IntType.REF);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  CORE_VALUE2_003
     * @tc.name    testGetType0003
     * @tc.desc    Testing getType with FloatValue.
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testGetType0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testGetType0003";
      try {
        let value = new FloatValue(FloatType.REF, 3.14 as float);
        expect(value.getType()).assertEqual(FloatType.REF);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  CORE_VALUE2_004
     * @tc.name    testGetType0004
     * @tc.desc    Testing getType with StringValue.
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testGetType0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testGetType0004";
      try {
        let value = new StringValue(StringType.REF, "test");
        expect(value.getType()).assertEqual(StringType.REF);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  CORE_VALUE2_005
     * @tc.name    testGetType0005
     * @tc.desc    Testing getType with ArrayValue of boolean.
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testGetType0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testGetType0005";
      try {
        let arr: FixedArray<boolean> = [true, false];
        let value = reflect.Value.of(arr);
        expect(value.getType()).assertEqual(ArrayType.BOOLEAN_VAL);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  CORE_VALUE2_006
     * @tc.name    testGetType0006
     * @tc.desc    Testing getType with NullValue.
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testGetType0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testGetType0006";
      try {
        let value = NullValue.INSTANCE;
        const typeName = value.getType().toString();
        expect(typeName === "NullType" || typeName === "null").assertTrue();
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  CORE_VALUE2_007
     * @tc.name    testGetType0007
     * @tc.desc    Testing getType with UndefinedValue.
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testGetType0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testGetType0007";
      try {
        let value = UndefinedValue.INSTANCE;
        const typeName = value.getType().toString();
        expect(typeName === "UndefinedType" || typeName === "undefined").assertTrue();
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  CORE_VALUE2_008
     * @tc.name    testGetType0008
     * @tc.desc    Testing getType with ArrayValue of int.
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testGetType0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testGetType0008";
      try {
        let arr: FixedArray<int> = [1, 2, 3];
        let value = reflect.Value.of(arr);
        expect(value.getType()).assertEqual(ArrayType.INT_VAL);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  CORE_VALUE3_001
     * @tc.name    testToPrint0001
     * @tc.desc    Testing toPrint with NullValue.
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testToPrint0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testToPrint0001";
      try {
        let value = NullValue.INSTANCE;
        expect(value.toPrint(0)).assertEqual("null");
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  CORE_VALUE3_002
     * @tc.name    testToPrint0002
     * @tc.desc    Testing toPrint with BooleanValue (true).
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testToPrint0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testToPrint0002";
      try {
        let value = new BooleanValue(BooleanType.REF, true);
        expect(value.toPrint(0)).assertEqual("true");
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  CORE_VALUE3_003
     * @tc.name    testToPrint0003
     * @tc.desc    Testing toPrint with IntValue.
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testToPrint0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testToPrint0003";
      try {
        let value = new IntValue(IntType.REF, 123);
        expect(value.toPrint(0)).assertEqual("123");
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  CORE_VALUE3_004
     * @tc.name    testToPrint0004
     * @tc.desc    Testing toPrint with FloatValue.
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testToPrint0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testToPrint0004";
      try {
        let value = new FloatValue(FloatType.REF, 3.14 as float);
        expect(value.toPrint(0)).assertEqual("3.14");
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  CORE_BOOLEANVALUE_002_02
     * @tc.name    BooleanValueConstructor0001
     * @tc.desc    Test constructor with true value
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it("BooleanValueConstructor0001", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(0x0000, 'testTag', '%{public}s', 'BooleanValueConstructor0001 start');
      let booleanType: BooleanType;
      let booleanValue = new BooleanValue(booleanType, true);
      expect(booleanValue.getValueData()).assertTrue();
      expect(booleanValue.getType()).assertEqual(booleanType);
      done();
      console.log(0x0000, 'testTag', '%{public}s', 'BooleanValueConstructor0001 end');
    });

    /**
     * @tc.number  CORE_BOOLEANVALUE_002_03
     * @tc.name    BooleanValueConstructor0002
     * @tc.desc    Test constructor with false value
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("BooleanValueConstructor0002", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(0x0000, 'testTag', '%{public}s', 'BooleanValueConstructor0002 start');
      let booleanType: BooleanType;
      let booleanValue = new BooleanValue(booleanType, false);
      expect(booleanValue.getValueData()).assertFalse();
      expect(booleanValue.getType()).assertEqual(booleanType);
      done();
      console.log(0x0000, 'testTag', '%{public}s', 'BooleanValueConstructor0002 end');
    });

    /**
     * @tc.number  CORE_BOOLEANVALUE_003_01
     * @tc.name    BooleanValueConstructor0003
     * @tc.desc    Test constructor with same type but different values
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("BooleanValueConstructor0003", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(0x0000, 'testTag', '%{public}s', 'BooleanValueConstructor0003 start');
      let booleanType: BooleanType;
      let value1 = new BooleanValue(booleanType, true);
      let value2 = new BooleanValue(booleanType, false);
      expect(value1.getType()).assertEqual(value2.getType());
      expect(value1.getValueData() === value2.getValueData()).assertFalse();
      done();
      console.log(0x0000, 'testTag', '%{public}s', 'BooleanValueConstructor0003 end');
    });

    /**
     * @tc.number  CORE_BOOLEANVALUE_004
     * @tc.name    BooleanValueConstructor0004
     * @tc.desc    Test toString method after construction
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("BooleanValueConstructor0004", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(0x0000, 'testTag', '%{public}s', 'BooleanValueConstructor0004 start');
      let booleanType: BooleanType;
      let trueValue = new BooleanValue(booleanType, true);
      let falseValue = new BooleanValue(booleanType, false);
      expect(trueValue.toString()).assertEqual("true");
      expect(falseValue.toString()).assertEqual("false");
      done();
      console.log(0x0000, 'testTag', '%{public}s', 'BooleanValueConstructor0004 end');
    });

    /**
     * @tc.number  CORE_BYTEVALUE_01
     * @tc.name    ByteValueConstructor0001
     * @tc.desc    Test constructor with minimum byte value (-128)
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it("ByteValueConstructor0001", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(0x0000, 'testTag', '%{public}s', 'ByteValueConstructor0001 start');
      let byteType : ByteType;
      let byteValue = new ByteValue(byteType, -128);
      expect(byteValue.getValueData()).assertEqual(-128);
      expect(byteValue.toString()).assertEqual("-128");
      done();
      console.log(0x0000, 'testTag', '%{public}s', 'ByteValueConstructor0001 end');
    });

    /**
     * @tc.number  CORE_BYTEVALUE_002_01
     * @tc.name    ByteValueConstructor0002
     * @tc.desc    Test constructor with maximum byte value (127)
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it("ByteValueConstructor0002", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(0x0000, 'testTag', '%{public}s', 'ByteValueConstructor0002 start');
      let byteType : ByteType;
      let byteValue = new ByteValue(byteType, 127);
      expect(byteValue.getValueData()).assertEqual(127);
      expect(byteValue.toString()).assertEqual("127");
      done();
      console.log(0x0000, 'testTag', '%{public}s', 'ByteValueConstructor0002 end');
    });

    /**
     * @tc.number  CORE_BYTEVALUE_003_01
     * @tc.name    ByteValueConstructor0003
     * @tc.desc    Test constructor with zero value
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it("ByteValueConstructor0003", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(0x0000, 'testTag', '%{public}s', 'ByteValueConstructor0003 start');
      let byteType : ByteType;
      let byteValue = new ByteValue(byteType, 0);
      expect(byteValue.getValueData()).assertEqual(0);
      expect(byteValue.toLocaleString()).assertEqual("0");
      done();
      console.log(0x0000, 'testTag', '%{public}s', 'ByteValueConstructor0003 end');
    });

    /**
     * @tc.number  CORE_BYTEVALUE_004_01
     * @tc.name    ByteValueConstructor0004
     * @tc.desc    Test same type with different byte values
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it("ByteValueConstructor0004", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(0x0000, 'testTag', '%{public}s', 'ByteValueConstructor0004 start');
      let byteType : ByteType;
      let value1 = new ByteValue(byteType, 10);
      let value2 = new ByteValue(byteType, 20);
      expect(value1.getType()).assertEqual(value2.getType());
      expect(value1.getValueData() === value2.getValueData()).assertFalse();
      done();
      console.log(0x0000, 'testTag', '%{public}s', 'ByteValueConstructor0004 end');
    });

    /**
     * @tc.number  CORE_BYTEVALUE_005_01
     * @tc.name    ByteValueConstructor0005
     * @tc.desc    Test getData() returns correct Byte object
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it("ByteValueConstructor0005", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(0x0000, 'testTag', '%{public}s', 'ByteValueConstructor0005_01 start');
      let byteType : ByteType;
      let byteValue = new ByteValue(byteType, 64);
      expect(byteValue.getValueData()).assertEqual(64);
      expect(byteValue.toLocaleString()).assertEqual("64");
      done();
      console.log(0x0000, 'testTag', '%{public}s', 'ByteValueConstructor0005_01 end');
    });

    /**
     * @tc.number  CORE_BYTEVALUE_006_01
     * @tc.name    ByteValueConstructor0006
     * @tc.desc    Test boundary values
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it("ByteValueConstructor0006", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(0x0000, 'testTag', '%{public}s', 'ByteValueConstructor0006 start');
      let byteType : ByteType;
      let values: byte[] = [-128, 0, 127] as byte[];
      for (let i = 0; i < values.length; i++) {
        let value = values[i];
        let byteValue = new ByteValue(byteType, value);
        expect(byteValue.getValueData()).assertEqual(value);
        expect(byteValue.getValueData() <= 127).assertTrue();
        expect(byteValue.getValueData() >= -128).assertTrue();
      }
      done();
      console.log(0x0000, 'testTag', '%{public}s', 'ByteValueConstructor0006 end');
    });

    /**
     * @tc.number  CORE_CHARVALUE1_001
     * @tc.name    CharValueConstructor0001
     * @tc.desc    Test constructor with ASCII character 'A'
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("CharValueConstructor0001", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(0x0000, 'testTag', '%{public}s', 'CharValueConstructor0001 start');
      let charType : CharType;
      let charData: char = 'A'.charAt(0) as char;
      let charValue = new CharValue(charType, charData);
      expect(charValue.getValueData()).assertEqual(charData);
      expect(charValue.toString()).assertEqual('"A"');
      done();
      console.log(0x0000, 'testTag', '%{public}s', 'CharValueConstructor0001 end');
    });

    /**
     * @tc.number  CORE_CHARVALUE1_003
     * @tc.name    CharValueConstructor0003
     * @tc.desc    Test constructor with special character '\n'
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("CharValueConstructor0003", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(0x0000, 'testTag', '%{public}s', 'CharValueConstructor0003 start');
      let charType : CharType;
      let charData: char = '\n'.charAt(0) as char;
      let charValue = new CharValue(charType, charData);
      expect(charValue.getValueData()).assertEqual(charData);
      expect(charValue.toString()).assertEqual('"\n"');
      done();
      console.log(0x0000, 'testTag', '%{public}s', 'CharValueConstructor0003 end');
    });

    /**
     * @tc.number  CORE_CHARVALUE1_004
     * @tc.name    CharValueConstructor0004
     * @tc.desc    Test getType() method
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("CharValueConstructor0004", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(0x0000, 'testTag', '%{public}s', 'CharValueConstructor0004 start');
      let charType : CharType;
      let charValue1 = new CharValue(charType, 'X'.charAt(0) as char);
      let charValue2 = new CharValue(charType, 'Y'.charAt(0) as char);
      expect(charValue1.getType()).assertEqual(charValue2.getType());
      done();
      console.log(0x0000, 'testTag', '%{public}s', 'CharValueConstructor0004 end');
    });

    /**
     * @tc.number  CORE_CHARVALUE1_005
     * @tc.name    CharValueConstructor0005
     * @tc.desc    Test boundary characters
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("CharValueConstructor0005", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(0x0000, 'testTag', '%{public}s', 'CharValueConstructor0005 start');
      let charType : CharType;
      let testChars = [
        '\u0000'.charAt(0) as char,
        '\uffff'.charAt(0) as char
      ];
      for (let i = 0; i < testChars.length; i++) {
        let ch = testChars[i];
        let charValue = new CharValue(charType, ch);
        expect(charValue.getValueData()).assertEqual(ch);
      }
      done();
      console.log(0x0000, 'testTag', '%{public}s', 'CharValueConstructor0005 end');
    });

    /**
     * @tc.number  CORE_DOUBLEVALUE_001
     * @tc.name    CharValueConstructor001
     * @tc.desc    Test constructor with positive double value
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("CharValueConstructor001", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(0x0000, 'testTag', '%{public}s', 'CharValueConstructor001 start');
      let doubleType : DoubleType;
      let doubleValue = new DoubleValue(doubleType, 3.1415926);
      expect(doubleValue.getValueData()).assertEqual(3.1415926);
      expect(doubleValue.toString()).assertEqual("3.1415926");
      done();
      console.log(0x0000, 'testTag', '%{public}s', 'CharValueConstructor001 end');
    });

    /**
     * @tc.number  CORE_DOUBLEVALUE_002
     * @tc.name    CharValueConstructor0002
     * @tc.desc    Test constructor with negative double value
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("CharValueConstructor0002", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(0x0000, 'testTag', '%{public}s', 'CharValueConstructor0002 start');
      let doubleType : DoubleType;
      let doubleValue = new DoubleValue(doubleType, -2.71828);
      expect(doubleValue.getValueData()).assertEqual(-2.71828);
      expect(doubleValue.toPrint(0)).assertEqual("-2.71828");
      done();
      console.log(0x0000, 'testTag', '%{public}s', 'CharValueConstructor0002 end');
    });

    /**
     * @tc.number  CORE_DOUBLEVALUE_003
     * @tc.name    CharValueConstructor003
     * @tc.desc    Test constructor with zero value
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("CharValueConstructor003", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(0x0000, 'testTag', '%{public}s', 'CharValueConstructor003 start');
      let doubleType : DoubleType;
      let doubleValue = new DoubleValue(doubleType, 0.0);
      expect(doubleValue.getValueData()).assertEqual(0.0);
      expect(doubleValue.toLocaleString()).assertEqual("0");
      done();
      console.log(0x0000, 'testTag', '%{public}s', 'CharValueConstructor003 end');
    });

    /**
     * @tc.number  CORE_DOUBLEVALUE_004
     * @tc.name    CharValueConstructor004
     * @tc.desc    Test getType() method
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("CharValueConstructor004", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(0x0000, 'testTag', '%{public}s', 'CharValueConstructor004 start');
      let doubleType : DoubleType;
      let value1 = new DoubleValue(doubleType, 1.0);
      let value2 = new DoubleValue(doubleType, 2.0);
      expect(value1.getType()).assertEqual(value2.getType());
      done();
      console.log(0x0000, 'testTag', '%{public}s', 'CharValueConstructor004 end');
    });

    /**
     * @tc.number  CORE_DOUBLEVALUE_005
     * @tc.name    CharValueConstructor005
     * @tc.desc    Test boundary values
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("CharValueConstructor005", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(0x0000, 'testTag', '%{public}s', 'CharValueConstructor005 start');
      let doubleType : DoubleType;
      let testValues = [Number.MIN_VALUE, Number.MAX_VALUE, Number.POSITIVE_INFINITY] as double[];
      for (let i = 0; i < testValues.length; i++) {
        let value = testValues[i];
        let doubleValue = new DoubleValue(doubleType, value);
        expect(doubleValue.getValueData()).assertEqual(value);
      }
      done();
      console.log(0x0000, 'testTag', '%{public}s', 'CharValueConstructor005 end');
    });

    /**
     * @tc.number  CORE_FLOATVALUE_001
     * @tc.name    FloatValueConstructor0001
     * @tc.desc    Test constructor with positive float value
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("FloatValueConstructor0001", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(0x0000, 'testTag', '%{public}s', 'FloatValueConstructor0001 start');
      let floatValueObj = reflect.Value.of(3.14 as float);
      expect(floatValueObj instanceof FloatValue).assertTrue();
      const floatValue = floatValueObj as FloatValue;
      expect(Math.abs(floatValue.getValueData() - 3.14) < 0.00001).assertTrue();
      expect(floatValue.toString().substring(0, 4)).assertEqual("3.14");
      done();
      console.log(0x0000, 'testTag', '%{public}s', 'FloatValueConstructor0001 end');
    });

    /**
     * @tc.number  CORE_FLOATVALUE_002
     * @tc.name    FloatValueConstructor0002
     * @tc.desc    Test constructor with negative float value
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("FloatValueConstructor0002", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(0x0000, 'testTag', '%{public}s', 'FloatValueConstructor0002 start');
      let floatValueObj = reflect.Value.of(-2.718 as float);
      expect(floatValueObj instanceof FloatValue).assertTrue();
      const floatValue = floatValueObj as FloatValue;
      expect(Math.abs(floatValue.getValueData() - (-2.718)) < 0.00001).assertTrue();
      expect(floatValue.toPrint(0).substring(0, 6)).assertEqual("-2.718");
      done();
      console.log(0x0000, 'testTag', '%{public}s', 'FloatValueConstructor0002 end');
    });

    /**
     * @tc.number  CORE_FLOATVALUE_003
     * @tc.name    FloatValueConstructor0003
     * @tc.desc    Test constructor with zero value
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("FloatValueConstructor0003", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(0x0000, 'testTag', '%{public}s', 'FloatValueConstructor0003 start');
      let floatValueObj = reflect.Value.of(0.0 as float);
      expect(floatValueObj instanceof FloatValue).assertTrue();
      const floatValue = floatValueObj as FloatValue;
      expect(floatValue.getValueData()).assertEqual(0.0);
      expect(floatValue.toLocaleString()).assertEqual("0");
      done();
      console.log(0x0000, 'testTag', '%{public}s', 'FloatValueConstructor0003 end');
    });

    /**
     * @tc.number  CORE_FLOATVALUE_004
     * @tc.name    FloatValueConstructor0004
     * @tc.desc    Test boundary values
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("FloatValueConstructor0004", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(0x0000, 'testTag', '%{public}s', 'FloatValueConstructor0004 start');
      const testValues = [
        Number.MIN_VALUE as float,
        Number.MAX_VALUE as float,
        Number.POSITIVE_INFINITY as float
      ];
      testValues.forEach(value => {
        let floatValueObj = reflect.Value.of(value);
        expect(floatValueObj instanceof FloatValue).assertTrue();
        const floatValue = floatValueObj as FloatValue;
        expect(floatValue.getValueData()).assertEqual(value);
      });
      done();
      console.log(0x0000, 'testTag', '%{public}s', 'FloatValueConstructor0004 end');
    });

    /**
     * @tc.number   CORE_INTVALUE_001
     * @tc.name     IntValueConstructor0001
     * @tc.desc     Test constructor with positive integer
     * @tc.level    LEVEL1
     * @tc.size     MEDIUMTEST
     * @tc.type     FUNCTION
     */
    it("IntValueConstructor0001", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(0x0000, 'testTag', '%{public}s', 'IntValueConstructor0001 start');
      let intType : IntType;
      let intValue = new IntValue(intType, 42);
      expect(intValue.getValueData()).assertEqual(42);
      expect(intValue.toString()).assertEqual("42");
      done();
      console.log(0x0000, 'testTag', '%{public}s', 'IntValueConstructor0001 end');
    });

    /**
     * @tc.number  CORE_INTVALUE_002
     * @tc.name    IntValueConstructor0002
     * @tc.desc    Test constructor with negative integer
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("IntValueConstructor0002", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(0x0000, 'testTag', '%{public}s', 'IntValueConstructor0002 start');
      let intType : IntType;
      let intValue = new IntValue(intType, -100);
      expect(intValue.getValueData()).assertEqual(-100);
      expect(intValue.toPrint(0)).assertEqual("-100");
      done();
      console.log(0x0000, 'testTag', '%{public}s', 'IntValueConstructor0002 end');
    });

    /**
     * @tc.number CORE_INTVALUE_003
     * @tc.name   IntValueConstructor0003
     * @tc.desc   Test constructor with zero value
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("IntValueConstructor0003", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(0x0000, 'testTag', '%{public}s', 'IntValueConstructor0003 start');
      let intType : IntType;
      let intValue = new IntValue(intType, 0);
      expect(intValue.getValueData()).assertEqual(0);
      expect(intValue.toLocaleString()).assertEqual("0");
      done();
      console.log(0x0000, 'testTag', '%{public}s', 'IntValueConstructor0003 end');
    });

    /**
     * @tc.number CORE_INTVALUE_005
     * @tc.name   IntValueConstructor0005
     * @tc.desc   Test boundary values
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("IntValueConstructor0005", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(0x0000, 'testTag', '%{public}s', 'IntValueConstructor0005 start');
      const intType = IntType.VAL;
      const testValues: int[] = [
        -2147483648,
        0,
        2147483647
      ];
      testValues.forEach((value: int) => {
        const intValue = new IntValue(intType, value);
        expect(intValue.getValueData()).assertEqual(value);
      });
      done();
      console.log(0x0000, 'testTag', '%{public}s', 'IntValueConstructor0005 end');
    });

    /**
     * @tc.number CORE_LONGVALUE_001
     * @tc.name   LongValueConstructor0001
     * @tc.desc   Test constructor with positive long value
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("LongValueConstructor0001", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(0x0000, 'testTag', '%{public}s', 'LongValueConstructor0001 start');
      const longType = LongType.VAL;
      const longValue = new LongValue(longType, 9223372036854775807);
      expect(longValue.getValueData()).assertEqual(9223372036854775807);
      expect(longValue.toString()).assertEqual("9223372036854775807");
      done();
      console.log(0x0000, 'testTag', '%{public}s', 'LongValueConstructor0001 end');
    });

    /**
     * @tc.number CORE_LONGVALUE_002
     * @tc.name   LongValueConstructor0002
     * @tc.desc   Test constructor with negative long value
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("LongValueConstructor0002", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(0x0000, 'testTag', '%{public}s', 'LongValueConstructor0002 start');
      const longType = LongType.VAL;
      const longValue = new LongValue(longType, -9223372036854775808);
      expect(longValue.getValueData()).assertEqual(-9223372036854775808);
      expect(longValue.toPrint(0)).assertEqual("-9223372036854775808");
      done();
      console.log(0x0000, 'testTag', '%{public}s', 'LongValueConstructor0002 end');
    });

    /**
     * @tc.number  CORE_LONGVALUE_003
     * @tc.name    LongValueConstructor0003
     * @tc.desc    Test constructor with zero value
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("LongValueConstructor0003", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(0x0000, 'testTag', '%{public}s', 'LongValueConstructor0003 start');
      const longType = LongType.VAL;
      const longValue = new LongValue(longType, 0);
      expect(longValue.getValueData()).assertEqual(0);
      expect(longValue.toLocaleString()).assertEqual("0");
      done();
      console.log(0x0000, 'testTag', '%{public}s', 'LongValueConstructor0003 end');
    });

    /**
     * @tc.number  CORE_LONGVALUE_005
     * @tc.name    LongValueConstructor0005
     * @tc.desc    Test boundary values
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("LongValueConstructor0005", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(0x0000, 'testTag', '%{public}s', 'LongValueConstructor0005 start');
      const longType = LongType.VAL;
      const testValues: long[] = [
        -9223372036854775808,
        0,
        9223372036854775807
      ];
      testValues.forEach((value: long) => {
        const longValue = new LongValue(longType, value);
        expect(longValue.getValueData()).assertEqual(value);
      });
      done();
      console.log(0x0000, 'testTag', '%{public}s', 'LongValueConstructor0005 end');
    });

    /**
     * @tc.number  CORE_SHORTVALUE_001
     * @tc.name    ShortValueConstructor0001
     * @tc.desc    Test constructor with positive short value
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("ShortValueConstructor0001", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(0x0000, 'testTag', '%{public}s', 'ShortValueConstructor0001 start');
      let shortType = ShortType.VAL;
      let shortValue = new ShortValue(shortType, 32767);
      expect(shortValue.getValueData()).assertEqual(32767);
      expect(shortValue.toString()).assertEqual("32767");
      done();
      console.log(0x0000, 'testTag', '%{public}s', 'ShortValueConstructor0001 end');
    });

    /**
     * @tc.number   CORE_SHORTVALUE_002
     * @tc.name     ShortValueConstructor0002
     * @tc.desc     Test constructor with negative short value
     * @tc.level    LEVEL1
     * @tc.size     MEDIUMTEST
     * @tc.type     FUNCTION
     */
    it("ShortValueConstructor0002", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(0x0000, 'testTag', '%{public}s', 'ShortValueConstructor0002 start');
      let shortType = ShortType.VAL;
      let shortValue = new ShortValue(shortType, -32768);
      expect(shortValue.getValueData()).assertEqual(-32768);
      expect(shortValue.toPrint(0)).assertEqual("-32768");
      done();
      console.log(0x0000, 'testTag', '%{public}s', 'ShortValueConstructor0002 end');
    });

    /**
     * @tc.number CORE_SHORTVALUE_003
     * @tc.name   ShortValueConstructor0003
     * @tc.desc   Test constructor with zero value
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("ShortValueConstructor0003", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(0x0000, 'testTag', '%{public}s', 'ShortValueConstructor0003 start');
      let shortType = ShortType.VAL;
      let shortValue = new ShortValue(shortType, 0);
      expect(shortValue.getValueData()).assertEqual(0);
      expect(shortValue.toLocaleString()).assertEqual("0");
      done();
      console.log(0x0000, 'testTag', '%{public}s', 'ShortValueConstructor0003 end');
    });

    /**
     * @tc.number  CORE_SHORTVALUE_004
     * @tc.name    ShortValueConstructor0004
     * @tc.desc    Test boundary values
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("ShortValueConstructor0004", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(0x0000, 'testTag', '%{public}s', 'ShortValueConstructor0004 start');
      let shortType = ShortType.VAL;
      let testValues = [-32768, 0, 32767] as short[];
      testValues.forEach((value: short) => {
        let shortValue = new ShortValue(shortType, value);
        expect(shortValue.getValueData()).assertEqual(value);
      });
      done();
      console.log(0x0000, 'testTag', '%{public}s', 'ShortValueConstructor0004 end');
    });

    /**
     * @tc.number  CORE_CHARVALUE2_001
     * @tc.name    SUBReflectionCharValueGetValueData0001
     * @tc.desc    Verify character value retrieval using string conversion
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("SUBReflectionCharValueGetValueData0001", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'SUBReflectionCharValueGetValueData0001 start');
      let charType : CharType;
      const testString = "A";
      const charValue = new CharValue(charType, testString.charAt(0));
      const result = charValue.getValueData();
      expect(charValue.toString()).assertEqual('"A"');
      done();
      console.log(domain, tag, '%{public}s', 'SUBReflectionCharValueGetValueData0001 end');
    });

    /**
     * @tc.number  CORE_CHARVALUE2_002
     * @tc.name    SUBReflectionCharValueGetValueData0002
     * @tc.desc    Verify getValueData handles Unicode characters correctly
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("SUBReflectionCharValueGetValueData0002", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'SUBReflectionCharValueGetValueData0002 start');
      let charType : CharType;
      const testString = "你";
      const charValue = new CharValue(charType, testString.charAt(0));
      const result = charValue.getValueData();
      expect(charValue.toString()).assertEqual('"你"');
      done();
      console.log(domain, tag, '%{public}s', 'SUBReflectionCharValueGetValueData0002 end');
    });

    /**
     * @tc.number   CORE_CHARVALUE2_003
     * @tc.name     SUBReflectionCharValueGetValueData0003
     * @tc.desc     Verify getValueData handles special characters correctly
     * @tc.level    LEVEL1
     * @tc.size     MEDIUMTEST
     * @tc.type     FUNCTION
     */
    it("SUBReflectionCharValueGetValueData0003", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'SUBReflectionCharValueGetValueData0003 start');
      let charType : CharType;
      const testString = "\n";
      const charValue = new CharValue(charType, testString.charAt(0));
      const result = charValue.getValueData();
      expect(charValue.toString()).assertEqual('"\n"');
      done();
      console.log(domain, tag, '%{public}s', 'SUBReflectionCharValueGetValueData0003 end');
    });

    /**
     * @tc.number  CORE_CHARVALUE2_004
     * @tc.name    SUBReflectionCharValueGetValueData0004
     * @tc.desc    Verify getValueData behavior with empty character
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("SUBReflectionCharValueGetValueData0004", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'SUBReflectionCharValueGetValueData0004 start');
      let charType : CharType;
      const testString = "";
      try {
        const charValue = new CharValue(charType, testString.charAt(0));
        const result = charValue.getValueData();
        expect().assertFalse();
      } catch (e) {
        expect(e instanceof Error).assertTrue();
      }
      done();
      console.log(domain, tag, '%{public}s', 'SUBReflectionCharValueGetValueData0004 end');
    });

    /**
     * @tc.number  CORE_CHARVALUE2_005
     * @tc.name    SUBReflectionCharValueGetValueData0005
     * @tc.desc    Verify getValueData handles numeric characters correctly
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("SUBReflectionCharValueGetValueData0005", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'SUBReflectionCharValueGetValueData0005 start');
      let charType : CharType;
      const testString = "7";
      const charValue = new CharValue(charType, testString.charAt(0));
      const result = charValue.getValueData();
      expect(charValue.toString()).assertEqual('"7"');
      done();
      console.log(domain, tag, '%{public}s', 'SUBReflectionCharValueGetValueData0005 end');
    });

    /**
     * @tc.number  CORE_CHARVALUE2_006
     * @tc.name    SUBReflectionCharValueGetValueData0006
     * @tc.desc    Verify getValueData behavior with multiple characters
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("SUBReflectionCharValueGetValueData0006", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'SUBReflectionCharValueGetValueData0006 start');
      let charType : CharType;
      const testString = "AB";
      try {
        const charValue = new CharValue(charType, testString.charAt(0));
        const result = charValue.getValueData();
        expect(charValue.toString()).assertEqual('"A"');
      } catch (e) {
        expect(e instanceof Error).assertTrue();
      }
      done();
      console.log(domain, tag, '%{public}s', 'SUBReflectionCharValueGetValueData0006 end');
    });

    /**
     * @tc.number  CORE_BYTEVALUE_001
     * @tc.name    SUBReflectionByteValueGetValueData0001
     * @tc.desc    Verify minimum byte value (-128) handling
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("SUBReflectionByteValueGetValueData0001", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'SUBReflectionByteValueGetValueData0001 start');
      let byteType : ByteType;
      const testValue: byte = -128;
      const byteValue = new ByteValue(byteType, testValue);
      const result = byteValue.getValueData();
      expect(result).assertEqual(testValue);
      expect(byteValue.toString()).assertEqual("-128");
      done();
      console.log(domain, tag, '%{public}s', 'SUBReflectionByteValueGetValueData0001 end');
    });

    /**
     * @tc.number  CORE_BYTEVALUE_002
     * @tc.name    SUBReflectionByteValueGetValueData0002
     * @tc.desc    Verify maximum byte value (127) handling
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("SUBReflectionByteValueGetValueData0002", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'SUBReflectionByteValueGetValueData0002 start');
      let byteType : ByteType;
      const testValue: byte = 127;
      const byteValue = new ByteValue(byteType, testValue);
      const result = byteValue.getValueData();
      expect(result).assertEqual(testValue);
      expect(byteValue.toString()).assertEqual("127");
      done();
      console.log(domain, tag, '%{public}s', 'SUBReflectionByteValueGetValueData0002 end');
    });

    /**
     * @tc.number  CORE_BYTEVALUE_003
     * @tc.name    SUBReflectionByteValueGetValueData0003
     * @tc.desc    Verify zero byte value handling
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("SUBReflectionByteValueGetValueData0003", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'SUBReflectionByteValueGetValueData0003 start');
      let byteType : ByteType;
      const testValue: byte = 0;
      const byteValue = new ByteValue(byteType, testValue);
      const result = byteValue.getValueData();
      expect(result).assertEqual(testValue);
      expect(byteValue.toString()).assertEqual("0");
      done();
      console.log(domain, tag, '%{public}s', 'SUBReflectionByteValueGetValueData0003 end');
    });

    /**
     * @tc.number   CORE_BYTEVALUE_004_02
     * @tc.name     SUBReflectionByteValueGetValueData0004
     * @tc.desc     Verify positive byte value handling
     * @tc.level    LEVEL1
     * @tc.size     MEDIUMTEST
     * @tc.type     FUNCTION
     */
    it("SUBReflectionByteValueGetValueData0004", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'SUBReflectionByteValueGetValueData0004 start');
      let byteType : ByteType;
      const testValue: byte = 42;
      const byteValue = new ByteValue(byteType, testValue);
      const result = byteValue.getValueData();
      expect(result).assertEqual(testValue);
      expect(byteValue.toString()).assertEqual("42");
      done();
      console.log(domain, tag, '%{public}s', 'SUBReflectionByteValueGetValueData0004 end');
    });

    /**
     * @tc.number  CORE_BYTEVALUE_005
     * @tc.name    SUBReflectionByteValueGetValueData0005
     * @tc.desc    Verify negative byte value handling
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("SUBReflectionByteValueGetValueData0005", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'SUBReflectionByteValueGetValueData0005 start');
      let byteType : ByteType;
      const testValue: byte = -42;
      const byteValue = new ByteValue(byteType, testValue);
      const result = byteValue.getValueData();
      expect(result).assertEqual(testValue);
      expect(byteValue.toString()).assertEqual("-42");
      done();
      console.log(domain, tag, '%{public}s', 'SUBReflectionByteValueGetValueData0005 end');
    });

    /**
     * @tc.number  CORE_BYTEVALUE_006
     * @tc.name    SUBReflectionByteValueGetValueData0006
     * @tc.desc    Verify value consistency between getValueData and toString
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("SUBReflectionByteValueGetValueData0006", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'SUBReflectionByteValueGetValueData0006 start');
      let byteType : ByteType;
      const testValue: byte = 100;
      const byteValue = new ByteValue(byteType, testValue);
      const valueData = byteValue.getValueData();
      const stringRep = byteValue.toString();
      expect(valueData.toString()).assertEqual(stringRep);
      expect(Number(stringRep)).assertEqual(testValue);
      done();
      console.log(domain, tag, '%{public}s', 'SUBReflectionByteValueGetValueData0006 end');
    });

    /**
    * @tc.number  CORE_CLASSVALUE2_001
    * @tc.name    SUBReflectionPropertyAccess0001
    * @tc.desc    Verify explicit type conversion in reflection
    * @tc.level   LEVEL1
    * @tc.size    MEDIUMTEST
    * @tc.type    FUNCTION
    */
    it("SUBReflectionPropertyAccess0001", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'SUBReflectionPropertyAccess0001 start');
      let boolVal: boolean = true;
      let numVal: number = 123;
      let strVal: string = "test";
      let boolReflect = reflect.Value.of(boolVal as boolean);
      expect(boolReflect.toString()).assertEqual("true");
      let numReflect = reflect.Value.of(numVal as number);
      expect(numReflect.toString()).assertEqual("123");
      let strReflect = reflect.Value.of(strVal as string);
      expect(strReflect.toString()).assertEqual("test");
      console.log(domain, tag, 'Explicit type conversion test passed');

      done();
      console.log(domain, tag, '%{public}s', 'SUBReflectionPropertyAccess0001 end');
    });

    });
}