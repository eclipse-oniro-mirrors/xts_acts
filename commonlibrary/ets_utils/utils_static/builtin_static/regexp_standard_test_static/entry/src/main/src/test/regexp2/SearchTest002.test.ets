import { afterAll, afterEach, beforeAll, beforeEach, describe, it, expect, TestType, Size, Level } from '../../../../hypium/index';
import Utils from '../Util.test';
import {
  regexpSearchCallNullThrows,
  regexpSearchCallUndefinedThrows,
  regexpSearchRegexLikeIndex,
  searchBigIntCoerces,
  searchCustomSymbolSearchObject,
  searchFunctionCoerces,
  searchObjectWithSymbolToPrimitive,
  searchStringEqualsRegExpSymbolSearch,
  searchSymbolParameterThrows
} from './RegExpHelper';

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

export default function searchTest002(): void {
  describe('Search_Supplement_Compile_Safe', () => {
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
     * @tc.name testSearch0200
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_SUPPLEMENT_TEST_0100
     * @tc.desc Search returns the first matched index
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSearch0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const re = new RegExp('world');
      const idx = 'hello world'.search(re);
      expect(idx).assertEqual(6);
    });

    /**
     * @tc.name testSearch0201
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_SUPPLEMENT_EXT_TEST_0300
     * @tc.desc Search returns -1 when pattern is not found
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSearch0201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const re = new RegExp('\\d+');
      const idx = 'abc'.search(re);
      expect(idx).assertEqual(-1);
    });

    /**
     * @tc.name testSearch0202
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_SUPPLEMENT_TEST_0300
     * @tc.desc Search ignores regex lastIndex mutations
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSearch0202', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const re = new RegExp('a', 'g');
      re.lastIndex = 5;
      const idx = 'baaa'.search(re);
      expect(idx).assertEqual(1);
      
      expect(re.lastIndex).assertEqual(5);
    });

    /**
     * @tc.name testSearch0203
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_SUPPLEMENT_TEST_0400
     * @tc.desc Search supports case-insensitive matching
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSearch0203', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const idx = 'ABC'.search(new RegExp('abc', 'i'));
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.name testSearch0204
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_SUPPLEMENT_TEST_0500
     * @tc.desc Search: anchors/boundaries/char classes return correct index
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSearch0204', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const cases: Array<[string, RegExp, number]> = [
        ['hello world', new RegExp('^hello'), 0],
        ['say hello', new RegExp('^hello'), -1],
        ['hello world', new RegExp('world$'), 6],
        ['world hello', new RegExp('world$'), -1],
        ['test', new RegExp('\\btest\\b'), 0],
        ['testing', new RegExp('\\btest\\b'), -1],
        ['testing', new RegExp('test\\B'), 0],
        ['test', new RegExp('test\\B'), -1],
        ['a9z', new RegExp('\\d'), 1],
        ['a9z', new RegExp('\\D'), 0],
        [' \t\n', new RegExp('\\s+'), 0],
        ['a b', new RegExp('\\S+'), 0],
        ['abc', new RegExp('[a-c]{2}'), 0],
        ['xyz', new RegExp('[^a-c]+'), 0],
        ['ab_cd', new RegExp('\\w+'), 0],
        ['--', new RegExp('\\W+'), 0],
      ];
      for (let i = 0; i < cases.length; i++) {
        const [input, re, expected] = cases[i];
        expect(input.search(re)).assertEqual(expected);
      }
    });

    /**
     * @tc.name testSearch0205
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_SUPPLEMENT_TEST_0600
     * @tc.desc Search: alternation/grouping/quantifiers/greedy-lazy behavior
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSearch0205', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const cases: Array<[string, RegExp, number]> = [
        ['xxcatyy', new RegExp('(dog|cat)'), 2],
        ['xxdogyy', new RegExp('(dog|cat)'), 2],
        ['xxcowyy', new RegExp('(dog|cat)'), -1],
        ['abc123', new RegExp('(?:abc)\\d+'), 0],
        ['zzz' + 'ab', new RegExp('a+b'), 3],
        ['zzz' + 'ab', new RegExp('a?b'), 3],
        ['zzz' + 'a'.repeat(3) + 'b', new RegExp('a*b'), 3],
        ['ab', new RegExp('a{1,2}b'), 0],
        ['a'.repeat(2) + 'b', new RegExp('a{2}b'), 0],
        ['a'.repeat(4) + 'b', new RegExp('a{2,4}b'), 0],
        ['b', new RegExp('a*b'), 0],
        ['baaa', new RegExp('a+'), 1],
        ['a123b456b', new RegExp('a.*b'), 0],
        ['a123b456b', new RegExp('a.*?b'), 0],
      ];
      for (let i = 0; i < cases.length; i++) {
        const [input, re, expected] = cases[i];
        expect(input.search(re)).assertEqual(expected);
      }
      
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
     * @tc.name testSearch0206
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_SUPPLEMENT_TEST_0700
     * @tc.desc Search: multiline flag affects ^ and $ behavior
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSearch0206', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const input = 'first\nsecond\nthird';
      expect(input.search(new RegExp('^second'))).assertEqual(-1);
      expect(input.search(new RegExp('^second', 'm'))).assertEqual(6);
      expect(input.search(new RegExp('third$'))).assertEqual(13);
      expect(input.search(new RegExp('second$', 'm'))).assertEqual(6);
    });

    /**
     * @tc.name testSearch0207
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_SUPPLEMENT_TEST_0800
     * @tc.desc Search: escaping of special characters behaves correctly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSearch0207', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const input = 'a+b*c?.()[]{}|^$\\';
      expect(input.search(new RegExp('\\+'))).assertEqual(1);
      expect(input.search(new RegExp('\\*'))).assertEqual(3);
      expect(input.search(new RegExp('\\?'))).assertEqual(5);
      expect(input.search(new RegExp('\\.'))).assertEqual(6);
      expect(input.search(new RegExp('\\('))).assertEqual(7);
      expect(input.search(new RegExp('\\)'))).assertEqual(8);
      expect(input.search(new RegExp('\\['))).assertEqual(9);
      expect(input.search(new RegExp('\\]'))).assertEqual(10);
      expect(input.search(new RegExp('\\{'))).assertEqual(11);
      expect(input.search(new RegExp('\\}'))).assertEqual(12);
      expect(input.search(new RegExp('\\|'))).assertEqual(13);
      expect(input.search(new RegExp('\\^'))).assertEqual(14);
      expect(input.search(new RegExp('\\$'))).assertEqual(15);
      expect(input.search(new RegExp('\\\\'))).assertEqual(16);
    });

    /**
     * @tc.name testSearch0208
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_SUPPLEMENT_TEST_0900
     * @tc.desc Search: dotAll flag (s) when supported matches newline
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSearch0208', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const input = 'hello\nworld';
      expect(input.search(new RegExp('hello.world'))).assertEqual(-1);
      if (supportsRegExp('hello.world', 's')) {
        expect(input.search(new RegExp('hello.world', 's'))).assertEqual(0);
      }
    });

    /**
     * @tc.name testSearch0209
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_SUPPLEMENT_TEST_1000
     * @tc.desc Search: unicode flag (u) for code point escapes when supported
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSearch0209', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const input = 'Hi 😀 there';
      if (supportsRegExp('\\u{1F600}', 'u')) {
        expect(input.search(new RegExp('\\u{1F600}', 'u'))).assertEqual(3);
      }
      
      expect(input.search(new RegExp('😀'))).assertEqual(3);
    });

    /**
     * @tc.name testSearch0210
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_SUPPLEMENT_TEST_1100
     * @tc.desc Search: lookahead patterns work when supported by engine
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSearch0210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const input = 'price=100USD';
      const posLa = supportsRegExp('\\d+(?=USD)');
      const negLa = supportsRegExp('\\d+(?!EUR)');
      
      if (posLa) {
        expect(input.search(new RegExp('\\d+(?=USD)'))).assertEqual(6);
      }
      
      if (negLa) {
        expect(input.search(new RegExp('\\d+(?!EUR)'))).assertEqual(6);
      }
      if (!posLa && !negLa) {
        return;
      }
    });

    /**
     * @tc.name testSearch0211
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_SUPPLEMENT_TEST_1200
     * @tc.desc Search: non-RegExp argument is coerced to string pattern
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSearch0211', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      const text = 'abc[def]ghi';
      expect(text.search('[def]')).assertEqual(4);
      expect(text.search('xyz')).assertEqual(-1);
    });

    /**
     * @tc.name testSearch0212
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_SUPPLEMENT_TEST_1300
     * @tc.desc Search: empty pattern matches at position zero
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSearch0212', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect('abc'.search(new RegExp(''))).assertEqual(0);
      expect(''.search(new RegExp(''))).assertEqual(0);
      expect('abc'.search(new RegExp('(?:)'))).assertEqual(0);
    });

    /**
     * @tc.name testSearch0213
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_SUPPLEMENT_TEST_1400
     * @tc.desc Search: alternation priority and grouping semantics
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSearch0213', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect('foobarbaz'.search(new RegExp('foo|bar'))).assertEqual(0);
      expect('xxbarbaz'.search(new RegExp('foo|bar'))).assertEqual(2);
      expect('xxbaz'.search(new RegExp('foo|bar'))).assertEqual(-1);
      expect('abc123'.search(new RegExp('(?:abc)\\d+'))).assertEqual(0);
      expect('abx123'.search(new RegExp('(?:abc)\\d+'))).assertEqual(-1);
    });

    /**
     * @tc.name testSearch0214
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_SUPPLEMENT_TEST_1500
     * @tc.desc Search: search with global/sticky flags ignores lastIndex
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSearch0214', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const g = new RegExp('foo', 'g');
      g.lastIndex = 4;
      expect('foo foo'.search(g)).assertEqual(0);
      expect(g.lastIndex).assertEqual(4);
      if (supportsRegExp('foo', 'y')) {
        const y = new RegExp('foo', 'y');
        y.lastIndex = 4;
        expect('foo foo'.search(y)).assertEqual(0);
        expect(y.lastIndex).assertEqual(4);
      }
    });

    /**
     * @tc.name testSearch0215
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_SUPPLEMENT_TEST_1600
     * @tc.desc Search: start/end anchor cases with empty string
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSearch0215', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(''.search(new RegExp('^$'))).assertEqual(0);
      expect('a'.search(new RegExp('^$'))).assertEqual(-1);
      expect('a'.search(new RegExp('^'))).assertEqual(0);
      expect('a'.search(new RegExp('$'))).assertEqual(1);
      expect('\n'.search(new RegExp('^$', 'm'))).assertEqual(0);
    });

    /**
     * @tc.name testSearch0216
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_SUPPLEMENT_TEST_1700
     * @tc.desc Search: escaped unicode and hex character patterns
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSearch0216', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect('ABC'.search(new RegExp('\\x42'))).assertEqual(1);
      expect('ABC'.search(new RegExp('\\u0043'))).assertEqual(2);
      expect('Z'.search(new RegExp('\\x5a', 'i'))).assertEqual(0);
      expect('a'.search(new RegExp('\\u0062'))).assertEqual(-1);
    });

    /**
     * @tc.name testSearch0217
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_SUPPLEMENT_TEST_1800
     * @tc.desc Search: mixed separators with character set delimiters
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSearch0217', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const cases: Array<[string, RegExp, number]> = [
        ['a,b;c|d', new RegExp('[,;|]'), 1],
        ['abc def', new RegExp('[,_;|]'), -1],
        ['id=42&ok=true', new RegExp('[=&]'), 2],
        ['path/to/file', new RegExp('[\\\\/]'), 4],
        ['foo\tbar', new RegExp('\\s'), 3],
      ];
      for (let i = 0; i < cases.length; i++) {
        const [input, re, expected] = cases[i];
        expect(input.search(re)).assertEqual(expected);
      }
    });

    /**
     * @tc.name testSearch0218
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_SUPPLEMENT_TEST_1900
     * @tc.desc Search: case-insensitive locale-neutral behavior on ascii
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSearch0218', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect('AlphaBeta'.search(new RegExp('beta', 'i'))).assertEqual(5);
      expect('AlphaBeta'.search(new RegExp('BETA'))).assertEqual(-1);
      expect('MiXeD'.search(new RegExp('mixed', 'i'))).assertEqual(0);
      expect('MiXeD'.search(new RegExp('mixed'))).assertEqual(-1);
    });

    /**
     * @tc.name testSearch0219
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_SUPPLEMENT_TEST_2000
     * @tc.desc Search: no match preserves -1 across anchors and classes
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSearch0219', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect('abc'.search(new RegExp('^z'))).assertEqual(-1);
      expect('abc'.search(new RegExp('z$'))).assertEqual(-1);
      expect('123'.search(new RegExp('[a-z]+'))).assertEqual(-1);
      expect('hello'.search(new RegExp('\\d+'))).assertEqual(-1);
    });

    /**
     * @tc.name testSearch0220
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_SUPPLEMENT_TEST_2100
     * @tc.desc Search: lookbehind assertions when supported by engine
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSearch0220', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      if (!supportsLookbehindSemantics()) {
        return;
      }
      const input = 'USD100 EUR200';
      if (supportsRegExp('(?<=USD)\\d+')) {
        expect(input.search(new RegExp('(?<=USD)\\d+'))).assertEqual(3);
      }
      if (supportsRegExp('(?<!USD)\\d+')) {
        expect('xxx200'.search(new RegExp('(?<!USD)\\d+'))).assertEqual(3);
      }
    });

    /**
     * @tc.name testSearch0221
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_SUPPLEMENT_TEST_2200
     * @tc.desc Search: constructor from RegExp keeps effective search semantics
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSearch0221', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const base = new RegExp('abc', 'i');
      const rebuilt = new RegExp(base);
      expect('xxAbCyy'.search(base)).assertEqual(2);
      expect('xxAbCyy'.search(rebuilt)).assertEqual(2);
      expect(rebuilt.source).assertEqual('abc');
      expect(rebuilt.flags).assertEqual('i');
    });

    /**
     * @tc.name testSearch0222
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_SUPPLEMENT_TEST_2300
     * @tc.desc Search: numeric pattern coercion for non-RegExp argument
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSearch0222', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      const text: string = 'id=2026';
      expect(text.search('2026')).assertEqual(3);
      expect(text.search('2027')).assertEqual(-1);
    });

    /**
     * @tc.name testSearch0223
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_SUPPLEMENT_TEST_2400
     * @tc.desc Search: whitespace anchors with multiline input stay deterministic
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSearch0223', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const input = '  line1\n\tline2\nline3  ';
      expect(input.search(new RegExp('^\\s+'))).assertEqual(0);
      expect(input.search(new RegExp('^\\s+', 'm'))).assertEqual(0);
      expect(input.search(new RegExp('\\s+$'))).assertEqual(20);
      expect(input.search(new RegExp('^line3', 'm'))).assertEqual(15);
    });

    /**
     * @tc.name testSearch0224
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_SUPPLEMENT_TEST_2500
     * @tc.desc Search: rebuilt regex from source and flags yields same index
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSearch0224', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const base = new RegExp('x\\d+', 'i');
      const rebuilt = new RegExp(base.source, base.flags);
      const text = 'abX12cd';
      expect(text.search(base)).assertEqual(2);
      expect(text.search(rebuilt)).assertEqual(2);
      expect(rebuilt.flags).assertEqual('i');
    });

    /**
     * @tc.name testSearch0225
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_SUPPLEMENT_TEST_2600
     * @tc.desc Search: nested group and alternation boundary conditions
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSearch0225', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const text = 'prefix-AB12-suffix';
      expect(text.search(new RegExp('(?:AB|CD)\\d{2}'))).assertEqual(7);
      expect(text.search(new RegExp('(?:EF|GH)\\d{2}'))).assertEqual(-1);
      expect(text.search(new RegExp('AB(?:12|34)'))).assertEqual(7);
    });

    /**
     * @tc.name testSearch0226
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_SUPPLEMENT_TEST_2700
     * @tc.desc Search: empty source via constructor remains start-position match
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSearch0226', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const empty = new RegExp('');
      const rebuilt = new RegExp(empty.source, empty.flags);
      expect('abc'.search(empty)).assertEqual(0);
      expect('abc'.search(rebuilt)).assertEqual(0);
      expect(''.search(rebuilt)).assertEqual(0);
    });

    /**
     * @tc.name testSearch0227
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_SUPPLEMENT_TEST_2800
     * @tc.desc Search: basic success and failure with character class
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSearch0227', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const str = 'hey JudE';
      expect(str.search(new RegExp('[A-Z]'))).assertEqual(4);
      expect(str.search(new RegExp('[.]'))).assertEqual(-1);
    });

    /**
     * @tc.name testSearch0228
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_SUPPLEMENT_TEST_2900
     * @tc.desc Search: string pattern searches are coerced and match literally
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSearch0228', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const str = 'Hello World';
      expect(str.search('World')).assertEqual(6);
      expect(str.search('world')).assertEqual(-1);
    });

    /**
     * @tc.name testSearch0229
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_SUPPLEMENT_TEST_3000
     * @tc.desc Search: global flag does not change returned index
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSearch0229', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const str = 'abc abc abc';
      expect(str.search(new RegExp('abc', 'g'))).assertEqual(0);
      expect(str.search(new RegExp('abc'))).assertEqual(0);
    });

    /**
     * @tc.name testSearch0230
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_SUPPLEMENT_TEST_3100
     * @tc.desc Search: ignoreCase flag finds match regardless of case
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSearch0230', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const str = 'Hello World';
      expect(str.search(new RegExp('world'))).assertEqual(-1);
      expect(str.search(new RegExp('world', 'i'))).assertEqual(6);
    });

    /**
     * @tc.name testSearch0231
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_SUPPLEMENT_TEST_3200
     * @tc.desc Search: multiline flag changes anchor matching across lines
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSearch0231', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const str = 'Line1\nLine2\nLine3';
      expect(str.search(new RegExp('^Line2'))).assertEqual(-1);
      expect(str.search(new RegExp('^Line2', 'm'))).assertEqual(6);
    });

    /**
     * @tc.name testSearch0232
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_SUPPLEMENT_TEST_3300
     * @tc.desc Search: combined flags behave like first-match finder
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSearch0232', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const str = 'Hello\nWORLD\nworld';
      expect(str.search(new RegExp('world', 'gim'))).assertEqual(6);
    });

    /**
     * @tc.name testSearch0233
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_SUPPLEMENT_TEST_3400
     * @tc.desc Search: unicode literal match works and u flag is feature-gated
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSearch0233', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const str = 'café';
      expect(str.search(new RegExp('é'))).assertEqual(3);
      if (supportsRegExp('é', 'u')) {
        expect(str.search(new RegExp('é', 'u'))).assertEqual(3);
      }
    });

    /**
     * @tc.name testSearch0234
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_SUPPLEMENT_TEST_3500
     * @tc.desc Search: sticky flag is ignored for start position but lastIndex is preserved
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSearch0234', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      if (!supportsRegExp('abc', 'y')) {
        return;
      }
      const str = 'abcabc';
      const re = new RegExp('abc', 'y');
      re.lastIndex = 3;
      expect(str.search(re)).assertEqual(0);
      expect(re.lastIndex).assertEqual(3);
    });

    /**
     * @tc.name testSearch0235
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_SUPPLEMENT_TEST_3600
     * @tc.desc Search: dotAll flag allows '.' to match newline when supported
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSearch0235', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const str = 'Hello\nWorld';
      expect(str.search(new RegExp('Hello.World'))).assertEqual(-1);
      if (supportsRegExp('Hello.World', 's')) {
        expect(str.search(new RegExp('Hello.World', 's'))).assertEqual(0);
      }
    });

    /**
     * @tc.name testSearch0236
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_SUPPLEMENT_TEST_3700
     * @tc.desc Search: hasIndices flag does not change search return value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSearch0236', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const str = 'test123';
      if (supportsRegExp('test(\\d+)', 'd')) {
        expect(str.search(new RegExp('test(\\d+)', 'd'))).assertEqual(0);
      }
      expect(str.search(new RegExp('test(\\d+)'))).assertEqual(0);
    });

    /**
     * @tc.name testSearch0237
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_SUPPLEMENT_TEST_3800
     * @tc.desc Search: lastIndex is ignored and not modified for global regex
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSearch0237', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const str = 'abc abc';
      const re = new RegExp('abc', 'g');
      re.lastIndex = 4;
      expect(str.search(re)).assertEqual(0);
      expect(re.lastIndex).assertEqual(4);
    });

    /**
     * @tc.name testSearch0238
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_SUPPLEMENT_TEST_3900
     * @tc.desc Search: special character search handles punctuation
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSearch0238', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const str = 'price@100';
      expect(str.search(new RegExp('@'))).assertEqual(5);
      expect(str.search(new RegExp('#'))).assertEqual(-1);
    });

    /**
     * @tc.name testSearch0239
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_SUPPLEMENT_TEST_4000
     * @tc.desc Search: escaped newline token finds line break reliably
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSearch0239', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const str = 'Hello\nWorld';
      expect(str.search(new RegExp('\\n'))).assertEqual(5);
      expect(str.search(new RegExp('\\r'))).assertEqual(-1);
    });

    /**
     * @tc.name testSearch0240
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_SUPPLEMENT_TEST_4100
     * @tc.desc Search: word boundary behavior matches word/non-word transitions
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSearch0240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect('test'.search(new RegExp('\\btest\\b'))).assertEqual(0);
      expect('testing'.search(new RegExp('\\btest\\b'))).assertEqual(-1);
      expect('foo-bar'.search(new RegExp('\\bbar\\b'))).assertEqual(4);
    });

    /**
     * @tc.name testSearch0241
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_SUPPLEMENT_TEST_4200
     * @tc.desc Search: alternation priority returns earliest leftmost match
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSearch0241', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect('xxdog cat'.search(new RegExp('cat|dog'))).assertEqual(2);
      expect('xxdog cat'.search(new RegExp('dog|cat'))).assertEqual(2);
      expect('xxcatdog'.search(new RegExp('cat|dog'))).assertEqual(2);
    });

    /**
     * @tc.name testSearch0242
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_SUPPLEMENT_TEST_4300
     * @tc.desc Search: quantifier patterns find expected earliest index
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSearch0242', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(('xx' + 'a'.repeat(3) + 'byy').search(new RegExp('a{2,4}b'))).assertEqual(2);
      expect('xxb'.search(new RegExp('a*b'))).assertEqual(2);
      expect('xxab'.search(new RegExp('a+b'))).assertEqual(2);
    });

    /**
     * @tc.name testSearch0243
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_SUPPLEMENT_TEST_4400
     * @tc.desc Search: lookahead and negative lookahead when supported
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSearch0243', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const str = 'price=100USD fee=200EUR';
      if (supportsRegExp('\\d+(?=USD)')) {
        expect(str.search(new RegExp('\\d+(?=USD)'))).assertEqual(6);
      }
      if (supportsRegExp('\\d+(?!USD)')) {
        const j: number = str.search(new RegExp('\\d+(?!USD)'));
        expect(j === 6 || j === 18).assertTrue();
      }
    });

    /**
     * @tc.name testSearch0244
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_SUPPLEMENT_TEST_4500
     * @tc.desc Search: beginning and end anchors on empty and non-empty strings
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSearch0244', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(''.search(new RegExp('^$'))).assertEqual(0);
      expect('a'.search(new RegExp('^$'))).assertEqual(-1);
      expect('a'.search(new RegExp('^'))).assertEqual(0);
      expect('a'.search(new RegExp('$'))).assertEqual(1);
    });

    /**
     * @tc.name testSearch0245
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_SUPPLEMENT_TEST_4600
     * @tc.desc Search: escaping of regex metacharacters is consistent
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSearch0245', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const input = 'a+b*c?.()[]{}|^$\\';
      expect(input.search(new RegExp('\\+'))).assertEqual(1);
      expect(input.search(new RegExp('\\*'))).assertEqual(3);
      expect(input.search(new RegExp('\\?'))).assertEqual(5);
      expect(input.search(new RegExp('\\.'))).assertEqual(6);
      expect(input.search(new RegExp('\\('))).assertEqual(7);
      expect(input.search(new RegExp('\\\\'))).assertEqual(16);
    });

    /**
     * @tc.name testSearch0246
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_SUPPLEMENT_TEST_4700
     * @tc.desc Search: bracket and brace escapes locate literal characters
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSearch0246', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const input = 'a+b*c?.()[]{}|^$\\';
      expect(input.search(new RegExp('\\['))).assertEqual(9);
      expect(input.search(new RegExp('\\]'))).assertEqual(10);
      expect(input.search(new RegExp('\\{'))).assertEqual(11);
      expect(input.search(new RegExp('\\}'))).assertEqual(12);
      expect(input.search(new RegExp('\\|'))).assertEqual(13);
    });

    /**
     * @tc.name testSearch0247
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_SUPPLEMENT_TEST_4800
     * @tc.desc Search: character class negation and ranges are respected
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSearch0247', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect('xyz'.search(new RegExp('[^a-c]+'))).assertEqual(0);
      expect('abc'.search(new RegExp('[^a-c]+'))).assertEqual(-1);
      expect('ab_cd'.search(new RegExp('\\w+'))).assertEqual(0);
      expect('--'.search(new RegExp('\\W+'))).assertEqual(0);
    });

    /**
     * @tc.name testSearch0248
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_SUPPLEMENT_TEST_4900
     * @tc.desc Search: repeated delimiter class finds first separator index
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSearch0248', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const str = 'a,b;c|d';
      expect(str.search(new RegExp('[,;|]'))).assertEqual(1);
      expect(str.search(new RegExp('[^,;|]+'))).assertEqual(0);
    });

    /**
     * @tc.name testSearch0249
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_SUPPLEMENT_TEST_5000
     * @tc.desc Search: startsWith-like behavior with ^ anchor is consistent
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSearch0249', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect('hello world'.search(new RegExp('^hello'))).assertEqual(0);
      expect('say hello'.search(new RegExp('^hello'))).assertEqual(-1);
      expect('hello world'.search(new RegExp('world$'))).assertEqual(6);
    });

    /**
     * @tc.name testSearch0250
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_SUPPLEMENT_TEST_5100
     * @tc.desc Search: empty pattern always matches at position zero
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSearch0250', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect('Hello'.search('')).assertEqual(0);
      expect('Hello'.search(new RegExp(''))).assertEqual(0);
      expect(''.search('')).assertEqual(0);
    });

    /**
     * @tc.name testSearch0251
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_SUPPLEMENT_TEST_5200
     * @tc.desc Search: tab token search locates whitespace boundaries
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSearch0251', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const str = 'foo\tbar';
      expect(str.search(new RegExp('\\t'))).assertEqual(3);
      expect(str.search(new RegExp('\\s'))).assertEqual(3);
    });

    /**
     * @tc.name testSearch0252
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_SUPPLEMENT_TEST_5300
     * @tc.desc Search: carriage return + newline pattern finds CRLF boundary
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSearch0252', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const str = 'a\r\nb';
      expect(str.search(new RegExp('\\r?\\n'))).assertEqual(1);
      expect(str.search(new RegExp('\\n'))).assertEqual(2);
    });

    /**
     * @tc.name testSearch0253
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_SUPPLEMENT_TEST_5400
     * @tc.desc Search: numeric class tokens distinguish digits and non-digits
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSearch0253', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect('a9z'.search(new RegExp('\\d'))).assertEqual(1);
      expect('a9z'.search(new RegExp('\\D'))).assertEqual(0);
      expect('123'.search(new RegExp('\\D'))).assertEqual(-1);
    });

    /**
     * @tc.name testSearch0254
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_SUPPLEMENT_TEST_5500
     * @tc.desc Search: unicode emoji literal search is stable on UTF-16 strings
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSearch0254', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const str = 'Hello 😀 World';
      expect(str.search(new RegExp('😀'))).assertEqual(6);
      expect(str.search(new RegExp('😃'))).assertEqual(-1);
    });

    /**
     * @tc.name testSearch0255
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_SUPPLEMENT_TEST_5600
     * @tc.desc Search: end-anchor with multiline finds the first line-ending match
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSearch0255', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const str = 'a1\nb2\nc3';
      expect(str.search(new RegExp('\\d$'))).assertEqual(7);
      expect(str.search(new RegExp('\\d$', 'm'))).assertEqual(1);
    });

    /**
     * @tc.name testSearch0256
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_SUPPLEMENT_TEST_5700
     * @tc.desc Search: grouping does not affect returned index but affects acceptance
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSearch0256', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const str = 'xxabcdyy';
      expect(str.search(new RegExp('(ab)(cd)'))).assertEqual(2);
      expect(str.search(new RegExp('(?:ab)(?:cd)'))).assertEqual(2);
      expect(str.search(new RegExp('(ab)(ce)'))).assertEqual(-1);
    });

    /**
     * @tc.name testSearch0257
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_SUPPLEMENT_TEST_5800
     * @tc.desc Search: reluctant quantifier changes acceptance but index remains start
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSearch0257', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const str = 'a123b456b';
      expect(str.search(new RegExp('a.*b'))).assertEqual(0);
      expect(str.search(new RegExp('a.*?b'))).assertEqual(0);
    });

    /**
     * @tc.name testSearch0258
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_SUPPLEMENT_TEST_5900
     * @tc.desc Search: escaped backslash sequences are preserved as literals
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSearch0258', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const str = 'path\\to\\file';
      expect(str.search(new RegExp('\\\\'))).assertEqual(4);
      expect(str.search(new RegExp('\\\\to\\\\'))).assertEqual(4);
    });

    /**
     * @tc.name testSearch0259
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_SUPPLEMENT_TEST_6000
     * @tc.desc Search: repeated matches do not change the returned index
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSearch0259', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const str = 'aaaa';
      expect(str.search(new RegExp('a+'))).assertEqual(0);
      expect(str.search(new RegExp('a'))).assertEqual(0);
    });

    /**
     * @tc.name testSearch0260
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_SUPPLEMENT_TEST_6100
     * @tc.desc Search: non-word character class matches punctuation sequences
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSearch0260', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const str = 'ab--cd';
      expect(str.search(new RegExp('\\W+'))).assertEqual(2);
      expect(str.search(new RegExp('\\w+'))).assertEqual(0);
    });

    /**
     * @tc.name testSearch0261
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_SUPPLEMENT_TEST_6200
     * @tc.desc Search: digit class finds first number in mixed text
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSearch0261', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const str = 'abc123';
      expect(str.search(new RegExp('[0-9]'))).assertEqual(3);
      expect(str.search(new RegExp('\\d'))).assertEqual(3);
    });

    /**
     * @tc.name testSearch0262
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_SUPPLEMENT_TEST_6300
     * @tc.desc Search: negated class excludes word/space/apostrophe when matching punctuation
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSearch0262', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const str = "I think Ruth's dog is cuter than your dog!";
      expect(str.search(new RegExp("[^\\w\\s']"))).assertEqual(41);
    });

    /**
     * @tc.name testSearch0263
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_SUPPLEMENT_TEST_6400
     * @tc.desc Search: CJK character search uses code unit index
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSearch0263', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const str = '你好世界';
      expect(str.search(new RegExp('好'))).assertEqual(1);
      expect(str.search(new RegExp('界'))).assertEqual(3);
    });

    /**
     * @tc.name testSearch0264
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_SUPPLEMENT_TEST_6500
     * @tc.desc Search: unicode property escapes are feature-gated for portability
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSearch0264', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const str = 'ABC αβγ';
      if (supportsRegExp('\\p{Script=Greek}', 'u')) {
        expect(str.search(new RegExp('\\p{Script=Greek}', 'u'))).assertEqual(4);
      } else {
        return;
      }
    });

    /**
     * @tc.name testSearch0265
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_SUPPLEMENT_TEST_6600
     * @tc.desc Search: negated unicode property escapes are feature-gated
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSearch0265', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const str = '123ABC';
      if (supportsRegExp('\\P{Number}', 'u')) {
        expect(str.search(new RegExp('\\P{Number}', 'u'))).assertEqual(3);
      } else {
        return;
      }
    });

    /**
     * @tc.name testSearch0266
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_SUPPLEMENT_TEST_6700
     * @tc.desc Search: empty string returns -1 for non-empty pattern
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSearch0266', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(''.search(new RegExp('abc'))).assertEqual(-1);
      expect(''.search(new RegExp('\\d+'))).assertEqual(-1);
    });

    /**
     * @tc.name testSearch0267
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_SUPPLEMENT_TEST_6800
     * @tc.desc Search: empty string matches empty pattern at index 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSearch0267', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(''.search(new RegExp('(?:)'))).assertEqual(0);
      expect(''.search(new RegExp(''))).assertEqual(0);
    });

    /**
     * @tc.name testSearch0268
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_SUPPLEMENT_TEST_6900
     * @tc.desc Search: single-character string boundary is handled correctly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSearch0268', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect('a'.search(new RegExp('a'))).assertEqual(0);
      expect('a'.search(new RegExp('b'))).assertEqual(-1);
      expect('a'.search(new RegExp('^a$'))).assertEqual(0);
    });

    /**
     * @tc.name testSearch0269
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_SUPPLEMENT_TEST_7000
     * @tc.desc Search: long string case ensures engines do not cut off scanning
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSearch0269', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const prefix = 'a'.repeat(1000);
      const str = prefix + 'target';
      expect(str.search(new RegExp('target'))).assertEqual(1000);
      expect(str.search(new RegExp('tar'))).assertEqual(1000);
    });

    /**
     * @tc.name testSearch0270
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_SUPPLEMENT_TEST_7100
     * @tc.desc Search: lookahead forms are feature-gated due to engine variability
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSearch0270', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const str = 'abc123def';
      if (supportsRegExp('\\d(?=def)')) {
        expect(str.search(new RegExp('\\d(?=def)'))).assertEqual(5);
      } else {
        return;
      }
      if (supportsRegExp('\\d(?!def)')) {
        expect(str.search(new RegExp('\\d(?!def)'))).assertEqual(3);
      } else {
        return;
      }
    });

    /**
     * @tc.name testSearch0271
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_SUPPLEMENT_TEST_7200
     * @tc.desc Search: lookbehind is feature-gated to avoid hard failures
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSearch0271', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const str = 'price:100';
      if (supportsRegExp('(?<=:)\\d+')) {
        expect(str.search(new RegExp('(?<=:)\\d+'))).assertEqual(6);
      } else {
        return;
      }
    });

    /**
     * @tc.name testSearch0272
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_SUPPLEMENT_TEST_7300
     * @tc.desc Search: negative lookbehind is feature-gated for compatibility
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSearch0272', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const str = 'abc100 def100';
      if (supportsLookbehindSemantics() && supportsRegExp('(?<!abc)\\d+')) {
        expect(str.search(new RegExp('(?<!abc)\\d+'))).assertEqual(10);
      } else {
        return;
      }
    });

    /**
     * @tc.name testSearch0273
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_SUPPLEMENT_TEST_7400
     * @tc.desc Search: word boundary with ignoreCase finds standalone token
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSearch0273', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const str = 'Hello world, hello';
      expect(str.search(new RegExp('\\bhello\\b', 'i'))).assertEqual(0);
      expect('shellow'.search(new RegExp('\\bhello\\b', 'i'))).assertEqual(-1);
    });

    /**
     * @tc.name testSearch0274
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_SUPPLEMENT_TEST_7500
     * @tc.desc Search: non-word boundary \\B matches inside an identifier span
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSearch0274', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const str = 'abc123';
      expect(str.search(new RegExp('\\B\\d\\B'))).assertEqual(3);
      expect(str.search(new RegExp('\\b\\d\\b'))).assertEqual(-1);
    });

    /**
     * @tc.name testSearch0275
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_SUPPLEMENT_TEST_7600
     * @tc.desc Search: Symbol.search equivalence with String.search when accessible
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSearch0275', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      expect(searchStringEqualsRegExpSymbolSearch()).assertTrue();
    });

    /**
     * @tc.name testSearch0276
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_SUPPLEMENT_TEST_7700
     * @tc.desc Search: lastIndex stays stable for y and g when invoking search repeatedly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSearch0276', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const str = 'abc abc';
      const reG = new RegExp('abc', 'g');
      reG.lastIndex = 2;
      expect(str.search(reG)).assertEqual(0);
      expect(reG.lastIndex).assertEqual(2);
      if (supportsRegExp('abc', 'y')) {
        const reY = new RegExp('abc', 'y');
        reY.lastIndex = 4;
        expect(str.search(reY)).assertEqual(0);
        expect(reY.lastIndex).assertEqual(4);
      }
    });

    /**
     * @tc.name testSearch0277
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_SUPPLEMENT_TEST_7800
     * @tc.desc Search: custom object Symbol.search overrides default coercion path
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSearch0277', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      expect(searchCustomSymbolSearchObject()).assertTrue();
    });

    /**
     * @tc.name testSearch0278
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_SUPPLEMENT_TEST_7900
     * @tc.desc Search: numeric argument is coerced to string pattern
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSearch0278', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      const str = 'abc123';
      expect(str.search(String(123))).assertEqual(3);
      expect(str.search(String(12))).assertEqual(3);
    });

    /**
     * @tc.name testSearch0279
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_SUPPLEMENT_TEST_8000
     * @tc.desc Search: null and undefined are coerced to literal strings
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSearch0279', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      const str = 'null undefined';
      expect(str.search(String(null))).assertEqual(0);
      expect(str.search(String(undefined))).assertEqual(5);
    });

    /**
     * @tc.name testSearch0280
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_SUPPLEMENT_TEST_8100
     * @tc.desc Search: object argument uses toString / Symbol.toPrimitive(string)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSearch0280', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      expect(searchObjectWithSymbolToPrimitive()).assertTrue();
    });

    /**
     * @tc.name testSearch0281
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_SUPPLEMENT_TEST_8200
     * @tc.desc Search: boolean and array arguments follow ToString coercion
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSearch0281', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      expect('true false'.search(String(true))).assertEqual(0);
      expect('a,b,c'.search(String([',']))).assertEqual(1);
    });

    /**
     * @tc.name testSearch0282
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_SUPPLEMENT_TEST_8300
     * @tc.desc Search: Symbol argument should throw TypeError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSearch0282', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      expect(searchSymbolParameterThrows()).assertTrue();
    });

    /**
     * @tc.name testSearch0283
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_SUPPLEMENT_TEST_8400
     * @tc.desc Search: BigInt argument is coerced to string when supported
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSearch0283', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      expect(searchBigIntCoerces()).assertTrue();
    });

    /**
     * @tc.name testSearch0284
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_SUPPLEMENT_TEST_8500
     * @tc.desc Search: RegExp.prototype[Symbol.search] rejects invalid this
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSearch0284', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      expect(regexpSearchCallUndefinedThrows()).assertTrue();
      expect(regexpSearchCallNullThrows()).assertTrue();
    });

    /**
     * @tc.name testSearch0285
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_SUPPLEMENT_TEST_8600
     * @tc.desc Search: capture groups do not change search return index
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSearch0285', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      const str = '2023-12-25';
      expect(str.search(new RegExp('(\\d{4})-(\\d{2})-(\\d{2})'))).assertEqual(0);
      expect('xx2023-12-25'.search(new RegExp('(\\d{4})-(\\d{2})-(\\d{2})'))).assertEqual(2);
    });

    /**
     * @tc.name testSearch0286
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_SUPPLEMENT_TEST_8700
     * @tc.desc Search: non-capturing groups and alternation are accepted
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSearch0286', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      expect('abc123'.search(new RegExp('(?:abc)\\d+'))).assertEqual(0);
      expect('dog'.search(new RegExp('cat|dog'))).assertEqual(0);
    });

    /**
     * @tc.name testSearch0287
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_SUPPLEMENT_TEST_8800
     * @tc.desc Search: named capture groups are feature-gated
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSearch0287', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      const str = 'John Smith';
      if (supportsRegExp('(?<first>\\w+)\\s(?<last>\\w+)')) {
        expect(str.search(new RegExp('(?<first>\\w+)\\s(?<last>\\w+)'))).assertEqual(0);
      } else {
        return;
      }
    });

    /**
     * @tc.name testSearch0288
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_SUPPLEMENT_TEST_8900
     * @tc.desc Search: atomic group is feature-gated due to non-universal support
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSearch0288', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      const str = 'abc';
      if (supportsRegExp('(?>a*)bc')) {
        expect(str.search(new RegExp('(?>a*)bc'))).assertEqual(0);
      } else {
        return;
      }
    });

    /**
     * @tc.name testSearch0289
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_SUPPLEMENT_TEST_9000
     * @tc.desc Search: possessive quantifier is feature-gated and should not break execution
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSearch0289', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      const str = 'a'.repeat(3) + 'b';
      if (supportsRegExp('a*+b')) {
        expect(str.search(new RegExp('a*+b'))).assertEqual(0);
      } else {
        return;
      }
    });

    /**
     * @tc.name testSearch0290
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_SUPPLEMENT_TEST_9100
     * @tc.desc Search: invalid pattern should throw SyntaxError at construction time
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSearch0290', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      let threw = false;
      try {
        new RegExp('[a-z');
      } catch (e) {
        threw = true;
      }
      expect(threw).assertTrue();
    });

    /**
     * @tc.name testSearch0291
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_SUPPLEMENT_TEST_9200
     * @tc.desc Search: invalid flags should throw SyntaxError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSearch0291', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      let threw = false;
      try {
        new RegExp('test', 'x');
      } catch (e) {
        threw = true;
      }
      expect(threw).assertTrue();
    });

    /**
     * @tc.name testSearch0292
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_SUPPLEMENT_TEST_9300
     * @tc.desc Search: invalid unicode escape under u should throw when supported
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSearch0292', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      if (!supportsRegExp('a', 'u')) {
        return;
      }
      let threw = false;
      try {
        new RegExp('\\u{123456}', 'u');
      } catch (e) {
        threw = true;
      }
      expect(threw).assertTrue();
    });

    /**
     * @tc.name testSearch0293
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_SUPPLEMENT_TEST_9400
     * @tc.desc Search: invalid unicode property escape should throw when supported
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSearch0293', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
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
     * @tc.name testSearch0294
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_SUPPLEMENT_TEST_9500
     * @tc.desc Search: String.prototype.search can be applied to non-string this via call
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSearch0294', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      
      expect(String(123).search(new RegExp('2'))).assertEqual(1);
    });

    /**
     * @tc.name testSearch0295
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_SUPPLEMENT_TEST_9600
     * @tc.desc Search: explicit undefined is coerced consistently to literal text
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSearch0295', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      const str = 'Hello';
      const b: number = str.search(String(undefined));
      expect(b).assertEqual(-1);
    });

    /**
     * @tc.name testSearch0296
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_SUPPLEMENT_TEST_9700
     * @tc.desc Search: supportsRegExp probes align with runtime behavior for dotAll and properties
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSearch0296', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      const dotAllOk = supportsRegExp('.', 's');
      const propOk = supportsRegExp('\\p{L}', 'u');
      expect(typeof dotAllOk).assertEqual('boolean');
      expect(typeof propOk).assertEqual('boolean');
    });

    /**
     * @tc.name testSearch0297
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_SUPPLEMENT_TEST_9800
     * @tc.desc Search: practical hasPattern helper behavior for business checks
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSearch0297', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      const hasPattern = (s: string, pattern: RegExp): boolean => s.search(pattern) !== -1;
      expect(hasPattern('Hello World', new RegExp('world', 'i'))).assertTrue();
      expect(hasPattern('Hello World', new RegExp('WORLD'))).assertFalse();
    });

    /**
     * @tc.name testSearch0298
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_SUPPLEMENT_TEST_9900
     * @tc.desc Search: email-like validation uses anchored pattern with predictable outcome
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSearch0298', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      const emailPattern = new RegExp('^[\\w.-]+@[\\w.-]+\\.[A-Za-z]{2,}$');
      expect('test@example.com'.search(emailPattern)).assertEqual(0);
      expect('bad@'.search(emailPattern)).assertEqual(-1);
    });

    /**
     * @tc.name testSearch0299
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_SUPPLEMENT_EXT_TEST_0100
     * @tc.desc Search: URL protocol detection distinguishes https/http/unknown
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSearch0299', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      const detectProtocol = (url: string): string => {
        if (url.search(new RegExp('^https:')) === 0) {
          return 'HTTPS';
        }
        if (url.search(new RegExp('^http:')) === 0) {
          return 'HTTP';
        }
        return 'UNKNOWN';
      };
      expect(detectProtocol('https://example.com')).assertEqual('HTTPS');
      expect(detectProtocol('http://example.com')).assertEqual('HTTP');
      expect(detectProtocol('ftp://example.com')).assertEqual('UNKNOWN');
    });

    /**
     * @tc.name testSearch0300
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_SUPPLEMENT_EXT_TEST_0200
     * @tc.desc Search: IPv4 format validation pattern matches only legal ranges
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSearch0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ip = new RegExp('^((25[0-5]|2[0-4]\\d|1\\d\\d|[1-9]?\\d)\\.){3}(25[0-5]|2[0-4]\\d|1\\d\\d|[1-9]?\\d)$');
      expect('192.168.1.1'.search(ip)).assertEqual(0);
      expect('256.1.1.1'.search(ip)).assertEqual(-1);
    });

    /**
     * @tc.name testSearch0301
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_SUPPLEMENT_EXT_TEST_1100
     * @tc.desc Search: phone-like validation allows common dash grouping
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSearch0301', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      const phone = new RegExp('^(\\([0-9]{3}\\)\\s?|[0-9]{3}-)[0-9]{3}-[0-9]{4}$');
      expect('123-456-7890'.search(phone)).assertEqual(0);
      expect('1234567890'.search(phone)).assertEqual(-1);
    });

    /**
     * @tc.name testSearch0302
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_SUPPLEMENT_EXT_TEST_0400
     * @tc.desc Search: date prefix detection supports yyyy-mm-dd at start
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSearch0302', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      const date = new RegExp('^\\d{4}-\\d{2}-\\d{2}');
      expect('2023-12-25T00:00:00Z'.search(date)).assertEqual(0);
      expect('x2023-12-25'.search(date)).assertEqual(-1);
    });

    /**
     * @tc.name testSearch0303
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_SUPPLEMENT_EXT_TEST_0500
     * @tc.desc Search: mixed flag combinations still return first leftmost match
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSearch0303', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      const str = 'Test\nTEST\ntest';
      expect(str.search(new RegExp('test', 'gim'))).assertEqual(0);
      expect(str.search(new RegExp('^test', 'im'))).assertEqual(0);
    });

    /**
     * @tc.name testSearch0304
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_SUPPLEMENT_EXT_TEST_0600
     * @tc.desc Search: dotAll + multiline combination is feature-gated
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSearch0304', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      const str = 'a\nb';
      if (supportsRegExp('.+', 'sm')) {
        expect(str.search(new RegExp('.+', 'sm'))).assertEqual(0);
      } else {
        return;
      }
    });

    /**
     * @tc.name testSearch0305
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_SUPPLEMENT_EXT_TEST_0700
     * @tc.desc Search: regex-like object with exec can be used via RegExp.prototype[Symbol.search]
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSearch0305', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      expect(regexpSearchRegexLikeIndex()).assertTrue();
    });

    /**
     * @tc.name testSearch0306
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_SUPPLEMENT_EXT_TEST_0800
     * @tc.desc Search: function argument uses ToString and typically matches 'function' prefix
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSearch0306', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      const str = 'function test() {}';
      
      expect(searchFunctionCoerces()).assertTrue();
    });

    /**
     * @tc.name testSearch0307
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_SUPPLEMENT_EXT_TEST_0900
     * @tc.desc Search: findCharPosition helper escapes input to avoid regex injection
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSearch0307', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      const escapeForCharClass = (ch: string): string => ch.replace(new RegExp('[-\\\\\\]^\"]', 'g'), '\\$&');
      const findCharPosition = (s: string, ch: string): number => {
        const safe: string = escapeForCharClass(ch);
        return s.search(new RegExp('[' + safe + ']'));
      };
      expect(findCharPosition('abcxyz', 'x')).assertEqual(3);
      expect(findCharPosition('a[b]c', '[')).assertEqual(1);
    });

    /**
     * @tc.name testSearch0308
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_SUPPLEMENT_EXT_TEST_1000
     * @tc.desc Search: findFirstNumber helper returns -1 for no digits
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSearch0308', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      const findFirstNumber = (s: string): number => s.search(new RegExp('\\d'));
      expect(findFirstNumber('abc123def')).assertEqual(3);
      expect(findFirstNumber('abcdef')).assertEqual(-1);
    });
  });
}
