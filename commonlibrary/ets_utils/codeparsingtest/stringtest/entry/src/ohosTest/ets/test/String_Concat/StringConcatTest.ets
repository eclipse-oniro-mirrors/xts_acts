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
import * as concatTest from './string_concat_test';

export default function StringPrototypeConcatBasicTest() {
  describe('StringPrototypeConcatBasicTest', () => {
    beforeAll(() => {
    })

    beforeEach(async () => {
    })

    afterEach(() => {
    })

    afterAll(() => {
    })

    /**
     * @tc.name   StringPrototypeConcat_Basic_SingleParam_001
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_CONCAT_BASIC_0100
     * @tc.desc   Test concat with single string parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeConcat_Basic_SingleParam_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'Hello';
      let result: string = str.concat(' World');
      expect(result).assertEqual('Hello World');
    });

    /**
     * @tc.name   StringPrototypeConcat_Basic_TwoParams_002
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_CONCAT_BASIC_0200
     * @tc.desc   Test concat with two string parameters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeConcat_Basic_TwoParams_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'Hello';
      let result: string = str.concat(' ', 'World');
      expect(result).assertEqual('Hello World');
    });

    /**
     * @tc.name   StringPrototypeConcat_Basic_MultipleParams_003
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_CONCAT_BASIC_0300
     * @tc.desc   Test concat with multiple string parameters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeConcat_Basic_MultipleParams_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'Hello';
      let result: string = str.concat(' ', 'beautiful', ' ', 'world');
      expect(result).assertEqual('Hello beautiful world');
    });

    /**
     * @tc.name   StringPrototypeConcat_Basic_EmptyCaller_004
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_CONCAT_BASIC_0400
     * @tc.desc   Test concat with empty string as caller
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeConcat_Basic_EmptyCaller_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = ''.concat('Hello');
      expect(result).assertEqual('Hello');
    });

    /**
     * @tc.name   StringPrototypeConcat_Basic_EmptyParam_005
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_CONCAT_BASIC_0500
     * @tc.desc   Test concat with empty string as parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeConcat_Basic_EmptyParam_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'Hello';
      let result: string = str.concat('');
      expect(result).assertEqual('Hello');
    });

    /**
     * @tc.name   StringPrototypeConcat_Basic_AllEmpty_006
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_CONCAT_BASIC_0600
     * @tc.desc   Test concat with both caller and param as empty strings
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeConcat_Basic_AllEmpty_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = ''.concat('');
      expect(result).assertEqual('');
    });

    /**
     * @tc.name   StringPrototypeConcat_Basic_NoParams_007
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_CONCAT_BASIC_0700
     * @tc.desc   Test concat without any parameters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeConcat_Basic_NoParams_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'Hello';
      let result: string = str.concat();
      expect(result).assertEqual('Hello');
    });

    /**
     * @tc.name   StringPrototypeConcat_Basic_ChainCalls_008
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_CONCAT_BASIC_0800
     * @tc.desc   Test chaining multiple concat calls
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeConcat_Basic_ChainCalls_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'A';
      let result: string = str.concat('B').concat('C').concat('D');
      expect(result).assertEqual('ABCD');
    });

    /**
     * @tc.name   StringPrototypeCompare_ArrayVsString_001
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_CONCAT_COMPARE_0100
     * @tc.desc   Test comparing Array.prototype.concat and String.prototype.concat
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringPrototypeCompare_ArrayVsString_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let results: Object = concatTest.testArrayConcatVsStringConcat();
      let strResult: string = (results as Record<string, Object>).strResult as string;
      let strSameRef: boolean = (results as Record<string, Object>).strSameRef as boolean;
      expect(strResult).assertEqual('Hello');
      expect(strSameRef).assertTrue();
    });

    /**
     * @tc.name   StringPrototypeCompare_ArrayConcatBehavior_002
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_CONCAT_COMPARE_0200
     * @tc.desc   Test Array.concat returns copy not reference
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringPrototypeCompare_ArrayConcatBehavior_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let results: Object = concatTest.testArrayConcatVsStringConcat();
      let arrSameRef: boolean = (results as Record<string, Object>).arrSameRef as boolean;
      expect(arrSameRef).assertFalse();
    });


    /**
     * @tc.name   StringPrototypeConcat_Error_InvalidThis_001
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_CONCAT_ERROR_0100
     * @tc.desc   Test concat with invalid this value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringPrototypeConcat_Error_InvalidThis_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let result: Object = concatTest.testConcatWithPrototypeCall();
      let error: string | null = (result as Record<string, Object>).error as string | null;
      expect(error === null).assertTrue();
    });

    /**
     * @tc.name   StringPrototypeConcat_Error_StrictMode_002
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_CONCAT_ERROR_0200
     * @tc.desc   Test concat with invalid this value in strict mode
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringPrototypeConcat_Error_StrictMode_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let result: Object = concatTest.testConcatStrictModePrototypeCall();
      let error: string | null = (result as Record<string, Object>).error as string | null;
      expect(error !== null).assertTrue();
    });


    /**
     * @tc.name   StringPrototypeConcat_Immutable_Original_001
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_CONCAT_IMMUTABLE_0100
     * @tc.desc   Test that original string is not modified
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeConcat_Immutable_Original_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let original: string = 'Hello';
      let result: string = original.concat(' World');
      expect(original).assertEqual('Hello');
      expect(result).assertEqual('Hello World');
    });

    /**
     * @tc.name   StringPrototypeConcat_Immutable_MultipleCalls_002
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_CONCAT_IMMUTABLE_0200
     * @tc.desc   Test that multiple calls keep original unchanged
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeConcat_Immutable_MultipleCalls_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'Base';
      let result1: string = str.concat(' One');
      let result2: string = str.concat(' Two');
      expect(str).assertEqual('Base');
      expect(result1).assertEqual('Base One');
      expect(result2).assertEqual('Base Two');
    });

    /**
     * @tc.name   StringPrototypeConcat_Immutable_NewString_003
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_CONCAT_IMMUTABLE_0300
     * @tc.desc   Test that result is a new string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeConcat_Immutable_NewString_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'Hello';
      let result: string = str.concat(' World');
      let isEqual: boolean = str === result;
      expect(isEqual).assertFalse();
      expect(typeof result).assertEqual('string');
    });

    /**
     * @tc.name   StringPrototypeConcat_Immutable_Length_004
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_CONCAT_IMMUTABLE_0400
     * @tc.desc   Test that result length is correct
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeConcat_Immutable_Length_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'Hello';
      let result: string = str.concat(' World');
      expect(result.length).assertEqual(11);
      expect(result.length).assertEqual(str.length + ' World'.length);
    });


    /**
     * @tc.name   StringPrototypeConcat_Chain_TrimConcat_001
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_CONCAT_CHAIN_0100
     * @tc.desc   Test chaining trim and concat methods
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringPrototypeConcat_Chain_TrimConcat_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let str: string = '  Hello  ';
      let result: string = str.trim().concat(' World');
      expect(result).assertEqual('Hello World');
    });

    /**
     * @tc.name   StringPrototypeConcat_Chain_ToUpperCaseConcat_002
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_CONCAT_CHAIN_0200
     * @tc.desc   Test chaining toUpperCase and concat methods
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringPrototypeConcat_Chain_ToUpperCaseConcat_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let str: string = 'hello';
      let result: string = str.toUpperCase().concat(' WORLD');
      expect(result).assertEqual('HELLO WORLD');
    });

    /**
     * @tc.name   StringPrototypeConcat_Chain_ToLowerCaseConcat_003
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_CONCAT_CHAIN_0300
     * @tc.desc   Test chaining toLowerCase and concat methods
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringPrototypeConcat_Chain_ToLowerCaseConcat_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let str: string = 'HELLO';
      let result: string = str.toLowerCase().concat(' world');
      expect(result).assertEqual('hello world');
    });

    /**
     * @tc.name   StringPrototypeConcat_Chain_SliceConcat_004
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_CONCAT_CHAIN_0400
     * @tc.desc   Test chaining slice and concat methods
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringPrototypeConcat_Chain_SliceConcat_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let str: string = 'Hello World';
      let result: string = str.slice(0, 5).concat(' There');
      expect(result).assertEqual('Hello There');
    });

    /**
     * @tc.name   StringPrototypeConcat_Chain_ReplaceConcat_005
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_CONCAT_CHAIN_0500
     * @tc.desc   Test chaining replace and concat methods
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringPrototypeConcat_Chain_ReplaceConcat_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let str: string = 'Hello World';
      let result: string = str.replace('World', 'There').concat('!');
      expect(result).assertEqual('Hello There!');
    });


    /**
     * @tc.name   StringPrototypeConcat_Object_Empty_001
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_CONCAT_OBJECT_0100
     * @tc.desc   Test concat with empty object parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringPrototypeConcat_Object_Empty_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let result: string = concatTest.testConcatWithEmptyObject();
      expect(result).assertEqual('[object Object]');
    });

    /**
     * @tc.name   StringPrototypeConcat_Object_CustomToString_002
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_CONCAT_OBJECT_0200
     * @tc.desc   Test concat with object having custom toString
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringPrototypeConcat_Object_CustomToString_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let result: string = concatTest.testConcatWithCustomToString();
      expect(result).assertEqual('Result: Custom');
    });

    /**
     * @tc.name   StringPrototypeConcat_Array_Empty_003
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_CONCAT_OBJECT_0300
     * @tc.desc   Test concat with empty array parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringPrototypeConcat_Array_Empty_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let result: string = concatTest.testConcatWithEmptyArray();
      expect(result).assertEqual('');
    });

    /**
     * @tc.name   StringPrototypeConcat_Array_NonEmpty_004
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_CONCAT_OBJECT_0400
     * @tc.desc   Test concat with non-empty array parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringPrototypeConcat_Array_NonEmpty_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let result: string = concatTest.testConcatWithArray();
      expect(result).assertEqual('1,2,3');
    });

    /**
     * @tc.name   StringPrototypeConcat_Function_005
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_CONCAT_OBJECT_0500
     * @tc.desc   Test concat with function parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringPrototypeConcat_Function_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let result: string = concatTest.testConcatWithFunction();
      expect(result.length).assertLarger(0);
    });

    /**
     * @tc.name   StringPrototypeConcat_Operator_ObjectConversion_001
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_CONCAT_OPERATOR_0100
     * @tc.desc   Test difference between concat and + operator with objects
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringPrototypeConcat_Operator_ObjectConversion_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let results: Object = concatTest.testConcatOperatorWithObject();
      let concatResult: string = (results as Record<string, Object>).concat as string;
      let plusResult: string = (results as Record<string, Object>).plus as string;
      expect(concatResult).assertEqual('Hello');
      expect(plusResult).assertEqual('42');
    });


    /**
     * @tc.name   StringPrototypeConcat_Practical_Path_001
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_CONCAT_PRACTICAL_0100
     * @tc.desc   Test concat for file path construction
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeConcat_Practical_Path_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let path: string = '/home/user';
      let fullPath: string = path.concat('/documents/file.txt');
      expect(fullPath).assertEqual('/home/user/documents/file.txt');
    });

    /**
     * @tc.name   StringPrototypeConcat_Practical_URL_002
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_CONCAT_PRACTICAL_0200
     * @tc.desc   Test concat for URL construction
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeConcat_Practical_URL_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let baseUrl: string = 'https://example.com/api';
      let url: string = baseUrl.concat('?id=1', '&name=test');
      expect(url).assertEqual('https://example.com/api?id=1&name=test');
    });

    /**
     * @tc.name   StringPrototypeConcat_Practical_Template_003
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_CONCAT_PRACTICAL_0300
     * @tc.desc   Test concat for template-like string construction
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeConcat_Practical_Template_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = concatTest.testConcatWithNumberInTemplate();
      expect(result).assertEqual('Name: Alice, Age: 25');
    });

    /**
     * @tc.name   StringPrototypeConcat_Practical_LogMessage_004
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_CONCAT_PRACTICAL_0400
     * @tc.desc   Test concat for log message construction
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeConcat_Practical_LogMessage_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let level: string = 'ERROR';
      let timestamp: string = '2024-01-01 12:00:00';
      let message: string = 'Connection failed';
      let log: string = '['.concat(level, '] ', timestamp, ' - ', message);
      expect(log).assertEqual('[ERROR] 2024-01-01 12:00:00 - Connection failed');
    });


    /**
     * @tc.name   StringPrototypeConcat_Type_Integer_001
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_CONCAT_TYPE_0100
     * @tc.desc   Test concat with integer parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeConcat_Type_Integer_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = concatTest.testConcatWithInteger();
      expect(result).assertEqual('Count: 42');
    });

    /**
     * @tc.name   StringPrototypeConcat_Type_Float_002
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_CONCAT_TYPE_0200
     * @tc.desc   Test concat with float parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeConcat_Type_Float_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = concatTest.testConcatWithFloat();
      expect(result).assertEqual('Value: 3.14');
    });

    /**
     * @tc.name   StringPrototypeConcat_Type_MultipleNumbers_003
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_CONCAT_TYPE_0300
     * @tc.desc   Test concat with multiple number parameters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeConcat_Type_MultipleNumbers_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = concatTest.testConcatWithMultipleNumbers();
      expect(result).assertEqual('45');
    });

    /**
     * @tc.name   StringPrototypeConcat_Type_NaN_004
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_CONCAT_TYPE_0400
     * @tc.desc   Test concat with NaN parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringPrototypeConcat_Type_NaN_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let result: string = concatTest.testConcatWithNaN();
      expect(result).assertEqual('NaN');
    });

    /**
     * @tc.name   StringPrototypeConcat_Type_Infinity_005
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_CONCAT_TYPE_0500
     * @tc.desc   Test concat with Infinity parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringPrototypeConcat_Type_Infinity_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let results: Object = concatTest.testConcatWithInfinity();
      let result1: string = (results as Record<string, Object>).result1 as string;
      let result2: string = (results as Record<string, Object>).result2 as string;
      expect(result1).assertEqual('Infinity');
      expect(result2).assertEqual('-Infinity');
    });

    /**
     * @tc.name   StringPrototypeConcat_Type_True_006
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_CONCAT_TYPE_0600
     * @tc.desc   Test concat with true parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeConcat_Type_True_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = concatTest.testConcatWithTrue();
      expect(result).assertEqual('Value: true');
    });

    /**
     * @tc.name   StringPrototypeConcat_Type_False_007
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_CONCAT_TYPE_0700
     * @tc.desc   Test concat with false parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeConcat_Type_False_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = concatTest.testConcatWithFalse();
      expect(result).assertEqual('Value: false');
    });

    /**
     * @tc.name   StringPrototypeConcat_Type_Null_008
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_CONCAT_TYPE_0800
     * @tc.desc   Test concat with null parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeConcat_Type_Null_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = concatTest.testConcatWithNull();
      expect(result).assertEqual('Value: null');
    });

    /**
     * @tc.name   StringPrototypeConcat_Type_Undefined_009
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_CONCAT_TYPE_0900
     * @tc.desc   Test concat with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeConcat_Type_Undefined_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = concatTest.testConcatWithUndefined();
      expect(result).assertEqual('Value: undefined');
    });

    /**
     * @tc.name   StringPrototypeConcat_Type_Zero_010
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_CONCAT_TYPE_1000
     * @tc.desc   Test concat with zero parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeConcat_Type_Zero_010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = concatTest.testConcatWithZero();
      expect(result).assertEqual('Count: 0');
    });

    /**
     * @tc.name   StringPrototypeConcat_Type_Negative_011
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_CONCAT_TYPE_1100
     * @tc.desc   Test concat with negative number parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeConcat_Type_Negative_011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = concatTest.testConcatWithNegative();
      expect(result).assertEqual('Value: -42');
    });


    /**
     * @tc.name   StringPrototypeConcat_Unicode_Emoji_001
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_CONCAT_UNICODE_0100
     * @tc.desc   Test concat with emoji characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringPrototypeConcat_Unicode_Emoji_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let str: string = 'Hello ';
      let result: string = str.concat('😀', ' World');
      expect(result).assertEqual('Hello 😀 World');
    });

    /**
     * @tc.name   StringPrototypeConcat_Unicode_SpecialChars_002
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_CONCAT_UNICODE_0200
     * @tc.desc   Test concat with Unicode characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringPrototypeConcat_Unicode_SpecialChars_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let result: string = ''.concat('\u03A9', '\u20AC', '\u2603');
      expect(result).assertEqual('Ω€☃');
    });

    /**
     * @tc.name   StringPrototypeConcat_Unicode_Newline_003
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_CONCAT_UNICODE_0300
     * @tc.desc   Test concat with newline character
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeConcat_Unicode_Newline_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'Line 1';
      let result: string = str.concat('\nLine 2');
      expect(result).assertEqual('Line 1\nLine 2');
    });

    /**
     * @tc.name   StringPrototypeConcat_Unicode_Quotes_004
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_CONCAT_UNICODE_0400
     * @tc.desc   Test concat with quotes
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeConcat_Unicode_Quotes_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'He said: ';
      let result: string = str.concat('"Hello"');
      expect(result).assertEqual('He said: "Hello"');
    });

  })
}
