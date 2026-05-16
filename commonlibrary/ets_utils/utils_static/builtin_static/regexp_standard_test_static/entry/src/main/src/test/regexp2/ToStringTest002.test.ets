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

export default function toStringTest002(): void {
  describe('ToString_Supplement_Compile_Safe', () => {
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
     * @tc.name testToString0300
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_SUPPLEMENT_TEST_0100
     * @tc.desc toString renders default slash-wrapped pattern
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testToString0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const re = new RegExp('abc');
      const out = re.toString();
      expect(out).assertEqual('/abc/');
    });

    /**
     * @tc.name testToString0301
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_SUPPLEMENT_TEST_0200
     * @tc.desc toString keeps provided global and ignoreCase flags
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testToString0301', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const re = new RegExp('abc', 'gi');
      const out = re.toString();
      expect(out).assertEqual('/abc/gi');
    });

    /**
     * @tc.name testToString0302
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_SUPPLEMENT_TEST_0300
     * @tc.desc source and flags expose constructor-normalized values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testToString0302', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const re = new RegExp('\\d+');
      expect(re.source).assertEqual('\\d+');
      expect(re.flags).assertEqual('');
    });

    /**
     * @tc.name testToString0303
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_SUPPLEMENT_TEST_0400
     * @tc.desc toString includes multiline flag in output
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testToString0303', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const re = new RegExp('a', 'm');
      expect(re.toString()).assertEqual('/a/m');
    });

    /**
     * @tc.name testToString0304
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_SUPPLEMENT_TEST_0500
     * @tc.desc toString escapes forward slash in pattern representation
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testToString0304', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const re = new RegExp('a/b');
      expect(re.source).assertEqual('a\\/b');
      expect(re.toString()).assertEqual('/a\\/b/');
    });

    /**
     * @tc.name testToString0305
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_SUPPLEMENT_TEST_0600
     * @tc.desc flags ordering in toString is stable (gimsyu when present)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testToString0305', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const re = new RegExp('x', 'mig');
      
      expect(re.flags).assertEqual('gim');
      expect(re.toString()).assertEqual('/x/gim');
    });

    /**
     * @tc.name testToString0306
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_SUPPLEMENT_TEST_0700
     * @tc.desc source preserves escaping for backslash sequences
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testToString0306', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const re = new RegExp('\\n\\t\\r');
      expect(re.source).assertEqual('\\n\\t\\r');
      expect(re.toString()).assertEqual('/\\n\\t\\r/');
    });

    /**
     * @tc.name testToString0307
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_SUPPLEMENT_TEST_0800
     * @tc.desc toString for empty pattern renders // with flags if any
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testToString0307', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(new RegExp('').toString()).assertEqual('/(?:)/');
      expect(new RegExp('', 'g').toString()).assertEqual('/(?:)/g');
    });

    /**
     * @tc.name testToString0308
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_SUPPLEMENT_TEST_0900
     * @tc.desc toString reflects sticky/unicode/dotAll flags when supported
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testToString0308', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      if (supportsRegExp('x', 'y')) {
        expect(new RegExp('x', 'y').toString()).assertEqual('/x/y');
      }
      if (supportsRegExp('\\u{1F600}', 'u')) {
        expect(new RegExp('\\u{1F600}', 'u').toString()).assertEqual('/\\u{1F600}/u');
      }
      if (supportsRegExp('a.b', 's')) {
        expect(new RegExp('a.b', 's').toString()).assertEqual('/a.b/s');
      }
    });

    /**
     * @tc.name testToString0309
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_SUPPLEMENT_TEST_1000
     * @tc.desc constructor from RegExp clones source/flags; toString matches
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testToString0309', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const base = new RegExp('ab+c', 'gi');
      const cloned = new RegExp(base);
      expect(cloned.source).assertEqual(base.source);
      expect(cloned.flags).assertEqual(base.flags);
      expect(cloned.toString()).assertEqual(base.toString());
    });

    /**
     * @tc.name testToString0310
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_SUPPLEMENT_TEST_1100
     * @tc.desc toString is consistent with source+flags round trip
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testToString0310', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const re1 = new RegExp('a\\d+', 'g');
      const re2 = new RegExp(re1.source, re1.flags);
      expect(re2.toString()).assertEqual(re1.toString());
      expect(re2.source).assertEqual(re1.source);
      expect(re2.flags).assertEqual(re1.flags);
    });

    /**
     * @tc.name testToString0311
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_SUPPLEMENT_TEST_1200
     * @tc.desc toString returns a string in slash-delimited format
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testToString0311', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const re = new RegExp('test', 'gi');
      const out = re.toString();
      expect(typeof out).assertEqual('string');
      expect(out.startsWith('/')).assertTrue();
      expect(out.endsWith('/gi')).assertTrue();
    });

    /**
     * @tc.name testToString0312
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_SUPPLEMENT_TEST_1300
     * @tc.desc toString keeps metacharacters and quantifiers unchanged
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testToString0312', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const re = new RegExp('\\d+\\w*\\s?');
      expect(re.source).assertEqual('\\d+\\w*\\s?');
      expect(re.toString()).assertEqual('/\\d+\\w*\\s?/');
    });

    /**
     * @tc.name testToString0313
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_SUPPLEMENT_TEST_1400
     * @tc.desc toString supports non-capturing and named groups if supported
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testToString0313', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const nonCapturing = new RegExp('(?:abc)+');
      expect(nonCapturing.toString()).assertEqual('/(?:abc)+/');
      if (supportsRegExp('(?<name>\\w+)')) {
        const named = new RegExp('(?<name>\\w+)');
        expect(named.toString()).assertEqual('/(?<name>\\w+)/');
      }
    });

    /**
     * @tc.name testToString0314
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_SUPPLEMENT_TEST_1500
     * @tc.desc rebuilding with explicit flags updates serialized flag segment
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testToString0314', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const base = new RegExp('abc', 'g');
      const overridden = new RegExp(base, 'm');
      expect(overridden.source).assertEqual('abc');
      expect(overridden.flags).assertEqual('m');
      expect(overridden.toString()).assertEqual('/abc/m');
    });

    /**
     * @tc.name testToString0315
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_SUPPLEMENT_TEST_1600
     * @tc.desc toString keeps character class and range syntax unchanged
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testToString0315', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const re = new RegExp('[a-zA-Z0-9_]+');
      expect(re.source).assertEqual('[a-zA-Z0-9_]+');
      expect(re.toString()).assertEqual('/[a-zA-Z0-9_]+/');
    });

    /**
     * @tc.name testToString0316
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_SUPPLEMENT_TEST_1700
     * @tc.desc toString preserves anchor and boundary assertions
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testToString0316', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const re = new RegExp('^\\btest\\b$');
      expect(re.source).assertEqual('^\\btest\\b$');
      expect(re.toString()).assertEqual('/^\\btest\\b$/');
    });

    /**
     * @tc.name testToString0317
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_SUPPLEMENT_TEST_1800
     * @tc.desc toString exposes normalized flags when input order is mixed
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testToString0317', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const re = new RegExp('abc', 'mig');
      expect(re.flags).assertEqual('gim');
      expect(re.toString()).assertEqual('/abc/gim');
    });

    /**
     * @tc.name testToString0318
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_SUPPLEMENT_TEST_1900
     * @tc.desc toString remains stable through repeated source/flags rebuilds
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testToString0318', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const r1 = new RegExp('x\\d+', 'gi');
      const r2 = new RegExp(r1.source, r1.flags);
      const r3 = new RegExp(r2.source, r2.flags);
      expect(r2.toString()).assertEqual(r1.toString());
      expect(r3.toString()).assertEqual(r1.toString());
      expect(r3.flags).assertEqual('gi');
    });
  });
}
