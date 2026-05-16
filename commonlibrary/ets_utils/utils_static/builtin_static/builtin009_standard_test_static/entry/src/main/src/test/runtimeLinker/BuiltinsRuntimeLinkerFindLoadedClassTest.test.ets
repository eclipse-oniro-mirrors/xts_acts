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
  protected findAndLoadClass(clsName: string, init: boolean): Class | undefined {
    if (clsName && !clsName.includes("ohos.utils.")) {
      const clazz = new Class();
      if (init) clazz.initialize();
      return clazz;
    }
    return undefined;
  }
}

export default function builtinsRuntimeLinkerFindLoadedClassTest() {
  describe('builtinsRuntimeLinkerFindLoadedClassTest', () => {
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
    * @tc.name    builtinsRuntimeLinkerFindLoadedClassTest0001
    * @tc.number  BUILTINS_RUNTIME_LINKER_FIND_LOADED_CLASS_TEST_0001
    * @tc.desc    Test findLoadedClass with empty string
    * @tc.type    FUNCTION
    * @tc.size    SMALLTEST
    * @tc.level   LEVEL0
    */
    it('builtinsRuntimeLinkerFindLoadedClassTest0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const linker = new TestRuntimeLinker()
      const unloadedResult = linker.findLoadedClass('')
      expect(unloadedResult).assertUndefined()

      const className = '';
      let isValidClass = false;
      try {
        linker.loadClass(className, false);
        const loadedResult = linker.findLoadedClass(className);
        isValidClass = true;
      } catch (error) {
        isValidClass = false;
      }
      expect(isValidClass).assertFalse();
    });

    /**
     * @tc.name    builtinsRuntimeLinkerFindLoadedClassTest0002
     * @tc.number  BUILTINS_RUNTIME_LINKER_FIND_LOADED_CLASS_TEST_0002
     * @tc.desc    Test passing a null string parameter
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsRuntimeLinkerFindLoadedClassTest0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const linker = new TestRuntimeLinker()
      const result = linker.findLoadedClass('null');
      expect(result).assertUndefined();

      let isValid = false;
      try {
        linker.loadClass('null', false);
        isValid = true;
      } catch (e) {
        isValid = false;
      }
      expect(isValid).assertFalse();
    });

    /**
     * @tc.name    builtinsRuntimeLinkerFindLoadedClassTest0003
     * @tc.number  BUILTINS_RUNTIME_LINKER_FIND_LOADED_CLASS_TEST_0003
     * @tc.desc    Test full coverage of special characters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsRuntimeLinkerFindLoadedClassTest0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const linker = new TestRuntimeLinker()
      const result = linker.findLoadedClass('!\"#$%&\'()*+,-./:;<=>?@[\\]^_`{|}~');
      expect(result).assertUndefined();

      const className = '!\"#$%&\'()*+,-./:;<=>?@[\\]^_`{|}~';
      let isValidClass = false;
      try {
        linker.loadClass(className, false);
        const loadedResult = linker.findLoadedClass(className);
        isValidClass = true;
      } catch (error) {
        isValidClass = false;
      }
      expect(isValidClass).assertFalse();
    });

    /**
     * @tc.name    builtinsRuntimeLinkerFindLoadedClassTest0004
     * @tc.number  BUILTINS_RUNTIME_LINKER_FIND_LOADED_CLASS_TEST_0004
     * @tc.desc    Test full coverage of ASCII codes (excluding tab characters)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsRuntimeLinkerFindLoadedClassTest0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const linker = new TestRuntimeLinker()
      let asciiStr = '';
      for (let i = 32; i <= 126; i++) {
        asciiStr += String.fromCharCode(i);
      }
      const result = linker.findLoadedClass(asciiStr);
      expect(result).assertUndefined();

      let isValidClass = false;
      try {
        linker.loadClass(asciiStr, false);
        const loadedResult = linker.findLoadedClass(asciiStr);
        isValidClass = true;
      } catch (error) {
        isValidClass = false;
      }
      expect(isValidClass).assertFalse();
    });

    /**
     * @tc.name    builtinsRuntimeLinkerFindLoadedClassTest0005
     * @tc.number  BUILTINS_RUNTIME_LINKER_FIND_LOADED_CLASS_TEST_0005
     * @tc.desc    Test full coverage of special characters (2 rounds)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsRuntimeLinkerFindLoadedClassTest0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const linker = new TestRuntimeLinker()
      const result = linker.findLoadedClass('!!""##$$%%&&\'\'(())**++,,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~');
      expect(result).assertUndefined();

      const className = '!!""##$$%%&&\'\'(())**++,,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~';
      let isValidClass = false;
      try {
        linker.loadClass(className, false);
        const loadedResult = linker.findLoadedClass(className);
        isValidClass = true;
      } catch (error) {
        isValidClass = false;
      }
      expect(isValidClass).assertFalse();
    });

    /**
     * @tc.name    builtinsRuntimeLinkerFindLoadedClassTest0006
     * @tc.number  BUILTINS_RUNTIME_LINKER_FIND_LOADED_CLASS_TEST_0006
     * @tc.desc    Test special escape characters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsRuntimeLinkerFindLoadedClassTest0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const linker = new TestRuntimeLinker()
      const result = linker.findLoadedClass('\\a\\b\\f\\n\\r\\t\\v\\\\\\\'\\"\\?\\0\\101\\x41');
      expect(result).assertUndefined();

      const className = '\\a\\b\\f\\n\\r\\t\\v\\\\\\\'\\"\\?\\0\\101\\x41';
      let isValidClass = false;
      try {
        linker.loadClass(className, false);
        const loadedResult = linker.findLoadedClass(className);
        isValidClass = true;
      } catch (error) {
        isValidClass = false;
      }
      expect(isValidClass).assertFalse();
    });

    /**
     * @tc.name    builtinsRuntimeLinkerFindLoadedClassTest0007
     * @tc.number  BUILTINS_RUNTIME_LINKER_FIND_LOADED_CLASS_TEST_0007
     * @tc.desc    Testing emojis and their Unicode codes
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsRuntimeLinkerFindLoadedClassTest0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const linker = new TestRuntimeLinker()
      const emojis = ['👆', '👿', '👀', '💯', '🎅', '😼', '🔧', '💇', '🤼‍♂️', '🛢', '🀄', '🏴'];

      for (const emoji of emojis) {
        const result = linker.findLoadedClass(emoji);
        expect(result).assertUndefined();
      }

      const unicodeStrings = [
        '\ud83d\udc46',
        '\ud83d\udc7f',
        '\ud83d\udc40',
        '\ud83d\udcaf',
        '\ud83c\udf85',
        '\ud83d\ude3c',
        '\ud83d\udd27',
        '\ud83d\udc87',
        '\ud83e\udd3c\u200d\u2642\ufe0f',
        '\ud83d\udee2',
        '\ud83c\udc04',
        '\ud83c\udff4'
      ];

      for (const unicodeStr of unicodeStrings) {
        const result = linker.findLoadedClass(unicodeStr);
        expect(result).assertUndefined();
      }

      for (const emoji of emojis) {
        const className = emoji;
        let isValidClass = false;
        try {
          linker.loadClass(className, false);
          const loadedResult = linker.findLoadedClass(className);
          isValidClass = true;
        } catch (error) {
          isValidClass = false;
        }
        expect(isValidClass).assertFalse();
      }
    });

    /**
     * @tc.name    builtinsRuntimeLinkerFindLoadedClassTest0008
     * @tc.number  BUILTINS_RUNTIME_LINKER_FIND_LOADED_CLASS_TEST_0008
     * @tc.desc    Test illegal Unicode sequence
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsRuntimeLinkerFindLoadedClassTest0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const linker = new TestRuntimeLinker()
      const testStrings = [
        '\udc04',
        '\ud83d',
        '\udff4',
        '\ud800\ud800',
        '\udc00\udc00',
      ];

      for (const testStr of testStrings) {
        const result = linker.findLoadedClass(testStr);
        expect(result).assertUndefined();
        const className = testStr;
        let isValidClass = false;
        try {
          linker.loadClass(className, false);
          const loadedResult = linker.findLoadedClass(className);
          isValidClass = true;
        } catch (error) {
          isValidClass = false;
        }
        expect(isValidClass).assertFalse();
      }
    });

    /**
     * @tc.name    builtinsRuntimeLinkerFindLoadedClassTest0009
     * @tc.number  BUILTINS_RUNTIME_LINKER_FIND_LOADED_CLASS_TEST_0009
     * @tc.desc    Test keyword string
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsRuntimeLinkerFindLoadedClassTest0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const linker = new TestRuntimeLinker()
      const keywords = ['0', 'NaN', 'null', 'undefined', 'true', 'false'];
      for (const keyword of keywords) {
        const result = linker.findLoadedClass(keyword);
        expect(result).assertUndefined();
        const className = keyword
        let isValidClass = false;
        try {
          linker.loadClass(className, false);
          const loadedResult = linker.findLoadedClass(className);
          isValidClass = true;
        } catch (error) {
          isValidClass = false;
        }
        expect(isValidClass).assertFalse();
      }
    });

    /**
     * @tc.name    builtinsRuntimeLinkerFindLoadedClassTest0010
     * @tc.number  BUILTINS_RUNTIME_LINKER_FIND_LOADED_CLASS_TEST_0010
     * @tc.desc    Test treeString type string (large size)
     * @tc.type    PERFORMANCE
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('builtinsRuntimeLinkerFindLoadedClassTest0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const linker = new TestRuntimeLinker()
      const initTreeString = (size: number): string => {
        let ans = '[';
        while (ans.length < size) {
          ans += '{"a":1},';
        }
        ans += '{"a":1}]';
        return ans;
      };
      const largeJsonString = initTreeString(10000);
      const startTime = Date.now();
      const result = linker.findLoadedClass(largeJsonString);
      const endTime = Date.now();
      expect(result).assertUndefined();

      const className = initTreeString(10000);
      let isValidClass = false;
      try {
        linker.loadClass(className, false);
        const loadedResult = linker.findLoadedClass(className);
        isValidClass = true;
      } catch (error) {
        isValidClass = false;
      }
      expect(isValidClass).assertFalse();
    });

    /**
     * @tc.name    builtinsRuntimeLinkerFindLoadedClassTest0011
     * @tc.number  BUILTINS_RUNTIME_LINKER_FIND_LOADED_CLASS_TEST_0011
     * @tc.desc    Test sliceString type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsRuntimeLinkerFindLoadedClassTest0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const str = "{k1:value1,k2:value2}";
      const sliced = str.substring(0, str.length - 2);
      const linker = new TestRuntimeLinker()
      for (let i = 0; i < 10; i++) {
        const result = linker.findLoadedClass(sliced);
        expect(result).assertUndefined();
      }
      const className = sliced;
      let isValidClass = false;
      try {
        linker.loadClass(className, false);
        const loadedResult = linker.findLoadedClass(className);
        isValidClass = true;
      } catch (error) {
        isValidClass = false;
      }
      expect(isValidClass).assertFalse();
    });

    /**
     * @tc.name    builtinsRuntimeLinkerFindLoadedClassTest0012
     * @tc.number  BUILTINS_RUNTIME_LINKER_FIND_LOADED_CLASS_TEST_0012
     * @tc.desc    Test memory usage of very large strings
     * @tc.type    PERFORMANCE
     * @tc.size    LARGETEST
     * @tc.level   LEVEL2
     */
    it('builtinsRuntimeLinkerFindLoadedClassTest0012', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, () => {
      const hugeString = 'a'.repeat(1024 * 1024);
      const linker = new TestRuntimeLinker()
      const result = linker.findLoadedClass(hugeString);
      expect(result).assertUndefined();

      const className = 'a'.repeat(1024 * 100);
      let isValidClass = false;
      try {
        linker.loadClass(className, false);
        const loadedResult = linker.findLoadedClass(className);
        isValidClass = true;
      } catch (error) {
        isValidClass = false;
      }
      expect(isValidClass).assertFalse();
    });

    /**
     * @tc.name    builtinsRuntimeLinkerFindLoadedClassTest0013
     * @tc.number  BUILTINS_RUNTIME_LINKER_FIND_LOADED_CLASS_TEST_0013
     * @tc.desc    Test garbage collection behavior
     * @tc.type    PERFORMANCE
     * @tc.size    LARGETEST
     * @tc.level   LEVEL2
     */
    it('builtinsRuntimeLinkerFindLoadedClassTest0013', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, () => {
      const linker = new TestRuntimeLinker()
      for (let i = 0; i < 5; i++) {
        const tempString = 'x'.repeat(512 * 1024); // 512KB
        const result = linker.findLoadedClass(tempString);
        expect(result).assertUndefined();
      }
      const testStrings = ['ClassA', 'ClassB', 'ClassC'];
      for (const str of testStrings) {
        const className = str;
        let isValidClass = false;
        try {
          linker.loadClass(className, false);
          const loadedResult = linker.findLoadedClass(className);
          isValidClass = true;
        } catch (error) {
          isValidClass = false;
        }
        expect(isValidClass).assertFalse();
      }
      console.log('GC test completed');
    });

    /**
     * @tc.name    builtinsRuntimeLinkerFindLoadedClassTest0014
     * @tc.number  BUILTINS_RUNTIME_LINKER_FIND_LOADED_CLASS_TEST_0014
     * @tc.desc    Test mixed content string
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsRuntimeLinkerFindLoadedClassTest0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const linker = new TestRuntimeLinker()
      const mixedStr = 'Class123_测试_🎯_\\n_\\t_特殊@#$%';
      const result = linker.findLoadedClass(mixedStr);
      expect(result).assertUndefined();
      const className = 'Class123_测试_🎯_\\n_\\t_特殊@#$%';
      let isValidClass = false;
      try {
        linker.loadClass(className, false);
        const loadedResult = linker.findLoadedClass(className);
        isValidClass = true;
      } catch (error) {
        isValidClass = false;
      }
      expect(isValidClass).assertFalse();
    });

    /**
     * @tc.name    builtinsRuntimeLinkerFindLoadedClassTest0015
     * @tc.number  BUILTINS_RUNTIME_LINKER_FIND_LOADED_CLASS_TEST_0015
     * @tc.desc    Testing various whitespace characters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsRuntimeLinkerFindLoadedClassTest0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const whitespaces = [' ', '\t', '\n', '\r', '\f', '\v', '\u00A0', '\u2000'];
      const linker = new TestRuntimeLinker()
      for (const ws of whitespaces) {
        const className = `My${ws}Class`;
        const result = linker.findLoadedClass(className);
        expect(result).assertUndefined();
        let isValidClass = false;
        try {
          linker.loadClass(className, false);
          const loadedResult = linker.findLoadedClass(className);
          isValidClass = true;
        } catch (error) {
          isValidClass = false;
        }
        expect(isValidClass).assertFalse();
      }
    });

    /**
     * @tc.name    builtinsRuntimeLinkerFindLoadedClassTest0016
     * @tc.number  BUILTINS_RUNTIME_LINKER_FIND_LOADED_CLASS_TEST_0016
     * @tc.desc    Testing control characters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsRuntimeLinkerFindLoadedClassTest0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const linker = new TestRuntimeLinker()
      const controlCharacters = [
        '\x00', // null
        '\x07', // bell
        '\x08', // backspace
        '\x09', // horizontal tab
        '\x0A', // new line
        '\x0D', // carriage return
        '\x1B', // escape
      ];

      for (const ctrlChar of controlCharacters) {
        const className = `Class${ctrlChar}Name`;
        const result = linker.findLoadedClass(className);
        expect(result).assertUndefined();
        let isValidClass = false;
        try {
          linker.loadClass(className, false);
          const loadedResult = linker.findLoadedClass(className);
          isValidClass = true;
        } catch (error) {
          isValidClass = false;
        }
        expect(isValidClass).assertFalse();
      }
    });

    /**
     * @tc.name    builtinsRuntimeLinkerFindLoadedClassTest0017
     * @tc.number  BUILTINS_RUNTIME_LINKER_FIND_LOADED_CLASS_TEST_0017
     * @tc.desc    Test string containing null bytes
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsRuntimeLinkerFindLoadedClassTest0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const stringsWithNull = [
        'Class\x00Name',
        '\x00\x00\x00',
        'Start\x00Middle\x00End',
      ];
      const linker = new TestRuntimeLinker()
      for (const str of stringsWithNull) {
        const result = linker.findLoadedClass(str);
        expect(result).assertUndefined();
        const className = str;
        let isValidClass = false;
        try {
          linker.loadClass(className, false);
          const loadedResult = linker.findLoadedClass(className);
          isValidClass = true;
        } catch (error) {
          isValidClass = false;
        }
        expect(isValidClass).assertFalse();
      }
    });

    /**
     * @tc.name    builtinsRuntimeLinkerFindLoadedClassTest0018
     * @tc.number  BUILTINS_RUNTIME_LINKER_FIND_LOADED_CLASS_TEST_0018
     * @tc.desc    Test passing a non-existing string parameter
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsRuntimeLinkerFindLoadedClassTest0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const linker = new TestRuntimeLinker()
      const result = linker.findLoadedClass('ClassNa');
      expect(result).assertUndefined();

      let isValid = false;
      try {
        linker.loadClass('ClassNa', false);
        isValid = true;
      } catch (e) {
        isValid = false;
      }
      expect(isValid).assertFalse();
    });

  })
}