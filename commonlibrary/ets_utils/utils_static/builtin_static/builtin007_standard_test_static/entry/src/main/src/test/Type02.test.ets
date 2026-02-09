/**
 * Copyright (c) 2025-2026 SwanLink (Jiangsu) Technology Development Co., LTD.
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
import { BusinessError } from '@ohos.base';
import Utils from './Util.test';

let domain: number = 0x0000;
let tag: string = 'testTag';

class parse {
  text: string = ''
}

function isIteratorEmpty<T>(iterator: Iterator<T>): boolean {
  const firstResult = iterator.next();
  return firstResult.done === true;
}

interface Options {
  type: string,
  endings: string,
}

export default function type_02Test() {
  describe("type_02Test", (): void => {
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

    console.log(domain, tag, '%{public}s', 'describe start');
    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_AssertionError_0100
     * @tc.name    testAssertionError0001
     * @tc.desc    Testing AssertionError without message parameter.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testAssertionError0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testAssertionError0001";
      try {
        let error = new AssertionError();
        expect(error.name).assertEqual("AssertionError");
        expect(error.message).assertEqual("");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_AssertionError_0200
     * @tc.name    testAssertionError0002
     * @tc.desc    Testing AssertionError with undefined message.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testAssertionError0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testAssertionError0002";
      try {
        let error = new AssertionError(undefined);
        expect(error.name).assertEqual("AssertionError");
        expect(error.message).assertEqual("");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_AssertionError_0300
     * @tc.name    testAssertionError0003
     * @tc.desc    Testing AssertionError with message parameter.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testAssertionError0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testAssertionError0003";
      try {
        let errorMessage = "Custom assertion failed";
        let error = new AssertionError(errorMessage);
        expect(error.name).assertEqual("AssertionError");
        expect(error.message).assertEqual(errorMessage);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_AssertionError_0400
     * @tc.name    testAssertionError0004
     * @tc.desc    Testing AssertionError with message parameter.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testAssertionError0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testAssertionError0004";
      try {
        let errorMessage = "Custom assertion failed" + "Custom assertion failed";
        let error = new AssertionError(errorMessage);
        expect(error.name).assertEqual("AssertionError");
        expect(error.message).assertEqual(errorMessage);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_AssertionError_0500
     * @tc.name    testAssertionError0005
     * @tc.desc    Testing AssertionError with empty string message.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testAssertionError0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testAssertionError0005";
      try {
        let errorMessage = "";
        let error = new AssertionError(errorMessage);
        expect(error.name).assertEqual("AssertionError");
        expect(error.message).assertEqual(errorMessage);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_AssertionError_0600
     * @tc.name    testAssertionError0006
     * @tc.desc    Verify that long messages are handled correctly
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testAssertionError0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testAssertionError0006";
      try {
        let errorMessage = "This is a long text.".repeat(500);
        let error = new AssertionError(errorMessage);
        expect(error.name).assertEqual("AssertionError");
        expect(error.message.length).assertEqual(10000);
        expect(error.message).assertEqual(errorMessage);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_AssertionError_0700
     * @tc.name    testAssertionError0007
     * @tc.desc    Verify that messages with special characters are handled
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testAssertionError0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testAssertionError0007";
      try {
        let errorMessage = "Message with special chars: \n\t\\\"'!@#$%^&*()_+-=[]{}|;:,.<>/?";
        let error = new AssertionError(errorMessage);
        expect(error.name).assertEqual("AssertionError");
        expect(error.message).assertEqual(errorMessage);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_DivideByZeroError_0800
     * @tc.name    testDivideByZeroError0008
     * @tc.desc    Testing AssertionError without message parameter.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testDivideByZeroError0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      let TAG = "testDivideByZeroError0008";
      try {
        let error = new DivideByZeroError();
        expect(error.name).assertEqual("DivideByZeroError");
        expect(error.message).assertEqual("");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_DivideByZeroError_0900
     * @tc.name    testDivideByZeroError0009
     * @tc.desc    Verify error can accept and store custom message.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testDivideByZeroError0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      let TAG = "testDivideByZeroError0009";
      try {
        let errorMessage = "Division by zero is not allowed";
        let error = new DivideByZeroError(errorMessage);
        expect(error.message).assertEqual(errorMessage);
        expect(error.name).assertEqual("DivideByZeroError");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_DivideByZeroError_1000
     * @tc.name    testDivideByZeroError0010
     * @tc.desc    Should set cause when provided in options
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testDivideByZeroError0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      let TAG = "testDivideByZeroError0010";
      try {
        let cause = new Error('root cause');
        let error = new DivideByZeroError(undefined, { cause }); //undefined情况下
        expect(error.cause).assertEqual(cause);
        expect(error.message).assertEqual("");
        expect(error.name).assertEqual("DivideByZeroError");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_DivideByZeroError_1100
     * @tc.name    testDivideByZeroError0011
     * @tc.desc    Should set cause and ignore custom message
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testDivideByZeroError0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      let TAG = "testDivideByZeroError0011";
      try {
        let cause = new Error('root cause');
        let error = new DivideByZeroError("custom message", { cause });
        expect(error.cause).assertEqual(cause);
        expect(error.message).assertEqual("custom message");
        expect(error.name).assertEqual("DivideByZeroError");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_NullPointerError_1200
     * @tc.name    testNullPointerError0012
     * @tc.desc    Testing NullPointerError without message parameter.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testNullPointerError0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testNullPointerError0012";
      try {
        let error = new NullPointerError();
        expect(error.name).assertEqual("NullPointerError");
        expect(error.message).assertEqual("");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_NullPointerError_1300
     * @tc.name    testNullPointerError0013
     * @tc.desc    Verify error can accept and store custom message.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testNullPointerError0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      let TAG = "testNullPointerError0013";
      try {
        let testMessage = "Null pointer referenced";
        let error = new NullPointerError(testMessage);
        expect(error.message).assertEqual(testMessage);
        expect(error.name).assertEqual("NullPointerError");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_NullPointerError_1400
     * @tc.name    testNullPointerError0014
     * @tc.desc    Should set cause when provided in options
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testNullPointerError0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      let TAG = "testNullPointerError0014";
      try {
        let cause = new Error('root cause');
        let error = new NullPointerError(undefined, { cause });
        expect(error.cause).assertEqual(cause);
        expect(error.message).assertEqual("");
        expect(error.name).assertEqual("NullPointerError");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_NullPointerError_1500
     * @tc.name    testNullPointerError0015
     * @tc.desc    Should set cause and ignore custom message
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testNullPointerError0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      let TAG = "testNullPointerError0015";
      try {
        let cause = new Error('root cause');
        let error = new NullPointerError("custom message", { cause });
        expect(error.cause).assertEqual(cause);
        expect(error.message).assertEqual("custom message");
        expect(error.name).assertEqual("NullPointerError");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_JSONTypeError_1600
     * @tc.name    testJSONTypeError0016
     * @tc.desc    Testing JSONTypeError without message parameter.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testJSONTypeError0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testJSONTypeError0016";
      try {
        let error = new JSONTypeError(); // 无参调用
        expect(error.name).assertEqual("JSONTypeError");
        expect(error.message).assertEqual("");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_JSONTypeError_1700
     * @tc.name    testJSONTypeError0017
     * @tc.desc    Verify error can accept and store custom message.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testJSONTypeError0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      let TAG = "testJSONTypeError0017";
      try {
        let testMessage = "Expected number but got string";
        let error = new JSONTypeError(testMessage);
        expect(error.name).assertEqual("JSONTypeError");
        expect(error.message).assertEqual(testMessage);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_JSONTypeError_1800
     * @tc.name    testJSONTypeError0018
     * @tc.desc    Should set cause when provided in options
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testJSONTypeError0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      let TAG = "testJSONTypeError0018";
      try {
        let cause = new Error('root cause');
        let error = new JSONTypeError(undefined, { cause });
        expect(error.cause).assertEqual(cause);
        expect(error.message).assertEqual("");
        expect(error.name).assertEqual("JSONTypeError");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_JSONTypeError_1900
     * @tc.name    testJSONTypeError0019
     * @tc.desc    Should set cause and ignore custom message
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testJSONTypeError0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      let TAG = "testJSONTypeError0019";
      try {
        let cause = new Error('root cause');
        let error = new JSONTypeError("custom message", { cause });
        expect(error.cause).assertEqual(cause);
        expect(error.message).assertEqual("custom message");
        expect(error.name).assertEqual("JSONTypeError");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_RangeError_2000
     * @tc.name    testRangeError0020
     * @tc.desc    Test RangeError constructor without parameters
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testRangeError0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      let TAG = "testRangeError0020";
      try {
        let error = new RangeError();
        expect(error.name).assertEqual('RangeError');
        expect(error.message).assertEqual('');
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_RangeError_2100
     * @tc.name    testRangeError0021
     * @tc.desc    Test RangeError static $_invoke method
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testRangeError0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      let TAG = "testRangeError0021";
      try {
        let message = 'Static method error';
        let error = RangeError.$_invoke(message);
        expect(error.name).assertEqual('RangeError');
        expect(error.message).assertEqual(message);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_RangeError_2200
     * @tc.name    testRangeError0022
     * @tc.desc    Test RangeError constructor with message parameter
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testRangeError0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      let TAG = "testRangeError0022";
      try {
        let message = 'Index out of bounds';
        let error = new RangeError(message);
        expect(error.name).assertEqual('RangeError');
        expect(error.message).assertEqual(message);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_RangeError_2300
     * @tc.name    testRangeError0023
     * @tc.desc    Test RangeError constructor with options (including cause)
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testRangeError0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      let TAG = "testRangeError0023";
      try {
        let cause = new Error('Root cause');
        let options: ErrorOptions = { cause };
        let error = new RangeError('Invalid range', options);
        expect(error.name).assertEqual('RangeError');
        expect(error.message).assertEqual('Invalid range');
        expect(error.cause).assertEqual(cause);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_ArithmeticError_2400
     * @tc.name    testArithmeticError0024
     * @tc.desc    Testing ArithmeticError without message parameter.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testArithmeticError0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testArithmeticError0024";
      try {
        let error = new ArithmeticError();
        expect(error.name).assertEqual("ArithmeticError");
        expect(error.message).assertEqual("");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_ArithmeticError_2500
     * @tc.name    testArithmeticError0025
     * @tc.desc    Verify error can accept and store custom message.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testArithmeticError0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      let TAG = "testArithmeticError0025";
      try {
        let testMessage = "Illegal arithmetic operation";
        let error = new ArithmeticError(testMessage);
        expect(error.name).assertEqual("ArithmeticError");
        expect(error.message).assertEqual(testMessage);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_OutOfMemoryError_2600
     * @tc.name    testOutOfMemoryError0026
     * @tc.desc    Testing OutOfMemoryError without message parameter.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testOutOfMemoryError0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testOutOfMemoryError0026";
      try {
        let error = new OutOfMemoryError();
        expect(error.name).assertEqual("OutOfMemoryError");
        expect(error.message).assertEqual("");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_OutOfMemoryError_2700
     * @tc.name    testOutOfMemoryError0027
     * @tc.desc    Verify error can accept and store custom message.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testOutOfMemoryError0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      let TAG = "testOutOfMemoryError0027";
      try {
        let testMessage = "Cannot allocate sufficient memory to complete the operation";
        let error = new OutOfMemoryError(testMessage);
        expect(error.name).assertEqual("OutOfMemoryError");
        expect(error.message).assertEqual(testMessage);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_StackOverflowError_2800
     * @tc.name    testStackOverflowError0028
     * @tc.desc    Testing StackOverflowError without message parameter.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testStackOverflowError0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testStackOverflowError0028";
      try {
        let error = new StackOverflowError();
        expect(error.name).assertEqual("StackOverflowError");
        expect(error.message).assertEqual("");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_StackOverflowError_2900
     * @tc.name    testStackOverflowError0029
     * @tc.desc    Verify error can accept and store custom message.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testStackOverflowError0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      let TAG = "testStackOverflowError0029";
      try {
        let testMessage = "Error creating the activation frame";
        let error = new StackOverflowError(testMessage);
        expect(error.name).assertEqual("StackOverflowError");
        expect(error.message).assertEqual(testMessage);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_InstantiationError_3000
     * @tc.name    testInstantiationError0030
     * @tc.desc    Testing InstantiationError without message parameter.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testInstantiationError0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testInstantiationError0030";
      try {
        let error = new InstantiationError();
        expect(error.name).assertEqual("InstantiationError");
        expect(error.message).assertEqual("");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_InstantiationError_3100
     * @tc.name    testInstantiationError0031
     * @tc.desc    Verify error can accept and store custom message.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testInstantiationError0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      let TAG = "testInstantiationError0031";
      try {
        let testMessage = "Error attempting to instantiate abstract class or an interface";
        let error = new InstantiationError(testMessage);
        expect(error.name).assertEqual("InstantiationError");
        expect(error.message).assertEqual(testMessage);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_InternalError_3200
     * @tc.name    testInternalError0032
     * @tc.desc    Testing InternalError without message parameter.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testInternalError0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testInternalError0032";
      try {
        let error = new InternalError();
        expect(error.name).assertEqual("InternalError");
        expect(error.message).assertEqual("");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_InternalError_3300
     * @tc.name    testInternalError0033
     * @tc.desc    Verify error can accept and store custom message.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testInternalError0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      let TAG = "testInternalError0033";
      try {
        let testMessage = "Internal error occurred during runtime initialization";
        let error = new InternalError(testMessage);
        expect(error.name).assertEqual("InternalError");
        expect(error.message).assertEqual(testMessage);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_IllegalMonitorStateError_3400
     * @tc.name    testIllegalMonitorStateError0034
     * @tc.desc    Testing IllegalMonitorStateError without message parameter.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testIllegalMonitorStateError0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testIllegalMonitorStateError0034";
      try {
        let error = new IllegalMonitorStateError();
        expect(error.name).assertEqual("IllegalMonitorStateError");
        expect(error.message).assertEqual("");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_IllegalMonitorStateError_3500
     * @tc.name    testIllegalMonitorStateError0035
     * @tc.desc    Verify error can accept and store custom message.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testIllegalMonitorStateError0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      let TAG = "testIllegalMonitorStateError0035";
      try {
        let testMessage = "IllegalMonitorStateError";
        let error = new IllegalMonitorStateError(testMessage);
        expect(error.name).assertEqual("IllegalMonitorStateError");
        expect(error.message).assertEqual(testMessage);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_IndexOutOfBoundsError_3600
     * @tc.name    testIndexOutOfBoundsError0036
     * @tc.desc    Testing IndexOutOfBoundsError without message parameter.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testIndexOutOfBoundsError0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testIndexOutOfBoundsError0036";
      try {
        let error = new IndexOutOfBoundsError();
        expect(error.name).assertEqual("IndexOutOfBoundsError");
        expect(error.message).assertEqual("");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_IndexOutOfBoundsError_3700
     * @tc.name    testIndexOutOfBoundsError0037
     * @tc.desc    Verify error can accept and store custom message.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testIndexOutOfBoundsError0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      let TAG = "testIndexOutOfBoundsError0037";
      try {
        let testMessage = "Provided collection index is out of bounds";
        let error = new IndexOutOfBoundsError(testMessage);
        expect(error.name).assertEqual("IndexOutOfBoundsError");
        expect(error.message).assertEqual(testMessage);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_StringIndexOutOfBoundsError_3800
     * @tc.name    testStringIndexOutOfBoundsError0038
     * @tc.desc    Testing StringIndexOutOfBoundsError without message parameter.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testStringIndexOutOfBoundsError0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testStringIndexOutOfBoundsError0038";
      try {
        let error = new StringIndexOutOfBoundsError();
        expect(error.name).assertEqual("StringIndexOutOfBoundsError");
        expect(error.message).assertEqual("");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_StringIndexOutOfBoundsError_3900
     * @tc.name    testStringIndexOutOfBoundsError0039
     * @tc.desc    Verify error can accept and store custom message.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testStringIndexOutOfBoundsError0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      let TAG = "testStringIndexOutOfBoundsError0039";
      try {
        let testMessage = "Provided collection index is out of bounds";
        let error = new StringIndexOutOfBoundsError(testMessage);
        expect(error.name).assertEqual("StringIndexOutOfBoundsError");
        expect(error.message).assertEqual(testMessage);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_ClassCastError_4000
     * @tc.name    testClassCastError0040
     * @tc.desc    Testing ClassCastError without message parameter.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testClassCastError0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testClassCastError0040";
      try {
        let error = new ClassCastError();
        expect(error.name).assertEqual("ClassCastError");
        expect(error.message).assertEqual("");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_ClassCastError_4100
     * @tc.name    testClassCastError0041
     * @tc.desc    Verify error can accept and store custom message.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testClassCastError0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      let TAG = "testClassCastError0041";
      try {
        let testMessage = "Thrown in case of illegal class casting\n";
        let error = new ClassCastError(testMessage);
        expect(error.name).assertEqual("ClassCastError");
        expect(error.message).assertEqual(testMessage);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_UncaughtExceptionError_4200
     * @tc.name    testUncaughtExceptionError0042
     * @tc.desc    Testing UncaughtExceptionError without message parameter.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testUncaughtExceptionError0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testUncaughtExceptionError0042";
      try {
        let error = new UncaughtExceptionError();
        expect(error.name).assertEqual("UncaughtExceptionError");
        expect(error.message).assertEqual("");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_UncaughtExceptionError_4300
     * @tc.name    testUncaughtExceptionError0043
     * @tc.desc    Verify error can accept and store custom message.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testUncaughtExceptionError0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      let TAG = "testUncaughtExceptionError0043";
      try {
        let testMessage = "Thrown in case of illegal class casting";
        let error = new UncaughtExceptionError(testMessage);
        expect(error.name).assertEqual("UncaughtExceptionError");
        expect(error.message).assertEqual(testMessage);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });
  });
}