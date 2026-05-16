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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size} from '@ohos/hypium';
import { testRegCtrJs0006, testRegCtrJs0007, testRegCtrJs0018, testRegCtrJs0021,
  testRegCtrJs0023,
  testRegCtrJs0030,
  testRegCtrJs0032,
  testRegCtrJs0035,
  testRegCtrJs0036,
  testRegCtrJs0037,
  testRegCtrJs0039,
  testRegCtrJs0050,
  testRegCtrJs0051,
  testRegCtrJs0056,
  testRegCtrJs0057,
  testRegCtrJs0060,
  testRegCtrJs0063,
  testRegCtrJs0064,
  testRegCtrJs0066,
  testRegCtrJs0080,
  testRegExecJs0133,
  testRegExecJs0134
} from './RegExp.test';

function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}

export default function RegExpTest001() {
  describe('RegExpTest001', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(20);
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
     * @tc.name   testRegCtr0001
     * @tc.number SUB_COMMONLIBRARY_REGEXP_0001
     * @tc.desc   Verify RegExp can be created from a string pattern with flags
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegCtr0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const re: RegExp = new RegExp('abc', 'i');
      const result: boolean = re.test('ABC');
      expect(result).assertTrue();
      expect(re.source).assertEqual('abc');
      expect(re.flags).assertEqual('i');
    });

    /**
     * @tc.name   testRegCtr0002
     * @tc.number SUB_COMMONLIBRARY_REGEXP_0002
     * @tc.desc   Verify RegExp constructed from another RegExp copies source and flags
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegCtr0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const re1: RegExp = /foo/gi;
      const re2: RegExp = new RegExp(re1);
      expect(re2.source).assertEqual('foo');
      expect(re2.flags).assertEqual('gi');
      expect(re2.test('FOO')).assertTrue();
    });

    /**
     * @tc.name   testRegCtr0003
     * @tc.number SUB_COMMONLIBRARY_REGEXP_0003
     * @tc.desc   Verify new flags override the original flags when reusing RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegCtr0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const re1: RegExp = /bar/i;
      const re2: RegExp = new RegExp(re1, 'g');
      expect(re2.flags).assertEqual('g');
      expect(re2.ignoreCase).assertFalse();
    });

    /**
     * @tc.name   testRegCtr0004
     * @tc.number SUB_COMMONLIBRARY_REGEXP_0004
     * @tc.desc   Verify SyntaxError is thrown when invalid flag is provided
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegCtr0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let errorCaught: boolean = false;
      try {
        new RegExp('a', 'z');
      } catch (e) {
        errorCaught = e instanceof SyntaxError;
      }
      expect(errorCaught).assertTrue();
    });

    /**
     * @tc.name   testRegCtr0005
     * @tc.number SUB_COMMONLIBRARY_REGEXP_0005
     * @tc.desc   Verify escape characters in string pattern are correctly interpreted
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegCtr0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const re: RegExp = new RegExp('\\d+');
      expect(re.test('123')).assertTrue();
      expect(re.test('abc')).assertFalse();
      expect(re.source).assertEqual('\\d+');
    });

    /**
     * @tc.name   testRegCtr0006
     * @tc.number SUB_COMMONLIBRARY_REGEXP_0006
     * @tc.desc   Verify default constructor behavior when called without arguments
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegCtr0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      expect(testRegCtrJs0006()).assertDeepEquals([true, true, true]);
    });

    /**
     * @tc.name   testRegCtr0007
     * @tc.number SUB_COMMONLIBRARY_REGEXP_0007
     * @tc.desc   Verify RegExp constructed with undefined or null as pattern produces empty pattern
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegCtr0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      expect(testRegCtrJs0007()).assertDeepEquals([true, true]);
    });

    /**
     * @tc.name   testRegCtr0008
     * @tc.number SUB_COMMONLIBRARY_REGEXP_0008
     * @tc.desc   Verify RegExp constructed from existing RegExp with undefined flag keeps original flags
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegCtr0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const re1: RegExp = /test/gi;
      const re2: RegExp = new RegExp(re1, undefined);
      expect(re2.flags).assertEqual('gi');
      expect(re2.source).assertEqual('test');
      expect(re2.test('TEST')).assertTrue();
    });

    /**
     * @tc.name   testRegCtr0012
     * @tc.number SUB_COMMONLIBRARY_REGEXP_0012
     * @tc.desc   Verify flags with different order (e.g. 'gi' and 'ig') are treated equivalently
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegCtr0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const re1: RegExp = new RegExp('abc', 'gi');
      const re2: RegExp = new RegExp('abc', 'ig');
      expect(re1.flags).assertEqual('gi');
      expect(re2.flags).assertEqual('gi'); // ECMAScript normalizes flag order
      expect(re1.test('ABC')).assertTrue();
      expect(re2.test('ABC')).assertTrue();
    });

    /**
     * @tc.name   testRegCtr0013
     * @tc.number SUB_COMMONLIBRARY_REGEXP_0013
     * @tc.desc   Verify Unicode flag 'u' enables proper emoji matching
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegCtr0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const re1: RegExp = new RegExp('.', 'u');
      const emoji: string = '😊';
      expect(re1.test(emoji)).assertTrue();
      const re2: RegExp = new RegExp('.', '');
      expect(re2.test(emoji)).assertTrue();
    });

    /**
     * @tc.name   testRegCtr0014
     * @tc.number SUB_COMMONLIBRARY_REGEXP_0014
     * @tc.desc   Verify difference between global (g) and sticky (y) flags
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegCtr0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = 'abc abc';
      const reGlobal: RegExp = new RegExp('abc', 'g');
      const reSticky: RegExp = new RegExp('abc', 'y');
      reGlobal.lastIndex = 4;
      reSticky.lastIndex = 4;
      const globalMatch = reGlobal.exec(str);
      const stickyMatch = reSticky.exec(str);
      expect(globalMatch![0]).assertEqual('abc');
      expect(stickyMatch![0]).assertEqual('abc');
    });

    /**
     * @tc.name   testRegCtr0016
     * @tc.number SUB_COMMONLIBRARY_REGEXP_0016
     * @tc.desc   Verify dotAll flag (s) allows dot to match newline characters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegCtr0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = 'abc\ndef';
      const reWithoutS: RegExp = new RegExp('abc.def');
      const reWithS: RegExp = new RegExp('abc.def', 's');
      expect(reWithoutS.test(str)).assertFalse();
      expect(reWithS.test(str)).assertTrue();
    });

    /**
     * @tc.name   testRegCtr0017
     * @tc.number SUB_COMMONLIBRARY_REGEXP_0017
     * @tc.desc   Verify multiline flag (m) changes behavior of ^ and $ anchors
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegCtr0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = 'first\nsecond';
      const reNoM: RegExp = new RegExp('^second$');
      const reWithM: RegExp = new RegExp('^second$', 'm');
      expect(reNoM.test(str)).assertFalse();
      expect(reWithM.test(str)).assertTrue();
    });

    /**
     * @tc.name   testRegCtr0018
     * @tc.number SUB_COMMONLIBRARY_REGEXP_0018
     * @tc.desc   Verify RegExp.prototype as pattern creates an empty pattern
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegCtr0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      expect(testRegCtrJs0018()).assertDeepEquals([true, true]);
    });

    /**
     * @tc.name   testRegCtr0019
     * @tc.number SUB_COMMONLIBRARY_REGEXP_0019
     * @tc.desc   Verify passing empty string as flags produces valid RegExp with no flags
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegCtr0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const re: RegExp = new RegExp('abc', '');
      expect(re.source).assertEqual('abc');
      expect(re.flags).assertEqual('');
      expect(re.test('abc')).assertTrue();
    });

    /**
     * @tc.name   testRegCtr0020
     * @tc.number SUB_COMMONLIBRARY_REGEXP_0020
     * @tc.desc   Verify dynamic RegExp creation using escaped string patterns
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegCtr0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const keyword: string = 'end.';
      const pattern: string = keyword.replace('.', '\\.');
      const re: RegExp = new RegExp(pattern);
      expect(re.test('match end.')).assertTrue();
      expect(re.test('match endx')).assertFalse();
    });

    /**
     * @tc.name   testRegCtr0021
     * @tc.number SUB_COMMONLIBRARY_REGEXP_0021
     * @tc.desc   Verify RegExp creation from Proxy object source and handler interception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegCtr0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      expect(testRegCtrJs0021()).assertEqual(true);
    });

    /**
     * @tc.name   testRegCtr0023
     * @tc.number SUB_COMMONLIBRARY_REGEXP_0023
     * @tc.desc   Verify RegExp constructed from object whose toString returns pattern
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegCtr0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      expect(testRegCtrJs0023()).assertEqual(true);
    });

    /**
     * @tc.name   testRegCtr0024
     * @tc.number SUB_COMMONLIBRARY_REGEXP_0024
     * @tc.desc   Verify RegExp constructed with combined flags 'g' and 'y'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegCtr0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const re = new RegExp('abc', 'gy');
      expect(re.global).assertEqual(true);
      expect(re.sticky).assertEqual(true);
    });

    /**
     * @tc.name   testRegCtr0025
     * @tc.number SUB_COMMONLIBRARY_REGEXP_0025
     * @tc.desc   Verify new RegExp created from existing one with modified flags
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegCtr0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const re1 = /abc/gi;
      const re2 = new RegExp(re1, 'm');
      expect(re2.multiline).assertEqual(true);
      expect(re2.ignoreCase).assertEqual(false);
    });

    /**
     * @tc.name   testRegCtr0028
     * @tc.number SUB_COMMONLIBRARY_REGEXP_0028
     * @tc.desc   Verify RegExp constructed from RegExp of another realm (simulated)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegCtr0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const iframeRe = /foo/;
      const re = new RegExp(iframeRe);
      expect(re.source).assertEqual('foo');
    });

    /**
     * @tc.name   testRegCtr0029
     * @tc.number SUB_COMMONLIBRARY_REGEXP_0029
     * @tc.desc   Verify SyntaxError thrown when RegExp created with invalid flag
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegCtr0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let threw = false;
      try {
        new RegExp('test', 'invalid');
      } catch (e) {
        threw = e instanceof SyntaxError;
      }
      expect(threw).assertEqual(true);
    });

    /**
     * @tc.name   testRegCtr0030
     * @tc.number SUB_COMMONLIBRARY_REGEXP_0030
     * @tc.desc   Verify RegExp throws when 'source' getter of input object throws
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegCtr0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      expect(testRegCtrJs0030()).assertEqual(false);
    });

    /**
     * @tc.name   testRegCtr0031
     * @tc.number SUB_COMMONLIBRARY_REGEXP_0031
     * @tc.desc   Verify RegExp supports dotAll flag 's' to match newline characters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegCtr0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const re = new RegExp('a.b', 's');
      expect(re.test('a\nb')).assertTrue();
    });

    /**
     * @tc.name   testRegCtr0032
     * @tc.number SUB_COMMONLIBRARY_REGEXP_0032
     * @tc.desc   Verify RegExp supports hasIndices flag 'd' and exposes indices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegCtr0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      expect(testRegCtrJs0032()).assertEqual(0);
    });

    /**
     * @tc.name   testRegCtr0033
     * @tc.number SUB_COMMONLIBRARY_REGEXP_0033
     * @tc.desc   Verify RegExp supports Unicode property escapes with \\p{L}
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegCtr0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const re = new RegExp('\\p{L}+', 'u');
      expect(re.test('你好')).assertTrue();
      expect(re.test('123')).assertFalse();
    });

    /**
     * @tc.name   testRegCtr0034
     * @tc.number SUB_COMMONLIBRARY_REGEXP_0034
     * @tc.desc   Verify RegExp constructed with named capture groups works correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegCtr0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const re = new RegExp('(?<first>\\w+)', 'u');
      const match = re.exec('hello');
      expect(match?.groups?.first).assertEqual('hello');
    });

    /**
     * @tc.name   testRegCtr0035
     * @tc.number SUB_COMMONLIBRARY_REGEXP_0035
     * @tc.desc   Verify RegExp constructed with empty pattern defaults to match empty string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegCtr0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      expect(testRegCtrJs0035()).assertDeepEquals([true, true]);
    });

    /**
     * @tc.name   testRegCtr0036
     * @tc.number SUB_COMMONLIBRARY_REGEXP_0036
     * @tc.desc   Verify RegExp constructed from undefined behaves as empty pattern
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegCtr0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      expect(testRegCtrJs0036()).assertEqual('(?:)');
    });

    /**
     * @tc.name   testRegCtr0037
     * @tc.number SUB_COMMONLIBRARY_REGEXP_0037
     * @tc.desc   Verify RegExp constructed with Symbol input throws TypeError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegCtr0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      expect(testRegCtrJs0037()).assertTrue();
    });

    /**
     * @tc.name   testRegCtr0038
     * @tc.number SUB_COMMONLIBRARY_REGEXP_0038
     * @tc.desc   Verify RegExp subclass correctly inherits flags and source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegCtr0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      class MyRegExp extends RegExp {}
      const myRe = new MyRegExp('abc', 'i');
      expect(myRe.source).assertEqual('abc');
      expect(myRe.ignoreCase).assertTrue();
    });

    /**
     * @tc.name   testRegCtr0039
     * @tc.number SUB_COMMONLIBRARY_REGEXP_0039
     * @tc.desc   Verify RegExp constructed from object implementing Symbol.match returns correct source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegCtr0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      expect(testRegCtrJs0039()).assertEqual('custom');
    });

    /**
     * @tc.name   testRegCtr0040
     * @tc.number SUB_COMMONLIBRARY_REGEXP_0040
     * @tc.desc   Verify RegExp constructed from string containing special characters behaves as expected
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegCtr0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const re = new RegExp('\\[abc\\]');
      expect(re.test('[abc]')).assertTrue();
      expect(re.test('abc')).assertFalse();
    });

    /**
     * @tc.name   testRegCtr0041
     * @tc.number SUB_COMMONLIBRARY_REGEXP_0041
     * @tc.desc   Verify RegExp with sticky flag 'y' correctly respects lastIndex
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegCtr0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const re = new RegExp('a', 'y');
      const str = 'aa';
      re.lastIndex = 1;
      expect(re.exec(str)?.[0]).assertEqual('a');
    });

    /**
     * @tc.name   testRegCtr0042
     * @tc.number SUB_COMMONLIBRARY_REGEXP_0042
     * @tc.desc   Verify RegExp interacts correctly with String.prototype.match
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegCtr0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const re = new RegExp('\\d+', 'g');
      const str = 'abc123def456';
      expect(str.match(re)).assertDeepEquals(['123','456']);
    });

    /**
     * @tc.name   testRegCtr0043
     * @tc.number SUB_COMMONLIBRARY_REGEXP_0043
     * @tc.desc   Verify RegExp with replace() handles global flag correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegCtr0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const re = new RegExp('cat', 'g');
      const str = 'cat bat cat';
      expect(str.replace(re, 'dog')).assertEqual('dog bat dog');
    });

    /**
     * @tc.name   testRegCtr0044
     * @tc.number SUB_COMMONLIBRARY_REGEXP_0044
     * @tc.desc   Verify RegExp matches surrogate pairs correctly with Unicode flag
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegCtr0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const re = new RegExp('\\u{1F600}', 'u'); // 😀
      expect(re.test('😀')).assertTrue();
    });

    /**
     * @tc.name   testRegCtr0045
     * @tc.number SUB_COMMONLIBRARY_REGEXP_0045
     * @tc.desc   Verify RegExp throws SyntaxError when flags are repeated
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegCtr0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let threw = false;
      try {
        new RegExp('abc', 'gg');
      } catch (e) {
        threw = e instanceof SyntaxError;
      }
      expect(threw).assertTrue();
    });

    /**
     * @tc.name   testRegCtr0046
     * @tc.number SUB_COMMONLIBRARY_REGEXP_0046
     * @tc.desc   Verify RegExp constructed dynamically from concatenated strings
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegCtr0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const part1 = 'ab';
      const part2 = 'c';
      const re = new RegExp(part1 + part2);
      expect(re.test('abc')).assertTrue();
      expect(re.test('ab')).assertFalse();
    });

    /**
     * @tc.name   testRegCtr0047
     * @tc.number SUB_COMMONLIBRARY_REGEXP_0047
     * @tc.desc   Verify RegExp constructed from empty string and replaced globally
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegCtr0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const re = new RegExp('', 'g');
      const str = 'abc';
      expect(str.replace(re, '-')).assertEqual('-a-b-c-');
    });

    /**
     * @tc.name   testRegCtr0048
     * @tc.number SUB_COMMONLIBRARY_REGEXP_0048
     * @tc.desc   Verify RegExp source with special regex characters are escaped correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegCtr0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const pattern = '\\^\\$\\.\\*\\+\\?\\(\\)\\[\\]\\{\\}\\|';
      const re = new RegExp(pattern);
      expect(re.test('^$.+*?()[]{}|')).assertFalse();
    });

    /**
     * @tc.name   testRegCtr0049
     * @tc.number SUB_COMMONLIBRARY_REGEXP_0049
     * @tc.desc   Verify RegExp constructed from another RegExp keeps same source if no flags provided
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegCtr0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const re1 = /abc/gi;
      const re2 = new RegExp(re1);
      expect(re2.source).assertEqual('abc');
      expect(re2.flags).assertEqual('gi');
    });

    /**
     * @tc.name   testRegCtr0050
     * @tc.number SUB_COMMONLIBRARY_REGEXP_0050
     * @tc.desc   Verify RegExp with multiple complex flags behaves as expected
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegCtr0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const re = new RegExp('a', 'gimsuyd');
      expect(re.global).assertTrue();
      expect(re.ignoreCase).assertTrue();
      expect(re.multiline).assertTrue();
      expect(re.dotAll).assertTrue();
      expect(re.sticky).assertTrue();
      expect(re.unicode).assertTrue();
      expect(testRegCtrJs0050()).assertTrue();
    });

    /**
     * @tc.name   testRegCtr0051
     * @tc.number SUB_COMMONLIBRARY_REGEXP_0051
     * @tc.desc   Verify RegExp subclass from another realm simulates cross-realm behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegCtr0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      expect(testRegCtrJs0051()).assertDeepEquals([true, true]);
    });

    /**
     * @tc.name   testRegCtr0052
     * @tc.number SUB_COMMONLIBRARY_REGEXP_0052
     * @tc.desc   Verify RegExp with nested named capture groups behaves correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegCtr0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const re = new RegExp('(?<outer>(?<inner>\\d+))', 'u');
      const match = re.exec('123');
      expect(match?.groups?.outer).assertEqual('123');
      expect(match?.groups?.inner).assertEqual('123');
    });

    /**
     * @tc.name   testRegCtr0053
     * @tc.number SUB_COMMONLIBRARY_REGEXP_0053
     * @tc.desc   Verify RegExp throws SyntaxError for invalid Unicode property escape
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegCtr0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let threw = false;
      try {
        new RegExp('\\p{InvalidProp}', 'u');
      } catch (e) {
        threw = e instanceof SyntaxError;
      }
      expect(threw).assertTrue();
    });

    /**
     * @tc.name   testRegCtr0054
     * @tc.number SUB_COMMONLIBRARY_REGEXP_0054
     * @tc.desc   Verify RegExp constructed from very large pattern string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegCtr0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const longPattern = 'a'.repeat(10000);
      const re = new RegExp(longPattern);
      expect(re.test('a'.repeat(10000))).assertTrue();
    });

    /**
     * @tc.name   testRegCtr0055
     * @tc.number SUB_COMMONLIBRARY_REGEXP_0055
     * @tc.desc   Verify RegExp lastIndex updates correctly after multiple exec calls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegCtr0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const re = new RegExp('\\d', 'g');
      const str = '123';
      re.exec(str);
      expect(re.lastIndex).assertEqual(1);
      re.exec(str);
      expect(re.lastIndex).assertEqual(2);
    });

    /**
     * @tc.name   testRegCtr0056
     * @tc.number SUB_COMMONLIBRARY_REGEXP_0056
     * @tc.desc   Verify RegExp source is preserved when constructed from another RegExp with overridden toString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegCtr0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      expect(testRegCtrJs0056()).assertEqual('abc');
    });

    /**
     * @tc.name   testRegCtr0057
     * @tc.number SUB_COMMONLIBRARY_REGEXP_0057
     * @tc.desc   Verify RegExp constructed from object with Symbol.match returns correct source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegCtr0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      expect(testRegCtrJs0057()).assertEqual('myPattern');
    });

    /**
     * @tc.name   testRegCtr0058
     * @tc.number SUB_COMMONLIBRARY_REGEXP_0058
     * @tc.desc   Verify RegExp with sticky flag respects lastIndex after failed match
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegCtr0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const re = new RegExp('a', 'y');
      const str = 'ba';
      re.lastIndex = 0;
      expect(re.exec(str)).assertEqual(null);
      expect(re.lastIndex).assertEqual(0);
    });

    /**
     * @tc.name   testRegCtr0059
     * @tc.number SUB_COMMONLIBRARY_REGEXP_0059
     * @tc.desc   Verify RegExp constructed from string with special regex characters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegCtr0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const re = new RegExp('\\(\\)\\[\\]\\{\\}\\?\\*\\+\\|');
      expect(re.test('()[]{}?*+|')).assertTrue();
    });

    /**
     * @tc.name   testRegCtr0060
     * @tc.number SUB_COMMONLIBRARY_REGEXP_0060
     * @tc.desc   Verify RegExp constructed with multiple flags preserves all properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegCtr0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const re = new RegExp('x', 'gimsuyd');
      expect(re.global).assertTrue();
      expect(re.ignoreCase).assertTrue();
      expect(re.multiline).assertTrue();
      expect(re.dotAll).assertTrue();
      expect(re.sticky).assertTrue();
      expect(re.unicode).assertTrue();
      expect(testRegCtrJs0060()).assertTrue();
    });

    /**
     * @tc.name   testRegCtr0061
     * @tc.number SUB_COMMONLIBRARY_REGEXP_0061
     * @tc.desc   Verify RegExp constructor preserves sticky flag when cloning existing instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegCtr0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const re1 = new RegExp('abc', 'y');
      const re2 = new RegExp(re1);
      expect(re2.sticky).assertTrue();
    });

    /**
     * @tc.name   testRegCtr0062
     * @tc.number SUB_COMMONLIBRARY_REGEXP_0062
     * @tc.desc   Verify RegExp constructed from dynamic template string pattern
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegCtr0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const word = 'hello';
      const re = new RegExp(`^${word}$`);
      expect(re.test('hello')).assertTrue();
      expect(re.test('hello!')).assertFalse();
    });

    /**
     * @tc.name   testRegCtr0063
     * @tc.number SUB_COMMONLIBRARY_REGEXP_0063
     * @tc.desc   Verify RegExp constructed from object with custom Symbol.toPrimitive
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegCtr0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      expect(testRegCtrJs0063()).assertTrue();
    });

    /**
     * @tc.name   testRegCtr0064
     * @tc.number SUB_COMMONLIBRARY_REGEXP_0064
     * @tc.desc   Verify RegExp throws when constructed from object with circular getter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegCtr0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      expect(testRegCtrJs0064()).assertFalse();
    });

    /**
     * @tc.name   testRegCtr0065
     * @tc.number SUB_COMMONLIBRARY_REGEXP_0065
     * @tc.desc   Verify RegExp handles special Unicode character escape correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegCtr0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const re = new RegExp('\\u{1F600}', 'u');
      expect(re.test('😀')).assertTrue();
    });

    /**
     * @tc.name   testRegCtr0066
     * @tc.number SUB_COMMONLIBRARY_REGEXP_0066
     * @tc.desc   Verify RegExp constructed from object that defines both source and flags
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegCtr0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      expect(testRegCtrJs0066()).assertDeepEquals([false, false]);
    });

    /**
     * @tc.name   testRegCtr0067
     * @tc.number SUB_COMMONLIBRARY_REGEXP_0067
     * @tc.desc   Verify RegExp with backreference captures the correct repeated group
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegCtr0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const re = new RegExp('(\\w+)\\s\\1');
      expect(re.test('foo foo')).assertTrue();
      expect(re.test('foo bar')).assertFalse();
    });

    /**
     * @tc.name   testRegCtr0069
     * @tc.number SUB_COMMONLIBRARY_REGEXP_0069
     * @tc.desc   Verify RegExp can match empty string and still maintain stateful flags
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegCtr0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const re = new RegExp('^$', 'g');
      expect(re.test('')).assertTrue();
      expect(re.lastIndex).assertEqual(0);
    });

    /**
     * @tc.name   testRegCtr0070
     * @tc.number SUB_COMMONLIBRARY_REGEXP_0070
     * @tc.desc   Verify RegExp constructed from escaped special characters in template string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegCtr0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const pattern = String.raw`\d+\.\d+`;
      const re = new RegExp(pattern);
      expect(re.test('3.14')).assertTrue();
      expect(re.test('abc')).assertFalse();
    });

    /**
     * @tc.name   testRegCtr0071
     * @tc.number SUB_COMMONLIBRARY_REGEXP_0071
     * @tc.desc   Verify RegExp global flag properly resets lastIndex when lastIndex exceeds input length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegCtr0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const re = new RegExp('\\d', 'g');
      const str = '12';
      re.lastIndex = 5;
      expect(re.exec(str)).assertEqual(null);
      expect(re.lastIndex).assertEqual(0);
    });

    /**
     * @tc.name   testRegCtr0072
     * @tc.number SUB_COMMONLIBRARY_REGEXP_0072
     * @tc.desc   Verify RegExp correctly parses escaped backslashes from string pattern
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegCtr0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const re = new RegExp('\\\\d');
      expect(re.test('\\d')).assertTrue();
      expect(re.test('d')).assertFalse();
    });

    /**
     * @tc.name   testRegCtr0073
     * @tc.number SUB_COMMONLIBRARY_REGEXP_0073
     * @tc.desc   Verify RegExp correctly handles lookahead and lookbehind assertions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegCtr0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const re = new RegExp('(?<=\\$)\\d+');
      expect(re.test('$123')).assertTrue();
      expect(re.test('123')).assertFalse();
    });

    /**
     * @tc.name   testRegCtr0074
     * @tc.number SUB_COMMONLIBRARY_REGEXP_0074
     * @tc.desc   Verify RegExp handles complex quantifiers with nested optional groups
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegCtr0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const re = new RegExp('(ab(c)?)+');
      expect(re.test('abcabc')).assertTrue();
      expect(re.test('abx')).assertTrue();
    });

    /**
     * @tc.name   testRegCtr0075
     * @tc.number SUB_COMMONLIBRARY_REGEXP_0075
     * @tc.desc   Verify RegExp respects unicode flag when matching astral symbols
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegCtr0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const re1 = new RegExp('^.$');
      const re2 = new RegExp('^.$', 'u');
      expect(re1.test('😀')).assertFalse();
      expect(re2.test('😀')).assertTrue();
    });

    /**
     * @tc.name   testRegCtr0076
     * @tc.number SUB_COMMONLIBRARY_REGEXP_0076
     * @tc.desc   Verify RegExp constructor correctly handles escaped forward slashes in patterns
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegCtr0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const re = new RegExp('\\/');
      expect(re.test('/')).assertTrue();
      expect(re.test('|')).assertFalse();
    });

    /**
     * @tc.name   testRegCtr0077
     * @tc.number SUB_COMMONLIBRARY_REGEXP_0077
     * @tc.desc   Verify RegExp handles nested alternation groups with repetition
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegCtr0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const re = new RegExp('(foo|bar){2,3}');
      expect(re.test('foobar')).assertTrue();
      expect(re.test('barbarbar')).assertTrue();
      expect(re.test('foo')).assertFalse();
    });

    /**
     * @tc.name   testRegCtr0078
     * @tc.number SUB_COMMONLIBRARY_REGEXP_0078
     * @tc.desc   Verify RegExp constructor throws on unterminated character class
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegCtr0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let threw = false;
      try {
        new RegExp('[abc');
      } catch (e) {
        threw = e instanceof SyntaxError;
      }
      expect(threw).assertTrue();
    });

    /**
     * @tc.name   testRegCtr0079
     * @tc.number SUB_COMMONLIBRARY_REGEXP_0079
     * @tc.desc   Verify RegExp constructor can handle very large quantifier counts safely
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegCtr0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const re = new RegExp('a{1,10000}');
      const str = 'a'.repeat(5000);
      expect(re.test(str)).assertTrue();
    });

    /**
     * @tc.name   testRegCtr0080
     * @tc.number SUB_COMMONLIBRARY_REGEXP_0080
     * @tc.desc   Verify RegExp constructed from object with primitive pattern value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegCtr0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      expect(testRegCtrJs0080()).assertDeepEquals([true, false]);
    });

    /**
     * @tc.name   testRegCtr0081
     * @tc.number SUB_COMMONLIBRARY_REGEXP_0081
     * @tc.desc   Verify RegExp handles non-greedy quantifier correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegCtr0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const reg: RegExp = new RegExp('a.+?b');
      const result: RegExpMatchArray | null = 'axxxbxxxab'.match(reg);
      expect(result?.[0]).assertEqual('axxxb');
    });

    /**
     * @tc.name   testRegCtr0082
     * @tc.number SUB_COMMONLIBRARY_REGEXP_0082
     * @tc.desc   Verify RegExp correctly applies word boundary and non-word boundary
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegCtr0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const reg1: RegExp = new RegExp('\\bfoo\\b');
      const reg2: RegExp = new RegExp('\\Bfoo\\B');
      expect(reg1.test('foo')).assertEqual(true);
      expect(reg2.test('foo')).assertEqual(false);
    });

    /**
     * @tc.name   testRegCtr0083
     * @tc.number SUB_COMMONLIBRARY_REGEXP_0083
     * @tc.desc   Verify RegExp correctly captures and references back-references
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegCtr0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const reg: RegExp = new RegExp('(ha)\\1');
      expect(reg.test('haha')).assertEqual(true);
      expect(reg.test('ha')).assertEqual(false);
    });

    /**
     * @tc.name   testRegCtr0084
     * @tc.number SUB_COMMONLIBRARY_REGEXP_0084
     * @tc.desc   Verify RegExp handles escaped brackets and parentheses properly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegCtr0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const reg: RegExp = new RegExp('\\(test\\)');
      expect(reg.test('(test)')).assertEqual(true);
      expect(reg.test('test')).assertEqual(false);
    });

    /**
     * @tc.name   testRegCtr0085
     * @tc.number SUB_COMMONLIBRARY_REGEXP_0085
     * @tc.desc   Verify RegExp correctly matches Unicode letters and digits with \\w and \\d
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegCtr0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const reg: RegExp = new RegExp('\\w+\\d+');
      const str: string = 'abc123';
      expect(reg.test(str)).assertEqual(true);
    });

    /**
     * @tc.name   testRegCtr0086
     * @tc.number SUB_COMMONLIBRARY_REGEXP_0086
     * @tc.desc   Verify RegExp handles repetition quantifiers with nested groups correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegCtr0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const reg: RegExp = new RegExp('(ab(c)){2}');
      expect(reg.test('abccabcc')).assertEqual(false);
      expect(reg.test('abcabc')).assertEqual(true);
    });

    /**
     * @tc.name   testRegCtr0087
     * @tc.number SUB_COMMONLIBRARY_REGEXP_0087
     * @tc.desc   Verify RegExp distinguishes between greedy and lazy quantifiers in nested groups
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegCtr0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const greedy: RegExp = new RegExp('".*"');
      const lazy: RegExp = new RegExp('".*?"');
      const text: string = '"a" and "b"';
      expect(text.match(greedy)?.[0]).assertEqual('"a" and "b"');
      expect(text.match(lazy)?.[0]).assertEqual('"a"');
    });

    /**
     * @tc.name   testRegCtr0088
     * @tc.number SUB_COMMONLIBRARY_REGEXP_0088
     * @tc.desc   Verify RegExp correctly escapes special characters in dynamic input
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegCtr0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const input: string = '[user](admin)';
      const escaped: string = input.replace(/[.*+?^${}()|[\]\\]/g, '\\$&');
      const reg: RegExp = new RegExp(escaped);
      expect(reg.test(input)).assertEqual(true);
    });

    /**
     * @tc.name   testRegCtr0089
     * @tc.number SUB_COMMONLIBRARY_REGEXP_0089
     * @tc.desc   Verify RegExp with alternation pattern matches any valid option
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegCtr0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const reg: RegExp = new RegExp('cat|dog|bird');
      expect(reg.test('dog')).assertEqual(true);
      expect(reg.test('fish')).assertEqual(false);
    });

    /**
     * @tc.name   testRegCtr0090
     * @tc.number SUB_COMMONLIBRARY_REGEXP_0090
     * @tc.desc   Verify RegExp handles replacement using captured groups with String.replace()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegCtr0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const reg: RegExp = new RegExp('(\\w+) (\\w+)');
      const text: string = 'Hello World';
      const result: string = text.replace(reg, '$2, $1');
      expect(result).assertEqual('World, Hello');
    });

    /**
     * @tc.name   testRegCtr0091
     * @tc.number SUB_COMMONLIBRARY_REGEXP_0091
     * @tc.desc   Verify RegExp positive lookahead pattern matches correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegCtr0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const reg: RegExp = new RegExp('foo(?=bar)');
      expect(reg.test('foobar')).assertEqual(true);
      expect(reg.test('foobaz')).assertEqual(false);
    });

    /**
     * @tc.name   testRegCtr0092
     * @tc.number SUB_COMMONLIBRARY_REGEXP_0092
     * @tc.desc   Verify RegExp negative lookahead pattern matches correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegCtr0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const reg: RegExp = new RegExp('foo(?!bar)');
      expect(reg.test('foobar')).assertEqual(false);
      expect(reg.test('foobaz')).assertEqual(true);
    });

    /**
     * @tc.name   testRegCtr0093
     * @tc.number SUB_COMMONLIBRARY_REGEXP_0093
     * @tc.desc   Verify RegExp lastIndex changes correctly after global matches
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegCtr0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const reg: RegExp = new RegExp('a', 'g');
      const str: string = 'a a a';
      reg.test(str);
      expect(reg.lastIndex > 0).assertEqual(true);
    });

    /**
     * @tc.name   testRegCtr0094
     * @tc.number SUB_COMMONLIBRARY_REGEXP_0094
     * @tc.desc   Verify RegExp global flag allows multiple matches on same input
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegCtr0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const reg: RegExp = new RegExp('\\d+', 'g');
      const str: string = '12 and 34 and 56';
      const matches: string[] | null = str.match(reg);
      expect(matches?.length).assertEqual(3);
    });

    /**
     * @tc.name   testRegCtr0095
     * @tc.number SUB_COMMONLIBRARY_REGEXP_0095
     * @tc.desc   Verify RegExp case-insensitive flag works as expected
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegCtr0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const reg: RegExp = new RegExp('hello', 'i');
      expect(reg.test('HELLO')).assertEqual(true);
      expect(reg.test('HeLlO')).assertEqual(true);
    });

    /**
     * @tc.name   testRegCtr0096
     * @tc.number SUB_COMMONLIBRARY_REGEXP_0096
     * @tc.desc   Verify RegExp can match empty lines using multiline flag
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegCtr0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const reg: RegExp = new RegExp('^$', 'm');
      const str: string = 'line1\n\nline3';
      const matches: string[] | null = str.match(reg);
      expect(matches?.length).assertEqual(1);
    });

    /**
     * @tc.name   testRegCtr0097
     * @tc.number SUB_COMMONLIBRARY_REGEXP_0097
     * @tc.desc   Verify RegExp correctly replaces multiple patterns with capture groups
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegCtr0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const reg: RegExp = new RegExp('(\\d+)', 'g');
      const str: string = 'ID:123, CODE:456';
      const result: string = str.replace(reg, '#$1#');
      expect(result).assertEqual('ID:#123#, CODE:#456#');
    });

    /**
     * @tc.name   testRegCtr0098
     * @tc.number SUB_COMMONLIBRARY_REGEXP_0098
     * @tc.desc   Verify RegExp correctly matches special whitespace characters like tabs and newlines
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegCtr0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const reg: RegExp = new RegExp('\\s+');
      const str: string = 'a\tb\nc';
      const matches: string[] | null = str.match(reg);
      expect(matches?.length).assertEqual(1);
    });

    /**
     * @tc.name   testRegCtr0099
     * @tc.number SUB_COMMONLIBRARY_REGEXP_0099
     * @tc.desc   Verify RegExp instance does not share lastIndex across different instances
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegCtr0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const reg1: RegExp = new RegExp('a', 'g');
      const reg2: RegExp = new RegExp('a', 'g');
      reg1.test('aaa');
      expect(reg2.lastIndex).assertEqual(0);
    });

    /**
     * @tc.name   testRegCtr0100
     * @tc.number SUB_COMMONLIBRARY_REGEXP_0100
     * @tc.desc   Verify RegExp efficiently matches long repetitive input without backtracking issues
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegCtr0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const input: string = 'a'.repeat(5000) + 'b';
      const reg: RegExp = new RegExp('a+b');
      const result: boolean = reg.test(input);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   testRegTest0001
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TEST_0001
     * @tc.desc   Basic match: check if a pattern exists in the string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /foo/;
      const result = regex.test("table football");
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   testRegTest0002
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TEST_0002
     * @tc.desc   Global flag: test behavior of test() with /g flag
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegTest0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /foo/g;
      const firstResult = regex.test("table football");
      expect(firstResult).assertEqual(true);
      expect(regex.lastIndex).assertEqual(9);
      const secondResult = regex.test("table football");
      expect(secondResult).assertEqual(false);
    });

    /**
     * @tc.name   testRegTest0003
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TEST_0003
     * @tc.desc   Sticky flag: test behavior of test() with /y flag
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegTest0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /foo/y;
      const firstResult = regex.test("table football");
      expect(firstResult).assertEqual(false);
      regex.lastIndex = 6;
      const secondResult = regex.test("table football");
      expect(secondResult).assertEqual(true);
    });

    /**
     * @tc.name   testRegTest0004
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TEST_0004
     * @tc.desc   No match: test that test() returns false if no match found
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegTest0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /bar/;
      const result = regex.test("table football");
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   testRegTest0005
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TEST_0005
     * @tc.desc   Case-insensitive match: test that /i flag ignores case
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegTest0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /FOO/i;
      const result = regex.test("table football");
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   testRegTest0006
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TEST_0006
     * @tc.desc   Empty pattern: test that an empty regex matches any string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegTest0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /(?:)/;
      const result = regex.test("anything");
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   testRegTest0007
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TEST_0007
     * @tc.desc   Match beginning of string using ^ anchor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegTest0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /^foo/;
      const result1 = regex.test("foobar");
      const result2 = regex.test("barfoo");
      expect(result1).assertEqual(true);
      expect(result2).assertEqual(false);
    });

    /**
     * @tc.name   testRegTest0008
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TEST_0008
     * @tc.desc   Match end of string using $ anchor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegTest0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /foo$/;
      const result1 = regex.test("barfoo");
      const result2 = regex.test("foobar");
      expect(result1).assertEqual(true);
      expect(result2).assertEqual(false);
    });

    /**
     * @tc.name   testRegTest0009
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TEST_0009
     * @tc.desc   Dot matches any character except newline
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegTest0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /f.o/;
      const result1 = regex.test("foo");
      const result2 = regex.test("f\no");
      expect(result1).assertEqual(true);
      expect(result2).assertEqual(false);
    });

    /**
     * @tc.name   testRegTest0010
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TEST_0010
     * @tc.desc   Character class matching
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegTest0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /[abc]/;
      const result1 = regex.test("apple");
      const result2 = regex.test("xyz");
      expect(result1).assertEqual(true);
      expect(result2).assertEqual(false);
    });

    /**
     * @tc.name   testRegTest0011
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TEST_0011
     * @tc.desc   Negated character class
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegTest0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /[^abc]/;
      const result1 = regex.test("xyz");
      const result2 = regex.test("a");
      expect(result1).assertEqual(true);
      expect(result2).assertEqual(false);
    });

    /**
     * @tc.name   testRegTest0012
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TEST_0012
     * @tc.desc   Optional character with ?
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegTest0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /colou?r/;
      const result1 = regex.test("color");
      const result2 = regex.test("colour");
      const result3 = regex.test("colouur");
      expect(result1).assertEqual(true);
      expect(result2).assertEqual(true);
      expect(result3).assertEqual(false);
    });

    /**
     * @tc.name   testRegTest0013
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TEST_0013
     * @tc.desc   Repetition with + quantifier
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegTest0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /go+/;
      const result1 = regex.test("go");
      const result2 = regex.test("goo");
      const result3 = regex.test("g");
      expect(result1).assertEqual(true);
      expect(result2).assertEqual(true);
      expect(result3).assertEqual(false);
    });

    /**
     * @tc.name   testRegTest0014
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TEST_0014
     * @tc.desc   Repetition with * quantifier
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegTest0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /go*/;
      const result1 = regex.test("g");
      const result2 = regex.test("goo");
      const result3 = regex.test("h");
      expect(result1).assertEqual(true);
      expect(result2).assertEqual(true);
      expect(result3).assertEqual(false);
    });

    /**
     * @tc.name   testRegTest0015
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TEST_0015
     * @tc.desc   Alternation with | operator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegTest0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /cat|dog/;
      const result1 = regex.test("I have a cat");
      const result2 = regex.test("I have a dog");
      const result3 = regex.test("I have a bird");
      expect(result1).assertEqual(true);
      expect(result2).assertEqual(true);
      expect(result3).assertEqual(false);
    });

    /**
     * @tc.name   testRegTest0016
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TEST_0016
     * @tc.desc   Global flag repeated match: test consecutive test() calls with /g
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegTest0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /a/g;
      const str = "banana";
      const first = regex.test(str);
      const second = regex.test(str);
      const third = regex.test(str);
      const fourth = regex.test(str);
      expect(first).assertEqual(true);
      expect(second).assertEqual(true);
      expect(third).assertEqual(true);
      expect(fourth).assertEqual(false);
    });

    /**
     * @tc.name   testRegTest0017
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TEST_0017
     * @tc.desc   Sticky flag matching at specific index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegTest0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /foo/y;
      const str = "barfoofoo";
      regex.lastIndex = 3;
      const first = regex.test(str);
      regex.lastIndex = 6;
      const second = regex.test(str);
      expect(first).assertEqual(true);
      expect(second).assertEqual(true);
    });

    /**
     * @tc.name   testRegTest0018
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TEST_0018
     * @tc.desc   Test multi-line flag: ^ and $ with /m
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegTest0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /^foo/m;
      const str = "bar\nfoo\nbaz";
      const result = regex.test(str);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   testRegTest0019
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TEST_0019
     * @tc.desc   Test Unicode character matching with /u flag
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegTest0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /\u{1F600}/u; // 😀 emoji
      const result1 = regex.test("😀");
      const result2 = regex.test("😃");
      expect(result1).assertEqual(true);
      expect(result2).assertEqual(false);
    });

    /**
     * @tc.name   testRegTest0020
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TEST_0020
     * @tc.desc   Test optional group matching
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegTest0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /I love (cats)?/;
      const result1 = regex.test("I love cats");
      const result2 = regex.test("I love ");
      const result3 = regex.test("I love dogs");
      expect(result1).assertEqual(true);
      expect(result2).assertEqual(true);
      expect(result3).assertEqual(true);
    });

    /**
     * @tc.name   testRegTest0021
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TEST_0021
     * @tc.desc   Test word boundary with \b
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegTest0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /\bcat\b/;
      const result1 = regex.test("a cat is here");
      const result2 = regex.test("catch the ball");
      expect(result1).assertEqual(true);
      expect(result2).assertEqual(false);
    });

    /**
     * @tc.name   testRegTest0022
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TEST_0022
     * @tc.desc   Test digit character class \d
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegTest0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /\d/;
      const result1 = regex.test("abc123");
      const result2 = regex.test("abc");
      expect(result1).assertEqual(true);
      expect(result2).assertEqual(false);
    });

    /**
     * @tc.name   testRegTest0023
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TEST_0023
     * @tc.desc   Test non-digit character class \D
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegTest0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /\D/;
      const result1 = regex.test("123");
      const result2 = regex.test("abc123");
      expect(result1).assertEqual(false);
      expect(result2).assertEqual(true);
    });

    /**
     * @tc.name   testRegTest0024
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TEST_0024
     * @tc.desc   Test whitespace character class \s
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegTest0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /\s/;
      const result1 = regex.test("hello world");
      const result2 = regex.test("helloworld");
      expect(result1).assertEqual(true);
      expect(result2).assertEqual(false);
    });

    /**
     * @tc.name   testRegTest0025
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TEST_0025
     * @tc.desc   Test non-whitespace character class \S
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegTest0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /\S/;
      const result1 = regex.test("   ");
      const result2 = regex.test(" a ");
      expect(result1).assertEqual(false);
      expect(result2).assertEqual(true);
    });

    /**
     * @tc.name   testRegTest0026
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TEST_0026
     * @tc.desc   Positive lookahead assertion
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegTest0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /foo(?=bar)/;
      const result1 = regex.test("foobar");
      const result2 = regex.test("foobaz");
      expect(result1).assertEqual(true);
      expect(result2).assertEqual(false);
    });

    /**
     * @tc.name   testRegTest0027
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TEST_0027
     * @tc.desc   Negative lookahead assertion
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegTest0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /foo(?!bar)/;
      const result1 = regex.test("foobaz");
      const result2 = regex.test("foobar");
      expect(result1).assertEqual(true);
      expect(result2).assertEqual(false);
    });

    /**
     * @tc.name   testRegTest0028
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TEST_0028
     * @tc.desc   Test matching tab and newline characters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegTest0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /\t|\n/;
      const result1 = regex.test("line1\nline2");
      const result2 = regex.test("line1\tline2");
      const result3 = regex.test("line1 line2");
      expect(result1).assertEqual(true);
      expect(result2).assertEqual(true);
      expect(result3).assertEqual(false);
    });

    /**
     * @tc.name   testRegTest0029
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TEST_0029
     * @tc.desc   Test matching non-word characters \W
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegTest0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /\W/;
      const result1 = regex.test("hello!");
      const result2 = regex.test("hello");
      expect(result1).assertEqual(true);
      expect(result2).assertEqual(false);
    });

    /**
     * @tc.name   testRegTest0030
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TEST_0030
     * @tc.desc   Test word character class \w
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegTest0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /\w/;
      const result1 = regex.test("!");
      const result2 = regex.test("a1_");
      expect(result1).assertEqual(false);
      expect(result2).assertEqual(true);
    });

    /**
     * @tc.name   testRegTest0031
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TEST_0031
     * @tc.desc   Test matching empty string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegTest0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /foo/;
      const result = regex.test("");
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   testRegTest0032
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TEST_0032
     * @tc.desc   Test multi-byte Unicode character matching
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegTest0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /你好/;
      const result1 = regex.test("你好世界");
      const result2 = regex.test("世界");
      expect(result1).assertEqual(true);
      expect(result2).assertEqual(false);
    });

    /**
     * @tc.name   testRegTest0033
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TEST_0033
     * @tc.desc   Test matching line start with ^ without /m
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegTest0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /^foo/;
      const str = "bar\nfoo";
      const result = regex.test(str);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   testRegTest0034
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TEST_0034
     * @tc.desc   Test matching line end with $ without /m
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegTest0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /foo$/;
      const str = "foo\nbar";
      const result = regex.test(str);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   testRegTest0035
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TEST_0035
     * @tc.desc   Test non-greedy quantifier with ?
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegTest0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /<.*?>/;
      const str = "<div>content</div>";
      const result = regex.test(str);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   testRegTest0036
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TEST_0036
     * @tc.desc   Test combination of global, ignoreCase, and multiline flags
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegTest0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /^foo/gim;
      const str = "Foo\nfoo\nFOO";
      const first = regex.test(str);
      const second = regex.test(str);
      const third = regex.test(str);
      expect(first).assertEqual(true);
      expect(second).assertEqual(true);
      expect(third).assertEqual(true);
    });

    /**
     * @tc.name   testRegTest0037
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TEST_0037
     * @tc.desc   Test positive and negative lookahead combined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegTest0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /foo(?=bar)(?!baz)/;
      const result1 = regex.test("foobar");
      const result2 = regex.test("foobaz");
      expect(result1).assertEqual(true);
      expect(result2).assertEqual(false);
    });

    /**
     * @tc.name   testRegTest0038
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TEST_0038
     * @tc.desc   Test nested quantifiers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegTest0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /(ab+)+/;
      const result1 = regex.test("ab");
      const result2 = regex.test("abb");
      const result3 = regex.test("ababb");
      const result4 = regex.test("a");
      expect(result1).assertEqual(true);
      expect(result2).assertEqual(true);
      expect(result3).assertEqual(true);
      expect(result4).assertEqual(false);
    });

    /**
     * @tc.name   testRegTest0039
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TEST_0039
     * @tc.desc   Test escaped special characters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegTest0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /\$\^\*\+\?\.\(\)/;
      const str1 = "$^*+?.()";
      const str2 = "$^*+?.";
      expect(regex.test(str1)).assertEqual(true);
      expect(regex.test(str2)).assertEqual(false);
    });

    /**
     * @tc.name   testRegTest0040
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TEST_0040
     * @tc.desc   Test empty string with optional pattern
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegTest0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /a?/;
      expect(regex.test("")).assertEqual(true);
    });

    /**
     * @tc.name   testRegTest0041
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TEST_0041
     * @tc.desc   Test very long string with match at the end
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegTest0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "x".repeat(10000) + "foo";
      const regex = /foo$/;
      expect(regex.test(str)).assertEqual(true);
    });

    /**
     * @tc.name   testRegTest0042
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TEST_0042
     * @tc.desc   Test non-greedy match with nested groups
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegTest0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /<.*?>/;
      const str = "<div><span></span></div>";
      expect(regex.test(str)).assertEqual(true);
    });

    /**
     * @tc.name   testRegTest0043
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TEST_0043
     * @tc.desc   Test combination of \b word boundary and \d digit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegTest0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /\b\d+\b/;
      expect(regex.test("123")).assertEqual(true);
      expect(regex.test("abc123")).assertEqual(false);
    });

    /**
     * @tc.name   testRegTest0044
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TEST_0044
     * @tc.desc   Test consecutive global matches with lastIndex reset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegTest0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /foo/g;
      const str = "foo foo foo";
      expect(regex.test(str)).assertEqual(true);
      expect(regex.test(str)).assertEqual(true);
      regex.lastIndex = 0;
      expect(regex.test(str)).assertEqual(true);
    });

    /**
     * @tc.name   testRegTest0045
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TEST_0045
     * @tc.desc   Test lookbehind assertion (positive)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegTest0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /(?<=foo)bar/;
      expect(regex.test("foobar")).assertEqual(true);
      expect(regex.test("bar")).assertEqual(false);
    });

    /**
     * @tc.name   testRegTest0046
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TEST_0046
     * @tc.desc   Test positive lookbehind with multiple characters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegTest0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /(?<=foo)bar/;
      expect(regex.test("foobar")).assertEqual(true);
      expect(regex.test("foobaz")).assertEqual(false);
    });

    /**
     * @tc.name   testRegTest0047
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TEST_0047
     * @tc.desc   Test negative lookbehind
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegTest0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /(?<!foo)bar/;
      expect(regex.test("bar")).assertEqual(true);
      expect(regex.test("foobar")).assertEqual(false);
    });

    /**
     * @tc.name   testRegTest0048
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TEST_0048
     * @tc.desc   Test multi-line empty string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegTest0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /^$/m;
      const str = "\n\n";
      expect(regex.test(str)).assertEqual(true);
    });

    /**
     * @tc.name   testRegTest0049
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TEST_0049
     * @tc.desc   Test consecutive spaces matching
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegTest0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = / +/;
      expect(regex.test(" ")).assertEqual(true);
      expect(regex.test("    ")).assertEqual(true);
      expect(regex.test("a")).assertEqual(false);
    });

    /**
     * @tc.name   testRegTest0050
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TEST_0050
     * @tc.desc   Test high Unicode plane character matching
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegTest0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /\u{1F601}/u; // 😁 emoji
      expect(regex.test("😁")).assertEqual(true);
      expect(regex.test("😂")).assertEqual(false);
    });

    /**
     * @tc.name   testRegTest0051
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TEST_0051
     * @tc.desc   Test zero-width positive lookahead
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegTest0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /foo(?=bar)/;
      expect(regex.test("foobar")).assertEqual(true);
      expect(regex.test("foobaz")).assertEqual(false);
    });

    /**
     * @tc.name   testRegTest0052
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TEST_0052
     * @tc.desc   Test zero-width negative lookahead
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegTest0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /foo(?!bar)/;
      expect(regex.test("foobaz")).assertEqual(true);
      expect(regex.test("foobar")).assertEqual(false);
    });

    /**
     * @tc.name   testRegTest0053
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TEST_0053
     * @tc.desc   Test string with only whitespace characters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegTest0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /\S/;
      expect(regex.test("   ")).assertEqual(false);
      expect(regex.test("  a ")).assertEqual(true);
    });

    /**
     * @tc.name   testRegTest0054
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TEST_0054
     * @tc.desc   Test combination of digits, letters and boundaries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegTest0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /\b\d+[a-z]*\b/;
      expect(regex.test("123abc")).assertEqual(true);
      expect(regex.test("abc123")).assertEqual(false);
    });

    /**
     * @tc.name   testRegTest0055
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TEST_0055
     * @tc.desc   Test empty string with optional repeated pattern
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegTest0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /(a?)*b/;
      expect(regex.test("b")).assertEqual(true);
      expect(regex.test("ab")).assertEqual(true);
      expect(regex.test("aaab")).assertEqual(true);
      expect(regex.test("a")).assertEqual(false);
    });

    /**
     * @tc.name   testRegTest0056
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TEST_0056
     * @tc.desc   Test matching multiple emojis in sequence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegTest0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /\u{1F600}\u{1F603}/u; // 😀😃
      const str1 = "😀😃";
      const str2 = "😀😁";
      expect(regex.test(str1)).assertEqual(true);
      expect(regex.test(str2)).assertEqual(false);
    });

    /**
     * @tc.name   testRegTest0057
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TEST_0057
     * @tc.desc   Test matching repeated optional groups
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegTest0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /(ab?)+/;
      expect(regex.test("a")).assertEqual(true);
      expect(regex.test("ab")).assertEqual(true);
      expect(regex.test("abab")).assertEqual(true);
      expect(regex.test("b")).assertEqual(false);
    });

    /**
     * @tc.name   testRegTest0058
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TEST_0058
     * @tc.desc   Test non-greedy match with nested tags
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegTest0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /<.*?>/;
      const str = "<a><b></b></a>";
      expect(regex.test(str)).assertEqual(true);
    });

    /**
     * @tc.name   testRegTest0059
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TEST_0059
     * @tc.desc   Test multi-line string with anchors and /m flag
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegTest0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /^foo$/m;
      const str = "foo\nbar\nfoo";
      expect(regex.test(str)).assertEqual(true);
    });

    /**
     * @tc.name   testRegTest0060
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TEST_0060
     * @tc.desc   Test matching escaped special characters multiple times
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegTest0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /[\$\^\*\+\?\.\(\)]+/;
      const str1 = "$^*+?.()";
      const str2 = "$$^^**";
      const str3 = "abc";
      expect(regex.test(str1)).assertEqual(true);
      expect(regex.test(str2)).assertEqual(true);
      expect(regex.test(str3)).assertEqual(false);
    });

    /**
     * @tc.name   testRegTest0061
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TEST_0061
     * @tc.desc   Test consecutive global matches with reset lastIndex
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegTest0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /foo/g;
      const str = "foo foo foo";
      expect(regex.test(str)).assertEqual(true);
      expect(regex.test(str)).assertEqual(true);
      regex.lastIndex = 0;
      expect(regex.test(str)).assertEqual(true);
    });

    /**
     * @tc.name   testRegTest0062
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TEST_0062
     * @tc.desc   Test matching line start with ^ without /m flag
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegTest0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /^bar/;
      const str = "foo\nbar";
      expect(regex.test(str)).assertEqual(false);
    });

    /**
     * @tc.name   testRegTest0063
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TEST_0063
     * @tc.desc   Test matching line end with $ without /m flag
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegTest0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /foo$/;
      const str = "foo\nbar";
      expect(regex.test(str)).assertEqual(false);
    });

    /**
     * @tc.name   testRegTest0064
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TEST_0064
     * @tc.desc   Test string with zero-width non-breaking spaces
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegTest0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /\u00A0/;
      const str1 = "\u00A0";
      const str2 = " ";
      expect(regex.test(str1)).assertEqual(true);
      expect(regex.test(str2)).assertEqual(false);
    });

    /**
     * @tc.name   testRegTest0065
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TEST_0065
     * @tc.desc   Test matching multiple consecutive newlines
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegTest0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /\n{2,}/;
      const str1 = "\n\n";
      const str2 = "\n";
      const str3 = "abc";
      expect(regex.test(str1)).assertEqual(true);
      expect(regex.test(str2)).assertEqual(false);
      expect(regex.test(str3)).assertEqual(false);
    });

    /**
     * @tc.name   testRegTest0066
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TEST_0066
     * @tc.desc   Test positive lookbehind with multiple characters and /u flag
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegTest0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /(?<=\u{1F600})bar/u; // 😀bar
      expect(regex.test("😀bar")).assertEqual(true);
      expect(regex.test("😁bar")).assertEqual(false);
    });

    /**
     * @tc.name   testRegTest0067
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TEST_0067
     * @tc.desc   Test negative lookbehind with multiple characters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegTest0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /(?<!foo)bar/;
      expect(regex.test("bar")).assertEqual(true);
      expect(regex.test("foobar")).assertEqual(false);
    });

    /**
     * @tc.name   testRegTest0068
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TEST_0068
     * @tc.desc   Test multi-line string with multiple empty lines
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegTest0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /^$/gm;
      const str = "\n\n\n";
      expect(regex.test(str)).assertEqual(true);
    });

    /**
     * @tc.name   testRegTest0069
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TEST_0069
     * @tc.desc   Test matching multiple repeated Unicode characters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegTest0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /(\u{1F602})+/u; // 😂
      const str1 = "😂😂😂";
      const str2 = "😂😃";
      expect(regex.test(str1)).assertEqual(true);
      expect(regex.test(str2)).assertEqual(true); // matches first 😂
    });

    /**
     * @tc.name   testRegTest0070
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TEST_0070
     * @tc.desc   Test zero-width positive lookahead with multiple characters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegTest0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /foo(?=barbaz)/;
      expect(regex.test("foobarbaz")).assertEqual(true);
      expect(regex.test("foobar")).assertEqual(false);
    });

    /**
     * @tc.name   testRegTest0071
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TEST_0071
     * @tc.desc   Test zero-width negative lookahead with multiple characters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegTest0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /foo(?!barbaz)/;
      expect(regex.test("foobaz")).assertEqual(true);
      expect(regex.test("foobarbaz")).assertEqual(false);
    });

    /**
     * @tc.name   testRegTest0072
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TEST_0072
     * @tc.desc   Test matching long string with multiple patterns
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegTest0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /foo.*bar/;
      const str = "foo" + "x".repeat(1000) + "bar";
      expect(regex.test(str)).assertEqual(true);
    });

    /**
     * @tc.name   testRegTest0073
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TEST_0073
     * @tc.desc   Test matching string with mixed whitespace and non-whitespace characters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegTest0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /\S\s\S/;
      expect(regex.test("a b")).assertEqual(true);
      expect(regex.test("ab")).assertEqual(false);
    });

    /**
     * @tc.name   testRegTest0074
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TEST_0074
     * @tc.desc   Test matching string containing multiple escaped special characters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegTest0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /[\^\$\*\+\?\.\(\)\[\]\{\}\\]+/;
      expect(regex.test("^$*+?.()[]{}\\")).assertEqual(true);
      expect(regex.test("abc")).assertEqual(false);
    });

    /**
     * @tc.name   testRegTest0075
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TEST_0075
     * @tc.desc   Test matching very long empty string repeated patterns
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegTest0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /(a?)*b/;
      const str1 = "b";
      const str2 = "aaaaab";
      const str3 = "a";
      expect(regex.test(str1)).assertEqual(true);
      expect(regex.test(str2)).assertEqual(true);
      expect(regex.test(str3)).assertEqual(false);
    });

    /**
     * @tc.name   testRegTest0076
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TEST_0076
     * @tc.desc   Test ASCII lowercase to uppercase matching using /i flag
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegTest0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /a/i;
      expect(regex.test("A")).assertEqual(true);
      expect(regex.test("a")).assertEqual(true);
      expect(regex.test("b")).assertEqual(false);
    });

    /**
     * @tc.name   testRegTest0077
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TEST_0077
     * @tc.desc   Test Unicode Latin-1 Supplement characters with different cases
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegTest0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /\u00C7/i; // Ç
      expect(regex.test("ç")).assertEqual(true);
      expect(regex.test("Ç")).assertEqual(true);
      expect(regex.test("c")).assertEqual(false);
    });

    /**
     * @tc.name   testRegTest0078
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TEST_0078
     * @tc.desc   Test Unicode with combining diacritical marks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegTest0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /e\u0301/i; // e + ´ (é)
      expect(regex.test("é")).assertEqual(false);
      expect(regex.test("E\u0301")).assertEqual(true); // uppercase e + combining accent
      expect(regex.test("e")).assertEqual(false);
    });

    /**
     * @tc.name   testRegTest0079
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TEST_0079
     * @tc.desc   Test full-width ASCII characters uppercase/lowercase matching
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegTest0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /Ａ/i; // Full-width A
      expect(regex.test("ａ")).assertEqual(true); // Full-width a
      expect(regex.test("Ａ")).assertEqual(true);
      expect(regex.test("B")).assertEqual(false);
    });

    /**
     * @tc.name   testRegTest0080
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TEST_0080
     * @tc.desc   Test Unicode Greek uppercase/lowercase matching
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegTest0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /σ/i; // Greek small sigma
      expect(regex.test("Σ")).assertEqual(true); // Greek capital sigma
      expect(regex.test("σ")).assertEqual(true);
      expect(regex.test("ς")).assertEqual(true);
    });

    /**
     * @tc.name   testRegTest0081
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TEST_0081
     * @tc.desc   Test Cyrillic uppercase/lowercase matching
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegTest0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /д/i; // Cyrillic small letter de
      expect(regex.test("Д")).assertEqual(true); // Cyrillic capital letter DE
      expect(regex.test("д")).assertEqual(true);
      expect(regex.test("дд")).assertEqual(true);
      expect(regex.test("Дд")).assertEqual(true);
    });

    /**
     * @tc.name   testRegTest0082
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TEST_0082
     * @tc.desc   Test Latin Extended-A uppercase/lowercase matching
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegTest0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /Ĥ/i; // Latin Extended-A capital H with circumflex
      expect(regex.test("ĥ")).assertEqual(true);
      expect(regex.test("Ĥ")).assertEqual(true);
      expect(regex.test("H")).assertEqual(false);
    });

    /**
     * @tc.name   testRegTest0083
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TEST_0083
     * @tc.desc   Test Latin Extended-A small letter with acute accent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegTest0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /Ō/i; // Latin capital O with macron
      expect(regex.test("ō")).assertEqual(true);
      expect(regex.test("Ō")).assertEqual(true);
      expect(regex.test("o")).assertEqual(false);
    });

    /**
     * @tc.name   testRegTest0084
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TEST_0084
     * @tc.desc   Test Latin Extended-B uppercase/lowercase matching
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegTest0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /Ȳ/i; // Latin capital Y with macron
      expect(regex.test("ȳ")).assertEqual(true);
      expect(regex.test("Ȳ")).assertEqual(true);
      expect(regex.test("Y")).assertEqual(false);
    });

    /**
     * @tc.name   testRegTest0085
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TEST_0085
     * @tc.desc   Test combination of letter + combining diacritical mark with /i flag
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegTest0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /a\u030A/i; // a + ring above
      expect(regex.test("å")).assertEqual(false); // precomposed
      expect(regex.test("A\u030A")).assertEqual(true); // uppercase + combining
      expect(regex.test("a")).assertEqual(false);
    });

    /**
     * @tc.name   testRegTest0091
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TEST_0091
     * @tc.desc   Test RegExp.test()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegTest0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const re = new RegExp('^.$', 'u');
      expect(re.test("a")).assertEqual(true);
      expect(re.test("3")).assertEqual(true);
      expect(re.test("π")).assertEqual(true);
      expect(re.test("\u2027")).assertEqual(true);
      expect(re.test("\u0085")).assertEqual(true);
      expect(re.test("\v")).assertEqual(true);
      expect(re.test("\f")).assertEqual(true);
      expect(re.test("\u180E")).assertEqual(true);
      expect(re.test("\u{10300}")).assertEqual(true);
      expect(!re.test("\n")).assertEqual(true);
      expect(!re.test("\r")).assertEqual(true);
      expect(!re.test("\u2028")).assertEqual(true);
      expect(!re.test("\u2029")).assertEqual(true);
      expect(re.test("\uD800")).assertEqual(true);
      expect(re.test("\uDFFF")).assertEqual(true);
    });

    /**
     * @tc.name   testRegTest0092
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TEST_0092
     * @tc.desc   Test RegExp.test()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegTest0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const re = new RegExp('^.$', 'um');
      expect(re.test("a")).assertEqual(true);
      expect(re.test("3")).assertEqual(true);
      expect(re.test("π")).assertEqual(true);
      expect(re.test("\u2027")).assertEqual(true);
      expect(re.test("\u0085")).assertEqual(true);
      expect(re.test("\v")).assertEqual(true);
      expect(re.test("\f")).assertEqual(true);
      expect(re.test("\u180E")).assertEqual(true);
      expect(re.test("\u{10300}")).assertEqual(true);
      expect(!re.test("\n")).assertEqual(true);
      expect(!re.test("\r")).assertEqual(true);
      expect(!re.test("\u2028")).assertEqual(true);
      expect(!re.test("\u2029")).assertEqual(true);
      expect(re.test("\uD800")).assertEqual(true);
      expect(re.test("\uDFFF")).assertEqual(true);
    });
    /**
     * @tc.name   testRegExec0001
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_0001
     * @tc.desc   Verify exec() returns full match, capture groups, index, input and groups properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExec0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /(\w+)\s(\w+)/;
      const str = "Hello World";
      const result = regex.exec(str);

      expect(result![0]).assertEqual("Hello World");
      expect(result![1]).assertEqual("Hello");
      expect(result![2]).assertEqual("World");
      expect(result!.index).assertEqual(0);
      expect(result!.input).assertEqual("Hello World");
    });

    /**
     * @tc.name   testRegExec0002
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_0002
     * @tc.desc   Verify exec() returns null and resets lastIndex to 0 when no match is found with global flag
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExec0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /foo/g;
      const str = "bar";
      regex.lastIndex = 5;
      const result = regex.exec(str);
      expect(result).assertEqual(null);
      expect(regex.lastIndex).assertEqual(0);
    });

    /**
     * @tc.name   testRegExec0003
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_0003
     * @tc.desc   Verify exec() iterates through all matches with global flag and updates lastIndex
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExec0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /foo/g;
      const str = "foo foo foo";
      const results: string[] = [];
      let match: RegExpExecArray | null;

      while ((match = regex.exec(str)) !== null) {
        results.push(match[0]);
      }

      expect(results.length).assertEqual(3);
      expect(results[0]).assertEqual("foo");
      expect(regex.lastIndex).assertEqual(0);
    });

    /**
     * @tc.name   testRegExec0004
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_0004
     * @tc.desc   Verify exec() without global flag always returns the same match and lastIndex remains 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExec0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /foo/;
      const str = "foo foo";
      const first = regex.exec(str);
      const second = regex.exec(str);

      expect(first![0]).assertEqual("foo");
      expect(second![0]).assertEqual("foo");
      expect(regex.lastIndex).assertEqual(0);
    });

    /**
     * @tc.name   testRegExec0005
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_0005
     * @tc.desc   Verify capture groups return undefined when unmatched, and last group overwrites previous
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExec0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /(ab)|(cd)/;
      const str1 = "cd";
      const str2 = "abab";

      const match1 = regex.exec(str1);
      expect(match1![1]).assertEqual(undefined);
      expect(match1![2]).assertEqual("cd");

      const regex2 = /(a(b))+/;
      const match2 = regex2.exec(str2);
      expect(match2![1]).assertEqual("ab");
      expect(match2![2]).assertEqual("b"); // last captured value of inner group
    });

    /**
     * @tc.name   testRegExec0006
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_0006
     * @tc.desc   Verify exec() returns named capture groups correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExec0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /(?<first>\w+)\s(?<second>\w+)/;
      const str = "Hello World";
      const result = regex.exec(str);

      expect(result!.groups!.first).assertEqual("Hello");
      expect(result!.groups!.second).assertEqual("World");
      expect(result![0]).assertEqual("Hello World");
    });

    /**
     * @tc.name   testRegExec0007
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_0007
     * @tc.desc   Verify exec() with sticky flag /y only matches at lastIndex position
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExec0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /foo/y;
      const str = "foo foo";
      regex.lastIndex = 0;
      const first = regex.exec(str);
      expect(first![0]).assertEqual("foo");

      regex.lastIndex = 3;
      const second = regex.exec(str);
      expect(second).assertEqual(null); // sticky match fails at space
    });

    /**
     * @tc.name   testRegExec0008
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_0008
     * @tc.desc   Verify exec() with Unicode flag /u correctly matches surrogate pairs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExec0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /\u{1F600}/u; // 😀
      const str = "Say 😀 hi";
      const result = regex.exec(str);
      expect(result![0]).assertEqual("😀");
      expect(result!.index).assertEqual(4);
    });

    /**
     * @tc.name   testRegExec0009
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_0009
     * @tc.desc   Verify exec() returns null after last match when using global flag
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExec0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /foo/g;
      const str = "foo bar foo";
      regex.exec(str);
      regex.exec(str);
      const last = regex.exec(str);
      expect(last).assertEqual(null);
      expect(regex.lastIndex).assertEqual(0);
    });

    /**
     * @tc.name   testRegExec0010
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_0010
     * @tc.desc   Verify exec() handles zero-width match correctly and advances lastIndex
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExec0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /(?=a)/g; // zero-width positive lookahead
      const str = "aaa";
      const results: number[] = [];
      let match: RegExpExecArray | null;

      while ((match = regex.exec(str)) !== null) {
        results.push(match.index);
        if (regex.lastIndex === match.index) regex.lastIndex++; // prevent infinite loop
      }

      expect(results).assertDeepEquals([0, 1, 2]);
    });

    /**
     * @tc.name   testRegExec0011
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_0011
     * @tc.desc   Verify exec() respects multiline flag /m for ^ and $
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExec0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /^foo/m;
      const str = "bar\nfoo\nbaz";
      const result = regex.exec(str);
      expect(result![0]).assertEqual("foo");
      expect(result!.index).assertEqual(4);
    });

    /**
     * @tc.name   testRegExec0012
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_0012
     * @tc.desc   Verify exec() correctly returns undefined for unmatched optional groups
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExec0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /(a)?b/;
      const str = "b";
      const result = regex.exec(str);
      expect(result![1]).assertEqual(undefined);
      expect(result![0]).assertEqual("b");
    });

    /**
     * @tc.name   testRegExec0013
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_0013
     * @tc.desc   Verify exec() updates lastIndex correctly after partial match with /y flag
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExec0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /ab/y;
      const str = "ab ab";
      regex.lastIndex = 0;
      const first = regex.exec(str);
      expect(first![0]).assertEqual("ab");
      expect(regex.lastIndex).assertEqual(2);

      const second = regex.exec(str);
      expect(second).assertEqual(null);
    });

    /**
     * @tc.name   testRegExec0014
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_0014
     * @tc.desc   Verify exec() works with nested capturing groups
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExec0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /(a(b(c)))/;
      const str = "abc";
      const result = regex.exec(str);
      expect(result![1]).assertEqual("abc");
      expect(result![2]).assertEqual("bc");
      expect(result![3]).assertEqual("c");
    });

    /**
     * @tc.name   testRegExec0015
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_0015
     * @tc.desc   Verify exec() returns last matched group value when groups repeat with quantifiers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExec0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /(ab)+/;
      const str = "abab";
      const result = regex.exec(str);
      expect(result![1]).assertEqual("ab"); // last captured group
    });

    /**
     * @tc.name   testRegExec0016
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_0016
     * @tc.desc   Verify exec() ignores non-capturing groups (?:...) in result indices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExec0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /(?:foo)(bar)/;
      const str = "foobar";
      const result = regex.exec(str);
      expect(result![1]).assertEqual("bar");
      expect(result![0]).assertEqual("foobar");
    });

    /**
     * @tc.name   testRegExec0018
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_0018
     * @tc.desc   Verify exec() respects dotAll flag /s so '.' matches newline characters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExec0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /foo.bar/s;
      const str = "foo\nbar";
      const result = regex.exec(str);
      expect(result![0]).assertEqual("foo\nbar");
    });

    /**
     * @tc.name   testRegExec0019
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_0019
     * @tc.desc   Verify exec() returns correct index when using word boundary \\b
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExec0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /\bword\b/;
      const str = "a word here";
      const result = regex.exec(str);
      expect(result![0]).assertEqual("word");
      expect(result!.index).assertEqual(2);
    });

    /**
     * @tc.name   testRegExec0020
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_0020
     * @tc.desc   Verify exec() returns null for non-word-boundary \\B when no match
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExec0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /\Bbar/;
      const str = " bar";
      const result = regex.exec(str);
      expect(result).assertEqual(null);
    });

    /**
     * @tc.name   testRegExec0021
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_0021
     * @tc.desc   Verify exec() matches multiple times with global flag and resets correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExec0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /\d+/g;
      const str = "1 22 333";
      const results: string[] = [];
      let match: RegExpExecArray | null;
      while ((match = regex.exec(str)) !== null) {
        results.push(match[0]);
      }
      expect(results).assertDeepEquals(["1", "22", "333"]);
    });

    /**
     * @tc.name   testRegExec0022
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_0022
     * @tc.desc   Verify exec() handles empty string input correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExec0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /a*/;
      const str = "";
      const result = regex.exec(str);
      expect(result![0]).assertEqual("");
      expect(result!.index).assertEqual(0);
    });

    /**
     * @tc.name   testRegExec0023
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_0023
     * @tc.desc   Verify exec() with manual lastIndex adjustment can skip matches
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExec0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /foo/g;
      const str = "foo foo foo";
      regex.lastIndex = 4;
      const result = regex.exec(str);
      expect(result![0]).assertEqual("foo");
      expect(result!.index).assertEqual(4);
    });

    /**
     * @tc.name   testRegExec0024
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_0024
     * @tc.desc   Verify exec() returns correct match when pattern ends with lookbehind
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExec0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /(?<=foo)bar/;
      const str = "foobar";
      const result = regex.exec(str);
      expect(result![0]).assertEqual("bar");
      expect(result!.index).assertEqual(3);
    });

    /**
     * @tc.name   testRegExec0025
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_0025
     * @tc.desc   Verify exec() handles backreference in pattern correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExec0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /(ha)\1/;
      const str = "hahaha";
      const result = regex.exec(str);
      expect(result![0]).assertEqual("haha");
      expect(result![1]).assertEqual("ha");
    });

    /**
     * @tc.name   testRegExec0026
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_0026
     * @tc.desc   Verify exec() correctly matches digits using character class \\d
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExec0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /\d+/;
      const str = "abc123def";
      const result = regex.exec(str);
      expect(result![0]).assertEqual("123");
      expect(result!.index).assertEqual(3);
    });

    /**
     * @tc.name   testRegExec0027
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_0027
     * @tc.desc   Verify exec() correctly matches whitespace using \\s
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExec0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /\s+/;
      const str = "a   b";
      const result = regex.exec(str);
      expect(result![0]).assertEqual("   ");
    });

    /**
     * @tc.name   testRegExec0028
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_0028
     * @tc.desc   Verify exec() correctly handles alternation (|) operator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExec0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /cat|dog/;
      const str = "dog and cat";
      const result = regex.exec(str);
      expect(result![0]).assertEqual("dog");
      expect(result!.index).assertEqual(0);
    });

    /**
     * @tc.name   testRegExec0029
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_0029
     * @tc.desc   Verify exec() works correctly with escaped special characters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExec0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /\./;
      const str = "3.14";
      const result = regex.exec(str);
      expect(result![0]).assertEqual(".");
      expect(result!.index).assertEqual(1);
    });

    /**
     * @tc.name   testRegExec0030
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_0030
     * @tc.desc   Verify exec() correctly returns null for unmatched input
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExec0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /xyz/;
      const str = "abc";
      const result = regex.exec(str);
      expect(result).assertEqual(null);
    });

    /**
     * @tc.name   testRegExec0031
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_0031
     * @tc.desc   Verify exec() works with RegExp constructed dynamically via new RegExp()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExec0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const pattern = "foo\\d+";
      const regex = new RegExp(pattern);
      const str = "foo123bar";
      const result = regex.exec(str);
      expect(result![0]).assertEqual("foo123");
    });

    /**
     * @tc.name   testRegExec0032
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_0032
     * @tc.desc   Verify exec() correctly matches across multiple lines with multiline flag /m
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExec0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /^bar/m;
      const str = "foo\nbar\nbaz";
      const result = regex.exec(str);
      expect(result![0]).assertEqual("bar");
      expect(result!.index).assertEqual(4);
    });

    /**
     * @tc.name   testRegExec0033
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_0033
     * @tc.desc   Verify exec() handles Unicode characters correctly without /u flag
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExec0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /😀/;
      const str = "test😀emoji";
      const result = regex.exec(str);
      expect(result![0]).assertEqual("😀");
    });

    /**
     * @tc.name   testRegExec0034
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_0034
     * @tc.desc   Verify exec() handles Unicode surrogate pair correctly with /u flag
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExec0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /\u{1F600}/u; // 😀
      const str = "smile😀test";
      const result = regex.exec(str);
      expect(result![0]).assertEqual("😀");
    });

    /**
     * @tc.name   testRegExec0035
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_0035
     * @tc.desc   Verify exec() handles repeated capture groups correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExec0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /(a(b))+/;
      const str = "abab";
      const result = regex.exec(str);
      expect(result![1]).assertEqual("ab");
      expect(result![2]).assertEqual("b");
    });

    /**
     * @tc.name   testRegExec0036
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_0036
     * @tc.desc   Verify exec() handles zero-length matches correctly without infinite loop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExec0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /(?=a)/g;
      const str = "aaa";
      const results: number[] = [];
      let match: RegExpExecArray | null;
      while ((match = regex.exec(str)) !== null) {
        results.push(match.index);
        regex.lastIndex++;
      }
      expect(results).assertDeepEquals([0, 1, 2]);
    });

    /**
     * @tc.name   testRegExec0037
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_0037
     * @tc.desc   Verify exec() handles nested capture groups and indexes correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExec0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /((foo)(bar))/;
      const str = "foobar";
      const result = regex.exec(str);
      expect(result![1]).assertEqual("foobar");
      expect(result![2]).assertEqual("foo");
      expect(result![3]).assertEqual("bar");
    });

    /**
     * @tc.name   testRegExec0038
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_0038
     * @tc.desc   Verify exec() handles alternation with group capturing correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExec0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /(foo)|(bar)/;
      const str = "bar";
      const result = regex.exec(str);
      expect(result![1]).assertEqual(undefined);
      expect(result![2]).assertEqual("bar");
    });

    /**
     * @tc.name   testRegExec0039
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_0039
     * @tc.desc   Verify exec() handles case-insensitive matching with /i flag
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExec0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /hello/i;
      const str = "HeLLo world";
      const result = regex.exec(str);
      expect(result![0]).assertEqual("HeLLo");
    });

    /**
     * @tc.name   testRegExec0040
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_0040
     * @tc.desc   Verify exec() correctly handles lookahead assertion (?=)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExec0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /\d(?=px)/;
      const str = "10px";
      const result = regex.exec(str);
      expect(result![0]).assertEqual("0");
    });

    /**
     * @tc.name   testRegExec0041
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_0041
     * @tc.desc   Verify exec() correctly handles negative lookahead (?!)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExec0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /foo(?!bar)/;
      const str = "foobar foo";
      const result = regex.exec(str);
      expect(result![0]).assertEqual("foo");
      expect(result!.index).assertEqual(7);
    });

    /**
     * @tc.name   testRegExec0042
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_0042
     * @tc.desc   Verify exec() correctly matches beginning-of-string anchor ^
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExec0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /^foo/;
      const str = "foobar";
      const result = regex.exec(str);
      expect(result![0]).assertEqual("foo");
      expect(result!.index).assertEqual(0);
    });

    /**
     * @tc.name   testRegExec0043
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_0043
     * @tc.desc   Verify exec() correctly matches end-of-string anchor $
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExec0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /bar$/;
      const str = "foo bar";
      const result = regex.exec(str);
      expect(result![0]).assertEqual("bar");
    });

    /**
     * @tc.name   testRegExec0044
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_0044
     * @tc.desc   Verify exec() with global flag preserves state between executions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExec0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /\w+/g;
      const str = "one two three";
      const first = regex.exec(str);
      const second = regex.exec(str);
      expect(first![0]).assertEqual("one");
      expect(second![0]).assertEqual("two");
    });

    /**
     * @tc.name   testRegExec0045
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_0045
     * @tc.desc   Verify exec() resets lastIndex to 0 after full global scan
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExec0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /\d/g;
      const str = "123";
      while (regex.exec(str)) { /* exhaust matches */ }
      expect(regex.lastIndex).assertEqual(0);
    });

    /**
     * @tc.name   testRegExec0046
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_0046
     * @tc.desc   Verify exec() handles special backslash escape sequences like \\t correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExec0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /\t/;
      const str = "a\tb";
      const result = regex.exec(str);
      expect(result![0]).assertEqual("\t");
    });

    /**
     * @tc.name   testRegExec0047
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_0047
     * @tc.desc   Verify exec() correctly matches non-digit character \\D
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExec0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /\D/;
      const str = "9a";
      const result = regex.exec(str);
      expect(result![0]).assertEqual("a");
    });

    /**
     * @tc.name   testRegExec0048
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_0048
     * @tc.desc   Verify exec() correctly matches non-word character \\W
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExec0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /\W/;
      const str = "abc!";
      const result = regex.exec(str);
      expect(result![0]).assertEqual("!");
    });

    /**
     * @tc.name   testRegExec0049
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_0049
     * @tc.desc   Verify exec() correctly matches multiple groups and maintains order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExec0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /(\d+)-(\w+)/;
      const str = "12-ab";
      const result = regex.exec(str);
      expect(result![1]).assertEqual("12");
      expect(result![2]).assertEqual("ab");
    });

    /**
     * @tc.name   testRegExec0050
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_0050
     * @tc.desc   Verify exec() correctly matches string with quantifiers {n,m}
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExec0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /a{2,3}/;
      const str = "baaa";
      const result = regex.exec(str);
      expect(result![0]).assertEqual("aaa");
    });

    /**
     * @tc.name   testRegExec0051
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_0051
     * @tc.desc   Test named capturing groups in exec() result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExec0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /(?<area>\d{3})-(?<num>\d{4})/;
      const result = regex.exec("Call 123-4567");
      expect(result?.groups?.area).assertEqual("123");
      expect(result?.groups?.num).assertEqual("4567");
    });

    /**
     * @tc.name   testRegExec0052
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_0052
     * @tc.desc   Test non-capturing group (?:...) not stored in result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExec0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /(?:foo)(bar)/;
      const result = regex.exec("foobar");
      expect(result?.length).assertEqual(2);
      expect(result?.[1]).assertEqual("bar");
    });

    /**
     * @tc.name   testRegExec0053
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_0053
     * @tc.desc   Test exec() with backreference \\1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExec0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /(\w+)\s\1/;
      const result = regex.exec("hello hello world");
      expect(result?.[1]).assertEqual("hello");
    });

    /**
     * @tc.name   testRegExec0054
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_0054
     * @tc.desc   Test zero-width positive lookahead (?=...) pattern
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExec0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /\d(?=\D)/;
      const result = regex.exec("5a");
      expect(result?.[0]).assertEqual("5");
    });

    /**
     * @tc.name   testRegExec0055
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_0055
     * @tc.desc   Test zero-width negative lookahead (?!...) pattern
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExec0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /\d(?!\d)/;
      const result = regex.exec("12a");
      expect(result?.[0]).assertEqual("2");
    });

    /**
     * @tc.name   testRegExec0056
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_0056
     * @tc.desc   Test exec() with nested capturing groups
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExec0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /(a(b(c)))/;
      const result = regex.exec("abc");
      expect(result?.[1]).assertEqual("abc");
      expect(result?.[2]).assertEqual("bc");
      expect(result?.[3]).assertEqual("c");
    });

    /**
     * @tc.name   testRegExec0057
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_0057
     * @tc.desc   Test exec() with multiline flag /m and ^ anchor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExec0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /^foo/m;
      const result = regex.exec("bar\nfoo\nbaz");
      expect(result?.[0]).assertEqual("foo");
    });

    /**
     * @tc.name   testRegExec0058
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_0058
     * @tc.desc   Test exec() with unicode flag /u matching surrogate pairs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExec0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /\u{1F600}/u; // 😀 emoji
      const result = regex.exec("Hello😀World");
      expect(result?.[0]).assertEqual("😀");
    });

    /**
     * @tc.name   testRegExec0059
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_0059
     * @tc.desc   Test exec() with hexadecimal escape \\xNN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExec0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /\x41/; // 'A'
      const result = regex.exec("ABC");
      expect(result?.[0]).assertEqual("A");
    });

    /**
     * @tc.name   testRegExec0060
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_0060
     * @tc.desc   Test exec() with escaped backslash and digits
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExec0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /\\d/;
      const result = regex.exec("number: \\d123");
      expect(result?.[0]).assertEqual("\\d");
    });

    /**
     * @tc.name   testRegExec0061
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_0061
     * @tc.desc   Test exec() with alternation pattern (a|b)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExec0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /(cat|dog)/;
      const result = regex.exec("doghouse");
      expect(result?.[1]).assertEqual("dog");
    });

    /**
     * @tc.name   testRegExec0062
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_0062
     * @tc.desc   Test exec() with optional group (ab)?
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExec0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /(ab)?c/;
      const result = regex.exec("c");
      expect(result?.[1]).assertEqual(undefined);
    });

    /**
     * @tc.name   testRegExec0063
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_0063
     * @tc.desc   Test exec() with multiple matches under global flag /g
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExec0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /\d+/g;
      const str = "1 22 333";
      const first = regex.exec(str);
      const second = regex.exec(str);
      expect(first?.[0]).assertEqual("1");
      expect(second?.[0]).assertEqual("22");
    });

    /**
     * @tc.name   testRegExec0064
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_0064
     * @tc.desc   Test exec() with lastIndex reset after non-match under /g
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExec0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /\d+/g;
      regex.exec("abc"); // no match
      expect(regex.lastIndex).assertEqual(0);
    });

    /**
     * @tc.name   testRegExec0065
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_0065
     * @tc.desc   Test exec() with sticky flag /y at specific index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExec0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /\d+/y;
      regex.lastIndex = 4;
      const result = regex.exec("abc 123");
      expect(result?.[0]).assertEqual("123");
    });

    /**
     * @tc.name   testRegExec0066
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_0066
     * @tc.desc   Test exec() when regex matches at string end
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExec0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /end$/;
      const result = regex.exec("the end");
      expect(result?.[0]).assertEqual("end");
    });

    /**
     * @tc.name   testRegExec0067
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_0067
     * @tc.desc   Test exec() with \n newline character
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExec0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /line\nnext/;
      const result = regex.exec("line\nnext");
      expect(result?.[0]).assertEqual("line\nnext");
    });

    /**
     * @tc.name   testRegExec0068
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_0068
     * @tc.desc   Test exec() returning null for no match
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExec0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /xyz/;
      const result = regex.exec("abc");
      expect(result).assertEqual(null);
    });

    /**
     * @tc.name   testRegExec0069
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_0069
     * @tc.desc   Test exec() with escaped parentheses \\( and \\)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExec0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /\(abc\)/;
      const result = regex.exec("contains (abc)");
      expect(result?.[0]).assertEqual("(abc)");
    });

    /**
     * @tc.name   testRegExec0070
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_0070
     * @tc.desc   Test exec() with complex nested alternation pattern
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExec0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /(foo|bar(baz)?)/;
      const result = regex.exec("barbaz");
      expect(result?.[1]).assertEqual("barbaz");
    });

    /**
     * @tc.name   testRegExec0071
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_0071
     * @tc.desc   Test exec() with very long string input
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExec0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const longStr = "a".repeat(10000) + "pattern";
      const regex = /pattern/;
      const result = regex.exec(longStr);
      expect(result?.[0]).assertEqual("pattern");
    });

    /**
     * @tc.name   testRegExec0072
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_0072
     * @tc.desc   Test exec() with empty string input
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExec0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /.*/;
      const result = regex.exec("");
      expect(result?.[0]).assertEqual("");
    });

    /**
     * @tc.name   testRegExec0073
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_0073
     * @tc.desc   Test exec() with RegExp.lastIndex manually set out of range
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExec0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /\d+/g;
      regex.lastIndex = 9999;
      const result = regex.exec("1234");
      expect(result).assertEqual(null);
    });

    /**
     * @tc.name   testRegExec0074
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_0074
     * @tc.desc   Test exec() with multiline + global flags interaction
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExec0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /^\w+/gm;
      const text = "first line\nsecond line";
      const first = regex.exec(text);
      const second = regex.exec(text);
      expect(first?.[0]).assertEqual("first");
      expect(second?.[0]).assertEqual("second");
    });

    /**
     * @tc.name   testRegExec0076
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_0076
     * @tc.desc   Test exec() with non-string coercible input (boolean)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    // it('testRegExec0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   const regex = /true/;
    //   const result = regex.exec(true as unknown as string);
    //   expect(result?.[0]).assertEqual("true");
    // });

    /**
     * @tc.name   testRegExec0077
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_0077
     * @tc.desc   Test exec() with complex Unicode string (grapheme clusters)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExec0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /\u{1F469}\u{200D}\u{1F467}/u; // 👩‍👧 family emoji
      const result = regex.exec("Test👩‍👧Done");
      expect(result?.[0]).assertEqual("👩‍👧");
    });

    /**
     * @tc.name   testRegExec0078
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_0078
     * @tc.desc   Test exec() with sticky flag and newline boundary
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExec0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /\w+/y;
      const text = "abc\ndef";
      regex.lastIndex = 4;
      const result = regex.exec(text);
      expect(result?.[0]).assertEqual("def");
    });

    /**
     * @tc.name   testRegExec0079
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_0079
     * @tc.desc   Test exec() returning capture groups even if unmatched (undefined)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExec0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /(foo)?(bar)/;
      const result = regex.exec("bar");
      expect(result?.[1]).assertEqual(undefined);
      expect(result?.[2]).assertEqual("bar");
    });

    /**
     * @tc.name   testRegExec0080
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_0080
     * @tc.desc   Test exec() with multiple optional capturing groups
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExec0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /(a)?(b)?(c)?/;
      const result = regex.exec("ac");
      expect(result?.[1]).assertEqual("a");
      expect(result?.[2]).assertEqual(undefined);
      expect(result?.[3]).assertEqual("c");
    });

    /**
     * @tc.name   testRegExec0081
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_0081
     * @tc.desc   Test exec() with capture group referencing out-of-order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExec0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /(foo)(bar)?\1/;
      const result = regex.exec("foobarfoo");
      expect(result?.[1]).assertEqual("foo");
    });

    /**
     * @tc.name   testRegExec0082
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_0082
     * @tc.desc   Test exec() with whitespace and \\s pattern
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExec0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /\s+/;
      const result = regex.exec("abc   def");
      expect(result?.[0]).assertEqual("   ");
    });

    /**
     * @tc.name   testRegExec0083
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_0083
     * @tc.desc   Test exec() with multiline and $ anchor at end of each line
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExec0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /end$/gm;
      const text = "a end\nb end";
      const first = regex.exec(text);
      const second = regex.exec(text);
      expect(first?.[0]).assertEqual("end");
      expect(second?.[0]).assertEqual("end");
    });

    /**
     * @tc.name   testRegExec0084
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_0084
     * @tc.desc   Test exec() with alternation and Unicode flag /u
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExec0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /(\u{41}|A)/u;
      const result = regex.exec("A");
      expect(result?.[1]).assertEqual("A");
    });

    /**
     * @tc.name   testRegExec0085
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_0085
     * @tc.desc   Test exec() with capture group repeating pattern
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExec0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /(ab)+/;
      const result = regex.exec("abababx");
      expect(result?.[0]).assertEqual("ababab");
    });

    /**
     * @tc.name   testRegExec0086
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_0086
     * @tc.desc   Test exec() with escaped special characters \\* and \\+
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExec0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /\*/;
      const result = regex.exec("a*b");
      expect(result?.[0]).assertEqual("*");
    });

    /**
     * @tc.name   testRegExec0087
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_0087
     * @tc.desc   Test exec() with invalid UTF-16 surrogate halves still working under /u flag
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExec0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /\uD800/u;
      const result = regex.exec("\uD800");
      expect(result?.[0]).assertEqual("\uD800");
    });

    /**
     * @tc.name   testRegExec0088
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_0088
     * @tc.desc   Test exec() with regex constructed via RegExp constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExec0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = new RegExp("foo", "g");
      const result = regex.exec("foo bar");
      expect(result?.[0]).assertEqual("foo");
    });

    /**
     * @tc.name   testRegExec0090
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_0090
     * @tc.desc   Test exec() with empty capturing group () returning empty string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExec0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /()/;
      const result = regex.exec("abc");
      expect(result?.[1]).assertEqual("");
    });

    /**
     * @tc.name   testRegExec0091
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_0091
     * @tc.desc   Test exec() with multiple backtracking groups (performance edge)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExec0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /(a+)+b/;
      const result = regex.exec("aaaaaaab");
      expect(result?.[0]).assertEqual("aaaaaaab");
    });

    /**
     * @tc.name   testRegExec0092
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_0092
     * @tc.desc   Test exec() with sticky flag /y across multiple calls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExec0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /\w+/y;
      const text = "abc def ghi";
      let match1 = regex.exec(text);
      regex.lastIndex += 1; // skip space
      let match2 = regex.exec(text);
      expect(match1?.[0]).assertEqual("abc");
      expect(match2?.[0]).assertEqual("def");
    });

    /**
     * @tc.name   testRegExec0093
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_0093
     * @tc.desc   Test exec() with global + unicode flags and surrogate pairs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExec0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /\u{1F600}/gu; // 😀 emoji
      const str = "😀😀😀";
      let result1 = regex.exec(str);
      let result2 = regex.exec(str);
      expect(result1?.[0]).assertEqual("😀");
      expect(result2?.[0]).assertEqual("😀");
    });

    /**
     * @tc.name   testRegExec0094
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_0094
     * @tc.desc   Test exec() with empty string and global flag /g
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExec0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /()/g;
      const result = regex.exec("");
      expect(result?.[0]).assertEqual("");
    });

    /**
     * @tc.name   testRegExec0095
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_0095
     * @tc.desc   Test exec() with optional and nested groups
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExec0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /((a)b?)?c/;
      const result = regex.exec("ac");
      expect(result?.[1]).assertEqual("a");
      expect(result?.[2]).assertEqual("a");
    });

    /**
     * @tc.name   testRegExec0096
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_0096
     * @tc.desc   Test exec() with repeated empty capturing groups
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExec0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /()()()()/;
      const result = regex.exec("x");
      expect(result?.[1]).assertEqual("");
      expect(result?.[2]).assertEqual("");
      expect(result?.[3]).assertEqual("");
      expect(result?.[4]).assertEqual("");
    });

    /**
     * @tc.name   testRegExec0097
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_0097
     * @tc.desc   Test exec() with zero-width lookbehind (?<=...) pattern
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExec0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /(?<=\$)\d+/;
      const result = regex.exec("Price is $100");
      expect(result?.[0]).assertEqual("100");
    });

    /**
     * @tc.name   testRegExec0098
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_0098
     * @tc.desc   Test exec() with negative lookbehind (?<!...) pattern
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExec0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /(?<!\$)\d+/;
      const result = regex.exec("100 $200");
      expect(result?.[0]).assertEqual("100");
    });

    /**
     * @tc.name   testRegExec0099
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_0099
     * @tc.desc   Test exec() with alternating optional patterns for edge matching
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExec0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /(foo)?(bar)?/;
      const result = regex.exec("");
      expect(result?.[1]).assertEqual(undefined);
      expect(result?.[2]).assertEqual(undefined);
    });

    /**
     * @tc.name   testRegExec0100
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_0100
     * @tc.desc   Test exec() with very large number of repeated groups
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExec0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /(a?){100}/;
      const result = regex.exec("aaaa");
      expect(result?.[0]).assertEqual("aaaa");
    });

    /**
     * @tc.name   testRegExec0101
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_0101
     * @tc.desc   Test exec() with \b word boundary
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExec0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /\bcat\b/;
      const result = regex.exec("a cat in hat");
      expect(result?.[0]).assertEqual("cat");
    });

    /**
     * @tc.name   testRegExec0102
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_0102
     * @tc.desc   Test exec() with zero-width matches at string start
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExec0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /^/;
      const result = regex.exec("abc");
      expect(result?.[0]).assertEqual("");
    });

    /**
     * @tc.name   testRegExec0103
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_0103
     * @tc.desc   Test exec() with zero-width matches at string end
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExec0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /$/;
      const result = regex.exec("abc");
      expect(result?.[0]).assertEqual("");
    });

    /**
     * @tc.name   testRegExec0104
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_0104
     * @tc.desc   Test exec() with combination of /g /y flags in sequence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExec0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /\w+/gy;
      const text = "a b c";
      let r1 = regex.exec(text);
      regex.lastIndex += 1;
      let r2 = regex.exec(text);
      expect(r1?.[0]).assertEqual("a");
      expect(r2?.[0]).assertEqual("b");
    });

    /**
     * @tc.name   testRegExec0105
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_0105
     * @tc.desc   Test exec() with multiple adjacent zero-width assertions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExec0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /(?=a)(?<=^)/;
      const result = regex.exec("a");
      expect(result?.[0]).assertEqual("");
    });

    /**
     * @tc.name   testRegExec0106
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_0106
     * @tc.desc   Test exec() with long Unicode string including surrogate pairs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExec0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /\uD83D\uDE80/; // 🚀 rocket emoji
      const result = regex.exec("Start🚀End");
      expect(result?.[0]).assertEqual("🚀");
    });

    /**
     * @tc.name   testRegExec0107
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_0107
     * @tc.desc   Test exec() with capture groups followed by optional match
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExec0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /(a)?b/;
      const result = regex.exec("b");
      expect(result?.[1]).assertEqual(undefined);
      expect(result?.[0]).assertEqual("b");
    });

    /**
     * @tc.name   testRegExec0108
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_0108
     * @tc.desc   Test exec() with nested alternation and empty string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExec0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /(foo|)/;
      const result = regex.exec("");
      expect(result?.[1]).assertEqual("");
    });

    /**
     * @tc.name   testRegExec0109
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_0109
     * @tc.desc   Test exec() with overlapping matches and global flag
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExec0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /(?=(\d))/g;
      const text = "12";
      let m1 = regex.exec(text);
      regex.lastIndex = 1;
      let m2 = regex.exec(text);
      expect(m1?.[1]).assertEqual("1");
      expect(m2?.[1]).assertEqual("2");
    });

    /**
     * @tc.name   testRegExec0110
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_0110
     * @tc.desc   Test exec() with very long repeated optional groups
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExec0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /(x?){500}/;
      const result = regex.exec("xxxx");
      expect(result?.[0]).assertEqual("xxxx");
    });

    /**
     * @tc.name   testRegExec0111
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_0111
     * @tc.desc   Test exec() with multiline flag /m matching start of each line
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExec0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /^foo/m;
      const text = "bar\nfoo\nbaz";
      const result = regex.exec(text);
      expect(result?.[0]).assertEqual("foo");
    });

    /**
     * @tc.name   testRegExec0112
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_0112
     * @tc.desc   Test exec() with global flag and persistent lastIndex across calls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExec0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /\d+/g;
      const str = "12 34 56";
      const first = regex.exec(str);
      const second = regex.exec(str);
      expect(first?.[0]).assertEqual("12");
      expect(second?.[0]).assertEqual("34");
      expect(regex.lastIndex).assertEqual(5);
    });

    /**
     * @tc.name   testRegExec0113
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_0113
     * @tc.desc   Test exec() with cross-line match using dotAll flag /s
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExec0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /foo.bar/s;
      const result = regex.exec("foo\nbar");
      expect(result?.[0]).assertEqual("foo\nbar");
    });

    /**
     * @tc.name   testRegExec0114
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_0114
     * @tc.desc   Test exec() with unmatched groups returning undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExec0114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /(a)(b)?(c)/;
      const result = regex.exec("ac");
      expect(result?.[2]).assertEqual(undefined);
    });

    /**
     * @tc.name   testRegExec0115
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_0115
     * @tc.desc   Test exec() with lookahead containing alternation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExec0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /a(?=b|c)/;
      const result = regex.exec("ac");
      expect(result?.[0]).assertEqual("a");
    });

    /**
     * @tc.name   testRegExec0116
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_0116
     * @tc.desc   Test exec() with nested named capture groups
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExec0116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /(?<outer>(?<inner>a)b)/;
      const result = regex.exec("ab");
      expect(result?.groups?.outer).assertEqual("ab");
      expect(result?.groups?.inner).assertEqual("a");
    });

    /**
     * @tc.name   testRegExec0117
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_0117
     * @tc.desc   Test exec() with reference to previous named capture
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExec0117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /(?<x>a)\k<x>/;
      const result = regex.exec("aa");
      expect(result?.[0]).assertEqual("aa");
    });

    /**
     * @tc.name   testRegExec0118
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_0118
     * @tc.desc   Test exec() with nested optional lookahead and lookbehind
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExec0118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /(?<=\d)(?=\d)/;
      const result = regex.exec("123");
      expect(result?.index).assertEqual(1);
    });

    /**
     * @tc.name   testRegExec0120
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_0120
     * @tc.desc   Test exec() with complex alternation containing zero-width matches
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExec0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /(x|(?=y))/;
      const result = regex.exec("y");
      expect(result?.[0]).assertEqual("");
    });

    /**
     * @tc.name   testRegExec0121
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_0121
     * @tc.desc   Test exec() with string containing combining Unicode marks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExec0121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /\u0065\u0301/; // "é" as composed sequence
      const result = regex.exec("é");
      expect(result?.[0]).assertEqual("é");
    });

    /**
     * @tc.name   testRegExec0122
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_0122
     * @tc.desc   Test exec() with surrogate pairs and /u flag disabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExec0122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /\uD83D/;
      const result = regex.exec("😀");
      expect(result?.[0]).assertEqual("\uD83D");
    });

    /**
     * @tc.name   testRegExec0124
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_0124
     * @tc.desc   Test exec() with nested repetition and optional patterns
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExec0124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /((a)?b?)+/;
      const result = regex.exec("ababa");
      expect(result?.[0]).assertEqual("ababa");
    });

    /**
     * @tc.name   testRegExec0125
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_0125
     * @tc.desc   Test exec() with large input and short match near end
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExec0125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "x".repeat(10000) + "end";
      const regex = /end$/;
      const result = regex.exec(str);
      expect(result?.[0]).assertEqual("end");
    });

    /**
     * @tc.name   testRegExec0126
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_0126
     * @tc.desc   Test exec() with alternation containing optional empty branches
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExec0126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /(foo| |bar)/;
      const result = regex.exec("bar");
      expect(result?.[0]).assertEqual("bar");
    });

    /**
     * @tc.name   testRegExec0127
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_0127
     * @tc.desc   Test exec() with overlapping Unicode sequences and /u flag
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExec0127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /\u{1F680}/u; // 🚀
      const result = regex.exec("🚀🚀");
      expect(result?.[0]).assertEqual("🚀");
    });

    /**
     * @tc.name   testRegExec0128
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_0128
     * @tc.desc   Test exec() when regex.lastIndex exceeds string length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExec0128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /a/g;
      regex.lastIndex = 100;
      const result = regex.exec("abc");
      expect(result).assertEqual(null);
    });

    /**
     * @tc.name   testRegExec0129
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_0129
     * @tc.desc   Test exec() with nested backreferences inside alternation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExec0129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /(a)\1|b/;
      const result = regex.exec("aa");
      expect(result?.[0]).assertEqual("aa");
    });

    /**
     * @tc.name   testRegExec0130
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_0130
     * @tc.desc   Test exec() with escaped special characters in character class
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExec0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /[.*+?^${}()|[\]\\]/;
      const result = regex.exec("a+b");
      expect(result?.[0]).assertEqual("+");
    });

    /**
     * @tc.name   testRegExec0131
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_0131
     * @tc.desc   Test exec() with lastIndex reset after no match in global regex
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExec0131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /\d/g;
      regex.lastIndex = 5;
      const result = regex.exec("1234");
      expect(result).assertEqual(null);
      expect(regex.lastIndex).assertEqual(0);
    });

    /**
     * @tc.name   testRegExec0133
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_0133
     * @tc.desc   Test exec() called via call() with non-string input (number)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExec0133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      expect(testRegExecJs0133()).assertEqual("456");
    });

    /**
     * @tc.name   testRegExec0134
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_0134
     * @tc.desc   Test exec() called via call() with boolean input
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExec0134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      expect(testRegExecJs0134()).assertEqual("true");
    });

    /**
     * @tc.name   testRegExec0135
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_0135
     * @tc.desc   Test exec() on string with multiple overlapping matches using global flag
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExec0135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /(?=(\d))/g;
      const str = "123";
      const m1 = regex.exec(str);
      regex.lastIndex = 1;
      const m2 = regex.exec(str);
      expect(m1?.[1]).assertEqual("1");
      expect(m2?.[1]).assertEqual("2");
    });

    /**
     * @tc.name   testRegExec0136
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_0136
     * @tc.desc   Test exec() on empty string with optional groups
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExec0136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /(a)?(b)?/;
      const result = regex.exec("");
      expect(result?.[1]).assertEqual(undefined);
      expect(result?.[2]).assertEqual(undefined);
    });

    /**
     * @tc.name   testRegExec0137
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_0137
     * @tc.desc   Test exec() with string containing multiple Unicode combining marks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExec0137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /e\u0301/;
      const result = regex.exec("e\u0301");
      expect(result?.[0]).assertEqual("e\u0301");
    });

    /**
     * @tc.name   testRegExec0138
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_0138
     * @tc.desc   Test exec() on string with extremely long repeated pattern
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExec0138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /(ab){50}/;
      const str = "ab".repeat(50);
      const result = regex.exec(str);
      expect(result?.[0]).assertEqual(str);
    });

    /**
     * @tc.name   testRegExec0139
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_0139
     * @tc.desc   Test exec() with lastIndex set to middle of match (global regex)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExec0139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /\w+/g;
      const str = "hello world";
      regex.lastIndex = 3;
      const result = regex.exec(str);
      expect(result?.[0]).assertEqual("lo");
    });

    /**
     * @tc.name   testRegExec0141
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_0141
     * @tc.desc   Test exec() with nested optional groups followed by mandatory character
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExec0141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /((a)?b)c/;
      const result = regex.exec("abc");
      expect(result?.[1]).assertEqual("ab");
      expect(result?.[2]).assertEqual("a");
    });

    /**
     * @tc.name   testRegExec0142
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_0142
     * @tc.desc   Test exec() with string containing only zero-width matches
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExec0142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /(?=a)/;
      const result = regex.exec("a");
      expect(result?.[0]).assertEqual("");
    });

    /**
     * @tc.name   testRegExec0143
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_0143
     * @tc.desc   Test exec() with multiple consecutive empty optional groups
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExec0143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /()()()/;
      const result = regex.exec("x");
      expect(result?.[1]).assertEqual("");
      expect(result?.[2]).assertEqual("");
      expect(result?.[3]).assertEqual("");
    });

    /**
     * @tc.name   testRegExec0144
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_0144
     * @tc.desc   Test exec() with global regex and input string shorter than lastIndex
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExec0144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /\w+/g;
      regex.lastIndex = 10;
      const result = regex.exec("abc");
      expect(result).assertEqual(null);
    });

    /**
     * @tc.name   testRegExec0145
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_0145
     * @tc.desc   Test exec() with nested alternation including empty branches
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExec0145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /(x|y||)/;
      const result = regex.exec("y");
      expect(result?.[0]).assertEqual("y");
    });

    /**
     * @tc.name   testRegExec0146
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_0146
     * @tc.desc   Test exec() with multiple zero-width assertions in sequence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExec0146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /(?=a)(?<=^)/;
      const result = regex.exec("a");
      expect(result?.[0]).assertEqual("");
    });

    /**
     * @tc.name   testRegExec0147
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_0147
     * @tc.desc   Test exec() with long string containing Unicode surrogate pairs at end
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExec0147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /\uD83D\uDE80$/; // 🚀 at string end
      const str = "abc🚀";
      const result = regex.exec(str);
      expect(result?.[0]).assertEqual("🚀");
    });

    /**
     * @tc.name   testRegExec0148
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_0148
     * @tc.desc   Test exec() with repeated capturing groups followed by optional match
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExec0148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /(a?){5}b/;
      const result = regex.exec("aaab");
      expect(result?.[0]).assertEqual("aaab");
    });

    /**
     * @tc.name   testRegExec0149
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_0149
     * @tc.desc   Test exec() on string with repeated spaces and optional match
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExec0149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /( )?b/;
      const result = regex.exec(" b");
      expect(result?.[0]).assertEqual(" b");
    });

    /**
     * @tc.name   testRegExec0150
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_0150
     * @tc.desc   Test exec() consistency with String.prototype.match() for global regex
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExec0150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /\d+/g;
      const str = "12 34 56";
      const execResults : string[] = [];
      let match = regex.exec(str);
      while ( match !== null) {
        execResults.push(match[0]);
        match = regex.exec(str);
      }
      const matchResults = str.match(regex);
      expect(execResults).assertDeepEquals(matchResults);
    });

    /**
     * @tc.name   testRegExec0151
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_0151
     * @tc.desc   Test RegExp.exec()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExec0151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let re = new RegExp("(?:ab|cd)\\d?","g");
      let matched:Array<string> = new Array<string>();
      let expected:Array<string> = new Array<string>("ab", "cd2", "ab3", "cd");
      do {
        let executed = re.exec("ab  cd2  ab34  cd");
        if(executed != null) {
          let a = executed![0]
          matched.push(a);
        } else {
          break;
        }
      } while(true);
      expect(expected.length).assertEqual(matched.length);
      expect(expected).assertDeepEquals(matched);
    });

    /**
     * @tc.name   testRegExec0152
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_0152
     * @tc.desc   Test RegExp.exec()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExec0152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let __the__raven = "	Once upon a midnight dreary, while I pondered weak and weary," +
        "Over many a quaint and curious volume of forgotten lore," +
        "While I nodded, nearly napping, suddenly there came a tapping," +
        "As of some one gently rapping, rapping at my chamber door." +
        "`'Tis some visitor,' I muttered, `tapping at my chamber door -" +
        "Only this, and nothing more.'" +
        "Ah, distinctly I remember it was in the bleak December," +
        "And each separate dying ember wrought its ghost upon the floor." +
        "Eagerly I wished the morrow; - vainly I had sought to borrow" +
        "From my books surcease of sorrow - sorrow for the lost Lenore -" +
        "For the rare and radiant maiden whom the angels named Lenore -" +
        "Nameless here for evermore." +
        "\n" +
        "And the silken sad uncertain rustling of each purple curtain" +
        "Thrilled me - filled me with fantastic terrors never felt before;" +
        "So that now, to still the beating of my heart, I stood repeating" +
        "`'Tis some visitor entreating entrance at my chamber door -" +
        "Some late visitor entreating entrance at my chamber door; -" +
        "This it is, and nothing more,'" +
        "Presently my soul grew stronger; hesitating then no longer," +
        "`Sir,' said I, `or Madam, truly your forgiveness I implore;" +
        "But the fact is I was napping, and so gently you came rapping," +
        "And so faintly you came tapping, tapping at my chamber door," +
        "That I scarce was sure I heard you' - here I opened wide the door; -" +
        "Darkness there, and nothing more." +
        "\n" +
        "Deep into that darkness peering, long I stood there wondering, fearing," +
        "Doubting, dreaming dreams no mortal ever dared to dream before" +
        "But the silence was unbroken, and the darkness gave no token," +
        "And the only word there spoken was the whispered word, `Lenore!'" +
        "This I whispered, and an echo murmured back the word, `Lenore!'" +
        "Merely this and nothing more." +
        "\n" +
        "Back into the chamber turning, all my soul within me burning," +
        "Soon again I heard a tapping somewhat louder than before." +
        "`Surely,' said I, `surely that is something at my window lattice;" +
        "Let me see then, what thereat is, and this mystery explore -" +
        "Let my heart be still a moment and this mystery explore; -" +
        "'Tis the wind and nothing more!'" +
        "\n" +
        "In there stepped a stately raven of the saintly days of yore." +
        "Not the least obeisance made he; not a minute stopped or stayed he;" +
        "But, with mien of lord or lady, perched above my chamber door -" +
        "Perched upon a bust of Pallas just above my chamber door -" +
        "Perched, and sat, and nothing more." +
        "\n" +
        "Then this ebony bird beguiling my sad fancy into smiling," +
        "By the grave and stern decorum of the countenance it wore," +
        "Ghastly grim and ancient raven wandering from the nightly shore -" +
        "Tell me what thy lordly name is on the Night's Plutonian shore!'" +
        "Quoth the raven, `Nevermore.'" +
        "-n" +
        "Much I marvelled this ungainly fowl to hear discourse so plainly," +
        "Though its answer little meaning - little relevancy bore;" +
        "For we cannot help agreeing that no living human being" +
        "Ever yet was blessed with seeing bird above his chamber door -" +
        "Bird or beast above the sculptured bust above his chamber door," +
        "With such name as `Nevermore.'" +
        "\n" +
        "But the raven, sitting lonely on the placid bust, spoke only," +
        "That one word, as if his soul in that one word he did outpour." +
        "Nothing further then he uttered - not a feather then he fluttered -" +
        "Till I scarcely more than muttered `Other friends have flown before -" +
        "On the morrow he will leave me, as my hopes have flown before.'" +
        "Then the bird said, `Nevermore.'" +
        "\n" +
        "Startled at the stillness broken by reply so aptly spoken," +
        "`Doubtless,' said I, `what it utters is its only stock and store," +
        "Followed fast and followed faster till his songs one burden bore -" +
        "Till the dirges of his hope that melancholy burden bore" +
        "Of \"Never-nevermore.\"'" +
        "\n" +
        "But the raven still beguiling all my sad soul into smiling," +
        "Straight I wheeled a cushioned seat in front of bird and bust and door;" +
        "Then, upon the velvet sinking, I betook myself to linking" +
        "Fancy unto fancy, thinking what this ominous bird of yore -" +
        "What this grim, ungainly, ghastly, gaunt, and ominous bird of yore" +
        "Meant in croaking `Nevermore.'" +
        "\n" +
        "This I sat engaged in guessing, but no syllable expressing" +
        "To the fowl whose fiery eyes now burned into my bosom's core;" +
        "This and more I sat divining, with my head at ease reclining" +
        "On the cushion's velvet lining that the lamp-light gloated o'er," +
        "But whose velvet violet lining with the lamp-light gloating o'er," +
        "She shall press, ah, nevermore!" +
        "\n" +
        "Then, methought, the air grew denser, perfumed from an unseen censer" +
        "Swung by Seraphim whose foot-falls tinkled on the tufted floor." +
        "`Wretch,' I cried, `thy God hath lent thee - by these angels he has sent thee" +
        "Respite - respite and nepenthe from thy memories of Lenore!" +
        "Quaff, oh quaff this kind nepenthe, and forget this lost Lenore!'" +
        "Quoth the raven, `Nevermore.'" +
        "\n" +
        "`Prophet!' said I, `thing of evil! - prophet still, if bird or devil! -" +
        "Whether tempter sent, or whether tempest tossed thee here ashore," +
        "Desolate yet all undaunted, on this desert land enchanted -" +
        "On this home by horror haunted - tell me truly, I implore -" +
        "Is there - is there balm in Gilead? - tell me - tell me, I implore!'" +
        "Quoth the raven, `Nevermore.'" +
        "\n" +
        "`Prophet!' said I, `thing of evil! - prophet still, if bird or devil!" +
        "By that Heaven that bends above us - by that God we both adore -" +
        "Tell this soul with sorrow laden if, within the distant Aidenn," +
        "It shall clasp a sainted maiden whom the angels named Lenore -" +
        "Clasp a rare and radiant maiden, whom the angels named Lenore?'" +
        "Quoth the raven, `Nevermore.'" +
        "\n" +
        "`Be that word our sign of parting, bird or fiend!' I shrieked upstarting -" +
        "`Get thee back into the tempest and the Night's Plutonian shore!" +
        "Leave no black plume as a token of that lie thy soul hath spoken!" +
        "Leave my loneliness unbroken! - quit the bust above my door!" +
        "Take thy beak from out my heart, and take thy form from off my door!'" +
        "Quoth the raven, `Nevermore.'" +
        "\n" +
        "And the raven, never flitting, still is sitting, still is sitting" +
        "On the pallid bust of Pallas just above my chamber door;" +
        "And his eyes have all the seeming of a demon's that is dreaming," +
        "And the lamp-light o'er him streaming throws his shadow on the floor;" +
        "And my soul from out that shadow that lies floating on the floor" +
        "Shall be lifted - nevermore!"
      let NEVERMORE = 11;
      let __re = new RegExp("[Nn]evermore", "g");
      let __matched = 0;
      do {
        let __executed = __re.exec(__the__raven);
        if (__executed!=null) {
          __matched++;
        } else {
          break;
        }
      } while(1);
      expect(__matched).assertEqual(NEVERMORE);
    });

    /**
     * @tc.name   testRegExec0153
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_0153
     * @tc.desc   Test RegExp.exec()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExec0153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let __the__raven = "	Once upon a midnight dreary, while I pondered weak and weary," +
        "Over many a quaint and curious volume of forgotten lore," +
        "While I nodded, nearly napping, suddenly there came a tapping," +
        "As of some one gently rapping, rapping at my chamber door." +
        "`'Tis some visitor,' I muttered, `tapping at my chamber door -" +
        "Only this, and nothing more.'" +
        "Ah, distinctly I remember it was in the bleak December," +
        "And each separate dying ember wrought its ghost upon the floor." +
        "Eagerly I wished the morrow; - vainly I had sought to borrow" +
        "From my books surcease of sorrow - sorrow for the lost Lenore -" +
        "For the rare and radiant maiden whom the angels named Lenore -" +
        "Nameless here for evermore." +
        "\n" +
        "And the silken sad uncertain rustling of each purple curtain" +
        "Thrilled me - filled me with fantastic terrors never felt before;" +
        "So that now, to still the beating of my heart, I stood repeating" +
        "`'Tis some visitor entreating entrance at my chamber door -" +
        "Some late visitor entreating entrance at my chamber door; -" +
        "This it is, and nothing more,'" +
        "Presently my soul grew stronger; hesitating then no longer," +
        "`Sir,' said I, `or Madam, truly your forgiveness I implore;" +
        "But the fact is I was napping, and so gently you came rapping," +
        "And so faintly you came tapping, tapping at my chamber door," +
        "That I scarce was sure I heard you' - here I opened wide the door; -" +
        "Darkness there, and nothing more." +
        "\n" +
        "Deep into that darkness peering, long I stood there wondering, fearing," +
        "Doubting, dreaming dreams no mortal ever dared to dream before" +
        "But the silence was unbroken, and the darkness gave no token," +
        "And the only word there spoken was the whispered word, `Lenore!'" +
        "This I whispered, and an echo murmured back the word, `Lenore!'" +
        "Merely this and nothing more." +
        "\n" +
        "Back into the chamber turning, all my soul within me burning," +
        "Soon again I heard a tapping somewhat louder than before." +
        "`Surely,' said I, `surely that is something at my window lattice;" +
        "Let me see then, what thereat is, and this mystery explore -" +
        "Let my heart be still a moment and this mystery explore; -" +
        "'Tis the wind and nothing more!'" +
        "\n" +
        "In there stepped a stately raven of the saintly days of yore." +
        "Not the least obeisance made he; not a minute stopped or stayed he;" +
        "But, with mien of lord or lady, perched above my chamber door -" +
        "Perched upon a bust of Pallas just above my chamber door -" +
        "Perched, and sat, and nothing more." +
        "\n" +
        "Then this ebony bird beguiling my sad fancy into smiling," +
        "By the grave and stern decorum of the countenance it wore," +
        "Ghastly grim and ancient raven wandering from the nightly shore -" +
        "Tell me what thy lordly name is on the Night's Plutonian shore!'" +
        "Quoth the raven, `Nevermore.'" +
        "-n" +
        "Much I marvelled this ungainly fowl to hear discourse so plainly," +
        "Though its answer little meaning - little relevancy bore;" +
        "For we cannot help agreeing that no living human being" +
        "Ever yet was blessed with seeing bird above his chamber door -" +
        "Bird or beast above the sculptured bust above his chamber door," +
        "With such name as `Nevermore.'" +
        "\n" +
        "But the raven, sitting lonely on the placid bust, spoke only," +
        "That one word, as if his soul in that one word he did outpour." +
        "Nothing further then he uttered - not a feather then he fluttered -" +
        "Till I scarcely more than muttered `Other friends have flown before -" +
        "On the morrow he will leave me, as my hopes have flown before.'" +
        "Then the bird said, `Nevermore.'" +
        "\n" +
        "Startled at the stillness broken by reply so aptly spoken," +
        "`Doubtless,' said I, `what it utters is its only stock and store," +
        "Followed fast and followed faster till his songs one burden bore -" +
        "Till the dirges of his hope that melancholy burden bore" +
        "Of \"Never-nevermore.\"'" +
        "\n" +
        "But the raven still beguiling all my sad soul into smiling," +
        "Straight I wheeled a cushioned seat in front of bird and bust and door;" +
        "Then, upon the velvet sinking, I betook myself to linking" +
        "Fancy unto fancy, thinking what this ominous bird of yore -" +
        "What this grim, ungainly, ghastly, gaunt, and ominous bird of yore" +
        "Meant in croaking `Nevermore.'" +
        "\n" +
        "This I sat engaged in guessing, but no syllable expressing" +
        "To the fowl whose fiery eyes now burned into my bosom's core;" +
        "This and more I sat divining, with my head at ease reclining" +
        "On the cushion's velvet lining that the lamp-light gloated o'er," +
        "But whose velvet violet lining with the lamp-light gloating o'er," +
        "She shall press, ah, nevermore!" +
        "\n" +
        "Then, methought, the air grew denser, perfumed from an unseen censer" +
        "Swung by Seraphim whose foot-falls tinkled on the tufted floor." +
        "`Wretch,' I cried, `thy God hath lent thee - by these angels he has sent thee" +
        "Respite - respite and nepenthe from thy memories of Lenore!" +
        "Quaff, oh quaff this kind nepenthe, and forget this lost Lenore!'" +
        "Quoth the raven, `Nevermore.'" +
        "\n" +
        "`Prophet!' said I, `thing of evil! - prophet still, if bird or devil! -" +
        "Whether tempter sent, or whether tempest tossed thee here ashore," +
        "Desolate yet all undaunted, on this desert land enchanted -" +
        "On this home by horror haunted - tell me truly, I implore -" +
        "Is there - is there balm in Gilead? - tell me - tell me, I implore!'" +
        "Quoth the raven, `Nevermore.'" +
        "\n" +
        "`Prophet!' said I, `thing of evil! - prophet still, if bird or devil!" +
        "By that Heaven that bends above us - by that God we both adore -" +
        "Tell this soul with sorrow laden if, within the distant Aidenn," +
        "It shall clasp a sainted maiden whom the angels named Lenore -" +
        "Clasp a rare and radiant maiden, whom the angels named Lenore?'" +
        "Quoth the raven, `Nevermore.'" +
        "\n" +
        "`Be that word our sign of parting, bird or fiend!' I shrieked upstarting -" +
        "`Get thee back into the tempest and the Night's Plutonian shore!" +
        "Leave no black plume as a token of that lie thy soul hath spoken!" +
        "Leave my loneliness unbroken! - quit the bust above my door!" +
        "Take thy beak from out my heart, and take thy form from off my door!'" +
        "Quoth the raven, `Nevermore.'" +
        "\n" +
        "And the raven, never flitting, still is sitting, still is sitting" +
        "On the pallid bust of Pallas just above my chamber door;" +
        "And his eyes have all the seeming of a demon's that is dreaming," +
        "And the lamp-light o'er him streaming throws his shadow on the floor;" +
        "And my soul from out that shadow that lies floating on the floor" +
        "Shall be lifted - nevermore!"
      let NEVERMORE_AND_EVERMORE=12;
      let __re = new RegExp("[Nn]?evermore", "g");
      let __matched=0;

      do {
        let __executed = __re.exec(__the__raven);
        if (__executed!=null) {
          __matched++;
        } else {
          break;
        }
      } while(1);
      expect(__matched).assertEqual(NEVERMORE_AND_EVERMORE);
    });

    /**
     * @tc.name   testRegExec0154
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_0154
     * @tc.desc   Test RegExp.exec()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExec0154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let __the__raven = "	Once upon a midnight dreary, while I pondered weak and weary," +
        "Over many a quaint and curious volume of forgotten lore," +
        "While I nodded, nearly napping, suddenly there came a tapping," +
        "As of some one gently rapping, rapping at my chamber door." +
        "`'Tis some visitor,' I muttered, `tapping at my chamber door -" +
        "Only this, and nothing more.'" +
        "Ah, distinctly I remember it was in the bleak December," +
        "And each separate dying ember wrought its ghost upon the floor." +
        "Eagerly I wished the morrow; - vainly I had sought to borrow" +
        "From my books surcease of sorrow - sorrow for the lost Lenore -" +
        "For the rare and radiant maiden whom the angels named Lenore -" +
        "Nameless here for evermore." +
        "\n" +
        "And the silken sad uncertain rustling of each purple curtain" +
        "Thrilled me - filled me with fantastic terrors never felt before;" +
        "So that now, to still the beating of my heart, I stood repeating" +
        "`'Tis some visitor entreating entrance at my chamber door -" +
        "Some late visitor entreating entrance at my chamber door; -" +
        "This it is, and nothing more,'" +
        "Presently my soul grew stronger; hesitating then no longer," +
        "`Sir,' said I, `or Madam, truly your forgiveness I implore;" +
        "But the fact is I was napping, and so gently you came rapping," +
        "And so faintly you came tapping, tapping at my chamber door," +
        "That I scarce was sure I heard you' - here I opened wide the door; -" +
        "Darkness there, and nothing more." +
        "\n" +
        "Deep into that darkness peering, long I stood there wondering, fearing," +
        "Doubting, dreaming dreams no mortal ever dared to dream before" +
        "But the silence was unbroken, and the darkness gave no token," +
        "And the only word there spoken was the whispered word, `Lenore!'" +
        "This I whispered, and an echo murmured back the word, `Lenore!'" +
        "Merely this and nothing more." +
        "\n" +
        "Back into the chamber turning, all my soul within me burning," +
        "Soon again I heard a tapping somewhat louder than before." +
        "`Surely,' said I, `surely that is something at my window lattice;" +
        "Let me see then, what thereat is, and this mystery explore -" +
        "Let my heart be still a moment and this mystery explore; -" +
        "'Tis the wind and nothing more!'" +
        "\n" +
        "In there stepped a stately raven of the saintly days of yore." +
        "Not the least obeisance made he; not a minute stopped or stayed he;" +
        "But, with mien of lord or lady, perched above my chamber door -" +
        "Perched upon a bust of Pallas just above my chamber door -" +
        "Perched, and sat, and nothing more." +
        "\n" +
        "Then this ebony bird beguiling my sad fancy into smiling," +
        "By the grave and stern decorum of the countenance it wore," +
        "Ghastly grim and ancient raven wandering from the nightly shore -" +
        "Tell me what thy lordly name is on the Night's Plutonian shore!'" +
        "Quoth the raven, `Nevermore.'" +
        "-n" +
        "Much I marvelled this ungainly fowl to hear discourse so plainly," +
        "Though its answer little meaning - little relevancy bore;" +
        "For we cannot help agreeing that no living human being" +
        "Ever yet was blessed with seeing bird above his chamber door -" +
        "Bird or beast above the sculptured bust above his chamber door," +
        "With such name as `Nevermore.'" +
        "\n" +
        "But the raven, sitting lonely on the placid bust, spoke only," +
        "That one word, as if his soul in that one word he did outpour." +
        "Nothing further then he uttered - not a feather then he fluttered -" +
        "Till I scarcely more than muttered `Other friends have flown before -" +
        "On the morrow he will leave me, as my hopes have flown before.'" +
        "Then the bird said, `Nevermore.'" +
        "\n" +
        "Startled at the stillness broken by reply so aptly spoken," +
        "`Doubtless,' said I, `what it utters is its only stock and store," +
        "Followed fast and followed faster till his songs one burden bore -" +
        "Till the dirges of his hope that melancholy burden bore" +
        "Of \"Never-nevermore.\"'" +
        "\n" +
        "But the raven still beguiling all my sad soul into smiling," +
        "Straight I wheeled a cushioned seat in front of bird and bust and door;" +
        "Then, upon the velvet sinking, I betook myself to linking" +
        "Fancy unto fancy, thinking what this ominous bird of yore -" +
        "What this grim, ungainly, ghastly, gaunt, and ominous bird of yore" +
        "Meant in croaking `Nevermore.'" +
        "\n" +
        "This I sat engaged in guessing, but no syllable expressing" +
        "To the fowl whose fiery eyes now burned into my bosom's core;" +
        "This and more I sat divining, with my head at ease reclining" +
        "On the cushion's velvet lining that the lamp-light gloated o'er," +
        "But whose velvet violet lining with the lamp-light gloating o'er," +
        "She shall press, ah, nevermore!" +
        "\n" +
        "Then, methought, the air grew denser, perfumed from an unseen censer" +
        "Swung by Seraphim whose foot-falls tinkled on the tufted floor." +
        "`Wretch,' I cried, `thy God hath lent thee - by these angels he has sent thee" +
        "Respite - respite and nepenthe from thy memories of Lenore!" +
        "Quaff, oh quaff this kind nepenthe, and forget this lost Lenore!'" +
        "Quoth the raven, `Nevermore.'" +
        "\n" +
        "`Prophet!' said I, `thing of evil! - prophet still, if bird or devil! -" +
        "Whether tempter sent, or whether tempest tossed thee here ashore," +
        "Desolate yet all undaunted, on this desert land enchanted -" +
        "On this home by horror haunted - tell me truly, I implore -" +
        "Is there - is there balm in Gilead? - tell me - tell me, I implore!'" +
        "Quoth the raven, `Nevermore.'" +
        "\n" +
        "`Prophet!' said I, `thing of evil! - prophet still, if bird or devil!" +
        "By that Heaven that bends above us - by that God we both adore -" +
        "Tell this soul with sorrow laden if, within the distant Aidenn," +
        "It shall clasp a sainted maiden whom the angels named Lenore -" +
        "Clasp a rare and radiant maiden, whom the angels named Lenore?'" +
        "Quoth the raven, `Nevermore.'" +
        "\n" +
        "`Be that word our sign of parting, bird or fiend!' I shrieked upstarting -" +
        "`Get thee back into the tempest and the Night's Plutonian shore!" +
        "Leave no black plume as a token of that lie thy soul hath spoken!" +
        "Leave my loneliness unbroken! - quit the bust above my door!" +
        "Take thy beak from out my heart, and take thy form from off my door!'" +
        "Quoth the raven, `Nevermore.'" +
        "\n" +
        "And the raven, never flitting, still is sitting, still is sitting" +
        "On the pallid bust of Pallas just above my chamber door;" +
        "And his eyes have all the seeming of a demon's that is dreaming," +
        "And the lamp-light o'er him streaming throws his shadow on the floor;" +
        "And my soul from out that shadow that lies floating on the floor" +
        "Shall be lifted - nevermore!"
      let ALL_THE_HOPELESS_MORE=18;
      let __re = new RegExp("([Nn]?ever|([Nn]othing\\s{1,}))more", "g");

      let __matched=0;
      do {
        let __executed = __re.exec(__the__raven);
        if (__executed!=null) {
          __matched++;
        } else {
          break;
        }
      } while(1);
      expect(__matched).assertEqual(ALL_THE_HOPELESS_MORE);
    });

    /**
     * @tc.name   testRegExec0155
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_0155
     * @tc.desc   Test RegExp.exec()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExec0155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let __re = new RegExp("\\d+", "g");
      let __matched: Array<string> = new Array<string>();
      let __expected: Array<string> = new Array<string>("123", "456", "789");

      do {
        let __executed = __re.exec("123 456 789");
        if (__executed!=null) {
          let a = __executed![0]
          __matched.push(a);
        } else {
          break;
        }
      } while(true);

      expect(__expected.length).assertEqual(__matched.length);

      for(let index=0; index<__expected.length; index++) {
        expect(__expected[index]).assertEqual(__matched[index]);
      }
    });

    /**
     * @tc.name   testRegExec0156
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_0156
     * @tc.desc   Test RegExp.exec()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExec0156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let __re = new RegExp("(\\d+)", "g");
      let __matched: Array<string> = new Array<string>();
      let __expected: Array<string> = new Array<string>("123", "456", "789");

      do {
        let __executed = __re.exec("123 456 789");
        if (__executed!=null) {
          let a = __executed![0]
          __matched.push(a);
        } else {
          break;
        }
      } while(true);
      expect(__expected.length).assertEqual(__matched.length);
      expect(__expected).assertDeepEquals(__matched);
    });

    /**
     * @tc.name   testRegExec0157
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_0157
     * @tc.desc   Test RegExp.exec()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExec0157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let __re = new RegExp("\\d+");
      let __matched: Array<string> = new Array<string>();
      let __expected: Array<string> = new Array<string>("123","123","123","123","123","123","123","123","123","123");

      do {
        let __executed = __re.exec("123 456 789");
        if (__executed!=null) {
          let a = __executed![0]
          __matched.push(a);
        } else {
          break;
        }
      } while(__matched.length<10);
      expect(__expected.length).assertEqual(__matched.length);
      expect(__expected).assertDeepEquals(__matched);
    });
  })
}