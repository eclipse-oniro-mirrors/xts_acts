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
import { BusinessError } from '@ohos.base';
import Utils from './Util.test';
let domain: number = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

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

export default function Array_02Test() {
  describe('Array_02Test', (): void => {
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
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_JOIN_Boolean_0100
     * @tc.name    testJoinBoolean0001
     * @tc.desc    Testing Type.of with null.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testJoinBoolean0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testJoinBoolean0001";
      try {
        let a = Type.of(null);
        expect(String(a)).assertEqual(String(null));
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_JOIN_Boolean_0200
     * @tc.name    testJoinBoolean0002
     * @tc.desc    Testing join function with an empty array.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testJoinBoolean0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      let TAG = "testJoinBoolean0002";
      try {
        let array: FixedArray<boolean> = [];
        let result = join(array,',');
        expect(result).assertEqual("");
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_JOIN_Boolean_0300
     * @tc.name    testJoinBoolean0003
     * @tc.desc    Testing join function with a single element array.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testJoinBoolean0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      let TAG = "testJoinBoolean0003";
      try {
        let array: FixedArray<boolean> = [true];
        let result = join(array,',');
        expect(result).assertEqual("true");
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_JOIN_Boolean_0400
     * @tc.name    testJoinBoolean0004
     * @tc.desc    Testing join function with multiple elements and default separator.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testJoinBoolean0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testJoinBoolean0004";
      try {
        let array: FixedArray<boolean> = [true,false,true];
        let result = join(array,',');
        expect(result).assertEqual("true,false,true");
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_JOIN_Boolean_0500
     * @tc.name    testJoinBoolean0005
     * @tc.desc    Testing join function with multiple elements and custom separator"-".
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testJoinBoolean0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testJoinBoolean0005";
      try {
        let array: FixedArray<boolean> = [true,false,true];
        let result = join(array,"-");
        expect(result).assertEqual("true-false-true");
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_JOIN_Byte_0100
     * @tc.name    testJoinByte0001
     * @tc.desc    Testing join function with an empty byte array.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testJoinByte0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testJoinByte0001";
      try {
        let array: FixedArray<byte> = [];
        let result = join(array, ',');
        expect(result).assertEqual("");
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_JOIN_Byte_0200
     * @tc.name    testJoinByte0002
     * @tc.desc    Testing join function with a single element byte array.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testJoinByte0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testJoinByte0002";
      try {
        let array: FixedArray<byte> = [65];
        let result = join(array, ',');
        expect(result).assertEqual("65");
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_JOIN_Byte_0300
     * @tc.name    testJoinByte0003
     * @tc.desc    Testing join function with multiple byte elements and default separator.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testJoinByte0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testJoinByte0003";
      try {
        let array: FixedArray<byte> = [65, 66, 67];
        let result = join(array, ',');
        expect(result).assertEqual("65,66,67");
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_JOIN_Byte_0400
     * @tc.name    testJoinByte0004
     * @tc.desc    Testing join function with multiple byte elements and custom separator "-".
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testJoinByte0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testJoinByte0004";
      try {
        let array: FixedArray<byte> = [65, 66, 67];
        let result = join(array, "-");
        expect(result).assertEqual("65-66-67");
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_JOIN_CHAR_0100
     * @tc.name    testJoinChar0001
     * @tc.desc    Testing joinChar function with an empty array.
     * @tc.size    SmallTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testJoinChar0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      let TAG = "testJoinChar0001";
      try {
        let array: FixedArray<char> = [];
        let result = join(array, ',');
        expect(result).assertEqual("");
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_JOIN_Double_0100
     * @tc.name    testJoinDouble0001
     * @tc.desc    Testing join function with an empty double array.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testJoinDouble0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testJoinDouble0001";
      try {
        let array: FixedArray<double> = [];
        let result = join(array, ',');
        expect(result).assertEqual("");
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_JOIN_Double_0200
     * @tc.name    testJoinDouble0002
     * @tc.desc    Testing join function with a single element double array.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testJoinDouble0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testJoinDouble0002";
      try {
        let array: FixedArray<double> = [3.14];
        let result = join(array, ',');
        expect(result).assertEqual("3.14");
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_JOIN_Double_0300
     * @tc.name    testJoinDouble0003
     * @tc.desc    Testing join function with multiple double elements and default separator.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testJoinDouble0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testJoinDouble0003";
      try {
        let array: FixedArray<double> = [1.1, 2.2, 3.3];
        let result = join(array, ',');
        expect(result).assertEqual("1.1,2.2,3.3");
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_JOIN_Double_0400
     * @tc.name    testJoinDouble0004
     * @tc.desc    Testing join function with multiple double elements and custom separator "-".
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testJoinDouble0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testJoinDouble0004";
      try {
        let array: FixedArray<double> = [1.1, 2.2, 3.3];
        let result = join(array, "-");
        expect(result).assertEqual("1.1-2.2-3.3");
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_JOIN_Float_0100
     * @tc.name    testJoinFloat0001
     * @tc.desc    Testing join function with an empty float array.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testJoinFloat0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testJoinFloat0001";
      try {
        let array: FixedArray<float> = [];
        let result = join(array, ',');
        expect(result).assertEqual("");
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_JOIN_INT_0100
     * @tc.name    testJoinInt0001
     * @tc.desc    Testing join function with an empty array.
     * @tc.size    SmallTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testJoinInt0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      let TAG = "testJoinInt0001";
      try {
        let array: FixedArray<int> = [];
        let result = join(array, ',');
        expect(result).assertEqual("");
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_JOIN_INT_0200
     * @tc.name    testJoinInt0002
     * @tc.desc    Testing join function with a single element array.
     * @tc.size    SmallTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testJoinInt0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      let TAG = "testJoinInt0002";
      try {
        let array: FixedArray<int> = [123];
        let result = join(array, ',');
        expect(result).assertEqual("123");
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_JOIN_INT_0300
     * @tc.name    testJoinInt0003
     * @tc.desc    Testing join function with multiple elements and default separator.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testJoinInt0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testJoinInt0003";
      try {
        let array: FixedArray<int> = [1, 2, 3];
        let result = join(array, ',');
        expect(result).assertEqual("1,2,3");
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_JOIN_INT_0400
     * @tc.name    testJoinInt0004
     * @tc.desc    Testing join function with multiple elements and custom separator "-".
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testJoinInt0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testJoinInt0004";
      try {
        let array: FixedArray<int> = [10, 20, 30];
        let result = join(array, "-");
        expect(result).assertEqual("10-20-30");
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_KEYS_Boolean_0100
     * @tc.name    testKeysBoolean0001
     * @tc.desc    Test non-empty array index generation
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testKeysBoolean0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testKeysBoolean0001";
      try {
        const testArray: FixedArray<boolean> = [true, false, true];
        const iterator = keys(testArray);
        const result = Array.from(iterator);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify([0, 1, 2]));
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_KEYS_Boolean_0200
     * @tc.name    testKeysBoolean0002
     * @tc.desc    Test empty array index generation
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testKeysBoolean0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testKeysBoolean0002";
      try {
        const testArray: FixedArray<boolean> = [true];
        const iterator = keys(testArray);
        const result = Array.from(iterator);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify([0]));
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_KEYS_Boolean_0300
     * @tc.name    testKeysBoolean0003
     * @tc.desc    Single-element array
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testKeysBoolean0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testKeysBoolean0003";
      try {
        const emptyIterator = keys([] as FixedArray<boolean>);
        expect(Array.from(emptyIterator).length).assertEqual(0);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_KEYS_Byte_0100
     * @tc.name    testKeysByte0001
     * @tc.desc    Test non-empty array index generation
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testKeysByte0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testKeysByte0001";
      try {
        const testArray: FixedArray<byte> = [1, 0, 1];
        const iterator = keys(testArray);
        const result = Array.from(iterator);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify([0, 1, 2]));
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_KEYS_Byte_0200
     * @tc.name    testKeysByte0002
     * @tc.desc    Test empty array index generation
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testKeysByte0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testKeysByte0002";
      try {
        const testArray: FixedArray<byte> = [1];
        const iterator = keys(testArray);
        const result = Array.from(iterator);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify([0]));
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_KEYS_Byte_0300
     * @tc.name    testKeysByte0003
     * @tc.desc    Single-element array
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testKeysByte0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testKeysByte0003";
      try {
        const emptyIterator = keys([] as FixedArray<byte>);
        expect(Array.from(emptyIterator).length).assertEqual(0);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_KEYS_Char_0100
     * @tc.name    testKeysChar0001
     * @tc.desc    Single-element array
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testKeysChar0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testKeysChar0001";
      try {
        const emptyIterator = keys([] as FixedArray<char>);
        expect(Array.from(emptyIterator).length).assertEqual(0);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_KEYS_Double_0100
     * @tc.name    testKeysDouble0001
     * @tc.desc    Test non-empty array index generation
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testKeysDouble0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testKeysDouble0001";
      try {
        const testArray: FixedArray<double> = [1.1, 2.2, 3.3];
        const iterator = keys(testArray);
        const result = Array.from(iterator);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify([0, 1, 2]));
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_KEYS_Double_0200
     * @tc.name    testKeysDouble0002
     * @tc.desc    Test empty array index generation
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testKeysDouble0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testKeysDouble0002";
      try {
        const testArray: FixedArray<double> = [1.5];
        const iterator = keys(testArray);
        const result = Array.from(iterator);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify([0]));
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_KEYS_Double_0300
     * @tc.name    testKeysDouble0003
     * @tc.desc    Single-element array
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testKeysDouble0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testKeysDouble0003";
      try {
        const emptyIterator = keys([] as FixedArray<double>);
        expect(Array.from(emptyIterator).length).assertEqual(0);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_KEYS_Float_0100
     * @tc.name    testKeysFloat0001
     * @tc.desc    Test empty array index generation
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testKeysFloat0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testKeysFloat0001";
      try {
        const testArray: FixedArray<float> = [1.5];
        const iterator = keys(testArray);
        const result = Array.from(iterator);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify([0]));
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_KEYS_Float_0200
     * @tc.name    testKeysFloat0002
     * @tc.desc    Single-element array
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testKeysFloat0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testKeysFloat0002";
      try {
        const emptyIterator = keys([] as FixedArray<float>);
        expect(Array.from(emptyIterator).length).assertEqual(0);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_KEYS_Int_0100
     * @tc.name    testKeysInt0001
     * @tc.desc    Test non-empty array index generation
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testKeysInt0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testKeysInt0001";
      try {
        const testArray: FixedArray<int> = [10, 20, 30];
        const iterator = keys(testArray);
        const result = Array.from(iterator);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify([0, 1, 2]));
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_KEYS_Int_0200
     * @tc.name    testKeysInt0002
     * @tc.desc    Test empty array index generation
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testKeysInt0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testKeysInt0002";
      try {
        const testArray: FixedArray<int> = [15];
        const iterator = keys(testArray);
        const result = Array.from(iterator);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify([0]));
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_KEYS_Int_0300
     * @tc.name    testKeysInt0003
     * @tc.desc    Single-element array
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testKeysInt0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testKeysInt0003";
      try {
        const emptyIterator = keys([] as FixedArray<int>);
        expect(Array.from(emptyIterator).length).assertEqual(0);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_KEYS_Long_0100
     * @tc.name    testKeysLong0001
     * @tc.desc    Test non-empty array index generation
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testKeysLong0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testKeysLong0001";
      try {
        const testArray: FixedArray<long> = [10000000000, 20000000000, 30000000000];
        const iterator = keys(testArray);
        const result = Array.from(iterator);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify([0, 1, 2]));
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_KEYS_Long_0200
     * @tc.name    testKeysLong0002
     * @tc.desc    Test empty array index generation
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testKeysLong0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testKeysLong0002";
      try {
        const testArray: FixedArray<long> = [15000000000];
        const iterator = keys(testArray);
        const result = Array.from(iterator);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify([0]));
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_KEYS_Long_0300
     * @tc.name    testKeysLong0003
     * @tc.desc    Single-element array
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testKeysLong0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testKeysLong0003";
      try {
        const emptyIterator = keys([] as FixedArray<long>);
        expect(Array.from(emptyIterator).length).assertEqual(0);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_KEYS_Short_0100
     * @tc.name    testKeysShort0001
     * @tc.desc    Test non-empty array index generation
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testKeysShort0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testKeysShort0001";
      try {
        const testArray: FixedArray<short> = [10, 20, 30];
        const iterator = keys(testArray);
        const result = Array.from(iterator);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify([0, 1, 2]));
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_KEYS_Short_0200
     * @tc.name    testKeysShort0002
     * @tc.desc    Test empty array index generation
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testKeysShort0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testKeysShort0002";
      try {
        const testArray: FixedArray<short> = [15];
        const iterator = keys(testArray);
        const result = Array.from(iterator);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify([0]));
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_KEYS_Short_0300
     * @tc.name    testKeysShort0003
     * @tc.desc    Single-element array
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testKeysShort0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testKeysShort0003";
      try {
        const emptyIterator = keys([] as FixedArray<short>);
        expect(Array.from(emptyIterator).length).assertEqual(0);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_MAP_Boolean_0100
     * @tc.name    testMapBoolean0001
     * @tc.desc    Test map function with boolean array inversion.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testMapBoolean0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testMapBoolean0001";
      try {
        const original: FixedArray<boolean> = [true, false, true] as FixedArray<boolean>;
        const invert = (value: boolean): boolean => !value;
        const result = map(original, invert);
        const expected: FixedArray<boolean> = [false, true, false] as FixedArray<boolean>;
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expected));
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_MAP_Boolean_0300
     * @tc.name    testMapBoolean0003
     * @tc.desc    Test map with empty array.
     * @tc.size    SmallTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testMapBoolean0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const TAG = "testMapBoolean0003";
      try {
        const emptyArray = new boolean[0] as FixedArray<boolean>;
        const callback = (val: boolean): boolean => {
          expect().assertFail();
          return val;
        };
        const result = map(emptyArray, callback);
        expect(result.length).assertEqual(0);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_MAP_BYTE_0100
     * @tc.name    testMapByte0001
     * @tc.desc    Test basic byte array mapping with increment operation.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testMapByte0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testMapByte0001";
      try {
        const input: FixedArray<byte> = [10, 20, 30] as FixedArray<byte>;
        const increment = (val: byte): byte => val + 5 as byte;
        const result = map(input, increment);
        const expected: FixedArray<byte> = [15, 25, 35] as FixedArray<byte>;
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expected));
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_MAP_BYTE_0200
     * @tc.name    testMapByte0002
     * @tc.desc    Test mapping with empty byte array.
     * @tc.size    SmallTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testMapByte0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const TAG = "testMapByte0002";
      try {
        const empty: FixedArray<byte> = new byte[0] as FixedArray<byte>;
        const callback = (val: byte): byte => {
          expect().assertFail();
          return val;
        };
        const result = map(empty, callback);
        expect(result.length).assertEqual(0);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_MAP_BYTE_0300
     * @tc.name    testMapByte0003
     * @tc.desc    Test basic byte array mapping with decrement operation.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testMapByte0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testMapByte0003";
      try {
        const input: FixedArray<byte> = [10, 20, 30] as FixedArray<byte>;
        const increment = (val: byte): byte => val - 5 as byte;
        const result = map(input, increment);
        const expected: FixedArray<byte> = [5, 15, 25] as FixedArray<byte>;
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expected));
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_MAP_CHAR_0100
     * @tc.name    testMapChar0001
     * @tc.desc    Test mapping with empty char array.
     * @tc.size    SmallTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testMapChar0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const TAG = "testMapChar0001";
      try {
        const empty: FixedArray<char> = new char[0] as FixedArray<char>;
        const callback = (val: char): char => {
          expect().assertFail();
          return val;
        };
        const result = map(empty, callback);
        expect(result.length).assertEqual(0);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_VALUES_DOUBLE_0100
     * @tc.name    testValuesDouble0001
     * @tc.desc    Test values iterator for double array
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testValuesDouble0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testValuesDouble0001";
      try {
        const input: FixedArray<double> = [1.5, 2.3, 3.7] as FixedArray<double>;
        const iterator = values(input);
        const result: double[] = [];
        for (const val of iterator) {
          result.push(val);
        }
        expect(JSON.stringify(result)).assertEqual(JSON.stringify([1.5, 2.3, 3.7]));
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_MAP_DOUBLE_0200
     * @tc.name    testMapDouble0002
     * @tc.desc    Test mapping with empty double array
     * @tc.size    SmallTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testMapDouble0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const TAG = "testMapDouble0002";
      try {
        const empty: FixedArray<double> = new double[0] as FixedArray<double>;
        const callback = (val: double): double => {
          expect().assertFail();
          return val;
        };
        const result = map(empty, callback);
        expect(result.length).assertEqual(0);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_MAP_DOUBLE_0300
     * @tc.name    testMapDouble0003
     * @tc.desc    Test double array mapping with precision handling
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testMapDouble0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testMapDouble0003";
      try {
        const input: FixedArray<double> = [0.1, 0.2, 0.3] as FixedArray<double>;
        const sum = (val: double): double => val + 0.4;
        const result = map(input, sum);
        const expected: FixedArray<double> = [0.5, 0.6, 0.7] as FixedArray<double>;
        for (let i = 0; i < result.length; i++) {
          expect(Math.abs(result[i] - expected[i]) < 1e-10).assertTrue();
        }
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_MAP_DOUBLE_0400
     * @tc.name    testMapDouble0004
     * @tc.desc    Test basic double array mapping with multiplication
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testMapDouble0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testMapDouble0004";
      try {
        const input: FixedArray<double> = [1.0, 2.0, 3.0] as FixedArray<double>;
        const square = (val: double): double => val * val;
        const result = map(input, square);
        const expected: FixedArray<double> = [1.0, 4.0, 9.0] as FixedArray<double>;
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expected));
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_MAP_FLOAT_0100
     * @tc.name    testMapFloat0001
     * @tc.desc    Test mapping with empty float array
     * @tc.size    SmallTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testMapFloat0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const TAG = "testMapFloat0001";
      try {
        const empty: FixedArray<float> = new float[0] as FixedArray<float>;
        const callback = (val: float): float => {
          expect().assertFail();
          return val;
        };
        const result = map(empty, callback);
        expect(result.length).assertEqual(0);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_MAP_FLOAT_0300
     * @tc.name    testMapFloat0003
     * @tc.desc    Test basic float array mapping with multiplication
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testMapFloat0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testMapFloat0003";
      try {
        const input: FixedArray<float> = [1.0, 2.0, 3.0] as FixedArray<float>;
        const square = (val: float): float => val * val;
        const result = map(input, square);
        const expected: FixedArray<float> = [1.0, 4.0, 9.0] as FixedArray<float>;
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expected));
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_Map_INT_0100
     * @tc.name    testMapInt0001
     * @tc.desc    Test values iterator for int array
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testMapInt0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testMapInt0001";
      try {
        const input: FixedArray<int> = [5, 10, 15] as FixedArray<int>;
        const iterator = values(input);
        const result: int[] = [];
        for (const val of iterator) {
          result.push(val);
        }
        expect(JSON.stringify(result)).assertEqual(JSON.stringify([5, 10, 15]));
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_MAP_INT_0200
     * @tc.name    testMapInt0002
     * @tc.desc    Test mapping with empty int array
     * @tc.size    SmallTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testMapInt0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const TAG = "testMapInt0002";
      try {
        const empty: FixedArray<int> = new int[0] as FixedArray<int>;
        const callback = (val: int): int => {
          expect().assertFail(); // 确保回调不被执行
          return val;
        };
        const result = map(empty, callback);
        expect(result.length).assertEqual(0);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_MAP_INT_0300
     * @tc.name    testMapInt0003
     * @tc.desc    Test int array mapping with addition
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testMapInt0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testMapInt0003";
      try {
        const input: FixedArray<int> = [10, 20, 30] as FixedArray<int>;
        const add = (val: int): int => val + 5;
        const result = map(input, add);
        const expected: FixedArray<int> = [15, 25, 35] as FixedArray<int>;
        for (let i = 0; i < result.length; i++) {
          expect(result[i]).assertEqual(expected[i]);
        }
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_MAP_INT_0400
     * @tc.name    testMapInt0004
     * @tc.desc    Test int array mapping with subtraction
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testMapInt0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testMapInt0004";
      try {
        const input: FixedArray<int> = [15, 25, 35] as FixedArray<int>;
        const subtract = (val: int): int => val - 5;
        const result = map(input, subtract);
        const expected: FixedArray<int> = [10, 20, 30] as FixedArray<int>;
        for (let i = 0; i < result.length; i++) {
          expect(result[i]).assertEqual(expected[i]);
        }
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_MAP_INT_0500
     * @tc.name    testMapInt0005
     * @tc.desc    Test int array mapping with multiplication
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testMapInt0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testMapInt0005";
      try {
        const input: FixedArray<int> = [2, 3, 4] as FixedArray<int>;
        const square = (val: int): int => val * val;
        const result = map(input, square);
        const expected: FixedArray<int> = [4, 9, 16] as FixedArray<int>;
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expected));
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_VALUES_LONG_0100
     * @tc.name    testValuesLong0001
     * @tc.desc    Test values iterator for long array
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testValuesLong0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testValuesLong0001";
      try {
        const input: FixedArray<long> = [1000000000, 2000000000, 3000000000] as FixedArray<long>;
        const iterator = values(input);
        const result: long[] = [];
        for (const val of iterator) {
          result.push(val);
        }
        expect(JSON.stringify(result)).assertEqual(JSON.stringify([1000000000, 2000000000, 3000000000]));
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_MAP_LONG_0200
     * @tc.name    testMapLong0002
     * @tc.desc    Test mapping with empty long array
     * @tc.size    SmallTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testMapLong0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const TAG = "testMapLong0002";
      try {
        const empty: FixedArray<long> = new long[0] as FixedArray<long>;
        const callback = (val: long): long => {
          expect().assertFail();
          return val;
        };
        const result = map(empty, callback);
        expect(result.length).assertEqual(0);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_MAP_LONG_0300
     * @tc.name    testMapLong0003
     * @tc.desc    Test long array mapping with large number addition
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testMapLong0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testMapLong0003";
      try {
        const input: FixedArray<long> = [1000000000, 2000000000, 3000000000] as FixedArray<long>;
        const add = (val: long): long => val + 500000000;
        const result = map(input, add);
        const expected: FixedArray<long> = [1500000000, 2500000000, 3500000000] as FixedArray<long>;
        for (let i = 0; i < result.length; i++) {
          expect(result[i]).assertEqual(expected[i]);
        }
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_MAP_LONG_0400
     * @tc.name    testMapLong0004
     * @tc.desc    Test long array mapping with large number subtraction
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testMapLong0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testMapLong0004";
      try {
        const input: FixedArray<long> = [1500000000, 2500000000, 3500000000] as FixedArray<long>;
        const subtract = (val: long): long => val - 500000000;
        const result = map(input, subtract);
        const expected: FixedArray<long> = [1000000000, 2000000000, 3000000000] as FixedArray<long>;
        for (let i = 0; i < result.length; i++) {
          expect(result[i]).assertEqual(expected[i]);
        }
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_MAP_LONG_0500
     * @tc.name    testMapLong0005
     * @tc.desc    Test long array mapping with multiplication
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testMapLong0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testMapLong0005";
      try {
        const input: FixedArray<long> = [1000, 2000, 3000] as FixedArray<long>;
        const multiply = (val: long): long => val * 10;
        const result = map(input, multiply);
        const expected: FixedArray<long> = [10000, 20000, 30000] as FixedArray<long>;
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expected));
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_MAP_SHORT_0100
     * @tc.name    testMapShort0001
     * @tc.desc    Test basic short array mapping with increment operation.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testMapShort0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testMapShort0001";
      try {
        const input: FixedArray<short> = [100, 200, 300] as FixedArray<short>;
        const increment = (val: short): short => val + 50 as short;
        const result = map(input, increment);
        const expected: FixedArray<short> = [150, 250, 350] as FixedArray<short>;
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expected));
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_MAP_SHORT_0200
     * @tc.name    testMapShort0002
     * @tc.desc    Test mapping with empty short array.
     * @tc.size    SmallTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testMapShort0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const TAG = "testMapShort0002";
      try {
        const empty: FixedArray<short> = new short[0] as FixedArray<short>;
        const callback = (val: short): short => {
          expect().assertFail();
          return val;
        };
        const result = map(empty, callback);
        expect(result.length).assertEqual(0);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_MAP_SHORT_0300
     * @tc.name    testMapShort0003
     * @tc.desc    Test basic short array mapping with decrement operation.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testMapShort0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testMapShort0003";
      try {
        const input: FixedArray<short> = [500, 1000, 1500] as FixedArray<short>;
        const decrement = (val: short): short => val - 100 as short;
        const result = map(input, decrement);
        const expected: FixedArray<short> = [400, 900, 1400] as FixedArray<short>;
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expected));
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_REDUCE_BOOLEAN_0100
     * @tc.name    testReduceBOOLEAN0001
     * @tc.desc    Test the basic functionality of the reduce function (for multi-element arrays)
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testReduceBOOLEAN0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testReduceBOOLEAN0001";
      try {
        const testArray: FixedArray<boolean> = [true, false, true];
        const andCallback = (acc: boolean, curr: boolean) => acc && curr;
        const result = reduce(testArray, andCallback);
        expect(result).assertFalse();
        const orCallback = (acc: boolean, curr: boolean) => acc || curr;
        expect(reduce(testArray, orCallback)).assertTrue();
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_REDUCE_BOOLEAN_0200
     * @tc.name    testReduceBOOLEAN0002
     * @tc.desc    Testing reduce with single-element array should return the element.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testReduceBOOLEAN0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testReduceBOOLEAN0002";
      try {
        const testArray: FixedArray<boolean> = [true];
        const andCallback = (acc: boolean, curr: boolean) => acc && curr;
        const result = reduce(testArray, andCallback);
        expect(result).assertTrue();
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_REDUCE_BOOLEAN_0300
     * @tc.name    testReduceBOOLEAN0003
     * @tc.desc    Testing reduce with logical OR operation.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testReduceBOOLEAN0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testReduceBOOLEAN0003";
      try {
        const testArray: FixedArray<boolean> = [false,true,false];
        const andCallback = (acc: boolean, curr: boolean) => acc || curr;
        const result = reduce(testArray, andCallback);
        expect(result).assertTrue();
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_REDUCE_DOUBLE_0100
     * @tc.name    testReduceDOUBLE_Sum
     * @tc.desc    Test basic reduce functionality with summation
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testReduceDOUBLE_Sum', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testReduceDOUBLE_Sum";
      try {
        const testArray: FixedArray<double> = [1.5, 2.5, 3.5, 4.5];
        const sumCallback = (acc: double, curr: double) => acc + curr;
        const result = reduce(testArray, sumCallback);
        // 1.5 + 2.5 + 3.5 + 4.5 = 12.0
        expect(result).assertClose(12.0, 0.0001);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_REDUCE_DOUBLE_0200
     * @tc.name    testReduceDOUBLE_SingleElement
     * @tc.desc    Test reduce with single-element array
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testReduceDOUBLE_SingleElement', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testReduceDOUBLE_SingleElement";
      try {
        const testArray: FixedArray<double> = [3.14159];
        const callback = (acc: double, curr: double) => acc * 2; // Shouldn't execute
        const result = reduce(testArray, callback);
        expect(result).assertClose(3.14159, 0.00001);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_REDUCE_DOUBLE_0300
     * @tc.name    testReduceDOUBLE_Product
     * @tc.desc    Test reduce with multiplication operation
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testReduceDOUBLE_Product', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testReduceDOUBLE_Product";
      try {
        const testArray: FixedArray<double> = [1.5, 2.0, 3.0, 4.0];
        const productCallback = (acc: double, curr: double) => acc * curr;
        const result = reduce(testArray, productCallback);
        expect(result).assertClose(36.0, 0.0001);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_REDUCE_DOUBLE_0400
     * @tc.name    testReduceDOUBLE_FloatingPointPrecision
     * @tc.desc    Test floating-point precision handling
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testReduceDOUBLE_FloatingPointPrecision', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testReduceDOUBLE_FloatingPointPrecision";
      try {
        const testArray: FixedArray<double> = [0.1, 0.2, 0.3];
        const sumCallback = (acc: double, curr: double) => acc + curr;
        const result = reduce(testArray, sumCallback);
        // 0.1 + 0.2 + 0.3 = 0.6 (with floating point precision)
        expect(result).assertClose(0.6, 0.0000001);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_REDUCE_DOUBLE_0500
     * @tc.name    testReduceDOUBLE_MaxValue
     * @tc.desc    Test finding maximum value with reduce
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testReduceDOUBLE_MaxValue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testReduceDOUBLE_MaxValue";
      try {
        const testArray: FixedArray<double> = [5.5, -2.3, 10.8, 7.1, 3.2];
        const maxCallback = (acc: double, curr: double) => acc > curr ? acc : curr;
        const result = reduce(testArray, maxCallback);
        expect(result).assertClose(10.8, 0.0001);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_REDUCE_0100
     * @tc.name    testReduce0001
     * @tc.desc    Testing reduce with float array multiplication.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testReduce0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testReduce0001";
      try {
        let testArray: FixedArray<float> = [2.0, 3.0, 4.0];
        let result = reduce(testArray,
          (previousValue: float, currentValue: float) => {
            return previousValue * currentValue;
          }
        );
        expect(result).assertEqual(24.0);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_REDUCE_0200
     * @tc.name    testReduce0002
     * @tc.desc    Testing reduce with float array addition.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testReduce0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testReduce0002";
      try {
        let testArray: FixedArray<float> = [1.5, 2.5, 3.5];
        let result = reduce(testArray,
          (previousValue: float, currentValue: float) => {
            return previousValue + currentValue;
          }
        );
        expect(result).assertEqual(7.5);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_REDUCE_0300
     * @tc.name    testReduce0003
     * @tc.desc    Testing reduce with float array subtraction.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testReduce0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testReduce0003";
      try {
        let testArray: FixedArray<float> = [10.0, 1.5, 2.5];
        let result = reduce(testArray,
          (previousValue: float, currentValue: float) => {
            return previousValue - currentValue;
          }
        );
        expect(result).assertEqual(6.0);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_REDUCE_INT_0100
     * @tc.name    testReduceINT_Sum
     * @tc.desc    Test basic reduce functionality with summation
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testReduceINT_Sum', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testReduceINT_Sum";
      try {
        const testArray: FixedArray<int> = [1, 2, 3, 4, 5];
        const sumCallback = (acc: int, curr: int) => acc + curr;
        const result = reduce(testArray, sumCallback);
        expect(result).assertEqual(15); // 1+2+3+4+5=15
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_REDUCE_INT_0200
     * @tc.name    testReduceINT_SingleElement
     * @tc.desc    Test reduce with single-element array
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testReduceINT_SingleElement', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testReduceINT_SingleElement";
      try {
        const testArray: FixedArray<int> = [100];
        const callback = (acc: int, curr: int) => acc * 2; // Shouldn't execute
        const result = reduce(testArray, callback);
        expect(result).assertEqual(100);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_REDUCE_INT_0300
     * @tc.name    testReduceINT_Product
     * @tc.desc    Test reduce with multiplication operation
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testReduceINT_Product', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testReduceINT_Product";
      try {
        const testArray: FixedArray<int> = [2, 3, 4, 5];
        const productCallback = (acc: int, curr: int) => acc * curr;
        const result = reduce(testArray, productCallback);
        expect(result).assertEqual(120);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_REDUCE_INT_0400
     * @tc.name    testReduceINT_BitwiseOR
     * @tc.desc    Test reduce with bitwise OR operation
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testReduceINT_BitwiseOR', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testReduceINT_BitwiseOR";
      try {
        const testArray: FixedArray<int> = [1, 2, 4, 8];
        const bitwiseOrCallback = (acc: int, curr: int) => acc | curr;
        const result = reduce(testArray, bitwiseOrCallback);
        expect(result).assertEqual(15); // 0b0001 | 0b0010 | 0b0100 | 0b1000 = 0b1111 (15)
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_REDUCE_INT_0500
     * @tc.name    testReduceINT_LargeNumbers
     * @tc.desc    Test reduce with large integer values
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testReduceINT_LargeNumbers', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testReduceINT_LargeNumbers";
      try {
        const testArray: FixedArray<int> = [1000000, 2000000, 3000000, 4000000];
        const sumCallback = (acc: int, curr: int) => acc + curr;
        const result = reduce(testArray, sumCallback);
        expect(result).assertEqual(10000000); // 1M + 2M + 3M + 4M = 10M
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_REDUCE_INT_0600
     * @tc.name    testReduceINT_NegativeProduct
     * @tc.desc    Test reduce with negative numbers
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testReduceINT_NegativeProduct', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testReduceINT_NegativeProduct";
      try {
        const testArray: FixedArray<int> = [-2, 3, -4, 5];
        const productCallback = (acc: int, curr: int) => acc * curr;
        const result = reduce(testArray, productCallback);
        expect(result).assertEqual(120); // (-2)*3*(-4)*5 = 120
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_REDUCE_LONG_0100
     * @tc.name    testReduceLONG_Sum
     * @tc.desc    Test basic reduce functionality with summation
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testReduceLONG_Sum', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testReduceLONG_Sum";
      try {
        const testArray: FixedArray<long> = [10000000000, 20000000000, 30000000000, 40000000000];
        const sumCallback = (acc: long, curr: long) => acc + curr;
        const result = reduce(testArray, sumCallback);
        expect(result).assertEqual(100000000000); // 10B + 20B + 30B + 40B = 100B
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_REDUCE_LONG_0200
     * @tc.name    testReduceLONG_SingleElement
     * @tc.desc    Test reduce with single-element array
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testReduceLONG_SingleElement', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testReduceLONG_SingleElement";
      try {
        const testArray: FixedArray<long> = [9223372036854775807]; // MAX_LONG
        const callback = (acc: long, curr: long) => acc * 2; // Shouldn't execute
        const result = reduce(testArray, callback);
        expect(result).assertEqual(9223372036854775807);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_REDUCE_LONG_0300
     * @tc.name    testReduceLONG_Product
     * @tc.desc    Test reduce with multiplication operation
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testReduceLONG_Product', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testReduceLONG_Product";
      try {
        const testArray: FixedArray<long> = [1000000000, 2000000000, 3];
        const productCallback = (acc: long, curr: long) => acc * curr;
        const result = reduce(testArray, productCallback);
        expect(result).assertEqual(6000000000000000000); // 1B * 2B * 3 = 6e18
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_REDUCE_LONG_0400
     * @tc.name    testReduceLONG_BitwiseOR
     * @tc.desc    Test reduce with bitwise OR operation
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testReduceLONG_BitwiseOR', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testReduceLONG_BitwiseOR";
      try {
        const testArray: FixedArray<long> = [1, 2, 4, 8];
        const bitwiseOrCallback = (acc: long, curr: long) => acc | curr;
        const result = reduce(testArray, bitwiseOrCallback);
        expect(result).assertEqual(15); // 0b0001 | 0b0010 | 0b0100 | 0b1000 = 0b1111 (15)
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_REDUCE_LONG_0500
     * @tc.name    testReduceLONG_NegativeSum
     * @tc.desc    Test reduce with negative numbers
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testReduceLONG_NegativeSum', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testReduceLONG_NegativeSum";
      try {
        const testArray: FixedArray<long> = [-10000000000, -20000000000, -30000000000];
        const sumCallback = (acc: long, curr: long) => acc + curr;
        const result = reduce(testArray, sumCallback);
        expect(result).assertEqual(-60000000000); // -10B + -20B + -30B = -60B
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_REDUCE_LONG_0600
     * @tc.name    testReduceLONG_MixedSigns
     * @tc.desc    Test reduce with mixed positive/negative numbers
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testReduceLONG_MixedSigns', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testReduceLONG_MixedSigns";
      try {
        const testArray: FixedArray<long> = [
          -10000000000,
          20000000000,
          -30000000000,
          40000000000
        ];
        const sumCallback = (acc: long, curr: long) => acc + curr;
        const result = reduce(testArray, sumCallback);
        expect(result).assertEqual(20000000000); // -10B + 20B -30B +40B = 20B
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_REDUCE_SHORT_0100
     * @tc.name    testReduceShort
     * @tc.desc    Testing basic functionality of reduce with sum operation.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testReduceShort', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testReduceShort";
      try {
        const testArray: number[] = [1, 2, 3, 4, 5];
        const result = testArray.reduce((acc: number, curr: number) => acc + curr);
        expect(result).assertEqual(15);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_REDUCE_SHORT_0200
     * @tc.name    testReduceShort01
     * @tc.desc    Testing reduce with multiplication operation.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testReduceShort01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testReduceShort01";
      try {
        const testArray: number[] = [1, 2, 6];
        const result = testArray.reduce((acc: number, curr: number) => acc * curr);
        expect(result).assertEqual(12);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });
  })
}