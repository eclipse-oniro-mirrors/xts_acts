/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level} from '@ohos/hypium'
export default function etsIntlFunTest() {
describe('etsIntlFunTest', function () {
    console.log('*************start IntlTest*************');
    var newDate = new Date((24 * 60 * 60 * 1000) * (52 * 365 + 9 * 30 + 23));
    var number = 123456.789;
    var vehicles = ['Motorcycle', 'Bus', 'Car'];
    /**
     * @tc.name   SUB_ARK_ETS_INTL_DATETIMEFORMAT_001
     * @tc.number SUB_ARK_ETS_INTL_DATETIMEFORMAT_001
     * @tc.desc   The current function handles Intl DateTimeFormat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARK_ETS_INTL_DATETIMEFORMAT_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        var datefmt = new Intl.DateTimeFormat('en-GB');
        expect(datefmt !== null).assertTrue();
    })

    /**
     * @tc.name   SUB_ARK_ETS_INTL_DATETIMEFORMAT_002
     * @tc.number SUB_ARK_ETS_INTL_DATETIMEFORMAT_002
     * @tc.desc   The current function handles Intl DateTimeFormat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARK_ETS_INTL_DATETIMEFORMAT_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        var datefmt = new Intl.DateTimeFormat();
        expect(datefmt !== null).assertTrue();
    })

    /**
     * @tc.name   SUB_ARK_ETS_INTL_DATETIMEFORMAT_003
     * @tc.number SUB_ARK_ETS_INTL_DATETIMEFORMAT_003
     * @tc.desc   The current function handles Intl DateTimeFormat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARK_ETS_INTL_DATETIMEFORMAT_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        var newDate = new Date((24 * 60 * 60 * 1000) * (52 * 365 + 9 * 30 + 23));
        var options =
            { year: "2-digit", month: "2-digit", day: "2-digit",
                hour: "2-digit", minute: "2-digit", timeZone: "UTC" };
        var intlObj = new Intl.DateTimeFormat("en-US", options).format;
        console.log("intlDateTimeFormatTest003::" + intlObj(newDate));
        expect(intlObj(newDate)).assertEqual("10/08/22, 12:00 AM");
    })

    /**
     * @tc.name   SUB_ARK_ETS_INTL_DATETIMEFORMAT_004
     * @tc.number SUB_ARK_ETS_INTL_DATETIMEFORMAT_004
     * @tc.desc   The current function handles Intl DateTimeFormat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARK_ETS_INTL_DATETIMEFORMAT_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        var options =
            { year: "2-digit", month: "2-digit", day: "2-digit",
                hour: "2-digit", minute: "2-digit", timeZone: "UTC" };
        var intlObj = new Intl.DateTimeFormat("en", options).format;
        console.log("intlDateTimeFormatTest004::" + intlObj(newDate));
        expect(intlObj(newDate)).assertEqual("10/08/22, 12:00 AM");
    })

    /**
     * @tc.name   SUB_ARK_ETS_INTL_DATETIMEFORMAT_005
     * @tc.number SUB_ARK_ETS_INTL_DATETIMEFORMAT_005
     * @tc.desc   The current function handles Intl DateTimeFormat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARK_ETS_INTL_DATETIMEFORMAT_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        var options =
            { year: "numeric", month: "long", day: "numeric",
            hour: "2-digit", minute: "2-digit",
            timeZoneName: "short", timeZone: "UTC" };
        var intlObj = new Intl.DateTimeFormat(["pt-BR", "pt-PT"], options).format;
        console.log("intlDateTimeFormatTest005::" + intlObj(newDate));
        expect(intlObj(newDate)).assertEqual("8 de outubro de 2022 às 00:00 UTC");
    })

    /**
     * @tc.name   SUB_ARK_ETS_INTL_DATETIMEFORMAT_006
     * @tc.number SUB_ARK_ETS_INTL_DATETIMEFORMAT_006
     * @tc.desc   The current function handles Intl DateTimeFormat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARK_ETS_INTL_DATETIMEFORMAT_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        var swissLocales = ["de-CH", "fr-CH", "it-CH", "rm-CH"];
        var options =
            { weekday: "short",
            hour: "numeric", minute: "numeric",
            timeZone: "UTC", timeZoneName: "short" };
        var intlObj = new Intl.DateTimeFormat(swissLocales, options).format;
        console.log("intlDateTimeFormatTest006::" + intlObj(newDate));
        expect(intlObj(newDate)).assertEqual("Sa, 00:00 UTC");
    })

    /**
     * @tc.name   SUB_ARK_ETS_INTL_DATETIMEFORMAT_007
     * @tc.number SUB_ARK_ETS_INTL_DATETIMEFORMAT_007
     * @tc.desc   The current function handles Intl DateTimeFormat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARK_ETS_INTL_DATETIMEFORMAT_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        var options =
            { year: "numeric", month: "long", day: "numeric", timeZone: "UTC" };
        var intlObj = new Intl.DateTimeFormat("th-TH-u-nu-thai-ca-chinese", options).format;
        console.log("intlDateTimeFormatTest007::" + intlObj(newDate));
        expect(intlObj(newDate)).assertEqual("๒๐๒๒(เหรินอิ๋น) 9 ๑๓");
    })

    /**
     * @tc.name   SUB_ARK_ETS_INTL_DATETIMEFORMAT_008
     * @tc.number SUB_ARK_ETS_INTL_DATETIMEFORMAT_008
     * @tc.desc   The current function handles Intl DateTimeFormat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARK_ETS_INTL_DATETIMEFORMAT_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        var options = { year: "numeric", month: "long", day: "numeric", timeZone: "UTC" };
        var intlObj = new Intl.DateTimeFormat("en-GB", options).format;
        console.log("intlDateTimeFormatTest008::" + intlObj(newDate));
        expect(intlObj(newDate)).assertEqual("8 October 2022");
    })

    /**
     * @tc.name   SUB_ARK_ETS_INTL_DATETIMEFORMAT_009
     * @tc.number SUB_ARK_ETS_INTL_DATETIMEFORMAT_009
     * @tc.desc   The current function handles Intl DateTimeFormat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARK_ETS_INTL_DATETIMEFORMAT_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        var options =
            { year: "numeric", month: "long", day: "numeric", timeZone: "UTC" };
        var intlObj = new Intl.DateTimeFormat("aa", options).format;
        console.log("intlDateTimeFormatTest009::" + intlObj(newDate));
        expect(intlObj(newDate)).assertEqual("October 8, 2022");
    })

    /**
     * @tc.name   SUB_ARK_ETS_INTL_DATETIMEFORMAT_010
     * @tc.number SUB_ARK_ETS_INTL_DATETIMEFORMAT_010
     * @tc.desc   The current function handles Intl DateTimeFormat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARK_ETS_INTL_DATETIMEFORMAT_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        var options =
            { year: "numeric", month: "long", day: "numeric", timeZone: "UTC" };
        var intlObj = new Intl.DateTimeFormat("aa", options).format;
        console.log("intlDateTimeFormatTest010::" + intlObj(newDate));
        expect(intlObj(newDate)).assertInstanceOf("String");
    })

    /**
     * @tc.name   SUB_ARK_ETS_INTL_DATETIMEFORMAT_011
     * @tc.number SUB_ARK_ETS_INTL_DATETIMEFORMAT_011
     * @tc.desc   The current function handles Intl DateTimeFormat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARK_ETS_INTL_DATETIMEFORMAT_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        var options = { year: "numeric", month: "long", day: "numeric", timeZone: "UTC" };
        var intlObj = new Intl.DateTimeFormat(['ban', 'zh'], options).format;
        console.log("intlDateTimeFormatTest011::" + intlObj(newDate));
        expect(intlObj(newDate)).assertEqual("2022年10月8日");
    })

    /**
     * @tc.name   SUB_ARK_ETS_INTL_DATETIMEFORMAT_012
     * @tc.number SUB_ARK_ETS_INTL_DATETIMEFORMAT_012
     * @tc.desc   The current function handles Intl DateTimeFormat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARK_ETS_INTL_DATETIMEFORMAT_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        var options = { year: "numeric", month: "long", day: "numeric", timeZone: "UTC" };
        var intlObj = new Intl.DateTimeFormat(['en', 'zh'], options).format;
        console.log("intlDateTimeFormatTest012::" + intlObj(newDate));
        expect(intlObj(newDate)).assertEqual("October 8, 2022");
    })

    /**
     * @tc.name   SUB_ARK_ETS_INTL_DATETIMEFORMAT_013
     * @tc.number SUB_ARK_ETS_INTL_DATETIMEFORMAT_013
     * @tc.desc   The current function handles Intl DateTimeFormat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARK_ETS_INTL_DATETIMEFORMAT_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        var options = { year: "numeric", month: "long", day: "numeric", timeZone: "UTC" };
        var intlObj = new Intl.DateTimeFormat(['abc', 'ban'], options).format;
        console.log("intlDateTimeFormatTest013::" + intlObj(newDate));
        expect(intlObj(newDate)).assertContain('2022');
    })
    
    /**
     * @tc.name   SUB_ARK_ETS_INTL_DATETIMEFORMAT_014
     * @tc.number SUB_ARK_ETS_INTL_DATETIMEFORMAT_014
     * @tc.desc   The current function handles Intl DateTimeFormat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARK_ETS_INTL_DATETIMEFORMAT_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        var options = { year: "numeric", month: "long", day: "numeric", timeZone: "UTC" };
        var intlObj = new Intl.DateTimeFormat("zh-CN", options).format;
        console.log("intlDateTimeFormatTest014::" + intlObj(newDate));
        expect(intlObj(newDate)).assertContain('2022年10月8日');
    })

    /**
     * @tc.name   SUB_ARK_ETS_INTL_DATETIMEFORMAT_015
     * @tc.number SUB_ARK_ETS_INTL_DATETIMEFORMAT_015
     * @tc.desc   The current function handles Intl DateTimeFormat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARK_ETS_INTL_DATETIMEFORMAT_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        var options = { year: "numeric", month: "long", day: "numeric",
            hour: "2-digit", minute: "2-digit", timeZoneName: "short", timeZone: "UTC" };
        var intlObj = new Intl.DateTimeFormat("zh-CN", options);
        console.log("intlDateTimeFormatTest015::" + intlObj.format(newDate));
        expect(intlObj.format(newDate)).assertEqual('2022年10月8日 UTC 上午12:00');
        expect(intlObj.resolvedOptions().timeZone).assertEqual('UTC');
        expect(intlObj.resolvedOptions().timeZoneName).assertEqual('short');
    })
	    
    /**
     * @tc.number SUB_ARK_ETS_INTL_DATETIMEFORMAT_016
     * @tc.name testIntlDateTimeFormat16
     * @tc.desc The current function handles Intl DateTimeFormatToParts
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.leve Level 0
    */
     it('testIntlDateTimeFormat16', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        var options = { year: "numeric", month: "long", day: "numeric",
            hour: "2-digit", minute: "2-digit", timeZoneName: "short", timeZone: "UTC" };
        var intlObj = new Intl.DateTimeFormat("zh-CN", options);
        console.log("intlDateTimeFormatTest016::" + intlObj.format(newDate));
        expect(intlObj.format(newDate)).assertEqual('2022年10月8日 UTC 上午12:00');
        expect(intlObj.resolvedOptions().timeZone).assertEqual('UTC');
        expect(intlObj.resolvedOptions().timeZoneName).assertEqual('short');
        var parts = intlObj.formatToParts(newDate);
        var partValues = parts.map(p => p.value);
        expect(partValues.length).assertEqual(12);
        expect(partValues[0]).assertEqual('2022');
    })
    
    /**
     * @tc.number SUB_ARK_ETS_INTL_DATETIMEFORMAT_017
     * @tc.name testIntlDateTimeFormat17
     * @tc.desc The current function handles Intl DateTimeFormatToParts
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
    */
     it('testIntlDateTimeFormat17', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        var options = { year: "numeric", month: "long", day: "numeric",
            hour: "2-digit", minute: "2-digit", timeZoneName: "short", timeZone: "UTC", hour12: true };
        var intlObj = new Intl.DateTimeFormat("en-us", options);
        console.log("intlDateTimeFormatTest017::" + intlObj.format(newDate));
        expect(intlObj.resolvedOptions().timeZone).assertEqual('UTC');
        expect(intlObj.resolvedOptions().hour12).assertTrue();
        var parts = intlObj.formatToParts(newDate);
        var partValues = parts.map(p => p.value);
        expect(partValues.length).assertEqual(13);
        expect(partValues[0]).assertEqual('October');
    })

     /**
      * @tc.name   SUB_ARK_ETS_INTL_DATETIMEFORMAT_018
      * @tc.number SUB_ARK_ETS_INTL_DATETIMEFORMAT_018
      * @tc.desc   The current function handles Intl DateTimeFormatToParts
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL1
      */
     it('SUB_ARK_ETS_INTL_DATETIMEFORMAT_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        var options = { year: "numeric", month: "long", day: "numeric",
            hour: "2-digit", minute: "2-digit", timeZoneName: "short", timeZone: "UTC", hour12: true };
        var intlObj = new Intl.DateTimeFormat("en-us", options);
        var rops = intlObj.resolvedOptions();
        console.log("intlDateTimeFormatTest015::" + intlObj.format(newDate));
        expect(rops.locale).assertEqual('en-US');
        expect(rops.calendar).assertEqual('gregory');
        expect(rops.numberingSystem).assertEqual('latn');
    })

    console.log('*************IntlNumber*************');
    /**
     * @tc.name   SUB_ARK_ETS_INTL_NUMBERFORMAT_001
     * @tc.number SUB_ARK_ETS_INTL_NUMBERFORMAT_001
     * @tc.desc   The current function handles Intl NumberFormat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARK_ETS_INTL_NUMBERFORMAT_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        var intlObj = new Intl.NumberFormat('zh');
        console.log("intlNumberFormatTest001::" + intlObj.format(number));
        expect(intlObj.format(number)).assertEqual('123,456.789');
    })

    /**
     * @tc.name   SUB_ARK_ETS_INTL_NUMBERFORMAT_002
     * @tc.number SUB_ARK_ETS_INTL_NUMBERFORMAT_002
     * @tc.desc   The current function handles Intl NumberFormat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARK_ETS_INTL_NUMBERFORMAT_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        var intlObj = new Intl.NumberFormat();
        expect(intlObj !== null).assertTrue();
    })

    /**
     * @tc.name   SUB_ARK_ETS_INTL_NUMBERFORMAT_003
     * @tc.number SUB_ARK_ETS_INTL_NUMBERFORMAT_003
     * @tc.desc   The current function handles Intl NumberFormat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARK_ETS_INTL_NUMBERFORMAT_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        var intlObj = new Intl.NumberFormat('zh-u-nu-latn');
        console.log("intlNumberFormatTest003::" + intlObj.format(number));
        expect(intlObj.format(number)).assertEqual('123,456.789');
    })

    /**
     * @tc.name   SUB_ARK_ETS_INTL_NUMBERFORMAT_004
     * @tc.number SUB_ARK_ETS_INTL_NUMBERFORMAT_004
     * @tc.desc   The current function handles Intl NumberFormat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARK_ETS_INTL_NUMBERFORMAT_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        var intlObj = new Intl.NumberFormat('zh-u-nu-arab');
        console.log("intlNumberFormatTest004::" + intlObj.format(number));
        expect(intlObj.format(number)).assertEqual('١٢٣٬٤٥٦٫٧٨٩');
    })

    /**
     * @tc.name   SUB_ARK_ETS_INTL_NUMBERFORMAT_005
     * @tc.number SUB_ARK_ETS_INTL_NUMBERFORMAT_005
     * @tc.desc   The current function handles Intl NumberFormat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARK_ETS_INTL_NUMBERFORMAT_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        var intlObj = new Intl.NumberFormat('en');
        console.log("intlNumberFormatTest005::" + intlObj.format(number));
        expect(intlObj.format(number)).assertEqual('123,456.789');
    })

    /**
     * @tc.name   SUB_ARK_ETS_INTL_NUMBERFORMAT_006
     * @tc.number SUB_ARK_ETS_INTL_NUMBERFORMAT_006
     * @tc.desc   The current function handles Intl NumberFormat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARK_ETS_INTL_NUMBERFORMAT_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        var intlObj = new Intl.NumberFormat('en-u-nu-thai');
        console.log("intlNumberFormatTest006::" + intlObj.format(number));
        expect(intlObj.format(number)).assertEqual('๑๒๓,๔๕๖.๗๘๙');
    })

    /**
     * @tc.name   SUB_ARK_ETS_INTL_NUMBERFORMAT_007
     * @tc.number SUB_ARK_ETS_INTL_NUMBERFORMAT_007
     * @tc.desc   The current function handles Intl NumberFormat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARK_ETS_INTL_NUMBERFORMAT_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        var intlObj = new Intl.NumberFormat('en-GB');
        console.log("intlNumberFormatTest007::" + intlObj.format(number));
        expect(intlObj.format(number)).assertEqual('123,456.789');
    })

    /**
     * @tc.name   SUB_ARK_ETS_INTL_NUMBERFORMAT_008
     * @tc.number SUB_ARK_ETS_INTL_NUMBERFORMAT_008
     * @tc.desc   The current function handles Intl NumberFormat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARK_ETS_INTL_NUMBERFORMAT_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        var intlObj = new Intl.NumberFormat('en-US');
        console.log("intlNumberFormatTest008::" + intlObj.format(number));
        expect(intlObj.format(number)).assertEqual('123,456.789');
    })

    /**
     * @tc.name   SUB_ARK_ETS_INTL_NUMBERFORMAT_009
     * @tc.number SUB_ARK_ETS_INTL_NUMBERFORMAT_009
     * @tc.desc   The current function handles Intl NumberFormat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARK_ETS_INTL_NUMBERFORMAT_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        var intlObj = new Intl.NumberFormat('aa');
        console.log("intlNumberFormatTest009::" + intlObj.format(number));
        expect(intlObj.format(number)).assertEqual('123,456.789');
    })

    /**
     * @tc.name   SUB_ARK_ETS_INTL_NUMBERFORMAT_010
     * @tc.number SUB_ARK_ETS_INTL_NUMBERFORMAT_010
     * @tc.desc   The current function handles Intl NumberFormat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARK_ETS_INTL_NUMBERFORMAT_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        var intlObj = new Intl.NumberFormat(['zh','en']);
        console.log("intlNumberFormatTest010::" + intlObj.format(number));
        expect(intlObj.format(number)).assertEqual('123,456.789');
    })

    /**
     * @tc.name   SUB_ARK_ETS_INTL_NUMBERFORMAT_011
     * @tc.number SUB_ARK_ETS_INTL_NUMBERFORMAT_011
     * @tc.desc   The current function handles Intl NumberFormat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARK_ETS_INTL_NUMBERFORMAT_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        var intlObj = new Intl.NumberFormat(['en','aa']);
        console.log("intlNumberFormatTest011::" + intlObj.format(number));
        expect(intlObj.format(number)).assertEqual('123,456.789');
    })

    /**
     * @tc.name   SUB_ARK_ETS_INTL_NUMBERFORMAT_012
     * @tc.number SUB_ARK_ETS_INTL_NUMBERFORMAT_012
     * @tc.desc   The current function handles Intl NumberFormat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARK_ETS_INTL_NUMBERFORMAT_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        var intlObj = new Intl.NumberFormat(['aa','bb']);
        console.log("intlNumberFormatTest012::" + intlObj.format(number));
        expect(intlObj.format(number)).assertEqual('123,456.789');
    })

    /**
     * @tc.name   SUB_ARK_ETS_INTL_NUMBERFORMAT_013
     * @tc.number SUB_ARK_ETS_INTL_NUMBERFORMAT_013
     * @tc.desc   The current function handles Intl NumberFormat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARK_ETS_INTL_NUMBERFORMAT_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        var intlObj = new Intl.NumberFormat(['aa','bb','es']);
        console.log("intlNumberFormatTest013::" + intlObj.format(number));
        expect(intlObj.format(number)).assertEqual('123.456,789');
    })

    /**
     * @tc.name   SUB_ARK_ETS_INTL_NUMBERFORMAT_014
     * @tc.number SUB_ARK_ETS_INTL_NUMBERFORMAT_014
     * @tc.desc   The current function handles Intl NumberFormat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARK_ETS_INTL_NUMBERFORMAT_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        var intlObj = new Intl.NumberFormat(['aa','it','bb']);
        console.log("intlNumberFormatTest014::" + intlObj.format(number));
        expect(intlObj.format(number)).assertEqual('123.456,789');
    })

    /**
     * @tc.name   SUB_ARK_ETS_INTL_NUMBERFORMAT_015
     * @tc.number SUB_ARK_ETS_INTL_NUMBERFORMAT_015
     * @tc.desc   The current function handles Intl NumberFormat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARK_ETS_INTL_NUMBERFORMAT_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        var option = { style: 'decimal', notation: 'scientific' };
        var intlObj = new Intl.NumberFormat('en-GB', option);
        console.log("intlNumberFormatTest015::" + intlObj.format(number));
        expect(intlObj.format(number)).assertEqual('1.235E5');
        expect(intlObj.resolvedOptions().style).assertEqual('decimal');
        expect(intlObj.resolvedOptions().notation).assertEqual('scientific');
    })

    /**
     * @tc.name   SUB_ARK_ETS_INTL_NUMBERFORMAT_016
     * @tc.number SUB_ARK_ETS_INTL_NUMBERFORMAT_016
     * @tc.desc   The current function handles Intl NumberFormat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARK_ETS_INTL_NUMBERFORMAT_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        var option = { style: 'currency', currency: 'EUR',
            currencyDisplay: 'name', currencySign: 'accounting', signDisplay: 'always' };
        var intlObj = new Intl.NumberFormat("en-GB", option);
        console.log("intlNumberFormatTest016::" + intlObj.format(number));
        expect(intlObj.format(number)).assertEqual('+123,456.79 euros');
        expect(intlObj.resolvedOptions().locale).assertEqual('en-GB');
        expect(intlObj.resolvedOptions().style).assertEqual('currency');
        expect(intlObj.resolvedOptions().currency).assertEqual('EUR');
        expect(intlObj.resolvedOptions().currencyDisplay).assertEqual('name');
        expect(intlObj.resolvedOptions().currencySign).assertEqual('accounting');
        expect(intlObj.resolvedOptions().signDisplay).assertEqual('always');
    })

    /**
     * @tc.name   SUB_ARK_ETS_INTL_NUMBERFORMAT_017
     * @tc.number SUB_ARK_ETS_INTL_NUMBERFORMAT_017
     * @tc.desc   The current function handles Intl NumberFormat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARK_ETS_INTL_NUMBERFORMAT_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        var option =  { style: 'currency', currency: 'USD',
            currencyDisplay: 'code', currencySign: 'accounting', signDisplay: 'always' };
        var intlObj = new Intl.NumberFormat("en-US", option);
        console.log("intlNumberFormatTest017::" + intlObj.format(number));
        expect(intlObj.format(number)).assertEqual('+USD 123,456.79');
        expect(intlObj.resolvedOptions().currency).assertEqual('USD');
        expect(intlObj.format(number)).assertContain('123,456.79');
    })

    /**
     * @tc.name   SUB_ARK_ETS_INTL_NUMBERFORMAT_018
     * @tc.number SUB_ARK_ETS_INTL_NUMBERFORMAT_018
     * @tc.desc   The current function handles Intl NumberFormat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARK_ETS_INTL_NUMBERFORMAT_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        var option = { style: 'currency', currency: 'CNY',
            currencyDisplay: 'symbol', currencySign: 'accounting', signDisplay: 'always' };
        var intlObj = new Intl.NumberFormat("zh-CN", option);
        console.log("intlNumberFormatTest018::" + intlObj.format(number));
        expect(intlObj.format(number)).assertEqual('+¥123,456.79');
    })

    /**
     * @tc.name   SUB_ARK_ETS_INTL_NUMBERFORMAT_019
     * @tc.number SUB_ARK_ETS_INTL_NUMBERFORMAT_019
     * @tc.desc   The current function handles Intl NumberFormat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARK_ETS_INTL_NUMBERFORMAT_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        var option = { style: 'currency', currency: 'JPY',
            currencyDisplay: 'narrowSymbol', currencySign: 'accounting', signDisplay: 'always' };
        var intlObj = new Intl.NumberFormat("ja-JP", option);
        console.log("intlNumberFormatTest019::" + intlObj.format(number));
        expect(intlObj.format(number)).assertEqual('+￥123,457');
      
    })

    /**
     * @tc.name   SUB_ARK_ETS_INTL_NUMBERFORMAT_020
     * @tc.number SUB_ARK_ETS_INTL_NUMBERFORMAT_020
     * @tc.desc   The current function handles Intl NumberFormat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARK_ETS_INTL_NUMBERFORMAT_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        var option = { style: 'unit', unit: 'meter',
            unitDisplay: 'long', maximumFractionDigits: 2, minimumIntegerDigits: 7 };
        var intlObj = new Intl.NumberFormat("zh-CN", option);
        console.log("intlNumberFormatTest020::" + intlObj.format(number));
        expect(intlObj.format(number)).assertEqual('0,123,456.79米');
        expect(intlObj.resolvedOptions().style).assertEqual('unit');
        expect(intlObj.resolvedOptions().unit).assertEqual('meter');
        expect(intlObj.resolvedOptions().unitDisplay).assertEqual('long');
    })

    console.log('*************Collator*************');
    /**
     * @tc.name   SUB_ARK_ETS_INTL_COLLATOR_001
     * @tc.number SUB_ARK_ETS_INTL_COLLATOR_001
     * @tc.desc   The current function handles Intl Collator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARK_ETS_INTL_COLLATOR_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        var coll = new Intl.Collator();
        var value = coll.compare('a', 'b');
        console.log('collatorTest001 ' + value);
        expect(value).assertEqual(-1);
    })

    /**
     * @tc.name   SUB_ARK_ETS_INTL_COLLATOR_002
     * @tc.number SUB_ARK_ETS_INTL_COLLATOR_002
     * @tc.desc   The current function handles Intl Collator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARK_ETS_INTL_COLLATOR_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        var coll = new Intl.Collator();
        var value = coll.compare('a', 'a');
        console.log('collatorTest002 ' + value);
        expect(value).assertEqual(0);
    })

    /**
     * @tc.name   SUB_ARK_ETS_INTL_COLLATOR_003
     * @tc.number SUB_ARK_ETS_INTL_COLLATOR_003
     * @tc.desc   The current function handles Intl Collator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARK_ETS_INTL_COLLATOR_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        var coll = new Intl.Collator();
        var value = coll.compare('b', 'a');
        console.log('collatorTest003 ' + value);
        expect(value).assertEqual(1);
    })

    /**
     * @tc.name   SUB_ARK_ETS_INTL_COLLATOR_004
     * @tc.number SUB_ARK_ETS_INTL_COLLATOR_004
     * @tc.desc   The current function handles Intl Collator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARK_ETS_INTL_COLLATOR_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        var coll = new Intl.Collator('zh');
        var value = coll.compare('a', 'b');
        console.log('collatorTest004 ' + value);
        expect(value).assertEqual(-1);
    })

    /**
     * @tc.name   SUB_ARK_ETS_INTL_COLLATOR_005
     * @tc.number SUB_ARK_ETS_INTL_COLLATOR_005
     * @tc.desc   The current function handles Intl Collator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARK_ETS_INTL_COLLATOR_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        var coll = new Intl.Collator('zh', {'collation': 'eor'});
        var value = coll.compare('a', 'b');
        console.log('collatorTest005 ' + value);
        expect(value).assertEqual(-1);
        expect(coll.resolvedOptions().collation).assertEqual('eor');
    })

    /**
     * @tc.name   SUB_ARK_ETS_INTL_COLLATOR_006
     * @tc.number SUB_ARK_ETS_INTL_COLLATOR_006
     * @tc.desc   The current function handles Intl Collator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARK_ETS_INTL_COLLATOR_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        var coll = new Intl.Collator('zh', {'sensitivity': 'base'});
        var value = coll.compare('a', 'b');
        console.log('collatorTest006 ' + value);
        expect(value).assertEqual(-1);
        expect(coll.resolvedOptions().sensitivity).assertEqual('base');
    })

    /**
     * @tc.name   SUB_ARK_ETS_INTL_COLLATOR_007
     * @tc.number SUB_ARK_ETS_INTL_COLLATOR_007
     * @tc.desc   The current function handles Intl Collator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARK_ETS_INTL_COLLATOR_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        var coll = new Intl.Collator('zh', {'caseFirst': 'upper'});
        var value = coll.compare('a', 'b');
        console.log('collatorTest007 ' + value);
        expect(value).assertEqual(-1);
        expect(coll.resolvedOptions().caseFirst).assertEqual('upper');
    })

    /**
     * @tc.name   SUB_ARK_ETS_INTL_COLLATOR_008
     * @tc.number SUB_ARK_ETS_INTL_COLLATOR_008
     * @tc.desc   The current function handles Intl Collator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARK_ETS_INTL_COLLATOR_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        var coll = new Intl.Collator('zh', {'numeric': true});
        var value = coll.compare('a', 'b');
        console.log('collatorTest008 ' + value);
        expect(value).assertEqual(-1);
        expect(coll.resolvedOptions().numeric).assertTrue();
    })

    /**
     * @tc.name   SUB_ARK_ETS_INTL_COLLATOR_009
     * @tc.number SUB_ARK_ETS_INTL_COLLATOR_009
     * @tc.desc   The current function handles Intl Collator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARK_ETS_INTL_COLLATOR_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        var coll = new Intl.Collator('zh', {'ignorePunctuation': true});
        var value = coll.compare('a', 'b');
        console.log('collatorTest009 ' + value);
        expect(value).assertEqual(-1);
        expect(coll.resolvedOptions().ignorePunctuation).assertTrue();
    })

    /**
     * @tc.name   SUB_ARK_ETS_INTL_COLLATOR_010
     * @tc.number SUB_ARK_ETS_INTL_COLLATOR_010
     * @tc.desc   The current function handles Intl Collator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARK_ETS_INTL_COLLATOR_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        var coll = new Intl.Collator('zh', {'usage': 'sort'});
        var value = coll.compare('a', 'b');
        console.log('collatorTest010 ' + value);
        expect(value).assertEqual(-1);
        expect(coll.resolvedOptions().usage).assertEqual('sort');
    })

    /**
     * @tc.name   SUB_ARK_ETS_INTL_COLLATOR_011
     * @tc.number SUB_ARK_ETS_INTL_COLLATOR_011
     * @tc.desc   The current function handles Intl Collator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARK_ETS_INTL_COLLATOR_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        var coll = new Intl.Collator('zh', {'collation': 'eor', 'usage': 'sort'});
        var value = coll.compare('a', 'b');
        console.log('collatorTest012 ' + value);
        expect(value).assertEqual(-1);
        expect(coll.resolvedOptions().collation).assertEqual('eor');
        expect(coll.resolvedOptions().usage).assertEqual('sort');
    })

    /**
     * @tc.name   SUB_ARK_ETS_INTL_COLLATOR_012
     * @tc.number SUB_ARK_ETS_INTL_COLLATOR_012
     * @tc.desc   The current function handles Intl Collator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARK_ETS_INTL_COLLATOR_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        var coll = new Intl.Collator('zh', {'collation': 'eor', 'usage': 'sort'});
        var value = coll.compare('a', 'a');
        console.log('collatorTest013 ' + value);
        expect(value).assertEqual(0);
        expect(coll.resolvedOptions().collation).assertEqual('eor');
        expect(coll.resolvedOptions().usage).assertEqual('sort');
    })

    /**
     * @tc.name   SUB_ARK_ETS_INTL_COLLATOR_013
     * @tc.number SUB_ARK_ETS_INTL_COLLATOR_013
     * @tc.desc   The current function handles Intl Collator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARK_ETS_INTL_COLLATOR_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        var coll = new Intl.Collator('zh', {'collation': 'eor', 'usage': 'sort',
            'ignorePunctuation': true });
        var value = coll.compare('a', 'a');
        console.log('collatorTest014 ' + value);
        expect(value).assertEqual(0);
        expect(coll.resolvedOptions().collation).assertEqual('eor');
        expect(coll.resolvedOptions().usage).assertEqual('sort');
        expect(coll.resolvedOptions().ignorePunctuation).assertTrue();
    })

    /**
     * @tc.name   SUB_ARK_ETS_INTL_COLLATOR_014
     * @tc.number SUB_ARK_ETS_INTL_COLLATOR_014
     * @tc.desc   The current function handles Intl Collator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARK_ETS_INTL_COLLATOR_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        var coll = new Intl.Collator('zh', {'collation': 'eor', 'usage': 'sort',
            'ignorePunctuation': true, 'numeric': true });
        var value = coll.compare('b', 'a');
        console.log('collatorTest015 ' + value);
        expect(value).assertEqual(1);
        expect(coll.resolvedOptions().collation).assertEqual('eor');
        expect(coll.resolvedOptions().usage).assertEqual('sort');
        expect(coll.resolvedOptions().ignorePunctuation).assertTrue();
        expect(coll.resolvedOptions().numeric).assertTrue();
    })

    console.log('*************PluralRules*************');
    /**
     * @tc.name   SUB_ARK_ETS_INTL_PLURALRULES_001
     * @tc.number SUB_ARK_ETS_INTL_PLURALRULES_001
     * @tc.desc   The current function handles Intl PluralRules
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARK_ETS_INTL_PLURALRULES_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        var plur = new Intl.PluralRules();
        var value = plur.select(0);
        console.log('PluralRulesTest001 :' + value);
        expect(value).assertEqual('other');
    })

    /**
     * @tc.name   SUB_ARK_ETS_INTL_PLURALRULES_002
     * @tc.number SUB_ARK_ETS_INTL_PLURALRULES_002
     * @tc.desc   The current function handles Intl PluralRules
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARK_ETS_INTL_PLURALRULES_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        var plur = new Intl.PluralRules('zh');
        var value = plur.select(0);
        console.log('PluralRulesTest002 :' + value);
        expect(value).assertEqual('other');
    })

    /**
     * @tc.name   SUB_ARK_ETS_INTL_PLURALRULES_003
     * @tc.number SUB_ARK_ETS_INTL_PLURALRULES_003
     * @tc.desc   The current function handles Intl PluralRules
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARK_ETS_INTL_PLURALRULES_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        var plur = new Intl.PluralRules('zh',  {'type': 'ordinal'});
        var value = plur.select(0);
        console.log('PluralRulesTest003 :' + value);
        expect(value).assertEqual('other');
    })

    /**
     * @tc.name   SUB_ARK_ETS_INTL_PLURALRULES_004
     * @tc.number SUB_ARK_ETS_INTL_PLURALRULES_004
     * @tc.desc   The current function handles Intl PluralRules
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARK_ETS_INTL_PLURALRULES_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        var plur = new Intl.PluralRules('zh', {'localeMatcher': 'lookup'});
        var value = plur.select(0);
        console.log('PluralRulesTest004 :' + value);
        expect(value).assertEqual('other');
    })

    /**
     * @tc.name   SUB_ARK_ETS_INTL_PLURALRULES_005
     * @tc.number SUB_ARK_ETS_INTL_PLURALRULES_005
     * @tc.desc   The current function handles Intl PluralRules
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARK_ETS_INTL_PLURALRULES_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        var plur = new Intl.PluralRules('zh', {'minimumIntegerDigits': 10});
        var value = plur.select(0);
        console.log('PluralRulesTest005 :' + value);
        expect(value).assertEqual('other');
    })

    /**
     * @tc.name   SUB_ARK_ETS_INTL_PLURALRULES_006
     * @tc.number SUB_ARK_ETS_INTL_PLURALRULES_006
     * @tc.desc   The current function handles Intl PluralRules
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARK_ETS_INTL_PLURALRULES_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        var plur = new Intl.PluralRules('zh', {'minimumFractionDigits': 11});
        var value = plur.select(0);
        console.log('PluralRulesTest006 :' + value);
        expect(value).assertEqual('other');
    })

    /**
     * @tc.name   SUB_ARK_ETS_INTL_PLURALRULES_007
     * @tc.number SUB_ARK_ETS_INTL_PLURALRULES_007
     * @tc.desc   The current function handles Intl PluralRules
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARK_ETS_INTL_PLURALRULES_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        var plur = new Intl.PluralRules('en-GB');
        var value = plur.select(0);
        console.log('PluralRulesTest007 :' + value);
        expect(value).assertEqual('other');
    })
    
    /**
     * @tc.name   SUB_ARK_ETS_INTL_PLURALRULES_008
     * @tc.number SUB_ARK_ETS_INTL_PLURALRULES_008
     * @tc.desc   The current function handles Intl PluralRules
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARK_ETS_INTL_PLURALRULES_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        var plur = new Intl.PluralRules('en-GB', {'minimumFractionDigits': 11});
        var value = plur.select(0);
        console.log('PluralRulesTest008 :' + value);
        expect(value).assertEqual('other');
        expect(plur.resolvedOptions().minimumFractionDigits).assertEqual(11);
    })

    console.log('*************RelativeTimeFormat*************');
    /**
     * @tc.name   SUB_ARK_ETS_INTL_RELATIVETIMEFORMAT_001
     * @tc.number SUB_ARK_ETS_INTL_RELATIVETIMEFORMAT_001
     * @tc.desc   The current function handles Intl RelativeTimeFormat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARK_ETS_INTL_RELATIVETIMEFORMAT_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        var relativetimefmt = new Intl.RelativeTimeFormat();
        var value = relativetimefmt.format(100, 'second');
        console.log('RelativeTimeFormatTest001 :' + value);
        expect(value).assertEqual('in 100 seconds');
    })

    /**
     * @tc.name   SUB_ARK_ETS_INTL_RELATIVETIMEFORMAT_002
     * @tc.number SUB_ARK_ETS_INTL_RELATIVETIMEFORMAT_002
     * @tc.desc   The current function handles Intl RelativeTimeFormat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARK_ETS_INTL_RELATIVETIMEFORMAT_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        var relativetimefmt = new Intl.RelativeTimeFormat("en");
        var value = relativetimefmt.format(100, 'second');
        console.log('RelativeTimeFormatTest002 :' + value);
        expect(value).assertEqual('in 100 seconds');
    })

    /**
     * @tc.name   SUB_ARK_ETS_INTL_RELATIVETIMEFORMAT_003
     * @tc.number SUB_ARK_ETS_INTL_RELATIVETIMEFORMAT_003
     * @tc.desc   The current function handles Intl RelativeTimeFormat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARK_ETS_INTL_RELATIVETIMEFORMAT_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        var relativetimefmt = new Intl.RelativeTimeFormat("zh");
        var value = relativetimefmt.format(100, 'second');
        console.log('RelativeTimeFormatTest003 :' + value);
        expect(value).assertEqual('100秒钟后');
    })

    /**
     * @tc.name   SUB_ARK_ETS_INTL_RELATIVETIMEFORMAT_004
     * @tc.number SUB_ARK_ETS_INTL_RELATIVETIMEFORMAT_004
     * @tc.desc   The current function handles Intl RelativeTimeFormat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARK_ETS_INTL_RELATIVETIMEFORMAT_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        var relativetimefmt = new Intl.RelativeTimeFormat("en");
        var value = relativetimefmt.format(100, 'quarter');
        console.log('RelativeTimeFormatTest004 :' + value);
        expect(value).assertEqual('in 100 quarters');
    })

    /**
     * @tc.name   SUB_ARK_ETS_INTL_RELATIVETIMEFORMAT_005
     * @tc.number SUB_ARK_ETS_INTL_RELATIVETIMEFORMAT_005
     * @tc.desc   The current function handles Intl RelativeTimeFormat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARK_ETS_INTL_RELATIVETIMEFORMAT_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        var relativetimefmt = new Intl.RelativeTimeFormat("en");
        var value = relativetimefmt.format(6, 'quarter');
        console.log('RelativeTimeFormatTest005 :' + value);
        expect(value).assertEqual('in 6 quarters');
    })

    /**
     * @tc.name   SUB_ARK_ETS_INTL_RELATIVETIMEFORMAT_006
     * @tc.number SUB_ARK_ETS_INTL_RELATIVETIMEFORMAT_006
     * @tc.desc   The current function handles Intl RelativeTimeFormat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARK_ETS_INTL_RELATIVETIMEFORMAT_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        var relativetimefmt = new Intl.RelativeTimeFormat("zh");
        var value = relativetimefmt.format(100, 'quarter');
        console.log('RelativeTimeFormatTest006 :' + value);
        expect(value).assertEqual('100个季度后');
    })

    /**
     * @tc.name   SUB_ARK_ETS_INTL_RELATIVETIMEFORMAT_007
     * @tc.number SUB_ARK_ETS_INTL_RELATIVETIMEFORMAT_007
     * @tc.desc   The current function handles Intl RelativeTimeFormat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARK_ETS_INTL_RELATIVETIMEFORMAT_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        var relativetimefmt = new Intl.RelativeTimeFormat("en", { style: "narrow" });
        var value = relativetimefmt.format(100, 'second');
        console.log('RelativeTimeFormatTest007 :' + value);
        expect(value).assertEqual('in 100s');
    })

    /**
     * @tc.name   SUB_ARK_ETS_INTL_RELATIVETIMEFORMAT_008
     * @tc.number SUB_ARK_ETS_INTL_RELATIVETIMEFORMAT_008
     * @tc.desc   The current function handles Intl RelativeTimeFormat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARK_ETS_INTL_RELATIVETIMEFORMAT_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        var relativetimefmt = new Intl.RelativeTimeFormat("en", { style: "narrow" });
        var value = relativetimefmt.format(-1, 'day');
        console.log('RelativeTimeFormatTest008 :' + value);
        expect(value).assertEqual('1d ago');
    })

    /**
     * @tc.name   SUB_ARK_ETS_INTL_RELATIVETIMEFORMAT_009
     * @tc.number SUB_ARK_ETS_INTL_RELATIVETIMEFORMAT_009
     * @tc.desc   The current function handles Intl RelativeTimeFormat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARK_ETS_INTL_RELATIVETIMEFORMAT_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        var relativetimefmt = new Intl.RelativeTimeFormat("zh", { style: "narrow" });
        var value = relativetimefmt.format(-1, 'day');
        console.log('RelativeTimeFormatTest009 :' + value);
        expect(value).assertEqual('1天前');
    })
    
    /**
     * @tc.name   SUB_ARK_ETS_INTL_RELATIVETIMEFORMAT_010
     * @tc.number SUB_ARK_ETS_INTL_RELATIVETIMEFORMAT_010
     * @tc.desc   The current function handles Intl RelativeTimeFormat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARK_ETS_INTL_RELATIVETIMEFORMAT_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        var relativetimefmt = new Intl.RelativeTimeFormat("en", { style: "narrow" });
        var value = relativetimefmt.format(2, 'day');
        console.log('RelativeTimeFormatTest010 :' + value);
        expect(value).assertEqual('in 2d');
    })

    /**
     * @tc.name   SUB_ARK_ETS_INTL_RELATIVETIMEFORMAT_011
     * @tc.number SUB_ARK_ETS_INTL_RELATIVETIMEFORMAT_011
     * @tc.desc   The current function handles Intl RelativeTimeFormat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARK_ETS_INTL_RELATIVETIMEFORMAT_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        var relativetimefmt = new Intl.RelativeTimeFormat("zh", { style: "narrow" });
        var value = relativetimefmt.format(2, 'day');
        console.log('RelativeTimeFormatTest011 :' + value);
        expect(value).assertEqual('2天后');
    })

    /**
     * @tc.name   SUB_ARK_ETS_INTL_RELATIVETIMEFORMAT_012
     * @tc.number SUB_ARK_ETS_INTL_RELATIVETIMEFORMAT_012
     * @tc.desc   The current function handles Intl RelativeTimeFormat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARK_ETS_INTL_RELATIVETIMEFORMAT_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        var relativetimefmt = new Intl.RelativeTimeFormat("en", { numeric: "auto" });
        var value = relativetimefmt.format(2, 'day');
        console.log('RelativeTimeFormatTest012 :' + value);
        expect(value).assertEqual('in 2 days');
    })

    /**
     * @tc.name   SUB_ARK_ETS_INTL_RELATIVETIMEFORMAT_013
     * @tc.number SUB_ARK_ETS_INTL_RELATIVETIMEFORMAT_013
     * @tc.desc   The current function handles Intl RelativeTimeFormat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARK_ETS_INTL_RELATIVETIMEFORMAT_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        var relativetimefmt = new Intl.RelativeTimeFormat("zh", { numeric: "auto" });
        var value = relativetimefmt.format(2, 'day');
        console.log('RelativeTimeFormatTest012 :' + value);
        expect(value).assertEqual('后天');
    })

    /**
     * @tc.name   SUB_ARK_ETS_INTL_RELATIVETIMEFORMAT_014
     * @tc.number SUB_ARK_ETS_INTL_RELATIVETIMEFORMAT_014
     * @tc.desc   The current function handles Intl RelativeTimeFormat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARK_ETS_INTL_RELATIVETIMEFORMAT_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        var relativetimefmt = new Intl.RelativeTimeFormat("en", { numeric: "auto" });
        var value = relativetimefmt.format(-1, 'year');
        console.log('RelativeTimeFormatTest014 :' + value);
        expect(value).assertEqual('last year');
    })

    /**
     * @tc.name   SUB_ARK_ETS_INTL_RELATIVETIMEFORMAT_015
     * @tc.number SUB_ARK_ETS_INTL_RELATIVETIMEFORMAT_015
     * @tc.desc   The current function handles Intl RelativeTimeFormat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARK_ETS_INTL_RELATIVETIMEFORMAT_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        var relativetimefmt = new Intl.RelativeTimeFormat("zh", { numeric: "auto" });
        var value = relativetimefmt.format(-1, 'year');
        console.log('RelativeTimeFormatTest014 :' + value);
        expect(value).assertEqual('去年');
    })
    
    /**
     * @tc.name   SUB_ARK_ETS_INTL_RELATIVETIMEFORMAT_016
     * @tc.number SUB_ARK_ETS_INTL_RELATIVETIMEFORMAT_016
     * @tc.desc   The current function handles Intl RelativeTimeFormat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARK_ETS_INTL_RELATIVETIMEFORMAT_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        try {
            var relativetimefmt = new Intl.RelativeTimeFormat("en", { numeric: "auto" });
            var value = relativetimefmt.format(-1, 'mo');
            console.log('RelativeTimeFormatTest016 :' + value);
        } catch(e) {
            console.log('RelativeTimeFormatTest016 Err:' + e);
            expect(e == "RangeError").assertTrue();
        }
    })

    /**
     * @tc.name   SUB_ARK_ETS_INTL_RELATIVETIMEFORMAT_017
     * @tc.number SUB_ARK_ETS_INTL_RELATIVETIMEFORMAT_017
     * @tc.desc   The current function handles Intl RelativeTimeFormat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARK_ETS_INTL_RELATIVETIMEFORMAT_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        var relativetimefmt = new Intl.RelativeTimeFormat("zh", { numeric: "auto" });
        var value = relativetimefmt.format(-1, 'quarter');
        console.log('RelativeTimeFormatTest017 :' + value);
        expect(value).assertEqual('上季度');
    })

    /**
     * @tc.name   SUB_ARK_ETS_INTL_RELATIVETIMEFORMAT_018
     * @tc.number SUB_ARK_ETS_INTL_RELATIVETIMEFORMAT_018
     * @tc.desc   The current function handles Intl RelativeTimeFormat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARK_ETS_INTL_RELATIVETIMEFORMAT_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        var relativetimefmt = new Intl.RelativeTimeFormat("en", { numeric: "auto", style: 'short'});
        var value = relativetimefmt.format(-1, 'quarter');
        console.log('RelativeTimeFormatTest018 :' + value);
        expect(value).assertEqual('last qtr.');
        expect(relativetimefmt.resolvedOptions().numeric).assertEqual('auto');
        expect(relativetimefmt.resolvedOptions().style).assertEqual('short');
    })

    /**
     * @tc.name   SUB_ARK_ETS_INTL_RELATIVETIMEFORMAT_019
     * @tc.number SUB_ARK_ETS_INTL_RELATIVETIMEFORMAT_019
     * @tc.desc   The current function handles Intl RelativeTimeFormat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARK_ETS_INTL_RELATIVETIMEFORMAT_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        var relativetimefmt = new Intl.RelativeTimeFormat("en", { numeric: "auto", style: 'short'});
        var value = relativetimefmt.format(1, 'quarter');
        console.log('RelativeTimeFormatTest019 :' + value);
        expect(value).assertEqual('next qtr.');
        expect(relativetimefmt.resolvedOptions().numeric).assertEqual('auto');
        expect(relativetimefmt.resolvedOptions().style).assertEqual('short');
    })

    /**
     * @tc.name   SUB_ARK_ETS_INTL_RELATIVETIMEFORMAT_020
     * @tc.number SUB_ARK_ETS_INTL_RELATIVETIMEFORMAT_020
     * @tc.desc   The current function handles Intl RelativeTimeFormat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARK_ETS_INTL_RELATIVETIMEFORMAT_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        var relativetimefmt = new Intl.RelativeTimeFormat("en", { numeric: "auto", style: 'narrow'});
        var value = relativetimefmt.format(1, 'quarter');
        console.log('RelativeTimeFormatTest020 :' + value);
        expect(value).assertEqual('next qtr.');
        expect(relativetimefmt.resolvedOptions().numeric).assertEqual('auto');
        expect(relativetimefmt.resolvedOptions().style).assertEqual('narrow');
    })

    /**
     * @tc.name   SUB_ARK_ETS_INTL_RELATIVETIMEFORMAT_021
     * @tc.number SUB_ARK_ETS_INTL_RELATIVETIMEFORMAT_021
     * @tc.desc   The current function handles Intl RelativeTimeFormat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARK_ETS_INTL_RELATIVETIMEFORMAT_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        var relativetimefmt = new Intl.RelativeTimeFormat("en", { numeric: "always", style: 'narrow'});
        var value = relativetimefmt.format(1, 'quarter');
        console.log('RelativeTimeFormatTest021 :' + value);
        expect(value).assertEqual('in 1q');
        expect(relativetimefmt.resolvedOptions().numeric).assertEqual('always');
        expect(relativetimefmt.resolvedOptions().style).assertEqual('narrow');
    })

    /**
     * @tc.name   SUB_ARK_ETS_INTL_RELATIVETIMEFORMAT_022
     * @tc.number SUB_ARK_ETS_INTL_RELATIVETIMEFORMAT_022
     * @tc.desc   The current function handles Intl RelativeTimeFormat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARK_ETS_INTL_RELATIVETIMEFORMAT_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        var relativetimefmt = new Intl.RelativeTimeFormat("zh", { numeric: "always", style: 'narrow'});
        var value = relativetimefmt.format(1, 'quarter');
        console.log('RelativeTimeFormatTest022 :' + value);
        expect(value).assertEqual('1个季度后');
        expect(relativetimefmt.resolvedOptions().numeric).assertEqual('always');
        expect(relativetimefmt.resolvedOptions().style).assertEqual('narrow');
    })

    /**
     * @tc.name   SUB_ARK_ETS_INTL_RELATIVETIMEFORMAT_023
     * @tc.number SUB_ARK_ETS_INTL_RELATIVETIMEFORMAT_023
     * @tc.desc   The current function handles Intl RelativeTimeFormat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARK_ETS_INTL_RELATIVETIMEFORMAT_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        var relativetimefmt = new Intl.RelativeTimeFormat("en", { numeric: "always", style: 'long'});
        var value = relativetimefmt.format(1, 'quarter');
        console.log('RelativeTimeFormatTest023 :' + value);
        expect(value).assertEqual('in 1 quarter');
        expect(relativetimefmt.resolvedOptions().numeric).assertEqual('always');
        expect(relativetimefmt.resolvedOptions().style).assertEqual('long');
    })

    /**
     * @tc.name   SUB_ARK_ETS_INTL_RELATIVETIMEFORMAT_024
     * @tc.number SUB_ARK_ETS_INTL_RELATIVETIMEFORMAT_024
     * @tc.desc   The current function handles Intl RelativeTimeFormat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARK_ETS_INTL_RELATIVETIMEFORMAT_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        var relativetimefmt = new Intl.RelativeTimeFormat("zh", { numeric: "always", style: 'long'});
        var value = relativetimefmt.format(1, 'quarter');
        console.log('RelativeTimeFormatTest024 :' + value);
        expect(value).assertEqual('1个季度后');
        expect(relativetimefmt.resolvedOptions().numeric).assertEqual('always');
        expect(relativetimefmt.resolvedOptions().style).assertEqual('long');
    })
    
    console.log('*************ListFormat*************');
    /**
     * @tc.name   SUB_ARK_ETS_INTL_LISTFORMAT_001
     * @tc.number SUB_ARK_ETS_INTL_LISTFORMAT_001
     * @tc.desc   The current function handles Intl ListFormat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARK_ETS_INTL_LISTFORMAT_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        var listform = new Intl.ListFormat();
        var value = listform.format(vehicles);
        console.log('ListFormatTest001 :' + value);
        expect(value).assertEqual('Motorcycle, Bus, and Car');
    })

    /**
     * @tc.name   SUB_ARK_ETS_INTL_LISTFORMAT_002
     * @tc.number SUB_ARK_ETS_INTL_LISTFORMAT_002
     * @tc.desc   The current function handles Intl ListFormat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARK_ETS_INTL_LISTFORMAT_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        var listform = new Intl.ListFormat("zh");
        var value = listform.format(vehicles);
        console.log('ListFormatTest002 :' + value);
        expect(value).assertEqual('Motorcycle、Bus和Car');
    })

    /**
     * @tc.name   SUB_ARK_ETS_INTL_LISTFORMAT_003
     * @tc.number SUB_ARK_ETS_INTL_LISTFORMAT_003
     * @tc.desc   The current function handles Intl ListFormat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARK_ETS_INTL_LISTFORMAT_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        var listform = new Intl.ListFormat("en");
        var value = listform.format(vehicles);
        console.log('ListFormatTest003 :' + value);
        expect(value).assertEqual('Motorcycle, Bus, and Car');
    })

    /**
     * @tc.name   SUB_ARK_ETS_INTL_LISTFORMAT_004
     * @tc.number SUB_ARK_ETS_INTL_LISTFORMAT_004
     * @tc.desc   The current function handles Intl ListFormat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARK_ETS_INTL_LISTFORMAT_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        var listform = new Intl.ListFormat("zh", {style: 'long'});
        var value = listform.format(vehicles);
        console.log('ListFormatTest004 :' + value);
        expect(value).assertEqual('Motorcycle、Bus和Car');
    })

    /**
     * @tc.name   SUB_ARK_ETS_INTL_LISTFORMAT_005
     * @tc.number SUB_ARK_ETS_INTL_LISTFORMAT_005
     * @tc.desc   The current function handles Intl ListFormat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARK_ETS_INTL_LISTFORMAT_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        var listform = new Intl.ListFormat("zh", {style: 'short'});
        var value = listform.format(vehicles);
        console.log('ListFormatTest005 :' + value);
        expect(value).assertEqual('Motorcycle、Bus和Car');
    })

    /**
     * @tc.name   SUB_ARK_ETS_INTL_LISTFORMAT_006
     * @tc.number SUB_ARK_ETS_INTL_LISTFORMAT_006
     * @tc.desc   The current function handles Intl ListFormat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARK_ETS_INTL_LISTFORMAT_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        var listform = new Intl.ListFormat("zh", {style: 'narrow'});
        var value = listform.format(vehicles);
        console.log('ListFormatTest006 :' + value);
        expect(value).assertEqual('Motorcycle、Bus、Car');
    })

    /**
     * @tc.name   SUB_ARK_ETS_INTL_LISTFORMAT_007
     * @tc.number SUB_ARK_ETS_INTL_LISTFORMAT_007
     * @tc.desc   The current function handles Intl ListFormat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARK_ETS_INTL_LISTFORMAT_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        var listform = new Intl.ListFormat("en", {style: 'long'});
        var value = listform.format(vehicles);
        console.log('ListFormatTest007 :' + value);
        expect(value).assertEqual('Motorcycle, Bus, and Car');
    })

    /**
     * @tc.name   SUB_ARK_ETS_INTL_LISTFORMAT_008
     * @tc.number SUB_ARK_ETS_INTL_LISTFORMAT_008
     * @tc.desc   The current function handles Intl ListFormat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARK_ETS_INTL_LISTFORMAT_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        var listform = new Intl.ListFormat("en", {style: 'short'});
        var value = listform.format(vehicles);
        console.log('ListFormatTest008 :' + value);
        expect(value).assertEqual('Motorcycle, Bus, & Car');
    })

    /**
     * @tc.name   SUB_ARK_ETS_INTL_LISTFORMAT_009
     * @tc.number SUB_ARK_ETS_INTL_LISTFORMAT_009
     * @tc.desc   The current function handles Intl ListFormat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARK_ETS_INTL_LISTFORMAT_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        var listform = new Intl.ListFormat("en", {style: 'narrow'});
        var value = listform.format(vehicles);
        console.log('ListFormatTest009 :' + value);
        expect(value).assertEqual('Motorcycle, Bus, Car');
    })

    /**
     * @tc.name   SUB_ARK_ETS_INTL_LISTFORMAT_010
     * @tc.number SUB_ARK_ETS_INTL_LISTFORMAT_010
     * @tc.desc   The current function handles Intl ListFormat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARK_ETS_INTL_LISTFORMAT_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        var listform = new Intl.ListFormat("zh", {style: 'long', type: 'conjunction' });
        var value = listform.format(vehicles);
        console.log('ListFormatTest010 :' + value);
        expect(value).assertEqual('Motorcycle、Bus和Car');
    })
    
    /**
     * @tc.name   SUB_ARK_ETS_INTL_LISTFORMAT_011
     * @tc.number SUB_ARK_ETS_INTL_LISTFORMAT_011
     * @tc.desc   The current function handles Intl ListFormat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARK_ETS_INTL_LISTFORMAT_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        var listform = new Intl.ListFormat("zh", {style: 'long', type: 'disjunction' });
        var value = listform.format(vehicles);
        console.log('ListFormatTest011 :' + value);
        expect(value).assertEqual('Motorcycle、Bus或Car');
    })

    /**
     * @tc.name   SUB_ARK_ETS_INTL_LISTFORMAT_012
     * @tc.number SUB_ARK_ETS_INTL_LISTFORMAT_012
     * @tc.desc   The current function handles Intl ListFormat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARK_ETS_INTL_LISTFORMAT_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        var listform = new Intl.ListFormat("zh", {style: 'long', type: 'unit' });
        var value = listform.format(vehicles);
        console.log('ListFormatTest012 :' + value);
        expect(value).assertEqual('MotorcycleBusCar');
    })

    /**
     * @tc.name   SUB_ARK_ETS_INTL_LISTFORMAT_013
     * @tc.number SUB_ARK_ETS_INTL_LISTFORMAT_013
     * @tc.desc   The current function handles Intl ListFormat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARK_ETS_INTL_LISTFORMAT_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        var listform = new Intl.ListFormat("en", {style: 'short', type: 'conjunction' });
        var value = listform.format(vehicles);
        console.log('ListFormatTest013 :' + value);
        expect(value).assertEqual('Motorcycle, Bus, & Car');
    })

    /**
     * @tc.name   SUB_ARK_ETS_INTL_LISTFORMAT_014
     * @tc.number SUB_ARK_ETS_INTL_LISTFORMAT_014
     * @tc.desc   The current function handles Intl ListFormat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARK_ETS_INTL_LISTFORMAT_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        var listform = new Intl.ListFormat("en", {style: 'short', type: 'disjunction' });
        var value = listform.format(vehicles);
        console.log('ListFormatTest014 :' + value);
        expect(value).assertEqual('Motorcycle, Bus, or Car');
    })

    /**
     * @tc.name   SUB_ARK_ETS_INTL_LISTFORMAT_015
     * @tc.number SUB_ARK_ETS_INTL_LISTFORMAT_015
     * @tc.desc   The current function handles Intl ListFormat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARK_ETS_INTL_LISTFORMAT_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        var listform = new Intl.ListFormat("en", {style: 'short', type: 'unit' });
        var value = listform.format(vehicles);
        console.log('ListFormatTest015 :' + value);
        expect(value).assertEqual('Motorcycle, Bus, Car');
    })

    /**
     * @tc.name   SUB_ARK_ETS_INTL_LISTFORMAT_016
     * @tc.number SUB_ARK_ETS_INTL_LISTFORMAT_016
     * @tc.desc   The current function handles Intl ListFormat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARK_ETS_INTL_LISTFORMAT_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        var listform = new Intl.ListFormat("en", {style: 'narrow', type: 'conjunction' });
        var value = listform.format(vehicles);
        console.log('ListFormatTest016 :' + value);
        expect(value).assertEqual('Motorcycle, Bus, Car');
        expect(listform.resolvedOptions().style).assertEqual('narrow');
        expect(listform.resolvedOptions().type).assertEqual('conjunction');
    })

    /**
     * @tc.name   SUB_ARK_ETS_INTL_LISTFORMAT_017
     * @tc.number SUB_ARK_ETS_INTL_LISTFORMAT_017
     * @tc.desc   The current function handles Intl ListFormat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARK_ETS_INTL_LISTFORMAT_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        var listform = new Intl.ListFormat("en", {style: 'narrow', type: 'disjunction' });
        var value = listform.format(vehicles);
        console.log('ListFormatTest017 :' + value);
        expect(value).assertEqual('Motorcycle, Bus, or Car');
        expect(listform.resolvedOptions().style).assertEqual('narrow');
        expect(listform.resolvedOptions().type).assertEqual('disjunction');
    })

    /**
     * @tc.name   SUB_ARK_ETS_INTL_LISTFORMAT_018
     * @tc.number SUB_ARK_ETS_INTL_LISTFORMAT_018
     * @tc.desc   The current function handles Intl ListFormat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARK_ETS_INTL_LISTFORMAT_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        var listform = new Intl.ListFormat("en", {style: 'narrow', type: 'unit' });
        var value = listform.format(vehicles);
        console.log('ListFormatTest018 :' + value);
        expect(value).assertEqual('Motorcycle Bus Car');
        expect(listform.resolvedOptions().style).assertEqual('narrow');
        expect(listform.resolvedOptions().type).assertEqual('unit');
    })
    console.log('*************end IntlTest*************');
})
}