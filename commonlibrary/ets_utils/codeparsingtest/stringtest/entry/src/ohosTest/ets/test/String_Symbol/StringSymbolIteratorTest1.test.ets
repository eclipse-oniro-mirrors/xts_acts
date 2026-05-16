import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import * as stringTest from './string_symbol.iterator_test1'

interface CustomIteratorResult {
  value?: string;
  done: boolean;
}

interface CustomStringIterator {
  next(): CustomIteratorResult;
}

export default function StringSymbolIteratorTest() {
  describe('StringSymbolIteratorTest', () => {
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
      // This API supports only one parameter: clear action function.
    });

    //==========================Basic Function Test============================

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATOR_0100
     * @tc.name      StringSymbolIteratorTest1001
     * @tc.desc      Clean User Input Username
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbolIteratorTest1001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbolIteratorTest1001';

      const str = "hello";
      let result : CustomStringIterator = stringTest.testGetStringIterator(str);
      expect(typeof result).assertEqual("object");
      expect(typeof result.next).assertEqual("function");

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATOR_0200
     * @tc.name      StringSymbolIteratorTest1002
     * @tc.desc      Verify Symbol.iterator on prototype vs own property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbolIteratorTest1002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbolIteratorTest1002';


      const result: boolean[] = stringTest.testOwnProperty();
      expect(result[0]).assertEqual(true);
      expect(result[1]).assertEqual(false);


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATOR_0300
     * @tc.name      StringSymbolIteratorTest1003
     * @tc.desc      Verify iterator protocol compliance
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbolIteratorTest1003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbolIteratorTest1003';


      const str = "abc";
      let result: CustomStringIterator = stringTest.testGetStringIterator(str);
      expect(typeof result.next === "function").assertEqual(true);


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATOR_0400
     * @tc.name      StringSymbolIteratorTest1004
     * @tc.desc      Iterate string literal and verify first value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbolIteratorTest1004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbolIteratorTest1004';


      const str = "hello";
      let iterator: CustomStringIterator = stringTest.testGetStringIterator(str);
      let res: CustomIteratorResult = iterator.next();

      expect(res.value).assertEqual("h");
      expect(res.done).assertFalse();


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATOR_0500
     * @tc.name      StringSymbolIteratorTest1005
     * @tc.desc      Iterate String object created by constructor
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbolIteratorTest1005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbolIteratorTest1005';


      const strObj = new String("world");
      let iterator: CustomStringIterator = stringTest.testGetStringIterator(strObj);
      let res: CustomIteratorResult = iterator.next();
      expect(res.value).assertEqual("w");
      expect(res.done).assertFalse();


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATOR_0600
     * @tc.name      StringSymbolIteratorTest1006
     * @tc.desc      Iterate string expression result
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbolIteratorTest1006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbolIteratorTest1006';


      const iter = "hello" + "world";
      let iterator: CustomStringIterator = stringTest.testGetStringIterator(iter);
      let res: CustomIteratorResult = iterator.next();
      expect(res.value).assertEqual("h");


    });

    //==========================Iterator Protocol Test==============================

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATOR_0700
     * @tc.name      StringSymbolIteratorTest1007
     * @tc.desc      Verify next() returns correct iterator result object step by step
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbolIteratorTest1007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbolIteratorTest1007';


      const str = "abc";
      let iterator: CustomStringIterator = stringTest.testGetStringIterator(str);
      let res1: CustomIteratorResult = iterator.next();
      expect(res1.value).assertEqual("a");
      expect(res1.done).assertFalse();
      let res2: CustomIteratorResult = iterator.next();
      expect(res2.value).assertEqual("b");
      expect(res2.done).assertFalse();
      let res3: CustomIteratorResult = iterator.next();
      expect(res3.value).assertEqual("c");
      expect(res3.done).assertFalse();
      let res4: CustomIteratorResult = iterator.next();
      expect(res4.value).assertEqual(undefined);
      expect(res4.done).assertTrue();


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATOR_0800
     * @tc.name      StringSymbolIteratorTest1008
     * @tc.desc      Verify continuous calling of next() collects all characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbolIteratorTest1008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbolIteratorTest1008';


      const str = "test";
      let iterator: CustomStringIterator = stringTest.testGetStringIterator(str);
      let result: string[] = [];
      let res: CustomIteratorResult = iterator.next();
      while (!res.done) {
        result.push(res.value as string);
        res = iterator.next();
      }
      expect(result[0]).assertEqual("t");
      expect(result[1]).assertEqual("e");
      expect(result[2]).assertEqual("s");
      expect(result[3]).assertEqual("t");


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATOR_0900
     * @tc.name      StringSymbolIteratorTest1009
     * @tc.desc      Verify behavior after iteration is complete
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbolIteratorTest1009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbolIteratorTest1009';


      const str = "a";
      let iterator: CustomStringIterator = stringTest.testGetStringIterator(str);
      let res1: CustomIteratorResult = iterator.next();
      expect(res1.value).assertEqual("a");
      expect(res1.done).assertFalse();
      let res2: CustomIteratorResult = iterator.next();
      expect(res2.value).assertEqual(undefined);
      expect(res2.done).assertTrue();
      let res3: CustomIteratorResult = iterator.next();
      expect(res3.value).assertEqual(undefined);
      expect(res3.done).assertTrue();


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATOR_1000
     * @tc.name      StringSymbolIteratorTest1010
     * @tc.desc      Verify iterator object is iterable and returns itself
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbolIteratorTest1010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbolIteratorTest1010';


      const str = "abc";
      let iter1: CustomStringIterator = stringTest.testGetStringIterator(str);
      let iter2: CustomStringIterator = stringTest.testGetIteratorFromIterator(iter1);
      expect(iter1 === iter2).assertTrue();


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATOR_1100
     * @tc.name      StringSymbolIteratorTest1011
     * @tc.desc      Verify multiple calls return independent iterators
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbolIteratorTest1011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbolIteratorTest1011';


      const str = "ab";
      let iter1: CustomStringIterator = stringTest.testGetStringIterator(str);
      let iter2: CustomStringIterator = stringTest.testGetStringIterator(str);
      let res1: CustomIteratorResult = iter1.next();
      let res2: CustomIteratorResult = iter2.next();
      expect(res1.value).assertEqual("a");
      expect(res2.value).assertEqual("a");


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATOR_1200
     * @tc.name      StringSymbolIteratorTest1012
     * @tc.desc      Verify iterator maintains current iteration position
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbolIteratorTest1012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbolIteratorTest1012';


      const str = "abc";
      let iterator: CustomStringIterator = stringTest.testGetStringIterator(str);
      iterator.next();
      iterator.next();
      let res: CustomIteratorResult = iterator.next();
      expect(res.value).assertEqual("c");


    });

    //====================Unicode Code Point Processing Test===========================

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATOR_1300
     * @tc.name      StringSymbolIteratorTest1013
     * @tc.desc      Verify iteration over basic ASCII characters using spread syntax
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbolIteratorTest1013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbolIteratorTest1013';


      const str = "ABC";
      const chars: string[] = stringTest.testStringSpreadToArray(str);
      expect(chars[0]).assertEqual("A");
      expect(chars[1]).assertEqual("B");
      expect(chars[2]).assertEqual("C");


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATOR_1400
     * @tc.name      StringSymbolIteratorTest1014
     * @tc.desc      Verify iteration over digit characters using for...of loop
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbolIteratorTest1014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbolIteratorTest1014';


      const str = "12345";
      const result: string[] = stringTest.testStringLoopToArray(str);
      expect(result[0]).assertEqual("1");
      expect(result[1]).assertEqual("2");
      expect(result[2]).assertEqual("3");
      expect(result[3]).assertEqual("4");
      expect(result[4]).assertEqual("5");


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATOR_1500
     * @tc.name      StringSymbolIteratorTest1015
     * @tc.desc      Verify iteration over special ASCII characters using spread syntax
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbolIteratorTest1015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbolIteratorTest1015';


      const str = "!@#$%";
      const chars: string[] = stringTest.testStringSpreadToArray(str);
      expect(chars[0]).assertEqual("!");
      expect(chars[1]).assertEqual("@");
      expect(chars[2]).assertEqual("#");
      expect(chars[3]).assertEqual("$");
      expect(chars[4]).assertEqual("%");


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATOR_1600
     * @tc.name      StringSymbolIteratorTest1016
     * @tc.desc      Verify iteration over Chinese characters using spread syntax
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbolIteratorTest1016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbolIteratorTest1016';


      const str = "你好世界";
      const chars: string[] = stringTest.testStringSpreadToArray(str);

      expect(chars[0]).assertEqual("你");
      expect(chars[1]).assertEqual("好");
      expect(chars[2]).assertEqual("世");
      expect(chars[3]).assertEqual("界");


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATOR_1700
     * @tc.name      StringSymbolIteratorTest1017
     * @tc.desc      Verify iteration over Japanese Kana characters using for...of loop
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbolIteratorTest1017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbolIteratorTest1017';


      const str = "あいうえお";
      const result: string[] = stringTest.testStringLoopToArray(str);

      expect(result[0]).assertEqual("あ");
      expect(result[1]).assertEqual("い");
      expect(result[2]).assertEqual("う");
      expect(result[3]).assertEqual("え");
      expect(result[4]).assertEqual("お");


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATOR_1800
     * @tc.name      StringSymbolIteratorTest1018
     * @tc.desc      Verify iteration over Korean Hangul characters using spread syntax
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbolIteratorTest1018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbolIteratorTest1018';


      const str = "한글";
      const chars: string[] = stringTest.testStringSpreadToArray(str);

      expect(chars[0]).assertEqual("한");
      expect(chars[1]).assertEqual("글");


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATOR_1900
     * @tc.name      StringSymbolIteratorTest1019
     * @tc.desc      Verify iteration over mixed surrogate pairs and basic characters using for...of loop
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbolIteratorTest1019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbolIteratorTest1019';


      const str = "A𝟘B𝟙C";
      const result: string[] = stringTest.testStringLoopToArray(str);

      expect(result[0]).assertEqual("A");
      expect(result[1]).assertEqual("𝟘");
      expect(result[2]).assertEqual("B");
      expect(result[3]).assertEqual("𝟙");
      expect(result[4]).assertEqual("C");


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATOR_2000
     * @tc.name      StringSymbolIteratorTest1020
     * @tc.desc      Verify iteration over character with combining diacritical mark
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbolIteratorTest1020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbolIteratorTest1020';


      const str = "é";
      const chars: string[] = stringTest.testStringSpreadToArray(str);

      expect(chars.length).assertEqual(1);
      expect(chars[0]).assertEqual("é");


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATOR_2100
     * @tc.name      StringSymbolIteratorTest1021
     * @tc.desc      Verify iteration over ZWJ sequence
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbolIteratorTest1021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbolIteratorTest1021';


      const str = "‍👩‍‍👦";
      const chars: string[] = stringTest.testStringSpreadToArray(str);

      expect(chars.length > 1).assertTrue();


    });

    //==========================Empty String and Boundary Value Test=============================

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATOR_2200
     * @tc.name      StringSymbolIteratorTest1022
     * @tc.desc      Verify iterator behavior on empty string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbolIteratorTest1022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbolIteratorTest1022';


      const str = "";
      const iter: CustomStringIterator = stringTest.testGetStringIterator(str);
      const res = iter.next();

      expect(res.value).assertEqual(undefined);
      expect(res.done).assertTrue();


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATOR_2300
     * @tc.name      StringSymbolIteratorTest1023
     * @tc.desc      Verify spread syntax on empty string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbolIteratorTest1023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbolIteratorTest1023';


      const str = "";
      const chars: string[] = stringTest.testStringSpreadToArray(str);

      expect(chars.length).assertEqual(0);


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATOR_2400
     * @tc.name      StringSymbolIteratorTest1024
     * @tc.desc      Verify for...of loop on empty string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbolIteratorTest1024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbolIteratorTest1024';


      const str = "";
      const count: number = stringTest.testStringForOfCount(str);

      expect(count).assertEqual(0);


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATOR_2500
     * @tc.name      StringSymbolIteratorTest1025
     * @tc.desc      Verify spread syntax on single ASCII character
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbolIteratorTest1025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbolIteratorTest1025';


      const str = "A";
      const chars: string[] = stringTest.testStringSpreadToArray(str);

      expect(chars.length).assertEqual(1);
      expect(chars[0]).assertEqual("A");


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATOR_2600
     * @tc.name      StringSymbolIteratorTest1026
     * @tc.desc      Verify iterator behavior on single Unicode character
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbolIteratorTest1026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbolIteratorTest1026';


      const str = "你";
      const iter: CustomStringIterator = stringTest.testGetStringIterator(str);

      const first = iter.next();
      expect(first.value).assertEqual("你");
      expect(first.done).assertFalse();

      const second = iter.next();
      expect(second.value).assertEqual(undefined);
      expect(second.done).assertTrue();


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATOR_2700
     * @tc.name      StringSymbolIteratorTest1027
     * @tc.desc      Verify iteration over whitespace characters (space, tab, newline, carriage return)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbolIteratorTest1027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbolIteratorTest1027';


      const str = " \t\n\r";
      const chars: string[] = stringTest.testStringSpreadToArray(str);

      expect(chars[0]).assertEqual(" ");
      expect(chars[1]).assertEqual("\t");
      expect(chars[2]).assertEqual("\n");
      expect(chars[3]).assertEqual("\r");


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATOR_2800
     * @tc.name      StringSymbolIteratorTest1028
     * @tc.desc      Verify iteration over invisible zero-width characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbolIteratorTest1028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbolIteratorTest1028';


      const str = "\u200B\u200C\u200D";
      const chars: string[] = stringTest.testStringSpreadToArray(str);

      expect(chars.length).assertEqual(3);


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATOR_2900
     * @tc.name      StringSymbolIteratorTest1029
     * @tc.desc      Verify iteration over control characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbolIteratorTest1029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbolIteratorTest1029';


      const str = "\x00\x01\x02";
      const chars: string[] = stringTest.testStringSpreadToArray(str);

      expect(chars.length).assertEqual(3);
      expect(chars[0] === "\x00").assertEqual(true);


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATOR_3000
     * @tc.name      StringSymbolIteratorTest1030
     * @tc.desc      Verify iteration over medium-length string (100 'a's)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbolIteratorTest1030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbolIteratorTest1030';


      const str = "a".repeat(100);
      const chars: string[] = stringTest.testStringSpreadToArray(str);

      expect(chars.length).assertEqual(100);
      expect(chars.every(c => c === "a")).assertTrue();


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATOR_3100
     * @tc.name      StringSymbolIteratorTest1031
     * @tc.desc      Verify for-of iteration over long string (40000 chars)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbolIteratorTest1031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbolIteratorTest1031';


      const str = "test".repeat(10000);
      const count: number = stringTest.testStringForOfCount(str);

      expect(count).assertEqual(40000);


    });

    //=========================Compatibility Test with Iteration Syntax===========================

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATOR_3200
     * @tc.name      StringSymbolIteratorTest1032
     * @tc.desc      Verify basic for-of iteration over string "hello" using existing helper
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbolIteratorTest1032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbolIteratorTest1032';


      const str = "hello";
      // 复用已有函数 testStringLoopToArray
      const result: string[] = stringTest.testStringLoopToArray(str);

      expect(result.length).assertEqual(5);
      expect(result[0]).assertEqual("h");
      expect(result[1]).assertEqual("e");
      expect(result[2]).assertEqual("l");
      expect(result[3]).assertEqual("l");
      expect(result[4]).assertEqual("o");


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATOR_3300
     * @tc.name      StringSymbolIteratorTest1033
     * @tc.desc      Verify for-of with break on space character (element-by-element assertion)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbolIteratorTest1033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbolIteratorTest1033';


      const str = "hello world";
      const result: string[] = stringTest.testStringForOfWithBreak(str);

      expect(result.length).assertEqual(5);
      expect(result[0]).assertEqual("h");
      expect(result[1]).assertEqual("e");
      expect(result[2]).assertEqual("l");
      expect(result[3]).assertEqual("l");
      expect(result[4]).assertEqual("o");


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATOR_3400
     * @tc.name      StringSymbolIteratorTest1034
     * @tc.desc      Verify for-of with continue to skip digit characters (element-by-element assertion)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbolIteratorTest1034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbolIteratorTest1034';


      const str = "a1b2c3";
      const result: string[] = stringTest.testStringForOfWithContinue(str);

      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual("a");
      expect(result[1]).assertEqual("b");
      expect(result[2]).assertEqual("c");


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATOR_3500
     * @tc.name      StringSymbolIteratorTest1035
     * @tc.desc      Verify spread syntax to convert string to char array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbolIteratorTest1035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbolIteratorTest1035';


      const str = "hello";
      const arr: string[] = stringTest.testStringSpreadToArray(str);

      expect(arr.length).assertEqual(5);
      expect(arr[0]).assertEqual("h");
      expect(arr[1]).assertEqual("e");
      expect(arr[2]).assertEqual("l");
      expect(arr[3]).assertEqual("l");
      expect(arr[4]).assertEqual("o");


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATOR_3600
     * @tc.name      StringSymbolIteratorTest1036
     * @tc.desc      Verify spreading a string as function parameters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbolIteratorTest1036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbolIteratorTest1036';


      const str = "abc";
      const result: string[] = stringTest.testStringSpreadToArray(str);

      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual("a");
      expect(result[1]).assertEqual("b");
      expect(result[2]).assertEqual("c");


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATOR_3700
     * @tc.name      StringSymbolIteratorTest1037
     * @tc.desc      Use spread syntax in array literals
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbolIteratorTest1037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbolIteratorTest1037';


      const str = "cd";
      const arr: string[] = stringTest.testArrayLiteralSpread(str);

      expect(arr.length).assertEqual(5);
      expect(arr[0]).assertEqual("a");
      expect(arr[1]).assertEqual("b");
      expect(arr[2]).assertEqual("c");
      expect(arr[3]).assertEqual("d");
      expect(arr[4]).assertEqual("e");


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATOR_3800
     * @tc.name      StringSymbolIteratorTest1038
     * @tc.desc      Extract string characters using array destructuring assignment
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbolIteratorTest1038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbolIteratorTest1038';


      const str = "hello";
      const result: Array<string | string[]> = stringTest.testArrayDestructuringString(str);
      expect(result[0] as string).assertEqual("h");
      expect(result[1] as string).assertEqual("e");
      expect(result[2] as string).assertEqual("l");

      const rest: string[] = result[3] as string[];
      expect(rest.length).assertEqual(2);
      expect(rest[0]).assertEqual("l");
      expect(rest[1]).assertEqual("o");


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATOR_3900
     * @tc.name      StringSymbolIteratorTest1039
     * @tc.desc      Use array destructuring to swap variables
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbolIteratorTest1039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbolIteratorTest1039';


      const str = "ab";
      const result: string[] = stringTest.testDestructuringSwapVariables(str);

      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual("b");
      expect(result[1]).assertEqual("a");


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATOR_4000
     * @tc.name      StringSymbolIteratorTest1040
     * @tc.desc      Use default values when destructuring
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbolIteratorTest1040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbolIteratorTest1040';


      const str = "a";
      const result: string[] = stringTest.testDestructuringDefaultValue(str);

      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual("a");
      expect(result[1]).assertEqual("default");


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATOR_4100
     * @tc.name      StringSymbolIteratorTest1041
     * @tc.desc      Create a Set from a string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbolIteratorTest1041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbolIteratorTest1041';


      const str = "hello";
      const result: Array<number | boolean> = stringTest.testSetFromString(str);

      expect(result[0] as number).assertEqual(4);
      expect(result[1] as boolean).assertEqual(true);


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATOR_4200
     * @tc.name      StringSymbolIteratorTest1042
     * @tc.desc      Create a Map from a string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbolIteratorTest1042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbolIteratorTest1042';


      const str = "ab";
      const result: Array<number | undefined> = stringTest.testMapFromString(str);

      expect(result[0] as number).assertEqual(0);
      expect(result[1] as number).assertEqual(1);


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATOR_4300
     * @tc.name      StringSymbolIteratorTest1043
     * @tc.desc      Iterate over strings with Promise.all
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbolIteratorTest1043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const TAG = 'StringSymbolIteratorTest1043';


      const str = "abc";
      const result: string[] = await stringTest.testPromiseAllUpper(str);

      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual("A");
      expect(result[1]).assertEqual("B");
      expect(result[2]).assertEqual("C");


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATOR_4400
     * @tc.name      StringSymbolIteratorTest1044
     * @tc.desc      Use Array.from to convert a string to an array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbolIteratorTest1044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbolIteratorTest1044';


      const str = "hello";
      const res: Array<string[] | boolean> = stringTest.testFromStr(str);
      const arr = res[0] as string[];
      const isArray = res[1] as boolean;

      expect(isArray).assertTrue();
      expect(arr.length).assertEqual(5);
      expect(arr[0]).assertEqual("h");
      expect(arr[1]).assertEqual("e");
      expect(arr[2]).assertEqual("l");
      expect(arr[3]).assertEqual("l");
      expect(arr[4]).assertEqual("o");


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATOR_4500
     * @tc.name      StringSymbolIteratorTest1045
     * @tc.desc      Use Array.from with a mapping function
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbolIteratorTest1045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbolIteratorTest1045';


      const str = "123";
      const nums: number[] = stringTest.testFromMap(str);

      expect(nums.length).assertEqual(3);
      expect(nums[0]).assertEqual(1);
      expect(nums[1]).assertEqual(2);
      expect(nums[2]).assertEqual(3);


    });

    //===========================Manual Iteration Control Test=============================

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATOR_4600
     * @tc.name      StringSymbolIteratorTest1046
     * @tc.desc      Verify that next() returns a complete result object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbolIteratorTest1046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbolIteratorTest1046';


      const str = "a";
      const result: Array<boolean | string> = stringTest.testNextIntegrity(str);
      expect(result[0] as boolean).assertTrue();
      expect(result[1] as boolean).assertTrue();
      expect(result[2] as string).assertEqual("a");
      expect(result[3] as boolean).assertFalse();


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATOR_4700
     * @tc.name      StringSymbolIteratorTest1047
     * @tc.desc      Verify that next() ignores passed parameters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbolIteratorTest1047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbolIteratorTest1047';


      const str = "ab";
      const result: string[] = stringTest.testNextIgnoreParams(str) as string[];
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual("a");
      expect(result[1]).assertEqual("b");


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATOR_4800
     * @tc.name      StringSymbolIteratorTest1048
     * @tc.desc      Verify that next() consumes only what is requested
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbolIteratorTest1048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbolIteratorTest1048';


      const str = "abc";
      const result: Array<string | boolean> = stringTest.testNextLazyConsume(str);
      expect(result[0] as string).assertEqual("a");
      expect(result[2] as boolean).assertFalse();
      expect(result[1] as string).assertEqual("b");
      expect(result[3] as boolean).assertFalse();


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATOR_4900
     * @tc.name      StringSymbolIteratorTest1049
     * @tc.desc      Verify whether the iterator has a return() method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbolIteratorTest1049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbolIteratorTest1049';


      const str = "test";
      const hasReturn: boolean = stringTest.testIterReturn(str);
      expect(hasReturn).assertTrue();


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATOR_5000
     * @tc.name      StringSymbolIteratorTest1050
     * @tc.desc      Verify iterator status after it is exhausted
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbolIteratorTest1050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbolIteratorTest1050';


      const str = "ab";
      const result: Array<boolean | undefined> = stringTest.testIterExhausted(str) as Array<boolean | undefined>;

      expect(result[0] as boolean).assertFalse();
      expect(result[1] as boolean).assertFalse();
      expect(result[2] as boolean).assertTrue();
      expect(result[3] as boolean).assertTrue();
      expect(result[4]).assertEqual(undefined);
      expect(result[5]).assertEqual(undefined);


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATOR_5100
     * @tc.name      StringSymbolIteratorTest1051
     * @tc.desc      Verify the iterator cannot be reset
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbolIteratorTest1051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbolIteratorTest1051';


      const str = "ab";
      const result: string[] = stringTest.testIterNoReset(str) as string[];

      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual("a");
      expect(result[1]).assertEqual("b");
      expect(result[2]).assertEqual("a");


    });

    //=====================Surrogate Pair and Grapheme Cluster Test============================

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATOR_5200
     * @tc.name      StringSymbolIteratorTest1052
     * @tc.desc      Isolated high surrogate should be iterated as one code unit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbolIteratorTest1052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbolIteratorTest1052';


      const str = "\uD83D";
      const chars: string[] = stringTest.testStringSpreadToArray(str);
      expect(chars.length).assertEqual(1);
      expect(chars[0]).assertEqual("\uD83D");


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATOR_5300
     * @tc.name      StringSymbolIteratorTest1053
     * @tc.desc      Verify combining character sequences
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbolIteratorTest1053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbolIteratorTest1053';


      const str = "e\u0301";
      const chars: string[] = stringTest.testStringSpreadToArray(str);
      expect(chars.length).assertEqual(2);
      expect(chars[0]).assertEqual("e");
      expect(chars[1]).assertEqual("\u0301");


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATOR_5400
     * @tc.name      StringSymbolIteratorTest1054
     * @tc.desc      Multiple combining marks should expand to multiple symbols
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbolIteratorTest1054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbolIteratorTest1054';


      const str = "a\u0300\u0301\u0302";
      const chars: string[] = stringTest.testStringSpreadToArray(str);
      expect(chars.length).assertEqual(4);


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATOR_5500
     * @tc.name      StringSymbolIteratorTest1055
     * @tc.desc      Emoji sequence should be split when iterated
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbolIteratorTest1055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbolIteratorTest1055';


      const str = "👨‍👩‍👧";
      const chars: string[] = stringTest.testStringSpreadToArray(str);
      expect(chars.length > 1).assertTrue();


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATOR_5600
     * @tc.name      StringSymbolIteratorTest1056
     * @tc.desc      Variant selectors should increase the number of iterated symbols
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbolIteratorTest1056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbolIteratorTest1056';


      const str = "①\uFE0F";
      const chars: string[] = stringTest.testStringSpreadToArray(str);
      expect(chars.length).assertEqual(2);


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATOR_5700
     * @tc.name      StringSymbolIteratorTest1057
     * @tc.desc      Regional indicator symbols should be iterated separately
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbolIteratorTest1057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbolIteratorTest1057';


      const str = "\uD83C\uDDE6\uD83C\uDDF7";
      const chars: string[] = stringTest.testCodePoints(str);
      expect(chars.length).assertEqual(2);


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATOR_5800
     * @tc.name      StringSymbolIteratorTest1058
     * @tc.desc      Tag characters should be split when iterated
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbolIteratorTest1058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbolIteratorTest1058';
      const str = "\u{1F3F4}\u{E0067}\u{E0062}\u{E0073}\u{E0063}\u{E0074}\u{E007F}";
      const chars: string[] = stringTest.testStringSpreadToArray(str);
      expect(chars.length > 1).assertTrue();


    });

    //======================Iterator State Management Test============================

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATOR_5900
     * @tc.name      StringSymbolIteratorTest1059
     * @tc.desc      Independent iterators should maintain separate state
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbolIteratorTest1059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbolIteratorTest1059';


      const str = "abc";
      const iter1: CustomStringIterator = stringTest.testGetStringIterator(str);
      const iter2: CustomStringIterator = stringTest.testGetStringIterator(str);

      const r1 = iter1.next();
      expect(r1.value).assertEqual("a");

      const r2 = iter2.next();
      expect(r2.value).assertEqual("a");

      const r3 = iter1.next();
      expect(r3.value).assertEqual("b");


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATOR_6000
     * @tc.name      StringSymbolIteratorTest1060
     * @tc.desc      Interleaving next() calls on two iterators should work correctly
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbolIteratorTest1060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbolIteratorTest1060';


      const str = "1234";
      const iter1: CustomStringIterator = stringTest.testGetStringIterator(str);
      const iter2: CustomStringIterator = stringTest.testGetStringIterator(str);

      expect(iter1.next().value).assertEqual("1");
      expect(iter2.next().value).assertEqual("1");
      expect(iter1.next().value).assertEqual("2");
      expect(iter2.next().value).assertEqual("2");


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATOR_6100
     * @tc.name      StringSymbolIteratorTest1061
     * @tc.desc      Iterator references should be shared when assigned
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbolIteratorTest1061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbolIteratorTest1061';


      const str = "ab";
      const iter1: CustomStringIterator = stringTest.testGetStringIterator(str);
      const iter2: CustomStringIterator = iter1;

      expect(iter1.next().value).assertEqual("a");
      expect(iter2.next().value).assertEqual("b");


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATOR_6200
     * @tc.name      StringSymbolIteratorTest1062
     * @tc.desc      Iterator passed as a parameter should advance on each next()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbolIteratorTest1062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbolIteratorTest1062';


      const str = "abc";
      const iter: CustomStringIterator = stringTest.testGetStringIterator(str);

      expect(iter.next().value).assertEqual("a");
      expect(iter.next().value).assertEqual("b");


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATOR_6300
     * @tc.name      StringSymbolIteratorTest1063
     * @tc.desc      Partial iteration should continue correctly on subsequent next()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbolIteratorTest1063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbolIteratorTest1063';


      const str = "hello";
      const iter: CustomStringIterator = stringTest.testGetStringIterator(str);

      iter.next(); // h
      iter.next(); // e

      const r = iter.next(); // next should be l
      expect(r.value).assertEqual("l");


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATOR_6400
     * @tc.name      StringSymbolIteratorTest1064
     * @tc.desc      After releasing an iterator reference, a new iterator should work
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbolIteratorTest1064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbolIteratorTest1064';


      const str = "hello";
      let iter: CustomStringIterator | null = stringTest.testGetStringIterator(str);
      if (iter !== null) {
        iter.next(); // h
      }
      iter = null;

      const iter2: CustomStringIterator = stringTest.testGetStringIterator(str);
      expect(iter2.next().value).assertEqual("h");


    });

    //========================Exceptional Case Test==============================

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATOR_6500
     * @tc.name      StringSymbolIteratorTest1065
     * @tc.desc      Invoke String iterator on a non-string value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbolIteratorTest1065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbolIteratorTest1065';


      const isTypeError: boolean = stringTest.testIterCallTypeErrorNonString();
      expect(isTypeError).assertFalse();

      const values: string[] = stringTest.testIterNumber() as string[];
      expect(values[0]).assertEqual("1");
      expect(values[1]).assertEqual("2");
      expect(values[2]).assertEqual("3");


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATOR_6600
     * @tc.name      StringSymbolIteratorTest1066
     * @tc.desc      Invoke String iterator on null should throw TypeError
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbolIteratorTest1066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbolIteratorTest1066';


      const isTypeError: boolean = stringTest.testIterCallTypeErrorNull();
      expect(isTypeError).assertTrue();


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATOR_6700
     * @tc.name      StringSymbolIteratorTest1067
     * @tc.desc      Invoke String iterator on undefined should throw TypeError
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbolIteratorTest1067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbolIteratorTest1067';


      const isTypeError: boolean = stringTest.testIterCallTypeErrorUndef();
      expect(isTypeError).assertTrue();


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATOR_6800
     * @tc.name      StringSymbolIteratorTest1068
     * @tc.desc      next() should return a result object without throwing
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbolIteratorTest1068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbolIteratorTest1068';


      const str = "test";
      const iter: CustomStringIterator = stringTest.testGetStringIterator(str);
      const result: CustomIteratorResult = iter.next();

      expect(typeof result).assertEqual("object");
      expect(result.value).assertEqual("t");
      expect(result.done).assertFalse();


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATOR_6900
     * @tc.name      StringSymbolIteratorTest1069
     * @tc.desc      Modified iterator next() should be observable
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbolIteratorTest1069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbolIteratorTest1069';


      const str = "ab";
      const res: Array<string | boolean> = stringTest.testModifyNext(str) as Array<string | boolean>;
      expect(res[0] as string).assertEqual("X");
      expect(res[1] as boolean).assertFalse();


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATOR_7000
     * @tc.name      StringSymbolIteratorTest1070
     * @tc.desc      Reassigning a string during iteration should not affect next() result
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbolIteratorTest1070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbolIteratorTest1070';


      let str = "hello";
      const iter: CustomStringIterator = stringTest.testGetStringIterator(str);
      str = "world";

      const result: CustomIteratorResult = iter.next();
      expect(result.value).assertEqual("h");


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATOR_7100
     * @tc.name      StringSymbolIteratorTest1071
     * @tc.desc      Mutating a String object should not affect iteration content
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbolIteratorTest1071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbolIteratorTest1071';


      const first: string = stringTest.testStringObjMutation();
      expect(first).assertEqual("h");


    });

    //========================Interaction Test with Other String Methods===========================

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATOR_7200
     * @tc.name      StringSymbolIteratorTest1072
     * @tc.desc      Compare iterator result with charAt outputs
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbolIteratorTest1072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbolIteratorTest1072';


      const str = "hello";
      const iterChars: string[] = stringTest.testStringSpreadToArray(str);
      const charAtChars: string[] = [];
      for (let i = 0; i < str.length; i++) {
        charAtChars.push(str.charAt(i));
      }

      expect(JSON.stringify(iterChars)).assertEqual(JSON.stringify(charAtChars));


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATOR_7300
     * @tc.name      StringSymbolIteratorTest1073
     * @tc.desc      Unicode surrogate pairs differ between charAt and iterating symbols
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbolIteratorTest1073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbolIteratorTest1073';


      const str = "😀";
      expect(str.charAt(0)).assertEqual("\uD83D");
      expect(str.charAt(1)).assertEqual("\uDE00");

      const chars: string[] = stringTest.testCodePoints(str);
      expect(chars[0]).assertEqual("😀");


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATOR_7400
     * @tc.name      StringSymbolIteratorTest1074
     * @tc.desc      charCodeAt returns UTF-16 code units while iteration returns code points
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbolIteratorTest1074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbolIteratorTest1074';


      const str = "😀";
      expect(str.charCodeAt(0)).assertEqual(55357);
      expect(str.charCodeAt(1)).assertEqual(56832);

      const chars: string[] = stringTest.testCodePoints(str);
      expect(chars.length).assertEqual(1);


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATOR_7500
     * @tc.name      StringSymbolIteratorTest1075
     * @tc.desc      Compare split() result with iterator expansion
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbolIteratorTest1075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbolIteratorTest1075';


      const str = "hello";
      const splitChars: string[] = str.split("");
      const iterChars: string[] = stringTest.testStringSpreadToArray(str);

      expect(splitChars.length).assertEqual(iterChars.length);
      for (let i = 0; i < splitChars.length; i++) {
        expect(splitChars[i]).assertEqual(iterChars[i]);
      }


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATOR_7600
     * @tc.name      StringSymbolIteratorTest1076
     * @tc.desc      split() splits UTF-16 code units while iterator yields code points
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbolIteratorTest1076", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbolIteratorTest1076';


      const str = "😀";
      const splitChars: string[] = str.split("");
      expect(splitChars.length).assertEqual(2);
      expect(splitChars[0]).assertEqual("\uD83D");
      expect(splitChars[1]).assertEqual("\uDE00");

      const iterChars: string[] = stringTest.testCodePoints(str);
      expect(iterChars.length).assertEqual(1);
      expect(iterChars[0]).assertEqual("😀");


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATOR_7700
     * @tc.name      StringSymbolIteratorTest1077
     * @tc.desc      Extract code points from iterated characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbolIteratorTest1077", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbolIteratorTest1077';


      const str = "A😀B";
      const codeNums: number[] = stringTest.testCodeNums(str) as number[];
      expect(codeNums.length).assertEqual(3);
      expect(codeNums[0]).assertEqual(65);
      expect(codeNums[1]).assertEqual(128512);
      expect(codeNums[2]).assertEqual(66);


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATOR_7800
     * @tc.name      StringSymbolIteratorTest1078
     * @tc.desc      Rebuild string from code points
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbolIteratorTest1078", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbolIteratorTest1078';


      const str = "hello";
      const ok: boolean = stringTest.testRebuildNums(str);
      expect(ok).assertTrue();


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATOR_7900
     * @tc.name      StringSymbolIteratorTest1079
     * @tc.desc      Verify iterating a trimmed string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbolIteratorTest1079", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbolIteratorTest1079';


      const str = " hello ";
      const trimmed = str.trim();
      const chars: string[] = stringTest.testStringSpreadToArray(trimmed);

      expect(chars.length).assertEqual(5);
      expect(chars[0]).assertEqual("h");
      expect(chars[1]).assertEqual("e");
      expect(chars[2]).assertEqual("l");
      expect(chars[3]).assertEqual("l");
      expect(chars[4]).assertEqual("o");


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATOR_8000
     * @tc.name      StringSymbolIteratorTest1080
     * @tc.desc      Verify iterating an uppercased string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbolIteratorTest1080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbolIteratorTest1080';


      const str = "hello";
      const upper = str.toUpperCase();
      const chars: string[] = stringTest.testStringSpreadToArray(upper);

      expect(chars.length).assertEqual(5);
      expect(chars[0]).assertEqual("H");
      expect(chars[1]).assertEqual("E");
      expect(chars[2]).assertEqual("L");
      expect(chars[3]).assertEqual("L");
      expect(chars[4]).assertEqual("O");


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATOR_8100
     * @tc.name      StringSymbolIteratorTest1081
     * @tc.desc      Verify iterating a sliced string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbolIteratorTest1081", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbolIteratorTest1081';


      const str = "hello world";
      const sliced = str.slice(0, 5);
      const chars: string[] = stringTest.testStringSpreadToArray(sliced);

      expect(chars.length).assertEqual(5);
      expect(chars[0]).assertEqual("h");
      expect(chars[1]).assertEqual("e");
      expect(chars[2]).assertEqual("l");
      expect(chars[3]).assertEqual("l");
      expect(chars[4]).assertEqual("o");


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATOR_8200
     * @tc.name      StringSymbolIteratorTest1082
     * @tc.desc      Verify using includes on iterated character array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbolIteratorTest1082", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbolIteratorTest1082';


      const str = "hello";
      const chars: string[] = stringTest.testStringSpreadToArray(str);
      const hasH: boolean = chars.includes("h");
      const hasZ: boolean = chars.includes("z");

      expect(hasH).assertTrue();
      expect(hasZ).assertFalse();


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATOR_8300
     * @tc.name      StringSymbolIteratorTest1083
     * @tc.desc      Verify using indexOf on iterated character array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbolIteratorTest1083", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbolIteratorTest1083';


      const str = "hello";
      const chars: string[] = stringTest.testStringSpreadToArray(str);

      expect(chars.indexOf("l")).assertEqual(2);
      expect(chars.indexOf("z")).assertEqual(-1);


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATOR_8400
     * @tc.name      StringSymbolIteratorTest1084
     * @tc.desc      Verify using join on iterated character array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbolIteratorTest1084", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbolIteratorTest1084';


      const str = "hello";
      const chars: string[] = stringTest.testStringSpreadToArray(str);
      const joined: string = chars.join('-');

      expect(joined).assertEqual("h-e-l-l-o");


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATOR_8500
     * @tc.name      StringSymbolIteratorTest1085
     * @tc.desc      Use regex test with filter on iterated character array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbolIteratorTest1085", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbolIteratorTest1085';


      const str = "a1b2c3";
      const chars: string[] = stringTest.testStringSpreadToArray(str);
      const letters: string[] = chars.filter((c: string) => /[a-z]/.test(c));

      expect(letters.length).assertEqual(3);
      expect(letters[0]).assertEqual("a");
      expect(letters[1]).assertEqual("b");
      expect(letters[2]).assertEqual("c");


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATOR_8600
     * @tc.name      StringSymbolIteratorTest1086
     * @tc.desc      Use regex replace with map on iterated character array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbolIteratorTest1086", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbolIteratorTest1086';


      const str = "hello";
      const chars: string[] = stringTest.testStringSpreadToArray(str);
      const replaced: string[] = chars.map((c: string) => c.replace(/l/g, "L"));

      expect(replaced.length).assertEqual(5);
      expect(replaced[0]).assertEqual("h");
      expect(replaced[1]).assertEqual("e");
      expect(replaced[2]).assertEqual("L");
      expect(replaced[3]).assertEqual("L");
      expect(replaced[4]).assertEqual("o");


    });

  });
}