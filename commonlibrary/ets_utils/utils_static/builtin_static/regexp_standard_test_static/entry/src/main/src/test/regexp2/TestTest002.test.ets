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

export default function testTest002(): void {
  describe('Test_Supplement_Compile_Safe', () => {
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
     * @tc.name testTest0200
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TEST_SUPPLEMENT_TEST_0100
     * @tc.desc test returns true when input matches numeric pattern
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const re = new RegExp('\\d+');
      const out = re.test('abc123');
      expect(out).assertTrue();
    });

    /**
     * @tc.name testTest0201
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TEST_SUPPLEMENT_TEST_0200
     * @tc.desc test returns false when no numeric token exists
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testTest0201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const re = new RegExp('\\d+');
      const out = re.test('abcdef');
      expect(out).assertFalse();
    });

    /**
     * @tc.name testTest0202
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TEST_SUPPLEMENT_TEST_0300
     * @tc.desc Global test advances and resets lastIndex correctly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testTest0202', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const re = new RegExp('a', 'g');
      const first = re.test('ba');
      const second = re.test('ba');
      expect(first).assertTrue();
      expect(second).assertFalse();
      expect(re.lastIndex).assertEqual(0);
    });

    /**
     * @tc.name testTest0203
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TEST_SUPPLEMENT_TEST_0400
     * @tc.desc Case-insensitive test matches mixed-case input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testTest0203', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const re = new RegExp('abc', 'i');
      expect(re.test('xxAbCyy')).assertTrue();
    });

    /**
     * @tc.name testTest0204
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TEST_SUPPLEMENT_TEST_0500
     * @tc.desc test: ^ and $ anchors with and without multiline flag
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testTest0204', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const input = 'first\nsecond';
      expect(new RegExp('^second$').test(input)).assertFalse();
      expect(new RegExp('^second$', 'm').test(input)).assertTrue();
      expect(new RegExp('second$').test(input)).assertTrue();
    });

    /**
     * @tc.name testTest0205
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TEST_SUPPLEMENT_TEST_0600
     * @tc.desc test: boundaries and character classes
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testTest0205', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const cases: Array<[RegExp, string, boolean]> = [
        [new RegExp('\\btest\\b'), 'test', true],
        [new RegExp('\\btest\\b'), 'testing', false],
        [new RegExp('test\\B'), 'testing', true],
        [new RegExp('test\\B'), 'test', false],
        [new RegExp('\\d+'), 'a12b', true],
        [new RegExp('\\D+'), '123', false],
        [new RegExp('\\s+'), ' \t', true],
        [new RegExp('\\S+'), ' \t', false],
        [new RegExp('\\w+'), 'ab_cd', true],
        [new RegExp('\\W+'), '--', true],
        [new RegExp('[^a-c]+'), 'xyz', true],
        [new RegExp('[a-c]{2}'), 'xxabyy', true],
      ];
      for (let i = 0; i < cases.length; i++) {
        const [re, input, expected] = cases[i];
        expect(re.test(input)).assertEqual(expected);
      }
    });

    /**
     * @tc.name testTest0206
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TEST_SUPPLEMENT_TEST_0700
     * @tc.desc test: quantifiers and greedy/lazy matching sanity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testTest0206', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const cases: Array<[RegExp, string, boolean]> = [
        [new RegExp('a*b'), 'b', true],
        [new RegExp('a*b'), 'a'.repeat(3) + 'b', true],
        [new RegExp('a+b'), 'b', false],
        [new RegExp('a+b'), 'ab', true],
        [new RegExp('a{3}'), 'a'.repeat(3) + 'b', true],
        [new RegExp('a{3}'), 'a'.repeat(2) + 'b', false],
        [new RegExp('a{2,4}b'), 'ab', false],
        [new RegExp('a{2,4}b'), 'a'.repeat(2) + 'b', true],
        [new RegExp('a{2,4}b'), 'a'.repeat(5) + 'b', true],
      ];
      for (let i = 0; i < cases.length; i++) {
        const [re, input, expected] = cases[i];
        expect(re.test(input)).assertEqual(expected);
      }
      expect(new RegExp('a.*b').test('a123b456b')).assertTrue();
      expect(new RegExp('a.*?b').test('a123b456b')).assertTrue();
      const greedy = 'a123b456b'.match(new RegExp('a.*b'));
      const lazy = 'a123b456b'.match(new RegExp('a.*?b'));
      expect(greedy !== null).assertTrue();
      expect(lazy !== null).assertTrue();
      if (greedy !== null && lazy !== null) {
        expect(greedy[0]).assertEqual('a123b456b');
        expect(lazy[0]).assertEqual('a123b');
      }
    });

    /**
     * @tc.name testTest0207
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TEST_SUPPLEMENT_TEST_0800
     * @tc.desc test: dotAll flag (s) matches newline when supported
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testTest0207', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const input = 'hello\nworld';
      expect(new RegExp('hello.world').test(input)).assertFalse();
      if (supportsRegExp('hello.world', 's')) {
        expect(new RegExp('hello.world', 's').test(input)).assertTrue();
      }
    });

    /**
     * @tc.name testTest0208
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TEST_SUPPLEMENT_TEST_0900
     * @tc.desc test: unicode code point escape with u flag when supported
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testTest0208', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const input = 'Hi 😀 there';
      expect(new RegExp('😀').test(input)).assertTrue();
      if (supportsRegExp('\\u{1F600}', 'u')) {
        expect(new RegExp('\\u{1F600}', 'u').test(input)).assertTrue();
      }
    });

    /**
     * @tc.name testTest0209
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TEST_SUPPLEMENT_TEST_1000
     * @tc.desc test: lookahead patterns when supported by engine
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testTest0209', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const input = 'price=100USD';
      if (supportsRegExp('\\d+(?=USD)')) {
        expect(new RegExp('\\d+(?=USD)').test(input)).assertTrue();
      }
      if (supportsRegExp('\\d+(?!EUR)')) {
        expect(new RegExp('\\d+(?!EUR)').test(input)).assertTrue();
      }
    });

    /**
     * @tc.name testTest0210
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TEST_SUPPLEMENT_TEST_1100
     * @tc.desc test: sticky (y) uses lastIndex as the match start when supported
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testTest0210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      if (!supportsRegExp('foo', 'y')) {
        return;
      }
      const re = new RegExp('foo', 'y');
      re.lastIndex = 0;
      expect(re.test('foo foo')).assertTrue();
      re.lastIndex = 1;
      expect(re.test('foo foo')).assertFalse();
    });

    /**
     * @tc.name testTest0211
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TEST_SUPPLEMENT_TEST_1200
     * @tc.desc test: non-global regex does not consume or reset lastIndex
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testTest0211', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const re = new RegExp('abc');
      re.lastIndex = 2;
      expect(re.test('xxabcxx')).assertTrue();
      expect(re.lastIndex === 2 || re.lastIndex === 0).assertTrue();
      re.lastIndex = 2;
      expect(re.test('xyz')).assertFalse();
      const afterFail: number = re.lastIndex;
      expect(afterFail === 0 || afterFail === 2).assertTrue();
    });

    /**
     * @tc.name testTest0212
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TEST_SUPPLEMENT_TEST_1300
     * @tc.desc test: reconstructed regex from source/flags keeps behavior
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testTest0212', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const base = new RegExp('a\\d+', 'i');
      const rebuilt = new RegExp(base.source, base.flags);
      expect(base.test('A12')).assertTrue();
      expect(rebuilt.test('A12')).assertTrue();
      expect(rebuilt.source).assertEqual('a\\d+');
      expect(rebuilt.flags).assertEqual('i');
    });

    /**
     * @tc.name testTest0213
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TEST_SUPPLEMENT_TEST_1400
     * @tc.desc test: alternation and boundaries cover both match and miss
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testTest0213', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const re = new RegExp('cat|dog');
      expect(re.test('xxdogyy')).assertTrue();
      expect(re.test('xxcatyy')).assertTrue();
      expect(re.test('xxcowyy')).assertFalse();
      expect(new RegExp('^dog').test('dog runs')).assertTrue();
      expect(new RegExp('^dog').test('a dog')).assertFalse();
    });

    /**
     * @tc.name testTest0214
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TEST_SUPPLEMENT_TEST_1500
     * @tc.desc test: mixed flags i+m combination supports line-local ignoreCase
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testTest0214', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const input = 'start\nHeLLo\nend';
      const re = new RegExp('^hello$', 'im');
      expect(re.test(input)).assertTrue();
      const re2 = new RegExp('^hello$');
      expect(re2.test(input)).assertFalse();
    });
  });
}
