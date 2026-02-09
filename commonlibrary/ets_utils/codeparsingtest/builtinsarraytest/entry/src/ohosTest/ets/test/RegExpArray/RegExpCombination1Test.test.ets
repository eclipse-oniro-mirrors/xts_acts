/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import * as RegExpCombination1 from './RegExpCombiNation1.test';

function sleep(time: number): Promise<void> {
  return new Promise((re, je) => {
    setTimeout(() => {
      re();
    }, time);
  });
}

export default function RegExpCombination1Test() {
  describe('RegExpCombination1Test', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
       await sleep(30);
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
     * @tc.name   RegExpCombination1Test001
     * @tc.number BUILTINS_REGEXP_COMBINATION_TEST0100
     * @tc.desc   Test Method Combination in RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegExpCombination1Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re1 = /a/g;
      const str1 = "aa";
      let execResult1 = re1.exec(str1);
      expect(execResult1?.index).assertEqual(0);
      expect(re1.lastIndex).assertEqual(1);
      let execResult2 = re1.exec(str1);
      expect(execResult2?.index).assertEqual(1);
      expect(re1.lastIndex).assertEqual(2);
      let execResult3 = re1.exec(str1);
      expect(execResult3).assertNull();
      expect(re1.lastIndex).assertEqual(0);
    });

    /**
     * @tc.name   RegExpCombination1Test002
     * @tc.number BUILTINS_REGEXP_COMBINATION_TEST0200
     * @tc.desc   Test Method Combination in RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegExpCombination1Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re2 = /b/;
      const str2 = "bb";
      let matchResult1 = str2.match(re2);
      expect(matchResult1?.index).assertEqual(0);
      expect(re2.lastIndex).assertEqual(0);
      let matchResult2 = str2.match(re2);
      expect(matchResult2?.index).assertEqual(0);
      expect(re2.lastIndex).assertEqual(0);
    });

    /**
     * @tc.name   RegExpCombination1Test003
     * @tc.number BUILTINS_REGEXP_COMBINATION_TEST0300
     * @tc.desc   Test Method Combination in RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegExpCombination1Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re3 = /c/g;
      const str3 = "ccc";
      const matches1 = str3.matchAll(re3);
      let matchAllArr1 = Array.from(matches1);
      expect(matchAllArr1.length).assertEqual(3);
      expect(matchAllArr1[0].index).assertEqual(0);
      const matches2 = str3.matchAll(re3);
      let matchAllArr2 = Array.from(matches2);
      expect(matchAllArr2.length).assertEqual(3);
      expect(matchAllArr2[1].index).assertEqual(1);
    });

    /**
     * @tc.name   RegExpCombination1Test004
     * @tc.number BUILTINS_REGEXP_COMBINATION_TEST0400
     * @tc.desc   Test Method Combination in RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegExpCombination1Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re4 = /d/g;
      const str4 = "ddd";
      let replaceResult1 = str4.replace(re4, "x");
      expect(replaceResult1).assertEqual("xxx");
      expect(re4.lastIndex).assertEqual(0);
      let replaceResult2 = str4.replace(re4, "y");
      expect(replaceResult2).assertEqual("yyy");
      expect(re4.lastIndex).assertEqual(0);
    });

    /**
     * @tc.name   RegExpCombination1Test005
     * @tc.number BUILTINS_REGEXP_COMBINATION_TEST0500
     * @tc.desc   Test Method Combination in RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegExpCombination1Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re5 = /e/g;
      const str5 = "fee";
      let searchIndex1 = str5.search(re5);
      expect(searchIndex1).assertEqual(1);
      expect(re5.lastIndex).assertEqual(0);
      let searchIndex2 = str5.search(re5);
      expect(searchIndex2).assertEqual(1);
      expect(re5.lastIndex).assertEqual(0);
    });

    /**
     * @tc.name   RegExpCombination1Test006
     * @tc.number BUILTINS_REGEXP_COMBINATION_TEST0600
     * @tc.desc   Test Method Combination in RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegExpCombination1Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re6 = /,/g;
      const str6 = "a,b,c,d";
      let splitArr1 = str6.split(re6);
      expect(splitArr1).assertDeepEquals(["a", "b", "c", "d"]);
      expect(re6.lastIndex).assertEqual(0);
      let splitArr2 = str6.split(re6);
      expect(splitArr2).assertDeepEquals(["a", "b", "c", "d"]);
    });

    /**
     * @tc.name   RegExpCombination1Test007
     * @tc.number BUILTINS_REGEXP_COMBINATION_TEST0700
     * @tc.desc   Test Method Combination in RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegExpCombination1Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re7 = /f/g;
      const str7 = "fff";
      let exec7_1 = re7.exec(str7);
      expect(exec7_1?.index).assertEqual(0);
      expect(re7.lastIndex).assertEqual(1);
      let test7_1 = re7.test(str7);
      expect(test7_1).assertTrue();
      expect(re7.lastIndex).assertEqual(2);
      let exec7_2 = re7.exec(str7);
      expect(exec7_2?.index).assertEqual(2);
      expect(re7.lastIndex).assertEqual(3);
      let test7_2 = re7.test(str7);
      expect(test7_2).assertFalse();
      expect(re7.lastIndex).assertEqual(0);
    });

    /**
     * @tc.name   RegExpCombination1Test008
     * @tc.number BUILTINS_REGEXP_COMBINATION_TEST0800
     * @tc.desc   Test Method Combination in RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegExpCombination1Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re8 = /g/g;
      const str8 = "gg";
      let exec8_1 = re8.exec(str8);
      expect(exec8_1?.index).assertEqual(0);
      expect(re8.lastIndex).assertEqual(1);
      let match8_1 = str8.match(re8);
      expect(match8_1).assertDeepEquals(["g", "g"]);
      expect(re8.lastIndex).assertEqual(0);
      let exec8_2 = re8.exec(str8);
      expect(exec8_2?.index).assertEqual(0);
      expect(re8.lastIndex).assertEqual(1);
    });

    /**
     * @tc.name   RegExpCombination1Test009
     * @tc.number BUILTINS_REGEXP_COMBINATION_TEST0900
     * @tc.desc   Test Method Combination in RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegExpCombination1Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re9 = /(\d)/g;
      const str9 = "123";
      let replaceCount = 0;
      let replace9_1 = str9.replace(re9, () => {
        replaceCount++;
        return "#";
      });
      expect(replace9_1).assertEqual("###");
      expect(replaceCount).assertEqual(3);
      expect(re9.lastIndex).assertEqual(0);
      replaceCount = 0;
      let replace9_2 = str9.replace(re9, () => {
        replaceCount++;
        return "$";
      });
      expect(replace9_2).assertEqual("$$$");
      expect(replaceCount).assertEqual(3);
    });

    /**
     * @tc.name   RegExpCombination1Test010
     * @tc.number BUILTINS_REGEXP_COMBINATION_TEST1000
     * @tc.desc   Test Method Combination in RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegExpCombination1Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re10 = /h/g;
      const str10 = "hhh";
      let split10_1 = str10.split(re10);
      expect(split10_1).assertDeepEquals(["", "", "", ""]);
      expect(re10.lastIndex).assertEqual(0);
      let exec10_1 = re10.exec(str10);
      expect(exec10_1?.index).assertEqual(0);
      expect(re10.lastIndex).assertEqual(1);
      let split10_2 = str10.split(re10);
      expect(split10_2).assertDeepEquals(["", "", "", ""]);
      expect(re10.lastIndex).assertEqual(1);
      let exec10_2 = re10.exec(str10);
      expect(exec10_2?.index).assertEqual(1);
      expect(re10.lastIndex).assertEqual(2);
    });

    /**
     * @tc.name   RegExpCombination1Test011
     * @tc.number BUILTINS_REGEXP_COMBINATION_TEST1100
     * @tc.desc   Test Method Combination in RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegExpCombination1Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re11 = /(x)(y)/g;
      const str11 = "xyxy";
      let exec11_1 = re11.exec(str11);
      expect(exec11_1?.[0]).assertEqual("xy");
      expect(exec11_1?.[1]).assertEqual("x");
      expect(re11.lastIndex).assertEqual(2);
      let exec11_2 = re11.exec(str11);
      expect(exec11_2?.[0]).assertEqual("xy");
      expect(exec11_2?.index).assertEqual(2);
      expect(re11.lastIndex).assertEqual(4);
      let exec11_3 = re11.exec(str11);
      expect(exec11_3).assertNull();
      expect(re11.lastIndex).assertEqual(0);
    });

    /**
     * @tc.name   RegExpCombination1Test012
     * @tc.number BUILTINS_REGEXP_COMBINATION_TEST1200
     * @tc.desc   Test Method Combination in RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegExpCombination1Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re12 = /(\d)(\w)/;
      const str12 = "3a5b";
      let match12_1 = str12.match(re12);
      expect(match12_1?.[0]).assertEqual("3a");
      expect(match12_1?.[2]).assertEqual("a");
      expect(re12.lastIndex).assertEqual(0);
      let match12_2 = str12.match(re12);
      expect(match12_2?.index).assertEqual(0);
      expect(re12.lastIndex).assertEqual(0);
    });

    /**
     * @tc.name   RegExpCombination1Test013
     * @tc.number BUILTINS_REGEXP_COMBINATION_TEST1300
     * @tc.desc   Test Method Combination in RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegExpCombination1Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re13 = /z/g;
      const str13 = "zzz";
      const matches13_1 = str13.matchAll(re13);
      expect(Array.from(matches13_1).length).assertEqual(3);
      let exec13_1 = re13.exec(str13);
      expect(exec13_1?.index).assertEqual(0);
      expect(re13.lastIndex).assertEqual(1);
      const matches13_2 = str13.matchAll(re13);
      expect(Array.from(matches13_2).length).assertEqual(2);
    });

    /**
     * @tc.name   RegExpCombination1Test014
     * @tc.number BUILTINS_REGEXP_COMBINATION_TEST1400
     * @tc.desc   Test Method Combination in RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegExpCombination1Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re14 = /p/;
      const str14 = "ppp";
      let replace14_1 = str14.replace(re14, "q");
      expect(replace14_1).assertEqual("qpp");
      expect(re14.lastIndex).assertEqual(0);
      let replace14_2 = str14.replace(re14, "q");
      expect(replace14_2).assertEqual("qpp");
    });

    /**
     * @tc.name   RegExpCombination1Test015
     * @tc.number BUILTINS_REGEXP_COMBINATION_TEST1500
     * @tc.desc   Test Method Combination in RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegExpCombination1Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re15 = /r/g;
      const str15 = "rr";
      let test15_1 = re15.test(str15);
      expect(test15_1).assertTrue();
      expect(re15.lastIndex).assertEqual(1);
      let match15_1 = str15.match(re15);
      expect(match15_1).assertDeepEquals(["r", "r"]);
      expect(re15.lastIndex).assertEqual(0);
      let test15_2 = re15.test(str15);
      expect(test15_2).assertTrue();
      expect(re15.lastIndex).assertEqual(1);
    });

    /**
     * @tc.name   RegExpCombination1Test016
     * @tc.number BUILTINS_REGEXP_COMBINATION_TEST1600
     * @tc.desc   Test Method Combination in RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegExpCombination1Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re16 = /^a/g;
      const str16 = "aa";
      let exec16_1 = re16.exec(str16);
      expect(exec16_1?.index).assertEqual(0);
      expect(re16.lastIndex).assertEqual(1);
      let exec16_2 = re16.exec(str16);
      expect(exec16_2).assertNull();
      expect(re16.lastIndex).assertEqual(0);
    });

    /**
     * @tc.name   RegExpCombination1Test017
     * @tc.number BUILTINS_REGEXP_COMBINATION_TEST1700
     * @tc.desc   Test Method Combination in RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegExpCombination1Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re17 = /b$/g;
      const str17 = "bb";
      let test17_1 = re17.test(str17);
      expect(test17_1).assertTrue();
      expect(re17.lastIndex).assertEqual(2);
      let test17_2 = re17.test(str17);
      expect(test17_2).assertFalse();
      expect(re17.lastIndex).assertEqual(0);
    });

    /**
     * @tc.name   RegExpCombination1Test018
     * @tc.number BUILTINS_REGEXP_COMBINATION_TEST1800
     * @tc.desc   Test Method Combination in RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegExpCombination1Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re18 = /,/;
      const str18 = "x,y,z";
      let split18_1 = str18.split(re18);
      expect(split18_1).assertDeepEquals(["x", "y", "z"]);
      let split18_2 = str18.split(re18);
      expect(split18_2).assertDeepEquals(["x", "y", "z"]);
      expect(re18.lastIndex).assertEqual(0);
    });

    /**
     * @tc.name   RegExpCombination1Test019
     * @tc.number BUILTINS_REGEXP_COMBINATION_TEST1900
     * @tc.desc   Test Method Combination in RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegExpCombination1Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re19 = /c/g;
      const str19 = "cccc";
      re19.lastIndex = 2;
      let exec19_1 = re19.exec(str19);
      expect(exec19_1?.index).assertEqual(2);
      expect(re19.lastIndex).assertEqual(3);
      re19.lastIndex = 0;
      let exec19_2 = re19.exec(str19);
      expect(exec19_2?.index).assertEqual(0);
    });

    /**
     * @tc.name   RegExpCombination1Test020
     * @tc.number BUILTINS_REGEXP_COMBINATION_TEST2000
     * @tc.desc   Test Method Combination in RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegExpCombination1Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re20a = /d/g;
      const re20b = /d/g;
      const str20 = "dd";
      re20a.exec(str20);
      expect(re20a.lastIndex).assertEqual(1);
      expect(re20b.lastIndex).assertEqual(0);
      re20b.exec(str20);
      expect(re20b.lastIndex).assertEqual(1);
      expect(re20a.lastIndex).assertEqual(1);
    });

    /**
     * @tc.name   RegExpCombination1Test021
     * @tc.number BUILTINS_REGEXP_COMBINATION_TEST2100
     * @tc.desc   Test Method Combination in RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegExpCombination1Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re21 = /e/g;
      const str21 = "e-e-e";
      const matches21_1 = str21.matchAll(re21);
      let split21_1 = str21.split(re21);
      expect(split21_1).assertDeepEquals(["", "-", "-", ""]);
      expect(Array.from(matches21_1).length).assertEqual(3);
    });

    /**
     * @tc.name   RegExpCombination1Test022
     * @tc.number BUILTINS_REGEXP_COMBINATION_TEST2200
     * @tc.desc   Test Method Combination in RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegExpCombination1Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re22 = /f+/g;
      const str22 = "fffofff";
      let exec22_1 = re22.exec(str22);
      expect(exec22_1?.[0]).assertEqual("fff");
      expect(re22.lastIndex).assertEqual(3);
      let exec22_2 = re22.exec(str22);
      expect(exec22_2?.[0]).assertEqual("fff");
      expect(exec22_2?.index).assertEqual(4);
      expect(re22.lastIndex).assertEqual(7);
    });

    /**
     * @tc.name   RegExpCombination1Test023
     * @tc.number BUILTINS_REGEXP_COMBINATION_TEST2300
     * @tc.desc   Test Method Combination in RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegExpCombination1Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re23 = /\d/g;
      const str23 = "12";
      let count23 = 0;
      let replace23_1 = str23.replace(re23, () => (count23++).toString());
      expect(replace23_1).assertEqual("01");
      count23 = 0;
      let replace23_2 = str23.replace(re23, () => (count23++).toString());
      expect(replace23_2).assertEqual("01");
    });

    /**
     * @tc.name   RegExpCombination1Test024
     * @tc.number BUILTINS_REGEXP_COMBINATION_TEST2400
     * @tc.desc   Test Method Combination in RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegExpCombination1Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re24 = /h/g;
      const str24 = "ahbh";
      let search24_1 = str24.search(re24);
      expect(search24_1).assertEqual(1);
      expect(re24.lastIndex).assertEqual(0);
      let search24_2 = str24.search(re24);
      expect(search24_2).assertEqual(1);
    });

    /**
     * @tc.name   RegExpCombination1Test025
     * @tc.number BUILTINS_REGEXP_COMBINATION_TEST2500
     * @tc.desc   Test Method Combination in RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegExpCombination1Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re25 = /(?:)/g;
      const str25 = "ab";
      let exec25_1 = re25.exec(str25);
      expect(exec25_1?.index).assertEqual(0);
      expect(re25.lastIndex).assertEqual(0);
      let exec25_2 = re25.exec(str25);
      expect(exec25_2?.index).assertEqual(0);
      expect(re25.lastIndex).assertEqual(0);
    });

    /**
     * @tc.name   RegExpCombination1Test026
     * @tc.number BUILTINS_REGEXP_COMBINATION_TEST2600
     * @tc.desc   Test Method Combination in RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegExpCombination1Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re26 = /A/gi;
      const str26 = "aAaA";
      let exec26_1 = re26.exec(str26);
      expect(exec26_1?.[0]).assertEqual("a");
      expect(re26.lastIndex).assertEqual(1);
      let exec26_2 = re26.exec(str26);
      expect(exec26_2?.[0]).assertEqual("A");
      expect(re26.lastIndex).assertEqual(2);
    });

    /**
     * @tc.name   RegExpCombination1Test027
     * @tc.number BUILTINS_REGEXP_COMBINATION_TEST2700
     * @tc.desc   Test Method Combination in RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegExpCombination1Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re27 = /B/g;
      const str27 = "BB";
      str27.match(re27);
      expect(re27.lastIndex).assertEqual(0);
      let test27_1 = re27.test(str27);
      expect(test27_1).assertTrue();
      expect(re27.lastIndex).assertEqual(1);
    });

    /**
     * @tc.name   RegExpCombination1Test028
     * @tc.number BUILTINS_REGEXP_COMBINATION_TEST2800
     * @tc.desc   Test Method Combination in RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegExpCombination1Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re28 = /\bw/g;
      const str28 = "www ww";
      let exec28_1 = re28.exec(str28);
      expect(exec28_1?.index).assertEqual(0);
      expect(re28.lastIndex).assertEqual(1);
      let exec28_2 = re28.exec(str28);
      expect(exec28_2?.index).assertEqual(4);
      expect(re28.lastIndex).assertEqual(5);

    });

    /**
     * @tc.name   RegExpCombination1Test029
     * @tc.number BUILTINS_REGEXP_COMBINATION_TEST2900
     * @tc.desc   Test Method Combination in RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegExpCombination1Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re29 = /(\-)/g;
      const str29 = "x-y-z";
      let split29_1 = str29.split(re29);
      expect(split29_1).assertDeepEquals(["x", "-", "y", "-", "z"]);
      let split29_2 = str29.split(re29);
      expect(split29_2).assertDeepEquals(["x", "-", "y", "-", "z"]);

    });

    /**
     * @tc.name   RegExpCombination1Test030
     * @tc.number BUILTINS_REGEXP_COMBINATION_TEST3000
     * @tc.desc   Test Method Combination in RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegExpCombination1Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re30 = /k/g;
      const str30 = "kkm";
      re30.exec(str30);
      re30.exec(str30);
      expect(re30.lastIndex).assertEqual(2);
      let exec30_3 = re30.exec(str30);
      expect(exec30_3).assertNull();
      expect(re30.lastIndex).assertEqual(0);
      let exec30_4 = re30.exec(str30);
      expect(exec30_4?.index).assertEqual(0);

    });

    /**
     * @tc.name   RegExpCombination1Test031
     * @tc.number BUILTINS_REGEXP_COMBINATION_TEST3100
     * @tc.desc   Test Method Combination in RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegExpCombination1Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re31 = /^l/gm;
      const str31 = "l1\nl2\nl3";
      let exec31_1 = re31.exec(str31);
      expect(exec31_1?.index).assertEqual(0);
      expect(re31.lastIndex).assertEqual(1);
      let exec31_2 = re31.exec(str31);
      expect(exec31_2?.index).assertEqual(3);
      expect(re31.lastIndex).assertEqual(4);
    });

    /**
     * @tc.name   RegExpCombination1Test032
     * @tc.number BUILTINS_REGEXP_COMBINATION_TEST3200
     * @tc.desc   Test Method Combination in RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegExpCombination1Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re32 = /m/g;
      let str32 = "mmm";
      str32 = str32.replace(re32, "n");
      expect(str32).assertEqual("nnn");
      str32 = str32.replace(re32, "o");
      expect(str32).assertEqual("nnn");
    });

    /**
     * @tc.name   RegExpCombination1Test033
     * @tc.number BUILTINS_REGEXP_COMBINATION_TEST3300
     * @tc.desc   Test Method Combination in RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegExpCombination1Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re33 = /(a)\1/g;
      const str33 = "aaa";
      let exec33_1 = re33.exec(str33);
      expect(exec33_1?.[0]).assertEqual("aa");
      expect(re33.lastIndex).assertEqual(2);
      let exec33_2 = re33.exec(str33);
      expect(exec33_2).assertNull();
      expect(re33.lastIndex).assertEqual(0);
    });

    /**
     * @tc.name   RegExpCombination1Test034
     * @tc.number BUILTINS_REGEXP_COMBINATION_TEST3400
     * @tc.desc   Test Method Combination in RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegExpCombination1Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re34 = /n/g;
      const str34 = "nn";
      const matches34 = str34.matchAll(re34);
      expect(Array.from(matches34).length).assertEqual(2);
      expect(Array.from(matches34).length).assertEqual(0);

    });

    /**
     * @tc.name   RegExpCombination1Test035
     * @tc.number BUILTINS_REGEXP_COMBINATION_TEST3500
     * @tc.desc   Test Method Combination in RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegExpCombination1Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re35 = /o/g;
      const str35 = "oo";
      re35.test(str35);
      re35.test(str35);
      expect(re35.test(str35)).assertFalse();
      expect(re35.lastIndex).assertEqual(0);
      let exec35_1 = re35.exec(str35);
      expect(exec35_1?.index).assertEqual(0);
    });

    /**
     * @tc.name   RegExpCombination1Test036
     * @tc.number BUILTINS_REGEXP_COMBINATION_TEST3600
     * @tc.desc   Test Method Combination in RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegExpCombination1Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re36 = /\u{1F600}/gu;
      const str36 = "😀😀";
      let exec36_1 = re36.exec(str36);
      expect(exec36_1?.[0]).assertEqual("😀");
      expect(re36.lastIndex).assertEqual(2);
      let exec36_2 = re36.exec(str36);
      expect(exec36_2?.index).assertEqual(2);
    });

    /**
     * @tc.name   RegExpCombination1Test037
     * @tc.number BUILTINS_REGEXP_COMBINATION_TEST3700
     * @tc.desc   Test Method Combination in RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegExpCombination1Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re37 = /(?:,)/g;
      const str37 = "a,b,c";
      let split37_1 = str37.split(re37);
      expect(split37_1).assertDeepEquals(["a", "b", "c"]);
      let split37_2 = str37.split(re37);
      expect(split37_2).assertDeepEquals(["a", "b", "c"]);
    });

    /**
     * @tc.name   RegExpCombination1Test038
     * @tc.number BUILTINS_REGEXP_COMBINATION_TEST3800
     * @tc.desc   Test Method Combination in RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegExpCombination1Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re38 = /p/g;
      const str38 = "ppp";
      const matchAllArr38 = Array.from(str38.matchAll(re38));
      let execArr38: RegExpExecArray[] = [];
      let execRes38: RegExpExecArray | null;
      while ((execRes38 = re38.exec(str38))) execArr38.push(execRes38);
      expect(execArr38.length).assertEqual(matchAllArr38.length);
      expect(execArr38[0].index).assertEqual(matchAllArr38[0].index);

    });

    /**
     * @tc.name   RegExpCombination1Test039
     * @tc.number BUILTINS_REGEXP_COMBINATION_TEST3900
     * @tc.desc   Test Method Combination in RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegExpCombination1Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re39 = /./g;
      const str39 = "!@#";
      let exec39_1 = re39.exec(str39);
      expect(exec39_1?.[0]).assertEqual("!");
      expect(re39.lastIndex).assertEqual(1);
      let exec39_2 = re39.exec(str39);
      expect(exec39_2?.[0]).assertEqual("@");
      expect(re39.lastIndex).assertEqual(2);
    });

    /**
     * @tc.name   RegExpCombination1Test040
     * @tc.number BUILTINS_REGEXP_COMBINATION_TEST4000
     * @tc.desc   Test Method Combination in RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegExpCombination1Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re40 = /q/g;
      const str40 = "qqqq";
      re40.exec(str40);
      expect(re40.lastIndex).assertEqual(1);
      expect(re40.test(str40)).assertTrue();
      expect(re40.lastIndex).assertEqual(2);
      str40.replace(re40, "");
      expect(re40.lastIndex).assertEqual(0);
      str40.match(re40);
      expect(re40.lastIndex).assertEqual(0);
    });

    /**
     * @tc.name   RegExpCombination1Test041
     * @tc.number BUILTINS_REGEXP_COMBINATION_TEST4100
     * @tc.desc   Test Method Combination in RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegExpCombination1Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re41 = /a/y;
      const str41 = "aaab";
      re41.lastIndex = 0;
      let exec41_1 = re41.exec(str41);
      expect(exec41_1?.index).assertEqual(0);
      expect(re41.lastIndex).assertEqual(1);
      let exec41_2 = re41.exec(str41);
      expect(exec41_2?.index).assertEqual(1);
      re41.lastIndex = 3;
      let exec41_3 = re41.exec(str41);
      expect(exec41_3).assertNull();
      expect(re41.lastIndex).assertEqual(0);
    });

    /**
     * @tc.name   RegExpCombination1Test042
     * @tc.number BUILTINS_REGEXP_COMBINATION_TEST4200
     * @tc.desc   Test Method Combination in RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegExpCombination1Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re42g = /b/g;
      const re42y = /b/y;
      const str42 = "bbaabb";
      expect(re42g.test(str42)).assertTrue();
      expect(re42g.lastIndex).assertEqual(1);
      expect(re42g.test(str42)).assertTrue();
      expect(re42g.lastIndex).assertEqual(2);
      re42y.lastIndex = 2;
      expect(re42y.test(str42)).assertFalse();
      re42y.lastIndex = 4;
      expect(re42y.test(str42)).assertTrue();
      expect(re42y.lastIndex).assertEqual(5);
    });

    /**
     * @tc.name   RegExpCombination1Test043
     * @tc.number BUILTINS_REGEXP_COMBINATION_TEST4300
     * @tc.desc   Test Method Combination in RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegExpCombination1Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re43 = /[xyz]/g;
      const str43 = "x1y2z3x4";
      let exec43_1 = re43.exec(str43);
      expect(exec43_1?.[0]).assertEqual("x");
      expect(re43.lastIndex).assertEqual(1);
      let exec43_2 = re43.exec(str43);
      expect(exec43_2?.[0]).assertEqual("y");
      expect(re43.lastIndex).assertEqual(3);
      let exec43_3 = re43.exec(str43);
      expect(exec43_3?.[0]).assertEqual("z");
      expect(re43.lastIndex).assertEqual(5);
    });

    /**
     * @tc.name   RegExpCombination1Test044
     * @tc.number BUILTINS_REGEXP_COMBINATION_TEST4400
     * @tc.desc   Test Method Combination in RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegExpCombination1Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re44 = /[^0-9]/;
      const str44 = "12a34b56";
      let match44_1 = str44.match(re44);
      expect(match44_1?.index).assertEqual(2);
      expect(match44_1?.[0]).assertEqual("a");
      expect(re44.lastIndex).assertEqual(0);
      let match44_2 = str44.match(re44);
      expect(match44_2?.index).assertEqual(2);
    });

    /**
     * @tc.name   RegExpCombination1Test045
     * @tc.number BUILTINS_REGEXP_COMBINATION_TEST4500
     * @tc.desc   Test Method Combination in RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegExpCombination1Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re45 = /c*/g;
      const str45 = "ccddccc";
      let exec45_1 = re45.exec(str45);
      expect(exec45_1?.[0]).assertEqual("cc");
      expect(re45.lastIndex).assertEqual(2);
      let exec45_2 = re45.exec(str45);
      expect(exec45_2?.[0]).assertEqual("");
      expect(re45.lastIndex).assertEqual(2);
      let exec45_3 = re45.exec(str45);
      expect(exec45_3?.[0]).assertEqual("");
      expect(re45.lastIndex).assertEqual(2);
    });

    /**
     * @tc.name   RegExpCombination1Test046
     * @tc.number BUILTINS_REGEXP_COMBINATION_TEST4600
     * @tc.desc   Test Method Combination in RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegExpCombination1Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re46 = /d.?/g;
      const str46 = "d1d23d456";
      const matches46_1 = str46.matchAll(re46);
      let arr46_1 = Array.from(matches46_1);
      expect(arr46_1.length).assertEqual(3);
      expect(arr46_1[0][0]).assertEqual("d1");
      expect(arr46_1[1][0]).assertEqual("d2");
      const matches46_2 = str46.matchAll(re46);
      let arr46_2 = Array.from(matches46_2);
      expect(arr46_2[2][0]).assertEqual("d4");
    });

    /**
     * @tc.name   RegExpCombination1Test047
     * @tc.number BUILTINS_REGEXP_COMBINATION_TEST4700
     * @tc.desc   Test Method Combination in RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegExpCombination1Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re47 = /e(?=f)/g;
      const str47 = "efegfef";
      let exec47_1 = re47.exec(str47);
      expect(exec47_1?.index).assertEqual(0);
      expect(re47.lastIndex).assertEqual(1);
      let exec47_2 = re47.exec(str47);
      expect(exec47_2?.index).assertEqual(5);
      expect(re47.lastIndex).assertEqual(6);
    });

    /**
     * @tc.name   RegExpCombination1Test048
     * @tc.number BUILTINS_REGEXP_COMBINATION_TEST4800
     * @tc.desc   Test Method Combination in RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegExpCombination1Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re48 = /(?<=g)h/g;
      const str48 = "ghihgh";
      expect(re48.test(str48)).assertTrue();
      expect(re48.lastIndex).assertEqual(2);
      let exec48_1 = re48.exec(str48);
      expect(exec48_1?.index).assertEqual(5);
      expect(re48.lastIndex).assertEqual(6);
    });

    /**
     * @tc.name   RegExpCombination1Test049
     * @tc.number BUILTINS_REGEXP_COMBINATION_TEST4900
     * @tc.desc   Test Method Combination in RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegExpCombination1Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re49 = /^j/igm;
      const str49 = "J1\nk2\nj3\nJ4";
      let exec49_1 = re49.exec(str49);
      expect(exec49_1?.[0]).assertEqual("J");
      expect(re49.lastIndex).assertEqual(1);
      let exec49_2 = re49.exec(str49);
      expect(exec49_2?.index).assertEqual(6);
      expect(re49.lastIndex).assertEqual(7);
    });

    /**
     * @tc.name   RegExpCombination1Test050
     * @tc.number BUILTINS_REGEXP_COMBINATION_TEST5000
     * @tc.desc   Test Method Combination in RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegExpCombination1Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re50 = / /;
      const str50 = "abc";
      let split50_1 = str50.split(re50);
      expect(split50_1).assertDeepEquals(["abc"]);
      let split50_2 = str50.split(re50);
      expect(split50_2).assertDeepEquals(["abc"]);

    });

    /**
     * @tc.name   RegExpCombination1Test051
     * @tc.number BUILTINS_REGEXP_COMBINATION_TEST5100
     * @tc.desc   Test Method Combination in RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegExpCombination1Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re51 = /k$/gm;
      const str51 = "kk\nk\nkkk";
      let exec51_1 = re51.exec(str51);
      expect(exec51_1?.index).assertEqual(1);
      expect(re51.lastIndex).assertEqual(2);
      let exec51_2 = re51.exec(str51);
      expect(exec51_2?.index).assertEqual(3);
      expect(re51.lastIndex).assertEqual(4);

    });

    /**
     * @tc.name   RegExpCombination1Test052
     * @tc.number BUILTINS_REGEXP_COMBINATION_TEST5200
     * @tc.desc   Test Method Combination in RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegExpCombination1Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re52 = /l+?/g;
      const str52 = "llll";
      let exec52_1 = re52.exec(str52);
      expect(exec52_1?.[0]).assertEqual("l");
      expect(re52.lastIndex).assertEqual(1);
      let exec52_2 = re52.exec(str52);
      expect(exec52_2?.[0]).assertEqual("l");
      expect(re52.lastIndex).assertEqual(2);

    });

    /**
     * @tc.name   RegExpCombination1Test053
     * @tc.number BUILTINS_REGEXP_COMBINATION_TEST5300
     * @tc.desc   Test Method Combination in RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegExpCombination1Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(RegExpCombination1.RegExpCombination1Test053()).assertDeepEquals([[" ", "\t", "\n"], 0, 3]);
    });

    /**
     * @tc.name   RegExpCombination1Test054
     * @tc.number BUILTINS_REGEXP_COMBINATION_TEST5400
     * @tc.desc   Test Method Combination in RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegExpCombination1Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re54d = /\d/g;
      const re54D = /\D/g;
      const str54 = "1a2b3c";
      expect(re54d.exec(str54)?.[0]).assertEqual("1");
      expect(re54D.exec(str54)?.[0]).assertEqual("a");
      expect(re54d.exec(str54)?.[0]).assertEqual("2");
      expect(re54D.exec(str54)?.[0]).assertEqual("b");
    });

    /**
     * @tc.name   RegExpCombination1Test055
     * @tc.number BUILTINS_REGEXP_COMBINATION_TEST5500
     * @tc.desc   Test Method Combination in RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegExpCombination1Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re55 = /(m)(n)/g;
      const str55 = "mn mn mn";
      let replace55_1 = str55.replace(re55, "$2$1");
      expect(replace55_1).assertEqual("nm nm nm");
      let replace55_2 = str55.replace(re55, "[$1$2]");
      expect(replace55_2).assertEqual("[mn] [mn] [mn]");
      expect(re55.lastIndex).assertEqual(0);
    });

    /**
     * @tc.name   RegExpCombination1Test056
     * @tc.number BUILTINS_REGEXP_COMBINATION_TEST5600
     * @tc.desc   Test Method Combination in RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegExpCombination1Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re56 = /o/g;
      let str56 = "oo";
      expect(re56.exec(str56)?.index).assertEqual(0);
      str56 = "ooo";
      let exec56_2 = re56.exec(str56);
      expect(exec56_2?.index).assertEqual(1);
      expect(re56.lastIndex).assertEqual(2);
    });

    /**
     * @tc.name   RegExpCombination1Test057
     * @tc.number BUILTINS_REGEXP_COMBINATION_TEST5700
     * @tc.desc   Test Method Combination in RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegExpCombination1Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re57 = /p/g;
      const str57a = "pp";
      const str57b = "p";
      re57.exec(str57a);
      expect(re57.lastIndex).assertEqual(1);
      let exec57_2 = re57.exec(str57b);
      expect(exec57_2).assertNull();
      expect(re57.lastIndex).assertEqual(0);
      let exec57_3 = re57.exec(str57a);
      expect(exec57_3?.index).assertEqual(0);
    });

    /**
     * @tc.name   RegExpCombination1Test058
     * @tc.number BUILTINS_REGEXP_COMBINATION_TEST5800
     * @tc.desc   Test Method Combination in RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegExpCombination1Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re58 = /q/y;
      const str58 = "qqxq";
      re58.lastIndex = 2;
      expect(re58.test(str58)).assertFalse();
      expect(re58.lastIndex).assertEqual(0);
      expect(re58.test(str58)).assertTrue();
      expect(re58.lastIndex).assertEqual(1);

    });

    /**
     * @tc.name   RegExpCombination1Test059
     * @tc.number BUILTINS_REGEXP_COMBINATION_TEST5900
     * @tc.desc   Test Method Combination in RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegExpCombination1Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re59 = /r{1,2}s*/g;
      const str59 = "rrs rss rr s";
      let exec59_1 = re59.exec(str59);
      expect(exec59_1?.[0]).assertEqual("rrs");
      expect(re59.lastIndex).assertEqual(3);
      let exec59_2 = re59.exec(str59);
      expect(exec59_2?.[0]).assertEqual("rss");
      expect(re59.lastIndex).assertEqual(7);
    });

    /**
     * @tc.name   RegExpCombination1Test060
     * @tc.number BUILTINS_REGEXP_COMBINATION_TEST6000
     * @tc.desc   Test Method Combination in RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegExpCombination1Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re60 = /https?:\/\/(\w+\.)+\w+/g;
      const str60 = "url1: http://a.com, url2: https://b.cn";
      let exec60_1 = re60.exec(str60);
      expect(exec60_1?.[0]).assertEqual("http://a.com");
      expect(re60.lastIndex).assertEqual(18);
      let exec60_2 = re60.exec(str60);
      expect(exec60_2?.[0]).assertEqual("https://b.cn");
      expect(re60.lastIndex).assertEqual(38);
    });

    /**
     * @tc.name   RegExpCombination1Test061
     * @tc.number BUILTINS_REGEXP_COMBINATION_TEST6100
     * @tc.desc   Test Method Combination in RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegExpCombination1Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re61 = /\p{Emoji}/gu;
      const str61 = "😊👍👋";
      let exec61_1 = re61.exec(str61);
      expect(exec61_1?.[0]).assertEqual("😊");
      expect(re61.lastIndex).assertEqual(2);
      let exec61_2 = re61.exec(str61);
      expect(exec61_2?.[0]).assertEqual("👍");
      expect(re61.lastIndex).assertEqual(4);
    });

    /**
     * @tc.name   RegExpCombination1Test062
     * @tc.number BUILTINS_REGEXP_COMBINATION_TEST6200
     * @tc.desc   Test Method Combination in RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegExpCombination1Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re62 = /,/g;
      const str62 = "a,b,c,d,e";
      let split62_1 = str62.split(re62, 3);
      expect(split62_1).assertDeepEquals(["a", "b", "c"]);
      let split62_2 = str62.split(re62, 2);
      expect(split62_2).assertDeepEquals(["a", "b"]);
      expect(re62.lastIndex).assertEqual(0);
    });

    /**
     * @tc.name   RegExpCombination1Test063
     * @tc.number BUILTINS_REGEXP_COMBINATION_TEST6300
     * @tc.desc   Test Method Combination in RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegExpCombination1Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re63 = /t/g;
      const str63 = "ttt";
      let match63_1 = str63.match(re63);
      expect(match63_1?.index).assertEqual(undefined);
      expect(match63_1?.input).assertEqual(undefined);
      let match63_2 = str63.match(/t/);
      expect(match63_2?.index).assertEqual(0);
      expect(match63_2?.input).assertEqual("ttt");
    });

    /**
     * @tc.name   RegExpCombination1Test064
     * @tc.number BUILTINS_REGEXP_COMBINATION_TEST6400
     * @tc.desc   Test Method Combination in RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegExpCombination1Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re64 = /(?<name>u+)/g;
      const str64 = "uu uuu";
      let exec64_1 = re64.exec(str64);
      expect(exec64_1?.groups?.name).assertEqual("uu");
      expect(re64.lastIndex).assertEqual(2);
      let exec64_2 = re64.exec(str64);
      expect(exec64_2?.groups?.name).assertEqual("uuu");
      expect(re64.lastIndex).assertEqual(6);
    });

    /**
     * @tc.name   RegExpCombination1Test065
     * @tc.number BUILTINS_REGEXP_COMBINATION_TEST6500
     * @tc.desc   Test Method Combination in RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegExpCombination1Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re65b = /\bv\b/g;
      const re65B = /\Bv\B/g;
      const str65 = "v vv vvv";
      expect(re65b.exec(str65)?.index).assertEqual(0);
      expect(re65B.exec(str65)?.index).assertEqual(6);
    });

    /**
     * @tc.name   RegExpCombination1Test066
     * @tc.number BUILTINS_REGEXP_COMBINATION_TEST6600
     * @tc.desc   Test Method Combination in RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegExpCombination1Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re66 = /w/g;
      const str66 = "www";
      let indexes66: number[] = [];
      str66.replace(re66, () => {
        indexes66.push(re66.lastIndex);
        return "x";
      });
      expect(indexes66).assertDeepEquals([0, 0, 0]);
      let indexes66_2: number[] = [];
      str66.replace(re66, () => {
        indexes66_2.push(re66.lastIndex);
        return "y";
      });
      expect(indexes66_2).assertDeepEquals([0, 0, 0]);
    });

    /**
     * @tc.name   RegExpCombination1Test067
     * @tc.number BUILTINS_REGEXP_COMBINATION_TEST6700
     * @tc.desc   Test Method Combination in RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegExpCombination1Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re67 = /x/g;
      const str67 = "xxxxx";
      let count67 = 0;
      let execRes67: RegExpExecArray | null;
      while ((execRes67 = re67.exec(str67))) {
        count67++;
      }
      expect(count67).assertEqual(5);
      expect(re67.lastIndex).assertEqual(0);
      let exec67_1 = re67.exec(str67);
      expect(exec67_1?.index).assertEqual(0);
    });

    /**
     * @tc.name   RegExpCombination1Test068
     * @tc.number BUILTINS_REGEXP_COMBINATION_TEST6800
     * @tc.desc   Test Method Combination in RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegExpCombination1Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re68 = /(\$|\^)/g;
      const str68 = "$a^b$c^";
      let replace68_1 = str68.replace(re68, "!");
      expect(replace68_1).assertEqual("!a!b!c!");
      let replace68_2 = str68.replace(re68, (match) => match === "$" ? "#" : "@");
      expect(replace68_2).assertEqual("#a@b#c@");
    });

    /**
     * @tc.name   RegExpCombination1Test069
     * @tc.number BUILTINS_REGEXP_COMBINATION_TEST6900
     * @tc.desc   Test Method Combination in RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegExpCombination1Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re69 = /y/g;
      const str69 = "yy";
      re69.exec(str69);
      expect(re69.toString()).assertEqual("/y/g");
      re69.lastIndex = 5;
      expect(re69.toString()).assertEqual("/y/g");
    });

    /**
     * @tc.name   RegExpCombination1Test070
     * @tc.number BUILTINS_REGEXP_COMBINATION_TEST7000
     * @tc.desc   Test Method Combination in RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegExpCombination1Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re70 = /(z(a(b)))/g;
      const str70 = "zabzab";
      let exec70_1 = re70.exec(str70);
      expect(exec70_1?.[0]).assertEqual("zab");
      expect(exec70_1?.[1]).assertEqual("zab");
      expect(exec70_1?.[2]).assertEqual("ab");
      expect(exec70_1?.[3]).assertEqual("b");
      expect(re70.lastIndex).assertEqual(3);
      let exec70_2 = re70.exec(str70);
      expect(exec70_2?.index).assertEqual(3);
      expect(exec70_2?.[3]).assertEqual("b");
    });

    /**
     * @tc.name   RegExpCombination1Test071
     * @tc.number BUILTINS_REGEXP_COMBINATION_TEST7100
     * @tc.desc   Test Method Combination in RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegExpCombination1Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re71 = /a(?=b)/g;
      const str71 = "abab a b";
      let exec71_1 = re71.exec(str71);
      expect(exec71_1?.index).assertEqual(0);
      expect(re71.lastIndex).assertEqual(1);
      let exec71_2 = re71.exec(str71);
      expect(exec71_2?.index).assertEqual(2);
      expect(re71.lastIndex).assertEqual(3);
      let exec71_3 = re71.exec(str71);
      expect(exec71_3?.index).assertEqual(undefined);
      expect(exec71_3).assertNull();
      expect(re71.lastIndex).assertEqual(0);
    });

    /**
     * @tc.name   RegExpCombination1Test072
     * @tc.number BUILTINS_REGEXP_COMBINATION_TEST7200
     * @tc.desc   Test Method Combination in RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegExpCombination1Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re72 = /(?<!c)d/g;
      const str72 = "d cd ccd";
      expect(re72.test(str72)).assertTrue();
      expect(re72.lastIndex).assertEqual(1);
      let exec72_1 = re72.exec(str72);
      expect(exec72_1?.index).assertEqual(undefined);
      expect(re72.lastIndex).assertEqual(0);
      expect(re72.test(str72)).assertTrue();
      expect(re72.lastIndex).assertEqual(1);
    });

    /**
     * @tc.name   RegExpCombination1Test073
     * @tc.number BUILTINS_REGEXP_COMBINATION_TEST7300
     * @tc.desc   Test Method Combination in RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegExpCombination1Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re73 = /\f/g;
      const str73 = "a\fb\fc";
      let match73_1 = str73.match(re73);
      expect(match73_1).assertDeepEquals(["\f", "\f"]);
      expect(re73.lastIndex).assertEqual(0);
      let match73_2 = str73.match(/\f/);
      expect(match73_2?.index).assertEqual(1);
      expect(re73.lastIndex).assertEqual(0);

    });

    /**
     * @tc.name   RegExpCombination1Test074
     * @tc.number BUILTINS_REGEXP_COMBINATION_TEST7400
     * @tc.desc   Test Method Combination in RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegExpCombination1Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re74 = /e/g;
      const str74 = "eeee";
      re74.exec(str74);
      expect(re74.lastIndex).assertEqual(1);
      Array.from(str74.matchAll(re74));
      expect(re74.lastIndex).assertEqual(1);
      expect(re74.test(str74)).assertTrue();
      expect(re74.lastIndex).assertEqual(2);
      str74.split(re74);
      expect(re74.lastIndex).assertEqual(2);
      let exec74_1 = re74.exec(str74);
      expect(exec74_1?.index).assertEqual(2);
    });

    /**
     * @tc.name   RegExpCombination1Test075
     * @tc.number BUILTINS_REGEXP_COMBINATION_TEST7500
     * @tc.desc   Test Method Combination in RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegExpCombination1Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re75 = /f/y;
      let str75 = "ff";
      re75.lastIndex = 1;
      expect(re75.exec(str75)?.index).assertEqual(1);
      str75 = "fff";
      expect(re75.exec(str75)?.index).assertEqual(2);
      re75.lastIndex = 3;
      expect(re75.exec(str75)?.index).assertEqual(undefined);
    });

    /**
     * @tc.name   RegExpCombination1Test076
     * @tc.number BUILTINS_REGEXP_COMBINATION_TEST7600
     * @tc.desc   Test Method Combination in RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegExpCombination1Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re76 = /(g)(?:h)/g;
      const str76 = "ghgh";
      const matches76_1 = str76.matchAll(re76);
      let arr76_1 = Array.from(matches76_1);
      expect(arr76_1.length).assertEqual(2);
      expect(arr76_1[0][1]).assertEqual("g");
      const matches76_2 = str76.matchAll(re76);
      let arr76_2 = Array.from(matches76_2);
      expect(arr76_2[1].index).assertEqual(2);
    });

    /**
     * @tc.name   RegExpCombination1Test077
     * @tc.number BUILTINS_REGEXP_COMBINATION_TEST7700
     * @tc.desc   Test Method Combination in RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegExpCombination1Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re77 = /,/g;
      const str77 = "x,y,z";
      let split77_1 = str77.split(re77);
      let split77_2 = str77.split(",");
      expect(split77_1).assertDeepEquals(split77_2);
      split77_1 = str77.split(re77, 2);
      split77_2 = str77.split(",", 2);
      expect(split77_1).assertDeepEquals(split77_2);
    });

    /**
     * @tc.name   RegExpCombination1Test078
     * @tc.number BUILTINS_REGEXP_COMBINATION_TEST7800
     * @tc.desc   Test Method Combination in RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegExpCombination1Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re78 = /\r/g;
      const str78 = "a\r\rb\r";
      let replace78_1 = str78.replace(re78, "|");
      expect(replace78_1).assertDeepEquals("a||b|");
      let replace78_2 = str78.replace(/\r/, "|");
      expect(replace78_2).assertDeepEquals("a|\rb\r");
    });

    /**
     * @tc.name   RegExpCombination1Test079
     * @tc.number BUILTINS_REGEXP_COMBINATION_TEST7900
     * @tc.desc   Test Method Combination in RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegExpCombination1Test079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re79g = /i+/g;
      const re79n = /i+?/g;
      const str79 = "iiii";
      expect(re79g.exec(str79)?.[0]).assertEqual("iiii");
      expect(re79g.lastIndex).assertEqual(4);
      expect(re79n.exec(str79)?.[0]).assertEqual("i");
      expect(re79n.lastIndex).assertEqual(1);
      expect(re79n.exec(str79)?.[0]).assertEqual("i");
      expect(re79n.lastIndex).assertEqual(2);
    });

    /**
     * @tc.name   RegExpCombination1Test080
     * @tc.number BUILTINS_REGEXP_COMBINATION_TEST8000
     * @tc.desc   Test Method Combination in RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegExpCombination1Test080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(RegExpCombination1.RegExpCombination1Test080()).assertDeepEquals(["[123] [456]", "{123} {456}"]);
    });

    /**
     * @tc.name   RegExpCombination1Test081
     * @tc.number BUILTINS_REGEXP_COMBINATION_TEST8100
     * @tc.desc   Test Method Combination in RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegExpCombination1Test081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re81s = /a.b/sg;
      const re81 = /a.b/g;
      const str81 = "a\nb a-b";
      let exec81s_1 = re81s.exec(str81);
      expect(exec81s_1?.[0]).assertEqual("a\nb");
      expect(re81s.lastIndex).assertEqual(3);
      let exec81_1 = re81.exec(str81);
      expect(exec81_1?.[0]).assertEqual("a-b");
      expect(re81.lastIndex).assertEqual(7);
    });

    /**
     * @tc.name   RegExpCombination1Test082
     * @tc.number BUILTINS_REGEXP_COMBINATION_TEST8200
     * @tc.desc   Test Method Combination in RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegExpCombination1Test082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re82 = /j/g;
      const str82a = "jjj";
      const str82b = "jj";
      re82.exec(str82a);
      expect(re82.lastIndex).assertEqual(1);
      let exec82_2 = re82.exec(str82b);
      expect(exec82_2?.index).assertEqual(1);
      expect(re82.lastIndex).assertEqual(2);
      let exec82_3 = re82.exec(str82a);
      expect(exec82_3?.index).assertEqual(2);
    });

    /**
     * @tc.name   RegExpCombination1Test083
     * @tc.number BUILTINS_REGEXP_COMBINATION_TEST8300
     * @tc.desc   Test Method Combination in RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegExpCombination1Test083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re83 = / /g;
      const str83 = "ab";
      let exec83_1 = re83.exec(str83);
      expect(exec83_1?.index).assertEqual(undefined);
      expect(re83.lastIndex).assertEqual(0);
      let exec83_2 = re83.exec(str83);
      expect(exec83_2?.index).assertEqual(undefined);
      expect(re83.lastIndex).assertEqual(0);
      let exec83_3 = re83.exec(str83);
      expect(exec83_3?.index).assertEqual(undefined);
      expect(re83.lastIndex).assertEqual(0);
    });

    /**
     * @tc.name   RegExpCombination1Test084
     * @tc.number BUILTINS_REGEXP_COMBINATION_TEST8400
     * @tc.desc   Test Method Combination in RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegExpCombination1Test084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re84 = /k/;
      const str84 = "abc";
      let match84_1 = str84.match(re84);
      expect(match84_1).assertNull();
      expect(re84.lastIndex).assertEqual(0);
      let match84_2 = str84.match(re84);
      expect(match84_2).assertNull();
    });

    /**
     * @tc.name   RegExpCombination1Test085
     * @tc.number BUILTINS_REGEXP_COMBINATION_TEST8500
     * @tc.desc   Test Method Combination in RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegExpCombination1Test085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re85 = /l/g;
      const str85 = "lll";
      let testCount85 = 0;
      while (re85.test(str85)) {
        testCount85++;
      }
      expect(testCount85).assertEqual(3);
      expect(re85.lastIndex).assertEqual(0);
      expect(re85.test(str85)).assertTrue();
    });

    /**
     * @tc.name   RegExpCombination1Test086
     * @tc.number BUILTINS_REGEXP_COMBINATION_TEST8600
     * @tc.desc   Test Method Combination in RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegExpCombination1Test086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re86 = /[\u4e00-\u9fa5]/g;
      const str86 = "你好，世界";
      let exec86_1 = re86.exec(str86);
      expect(exec86_1?.[0]).assertEqual("你");
      expect(re86.lastIndex).assertEqual(1);
      let exec86_2 = re86.exec(str86);
      expect(exec86_2?.[0]).assertEqual("好");
      expect(re86.lastIndex).assertEqual(2);
      let exec86_3 = re86.exec(str86);
      expect(exec86_3?.[0]).assertEqual("世");
    });

    /**
     * @tc.name   RegExpCombination1Test087
     * @tc.number BUILTINS_REGEXP_COMBINATION_TEST8700
     * @tc.desc   Test Method Combination in RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegExpCombination1Test087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re87 = /m/g;
      let str87 = "mmm";
      str87 = str87.replace(re87, "xx");
      expect(str87).assertEqual("xxxxxx");
      str87 = str87.replace(re87, "y");
      expect(str87).assertEqual("xxxxxx");
    });

    /**
     * @tc.name   RegExpCombination1Test088
     * @tc.number BUILTINS_REGEXP_COMBINATION_TEST8800
     * @tc.desc   Test Method Combination in RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegExpCombination1Test088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re88 = /n+(?=o)/g;
      const str88 = "nno nnno no";
      const matches88_1 = str88.matchAll(re88);
      let arr88_1 = Array.from(matches88_1);
      expect(arr88_1[0][0]).assertEqual("nn");
      expect(arr88_1[1][0]).assertEqual("nnn");
      const matches88_2 = str88.matchAll(re88);
      let arr88_2 = Array.from(matches88_2);
      expect(arr88_2[2][0]).assertEqual("n");
    });

    /**
     * @tc.name   RegExpCombination1Test089
     * @tc.number BUILTINS_REGEXP_COMBINATION_TEST8900
     * @tc.desc   Test Method Combination in RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegExpCombination1Test089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re89 = /p/;
      const str89 = "abc";
      let search89_1 = str89.search(re89);
      expect(search89_1).assertEqual(-1);
      expect(re89.lastIndex).assertEqual(0);
      let search89_2 = str89.search(re89);
      expect(search89_2).assertEqual(-1);
    });

    /**
     * @tc.name   RegExpCombination1Test090
     * @tc.number BUILTINS_REGEXP_COMBINATION_TEST9000
     * @tc.desc   Test Method Combination in RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegExpCombination1Test090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re90 = /q/g;
      const str90 = "qqqq";
      re90.lastIndex = 2;
      let exec90_1 = re90.exec(str90);
      expect(exec90_1?.index).assertEqual(2);
      expect(re90.lastIndex).assertEqual(3);
      re90.lastIndex = 0;
      let exec90_2 = re90.exec(str90);
      expect(exec90_2?.index).assertEqual(0);
    });

    /**
     * @tc.name   RegExpCombination1Test091
     * @tc.number BUILTINS_REGEXP_COMBINATION_TEST9100
     * @tc.desc   Test Method Combination in RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegExpCombination1Test091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re91 = /R/ig;
      const str91 = "rRrR";
      let match91_1 = str91.match(re91);
      expect(match91_1).assertDeepEquals(["r", "R", "r", "R"]);
      expect(re91.lastIndex).assertEqual(0);
      let exec91_1 = re91.exec(str91);
      expect(exec91_1?.[0]).assertEqual("r");
      expect(re91.lastIndex).assertEqual(1);
    });

    /**
     * @tc.name   RegExpCombination1Test092
     * @tc.number BUILTINS_REGEXP_COMBINATION_TEST9200
     * @tc.desc   Test Method Combination in RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegExpCombination1Test092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re92 = /(?=[A-Z])[a-z]/g;
      const str92 = "aBcD";
      let exec92_1 = re92.exec(str92);
      expect(exec92_1).assertNull();
      expect(re92.lastIndex).assertEqual(0);
      const re92fix = /(?=[a-z])[A-Z]/g;
      let exec92_2 = re92fix.exec(str92);
      expect(exec92_2?.index).assertEqual(undefined);
      expect(re92fix.lastIndex).assertEqual(0);
    });

    /**
     * @tc.name   RegExpCombination1Test093
     * @tc.number BUILTINS_REGEXP_COMBINATION_TEST9300
     * @tc.desc   Test Method Combination in RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegExpCombination1Test093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re93 = /,/g;
      const str93 = "a,b,c";
      let split93_1 = str93.split(re93, 0);
      expect(split93_1).assertDeepEquals([]);
      let split93_2 = str93.split(re93, 0);
      expect(split93_2).assertDeepEquals([]);
    });

    /**
     * @tc.name   RegExpCombination1Test094
     * @tc.number BUILTINS_REGEXP_COMBINATION_TEST9400
     * @tc.desc   Test Method Combination in RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegExpCombination1Test094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re94 = /\./g;
      const str94 = "a.b.c";
      let exec94_1 = re94.exec(str94);
      expect(exec94_1?.index).assertEqual(1);
      expect(re94.lastIndex).assertEqual(2);
      let exec94_2 = re94.exec(str94);
      expect(exec94_2?.index).assertEqual(3);
    });

    /**
     * @tc.name   RegExpCombination1Test095
     * @tc.number BUILTINS_REGEXP_COMBINATION_TEST9500
     * @tc.desc   Test Method Combination in RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegExpCombination1Test095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re95 = /(s)(t)(r)/g;
      const str95 = "strstr";
      let exec95_1 = re95.exec(str95);
      expect(exec95_1?.[0]).assertEqual("str");
      expect(exec95_1?.[1]).assertEqual("s");
      expect(exec95_1?.[2]).assertEqual("t");
      expect(exec95_1?.[3]).assertEqual("r");
      expect(re95.lastIndex).assertEqual(3);
      let exec95_2 = re95.exec(str95);
      expect(exec95_2?.index).assertEqual(3);
    });

    /**
     * @tc.name   RegExpCombination1Test096
     * @tc.number BUILTINS_REGEXP_COMBINATION_TEST9600
     * @tc.desc   Test Method Combination in RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegExpCombination1Test096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re96 = /t/g;
      const str96 = "ttt";
      const matches96 = str96.matchAll(re96);
      expect(matches96.next().value?.index).assertEqual(0);
      expect(matches96.next().value?.index).assertEqual(1);
      expect(matches96.next().value?.index).assertEqual(2);
      expect(matches96.next().done).assertTrue();
    });

    /**
     * @tc.name   RegExpCombination1Test097
     * @tc.number BUILTINS_REGEXP_COMBINATION_TEST9700
     * @tc.desc   Test Method Combination in RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegExpCombination1Test097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re97 = /^u|v$/gm;
      const str97 = "u1v\nu2v\nu3";
      let exec97_1 = re97.exec(str97);
      expect(exec97_1?.[0]).assertEqual("u");
      expect(re97.lastIndex).assertEqual(1);
      let exec97_2 = re97.exec(str97);
      expect(exec97_2?.[0]).assertEqual("v");
      expect(re97.lastIndex).assertEqual(3);
    });

    /**
     * @tc.name   RegExpCombination1Test098
     * @tc.number BUILTINS_REGEXP_COMBINATION_TEST9800
     * @tc.desc   Test Method Combination in RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegExpCombination1Test098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re98 = /w/g;
      const str98 = "www";
      let replace98_1 = str98.replace(re98, () => {
        re98.lastIndex = 3;
        return "x";
      });
      expect(replace98_1).assertEqual("xxx");
      let replace98_2 = str98.replace(re98, () => {
        re98.lastIndex = 0;
        return "y";
      });
      expect(replace98_2).assertEqual("yyy");
    });

    /**
     * @tc.name   RegExpCombination1Test099
     * @tc.number BUILTINS_REGEXP_COMBINATION_TEST9900
     * @tc.desc   Test Method Combination in RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegExpCombination1Test099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re99w = /\w/g;
      const re99W = /\W/g;
      const str99 = "a_1@b#2";
      expect(re99w.exec(str99)?.[0]).assertEqual("a");
      expect(re99W.exec(str99)?.[0]).assertEqual("@");
      expect(re99w.exec(str99)?.[0]).assertEqual("_");
      expect(re99W.exec(str99)?.[0]).assertEqual("#");
    });

    /**
     * @tc.name   RegExpCombination1Test100
     * @tc.number BUILTINS_REGEXP_COMBINATION_TEST10000
     * @tc.desc   Test Method Combination in RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegExpCombination1Test100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re100 = /x/g;
      const str100 = "";
      expect(re100.exec(str100)).assertNull();
      expect(re100.test(str100)).assertFalse();
      expect(str100.match(re100)).assertDeepEquals(null);
      expect(str100.split(re100)).assertDeepEquals([""]);
      expect(str100.search(re100)).assertEqual(-1);

    });

    /**
     * @tc.name   RegExpCombination1Test101
     * @tc.number BUILTINS_REGEXP_COMBINATION_TEST10100
     * @tc.desc   Test Method Combination in RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegExpCombination1Test101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re101 = / /y;
      const str101 = "abc";
      re101.lastIndex = 0;
      let exec101_1 = re101.exec(str101);
      expect(exec101_1?.index).assertEqual(undefined);
      expect(re101.lastIndex).assertEqual(0);
      re101.lastIndex = 1;
      let exec101_2 = re101.exec(str101);
      expect(exec101_2?.index).assertEqual(undefined);
      expect(re101.lastIndex).assertEqual(0);
    });

    /**
     * @tc.name   RegExpCombination1Test102
     * @tc.number BUILTINS_REGEXP_COMBINATION_TEST10200
     * @tc.desc   Test Method Combination in RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegExpCombination1Test102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re102 = /😀/g;
      const str102 = "😀😀a";
      let exec102_1 = re102.exec(str102);
      expect(exec102_1?.index).assertEqual(0);
      expect(re102.lastIndex).assertEqual(2);
      let exec102_2 = re102.exec(str102);
      expect(exec102_2?.index).assertEqual(2);
      expect(re102.lastIndex).assertEqual(4);
    });

    /**
     * @tc.name   RegExpCombination1Test103
     * @tc.number BUILTINS_REGEXP_COMBINATION_TEST10300
     * @tc.desc   Test Method Combination in RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegExpCombination1Test103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re103 = /a(?!b)/g;
      const str103 = "ac ab ad";
      let exec103Arr: RegExpExecArray[] = [];
      let exec103Res: RegExpExecArray | null;
      while ((exec103Res = re103.exec(str103))) {
        exec103Arr.push(exec103Res);
      }
      expect(exec103Arr.length).assertEqual(2);
      expect(exec103Arr[0].index).assertEqual(0);
      expect(exec103Arr[1].index).assertEqual(6);
    });

    /**
     * @tc.name   RegExpCombination1Test104
     * @tc.number BUILTINS_REGEXP_COMBINATION_TEST10400
     * @tc.desc   Test Method Combination in RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegExpCombination1Test104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re104 = /b/g;
      const str104 = "bb";
      str104.match(re104);
      expect(re104.lastIndex).assertEqual(0);
      re104.test(str104);
      expect(re104.lastIndex).assertEqual(1);
      str104.match(re104);
      expect(re104.lastIndex).assertEqual(0);
    });

    /**
     * @tc.name   RegExpCombination1Test105
     * @tc.number BUILTINS_REGEXP_COMBINATION_TEST10500
     * @tc.desc   Test Method Combination in RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegExpCombination1Test105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re105 = /c.d/sg;
      const str105 = "c\nd\ncxd";
      let exec105_1 = re105.exec(str105);
      expect(exec105_1?.[0]).assertEqual("c\nd");
      expect(re105.lastIndex).assertEqual(3);
      let exec105_2 = re105.exec(str105);
      expect(exec105_2?.[0]).assertEqual("cxd");
      expect(re105.lastIndex).assertEqual(7);
    });

    /**
     * @tc.name   RegExpCombination1Test106
     * @tc.number BUILTINS_REGEXP_COMBINATION_TEST10600
     * @tc.desc   Test Method Combination in RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegExpCombination1Test106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re106 = /(\d)/g;
      const str106 = "a1b2c3d";
      let split106_1 = str106.split(re106, 4);
      expect(split106_1).assertDeepEquals(["a", "1", "b", "2"]);
      let split106_2 = str106.split(re106, 2);
      expect(split106_2).assertDeepEquals(["a", "1"]);
    });

    /**
     * @tc.name   RegExpCombination1Test107
     * @tc.number BUILTINS_REGEXP_COMBINATION_TEST10700
     * @tc.desc   Test Method Combination in RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegExpCombination1Test107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re107 = /(?<user>\w+)@(?<domain>\w+\.\w+)/g;
      const str107 = "alice@test.com bob@example.org";
      let exec107_1 = re107.exec(str107);
      expect(exec107_1?.groups?.user).assertEqual("alice");
      expect(exec107_1?.groups?.domain).assertEqual("test.com");
      expect(re107.lastIndex).assertEqual(14);
      let exec107_2 = re107.exec(str107);
      expect(exec107_2?.groups?.user).assertEqual("bob");
    });

    /**
     * @tc.name   RegExpCombination1Test108
     * @tc.number BUILTINS_REGEXP_COMBINATION_TEST10800
     * @tc.desc   Test Method Combination in RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegExpCombination1Test108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re108 = /d/g;
      const str108 = "ddx";
      re108.exec(str108);
      re108.exec(str108);
      expect(re108.lastIndex).assertEqual(2);
      let exec108_3 = re108.exec(str108);
      expect(exec108_3).assertNull();
      expect(re108.lastIndex).assertEqual(0);
    });

    /**
     * @tc.name   RegExpCombination1Test109
     * @tc.number BUILTINS_REGEXP_COMBINATION_TEST10900
     * @tc.desc   Test Method Combination in RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegExpCombination1Test109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re109 = /e/g;
      const str109 = "eee";
      re109.exec(str109);
      expect(re109.lastIndex).assertEqual(1);
      str109.search(re109);
      expect(re109.lastIndex).assertEqual(1);
      let exec109_2 = re109.exec(str109);
      expect(exec109_2?.index).assertEqual(1);
    });

    /**
     * @tc.name   RegExpCombination1Test110
     * @tc.number BUILTINS_REGEXP_COMBINATION_TEST11000
     * @tc.desc   Test Method Combination in RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegExpCombination1Test110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re110 = /f*?/g;
      const str110 = "ff";
      let exec110_1 = re110.exec(str110);
      expect(exec110_1?.[0]).assertEqual("");
      expect(re110.lastIndex).assertEqual(0);
      re110.lastIndex = 1;
      let exec110_2 = re110.exec(str110);
      expect(exec110_2?.[0]).assertEqual("");
    });

    /**
     * @tc.name   RegExpCombination1Test111
     * @tc.number BUILTINS_REGEXP_COMBINATION_TEST11100
     * @tc.desc   Test Method Combination in RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegExpCombination1Test111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re111 = /G/ig;
      const str111 = "gGgG";
      let match111_1 = str111.match(re111);
      expect(match111_1).assertDeepEquals(["g", "G", "g", "G"]);
      let exec111_1 = re111.exec(str111);
      expect(exec111_1?.[0]).assertEqual("g");
      expect(re111.lastIndex).assertEqual(1);
    });

    /**
     * @tc.name   RegExpCombination1Test112
     * @tc.number BUILTINS_REGEXP_COMBINATION_TEST11200
     * @tc.desc   Test Method Combination in RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegExpCombination1Test112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re112 = /h/g;
      let str112 = "hhh";
      str112 = str112.replace(re112, "H");
      expect(str112).assertEqual("HHH");
      let exec112_1 = re112.exec(str112);
      expect(exec112_1).assertNull();
      expect(re112.lastIndex).assertEqual(0);
    });

    /**
     * @tc.name   RegExpCombination1Test113
     * @tc.number BUILTINS_REGEXP_COMBINATION_TEST11300
     * @tc.desc   Test Method Combination in RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegExpCombination1Test113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re113 = /\t/g;
      const str113 = "a\tb\tc";
      const matches113_1 = str113.matchAll(re113);
      let arr113_1 = Array.from(matches113_1);
      expect(arr113_1.length).assertEqual(2);
      expect(arr113_1[0].index).assertEqual(1);
      const matches113_2 = str113.matchAll(re113);
      let arr113_2 = Array.from(matches113_2);
      expect(arr113_2[1].index).assertEqual(3);
    });

    /**
     * @tc.name   RegExpCombination1Test114
     * @tc.number BUILTINS_REGEXP_COMBINATION_TEST11400
     * @tc.desc   Test Method Combination in RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegExpCombination1Test114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re114 = /i{2}/y;
      const str114 = "iiiii";
      re114.lastIndex = 0;
      expect(re114.exec(str114)?.[0]).assertEqual("ii");
      expect(re114.lastIndex).assertEqual(2);
      re114.lastIndex = 2;
      expect(re114.exec(str114)?.[0]).assertEqual("ii");
      expect(re114.lastIndex).assertEqual(4);
    });

    /**
     * @tc.name   RegExpCombination1Test115
     * @tc.number BUILTINS_REGEXP_COMBINATION_TEST11500
     * @tc.desc   Test Method Combination in RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegExpCombination1Test115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re115c = /(j)k/g;
      const re115n = /(?:j)k/g;
      const str115 = "jkjk";
      let replace115c = str115.replace(re115c, "$1");
      expect(replace115c).assertEqual("jj");
      let replace115n = str115.replace(re115n, "$1");
      expect(replace115n).assertEqual("$1$1");
    });

    /**
     * @tc.name   RegExpCombination1Test116
     * @tc.number BUILTINS_REGEXP_COMBINATION_TEST11600
     * @tc.desc   Test Method Combination in RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegExpCombination1Test116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re116a = /l/g;
      const re116b = /l/g;
      const str116 = "lll";
      re116a.exec(str116);
      expect(re116a.lastIndex).assertEqual(1);
      expect(re116b.lastIndex).assertEqual(0);
      re116b.exec(str116);
      expect(re116b.lastIndex).assertEqual(1);
    });

    /**
     * @tc.name   RegExpCombination1Test118
     * @tc.number BUILTINS_REGEXP_COMBINATION_TEST11800
     * @tc.desc   Test Method Combination in RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegExpCombination1Test118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re118 = /m/g;
      const str118 = "mmm";
      re118.lastIndex = 2;
      let search118_1 = str118.search(re118);
      expect(search118_1).assertEqual(0);
      expect(re118.lastIndex).assertEqual(2);
    });

    /**
     * @tc.name   RegExpCombination1Test119
     * @tc.number BUILTINS_REGEXP_COMBINATION_TEST11900
     * @tc.desc   Test Method Combination in RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegExpCombination1Test119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re119 = /^n|p$/gm;
      const str119 = "np\nnpp\nnp";
      let exec119_1 = re119.exec(str119);
      expect(exec119_1?.[0]).assertEqual("n");
      expect(re119.lastIndex).assertEqual(1);
      let exec119_2 = re119.exec(str119);
      expect(exec119_2?.[0]).assertEqual("p");
      expect(re119.lastIndex).assertEqual(2);
    });

    /**
     * @tc.name   RegExpCombination1Test120
     * @tc.number BUILTINS_REGEXP_COMBINATION_TEST12000
     * @tc.desc   Test Method Combination in RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegExpCombination1Test120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(RegExpCombination1.RegExpCombination1Test120()).assertDeepEquals(["qr:q:r:0", "qr:q:r:2"]);
    });

    /**
     * @tc.name   RegExpCombination1Test121
     * @tc.number BUILTINS_REGEXP_COMBINATION_TEST12100
     * @tc.desc   Test Method Combination in RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegExpCombination1Test121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re121 = /\u{263A}/gu;
      const str121 = "☺☺";
      let exec121_1 = re121.exec(str121);
      expect(exec121_1?.[0]).assertEqual("☺");
      expect(re121.lastIndex).assertEqual(1);
      let exec121_2 = re121.exec(str121);
      expect(exec121_2?.index).assertEqual(1);
    });

    /**
     * @tc.name   RegExpCombination1Test122
     * @tc.number BUILTINS_REGEXP_COMBINATION_TEST12200
     * @tc.desc   Test Method Combination in RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegExpCombination1Test122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re122 = /s+/g;
      const str122 = "ssss";
      let exec122_1 = re122.exec(str122);
      expect(exec122_1?.[0]).assertEqual("ssss");
      expect(re122.lastIndex).assertEqual(4);
      let exec122_2 = re122.exec(str122);
      expect(exec122_2).assertNull();
      expect(re122.lastIndex).assertEqual(0);
    });

    /**
     * @tc.name   RegExpCombination1Test123
     * @tc.number BUILTINS_REGEXP_COMBINATION_TEST12300
     * @tc.desc   Test Method Combination in RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegExpCombination1Test123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re123 = /,/g;
      const str123 = "";
      let split123_1 = str123.split(re123);
      expect(split123_1).assertDeepEquals([""]);
      let split123_2 = str123.split(re123, 1);
      expect(split123_2).assertDeepEquals([""]);
    });

    /**
     * @tc.name   RegExpCombination1Test124
     * @tc.number BUILTINS_REGEXP_COMBINATION_TEST12400
     * @tc.desc   Test Method Combination in RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegExpCombination1Test124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re124 = /(?<=t{2})u/g;
      const str124 = "ttuttu";
      let exec124_1 = re124.exec(str124);
      expect(exec124_1?.index).assertEqual(2);
      expect(re124.lastIndex).assertEqual(3);
      let exec124_2 = re124.exec(str124);
      expect(exec124_2?.index).assertEqual(5);
    });

    /**
     * @tc.name   RegExpCombination1Test125
     * @tc.number BUILTINS_REGEXP_COMBINATION_TEST12500
     * @tc.desc   Test Method Combination in RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegExpCombination1Test125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re125 = /(?<a>v)(?<b>w)/;
      const str125 = "vwvw";
      let match125_1 = str125.match(re125);
      expect(match125_1?.groups?.a).assertEqual("v");
      expect(match125_1?.groups?.b).assertEqual("w");
      expect(re125.lastIndex).assertEqual(0);
      let match125_2 = str125.match(re125);
      expect(match125_2?.index).assertEqual(0);

    });

    /**
     * @tc.name   RegExpCombination1Test126
     * @tc.number BUILTINS_REGEXP_COMBINATION_TEST12600
     * @tc.desc   Test Method Combination in RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegExpCombination1Test126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re126 = /x/g;
      const str126a = "xx";
      const str126b = "x";
      expect(re126.test(str126a)).assertTrue();
      expect(re126.lastIndex).assertEqual(1);
      expect(re126.test(str126b)).assertFalse();
      expect(re126.test(str126b)).assertTrue();
      expect(re126.lastIndex).assertEqual(1);
    });

    /**
     * @tc.name   RegExpCombination1Test127
     * @tc.number BUILTINS_REGEXP_COMBINATION_TEST12700
     * @tc.desc   Test Method Combination in RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegExpCombination1Test127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re127s = /y.z/sg;
      const re127 = /y.z/g;
      const str127 = "y\nz y-z";
      expect(re127s.exec(str127)?.[0]).assertEqual("y\nz");
      expect(re127.exec(str127)?.[0]).assertEqual("y-z");

    });

    /**
     * @tc.name   RegExpCombination1Test128
     * @tc.number BUILTINS_REGEXP_COMBINATION_TEST12800
     * @tc.desc   Test Method Combination in RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegExpCombination1Test128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re128 = /z/g;
      re128.lastIndex = 100;
      expect(re128.lastIndex).assertEqual(100);
      const str128 = "zz";
      expect(re128.exec(str128)).assertNull();
      expect(re128.lastIndex).assertEqual(0);
    });

    /**
     * @tc.name   RegExpCombination1Test129
     * @tc.number BUILTINS_REGEXP_COMBINATION_TEST12900
     * @tc.desc   Test Method Combination in RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegExpCombination1Test129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re129 = /(?=a)b/g;
      const str129 = "abba";
      let exec129_1 = re129.exec(str129);
      expect(exec129_1).assertNull();
      expect(re129.lastIndex).assertEqual(0);
      const re129fix = /(?=b)a/g;
      expect(re129fix.exec(str129)?.index).assertEqual(undefined);

    });

    /**
     * @tc.name   RegExpCombination1Test130
     * @tc.number BUILTINS_REGEXP_COMBINATION_TEST13000
     * @tc.desc   Test Method Combination in RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegExpCombination1Test130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re130 = /A./igm;
      const str130 = "a1\nb2\nA3";
      let replace130_1 = str130.replace(re130, "x");
      expect(replace130_1).assertEqual("x\nb2\nx");
      let replace130_2 = str130.replace(re130, "y");
      expect(replace130_2).assertEqual("y\nb2\ny");

    });

    /**
     * @tc.name   RegExpCombination1Test131
     * @tc.number BUILTINS_REGEXP_COMBINATION_TEST13100
     * @tc.desc   Test Method Combination in RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegExpCombination1Test131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re131 = /\u{1F601}/yu;
      const str131 = "😁😁a";
      re131.lastIndex = 0;
      let exec131_1 = re131.exec(str131);
      expect(exec131_1?.[0]).assertEqual("😁");
      expect(re131.lastIndex).assertEqual(2);
      re131.lastIndex = 2;
      let exec131_2 = re131.exec(str131);
      expect(exec131_2?.[0]).assertEqual("😁");
      expect(re131.lastIndex).assertEqual(4);
    });

    /**
     * @tc.name   RegExpCombination1Test132
     * @tc.number BUILTINS_REGEXP_COMBINATION_TEST13200
     * @tc.desc   Test Method Combination in RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegExpCombination1Test132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re132 = /\v/g;
      const str132 = "a\vb\vc";
      let exec132_1 = re132.exec(str132);
      expect(exec132_1?.index).assertEqual(1);
      expect(re132.lastIndex).assertEqual(2);
      let exec132_2 = re132.exec(str132);
      expect(exec132_2?.index).assertEqual(3);
      expect(re132.lastIndex).assertEqual(4);
    });

    /**
     * @tc.name   RegExpCombination1Test133
     * @tc.number BUILTINS_REGEXP_COMBINATION_TEST13300
     * @tc.desc   Test Method Combination in RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegExpCombination1Test133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re133 = /b/g;
      const str133 = "bbbb";
      re133.lastIndex = 2;
      const matches133_1 = str133.matchAll(re133);
      let arr133_1 = Array.from(matches133_1);
      expect(arr133_1.length).assertEqual(2);
      re133.lastIndex = 0;
      let exec133_1 = re133.exec(str133);
      expect(exec133_1?.index).assertEqual(0);
    });

    /**
     * @tc.name   RegExpCombination1Test134
     * @tc.number BUILTINS_REGEXP_COMBINATION_TEST13400
     * @tc.desc   Test Method Combination in RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegExpCombination1Test134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re134 = /c.*?d/gs;
      const str134 = "c1\nd2c3d";
      let replace134_1 = str134.replace(re134, "x");
      expect(replace134_1).assertEqual("x2x");
      let replace134_2 = str134.replace(re134, "y");
      expect(replace134_2).assertEqual("y2y");
    });

    /**
     * @tc.name   RegExpCombination1Test135
     * @tc.number BUILTINS_REGEXP_COMBINATION_TEST13500
     * @tc.desc   Test Method Combination in RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegExpCombination1Test135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re135 = /(?<=[0-9])e/g;
      const str135 = "e1e2e3e";
      let exec135_1 = re135.exec(str135);
      expect(exec135_1?.index).assertEqual(2);
      expect(re135.lastIndex).assertEqual(3);
      let exec135_2 = re135.exec(str135);
      expect(exec135_2?.index).assertEqual(4);
    });

    /**
     * @tc.name   RegExpCombination1Test136
     * @tc.number BUILTINS_REGEXP_COMBINATION_TEST13600
     * @tc.desc   Test Method Combination in RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegExpCombination1Test136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re136 = /f/g;
      const str136 = "fff";
      let split136_1 = str136.split(re136);
      expect(split136_1).assertDeepEquals(["", "", "", ""]);
      let split136_2 = str136.split(re136, 2);
      expect(split136_2).assertDeepEquals(["", ""]);
    });

    /**
     * @tc.name   RegExpCombination1Test137
     * @tc.number BUILTINS_REGEXP_COMBINATION_TEST13700
     * @tc.desc   Test Method Combination in RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegExpCombination1Test137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re137 = /g/g;
      const str137 = "ggg";
      let match137 = str137.match(re137);
      let exec137Arr: string[] = [];
      let exec137Res: RegExpExecArray | null;
      while ((exec137Res = re137.exec(str137))) {
        exec137Arr.push(exec137Res[0]);
      }
      expect(match137).assertDeepEquals(exec137Arr);
    });

    /**
     * @tc.name   RegExpCombination1Test138
     * @tc.number BUILTINS_REGEXP_COMBINATION_TEST13800
     * @tc.desc   Test Method Combination in RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegExpCombination1Test138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re138 = /h/g;
      const str138 = "hh";
      re138.lastIndex = 2;
      expect(re138.test(str138)).assertFalse();
      expect(re138.lastIndex).assertEqual(0);
      expect(re138.test(str138)).assertTrue();
    });

    /**
     * @tc.name   RegExpCombination1Test139
     * @tc.number BUILTINS_REGEXP_COMBINATION_TEST13900
     * @tc.desc   Test Method Combination in RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegExpCombination1Test139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re139 = /(?<key>\w+)=(?<value>\w+)/g;
      const str139 = "name=alice age=30";
      const matches139 = str139.matchAll(re139);
      let arr139 = Array.from(matches139);
      expect(arr139[0].groups?.key).assertEqual("name");
      expect(arr139[0].groups?.value).assertEqual("alice");
      expect(arr139[1].groups?.key).assertEqual("age");
    });

    /**
     * @tc.name   RegExpCombination1Test140
     * @tc.number BUILTINS_REGEXP_COMBINATION_TEST14000
     * @tc.desc   Test Method Combination in RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegExpCombination1Test140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re140 = / /g;
      const str140 = "abc";
      let split140_1 = str140.split(re140, 3);
      expect(split140_1).assertDeepEquals(["abc"]);
      let split140_2 = str140.split(re140, 1);
      expect(split140_2).assertDeepEquals(["abc"]);
    });

    /**
     * @tc.name   RegExpCombination1Test141
     * @tc.number BUILTINS_REGEXP_COMBINATION_TEST14100
     * @tc.desc   Test Method Combination in RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegExpCombination1Test141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re141s = /^a.*c$/sg;
      const re141 = /^a.*c$/g;
      const str141 = "a\nb\nc";
      expect(re141s.exec(str141)?.[0]).assertEqual("a\nb\nc");
      expect(re141.exec(str141)).assertNull();
    });

    /**
     * @tc.name   RegExpCombination1Test142
     * @tc.number BUILTINS_REGEXP_COMBINATION_TEST14200
     * @tc.desc   Test Method Combination in RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegExpCombination1Test142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re142 = /i/g;
      const str142 = "iiii";
      expect(re142.test(str142)).assertTrue();
      expect(re142.lastIndex).assertEqual(1);
      expect(re142.test(str142)).assertTrue();
      expect(re142.lastIndex).assertEqual(2);
      expect(re142.test(str142)).assertTrue();
      expect(re142.lastIndex).assertEqual(3);
    });

    /**
     * @tc.name   RegExpCombination1Test143
     * @tc.number BUILTINS_REGEXP_COMBINATION_TEST14300
     * @tc.desc   Test Method Combination in RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegExpCombination1Test143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re143 = /中{2}/g;
      const str143 = "中中中中";
      let exec143_1 = re143.exec(str143);
      expect(exec143_1?.[0]).assertEqual("中中");
      expect(re143.lastIndex).assertEqual(2);
      let exec143_2 = re143.exec(str143);
      expect(exec143_2?.[0]).assertEqual("中中");
      expect(re143.lastIndex).assertEqual(4);
    });

    /**
     * @tc.name   RegExpCombination1Test144
     * @tc.number BUILTINS_REGEXP_COMBINATION_TEST14400
     * @tc.desc   Test Method Combination in RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegExpCombination1Test144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re144 = /j/g;
      const str144 = "jjj";
      let replace144_1 = str144.replace(re144, "j");
      expect(replace144_1).assertEqual("jjj");
      expect(re144.lastIndex).assertEqual(0);
      let exec144_1 = re144.exec(str144);
      expect(exec144_1?.index).assertEqual(0);
    });

    /**
     * @tc.name   RegExpCombination1Test145
     * @tc.number BUILTINS_REGEXP_COMBINATION_TEST14500
     * @tc.desc   Test Method Combination in RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegExpCombination1Test145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re145 = /^k/y;
      const str145 = "kkk";
      re145.lastIndex = 0;
      expect(re145.exec(str145)?.[0]).assertEqual("k");
      expect(re145.lastIndex).assertEqual(1);
      re145.lastIndex = 1;
      expect(re145.exec(str145)).assertNull();
    });

    /**
     * @tc.name   RegExpCombination1Test146
     * @tc.number BUILTINS_REGEXP_COMBINATION_TEST14600
     * @tc.desc   Test Method Combination in RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegExpCombination1Test146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re146g = /l/g;
      const re146 = /l/;
      const str146 = "abc";
      expect(str146.match(re146g)).assertDeepEquals(null);
      expect(str146.match(re146)).assertNull();
    });

    /**
     * @tc.name   RegExpCombination1Test147
     * @tc.number BUILTINS_REGEXP_COMBINATION_TEST14700
     * @tc.desc   Test Method Combination in RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegExpCombination1Test147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re147 = /(?<=m)n/g;
      const str147 = "mn mnn mmn";
      let replace147_1 = str147.replace(re147, "x");
      expect(replace147_1).assertDeepEquals("mx mxn mmx");
      let replace147_2 = str147.replace(re147, "y");
      expect(replace147_2).assertDeepEquals("my myn mmy");
    });

    /**
     * @tc.name   RegExpCombination1Test148
     * @tc.number BUILTINS_REGEXP_COMBINATION_TEST14800
     * @tc.desc   Test Method Combination in RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegExpCombination1Test148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re148 = /p/;
      const str148 = "a\nb\np\nc";
      let search148_1 = str148.search(re148);
      expect(search148_1).assertEqual(4);
      let search148_2 = str148.search(re148);
      expect(search148_2).assertEqual(4);
    });

    /**
     * @tc.name   RegExpCombination1Test149
     * @tc.number BUILTINS_REGEXP_COMBINATION_TEST14900
     * @tc.desc   Test Method Combination in RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegExpCombination1Test149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re149 = /q/g;
      const str149 = "qqxqq";
      re149.exec(str149);
      re149.exec(str149);
      expect(re149.lastIndex).assertEqual(2);
      let exec149_3 = re149.exec(str149);
      expect(exec149_3).assertDeepEquals(["q"]);
      expect(re149.lastIndex).assertEqual(4);
      let exec149_4 = re149.exec(str149);
      expect(exec149_4?.index).assertEqual(4);
    });

    /**
     * @tc.name   RegExpCombination1Test150
     * @tc.number BUILTINS_REGEXP_COMBINATION_TEST15000
     * @tc.desc   Test Method Combination in RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegExpCombination1Test150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re150 = /(?:r+s?)/g;
      const str150 = "rr rs rrr s";
      const matches150 = str150.matchAll(re150);
      let arr150 = Array.from(matches150);
      expect(arr150[0][0]).assertEqual("rr");
      expect(arr150[1][0]).assertEqual("rs");
      expect(arr150[2][0]).assertEqual("rrr");
    });

    /**
     * @tc.name   RegExpCombination1Test151
     * @tc.number BUILTINS_REGEXP_COMBINATION_TEST15100
     * @tc.desc   Test Method Combination in RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegExpCombination1Test151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re151 = /\p{Letter}/gu;
      const str151 = "aA中ァ";
      let exec151_1 = re151.exec(str151);
      expect(exec151_1?.[0]).assertEqual("a");
      let exec151_2 = re151.exec(str151);
      expect(exec151_2?.[0]).assertEqual("A");
      let exec151_3 = re151.exec(str151);
      expect(exec151_3?.[0]).assertEqual("中");
    });

    /**
     * @tc.name   RegExpCombination1Test152
     * @tc.number BUILTINS_REGEXP_COMBINATION_TEST15200
     * @tc.desc   Test Method Combination in RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegExpCombination1Test152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re152 = /,/g;
      const str152 = "a,b,c,d";
      let split152_1 = str152.split(re152, 1);
      expect(split152_1).assertDeepEquals(["a"]);
      let split152_2 = str152.split(re152, 1);
      expect(split152_2).assertDeepEquals(["a"]);
    });

    /**
     * @tc.name   RegExpCombination1Test153
     * @tc.number BUILTINS_REGEXP_COMBINATION_TEST15300
     * @tc.desc   Test Method Combination in RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegExpCombination1Test153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re153 = /t+(?=u)/g;
      const str153 = "tttu ttu tu";
      let exec153_1 = re153.exec(str153);
      expect(exec153_1?.[0]).assertEqual("ttt");
      expect(re153.lastIndex).assertEqual(3);
      let exec153_2 = re153.exec(str153);
      expect(exec153_2?.[0]).assertEqual("tt");
    });

    /**
     * @tc.name   RegExpCombination1Test154
     * @tc.number BUILTINS_REGEXP_COMBINATION_TEST15400
     * @tc.desc   Test Method Combination in RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegExpCombination1Test154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re154 = /v/g;
      const str154 = "";
      expect(re154.test(str154)).assertFalse();
      expect(re154.lastIndex).assertEqual(0);
      expect(re154.exec(str154)).assertNull();
      expect(re154.lastIndex).assertEqual(0);
    });

    /**
     * @tc.name   RegExpCombination1Test155
     * @tc.number BUILTINS_REGEXP_COMBINATION_TEST15500
     * @tc.desc   Test Method Combination in RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegExpCombination1Test155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re155 = /^w/gm;
      const str155 = "w1\nw2\nw3";
      let exec155_1 = re155.exec(str155);
      expect(exec155_1?.index).assertEqual(0);
      expect(re155.lastIndex).assertEqual(1);
      let exec155_2 = re155.exec(str155);
      expect(exec155_2?.index).assertEqual(3);
      expect(re155.lastIndex).assertEqual(4);
    });

    /**
     * @tc.name   RegExpCombination1Test156
     * @tc.number BUILTINS_REGEXP_COMBINATION_TEST15600
     * @tc.desc   Test Method Combination in RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegExpCombination1Test156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re156 = /x/g;
      let str156 = "xxx";
      str156.replace(re156, () => {
        str156 = "yyy";
        return "z";
      });
      expect(str156).assertEqual("yyy");
      let replace156_2 = str156.replace(re156, "z");
      expect(replace156_2).assertEqual("yyy");
    });

    /**
     * @tc.name   RegExpCombination1Test157
     * @tc.number BUILTINS_REGEXP_COMBINATION_TEST15700
     * @tc.desc   Test Method Combination in RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegExpCombination1Test157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re157d = /\d+/g;
      const re157D = /\D+/g;
      const str157 = "123abc456def";
      expect(re157d.exec(str157)?.[0]).assertEqual("123");
      expect(re157D.exec(str157)?.[0]).assertEqual("abc");
      expect(re157d.exec(str157)?.[0]).assertEqual("456");
      expect(re157D.exec(str157)?.[0]).assertEqual("def");
    });

    /**
     * @tc.name   RegExpCombination1Test158
     * @tc.number BUILTINS_REGEXP_COMBINATION_TEST15800
     * @tc.desc   Test Method Combination in RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegExpCombination1Test158', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re158 = /z*/y;
      const str158 = "zzz";
      re158.lastIndex = 0;
      expect(re158.exec(str158)?.[0]).assertEqual("zzz");
      expect(re158.lastIndex).assertEqual(3);
      re158.lastIndex = 3;
      expect(re158.exec(str158)?.[0]).assertEqual("");
    });

    /**
     * @tc.name   RegExpCombination1Test159
     * @tc.number BUILTINS_REGEXP_COMBINATION_TEST15900
     * @tc.desc   Test Method Combination in RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegExpCombination1Test159', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re159 = /a/g;
      const str159 = "aa";
      const matches159 = str159.matchAll(re159);
      let arr159 = Array.from(matches159);
      expect(arr159[0].input).assertEqual("aa");
      expect(arr159[1].input).assertEqual("aa");

    });

    /**
     * @tc.name   RegExpCombination1Test160
     * @tc.number BUILTINS_REGEXP_COMBINATION_TEST16000
     * @tc.desc   Test Method Combination in RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegExpCombination1Test160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re160 = /b/g;
      const str160 = "bbbb";
      re160.test(str160);
      expect(re160.lastIndex).assertEqual(1);
      str160.match(re160);
      expect(re160.lastIndex).assertEqual(0);
      re160.exec(str160);
      expect(re160.lastIndex).assertEqual(1);
      str160.split(re160);
      expect(re160.lastIndex).assertEqual(1);
      re160.test(str160);
      expect(re160.lastIndex).assertEqual(2);
    });


  })
}