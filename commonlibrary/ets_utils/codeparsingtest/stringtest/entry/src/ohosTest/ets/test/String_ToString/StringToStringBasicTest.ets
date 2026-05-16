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

import {
  testParameterIgnored,
  testFrozenStringObject,
  testSealedStringObject,
  testProxyStringObject,
  testProxyInterceptToString,
  testSymbolToPrimitive,
  testPropertyDescriptor,
  testTryDeleteToString,
  testPerformanceFrequentCalls,
  testChainCallOtherMethods,
  testMultipleToStringCalls,
  testNewStringNoParam,
  testStringNoParam,
  testNewStringUndefined,
  testNewStringNull,
  testHasOwnPropertyToString,
  testObjectPrototypeToString,
  testTypeErrorCatch,
  testSafeToString,
  testBuiltInObjectTypeErrors,
  testBinaryDataObjectTypeErrors,
  testInternationalStrings,
  testSpecialUnicodeChars,
  testToStringVsString,
  testToStringVsTemplateLiteral,
  testToStringVsJsonStringify,
  testSpecialNumericStrings,
  testScientificNotationStrings,
  testWhitespaceCharacters,
  testControlCharacters,
  testIdempotentCalls,
  testStringObjectInTemplate,
  testStringObjectWithPlusOperator,
  testStringObjectWithPlusEqual,
  testStringWithStringConversion,
  testStringObjectAsPropertyKey,
  testStringObjectArrayJoin
} from './StringToStringHelper_JS';

import {
  testThisValueCallString,
  testThisValueApplyString,
  testThisValueBindString,
  testThisValueCallStringObject,
  testThisValueApplyStringObject,
  testThisValueUndefinedTypeError,
  testThisValueNullTypeError,
  testThisValueNumberTypeError,
  testThisValueBooleanTypeError,
  testThisValueObjectTypeError,
  testThisValueArrayTypeError,
  testThisValueFunctionTypeError,
  testThisValueSymbolTypeError,
  testThisValueBigintTypeError
} from './StringToStringThisValueTest_JS';

function sleep(time: number): Promise<void> {
  return new Promise((re) => {
    setTimeout(() => {
      re();
    }, time);
  });
}

