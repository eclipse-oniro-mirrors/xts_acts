/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { afterAll, afterEach, beforeAll, beforeEach, describe, it, expect, TestType, Size, Level } from '../../../../hypium/index';
import Utils from '../Util.test';

function supportsRegExp(pattern: string, flags: string = ''): boolean {
  try {
    new RegExp(pattern, flags);
    return true;
  } catch (_) {
    return false;
  }
}

export default function testTest003(): void {
  // Rare but spec-visible combinations (sticky + unicode, etc.) that do not fit earlier buckets.
  describe('Edge_Cases', () => {
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(20);
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
     * @tc.name testTest0215
     * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_EXT_TEST_0200
     * @tc.desc Test zero width
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testTest0215', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(new RegExp('\\b').test('test')).assertTrue();
    });

    /**
     * @tc.name testTest0216
     * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_EXT_TEST_0300
     * @tc.desc Test empty alternative
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testTest0216', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(new RegExp('a|').test('')).assertTrue();
      expect(new RegExp('a|').test('a')).assertTrue();
    });

    /**
     * @tc.name testTest0217
     * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_EXT_TEST_0400
     * @tc.desc Test double anchor
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testTest0217', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(new RegExp('^^').test('test')).assertTrue();
    });

    /**
     * @tc.name testTest0218
     * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_EXT_TEST_0500
     * @tc.desc Test nested star
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testTest0218', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(new RegExp('(a)*').test('')).assertTrue();
      expect(new RegExp('((a)*)*').test('')).assertTrue();
    });

    /**
     * @tc.name testTest0219
     * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_EXT_TEST_0600
     * @tc.desc Test special combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testTest0219', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const str = '\\d\\w\\s';
      const re = new RegExp('\\\\\\w\\\\\\w\\\\\\w');
      expect(re.test(str)).assertTrue();
    });
  });

  // Domain-shaped samples mirroring app validation without pulling in external libraries.
  describe('Real_World', () => {
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(20);
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
     * @tc.name testTest0220
     * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_EXT_TEST_0700
     * @tc.desc Test form email validation
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testTest0220', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const validateEmail = (email: string): boolean => {
        const re = new RegExp('^[^\\s@]+@[^\\s@]+\\.[^\\s@]+$');
        return re.test(email);
      };
      expect(validateEmail('user@example.com')).assertTrue();
      expect(validateEmail('invalid')).assertFalse();
    });

    /**
     * @tc.name testTest0221
     * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_EXT_TEST_0800
     * @tc.desc Test data cleaning
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testTest0221', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const isClean = (s: string): boolean => new RegExp('^[a-zA-Z0-9\\s]+$').test(s);
      expect(isClean('Hello World 123')).assertTrue();
      expect(isClean('Hello@World')).assertFalse();
    });

    /**
     * @tc.name testTest0222
     * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_EXT_TEST_0900
     * @tc.desc Test search keyword
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testTest0222', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const isValidKeyword = (k: string): boolean => new RegExp('^[a-zA-Z0-9\\s\\-_]{2,50}$').test(k);
      expect(isValidKeyword('search-term')).assertTrue();
      expect(isValidKeyword('a')).assertFalse();
    });

    /**
     * @tc.name testTest0223
     * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_EXT_TEST_1000
     * @tc.desc Test log analysis
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testTest0223', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const isErrorLog = (log: string): boolean => new RegExp('\\[ERROR\\]').test(log);
      expect(isErrorLog('[INFO] Processing')).assertFalse();
      expect(isErrorLog('[ERROR] Failed')).assertTrue();
    });

    /**
     * @tc.name testTest0224
     * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_EXT_TEST_1100
     * @tc.desc Test config line
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testTest0224', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const isValidConfigLine = (line: string): boolean => new RegExp('^[a-zA-Z_]\\w*\\s*=\\s*[^#]+').test(line);
      expect(isValidConfigLine('key=value')).assertTrue();
      expect(isValidConfigLine('123key=value')).assertFalse();
    });

    /**
     * @tc.name testTest0225
     * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_EXTRA_TEST_0100
     * @tc.desc Test dotAll s flag spans newline when supported
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testTest0225', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const str = 'hello\nworld';
      if (!supportsRegExp('hello.*world', 's')) {
        return;
      }
      const re2 = new RegExp('hello.*world', 's');
      expect(re2.test(str)).assertTrue();
    });

    /**
     * @tc.name testTest0226
     * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_EXTRA_TEST_0200
     * @tc.desc Test dot with u flag matches supplementary plane when supported
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testTest0226', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const str = String.fromCodePoint(0x1D306);
      if (!supportsRegExp('.', 'u')) {
        return;
      }
      expect(new RegExp('.', 'u').test(str)).assertTrue();
    });
  });
}

