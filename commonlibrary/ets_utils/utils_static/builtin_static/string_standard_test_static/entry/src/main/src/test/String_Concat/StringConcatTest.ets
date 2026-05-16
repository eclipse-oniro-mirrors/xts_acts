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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '../../../../hypium/index';
import Utils from '../Util.test';

export default function StringPrototypeConcatBasicTest():void {
  describe('StringPrototypeConcatBasicTest', () => {
    beforeAll(() => {
    })

    beforeEach(async () => {
      await Utils.msSleep(20)
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
