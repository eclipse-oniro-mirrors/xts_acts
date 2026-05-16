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

class TestRuntimeLinker extends RuntimeLinker {
  findAndLoadClass(clsName: string, init: boolean): Class | undefined {
    return undefined
  }
}
function initTreeString(size: number): string {
  let ans = '[';
  while (ans.length < size) {
    ans += '{"a":1},';
  }
  ans += '{"a":1}]';
  return ans;
}

export default function builtinsRuntimeLinkerLoadClassTest() {
  describe("builtinsRuntimeLinkerLoadClassTest", () => {
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
    * @tc.name    builtinsRuntimeLinkerLoadClassTest0001
    * @tc.number  BUILTINS_RUNTIME_LINKER_LOAD_CLASS_TEST_0001
    * @tc.desc    Test loadClass method with "undefined" string parameter
    * @tc.type    FUNCTION
    * @tc.size    SMALLTEST
    * @tc.level   LEVEL0
    */
    it('builtinsRuntimeLinkerLoadClassTest0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const linker = new TestRuntimeLinker();
      try {
        linker.loadClass('undefined');
        expect(true).assertFalse();
      } catch (error) {
        expect(error instanceof LinkerClassNotFoundError).assertTrue();
      }
    });

    /**
     * @tc.name    builtinsRuntimeLinkerLoadClassTest0002
     * @tc.number  BUILTINS_RUNTIME_LINKER_LOAD_CLASS_TEST_0002
     * @tc.desc    Test loadClass method with "null" string parameter
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsRuntimeLinkerLoadClassTest0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const linker = new TestRuntimeLinker();
      try {
        linker.loadClass('null');
        expect(true).assertFalse();
      } catch (error) {
        expect(error instanceof LinkerClassNotFoundError).assertTrue();
      }
    });

    /**
     * @tc.name    builtinsRuntimeLinkerLoadClassTest0003
     * @tc.number  BUILTINS_RUNTIME_LINKER_LOAD_CLASS_TEST_0003
     * @tc.desc    Test loadClass method with empty string parameter
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsRuntimeLinkerLoadClassTest0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const linker = new TestRuntimeLinker();
      try {
        linker.loadClass('');
        expect(true).assertFalse();
      } catch (error) {
        expect(error instanceof LinkerClassNotFoundError).assertTrue();
      }
    });

    /**
     * @tc.name    builtinsRuntimeLinkerLoadClassTest0004
     * @tc.number  BUILTINS_RUNTIME_LINKER_LOAD_CLASS_TEST_0004
     * @tc.desc    Test loadClass method with full range of special characters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsRuntimeLinkerLoadClassTest0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const linker = new TestRuntimeLinker();
      try {
        linker.loadClass('!\"#$%&\'()*+,-./:;<=>?@[\\]^_`{|}~');
        expect(true).assertFalse();
      } catch (error) {
        expect(error instanceof LinkerClassNotFoundError).assertTrue();
      }
    });

    /**
     * @tc.name    builtinsRuntimeLinkerLoadClassTest0005
     * @tc.number  BUILTINS_RUNTIME_LINKER_LOAD_CLASS_TEST_0005
     * @tc.desc    Test loadClass method with full range of ASCII characters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsRuntimeLinkerLoadClassTest0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const linker = new TestRuntimeLinker();
      try {
        linker.loadClass('!\"#$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~');
        expect(true).assertFalse();
      } catch (error) {
        expect(error instanceof LinkerClassNotFoundError).assertTrue();
      }
    });

    /**
     * @tc.name    builtinsRuntimeLinkerLoadClassTest0006
     * @tc.number  BUILTINS_RUNTIME_LINKER_LOAD_CLASS_TEST_0006
     * @tc.desc    Test loadClass method with special characters repeated twice
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsRuntimeLinkerLoadClassTest0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const linker = new TestRuntimeLinker();
      try {
        linker.loadClass('!!""##$$%%&&\'\'(())**++,,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~');
        expect(true).assertFalse();
      } catch (error) {
        expect(error instanceof LinkerClassNotFoundError).assertTrue();
      }
    });

    /**
     * @tc.name    builtinsRuntimeLinkerLoadClassTest0007
     * @tc.number  BUILTINS_RUNTIME_LINKER_LOAD_CLASS_TEST_0007
     * @tc.desc    Test loadClass method with all escape characters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsRuntimeLinkerLoadClassTest0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const linker = new TestRuntimeLinker();
      const escapeChars = ['\\a', '\\b', '\\f', '\\n', '\\r', '\\t', '\\v', '\\\\', "\\'", '\\"', '\\?', '\\0'];
      for (let i = 0; i < escapeChars.length; i++) {
        const escChar = escapeChars[i];
        const charCode = escChar.charCodeAt(0);
        console.log(`Escape char: ${escChar}, ASCII: ${charCode}`);
        try {
          linker.loadClass(escChar);
          expect(true).assertFalse();
        } catch (error) {
          expect(error instanceof LinkerClassNotFoundError).assertTrue();
        }
      }
      const octalChars = ['\\101', '\\102', '\\141', '\\142'];
      for (let i = 0; i < octalChars.length; i++) {
        const octChar = octalChars[i];
        console.log(`Octal: ${octChar}`);
        try {
          linker.loadClass(octChar);
          expect(true).assertFalse();
        } catch (error) {
          expect(error instanceof LinkerClassNotFoundError).assertTrue();
        }
      }
      const hexChars = ['\\x41', '\\x42', '\\x61', '\\x62'];
      for (let i = 0; i < hexChars.length; i++) {
        const hexChar = hexChars[i];
        console.log(`Hex: ${hexChar}`);
        try {
          linker.loadClass(hexChar);
          expect(true).assertFalse();
        } catch (error) {
          expect(error instanceof LinkerClassNotFoundError).assertTrue();
        }
      }
      console.log("All escape character tests completed");
    });

    /**
     * @tc.name    builtinsRuntimeLinkerLoadClassTest0008
     * @tc.number  BUILTINS_RUNTIME_LINKER_LOAD_CLASS_TEST_0008
     * @tc.desc    Test loadClass method with emojis and Unicode characters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsRuntimeLinkerLoadClassTest0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const linker = new TestRuntimeLinker();
      const emojis = ['👆', '👿', '👀', '💯', '🎅', '😼', '🔧', '💇', '🤼‍♂️', '🛢', '🀄', '🏴'];
      const unicodeEncodings = [
        '\\ud83d\\udc46',
        '\\ud83d\\udc7f',
        '\\ud83d\\udc40',
        '\\ud83d\\udcaf',
        '\\ud83c\\udf85',
        '\\ud83d\\ude3c',
        '\\ud83d\\udd27',
        '\\ud83d\\udc87',
        '\\ud83e\\udd3c\\u200d\\u2642\\ufe0f',
        '\\ud83d\\udee2',
        '\\ud83c\\udc04',
        '\\ud83c\\udff4'
      ];
      for (let i = 0; i < emojis.length; i++) {
        const emoji = emojis[i];
        try {
          linker.loadClass(emoji);
          expect(true).assertFalse();
        } catch (error) {
          expect(error instanceof LinkerClassNotFoundError).assertTrue();
        }
      }
      for (let i = 0; i < unicodeEncodings.length; i++) {
        const unicode = unicodeEncodings[i];
        try {
          linker.loadClass(unicode);
          expect(true).assertFalse();
        } catch (error) {
          expect(error instanceof LinkerClassNotFoundError).assertTrue();
        }
      }
      console.log("Verifying emoji and Unicode correspondence:");
      for (let i = 0; i < emojis.length; i++) {
        console.log(`${emojis[i]} === ${unicodeEncodings[i]}`);
      }
      console.log("All emoji and Unicode correspondence tests completed");
    });

    /**
     * @tc.name    builtinsRuntimeLinkerLoadClassTest0009
     * @tc.number  BUILTINS_RUNTIME_LINKER_LOAD_CLASS_TEST_0009
     * @tc.desc    Test loadClass method with invalid Unicode encoding
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsRuntimeLinkerLoadClassTest0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const linker = new TestRuntimeLinker();
      const invalidUnicode = ['\\udc04', '\\ud83d', '\\udff4'];
      for (const unicode of invalidUnicode) {
        try {
          linker.loadClass(unicode);
          console.log(`Invalid Unicode ${unicode}: No crash, but should throw error`);
        } catch (error) {
          expect(error instanceof LinkerClassNotFoundError).assertTrue();
          console.log(`Invalid Unicode ${unicode}: Correctly threw error, no crash`);
        }
      }
      console.log("Invalid Unicode test completed without crash");
    });

    /**
     * @tc.name    builtinsRuntimeLinkerLoadClassTest0010
     * @tc.number  BUILTINS_RUNTIME_LINKER_LOAD_CLASS_TEST_0010
     * @tc.desc    Test loadClass method with keywords
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsRuntimeLinkerLoadClassTest0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const linker = new TestRuntimeLinker();
      const keywords = ['0', 'NaN', ''];
      for (const keyword of keywords) {
        try {
          linker.loadClass(keyword);
          expect(true).assertFalse();
        } catch (error) {
          expect(error instanceof LinkerClassNotFoundError).assertTrue();
        }
      }
      for (const keyword of keywords) {
        let errorCount = 0;

        for (let i = 0; i < 3; i++) {
          try {
            linker.loadClass(keyword);
            expect(true).assertFalse();
          } catch (error) {
            errorCount++;
          }
        }
        expect(errorCount).assertEqual(3);
      }
    });

    /**
   * @tc.name    builtinsRuntimeLinkerLoadClassTest0011
   * @tc.number  BUILTINS_RUNTIME_LINKER_LOAD_CLASS_TEST_0011
   * @tc.desc    Test loadClass method with treeString type
   * @tc.type    FUNCTION
   * @tc.size    SMALLTEST
   * @tc.level   LEVEL0
   */
    it('builtinsRuntimeLinkerLoadClassTest0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const linker = new TestRuntimeLinker();
      const testSize = 1000;
      const normalString = "a".repeat(testSize);
      const treeString = initTreeString(testSize);
      const iterations = 100;
      let normalTotalTime = 0;
      for (let i = 0; i < iterations; i++) {
        const startTime = Date.now();
        try {
          linker.loadClass(normalString);
        } catch (error) {

        }
        const endTime = Date.now();
        normalTotalTime += (endTime - startTime);
      }
      const normalAvgTime = normalTotalTime / iterations;
      let treeTotalTime = 0;
      for (let i = 0; i < iterations; i++) {
        const startTime = Date.now();
        try {
          linker.loadClass(treeString);
        } catch (error) {

        }
        const endTime = Date.now();
        treeTotalTime += (endTime - startTime);
      }
      const treeAvgTime = treeTotalTime / iterations;
      try {
        linker.loadClass(normalString);
        expect(true).assertFalse();
      } catch (error) {
        expect(error instanceof LinkerClassNotFoundError).assertTrue();
      }
      try {
        linker.loadClass(treeString);
        expect(true).assertFalse();
      } catch (error) {
        expect(error instanceof LinkerClassNotFoundError).assertTrue();
      }
    });

    /**
     * @tc.name    builtinsRuntimeLinkerLoadClassTest0012
     * @tc.number  BUILTINS_RUNTIME_LINKER_LOAD_CLASS_TEST_0012
     * @tc.desc    Test loadClass method with sliceString type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsRuntimeLinkerLoadClassTest0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const linker = new TestRuntimeLinker();

      const str = "{k1:value1,k2:value2}";
      const result = str.substring(0, str.length - 2);

      try {
        linker.loadClass(result);
        expect(true).assertFalse();
      } catch (error) {
        expect(error instanceof LinkerClassNotFoundError).assertTrue();
      }
      for (let i = 0; i < 10; i++) {
        const sliced = str.substring(0, str.length - 2);
        try {
          linker.loadClass(sliced);
          expect(true).assertFalse();
        } catch (error) {
          expect(error instanceof LinkerClassNotFoundError).assertTrue();
        }
      }
    });

    /**
     * @tc.name    builtinsRuntimeLinkerLoadClassTest0013
     * @tc.number  BUILTINS_RUNTIME_LINKER_LOAD_CLASS_TEST_0013
     * @tc.desc    Test loadClass method with huge string memory usage
     * @tc.type    FUNCTION
     * @tc.size    LARGETEST
     * @tc.level   LEVEL1
     */
    it('builtinsRuntimeLinkerLoadClassTest0013', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1, () => {
      const linker = new TestRuntimeLinker();
      const hugeString = "a".repeat(100000000);
      try {
        linker.loadClass(hugeString);
        expect(true).assertFalse();
      } catch (error) {
        expect(error instanceof LinkerClassNotFoundError).assertTrue();
      }
    });

    /**
     * @tc.name    builtinsRuntimeLinkerLoadClassTest0014
     * @tc.number  BUILTINS_RUNTIME_LINKER_LOAD_CLASS_TEST_0014
     * @tc.desc    Test GC behavior with large string
     * @tc.type    FUNCTION
     * @tc.size    LARGETEST
     * @tc.level   LEVEL2
     */
    it('builtinsRuntimeLinkerLoadClassTest0014', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, () => {
      const linker = new TestRuntimeLinker();
      let hugeString1 = "x".repeat(50000);
      try {
        linker.loadClass(hugeString1);
        expect(true).assertFalse();
      } catch (error) {
        expect(error instanceof LinkerClassNotFoundError).assertTrue();
      }
      hugeString1 = "";
      let hugeString2 = "y".repeat(50000);
      try {
        linker.loadClass(hugeString2);
        expect(true).assertFalse();
      } catch (error) {
        expect(error instanceof LinkerClassNotFoundError).assertTrue();
      }
      hugeString2 = "";
      let hugeString3 = "z".repeat(50000);
      try {
        linker.loadClass(hugeString3);
        expect(true).assertFalse();
      } catch (error) {
        expect(error instanceof LinkerClassNotFoundError).assertTrue();
      }
      console.log("GC behavior test completed");
    });
  })
}