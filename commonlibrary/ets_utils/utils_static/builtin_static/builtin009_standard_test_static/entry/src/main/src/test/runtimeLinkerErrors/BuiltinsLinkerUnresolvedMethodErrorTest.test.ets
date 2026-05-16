/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium/index';
import Utils from '../Util.test';

export default function builtinsLinkerUnresolvedMethodErrorTest() {
  describe('builtinsLinkerUnresolvedMethodErrorTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
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
     * @tc.name    builtinsLinkerUnresolvedMethodErrorTest0001
     * @tc.number  BUILTINS_LINKER_UNRESOLVED_METHOD_ERROR_TEST_0001
     * @tc.desc    Test basic constructor with default parameters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsLinkerUnresolvedMethodErrorTest0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const error1 = new LinkerUnresolvedMethodError();
      expect(error1.name).assertEqual('LinkerUnresolvedMethodError');
      expect(error1.message).assertEqual('');

      const error2 = new LinkerUnresolvedMethodError('Method not found');
      expect(error2.name).assertEqual('LinkerUnresolvedMethodError');
      expect(error2.message).assertEqual('Method not found');
    });

    /**
     * @tc.name    builtinsLinkerUnresolvedMethodErrorTest0002
     * @tc.number  BUILTINS_LINKER_UNRESOLVED_METHOD_ERROR_TEST_0002
     * @tc.desc    Test constructor with String type boundary values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsLinkerUnresolvedMethodErrorTest0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const error1 = new LinkerUnresolvedMethodError('');
      expect(error1.message).assertEqual('');

      const error2 = new LinkerUnresolvedMethodError(undefined);
      expect(error2.message).assertEqual('');
    });

    /**
     * @tc.name    builtinsLinkerUnresolvedMethodErrorTest0003
     * @tc.number  BUILTINS_LINKER_UNRESOLVED_METHOD_ERROR_TEST_0003
     * @tc.desc    Test constructor with special characters in message
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsLinkerUnresolvedMethodErrorTest0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const specialChars = '!"#$%&\'()*+,-./:;<=>?@[\\]^_`{|}~';
      const error1 = new LinkerUnresolvedMethodError(specialChars);
      expect(error1.message).assertEqual(specialChars);

      const doubleSpecial = ' !!""##$$%%&&\'\'(())**++,,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~';
      const error2 = new LinkerUnresolvedMethodError(doubleSpecial);
      expect(error2.message).assertEqual(doubleSpecial);

      const asciiChars = '!"#$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~';
      const error3 = new LinkerUnresolvedMethodError(asciiChars);
      expect(error3.message).assertEqual(asciiChars);
    });

    /**
     * @tc.name    builtinsLinkerUnresolvedMethodErrorTest0004
     * @tc.number  BUILTINS_LINKER_UNRESOLVED_METHOD_ERROR_TEST_0004
     * @tc.desc    Test constructor with escape sequences in message
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsLinkerUnresolvedMethodErrorTest0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const escapeTests = [
        '\\a',
        '\\b',
        '\\f',
        '\\n',
        '\\r',
        '\\t',
        '\\v',
        '\\\\',
        '\\\'',
        '\\"',
        '\\?',
        '\\0',
        '\\101',
        '\\x41',
      ];

      for (let i = 0; i < escapeTests.length; i++) {
        const error = new LinkerUnresolvedMethodError(escapeTests[i]);
        expect(error.message).assertEqual(escapeTests[i]);
      }
    });

    /**
     * @tc.name    builtinsLinkerUnresolvedMethodErrorTest0005
     * @tc.number  BUILTINS_LINKER_UNRESOLVED_METHOD_ERROR_TEST_0005
     * @tc.desc    Test constructor with Unicode and emoji in message
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsLinkerUnresolvedMethodErrorTest0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const emojis = [
        '👆', '👿', '👀', '💯', '🎅', '😼', '🔧', '💇', '🤼‍♂️', '🛢', '🀄', '🏴'
      ];

      for (let i = 0; i < emojis.length; i++) {
        const error = new LinkerUnresolvedMethodError(`Method ${emojis[i]} not found`);
        expect(error.message).assertContain(emojis[i]);
      }

      const unicodeTests = [
        '\\ud83d\\udc46', // 👆
        '\\ud83d\\udc7f', // 👿
        '\\ud83d\\udc40', // 👀
        '\\ud83d\\udcaf', // 💯
        '\\ud83c\\udf85', // 🎅
        '\\ud83d\\ude3c', // 😼
        '\\ud83d\\udd27', // 🔧
        '\\ud83d\\udc87', // 💇
        '\\ud83d\\udee2', // 🛢
        '\\ud83c\\udc04', // 🀄
        '\\ud83c\\udff4', // 🏴
      ];

      for (let i = 0; i < unicodeTests.length; i++) {
        const error = new LinkerUnresolvedMethodError(unicodeTests[i]);
        expect(error.message).assertEqual(unicodeTests[i]);
      }
    });

    /**
     * @tc.name    builtinsLinkerUnresolvedMethodErrorTest0006
     * @tc.number  BUILTINS_LINKER_UNRESOLVED_METHOD_ERROR_TEST_0006
     * @tc.desc    Test constructor with invalid Unicode and keywords
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsLinkerUnresolvedMethodErrorTest0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const invalidUnicode = ['\\udc04', '\\ud83d', '\\udff4'];

      for (let i = 0; i < invalidUnicode.length; i++) {
        const error = new LinkerUnresolvedMethodError(invalidUnicode[i]);
        expect(error.message).assertEqual(invalidUnicode[i]);
      }

      const keywords = ['0', 'NaN', ''];
      for (let i = 0; i < keywords.length; i++) {
        const error = new LinkerUnresolvedMethodError(keywords[i]);
        expect(error.message).assertEqual(keywords[i]);
      }
    });

    /**
     * @tc.name    builtinsLinkerUnresolvedMethodErrorTest0007
     * @tc.number  BUILTINS_LINKER_UNRESOLVED_METHOD_ERROR_TEST_0007
     * @tc.desc    Test constructor with options parameter
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsLinkerUnresolvedMethodErrorTest0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const rootError = new Error('Root cause error');
      const options1: ErrorOptions = {
        cause: rootError
      };

      const error1 = new LinkerUnresolvedMethodError('Method error with cause', options1);
      expect(error1.message).assertEqual('Method error with cause');
      expect(error1.cause).assertEqual(rootError);

      const error2 = new LinkerUnresolvedMethodError('Test method', {});
      expect(error2.message).assertEqual('Test method');

      const error3 = new LinkerUnresolvedMethodError('Test method', undefined);
      expect(error3.message).assertEqual('Test method');

      const options4: ErrorOptions = {
        cause: 'Simple cause'
      };
      const error4 = new LinkerUnresolvedMethodError('Error', options4);
      expect(error4.cause).assertEqual('Simple cause');
    });

    /**
     * @tc.name    builtinsLinkerUnresolvedMethodErrorTest0008
     * @tc.number  BUILTINS_LINKER_UNRESOLVED_METHOD_ERROR_TEST_0008
     * @tc.desc    Test constructor with numeric string values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsLinkerUnresolvedMethodErrorTest0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const numberTests = [
        '0',
        '-0',
        'NaN',
        'Infinity',
        '-Infinity',

        '1.7976931348623157e+308',
        '5e-324',
        '2.220446049250313e-16',
        '9007199254740991',

        '-128',
        '127',
        '-32768',
        '32767',
        '-2147483648',
        '2147483647',
        '-9223372036854775808',
        '9223372036854775807',

        '123.456',
        '0xdecafafecacefade',
        '0xcafebabe',
        '0x0102',
        '0o377',
        '1e3',
        '2.5e-2',
        '2**3',
      ];

      for (let i = 0; i < numberTests.length; i++) {
        const error = new LinkerUnresolvedMethodError(numberTests[i]);
        expect(error.message).assertEqual(numberTests[i]);
      }
    });

    /**
     * @tc.name    builtinsLinkerUnresolvedMethodErrorTest0009
     * @tc.number  BUILTINS_LINKER_UNRESOLVED_METHOD_ERROR_TEST_0009
     * @tc.desc    Test constructor with TypedArray string representations
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsLinkerUnresolvedMethodErrorTest0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const typedArrayTests = [
        'Int8Array[-128,127]',
        'Int8Array[-129,128]',

        'Uint8Array[0,255]',
        'Uint8Array[-1,256]',

        'Uint8ClampedArray[0,255,-1,256]',

        'Int16Array[-32768,32767]',
        'Int16Array[-32769,32768]',

        'Uint16Array[0,65535]',
        'Uint16Array[-1,65536]',

        'Int32Array[-2147483648,2147483647]',
        'Int32Array[-2147483649,2147483648]',

        'Uint32Array[0,4294967295]',
        'Uint32Array[-1,4294967296]',

        'Float32Array[-3.4028234663852886e38,3.4028234663852886e38]',
        'Float32Array[-3.5e38,3.5e38,NaN,Infinity,-Infinity]',

        'Float64Array[-1.7976931348623157e308,1.7976931348623157e308]',
        'Float64Array[5e-324]',
      ];

      for (let i = 0; i < typedArrayTests.length; i++) {
        const error = new LinkerUnresolvedMethodError(typedArrayTests[i]);
        expect(error.message).assertEqual(typedArrayTests[i]);
      }
    });

    /**
     * @tc.name    builtinsLinkerUnresolvedMethodErrorTest0010
     * @tc.number  BUILTINS_LINKER_UNRESOLVED_METHOD_ERROR_TEST_0010
     * @tc.desc    Test constructor with array string representations
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsLinkerUnresolvedMethodErrorTest0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arrayTests = [
        '[72,101,108,108,111,87,111,114,108,100,49,50,51,63]',

        '[72,101,108,108,111,87,111,114,108,0,0,0,0,0,100,49,50,51,63]',

        '[72,101,108,108,111,87,-111,114,108,100,-49,50,51,-63]',

        '[72,101,NaN,Infinity,108,111]',

        '[72,"abc",true,null,undefined,108]',

        '[]',

        '[256,65536,32768]',

        'Uint8Array[72,101,108,108,111]',
      ];

      for (let i = 0; i < arrayTests.length; i++) {
        const error = new LinkerUnresolvedMethodError(arrayTests[i]);
        expect(error.message).assertEqual(arrayTests[i]);
      }
    });

    /**
     * @tc.name    builtinsLinkerUnresolvedMethodErrorTest0011
     * @tc.number  BUILTINS_LINKER_UNRESOLVED_METHOD_ERROR_TEST_0011
     * @tc.desc    Test constructor with boolean and falsy values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsLinkerUnresolvedMethodErrorTest0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const booleanTests = [
        'true',
        'false',

        '0',
        'NaN',
        '""',
        'null',
        'undefined',

        '!true',
        '!false',
        '!0',
        '!1',
        '!"string"',
      ];

      for (let i = 0; i < booleanTests.length; i++) {
        const error = new LinkerUnresolvedMethodError(booleanTests[i]);
        expect(error.message).assertEqual(booleanTests[i]);
      }

      const error1 = new LinkerUnresolvedMethodError('');
      expect(error1.message).assertEqual('');

      const error2 = new LinkerUnresolvedMethodError(undefined);
      expect(error2.message).assertEqual('');
    });

    /**
     * @tc.name    builtinsLinkerUnresolvedMethodErrorTest0012
     * @tc.number  BUILTINS_LINKER_UNRESOLVED_METHOD_ERROR_TEST_0012
     * @tc.desc    Test constructor with object string representations
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsLinkerUnresolvedMethodErrorTest0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const objectTests = [
        '{a:1,b:"test",c:[1,2,3]}',

        '{a:1,b:{c:2,d:{e:3}}}',

        '{a:undefined,b:1}',
        '{a:null,b:1}',
        '{a:NaN,b:1}',
        '{a:Infinity,b:1}',

        '{}',

        '{buffer:Uint8Array[72,101,108,108,111]}',

        '{methods:["method1","method2","method3"]}',

        '{obj:{nested:{deep:{value:42}}}}',
      ];

      for (let i = 0; i < objectTests.length; i++) {
        const error = new LinkerUnresolvedMethodError(objectTests[i]);
        expect(error.message).assertEqual(objectTests[i]);
      }
    });

    /**
     * @tc.name    builtinsLinkerUnresolvedMethodErrorTest0013
     * @tc.number  BUILTINS_LINKER_UNRESOLVED_METHOD_ERROR_TEST_0013
     * @tc.desc    Test constructor with various string formats and edge cases
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsLinkerUnresolvedMethodErrorTest0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const stringTests = [
        'method'.repeat(50),

        'Method123_😀!@#$%',

        'method\twith\ttabs',
        'method with spaces',
        '  method with leading spaces',
        'method with trailing spaces  ',

        'method\nwith\nnewlines',
        'method\r\nwith\r\nCRLF',

        'a',
        ' ',
        '\t',
        '\n',
      ];

      for (let i = 0; i < stringTests.length; i++) {
        const error = new LinkerUnresolvedMethodError(stringTests[i]);
        expect(error.message).assertEqual(stringTests[i]);
      }
    });

    /**
     * @tc.name    builtinsLinkerUnresolvedMethodErrorTest0014
     * @tc.number  BUILTINS_LINKER_UNRESOLVED_METHOD_ERROR_TEST_0014
     * @tc.desc    Test error properties and inheritance
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsLinkerUnresolvedMethodErrorTest0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const error = new LinkerUnresolvedMethodError('Test method error');

      expect(error.name).assertEqual('LinkerUnresolvedMethodError');
      expect(error.message).assertEqual('Test method error');

      expect(error instanceof Error).assertTrue();

      expect(typeof error.stack === 'string').assertTrue();

      const errorString = error.toString();
      expect(errorString).assertContain('LinkerUnresolvedMethodError');
      expect(errorString).assertContain('Test method error');

      const error2 = new LinkerUnresolvedMethodError('Another error');
      expect(error2.name).assertEqual('LinkerUnresolvedMethodError');
      expect(error2.message).assertEqual('Another error');

    });

  })
}