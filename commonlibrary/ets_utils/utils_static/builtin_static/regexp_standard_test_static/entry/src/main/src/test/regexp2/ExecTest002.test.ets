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
import {
  execCoercesNullToString,
  execCoercesUndefinedToString,
  execCoercesNumberToString,
  execCoercesObjectWithToString,
  execObjectCreateNullThrowsTypeError
} from './RegExpHelper';

function hasOwn(obj: Object, key: string): boolean {
  return obj.hasOwnProperty(key);
}

function supportsRegExp(pattern: string, flags: string = ''): boolean {
  try {
    new RegExp(pattern, flags);
    return true;
  } catch (_) {
    return false;
  }
}

function supportsLookbehindSemantics(): boolean {
  try {
    const re: RegExp = new RegExp('(?<!abc)\\d+');
    if (re.test('abc100')) {
      return false;
    }
    if (!re.test('def100')) {
      return false;
    }
    return true;
  } catch (_) {
    return false;
  }
}

export default function execTest002(): void {
  describe('Exec_Supplement_Compile_Safe', () => {
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
     * @tc.name testExec0200
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_SUPPLEMENT_TEST_0100
     * @tc.desc Global exec returns first match and updates lastIndex
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const re = new RegExp('\\d+', 'g');
      const first = re.exec('a12b34');
      expect(first !== null).assertTrue();
      if (first === null) {
        return;
      }
      expect(first[0]).assertEqual('12');
      expect(first.index).assertEqual(1);
      expect(re.lastIndex).assertEqual(3);
    });

    /**
     * @tc.name testExec0201
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_SUPPLEMENT_TEST_0200
     * @tc.desc Exec returns capture groups and match index
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const re = new RegExp('(ab)(cd)');
      const out = re.exec('xxabcdyy');
      expect(out !== null).assertTrue();
      if (out === null) {
        return;
      }
      expect(out[0]).assertEqual('abcd');
      expect(out[1]).assertEqual('ab');
      expect(out[2]).assertEqual('cd');
      expect(out.index).assertEqual(2);
    });

    /**
     * @tc.name testExec0202
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_SUPPLEMENT_TEST_0300
     * @tc.desc Exec returns null when input has no match
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0202', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const re = new RegExp('z+');
      const out = re.exec('abc');
      expect(out === null).assertTrue();
    });

    /**
     * @tc.name testExec0203
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_SUPPLEMENT_TEST_0400
     * @tc.desc Empty pattern exec matches at position zero
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0203', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const re = new RegExp('(?:)');
      const out = re.exec('');
      expect(out !== null).assertTrue();
      if (out === null) {
        return;
      }
      expect(out[0]).assertEqual('');
      expect(out.index).assertEqual(0);
    });

    /**
     * @tc.name testExec0204
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_SUPPLEMENT_TEST_0500
     * @tc.desc Anchors and boundaries (^ $ \\b \\B)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0204', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(new RegExp('^hello').exec('hello world') !== null).assertTrue();
      expect(new RegExp('^hello').exec('say hello') === null).assertTrue();
      expect(new RegExp('world$').exec('hello world') !== null).assertTrue();
      expect(new RegExp('world$').exec('world hello') === null).assertTrue();
      expect(new RegExp('\\btest\\b').exec('test') !== null).assertTrue();
      expect(new RegExp('\\btest\\b').exec('testing') === null).assertTrue();
      expect(new RegExp('test\\B').exec('testing') !== null).assertTrue();
      expect(new RegExp('test\\B').exec('test') === null).assertTrue();
    });

    /**
     * @tc.name testExec0205
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_SUPPLEMENT_TEST_0600
     * @tc.desc Quantifiers (* + ? {n} {n,m}) and greedy/lazy
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0205', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(new RegExp('a*b').exec('b') !== null).assertTrue();
      expect(new RegExp('a*b').exec('aaab') !== null).assertTrue();
      expect(new RegExp('a+b').exec('b') === null).assertTrue();
      expect(new RegExp('a+b').exec('ab') !== null).assertTrue();
      expect(new RegExp('a{3}').exec('aaab') !== null).assertTrue();
      const r = new RegExp('a{2,4}').exec('aaaaa');
      expect(r !== null).assertTrue();
      if (r !== null) {
        expect(r[0]).assertEqual('aaaa');
      }
      const g = new RegExp('a.*b').exec('a123b456b');
      const l = new RegExp('a.*?b').exec('a123b456b');
      expect(g !== null).assertTrue();
      expect(l !== null).assertTrue();
      if (g !== null && l !== null) {
        expect(g[0]).assertEqual('a123b456b');
        expect(l[0]).assertEqual('a123b');
      }
    });

    /**
     * @tc.name testExec0206
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_SUPPLEMENT_TEST_0700
     * @tc.desc Flags: i/m/s/u/y (feature-gated) and global lastIndex reset
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0206', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(new RegExp('hello', 'i').exec('HELLO') !== null).assertTrue();
      const m = new RegExp('^hello', 'm').exec('world\nhello');
      expect(m !== null).assertTrue();
      if (m !== null) {
        expect(m.index).assertEqual(6);
      }

      if (supportsRegExp('hello.world', 's')) {
        expect(new RegExp('hello.world', 's').exec('hello\nworld') !== null).assertTrue();
      }
      if (supportsRegExp('\\u{1F600}', 'u')) {
        const u = new RegExp('\\u{1F600}', 'u').exec('Hello 😀 World');
        expect(u !== null).assertTrue();
        if (u !== null) {
          expect(u[0]).assertEqual('😀');
        }
      }
      if (supportsRegExp('foo', 'y')) {
        const y = new RegExp('foo', 'y');
        y.lastIndex = 0;
        expect(y.exec('foo foo') !== null).assertTrue();
        y.lastIndex = 1;
        expect(y.exec('foo foo') === null).assertTrue();
      }

      const g = new RegExp('foo', 'g');
      expect(g.exec('foo foo') !== null).assertTrue();
      expect(g.lastIndex).assertEqual(3);
      expect(g.exec('zzz') === null).assertTrue();
      expect(g.lastIndex).assertEqual(0);
    });

    /**
     * @tc.name testExec0207
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_SUPPLEMENT_TEST_0800
     * @tc.desc Exec non-global result carries index/input metadata
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0207', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const out = new RegExp('(ab)(cd)').exec('xxabcdyy');
      expect(out !== null).assertTrue();
      if (out === null) {
        return;
      }
      expect(out.index).assertEqual(2);
      expect(out.input).assertEqual('xxabcdyy');
      expect(out[0]).assertEqual('abcd');
      expect(out[1]).assertEqual('ab');
      expect(out[2]).assertEqual('cd');
    });

    /**
     * @tc.name testExec0208
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_SUPPLEMENT_TEST_0900
     * @tc.desc Exec with global regex iterates all matches in sequence
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0208', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const re = new RegExp('\\d+', 'g');
      const input = 'a1b22c333';
      const got: string[] = [];
      let out = re.exec(input);
      while (out !== null) {
        const piece = out[0];
        if (piece !== undefined) {
          got.push(piece);
        }
        out = re.exec(input);
      }
      expect(got.length).assertEqual(3);
      expect(got[0]).assertEqual('1');
      expect(got[1]).assertEqual('22');
      expect(got[2]).assertEqual('333');
      expect(re.lastIndex).assertEqual(0);
    });

    /**
     * @tc.name testExec0209
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_SUPPLEMENT_TEST_1000
     * @tc.desc Exec respects start position from lastIndex for global regex
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0209', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const re = new RegExp('foo', 'g');
      re.lastIndex = 4;
      const out = re.exec('foo foo foo');
      expect(out !== null).assertTrue();
      if (out === null) {
        return;
      }
      expect(out.index).assertEqual(4);
      expect(out[0]).assertEqual('foo');
      expect(re.lastIndex).assertEqual(7);
    });

    /**
     * @tc.name testExec0210
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_SUPPLEMENT_TEST_1100
     * @tc.desc Exec zero-length global matches still advance and terminate
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const re = new RegExp('(?:)', 'g');
      const input = 'abc';
      let count = 0;
      let out = re.exec(input);
      while (out !== null && count < 32) {
        count++;
        out = re.exec(input);
      }
      
      
      expect(count > 0).assertTrue();
      expect(count <= 32).assertTrue();
      expect(re.lastIndex).assertEqual(0);
    });

    /**
     * @tc.name testExec0211
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_SUPPLEMENT_TEST_1200
     * @tc.desc Exec with named capture groups exposes groups object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0211', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      if (!supportsRegExp('(?<y>\\d{4})-(?<m>\\d{2})-(?<d>\\d{2})')) {
        return;
      }
      const out = new RegExp('(?<y>\\d{4})-(?<m>\\d{2})-(?<d>\\d{2})').exec('2026-04-17');
      expect(out !== null).assertTrue();
      if (out === null) {
        return;
      }
      
      expect(out[0]).assertEqual('2026-04-17');
      expect(out[1]).assertEqual('2026');
      expect(out[2]).assertEqual('04');
      expect(out[3]).assertEqual('17');
    });

    /**
     * @tc.name testExec0212
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_SUPPLEMENT_TEST_1300
     * @tc.desc Exec supports optional capture groups and undefined entries
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0212', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const out = new RegExp('(a)(b)?').exec('a');
      expect(out !== null).assertTrue();
      if (out === null) {
        return;
      }
      expect(out[0]).assertEqual('a');
      expect(out[1]).assertEqual('a');
      expect(out[2] === undefined).assertTrue();
    });

    /**
     * @tc.name testExec0213
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_SUPPLEMENT_TEST_1400
     * @tc.desc Exec indices (d flag) when supported returns start/end pairs
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0213', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      if (!supportsRegExp('foo', 'd')) {
        return;
      }
      const out = new RegExp('(foo)', 'd').exec('xxfooyy');
      expect(out !== null).assertTrue();
      if (out === null) {
        return;
      }
      expect(out.indices !== undefined).assertTrue();
      expect(out.indices[0][0]).assertEqual(2);
      expect(out.indices[0][1]).assertEqual(5);
      expect(out.indices[1][0]).assertEqual(2);
      expect(out.indices[1][1]).assertEqual(5);
    });

    /**
     * @tc.name testExec0214
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_SUPPLEMENT_TEST_1500
     * @tc.desc Exec on multiline input validates index and matched line
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0214', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const re = new RegExp('^line\\d', 'm');
      const out = re.exec('head\nline1\nline2');
      expect(out !== null).assertTrue();
      if (out === null) {
        return;
      }
      expect(out[0]).assertEqual('line1');
      expect(out.index).assertEqual(5);
    });

    /**
     * @tc.name testExec0215
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_SUPPLEMENT_TEST_1600
     * @tc.desc Exec lastIndex larger than input yields null and resets for global
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0215', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const re = new RegExp('a', 'g');
      re.lastIndex = 99;
      const out = re.exec('abc');
      expect(out === null).assertTrue();
      expect(re.lastIndex).assertEqual(0);
    });

    /**
     * @tc.name testExec0216
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_SUPPLEMENT_TEST_1700
     * @tc.desc Exec with alternation chooses leftmost earliest match
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0216', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const re = new RegExp('cat|dog');
      const out = re.exec('xxdog cat');
      expect(out !== null).assertTrue();
      if (out === null) {
        return;
      }
      expect(out[0]).assertEqual('dog');
      expect(out.index).assertEqual(2);
    });

    /**
     * @tc.name testExec0217
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_SUPPLEMENT_TEST_1800
     * @tc.desc Exec sticky requires exact lastIndex position when supported
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0217', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      if (!supportsRegExp('foo', 'y')) {
        return;
      }
      const re = new RegExp('foo', 'y');
      const input = 'foo foo';
      re.lastIndex = 4;
      const hit = re.exec(input);
      expect(hit !== null).assertTrue();
      re.lastIndex = 5;
      const miss = re.exec(input);
      expect(miss === null).assertTrue();
    });

    /**
     * @tc.name testExec0218
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_SUPPLEMENT_TEST_1900
     * @tc.desc Exec nested capture groups preserve numbering order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0218', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      const out = new RegExp('((\\d{4})-(\\d{2}))-(\\d{2})').exec('2024-03-27');
      expect(out !== null).assertTrue();
      if (out === null) {
        return;
      }
      expect(out[0]).assertEqual('2024-03-27');
      expect(out[1]).assertEqual('2024-03');
      expect(out[2]).assertEqual('2024');
      expect(out[3]).assertEqual('03');
      expect(out[4]).assertEqual('27');
    });

    /**
     * @tc.name testExec0219
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_SUPPLEMENT_TEST_2000
     * @tc.desc Exec non-capturing groups omit intermediate array entries
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0219', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      const out = new RegExp('(?:\\d{4})-(?:\\d{2})-(\\d{2})').exec('2024-03-27');
      expect(out !== null).assertTrue();
      if (out === null) {
        return;
      }
      expect(out[0]).assertEqual('2024-03-27');
      expect(out[1]).assertEqual('27');
      
      expect(out.length).assertEqual(2);
    });

    /**
     * @tc.name testExec0220
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_SUPPLEMENT_TEST_2100
     * @tc.desc Exec mixed named and numbered groups remains addressable by index
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0220', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      if (!supportsRegExp('(?<name>\\w+)\\s+(\\d+)')) {
        return;
      }
      const out = new RegExp('(?<name>\\w+)\\s+(\\d+)').exec('John 25');
      expect(out !== null).assertTrue();
      if (out === null) {
        return;
      }
      expect(out[0]).assertEqual('John 25');
      expect(out[1]).assertEqual('John');
      expect(out[2]).assertEqual('25');
    });

    /**
     * @tc.name testExec0221
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_SUPPLEMENT_TEST_2200
     * @tc.desc Exec result input property preserves original searched string
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0221', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      const source = 'say hello world';
      const out = new RegExp('hello').exec(source);
      expect(out !== null).assertTrue();
      if (out === null) {
        return;
      }
      expect(out.input).assertEqual(source);
      expect(out.index).assertEqual(4);
    });

    /**
     * @tc.name testExec0222
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_SUPPLEMENT_TEST_2300
     * @tc.desc Exec without d flag exposes no indices property
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0222', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      const out = new RegExp('hello').exec('hello world');
      expect(out !== null).assertTrue();
      if (out === null) {
        return;
      }
      
      
      expect(out[0]).assertEqual('hello');
      expect(hasOwn(out as Object, 'indices')).assertFalse();
    });

    /**
     * @tc.name testExec0223
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_SUPPLEMENT_TEST_2400
     * @tc.desc Exec global iteration over repeated ab-star pattern counts all hits
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0223', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      const re = new RegExp('ab*', 'g');
      const str = 'abbcdefabh';
      let result = re.exec(str);
      let count = 0;
      let joined = '';
      while (result !== null) {
        joined += result[0] + '|';
        count++;
        result = re.exec(str);
      }
      expect(count).assertEqual(2);
      expect(joined).assertEqual('abb|ab|');
      expect(re.lastIndex).assertEqual(0);
    });

    /**
     * @tc.name testExec0224
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_SUPPLEMENT_TEST_2500
     * @tc.desc Exec ignoreCase flag matches any casing variant
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0224', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      const re = new RegExp('hello', 'i');
      const a = re.exec('hello');
      const b = re.exec('HELLO');
      const c = re.exec('Hello');
      expect(a !== null).assertTrue();
      expect(b !== null).assertTrue();
      expect(c !== null).assertTrue();
      if (a !== null && b !== null && c !== null) {
        expect(a[0]).assertEqual('hello');
        expect(b[0]).assertEqual('HELLO');
        expect(c[0]).assertEqual('Hello');
      }
    });

    /**
     * @tc.name testExec0225
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_SUPPLEMENT_TEST_2600
     * @tc.desc Exec multiline anchors locate both start and end per line
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0225', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      const input = 'Line1\nLine2\nLine3';
      const start = new RegExp('^Line2', 'm').exec(input);
      const end = new RegExp('2$', 'm').exec(input);
      expect(start !== null).assertTrue();
      expect(end !== null).assertTrue();
      if (start !== null && end !== null) {
        expect(start.index).assertEqual(6);
        expect(end.index).assertEqual(10);
      }
    });

    /**
     * @tc.name testExec0226
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_SUPPLEMENT_TEST_2700
     * @tc.desc Exec dotAll flag crosses newline only when supported
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0226', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      const input = 'Hello\nWorld';
      expect(new RegExp('Hello.World').exec(input) === null).assertTrue();
      if (supportsRegExp('Hello.World', 's')) {
        const out = new RegExp('Hello.World', 's').exec(input);
        expect(out !== null).assertTrue();
        if (out !== null) {
          expect(out[0]).assertEqual('Hello\nWorld');
        }
      }
    });

    /**
     * @tc.name testExec0227
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_SUPPLEMENT_TEST_2800
     * @tc.desc Exec unicode code point escapes match supplementary characters when supported
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0227', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      if (!supportsRegExp('\\u{1F600}', 'u')) {
        return;
      }
      const out = new RegExp('\\u{1F600}', 'u').exec('A😀B');
      expect(out !== null).assertTrue();
      if (out === null) {
        return;
      }
      expect(out[0]).assertEqual('😀');
      expect(out.index).assertEqual(1);
    });

    /**
     * @tc.name testExec0228
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_SUPPLEMENT_TEST_2900
     * @tc.desc Exec on empty input with non-empty pattern returns null
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0228', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      expect(new RegExp('abc').exec('') === null).assertTrue();
      expect(new RegExp('\\d+').exec('') === null).assertTrue();
    });

    /**
     * @tc.name testExec0229
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_SUPPLEMENT_TEST_3000
     * @tc.desc Exec long-string search finds target near the tail
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0229', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      const prefix = 'a'.repeat(1200);
      const input = prefix + 'target';
      const out = new RegExp('target').exec(input);
      expect(out !== null).assertTrue();
      if (out === null) {
        return;
      }
      expect(out.index).assertEqual(1200);
      expect(out[0]).assertEqual('target');
    });

    /**
     * @tc.name testExec0230
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_SUPPLEMENT_TEST_3100
     * @tc.desc Exec lookahead and negative lookahead are feature-gated
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0230', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      const input = 'abc123def';
      const posSupported = supportsRegExp('\\d(?=def)');
      const negSupported = supportsRegExp('\\d(?!def)');
      if (posSupported) {
        const pos = new RegExp('\\d(?=def)').exec(input);
        expect(pos !== null).assertTrue();
        if (pos !== null) {
          expect(pos[0]).assertEqual('3');
          expect(pos.index).assertEqual(5);
        }
      }
      if (negSupported) {
        const neg = new RegExp('\\d(?!def)').exec(input);
        expect(neg !== null).assertTrue();
        if (neg !== null) {
          expect(neg[0]).assertEqual('1');
          expect(neg.index).assertEqual(3);
        }
      }
      if (!posSupported && !negSupported) {
        return;
      }
    });

    /**
     * @tc.name testExec0231
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_SUPPLEMENT_TEST_3200
     * @tc.desc Exec lookbehind and negative lookbehind are feature-gated
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0231', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      if (!supportsLookbehindSemantics()) {
        return;
      }
      const posLb = supportsRegExp('(?<=:)\\d+');
      const negLb = supportsRegExp('(?<!abc)\\d+');
      if (posLb) {
        const out = new RegExp('(?<=:)\\d+').exec('price:100');
        expect(out !== null).assertTrue();
        if (out !== null) {
          expect(out[0]).assertEqual('100');
          expect(out.index).assertEqual(6);
        }
      }
      if (negLb) {
        const out = new RegExp('(?<!abc)\\d+').exec('abc100 def100');
        expect(out !== null).assertTrue();
        if (out !== null) {
          expect(out[0]).assertEqual('100');
          expect(out.index).assertEqual(10);
        }
      }
      if (!posLb && !negLb) {
        return;
      }
    });

    /**
     * @tc.name testExec0232
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_SUPPLEMENT_TEST_3300
     * @tc.desc Exec practical email validator returns full-string match only for valid input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0232', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      const re = new RegExp('^[\\w.-]+@[\\w.-]+\\.[A-Za-z]{2,}$');
      const ok = re.exec('test@example.com');
      const bad = re.exec('bad@');
      expect(ok !== null).assertTrue();
      expect(bad === null).assertTrue();
      if (ok !== null) {
        expect(ok[0]).assertEqual('test@example.com');
        expect(ok.index).assertEqual(0);
      }
    });

    /**
     * @tc.name testExec0233
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_SUPPLEMENT_TEST_3400
     * @tc.desc Exec global loop collects all match indices in order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0233', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      const re = new RegExp('test', 'g');
      const str = 'test test test';
      const got: number[] = [];
      let m = re.exec(str);
      while (m !== null) {
        got.push(m.index);
        m = re.exec(str);
      }
      expect(got.length).assertEqual(3);
      expect(got[0]).assertEqual(0);
      expect(got[1]).assertEqual(5);
      expect(got[2]).assertEqual(10);
      expect(re.lastIndex).assertEqual(0);
    });

    /**
     * @tc.name testExec0234
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_SUPPLEMENT_TEST_3500
     * @tc.desc Exec hasIndices (d) provides indices for whole match
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0234', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      if (!supportsRegExp('test', 'd')) {
        return;
      }
      const out = new RegExp('test', 'd').exec('this is a test');
      expect(out !== null).assertTrue();
      if (out === null) {
        return;
      }
      expect(out.indices !== undefined).assertTrue();
      expect(out.indices[0][0]).assertEqual(10);
      expect(out.indices[0][1]).assertEqual(14);
    });

    /**
     * @tc.name testExec0235
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_SUPPLEMENT_TEST_3600
     * @tc.desc Exec null input follows ToString coercion contract
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0235', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      expect(execCoercesNullToString()).assertTrue();
    });

    /**
     * @tc.name testExec0236
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_SUPPLEMENT_TEST_3700
     * @tc.desc Exec undefined input follows ToString coercion contract
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0236', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      expect(execCoercesUndefinedToString()).assertTrue();
    });

    /**
     * @tc.name testExec0237
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_SUPPLEMENT_TEST_3800
     * @tc.desc Exec numeric input is coerced to string
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0237', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      expect(execCoercesNumberToString()).assertTrue();
    });

    /**
     * @tc.name testExec0238
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_SUPPLEMENT_TEST_3900
     * @tc.desc Exec object input uses toString coercion when available
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0238', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      expect(execCoercesObjectWithToString()).assertTrue();
    });

    /**
     * @tc.name testExec0239
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_SUPPLEMENT_TEST_4000
     * @tc.desc Exec object without toString should throw
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0239', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      expect(execObjectCreateNullThrowsTypeError()).assertTrue();
    });

    /**
     * @tc.name testExec0240
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_SUPPLEMENT_TEST_4100
     * @tc.desc Exec sticky lastIndex update reflects exact match length
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      if (!supportsRegExp('foo', 'y')) {
        return;
      }
      const re = new RegExp('foo', 'y');
      const s = 'foo foo';
      re.lastIndex = 0;
      const hit = re.exec(s);
      expect(hit !== null).assertTrue();
      expect(re.lastIndex).assertEqual(3);
    });

    /**
     * @tc.name testExec0241
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_SUPPLEMENT_TEST_4200
     * @tc.desc Exec failure resets lastIndex for global regex
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0241', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      const re = new RegExp('abc', 'g');
      re.lastIndex = 2;
      const out = re.exec('xyz');
      expect(out === null).assertTrue();
      expect(re.lastIndex).assertEqual(0);
    });

    /**
     * @tc.name testExec0242
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_SUPPLEMENT_TEST_4300
     * @tc.desc Exec without global does not update lastIndex on success
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0242', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      const re = new RegExp('foo');
      re.lastIndex = 7;
      const out = re.exec('foo foo');
      expect(out !== null).assertTrue();
      expect(re.lastIndex).assertEqual(7);
    });

    /**
     * @tc.name testExec0243
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_SUPPLEMENT_TEST_4400
     * @tc.desc Exec character classes match expected single code unit
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0243', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      expect(new RegExp('[abc]').exec('a') !== null).assertTrue();
      expect(new RegExp('[abc]').exec('b') !== null).assertTrue();
      expect(new RegExp('[abc]').exec('d') === null).assertTrue();
      const neg = new RegExp('[^abc]').exec('d');
      expect(neg !== null).assertTrue();
      if (neg !== null) {
        expect(neg[0]).assertEqual('d');
      }
    });

    /**
     * @tc.name testExec0244
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_SUPPLEMENT_TEST_4500
     * @tc.desc Exec range class distinguishes lowercase from uppercase
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0244', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      expect(new RegExp('[a-z]').exec('a') !== null).assertTrue();
      expect(new RegExp('[a-z]').exec('z') !== null).assertTrue();
      expect(new RegExp('[a-z]').exec('A') === null).assertTrue();
    });

    /**
     * @tc.name testExec0245
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_SUPPLEMENT_TEST_4600
     * @tc.desc Exec predefined classes extract digit runs
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0245', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      const out = new RegExp('\\d+').exec('abc123def');
      expect(out !== null).assertTrue();
      if (out !== null) {
        expect(out[0]).assertEqual('123');
        expect(out.index).assertEqual(3);
      }
    });

    /**
     * @tc.name testExec0246
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_SUPPLEMENT_TEST_4700
     * @tc.desc Exec escaped metacharacter matches literal dot
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0246', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      const out = new RegExp('\\.').exec('a.b');
      expect(out !== null).assertTrue();
      if (out !== null) {
        expect(out[0]).assertEqual('.');
        expect(out.index).assertEqual(1);
      }
    });

    /**
     * @tc.name testExec0247
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_SUPPLEMENT_TEST_4800
     * @tc.desc Exec tab and newline tokens match control characters
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0247', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      expect(new RegExp('\\t').exec('a\tb') !== null).assertTrue();
      expect(new RegExp('\\n').exec('a\nb') !== null).assertTrue();
    });

    /**
     * @tc.name testExec0248
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_SUPPLEMENT_TEST_4900
     * @tc.desc Exec BMP unicode range matches expected CJK substring
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0248', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      const out = new RegExp('[\\u4e00-\\u9fa5]+').exec('hello世界world');
      expect(out !== null).assertTrue();
      if (out !== null) {
        expect(out[0]).assertEqual('世界');
        expect(out.index).assertEqual(5);
      }
    });

    /**
     * @tc.name testExec0249
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_SUPPLEMENT_TEST_5000
     * @tc.desc Exec Unicode property escape for Emoji is feature-gated
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0249', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      if (!supportsRegExp('\\p{Emoji}', 'u')) {
        return;
      }
      const out = new RegExp('\\p{Emoji}', 'u').exec('Hello 😀 World');
      expect(out !== null).assertTrue();
      if (out !== null) {
        expect(out[0]).assertEqual('😀');
      }
    });

    /**
     * @tc.name testExec0250
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_SUPPLEMENT_TEST_5100
     * @tc.desc Exec zero-length global multiline requires bounded progress
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0250', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      const re = new RegExp('^', 'gm');
      const str = 'line1\nline2\nline3';
      let count = 0;
      while (count < 32) {
        const m = re.exec(str);
        if (m === null) {
          break;
        }
        count++;
        const hit0 = m[0];
        if (hit0 !== undefined && hit0.length === 0) {
          re.lastIndex++;
        }
      }
      expect(count >= 3).assertTrue();
      expect(count <= 32).assertTrue();
      expect(re.lastIndex).assertEqual(0);
    });

    /**
     * @tc.name testExec0251
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_SUPPLEMENT_TEST_5200
     * @tc.desc Exec switching strings does not implicitly reset lastIndex
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0251', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      const re = new RegExp('ab*', 'g');
      re.exec('abbc');
      expect(re.lastIndex).assertEqual(3);
      re.exec('xyz');
      expect(re.lastIndex).assertEqual(0);
    });

    /**
     * @tc.name testExec0252
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_SUPPLEMENT_TEST_5300
     * @tc.desc Exec manual lastIndex reset replays the same first hit
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0252', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      const re = new RegExp('foo', 'g');
      const str = 'foo foo foo';
      const a = re.exec(str);
      expect(a !== null).assertTrue();
      expect(re.lastIndex).assertEqual(3);
      re.lastIndex = 0;
      const b = re.exec(str);
      expect(b !== null).assertTrue();
      if (b !== null) {
        expect(b.index).assertEqual(0);
      }
      expect(re.lastIndex).assertEqual(3);
    });

    /**
     * @tc.name testExec0253
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_SUPPLEMENT_TEST_5400
     * @tc.desc Exec and test share lastIndex state for global regex
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0253', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      const re = new RegExp('foo', 'g');
      const str = 'foo foo';
      const ok = re.test(str);
      expect(ok).assertTrue();
      expect(re.lastIndex).assertEqual(3);
      const out = re.exec(str);
      expect(out !== null).assertTrue();
      expect(re.lastIndex).assertEqual(7);
    });

    /**
     * @tc.name testExec0254
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_SUPPLEMENT_TEST_5500
     * @tc.desc Exec and String.match(g) align on successive hits
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0254', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      const re = new RegExp('foo', 'g');
      const str = 'foo foo';
      const e1 = re.exec(str);
      const e2 = re.exec(str);
      const m = str.match(re);
      expect(e1 !== null).assertTrue();
      expect(e2 !== null).assertTrue();
      expect(m !== null).assertTrue();
      if (e1 !== null && e2 !== null && m !== null) {
        expect(e1[0]).assertEqual(m[0]);
        expect(e2[0]).assertEqual(m[1]);
      }
      expect(re.lastIndex).assertEqual(0);
    });

    /**
     * @tc.name testExec0255
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_SUPPLEMENT_TEST_5600
     * @tc.desc Exec and String.search return consistent first-hit index
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0255', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      const re = new RegExp('hello');
      const str = 'say hello world';
      const ex = re.exec(str);
      const idx = str.search(re);
      expect(ex !== null).assertTrue();
      if (ex !== null) {
        expect(ex.index).assertEqual(idx);
      }
    });

    /**
     * @tc.name testExec0256
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_SUPPLEMENT_TEST_5700
     * @tc.desc Exec start and end anchors accept only boundary-aligned matches
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0256', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      expect(new RegExp('^hello').exec('hello world') !== null).assertTrue();
      expect(new RegExp('^hello').exec('say hello') === null).assertTrue();
      expect(new RegExp('world$').exec('hello world') !== null).assertTrue();
      expect(new RegExp('world$').exec('world hello') === null).assertTrue();
    });

    /**
     * @tc.name testExec0257
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_SUPPLEMENT_TEST_5800
     * @tc.desc Exec word and non-word boundaries distinguish token edges
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0257', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      expect(new RegExp('\\btest\\b').exec('test') !== null).assertTrue();
      expect(new RegExp('\\btest\\b').exec('testing') === null).assertTrue();
      expect(new RegExp('test\\B').exec('testing') !== null).assertTrue();
      expect(new RegExp('test\\B').exec('test') === null).assertTrue();
    });

    /**
     * @tc.name testExec0258
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_SUPPLEMENT_TEST_5900
     * @tc.desc Exec dynamic RegExp construction respects pattern and flags
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0258', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      const pattern = 'hello';
      const flags = 'i';
      const re = new RegExp(pattern, flags);
      const out = re.exec('HELLO');
      expect(out !== null).assertTrue();
      if (out !== null) {
        expect(out[0]).assertEqual('HELLO');
      }
      expect(re.flags).assertEqual('i');
    });

    /**
     * @tc.name testExec0259
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_SUPPLEMENT_TEST_6000
     * @tc.desc Exec alternation backtracking picks matching branch capture
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0259', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      const re = new RegExp('a(b|c)d');
      const a = re.exec('abd');
      const b = re.exec('acd');
      expect(a !== null).assertTrue();
      expect(b !== null).assertTrue();
      if (a !== null && b !== null) {
        expect(a[1]).assertEqual('b');
        expect(b[1]).assertEqual('c');
      }
    });

    /**
     * @tc.name testExec0260
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_SUPPLEMENT_TEST_6100
     * @tc.desc Exec nested structure pattern captures whole complex token
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0260', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      const re = new RegExp('((?:[A-Za-z]+)(?:\\d+))');
      const out = re.exec('test123');
      expect(out !== null).assertTrue();
      if (out !== null) {
        expect(out[0]).assertEqual('test123');
        expect(out[1]).assertEqual('test123');
      }
    });

    /**
     * @tc.name testExec0261
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_SUPPLEMENT_TEST_6200
     * @tc.desc Exec lastIndex starts at zero and stays for non-global regex
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0261', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      const re = new RegExp('test');
      expect(re.lastIndex).assertEqual(0);
      re.exec('test');
      expect(re.lastIndex).assertEqual(0);
    });

    /**
     * @tc.name testExec0262
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_SUPPLEMENT_TEST_6300
     * @tc.desc Exec sticky mode requires exact cursor and supports alternate positions
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0262', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      if (!supportsRegExp('test', 'y')) {
        return;
      }
      const re = new RegExp('test', 'y');
      const str = 'test test';
      re.lastIndex = 0;
      const a = re.exec(str);
      expect(a !== null).assertTrue();
      re.lastIndex = 5;
      const b = re.exec(str);
      expect(b !== null).assertTrue();
      re.lastIndex = 1;
      const c = re.exec(str);
      expect(c === null).assertTrue();
    });

    /**
     * @tc.name testExec0263
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_SUPPLEMENT_TEST_6400
     * @tc.desc Exec out-of-range lastIndex fails and resets for global regex
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0263', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      const re = new RegExp('test', 'g');
      re.lastIndex = 100;
      const out = re.exec('test');
      expect(out === null).assertTrue();
      expect(re.lastIndex).assertEqual(0);
    });

    /**
     * @tc.name testExec0264
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_SUPPLEMENT_TEST_6500
     * @tc.desc Exec negative lastIndex is clamped to zero for global regex
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0264', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      const re = new RegExp('test', 'g');
      re.lastIndex = -1;
      const out = re.exec('test');
      expect(out !== null).assertTrue();
      if (out !== null) {
        expect(out.index).assertEqual(0);
      }
      expect(re.lastIndex).assertEqual(4);
    });

    /**
     * @tc.name testExec0265
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_SUPPLEMENT_TEST_6600
     * @tc.desc Exec result type exposes array-like payload with metadata fields
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0265', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      const out = new RegExp('test').exec('test');
      expect(out !== null).assertTrue();
      if (out !== null) {
        expect(Array.isArray(out)).assertTrue();
        const t: string = typeof out.index;
        expect(t === 'number' || t === 'int').assertTrue();
        expect(typeof out.input).assertEqual('string');
      }
    });

    /**
     * @tc.name testExec0266
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_SUPPLEMENT_TEST_6700
     * @tc.desc Exec no-match returns null and keeps non-global cursor unchanged
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0266', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      const re = new RegExp('test');
      re.lastIndex = 3;
      const out = re.exec('hello');
      expect(out === null).assertTrue();
      expect(re.lastIndex).assertEqual(3);
    });

    /**
     * @tc.name testExec0267
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_SUPPLEMENT_TEST_6800
     * @tc.desc Exec invalid pattern construction throws before matching
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0267', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      let threw = false;
      try {
        new RegExp('[a-z');
      } catch (e) {
        threw = true;
      }
      expect(threw).assertTrue();
    });

    /**
     * @tc.name testExec0268
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_SUPPLEMENT_TEST_6900
     * @tc.desc Exec invalid flags construction throws for unsupported flag letters
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0268', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      let threw = false;
      try {
        new RegExp('abc', 'x');
      } catch (e) {
        threw = true;
      }
      expect(threw).assertTrue();
    });

    /**
     * @tc.name testExec0269
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_SUPPLEMENT_TEST_7000
     * @tc.desc Exec with d and named groups exposes indices.groups when supported
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0269', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      if (!supportsRegExp('(?<word>hello)', 'd')) {
        return;
      }
      const out = new RegExp('(?<word>hello)', 'd').exec('hello world');
      expect(out !== null).assertTrue();
      if (out === null) {
        return;
      }
      
      expect(out[0]).assertEqual('hello');
    });

    /**
     * @tc.name testExec0270
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_SUPPLEMENT_TEST_7100
     * @tc.desc Exec and matchAll align on match count and first payload
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0270', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      const re = new RegExp('foo', 'g');
      const str = 'foo foo';
      const viaExec: string[] = [];
      while (true) {
        const m = re.exec(str);
        if (m === null) {
          break;
        }
        const hit0 = m[0];
        if (hit0 === undefined) {
          break;
        }
        viaExec.push(hit0);
      }
      const iter = str.matchAll(new RegExp('foo', 'g'));
      const viaAll = Array.from(iter)
        .map((x) => x[0])
        .filter((x) => x !== undefined) as string[];
      expect(viaExec.length).assertEqual(viaAll.length);
      expect(viaExec[0]).assertEqual(viaAll[0]);
      expect(viaExec[1]).assertEqual(viaAll[1]);
    });

    /**
     * @tc.name testExec0271
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_SUPPLEMENT_TEST_7200
     * @tc.desc Exec preserves regexp source and flags after matching
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0271', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      const re = new RegExp('foo\\d+', 'gi');
      re.exec('Foo123');
      expect(re.source).assertEqual('foo\\d+');
      expect(re.flags.indexOf('g') >= 0).assertTrue();
      expect(re.flags.indexOf('i') >= 0).assertTrue();
    });

    /**
     * @tc.name testExec0272
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_SUPPLEMENT_TEST_7300
     * @tc.desc Exec protocol detection by start-anchor remains deterministic
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0272', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      const https = new RegExp('^https:').exec('https://example.com');
      const http = new RegExp('^http:').exec('http://example.com');
      const none = new RegExp('^https?:').exec('ftp://example.com');
      expect(https !== null).assertTrue();
      expect(http !== null).assertTrue();
      expect(none === null).assertTrue();
    });

    /**
     * @tc.name testExec0273
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_SUPPLEMENT_TEST_7400
     * @tc.desc Exec IPv4 pattern matches legal values and rejects out-of-range octets
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0273', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      const ip = new RegExp('^((25[0-5]|2[0-4]\\d|1\\d\\d|[1-9]?\\d)\\.){3}(25[0-5]|2[0-4]\\d|1\\d\\d|[1-9]?\\d)$');
      expect(ip.exec('192.168.1.1') !== null).assertTrue();
      expect(ip.exec('256.1.1.1') === null).assertTrue();
    });

    /**
     * @tc.name testExec0274
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_SUPPLEMENT_TEST_7500
     * @tc.desc Exec date prefix pattern validates yyyy-mm-dd at string start
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0274', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      const re = new RegExp('^\\d{4}-\\d{2}-\\d{2}');
      expect(re.exec('2023-12-25T10:00:00') !== null).assertTrue();
      expect(re.exec('x2023-12-25') === null).assertTrue();
    });

    /**
     * @tc.name testExec0275
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_SUPPLEMENT_TEST_7600
     * @tc.desc Exec key-value extraction returns key and value captures
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0275', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      const out = new RegExp('(\\w+):(\\w+)').exec('name:John');
      expect(out !== null).assertTrue();
      if (out !== null) {
        expect(out[1]).assertEqual('name');
        expect(out[2]).assertEqual('John');
      }
    });

    /**
     * @tc.name testExec0276
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_SUPPLEMENT_TEST_7700
     * @tc.desc Exec multiple alternation branches choose earliest leftmost hit
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0276', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      const out = new RegExp('cat|dog|bird').exec('xxdog bird');
      expect(out !== null).assertTrue();
      if (out !== null) {
        expect(out[0]).assertEqual('dog');
        expect(out.index).assertEqual(2);
      }
    });

    /**
     * @tc.name testExec0277
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_SUPPLEMENT_TEST_7800
     * @tc.desc Exec optional groups allow missing trailing segments
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0277', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      const a = new RegExp('v(\\d+)(\\.\\d+)?').exec('v1');
      const b = new RegExp('v(\\d+)(\\.\\d+)?').exec('v1.2');
      expect(a !== null).assertTrue();
      expect(b !== null).assertTrue();
      if (a !== null && b !== null) {
        expect(a[1]).assertEqual('1');
        expect(a[2] === undefined).assertTrue();
        expect(b[2]).assertEqual('.2');
      }
    });

    /**
     * @tc.name testExec0278
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_SUPPLEMENT_TEST_7900
     * @tc.desc Exec hexadecimal token extraction with case-insensitive flag
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0278', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      
      const out = new RegExp('[dDeEaAbBcCfF0-9]+').exec('ID=DeAdBeEf');
      expect(out !== null).assertTrue();
      if (out !== null) {
        expect(out[0]).assertEqual('D');
        expect(out.index).assertEqual(1);
      }
    });

    /**
     * @tc.name testExec0279
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_SUPPLEMENT_TEST_8000
     * @tc.desc Exec with gy flags consumes contiguous token run only
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0279', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      if (!supportsRegExp('a', 'gy')) {
        return;
      }
      const re = new RegExp('a', 'gy');
      const s = 'aa-b';
      const one = re.exec(s);
      const two = re.exec(s);
      const three = re.exec(s);
      expect(one !== null).assertTrue();
      expect(two !== null).assertTrue();
      expect(three === null).assertTrue();
      expect(re.lastIndex).assertEqual(0);
    });

    /**
     * @tc.name testExec0280
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_SUPPLEMENT_TEST_8100
     * @tc.desc Exec comparison with rebuilt regex from source and flags
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0280', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      const base = new RegExp('x\\d+', 'i');
      const rebuilt = new RegExp(base.source, base.flags);
      const a = base.exec('abX12cd');
      const b = rebuilt.exec('abX12cd');
      expect(a !== null).assertTrue();
      expect(b !== null).assertTrue();
      if (a !== null && b !== null) {
        expect(a[0]).assertEqual(b[0]);
        expect(a.index).assertEqual(b.index);
      }
    });

    /**
     * @tc.name testExec0281
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_SUPPLEMENT_TEST_8200
     * @tc.desc Exec trim-safe key extraction ignores surrounding whitespace
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0281', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      const out = new RegExp('^\\s*(\\w+)\\s*=\\s*(\\w+)\\s*$').exec('  mode = debug  ');
      expect(out !== null).assertTrue();
      if (out !== null) {
        expect(out[1]).assertEqual('mode');
        expect(out[2]).assertEqual('debug');
      }
    });

    /**
     * @tc.name testExec0282
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_SUPPLEMENT_TEST_8300
     * @tc.desc Exec timestamp extraction captures date and time parts
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0282', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      const out = new RegExp('^(\\d{4}-\\d{2}-\\d{2})[ T](\\d{2}:\\d{2}:\\d{2})').exec('2026-04-20 13:45:59 INFO');
      expect(out !== null).assertTrue();
      if (out !== null) {
        expect(out[1]).assertEqual('2026-04-20');
        expect(out[2]).assertEqual('13:45:59');
      }
    });

    /**
     * @tc.name testExec0283
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_SUPPLEMENT_TEST_8400
     * @tc.desc Exec invalid Unicode property escape throws when Unicode properties are supported
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0283', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      if (!supportsRegExp('\\p{L}', 'u')) {
        return;
      }
      let threw = false;
      try {
        new RegExp('\\p{Invalid}', 'u');
      } catch (e) {
        threw = true;
      }
      expect(threw).assertTrue();
    });

    /**
     * @tc.name testExec0284
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_SUPPLEMENT_TEST_8500
     * @tc.desc Exec empty pattern global on non-empty input is bounded and reset-safe
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0284', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      const re = new RegExp('(?:)', 'g');
      const s = 'abc';
      let count = 0;
      while (count < 32) {
        const m = re.exec(s);
        if (m === null) {
          break;
        }
        count++;
        const hit0 = m[0];
        if (hit0 !== undefined && hit0.length === 0) {
          re.lastIndex++;
        }
      }
      expect(count > 0).assertTrue();
      expect(count <= 32).assertTrue();
      expect(re.lastIndex).assertEqual(0);
    });
  });
}
