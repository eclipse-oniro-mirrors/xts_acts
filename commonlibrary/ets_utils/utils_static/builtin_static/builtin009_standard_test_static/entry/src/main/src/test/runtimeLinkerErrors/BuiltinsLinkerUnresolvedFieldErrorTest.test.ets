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

export default function builtinsLinkerUnresolvedFieldErrorTest() {
  describe('builtinsLinkerUnresolvedFieldErrorTest', () => {
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
     * @tc.name    builtinsLinkerUnresolvedFieldErrorTest0001
     * @tc.number  BUILTINS_LINKER_UNRESOLVED_FIELD_ERROR_TEST_0001
     * @tc.desc    Test basic constructor with default parameters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsLinkerUnresolvedFieldErrorTest0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const error1 = new LinkerUnresolvedFieldError();
      expect(error1.name).assertEqual('LinkerUnresolvedFieldError');
      expect(error1.message).assertEqual('');

      const error2 = new LinkerUnresolvedFieldError('Field not found');
      expect(error2.name).assertEqual('LinkerUnresolvedFieldError');
      expect(error2.message).assertEqual('Field not found');
    });

    /**
     * @tc.name    builtinsLinkerUnresolvedFieldErrorTest0002
     * @tc.number  BUILTINS_LINKER_UNRESOLVED_FIELD_ERROR_TEST_0002
     * @tc.desc    Test constructor with String type boundary values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsLinkerUnresolvedFieldErrorTest0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const error1 = new LinkerUnresolvedFieldError('');
      expect(error1.message).assertEqual('');

      const error2 = new LinkerUnresolvedFieldError(undefined);
      expect(error2.message).assertEqual('');
    });

    /**
     * @tc.name    builtinsLinkerUnresolvedFieldErrorTest0003
     * @tc.number  BUILTINS_LINKER_UNRESOLVED_FIELD_ERROR_TEST_0003
     * @tc.desc    Test constructor with special characters in message
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsLinkerUnresolvedFieldErrorTest0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const specialChars = '!"#$%&\'()*+,-./:;<=>?@[\\]^_`{|}~';
      const error1 = new LinkerUnresolvedFieldError(specialChars);
      expect(error1.message).assertEqual(specialChars);

      const doubleSpecial = ' !!""##$$%%&&\'\'(())**++,,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~';
      const error2 = new LinkerUnresolvedFieldError(doubleSpecial);
      expect(error2.message).assertEqual(doubleSpecial);

      const asciiChars = '!"#$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~';
      const error3 = new LinkerUnresolvedFieldError(asciiChars);
      expect(error3.message).assertEqual(asciiChars);
    });

    /**
     * @tc.name    builtinsLinkerUnresolvedFieldErrorTest0004
     * @tc.number  BUILTINS_LINKER_UNRESOLVED_FIELD_ERROR_TEST_0004
     * @tc.desc    Test constructor with Unicode and emoji in message
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsLinkerUnresolvedFieldErrorTest0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const emojis = [
        '👆', '👿', '👀', '💯', '🎅', '😼', '🔧', '💇', '🤼‍♂️', '🛢', '🀄', '🏴'
      ];

      for (let i = 0; i < emojis.length; i++) {
        const emoji = emojis[i];
        const error = new LinkerUnresolvedFieldError(`Error with ${emoji}`);
        expect(error.message).assertContain(emoji);
      }

      const unicodeTests = [
        '\\ud83d\\udc46', // 👆
        '\\ud83d\\udc7f', // 👿
        '\\ud83d\\udc40', // 👀
        '\\ud83d\\udcaf', // 💯
        '\\ud83c\\udf85', // 🎅
      ];

      for (let i = 0; i < unicodeTests.length; i++) {
        const unicode = unicodeTests[i];
        const error = new LinkerUnresolvedFieldError(unicode);
        expect(error.message).assertEqual(unicode);
      }
    });

    /**
     * @tc.name    builtinsLinkerUnresolvedFieldErrorTest0005
     * @tc.number  BUILTINS_LINKER_UNRESOLVED_FIELD_ERROR_TEST_0005
     * @tc.desc    Test constructor with invalid Unicode and edge cases
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsLinkerUnresolvedFieldErrorTest0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const invalidUnicode = [
        '\\udc04', '\\ud83d', '\\udff4'
      ];

      for (let i = 0; i < invalidUnicode.length; i++) {
        const invalid = invalidUnicode[i];
        const error = new LinkerUnresolvedFieldError(invalid);
        expect(error.message).assertEqual(invalid);
      }

      const keywords = ['0', 'NaN', ''];
      for (let i = 0; i < keywords.length; i++) {
        const keyword = keywords[i];
        const error = new LinkerUnresolvedFieldError(keyword);
        expect(error.message).assertEqual(keyword);
      }
    });

    /**
     * @tc.name    builtinsLinkerUnresolvedFieldErrorTest0006
     * @tc.number  BUILTINS_LINKER_UNRESOLVED_FIELD_ERROR_TEST_0006
     * @tc.desc    Test constructor with options parameter
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsLinkerUnresolvedFieldErrorTest0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const options1: ErrorOptions = {
        cause: 'Root cause'
      };

      const error1 = new LinkerUnresolvedFieldError('Field error with cause', options1);
      expect(error1.message).assertEqual('Field error with cause');
      expect(error1.cause).assertEqual('Root cause');

      const error2 = new LinkerUnresolvedFieldError('Test', {});
      expect(error2.message).assertEqual('Test');

      const error3 = new LinkerUnresolvedFieldError('Test', undefined);
      expect(error3.message).assertEqual('Test');
    });

    /**
     * @tc.name    builtinsLinkerUnresolvedFieldErrorTest0007
     * @tc.number  BUILTINS_LINKER_UNRESOLVED_FIELD_ERROR_TEST_0007
     * @tc.desc    Test constructor with various string formats
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsLinkerUnresolvedFieldErrorTest0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const stringTests = [
        '72,101,108,108,111',
        '72,101,108,108,111,87,111,114,108,100,49,50,51,63',
        '72,101,NaN,Infinity,108,111',
        '256,65536,32768',
        'HelloWorld123?',
        '👆🎅💯',
      ];

      for (let i = 0; i < stringTests.length; i++) {
        const str = stringTests[i];
        const error = new LinkerUnresolvedFieldError(str);
        expect(error.message).assertEqual(str);
      }
    });

    /**
     * @tc.name    builtinsLinkerUnresolvedFieldErrorTest0008
     * @tc.number  BUILTINS_LINKER_UNRESOLVED_FIELD_ERROR_TEST_0008
     * @tc.desc    Test constructor with special number formats as strings
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsLinkerUnresolvedFieldErrorTest0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const specialNumbers = [
        '0xdecafafecacefade',
        '0x0102',
        '0o377',
        '2**3',
        '1e3',
        '2.5e-2',
        '9007199254740991n',
        '0xcafebabe',
        '123.456',
      ];

      for (let i = 0; i < specialNumbers.length; i++) {
        const numStr = specialNumbers[i];
        const error = new LinkerUnresolvedFieldError(numStr);
        expect(error.message).assertEqual(numStr);
      }
    });

    /**
     * @tc.name    builtinsLinkerUnresolvedFieldErrorTest0009
     * @tc.number  BUILTINS_LINKER_UNRESOLVED_FIELD_ERROR_TEST_0009
     * @tc.desc    Test constructor with complex options
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsLinkerUnresolvedFieldErrorTest0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const options1: ErrorOptions = {
        cause: 'Simple cause'
      };

      const error1 = new LinkerUnresolvedFieldError('Simple error', options1);
      expect(error1.message).assertEqual('Simple error');
      expect(error1.cause).assertEqual('Simple cause');

      const rootError = new Error('Root error');
      const options2: ErrorOptions = {
        cause: rootError
      };

      const error2 = new LinkerUnresolvedFieldError('Error with cause', options2);
      expect(error2.message).assertEqual('Error with cause');
      expect(error2.cause).assertEqual(rootError);

      const error3 = new LinkerUnresolvedFieldError('Test with null options', undefined);
      expect(error3.message).assertEqual('Test with null options');
    });

    /**
     * @tc.name    builtinsLinkerUnresolvedFieldErrorTest0010
     * @tc.number  BUILTINS_LINKER_UNRESOLVED_FIELD_ERROR_TEST_0010
     * @tc.desc    Test constructor with TypedArray string representations
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsLinkerUnresolvedFieldErrorTest0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const typedArrayStrings = [
        'Int8Array[-128,0,127]',
        'Uint8Array[0,128,255]',
        'Int16Array[-32768,0,32767]',
        'Uint16Array[0,32768,65535]',
        'Int32Array[-2147483648,0,2147483647]',
        'Uint32Array[0,2147483648,4294967295]',
        'Float32Array[-3.4e38,0,3.4e38,NaN,Infinity,-Infinity]',
        'Float64Array[-1.8e308,0,1.8e308,5e-324]',
      ];

      for (let i = 0; i < typedArrayStrings.length; i++) {
        const typedArrayStr = typedArrayStrings[i];
        const error = new LinkerUnresolvedFieldError(typedArrayStr);
        expect(error.message).assertEqual(typedArrayStr);
      }
    });

    /**
     * @tc.name    builtinsLinkerUnresolvedFieldErrorTest0011
     * @tc.number  BUILTINS_LINKER_UNRESOLVED_FIELD_ERROR_TEST_0011
     * @tc.desc    Test constructor with boolean and falsy string values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsLinkerUnresolvedFieldErrorTest0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const falsyValues = ['true', 'false', '0', 'NaN', '', 'null', 'undefined',];

      for (let i = 0; i < falsyValues.length; i++) {
        const value = falsyValues[i];
        const error = new LinkerUnresolvedFieldError(value);
        expect(error.message).assertEqual(value);
      }

      const error1 = new LinkerUnresolvedFieldError('false');
      expect(error1.message).assertEqual('false');

      const error2 = new LinkerUnresolvedFieldError('true');
      expect(error2.message).assertEqual('true');
    });

    /**
     * @tc.name    builtinsLinkerUnresolvedFieldErrorTest0012
     * @tc.number  BUILTINS_LINKER_UNRESOLVED_FIELD_ERROR_TEST_0012
     * @tc.desc    Test error properties and basic inheritance
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsLinkerUnresolvedFieldErrorTest0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const error = new LinkerUnresolvedFieldError('Test error');

      expect(error.name).assertEqual('LinkerUnresolvedFieldError');
      expect(error.message).assertEqual('Test error');

      expect(error instanceof Error).assertTrue();

      expect(typeof error.stack === 'string').assertTrue();

      const errorString = error.toString();
      expect(errorString).assertContain('LinkerUnresolvedFieldError');
      expect(errorString).assertContain('Test error');
    });

    /**
     * @tc.name    builtinsLinkerUnresolvedFieldErrorTest0013
     * @tc.number  BUILTINS_LINKER_UNRESOLVED_FIELD_ERROR_TEST_0013
     * @tc.desc    Test multiple error instances
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsLinkerUnresolvedFieldErrorTest0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const errors = [
        new LinkerUnresolvedFieldError('Error 1'),
        new LinkerUnresolvedFieldError('Error 2'),
        new LinkerUnresolvedFieldError('Error 3'),
        new LinkerUnresolvedFieldError(''),
        new LinkerUnresolvedFieldError(undefined),
      ];

      expect(errors[0].message).assertEqual('Error 1');
      expect(errors[1].message).assertEqual('Error 2');
      expect(errors[2].message).assertEqual('Error 3');
      expect(errors[3].message).assertEqual('');
      expect(errors[4].message).assertEqual('');

      for (let i = 0; i < errors.length; i++) {
        expect(errors[i].name).assertEqual('LinkerUnresolvedFieldError');
      }
    });
  })
}