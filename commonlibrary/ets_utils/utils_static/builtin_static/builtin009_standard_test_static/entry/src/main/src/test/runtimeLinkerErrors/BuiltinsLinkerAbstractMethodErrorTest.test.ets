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

export default function builtinsLinkerAbstractMethodErrorTest() {
  describe('builtinsLinkerAbstractMethodErrorTest', () => {
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
     * @tc.name    builtinsLinkerAbstractMethodErrorTest0001
     * @tc.number  BUILTINS_LINKER_ABSTRACT_METHOD_ERROR_TEST_0001
     * @tc.desc    Test basic constructor with default parameters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsLinkerAbstractMethodErrorTest0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const error1 = new LinkerAbstractMethodError();
      expect(error1.name).assertEqual('LinkerAbstractMethodError');
      expect(error1.message).assertEqual('');

      const error2 = new LinkerAbstractMethodError('Abstract method not implemented');
      expect(error2.name).assertEqual('LinkerAbstractMethodError');
      expect(error2.message).assertEqual('Abstract method not implemented');
    });

    /**
     * @tc.name    builtinsLinkerAbstractMethodErrorTest0002
     * @tc.number  BUILTINS_LINKER_ABSTRACT_METHOD_ERROR_TEST_0002
     * @tc.desc    Test constructor with String type boundary values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsLinkerAbstractMethodErrorTest0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const error1 = new LinkerAbstractMethodError('');
      expect(error1.message).assertEqual('');

      const error2 = new LinkerAbstractMethodError(undefined);
      expect(error2.message).assertEqual('');
    });

    /**
     * @tc.name    builtinsLinkerAbstractMethodErrorTest0003
     * @tc.number  BUILTINS_LINKER_ABSTRACT_METHOD_ERROR_TEST_0003
     * @tc.desc    Test constructor with special characters in message
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsLinkerAbstractMethodErrorTest0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const specialChars = '!"#$%&\'()*+,-./:;<=>?@[\\]^_`{|}~';
      const error1 = new LinkerAbstractMethodError(specialChars);
      expect(error1.message).assertEqual(specialChars);

      const doubleSpecial = ' !!""##$$%%&&\'\'(())**++,,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~';
      const error2 = new LinkerAbstractMethodError(doubleSpecial);
      expect(error2.message).assertEqual(doubleSpecial);

      const asciiChars = '!"#$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~';
      const error3 = new LinkerAbstractMethodError(asciiChars);
      expect(error3.message).assertEqual(asciiChars);
    });

    /**
     * @tc.name    builtinsLinkerAbstractMethodErrorTest0004
     * @tc.number  BUILTINS_LINKER_ABSTRACT_METHOD_ERROR_TEST_0004
     * @tc.desc    Test constructor with escape sequences in message
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsLinkerAbstractMethodErrorTest0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
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
        '\\x7F',
        '\\x1B',
      ];

      for (let i = 0; i < escapeTests.length; i++) {
        const error = new LinkerAbstractMethodError(`Error: ${escapeTests[i]}`);
        expect(error.message).assertEqual(`Error: ${escapeTests[i]}`);
      }
    });

    /**
     * @tc.name    builtinsLinkerAbstractMethodErrorTest0005
     * @tc.number  BUILTINS_LINKER_ABSTRACT_METHOD_ERROR_TEST_0005
     * @tc.desc    Test constructor with Unicode and emoji in message
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsLinkerAbstractMethodErrorTest0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const emojis = [
        '👆', '👿', '👀', '💯', '🎅', '😼', '🔧', '💇', '🤼‍♂️', '🛢', '🀄', '🏴'
      ];

      for (let i = 0; i < emojis.length; i++) {
        const error = new LinkerAbstractMethodError(`Abstract method ${emojis[i]} not found`);
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
        const error = new LinkerAbstractMethodError(`Unicode: ${unicodeTests[i]}`);
        expect(error.message).assertContain(unicodeTests[i]);
      }
    });

    /**
     * @tc.name    builtinsLinkerAbstractMethodErrorTest0006
     * @tc.number  BUILTINS_LINKER_ABSTRACT_METHOD_ERROR_TEST_0006
     * @tc.desc    Test constructor with invalid Unicode, keywords and edge cases
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsLinkerAbstractMethodErrorTest0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const invalidUnicode = ['\\udc04', '\\ud83d', '\\udff4'];

      for (let i = 0; i < invalidUnicode.length; i++) {
        const error = new LinkerAbstractMethodError(invalidUnicode[i]);
        expect(error.message).assertEqual(invalidUnicode[i]);
      }

      const keywords = ['0', 'NaN', 'Infinity', 'undefined', 'null', 'true', 'false'];
      for (let i = 0; i < keywords.length; i++) {
        const error = new LinkerAbstractMethodError(keywords[i]);
        expect(error.message).assertEqual(keywords[i]);
      }

      const edgeCases = [
        '',
        ' ',
        '  ',
        '\t',
        '\n',
        '\r\n',
        '\u0000',
        '\uFFFF',
      ];

      for (let i = 0; i < edgeCases.length; i++) {
        const error = new LinkerAbstractMethodError(edgeCases[i]);
        expect(error.message).assertEqual(edgeCases[i]);
      }
    });

    /**
     * @tc.name    builtinsLinkerAbstractMethodErrorTest0007
     * @tc.number  BUILTINS_LINKER_ABSTRACT_METHOD_ERROR_TEST_0007
     * @tc.desc    Test constructor with options parameter
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsLinkerAbstractMethodErrorTest0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const rootError = new Error('Root abstract method error');
      const options1: ErrorOptions = {
        cause: rootError
      };

      const error1 = new LinkerAbstractMethodError('Abstract method error with cause', options1);
      expect(error1.message).assertEqual('Abstract method error with cause');
      expect(error1.cause).assertEqual(rootError);
      expect(error1.name).assertEqual('LinkerAbstractMethodError');

      const error2 = new LinkerAbstractMethodError('Test abstract method', {});
      expect(error2.message).assertEqual('Test abstract method');
      expect(error2.cause).assertUndefined();

      const error3 = new LinkerAbstractMethodError('Test abstract method', undefined);
      expect(error3.message).assertEqual('Test abstract method');

      const options4: ErrorOptions = {
        cause: 'Abstract method implementation missing'
      };
      const error4 = new LinkerAbstractMethodError('Error', options4);
      expect(error4.cause).assertEqual('Abstract method implementation missing');

      const innerError = new LinkerAbstractMethodError('Inner abstract error');
      const options5: ErrorOptions = {
        cause: innerError
      };
      const outerError = new LinkerAbstractMethodError('Outer abstract error', options5);
      expect(outerError.cause).assertEqual(innerError);
    });

    /**
     * @tc.name    builtinsLinkerAbstractMethodErrorTest0008
     * @tc.number  BUILTINS_LINKER_ABSTRACT_METHOD_ERROR_TEST_0008
     * @tc.desc    Test constructor with numeric string values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsLinkerAbstractMethodErrorTest0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
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
        '3.141592653589793',
        '0xdecafafecacefade',
        '0xcafebabe',
        '0x0102',
        '0o377',
        '1e3',
        '2.5e-2',
        '2**3',
        'Math.PI',
      ];

      for (let i = 0; i < numberTests.length; i++) {
        const error = new LinkerAbstractMethodError(`Error code: ${numberTests[i]}`);
        expect(error.message).assertContain(numberTests[i]);
      }
    });

    /**
     * @tc.name    builtinsLinkerAbstractMethodErrorTest0009
     * @tc.number  BUILTINS_LINKER_ABSTRACT_METHOD_ERROR_TEST_0009
     * @tc.desc    Test constructor with TypedArray string representations
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsLinkerAbstractMethodErrorTest0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const typedArrayTests = [
        'Int8Array[-128,127,-129,128]',

        'Uint8Array[0,255,-1,256]',

        'Uint8ClampedArray[0,255,-1,256]',

        'Int16Array[-32768,32767,-32769,32768]',

        'Uint16Array[0,65535,-1,65536]',

        'Int32Array[-2147483648,2147483647,-2147483649,2147483648]',

        'Uint32Array[0,4294967295,-1,4294967296]',

        'Float32Array[-3.4028234663852886e38,3.4028234663852886e38,-3.5e38,3.5e38]',
        'Float32Array[NaN,Infinity,-Infinity,1.2e-38]',

        'Float64Array[-1.7976931348623157e308,1.7976931348623157e308,-1.8e308,1.8e308]',
        'Float64Array[5e-324]',

        'BigInt64Array[-9223372036854775808n,9223372036854775807n]',
        'BigInt64Array[-9223372036854775809n,9223372036854775808n]',

        'BigUint64Array[0n,18446744073709551615n,18446744073709551616n]',
      ];

      for (let i = 0; i < typedArrayTests.length; i++) {
        const error = new LinkerAbstractMethodError(`TypedArray error: ${typedArrayTests[i]}`);
        expect(error.message).assertContain(typedArrayTests[i]);
      }
    });

    /**
     * @tc.name    builtinsLinkerAbstractMethodErrorTest0010
     * @tc.number  BUILTINS_LINKER_ABSTRACT_METHOD_ERROR_TEST_0010
     * @tc.desc    Test constructor with array string representations
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsLinkerAbstractMethodErrorTest0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arrayTests = [
        '[72,101,108,108,111,87,111,114,108,100,49,50,51,63]',

        '[72,101,108,108,111,87,111,114,108,0,0,0,0,0,100,49,50,51,63]',

        '[72,101,108,108,111,87,-111,114,108,100,-49,50,51,-63]',

        '[72,101,NaN,Infinity,-Infinity,108,111]',

        '[72,"abstract",true,null,undefined,108]',

        '[]',

        '[256,65536,32768,2147483648,4294967296]',

        '["method1", 123, true, null, undefined, {abstract: true}]',

        '[[1,2,3], [4,5,6], ["a","b","c"]]',

        '[{name: "abstractMethod1", params: [1,2,3]}, {name: "abstractMethod2", params: []}]',
      ];

      for (let i = 0; i < arrayTests.length; i++) {
        const error = new LinkerAbstractMethodError(`Array error: ${arrayTests[i]}`);
        expect(error.message).assertContain(arrayTests[i]);
      }
    });

    /**
     * @tc.name    builtinsLinkerAbstractMethodErrorTest0011
     * @tc.number  BUILTINS_LINKER_ABSTRACT_METHOD_ERROR_TEST_0011
     * @tc.desc    Test constructor with boolean and falsy values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsLinkerAbstractMethodErrorTest0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
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
        '!"abstract"',

        'true == true',
        'false == false',
        'null == undefined',
        '0 == false',
        '"" == false',
      ];

      for (let i = 0; i < booleanTests.length; i++) {
        const error = new LinkerAbstractMethodError(`Boolean check: ${booleanTests[i]}`);
        expect(error.message).assertContain(booleanTests[i]);
      }

      const error1 = new LinkerAbstractMethodError('');
      expect(error1.message).assertEqual('');

      const error2 = new LinkerAbstractMethodError(undefined);
      expect(error2.message).assertEqual('');

      const error3 = new LinkerAbstractMethodError('true');
      expect(error3.message).assertEqual('true');

      const error4 = new LinkerAbstractMethodError('false');
      expect(error4.message).assertEqual('false');
    });

    /**
     * @tc.name    builtinsLinkerAbstractMethodErrorTest0012
     * @tc.number  BUILTINS_LINKER_ABSTRACT_METHOD_ERROR_TEST_0012
     * @tc.desc    Test constructor with object string representations
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsLinkerAbstractMethodErrorTest0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const objectTests = [

        '{name: "abstractMethod", implemented: false}',

        '{error: {type: "AbstractMethodError", message: "Method not implemented"}}',

        '{abstract: undefined, implemented: false}',
        '{abstract: null, implemented: false}',
        '{abstract: NaN, implemented: false}',
        '{abstract: Infinity, implemented: false}',

        '{}',

        '{methods: [{name: "method1", abstract: true}, {name: "method2", abstract: false}]}',

        '{data: Uint8Array[72,101,108,108,111], type: "buffer"}',

        '{abstractMethods: ["method1", "method2", "method3"], count: 3}',

        '{class: {name: "AbstractClass", methods: {abstract: ["method1", "method2"], concrete: ["method3"]}}}',
      ];

      for (let i = 0; i < objectTests.length; i++) {
        const error = new LinkerAbstractMethodError(`Object error: ${objectTests[i]}`);
        expect(error.message).assertContain(objectTests[i]);
      }
    });

    /**
     * @tc.name    builtinsLinkerAbstractMethodErrorTest0013
     * @tc.number  BUILTINS_LINKER_ABSTRACT_METHOD_ERROR_TEST_0013
     * @tc.desc    Test constructor with various string formats and patterns
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsLinkerAbstractMethodErrorTest0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const stringTests = [
        'abstract'.repeat(30),

        'AbstractMethod_测试_123_😀_!@#$%_',

        'abstract\tmethod\twith\ttabs',
        'abstract method with spaces',
        '  abstract with leading spaces',
        'abstract with trailing spaces  ',

        'abstract\nmethod\nwith\nnewlines',
        'abstract\r\nmethod\r\nwith\r\nCRLF',
        'abstract\n\nmethod\n\nwith\n\nmultiple\n\nnewlines',

        'a',
        'ab',
        'abc',
        ' ',
        '\t',
        '\n',
        '\r',
        '\u0000',
        '\u0020',
        '\u007F',
        '\u00A0',
        '\u2028',
        '\u2029',

        'AbstractMethodError: Method must be implemented in derived class',
        'Error in abstract class: Missing implementation',
        'Cannot instantiate abstract class without implementing all abstract methods',
      ];

      for (let i = 0; i < stringTests.length; i++) {
        const error = new LinkerAbstractMethodError(stringTests[i]);
        expect(error.message).assertEqual(stringTests[i]);
      }
    });

    /**
     * @tc.name    builtinsLinkerAbstractMethodErrorTest0014
     * @tc.number  BUILTINS_LINKER_ABSTRACT_METHOD_ERROR_TEST_0014
     * @tc.desc    Test error properties, inheritance and methods
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsLinkerAbstractMethodErrorTest0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const error = new LinkerAbstractMethodError('Abstract method must be implemented');

      expect(error.name).assertEqual('LinkerAbstractMethodError');
      expect(error.message).assertEqual('Abstract method must be implemented');

      expect(error instanceof Error).assertTrue();

      expect(typeof error.stack === 'string').assertTrue();
      expect(error.stack).assertContain('LinkerAbstractMethodError');

      const errorString = error.toString();
      expect(errorString).assertContain('LinkerAbstractMethodError');
      expect(errorString).assertContain('Abstract method must be implemented');

      const error2 = new LinkerAbstractMethodError('Another abstract error');
      expect(error2.name).assertEqual('LinkerAbstractMethodError');
      expect(error2.message).assertEqual('Another abstract error');

      const innerError = new Error('Inner error');
      const options: ErrorOptions = { cause: innerError };
      const chainedError = new LinkerAbstractMethodError('Chained abstract error', options);

      expect(chainedError.cause).assertEqual(innerError);
      expect(chainedError.message).assertEqual('Chained abstract error');
    });

    /**
     * @tc.name    builtinsLinkerAbstractMethodErrorTest0015
     * @tc.number  BUILTINS_LINKER_ABSTRACT_METHOD_ERROR_TEST_0015
     * @tc.desc    Test constructor with complex error chains and edge cases
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsLinkerAbstractMethodErrorTest0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const level1Error = new Error('Level 1: Base error');
      const level2Error = new LinkerAbstractMethodError('Level 2: Abstract error', { cause: level1Error });
      const level3Error = new LinkerAbstractMethodError('Level 3: Outer abstract error', { cause: level2Error });

      expect(level3Error.cause).assertEqual(level2Error);
      expect(level2Error.cause).assertEqual(level1Error);
      expect(level3Error.message).assertEqual('Level 3: Outer abstract error');
      expect(level2Error.message).assertEqual('Level 2: Abstract error');
      expect(level1Error.message).assertEqual('Level 1: Base error');

      const circularRef = 'Circular reference in abstract methods';
      const errorWithCircular = new LinkerAbstractMethodError(circularRef);
      expect(errorWithCircular.message).assertEqual(circularRef);

      const errors = [
        new LinkerAbstractMethodError(),
        new LinkerAbstractMethodError(''),
        new LinkerAbstractMethodError('Simple error'),
        new LinkerAbstractMethodError('Error with cause', { cause: 'test cause' }),
        new LinkerAbstractMethodError('Long error message '.repeat(10)),
      ];

      expect(errors.length).assertEqual(5);
      expect(errors[0].message).assertEqual('');
      expect(errors[1].message).assertEqual('');
      expect(errors[2].message).assertEqual('Simple error');
      expect(errors[3].message).assertEqual('Error with cause');
      expect(errors[4].message.length).assertEqual(190);
    });

  })
}