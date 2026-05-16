import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import * as stringTest from './string_trim_test01';

export default function StringTrimTest02() {
  describe('StringTrimTest02', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
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

    //============================Special String Construction Testing==================================

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIMTWO_0100
     * @tc.name      StringTrimTest2001
     * @tc.desc      Call trim() on template string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest2001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest2001';

      'use strict';
      const name = "world";
      const str = `  hello ${name}  `;
      const result = str.trim();
      expect(result).assertEqual("hello world");

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIMTWO_0200
     * @tc.name      StringTrimTest2002
     * @tc.desc      trim on string literal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest2002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest2002';

      'use strict';
      const literal = "  test  ";
      const result = literal.trim();
      expect(result).assertEqual("test");
      expect(typeof literal).assertEqual("string");

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIMTWO_0300
     * @tc.name      StringTrimTest2003
     * @tc.desc      String object trim returns primitive string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest2003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest2003';

      'use strict';
      const strObj = new String("  test  ");
      const result = strObj.trim();
      expect(result).assertEqual("test");
      expect(typeof result).assertEqual("string");
      expect(stringTest.testTrimBool()).assertEqual(false);

    });

    //============================Exception Scenario Testing==================================

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIMTWO_0400
     * @tc.name      StringTrimTest2004
     * @tc.desc      Primitive value as this for trim
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest2004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest2004';

      'use strict';
      const result : string = stringTest.testTrimCall("  test  ");
      expect(result).assertEqual("test");

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIMTWO_0500
     * @tc.name      StringTrimTest2005
     * @tc.desc      Object as this for trim
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest2005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest2005';

      'use strict';
      const result : string = stringTest.testTrimCallObj1();
      expect(result).assertEqual("test");

    });

    //============================Specification Compliance Testing==================================

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIMTWO_0600
     * @tc.name      StringTrimTest2006
     * @tc.desc      trim() always returns string type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest2006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest2006';

      'use strict';
      expect(typeof "  test  ".trim()).assertEqual("string");
      expect(typeof "".trim()).assertEqual("string");
      expect(typeof "noSpace".trim()).assertEqual("string");

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIMTWO_0700
     * @tc.name      StringTrimTest2007
     * @tc.desc      trim() complies with string immutability specification
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest2007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest2007';

      'use strict';
      const str = "  test  ";
      const before = str;
      str.trim();
      expect(str === before).assertEqual(true);
      expect(str).assertEqual("  test  ");

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIMTWO_0800
     * @tc.name      StringTrimTest2008
     * @tc.desc      Verify all ECMAScript defined whitespace characters are trimmed
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest2008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest2008';

      'use strict';
      const whitespaceChars = [
        '\u0009', // TAB
        '\u000B', // VT
        '\u000C', // FF
        '\u0020', // SP
        '\u00A0', // NBSP
        '\uFEFF', // BOM
        '\u000A', // LF
        '\u000D', // CR
        '\u2028', // LS
        '\u2029', // PS
        '\u1680', // OGHAM
        '\u2000', // EN QUAD
        '\u2001', // EM QUAD
        '\u2002', // EN SPACE
        '\u2003', // EM SPACE
        '\u2004', // THREE-PER-EM
        '\u2005', // FOUR-PER-EM
        '\u2006', // SIX-PER-EM
        '\u2007', // FIGURE SPACE
        '\u2008', // PUNCTUATION SPACE
        '\u2009', // THIN SPACE
        '\u200A', // HAIR SPACE
        '\u202F', // NARROW NBSP
        '\u205F', // MEDIUM MATH
        '\u3000', // IDEOGRAPHIC
      ];
      whitespaceChars.forEach(char => {
        const str = char + "test" + char;
        expect(str.trim() === "test").assertEqual(true);
      });

    });
  })
}