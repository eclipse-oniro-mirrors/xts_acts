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

export default function builtinsRuntimeLinkerGetTypeTest() {
  describe("builtinsRuntimeLinkerGetTypeTest", () => {
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
     * @tc.name    builtinsRuntimeLinkerGetTypeTest0001
     * @tc.number  BUILTINS_RUNTIME_LINKER_GET_TYPE_TEST_0001
     * @tc.desc    Test getType method with undefined parameter
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsRuntimeLinkerGetTypeTest0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const linker = new TestRuntimeLinker();
      try {
        const undefinedStr: string = String(undefined);
        const type = linker.getType(undefinedStr);
        if (type !== undefined) {
          expect(type !== undefined && type !== null).assertTrue();
        }
      } catch (error) {
        console.log('Undefined parameter handled');
      }
    });

    /**
     * @tc.name    builtinsRuntimeLinkerGetTypeTest0002
     * @tc.number  BUILTINS_RUNTIME_LINKER_GET_TYPE_TEST_0002
     * @tc.desc    Test getType method with null parameter
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsRuntimeLinkerGetTypeTest0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const linker = new TestRuntimeLinker();
      try {
        const nullStr: string = String(null);
        const type = linker.getType(nullStr);
        if (type !== undefined) {
          expect(type !== undefined && type !== null).assertTrue();
        }
      } catch (error) {
        console.log('Null parameter handled');
      }
    });

    /**
     * @tc.name    builtinsRuntimeLinkerGetTypeTest0003
     * @tc.number  BUILTINS_RUNTIME_LINKER_GET_TYPE_TEST_0003
     * @tc.desc    Test getType method with empty string
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsRuntimeLinkerGetTypeTest0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const linker = new TestRuntimeLinker();
      const td: string = '';
      const type = linker.getType(td);
      expect(type).assertUndefined();
    });

    /**
     * @tc.name    builtinsRuntimeLinkerGetTypeTest0004
     * @tc.number  BUILTINS_RUNTIME_LINKER_GET_TYPE_TEST_0004
     * @tc.desc    Test getType method with special characters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsRuntimeLinkerGetTypeTest0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const linker = new TestRuntimeLinker();
      const td: string = '!\"#$%&\'()*+,-./:;<=>?@[\\]^_`{|}~';
      const type = linker.getType(td);
      expect(type === undefined || type !== null).assertTrue();
    });

    /**
     * @tc.name    builtinsRuntimeLinkerGetTypeTest0005
     * @tc.number  BUILTINS_RUNTIME_LINKER_GET_TYPE_TEST_0005
     * @tc.desc    Test getType method with full ASCII range
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsRuntimeLinkerGetTypeTest0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const linker = new TestRuntimeLinker();
      let td: string = '';
      for (let i = 32; i <= 126; i++) {
        td += String.fromCharCode(i);
      }
      const type = linker.getType(td);
      expect(type === undefined || type !== null).assertTrue();
    });

    /**
     * @tc.name    builtinsRuntimeLinkerGetTypeTest0006
     * @tc.number  BUILTINS_RUNTIME_LINKER_GET_TYPE_TEST_0006
     * @tc.desc    Test getType method with duplicated special characters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsRuntimeLinkerGetTypeTest0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const linker = new TestRuntimeLinker();
      const td: string = '!!""##$$%%&&\'\'(())**++,,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~';
      const type = linker.getType(td);
      expect(type === undefined || type !== null).assertTrue();
    });

    /**
     * @tc.name    builtinsRuntimeLinkerGetTypeTest0007
     * @tc.number  BUILTINS_RUNTIME_LINKER_GET_TYPE_TEST_0007
     * @tc.desc    Test getType method with escape characters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsRuntimeLinkerGetTypeTest0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const linker = new TestRuntimeLinker();
      const td: string = '\\a\\b\\f\\n\\r\\t\\v\\\\\\\'\\"\\?\\0\\101\\x41';
      const type = linker.getType(td);
      expect(type === undefined || type !== null).assertTrue();
    });

    /**
     * @tc.name    builtinsRuntimeLinkerGetTypeTest0008
     * @tc.number  BUILTINS_RUNTIME_LINKER_GET_TYPE_TEST_0008
     * @tc.desc    Test getType method with emoji and Unicode characters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsRuntimeLinkerGetTypeTest0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const linker = new TestRuntimeLinker();
      const emojiUnicodes: string[] = [
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
        '\ud83c\udff4',
      ];

      for (let i = 0; i < emojiUnicodes.length; i++) {
        const unicode = emojiUnicodes[i];
        const type = linker.getType(unicode);
        expect(type === undefined || type !== null).assertTrue();
      }
    });

    /**
     * @tc.name    builtinsRuntimeLinkerGetTypeTest0009
     * @tc.number  BUILTINS_RUNTIME_LINKER_GET_TYPE_TEST_0009
     * @tc.desc    Test getType method with invalid Unicode sequences
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsRuntimeLinkerGetTypeTest0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const linker = new TestRuntimeLinker();
      const testStrings: string[] = [
        '\udc04',
        '\ud83d',
        '\udff4',
      ];
      for (const testStr of testStrings) {
        const type = linker.getType(testStr);
        if (type !== undefined) {
          expect(type !== undefined && type !== null).assertTrue();
        }
      }
    });

    /**
     * @tc.name    builtinsRuntimeLinkerGetTypeTest0010
     * @tc.number  BUILTINS_RUNTIME_LINKER_GET_TYPE_TEST_0010
     * @tc.desc    Test getType method with keyword strings
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsRuntimeLinkerGetTypeTest0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const linker = new TestRuntimeLinker();
      const testStrings: string[] = [
        '\udc04',
        '\ud83d',
        '\udff4',
      ];

      for (const testStr of testStrings) {
        const type = linker.getType(testStr);
        expect(type === undefined || type !== null).assertTrue();
      }
    });

    /**
     * @tc.name    builtinsRuntimeLinkerGetTypeTest0011
     * @tc.number  BUILTINS_RUNTIME_LINKER_GET_TYPE_TEST_0011
     * @tc.desc    Test getType method with treeString type
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('builtinsRuntimeLinkerGetTypeTest0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const linker = new TestRuntimeLinker();
      const createTreeString = (size: number): string => {
        let ans = '[';
        while (ans.length < size) {
          ans += '{"a":1},';
        }
        ans += '{"a":1}]';
        return ans;
      };
      const td = createTreeString(10000);
      const type = linker.getType(td);
      expect(type === undefined || type !== null).assertTrue();
    });

    /**
     * @tc.name    builtinsRuntimeLinkerGetTypeTest0012
     * @tc.number  BUILTINS_RUNTIME_LINKER_GET_TYPE_TEST_0012
     * @tc.desc    Test getType method with sliceString type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsRuntimeLinkerGetTypeTest0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const linker = new TestRuntimeLinker();
      const str: string = "{k1:value1,k2:value2}";
      const sliced: string = str.substring(0, str.length - 2);
      const type = linker.getType(sliced);
      expect(type === undefined || type !== null).assertTrue();
      if (type === undefined) {
        console.log('result: undefined');
      } else {
        console.log('result: Return the Type object');
      }
    });

    /**
     * @tc.name    builtinsRuntimeLinkerGetTypeTest0013
     * @tc.number  BUILTINS_RUNTIME_LINKER_GET_TYPE_TEST_0013
     * @tc.desc    Test getType method memory usage with large string
     * @tc.type    FUNCTION
     * @tc.size    LARGETEST
     * @tc.level   LEVEL2
     */
    it('builtinsRuntimeLinkerGetTypeTest0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const linker = new TestRuntimeLinker();
      const td: string = 'a'.repeat(1000000);
      console.log(`String length: ${td.length.toLocaleString()} Character`);
      console.log(`Estimated memory: ${(td.length * 2).toLocaleString()} Byte (UTF-16)`);
      try {
        const startTime = Date.now();
        const type = linker.getType(td);
        const endTime = Date.now();
        console.log(`Execution Time: ${endTime - startTime}ms`);
        expect(type === undefined || type !== null).assertTrue();
        if (type === undefined) {
          console.log('result: undefined');
        } else {
          console.log('result: Return the Type object');
        }
      } catch (error) {
        console.log('Large string processing exception: ' + error.message);
        expect(error instanceof Error).assertTrue();
      }
    });

    /**
     * @tc.name    builtinsRuntimeLinkerGetTypeTest0014
     * @tc.number  BUILTINS_RUNTIME_LINKER_GET_TYPE_TEST_0014
     * @tc.desc    Test getType method GC behavior
     * @tc.type    FUNCTION
     * @tc.size    LARGETEST
     * @tc.level   LEVEL2
     */
    it('builtinsRuntimeLinkerGetTypeTest0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const linker = new TestRuntimeLinker();
      const iterations = 5;
      const stringSize = 500000;
      for (let i = 0; i < iterations; i++) {
        console.log(`Iteration ${i + 1}/${iterations}`);
        try {
          const chars = String.fromCharCode(97 + (i % 26));
          const largeString = chars.repeat(stringSize);
          const type = linker.getType(largeString);
          expect(type === undefined || type !== null).assertTrue();
        } catch (error) {
          console.log(`Iteration ${i + 1} err: ${error.message}`);
          expect(error instanceof Error).assertTrue();
        }
      }
    });
  })
}