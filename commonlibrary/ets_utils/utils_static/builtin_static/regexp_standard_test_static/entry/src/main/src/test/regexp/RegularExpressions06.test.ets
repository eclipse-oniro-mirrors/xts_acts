/*
* Copyright (c) 2025 SwanLink (Jiangsu) Technology Development Co., LTD.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*     http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/

import {
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '../../../../hypium/index';
import Utils from '../Util.test';


export default function RegularExpressions06Test() {
  describe('RegularExpressions06Test', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
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
     * @tc.number    SUB_BASEDATE_REGEXP_CHARSET_0100
     * @tc.name      testRegExpCharset0001
     * @tc.desc      RegExp character set [abc] matches single char 'a'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpCharset0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re1: RegExp = new RegExp('[abc]');
      const result1: boolean = re1.test("a");
      expect(result1).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATE_REGEXP_CHARSET_0200
     * @tc.name      testRegExpCharset0002
     * @tc.desc      RegExp character set [abc] does not match single char 'd'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpCharset0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re2: RegExp = new RegExp('[abc]');
      const result2: boolean = re2.test("d");
      expect(result2).assertFalse();
    });

    /**
     * @tc.number    SUB_BASEDATE_REGEXP_CHARSET_0300
     * @tc.name      testRegExpCharset0003
     * @tc.desc      RegExp negated character set [^abc] matches single char 'd'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpCharset0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re3: RegExp = new RegExp('[^abc]');
      const result3: boolean = re3.test("d");
      expect(result3).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATE_REGEXP_CHARSET_0400
     * @tc.name      testRegExpCharset0004
     * @tc.desc      RegExp negated character set [^abc] does not match single char 'a'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpCharset0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re4: RegExp = new RegExp('[^abc]');
      const result4: boolean = re4.test("a");
      expect(result4).assertFalse();
    });

    /**
     * @tc.number    SUB_BASEDATE_REGEXP_CHARSET_0500
     * @tc.name      testRegExpCharset0005
     * @tc.desc      RegExp lowercase range [a-z] matches single char 'm'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpCharset0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re5: RegExp = new RegExp('[a-z]');
      const result5: boolean = re5.test("m");
      expect(result5).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATE_REGEXP_CHARSET_0600
     * @tc.name      testRegExpCharset0006
     * @tc.desc      RegExp lowercase range [a-z] does not match uppercase 'M'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpCharset0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re6: RegExp = new RegExp('[a-z]');
      const result6: boolean = re6.test("M");
      expect(result6).assertFalse();
    });

    /**
     * @tc.number    SUB_BASEDATE_REGEXP_CHARSET_0700
     * @tc.name      testRegExpCharset0007
     * @tc.desc      RegExp uppercase range [A-Z] matches single char 'M'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpCharset0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re7: RegExp = new RegExp('[A-Z]');
      const result7: boolean = re7.test("M");
      expect(result7).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATE_REGEXP_CHARSET_0800
     * @tc.name      testRegExpCharset0008
     * @tc.desc      RegExp uppercase range [A-Z] does not match lowercase 'm'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpCharset0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re8: RegExp = new RegExp('[A-Z]');
      const result8: boolean = re8.test("m");
      expect(result8).assertFalse();
    });

    /**
     * @tc.number    SUB_BASEDATE_REGEXP_CHARSET_0900
     * @tc.name      testRegExpCharset0009
     * @tc.desc      RegExp digit range [0-9] matches single char '5'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpCharset0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re9: RegExp = new RegExp('[0-9]');
      const result9: boolean = re9.test("5");
      expect(result9).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATE_REGEXP_CHARSET_1000
     * @tc.name      testRegExpCharset0010
     * @tc.desc      RegExp digit range [0-9] matches single char '5'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpCharset0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re10: RegExp = new RegExp('[0-9]');
      const result10: boolean = re10.test("a");
      expect(result10).assertFalse();
    });
    /**
     * @tc.number    SUB_BASEDATE_REGEXP_CHARSET_1100
     * @tc.name      testRegExpCharset0011
     * @tc.desc      RegExp letter range [a-zA-Z] matches single char 'B'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpCharset0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re11: RegExp = new RegExp('[a-zA-Z]');
      const result11: boolean = re11.test("B");
      expect(result11).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATE_REGEXP_CHARSET_1200
     * @tc.name      testRegExpCharset0012
     * @tc.desc      RegExp letter range [a-zA-Z] does not match digit '3'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpCharset0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re12: RegExp = new RegExp('[a-zA-Z]');
      const result12: boolean = re12.test("3");
      expect(result12).assertFalse();
    });

    /**
     * @tc.number    SUB_BASEDATE_REGEXP_CHARSET_1300
     * @tc.name      testRegExpCharset0013
     * @tc.desc      RegExp lowercase-letter & digit range [a-z0-9] matches single char '7'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpCharset0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re13: RegExp = new RegExp('[a-z0-9]');
      const result13: boolean = re13.test("7");
      expect(result13).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATE_REGEXP_CHARSET_1400
     * @tc.name      testRegExpCharset0014
     * @tc.desc      RegExp lowercase-letter & digit range [a-z0-9] does not match uppercase 'Z'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpCharset0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re14: RegExp = new RegExp('[a-z0-9]');
      const result14: boolean = re14.test("Z");
      expect(result14).assertFalse();
    });

    /**
     * @tc.number    SUB_BASEDATE_REGEXP_CHARSET_1500
     * @tc.name      testRegExpCharset0015
     * @tc.desc      RegExp digit range [1-5] matches single char '3'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpCharset0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re15: RegExp = new RegExp('[1-5]');
      const result15: boolean = re15.test("3");
      expect(result15).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATE_REGEXP_CHARSET_1600
     * @tc.name      testRegExpCharset0016
     * @tc.desc      RegExp digit range [1-5] does not match single char '6'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpCharset0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re16: RegExp = new RegExp('[1-5]');
      const result16: boolean = re16.test("6");
      expect(result16).assertFalse();
    });

    /**
     * @tc.number    SUB_BASEDATE_REGEXP_CHARSET_1700
     * @tc.name      testRegExpCharset0017
     * @tc.desc      RegExp lowercase range [c-f] matches single char 'e'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpCharset0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re17: RegExp = new RegExp('[c-f]');
      const result17: boolean = re17.test("e");
      expect(result17).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATE_REGEXP_CHARSET_1800
     * @tc.name      testRegExpCharset0018
     * @tc.desc      RegExp lowercase range [c-f] does not match single char 'b'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpCharset0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re18: RegExp = new RegExp('[c-f]');
      const result18: boolean = re18.test("b");
      expect(result18).assertFalse();
    });

    /**
     * @tc.number    SUB_BASEDATE_REGEXP_CHARSET_1900
     * @tc.name      testRegExpCharset0019
     * @tc.desc      RegExp negated digit range [^0-9] matches single char 'x'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpCharset0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re19: RegExp = new RegExp('[^0-9]');
      const result19: boolean = re19.test("x");
      expect(result19).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATE_REGEXP_CHARSET_2000
     * @tc.name      testRegExpCharset0020
     * @tc.desc      RegExp negated digit range [^0-9] does not match single char '5'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpCharset0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re20: RegExp = new RegExp('[^0-9]');
      const result20: boolean = re20.test("5");
      expect(result20).assertFalse();
    });

    /**
     * @tc.number    SUB_BASEDATE_REGEXP_CHARSET_2100
     * @tc.name      testRegExpCharset0021
     * @tc.desc      RegExp multi-range charset [a-cx-z] matches single char 'b'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpCharset0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re21: RegExp = new RegExp('[a-cx-z]');
      const result21: boolean = re21.test("b");
      expect(result21).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATE_REGEXP_CHARSET_2200
     * @tc.name      testRegExpCharset0022
     * @tc.desc      RegExp multi-range charset [a-cx-z] does not match single char 'd'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpCharset0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re22: RegExp = new RegExp('[a-cx-z]');
      const result22: boolean = re22.test("d");
      expect(result22).assertFalse();
    });

    /**
     * @tc.number    SUB_BASEDATE_REGEXP_CHARSET_2300
     * @tc.name      testRegExpCharset0023
     * @tc.desc      RegExp multi-range charset [a-cx-z] matches single char 'y'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpCharset0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re23: RegExp = new RegExp('[a-cx-z]');
      const result23: boolean = re23.test("y");
      expect(result23).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATE_REGEXP_CHARSET_2400
     * @tc.name      testRegExpCharset0024
     * @tc.desc      RegExp special charset [.-] matches single char '-'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpCharset0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re24: RegExp = new RegExp('[.-]');
      const result24: boolean = re24.test("-");
      expect(result24).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATE_REGEXP_CHARSET_2600
     * @tc.name      testRegExpCharset0026
     * @tc.desc      RegExp lowercase range [a-z] matches literal hyphen '-'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpCharset0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re26: RegExp = new RegExp('[a-z]');
      const result26: boolean = re26.test("-");
      expect(result26).assertFalse();
    });

    /**
     * @tc.number    SUB_BASEDATE_REGEXP_CHARSET_2700
     * @tc.name      testRegExpCharset0027
     * @tc.desc      RegExp lowercase range [a-z] matches single char 'b'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpCharset0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re27: RegExp = new RegExp('[a-z]');
      const result27: boolean = re27.test("b");
      expect(result27).assertTrue();
    });
    /**
     * @tc.number    SUB_BASEDATE_REGEXP_CHARSET_2800
     * @tc.name      testRegExpCharset0028
     * @tc.desc      RegExp negated charset [^abc] matches literal caret '^'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpCharset0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re28: RegExp = new RegExp('[^abc]');
      const result28: boolean = re28.test("^");
      expect(result28).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATE_REGEXP_CHARSET_2900
     * @tc.name      testRegExpCharset0029
     * @tc.desc      RegExp charset [abc]] matches literal closing bracket ']'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpCharset0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re29: RegExp = new RegExp('[abc]]');
      const result29: boolean = re29.test("]");
      expect(result29).assertFalse();
    });

    /**
     * @tc.number    SUB_BASEDATE_REGEXP_CHARSET_3000
     * @tc.name      testRegExpCharset0030
     * @tc.desc      RegExp charset [[abc]] matches literal opening bracket '['
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpCharset0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re30: RegExp = new RegExp('[[abc]]');
      const result30: boolean = re30.test("[");
      expect(result30).assertFalse();
    });

    /**
     * @tc.number    SUB_BASEDATE_REGEXP_CHARSET_3100
     * @tc.name      testRegExpCharset0031
     * @tc.desc      RegExp hex charset [0-9a-fA-F] matches single char 'a'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpCharset0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re31: RegExp = new RegExp('[0-9a-fA-F]');
      const result31: boolean = re31.test("a");
      expect(result31).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATE_REGEXP_CHARSET_3200
     * @tc.name      testRegExpCharset0032
     * @tc.desc      RegExp hex charset [0-9a-fA-F] does not match single char 'G'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpCharset0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re32: RegExp = new RegExp('[0-9a-fA-F]');
      const result32: boolean = re32.test("G");
      expect(result32).assertFalse();
    });

    /**
     * @tc.number    SUB_BASEDATE_REGEXP_CHARSET_3300
     * @tc.name      testRegExpCharset0033
     * @tc.desc      RegExp negated alphanumeric charset [^a-zA-Z0-9] matches single char '!'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpCharset0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re33: RegExp = new RegExp('[^a-zA-Z0-9]');
      const result33: boolean = re33.test("!");
      expect(result33).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATE_REGEXP_CHARSET_3400
     * @tc.name      testRegExpCharset0034
     * @tc.desc      RegExp negated alphanumeric charset [^a-zA-Z0-9] does not match single char 'k'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpCharset0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re34: RegExp = new RegExp('[^a-zA-Z0-9]');
      const result34: boolean = re34.test("k");
      expect(result34).assertFalse();
    });

    /**
     * @tc.number    SUB_BASEDATE_REGEXP_CHARSET_3500
     * @tc.name      testRegExpCharset0035
     * @tc.desc      RegExp accented range [à-ú] matches single char 'é'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpCharset0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re35: RegExp = new RegExp('[à-ú]');
      const result35: boolean = re35.test("é");
      expect(result35).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATE_REGEXP_CHARSET_3600
     * @tc.name      testRegExpCharset0036
     * @tc.desc      RegExp accented range [à-ú] does not match single char 'A'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpCharset0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re36: RegExp = new RegExp('[à-ú]');
      const result36: boolean = re36.test("A");
      expect(result36).assertFalse();
    });

    /**
     * @tc.number    SUB_BASEDATE_REGEXP_CHARSET_3700
     * @tc.name      testRegExpCharset0037
     * @tc.desc      RegExp charset [abc] repeated exactly 2 times matches string "ab"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpCharset0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re37: RegExp = new RegExp('[abc]{2}');
      const result37: boolean = re37.test("ab");
      expect(result37).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATE_REGEXP_CHARSET_3800
     * @tc.name      testRegExpCharset0038
     * @tc.desc      RegExp charset [abc] repeated exactly 2 times does not match string "a"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpCharset0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re38: RegExp = new RegExp('[abc]{2}');
      const result38: boolean = re38.test("a");
      expect(result38).assertFalse();
    });

    /**
     * @tc.number    SUB_BASEDATE_REGEXP_CHARSET_3900
     * @tc.name      testRegExpCharset0039
     * @tc.desc      RegExp digit range [0-9] repeated 3 to 5 times matches string "1234"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpCharset0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re39: RegExp = new RegExp('[0-9]{3,5}');
      const result39: boolean = re39.test("1234");
      expect(result39).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATE_REGEXP_CHARSET_4000
     * @tc.name      testRegExpCharset0040
     * @tc.desc      RegExp digit range [0-9] repeated 3 to 5 times does not match string "12"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpCharset0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re40: RegExp = new RegExp('[0-9]{3,5}');
      const result40: boolean = re40.test("12");
      expect(result40).assertFalse();
    });

    /**
     * @tc.number    SUB_BASEDATE_REGEXP_CHARSET_4100
     * @tc.name      testRegExpCharset0041
     * @tc.desc      RegExp lowercase range [a-z]+ matches string "hello"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpCharset0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re41: RegExp = new RegExp('[a-z]+');
      const result41: boolean = re41.test("hello");
      expect(result41).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATE_REGEXP_CHARSET_4200
     * @tc.name      testRegExpCharset0042
     * @tc.desc      RegExp lowercase range [a-z]+ does not match empty string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpCharset0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re42: RegExp = new RegExp('[a-z]+');
      const result42: boolean = re42.test("");
      expect(result42).assertFalse();
    });

    /**
     * @tc.number    SUB_BASEDATE_REGEXP_CHARSET_4300
     * @tc.name      testRegExpCharset0043
     * @tc.desc      RegExp uppercase range [A-Z]* matches empty string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpCharset0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re43: RegExp = new RegExp('[A-Z]*');
      const result43: boolean = re43.test("");
      expect(result43).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATE_REGEXP_CHARSET_4400
     * @tc.name      testRegExpCharset0044
     * @tc.desc      RegExp uppercase range [A-Z]* matches string "ABC"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpCharset0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re44: RegExp = new RegExp('[A-Z]*');
      const result44: boolean = re44.test("ABC");
      expect(result44).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATE_REGEXP_CHARSET_4500
     * @tc.name      testRegExpCharset0045
     * @tc.desc      RegExp digit range [0-9]? matches single char '5'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpCharset0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re45: RegExp = new RegExp('[0-9]?');
      const result45: boolean = re45.test("5");
      expect(result45).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATE_REGEXP_CHARSET_4600
     * @tc.name      testRegExpCharset0046
     * @tc.desc      RegExp digit range [0-9]? matches empty string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpCharset0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re46: RegExp = new RegExp('[0-9]?');
      const result46: boolean = re46.test("");
      expect(result46).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATE_REGEXP_CHARSET_4700
     * @tc.name      testRegExpCharset0047
     * @tc.desc      RegExp digit range [0-9]? partially matches string "12"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpCharset0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re47: RegExp = new RegExp('[0-9]?');
      const result47: boolean = re47.test("12");
      expect(result47).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATE_REGEXP_CHARSET_4800
     * @tc.name      testRegExpCharset0048
     * @tc.desc      RegExp start-anchor ^[abc] matches string "apple"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpCharset0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re48: RegExp = new RegExp('^[abc]');
      const result48: boolean = re48.test("apple");
      expect(result48).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATE_REGEXP_CHARSET_4900
     * @tc.name      testRegExpCharset0049
     * @tc.desc      RegExp start-anchor ^[abc] matches string "banana"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpCharset0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re49: RegExp = new RegExp('^[abc]');
      const result49: boolean = re49.test("banana");
      expect(result49).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATE_REGEXP_CHARSET_5000
     * @tc.name      testRegExpCharset0050
     * @tc.desc      RegExp start-anchor ^[abc] matches string "cherry"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpCharset0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re50: RegExp = new RegExp('^[abc]');
      const result50: boolean = re50.test("cherry");
      expect(result50).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATE_REGEXP_CHARSET_5100
     * @tc.name      testRegExpCharset0051
     * @tc.desc      RegExp start-anchor ^[abc] does not match string "date"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpCharset0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re51: RegExp = new RegExp('^[abc]');
      const result51: boolean = re51.test("date");
      expect(result51).assertFalse();
    });

    /**
     * @tc.number    SUB_BASEDATE_REGEXP_CHARSET_5200
     * @tc.name      testRegExpCharset0052
     * @tc.desc      RegExp end-anchor [abc]$ matches string "grape"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpCharset0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re52: RegExp = new RegExp('[abc]$');
      const result52: boolean = re52.test("grape");
      expect(result52).assertFalse();
    });

    /**
     * @tc.number    SUB_BASEDATE_REGEXP_CHARSET_5300
     * @tc.name      testRegExpCharset0053
     * @tc.desc      RegExp end-anchor [abc]$ matches string "cabbage"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpCharset0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re53: RegExp = new RegExp('[abc]$');
      const result53: boolean = re53.test("cabbage");
      expect(result53).assertFalse();
    });

    /**
     * @tc.number    SUB_BASEDATE_REGEXP_CHARSET_5400
     * @tc.name      testRegExpCharset0054
     * @tc.desc      RegExp end-anchor [abc]$ does not match string "berry"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpCharset0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re54: RegExp = new RegExp('[abc]$');
      const result54: boolean = re54.test("berry");
      expect(result54).assertFalse();
    });

    /**
     * @tc.number    SUB_BASEDATE_REGEXP_CHARSET_5500
     * @tc.name      testRegExpCharset0055
     * @tc.desc      RegExp word-boundary then charset \b[abc] matches string " apple"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpCharset0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re55: RegExp = new RegExp('\\b[abc]');
      const result55: boolean = re55.test("apple");
      expect(result55).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATE_REGEXP_CHARSET_5600
     * @tc.name      testRegExpCharset0056
     * @tc.desc      RegExp word-boundary then charset \b[abc] does not match string "xapple"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpCharset0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re56: RegExp = new RegExp('\\b[abc]');
      const result56: boolean = re56.test("xapple");
      expect(result56).assertFalse();
    });

    /**
     * @tc.number    SUB_BASEDATE_REGEXP_CHARSET_5700
     * @tc.name      testRegExpCharset0057
     * @tc.desc      RegExp charset then word-boundary [abc]\b matches string "app "
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpCharset0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re57: RegExp = new RegExp('[abc]\\b');
      const result57: boolean = re57.test("app");
      expect(result57).assertFalse();
    });

    /**
     * @tc.number    SUB_BASEDATE_REGEXP_CHARSET_5800
     * @tc.name      testRegExpCharset0058
     * @tc.desc      RegExp charset then word-boundary [abc]\b does not match string "apple"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpCharset0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re58: RegExp = new RegExp('[abc]\\b');
      const result58: boolean = re58.test("apple");
      expect(result58).assertFalse();
    });

    /**
     * @tc.number    SUB_BASEDATE_REGEXP_CHARSET_5900
     * @tc.name      testRegExpCharset0059
     * @tc.desc      RegExp intersection charset [a-m&&[f-z]] matches single char 'k'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpCharset0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re59: RegExp = new RegExp('[a-m&&[f-z]]');
      const result59: boolean = re59.test("k");
      expect(result59).assertFalse();
    });

    /**
     * @tc.number    SUB_BASEDATE_REGEXP_CHARSET_6000
     * @tc.name      testRegExpCharset0060
     * @tc.desc      RegExp intersection charset [a-m&&[f-z]] does not match single char 'e'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpCharset0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re60: RegExp = new RegExp('[a-m&&[f-z]]');
      const result60: boolean = re60.test("e");
      expect(result60).assertFalse();
    });

    /**
     * @tc.number    SUB_BASEDATE_REGEXP_CHARSET_6100
     * @tc.name      testRegExpCharset0061
     * @tc.desc      RegExp lowercase minus vowels [a-z&&[^aeiou]] matches 'b'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpCharset0061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re61: RegExp = new RegExp('[a-z&&[^aeiou]]');
      const result61: boolean = re61.test("b");
      expect(result61).assertFalse();
    });

    /**
     * @tc.number    SUB_BASEDATE_REGEXP_CHARSET_6200
     * @tc.name      testRegExpCharset0062
     * @tc.desc      RegExp lowercase minus vowels [a-z&&[^aeiou]] does not match 'a'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpCharset0062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re62: RegExp = new RegExp('[a-z&&[^aeiou]]');
      const result62: boolean = re62.test("a");
      expect(result62).assertFalse();
    });

    /**
     * @tc.number    SUB_BASEDATE_REGEXP_CHARSET_6300
     * @tc.name      testRegExpCharset0063
     * @tc.desc      RegExp CJK unified ideographs [\u4e00-\u9fa5] matches '中'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpCharset0063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re63: RegExp = new RegExp('[\\u4e00-\\u9fa5]');
      const result63: boolean = re63.test("中");
      expect(result63).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATE_REGEXP_CHARSET_6400
     * @tc.name      testRegExpCharset0064
     * @tc.desc      RegExp CJK unified ideographs [\u4e00-\u9fa5] does not match 'a'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpCharset0064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re64: RegExp = new RegExp('[\\u4e00-\\u9fa5]');
      const result64: boolean = re64.test("a");
      expect(result64).assertFalse();
    });

    /**
     * @tc.number    SUB_BASEDATE_REGEXP_CHARSET_6500
     * @tc.name      testRegExpCharset0065
     * @tc.desc      RegExp underscore-inclusive charset [0-9a-zA-Z_] matches empty string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpCharset0065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re65: RegExp = new RegExp('[0-9a-zA-Z_]');
      const result65: boolean = re65.test("");
      expect(result65).assertFalse();
    });

    /**
     * @tc.number    SUB_BASEDATE_REGEXP_CHARSET_6600
     * @tc.name      testRegExpCharset0066
     * @tc.desc      RegExp underscore-inclusive charset [0-9a-zA-Z_] does not match '-'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpCharset0066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re66: RegExp = new RegExp('[0-9a-zA-Z_]');
      const result66: boolean = re66.test("-");
      expect(result66).assertFalse();
    });

    /**
     * @tc.number    SUB_BASEDATE_REGEXP_CHARSET_6700
     * @tc.name      testRegExpCharset0067
     * @tc.desc      RegExp whitespace charset [\t\n] matches space char
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpCharset0067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re67: RegExp = new RegExp('[\\t\\n]');
      const result67: boolean = re67.test(" ");
      expect(result67).assertFalse();
    });
    /**
     * @tc.number    SUB_BASEDATE_REGEXP_CHARSET_6800
     * @tc.name      testRegExpCharset0068
     * @tc.desc      RegExp whitespace charset [\t\n] matches tab char
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpCharset0068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re68: RegExp = new RegExp('[\\t\\n]');
      const result68: boolean = re68.test("\t");
      expect(result68).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATE_REGEXP_CHARSET_6900
     * @tc.name      testRegExpCharset0069
     * @tc.desc      RegExp whitespace charset [\t\n] matches newline char
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpCharset0069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re69: RegExp = new RegExp('[\\t\\n]');
      const result69: boolean = re69.test("\n");
      expect(result69).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATE_REGEXP_CHARSET_7000
     * @tc.name      testRegExpCharset0070
     * @tc.desc      RegExp whitespace charset [\t\n] does not match 'a'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpCharset0070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re70: RegExp = new RegExp('[\\t\\n]');
      const result70: boolean = re70.test("a");
      expect(result70).assertFalse();
    });

    /**
     * @tc.number    SUB_BASEDATE_REGEXP_CHARSET_7100
     * @tc.name      testRegExpCharset0071
     * @tc.desc      RegExp non-continuous digit range [1-35-7] does not match '4'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpCharset0071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re71: RegExp = new RegExp('[1-35-7]');
      const result71: boolean = re71.test("4");
      expect(result71).assertFalse();
    });

    /**
     * @tc.number    SUB_BASEDATE_REGEXP_CHARSET_7200
     * @tc.name      testRegExpCharset0072
     * @tc.desc      RegExp non-continuous digit range [1-35-7] matches '6'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpCharset0072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re72: RegExp = new RegExp('[1-35-7]');
      const result72: boolean = re72.test("6");
      expect(result72).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATE_REGEXP_CHARSET_7300
     * @tc.name      testRegExpCharset0073
     * @tc.desc      RegExp non-continuous letter range [a-bd-f] does not match 'c'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpCharset0073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re73: RegExp = new RegExp('[a-bd-f]');
      const result73: boolean = re73.test("c");
      expect(result73).assertFalse();
    });

    /**
     * @tc.number    SUB_BASEDATE_REGEXP_CHARSET_7400
     * @tc.name      testRegExpCharset0074
     * @tc.desc      RegExp non-continuous letter range [a-bd-f] matches 'e'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpCharset0074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re74: RegExp = new RegExp('[a-bd-f]');
      const result74: boolean = re74.test("e");
      expect(result74).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATE_REGEXP_CHARSET_7500
     * @tc.name      testRegExpCharset0075
     * @tc.desc      RegExp global charset [abc]+ matches entire "abcabc"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpCharset0075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re75: RegExp = new RegExp('[abc]+', 'g');
      const result75 = "abcabc".match(re75) ;
      expect(result75?.length).assertEqual(1);
      expect(result75?.[0]).assertEqual("abcabc");
    });

    /**
     * @tc.number    SUB_BASEDATE_REGEXP_CHARSET_7600
     * @tc.name      testRegExpCharset0076
     * @tc.desc      RegExp global charset [abc] finds 6 single-char matches in "abc123abc"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpCharset0076", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re76: RegExp = new RegExp('[abc]', 'g');
      const result76 = "abc123abc".match(re76);
      expect(result76?.length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_BASEDATE_REGEXP_CHARSET_7700
     * @tc.name      testRegExpCharset0077
     * @tc.desc      RegExp case-insensitive charset [A-Z] matches lowercase 'a'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpCharset0077", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re77: RegExp = new RegExp('[A-Z]', 'i');
      const result77: boolean = re77.test("a");
      expect(result77).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATE_REGEXP_CHARSET_7800
     * @tc.name      testRegExpCharset0078
     * @tc.desc      RegExp case-insensitive charset [a-z] matches uppercase 'A'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpCharset0078", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re78: RegExp = new RegExp('[a-z]', 'i');
      const result78: boolean = re78.test("A");
      expect(result78).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATE_REGEXP_CHARSET_7900
     * @tc.name      testRegExpCharset0079
     * @tc.desc      RegExp charset sequence [0-9][a-z] matches string "3a"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpCharset0079", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re79: RegExp = new RegExp('[0-9][a-z]');
      const result79: boolean = re79.test("3a");
      expect(result79).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATE_REGEXP_CHARSET_8000
     * @tc.name      testRegExpCharset0080
     * @tc.desc      RegExp charset sequence [0-9][a-z] does not match string "a3"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpCharset0080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re80: RegExp = new RegExp('[0-9][a-z]');
      const result80: boolean = re80.test("a3");
      expect(result80).assertFalse();
    });

    /**
     * @tc.number    SUB_BASEDATE_REGEXP_CHARSET_8100
     * @tc.name      testRegExpCharset0081
     * @tc.desc      RegExp negated digit \D shorthand [^\d] matches 'a'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpCharset0081", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re81: RegExp = new RegExp('[^\\d]');
      const result81: boolean = re81.test("a");
      expect(result81).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATE_REGEXP_CHARSET_8200
     * @tc.name      testRegExpCharset0082
     * @tc.desc      RegExp double-negated digit \d [^\D] matches '5'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpCharset0082", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re82: RegExp = new RegExp('[^\\D]');
      const result82: boolean = re82.test("5");
      expect(result82).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATE_REGEXP_CHARSET_8300
     * @tc.name      testRegExpCharset0083
     * @tc.desc      RegExp negated word shorthand [^\w] matches '!'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpCharset0083", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re83: RegExp = new RegExp('[^\\w]');
      const result83: boolean = re83.test("!");
      expect(result83).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATE_REGEXP_CHARSET_8400
     * @tc.name      testRegExpCharset0084
     * @tc.desc      RegExp double-negated word [^\W] matches 'a'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpCharset0084", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re84: RegExp = new RegExp('[^\\W]');
      const result84: boolean = re84.test("a");
      expect(result84).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATE_REGEXP_CHARSET_8500
     * @tc.name      testRegExpCharset0085
     * @tc.desc      RegExp negated whitespace [^\s] matches 'a'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpCharset0085", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re85: RegExp = new RegExp('[^\\s]');
      const result85: boolean = re85.test("a");
      expect(result85).assertTrue();
    });
    /**
     * @tc.number    SUB_BASEDATE_REGEXP_CHARSET_8600
     * @tc.name      testRegExpCharset0086
     * @tc.desc      RegExp double-negated whitespace [^\S] matches space
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpCharset0086", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re86: RegExp = new RegExp('[^\\S]');
      const result86: boolean = re86.test(" ");
      expect(result86).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATE_REGEXP_CHARSET_8700
     * @tc.name      testRegExpCharset0087
     * @tc.desc      RegExp any character via [\d\D] matches any char
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpCharset0087", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re87: RegExp = new RegExp('[\\d\\D]');
      const result87: boolean = re87.test("任何字符");
      expect(result87).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATE_REGEXP_CHARSET_8800
     * @tc.name      testRegExpCharset0088
     * @tc.desc      RegExp any character via [\w\W] matches '!'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpCharset0088", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re88: RegExp = new RegExp('[\\w\\W]');
      const result88: boolean = re88.test("!");
      expect(result88).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATE_REGEXP_CHARSET_8900
     * @tc.name      testRegExpCharset0089
     * @tc.desc      RegExp lowercase range {2,} matches "ab"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpCharset0089", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re89: RegExp = new RegExp('[a-z]{2,}');
      const result89: boolean = re89.test("ab");
      expect(result89).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATE_REGEXP_CHARSET_9000
     * @tc.name      testRegExpCharset0090
     * @tc.desc      RegExp digit range [1-5] matches single char '3'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpCharset0090", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re90: RegExp = new RegExp('[A-Z]{2,}');
      const result90: boolean = re90.test("A");
      expect(result90).assertFalse();
    });

    /**
     * @tc.number    SUB_BASEDATE_REGEXP_CHARSET_9100
     * @tc.name      testRegExpCharset0091
     * @tc.desc      RegExp digit range {1,3} partially matches "1234"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpCharset0091", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re91: RegExp = new RegExp('[0-9]{1,3}');
      const result91: boolean = re91.test("1234");
      expect(result91).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATE_REGEXP_CHARSET_9200
     * @tc.name      testRegExpCharset0092
     * @tc.desc      RegExp full-string digit range {1,3} does not match "1234"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpCharset0092", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re92: RegExp = new RegExp('^[0-9]{1,3}$');
      const result92: boolean = re92.test("1234");
      expect(result92).assertFalse();
    });

    /**
     * @tc.number    SUB_BASEDATE_REGEXP_CHARSET_9300
     * @tc.name      testRegExpCharset0093
     * @tc.desc      RegExp charset sequence [a-c]+[x-z]+ matches "abxyz"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpCharset0093", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re93: RegExp = new RegExp('[a-c]+[x-z]+');
      const result93: boolean = re93.test("abxyz");
      expect(result93).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATE_REGEXP_CHARSET_9400
     * @tc.name      testRegExpCharset0094
     * @tc.desc      RegExp charset sequence [a-c]+[x-z]+ does not match "axbycz"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpCharset0094", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re94: RegExp = new RegExp('[a-c]+[x-z]+');
      const result94: boolean = re94.test("axbycz");
      expect(result94).assertTrue();
    });
  })
}