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

export default function splitTest002(): void {
  describe('Split_Supplement_Compile_Safe', () => {
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
     * @tc.name testSplit0200
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_SUPPLEMENT_TEST_0100
     * @tc.desc Split by regex separators into expected tokens
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSplit0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const re = new RegExp('[,;]');
      const out = 'a,b;c'.split(re);
      expect(out.length).assertEqual(3);
      expect(out[0]).assertEqual('a');
      expect(out[1]).assertEqual('b');
      expect(out[2]).assertEqual('c');
    });

    /**
     * @tc.name testSplit0201
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_SUPPLEMENT_TEST_0200
     * @tc.desc Split keeps capturing separators in result
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSplit0201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const re = new RegExp('(,)');
      const out = 'a,b'.split(re);
      expect(out.length).assertEqual(3);
      expect(out[0]).assertEqual('a');
      expect(out[1]).assertEqual(',');
      expect(out[2]).assertEqual('b');
    });

    /**
     * @tc.name testSplit0202
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_SUPPLEMENT_TEST_0300
     * @tc.desc Split returns original string when no delimiter matches
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSplit0202', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const re = new RegExp('\\s+');
      const out = 'abc'.split(re);
      expect(out.length).assertEqual(1);
      expect(out[0]).assertEqual('abc');
    });

    /**
     * @tc.name testSplit0203
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_SUPPLEMENT_TEST_0400
     * @tc.desc Split limit truncates output length as expected
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSplit0203', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const re = new RegExp(',');
      const out = 'a,b,c'.split(re, 2);
      expect(out.length).assertEqual(2);
      expect(out[0]).assertEqual('a');
      expect(out[1]).assertEqual('b');
    });

    /**
     * @tc.name testSplit0204
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_SUPPLEMENT_TEST_0500
     * @tc.desc Split: consecutive delimiters produce empty items
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSplit0204', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const out = 'a,,b,'.split(new RegExp(','));
      expect(out.length).assertEqual(4);
      expect(out[0]).assertEqual('a');
      expect(out[1]).assertEqual('');
      expect(out[2]).assertEqual('b');
      expect(out[3]).assertEqual('');
    });

    /**
     * @tc.name testSplit0205
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_SUPPLEMENT_TEST_0600
     * @tc.desc Split: leading delimiter yields leading empty item
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSplit0205', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const out = ',a,b'.split(new RegExp(','));
      expect(out.length).assertEqual(3);
      expect(out[0]).assertEqual('');
      expect(out[1]).assertEqual('a');
      expect(out[2]).assertEqual('b');
    });

    /**
     * @tc.name testSplit0206
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_SUPPLEMENT_TEST_0700
     * @tc.desc Split: whitespace regex trims multiple separators
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSplit0206', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const out = 'a \t  b\nc'.split(new RegExp('\\s+'));
      expect(out.length).assertEqual(3);
      expect(out[0]).assertEqual('a');
      expect(out[1]).assertEqual('b');
      expect(out[2]).assertEqual('c');
    });

    /**
     * @tc.name testSplit0207
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_SUPPLEMENT_TEST_0800
     * @tc.desc Split: capturing groups are included between tokens
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSplit0207', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const out = 'a,b;c'.split(new RegExp('([,;])'));
      expect(out.length).assertEqual(5);
      expect(out[0]).assertEqual('a');
      expect(out[1]).assertEqual(',');
      expect(out[2]).assertEqual('b');
      expect(out[3]).assertEqual(';');
      expect(out[4]).assertEqual('c');
    });

    /**
     * @tc.name testSplit0208
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_SUPPLEMENT_TEST_0900
     * @tc.desc Split: limit=0 returns empty array per JS spec behavior
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSplit0208', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const out = 'a,b,c'.split(new RegExp(','), 0);
      expect(out.length).assertEqual(0);
    });

    /**
     * @tc.name testSplit0209
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_SUPPLEMENT_TEST_1000
     * @tc.desc Split: empty pattern splits between UTF-16 code units
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSplit0209', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const out = 'abc'.split(new RegExp('(?:)'));
      expect(out.length).assertEqual(3);
      expect(out[0]).assertEqual('a');
      expect(out[1]).assertEqual('b');
      expect(out[2]).assertEqual('c');
    });

    /**
     * @tc.name testSplit0210
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_SUPPLEMENT_TEST_1100
     * @tc.desc Split: word boundary delimiter separates tokens as expected
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSplit0210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const out = 'foo-bar_baz'.split(new RegExp('\\b'));
      
      expect(out.length).assertEqual(3);
      expect(out.join('')).assertEqual('foo-bar_baz');
    });

    /**
     * @tc.name testSplit0211
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_SUPPLEMENT_TEST_1200
     * @tc.desc Split: limit greater than result length keeps full output
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSplit0211', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const out = 'a,b,c'.split(new RegExp(','), 99);
      expect(out.length).assertEqual(3);
      expect(out[0]).assertEqual('a');
      expect(out[1]).assertEqual('b');
      expect(out[2]).assertEqual('c');
    });

    /**
     * @tc.name testSplit0212
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_SUPPLEMENT_TEST_1300
     * @tc.desc Split: multi-character regex delimiter
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSplit0212', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const out = 'x--y----z'.split(new RegExp('--+'));
      expect(out.length).assertEqual(3);
      expect(out[0]).assertEqual('x');
      expect(out[1]).assertEqual('y');
      expect(out[2]).assertEqual('z');
    });

    /**
     * @tc.name testSplit0213
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_SUPPLEMENT_TEST_1400
     * @tc.desc Split: newline delimiters with and without carriage return
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSplit0213', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const out1 = 'a\nb\nc'.split(new RegExp('\\n'));
      expect(out1.length).assertEqual(3);
      const out2 = 'a\r\nb\r\nc'.split(new RegExp('\\r?\\n'));
      expect(out2.length).assertEqual(3);
      expect(out2[0]).assertEqual('a');
      expect(out2[1]).assertEqual('b');
      expect(out2[2]).assertEqual('c');
    });

    /**
     * @tc.name testSplit0214
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_SUPPLEMENT_TEST_1500
     * @tc.desc Split: capturing groups include optional undefined group slots
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSplit0214', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const out = 'a-1-b'.split(new RegExp('(-)(\\d)?'));
      expect(out.length).assertEqual(7);
      expect(out[0]).assertEqual('a');
      expect(out[1]).assertEqual('-');
      expect(out[2]).assertEqual('1');
      expect(out[3]).assertEqual('');
      expect(out[4]).assertEqual('-');
      expect(out[5]).assertEqual('');
      expect(out[6]).assertEqual('b');
    });

    /**
     * @tc.name testSplit0215
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_SUPPLEMENT_TEST_1600
     * @tc.desc Split: unicode separator token and emoji handling
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSplit0215', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const out = 'a😀b😀c'.split(new RegExp('😀'));
      expect(out.length).assertEqual(3);
      expect(out[0]).assertEqual('a');
      expect(out[1]).assertEqual('b');
      expect(out[2]).assertEqual('c');
    });

    /**
     * @tc.name testSplit0216
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_SUPPLEMENT_TEST_1700
     * @tc.desc Split: non-RegExp separator string semantics via any coercion
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSplit0216', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const s = 'path/to/file';
      const out1 = s.split('/');
      expect(out1.length).assertEqual(3);
      expect(out1[0]).assertEqual('path');
      expect(out1[1]).assertEqual('to');
      expect(out1[2]).assertEqual('file');
    });

    /**
     * @tc.name testSplit0217
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_SUPPLEMENT_TEST_1800
     * @tc.desc Split: dotAll flag does not affect plain separator regex match
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSplit0217', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const input = 'a\nb\nc';
      const out1 = input.split(new RegExp('.'));
      expect(out1.length).assertEqual(4);
      if (supportsRegExp('.', 's')) {
        const out2 = input.split(new RegExp('.', 's'));
        expect(out2.length).assertEqual(6);
      }
    });

    /**
     * @tc.name testSplit0218
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_SUPPLEMENT_TEST_1900
     * @tc.desc Split: non-matching delimiter keeps input as a single token
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSplit0218', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const out = 'abcdef'.split(new RegExp('XYZ'));
      expect(out.length).assertEqual(1);
      expect(out[0]).assertEqual('abcdef');
    });

    /**
     * @tc.name testSplit0219
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_SUPPLEMENT_TEST_2000
     * @tc.desc Split: leading and trailing separators preserve edge empties
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSplit0219', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const out = ',a,b,'.split(new RegExp(','));
      expect(out.length).assertEqual(4);
      expect(out[0]).assertEqual('');
      expect(out[1]).assertEqual('a');
      expect(out[2]).assertEqual('b');
      expect(out[3]).assertEqual('');
    });

    /**
     * @tc.name testSplit0220
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_SUPPLEMENT_TEST_2100
     * @tc.desc Split: reconstruction from existing RegExp keeps delimiter semantics
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSplit0220', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const base = new RegExp('\\s+');
      const rebuilt = new RegExp(base);
      const a = 'a  b   c'.split(base);
      const b = 'a  b   c'.split(rebuilt);
      expect(a.length).assertEqual(3);
      expect(b.length).assertEqual(3);
      expect(b[0]).assertEqual('a');
      expect(b[1]).assertEqual('b');
      expect(b[2]).assertEqual('c');
    });

    /**
     * @tc.name testSplit0221
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_SUPPLEMENT_TEST_2200
     * @tc.desc Split: alternation delimiters handle mixed separators in one pass
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSplit0221', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const out = 'a,b;c|d'.split(new RegExp('[,;|]'));
      expect(out.length).assertEqual(4);
      expect(out[0]).assertEqual('a');
      expect(out[1]).assertEqual('b');
      expect(out[2]).assertEqual('c');
      expect(out[3]).assertEqual('d');
    });
  });
}
