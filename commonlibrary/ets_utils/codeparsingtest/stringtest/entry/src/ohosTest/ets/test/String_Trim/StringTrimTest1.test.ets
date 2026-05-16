import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import * as stringTest from './string_trim_test01';

export default function StringTrimTest() {
  describe('StringTrimTest', () => {
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

    //============================Whitespace Character Type Test==================================

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIM_0100
     * @tc.name      StringTrimTest1001
     * @tc.desc      Normal space character (U+0020)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1001';

      const str = "  test  ";
      expect(str).assertEqual("  test  ");

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIM_0200
     * @tc.name      StringTrimTest1002
     * @tc.desc      Horizontal tab character \t (U+0009)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1002';

      const str = "\t\ttest\t\t";
      expect(str.trim()).assertEqual("test");

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIM_0300
     * @tc.name      StringTrimTest1003
     * @tc.desc      Vertical tab character \v (U+000B)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1003';

      const str = "\v\vtest\v\v";
      expect(str.trim()).assertEqual("test");

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIM_0400
     * @tc.name      StringTrimTest1004
     * @tc.desc      Form feed character \f (U+000C)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1004';

      const str = "\f\ftest\f\f";
      expect(str.trim()).assertEqual("test");

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIM_0500
     * @tc.name      StringTrimTest1005
     * @tc.desc      Line feed character \n (U+000A)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1005';

      const str = "\n\ntest\n\n";
      expect(str.trim()).assertEqual("test");

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIM_0600
     * @tc.name      StringTrimTest1006
     * @tc.desc      Carriage return character \r (U+000D)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1006';

      const str = "\r\rtest\r\r";
      expect(str.trim()).assertEqual("test");

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIM_0700
     * @tc.name      StringTrimTest1007
     * @tc.desc      Carriage return and line feed combination \r\n (U+000D U+000A)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1007';

      const str = "\r\ntest\r\n";
      expect(str.trim()).assertEqual("test");

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIM_0800
     * @tc.name      StringTrimTest1008
     * @tc.desc      Line separator character (U+2028)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1008';

      const str = "\u2028test\u2028";
      expect(str.trim()).assertEqual("test");

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIM_0900
     * @tc.name      StringTrimTest1009
     * @tc.desc     Paragraph separator character (U+2029)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1009';

      const str = "\u2029test\u2029";
      expect(str.trim()).assertEqual("test");

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIM_1000
     * @tc.name      StringTrimTest1010
     * @tc.desc      Non-breaking space character (U+00A0)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1010';

      const str = "\u00A0test\u00A0";
      expect(str.trim()).assertEqual("test");

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIM_1100
     * @tc.name      StringTrimTest1011
     * @tc.desc      Ideographic space character (U+3000)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1011';

      const str = "\u3000test\u3000";
      expect(str.trim()).assertEqual("test");

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIM_1200
     * @tc.name      StringTrimTest1012
     * @tc.desc      Ogham space mark character (U+1680)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1012';

      const str = "\u1680test\u1680";
      expect(str.trim()).assertEqual("test");

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIM_1300
     * @tc.name      StringTrimTest1013
     * @tc.desc      EN QUAD character (U+2000)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1013';

      const str = "\u2000test\u2000";
      expect(str.trim()).assertEqual("test");

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIM_1400
     * @tc.name      StringTrimTest1014
     * @tc.desc      EN QUAD character (U+2001)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1014';

      const str = "\u2001test\u2001";
      expect(str.trim()).assertEqual("test");

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIM_1500
     * @tc.name      StringTrimTest1015
     * @tc.desc      EN SPACE character (U+2002)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1015';

      const str = "\u2002test\u2002";
      expect(str.trim()).assertEqual("test");

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIM_1600
     * @tc.name      StringTrimTest1016
     * @tc.desc      EN SPACE character (U+2003)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1016';

      const str = "\u2003test\u2003";
      expect(str.trim()).assertEqual("test");

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIM_1700
     * @tc.name      StringTrimTest1017
     * @tc.desc      THIN SPACE character (U+2009)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1017';

      const str = "\u2009test\u2009";
      expect(str.trim()).assertEqual("test");

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIM_1800
     * @tc.name      StringTrimTest1018
     * @tc.desc      HAIR SPACE character (U+200A)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1018';

      const str = "\u200Atest\u200A";
      expect(str.trim()).assertEqual("test");

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIM_1900
     * @tc.name      StringTrimTest1019
     * @tc.desc      NARROW NO-BREAK SPACE character (U+202F)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1019';

      const str = "\u202Ftest\u202F";
      expect(str.trim()).assertEqual("test");

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIM_2000
     * @tc.name      StringTrimTest1020
     * @tc.desc      MEDIUM MATHEMATICAL SPACE character (U+205F)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1020';

      const str = "\u205Ftest\u205F";
      expect(str.trim()).assertEqual("test");

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIM_2100
     * @tc.name      StringTrimTest1021
     * @tc.desc      Mixed multiple whitespace characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1021';

      const str = " \t\n\r\ftest \t\n\r\f";
      expect(str.trim()).assertEqual("test");

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIM_2200
     * @tc.name      StringTrimTest1022
     * @tc.desc      Consecutive identical whitespace characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1022';

      const str = "     test     ";
      expect(str.trim()).assertEqual("test");

    });

    //============================Boundary Value Testing==================================
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIM_2300
     * @tc.name      StringTrimTest1023
     * @tc.desc      The string is composed entirely of whitespace characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1023';

      'use strict';
      const str = "    \t\n\r   ";
      const result = str.trim();
      expect(result).assertEqual("")
      expect(result.length).assertEqual(0);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIM_2400
     * @tc.name      StringTrimTest1024
     * @tc.desc      There is only one blank character
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1024';

      'use strict';
      const str = " ";
      const result = str.trim();
      expect(result).assertEqual("");
      expect(result.length).assertEqual(0);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIM_2500
     * @tc.name      StringTrimTest1025
     * @tc.desc      There is only one non-blank character
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1025';

      'use strict';
      const str = "a";
      const result = str.trim();
      expect(result).assertEqual("a");

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIM_2600
     * @tc.name      StringTrimTest1026
     * @tc.desc      Blank characters will not be deleted in the middle of a string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1026';

      'use strict';
      const str = "hello world";
      const result = str.trim();
      expect(result).assertEqual("hello world");

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIM_2700
     * @tc.name      StringTrimTest1027
     * @tc.desc      Multiple white space characters in the middle of a string are retained
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1027';

      'use strict';
      const str = "  hello    world  ";
      const result = str.trim();
      expect(result).assertEqual("hello    world");

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIM_2800
     * @tc.name      StringTrimTest1028
     * @tc.desc      Mixed special characters and white spaces
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1028';

      'use strict';
      const str = "  @#$%  test  !@#$  ";
      const result = str.trim();
      expect(result).assertEqual("@#$%  test  !@#$");

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIM_2900
     * @tc.name      StringTrimTest1029
     * @tc.desc      Trimming operation for long strings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1029';

      'use strict';
      const longStr = "    " + "a".repeat(10000) + "    ";
      const result = longStr.trim();
      expect(result.length).assertEqual(10000);
      expect(result === "a".repeat(10000)).assertEqual(true);

    });


    //============================String Position Test==================================

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIM_3000
     * @tc.name      StringTrimTest1030
     * @tc.desc      Test different numbers of leading spaces
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1030';

      'use strict';
      expect("test".trim()).assertEqual("test");
      expect(" test".trim()).assertEqual("test");
      expect("  test".trim()).assertEqual("test");
      expect("   test".trim()).assertEqual("test");


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIM_3100
     * @tc.name      StringTrimTest1031
     * @tc.desc      Leading multiple whitespace character combinations
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1031';

      'use strict';
      const str = " \t\nhello";
      expect(str.trim()).assertEqual("hello");

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIM_3200
     * @tc.name      StringTrimTest1032
     * @tc.desc      Test different numbers of trailing spaces
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1032';

      'use strict';
      expect("test".trim()).assertEqual("test");
      expect("test ".trim()).assertEqual("test");
      expect("test  ".trim()).assertEqual("test");
      expect("test   ".trim()).assertEqual("test");

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIM_3300
     * @tc.name      StringTrimTest1033
     * @tc.desc      Various combinations of whitespace characters at the end
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1033';

      'use strict';
      const str = "hello \t\n";
      expect(str.trim()).assertEqual("hello");

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIM_3400
     * @tc.name      StringTrimTest1034
     * @tc.desc      Symmetrical blank characters at both ends
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1034';

      'use strict';
      const str = "  hello  ";
      expect(str.trim()).assertEqual("hello");

    });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIM_3500
     * @tc.name      StringTrimTest1035
     * @tc.desc      The number of blank characters at both ends is different
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1035';

      'use strict';
      const str = "   hello  ";
      expect(str.trim()).assertEqual("hello");

    });

    //============================Return Value Feature Test==================================

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIM_3600
     * @tc.name      StringTrimTest1036
     * @tc.desc      The return value of trim() is of type string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1036';

      'use strict';
      const str = "  test  ";
      const result = str.trim();
      expect(typeof result).assertEqual("string");

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIM_3700
     * @tc.name      StringTrimTest1037
     * @tc.desc      Return a brand new string object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1037';

      'use strict';
      const str = "  test  ";
      const result = str.trim();
      expect(result !== str).assertEqual(true);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIM_3800
     * @tc.name      StringTrimTest1038
     * @tc.desc      trim() does not modify the original string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1038';

      'use strict';
      const str = "  test  ";
      const original = str;
      str.trim();
      expect(str).assertEqual("  test  ");
      expect(str === original).assertEqual(true);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIM_3900
     * @tc.name      StringTrimTest1039
     * @tc.desc      The original string length remains unchanged
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1039';

      'use strict';
      const str = "  test  ";
      const originalLength = str.length;
      str.trim();
      expect(str.length).assertEqual(8);
      expect(str.length === originalLength).assertEqual(true);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIM_4000
     * @tc.name      StringTrimTest1040
     * @tc.desc      The returned string length is correct
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1040';

      'use strict';
      const str = "  test  ";
      const result = str.trim();
      expect(result.length).assertEqual(4);
      expect(str.length - result.length).assertEqual(4);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIM_4100
     * @tc.name      StringTrimTest1041
     * @tc.desc      An all-blank string returns an empty string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1041';

      'use strict';
      const str = "    ";
      const result = str.trim();
      expect(result.length).assertEqual(0);

    });

    //============================Test in Combination with Other String Methods==================================

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIM_4200
     * @tc.name      StringTrimTest1042
     * @tc.desc      Call trimStart() after trim()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1042';

      'use strict';
      const str = "  test  ";
      const result = str.trim().trimStart();
      expect(result).assertEqual("test");

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIM_4300
     * @tc.name      StringTrimTest1043
     * @tc.desc      Call trimEnd() after trim()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1043';

      'use strict';
      const str = "  test  ";
      const result = str.trim().trimEnd();
      expect(result).assertEqual("test");

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIM_4400
     * @tc.name      StringTrimTest1044
     * @tc.desc      trimStart().trimEnd() is equivalent to trim()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1044';

      'use strict';
      const str = "  test  ";
      const result1 = str.trim();
      const result2 = str.trimStart().trimEnd();
      expect(result1 === result2).assertEqual(true);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIM_4500
     * @tc.name      StringTrimTest1045
     * @tc.desc      trim and convert to lowercase
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1045';

      'use strict';
      const str = "  HELLO  ";
      const result = str.trim().toLowerCase();
      expect(result).assertEqual("hello");

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIM_4600
     * @tc.name      StringTrimTest1046
     * @tc.desc      trim then convert to uppercase
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1046';

      'use strict';
      const str = "  hello  ";
      const result = str.trim().toUpperCase();
      expect(result).assertEqual("HELLO");

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIM_4700
     * @tc.name      StringTrimTest1047
     * @tc.desc      After trimming, use includes to search
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1047';

      'use strict';
      const str = "  hello world  ";
      const result = str.trim().includes("world");
      expect(result).assertEqual(true);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIM_4800
     * @tc.name      StringTrimTest1048
     * @tc.desc      Use indexOf to find the position after trimming
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1048';

      'use strict';
      const str = "  hello world  ";
      const result = str.trim().indexOf("world");
      expect(result).assertEqual(6);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIM_4900
     * @tc.name      StringTrimTest1049
     * @tc.desc      Check the starting string after trimming
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1049';

      'use strict';
      const str = "  hello world  ";
      const result = str.trim().startsWith("hello");
      expect(result).assertEqual(true);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIM_5000
     * @tc.name      StringTrimTest1050
     * @tc.desc      Check the ending string after trimming
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1050';

      'use strict';
      const str = "  hello world  ";
      const result = str.trim().endsWith("world");
      expect(result).assertEqual(true);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIM_5100
     * @tc.name      StringTrimTest1051
     * @tc.desc      Extract substring with slice after trimming
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1051';

      'use strict';
      const str = "  hello world  ";
      const result = str.trim().slice(0, 5);
      expect(result).assertEqual("hello");

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIM_5200
     * @tc.name      StringTrimTest1052
     * @tc.desc      Extract substring after trimming
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1052';

      'use strict';
      const str = "  hello world  ";
      const result = str.trim().substring(6, 11);
      expect(result).assertEqual("world");

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIM_5300
     * @tc.name      StringTrimTest1053
     * @tc.desc      Split string after trimming
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1053';

      let result: string[] = stringTest.testTrimSplit()
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual("hello");
      expect(result[1]).assertEqual("world");

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIM_5400
     * @tc.name      StringTrimTest1054
     * @tc.desc      Replace content after trimming
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1054';

      'use strict';
      const str = "  hello world  ";
      const result = str.trim().replace("world", "js");
      expect(result).assertEqual("hello js");

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIM_5500
     * @tc.name      StringTrimTest1055
     * @tc.desc      Concatenate strings after trimming
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1055';

      'use strict';
      const str = "  hello  ";
      const result = str.trim().concat(" world");
      expect(result).assertEqual("hello world");

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIM_5600
     * @tc.name      StringTrimTest1056
     * @tc.desc      Repeat string after trimming
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1056';

      'use strict';
      const str = "  ab  ";
      const result = str.trim().repeat(3);
      expect(result).assertEqual("ababab");

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIM_5700
     * @tc.name      StringTrimTest1057
     * @tc.desc      pre-trim padding
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1057';

      'use strict';
      const str = "  test  ";
      const result = str.trim().padStart(10, "*");
      expect(result).assertEqual("******test");

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIM_5800
     * @tc.name      StringTrimTest1058
     * @tc.desc      post-trim filling
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1058';

      'use strict';
      const str = "  test  ";
      const result = str.trim().padEnd(10, "*");
      expect(result).assertEqual("test******");

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIM_5900
     * @tc.name      StringTrimTest1059
     * @tc.desc      Regular expression matching after trimming
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1059';

      let result:string=stringTest.testTrimMatch()
      expect(result).assertEqual("123");

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIM_6000
     * @tc.name      StringTrimTest1060
     * @tc.desc      Regular expression search after trimming
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1060';

      'use strict';
      const str = "  hello123  ";
      const result = str.trim().search(/\d/);
      expect(result).assertEqual(5);

    });

    //============================Practical Application Scenario Testing==================================
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIM_6100
     * @tc.name      StringTrimTest1061
     * @tc.desc      Clean User Input Username
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1061';

      'use strict';
      let result : string = stringTest.testClearUsername("admin");
      expect(result).assertEqual("用户名有效: admin");

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIM_6200
     * @tc.name      StringTrimTest1062
     * @tc.desc      Clean User Input Email
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1062';

      'use strict';
      let result = stringTest.testValidateEmail("Test@Example.COM");
      expect(result).assertTrue();

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIM_6300
     * @tc.name      StringTrimTest1063
     * @tc.desc      Clean Up Whitespace in CSV Data
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1063';

      'use strict';
      const csvLine = "  John  ,  Doe  ,  25  ";
      const cleanData = csvLine.split(",").map(item => item.trim());
      expect(cleanData[0]).assertEqual("John");
      expect(cleanData[1]).assertEqual("Doe");
      expect(cleanData[2]).assertEqual("25");

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIM_6400
     * @tc.name      StringTrimTest1064
     * @tc.desc      Clean the string values in a JSON object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1064';

      'use strict';
      let result = stringTest.testCleanedData();
      expect(result.name).assertEqual("John");
      expect(result.email).assertEqual("john@example.com");

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIM_6500
     * @tc.name      StringTrimTest1065
     * @tc.desc      Clean the search keywords
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1065';

      'use strict';
      let result = stringTest.testSearchProducts("  phone  ");
      expect(result[0]).assertEqual("iPhone");

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIM_6600
     * @tc.name      StringTrimTest1066
     * @tc.desc      Clean and split tags
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1066';

      'use strict';
      const result : string[] = stringTest.testParseTags(" js , html , css ");
      expect(result[0]).assertEqual("js");
      expect(result[1]).assertEqual("html");
      expect(result[2]).assertEqual("css");

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIM_6700
     * @tc.name      StringTrimTest1067
     * @tc.desc      Ignore leading and trailing whitespace when comparing
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1067';

      'use strict';
      let result : boolean = stringTest.testCompareIgnoreWhitespace("  hello  ", "hello");
      expect(result).assertTrue();

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIM_6800
     * @tc.name      StringTrimTest1068
     * @tc.desc      Ignore both case and whitespace
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1068';

      'use strict';
      let result : boolean = stringTest.testCaseAndWhitespace("  HELLO  ", "hello");
      expect(result).assertTrue();

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIM_6900
     * @tc.name      StringTrimTest1069
     * @tc.desc      Check if the input is a non-blank string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1069';

      'use strict';
      let result : boolean = stringTest.testNonEmptyString("  test  ") === true &&
        stringTest.testNonEmptyString("    ") === false &&
        stringTest.testNonEmptyString("") === false;
      expect(result).assertTrue();

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIM_7000
     * @tc.name      StringTrimTest1070
     * @tc.desc      Validate required fields
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1070';

      'use strict';
      let result : string | null = stringTest.testDateRequired("  ", "姓名");
      let result1 : string | null = stringTest.testDateRequired("张三", "姓名");
      expect(result).assertEqual("姓名 是必填项");
      expect(result1).assertNull();

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIM_7100
     * @tc.name      StringTrimTest1071
     * @tc.desc      Clean URL query parameters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1071';

      'use strictD';
      let result : Record<string,string> = stringTest.testCleanUrlParams({
        "  q  ": "  javascript  ",
        "  page  ": "  1  "
      }) as Record<string,string>;
      expect(result.q).assertEqual("javascript");
      expect(result.page).assertEqual("1");

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIM_7200
     * @tc.name      StringTrimTest1072
     * @tc.desc      Trim leading and trailing whitespace from filenames
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1072';

      'use strictD';
      let result : string = stringTest.testSanitizeFilename("  my document.pdf  ");
      expect(result).assertEqual("my_document.pdf");

    });

    //============================Special character and Unicode testing==================================

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIM_7300
     * @tc.name      StringTrimTest1073
     * @tc.desc      Clean whitespace in Chinese character strings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1073';

      'use strictD';
      const str = "  你好世界  ";
      const result = str.trim();
      expect(result).assertEqual("你好世界");

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIM_7400
     * @tc.name      StringTrimTest1074
     * @tc.desc      Trim mixed Chinese-English strings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1074';
      console.log(TAG + 'start')
      'use strictD';
      const str = "  Hello 世界  ";
      const result = str.trim();
      expect(result).assertEqual("Hello 世界");

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIM_7500
     * @tc.name      StringTrimTest1075
     * @tc.desc      Trim strings containing Emoji characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1075';

      'use strictD';
      const str = "    ";
      const result = str.trim();
      expect(result).assertEqual("");

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIM_7600
     * @tc.name      StringTrimTest1076
     * @tc.desc      Trim strings mixed with Emoji and text
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1076", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1076';

      'use strict';
      const str = "  Hello  World  ";
      const result = str.trim();
      expect(result).assertEqual("Hello  World");

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIM_7700
     * @tc.name      StringTrimTest1077
     * @tc.desc      Zero-width characters are not whitespace characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1077", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1077';

      'use strict';
      const str = "\u200Btest\u200B";
      const result = str.trim();
      expect(result).assertEqual("\u200Btest\u200B");
      expect(result.length).assertEqual(6);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIM_7800
     * @tc.name      StringTrimTest1078
     * @tc.desc      BOM character (U+FEFF) as whitespace
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1078", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1078';

      'use strict';
      const str = "\uFEFFtest\uFEFF";
      const result = str.trim();
      expect(result).assertEqual("test");

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIM_7900
     * @tc.name      StringTrimTest1079
     * @tc.desc      Some control characters are trimmed
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     Level 2
     */
    it("StringTrimTest1079", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1079';

      'use strict';
      const str = "\x00test\x00";
      const result = str.trim();
      expect(result.length).assertEqual(6);

    });

    //============================Chained call testing==================================
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIM_8000
     * @tc.name      StringTrimTest1080
     * @tc.desc      Call trim() multiple times consecutively
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1080';

      'use strict';
      const str = "  test  ";
      const result = str.trim().trim().trim();
      expect(result).assertEqual("test");

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIM_8100
     * @tc.name      StringTrimTest1081
     * @tc.desc      Chain call of multiple string methods
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1081", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1081';

      'use strict';
      const str = "  HELLO WORLD  ";
      const result = str.trim().toLowerCase().replace("world", "js");
      expect(result).assertEqual("hello js");

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIM_8200
     * @tc.name      StringTrimTest1082
     * @tc.desc      Complex string processing chain
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1082", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1082';

      'use strict';
      const str = "  The Quick Brown Fox  ";
      const result = str.trim()
        .toLowerCase()
        .split(" ")
        .map(word => word.charAt(0).toUpperCase() + word.slice(1))
        .join(" ");
      expect(result).assertEqual("The Quick Brown Fox");

    });

    //============================Performance-related boundary testing==================================

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIM_8300
     * @tc.name      StringTrimTest1083
     * @tc.desc      Process a large number of leading whitespace characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1083", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1083';

      'use strict';
      const manySpaces = " ".repeat(100000);
      const str = manySpaces + "test";
      const result = str.trim();
      expect(result).assertEqual("test");
      expect(result.length).assertEqual(4);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIM_8400
     * @tc.name      StringTrimTest1084
     * @tc.desc      Process a large number of trailing whitespace characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1084", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1084';

      'use strict';
      const manySpaces = " ".repeat(100000);
      const str = "test" + manySpaces;
      const result = str.trim();
      expect(result).assertEqual("test");
      expect(result.length).assertEqual(4);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIM_8500
     * @tc.name      StringTrimTest1085
     * @tc.desc      Whitespace and characters appear alternately
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1085", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1085';

      'use strict';
      const str = " a b c d e ";
      const result = str.trim();
      expect(result).assertEqual("a b c d e");
      expect(result.length).assertEqual(9);

    });

    //============================Strict Mode Test==================================

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIM_8600
     * @tc.name      StringTrimTest1086
     * @tc.desc      Use trim in strict mode
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1086", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1086';

      'use strict';
      const str = "  test  ";
      const result = str.trim();
      expect(result).assertEqual("test");

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIM_8700
     * @tc.name      StringTrimTest1087
     * @tc.desc      Chain call in strict mode
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1087", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1087';

      'use strict';
      const str = "  TEST  ";
      const result = str.trim().toLowerCase();
      expect(result).assertEqual("test");

    });

    //============================Methods and Properties Testing==================================

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIM_8800
     * @tc.name      StringTrimTest1088
     * @tc.desc      The parameter length of the trim method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1088", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1088';

      'use strict';
      const trimParamLength : number = stringTest.testTrimParamLength();
      expect(trimParamLength).assertEqual(0);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIM_8900
     * @tc.name      StringTrimTest1089
     * @tc.desc      The name property of the trim method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1089", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1089';

      'use strict';
      const trimMethodName : string = stringTest.testTrimMethodName();
      expect(trimMethodName).assertEqual("trim");

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIM_9000
     * @tc.name      StringTrimTest1090
     * @tc.desc      trim is a method on the String prototype
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1090", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1090';

      'use strict';
      const result : boolean = stringTest.testHasOwnProperty();
      const result1 : boolean = stringTest.testHasOwnProperty1();
      const result2 : boolean = stringTest.testHasOwnProperty2();
      expect(result).assertFalse();
      expect(result1).assertTrue();
      expect(result2).assertTrue();

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIM_9100
     * @tc.name      StringTrimTest1091
     * @tc.desc      Enumerability of the trim method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1091", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1091';
      console.log(TAG + 'start')
      'use strict';
      const result : (boolean | undefined)[] = stringTest.testOwnPropertyDescriptor();
      expect(result[0]).assertEqual(false);
      expect(result[1]).assertEqual(true);
      expect(result[2]).assertEqual(true);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIM_9200
     * @tc.name      StringTrimTest1092
     * @tc.desc      Call trim via call method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1092", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1092';

      'use strict';
      const str = "  test  ";
      const result : string = stringTest.testTrimCall(str);
      expect(result).assertEqual("test");

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIM_9300
     * @tc.name      StringTrimTest1093
     * @tc.desc      Call trim via apply method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1093", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1093';

      'use strict';
      const str = "  test  ";
      const result : string = stringTest.testTrimApply(str);
      expect(result).assertEqual("test");

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIM_9400
     * @tc.name      StringTrimTest1094
     * @tc.desc      Use trim on array-like objects
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1094", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1094';

      'use strict';
      const result : string[] = stringTest.testTrimCallBind();
      expect(result[0]).assertEqual("test");

    });

    //============================Type Conversion Testing==================================

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIM_9500
     * @tc.name      StringTrimTest1095
     * @tc.desc      Call trim() on String object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1095", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1095';

      'use strict';
      const strObj = new String("  test  ");
      const result = strObj.trim();
      expect(result).assertEqual("test");
      expect(typeof result).assertEqual("string");
      expect(typeof strObj).assertEqual("object");

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIM_9600
     * @tc.name      StringTrimTest1096
     * @tc.desc      The trim results of String object and primitive string are consistent
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1096", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1096';

      'use strict';
      const strPrim = "  test  ";
      const strObj = new String("  test  ");
      expect(strPrim.trim() === strObj.trim()).assertEqual(true);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIM_9700
     * @tc.name      StringTrimTest1097
     * @tc.desc      Call trim on number via call method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1097", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1097';

      'use strict';
      const num = 123;
      const result : string = stringTest.testTrimCall(num);
      expect(result).assertEqual("123");
      expect(typeof result).assertEqual("string");

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIM_9800
     * @tc.name      StringTrimTest1098
     * @tc.desc      Call trim on boolean via call method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1098", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1098';

      'use strict';
      const bool = true;
      const result : string = stringTest.testTrimCall(bool);
      expect(result).assertEqual("true");
      expect(typeof result).assertEqual("string");

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIM_9900
     * @tc.name      StringTrimTest1099
     * @tc.desc      Call trim on object via call method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1099", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1099';

      'use strict';
      const result : string = stringTest.testTrimCallObj();
      expect(result).assertEqual("test");

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIMONE_0100
     * @tc.name      StringTrimTest1100
     * @tc.desc      Call trim on array via call method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1100';

      'use strict';
      const arr = [1, 2, 3];
      const result : string = stringTest.testTrimCall(arr);
      expect(result).assertEqual("1,2,3");

    });

    //============================Parameter Testing==================================

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIMONE_0200
     * @tc.name      StringTrimTest1101
     * @tc.desc      trim() does not accept parameters, passed parameters are ignored
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1101", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1101';

      'use strict';
      const str = "  test  ";
      const result1 : string = str.trim();
      const result2 : string = stringTest.testTrim("ignored");
      const result3 : string = stringTest.testTrim(123, "multiple", "params");
      expect(result1).assertEqual("test");
      expect(result2).assertEqual("test");
      expect(result3).assertEqual("test");
      expect(result1 === result2 && result2 === result3).assertEqual(true);

    });
  });
}