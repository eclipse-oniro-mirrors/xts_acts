import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import * as stringTest from './string_symbol.iterator_test1'

interface CustomIteratorResult {
  value?: string;
  done: boolean;
}

interface CustomStringIterator {
  next(): CustomIteratorResult;
}

export default function StringSymbolIteratorTest2() {
  describe('StringSymbolIteratorTest2', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    });
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    });
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    });
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: preset action function.
    });

    //========================Interaction Test with Other String Methods===========================

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATORTWO_0100
     * @tc.name      StringSymbolIteratorTest2001
     * @tc.desc      Verify iterating a normalized (NFC) string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbolIteratorTest2001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbolIteratorTest2001';


      const str = "e\u0301"; // e + combining acute accent
      const normalized = str.normalize("NFC");
      const chars: string[] = stringTest.testStringSpreadToArray(normalized);

      expect(chars.length).assertEqual(1);


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATORTWO_0200
     * @tc.name      StringSymbolIteratorTest2002
     * @tc.desc      Compare iteration results of NFC vs NFD forms
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbolIteratorTest2002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbolIteratorTest2002';


      const str = "e\u0301";
      const nfcStr = str.normalize("NFC");
      const nfdStr = str.normalize("NFD");

      const nfcChars: string[] = stringTest.testStringSpreadToArray(nfcStr);
      const nfdChars: string[] = stringTest.testStringSpreadToArray(nfdStr);

      expect(nfcChars.length).assertEqual(1);
      expect(nfdChars.length).assertEqual(2);


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATORTWO_0300
     * @tc.name      StringSymbolIteratorTest2003
     * @tc.desc      Verify repeat() result when repeating non-empty strings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbolIteratorTest2003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbolIteratorTest2003';


      const str = "ab".repeat(3);
      const chars: string[] = stringTest.testStringSpreadToArray(str);

      expect(chars.length).assertEqual(6);
      expect(chars[0]).assertEqual("a");
      expect(chars[1]).assertEqual("b");
      expect(chars[2]).assertEqual("a");
      expect(chars[3]).assertEqual("b");
      expect(chars[4]).assertEqual("a");
      expect(chars[5]).assertEqual("b");


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATORTWO_0400
     * @tc.name      StringSymbolIteratorTest2004
     * @tc.desc      Verify repeat() result when repeating empty strings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbolIteratorTest2004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbolIteratorTest2004';


      const str = "".repeat(10);
      const chars: string[] = stringTest.testStringSpreadToArray(str);

      expect(chars.length).assertEqual(0);


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATORTWO_0500
     * @tc.name      StringSymbolIteratorTest2005
     * @tc.desc      Verify padStart iteration result
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbolIteratorTest2005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbolIteratorTest2005';


      const str = "hello".padStart(10, " ");
      const chars: string[] = stringTest.testStringSpreadToArray(str);

      expect(chars.length).assertEqual(10);
      for (let i = 0; i < 5; i++) {
        expect(chars[i]).assertEqual(" ");
      }
      expect(chars[5]).assertEqual("h");
      expect(chars[6]).assertEqual("e");
      expect(chars[7]).assertEqual("l");
      expect(chars[8]).assertEqual("l");
      expect(chars[9]).assertEqual("o");


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATORTWO_0600
     * @tc.name      StringSymbolIteratorTest2006
     * @tc.desc      Verify padEnd iteration result
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbolIteratorTest2006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbolIteratorTest2006';


      const str = "hello".padEnd(10, ".");
      const chars: string[] = stringTest.testStringSpreadToArray(str);

      expect(chars.length).assertEqual(10);
      expect(chars[0]).assertEqual("h");
      expect(chars[1]).assertEqual("e");
      expect(chars[2]).assertEqual("l");
      expect(chars[3]).assertEqual("l");
      expect(chars[4]).assertEqual("o");
      for (let i = 5; i < 10; i++) {
        expect(chars[i]).assertEqual(".");
      }


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATORTWO_0700
     * @tc.name      StringSymbolIteratorTest2007
     * @tc.desc      Verify toString iteration result
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbolIteratorTest2007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbolIteratorTest2007';


      const strObj = new String("hello");
      const str = strObj.toString();
      const chars: string[] = stringTest.testStringSpreadToArray(str);

      expect(chars.length).assertEqual(5);
      expect(chars[0]).assertEqual("h");
      expect(chars[1]).assertEqual("e");
      expect(chars[2]).assertEqual("l");
      expect(chars[3]).assertEqual("l");
      expect(chars[4]).assertEqual("o");


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATORTWO_0800
     * @tc.name      StringSymbolIteratorTest2008
     * @tc.desc      Verify valueOf iteration result
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbolIteratorTest2008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbolIteratorTest2008';


      const strObj = new String("hello");
      const str = strObj.valueOf();
      const chars: string[] = stringTest.testStringSpreadToArray(str);

      expect(chars.length).assertEqual(5);
      expect(chars[0]).assertEqual("h");
      expect(chars[1]).assertEqual("e");
      expect(chars[2]).assertEqual("l");
      expect(chars[3]).assertEqual("l");
      expect(chars[4]).assertEqual("o");


    });

    //========================Practical Application Scenario Test============================

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATORTWO_0900
     * @tc.name      StringSymbolIteratorTest2009
     * @tc.desc      Use iterator to count character frequency
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbolIteratorTest2009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbolIteratorTest2009';


      const str = "hello world";
      const res: number[] = stringTest.testFreqLR(str) as number[];
      expect(res[0]).assertEqual(3);
      expect(res[1]).assertEqual(2);


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATORTWO_1000
     * @tc.name      StringSymbolIteratorTest2010
     * @tc.desc      Use iterator to obtain unique characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbolIteratorTest2010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbolIteratorTest2010';


      const str = "hello";
      const res: Array<number | boolean> = stringTest.testUniqueHello(str) as Array<number | boolean>;
      expect(res[0] as number).assertEqual(4);
      expect(res[1] as boolean).assertTrue();
      expect(res[2] as boolean).assertTrue();
      expect(res[3] as boolean).assertTrue();
      expect(res[4] as boolean).assertTrue();


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATORTWO_1100
     * @tc.name      StringSymbolIteratorTest2011
     * @tc.desc      Use iterator to reverse a string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbolIteratorTest2011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbolIteratorTest2011';


      const str = "hello";
      const reversed: string = stringTest.testReverseJoin(str);
      expect(reversed).assertEqual("olleh");


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATORTWO_1200
     * @tc.name      StringSymbolIteratorTest2012
     * @tc.desc      Use iterator to uppercase characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbolIteratorTest2012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbolIteratorTest2012';


      const str = "hello";
      const upper: string = stringTest.testUpperJoin(str);
      expect(upper).assertEqual("HELLO");


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATORTWO_1300
     * @tc.name      StringSymbolIteratorTest2013
     * @tc.desc      Use iterator to filter non-numeric characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbolIteratorTest2013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbolIteratorTest2013';


      const str = "a1b2c3";
      const chars: string[] = stringTest.testStringSpreadToArray(str);
      const filtered: string = chars.filter((c: string) => isNaN(Number(c))).join('');

      expect(filtered).assertEqual("abc");


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATORTWO_1400
     * @tc.name      StringSymbolIteratorTest2014
     * @tc.desc      Use iterator to remove spaces
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbolIteratorTest2014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbolIteratorTest2014';


      const str = "hello world";
      const chars: string[] = stringTest.testStringSpreadToArray(str);
      const noSpaces: string = chars.filter((c: string) => c !== ' ').join('');

      expect(noSpaces).assertEqual("helloworld");


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATORTWO_1500
     * @tc.name      StringSymbolIteratorTest2015
     * @tc.desc      Verify character types using iterator and every
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbolIteratorTest2015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbolIteratorTest2015';


      const str = "abc123";
      const chars: string[] = stringTest.testStringSpreadToArray(str);

      const allLetters: boolean = chars.every((c: string) => /[a-zA-Z]/.test(c));
      const allDigits: boolean = chars.every((c: string) => /[0-9]/.test(c));

      expect(allLetters).assertFalse();
      expect(allDigits).assertFalse();


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATORTWO_1600
     * @tc.name      StringSymbolIteratorTest2016
     * @tc.desc      Verify character code range using iterator and every
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbolIteratorTest2016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbolIteratorTest2016';


      const str = "abc";
      const chars: string[] = stringTest.testStringSpreadToArray(str);

      const inRange: boolean = chars.every((c: string) => {
        const code = c.charCodeAt(0);
        return code >= 97 && code <= 122; // a-z
      });

      expect(inRange).assertTrue();


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATORTWO_1700
     * @tc.name      StringSymbolIteratorTest2017
     * @tc.desc      Use iterator chain: filter then map then join
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbolIteratorTest2017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbolIteratorTest2017';


      const str = "Hello World ";
      const chars: string[] = stringTest.testStringSpreadToArray(str);
      const result: string = chars.filter((c: string) => c !== ' ').map((c: string) => c.toLowerCase()).join('');

      expect(result).assertEqual("helloworld");


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATORTWO_1800
     * @tc.name      StringSymbolIteratorTest2018
     * @tc.desc      Use iterator chain to alternate upper/lower by index
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbolIteratorTest2018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbolIteratorTest2018';


      const str = "hello";
      const chars: string[] = stringTest.testStringSpreadToArray(str);
      const result: string = chars.map((c: string, i: number) => i % 2 === 0 ? c.toUpperCase() : c.toLowerCase()).join('');

      expect(result).assertEqual("HeLlO");


    });

  });
}