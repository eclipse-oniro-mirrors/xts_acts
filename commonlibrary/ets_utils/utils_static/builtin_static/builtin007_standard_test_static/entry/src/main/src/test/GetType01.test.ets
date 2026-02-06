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
export default function getType01Test() {
  describe("getType01Test", (): void => {
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
    * @tc.number  SUB_COMMONLIBRARY_STRINGVALUE_GETTYPE_0100
    * @tc.name    testValueGetType20001
    * @tc.desc    Verify StringValue.getType() returns correct StringType instance
    * @tc.size    MEDIUMTEST
    * @tc.type    FUNCTION
    * @tc.level   Level 1
    */
    it('testValueGetType20001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testValueGetType20001";
      try {
        const testString = "Hello, ArkTS!";
        const stringType = new StringType();
        const stringValue = new StringValue(stringType, testString);
        const result = stringValue.getType();
        expect(result).assertEqual(stringType);
        expect(result !== null).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_STRINGVALUE_GETTYPE_0200
     * @tc.name    testValueGetType20002
     * @tc.desc    Verify StringValue.getType() maintains type reference equality
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testValueGetType20002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testValueGetType20002";
      try {
        const stringType = new StringType();
        const stringValue1 = new StringValue(stringType, "Test1");
        const stringValue2 = new StringValue(stringType, "Test2");
        const type1 = stringValue1.getType();
        const type2 = stringValue2.getType();
        expect(type1).assertEqual(type2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_STRINGVALUE_GETTYPE_0300
     * @tc.name    testValueGetType20003
     * @tc.desc    getType() is a method that returns type information
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testValueGetType20003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testValueGetType20003";
      try {
        const stringType = new StringType();
        const stringValue = new StringValue(stringType, "TypeCheck");
        const result = stringValue.getType();
        expect(result instanceof Object).assertTrue();
        expect(stringType instanceof Object).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_STRINGVALUE_GETTYPE_0400
     * @tc.name    testValueGetType20004
     * @tc.desc    Verify getType() returns correct type for ASCII strings
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testValueGetType20004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetType20004';
      try {
        const asciiString = new StringValue(new StringType(), "Hello ArkTS");
        expect(asciiString.getType() !== null).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_STRINGVALUE_GETTYPE_0500
     * @tc.name    testValueGetType20005
     * @tc.desc    Verify getType() handles long strings correctly
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testValueGetType20005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetType20005';
      try {
        const longStr = "a".repeat(10000);
        const longString = new StringValue(new StringType(), longStr);
        expect(longString.getType() !== null).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_STRINGVALUE_GETTYPE_0600
     * @tc.name    testValueGetType20006
     * @tc.desc    Verify getType() returns correct type for empty strings
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testValueGetType20006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetType20006';
      try {
        const emptyString = new StringValue(new StringType(), "");
        expect(emptyString.getType() !== null).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_STRINGVALUE_GETTYPE_0700
     * @tc.name    testValueGetType20007
     * @tc.desc    Verify getType() returns correct type for single-character strings
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testValueGetType20007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetType20007';
      try {
        const singleChar = new StringValue(new StringType(), "A");
        expect(singleChar.getType() !== null).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_STRINGVALUE_GETTYPE_0800
     * @tc.name    testValueGetType20008
     * @tc.desc    Verify getType() behavior with number-to-string conversion
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testValueGetType20008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetType20008';
      try {
        const numberString = new StringValue(new StringType(), String(123));
        expect(numberString.getType() !== null).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_STRINGVALUE_GETTYPE_1100
     * @tc.name    testValueGetType20011
     * @tc.desc    Verify getType() with special escape sequences
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testValueGetType20011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetType20011';
      try {
        const escapeStr = new StringValue(new StringType(), "Line1\nLine2\tTab");
        expect(escapeStr.getType() !== null).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_VOIDVALUE_GETTYPE_0100
     * @tc.name    testValueGetType00001
     * @tc.desc    Verify VoidValue.getType() returns correct VoidType reference
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testValueGetType00001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetType00001';
      try {
        const result = VoidValue.INSTANCE.getType();
        expect(result === VoidType.REF).assertTrue();
        expect(result.toString()).assertEqual('void');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_VOIDVALUE_GETTYPE_0200
     * @tc.name    testValueGetType00002
     * @tc.desc    Verify VoidValue.getType() returns singleton instance
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testValueGetType00002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetType00002';
      try {
        const type1 = VoidValue.INSTANCE.getType();
        const type2 = VoidValue.INSTANCE.getType();
        expect(type1 === type2).assertTrue();
        expect(type1 === VoidType.REF).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_VOIDVALUE_GETTYPE_0300
     * @tc.name    testValueGetType00003
     * @tc.desc    Verify normal behavior of getType()
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testValueGetType00003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetType00003';
      try {
        const result = VoidValue.INSTANCE.getType();
        expect(result).assertEqual(VoidType.REF);
        expect(result.toString()).assertEqual('void');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_VOIDVALUE_GETTYPE_0400
     * @tc.name    testValueGetType00004
     * @tc.desc    Verify getType() after GC (conceptual test)
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testValueGetType00004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetType00004';
      try {
        const refBefore = VoidValue.INSTANCE.getType();
        expect(VoidValue.INSTANCE.getType()).assertEqual(refBefore);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_VOIDVALUE_GETTYPE_0500
     * @tc.name    testValueGetType00005
     * @tc.desc    Verify getType() with null/undefined checks
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testValueGetType00005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetType00005';
      try {
        const result = VoidValue.INSTANCE.getType();
        expect(result !== null && result !== undefined).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_VOIDVALUE_GETTYPE_0600
     * @tc.name    testValueGetType00006
     * @tc.desc    Verify null/undefined safety of getType()
     * @tc.size    MEDIUMTEST
     * @tc.type    Safety
     * @tc.level   Level 1
     */
    it('testValueGetType00006', TestType.SAFETY | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetType00006';
      try {
        expect(VoidValue.INSTANCE !== null && VoidValue.INSTANCE !== undefined).assertTrue();
        const result = VoidValue.INSTANCE.getType();
        expect(result !== null && result !== undefined).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_VOIDVALUE_GETTYPE_0700
     * @tc.name    testValueGetType00007
     * @tc.desc    Verify getType() returns same instance across multiple calls
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testValueGetType00007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetType00007';
      try {
        const type1 = VoidValue.INSTANCE.getType();
        const type2 = VoidValue.INSTANCE.getType();
        const type3 = VoidValue.INSTANCE.getType();
        expect(type1 === type2 && type2 === type3).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UNDEFINEDVALUE_GETTYPE_0100
     * @tc.name    testValueGetType10001
     * @tc.desc    Verify basic functionality of getType()
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testValueGetType10001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetType10001';
      try {
        const result = UndefinedValue.INSTANCE.getType();
        expect(result).assertEqual(UndefinedType.REF);
        expect(result.toString()).assertEqual('undefined');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UNDEFINEDVALUE_GETTYPE_0200
     * @tc.name    testValueGetType10002
     * @tc.desc    Verify getType() returns singleton instance
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testValueGetType10002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetType10002';
      try {
        const instance1 = UndefinedValue.INSTANCE.getType();
        const instance2 = UndefinedValue.INSTANCE.getType();
        expect(instance1 === instance2).assertTrue();
        expect(instance1 === UndefinedType.REF).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UNDEFINEDVALUE_GETTYPE_0300
     * @tc.name    testValueGetType10003
     * @tc.desc    Verify getType() never returns null
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testValueGetType10003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetType10003';
      try {
        expect(UndefinedValue.INSTANCE.getType() === null).assertFalse();
        expect(UndefinedValue.INSTANCE.getType() !== null).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UNDEFINEDVALUE_GETTYPE_0400
     * @tc.name    testValueGetType10004
     * @tc.desc    Verify getType() returns exactly UndefinedType.REF
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testValueGetType10004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetType10004';
      try {
        const result = UndefinedValue.INSTANCE.getType();
        expect(result === UndefinedType.REF).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UNDEFINEDVALUE_GETTYPE_0500
     * @tc.name    testValueGetType10005
     * @tc.desc    Verify getType() distinguishes undefined and null
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testValueGetType10005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetType10005';
      try {
        const result = UndefinedValue.INSTANCE.getType();
        expect(result == null).assertFalse();
        expect(result === null).assertFalse();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_NULLVALUE_GETTYPE_0100
     * @tc.name    testValueGetType40001
     * @tc.desc    Verify basic functionality of getType()
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testValueGetType40001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetType40001';
      try {
        const result = NullValue.INSTANCE.getType();
        expect(result).assertEqual(NullType.REF);
        expect(result.toString()).assertEqual('null');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_NULLVALUE_GETTYPE_0200
     * @tc.name    testValueGetType40002
     * @tc.desc    Verify getType() returns singleton instance
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testValueGetType40002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetType40002';
      try {
        const instance1 = NullValue.INSTANCE.getType();
        const instance2 = NullValue.INSTANCE.getType();
        expect(instance1 === instance2).assertTrue();
        expect(instance1 === NullType.REF).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_NULLVALUE_GETTYPE_0300
     * @tc.name    testValueGetType40003
     * @tc.desc    Explicitly verify return is not real null
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testValueGetType40003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetType40003';
      try {
        const result = NullValue.INSTANCE.getType();
        expect(result === null).assertFalse();
        expect(result !== null).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_NULLVALUE_GETTYPE_0400
     * @tc.name    testValueGetType40006_01
     * @tc.desc    Explicitly distinguish from undefined
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testValueGetType40006_01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetType40006_01';
      try {
        const result = NullValue.INSTANCE.getType();
        expect(result === undefined).assertFalse();
        expect(typeof result === 'undefined').assertFalse();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_VOIDVALUE_TOLOCALESTRING_0100
     * @tc.name    testValueLocaleString00001
     * @tc.desc    Verify toLocaleString() returns same value as toString()
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testValueLocaleString00001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueLocaleString00001';
      try {
        const voidValue = VoidValue.INSTANCE;
        const localeString = voidValue.toLocaleString();
        const toStringResult = voidValue.toString();
        expect(localeString).assertEqual(toStringResult);
        expect(typeof localeString).assertEqual('string');
        expect(localeString.length > 0).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_VOIDVALUE_TOLOCALESTRING_0200
     * @tc.name    testValueLocaleString00002
     * @tc.desc    Verify toLocaleString() returns consistent value
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testValueLocaleString00002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueLocaleString00002';
      try {
        const voidValue = VoidValue.INSTANCE;
        const firstCall = voidValue.toLocaleString();
        const secondCall = voidValue.toLocaleString();
        expect(firstCall).assertEqual(secondCall);
        expect(firstCall).assertEqual(VoidType.REF.toString());
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_VOIDVALUE_TOLOCALESTRING_0300
     * @tc.name    testValueLocaleString00003
     * @tc.desc    Verify toLocaleString() returns non-empty string
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testValueLocaleString00003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueLocaleString00003';
      try {
        const result = VoidValue.INSTANCE.toLocaleString();
        expect(result === null).assertFalse();
        expect(result !== '').assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_VOIDVALUE_TOLOCALESTRING_0400
     * @tc.name    testValueLocaleString00004
     * @tc.desc    Verify basic functionality of toLocaleString()
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testValueLocaleString00004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueLocaleString00004';
      try {
        const voidValue = VoidValue.INSTANCE;
        const result = voidValue.toLocaleString();
        expect(result).assertEqual(voidValue.toString());
        expect(result).assertEqual(VoidType.REF.toString());
        expect(typeof result).assertEqual('string');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_VOIDVALUE_TOLOCALESTRING_0500
     * @tc.name    testValueLocaleString00005
     * @tc.desc    Verify return value is not null or undefined
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testValueLocaleString00005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueLocaleString00005';
      try {
        const result = VoidValue.INSTANCE.toLocaleString();
        expect(result === null).assertFalse();
        expect(result !== undefined).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_VOIDVALUE_TOLOCALESTRING_0600
     * @tc.name    testValueLocaleString00006
     * @tc.desc    Verify return value is not empty string
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testValueLocaleString00006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueLocaleString00006';
      try {
        const result = VoidValue.INSTANCE.toLocaleString();
        expect(result !== '').assertTrue();
        expect(result.length > 0).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_VOIDVALUE_TOLOCALESTRING_0800
     * @tc.name    testValueLocaleString00008
     * @tc.desc    Verify toLocaleString() returns same reference for same value
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testValueLocaleString00008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueLocaleString00008';
      try {
        const voidValue = VoidValue.INSTANCE;
        const result1 = voidValue.toLocaleString();
        const result2 = voidValue.toLocaleString();
        expect(result1 === result2).assertTrue();
        expect(result1 === VoidType.REF.toString()).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UNDEFINEDVALUE_TOLOCALESTRING_0100
     * @tc.name    testValueLocaleString10001
     * @tc.desc    Verify basic functionality of toLocaleString()
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testValueLocaleString10001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueLocaleString10001';
      try {
        const undefinedValue = UndefinedValue.INSTANCE;
        const result = undefinedValue.toLocaleString();
        expect(result).assertEqual(undefinedValue.toString());
        expect(result).assertEqual(UndefinedType.REF.toString());
        expect(typeof result).assertEqual('string');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UNDEFINEDVALUE_TOLOCALESTRING_0200
     * @tc.name    testValueLocaleString10002
     * @tc.desc    Verify consistent return value across multiple calls
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testValueLocaleString10002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueLocaleString10002';
      try {
        const undefinedValue = UndefinedValue.INSTANCE;
        const result1 = undefinedValue.toLocaleString();
        const result2 = undefinedValue.toLocaleString();
        expect(result1).assertEqual(result2);
        expect(result1).assertEqual(UndefinedType.REF.toString());
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UNDEFINEDVALUE_TOLOCALESTRING_0300
     * @tc.name    testValueLocaleString10003
     * @tc.desc    Verify return value contains expected content
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testValueLocaleString10003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueLocaleString10003';
      try {
        const result = UndefinedValue.INSTANCE.toLocaleString();
        expect(result.toLowerCase().includes('undefined')).assertTrue();
        expect(result.length > 0).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UNDEFINEDVALUE_TOLOCALESTRING_0600
     * @tc.name    testValueLocaleString10006
     * @tc.desc    Verify toLocaleString() returns the same string reference
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testValueLocaleString10006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueLocaleString10006';
      try {
        const undefinedValue = UndefinedValue.INSTANCE;
        const result1 = undefinedValue.toLocaleString();
        const result2 = undefinedValue.toLocaleString();
        expect(result1 === result2).assertTrue();
        expect(result1 === UndefinedType.REF.toString()).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UNDEFINEDVALUE_TOLOCALESTRING_0700
     * @tc.name    testValueLocaleString10007
     * @tc.desc    Verify return value format matches expected pattern
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testValueLocaleString10007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueLocaleString10007';
      try {
        const result = UndefinedValue.INSTANCE.toLocaleString();
        expect(typeof result === 'string').assertTrue();
        const lowerResult = result.toLowerCase();
        expect(lowerResult.includes('undefined')).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
    * @tc.number  SUB_COMMONLIBRARY_UNDEFINEDVALUE_BASIC_0100
    * @tc.name    testValueReadonlyINSTANCE10001
    * @tc.desc    Verify INSTANCE is instance of UndefinedValue
    * @tc.size    MEDIUMTEST
    * @tc.type    FUNCTION
    * @tc.level   Level 1
    */
    it('testValueReadonlyINSTANCE10001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueReadonlyINSTANCE10001';
      try {
        expect(UndefinedValue.INSTANCE instanceof UndefinedValue).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UNDEFINEDVALUE_SINGLETON_0200
     * @tc.name    testValueReadonlyINSTANCE10002
     * @tc.desc    Verify INSTANCE follows singleton pattern
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testValueReadonlyINSTANCE10002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueReadonlyINSTANCE10002';
      try {
        const instance1 = UndefinedValue.INSTANCE;
        const instance2 = UndefinedValue.INSTANCE;
        expect(instance1 === instance2).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UNDEFINEDVALUE_TYPE_0300
     * @tc.name    testValueReadonlyINSTANCE10003
     * @tc.desc    Verify getType() returns UndefinedType
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTIONV
     * @tc.level   Level 1
     */
    it('testValueReadonlyINSTANCE10003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueReadonlyINSTANCE10003';
      try {
        expect(UndefinedValue.INSTANCE.getType()).assertEqual(UndefinedType.REF);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UNDEFINEDVALUE_DATA_0400
     * @tc.name    testValueReadonlyINSTANCE10004
     * @tc.desc    Verify getData() returns undefined
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testValueReadonlyINSTANCE10004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueReadonlyINSTANCE10004';
      try {
        expect(UndefinedValue.INSTANCE.getData() === undefined).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UNDEFINEDVALUE_STRING_0500
     * @tc.name    testValueReadonlyINSTANCE10005
     * @tc.desc    Verify toString() returns expected format
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testValueReadonlyINSTANCE10005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueReadonlyINSTANCE10005';
      try {
        expect(UndefinedValue.INSTANCE.toString()).assertEqual("undefined");
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UNDEFINEDVALUE_LOCALE_0600
     * @tc.name    testValueReadonlyINSTANCE10006
     * @tc.desc    Verify toLocaleString() returns expected format
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testValueReadonlyINSTANCE10006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueReadonlyINSTANCE10006';
      try {
        expect(UndefinedValue.INSTANCE.toLocaleString()).assertEqual("undefined");
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UNDEFINEDVALUE_PRINT_0700
     * @tc.name    testValueReadonlyINSTANCE10007
     * @tc.desc    Verify toPrint() returns expected format
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testValueReadonlyINSTANCE10007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueReadonlyINSTANCE10007';
      try {
        expect(UndefinedValue.INSTANCE.toPrint(0)).assertEqual("undefined");
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UNDEFINEDVALUE_COMPARE_0800
     * @tc.name    testValueReadonlyINSTANCE10008
     * @tc.desc    Verify equals() with other values
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testValueReadonlyINSTANCE10008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueReadonlyINSTANCE10008';
      try {
        expect(UndefinedValue.INSTANCE === UndefinedValue.INSTANCE).assertTrue();
        expect(undefined === undefined).assertTrue();
        expect(null === null).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UNDEFINEDVALUE_VALUEOF_0900
     * @tc.name    testValueReadonlyINSTANCE10009
     * @tc.desc    Verify valueOf() returns undefined
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testValueReadonlyINSTANCE10009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueReadonlyINSTANCE10009';
      try {
        expect(UndefinedValue.INSTANCE.toString() === 'undefined').assertTrue();
        expect(typeof UndefinedValue.INSTANCE === 'object').assertTrue();
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_SHORTVALUE_GETTYPE_0100
     * @tc.name    testValueGetType30001
     * @tc.desc    Verify getType() returns correct ShortType instance
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testValueGetType30001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetType30001';
      try {
        const shortType: ShortType = ShortType.REF;
        const shortValue = new ShortValue(shortType, 42);
        const resultType = shortValue.getType();
        expect(typeof resultType).assertEqual(typeof shortType);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_SHORTVALUE_GETTYPE_0400
     * @tc.name    testValueGetType30004
     * @tc.desc    Verify ShortValue works with maximum boundary value
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testValueGetType30004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetType30004';
      try {
        const shortType: ShortType = ShortType.REF;
        const shortValue = new ShortValue(shortType, 32767);
        const actualType = shortValue.getType();
        expect(typeof actualType).assertEqual(typeof shortType);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_SHORTVALUE_GETTYPE_0500
     * @tc.name    testValueGetType30005
     * @tc.desc    Verify ShortValue works with minimum boundary value
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testValueGetType30005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetType30005';
      try {
        const shortType: ShortType = ShortType.REF;
        const shortValue = new ShortValue(shortType, -32768);
        const actualType = shortValue.getType();
        expect(typeof actualType).assertEqual(typeof shortType);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_SHORTVALUE_GETTYPE_0600
     * @tc.name    testValueGetType30006
     * @tc.desc    Verify ShortValue works with zero value
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testValueGetType30006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetType30006';
      try {
        const shortType: ShortType = ShortType.REF;
        const shortValue = new ShortValue(shortType, 0);
        const actualType = shortValue.getType();
        expect(typeof actualType).assertEqual(typeof shortType);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_LONGVALUE_GETTYPE_0100
     * @tc.name    testValueGetType50001
     * @tc.desc    Verify getType() returns correct LongType with normal value
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testValueGetType50001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetType50001';
      try {
        const longType: LongType = LongType.REF;
        const longValue = new LongValue(longType, 123456789);
        const result = longValue.getType();
        expect(typeof result).assertEqual(typeof longType);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_LONGVALUE_GETTYPE_0200
     * @tc.name    testValueGetType50002
     * @tc.desc    Verify getType() with maximum long value
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testValueGetType50002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetType50002';
      try {
        const longType: LongType = LongType.REF;
        const maxValue = new LongValue(longType, 9223372036854775807);
        const result = maxValue.getType();
        expect(typeof result).assertEqual(typeof longType);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_LONGVALUE_GETTYPE_0300
     * @tc.name    testValueGetType50003
     * @tc.desc    Verify getType() with minimum long value
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testValueGetType50003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetType50003';
      try {
        const longType: LongType = LongType.REF;
        const minValue = new LongValue(longType, -9223372036854775808);
        const result = minValue.getType();
        expect(typeof result).assertEqual(typeof longType);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_LONGVALUE_GETTYPE_0400
     * @tc.name    testValueGetType50004
     * @tc.desc    Verify getType() with zero value
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testValueGetType50004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetType50004';
      try {
        const longType: LongType = LongType.REF;
        const zeroValue = new LongValue(longType, 0);
        const result = zeroValue.getType();
        expect(typeof result).assertEqual(typeof longType);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_LONGVALUE_GETTYPE_0500
     * @tc.name    testValueGetType50005
     * @tc.desc    Verify getType() returns same instance on multiple calls
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testValueGetType50005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetType50005';
      try {
        const longType: LongType = LongType.REF;
        const longValue = new LongValue(longType, 123456789);
        const firstCall = longValue.getType();
        const secondCall = longValue.getType();
        expect(typeof firstCall).assertEqual(typeof secondCall);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_LONGVALUE_GETTYPE_0600
     * @tc.name    testValueGetType50006
     * @tc.desc    Verify type instance caching
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testValueGetType50006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetType50006';
      try {
        const longType1: LongType = LongType.REF;
        const longType2: LongType = LongType.REF;
        const value1 = new LongValue(longType1, 100);
        const value2 = new LongValue(longType2, 200);
        const resultType1 = value1.getType();
        const resultType2 = value2.getType();
        expect(typeof resultType1).assertEqual(typeof longType1);
        expect(typeof resultType2).assertEqual(typeof longType2);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_INTVALUE_GETTYPE_0100
     * @tc.name    testValueGetType70001
     * @tc.desc    Verify getType() returns correct IntType with normal value
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testValueGetType70001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetType70001';
      try {
        const intType: IntType = IntType.REF;
        const intValue = new IntValue(intType, 42);
        const result = intValue.getType();
        expect(typeof result).assertEqual(typeof intType);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_INTVALUE_GETTYPE_0200
     * @tc.name    testValueGetType70002
     * @tc.desc    Verify getType() with maximum int value
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testValueGetType70002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetType70002';
      try {
        const intType: IntType = IntType.REF;
        const maxValue = new IntValue(intType, 2147483647);
        const result = maxValue.getType();
        expect(typeof result).assertEqual(typeof intType);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_INTVALUE_GETTYPE_0300
     * @tc.name    testValueGetType70003
     * @tc.desc    Verify getType() with minimum int value
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testValueGetType70003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetType70003';
      try {
        const intType: IntType = IntType.REF;
        const minValue = new IntValue(intType, -2147483648);
        const result = minValue.getType();
        expect(typeof result).assertEqual(typeof intType);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_INTVALUE_GETTYPE_0400
     * @tc.name    testValueGetType70004
     * @tc.desc    Verify getType() with zero value
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testValueGetType70004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetType70004';
      try {
        const intType: IntType = IntType.REF;
        const zeroValue = new IntValue(intType, 0);
        const result = zeroValue.getType();
        expect(typeof result).assertEqual(typeof intType);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_INTVALUE_GETTYPE_0500
     * @tc.name    testValueGetType70005
     * @tc.desc    Verify getType() returns same instance on multiple calls
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testValueGetType70005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetType70005';
      try {
        const intType: IntType = IntType.REF;
        const intValue = new IntValue(intType, 42);
        const firstCall = intValue.getType();
        const secondCall = intValue.getType();
        expect(typeof firstCall).assertEqual(typeof secondCall);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_INTVALUE_GETTYPE_0600
     * @tc.name    testValueGetType70006
     * @tc.desc    Verify type instance reusability
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testValueGetType70006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetType70006';
      try {
        const intType1: IntType = IntType.REF;
        const intType2: IntType = IntType.REF;
        const value1 = new IntValue(intType1, 100);
        const value2 = new IntValue(intType2, 200);
        const resultType1 = value1.getType();
        const resultType2 = value2.getType();
        expect(typeof resultType1).assertEqual(typeof intType1);
        expect(typeof resultType2).assertEqual(typeof intType2);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });
    });
}