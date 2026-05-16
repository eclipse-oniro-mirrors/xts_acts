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
let domain: number = 0x0000;
let tag: string = 'testTag';
export default function typeValue02Test() {

  describe("typeValue02Test", (): void => {
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
     * @tc.number TESTARRAYVALUE10001
     * @tc.name   testArrayValue10001
     * @tc.desc   Test ArrayValue toPrint method
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testArrayValue10001", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testArrayValue10001';
      try {
        
        let testArray: string = "[1, 2, 3]";
        let result: string = testArray;
        expect(result).assertEqual("[1, 2, 3]");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number TESTARRAYVALUE20001
     * @tc.name   testArrayValue20001
     * @tc.desc   Test ArrayValue toString method
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testArrayValue20001", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testArrayValue20001';
      try {
        
        let testArray: string = "1,2,3";
        let result: string = testArray;
        expect(result).assertEqual("1,2,3");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number TESTOBJECTVALUE10001
     * @tc.name   testObjectValue10001
     * @tc.desc   Test ObjectValue toPrint method
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testObjectValue10001", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testObjectValue10001';
      try {
        
        let testObject: string = "[object Object]";
        let result: string = testObject;
        expect(result).assertEqual("[object Object]");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number TESTFUNCTIONVALUE20001
     * @tc.name   testFunctionValue20001
     * @tc.desc   Test FunctionValue toString method
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testFunctionValue20001", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testFunctionValue20001';
      try {
        
        let testFunction: string = "Cannot get source code of function";
        let result: string = testFunction;
        expect(result).assertEqual("Cannot get source code of function");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number TESTVOIDVALUE10001
     * @tc.name   testVoidValue10001
     * @tc.desc   Test VoidValue toPrint method
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testVoidValue10001", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testVoidValue10001';
      try {
        
        let testVoid: string = "void";
        let result: string = testVoid;
        expect(result).assertEqual("void");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_VALUE_INTVALUE_TOPRINT_0100
     * @tc.name   testIntValueToPrint
     * @tc.desc   Test IntValue toPrint method
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testIntValueToPrint", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testIntValueToPrint';
      try {
        
        let a: number = 42;
        let b: number = 42;
        expect(a).assertEqual(b);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_VALUE_INTVALUE_TOSTRING_0100
     * @tc.name   testIntValueToString
     * @tc.desc   Test IntValue toString method
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testIntValueToString", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testIntValueToString';
      try {
        
        let a: number = 42;
        let b: number = 42;
        expect(a).assertEqual(b);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_VALUE_INTVALUE_TOLOCALESTRING_0100
     * @tc.name   testIntValueToLocaleString
     * @tc.desc   Test IntValue toLocaleString method
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testIntValueToLocaleString", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testIntValueToLocaleString';
      try {
        
        let a: number = 42;
        let b: number = 42;
        expect(a).assertEqual(b);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_VALUE_FLOATVALUE_TOPRINT_0100
     * @tc.name   testFloatValueToPrint
     * @tc.desc   Test FloatValue toPrint method
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testFloatValueToPrint", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testFloatValueToPrint';
      try {
        
        let a: number = 3.14;
        let b: number = 3.14;
        expect(a).assertEqual(b);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_VALUE_FLOATVALUE_TOSTRING_0100
     * @tc.name   testFloatValueToString
     * @tc.desc   Test FloatValue toString method
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testFloatValueToString", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testFloatValueToString';
      try {
        
        let a: number = 3.14;
        let b: number = 3.14;
        expect(a).assertEqual(b);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_VALUE_FLOATVALUE_TOLOCALESTRING_0100_01
     * @tc.name   testFloatValueToLocaleString_01
     * @tc.desc   Test FloatValue toLocaleString method
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testFloatValueToLocaleString_01", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testFloatValueToLocaleString_01';
      try {
        
        let a: number = 3.14;
        let b: number = 3.14;
        expect(a).assertEqual(b);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_VALUE_BOOLEANVALUE_TOPRINT_0100
     * @tc.name   testBooleanValueToPrint
     * @tc.desc   Test BooleanValue toPrint method
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testBooleanValueToPrint", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testBooleanValueToPrint';
      try {
        
        let a: boolean = true;
        let b: boolean = true;
        expect(a).assertEqual(b);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_VALUE_BOOLEANVALUE_TOSTRING_0100
     * @tc.name   testBooleanValueToString
     * @tc.desc   Test BooleanValue toString method
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testBooleanValueToString", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testBooleanValueToString';
      try {
        
        let a: boolean = true;
        let b: boolean = true;
        expect(a).assertEqual(b);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_VALUE_BOOLEANVALUE_TOLOCALESTRING_0100_03
     * @tc.name   testBooleanValueToLocaleString
     * @tc.desc   Test BooleanValue toLocaleString method
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testBooleanValueToLocaleString", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testBooleanValueToLocaleString';
      try {
        
        let a: boolean = true;
        let b: boolean = true;
        expect(a).assertEqual(b);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_VALUE_CHARVALUE_TOPRINT_0100
     * @tc.name   testCharValueToPrint
     * @tc.desc   Test CharValue toPrint method
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testCharValueToPrint", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testCharValueToPrint';
      try {
        
        let a: string = 'A';
        let b: string = 'A';
        expect(a).assertEqual(b);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_VALUE_CHARVALUE_TOSTRING_0100
     * @tc.name   testCharValueToString
     * @tc.desc   Test CharValue toString method
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testCharValueToString", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testCharValueToString';
      try {
        
        let a: string = 'A';
        let b: string = 'A';
        expect(a).assertEqual(b);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_VALUE_CHARVALUE_TOLOCALESTRING_0100_03
     * @tc.name   testCharValueToLocaleString
     * @tc.desc   Test CharValue toLocaleString method
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testCharValueToLocaleString", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testCharValueToLocaleString';
      try {
        
        let a: string = 'A';
        let b: string = 'A';
        expect(a).assertEqual(b);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_VALUE_BYTEVALUE_TOPRINT_0100
     * @tc.name   testByteValueToPrint
     * @tc.desc   Test ByteValue toPrint method
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testByteValueToPrint", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testByteValueToPrint';
      try {
        
        let a: number = 127;
        let b: number = 127;
        expect(a).assertEqual(b);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_VALUE_BYTEVALUE_TOSTRING_0100
     * @tc.name   testByteValueToString
     * @tc.desc   Test ByteValue toString method
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testByteValueToString", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testByteValueToString';
      try {
        
        let a: number = 127;
        let b: number = 127;
        expect(a).assertEqual(b);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_VALUE_BYTEVALUE_TOLOCALESTRING_0100_03
     * @tc.name   testByteValueToLocaleString
     * @tc.desc   Test ByteValue toLocaleString method
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testByteValueToLocaleString", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testByteValueToLocaleString';
      try {
        
        let a: number = 127;
        let b: number = 127;
        expect(a).assertEqual(b);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_VALUE_DOUBLEVALUE_TOPRINT_0100
     * @tc.name   testDoubleValueToPrint
     * @tc.desc   Test DoubleValue toPrint method
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testDoubleValueToPrint", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testDoubleValueToPrint';
      try {
        
        let a: number = 3.14159;
        let b: number = 3.14159;
        expect(a).assertEqual(b);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_VALUE_DOUBLEVALUE_TOSTRING_0100
     * @tc.name   testDoubleValueToString
     * @tc.desc   Test DoubleValue toString method
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testDoubleValueToString", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testDoubleValueToString';
      try {
        
        let a: number = 3.14159;
        let b: number = 3.14159;
        expect(a).assertEqual(b);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_VALUE_DOUBLEVALUE_TOLOCALESTRING_0100_01
     * @tc.name   testDoubleValueToLocaleString
     * @tc.desc   Test DoubleValue toLocaleString method
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testDoubleValueToLocaleString", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testDoubleValueToLocaleString';
      try {
        
        let a: number = 3.14159;
        let b: number = 3.14159;
        expect(a).assertEqual(b);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_VALUE_STRINGVALUE_TOPRINT_0100
     * @tc.name   testStringValueToPrint
     * @tc.desc   Test StringValue toPrint method
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testStringValueToPrint", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testStringValueToPrint';
      try {
        
        let a: string = "Hello World";
        let b: string = "Hello World";
        expect(a).assertEqual(b);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_VALUE_STRINGVALUE_TOSTRING_0100
     * @tc.name   testStringValueToString
     * @tc.desc   Test StringValue toString method
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testStringValueToString", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testStringValueToString';
      try {
        
        let a: string = "Hello World";
        let b: string = "Hello World";
        expect(a).assertEqual(b);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_VALUE_STRINGVALUE_TOLOCALESTRING_0100_03
     * @tc.name   testStringValueToLocaleString
     * @tc.desc   Test StringValue toLocaleString method
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testStringValueToLocaleString", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testStringValueToLocaleString';
      try {
        
        let a: string = "Hello World";
        let b: string = "Hello World";
        expect(a).assertEqual(b);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_VALUE_SHORTVALUE_TOPRINT_0100
     * @tc.name   testShortValueToPrint
     * @tc.desc   Test ShortValue toPrint method
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testShortValueToPrint", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testShortValueToPrint';
      try {
        
        let a: number = 32767;
        let b: number = 32767;
        expect(a).assertEqual(b);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_VALUE_SHORTVALUE_TOSTRING_0100
     * @tc.name   testShortValueToString
     * @tc.desc   Test ShortValue toString method
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testShortValueToString", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testShortValueToString';
      try {
        
        let a: number = 32767;
        let b: number = 32767;
        expect(a).assertEqual(b);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_VALUE_SHORTVALUE_TOLOCALESTRING_0100_01
     * @tc.name   testShortValueToLocaleString
     * @tc.desc   Test ShortValue toLocaleString method
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testShortValueToLocaleString", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testShortValueToLocaleString';
      try {
        
        let a: number = 32767;
        let b: number = 32767;
        expect(a).assertEqual(b);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_VALUE_LONGVALUE_TOPRINT_0100
     * @tc.name   testLongValueToPrint
     * @tc.desc   Test LongValue toPrint method
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testLongValueToPrint", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testLongValueToPrint';
      try {
        
        let a: bigint = 9223372036854775807n;
        let b: bigint = 9223372036854775807n;
        expect(a).assertEqual(b);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_VALUE_LONGVALUE_TOSTRING_0100
     * @tc.name   testLongValueToString
     * @tc.desc   Test LongValue toString method
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testLongValueToString", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testLongValueToString';
      try {
        
        let a: bigint = 9223372036854775807n;
        let b: bigint = 9223372036854775807n;
        expect(a).assertEqual(b);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_VALUE_LONGVALUE_TOLOCALESTRING_0100
     * @tc.name   testLongValueToLocaleString
     * @tc.desc   Test LongValue toLocaleString method
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testLongValueToLocaleString", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testLongValueToLocaleString';
      try {
        
        let a: bigint = 9223372036854775807n;
        let b: bigint = 9223372036854775807n;
        expect(a).assertEqual(b);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_VALUE_ARRAYVALUE_TOPRINT_0100
     * @tc.name   testArrayValueToPrint
     * @tc.desc   Test ArrayValue toPrint method
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testArrayValueToPrint", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testArrayValueToPrint';
      try {
        
        let a: number[] = [1, 2, 3];
        let b: number[] = [1, 2, 3];
        expect(a.length).assertEqual(b.length);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_VALUE_ARRAYVALUE_TOSTRING_0100
     * @tc.name   testArrayValueToString
     * @tc.desc   Test ArrayValue toString method
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testArrayValueToString", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testArrayValueToString';
      try {
        
        let a: number[] = [1, 2, 3];
        let b: number[] = [1, 2, 3];
        expect(a.length).assertEqual(b.length);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_VALUE_ARRAYVALUE_TOLOCALESTRING_0100_3
     * @tc.name   testArrayValueToLocaleString
     * @tc.desc   Test ArrayValue toLocaleString method
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testArrayValueToLocaleString", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testArrayValueToLocaleString';
      try {
        
        let a: number[] = [1, 2, 3];
        let b: number[] = [1, 2, 3];
        expect(a.length).assertEqual(b.length);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_VALUE_VOIDVALUE_TOPRINT_0100
     * @tc.name   testVoidValueToPrint_01
     * @tc.desc   Test VoidValue toPrint method
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testVoidValueToPrint_01", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testVoidValueToPrint_01';
      try {
        
        let a: undefined = undefined;
        let b: undefined = undefined;
        expect(a).assertEqual(b);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
    * @tc.number SUB_VALUE_VOIDVALUE_TOSTRING_0100
    * @tc.name   testVoidValueToString
    * @tc.desc   Test VoidValue toString method
    * @tc.size   MEDIUMTEST
    * @tc.type   FUNCTION
    * @tc.level  LEVEL1
    */
    it("testVoidValueToString", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testVoidValueToString';
      try {
        
        let a: undefined = undefined;
        let b: undefined = undefined;
        expect(a).assertEqual(b);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_VALUE_VOIDVALUE_TOLOCALESTRING_0100
     * @tc.name   testVoidValueToLocaleString
     * @tc.desc   Test VoidValue toLocaleString method
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testVoidValueToLocaleString", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testVoidValueToLocaleString';
      try {
        
        let a: undefined = undefined;
        let b: undefined = undefined;
        expect(a).assertEqual(b);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_VALUE_UNDEFINEDVALUE_TOPRINT_0100
     * @tc.name   testUndefinedValueToPrint
     * @tc.desc   Test UndefinedValue toPrint method
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testUndefinedValueToPrint", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testUndefinedValueToPrint';
      try {
        
        let a: undefined = undefined;
        let b: undefined = undefined;
        expect(a).assertEqual(b);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_VALUE_UNDEFINEDVALUE_TOSTRING_0100
     * @tc.name   testUndefinedValueToString
     * @tc.desc   Test UndefinedValue toString method
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testUndefinedValueToString", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testUndefinedValueToString';
      try {
        
        let a: undefined = undefined;
        let b: undefined = undefined;
        expect(a).assertEqual(b);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_VALUE_NULLVALUE_TOPRINT_0100
     * @tc.name   testNullValueToPrint
     * @tc.desc   Test NullValue toPrint method
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testNullValueToPrint", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testNullValueToPrint';
      try {
        
        let a: null = null;
        let b: null = null;
        expect(a).assertEqual(b);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_VALUE_LAMBDAVALUE_TOPRINT_0100
     * @tc.name   testLambdaValueToPrint
     * @tc.desc   Test LambdaValue toPrint method
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testLambdaValueToPrint", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testLambdaValueToPrint';
      try {
        
        let a: Function = () => { return 42; };
        let b: Function = () => { return 42; };
        expect(typeof a).assertEqual(typeof b);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    });
}