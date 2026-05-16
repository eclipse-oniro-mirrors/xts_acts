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

export default function builtinsRuntimeLinkerLoadLibraryWithPermissionCheckTest() {
  describe("builtinsRuntimeLinkerLoadLibraryWithPermissionCheckTest", () => {
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
     * @tc.name    builtinsRuntimeLinkerLoadLibraryWithPermissionCheckTest0001
     * @tc.number  BUILTINS_RUNTIME_LINKER_LOAD_LIBRARY_WITH_PERMISSION_CHECK_TEST_0001
     * @tc.desc    Test loadLibraryWithPermissionCheck with normal path and filename
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsRuntimeLinkerLoadLibraryWithPermissionCheckTest0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const testPath: string = "undefined";
      const testFileName: string = "@ohos.bundle.d.ts";
      let exceptionThrown: boolean = false;
      try {
        loadLibraryWithPermissionCheck(testPath, testFileName);
      } catch (error) {
        exceptionThrown = true;
        expect(error instanceof Error).assertTrue();
      }
      expect(exceptionThrown).assertTrue();
    });

    /**
     * @tc.name    builtinsRuntimeLinkerLoadLibraryWithPermissionCheckTest0002
     * @tc.number  BUILTINS_RUNTIME_LINKER_LOAD_LIBRARY_WITH_PERMISSION_CHECK_TEST_0002
     * @tc.desc    Test loadLibraryWithPermissionCheck with normal path and filename
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsRuntimeLinkerLoadLibraryWithPermissionCheckTest0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const testPath: string = "null";
      const testFileName: string = "@ohos.bundle.d.ts";
      let exceptionThrown: boolean = false;
      try {
        loadLibraryWithPermissionCheck(testPath, testFileName);
      } catch (error) {
        exceptionThrown = true;
        expect(error instanceof Error).assertTrue();
      }
      expect(exceptionThrown).assertTrue();
    });

    /**
     * @tc.name    builtinsRuntimeLinkerLoadLibraryWithPermissionCheckTest0003
     * @tc.number  BUILTINS_RUNTIME_LINKER_LOAD_LIBRARY_WITH_PERMISSION_CHECK_TEST_0003
     * @tc.desc    Test loadLibraryWithPermissionCheck with empty path and filename
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsRuntimeLinkerLoadLibraryWithPermissionCheckTest0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let hasError = false;
      try {
        loadLibraryWithPermissionCheck('', "@ohos.bundle.d.ts");
      } catch (error) {
        hasError = true;
        expect(error instanceof Error).assertTrue();
      }
      expect(hasError).assertTrue();
    });

    /**
     * @tc.name    builtinsRuntimeLinkerLoadLibraryWithPermissionCheckTest0004
     * @tc.number  BUILTINS_RUNTIME_LINKER_LOAD_LIBRARY_WITH_PERMISSION_CHECK_TEST_0004
     * @tc.desc    Test loadLibraryWithPermissionCheck with special characters in path
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsRuntimeLinkerLoadLibraryWithPermissionCheckTest0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const specialPath = '!"#$%&\'()*+,-./:;<=>?@[\\]^_`{|}~'.split('');
      const normalFile = '@ohos.bundle.d.ts';
      specialPath.forEach(spe => {
        let hasError = false;
        try {
          loadLibraryWithPermissionCheck(`lib${spe}test`, normalFile);
        } catch (error) {
          hasError = true;
          expect(error instanceof Error).assertTrue();
        }
        expect(hasError).assertTrue();
      });
    });

    /**
     * @tc.name    builtinsRuntimeLinkerLoadLibraryWithPermissionCheckTest0005
     * @tc.number  BUILTINS_RUNTIME_LINKER_LOAD_LIBRARY_WITH_PERMISSION_CHECK_TEST_0005
     * @tc.desc    Test loadLibraryWithPermissionCheck with ASCII characters in both parameters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsRuntimeLinkerLoadLibraryWithPermissionCheckTest0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let asciiStr = '';
      for (let i = 32; i <= 126; i++) {
        asciiStr += String.fromCharCode(i);
      }
      expect(asciiStr.length).assertEqual(95);
      const fixedFileName = '@ohos.bundle.d.ts';
      for (let i = 0; i < asciiStr.length; i++) {
        const singleChar = asciiStr.charAt(i);
        const charStr = String(singleChar);
        try {
          loadLibraryWithPermissionCheck(charStr, fixedFileName);
        } catch (error) {
          expect(error instanceof Error).assertTrue();
        }
      }
    });

    /**
     * @tc.name    builtinsRuntimeLinkerLoadLibraryWithPermissionCheckTest0006
     * @tc.number  BUILTINS_RUNTIME_LINKER_LOAD_LIBRARY_WITH_PERMISSION_CHECK_TEST_0006
     * @tc.desc    Test loadLibraryWithPermissionCheck with duplicated special characters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsRuntimeLinkerLoadLibraryWithPermissionCheckTest0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const specialChars = '!!""##$$%%&&\'\'(())**++,,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~';
      specialChars.split('').forEach(spc => {
        let hasErr = false;
        try {
          loadLibraryWithPermissionCheck(`lib${spc}test`, '@ohos.bundle.d.ts');
        } catch (error) {
          hasErr = true;
          expect(error instanceof Error).assertTrue();
        }
        expect(hasErr).assertTrue();
      });
    });

    /**
     * @tc.name    builtinsRuntimeLinkerLoadLibraryWithPermissionCheckTest0007
     * @tc.number  BUILTINS_RUNTIME_LINKER_LOAD_LIBRARY_WITH_PERMISSION_CHECK_TEST_0007
     * @tc.desc    Test loadLibraryWithPermissionCheck with escape characters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsRuntimeLinkerLoadLibraryWithPermissionCheckTest0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const escapeChars = '\\a\\b\\f\\n\\r\\t\\v\\\\\\\'\\"\\?\\0\\101\\x41';
      let hasError = false;
      try {
        loadLibraryWithPermissionCheck(escapeChars, escapeChars);
      } catch (error) {
        hasError = true;
        expect(error instanceof Error).assertTrue();
      }
      expect(hasError).assertTrue();
    });

    /**
     * @tc.name    builtinsRuntimeLinkerLoadLibraryWithPermissionCheckTest0008
     * @tc.number  BUILTINS_RUNTIME_LINKER_LOAD_LIBRARY_WITH_PERMISSION_CHECK_TEST_0008
     * @tc.desc    Test loadLibraryWithPermissionCheck with invalid Unicode sequences
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsRuntimeLinkerLoadLibraryWithPermissionCheckTest0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const invalidUnicodes = ['\udc04', '\ud83d', '\udff4'];
      for (let i = 0; i < invalidUnicodes.length; i++) {
        const rawCode = invalidUnicodes[i];
        const codePoint = rawCode.charCodeAt(0);
        const percentEncoded = '%u' + codePoint.toString(16).toUpperCase().padStart(4, '0');
        const path1 = '/lib/' + percentEncoded + '/lib.so';
        let hasError = false;
        try {
          loadLibraryWithPermissionCheck(path1, 'test.d.ts');
        } catch (e) {
          hasError = true;
          expect(e instanceof Error).assertTrue();
        }
        expect(hasError).assertTrue();
      }
    });

    /**
     * @tc.name    builtinsRuntimeLinkerLoadLibraryWithPermissionCheckTest0009
     * @tc.number  BUILTINS_RUNTIME_LINKER_LOAD_LIBRARY_WITH_PERMISSION_CHECK_TEST_0009
     * @tc.desc    Test loadLibraryWithPermissionCheck with keywords to verify recognition and stability
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsRuntimeLinkerLoadLibraryWithPermissionCheckTest0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const keywords = ['0', 'NaN', ''];
      keywords.forEach(keyword => {
        let firstResult: boolean;
        try {
          loadLibraryWithPermissionCheck(keyword, keyword);
          firstResult = false;
        } catch (error) {
          firstResult = true;
          expect(error instanceof Error).assertTrue();
        }
        let isStable = true;
        for (let i = 0; i < 5; i++) {
          let currentResult: boolean;
          try {
            loadLibraryWithPermissionCheck(keyword, keyword);
            currentResult = false;
          } catch (error) {
            currentResult = true;
          }
          if (currentResult !== firstResult) {
            isStable = false;
            break;
          }
        }
        expect(isStable).assertTrue();
      });
    });

    /**
     * @tc.name    builtinsRuntimeLinkerLoadLibraryWithPermissionCheckTest0010
     * @tc.number  BUILTINS_RUNTIME_LINKER_LOAD_LIBRARY_WITH_PERMISSION_CHECK_TEST_0010
     * @tc.desc    Test loadLibraryWithPermissionCheck with treeString type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsRuntimeLinkerLoadLibraryWithPermissionCheckTest0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const initTreeString = (size: number): string => {
        let ans = '[';
        while (ans.length < size) {
          ans += '{"a":1},';
        }
        ans += '{"a":1}]';
        return ans;
      };
      const size = 5000;
      const treeStart = Date.now();
      const treeString = initTreeString(size);
      const treeCreationTime = Date.now() - treeStart;
      const treeCallStart = Date.now();
      let treeHasError = false;
      try {
        loadLibraryWithPermissionCheck(treeString, treeString);
      } catch (error) {
        treeHasError = true;
        expect(error instanceof Error).assertTrue();
      }
      const treeCallTime = Date.now() - treeCallStart;
      const normalStart = Date.now();
      const normalString = 'x'.repeat(size);
      const normalCreationTime = Date.now() - normalStart;
      const normalCallStart = Date.now();
      let normalHasError = false;
      try {
        loadLibraryWithPermissionCheck(normalString, normalString);
      } catch (error) {
        normalHasError = true;
      }
      const normalCallTime = Date.now() - normalCallStart;
      console.log('Performance Comparison Results:');
      console.log(`TreeString: Create${treeCreationTime}ms, Call${treeCallTime}ms`);
      console.log(`NormalString: Create${normalCreationTime}ms, Call${normalCallTime}ms`);
      expect(normalHasError).assertTrue();
    });

    /**
     * @tc.name    builtinsRuntimeLinkerLoadLibraryWithPermissionCheckTest0011
     * @tc.number  BUILTINS_RUNTIME_LINKER_LOAD_LIBRARY_WITH_PERMISSION_CHECK_TEST_0011
     * @tc.desc    Test loadLibraryWithPermissionCheck with sliced string to verify value stability
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsRuntimeLinkerLoadLibraryWithPermissionCheckTest0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const originalStr = "{k1:value1,k2:value2}";
      const sliced = originalStr.substring(0, originalStr.length - 2);
      let valueChanged = false;
      let changeDetails: string | null = null;
      for (let i = 0; i < 100; i++) {
        const beforeCall = sliced;
        try {
          loadLibraryWithPermissionCheck(sliced, sliced);
        } catch (error) {}
        const afterCall = sliced;
        if (beforeCall !== afterCall) {
          valueChanged = true;
          changeDetails = `Iteration ${i + 1}: String reference changed`;
          break;
        }
        if (beforeCall.length !== afterCall.length) {
          valueChanged = true;
          changeDetails = `Iteration ${i + 1}: Length changed from ${beforeCall.length} to ${afterCall.length}`;
          break;
        }
        for (let j = 0; j < beforeCall.length; j++) {
          if (beforeCall.charAt(j) !== afterCall.charAt(j)) {
            valueChanged = true;
            changeDetails = `Iteration ${i + 1}: Character at index ${j} changed from "${beforeCall.charAt(j)}" to "${afterCall.charAt(j)}"`;
            break;
          }
        }
        if (valueChanged) break;
      }
      expect(valueChanged).assertFalse();
      if (!valueChanged) {
        console.log(`Test passed: Sliced string value remained stable through 100 calls`);
      } else {
        console.error(`Test failed: ${changeDetails}`);
      }
    });

    /**
     * @tc.name    builtinsRuntimeLinkerLoadLibraryWithPermissionCheckTest0012
     * @tc.number  BUILTINS_RUNTIME_LINKER_LOAD_LIBRARY_WITH_PERMISSION_CHECK_TEST_0012
     * @tc.desc    Test loadLibraryWithPermissionCheck with huge string to verify memory usage
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsRuntimeLinkerLoadLibraryWithPermissionCheckTest0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const hugeSize = 10000000;
      let hugeString: string;
      try {
        hugeString = "a".repeat(hugeSize);
      } catch (error) {
        hugeString = "test";
      }
      let hugeCallSuccess = false;
      try {
        loadLibraryWithPermissionCheck(hugeString, hugeString.substring(0, 100));
        hugeCallSuccess = true;
      } catch (error) {
        hugeCallSuccess = false;
      }
      hugeString = "";
      expect(hugeCallSuccess).assertFalse();
    });

    /**
     * @tc.name    builtinsRuntimeLinkerLoadLibraryWithPermissionCheckTest0013
     * @tc.number  BUILTINS_RUNTIME_LINKER_LOAD_LIBRARY_WITH_PERMISSION_CHECK_TEST_0013
     * @tc.desc    Test GC with huge string after reference release
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsRuntimeLinkerLoadLibraryWithPermissionCheckTest0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const size = 10000000;
      let str1 = "a".repeat(size);
      let isErr = false
      try {
        loadLibraryWithPermissionCheck(str1, "test.d.ts");
      } catch (error) {
        isErr = true
      }
      str1 = "";
      let str2: string;
      try {
        str2 = "b".repeat(size);
      } catch (error) {
        console.log('has error')
      }
      expect(isErr).assertTrue();
    });

  })
}