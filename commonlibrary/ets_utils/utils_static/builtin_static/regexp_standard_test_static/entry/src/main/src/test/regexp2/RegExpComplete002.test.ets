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

export default function regExpComplete002Test(): void {
  describe('RegExpComplete_Supplement_Compile_Safe', () => {
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
     * @tc.name testRegExpComplete0200
     * @tc.number SUB_COMMONLIBRARY_REGEXP_COMPLETE_SUPPLEMENT_TEST_0100
     * @tc.desc Source and flags reflect constructor inputs
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testRegExpComplete0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const re = new RegExp('abc', 'gi');
      expect(re.source).assertEqual('abc');
      expect(re.flags).assertEqual('gi');
    });

    /**
     * @tc.name testRegExpComplete0201
     * @tc.number SUB_COMMONLIBRARY_REGEXP_COMPLETE_SUPPLEMENT_TEST_0200
     * @tc.desc Cloned RegExp preserves source and flags
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testRegExpComplete0201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const re = new RegExp('a');
      const cloned = new RegExp(re);
      expect(cloned.source).assertEqual('a');
      expect(cloned.flags).assertEqual('');
    });

    /**
     * @tc.name testRegExpComplete0202
     * @tc.number SUB_COMMONLIBRARY_REGEXP_COMPLETE_SUPPLEMENT_TEST_0300
     * @tc.desc Global exec iterates matches and tracks lastIndex
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testRegExpComplete0202', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const re = new RegExp('\\w+', 'g');
      const first = re.exec('a b');
      const second = re.exec('a b');
      expect(first !== null).assertTrue();
      expect(second !== null).assertTrue();
      if (first === null || second === null) {
        return;
      }
      expect(first[0]).assertEqual('a');
      expect(second[0]).assertEqual('b');
      expect(re.lastIndex).assertEqual(3);
    });

    /**
     * @tc.name testRegExpComplete0203
     * @tc.number SUB_COMMONLIBRARY_REGEXP_COMPLETE_SUPPLEMENT_TEST_0400
     * @tc.desc Multiline anchor works with line-ending boundaries
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testRegExpComplete0203', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const re = new RegExp('line$', 'm');
      const out = re.test('first\nline');
      expect(out).assertTrue();
    });

    /**
     * @tc.name testRegExpComplete0204
     * @tc.number SUB_COMMONLIBRARY_REGEXP_COMPLETE_SUPPLEMENT_TEST_0500
     * @tc.desc lastIndex defaults and is mutable for global/sticky regex
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testRegExpComplete0204', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const g = new RegExp('a', 'g');
      expect(g.lastIndex).assertEqual(0);
      g.lastIndex = 2;
      expect(g.lastIndex).assertEqual(2);
      const first = g.exec('baaa');
      expect(first !== null).assertTrue();
      if (first !== null) {
        expect(first.index).assertEqual(2);
      }
      expect(g.lastIndex).assertEqual(3);
    });

    /**
     * @tc.name testRegExpComplete0205
     * @tc.number SUB_COMMONLIBRARY_REGEXP_COMPLETE_SUPPLEMENT_TEST_0600
     * @tc.desc exec/test global lastIndex resets to 0 after failing to match
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testRegExpComplete0205', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const re = new RegExp('foo', 'g');
      expect(re.exec('foo foo') !== null).assertTrue();
      expect(re.lastIndex).assertEqual(3);
      expect(re.exec('zzz') === null).assertTrue();
      expect(re.lastIndex).assertEqual(0);

      const re2 = new RegExp('a', 'g');
      expect(re2.test('ba')).assertTrue();
      expect(re2.lastIndex).assertEqual(2);
      expect(re2.test('ba')).assertFalse();
      expect(re2.lastIndex).assertEqual(0);
    });

    /**
     * @tc.name testRegExpComplete0206
     * @tc.number SUB_COMMONLIBRARY_REGEXP_COMPLETE_SUPPLEMENT_TEST_0700
     * @tc.desc toString/source/flags are consistent across construction forms
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testRegExpComplete0206', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const r1 = new RegExp('ab+c', 'gi');
      const r2 = new RegExp('ab+c', 'ig');
      expect(r1.source).assertEqual(r2.source);
      expect(r1.flags).assertEqual(r2.flags);
      expect(r1.toString()).assertEqual(r2.toString());
    });

    /**
     * @tc.name testRegExpComplete0207
     * @tc.number SUB_COMMONLIBRARY_REGEXP_COMPLETE_SUPPLEMENT_TEST_0800
     * @tc.desc compile-time safe feature probes for s/u/y flags
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testRegExpComplete0207', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const input = 'hello\nworld 😀';
      if (supportsRegExp('hello.world', 's')) {
        expect(new RegExp('hello.world', 's').test(input)).assertTrue();
      } else {
        expect(new RegExp('hello.world').test(input)).assertFalse();
      }

      if (supportsRegExp('\\u{1F600}', 'u')) {
        expect(new RegExp('\\u{1F600}', 'u').test(input)).assertTrue();
      }

      if (supportsRegExp('world', 'y')) {
        const y = new RegExp('world', 'y');
        y.lastIndex = 6;
        expect(y.test(input)).assertTrue();
        y.lastIndex = 7;
        expect(y.test(input)).assertFalse();
      }
    });

    /**
     * @tc.name testRegExpComplete0208
     * @tc.number SUB_COMMONLIBRARY_REGEXP_COMPLETE_SUPPLEMENT_TEST_0900
     * @tc.desc constructor throws when flags contain duplicates or invalid
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testRegExpComplete0208', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let threw = false;
      try {
        new RegExp('a', 'gg');
      } catch (_) {
        threw = true;
      }
      expect(threw).assertTrue();

      let threw2 = false;
      try {
        new RegExp('a', 'z');
      } catch (_) {
        threw2 = true;
      }
      expect(threw2).assertTrue();
    });

    /**
     * @tc.name testRegExpComplete0209
     * @tc.number SUB_COMMONLIBRARY_REGEXP_COMPLETE_SUPPLEMENT_TEST_1000
     * @tc.desc escaping forward slash is reflected in source and toString
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testRegExpComplete0209', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const re = new RegExp('a/b', 'g');
      expect(re.source).assertEqual('a\\/b');
      expect(re.toString()).assertEqual('/a\\/b/g');
    });

    /**
     * @tc.name testRegExpComplete0210
     * @tc.number SUB_COMMONLIBRARY_REGEXP_COMPLETE_SUPPLEMENT_TEST_1100
     * @tc.desc Boolean flag properties reflect constructor flags
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testRegExpComplete0210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const re = new RegExp('abc', 'gim');
      expect(re.global).assertTrue();
      expect(re.ignoreCase).assertTrue();
      expect(re.multiline).assertTrue();
      expect(re.unicode).assertFalse();
      expect(re.sticky).assertFalse();
    });

    /**
     * @tc.name testRegExpComplete0211
     * @tc.number SUB_COMMONLIBRARY_REGEXP_COMPLETE_SUPPLEMENT_TEST_1200
     * @tc.desc dotAll unicode sticky and hasIndices properties if supported
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testRegExpComplete0211', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      if (supportsRegExp('a.b', 's')) {
        expect(new RegExp('a.b', 's').dotAll).assertTrue();
      }
      if (supportsRegExp('x', 'u')) {
        expect(new RegExp('x', 'u').unicode).assertTrue();
      }
      if (supportsRegExp('x', 'y')) {
        expect(new RegExp('x', 'y').sticky).assertTrue();
      }
      if (supportsRegExp('x', 'd')) {
        expect(new RegExp('x', 'd').hasIndices).assertTrue();
      }
    });

    /**
     * @tc.name testRegExpComplete0212
     * @tc.number SUB_COMMONLIBRARY_REGEXP_COMPLETE_SUPPLEMENT_TEST_1300
     * @tc.desc Reconstructing from RegExp with explicit flags overrides source flags
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testRegExpComplete0212', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const base = new RegExp('abc', 'gi');
      const overridden = new RegExp(base, 'm');
      expect(overridden.source).assertEqual('abc');
      expect(overridden.flags).assertEqual('m');
      expect(overridden.global).assertFalse();
      expect(overridden.multiline).assertTrue();
    });

    /**
     * @tc.name testRegExpComplete0213
     * @tc.number SUB_COMMONLIBRARY_REGEXP_COMPLETE_SUPPLEMENT_TEST_1400
     * @tc.desc Non-global test ignores lastIndex mutations
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testRegExpComplete0213', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const re = new RegExp('b');
      re.lastIndex = 2;
      expect(re.test('abc')).assertTrue();
      
      expect(re.lastIndex === 2 || re.lastIndex === 0).assertTrue();
      re.lastIndex = 2;
      expect(re.test('xyz')).assertFalse();
      expect(re.lastIndex === 2 || re.lastIndex === 0).assertTrue();
    });

    /**
     * @tc.name testRegExpComplete0214
     * @tc.number SUB_COMMONLIBRARY_REGEXP_COMPLETE_SUPPLEMENT_TEST_1500
     * @tc.desc source preserves escapes for classes and quantifiers
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testRegExpComplete0214', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const re = new RegExp('[A-Z]{2,4}\\d+');
      expect(re.source).assertEqual('[A-Z]{2,4}\\d+');
      expect(re.toString()).assertEqual('/[A-Z]{2,4}\\d+/');
    });

    /**
     * @tc.name testRegExpComplete0215
     * @tc.number SUB_COMMONLIBRARY_REGEXP_COMPLETE_SUPPLEMENT_TEST_1600
     * @tc.desc Empty source serializes consistently with empty constructor input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testRegExpComplete0215', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const r1 = new RegExp('');
      const r2 = new RegExp(r1.source, r1.flags);
      expect(r2.source).assertEqual(r1.source);
      expect(r2.flags).assertEqual(r1.flags);
      expect(r2.toString()).assertEqual(r1.toString());
    });

    /**
     * @tc.name testRegExpComplete0216
     * @tc.number SUB_COMMONLIBRARY_REGEXP_COMPLETE_SUPPLEMENT_TEST_1700
     * @tc.desc Sticky regex obeys lastIndex and resets after failed test
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testRegExpComplete0216', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      if (!supportsRegExp('foo', 'y')) {
        return;
      }
      const re = new RegExp('foo', 'y');
      const input = 'foo foo';
      re.lastIndex = 4;
      expect(re.test(input)).assertTrue();
      expect(re.lastIndex).assertEqual(7);
      re.lastIndex = 5;
      expect(re.test(input)).assertFalse();
      expect(re.lastIndex).assertEqual(0);
    });

    /**
     * @tc.name testRegExpComplete0217
     * @tc.number SUB_COMMONLIBRARY_REGEXP_COMPLETE_SUPPLEMENT_TEST_1800
     * @tc.desc Duplicate flags always fail even when source is a RegExp object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testRegExpComplete0217', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let threw = false;
      try {
        const base = new RegExp('abc', 'g');
        new RegExp(base, 'gg');
      } catch (_) {
        threw = true;
      }
      expect(threw).assertTrue();
    });

    /**
     * @tc.name testRegExpComplete0218
     * @tc.number SUB_COMMONLIBRARY_REGEXP_COMPLETE_SUPPLEMENT_TEST_1900
     * @tc.desc flags string stays normalized after reconstruction cycles
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testRegExpComplete0218', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const r1 = new RegExp('abc', 'mig');
      const r2 = new RegExp(r1.source, r1.flags);
      const r3 = new RegExp(r2);
      expect(r1.flags).assertEqual('gim');
      expect(r2.flags).assertEqual('gim');
      expect(r3.flags).assertEqual('gim');
      expect(r3.toString()).assertEqual('/abc/gim');
    });

    /**
     * @tc.name testRegExpComplete0219
     * @tc.number SUB_COMMONLIBRARY_REGEXP_COMPLETE_SUPPLEMENT_TEST_2000
     * @tc.desc Default boolean properties are false when flags are absent
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testRegExpComplete0219', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const re = new RegExp('abc');
      expect(re.global).assertFalse();
      expect(re.ignoreCase).assertFalse();
      expect(re.multiline).assertFalse();
      expect(re.unicode).assertFalse();
      expect(re.sticky).assertFalse();
    });

    /**
     * @tc.name testRegExpComplete0220
     * @tc.number SUB_COMMONLIBRARY_REGEXP_COMPLETE_SUPPLEMENT_TEST_2100
     * @tc.desc lastIndex mutability remains stable after multiple test calls
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testRegExpComplete0220', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const re = new RegExp('x', 'g');
      re.lastIndex = 1;
      expect(re.test('axxa')).assertTrue();
      expect(re.lastIndex).assertEqual(2);
      expect(re.test('axxa')).assertTrue();
      expect(re.lastIndex).assertEqual(3);
      re.lastIndex = 0;
      expect(re.lastIndex).assertEqual(0);
    });

    /**
     * @tc.name testRegExpComplete0221
     * @tc.number SUB_COMMONLIBRARY_REGEXP_COMPLETE_SUPPLEMENT_TEST_2200
     * @tc.desc Rebuild chain preserves source text with escaped backslashes
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testRegExpComplete0221', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const r1 = new RegExp('\\w+\\d+');
      const r2 = new RegExp(r1.source, r1.flags);
      const r3 = new RegExp(r2.source, r2.flags);
      expect(r1.source).assertEqual('\\w+\\d+');
      expect(r2.source).assertEqual(r1.source);
      expect(r3.source).assertEqual(r1.source);
    });

    /**
     * @tc.name testRegExpComplete0222
     * @tc.number SUB_COMMONLIBRARY_REGEXP_COMPLETE_SUPPLEMENT_TEST_2300
     * @tc.desc Invalid source pattern throws regardless of flag combinations
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testRegExpComplete0222', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let threw1 = false;
      try {
        new RegExp('(');
      } catch (_) {
        threw1 = true;
      }
      expect(threw1).assertTrue();

      let threw2 = false;
      try {
        new RegExp('[a-', 'g');
      } catch (_) {
        threw2 = true;
      }
      expect(threw2).assertTrue();
    });
  });
}
