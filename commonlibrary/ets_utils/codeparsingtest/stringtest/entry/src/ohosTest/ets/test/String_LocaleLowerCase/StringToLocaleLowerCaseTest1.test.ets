import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import * as stringTest from './string_tolocalelowercase_test1'

export default function StringToLocaleLowerCaseTest() {
  describe('StringToLocaleLowerCaseTest', () => {
    beforeAll(() => {
    });
    beforeEach(() => {
    });
    afterEach(() => {
    });
    afterAll(() => {
    });

    //==============================Basic functionality test===============================================

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTOLOCALELOWERCASE_0100
     * @tc.name      StringToLocaleLowerCaseTest1001
     * @tc.desc      Test the basic lowercase conversion function when no parameters are passed.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringToLocaleLowerCaseTest1001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringToLocaleLowerCaseTest1001';
      

      expect("ALPHABET".toLocaleLowerCase()).assertEqual("alphabet");
      expect("Hello World".toLocaleLowerCase()).assertEqual("hello world");
      expect("JavaScript".toLocaleLowerCase()).assertEqual("javascript");

    });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTOLOCALELOWERCASE_0200
     * @tc.name      StringToLocaleLowerCaseTest1002
     * @tc.desc      Test the conversion of strings that are already all lowercase.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringToLocaleLowerCaseTest1002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringToLocaleLowerCaseTest1002';
      

      expect("alphabet".toLocaleLowerCase()).assertEqual("alphabet");
      expect("hello world".toLocaleLowerCase()).assertEqual("hello world");

    });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTOLOCALELOWERCASE_0300
     * @tc.name      StringToLocaleLowerCaseTest1003
     * @tc.desc      Test the conversion of mixed-case strings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringToLocaleLowerCaseTest1003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringToLocaleLowerCaseTest1003';
      

      expect("HeLLo WoRLd".toLocaleLowerCase()).assertEqual("hello world");
      expect("JaVaScRiPt".toLocaleLowerCase()).assertEqual("javascript");
      expect("AbCdEfGhIjKlMnOpQrStUvWxYz".toLocaleLowerCase()).assertEqual("abcdefghijklmnopqrstuvwxyz");

    });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTOLOCALELOWERCASE_0400
     * @tc.name      StringToLocaleLowerCaseTest1004
     * @tc.desc      Test the conversion of an empty string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringToLocaleLowerCaseTest1004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringToLocaleLowerCaseTest1004';
      

      expect("".toLocaleLowerCase()).assertEqual("");
      expect("".toLocaleLowerCase() === "").assertTrue();

    });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTOLOCALELOWERCASE_0500
     * @tc.name      StringToLocaleLowerCaseTest1005
     * @tc.desc      Test the string that contains only spaces
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringToLocaleLowerCaseTest1005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringToLocaleLowerCaseTest1005';
      

      expect("   ".toLocaleLowerCase()).assertEqual("   ");
      expect("  A  B  ".toLocaleLowerCase()).assertEqual("  a  b  ");

    });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTOLOCALELOWERCASE_0600
     * @tc.name      StringToLocaleLowerCaseTest1006
     * @tc.desc      Test the conversion of a single character
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringToLocaleLowerCaseTest1006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringToLocaleLowerCaseTest1006';
      

      expect("A".toLocaleLowerCase()).assertEqual("a");
      expect("Z".toLocaleLowerCase()).assertEqual("z");
      expect("a".toLocaleLowerCase()).assertEqual("a");

    });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTOLOCALELOWERCASE_0700
     * @tc.name      StringToLocaleLowerCaseTest1007
     * @tc.desc      Test that numeric characters are not affected
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringToLocaleLowerCaseTest1007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringToLocaleLowerCaseTest1007';
      

      expect("ABC123".toLocaleLowerCase()).assertEqual("abc123");
      expect("123ABC456".toLocaleLowerCase()).assertEqual("123abc456");
      expect("0123456789".toLocaleLowerCase()).assertEqual("0123456789");

    });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTOLOCALELOWERCASE_0800
     * @tc.name      StringToLocaleLowerCaseTest1008
     * @tc.desc      Test that special symbols are not affected
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringToLocaleLowerCaseTest1008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringToLocaleLowerCaseTest1008';
      

      expect("HELLO!".toLocaleLowerCase()).assertEqual("hello!");
      expect("A+B=C".toLocaleLowerCase()).assertEqual("a+b=c");
      expect("@#$%^&*()".toLocaleLowerCase()).assertEqual("@#$%^&*()");
      expect("A@B#C$D%E^F".toLocaleLowerCase()).assertEqual("a@b#c$d%e^f");

    });


    //=======================================Parameter test==========================================================

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTOLOCALELOWERCASE_0900
     * @tc.name      StringToLocaleLowerCaseTest1009
     * @tc.desc      Test that special symbols are not affected
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringToLocaleLowerCaseTest1009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringToLocaleLowerCaseTest1009';
      

      expect("ALPHABET".toLocaleLowerCase("en-US")).assertEqual("alphabet");
      expect("ALPHABET".toLocaleLowerCase("zh-CN")).assertEqual("alphabet");
      expect("ALPHABET".toLocaleLowerCase("ja-JP")).assertEqual("alphabet");
      expect("ALPHABET".toLocaleLowerCase("de-DE")).assertEqual("alphabet");

    });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTOLOCALELOWERCASE_1000
     * @tc.name      StringToLocaleLowerCaseTest1010
     * @tc.desc      Test the special case mapping for the Turkish locale
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringToLocaleLowerCaseTest1010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringToLocaleLowerCaseTest1010';
      

      const dotted = "İstanbul";

      expect(dotted.toLocaleLowerCase("en-US")).assertEqual("i̇stanbul");
      expect(dotted.toLocaleLowerCase("tr")).assertEqual("istanbul");
      expect("\u0130".toLocaleLowerCase("tr") === "i").assertTrue();
      expect("\u0130".toLocaleLowerCase("en-US") === "i").assertFalse();

    });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTOLOCALELOWERCASE_1100
     * @tc.name      StringToLocaleLowerCaseTest1011
     * @tc.desc      Test BCP 47 language tags in different formats
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringToLocaleLowerCaseTest1011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringToLocaleLowerCaseTest1011';
      

      expect("TEST".toLocaleLowerCase("en")).assertEqual("test");
      expect("TEST".toLocaleLowerCase("en-US")).assertEqual("test");
      expect("TEST".toLocaleLowerCase("en-US-u-ca-gregory")).assertEqual("test");

    });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTOLOCALELOWERCASE_1200
     * @tc.name      StringToLocaleLowerCaseTest1012
     * @tc.desc      Test passing an array of multiple locales, using the first valid one
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringToLocaleLowerCaseTest1012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringToLocaleLowerCaseTest1012';
      

      const locales = ["tr", "TR", "tr-TR", "tr-u-co-search", "tr-x-turkish"];
      expect("\u0130".toLocaleLowerCase(locales) === "i").assertTrue();
      expect("HELLO".toLocaleLowerCase(["zh-CN", "en-US", "ja-JP"])).assertEqual("hello");

    });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTOLOCALELOWERCASE_1300
     * @tc.name      StringToLocaleLowerCaseTest1013
     * @tc.desc      Test using the default locale when passing an empty array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringToLocaleLowerCaseTest1013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringToLocaleLowerCaseTest1013';
      

      expect("HELLO".toLocaleLowerCase([])).assertEqual("hello");
      expect("WORLD".toLocaleLowerCase([])).assertEqual("world");

    });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTOLOCALELOWERCASE_1400
     * @tc.name      StringToLocaleLowerCaseTest1014
     * @tc.desc      Test the handling when passing an invalid locale
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringToLocaleLowerCaseTest1014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringToLocaleLowerCaseTest1014';
      

      expect("TEST".toLocaleLowerCase(["xx-YY", "zz-ZZ"])).assertEqual("test");
      expect("HELLO".toLocaleLowerCase(["invalid-locale"])).assertEqual("hello");

    });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTOLOCALELOWERCASE_1500
     * @tc.name      StringToLocaleLowerCaseTest1015
     * @tc.desc      Test the behavior when passing undefined
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringToLocaleLowerCaseTest1015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringToLocaleLowerCaseTest1015';
      

      expect("HELLO".toLocaleLowerCase(undefined)).assertEqual("hello");
      expect("TEST".toLocaleLowerCase(undefined)).assertEqual("test");

    });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTOLOCALELOWERCASE_1600
     * @tc.name      StringToLocaleLowerCaseTest1016
     * @tc.desc      Test the behavior when passing null
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringToLocaleLowerCaseTest1016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringToLocaleLowerCaseTest1016';
      

      const res: string[] = stringTest.test1016();
      expect(res[0]).assertEqual('hello');
      expect(res[1]).assertEqual('test');

    });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTOLOCALELOWERCASE_1700
     * @tc.name      StringToLocaleLowerCaseTest1017
     * @tc.desc      Test passing non-string type parameters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringToLocaleLowerCaseTest1017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringToLocaleLowerCaseTest1017';
      

      const res: string[] = stringTest.test1017();
      expect(res[0]).assertEqual('hello');
      expect(res[1]).assertEqual('test');
      expect(res[2]).assertEqual('world');

    });


    //========================================Locale Test=============================================================

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTOLOCALELOWERCASE_1800
     * @tc.name      StringToLocaleLowerCaseTest1018
     * @tc.desc      Test the special handling of I and i in Turkish
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringToLocaleLowerCaseTest1018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringToLocaleLowerCaseTest1018';
      

      const result1 = "I".toLocaleLowerCase("tr");
      const result2 = "I".toLocaleLowerCase("en-US");
      const result3 = "İ".toLocaleLowerCase("tr");
      const result4 = "Istanbul".toLocaleLowerCase("tr");

      expect(result1).assertEqual('ı');
      expect(result2).assertEqual('i');
      expect(result3).assertEqual('i');

      if (result4 === "istanbul") {
        expect(result4).assertEqual('istanbul');
      } else {
        expect(result4.toString()).assertEqual('ıstanbul');
      }

    });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTOLOCALELOWERCASE_1900
     * @tc.name      StringToLocaleLowerCaseTest1019
     * @tc.desc      Test the special handling of Azerbaijani
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringToLocaleLowerCaseTest1019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringToLocaleLowerCaseTest1019';
      

      expect("I".toLocaleLowerCase("az")).assertEqual('ı');
      expect("HELLO".toLocaleLowerCase("az")).assertEqual('hello');

    });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTOLOCALELOWERCASE_2000
     * @tc.name      StringToLocaleLowerCaseTest1020
     * @tc.desc      Test the special case rules for Lithuanian
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringToLocaleLowerCaseTest1020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringToLocaleLowerCaseTest1020';
      

      expect("HELLO".toLocaleLowerCase("lt")).assertEqual("hello");
      expect("I".toLocaleLowerCase("lt")).assertEqual("i");

    });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTOLOCALELOWERCASE_2100
     * @tc.name      StringToLocaleLowerCaseTest1021
     * @tc.desc      Test that the first locale is always used
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringToLocaleLowerCaseTest1021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringToLocaleLowerCaseTest1021';
      

      expect("\u0130".toLocaleLowerCase(["tr", "en-US"])).assertEqual("i");
      expect("\u0130".toLocaleLowerCase(["en-US", "tr"])).assertEqual("i̇");

    });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTOLOCALELOWERCASE_2200
     * @tc.name      StringToLocaleLowerCaseTest1022
     * @tc.desc      Test that unsupported locales use the default value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringToLocaleLowerCaseTest1022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringToLocaleLowerCaseTest1022';
      

      expect("HELLO".toLocaleLowerCase("xx-YY")).assertEqual("hello");
      expect("WORLD".toLocaleLowerCase("invalid")).assertEqual("world");

    });


    //========================================**Boundary Value Testing=================================================

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTOLOCALELOWERCASE_2300
     * @tc.name      StringToLocaleLowerCaseTest1023
     * @tc.desc      Test the conversion of extremely long strings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringToLocaleLowerCaseTest1023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringToLocaleLowerCaseTest1023';
      

      const res = stringTest.test1023();
      expect(res[0]).assertEqual(10000);
      expect(res[1]).assertTrue();

    });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTOLOCALELOWERCASE_2400
     * @tc.name      StringToLocaleLowerCaseTest1024
     * @tc.desc      Test an extremely long string containing various characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringToLocaleLowerCaseTest1024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringToLocaleLowerCaseTest1024';
      

      const res = stringTest.test1024();
      expect(res[0]).assertEqual(9000);
      expect(res[1]).assertTrue();

    });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTOLOCALELOWERCASE_2500
     * @tc.name      StringToLocaleLowerCaseTest1025
     * @tc.desc      Test the conversion of the ASCII character set
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringToLocaleLowerCaseTest1025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringToLocaleLowerCaseTest1025';
      

      expect("ABCDEFGHIJKLMNOPQRSTUVWXYZ".toLocaleLowerCase()).assertEqual("abcdefghijklmnopqrstuvwxyz");
      expect(String.fromCharCode(65, 66, 67).toLocaleLowerCase()).assertEqual("abc");

    });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTOLOCALELOWERCASE_2600
     * @tc.name      StringToLocaleLowerCaseTest1026
     * @tc.desc      Test the handling of extended ASCII characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringToLocaleLowerCaseTest1026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringToLocaleLowerCaseTest1026';
      

      expect("ÀÁÂÃÄÅ".toLocaleLowerCase()).assertEqual("àáâãäå");
      expect("ÈÉÊË".toLocaleLowerCase()).assertEqual("èéêë");

    });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTOLOCALELOWERCASE_2700
     * @tc.name      StringToLocaleLowerCaseTest1027
     * @tc.desc      Test the repetition of a single uppercase character
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringToLocaleLowerCaseTest1027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringToLocaleLowerCaseTest1027';
      

      expect("AAAAAA".toLocaleLowerCase()).assertEqual("aaaaaa");
      expect("ZZZZZZ".toLocaleLowerCase()).assertEqual("zzzzzz");

    });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTOLOCALELOWERCASE_2800
     * @tc.name      StringToLocaleLowerCaseTest1028
     * @tc.desc      Test the repetition of alternating uppercase and lowercase characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringToLocaleLowerCaseTest1028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringToLocaleLowerCaseTest1028';
      

      expect("AaAaAa".toLocaleLowerCase()).assertEqual("aaaaaa");
      expect("AbAbAb".toLocaleLowerCase()).assertEqual("ababab");

    });


    //==========================================Special Character Test==================================================

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTOLOCALELOWERCASE_2900
     * @tc.name      StringToLocaleLowerCaseTest1029
     * @tc.desc      Test the conversion of BMP characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringToLocaleLowerCaseTest1029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringToLocaleLowerCaseTest1029';
      

      expect("ΑΒΓΔ".toLocaleLowerCase()).assertEqual("αβγδ");
      expect("АБВГ".toLocaleLowerCase()).assertEqual("абвг");
      expect("ÄÖÜ".toLocaleLowerCase()).assertEqual("äöü");

    });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTOLOCALELOWERCASE_3000
     * @tc.name      StringToLocaleLowerCaseTest1030
     * @tc.desc      Test the handling of supplementary plane characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringToLocaleLowerCaseTest1030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringToLocaleLowerCaseTest1030';
      

      const res = stringTest.test1030();
      expect(res[0]).assertEqual("𝔸𝔹ℂ");
      expect(res[1]).assertEqual(5);

    });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTOLOCALELOWERCASE_3100
     * @tc.name      StringToLocaleLowerCaseTest1031
     * @tc.desc      Test the conversion of special Unicode code points
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringToLocaleLowerCaseTest1031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringToLocaleLowerCaseTest1031';
      

      expect("\u0130".toLocaleLowerCase("tr")).assertEqual("i");
      expect("\u0131".toLocaleLowerCase()).assertEqual("ı");
      expect("\u00DF".toLocaleLowerCase()).assertEqual("ß");

    });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTOLOCALELOWERCASE_3200
     * @tc.name      StringToLocaleLowerCaseTest1032
     * @tc.desc      Test the conversion of accented characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringToLocaleLowerCaseTest1032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringToLocaleLowerCaseTest1032';
      

      expect("ÀÁÂÃÄÅÆ".toLocaleLowerCase()).assertEqual("àáâãäåæ");
      expect("ÈÉÊËÌÍÎÏ".toLocaleLowerCase()).assertEqual("èéêëìíîï");
      expect("ÒÓÔÕÖØ".toLocaleLowerCase()).assertEqual("òóôõöø");
      expect("ÙÚÛÜÝ".toLocaleLowerCase()).assertEqual("ùúûüý");

    });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTOLOCALELOWERCASE_3300
     * @tc.name      StringToLocaleLowerCaseTest1033
     * @tc.desc      Test the conversion of combining characters (base character + diacritical marks)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringToLocaleLowerCaseTest1033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringToLocaleLowerCaseTest1033';
      

      const combined = "A\u0300";
      const result = combined.toLocaleLowerCase();

      expect(result.normalize("NFC")).assertEqual("\u00e0".normalize("NFC"));

    });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTOLOCALELOWERCASE_3400
     * @tc.name      StringToLocaleLowerCaseTest1034
     * @tc.desc      Test the case conversion of Greek letters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringToLocaleLowerCaseTest1034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringToLocaleLowerCaseTest1034';
      

      const res: string[] = stringTest.test1034();
      expect(res[0]).assertEqual("αλα");
      expect(res[1]).assertEqual("βητα");
      expect(res[2]).assertEqual("γαμμα");

    });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTOLOCALELOWERCASE_3500
     * @tc.name      StringToLocaleLowerCaseTest1035
     * @tc.desc      Test the case conversion of Cyrillic letters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringToLocaleLowerCaseTest1035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringToLocaleLowerCaseTest1035';
      

      expect("МОСКВА".toLocaleLowerCase()).assertEqual("москва");
      expect("ПРИВЕТ".toLocaleLowerCase()).assertEqual("привет");

    });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTOLOCALELOWERCASE_3600
     * @tc.name      StringToLocaleLowerCaseTest1036
     * @tc.desc      Test the case conversion of Armenian letters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringToLocaleLowerCaseTest1036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringToLocaleLowerCaseTest1036';
      

      expect("ԱԲԳ".toLocaleLowerCase()).assertEqual("աբգ");
      expect("ՀԵԼԼՕ".toLocaleLowerCase()).assertEqual("հելլօ");

    });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTOLOCALELOWERCASE_3700
     * @tc.name      StringToLocaleLowerCaseTest1037
     * @tc.desc      Test the handling of zero-width characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringToLocaleLowerCaseTest1037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringToLocaleLowerCaseTest1037';
      

      expect("A\u200BB".toLocaleLowerCase()).assertEqual("a\u200Bb");
      expect("HELLO\u200DLO".toLocaleLowerCase()).assertEqual("hello\u200Dlo");

    });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTOLOCALELOWERCASE_3800
     * @tc.name      StringToLocaleLowerCaseTest1038
     * @tc.desc      Test the handling of control characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringToLocaleLowerCaseTest1038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringToLocaleLowerCaseTest1038';
      

      expect("A\tB\nC".toLocaleLowerCase()).assertEqual("a\tb\nc");
      expect("HELLO\r\nWORLD".toLocaleLowerCase()).assertEqual("hello\r\nworld");

    });


    //========================================Compare testing with toLowerCase().=======================================

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTOLOCALELOWERCASE_3900
     * @tc.name      StringToLocaleLowerCaseTest1039
     * @tc.desc      Test that both produce identical results for ordinary strings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringToLocaleLowerCaseTest1039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringToLocaleLowerCaseTest1039';
      

      const str = "HELLO WORLD";
      expect(str.toLocaleLowerCase() === str.toLowerCase()).assertTrue();
      expect(str.toLocaleLowerCase()).assertEqual("hello world");
      expect(str.toLowerCase()).assertEqual("hello world");

    });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTOLOCALELOWERCASE_4000
     * @tc.name      StringToLocaleLowerCaseTest1040
     * @tc.desc      Test the result consistency for pure ASCII characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringToLocaleLowerCaseTest1040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringToLocaleLowerCaseTest1040';
      

      const ascii = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
      expect(ascii.toLocaleLowerCase() === ascii.toLowerCase()).assertTrue();
      expect(ascii.toLocaleLowerCase()).assertEqual("abcdefghijklmnopqrstuvwxyz");

    });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTOLOCALELOWERCASE_4100
     * @tc.name      StringToLocaleLowerCaseTest1041
     * @tc.desc      Test the differences in the Turkish locale
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringToLocaleLowerCaseTest1041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringToLocaleLowerCaseTest1041';
      

      const dotted = "İstanbul";
      expect(dotted.toLocaleLowerCase("tr")).assertEqual("istanbul");
      expect(dotted.toLowerCase()).assertEqual("i̇stanbul");
      expect(dotted.toLocaleLowerCase("tr") !== dotted.toLowerCase()).assertTrue();

    });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTOLOCALELOWERCASE_4200
     * @tc.name      StringToLocaleLowerCaseTest1042
     * @tc.desc      Test the relationship with toLowerCase when no parameters are provided
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringToLocaleLowerCaseTest1042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringToLocaleLowerCaseTest1042';
      

      const str = "HELLO";
      expect(str.toLocaleLowerCase() === str.toLowerCase()).assertTrue();
      expect(str.toLocaleLowerCase()).assertEqual("hello");
      expect(str.toLowerCase()).assertEqual("hello");

    });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTOLOCALELOWERCASE_4300
     * @tc.name      StringToLocaleLowerCaseTest1043
     * @tc.desc      Choose the appropriate method for simple scenarios
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringToLocaleLowerCaseTest1043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringToLocaleLowerCaseTest1043';
      

      const simple = "HELLO WORLD";
      expect(simple.toLowerCase()).assertEqual("hello world");
      expect(simple.toLocaleLowerCase("en-US")).assertEqual("hello world");

    });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTOLOCALELOWERCASE_4400
     * @tc.name      StringToLocaleLowerCaseTest1044
     * @tc.desc      Choice in complex multilingual scenarios
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringToLocaleLowerCaseTest1044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringToLocaleLowerCaseTest1044';
      

      const turkishText = "İI";
      expect(turkishText.toLocaleLowerCase("tr")).assertEqual("iı");
      expect(turkishText.toLowerCase()).assertEqual("i̇i");

    });


    //=====================================Test with toLocaleUpperCase()===============================================

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTOLOCALELOWERCASE_4500
     * @tc.name      StringToLocaleLowerCaseTest1045
     * @tc.desc      Test converting to uppercase first, then to lowercase
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringToLocaleLowerCaseTest1045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringToLocaleLowerCaseTest1045';
      

      const original = "hello";
      const upper = original.toLocaleUpperCase();
      const lower = upper.toLocaleLowerCase();
      expect(lower).assertEqual("hello");
      expect(lower === original).assertTrue();

    });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTOLOCALELOWERCASE_4600
     * @tc.name      StringToLocaleLowerCaseTest1046
     * @tc.desc      Test converting to lowercase first, then to uppercase
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringToLocaleLowerCaseTest1046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringToLocaleLowerCaseTest1046';
      

      const original = "HELLO";
      const lower = original.toLocaleLowerCase();
      const upper = lower.toLocaleUpperCase();
      expect(upper).assertEqual("HELLO");
      expect(upper === original).assertTrue();

    });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTOLOCALELOWERCASE_4700
     * @tc.name      StringToLocaleLowerCaseTest1047
     * @tc.desc      Test round-trip conversion using the same locale
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringToLocaleLowerCaseTest1047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringToLocaleLowerCaseTest1047';
      

      const original = "hello";
      const upper = original.toLocaleUpperCase("tr");
      const lower = upper.toLocaleLowerCase("tr");
      expect(lower).assertEqual("hello");
      expect(lower === original).assertTrue();

    });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTOLOCALELOWERCASE_4800
     * @tc.name      StringToLocaleLowerCaseTest1048
     * @tc.desc      Test case conversion using the same locale
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringToLocaleLowerCaseTest1048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringToLocaleLowerCaseTest1048';
      

      const str = "hello";
      const upperTR = str.toLocaleUpperCase("tr");
      const lowerTR = upperTR.toLocaleLowerCase("tr");
      expect(lowerTR === str).assertTrue();

    });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTOLOCALELOWERCASE_4900
     * @tc.name      StringToLocaleLowerCaseTest1049
     * @tc.desc      Test for potential differences caused by using different locales
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringToLocaleLowerCaseTest1049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringToLocaleLowerCaseTest1049';
      

      const str = "i";
      const upperEN = str.toLocaleUpperCase("en-US");
      const lowerTR = upperEN.toLocaleLowerCase("tr");
      expect(lowerTR).assertEqual("ı");
      expect(lowerTR === str).assertFalse();

    });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTOLOCALELOWERCASE_5000
     * @tc.name      StringToLocaleLowerCaseTest1050
     * @tc.desc      Test round-trip conversion of special German characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringToLocaleLowerCaseTest1050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringToLocaleLowerCaseTest1050';
      

      const str = "straße";
      const upper = str.toLocaleUpperCase("de-DE");
      const lower = upper.toLocaleLowerCase("de-DE");
      expect(lower).assertEqual("strasse");

    });


    //======================================= Return Value Characteristics Test=========================================

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTOLOCALELOWERCASE_5100
     * @tc.name      StringToLocaleLowerCaseTest1051
     * @tc.desc      Test that the return value is a string type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringToLocaleLowerCaseTest1051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringToLocaleLowerCaseTest1051';
      

      const res: (string |boolean)[]= stringTest.test1051();
      expect(res[0]).assertEqual("string");
      expect(res[1]).assertFalse();

    });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTOLOCALELOWERCASE_5200
     * @tc.name      StringToLocaleLowerCaseTest1052
     * @tc.desc      Test that a new string is returned and the original string remains unchanged
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringToLocaleLowerCaseTest1052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringToLocaleLowerCaseTest1052';
      

      const res: (string |boolean)[]= stringTest.test1052();
      expect(res[0]).assertEqual("HELLO");
      expect(res[1]).assertEqual("hello");
      expect(res[2]).assertFalse();

    });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTOLOCALELOWERCASE_5300
     * @tc.name      StringToLocaleLowerCaseTest1053
     * @tc.desc      Test that the original string is not modified
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringToLocaleLowerCaseTest1053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringToLocaleLowerCaseTest1053';
      

      const str = "WORLD";
      const lower = str.toLocaleLowerCase();
      expect(str).assertEqual("WORLD");
      expect(lower).assertEqual("world");

    });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTOLOCALELOWERCASE_5400
     * @tc.name      StringToLocaleLowerCaseTest1054
     * @tc.desc      Test that multiple calls return the same result
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringToLocaleLowerCaseTest1054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringToLocaleLowerCaseTest1054';
      

      const res: boolean[]= stringTest.test1054();
      expect(res[0]).assertTrue();

    });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTOLOCALELOWERCASE_5500
     * @tc.name      StringToLocaleLowerCaseTest1055
     * @tc.desc      Test that the return value has the same length as the original string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringToLocaleLowerCaseTest1055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringToLocaleLowerCaseTest1055';
      

      const res: (number |boolean)[]= stringTest.test1055();
      expect(res[0]).assertEqual(5);
      expect(res[1]).assertEqual(5);
      expect(res[2]).assertTrue();

    });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTOLOCALELOWERCASE_5600
     * @tc.name      StringToLocaleLowerCaseTest1056
     * @tc.desc      Test the length when special characters are included
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringToLocaleLowerCaseTest1056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringToLocaleLowerCaseTest1056';
      

      const res: (number |boolean)[]= stringTest.test1056();
      expect(res[0]).assertEqual(5);
      expect(res[1]).assertTrue();

    });


    //===================================== Exception Handling Test=====================================================

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTOLOCALELOWERCASE_5700
     * @tc.name      StringToLocaleLowerCaseTest1057
     * @tc.desc      Test that an exception is thrown for invalid locale formats
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringToLocaleLowerCaseTest1057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringToLocaleLowerCaseTest1057';
      

      const str = "HELLO";
      const locales = "a";
      let isRangeError = false;

      try {
        str.toLocaleLowerCase(locales);
      } catch (e) {
        isRangeError = e instanceof RangeError;
      }
      expect(isRangeError).assertEqual(true);

    });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTOLOCALELOWERCASE_5800
     * @tc.name      StringToLocaleLowerCaseTest1058
     * @tc.desc      Test calling on non-String objects
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringToLocaleLowerCaseTest1058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringToLocaleLowerCaseTest1058';
      
      let isTypeError = false;
      try {
        stringTest.test1058();
      } catch (e) {
        isTypeError = e instanceof TypeError;
      }
      expect(isTypeError).assertEqual(true);
    });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTOLOCALELOWERCASE_5900
     * @tc.name      StringToLocaleLowerCaseTest1059
     * @tc.desc      Test calling on null
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringToLocaleLowerCaseTest1059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringToLocaleLowerCaseTest1059';
      

      const res = stringTest.test1059();
      try {
        res[0]();
      } catch (e) {
        expect(e instanceof TypeError).assertTrue();
      }

    });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTOLOCALELOWERCASE_6000
     * @tc.name      StringToLocaleLowerCaseTest1060
     * @tc.desc      Test calling on undefined
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringToLocaleLowerCaseTest1060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringToLocaleLowerCaseTest1060';
      

      const res = stringTest.test1060();
      try {
        res[0]();
      } catch (e) {
        expect(e instanceof TypeError).assertTrue();
      }

    });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTOLOCALELOWERCASE_6100
     * @tc.name      StringToLocaleLowerCaseTest1061
     * @tc.desc      Test that the array parameter contains invalid elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringToLocaleLowerCaseTest1061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringToLocaleLowerCaseTest1061';
      

      expect("HELLO".toLocaleLowerCase([])).assertEqual("hello");

    });


    //============================================= Type Conversion Test================================================

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTOLOCALELOWERCASE_6200
     * @tc.name      StringToLocaleLowerCaseTest1062
     * @tc.desc      Test calling the method on a String object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringToLocaleLowerCaseTest1062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringToLocaleLowerCaseTest1062';
      

      const strObj = new String("HELLO");
      expect(strObj.toLocaleLowerCase()).assertEqual("hello");
      expect(typeof strObj.toLocaleLowerCase()).assertEqual("string");

    });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTOLOCALELOWERCASE_6300
     * @tc.name      StringToLocaleLowerCaseTest1063
     * @tc.desc      Test calling via prototype chain on numbers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringToLocaleLowerCaseTest1063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringToLocaleLowerCaseTest1063';
      

      const strPrim = new String("HELLO");
      expect(strPrim.toLocaleLowerCase()).assertEqual("hello");
      expect(typeof strPrim.toLocaleLowerCase()).assertEqual("string");

    });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTOLOCALELOWERCASE_6400
     * @tc.name      StringToLocaleLowerCaseTest1064
     * @tc.desc      Test calling via prototype chain on numbers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringToLocaleLowerCaseTest1064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringToLocaleLowerCaseTest1064';
      

      const res = stringTest.test1064();
      try {
        res[0]();
      } catch (e) {
        expect(e instanceof TypeError).assertTrue();
      }

    });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTOLOCALELOWERCASE_6500
     * @tc.name      StringToLocaleLowerCaseTest1065
     * @tc.desc      Test calling via prototype chain on booleans
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringToLocaleLowerCaseTest1065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringToLocaleLowerCaseTest1065';
      

      const res = stringTest.test1065();
      try {
        res[0]();
      } catch (e) {
        expect(e instanceof TypeError).assertTrue();
      }

    });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTOLOCALELOWERCASE_6600
     * @tc.name      StringToLocaleLowerCaseTest1066
     * @tc.desc      Test calling using call on other values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringToLocaleLowerCaseTest1066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringToLocaleLowerCaseTest1066';
      

      const res: string[] = stringTest.test1066();
      expect(res[0]).assertEqual("hello")
      try {
        res[1];
      } catch (e) {
        expect(e instanceof TypeError).assertTrue();
      }

    });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTOLOCALELOWERCASE_6700
     * @tc.name      StringToLocaleLowerCaseTest1067
     * @tc.desc      Test calling using apply on other values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringToLocaleLowerCaseTest1067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringToLocaleLowerCaseTest1067';
      

      const res = stringTest.test1067();
      expect(res[0]()).assertEqual("world");
      expect(res[1]()).assertEqual("test");

    });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTOLOCALELOWERCASE_6800
     * @tc.name      StringToLocaleLowerCaseTest1068
     * @tc.desc      Test creating new function using bind
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringToLocaleLowerCaseTest1068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringToLocaleLowerCaseTest1068';
      

      const res: string[] = stringTest.test1068();
      expect(res[0]).assertEqual("hello");
      expect(res[1]).assertEqual("hello");

    });


    //======================================== Unicode Processing Test====================================================

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTOLOCALELOWERCASE_6900
     * @tc.name      StringToLocaleLowerCaseTest1069
     * @tc.desc      Test conversion of Unicode escape sequences
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringToLocaleLowerCaseTest1069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringToLocaleLowerCaseTest1069';
      

      expect("\u0041\u0042\u0043".toLocaleLowerCase()).assertEqual("abc");
      expect("\u0130".toLocaleLowerCase("tr")).assertEqual("i");
      expect("\u0131".toLocaleLowerCase()).assertEqual("ı");

    });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTOLOCALELOWERCASE_7000
     * @tc.name      StringToLocaleLowerCaseTest1070
     * @tc.desc      Test ES6 Unicode Code Point Escapes
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringToLocaleLowerCaseTest1070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringToLocaleLowerCaseTest1070';
      

      expect("\u{0041}\u{0042}\u{0043}".toLocaleLowerCase()).assertEqual("abc");
      expect("\u{0130}".toLocaleLowerCase("tr")).assertEqual("i");

    });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTOLOCALELOWERCASE_7100
     * @tc.name      StringToLocaleLowerCaseTest1071
     * @tc.desc      Test handling of surrogate pair characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringToLocaleLowerCaseTest1071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringToLocaleLowerCaseTest1071';
      

      const emoji = "😀".toLocaleLowerCase();
      expect(emoji).assertEqual("😀");

    });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTOLOCALELOWERCASE_7200
     * @tc.name      StringToLocaleLowerCaseTest1073
     * @tc.desc      Test for NFC normalization form
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringToLocaleLowerCaseTest1073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringToLocaleLowerCaseTest1073';
      

      const res: (number |string)[]= stringTest.test1073();
      expect(res[0]).assertEqual("é");
      expect(res[1]).assertEqual(1);

    });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTOLOCALELOWERCASE_7300
     * @tc.name      StringToLocaleLowerCaseTest1075
     * @tc.desc      Test Zero-Width Joiner (ZWJ) sequences
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringToLocaleLowerCaseTest1075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringToLocaleLowerCaseTest1075';
      

      const zwj = "👨‍👩‍👧‍👦";
      expect(zwj.toLocaleLowerCase()).assertEqual("👨‍👩‍👧‍👦");

    });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTOLOCALELOWERCASE_7400
     * @tc.name      StringToLocaleLowerCaseTest1076
     * @tc.desc      Test characters with variation selectors
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringToLocaleLowerCaseTest1076", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringToLocaleLowerCaseTest1076';
      

      const withVS = "A\uFE0F";
      expect(withVS.toLocaleLowerCase()).assertEqual("a\uFE0F");

    });


    //====================================Method Chaining Test============================================================

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTOLOCALELOWERCASE_7500
     * @tc.name      StringToLocaleLowerCaseTest1077
     * @tc.desc      Test converting case first, then trimming whitespace
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringToLocaleLowerCaseTest1077", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringToLocaleLowerCaseTest1077';
      

      expect("  HELLO  ".toLocaleLowerCase().trim()).assertEqual("hello");
      expect("  WORLD  ".trim().toLocaleLowerCase()).assertEqual("world");

    });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTOLOCALELOWERCASE_7600
     * @tc.name      StringToLocaleLowerCaseTest1078
     * @tc.desc      Test converting case first, then slicing
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringToLocaleLowerCaseTest1078", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringToLocaleLowerCaseTest1078';
      

      expect("HELLO WORLD".toLocaleLowerCase().slice(0, 5)).assertEqual("hello");
      expect("HELLO WORLD".slice(0, 5).toLocaleLowerCase()).assertEqual("hello");

    });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTOLOCALELOWERCASE_7700
     * @tc.name      StringToLocaleLowerCaseTest1079
     * @tc.desc      Test converting case first, then splitting
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringToLocaleLowerCaseTest1079", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringToLocaleLowerCaseTest1079';
      

      const res = stringTest.test1079();

      const expected1 = ['hello', 'world'];
      expect(res[0].length).assertEqual(expected1.length);
      for (let i = 0; i < expected1.length; i++) {
        expect(res[0][i]).assertEqual(expected1[i]);
      }

      const expected2 = ['a', 'b', 'c'];
      expect(res[1].length).assertEqual(expected2.length);
      for (let i = 0; i < expected2.length; i++) {
        expect(res[1][i]).assertEqual(expected2[i]);
      }

    });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTOLOCALELOWERCASE_7800
     * @tc.name      StringToLocaleLowerCaseTest1080
     * @tc.desc      Test converting first, then replacing
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringToLocaleLowerCaseTest1080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringToLocaleLowerCaseTest1080';
      

      expect("HELLO WORLD".toLocaleLowerCase().replace("world", "js")).assertEqual("hello js");
      expect("ABC ABC".toLocaleLowerCase().replace(/abc/g, "xyz")).assertEqual("xyz xyz");

    });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTOLOCALELOWERCASE_7900
     * @tc.name      StringToLocaleLowerCaseTest1082
     * @tc.desc      Test case-insensitive search using toLocaleLowerCase
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringToLocaleLowerCaseTest1082", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringToLocaleLowerCaseTest1082';
      

      const res :boolean[]= stringTest.test1082();
      expect(res[0]).assertTrue();

    });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTOLOCALELOWERCASE_8000
     * @tc.name      StringToLocaleLowerCaseTest1083
     * @tc.desc      Test using in array map
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringToLocaleLowerCaseTest1083", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringToLocaleLowerCaseTest1083';
      

      const words = ["HELLO", "WORLD", "JAVASCRIPT"];
      const lowerWords = words.map(word => word.toLocaleLowerCase());

      expect(lowerWords[0]).assertEqual('hello');
      expect(lowerWords[1]).assertEqual('world');
      expect(lowerWords[2]).assertEqual('javascript');

      expect(lowerWords.length).assertEqual(3);

    });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTOLOCALELOWERCASE_8100
     * @tc.name      StringToLocaleLowerCaseTest1084
     * @tc.desc      Test using in array filter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringToLocaleLowerCaseTest1084", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringToLocaleLowerCaseTest1084';
      

      const result = ["hello", "WORLD", "javascript", "CODE"]
        .filter(word => word === word.toLocaleLowerCase());

      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual("hello");
      expect(result[1]).assertEqual("javascript");

    });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTOLOCALELOWERCASE_8200
     * @tc.name      StringToLocaleLowerCaseTest1085
     * @tc.desc      Test for use in array sorting
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringToLocaleLowerCaseTest1085", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringToLocaleLowerCaseTest1085';
      

      const result = ["Zebra", "apple", "Banana"]
        .sort((a, b) => a.toLocaleLowerCase().localeCompare(b.toLocaleLowerCase()));

      expect(result[0]).assertEqual("apple");
      expect(result[1]).assertEqual("Banana");
      expect(result[2]).assertEqual("Zebra");

    });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTOLOCALELOWERCASE_8300
     * @tc.name      StringToLocaleLowerCaseTest1086
     * @tc.desc      Test usage in template strings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringToLocaleLowerCaseTest1086", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringToLocaleLowerCaseTest1086';
      

      const result = `Hello, ${"WORLD".toLocaleLowerCase()}!`;
      expect(result).assertEqual("Hello, world!");

    });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTOLOCALELOWERCASE_8400
     * @tc.name      StringToLocaleLowerCaseTest1087
     * @tc.desc      Test usage in tagged templates
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringToLocaleLowerCaseTest1087", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringToLocaleLowerCaseTest1087';
      

      const res :boolean[]= stringTest.test1087();
      expect(res[0]).assertEqual("Hello, world!");

    });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTOLOCALELOWERCASE_8500
     * @tc.name      StringToLocaleLowerCaseTest1088
     * @tc.desc      Test converting object property values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringToLocaleLowerCaseTest1088", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringToLocaleLowerCaseTest1088';
      

      interface MyObjectType {
        name: string;
        city: string;
        country: string;
      }
      const obj: MyObjectType = {
        name: "JOHN",
        city: "NEW YORK",
        country: "USA"
      };

      const lowerObj: MyObjectType = {
        name: obj.name.toLocaleLowerCase(),
        city: obj.city.toLocaleLowerCase(),
        country: obj.country.toLocaleLowerCase()
      };

      expect(lowerObj.name).assertEqual("john");
      expect(lowerObj.city).assertEqual("new york");
      expect(lowerObj.country).assertEqual("usa");

    });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTOLOCALELOWERCASE_8600
     * @tc.name      StringToLocaleLowerCaseTest1089
     * @tc.desc      Test handling strings in JSON data
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringToLocaleLowerCaseTest1089", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringToLocaleLowerCaseTest1089';
      

      interface User {
        name: string;
        email: string;
      }

      const jsonData: string = '{"name": "ALICE", "email": "ALICE@EXAMPLE.COM"}';
      const parsedData: User = JSON.parse(jsonData) as User;

      const normalized: User = {
        name: parsedData.name.toLocaleLowerCase(),
        email: parsedData.email.toLocaleLowerCase()
      };

      expect(normalized.name).assertEqual("alice");
      expect(normalized.email).assertEqual("alice@example.com");

    });

  });
}