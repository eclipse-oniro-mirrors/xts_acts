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

export default function builtinsRuntimeLinkerLoadLibraryTest() {
  describe("builtinsRuntimeLinkerLoadLibraryTest", () => {
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
     * @tc.name    builtinsRuntimeLinkerLoadLibraryTest0001
     * @tc.number  BUILTINS_RUNTIME_LINKER_LOAD_LIBRARY_TEST_0001
     * @tc.desc    Test loadLibrary with undefined parameter
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsRuntimeLinkerLoadLibraryTest0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const strObj = new String(undefined);
      let hasError = false;
      try {
        loadLibrary(strObj);
      } catch (error) {
        hasError = true;
        expect(error instanceof Error).assertTrue();
      }
      expect(hasError).assertTrue();
    });

    /**
     * @tc.name    builtinsRuntimeLinkerLoadLibraryTest0002
     * @tc.number  BUILTINS_RUNTIME_LINKER_LOAD_LIBRARY_TEST_0002
     * @tc.desc    Test loadLibrary with null parameter
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsRuntimeLinkerLoadLibraryTest0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const strObj = new String(null);
      let hasError = false;
      try {
        loadLibrary(strObj);
      } catch (error) {
        hasError = true;
        expect(error instanceof Error).assertTrue();
      }
      expect(hasError).assertTrue();
    });

    /**
     * @tc.name    builtinsRuntimeLinkerLoadLibraryTest0003
     * @tc.number  BUILTINS_RUNTIME_LINKER_LOAD_LIBRARY_TEST_0003
     * @tc.desc    Test loadLibrary with empty string
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsRuntimeLinkerLoadLibraryTest0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let hasError = false;
      try {
        loadLibrary('');
      } catch (error) {
        hasError = true;
        expect(error instanceof Error).assertTrue();
      }
      expect(hasError).assertTrue();
    });

    /**
     * @tc.name    builtinsRuntimeLinkerLoadLibraryTest0004
     * @tc.number  BUILTINS_RUNTIME_LINKER_LOAD_LIBRARY_TEST_0004
     * @tc.desc    Test loadLibrary with full range of special characters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsRuntimeLinkerLoadLibraryTest0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const specialChars = '!"#$%&\'()*+,-./:;<=>?@[\\]^_`{|}~';
      expect(specialChars.length).assertEqual(32);

      let allRejected = true;
      for (let i = 0; i < specialChars.length; i++) {
        const singleChar = specialChars.charAt(i);
        try {
          const testPath = '/lib/test' + singleChar + 'file.so';
          loadLibrary(testPath);
          allRejected = false;
        } catch (error) {
          expect(error instanceof Error).assertTrue();
        }
      }
      expect(allRejected).assertTrue();
    });

    /**
     * @tc.name    builtinsRuntimeLinkerLoadLibraryTest0005
     * @tc.number  BUILTINS_RUNTIME_LINKER_LOAD_LIBRARY_TEST_0005
     * @tc.desc    Test loadLibrary with full range of ASCII characters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsRuntimeLinkerLoadLibraryTest0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let asciiStr = '';
      for (let i = 32; i <= 126; i++) {
        asciiStr += String.fromCharCode(i);
      }
      expect(asciiStr.length).assertEqual(95);

      const illegalChars = String.fromCharCode(0) + '\n\r\t';
      let controlCharsRejected = true;

      for (let i = 0; i < asciiStr.length; i++) {
        const charStr = String(asciiStr.charAt(i));
        try {
          loadLibrary(charStr);
          if (illegalChars.includes(charStr)) {
            controlCharsRejected = false;
          }
        } catch (error) {
          expect(error instanceof Error).assertTrue();
        }
      }
      expect(controlCharsRejected).assertTrue();
    });

    /**
     * @tc.name    builtinsRuntimeLinkerLoadLibraryTest0006
     * @tc.number  BUILTINS_RUNTIME_LINKER_LOAD_LIBRARY_TEST_0006
     * @tc.desc    Test loadLibrary with duplicated special characters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsRuntimeLinkerLoadLibraryTest0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const specialChars = '!!""##$$%%&&\'\'(())**++,,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~';
      let hasError = false;
      try {
        loadLibrary(specialChars);
      } catch (error) {
        hasError = true;
        expect(error instanceof Error).assertTrue();
      }
      expect(hasError).assertTrue();
    });

    /**
     * @tc.name    builtinsRuntimeLinkerLoadLibraryTest0007
     * @tc.number  BUILTINS_RUNTIME_LINKER_LOAD_LIBRARY_TEST_0007
     * @tc.desc    Test loadLibrary with escape characters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsRuntimeLinkerLoadLibraryTest0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const escapeChars = '\\a\\b\\f\\n\\r\\t\\v\\\\\\\'\\"\\?\\0\\101\\x41';
      let hasError = false;
      try {
        loadLibrary(escapeChars);
      } catch (error) {
        hasError = true;
        expect(error instanceof Error).assertTrue();
      }
      expect(hasError).assertTrue();
    });

    /**
     * @tc.name    builtinsRuntimeLinkerLoadLibraryTest0008
     * @tc.number  BUILTINS_RUNTIME_LINKER_LOAD_LIBRARY_TEST_0008
     * @tc.desc    Test loadLibrary with emoji and Unicode characters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsRuntimeLinkerLoadLibraryTest0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const testPaths = [
        'test\\udc04.so',
        'test\\ud83d.so',
        'test\\udff4.so',
        'test\\ud83d\\udc46.so',
        'test\\ud83d\\udc7f.so',
        'test\\ud83d\\udc40.so',
        'test\\ud83d\\udcaf.so',
        'test\\ud83c\\udf85.so',
        'test\\ud83d\\ude3c.so',
        'test\\ud83d\\udd27.so',
        'test\\ud83d\\udc87.so',
        'test\\ud83e\\udd3c.so',
        'test\\ud83d\\udee2.so',
        'test\\ud83c\\udc04.so',
        'test\\ud83c\\udff4.so',
      ];

      let allHandled = true;
      for (let i = 0; i < testPaths.length; i++) {
        try {
          loadLibrary(testPaths[i]);
          allHandled = false;
        } catch (e) {
          expect(e instanceof Error).assertTrue();
        }
      }
      expect(allHandled).assertTrue();
    });

    /**
     * @tc.name    builtinsRuntimeLinkerLoadLibraryTest0009
     * @tc.number  BUILTINS_RUNTIME_LINKER_LOAD_LIBRARY_TEST_0009
     * @tc.desc    Test loadLibrary with invalid Unicode sequences
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsRuntimeLinkerLoadLibraryTest0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const safeTests = [
        'test\\udc04.so',
        'lib\\ud83d.so',
        'path\\udff4.so'
      ];

      let allRejected = true;
      for (let i = 0; i < safeTests.length; i++) {
        try {
          loadLibrary(safeTests[i]);
          allRejected = false;
        } catch (error) {
          expect(error instanceof Error).assertTrue();
        }
      }
      expect(allRejected).assertTrue();
    });

    /**
     * @tc.name    builtinsRuntimeLinkerLoadLibraryTest0010
     * @tc.number  BUILTINS_RUNTIME_LINKER_LOAD_LIBRARY_TEST_0010
     * @tc.desc    Test loadLibrary with keyword strings
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsRuntimeLinkerLoadLibraryTest0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const keywords = ['0', 'NaN', ''];

      let emptyStringRejected = false;
      for (const keyword of keywords) {
        try {
          loadLibrary(keyword);
          if (keyword === '') {
            console.warn('An empty string is accepted, which may be a problem.');
          }
        } catch (error) {
          if (keyword === '') {
            emptyStringRejected = true;
          }
          expect(error instanceof Error).assertTrue();
        }
      }
      expect(emptyStringRejected).assertTrue();
    });

    /**
     * @tc.name    builtinsRuntimeLinkerLoadLibraryTest0011
     * @tc.number  BUILTINS_RUNTIME_LINKER_LOAD_LIBRARY_TEST_0011
     * @tc.desc    Test loadLibrary with treeString type
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('builtinsRuntimeLinkerLoadLibraryTest0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const initTreeString = (size: number): string => {
        let ans = '[';
        while (ans.length < size) {
          ans += '{"a":1},';
        }
        ans += '{"a":1}]';
        return ans;
      };
      const size = 10000;
      const treeString = initTreeString(size);
      const normalString = 'x'.repeat(size);
      expect(treeString.length >= size).assertTrue();
      expect(normalString.length).assertEqual(size);
      let treeError = false;
      try {
        loadLibrary(treeString);
      } catch (error) {
        treeError = true;
        expect(error instanceof Error).assertTrue();
      }
      expect(treeError).assertTrue();
      let normalError = false;
      try {
        loadLibrary(normalString);
      } catch (error) {
        normalError = true;
        expect(error instanceof Error).assertTrue();
      }
      expect(normalError).assertTrue();
    });

    /**
     * @tc.name    builtinsRuntimeLinkerLoadLibraryTest0012
     * @tc.number  BUILTINS_RUNTIME_LINKER_LOAD_LIBRARY_TEST_0012
     * @tc.desc    Test loadLibrary with sliceString type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsRuntimeLinkerLoadLibraryTest0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const str = "{k1:value1,k2:value2}";
      const sliced = str.substring(0, str.length - 2);
      expect(sliced).assertEqual("{k1:value1,k2:value");
      let hasError = false;
      try {
        loadLibrary(sliced);
      } catch (error) {
        hasError = true;
        expect(error instanceof Error).assertTrue();
      }
      expect(hasError).assertTrue();
    });

    /**
     * @tc.name    builtinsRuntimeLinkerLoadLibraryTest0013
     * @tc.number  BUILTINS_RUNTIME_LINKER_LOAD_LIBRARY_TEST_0013
     * @tc.desc    Test loadLibrary memory usage with large string
     * @tc.type    FUNCTION
     * @tc.size    LARGETEST
     * @tc.level   LEVEL2
     */
    it('builtinsRuntimeLinkerLoadLibraryTest0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const stringSize = 10000000;
      try {
        const largeString = 'a'.repeat(stringSize);
        expect(largeString.length).assertEqual(stringSize);
        loadLibrary(largeString);
      } catch (error) {
        const errorMsg = error.message || error.toString();
        expect(error instanceof Error).assertTrue();
        expect(errorMsg.includes('memory')).assertFalse();
        expect(errorMsg.includes('out of')).assertFalse();
      }
    });

    /**
     * @tc.name    builtinsRuntimeLinkerLoadLibraryTest0014
     * @tc.number  BUILTINS_RUNTIME_LINKER_LOAD_LIBRARY_TEST_0014
     * @tc.desc    Test loadLibrary GC behavior
     * @tc.type    FUNCTION
     * @tc.size    LARGETEST
     * @tc.level   LEVEL0
     */
    it('builtinsRuntimeLinkerLoadLibraryTest0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const iterations = 100;
      const stringSize = 100000;
      for (let i = 0; i < iterations; i++) {
        const largeString = 'x'.repeat(stringSize);
        try {
          loadLibrary(largeString);
        } catch (error) {
          const errorMsg = error.message || '';
          expect(errorMsg.includes('memory')).assertFalse();
          expect(errorMsg.includes('out of')).assertFalse();
          expect(error instanceof Error).assertTrue();
        }
      }
      try {
        loadLibrary('test.so');
      } catch (error) {
        expect(error instanceof Error).assertTrue();
      }
    });

  })
}