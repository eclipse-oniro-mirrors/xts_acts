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

export default function builtinsLinkerUnresolvedClassErrorTest() {
  describe('builtinsLinkerUnresolvedClassErrorTest', () => {
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
     * @tc.name    builtinsLinkerUnresolvedClassErrorTest0001
     * @tc.number  BUILTINS_LINKER_UNRESOLVED_CLASS_ERROR_TEST_0001
     * @tc.desc    Test basic constructor with default parameters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsLinkerUnresolvedClassErrorTest0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const error1 = new LinkerUnresolvedClassError();
      expect(error1.name).assertEqual('LinkerUnresolvedClassError');
      expect(error1.message).assertEqual('');

      const error2 = new LinkerUnresolvedClassError('Class not found');
      expect(error2.name).assertEqual('LinkerUnresolvedClassError');
      expect(error2.message).assertEqual('Class not found');
    });

    /**
     * @tc.name    builtinsLinkerUnresolvedClassErrorTest0002
     * @tc.number  BUILTINS_LINKER_UNRESOLVED_CLASS_ERROR_TEST_0002
     * @tc.desc    Test constructor with String type boundary values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsLinkerUnresolvedClassErrorTest0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const error1 = new LinkerUnresolvedClassError('');
      expect(error1.message).assertEqual('');

      const error2 = new LinkerUnresolvedClassError(undefined);
      expect(error2.message).assertEqual('');

      const error3 = new LinkerUnresolvedClassError('   ');
      expect(error3.message).assertEqual('   ');

      const error4 = new LinkerUnresolvedClassError('\t');
      expect(error4.message).assertEqual('\t');
    });

    /**
     * @tc.name    builtinsLinkerUnresolvedClassErrorTest0003
     * @tc.number  BUILTINS_LINKER_UNRESOLVED_CLASS_ERROR_TEST_0003
     * @tc.desc    Test constructor with special characters in message
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsLinkerUnresolvedClassErrorTest0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const specialChars = '!"#$%&\'()*+,-./:;<=>?@[\\]^_`{|}~';
      const error1 = new LinkerUnresolvedClassError(specialChars);
      expect(error1.message).assertEqual(specialChars);

      const doubleSpecial = ' !!""##$$%%&&\'\'(())**++,,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~';
      const error2 = new LinkerUnresolvedClassError(doubleSpecial);
      expect(error2.message).assertEqual(doubleSpecial);

      const asciiChars = '!"#$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~';
      const error3 = new LinkerUnresolvedClassError(asciiChars);
      expect(error3.message).assertEqual(asciiChars);
    });

    /**
     * @tc.name    builtinsLinkerUnresolvedClassErrorTest0004
     * @tc.number  BUILTINS_LINKER_UNRESOLVED_CLASS_ERROR_TEST_0004
     * @tc.desc    Test constructor with escape sequences in message
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsLinkerUnresolvedClassErrorTest0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
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
        const error = new LinkerUnresolvedClassError(`Class error: ${escapeTests[i]}`);
        expect(error.message).assertContain(escapeTests[i]);
      }
    });

    /**
     * @tc.name    builtinsLinkerUnresolvedClassErrorTest0005
     * @tc.number  BUILTINS_LINKER_UNRESOLVED_CLASS_ERROR_TEST_0005
     * @tc.desc    Test constructor with Unicode and emoji in message
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsLinkerUnresolvedClassErrorTest0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const emojis = [
        '👆', '👿', '👀', '💯', '🎅', '😼', '🔧', '💇', '🤼‍♂️', '🛢', '🀄', '🏴'
      ];

      for (let i = 0; i < emojis.length; i++) {
        const error = new LinkerUnresolvedClassError(`Class ${emojis[i]} not resolved`);
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
        const error = new LinkerUnresolvedClassError(`Unicode class: ${unicodeTests[i]}`);
        expect(error.message).assertContain(unicodeTests[i]);
      }
    });

    /**
     * @tc.name    builtinsLinkerUnresolvedClassErrorTest0006
     * @tc.number  BUILTINS_LINKER_UNRESOLVED_CLASS_ERROR_TEST_0006
     * @tc.desc    Test constructor with invalid Unicode, keywords and edge cases
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsLinkerUnresolvedClassErrorTest0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const invalidUnicode = ['\\udc04', '\\ud83d', '\\udff4'];

      for (let i = 0; i < invalidUnicode.length; i++) {
        const error = new LinkerUnresolvedClassError(invalidUnicode[i]);
        expect(error.message).assertEqual(invalidUnicode[i]);
      }

      const keywords = ['0', 'NaN', 'Infinity', 'undefined', 'null', 'true', 'false', 'class', 'Class'];
      for (let i = 0; i < keywords.length; i++) {
        const error = new LinkerUnresolvedClassError(keywords[i]);
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
        '\u0001',
        '\u0007',
        '\u0008',
        '\u0009',
        '\u000A',
        '\u000D',
        '\u001B',
        '\u007F',
        '\u0080',
        '\u00A0',
        '\u2028',
        '\u2029',
        '\uFEFF',
      ];

      for (let i = 0; i < edgeCases.length; i++) {
        const error = new LinkerUnresolvedClassError(edgeCases[i]);
        expect(error.message).assertEqual(edgeCases[i]);
      }
    });

    /**
     * @tc.name    builtinsLinkerUnresolvedClassErrorTest0007
     * @tc.number  BUILTINS_LINKER_UNRESOLVED_CLASS_ERROR_TEST_0007
     * @tc.desc    Test constructor with options parameter
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsLinkerUnresolvedClassErrorTest0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const rootError = new Error('Root class resolution error');
      const options1: ErrorOptions = {
        cause: rootError
      };

      const error1 = new LinkerUnresolvedClassError('Class error with cause', options1);
      expect(error1.message).assertEqual('Class error with cause');
      expect(error1.cause).assertEqual(rootError);
      expect(error1.name).assertEqual('LinkerUnresolvedClassError');

      const error2 = new LinkerUnresolvedClassError('Test class error', {});
      expect(error2.message).assertEqual('Test class error');
      expect(error2.cause).assertUndefined();

      const error3 = new LinkerUnresolvedClassError('Test class error', undefined);
      expect(error3.message).assertEqual('Test class error');

      const options4: ErrorOptions = {
        cause: 'Class definition not found in module'
      };
      const error4 = new LinkerUnresolvedClassError('Error', options4);
      expect(error4.cause).assertEqual('Class definition not found in module');

      const innerError = new LinkerUnresolvedClassError('Inner class error');
      const options5: ErrorOptions = {
        cause: innerError
      };
      const outerError = new LinkerUnresolvedClassError('Outer class error', options5);
      expect(outerError.cause).assertEqual(innerError);

      const level1 = new Error('Level 1: Missing dependency');
      const level2 = new LinkerUnresolvedClassError('Level 2: Class not found', { cause: level1 });
      const level3 = new LinkerUnresolvedClassError('Level 3: Module load failed', { cause: level2 });
      expect(level3.cause).assertEqual(level2);
      expect(level2.cause).assertEqual(level1);
    });

    /**
     * @tc.name    builtinsLinkerUnresolvedClassErrorTest0008
     * @tc.number  BUILTINS_LINKER_UNRESOLVED_CLASS_ERROR_TEST_0008
     * @tc.desc    Test constructor with numeric string values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsLinkerUnresolvedClassErrorTest0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
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

        '1.40129846432481707e-45',
        '3.40282346638528860e+38',
        '-1.40129846432481707e-45',
        '-3.40282346638528860e+38',

        '4.94065645841246544e-324',
        '1.79769313486231570e+308',

        '123.456',
        '0xdecafafecacefade',
        '0xcafebabe',
        '0x0102',
        '0x01020304',
        '0o377',
        '0o3',
        '1e3',
        '2.5e-2',
        '2**3',
      ];

      for (let i = 0; i < numberTests.length; i++) {
        const error = new LinkerUnresolvedClassError(`Error code: ${numberTests[i]}`);
        expect(error.message).assertContain(numberTests[i]);
      }

      for (let i = 0; i < numberTests.length; i++) {
        const error = new LinkerUnresolvedClassError(numberTests[i]);
        expect(error.message).assertEqual(numberTests[i]);
      }
    });

    /**
     * @tc.name    builtinsLinkerUnresolvedClassErrorTest0009
     * @tc.number  BUILTINS_LINKER_UNRESOLVED_CLASS_ERROR_TEST_0009
     * @tc.desc    Test constructor with TypedArray string representations
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsLinkerUnresolvedClassErrorTest0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const typedArrayTests = [
        'Int8Array[-128,-127,0,126,127]',
        'Int8Array[-129,128]',

        'Uint8Array[0,1,254,255]',
        'Uint8Array[-1,256]',

        'Uint8ClampedArray[0,128,255]',
        'Uint8ClampedArray[-1,256]',

        'Int16Array[-32768,-32767,0,32766,32767]',
        'Int16Array[-32769,32768]',

        'Uint16Array[0,32768,65535]',
        'Uint16Array[-1,65536]',

        'Int32Array[-2147483648,0,2147483647]',
        'Int32Array[-2147483649,2147483648]',

        'Uint32Array[0,2147483648,4294967295]',
        'Uint32Array[-1,4294967296]',

        'Float32Array[-3.4028234663852886e38,0,3.4028234663852886e38]',
        'Float32Array[-3.5e38,3.5e38,NaN,Infinity,-Infinity]',
        'Float32Array[1.2e-38]',

        'Float64Array[-1.7976931348623157e308,0,1.7976931348623157e308]',
        'Float64Array[-1.8e308,1.8e308]',
        'Float64Array[5e-324]',

        'BigInt64Array[-9223372036854775808n,0n,9223372036854775807n]',
        'BigInt64Array[-9223372036854775809n,9223372036854775808n]',

        'BigUint64Array[0n,9223372036854775808n,18446744073709551615n]',
        'BigUint64Array[18446744073709551616n]',
      ];

      for (let i = 0; i < typedArrayTests.length; i++) {
        const error = new LinkerUnresolvedClassError(`Data error: ${typedArrayTests[i]}`);
        expect(error.message).assertContain(typedArrayTests[i]);
      }
    });

    /**
     * @tc.name    builtinsLinkerUnresolvedClassErrorTest0010
     * @tc.number  BUILTINS_LINKER_UNRESOLVED_CLASS_ERROR_TEST_0010
     * @tc.desc    Test constructor with array string representations
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsLinkerUnresolvedClassErrorTest0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arrayTests = [
        '[72,101,108,108,111,87,111,114,108,100,49,50,51,63]',

        '[72,101,108,108,111,87,111,114,108,0,0,0,0,0,100,49,50,51,63]',

        '[72,101,108,108,111,87,-111,114,108,100,-49,50,51,-63]',

        '[72,101,NaN,Infinity,-Infinity,108,111]',

        '[72,"class",true,null,undefined,108]',

        '[]',

        '[256,65536,32768,2147483648,4294967296]',

        '["ClassName1", 1001, true, null, undefined, {class: "Test"}]',

        '[["ClassA","ClassB"], [1001,1002], [true,false]]',

        '[{className: "TestClass1", methods: ["method1","method2"]}, {className: "TestClass2", methods: []}]',

        '["MyClass","YourClass","OurClass","TestClass","ExampleClass"]',
      ];

      for (let i = 0; i < arrayTests.length; i++) {
        const error = new LinkerUnresolvedClassError(`Array data: ${arrayTests[i]}`);
        expect(error.message).assertContain(arrayTests[i]);
      }
    });

    /**
     * @tc.name    builtinsLinkerUnresolvedClassErrorTest0011
     * @tc.number  BUILTINS_LINKER_UNRESOLVED_CLASS_ERROR_TEST_0011
     * @tc.desc    Test constructor with boolean and falsy values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsLinkerUnresolvedClassErrorTest0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
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
        '!"class"',
        '!""',

        'true == true',
        'false == false',
        'null == undefined',
        '0 == false',
        '"" == false',
        'NaN == NaN',
      ];

      for (let i = 0; i < booleanTests.length; i++) {
        const error = new LinkerUnresolvedClassError(`Boolean: ${booleanTests[i]}`);
        expect(error.message).assertContain(booleanTests[i]);
      }

      const error1 = new LinkerUnresolvedClassError('');
      expect(error1.message).assertEqual('');

      const error2 = new LinkerUnresolvedClassError(undefined);
      expect(error2.message).assertEqual('');

      const falsyStrings = ['0', 'NaN', 'null', 'undefined', 'false'];
      for (let i = 0; i < falsyStrings.length; i++) {
        const error = new LinkerUnresolvedClassError(falsyStrings[i]);
        expect(error.message).assertEqual(falsyStrings[i]);
      }
    });

    /**
     * @tc.name    builtinsLinkerUnresolvedClassErrorTest0012
     * @tc.number  BUILTINS_LINKER_UNRESOLVED_CLASS_ERROR_TEST_0012
     * @tc.desc    Test constructor with object string representations
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsLinkerUnresolvedClassErrorTest0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const objectTests = [
        '{className: "MyClass", resolved: false}',

        '{error: {type: "LinkerUnresolvedClassError", message: "Class not found"}}',

        '{class: undefined, resolved: false}',
        '{class: null, resolved: false}',
        '{class: NaN, resolved: false}',
        '{class: Infinity, resolved: false}',

        '{}',

        '{name: "TestClass", methods: ["method1","method2"], properties: ["prop1","prop2"]}',

        '{classData: Uint8Array[67,108,97,115,115], type: "bytecode"}',

        '{classes: ["ClassA","ClassB","ClassC"], unresolved: ["ClassD"]}',

        '{module: {name: "MyModule", classes: {resolved: ["Class1","Class2"], unresolved: ["Class3","Class4"]}}}',

        '{classDef: {name: "ComplexClass", extends: "BaseClass", implements: ["Interface1","Interface2"], methods: [{name: "method1", abstract: true}, {name: "method2", abstract: false}]}}',
      ];

      for (let i = 0; i < objectTests.length; i++) {
        const error = new LinkerUnresolvedClassError(`Object: ${objectTests[i]}`);
        expect(error.message).assertContain(objectTests[i]);
      }
    });

    /**
     * @tc.name    builtinsLinkerUnresolvedClassErrorTest0013
     * @tc.number  BUILTINS_LINKER_UNRESOLVED_CLASS_ERROR_TEST_0013
     * @tc.desc    Test constructor with various string formats and patterns
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsLinkerUnresolvedClassErrorTest0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const stringTests = [
        'Class'.repeat(50),
        'ClassName'.repeat(30),

        'ClassName_123_😀_!@#$%_MyClass',
        'TestClass-Example-V1.0.0',
        'com.example.package.ClassName',

        'class\tname\twith\ttabs',
        'class name with spaces',
        '  class with leading spaces',
        'class with trailing spaces  ',
        'class\t with\t mixed\t spaces\t',

        'class\nname\nwith\nnewlines',
        'class\r\nname\r\nwith\r\nCRLF',
        'class\n\nname\n\nwith\n\nmultiple\n\nnewlines',

        'C',
        'CL',
        'Cls',
        ' ',
        '\t',
        '\n',
        '\r',
        '\u0000',
        '\u0001\u0002\u0003',

        'LinkerUnresolvedClassError: Class "com.example.MyClass" not found',
        'Error: Unable to resolve class reference: MyNamespace.MyClass',
        'Class resolution failed for: TestClass<GenericType>',
        'Cannot find class: com/example/package/ClassName',

        './path/to/class',
        '../relative/path/Class',
        '/absolute/path/to/Class',
        'C:\\Windows\\Path\\To\\Class',
      ];

      for (let i = 0; i < stringTests.length; i++) {
        const error = new LinkerUnresolvedClassError(stringTests[i]);
        expect(error.message).assertEqual(stringTests[i]);
      }
    });

    /**
     * @tc.name    builtinsLinkerUnresolvedClassErrorTest0014
     * @tc.number  BUILTINS_LINKER_UNRESOLVED_CLASS_ERROR_TEST_0014
     * @tc.desc    Test constructor with complex error chains and patterns
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsLinkerUnresolvedClassErrorTest0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const level1Error = new Error('Level 1: Missing module');
      const level2Error = new LinkerUnresolvedClassError('Level 2: Class not found', { cause: level1Error });
      const level3Error = new LinkerUnresolvedClassError('Level 3: Import failed', { cause: level2Error });
      const level4Error = new LinkerUnresolvedClassError('Level 4: Application error', { cause: level3Error });

      expect(level4Error.cause).assertEqual(level3Error);
      expect(level3Error.cause).assertEqual(level2Error);
      expect(level2Error.cause).assertEqual(level1Error);

      const genericError = new Error('Generic error');
      const classError1 = new LinkerUnresolvedClassError('Class error 1', { cause: genericError });
      const classError2 = new LinkerUnresolvedClassError('Class error 2', { cause: classError1 });

      expect(classError2.cause).assertEqual(classError1);
      expect(classError1.cause).assertEqual(genericError);

      const errors: Error[] = [
        new LinkerUnresolvedClassError(),
        new LinkerUnresolvedClassError(''),
        new LinkerUnresolvedClassError('Simple class error'),
        new LinkerUnresolvedClassError('Error with cause'),
        new LinkerUnresolvedClassError('Error with object cause'),
        new LinkerUnresolvedClassError('Long error '.repeat(20)),
        new LinkerUnresolvedClassError('Multiline\nerror\nmessage'),
        new LinkerUnresolvedClassError('Error\twith\ttabs'),
      ];

      const error0 = errors[0];
      const error1 = errors[1];
      const error2 = errors[2];
      const error3 = errors[3];
      const error5 = errors[5];

      expect(errors.length).assertEqual(8);
      expect(error0.message).assertEqual('');
      expect(error1.message).assertEqual('');
      expect(error2.message).assertEqual('Simple class error');
      expect(error3.message).assertEqual('Error with cause');
      expect(error5.message.length).assertEqual(220);
    });

    /**
     * @tc.name    builtinsLinkerUnresolvedClassErrorTest0015
     * @tc.number  BUILTINS_LINKER_UNRESOLVED_CLASS_ERROR_TEST_0015
     * @tc.desc    Test constructor performance, batch creation and edge cases
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsLinkerUnresolvedClassErrorTest0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {

      const batchSize = 100;
      const batchErrors: LinkerUnresolvedClassError[] = [];

      for (let i = 0; i < batchSize; i++) {
        batchErrors.push(new LinkerUnresolvedClassError(`Class error ${i} of ${batchSize}`));
      }

      expect(batchErrors.length).assertEqual(batchSize);

      for (let i = 0; i < batchErrors.length; i++) {
        const error = batchErrors[i];
        expect(error.name).assertEqual('LinkerUnresolvedClassError');
        expect(error.message).assertEqual(`Class error ${i} of ${batchSize}`);
        expect(error instanceof Error).assertTrue();
      }

      const largeMessage = 'x'.repeat(5000);
      const largeError = new LinkerUnresolvedClassError(largeMessage);
      expect(largeError.message.length).assertEqual(5000);
      expect(largeError.message).assertEqual(largeMessage);

      const mixedMessages = [
        'Simple error',
        'Error with number 123',
        'Error with float 123.456',
        'Error with scientific 1.23e4',
        'Error with hex 0xAB',
        'Error with emoji 👆🎅💯',
        'Error with unicode \\u0041\\u0042\\u0043',
        'Error with special chars !@#$%^&*()',
        'Error with newline\ntab\tcarriage return\r',
      ];

      for (let i = 0; i < mixedMessages.length; i++) {
        const error = new LinkerUnresolvedClassError(mixedMessages[i]);
        expect(error.message).assertEqual(mixedMessages[i]);
      }

      const sameMessage = 'Duplicate class error';
      const error1 = new LinkerUnresolvedClassError(sameMessage);
      const error2 = new LinkerUnresolvedClassError(sameMessage);
      const error3 = new LinkerUnresolvedClassError(sameMessage);

      expect(error1.message).assertEqual(sameMessage);
      expect(error2.message).assertEqual(sameMessage);
      expect(error3.message).assertEqual(sameMessage);
      expect(error1 !== error2).assertTrue();
      expect(error2 !== error3).assertTrue();
    });

  })
}