export default function StringToStringBasicTest() {
  describe('StringToStringBasicTest', () => {
    beforeAll(() => {
    })
    beforeEach( async () => {
      await sleep(20);
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.name   StringToString_Basic_001
     * @tc.number SUB_BUILTINS_STRING_TOSTRING_BASIC_0100
     * @tc.desc   Test toString() with ordinary string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToString_Basic_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str: string = 'hello world';
      const result: string = str.toString();
      expect(result).assertEqual('hello world');
    });

    /**
     * @tc.name   StringToString_Basic_002
     * @tc.number SUB_BUILTINS_STRING_TOSTRING_BASIC_0200
     * @tc.desc   Test toString() with empty string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToString_Basic_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str: string = '';
      const result: string = str.toString();
      expect(result).assertEqual('');
    });

    /**
     * @tc.name   StringToString_Basic_003
     * @tc.number SUB_BUILTINS_STRING_TOSTRING_BASIC_0300
     * @tc.desc   Test toString() with single character string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToString_Basic_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str: string = 'a';
      const result: string = str.toString();
      expect(result).assertEqual('a');
    });

    /**
     * @tc.name   StringToString_Basic_004
     * @tc.number SUB_BUILTINS_STRING_TOSTRING_BASIC_0400
     * @tc.desc   Test toString() with String object
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToString_Basic_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const strObj: String = new String('foo');
      const result: string = strObj.toString();
      expect(result).assertEqual('foo');
    });

    /**
     * @tc.name   StringToString_Basic_005
     * @tc.number SUB_BUILTINS_STRING_TOSTRING_BASIC_0500
     * @tc.desc   Test toString() with empty String object
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToString_Basic_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const strObj: String = new String('');
      const result: string = strObj.toString();
      expect(result).assertEqual('');
    });

    /**
     * @tc.name   StringToString_Basic_006
     * @tc.number SUB_BUILTINS_STRING_TOSTRING_BASIC_0600
     * @tc.desc   Test toString() with String object containing special characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToString_Basic_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const strObj: String = new String('foo\nbar\tbaz');
      const result: string = strObj.toString();
      expect(result).assertEqual('foo\nbar\tbaz');
    });


    /**
     * @tc.name   StringToString_AutoCall_001
     * @tc.number SUB_BUILTINS_STRING_TOSTRING_AUTOCALL_0100
     * @tc.desc   Test String object in template literal
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToString_AutoCall_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string = testStringObjectInTemplate();
      expect(result).assertEqual('Hello world');
    });

    /**
     * @tc.name   StringToString_AutoCall_002
     * @tc.number SUB_BUILTINS_STRING_TOSTRING_AUTOCALL_0200
     * @tc.desc   Test String object with + operator
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToString_AutoCall_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string = testStringObjectWithPlusOperator();
      expect(result).assertEqual('Hello world');
    });

    /**
     * @tc.name   StringToString_AutoCall_003
     * @tc.number SUB_BUILTINS_STRING_TOSTRING_AUTOCALL_0300
     * @tc.desc   Test String object with += operator
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToString_AutoCall_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string = testStringObjectWithPlusEqual();
      expect(result).assertEqual('Hello world');
    });

    /**
     * @tc.name   StringToString_AutoCall_004
     * @tc.number SUB_BUILTINS_STRING_TOSTRING_AUTOCALL_0400
     * @tc.desc   Test String() conversion
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToString_AutoCall_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string = testStringWithStringConversion();
      expect(result).assertEqual('test');
    });

    /**
     * @tc.name   StringToString_AutoCall_005
     * @tc.number SUB_BUILTINS_STRING_TOSTRING_AUTOCALL_0500
     * @tc.desc   Test String object as property key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToString_AutoCall_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string = testStringObjectAsPropertyKey();
      expect(result).assertEqual('value');
    });

    /**
     * @tc.name   StringToString_AutoCall_006
     * @tc.number SUB_BUILTINS_STRING_TOSTRING_AUTOCALL_0600
     * @tc.desc   Test String object array join
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToString_AutoCall_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string = testStringObjectArrayJoin();
      expect(result).assertEqual('a-b-c');
    });


    /**
     * @tc.name   StringToString_Boundary_001
     * @tc.number SUB_BUILTINS_STRING_TOSTRING_BOUNDARY_0100
     * @tc.desc   Test toString() ignores null parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToString_Boundary_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testParameterIgnored();
      expect(result.withNull).assertEqual('test');
    });

    /**
     * @tc.name   StringToString_Boundary_002
     * @tc.number SUB_BUILTINS_STRING_TOSTRING_BOUNDARY_0200
     * @tc.desc   Test toString() ignores undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToString_Boundary_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testParameterIgnored();
      expect(result.withUndefined).assertEqual('test');
    });

    /**
     * @tc.name   StringToString_Boundary_003
     * @tc.number SUB_BUILTINS_STRING_TOSTRING_BOUNDARY_0300
     * @tc.desc   Test toString() ignores multiple parameters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToString_Boundary_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testParameterIgnored();
      expect(result.withMultiple).assertEqual('test');
    });

    /**
     * @tc.name   StringToString_Boundary_004
     * @tc.number SUB_BUILTINS_STRING_TOSTRING_BOUNDARY_0400
     * @tc.desc   Test toString() on frozen String object
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToString_Boundary_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testFrozenStringObject();
      expect(result).assertEqual('test');
    });

    /**
     * @tc.name   StringToString_Boundary_005
     * @tc.number SUB_BUILTINS_STRING_TOSTRING_BOUNDARY_0500
     * @tc.desc   Test toString() on sealed String object
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToString_Boundary_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testSealedStringObject();
      expect(result).assertEqual('test');
    });

    /**
     * @tc.name   StringToString_Boundary_006
     * @tc.number SUB_BUILTINS_STRING_TOSTRING_BOUNDARY_0600
     * @tc.desc   Test toString() on proxied String object
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToString_Boundary_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testProxyStringObject();
      expect(result).assertEqual('test');
    });

    /**
     * @tc.name   StringToString_Boundary_007
     * @tc.number SUB_BUILTINS_STRING_TOSTRING_BOUNDARY_0700
     * @tc.desc   Test toString() on proxied String object with intercepted toString
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToString_Boundary_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testProxyInterceptToString();
      expect(result).assertEqual('intercepted');
    });

    /**
     * @tc.name   StringToString_Boundary_008
     * @tc.number SUB_BUILTINS_STRING_TOSTRING_BOUNDARY_0800
     * @tc.desc   Test toString() with Symbol.toPrimitive
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToString_Boundary_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testSymbolToPrimitive();
      expect(result.withSymbolToPrimitive).assertEqual('custom string');
      expect(result.toString).assertEqual('test');
    });

    /**
     * @tc.name   StringToString_Boundary_009
     * @tc.number SUB_BUILTINS_STRING_TOSTRING_BOUNDARY_0900
     * @tc.desc   Test toString() property descriptor
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToString_Boundary_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testPropertyDescriptor();
      expect(result.writable).assertTrue();
      expect(result.enumerable).assertFalse();
      expect(result.configurable).assertTrue();
    });

    /**
     * @tc.name   StringToString_Boundary_010
     * @tc.number SUB_BUILTINS_STRING_TOSTRING_BOUNDARY_1000
     * @tc.desc   Test delete toString() from prototype
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToString_Boundary_010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testTryDeleteToString();
      expect(result.deleted).assertTrue();
      expect(result.threwError).assertFalse();
    });

    /**
     * @tc.name   StringToString_Boundary_011
     * @tc.number SUB_BUILTINS_STRING_TOSTRING_BOUNDARY_1100
     * @tc.desc   Test frequent toString() calls
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToString_Boundary_011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testPerformanceFrequentCalls();
      expect(result).assertTrue();
    });


    /**
     * @tc.name   StringToString_ChainCall_001
     * @tc.number SUB_BUILTINS_STRING_TOSTRING_CHAINCALL_0100
     * @tc.desc   Test toString() chained with trim()
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToString_ChainCall_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testChainCallOtherMethods();
      expect(result.trim).assertEqual('hello');
    });

    /**
     * @tc.name   StringToString_ChainCall_002
     * @tc.number SUB_BUILTINS_STRING_TOSTRING_CHAINCALL_0200
     * @tc.desc   Test toString() chained with toUpperCase()
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToString_ChainCall_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testChainCallOtherMethods();
      expect(result.toUpperCase).assertEqual('  HELLO  ');
    });

    /**
     * @tc.name   StringToString_ChainCall_003
     * @tc.number SUB_BUILTINS_STRING_TOSTRING_CHAINCALL_0300
     * @tc.desc   Test toString() after other method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToString_ChainCall_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testChainCallOtherMethods();
      expect(result.fromOtherMethod).assertEqual('HELLO');
    });

    /**
     * @tc.name   StringToString_ChainCall_004
     * @tc.number SUB_BUILTINS_STRING_TOSTRING_CHAINCALL_0400
     * @tc.desc   Test multiple toString() calls on primitive
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToString_ChainCall_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testMultipleToStringCalls();
      expect(result.primitive).assertEqual('test');
    });

    /**
     * @tc.name   StringToString_ChainCall_005
     * @tc.number SUB_BUILTINS_STRING_TOSTRING_CHAINCALL_0500
     * @tc.desc   Test multiple toString() calls on object
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToString_ChainCall_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testMultipleToStringCalls();
      expect(result.object).assertEqual('test');
    });


    /**
     * @tc.name   StringToString_Constructor_001
     * @tc.number SUB_BUILTINS_STRING_TOSTRING_CONSTRUCTOR_0100
     * @tc.desc   Test toString() with new String() no parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToString_Constructor_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testNewStringNoParam();
      expect(result.toString).assertEqual('');
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.name   StringToString_Constructor_002
     * @tc.number SUB_BUILTINS_STRING_TOSTRING_CONSTRUCTOR_0200
     * @tc.desc   Test toString() with String() no parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToString_Constructor_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testStringNoParam();
      expect(result.value).assertEqual('');
      expect(result.type).assertEqual('string');
      expect(result.toString).assertEqual('');
    });

    /**
     * @tc.name   StringToString_Constructor_003
     * @tc.number SUB_BUILTINS_STRING_TOSTRING_CONSTRUCTOR_0300
     * @tc.desc   Test toString() with new String(undefined)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToString_Constructor_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testNewStringUndefined();
      expect(result.toString).assertEqual('undefined');
      expect(result.valueOf).assertEqual('undefined');
    });

    /**
     * @tc.name   StringToString_Constructor_004
     * @tc.number SUB_BUILTINS_STRING_TOSTRING_CONSTRUCTOR_0400
     * @tc.desc   Test toString() with new String(null)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToString_Constructor_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testNewStringNull();
      expect(result.toString).assertEqual('null');
      expect(result.valueOf).assertEqual('null');
    });


    /**
     * @tc.name   StringToString_Error_001
     * @tc.number SUB_BUILTINS_STRING_TOSTRING_ERROR_0100
     * @tc.desc   Test catching TypeError from invalid this
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToString_Error_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testTypeErrorCatch();
      expect(result.caught).assertTrue();
      expect(result.name).assertEqual('TypeError');
    });

    /**
     * @tc.name   StringToString_Error_002
     * @tc.number SUB_BUILTINS_STRING_TOSTRING_ERROR_0200
     * @tc.desc   Test safeToString with string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToString_Error_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testSafeToString();
      expect(result.withString).assertEqual('test');
      expect(result.withNumber).assertEqual('123');
    });

    /**
     * @tc.name   StringToString_Error_003
     * @tc.number SUB_BUILTINS_STRING_TOSTRING_ERROR_0300
     * @tc.desc   Test Map throws TypeError
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToString_Error_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testBuiltInObjectTypeErrors();
      expect(result.allThrewTypeError).assertTrue();
      expect(result.results[0]).assertTrue();
    });

    /**
     * @tc.name   StringToString_Error_004
     * @tc.number SUB_BUILTINS_STRING_TOSTRING_ERROR_0400
     * @tc.desc   Test Set throws TypeError
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToString_Error_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testBuiltInObjectTypeErrors();
      expect(result.results[1]).assertTrue();
    });

    /**
     * @tc.name   StringToString_Error_005
     * @tc.number SUB_BUILTINS_STRING_TOSTRING_ERROR_0500
     * @tc.desc   Test WeakMap throws TypeError
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToString_Error_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testBuiltInObjectTypeErrors();
      expect(result.results[2]).assertTrue();
    });

    /**
     * @tc.name   StringToString_Error_006
     * @tc.number SUB_BUILTINS_STRING_TOSTRING_ERROR_0600
     * @tc.desc   Test WeakSet throws TypeError
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToString_Error_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testBuiltInObjectTypeErrors();
      expect(result.results[3]).assertTrue();
    });

    /**
     * @tc.name   StringToString_Error_007
     * @tc.number SUB_BUILTINS_STRING_TOSTRING_ERROR_0700
     * @tc.desc   Test Date throws TypeError
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToString_Error_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testBuiltInObjectTypeErrors();
      expect(result.results[4]).assertTrue();
    });

    /**
     * @tc.name   StringToString_Error_008
     * @tc.number SUB_BUILTINS_STRING_TOSTRING_ERROR_0800
     * @tc.desc   Test RegExp throws TypeError
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToString_Error_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testBuiltInObjectTypeErrors();
      expect(result.results[5]).assertTrue();
    });

    /**
     * @tc.name   StringToString_Error_009
     * @tc.number SUB_BUILTINS_STRING_TOSTRING_ERROR_0900
     * @tc.desc   Test Error throws TypeError
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToString_Error_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testBuiltInObjectTypeErrors();
      expect(result.results[6]).assertTrue();
    });

    /**
     * @tc.name   StringToString_Error_010
     * @tc.number SUB_BUILTINS_STRING_TOSTRING_ERROR_1000
     * @tc.desc   Test TypeError throws TypeError
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToString_Error_010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testBuiltInObjectTypeErrors();
      expect(result.results[7]).assertTrue();
    });

    /**
     * @tc.name   StringToString_Error_011
     * @tc.number SUB_BUILTINS_STRING_TOSTRING_ERROR_1100
     * @tc.desc   Test Promise throws TypeError
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToString_Error_011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testBuiltInObjectTypeErrors();
      expect(result.results[8]).assertTrue();
    });

    /**
     * @tc.name   StringToString_Error_012
     * @tc.number SUB_BUILTINS_STRING_TOSTRING_ERROR_1200
     * @tc.desc   Test ArrayBuffer throws TypeError
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToString_Error_012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testBinaryDataObjectTypeErrors();
      expect(result.allThrewTypeError).assertTrue();
      expect(result.results[0]).assertTrue();
    });

    /**
     * @tc.name   StringToString_Error_013
     * @tc.number SUB_BUILTINS_STRING_TOSTRING_ERROR_1300
     * @tc.desc   Test DataView throws TypeError
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToString_Error_013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testBinaryDataObjectTypeErrors();
      expect(result.results[1]).assertTrue();
    });

    /**
     * @tc.name   StringToString_Error_014
     * @tc.number SUB_BUILTINS_STRING_TOSTRING_ERROR_1400
     * @tc.desc   Test TypedArray throws TypeError
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToString_Error_014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testBinaryDataObjectTypeErrors();
      expect(result.allThrewTypeError).assertTrue();
    });


    /**
     * @tc.name   StringToString_Inheritance_001
     * @tc.number SUB_BUILTINS_STRING_TOSTRING_INHERITANCE_0100
     * @tc.desc   Test toString() hasOwnProperty on primitive
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToString_Inheritance_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testHasOwnPropertyToString();
      expect(result.primitiveHasOwn).assertFalse();
      expect(result.prototypeHasOwn).assertTrue();
      expect(result.primitiveProtoMatch).assertTrue();
    });

    /**
     * @tc.name   StringToString_Inheritance_002
     * @tc.number SUB_BUILTINS_STRING_TOSTRING_INHERITANCE_0200
     * @tc.desc   Test toString() hasOwnProperty on String object
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToString_Inheritance_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testHasOwnPropertyToString();
      expect(result.objectHasOwn).assertFalse();
      expect(result.objectProtoMatch).assertTrue();
    });

    /**
     * @tc.name   StringToString_Inheritance_003
     * @tc.number SUB_BUILTINS_STRING_TOSTRING_INHERITANCE_0300
     * @tc.desc   Test String.prototype.toString vs Object.prototype.toString
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToString_Inheritance_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testObjectPrototypeToString();
      expect(result.stringProto).assertEqual('test');
      expect(result.objectProto).assertEqual('[object String]');
    });


    /**
     * @tc.name   StringToString_International_001
     * @tc.number SUB_BUILTINS_STRING_TOSTRING_INTERNATIONAL_0100
     * @tc.desc   Test toString() with Arabic
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToString_International_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testInternationalStrings();
      expect(result.arabic).assertEqual('مرحبا بالعالم');
      expect(result.arabicEqual).assertTrue();
    });

    /**
     * @tc.name   StringToString_International_002
     * @tc.number SUB_BUILTINS_STRING_TOSTRING_INTERNATIONAL_0200
     * @tc.desc   Test toString() with Hebrew
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToString_International_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testInternationalStrings();
      expect(result.hebrew).assertEqual('שלום עולם');
      expect(result.hebrewEqual).assertTrue();
    });

    /**
     * @tc.name   StringToString_International_003
     * @tc.number SUB_BUILTINS_STRING_TOSTRING_INTERNATIONAL_0300
     * @tc.desc   Test toString() with Thai
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToString_International_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testInternationalStrings();
      expect(result.thai).assertEqual('สวัสดีโลก');
      expect(result.thaiEqual).assertTrue();
    });

    /**
     * @tc.name   StringToString_International_004
     * @tc.number SUB_BUILTINS_STRING_TOSTRING_INTERNATIONAL_0400
     * @tc.desc   Test toString() with Hindi
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToString_International_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testInternationalStrings();
      expect(result.hindi).assertEqual('नमस्ते दुनिया');
      expect(result.hindiEqual).assertTrue();
    });

    /**
     * @tc.name   StringToString_International_005
     * @tc.number SUB_BUILTINS_STRING_TOSTRING_INTERNATIONAL_0500
     * @tc.desc   Test toString() with Japanese
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToString_International_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testInternationalStrings();
      expect(result.japanese).assertEqual('こんにちは世界ハローワールド');
      expect(result.japaneseEqual).assertTrue();
    });

    /**
     * @tc.name   StringToString_International_006
     * @tc.number SUB_BUILTINS_STRING_TOSTRING_INTERNATIONAL_0600
     * @tc.desc   Test toString() with Korean
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToString_International_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testInternationalStrings();
      expect(result.korean).assertEqual('안녕하세요 세계');
      expect(result.koreanEqual).assertTrue();
    });

    /**
     * @tc.name   StringToString_International_007
     * @tc.number SUB_BUILTINS_STRING_TOSTRING_INTERNATIONAL_0700
     * @tc.desc   Test toString() with Greek
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToString_International_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testInternationalStrings();
      expect(result.greek).assertEqual('Γειά σου Κόσμε');
      expect(result.greekEqual).assertTrue();
    });

    /**
     * @tc.name   StringToString_International_008
     * @tc.number SUB_BUILTINS_STRING_TOSTRING_INTERNATIONAL_0800
     * @tc.desc   Test toString() with Russian
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToString_International_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testInternationalStrings();
      expect(result.russian).assertEqual('Привет мир');
      expect(result.russianEqual).assertTrue();
    });

    /**
     * @tc.name   StringToString_International_009
     * @tc.number SUB_BUILTINS_STRING_TOSTRING_INTERNATIONAL_0900
     * @tc.desc   Test toString() with ZWJ sequence
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToString_International_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testSpecialUnicodeChars();
      expect(result.zwj).assertEqual('👨‍👩‍👧');
      expect(result.zwjEqual).assertTrue();
    });

    /**
     * @tc.name   StringToString_International_010
     * @tc.number SUB_BUILTINS_STRING_TOSTRING_INTERNATIONAL_1000
     * @tc.desc   Test toString() with variant selector
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToString_International_010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testSpecialUnicodeChars();
      expect(result.variant).assertEqual('♠️');
      expect(result.variantEqual).assertTrue();
    });

    /**
     * @tc.name   StringToString_International_011
     * @tc.number SUB_BUILTINS_STRING_TOSTRING_INTERNATIONAL_1100
     * @tc.desc   Test toString() with Unicode control characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToString_International_011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testSpecialUnicodeChars();
      expect(result.control).assertEqual('test\u200E\u200Ftest');
      expect(result.controlEqual).assertTrue();
    });

    /**
     * @tc.name   StringToString_International_012
     * @tc.number SUB_BUILTINS_STRING_TOSTRING_INTERNATIONAL_1200
     * @tc.desc   Test toString() with private use area
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToString_International_012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testSpecialUnicodeChars();
      expect(result.privateUse).assertEqual('\uE000\uE001\uF8FF');
      expect(result.privateUseEqual).assertTrue();
    });

    /**
     * @tc.name   StringToString_International_013
     * @tc.number SUB_BUILTINS_STRING_TOSTRING_INTERNATIONAL_1300
     * @tc.desc   Test toString() with isolated surrogate
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToString_International_013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testSpecialUnicodeChars();
      expect(result.isolated).assertEqual('\uD800');
      expect(result.isolatedEqual).assertTrue();
    });


    /**
     * @tc.name   StringToString_MethodCompare_001
     * @tc.number SUB_BUILTINS_STRING_TOSTRING_METHODCOMPARE_0100
     * @tc.desc   Test toString() vs String() on primitive
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToString_MethodCompare_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testToStringVsString();
      expect(result.primitiveString).assertTrue();
      expect(result.stringObject).assertTrue();
      expect(result.primitiveResult).assertEqual('test');
      expect(result.objectResult).assertEqual('test');
    });

    /**
     * @tc.name   StringToString_MethodCompare_002
     * @tc.number SUB_BUILTINS_STRING_TOSTRING_METHODCOMPARE_0200
     * @tc.desc   Test toString() vs template literal
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToString_MethodCompare_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testToStringVsTemplateLiteral();
      expect(result.primitiveMatch).assertTrue();
      expect(result.objectMatch).assertTrue();
    });

    /**
     * @tc.name   StringToString_MethodCompare_003
     * @tc.number SUB_BUILTINS_STRING_TOSTRING_METHODCOMPARE_0300
     * @tc.desc   Test toString() vs JSON.stringify
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToString_MethodCompare_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testToStringVsJsonStringify();
      expect(result.primitiveToString).assertEqual('test');
      expect(result.primitiveJson).assertEqual('"test"');
      expect(result.objectToString).assertEqual('test');
      expect(result.objectJson).assertEqual('"test"');
    });


    /**
     * @tc.name   StringToString_ReturnValue_001
     * @tc.number SUB_BUILTINS_STRING_TOSTRING_RETURNVALUE_0100
     * @tc.desc   Test toString() returns value equal to original string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToString_ReturnValue_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str: string = 'test';
      const result: string = str.toString();
      expect(result === str).assertTrue();
    });

    /**
     * @tc.name   StringToString_ReturnValue_002
     * @tc.number SUB_BUILTINS_STRING_TOSTRING_RETURNVALUE_0200
     * @tc.desc   Test toString() returns value equal to String object's wrapped string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToString_ReturnValue_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const strObj: String = new String('test');
      const result: string = strObj.toString();
      expect(result === 'test').assertTrue();
    });

    /**
     * @tc.name   StringToString_ReturnValue_003
     * @tc.number SUB_BUILTINS_STRING_TOSTRING_RETURNVALUE_0300
     * @tc.desc   Test toString() and valueOf() return same for primitive string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToString_ReturnValue_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str: string = 'test';
      const toStringResult: string = str.toString();
      const valueOfResult: string = str.valueOf();
      expect(toStringResult === valueOfResult).assertTrue();
    });

    /**
     * @tc.name   StringToString_ReturnValue_004
     * @tc.number SUB_BUILTINS_STRING_TOSTRING_RETURNVALUE_0400
     * @tc.desc   Test toString() and valueOf() return same for String object
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToString_ReturnValue_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const strObj: String = new String('test');
      const toStringResult: string = strObj.toString();
      const valueOfResult: string = strObj.valueOf();
      expect(toStringResult === valueOfResult).assertTrue();
    });

    /**
     * @tc.name   StringToString_ReturnValue_005
     * @tc.number SUB_BUILTINS_STRING_TOSTRING_RETURNVALUE_0500
     * @tc.desc   Test toString() returns string type
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToString_ReturnValue_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str: string = 'test';
      const result: string = str.toString();
      expect(typeof result).assertEqual('string');
    });

    /**
     * @tc.name   StringToString_ReturnValue_006
     * @tc.number SUB_BUILTINS_STRING_TOSTRING_RETURNVALUE_0600
     * @tc.desc   Test toString() does not return object type
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToString_ReturnValue_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const strObj: String = new String('test');
      const result: string = strObj.toString();
      expect(typeof result).assertEqual('string');
      expect(typeof result !== 'object').assertTrue();
    });


    /**
     * @tc.name   StringToString_SpecialString_001
     * @tc.number SUB_BUILTINS_STRING_TOSTRING_SPECIALSTRING_0100
     * @tc.desc   Test toString() with empty string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToString_SpecialString_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str: string = '';
      const result: string = str.toString();
      expect(result).assertEqual('');
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.name   StringToString_SpecialString_002
     * @tc.number SUB_BUILTINS_STRING_TOSTRING_SPECIALSTRING_0200
     * @tc.desc   Test toString() with empty String object
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToString_SpecialString_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const strObj: String = new String('');
      const result: string = strObj.toString();
      expect(result).assertEqual('');
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.name   StringToString_SpecialString_003
     * @tc.number SUB_BUILTINS_STRING_TOSTRING_SPECIALSTRING_0300
     * @tc.desc   Test toString() with BMP characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToString_SpecialString_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str: string = '中文';
      const result: string = str.toString();
      expect(result).assertEqual('中文');
    });

    /**
     * @tc.name   StringToString_SpecialString_004
     * @tc.number SUB_BUILTINS_STRING_TOSTRING_SPECIALSTRING_0400
     * @tc.desc   Test toString() with emoji (supplementary plane)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToString_SpecialString_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str: string = '😀🎉';
      const result: string = str.toString();
      expect(result).assertEqual('😀🎉');
      expect(result.length).assertEqual(4);
    });

    /**
     * @tc.name   StringToString_SpecialString_005
     * @tc.number SUB_BUILTINS_STRING_TOSTRING_SPECIALSTRING_0500
     * @tc.desc   Test toString() with mixed characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToString_SpecialString_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str: string = 'Hello世界😀';
      const result: string = str.toString();
      expect(result).assertEqual('Hello世界😀');
    });

    /**
     * @tc.name   StringToString_SpecialString_006
     * @tc.number SUB_BUILTINS_STRING_TOSTRING_SPECIALSTRING_0600
     * @tc.desc   Test toString() with newline character
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToString_SpecialString_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str: string = 'line1\nline2';
      const result: string = str.toString();
      expect(result).assertEqual('line1\nline2');
    });

    /**
     * @tc.name   StringToString_SpecialString_007
     * @tc.number SUB_BUILTINS_STRING_TOSTRING_SPECIALSTRING_0700
     * @tc.desc   Test toString() with tab character
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToString_SpecialString_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str: string = 'col1\tcol2';
      const result: string = str.toString();
      expect(result).assertEqual('col1\tcol2');
    });

    /**
     * @tc.name   StringToString_SpecialString_008
     * @tc.number SUB_BUILTINS_STRING_TOSTRING_SPECIALSTRING_0800
     * @tc.desc   Test toString() with carriage return and newline
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToString_SpecialString_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str: string = 'line1\r\nline2';
      const result: string = str.toString();
      expect(result).assertEqual('line1\r\nline2');
    });

    /**
     * @tc.name   StringToString_SpecialString_009
     * @tc.number SUB_BUILTINS_STRING_TOSTRING_SPECIALSTRING_0900
     * @tc.desc   Test toString() with backslash
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToString_SpecialString_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str: string = 'path\\to\\file';
      const result: string = str.toString();
      expect(result).assertEqual('path\\to\\file');
    });

    /**
     * @tc.name   StringToString_SpecialString_010
     * @tc.number SUB_BUILTINS_STRING_TOSTRING_SPECIALSTRING_1000
     * @tc.desc   Test toString() with quotes
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToString_SpecialString_010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str1: string = 'He said "hello"';
      const str2: string = "It's a test";
      expect(str1.toString()).assertEqual('He said "hello"');
      expect(str2.toString()).assertEqual("It's a test");
    });

    /**
     * @tc.name   StringToString_SpecialString_011
     * @tc.number SUB_BUILTINS_STRING_TOSTRING_SPECIALSTRING_1100
     * @tc.desc   Test toString() with zero-width characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToString_SpecialString_011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str: string = 'test\u200B\u200C\u200D';
      const result: string = str.toString();
      expect(result).assertEqual('test\u200B\u200C\u200D');
      expect(result.length).assertEqual(7);
    });

    /**
     * @tc.name   StringToString_SpecialString_012
     * @tc.number SUB_BUILTINS_STRING_TOSTRING_SPECIALSTRING_1200
     * @tc.desc   Test toString() with combining characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToString_SpecialString_012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str: string = 'e\u0301';
      const result: string = str.toString();
      expect(result).assertEqual('e\u0301');
    });

    /**
     * @tc.name   StringToString_SpecialString_013
     * @tc.number SUB_BUILTINS_STRING_TOSTRING_SPECIALSTRING_1300
     * @tc.desc   Test toString() with BOM character
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToString_SpecialString_013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str: string = '\uFEFFtest';
      const result: string = str.toString();
      expect(result).assertEqual('\uFEFFtest');
    });

    /**
     * @tc.name   StringToString_SpecialString_014
     * @tc.number SUB_BUILTINS_STRING_TOSTRING_SPECIALSTRING_1400
     * @tc.desc   Test toString() with very long string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToString_SpecialString_014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str: string = 'a'.repeat(10000);
      const result: string = str.toString();
      expect(result.length).assertEqual(10000);
      expect(result === str).assertTrue();
    });

    /**
     * @tc.name   StringToString_SpecialString_015
     * @tc.number SUB_BUILTINS_STRING_TOSTRING_SPECIALSTRING_1500
     * @tc.desc   Test toString() with very long String object
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToString_SpecialString_015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const strObj: String = new String('b'.repeat(50000));
      const result: string = strObj.toString();
      expect(result.length).assertEqual(50000);
    });

    /**
     * @tc.name   StringToString_SpecialString_016
     * @tc.number SUB_BUILTINS_STRING_TOSTRING_SPECIALSTRING_1600
     * @tc.desc   Test toString() with spaces only
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToString_SpecialString_016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str: string = '   ';
      const result: string = str.toString();
      expect(result).assertEqual('   ');
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.name   StringToString_SpecialString_017
     * @tc.number SUB_BUILTINS_STRING_TOSTRING_SPECIALSTRING_1700
     * @tc.desc   Test toString() with numbers only
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToString_SpecialString_017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str: string = '12345';
      const result: string = str.toString();
      expect(result).assertEqual('12345');
      expect(typeof result).assertEqual('string');
    });

    /**
     * @tc.name   StringToString_SpecialString_018
     * @tc.number SUB_BUILTINS_STRING_TOSTRING_SPECIALSTRING_1800
     * @tc.desc   Test toString() with HTML entities
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToString_SpecialString_018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str: string = '&lt;div&gt;';
      const result: string = str.toString();
      expect(result).assertEqual('&lt;div&gt;');
    });


    /**
     * @tc.name   StringToString_SpecialValue_001
     * @tc.number SUB_BUILTINS_STRING_TOSTRING_SPECIALVALUE_0100
     * @tc.desc   Test toString() with "NaN" string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToString_SpecialValue_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testSpecialNumericStrings();
      expect(result.nan).assertEqual('NaN');
      expect(result.nanEqual).assertTrue();
    });

    /**
     * @tc.name   StringToString_SpecialValue_002
     * @tc.number SUB_BUILTINS_STRING_TOSTRING_SPECIALVALUE_0200
     * @tc.desc   Test toString() with "Infinity" string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToString_SpecialValue_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testSpecialNumericStrings();
      expect(result.infinity).assertEqual('Infinity');
    });

    /**
     * @tc.name   StringToString_SpecialValue_003
     * @tc.number SUB_BUILTINS_STRING_TOSTRING_SPECIALVALUE_0300
     * @tc.desc   Test toString() with "-Infinity" string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToString_SpecialValue_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testSpecialNumericStrings();
      expect(result.negInfinity).assertEqual('-Infinity');
    });

    /**
     * @tc.name   StringToString_SpecialValue_004
     * @tc.number SUB_BUILTINS_STRING_TOSTRING_SPECIALVALUE_0400
     * @tc.desc   Test toString() with "-0" string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToString_SpecialValue_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testSpecialNumericStrings();
      expect(result.negZero).assertEqual('-0');
    });

    /**
     * @tc.name   StringToString_SpecialValue_005
     * @tc.number SUB_BUILTINS_STRING_TOSTRING_SPECIALVALUE_0500
     * @tc.desc   Test toString() with "null" string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToString_SpecialValue_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testSpecialNumericStrings();
      expect(result.nullString).assertEqual('null');
      expect(result.nullNotEqual).assertFalse();
    });

    /**
     * @tc.name   StringToString_SpecialValue_006
     * @tc.number SUB_BUILTINS_STRING_TOSTRING_SPECIALVALUE_0600
     * @tc.desc   Test toString() with "undefined" string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToString_SpecialValue_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testSpecialNumericStrings();
      expect(result.undefinedString).assertEqual('undefined');
      expect(result.undefinedNotEqual).assertFalse();
    });

    /**
     * @tc.name   StringToString_SpecialValue_007
     * @tc.number SUB_BUILTINS_STRING_TOSTRING_SPECIALVALUE_0700
     * @tc.desc   Test toString() with "true" string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToString_SpecialValue_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testSpecialNumericStrings();
      expect(result.trueString).assertEqual('true');
    });

    /**
     * @tc.name   StringToString_SpecialValue_008
     * @tc.number SUB_BUILTINS_STRING_TOSTRING_SPECIALVALUE_0800
     * @tc.desc   Test toString() with "false" string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToString_SpecialValue_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testSpecialNumericStrings();
      expect(result.falseString).assertEqual('false');
    });

    /**
     * @tc.name   StringToString_SpecialValue_009
     * @tc.number SUB_BUILTINS_STRING_TOSTRING_SPECIALVALUE_0900
     * @tc.desc   Test toString() with scientific notation
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToString_SpecialValue_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testScientificNotationStrings();
      expect(result.positiveExponent).assertEqual('1e10');
      expect(result.positiveEqual).assertTrue();
      expect(result.negativeExponent).assertEqual('1.5e-3');
      expect(result.negativeEqual).assertTrue();
      expect(result.upperCaseE).assertEqual('2.5E+5');
      expect(result.upperCaseEqual).assertTrue();
    });

    /**
     * @tc.name   StringToString_SpecialValue_010
     * @tc.number SUB_BUILTINS_STRING_TOSTRING_SPECIALVALUE_1000
     * @tc.desc   Test toString() with whitespace characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToString_SpecialValue_010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testWhitespaceCharacters();
      expect(result.mixed).assertEqual('\t\n\r ');
      expect(result.mixedLength).assertEqual(4);
      expect(result.mixedEqual).assertTrue();
      expect(result.spaces).assertEqual('    ');
      expect(result.spacesLength).assertEqual(4);
    });

    /**
     * @tc.name   StringToString_SpecialValue_011
     * @tc.number SUB_BUILTINS_STRING_TOSTRING_SPECIALVALUE_1100
     * @tc.desc   Test toString() with control characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToString_SpecialValue_011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testControlCharacters();
      expect(result.controlEqual).assertTrue();
      expect(result.delChar).assertEqual('test\x7Ftest');
      expect(result.delEqual).assertTrue();
    });

    /**
     * @tc.name   StringToString_SpecialValue_012
     * @tc.number SUB_BUILTINS_STRING_TOSTRING_SPECIALVALUE_1200
     * @tc.desc   Test toString() idempotency
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToString_SpecialValue_012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testIdempotentCalls();
      expect(result.primitive).assertTrue();
      expect(result.object).assertTrue();
      expect(result.primitiveValue).assertEqual('test');
      expect(result.objectValue).assertEqual('test');
    });


    /**
     * @tc.name   StringToString_ThisValue_001
     * @tc.number SUB_BUILTINS_STRING_TOSTRING_THISVALUE_0100
     * @tc.desc   Test toString() with String primitive via call
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToString_ThisValue_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string = testThisValueCallString();
      expect(result).assertEqual('test');
    });

    /**
     * @tc.name   StringToString_ThisValue_002
     * @tc.number SUB_BUILTINS_STRING_TOSTRING_THISVALUE_0200
     * @tc.desc   Test toString() with String primitive via apply
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToString_ThisValue_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string = testThisValueApplyString();
      expect(result).assertEqual('test');
    });

    /**
     * @tc.name   StringToString_ThisValue_003
     * @tc.number SUB_BUILTINS_STRING_TOSTRING_THISVALUE_0300
     * @tc.desc   Test toString() with String primitive via bind
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToString_ThisValue_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string = testThisValueBindString();
      expect(result).assertEqual('test');
    });

    /**
     * @tc.name   StringToString_ThisValue_004
     * @tc.number SUB_BUILTINS_STRING_TOSTRING_THISVALUE_0400
     * @tc.desc   Test toString() with String object via call
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToString_ThisValue_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string = testThisValueCallStringObject();
      expect(result).assertEqual('hello');
    });

    /**
     * @tc.name   StringToString_ThisValue_005
     * @tc.number SUB_BUILTINS_STRING_TOSTRING_THISVALUE_0500
     * @tc.desc   Test toString() with String object via apply
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToString_ThisValue_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string = testThisValueApplyStringObject();
      expect(result).assertEqual('hello');
    });

    /**
     * @tc.name   StringToString_ThisValue_006
     * @tc.number SUB_BUILTINS_STRING_TOSTRING_THISVALUE_0600
     * @tc.desc   Test toString() with undefined as this throws TypeError
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToString_ThisValue_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: boolean = testThisValueUndefinedTypeError();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   StringToString_ThisValue_007
     * @tc.number SUB_BUILTINS_STRING_TOSTRING_THISVALUE_0700
     * @tc.desc   Test toString() with null as this throws TypeError
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToString_ThisValue_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: boolean = testThisValueNullTypeError();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   StringToString_ThisValue_008
     * @tc.number SUB_BUILTINS_STRING_TOSTRING_THISVALUE_0800
     * @tc.desc   Test toString() with number as this throws TypeError
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToString_ThisValue_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: boolean = testThisValueNumberTypeError();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   StringToString_ThisValue_009
     * @tc.number SUB_BUILTINS_STRING_TOSTRING_THISVALUE_0900
     * @tc.desc   Test toString() with boolean as this throws TypeError
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToString_ThisValue_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: boolean = testThisValueBooleanTypeError();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   StringToString_ThisValue_010
     * @tc.number SUB_BUILTINS_STRING_TOSTRING_THISVALUE_1000
     * @tc.desc   Test toString() with object as this throws TypeError
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToString_ThisValue_010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: boolean = testThisValueObjectTypeError();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   StringToString_ThisValue_011
     * @tc.number SUB_BUILTINS_STRING_TOSTRING_THISVALUE_1100
     * @tc.desc   Test toString() with array as this throws TypeError
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToString_ThisValue_011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: boolean = testThisValueArrayTypeError();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   StringToString_ThisValue_012
     * @tc.number SUB_BUILTINS_STRING_TOSTRING_THISVALUE_1200
     * @tc.desc   Test toString() with function as this throws TypeError
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToString_ThisValue_012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: boolean = testThisValueFunctionTypeError();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   StringToString_ThisValue_013
     * @tc.number SUB_BUILTINS_STRING_TOSTRING_THISVALUE_1300
     * @tc.desc   Test toString() with symbol as this throws TypeError
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToString_ThisValue_013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: boolean = testThisValueSymbolTypeError();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   StringToString_ThisValue_014
     * @tc.number SUB_BUILTINS_STRING_TOSTRING_THISVALUE_1400
     * @tc.desc   Test toString() with bigint as this throws TypeError
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToString_ThisValue_014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: boolean = testThisValueBigintTypeError();
      expect(result).assertTrue();
    });
  });
}
