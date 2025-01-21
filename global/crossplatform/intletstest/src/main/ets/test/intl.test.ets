/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
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

import I18n from "@ohos.i18n";
import Intl from "@ohos.intl";
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium";

export default function intlTest() {
  describe("intlTest", function () {
    console.log("*************start IntlTest*************");

    /* *
     * @tc.number: LOCALE_TEST_001
     * @tc.name  : test the language in en-Latn-GB locale
     * @tc.desc  : check the language
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("localeTest001", 0, function () {
      let locale = new Intl.Locale("en-Latn-GB");
      console.log("LOCALE_TEST_001 " + locale.language);
      expect(locale.language).assertEqual("en");
    });

    /* *
     * @tc.number: LOCALE_TEST_002
     * @tc.name  : test the numeric with false value
     * @tc.desc  : check the numeric
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("localeTest002", 0, function () {
      let locale = new Intl.Locale("en-Latn-GB", undefined);
      console.log("LOCALE_TEST_002 " + locale.numeric);
      expect(locale.numeric).assertFalse();
    });

    /* *
     * @tc.number: LOCALE_TEST_003
     * @tc.name  : test the script in locale
     * @tc.desc  : check the script
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("localeTest003", 0, function () {
      let locale = new Intl.Locale("en-Latn-GB");
      console.log("LOCALE_TEST_003 " + locale.script);
      expect(locale.script).assertEqual("Latn");
    });

    /* *
     * @tc.number: LOCALE_TEST_004
     * @tc.name  : test the region in locale
     * @tc.desc  : check the region
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("localeTest004", 0, function () {
      let locale = new Intl.Locale("en-Latn-GB");
      console.log("LOCALE_TEST_004 " + locale.region);
      expect(locale.region).assertEqual("GB");
    });

    /* *
     * @tc.number: LOCALE_TEST_005
     * @tc.name  : test the basename in locale
     * @tc.desc  : check the basename
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("localeTest005", 0, function () {
      let locale = new Intl.Locale("en-Latn-GB");
      console.log("LOCALE_TEST_005 " + locale.baseName);
      expect(locale.baseName).assertEqual("en-Latn-GB");
    });

    /* *
     * @tc.number: LOCALE_TEST_006
     * @tc.name  : test the hourCycle
     * @tc.desc  : check the hourCycle
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("localeTest006", 0, function () {
      let locale = new Intl.Locale("zh-CN", { hourCycle: "h24", calendar: "gregory" });
      console.log("LOCALE_TEST_006 " + locale.hourCycle);
      expect(locale.hourCycle).assertEqual("h24");
    });

    /* *
     * @tc.number: LOCALE_TEST_007
     * @tc.name  : test the calendar
     * @tc.desc  : check the calendar
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("localeTest007", 0, function () {
      let locale = new Intl.Locale("zh-CN", { hourCycle: "h24", calendar: "gregory" });
      console.log("LOCALE_TEST_007 " + locale.calendar);
      expect(locale.calendar).assertEqual("gregory");
    });

    /* *
     * @tc.number: LOCALE_TEST_008
     * @tc.name  : test the japanese calendar
     * @tc.desc  : check the japanese calendar
     * @tc.size  : MediumTest
     * @tc.type  : Field
     * @tc.level : Level 0
     */
    it("localeTest008", 0, function () {
      let locale = new Intl.Locale("ja-Jpan-JP-u-ca-japanese-hc-h12");
      console.log("LOCALE_TEST_008 " + locale.calendar);
      expect(locale.calendar).assertEqual("japanese");
    });

    /* *
     * @tc.number: LOCALE_TEST_009
     * @tc.name  : test the h12 hourCycle
     * @tc.desc  : check the h12 hourCycle
     * @tc.size  : MediumTest
     * @tc.type  : Field
     * @tc.level : Level 0
     */
    it("localeTest009", 0, function () {
      let locale = new Intl.Locale("ja-Jpan-JP-u-ca-japanese-hc-h12");
      console.log("LOCALE_TEST_009 " + locale.hourCycle);
      expect(locale.hourCycle).assertEqual("h12");
    });

    /* *
     * @tc.number: LOCALE_TEST_010
     * @tc.name  : test the caseFirst with upper
     * @tc.desc  : check the caseFirst
     * @tc.size  : MediumTest
     * @tc.type  : Field
     * @tc.level : Level 0
     */
    it("localeTest010", 0, function () {
      let locale = new Intl.Locale("ja-Jpan-JP", { caseFirst: "upper" });
      console.log("LOCALE_TEST_010 " + locale.caseFirst);
      expect(locale.caseFirst).assertEqual("upper");
    });

    /* *
     * @tc.number: LOCALE_TEST_011
     * @tc.name  : test the collation
     * @tc.desc  : check the collation
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("localeTest011", 0, function () {
      let locale = new Intl.Locale("ja-Jpan-JP", { collation: "big5han" });
      console.log("LOCALE_TEST_011 " + locale.collation);
      expect(locale.collation).assertEqual("big5han");
    });

    /* *
     * @tc.number: LOCALE_TEST_012
     * @tc.name  : test the numeric with true value
     * @tc.desc  : check the numeric
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("localeTest012", 0, function () {
      let locale = new Intl.Locale("ja-Jpan-JP", { numeric: true });
      console.log("LOCALE_TEST_012 " + locale.numeric);
      expect(locale.numeric).assertTrue();
    });

    /* *
     * @tc.number: LOCALE_TEST_013
     * @tc.name  : test the numberingSystem
     * @tc.desc  : check the numberingSystem
     * @tc.size  : MediumTest
     * @tc.type  : Field
     * @tc.level : Level 0
     */
    it("LOCALE_TEST_013", 0, function () {
      let locale = new Intl.Locale("ja-Jpan-JP", { numberingSystem: "arab" });
      console.log("LOCALE_TEST_013 " + locale.numberingSystem);
      expect(locale.numberingSystem).assertEqual("arab");
    });

    /* *
     * @tc.number: LOCALE_TEST_014
     * @tc.name  : test the toString interface with zh
     * @tc.desc  : check the toString method with zh
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("localeTest014", 0, function () {
      let locale = new Intl.Locale("zh");
      console.log("LOCALE_TEST_14 " + locale.toString());
      expect(locale.toString()).assertEqual("zh");
    });

    /* *
     * @tc.number: LOCALE_TEST_015
     * @tc.name  : test the toString interface with zh-CN
     * @tc.desc  : check the toString method with zh-cn
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("localeTest015", 0, function () {
      let locale = new Intl.Locale("zh-CN");
      console.log("LOCALE_TEST_015 " + locale.toString());
      expect(locale.toString()).assertEqual("zh-CN");
    });

    /* *
     * @tc.number: LOCALE_TEST_016
     * @tc.name  : test the toString interface with zh-Hans-CN
     * @tc.desc  : check the toString method with zh-Hans-CN
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("localeTest016", 0, function () {
      let locale = new Intl.Locale("zh-Hans-CN");
      console.log("LOCALE_TEST_016 " + locale.toString());
      expect(locale.toString()).assertEqual("zh-Hans-CN");
    });

    /* *
     * @tc.number: LOCALE_TEST_017
     * @tc.name  : test the toString interface with zh-Hans-CN-u-hc-h12-ca-japanese
     * @tc.desc  : check the toString method with zh-Hans-CN-u-hc-h12-ca-japanese
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("localeTest017", 0, function () {
      let locale = new Intl.Locale("zh-Hans-CN-u-ca-japanese-hc-h12");
      console.log("LOCALE_TEST_017 " + locale.toString());
      expect(locale.toString()).assertEqual("zh-Hans-CN-u-hc-h12-ca-japanese");
    });

    /* *
     * @tc.number: LOCALE_TEST_018
     * @tc.name  : test the maximize interface with zh-u-ca-gregory-co-compact param
     * @tc.desc  : check the toString method with zh-u-ca-gregory-co-compact
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("localeTest018", 0, function () {
      let locale = new Intl.Locale("zh", { calendar: "gregory", collation: "compact" });
      console.log("LOCALE_TEST_018 " + locale.toString());
      expect(locale.toString()).assertEqual("zh-u-ca-gregory-co-compact");
    });

    /* *
     * @tc.number: LOCALE_TEST_019
     * @tc.name  : test the toString interface with zh-CN-u-ca-gregory-co-compact param
     * @tc.desc  : check the toString method with zh-u-ca-gregory-co-compact
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("localeTest019", 0, function () {
      let locale = new Intl.Locale("zh-CN", { calendar: "gregory", collation: "compact" });
      console.log("LOCALE_TEST_019 " + locale.toString());
      expect(locale.toString()).assertEqual("zh-CN-u-ca-gregory-co-compact");
    });

    /* *
     * @tc.number: LOCALE_TEST_020
     * @tc.name  : test the toString interface with zh-hans-CN-u-ca-gregory-co-compact param
     * @tc.desc  : check the toString method with zh-hans-CN-u-ca-gregory-co-compact
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("localeTest020", 0, function () {
      let locale = new Intl.Locale("zh-hans-CN", { calendar: "gregory", collation: "compact" });
      console.log("LOCALE_TEST_020 " + locale.toString());
      expect(locale.toString()).assertEqual("zh-hans-CN-u-ca-gregory-co-compact");
    });

    /* *
     * @tc.number: LOCALE_TEST_021
     * @tc.name  : test the minimize interface with one param zh
     * @tc.desc  : check the minimize method with one param zh
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("localeTest021", 0, function () {
      let locale = new Intl.Locale("zh");
      console.log("LOCALE_TEST_021 " + locale.minimize().toString());
      expect(locale.minimize().toString()).assertEqual("zh");
    });

    /* *
     * @tc.number: LOCALE_TEST_022
     * @tc.name  : test the minimize interface with one param zh-CN
     * @tc.desc  : check the minimize method with one param zh-CN
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("localeTest022", 0, function () {
      let locale = new Intl.Locale("zh-CN");
      console.log("LOCALE_TEST_022 " + locale.minimize().toString());
      expect(locale.minimize().toString()).assertEqual("zh");
    });

    /* *
     * @tc.number: LOCALE_TEST_023
     * @tc.name  : test the minimize interface with one param zh-Hans-CN
     * @tc.desc  : check the minimize method with one param zh-Hans-CN
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("localeTest023", 0, function () {
      let locale = new Intl.Locale("zh-Hans-CN");
      console.log("LOCALE_TEST_023 " + locale.minimize().toString());
      expect(locale.minimize().toString()).assertEqual("zh");
    });

    /* *
     * @tc.number: LOCALE_TEST_024
     * @tc.name  : test the minimize interface with one param zh-Hans-CN-u-ca-gregory-co-compact
     * @tc.desc  : check the minimize method with one param zh-Hans-CN-u-ca-gregory-co-compact
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("localeTest024", 0, function () {
      let locale = new Intl.Locale("zh-Hans-CN-u-ca-gregory-co-compact");
      console.log("LOCALE_TEST_024 " + locale.minimize().toString());
      expect(locale.minimize().toString()).assertEqual("zh-u-ca-gregory-co-compact");
    });

    /* *
     * @tc.number: LOCALE_TEST_025
     * @tc.name  : test the minimize interface with zh lcoale
     * @tc.desc  : check the minimize method with zh lcoale
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("localeTest025", 0, function () {
      let locale = new Intl.Locale("zh", { calendar: "gregory", collation: "compact" });
      console.log("LOCALE_TEST_025 " + locale.minimize().toString());
      expect(locale.minimize().toString()).assertEqual("zh-u-ca-gregory-co-compact");
    });

    /* *
     * @tc.number: LOCALE_TEST_026
     * @tc.name  : test the minimize interface with zh-CN lcoale
     * @tc.desc  : check the minimize method with zh-CN lcoale
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("localeTest026", 0, function () {
      let locale = new Intl.Locale("zh-CN", { calendar: "gregory", collation: "compact" });
      console.log("LOCALE_TEST_026 " + locale.minimize().toString());
      expect(locale.minimize().toString()).assertEqual("zh-u-ca-gregory-co-compact");
    });

    /* *
     * @tc.number: LOCALE_TEST_027
     * @tc.name  : test the minimize interface with zh-Hans-CN lcoale
     * @tc.desc  : check the minimize method with zh-Hans-CN lcoale
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("localeTest027", 0, function () {
      let locale = new Intl.Locale("zh-hans-CN", { calendar: "gregory", collation: "compact" });
      console.log("LOCALE_TEST_027 " + locale.minimize().toString());
      expect(locale.minimize().toString()).assertEqual("zh-u-ca-gregory-co-compact");
    });

    /* *
     * @tc.number: LOCALE_TEST_028
     * @tc.name  : test the maximize interface with one param zh
     * @tc.desc  : check the maximize method with one param zh
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("localeTest028", 0, function () {
      let locale = new Intl.Locale("zh");
      console.log("LOCALE_TEST_028 " + locale.maximize().toString());
      expect(locale.maximize().toString()).assertEqual("zh-Hans-CN");
    });

    /* *
     * @tc.number: LOCALE_TEST_029
     * @tc.name  : test the maximize interface with one param zh-CN
     * @tc.desc  : check the maximize method with one param zh-CN
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("localeTest029", 0, function () {
      let locale = new Intl.Locale("zh-CN");
      console.log("LOCALE_TEST_029 " + locale.maximize().toString());
      expect(locale.maximize().toString()).assertEqual("zh-Hans-CN");
    });

    /* *
     * @tc.number: LOCALE_TEST_030
     * @tc.name  : test the maximize interface with one param zh-Hans-CN-u-ca-gregory-co-compact
     * @tc.desc  : check the maximize method with one param zh-Hans-CN-u-ca-gregory-co-compact
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("localeTest030", 0, function () {
      let locale = new Intl.Locale("zh-Hans-CN");
      console.log("LOCALE_TEST_030 " + locale.maximize().toString());
      expect(locale.maximize().toString()).assertEqual("zh-Hans-CN");
    });

    /* *
     * @tc.number: LOCALE_TEST_031
     * @tc.name  : test the maximize interface with zh-Hans-CN-u-ca-gregory-co-compact locale
     * @tc.desc  : check the maximize method with zh-Hans-CN-u-ca-gregory-co-compact locale
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("localeTest031", 0, function () {
      let locale = new Intl.Locale("zh-Hans-CN-u-ca-gregory-co-compact");
      console.log("LOCALE_TEST_031 " + locale.maximize().toString());
      expect(locale.maximize().toString()).assertEqual("zh-Hans-CN-u-ca-gregory-co-compact");
    });

    /* *
     * @tc.number: LOCALE_TEST_032
     * @tc.name  : test the maximize interface with zh locale
     * @tc.desc  : check the maximize method with zh locale
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("localeTest032", 0, function () {
      let locale = new Intl.Locale("zh", { calendar: "gregory", collation: "compact" });
      console.log("LOCALE_TEST_032 " + locale.maximize().toString());
      expect(locale.maximize().toString()).assertEqual("zh-Hans-CN-u-ca-gregory-co-compact");
    });

    /* *
     * @tc.number: LOCALE_TEST_033
     * @tc.name  : test the maximize interface with zh-CN locale
     * @tc.desc  : check the maximize method with zh-CN locale
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("localeTest033", 0, function () {
      let locale = new Intl.Locale("zh-CN", { calendar: "gregory", collation: "compact" });
      console.log("LOCALE_TEST_033 " + locale.maximize().toString());
      expect(locale.maximize().toString()).assertEqual("zh-Hans-CN-u-ca-gregory-co-compact");
    });

    /* *
     * @tc.number: LOCALE_TEST_034
     * @tc.name  : test the maximize interface with zh-Hans-CN locale
     * @tc.desc  : check the maximize method with zh-Hans-CN locale
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("localeTest034", 0, function () {
      let locale = new Intl.Locale("zh-Hans-CN", { calendar: "gregory", collation: "compact" });
      console.log("LOCALE_TEST_034 " + locale.maximize().toString());
      expect(locale.maximize().toString()).assertEqual("zh-Hans-CN-u-ca-gregory-co-compact");
    });

    /* *
     * @tc.number: DATE_TIME_FORMAT_TEST_001
     * @tc.name  : format the datetime with en-GB locale
     * @tc.desc  : check the datefmt is not null
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("dateTimeFormatTest001", 0, function () {
      let datefmt = new Intl.DateTimeFormat("en-GB");
      expect(datefmt !== null).assertTrue();
    });

    /* *
     * @tc.number: DATE_TIME_FORMAT_TEST_002
     * @tc.name  : format the datetime with en-GB locale
     * @tc.desc  : check the datefmt is not null
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("dateTimeFormatTest002", 0, function () {
      let datefmt = new Intl.DateTimeFormat();
      expect(datefmt !== null).assertTrue();
    });

    /* *
     * @tc.number: DATE_TIME_FORMAT_TEST_003
     * @tc.name  : format the date with zh locale
     * @tc.desc  : check the format(date)
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("dateTimeFormatTest003", 0, function () {
      let date = new Date(2021, 11, 17, 3, 24, 0);
      let datefmt = new Intl.DateTimeFormat("zh");
      console.log("DATE_TIME_FORMAT_TEST_003 " + datefmt.format(date));
      expect(datefmt.format(date)).assertContain("2021");
    });

    /* *
     * @tc.number: DATE_TIME_FORMAT_TEST_004
     * @tc.name  : format the date with en locale
     * @tc.desc  : check the format(date)
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("dateTimeFormatTest004", 0, function () {
      let date = new Date(2021, 11, 17, 3, 24, 0);
      let datefmt = new Intl.DateTimeFormat("en");
      console.log("DATE_TIME_FORMAT_TEST_004 " + datefmt.format(date));
      expect(datefmt.format(date)).assertContain("21");
    });

    /* *
     * @tc.number: DATE_TIME_FORMAT_TEST_005
     * @tc.name  : format the date with en-US locale
     * @tc.desc  : check the format(date)
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("dateTimeFormatTest005", 0, function () {
      let date = new Date(2021, 11, 17, 3, 24, 0);
      let datefmt = new Intl.DateTimeFormat("en-US");
      console.log("DATE_TIME_FORMAT_TEST_005 " + datefmt.format(date));
      expect(datefmt.format(date)).assertContain("21");
    });

    /* *
     * @tc.number: DATE_TIME_FORMAT_TEST_006
     * @tc.name  : format the date with en-GB locale
     * @tc.desc  : check the format(date)
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("dateTimeFormatTest006", 0, function () {
      let date = new Date(2021, 11, 17, 3, 24, 0);
      let datefmt = new Intl.DateTimeFormat("en-GB");
      console.log("DATE_TIME_FORMAT_TEST_006 " + datefmt.format(date));
      expect(["2021", "12/16/21", "12/17/21"].indexOf(datefmt.format(date)) != -1).assertTrue();
    });

    /* *
     * @tc.number: DATE_TIME_FORMAT_TEST_007
     * @tc.name  : format the date with aa locale
     * @tc.desc  : check the format(date)
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("dateTimeFormatTest007", 0, function () {
      let date = new Date(2021, 11, 17, 3, 24, 0);
      let datefmt = new Intl.DateTimeFormat("aa");
      let value = datefmt.format(date);
      console.log("DATE_TIME_FORMAT_TEST_007 " + value);
      expect(value).assertInstanceOf("String");
    });

    /* *
     * @tc.number: DATE_TIME_FORMAT_TEST_008
     * @tc.name  : format the hour with ban and zh locale
     * @tc.desc  : check the hour with ban and zh locale
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("dateTimeFormatTest008", 0, function () {
      let date = new Date(2020, 11, 20, 14, 23, 16);
      let option = { dateStyle: "full" };
      let datefmt = new Intl.DateTimeFormat(["ban", "zh"], option);
      console.log("DATE_TIME_FORMAT_TEST_008 " + datefmt.format(date));
      expect(datefmt.format(date)).assertEqual("2020年12月20日星期日");
    });

    /* *
     * @tc.number: DATE_TIME_FORMAT_TEST_009
     * @tc.name  : format the hour with zh-Hans-CN locale
     * @tc.desc  : check the hour with zh-Hans-CN locale
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("dateTimeFormatTest009", 0, function () {
      let date = new Date(2020, 11, 20, 14, 23, 16);
      let option = { dateStyle: "full", timeStyle: "full" };
      let datefmt = new Intl.DateTimeFormat("zh-Hans-CN", option);
      console.log("DATE_TIME_FORMAT_TEST_009 " + datefmt.format(date));
      expect(datefmt.format(date)).assertContain("2020年12月20日星期日");
    });

    /* *
     * @tc.number: DATE_TIME_FORMAT_TEST_010
     * @tc.name  : format the hour with zh-CN locale
     * @tc.desc  : check the hour with zh-CN locale
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("dateTimeFormatTest010", 0, function () {
      let date = new Date(2020, 11, 20, 14, 23, 16);
      let option = { dateStyle: "long", timeStyle: "long" };
      let datefmt = new Intl.DateTimeFormat("zh-CN", option);
      console.log("DATE_TIME_FORMAT_TEST_010 " + datefmt.resolvedOptions().dateStyle);
      expect(datefmt.resolvedOptions().dateStyle).assertEqual("long");
      expect(datefmt.format(date)).assertContain("2020年12月20日");
    });

    /* *
     * @tc.number: DATE_TIME_FORMAT_TEST_011
     * @tc.name  : format the date dateStyle with medium style
     * @tc.desc  : check the dateStyle with medium style
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("dateTimeFormatTest011", 0, function () {
      let date = new Date(2020, 11, 20, 14, 23, 16);
      let option = { dateStyle: "medium", timeStyle: "medium" };
      let datefmt = new Intl.DateTimeFormat("zh-CN", option);
      console.log("DATE_TIME_FORMAT_TEST_011 " + datefmt.resolvedOptions().dateStyle);
      expect(datefmt.resolvedOptions().dateStyle).assertEqual("medium");
      expect(datefmt.format(date)).assertContain("2020年12月20日");
    });

    /* *
     * @tc.number: DATE_TIME_FORMAT_TEST_012
     * @tc.name  : format the date dateStyle with short style
     * @tc.desc  : check the dateStyle with short style
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("dateTimeFormatTest012", 0, function () {
      let date = new Date(2020, 11, 20, 14, 23, 16);
      let option = { dateStyle: "short", timeStyle: "short" };
      let datefmt = new Intl.DateTimeFormat("zh-CN", option);
      console.log("DATE_TIME_FORMAT_TEST_012 " + datefmt.resolvedOptions().dateStyle);
      expect(datefmt.resolvedOptions().dateStyle).assertEqual("short");
      expect(datefmt.format(date)).assertContain("2020/12/20");
    });

    /* *
     * @tc.number: DATE_TIME_FORMAT_TEST_013
     * @tc.name  : format the date with daterange
     * @tc.desc  : check the daterange
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("dateTimeFormatTest013", 0, function () {
      let startdate = new Date(2020, 11, 20, 14, 23, 16);
      let enddate = new Date(2020, 11, 21, 14, 23, 16);
      let datefmt = new Intl.DateTimeFormat("en-GB");
      console.log("DATE_TIME_FORMAT_TEST_013 " + datefmt.formatRange(startdate, enddate));
      expect(["20/12/2020 – 21/12/2020", "12/20/20 – 12/21/20"].indexOf(datefmt.formatRange(startdate, enddate)) != -1).assertTrue();
    });

    /* *
     * @tc.number: DATE_TIME_FORMAT_TEST_014
     * @tc.name  : format the date with daterange when the start and end date is equal
     * @tc.desc  : check the daterange when the start and end date is equal
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("dateTimeFormatTest014", 0, function () {
      let startdate = new Date(2020, 11, 20, 14, 23, 16);
      let enddate = new Date(2020, 11, 20, 14, 23, 16);
      let datefmt = new Intl.DateTimeFormat("en-GB");
      console.log("DATE_TIME_FORMAT_TEST_014 " + datefmt.formatRange(startdate, enddate));
      expect(["20/12/2020", "12/20/20"].indexOf(datefmt.formatRange(startdate, enddate)) != -1).assertTrue();
    });

    /* *
     * @tc.number: DATE_TIME_FORMAT_TEST_015
     * @tc.name  : format the year、month、day、weekday
     * @tc.desc  : check the year、month、day、weekday
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 0
     */
    it("dateTimeFormatTest015", 0, function () {
      let date = new Date(2020, 11, 20, 14, 23, 16);
      let option = { year: "numeric", month: "long", day: "numeric", weekday: "long" };
      let datefmt = new Intl.DateTimeFormat("ja", option);
      const result = datefmt.format(date);
      //ios乱码表现形式:
      //2020\M-C\M^B\M-O\M^@\M-B\M-%12\M-C\M^J\M-C\M-:\M-C\24020\M-C\M^J\M-C\M-3\M-b\M^@\M-"\M-C\M^J\M-C\M-2\M-C\M-<\M-C\M^J\M-C\M-:\M-C\M-<\M-C\M^J\M-C\M-3\M-b\M^@\M-";
      const androidOhResult = ["2020年12月20日日曜日", "2020 M12 20, Sun"].indexOf(result) != -1;
      const iosResult = result.indexOf("4020") != -1;
      const exceptResult = androidOhResult || iosResult;
      expect(exceptResult).assertTrue();
    });

    /* *
     * @tc.number: DATE_TIME_FORMAT_TEST_016
     * @tc.name  : format the timerange with year、month、day、weekday
     * @tc.desc  : check the timerange with year、month、day、weekday
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 0
     */
    it("dateTimeFormatTest016", 0, function () {
      let startdate = new Date(2020, 11, 20, 14, 23, 16);
      let enddate = new Date(2021, 4, 5, 10, 5, 3);
      let option = { year: "numeric", month: "long", day: "numeric", weekday: "long" };
      let datefmt = new Intl.DateTimeFormat("en", option);
      console.log("DATE_TIME_FORMAT_TEST_016 " + datefmt.formatRange(startdate, enddate));
      expect(datefmt.formatRange(startdate, enddate)).assertEqual("Sunday, December 20, 2020 – Wednesday, May 5, 2021");
    });

    /* *
     * @tc.number: DATE_TIME_FORMAT_TEST_017
     * @tc.name  : format the hour&minute&second
     * @tc.desc  : check the hour&minute&second
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 0
     */
    it("dateTimeFormatTest017", 0, function () {
      let date = new Date(2020, 11, 20, 14, 23, 16);
      let option = { year: "numeric", month: "long", day: "numeric", hour: "numeric", minute: "2-digit", second: "numeric", weekday: "long", era: "short" };
      let datefmt = new Intl.DateTimeFormat("zh-CN-u-hc-h12", option);
      console.log("DATE_TIME_FORMAT_TEST_017 " + datefmt.format(date));
      expect(datefmt.format(date)).assertContain("公元2020年12月20日星期日");
    });

    /* *
     * @tc.number: DATE_TIME_FORMAT_TEST_018
     * @tc.name  : format the timeZone
     * @tc.desc  : check the hour, minute, second, era
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 0
     */
    it("dateTimeFormatTest018", 0, function () {
      let date = new Date(2020, 3, 14, 15, 5, 3);
      let option = { timeZone: "America/Los_Angeles", timeZoneName: "long" };
      let datefmt = new Intl.DateTimeFormat("zh-CN-u-hc-h12", option);
      console.log("DATE_TIME_FORMAT_TEST_018 " + datefmt.format(date));
      expect(datefmt.format(date).indexOf("北美太平洋夏令时间") !== -1).assertTrue();
    });

    /* *
     * @tc.number: DATE_TIME_FORMAT_TEST_019
     * @tc.name  : format the America/Los_Angeles timeZone
     * @tc.desc  : check the America/Los_Angeles timeZone
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("dateTimeFormatTest019", 0, function () {
      let option = { timeZone: "America/Los_Angeles", timeZoneName: "long" };
      let datefmt = new Intl.DateTimeFormat("zh-CN-u-hc-h12", option);
      console.log("DATE_TIME_FORMAT_TEST_019 " + datefmt.resolvedOptions().timeZone);
      expect(datefmt.resolvedOptions().timeZone).assertEqual("America/Los_Angeles");
    });

    /* *
     * @tc.number: DATE_TIME_FORMAT_TEST_020
     * @tc.name  : format the America/Los_Angeles timeZoneName
     * @tc.desc  : check the America/Los_Angeles timeZoneName
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("dateTimeFormatTest020", 0, function () {
      let option = { timeZone: "America/Los_Angeles", timeZoneName: "long" };
      let datefmt = new Intl.DateTimeFormat("zh-CN-u-hc-h12", option);
      console.log("DATE_TIME_FORMAT_TEST_020 " + datefmt.resolvedOptions().timeZoneName);
      expect(datefmt.resolvedOptions().timeZoneName).assertEqual("long");
    });

    /* *
     * @tc.number: DATE_TIME_FORMAT_TEST_021
     * @tc.name  : format the hour in zh-CN-u-hc-h12 with matcher
     * @tc.desc  : check the hour in zh-CN-u-hc-h12 with matcher
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("dateTimeFormatTest021", 0, function () {
      let option = { year: "numeric", month: "long", day: "numeric", hour: "numeric", minute: "2-digit", second: "numeric", weekday: "long", era: "short", hourCycle: "h24", numberingSystem: "arab", hour12: true, dayPeriod: "short", formatMatcher: "basic", localeMatcher: "lookup" };
      let datefmt = new Intl.DateTimeFormat("zh-CN-u-hc-h12", option);
      expect(datefmt.resolvedOptions().locale).assertEqual("zh-CN");
      expect(datefmt.resolvedOptions().hourCycle).assertEqual("h24");
      expect(datefmt.resolvedOptions().numberingSystem).assertEqual("arab");
      expect(datefmt.resolvedOptions().hour12).assertTrue();
      expect(datefmt.resolvedOptions().era).assertEqual("short");
      expect(datefmt.resolvedOptions().month).assertEqual("long");
      expect(datefmt.resolvedOptions().day).assertEqual("numeric");
      expect(datefmt.resolvedOptions().minute).assertEqual("2-digit");
      expect(datefmt.resolvedOptions().second).assertEqual("numeric");
      expect(datefmt.resolvedOptions().dayPeriod).assertEqual("short");
      expect(datefmt.resolvedOptions().formatMatcher).assertEqual("basic");
      expect(datefmt.resolvedOptions().localeMatcher).assertEqual("lookup");
    });

    /* *
     * @tc.number: NUMBER_FORMAT_TEST_001
     * @tc.name  : format the number in zh
     * @tc.desc  : check the number in zh
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("numberFormatTest001", 0, function () {
      let numfmt = new Intl.NumberFormat("zh");
      console.log("NUMBER_FORMAT_TEST_001 " + numfmt.format(123456.789));
      expect(numfmt.format(123456.789)).assertEqual("123,456.789");
    });

    /* *
     * @tc.number: NUMBER_FORMAT_TEST_002
     * @tc.name  : format the number with default locale
     * @tc.desc  : check the number with default locale
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("numberFormatTest002", 0, function () {
      let numfmt = new Intl.NumberFormat();
      expect(numfmt !== null).assertTrue();
    });

    /* *
     * @tc.number: NUMBER_FORMAT_TEST_003
     * @tc.name  : format the number in zh-u-nu-latn
     * @tc.desc  : check the number in zh-u-nu-latn
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("numberFormatTest003", 0, function () {
      let numfmt = new Intl.NumberFormat("zh-u-nu-latn");
      console.log("NUMBER_FORMAT_TEST_003 " + numfmt.format(123456.789));
      expect(numfmt.format(123456.789)).assertEqual("123,456.789");
    });

    /* *
     * @tc.number: NUMBER_FORMAT_TEST_004
     * @tc.name  : format the number in zh-u-nu-arab
     * @tc.desc  : check the number in zh-u-nu-arab
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("numberFormatTest004", 0, function () {
      let numfmt = new Intl.NumberFormat("zh-u-nu-arab");
      console.log("NUMBER_FORMAT_TEST_004 " + numfmt.format(123456.789));
      expect(numfmt.format(123456.789)).assertEqual("١٢٣٬٤٥٦٫٧٨٩");
    });

    /* *
     * @tc.number: NUMBER_FORMAT_TEST_005
     * @tc.name  : format the number in en
     * @tc.desc  : check the number in en
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("numberFormatTest005", 0, function () {
      let numfmt = new Intl.NumberFormat("en");
      console.log("NUMBER_FORMAT_TEST_005 " + numfmt.format(123456.789));
      expect(numfmt.format(123456.789)).assertEqual("123,456.789");
    });

    /* *
     * @tc.number: NUMBER_FORMAT_TEST_006
     * @tc.name  : format the number in en-u-nu-thai
     * @tc.desc  : check the number in en-u-nu-thai
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("numberFormatTest006", 0, function () {
      let numfmt = new Intl.NumberFormat("en-u-nu-thai");
      console.log("NUMBER_FORMAT_TEST_006 " + numfmt.format(123456.789));
      expect(numfmt.format(123456.789)).assertEqual("๑๒๓,๔๕๖.๗๘๙");
    });

    /* *
     * @tc.number: NUMBER_FORMAT_TEST_007
     * @tc.name  : format the number in en-GB
     * @tc.desc  : check the number in en-GB
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("numberFormatTest007", 0, function () {
      let numfmt = new Intl.NumberFormat("en-GB");
      console.log("NUMBER_FORMAT_TEST_007 " + numfmt.format(123456.789));
      expect(numfmt.format(123456.789)).assertEqual("123,456.789");
    });

    /* *
     * @tc.number: NUMBER_FORMAT_TEST_008
     * @tc.name  : format the number in en-US
     * @tc.desc  : check the number in en-US
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("numberFormatTest008", 0, function () {
      let numfmt = new Intl.NumberFormat("en-US");
      console.log("NUMBER_FORMAT_TEST_008 " + numfmt.format(123456.789));
      expect(numfmt.format(123456.789)).assertEqual("123,456.789");
    });

    /* *
     * @tc.number: NUMBER_FORMAT_TEST_009
     * @tc.name  : format the number in zh and en list
     * @tc.desc  : check the number in zh and en list
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("numberFormatTest009", 0, function () {
      let numfmt = new Intl.NumberFormat(["zh", "en"]);
      console.log("NUMBER_FORMAT_TEST_0900 " + numfmt.format(123456.789));
      expect(numfmt.format(123456.789)).assertEqual("123,456.789");
    });

    /* *
     * @tc.number: NUMBER_FORMAT_TEST_010
     * @tc.name  : format the number in en and zh list
     * @tc.desc  : check the number in en and zh list
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("numberFormatTest010", 0, function () {
      let numfmt = new Intl.NumberFormat(["en", "zh"]);
      console.log("NUMBER_FORMAT_TEST_010 " + numfmt.format(123456.789));
      expect(numfmt.format(123456.789)).assertEqual("123,456.789");
    });

    /* *
     * @tc.number: NUMBER_FORMAT_TEST_011
     * @tc.name  : format the number in en and aa list
     * @tc.desc  : check the number in en and aa list
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("numberFormatTest011", 0, function () {
      let numfmt = new Intl.NumberFormat(["en", "aa"]);
      console.log("NUMBER_FORMAT_TEST_011 " + numfmt.format(123456.789));
      expect(numfmt.format(123456.789)).assertEqual("123,456.789");
    });

    /* *
     * @tc.number: NUMBER_FORMAT_TEST_012
     * @tc.name  : format the number in aa and zh list
     * @tc.desc  : check the number in aa and zh list
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("numberFormatTest012", 0, function () {
      let numfmt = new Intl.NumberFormat(["aa", "zh"]);
      console.log("NUMBER_FORMAT_TEST_1200 " + numfmt.format(123456.789));
      expect(numfmt.format(123456.789)).assertEqual("123,456.789");
    });

    /* *
     * @tc.number: NUMBER_FORMAT_TEST_013
     * @tc.name  : format the number in aa and bb list
     * @tc.desc  : check the number in aa and bb list
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("numberFormatTest013", 0, function () {
      let numfmt = new Intl.NumberFormat(["aa", "bb", "es"]);
      console.log("NUMBER_FORMAT_TEST_1400 " + numfmt.format(123456.789));
      expect(["123.456,789", "123,456.789"].indexOf(numfmt.format(123456.789)) != -1).assertTrue();
    });

    /* *
     * @tc.number: NUMBER_FORMAT_TEST_014
     * @tc.name  : format the number in aa bb and es list
     * @tc.desc  : check the number in aa  bb and es list
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("numberFormatTest014", 0, function () {
      let numfmt = new Intl.NumberFormat(["aa", "it", "bb"]);
      console.log("NUMBER_FORMAT_TEST_014 " + numfmt.format(123456.789));
      expect(["123.456,789", "123,456.789"].indexOf(numfmt.format(123456.789)) != -1).assertTrue();
    });

    /* *
     * @tc.number: NUMBER_FORMAT_TEST_015
     * @tc.name  : format the number in aa it and bb list
     * @tc.desc  : check the number in aa it and bb list
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("numberFormatTest015", 0, function () {
      let numfmt = new Intl.NumberFormat("en-GB", { style: "decimal", notation: "scientific" });
      console.log("NUMBER_FORMAT_TEST_015 " + numfmt.format(123456.789));
      expect(numfmt.format(123456.789)).assertEqual("1.234568E5");
      expect(numfmt.resolvedOptions().style).assertEqual("decimal");
      expect(numfmt.resolvedOptions().notation).assertEqual("scientific");
    });

    /* *
     * @tc.number: NUMBER_FORMAT_TEST_016
     * @tc.name  : format the number with currency EUR
     * @tc.desc  : check the number with currency EUR
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("numberFormatTest016", 0, function () {
      let numfmt = new Intl.NumberFormat("en-GB", { style: "currency", currency: "EUR", currencyDisplay: "name", currencySign: "accounting", signDisplay: "always" });
      console.log("NUMBER_FORMAT_TEST_016 " + numfmt.format(123456.789));
      expect(numfmt.format(123456.789)).assertEqual("+123,456.79 euros");
      expect(numfmt.resolvedOptions().locale).assertEqual("en-GB");
      expect(numfmt.resolvedOptions().style).assertEqual("currency");
      expect(numfmt.resolvedOptions().currency).assertEqual("EUR");
      expect(numfmt.resolvedOptions().currencyDisplay).assertEqual("name");
      expect(numfmt.resolvedOptions().currencySign).assertEqual("accounting");
      expect(numfmt.resolvedOptions().signDisplay).assertEqual("always");
    });

    /* *
     * @tc.number: NUMBER_FORMAT_TEST_017
     * @tc.name  : format the number with currency USD
     * @tc.desc  : check the number with currency USD
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("numberFormatTest017", 0, function () {
      let numfmt = new Intl.NumberFormat("en-US", { style: "currency", currency: "USD", currencyDisplay: "code", currencySign: "accounting", signDisplay: "always" });
      console.log("NUMBER_FORMAT_TEST_017 " + numfmt.format(123456.789));
      expect(numfmt.format(123456.789)).assertContain("+USD");
      expect(numfmt.format(123456.789)).assertContain("123,456.79");
    });

    /* *
     * @tc.number: NUMBER_FORMAT_TEST_018
     * @tc.name  : format the number with currency CNY
     * @tc.desc  : check the number with currency CNY
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("numberFormatTest018", 0, function () {
      let numfmt = new Intl.NumberFormat("zh-CN", { style: "currency", currency: "CNY", currencyDisplay: "symbol", currencySign: "accounting", signDisplay: "always" });
      console.log("NUMBER_FORMAT_TEST_018 " + numfmt.format(123456.789));
      expect(numfmt.format(123456.789)).assertEqual("+¥123,456.79");
    });

    /* *
     * @tc.number: NUMBER_FORMAT_TEST_019
     * @tc.name  : format the number with currency JPY
     * @tc.desc  : check the number with currency JPY
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("numberFormatTest019", 0, function () {
      let numfmt = new Intl.NumberFormat("ja-JP", { style: "currency", currency: "JPY", currencyDisplay: "narrowSymbol", currencySign: "accounting", signDisplay: "always" });
      //ios乱码表现形式
      //+\M-B\M-,\M-b\M^@\M-"123,457;
      const result = numfmt.format(123456.789);
      const iosResult = result.indexOf("123,457") != -1;
      const androidOhResult = ["+￥123,457", "+¥ 123,457"].indexOf(numfmt.format(123456.789)) != -1;
      const expectResult = iosResult || androidOhResult;
      expect(expectResult).assertTrue();
    });

    /* *
     * @tc.number: NUMBER_FORMAT_TEST_020
     * @tc.name  : format the number with signDisplay
     * @tc.desc  : check the number with signDisplay
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("numberFormatTest020", 0, function () {
      let numfmt = new Intl.NumberFormat("en-GB", { style: "currency", currency: "EUR", currencyDisplay: "name", currencySign: "accounting", signDisplay: "always", notation: "compact", compactDisplay: "long", localeMatcher: "lookup" });
      console.log("NUMBER_FORMAT_TEST_020 " + numfmt.format(123456.789));
      expect(numfmt.format(123456.789)).assertEqual("+123 thousand euros");
      expect(numfmt.resolvedOptions().locale).assertEqual("en-GB");
      expect(numfmt.resolvedOptions().style).assertEqual("currency");
      expect(numfmt.resolvedOptions().currency).assertEqual("EUR");
      expect(numfmt.resolvedOptions().currencyDisplay).assertEqual("name");
      expect(numfmt.resolvedOptions().currencySign).assertEqual("accounting");
      expect(numfmt.resolvedOptions().compactDisplay).assertEqual("long");
      expect(numfmt.resolvedOptions().localeMatcher).assertEqual("lookup");
      expect(numfmt.resolvedOptions().signDisplay).assertEqual("always");
    });

    /* *
     * @tc.number: NUMBER_FORMAT_TEST_021
     * @tc.name  : format the number with  meter unit
     * @tc.desc  : check the number with meter unit
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("numberFormatTest021", 0, function () {
      let numfmt = new Intl.NumberFormat("zh-CN", { style: "unit", unit: "meter", unitDisplay: "long", maximumFractionDigits: 2, minimumIntegerDigits: 7 });
      console.log("NUMBER_FORMAT_TEST_021 " + numfmt.format(123456.789));
      expect(numfmt.format(123456.789)).assertEqual("0,123,456.79米");
      expect(numfmt.resolvedOptions().style).assertEqual("unit");
      expect(numfmt.resolvedOptions().unit).assertEqual("meter");
      expect(numfmt.resolvedOptions().unitDisplay).assertEqual("long");
    });

    /* *
     * @tc.number: NUMBER_FORMAT_TEST_022
     * @tc.name  : format the number with unitUsage
     * @tc.desc  : check the number with unitUsage
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("numberFormatTest022", 0, function () {
      let numfmt = new Intl.NumberFormat("zh-CN", { style: "unit", unit: "meter", unitDisplay: "long", unitUsage: "length-road" });
      console.log("NUMBER_FORMAT_TEST_022 " + numfmt.format(123456.789));
      expect(numfmt.format(123456.789)).assertEqual("123,456.789米");
      expect(numfmt.resolvedOptions().unitUsage).assertEqual("length-road");
    });

    /* *
     * @tc.number: NUMBER_FORMAT_TEST_023
     * @tc.name  : format the number with narrow value in unitUsage param
     * @tc.desc  : check the number with unitUsage
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("numberFormatTest023", 0, function () {
      let numfmt = new Intl.NumberFormat("zh-CN", { style: "unit", unit: "meter", unitDisplay: "narrow", unitUsage: "length-road" });
      console.log("NUMBER_FORMAT_TEST_023 " + numfmt.format(123456.789));
      expect(numfmt.format(123456.789)).assertEqual("123,456.789米");
      expect(numfmt.resolvedOptions().unitUsage).assertEqual("length-road");
    });

    /* *
     * @tc.number: NUMBER_FORMAT_TEST_024
     * @tc.name  : format the number with short value in unitUsage param
     * @tc.desc  : check the number with unitUsage
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("numberFormatTest024", 0, function () {
      let numfmt = new Intl.NumberFormat("zh-CN", { style: "unit", unit: "meter", unitDisplay: "short", unitUsage: "length-road" });
      console.log("NUMBER_FORMAT_TEST_024 " + numfmt.format(123456.789));
      expect(numfmt.format(123456.789)).assertEqual("123,456.789米");
      expect(numfmt.resolvedOptions().unitUsage).assertEqual("length-road");
    });

    /* *
     * @tc.number: NUMBER_FORMAT_TEST_025
     * @tc.name  : format the number with narrow value in unitUsage param
     * @tc.desc  : check the number with unitUsage
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("numberFormatTest025", 0, function () {
      let numfmt = new Intl.NumberFormat("en-US", { style: "unit", unit: "meter", unitDisplay: "narrow", unitUsage: "length-road" });
      console.log("NUMBER_FORMAT_TEST_025 " + numfmt.format(123456.789));
      expect(numfmt.format(123456.789)).assertEqual("76.712mi");
      expect(numfmt.resolvedOptions().unitUsage).assertEqual("length-road");
    });

    /* *
     * @tc.number: NUMBER_FORMAT_TEST_026
     * @tc.name  : format the number with short value in unitUsage param
     * @tc.desc  : check the number with unitUsage
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("numberFormatTest026", 0, function () {
      let numfmt = new Intl.NumberFormat("en-US", { style: "unit", unit: "meter", unitDisplay: "short", unitUsage: "length-road" });
      console.log("NUMBER_FORMAT_TEST_026 " + numfmt.format(123456.789));
      expect(numfmt.format(123456.789)).assertEqual("76.712 mi");
      expect(numfmt.resolvedOptions().unitUsage).assertEqual("length-road");
    });

    /* *
     * @tc.number: NUMBER_FORMAT_TEST_027
     * @tc.name  : format the number with percetn style
     * @tc.desc  : check the number with percetn style
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("numberFormatTest027", 0, function () {
      let numfmt = new Intl.NumberFormat("en-CN", { style: "percent", maximumFractionDigits: 2, minimumIntegerDigits: 7 });
      console.log("NUMBER_FORMAT_TEST_027 " + numfmt.format(123456.789));
      expect(["12,345,678.9%", "0,123,456.79%"].indexOf(numfmt.format(123456.789)) != -1).assertTrue();
    });

    /* *
     * @tc.number: NUMBER_FORMAT_TEST_028
     * @tc.name  : format the number with numberingSystem
     * @tc.desc  : check the number with numberingSystem
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("numberFormatTest028", 0, function () {
      let numfmt = new Intl.NumberFormat("ar-EG", { numberingSystem: "arab" });
      console.log("NUMBER_FORMAT_TEST_028 1 " + numfmt.format(123456.789));
      expect(["١٢٣٬٤٥٦٫٧٨٩", "123,456.789"].indexOf(numfmt.format(123456.789)) != -1).assertTrue();
      console.log("NUMBER_FORMAT_TEST_028 2 " + numfmt.resolvedOptions().numberingSystem);
      expect(numfmt.resolvedOptions().numberingSystem).assertEqual("arab");
    });

    /* *
     * @tc.number: NUMBER_FORMAT_TEST_029
     * @tc.name  : format the number with style
     * @tc.desc  : check the number with style
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("numberFormatTest029", 0, function () {
      let numfmt = new Intl.NumberFormat("ar", { style: "percent", minimumFractionDigits: 1, maximumFractionDigits: 2, minimumIntegerDigits: 7, minimumSignificantDigits: 5, maximumSignificantDigits: 10, useGrouping: true });
      console.log("NUMBER_FORMAT_TEST_029 " + numfmt.resolvedOptions().style);
      expect(numfmt.resolvedOptions().style).assertEqual("percent");
      expect(numfmt.resolvedOptions().minimumFractionDigits).assertEqual(1);
      expect(numfmt.resolvedOptions().maximumFractionDigits).assertEqual(2);
      expect(numfmt.resolvedOptions().minimumIntegerDigits).assertEqual(7);
      expect(numfmt.resolvedOptions().minimumSignificantDigits).assertEqual(5);
      expect(numfmt.resolvedOptions().maximumSignificantDigits).assertEqual(10);
      expect(numfmt.resolvedOptions().useGrouping).assertTrue();
    });

    /* *
     * @tc.number: COLLATOR_TEST_001
     * @tc.name  : compare two different strings
     * @tc.desc  : check the compare result
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("collatorTest001", 0, function () {
      let coll = new Intl.Collator();
      let value = coll.compare("a", "b");
      console.log("COLLATOR_TEST_001 " + value);
      expect([-1, -2].indexOf(value) != -1).assertTrue();
    });

    /* *
     * @tc.number: COLLATOR_TEST_002
     * @tc.name  : compare the same strings
     * @tc.desc  : check the compare result
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("collatorTest002", 0, function () {
      let coll = new Intl.Collator();
      let value = coll.compare("a", "a");
      console.log("COLLATOR_TEST_002 " + value);
      expect([0, -2].indexOf(value) != -1).assertTrue();
    });

    /* *
     * @tc.number: COLLATOR_TEST_003
     * @tc.name  : compare two different strings and return positive value
     * @tc.desc  : check the compare result
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("collatorTest003", 0, function () {
      let coll = new Intl.Collator();
      let value = coll.compare("b", "a");
      console.log("COLLATOR_TEST_003 " + value);
      expect([1, -2].indexOf(value) != -1).assertTrue();
    });

    /* *
     * @tc.number: COLLATOR_TEST_004
     * @tc.name  : compare two different strings with zh locale
     * @tc.desc  : check the compare result
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("collatorTest004", 0, function () {
      let coll = new Intl.Collator("zh");
      let value = coll.compare("a", "b");
      console.log("COLLATOR_TEST_004 " + value);
      expect(value).assertEqual(-1);
    });

    /* *
     * @tc.number: COLLATOR_TEST_005
     * @tc.name  : compare two different strings with zh locale and eor collation
     * @tc.desc  : check the compare result
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("collatorTest005", 0, function () {
      let coll = new Intl.Collator("zh", { collation: "eor" });
      let value = coll.compare("a", "b");
      console.log("COLLATOR_TEST_005 " + value);
      expect(value).assertEqual(-1);
      expect(["eor", "default"].indexOf(coll.resolvedOptions().collation) != -1).assertTrue();
    });

    /* *
     * @tc.number: COLLATOR_TEST_006
     * @tc.name  : compare two different strings with zh locale and base sensitivity
     * @tc.desc  : check the compare result
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("collatorTest006", 0, function () {
      let coll = new Intl.Collator("zh", { sensitivity: "base" });
      let value = coll.compare("a", "b");
      console.log("COLLATOR_TEST_006 " + value);
      expect(value).assertEqual(-1);
      expect(coll.resolvedOptions().sensitivity).assertEqual("base");
    });

    /* *
     * @tc.number: COLLATOR_TEST_007
     * @tc.name  : compare two different strings with zh locale and upper caseFirst
     * @tc.desc  : check the compare result
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("collatorTest007", 0, function () {
      let coll = new Intl.Collator("zh", { caseFirst: "upper" });
      let value = coll.compare("a", "b");
      console.log("COLLATOR_TEST_007 " + value);
      expect(value).assertEqual(-1);
      expect(coll.resolvedOptions().caseFirst).assertEqual("upper");
    });

    /* *
     * @tc.number: COLLATOR_TEST_008
     * @tc.name  : compare two different strings with zh locale and true numeric
     * @tc.desc  : check the compare result
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("collatorTest008", 0, function () {
      let coll = new Intl.Collator("zh", { numeric: true });
      let value = coll.compare("a", "b");
      console.log("COLLATOR_TEST_008 " + value);
      expect(value).assertEqual(-1);
      expect(coll.resolvedOptions().numeric).assertTrue();
    });

    /* *
     * @tc.number: COLLATOR_TEST_009
     * @tc.name  : compare two different strings with zh locale and true ignorePunctuation
     * @tc.desc  : check the compare result
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("collatorTest009", 0, function () {
      let coll = new Intl.Collator("zh", { ignorePunctuation: true });
      let value = coll.compare("a", "b");
      console.log("COLLATOR_TEST_009 " + value);
      expect(value).assertEqual(-1);
      expect(coll.resolvedOptions().ignorePunctuation).assertTrue();
    });

    /* *
     * @tc.number: COLLATOR_TEST_010
     * @tc.name  : compare two different strings with zh locale and sort usage
     * @tc.desc  : check the compare result
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("collatorTest010", 0, function () {
      let coll = new Intl.Collator("zh", { usage: "sort" });
      let value = coll.compare("a", "b");
      console.log("COLLATOR_TEST_010 " + value);
      expect(value).assertEqual(-1);
      expect(coll.resolvedOptions().usage).assertEqual("sort");
    });

    /* *
     * @tc.number: COLLATOR_TEST_011
     * @tc.name  : compare the string with localeMatcher options
     * @tc.desc  : check the compare result
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("collatorTest011", 0, function () {
      let coll = new Intl.Collator("zh", { localeMatcher: "lookup" });
      let value = coll.compare("a", "b");
      console.log("COLLATOR_TEST_011 " + value);
      expect(value).assertEqual(-1);
      expect(coll.resolvedOptions().localeMatcher).assertEqual("lookup");
    });

    /* *
     * @tc.number: PLURALRULES_TEST_001
     * @tc.name  : get PluralRules
     * @tc.desc  : check the select result
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("pluralrulesTest001", 0, function () {
      let pl = new Intl.PluralRules();
      let value = pl.select(0);
      console.log("PLURALRULES_TEST_001 " + value);
      expect(value).assertEqual("other");
    });

    /* *
     * @tc.number: PLURALRULES_TEST_002
     * @tc.name  : get PluralRules with zh locale
     * @tc.desc  : check the select result
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("pluralrulesTest002", 0, function () {
      let pl = new Intl.PluralRules("zh");
      let value = pl.select(0);
      console.log("PLURALRULES_TEST_002 " + value);
      expect(value).assertEqual("other");
    });

    /* *
     * @tc.number: PLURALRULES_TEST_003
     * @tc.name  : get PluralRules with zh locale and ordinal type
     * @tc.desc  : check the select result
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("pluralrulesTest003", 0, function () {
      let pl = new Intl.PluralRules("zh", { type: "ordinal" });
      let value = pl.select(0);
      console.log("PLURALRULES_TEST_003 " + value);
      expect(value).assertEqual("other");
    });

    /* *
     * @tc.number: PLURALRULES_TEST_004
     * @tc.name  : get PluralRules with zh locale and loolup localeMatcher
     * @tc.desc  : check the select result
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("pluralrulesTest004", 0, function () {
      let pl = new Intl.PluralRules("zh", { localeMatcher: "lookup" });
      let value = pl.select(0);
      console.log("PLURALRULES_TEST_004 " + value);
      expect(value).assertEqual("other");
    });

    /* *
     * @tc.number: PLURALRULES_TEST_005
     * @tc.name  : get PluralRules with zh locale and minimumIntegerDigits options
     * @tc.desc  : check the select result
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("pluralrulesTest005", 0, function () {
      let pl = new Intl.PluralRules("zh", { minimumIntegerDigits: 10 });
      let value = pl.select(0);
      console.log("PLURALRULES_TEST_005 " + value);
      expect(value).assertEqual("other");
    });

    /* *
     * @tc.number: PLURALRULES_TEST_006
     * @tc.name  : get PluralRules with zh locale and minimumFractionDigits options
     * @tc.desc  : check the select result
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("pluralrulesTest006", 0, function () {
      let pl = new Intl.PluralRules("zh", { minimumFractionDigits: 11 });
      let value = pl.select(0);
      console.log("PLURALRULES_TEST_006 " + value);
      expect(value).assertEqual("other");
    });

    /* *
     * @tc.number: PLURALRULES_TEST_007
     * @tc.name  : get PluralRules with zh locale and maximumFractionDigits options
     * @tc.desc  : check the select result
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("pluralrulesTest007", 0, function () {
      let pl = new Intl.PluralRules("zh", { maximumFractionDigits: 11 });
      let value = pl.select(0);
      console.log("PLURALRULES_TEST_007 " + value);
      expect(value).assertEqual("other");
    });

    /* *
     * @tc.number: PLURALRULES_TEST_008+
     * @tc.name  : get PluralRules with zh locale and minimumSignificantDigits options
     * @tc.desc  : check the select result
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("pluralrulesTest008", 0, function () {
      let pl = new Intl.PluralRules("zh", { minimumSignificantDigits: 10 });
      let value = pl.select(0);
      console.log("PLURALRULES_TEST_008 " + value);
      expect(value).assertEqual("other");
    });

    /* *
     * @tc.number: PLURALRULES_TEST_009
     * @tc.name  : get PluralRules with zh locale and maximumSignificantDigits options
     * @tc.desc  : check the select result
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("pluralrulesTest009", 0, function () {
      let pl = new Intl.PluralRules("zh", { maximumSignificantDigits: 11 });
      let value = pl.select(0);
      console.log("PLURALRULES_TEST_009 " + value);
      expect(value).assertEqual("other");
    });

    /* *
     * @tc.number: RELATIVE_TIME_FORMAT_TEST_001
     * @tc.name  : format the relativetime with 100 second
     * @tc.desc  : format the relativetime with 100 second
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("relativeTimeFormatTest001", 0, function () {
      let relativetimefmt = new Intl.RelativeTimeFormat();
      let value = relativetimefmt.format(100, "second");
      console.log("RELATIVE_TIME_FORMAT_TEST_001 " + value);
      expect(value).assertContain("100");
    });

    /* *
     * @tc.number: RELATIVE_TIME_FORMAT_TEST_002
     * @tc.name  : format the relativetime with 100 second in en
     * @tc.desc  : check the relativetime
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("relativeTimeFormatTest002", 0, function () {
      let relativetimefmt = new Intl.RelativeTimeFormat("en");
      let value = relativetimefmt.format(100, "second");
      console.log("RELATIVE_TIME_FORMAT_TEST_002 " + value);
      expect(value).assertEqual("in 100 seconds");
    });

    /* *
     * @tc.number: RELATIVE_TIME_FORMAT_TEST_003
     * @tc.name  : format the relativetime with 100 second in narrow style
     * @tc.desc  : check the relativetime
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("relativeTimeFormatTest003", 0, function () {
      let relativetimefmt = new Intl.RelativeTimeFormat("en", { style: "narrow" });
      let value = relativetimefmt.format(100, "second");
      console.log("RELATIVE_TIME_FORMAT_TEST_003 " + value);
      expect(value).assertEqual("in 100 sec.");
    });

    /* *
     * @tc.number: RELATIVE_TIME_FORMAT_TEST_004
     * @tc.name  : format the relativetime with 100 second, get the formatToParts value
     * @tc.desc  : check the formatToParts value
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("relativeTimeFormatTest004", 0, function () {
      let relativetimefmt = new Intl.RelativeTimeFormat("en", { numeric: "auto" });
      const parts = relativetimefmt.formatToParts(100, "second");
      const result = parts[0]["value"].trim();
      console.log("RELATIVE_TIME_FORMAT_TEST_004 result:" + result);
      expect(result).assertEqual("in");
    });

    /* *
     * @tc.number: RELATIVE_TIME_FORMAT_TEST_005
     * @tc.name  : format the relativetime, get the locale options
     * @tc.desc  : check the relativetime
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("relativeTimeFormatTest005", 0, function () {
      let relativetimefmt = new Intl.RelativeTimeFormat("en");
      let value = relativetimefmt.resolvedOptions();
      console.log("RELATIVE_TIME_FORMAT_TEST_005 " + value);
      expect(value.locale).assertEqual("en");
    });

    /* *
     * @tc.number: RELATIVE_TIME_FORMAT_TEST_006
     * @tc.name  : format the relativetime, get the style options
     * @tc.desc  : check the relativetime
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("relativeTimeFormatTest006", 0, function () {
      let relativetimefmt = new Intl.RelativeTimeFormat("en");
      let value = relativetimefmt.resolvedOptions();
      console.log("RELATIVE_TIME_FORMAT_TEST_006 " + value);
      expect(value.style).assertEqual("long");
    });

    /* *
     * @tc.number: RELATIVE_TIME_FORMAT_TEST_007
     * @tc.name  : format the relativetime, get the numeric options
     * @tc.desc  : check the relativetime
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("relativeTimeFormatTest007", 0, function () {
      let relativetimefmt = new Intl.RelativeTimeFormat("en");
      let value = relativetimefmt.resolvedOptions();
      console.log("RELATIVE_TIME_FORMAT_TEST_007 " + value);
      expect(value.numeric).assertEqual("always");
    });

    /* *
     * @tc.number: RELATIVE_TIME_FORMAT_TEST_008
     * @tc.name  : format the relativetime, get the numberingSystem options
     * @tc.desc  : check the relativetime
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("relativeTimeFormatTest008", 0, function () {
      let relativetimefmt = new Intl.RelativeTimeFormat("en");
      let value = relativetimefmt.resolvedOptions();
      console.log("RELATIVE_TIME_FORMAT_TEST_008 " + value.numberingSystem);
      expect(value.numberingSystem).assertEqual("latn");
    });

    /* *
     * @tc.number: RELATIVE_TIME_FORMAT_TEST_009
     * @tc.name  : format the relativetime with localeMatcher options
     * @tc.desc  : check the relativetime
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("relativeTimeFormatTest009", 0, function () {
      let relativetimefmt = new Intl.RelativeTimeFormat("en", { localeMatcher: "best fit", numeric: "auto", style: "narrow" });
      let value = relativetimefmt.resolvedOptions();
      console.log("RELATIVE_TIME_FORMAT_TEST_009 " + value);
      expect(value.numeric).assertEqual("auto");
      expect(value.style).assertEqual("narrow");
    });

    console.log("*************end IntlTest*************");
  });
}
