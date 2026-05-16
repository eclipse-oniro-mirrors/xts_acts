/*
 * Copyright (C) 2022-2025 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from "../../../hypium/index"
export default function etsIntlFunTest() {
    describe('etsIntlFunTest', (): void => {
        console.log('*************start IntlTest*************');
        let newDate = new Date((24. * 60 * 60 * 1000).toLong() * (52 * 365 + 9 * 30 + 23));
        let numberValue = 123456.789;
        let vehicles = ['Motorcycle', 'Bus', 'Car'];
        /**
         * @tc.number    SUB_ARK_ETS_INTL_DATETIMEFORMAT_001
         * @tc.name      testIntlDateTimeFormat001
         * @tc.desc      The current function handles Intl DateTimeFormat
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 0
        */
        it('testIntlDateTimeFormat001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            let datefmt = new Intl.DateTimeFormat('en-GB');
            expect(datefmt !== null).assertTrue();
        })

        /**
         * @tc.number    SUB_ARK_ETS_INTL_DATETIMEFORMAT_002
         * @tc.name      testIntlDateTimeFormat002
         * @tc.desc      The current function handles Intl DateTimeFormat
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 0
        */
        it('testIntlDateTimeFormat002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            let datefmt = new Intl.DateTimeFormat();
            expect(datefmt !== null).assertTrue();
        })

        /**
         * @tc.number    SUB_ARK_ETS_INTL_DATETIMEFORMAT_003
         * @tc.name      testIntlDateTimeFormat003
         * @tc.desc      The current function handles Intl DateTimeFormat
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 0
        */
        it('testIntlDateTimeFormat003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            let newDate = new Date((24. * 60 * 60 * 1000).toLong() * (52 * 365 + 9 * 30 + 23));
            let options: Intl.DateTimeFormatOptions =
            {
                year: "2-digit", month: "2-digit", day: "2-digit",
                hour: "2-digit", minute: "2-digit", timeZone: "UTC"
            };
            let intlObj = new Intl.DateTimeFormat("en-US", options).format;
            console.log("intlDateTimeFormatTest003::" + intlObj(newDate));
            expect(intlObj(newDate)).assertEqual("10/08/22, 12:00 AM");
        })

        /**
         * @tc.number    SUB_ARK_ETS_INTL_DATETIMEFORMAT_004
         * @tc.name      testIntlDateTimeFormat004
         * @tc.desc      The current function handles Intl DateTimeFormat
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 0
        */
        it('testIntlDateTimeFormat004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            let options: Intl.DateTimeFormatOptions =
            {
                year: "2-digit", month: "2-digit", day: "2-digit",
                hour: "2-digit", minute: "2-digit", timeZone: "UTC"
            };
            let intlObj = new Intl.DateTimeFormat("en", options).format;
            console.log("intlDateTimeFormatTest004::" + intlObj(newDate));
            expect(intlObj(newDate)).assertEqual("10/08/22, 12:00 AM");
        })

        /**
         * @tc.number    SUB_ARK_ETS_INTL_DATETIMEFORMAT_005
         * @tc.name      testIntlDateTimeFormat005
         * @tc.desc      The current function handles Intl DateTimeFormat
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 0
        */
        it('testIntlDateTimeFormat005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            let options: Intl.DateTimeFormatOptions =
            {
                year: "numeric", month: "long", day: "numeric",
                hour: "2-digit", minute: "2-digit",
                timeZoneName: "short", timeZone: "UTC"
            };
            let intlObj = new Intl.DateTimeFormat(["pt-BR", "pt-PT"], options).format;
            console.log("intlDateTimeFormatTest005::" + intlObj(newDate));
            expect(intlObj(newDate)).assertEqual("8 de outubro de 2022 às 00:00 UTC");
        })

        /**
         * @tc.number    SUB_ARK_ETS_INTL_DATETIMEFORMAT_006
         * @tc.name      testIntlDateTimeFormat006
         * @tc.desc      The current function handles Intl DateTimeFormat
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 0
        */
        it('testIntlDateTimeFormat006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            let swissLocales = ["de-CH", "fr-CH", "it-CH", "rm-CH"];
            let options: Intl.DateTimeFormatOptions =
            {
                weekday: "short",
                hour: "numeric", minute: "numeric",
                timeZone: "UTC", timeZoneName: "short"
            };
            let intlObj = new Intl.DateTimeFormat(swissLocales, options).format;
            console.log("intlDateTimeFormatTest006::" + intlObj(newDate));
            expect(intlObj(newDate)).assertEqual("Sa, 00:00 UTC");
        })

        /**
         * @tc.number    SUB_ARK_ETS_INTL_DATETIMEFORMAT_007
         * @tc.name      testIntlDateTimeFormat007
         * @tc.desc      The current function handles Intl DateTimeFormat
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 0
        */
        it('testIntlDateTimeFormat007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            let options: Intl.DateTimeFormatOptions =
                { year: "numeric", month: "long", day: "numeric", timeZone: "UTC" };
            let intlObj = new Intl.DateTimeFormat("th-TH-u-nu-thai-ca-chinese", options).format;
            console.log("intlDateTimeFormatTest007::" + intlObj(newDate));
            expect(intlObj(newDate)).assertEqual("๒๐๒๒(เหรินอิ๋น) 9 ๑๓");
        })

        /**
         * @tc.number    SUB_ARK_ETS_INTL_DATETIMEFORMAT_008
         * @tc.name      testIntlDateTimeFormat008
         * @tc.desc      The current function handles Intl DateTimeFormat
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 0
        */
        it('testIntlDateTimeFormat008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            let options: Intl.DateTimeFormatOptions = { year: "numeric", month: "long", day: "numeric", timeZone: "UTC" };
            let intlObj = new Intl.DateTimeFormat("en-GB", options).format;
            console.log("intlDateTimeFormatTest008::" + intlObj(newDate));
            expect(intlObj(newDate)).assertEqual("8 October 2022");
        })

        /**
         * @tc.number    SUB_ARK_ETS_INTL_DATETIMEFORMAT_009
         * @tc.name      testIntlDateTimeFormat009
         * @tc.desc      The current function handles Intl DateTimeFormat
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 0
        */
        it('testIntlDateTimeFormat009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            let options: Intl.DateTimeFormatOptions =
                { year: "numeric", month: "long", day: "numeric", timeZone: "UTC" };
            let intlObj = new Intl.DateTimeFormat("aa", options).format;
            console.log("intlDateTimeFormatTest009::" + intlObj(newDate));
            expect(intlObj(newDate)).assertEqual("October 8, 2022");
        })

        /**
         * @tc.number    SUB_ARK_ETS_INTL_DATETIMEFORMAT_010
         * @tc.name      testIntlDateTimeFormat010
         * @tc.desc      The current function handles Intl DateTimeFormat
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 0
        */
        it('testIntlDateTimeFormat010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            let options: Intl.DateTimeFormatOptions =
                { year: "numeric", month: "long", day: "numeric", timeZone: "UTC" };
            let intlObj = new Intl.DateTimeFormat("aa", options).format;
            console.log("intlDateTimeFormatTest010::" + intlObj(newDate));
            expect(intlObj(newDate)).assertInstanceOf("String");
        })

        /**
         * @tc.number    SUB_ARK_ETS_INTL_DATETIMEFORMAT_011
         * @tc.name      testIntlDateTimeFormat011
         * @tc.desc      The current function handles Intl DateTimeFormat
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 0
        */
        it('testIntlDateTimeFormat011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            let options: Intl.DateTimeFormatOptions = { year: "numeric", month: "long", day: "numeric", timeZone: "UTC" };
            let intlObj = new Intl.DateTimeFormat(['ban', 'zh'], options).format;
            console.log("intlDateTimeFormatTest011::" + intlObj(newDate));
            expect(intlObj(newDate)).assertEqual("2022年10月8日");
        })

        /**
         * @tc.number    SUB_ARK_ETS_INTL_DATETIMEFORMAT_012
         * @tc.name      testIntlDateTimeFormat012
         * @tc.desc      The current function handles Intl DateTimeFormat
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 0
        */
        it('testIntlDateTimeFormat012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            let options: Intl.DateTimeFormatOptions = { year: "numeric", month: "long", day: "numeric", timeZone: "UTC" };
            let intlObj = new Intl.DateTimeFormat(['en', 'zh'], options).format;
            console.log("intlDateTimeFormatTest012::" + intlObj(newDate));
            expect(intlObj(newDate)).assertEqual("October 8, 2022");
        })

        /**
         * @tc.number    SUB_ARK_ETS_INTL_DATETIMEFORMAT_013
         * @tc.name      testIntlDateTimeFormat013
         * @tc.desc      The current function handles Intl DateTimeFormat
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 0
        */
        it('testIntlDateTimeFormat013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            let options: Intl.DateTimeFormatOptions = { year: "numeric", month: "long", day: "numeric", timeZone: "UTC" };
            let intlObj = new Intl.DateTimeFormat(['abc', 'ban'], options).format;
            console.log("intlDateTimeFormatTest013::" + intlObj(newDate));
            expect(intlObj(newDate)).assertContain('2022');
        })

        /**
         * @tc.number    SUB_ARK_ETS_INTL_DATETIMEFORMAT_014
         * @tc.name      testIntlDateTimeFormat014
         * @tc.desc      The current function handles Intl DateTimeFormat
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 0
        */
        it('testIntlDateTimeFormat014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            let options: Intl.DateTimeFormatOptions = { year: "numeric", month: "long", day: "numeric", timeZone: "UTC" };
            let intlObj = new Intl.DateTimeFormat("zh-CN", options).format;
            console.log("intlDateTimeFormatTest014::" + intlObj(newDate));
            expect(intlObj(newDate)).assertContain('2022年10月8日');
        })

        /**
         * @tc.number    SUB_ARK_ETS_INTL_DATETIMEFORMAT_015
         * @tc.name      testIntlDateTimeFormat015
         * @tc.desc      The current function handles Intl DateTimeFormat
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 0
        */
        it('testIntlDateTimeFormat015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            let options: Intl.DateTimeFormatOptions = {
                year: "numeric", month: "long", day: "numeric",
                hour: "2-digit", minute: "2-digit", timeZoneName: "short", timeZone: "UTC"
            };
            let intlObj = new Intl.DateTimeFormat("zh-CN", options);
            console.log("intlDateTimeFormatTest015::" + intlObj.format(newDate));
            expect(intlObj.format(newDate)).assertEqual('2022年10月8日 UTC 00:00');
            expect(intlObj.resolvedOptions().timeZone).assertEqual('UTC');
            expect(intlObj.resolvedOptions().timeZoneName).assertEqual('short');
        })

        /**
         * @tc.number    SUB_ARK_ETS_INTL_DATETIMEFORMAT_016
         * @tc.name      testIntlDateTimeFormat016
         * @tc.desc      The current function handles Intl DateTimeFormatToParts
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 0
        */
        //  it('testIntlDateTimeFormat016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void =>  {
        //     let options : Intl.DateTimeFormatOptions = { year: "numeric", month: "long", day: "numeric",
        //         hour: "2-digit", minute: "2-digit", timeZoneName: "short", timeZone: "UTC" };
        //     let intlObj = new Intl.DateTimeFormat("zh-CN", options);
        //     console.log("intlDateTimeFormatTest016::" + intlObj.format(newDate));
        //     expect(intlObj.format(newDate)).assertEqual('2022年10月8日 UTC 上午12:00');
        //     expect(intlObj.resolvedOptions().timeZone).assertEqual('UTC');
        //     expect(intlObj.resolvedOptions().timeZoneName).assertEqual('short');
        //     let parts = intlObj.formatToParts(newDate);
        //     let partValues : string[]= []
        //      for (let i = 0; i < parts.length; i++) {
        //          partValues.push(parts[i].value);
        //      }
        //     expect(partValues.length).assertEqual(12);
        //     expect(partValues[0]).assertEqual('2022');
        // })

        /**
         * @tc.number    SUB_ARK_ETS_INTL_DATETIMEFORMAT_017
         * @tc.name      testIntlDateTimeFormat017
         * @tc.desc      The current function handles Intl DateTimeFormatToParts
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 0
        */
        //  it('testIntlDateTimeFormat017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void =>  {
        //     let options : Intl.DateTimeFormatOptions = { year: "numeric", month: "long", day: "numeric",
        //         hour: "2-digit", minute: "2-digit", timeZoneName: "short", timeZone: "UTC", hour12: true };
        //     let intlObj = new Intl.DateTimeFormat("en-us", options);
        //     console.log("intlDateTimeFormatTest017::" + intlObj.format(newDate));
        //     expect(intlObj.resolvedOptions().timeZone).assertEqual('UTC');
        //     expect(intlObj.resolvedOptions().hour12).assertTrue();
        //     let parts = intlObj.formatToParts(newDate);
        //     let partValues : string[]= []
        //     for (let i = 0; i < parts.length; i++) {
        //         partValues.push(parts[i].value);
        //     }
        //     expect(partValues.length).assertEqual(13);
        //     expect(partValues[0]).assertEqual('October');
        // })

        /**
         * @tc.number    SUB_ARK_ETS_INTL_DATETIMEFORMAT_018
         * @tc.name      testIntlDateTimeFormat018
         * @tc.desc      The current function handles Intl DateTimeFormatToParts
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 0
        */
        it('testIntlDateTimeFormat018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            let options: Intl.DateTimeFormatOptions = {
                year: "numeric", month: "long", day: "numeric",
                hour: "2-digit", minute: "2-digit", timeZoneName: "short", timeZone: "UTC", hour12: true
            };
            let intlObj = new Intl.DateTimeFormat("en-us", options);
            let rops = intlObj.resolvedOptions();
            console.log("intlDateTimeFormatTest015::" + intlObj.format(newDate));
            expect(rops.locale).assertEqual('en-US');
            expect(rops.calendar).assertEqual('gregory');
            expect(rops.numberingSystem).assertEqual('latn');
        })

        console.log('*************IntlNumber*************');
        /**
         * @tc.number    SUB_ARK_ETS_INTL_NUMBERFORMAT_001
         * @tc.name      testIntlNumberFormat001
         * @tc.desc      The current function handles Intl NumberFormat
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 0
        */
        it('testIntlNumberFormat001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            let intlObj = new Intl.NumberFormat('zh');
            console.log("intlNumberFormatTest001::" + intlObj.format(numberValue));
            expect(intlObj.format(numberValue)).assertEqual('123,456.789');
        })

        /**
         * @tc.number    SUB_ARK_ETS_INTL_NUMBERFORMAT_002
         * @tc.name      testIntlNumberFormat002
         * @tc.desc      The current function handles Intl NumberFormat
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 0
        */
        it('testIntlNumberFormat002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            let intlObj = new Intl.NumberFormat();
            expect(intlObj !== null).assertTrue();
        })

        /**
         * @tc.number    SUB_ARK_ETS_INTL_NUMBERFORMAT_003
         * @tc.name      testIntlNumberFormat003
         * @tc.desc      The current function handles Intl NumberFormat
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 0
        */
        it('testIntlNumberFormat003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            let intlObj = new Intl.NumberFormat('zh-u-nu-latn');
            console.log("intlNumberFormatTest003::" + intlObj.format(numberValue));
            expect(intlObj.format(numberValue)).assertEqual('123,456.789');
        })

        /**
         * @tc.number    SUB_ARK_ETS_INTL_NUMBERFORMAT_004
         * @tc.name      testIntlNumberFormat004
         * @tc.desc      The current function handles Intl NumberFormat
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 0
        */
        it('testIntlNumberFormat004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            let intlObj = new Intl.NumberFormat('zh-u-nu-arab');
            console.log("intlNumberFormatTest004::" + intlObj.format(numberValue));
            expect(intlObj.format(numberValue)).assertEqual('١٢٣٬٤٥٦٫٧٨٩');
        })

        /**
         * @tc.number    SUB_ARK_ETS_INTL_NUMBERFORMAT_005
         * @tc.name      testIntlNumberFormat005
         * @tc.desc      The current function handles Intl NumberFormat
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 0
        */
        it('testIntlNumberFormat005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            let intlObj = new Intl.NumberFormat('en');
            console.log("intlNumberFormatTest005::" + intlObj.format(numberValue));
            expect(intlObj.format(numberValue)).assertEqual('123,456.789');
        })

        /**
         * @tc.number    SUB_ARK_ETS_INTL_NUMBERFORMAT_006
         * @tc.name      testIntlNumberFormat006
         * @tc.desc      The current function handles Intl NumberFormat
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 0
        */
        it('testIntlNumberFormat006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            let intlObj = new Intl.NumberFormat('en-u-nu-thai');
            console.log("intlNumberFormatTest006::" + intlObj.format(numberValue));
            expect(intlObj.format(numberValue)).assertEqual('๑๒๓,๔๕๖.๗๘๙');
        })

        /**
         * @tc.number    SUB_ARK_ETS_INTL_NUMBERFORMAT_007
         * @tc.name      testIntlNumberFormat007
         * @tc.desc      The current function handles Intl NumberFormat
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 0
        */
        it('testIntlNumberFormat007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            let intlObj = new Intl.NumberFormat('en-GB');
            console.log("intlNumberFormatTest007::" + intlObj.format(numberValue));
            expect(intlObj.format(numberValue)).assertEqual('123,456.789');
        })

        /**
         * @tc.number    SUB_ARK_ETS_INTL_NUMBERFORMAT_008
         * @tc.name      testIntlNumberFormat008
         * @tc.desc      The current function handles Intl NumberFormat
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 0
        */
        it('testIntlNumberFormat008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            let intlObj = new Intl.NumberFormat('en-US');
            console.log("intlNumberFormatTest008::" + intlObj.format(numberValue));
            expect(intlObj.format(numberValue)).assertEqual('123,456.789');
        })

        /**
         * @tc.number    SUB_ARK_ETS_INTL_NUMBERFORMAT_009
         * @tc.name      testIntlNumberFormat009
         * @tc.desc      The current function handles Intl NumberFormat
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 0
        */
        it('testIntlNumberFormat009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            let intlObj = new Intl.NumberFormat('aa');
            console.log("intlNumberFormatTest009::" + intlObj.format(numberValue));
            expect(intlObj.format(numberValue)).assertEqual('123,456.789');
        })

        /**
         * @tc.number    SUB_ARK_ETS_INTL_NUMBERFORMAT_010
         * @tc.name      testIntlNumberFormat010
         * @tc.desc      The current function handles Intl NumberFormat
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 0
        */
        it('testIntlNumberFormat010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            let intlObj = new Intl.NumberFormat(['zh', 'en']);
            console.log("intlNumberFormatTest010::" + intlObj.format(numberValue));
            expect(intlObj.format(numberValue)).assertEqual('123,456.789');
        })

        /**
         * @tc.number    SUB_ARK_ETS_INTL_NUMBERFORMAT_011
         * @tc.name      testIntlNumberFormat011
         * @tc.desc      The current function handles Intl NumberFormat
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 0
        */
        it('testIntlNumberFormat011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            let intlObj = new Intl.NumberFormat(['en', 'aa']);
            console.log("intlNumberFormatTest011::" + intlObj.format(numberValue));
            expect(intlObj.format(numberValue)).assertEqual('123,456.789');
        })

        /**
         * @tc.number    SUB_ARK_ETS_INTL_NUMBERFORMAT_012
         * @tc.name      testIntlNumberFormat012
         * @tc.desc      The current function handles Intl NumberFormat
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 0
        */
        it('testIntlNumberFormat012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            let intlObj = new Intl.NumberFormat(['aa', 'bb']);
            console.log("intlNumberFormatTest012::" + intlObj.format(numberValue));
            expect(intlObj.format(numberValue)).assertEqual('123,456.789');
        })

        /**
         * @tc.number    SUB_ARK_ETS_INTL_NUMBERFORMAT_013
         * @tc.name      testIntlNumberFormat013
         * @tc.desc      The current function handles Intl NumberFormat
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 0
        */
        it('testIntlNumberFormat013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            let intlObj = new Intl.NumberFormat(['aa', 'bb', 'es']);
            console.log("intlNumberFormatTest013::" + intlObj.format(numberValue));
            expect(intlObj.format(numberValue)).assertEqual('123.456,789');
        })

        /**
         * @tc.number    SUB_ARK_ETS_INTL_NUMBERFORMAT_014
         * @tc.name      testIntlNumberFormat014
         * @tc.desc      The current function handles Intl NumberFormat
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 0
        */
        it('testIntlNumberFormat014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            let intlObj = new Intl.NumberFormat(['aa', 'it', 'bb']);
            console.log("intlNumberFormatTest014::" + intlObj.format(numberValue));
            expect(intlObj.format(numberValue)).assertEqual('123.456,789');
        })

        /**
         * @tc.number    SUB_ARK_ETS_INTL_NUMBERFORMAT_015
         * @tc.name      testIntlNumberFormat015
         * @tc.desc      The current function handles Intl NumberFormat
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 0
        */
        it('testIntlNumberFormat015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            let option: Intl.NumberFormatOptions = { style: 'decimal', notation: 'scientific' };
            let intlObj = new Intl.NumberFormat('en-GB', option);
            console.log("intlNumberFormatTest015::" + intlObj.format(numberValue));
            expect(intlObj.format(numberValue)).assertEqual('1.235E5');
            expect(intlObj.resolvedOptions().style).assertEqual('decimal');
            expect(intlObj.resolvedOptions().notation).assertEqual('scientific');
        })

        /**
         * @tc.number    SUB_ARK_ETS_INTL_NUMBERFORMAT_016
         * @tc.name      testIntlNumberFormat016
         * @tc.desc      The current function handles Intl NumberFormat
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 0
        */
        it('testIntlNumberFormat016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            let option: Intl.NumberFormatOptions = {
                style: 'currency', currency: 'EUR',
                currencyDisplay: 'name', currencySign: 'accounting', signDisplay: 'always'
            };
            let intlObj = new Intl.NumberFormat("en-GB", option);
            console.log("intlNumberFormatTest016::" + intlObj.format(numberValue));
            expect(intlObj.format(numberValue)).assertEqual('+123,456.79 euros');
            expect(intlObj.resolvedOptions().locale).assertEqual('en-GB');
            expect(intlObj.resolvedOptions().style).assertEqual('currency');
            expect(intlObj.resolvedOptions().currency).assertEqual('EUR');
            expect(intlObj.resolvedOptions().currencyDisplay).assertEqual('name');
            expect(intlObj.resolvedOptions().currencySign).assertEqual('accounting');
            expect(intlObj.resolvedOptions().signDisplay).assertEqual('always');
        })

        /**
         * @tc.number    SUB_ARK_ETS_INTL_NUMBERFORMAT_017
         * @tc.name      testIntlNumberFormat017
         * @tc.desc      The current function handles Intl NumberFormat
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 0
        */
        it('testIntlNumberFormat017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            let option: Intl.NumberFormatOptions = {
                style: 'currency', currency: 'USD',
                currencyDisplay: 'code', currencySign: 'accounting', signDisplay: 'always'
            };
            let intlObj = new Intl.NumberFormat("en-US", option);
            console.log("intlNumberFormatTest017::" + intlObj.format(numberValue));
            expect(intlObj.format(numberValue).replace(String.fromCharCode(160), ' ')).assertEqual('+USD 123,456.79');
            expect(intlObj.resolvedOptions().currency).assertEqual('USD');
            expect(intlObj.format(numberValue)).assertContain('123,456.79');
        })

        /**
         * @tc.number    SUB_ARK_ETS_INTL_NUMBERFORMAT_018
         * @tc.name      testIntlNumberFormat018
         * @tc.desc      The current function handles Intl NumberFormat
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 0
        */
        it('testIntlNumberFormat018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            let option: Intl.NumberFormatOptions = {
                style: 'currency', currency: 'CNY',
                currencyDisplay: 'symbol', currencySign: 'accounting', signDisplay: 'always'
            };
            let intlObj = new Intl.NumberFormat("zh-CN", option);
            console.log("intlNumberFormatTest018::" + intlObj.format(numberValue));
            expect(intlObj.format(numberValue)).assertEqual('+¥123,456.79');
        })

        /**
         * @tc.number    SUB_ARK_ETS_INTL_NUMBERFORMAT_019
         * @tc.name      testIntlNumberFormat019
         * @tc.desc      The current function handles Intl NumberFormat
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 0
        */
        it('testIntlNumberFormat019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            let option: Intl.NumberFormatOptions = {
                style: 'currency', currency: 'JPY',
                currencyDisplay: 'narrowSymbol', currencySign: 'accounting', signDisplay: 'always'
            };
            let intlObj = new Intl.NumberFormat("ja-JP", option);
            console.log("intlNumberFormatTest019::" + intlObj.format(numberValue));
            expect(intlObj.format(numberValue)).assertEqual('+￥123,457');
        })

        /**
         * @tc.number    SUB_ARK_ETS_INTL_NUMBERFORMAT_020
         * @tc.name      testIntlNumberFormat020
         * @tc.desc      The current function handles Intl NumberFormat
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 0
        */
        it('testIntlNumberFormat020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            let option: Intl.NumberFormatOptions = {
                style: 'unit', unit: 'meter',
                unitDisplay: 'long', maximumFractionDigits: 2, minimumIntegerDigits: 7
            };
            let intlObj = new Intl.NumberFormat("zh-CN", option);
            console.log("intlNumberFormatTest020::" + intlObj.format(numberValue));
            expect(intlObj.format(numberValue)).assertEqual('0,123,456.79米');
            expect(intlObj.resolvedOptions().style).assertEqual('unit');
            expect(intlObj.resolvedOptions().unit).assertEqual('meter');
            expect(intlObj.resolvedOptions().unitDisplay).assertEqual('long');
        })

        console.log('*************Collator*************');
        /**
         * @tc.number    SUB_ARK_ETS_INTL_COLLATOR_001
         * @tc.name      testIntlCollator001
         * @tc.desc      The current function handles Intl Collator
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 0
        */
        it('testIntlCollator001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            let coll = new Intl.Collator();
            let value = coll.compare('a', 'b');
            console.log('collatorTest001 ' + value);
            expect(value).assertEqual(-1);
        })

        /**
         * @tc.number    SUB_ARK_ETS_INTL_COLLATOR_002
         * @tc.name      testIntlCollator002
         * @tc.desc      The current function handles Intl Collator
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 0
        */
        it('testIntlCollator002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            let coll = new Intl.Collator();
            let value = coll.compare('a', 'a');
            console.log('collatorTest002 ' + value);
            expect(value).assertEqual(0);
        })

        /**
         * @tc.number    SUB_ARK_ETS_INTL_COLLATOR_003
         * @tc.name      testIntlCollator003
         * @tc.desc      The current function handles Intl Collator
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 0
        */
        it('testIntlCollator003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            let coll = new Intl.Collator();
            let value = coll.compare('b', 'a');
            console.log('collatorTest003 ' + value);
            expect(value).assertEqual(1);
        })

        /**
         * @tc.number    SUB_ARK_ETS_INTL_COLLATOR_004
         * @tc.name      testIntlCollator004
         * @tc.desc      The current function handles Intl Collator
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 0
        */
        it('testIntlCollator004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            let coll = new Intl.Collator('zh');
            let value = coll.compare('a', 'b');
            console.log('collatorTest004 ' + value);
            expect(value).assertEqual(-1);
        })

        /**
         * @tc.number    SUB_ARK_ETS_INTL_COLLATOR_005
         * @tc.name      testIntlCollator005
         * @tc.desc      The current function handles Intl Collator
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 0
        */
        it('testIntlCollator005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            let coll = new Intl.Collator('zh', { 'collation': 'eor' });
            let value = coll.compare('a', 'b');
            console.log('collatorTest005 ' + value);
            expect(value).assertEqual(-1);
            expect(coll.resolvedOptions().collation).assertEqual('eor');
        })

        /**
         * @tc.number    SUB_ARK_ETS_INTL_COLLATOR_006
         * @tc.name      testIntlCollator006
         * @tc.desc      The current function handles Intl Collator
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 0
        */
        it('testIntlCollator006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            let coll = new Intl.Collator('zh', { 'sensitivity': 'base' });
            let value = coll.compare('a', 'b');
            console.log('collatorTest006 ' + value);
            expect(value).assertEqual(-1);
            expect(coll.resolvedOptions().sensitivity).assertEqual('base');
        })

        /**
         * @tc.number    SUB_ARK_ETS_INTL_COLLATOR_007
         * @tc.name      testIntlCollator007
         * @tc.desc      The current function handles Intl Collator
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 0
        */
        it('testIntlCollator007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            let coll = new Intl.Collator('zh', { 'caseFirst': 'upper' });
            let value = coll.compare('a', 'b');
            console.log('collatorTest007 ' + value);
            expect(value).assertEqual(-1);
            expect(coll.resolvedOptions().caseFirst).assertEqual('upper');
        })

        /**
         * @tc.number    SUB_ARK_ETS_INTL_COLLATOR_008
         * @tc.name      testIntlCollator008
         * @tc.desc      The current function handles Intl Collator
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 0
        */
        it('testIntlCollator008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            let coll = new Intl.Collator('zh', { 'numeric': true });
            let value = coll.compare('a', 'b');
            console.log('collatorTest008 ' + value);
            expect(value).assertEqual(-1);
            expect(coll.resolvedOptions().numeric).assertTrue();
        })

        /**
         * @tc.number    SUB_ARK_ETS_INTL_COLLATOR_009
         * @tc.name      testIntlCollator009
         * @tc.desc      The current function handles Intl Collator
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 0
        */
        it('testIntlCollator009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            let coll = new Intl.Collator('zh', { 'ignorePunctuation': true });
            let value = coll.compare('a', 'b');
            console.log('collatorTest009 ' + value);
            expect(value).assertEqual(-1);
            expect(coll.resolvedOptions().ignorePunctuation).assertTrue();
        })

        /**
         * @tc.number    SUB_ARK_ETS_INTL_COLLATOR_010
         * @tc.name      testIntlCollator010
         * @tc.desc      The current function handles Intl Collator
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 0
        */
        it('testIntlCollator010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            let coll = new Intl.Collator('zh', { 'usage': 'sort' });
            let value = coll.compare('a', 'b');
            console.log('collatorTest010 ' + value);
            expect(value).assertEqual(-1);
            expect(coll.resolvedOptions().usage).assertEqual('sort');
        })

        /**
         * @tc.number    SUB_ARK_ETS_INTL_COLLATOR_011
         * @tc.name      testIntlCollator011
         * @tc.desc      The current function handles Intl Collator
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 0
        */
        it('testIntlCollator011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            let coll = new Intl.Collator('zh', { 'collation': 'eor', 'usage': 'sort' });
            let value = coll.compare('a', 'b');
            console.log('collatorTest012 ' + value);
            expect(value).assertEqual(-1);
            expect(coll.resolvedOptions().collation).assertEqual('eor');
            expect(coll.resolvedOptions().usage).assertEqual('sort');
        })

        /**
         * @tc.number    SUB_ARK_ETS_INTL_COLLATOR_012
         * @tc.name      testIntlCollator012
         * @tc.desc      The current function handles Intl Collator
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 0
        */
        it('testIntlCollator012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            let coll = new Intl.Collator('zh', { 'collation': 'eor', 'usage': 'sort' });
            let value = coll.compare('a', 'a');
            console.log('collatorTest013 ' + value);
            expect(value).assertEqual(0);
            expect(coll.resolvedOptions().collation).assertEqual('eor');
            expect(coll.resolvedOptions().usage).assertEqual('sort');
        })

        /**
         * @tc.number    SUB_ARK_ETS_INTL_COLLATOR_013
         * @tc.name      testIntlCollator013
         * @tc.desc      The current function handles Intl Collator
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 0
        */
        it('testIntlCollator013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            let coll = new Intl.Collator('zh', {
                'collation': 'eor', 'usage': 'sort',
                'ignorePunctuation': true
            });
            let value = coll.compare('a', 'a');
            console.log('collatorTest014 ' + value);
            expect(value).assertEqual(0);
            expect(coll.resolvedOptions().collation).assertEqual('eor');
            expect(coll.resolvedOptions().usage).assertEqual('sort');
            expect(coll.resolvedOptions().ignorePunctuation).assertTrue();
        })

        /**
         * @tc.number    SUB_ARK_ETS_INTL_COLLATOR_014
         * @tc.name      testIntlCollator014
         * @tc.desc      The current function handles Intl Collator
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 0
        */
        it('testIntlCollator014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            let coll = new Intl.Collator('zh', {
                'collation': 'eor', 'usage': 'sort',
                'ignorePunctuation': true, 'numeric': true
            });
            let value = coll.compare('b', 'a');
            console.log('collatorTest015 ' + value);
            expect(value).assertEqual(1);
            expect(coll.resolvedOptions().collation).assertEqual('eor');
            expect(coll.resolvedOptions().usage).assertEqual('sort');
            expect(coll.resolvedOptions().ignorePunctuation).assertTrue();
            expect(coll.resolvedOptions().numeric).assertTrue();
        })

        console.log('*************PluralRules*************');
        /**
         * @tc.number    SUB_ARK_ETS_INTL_PLURALRULES_001
         * @tc.name      testIntlPluralRules001
         * @tc.desc      The current function handles Intl PluralRules
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 0
        */
        it('testIntlPluralRules001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            let plur = new Intl.PluralRules();
            let value = plur.select(0);
            console.log('PluralRulesTest001 :' + value);
            expect(value).assertEqual('other');
        })

        /**
         * @tc.number    SUB_ARK_ETS_INTL_PLURALRULES_002
         * @tc.name      testIntlPluralRules002
         * @tc.desc      The current function handles Intl PluralRules
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 0
        */
        it('testIntlPluralRules002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            let plur = new Intl.PluralRules('zh');
            let value = plur.select(0);
            console.log('PluralRulesTest002 :' + value);
            expect(value).assertEqual('other');
        })

        /**
         * @tc.number    SUB_ARK_ETS_INTL_PLURALRULES_003
         * @tc.name      testIntlPluralRules003
         * @tc.desc      The current function handles Intl PluralRules
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 0
        */
        it('testIntlPluralRules003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            let plur = new Intl.PluralRules('zh', { 'type': 'ordinal' });
            let value = plur.select(0);
            console.log('PluralRulesTest003 :' + value);
            expect(value).assertEqual('other');
        })

        /**
         * @tc.number    SUB_ARK_ETS_INTL_PLURALRULES_004
         * @tc.name      testIntlPluralRules004
         * @tc.desc      The current function handles Intl PluralRules
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 0
        */
        it('testIntlPluralRules004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            let plur = new Intl.PluralRules('zh', { 'localeMatcher': 'lookup' });
            let value = plur.select(0);
            console.log('PluralRulesTest004 :' + value);
            expect(value).assertEqual('other');
        })

        /**
         * @tc.number    SUB_ARK_ETS_INTL_PLURALRULES_005
         * @tc.name      testIntlPluralRules005
         * @tc.desc      The current function handles Intl PluralRules
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 0
        */
        it('testIntlPluralRules005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            let plur = new Intl.PluralRules('zh', { 'minimumIntegerDigits': 10 });
            let value = plur.select(0);
            console.log('PluralRulesTest005 :' + value);
            expect(value).assertEqual('other');
        })

        /**
         * @tc.number    SUB_ARK_ETS_INTL_PLURALRULES_006
         * @tc.name      testIntlPluralRules006
         * @tc.desc      The current function handles Intl PluralRules
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 0
        */
        it('testIntlPluralRules006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            let plur = new Intl.PluralRules('zh', { 'minimumFractionDigits': 11 });
            let value = plur.select(0);
            console.log('PluralRulesTest006 :' + value);
            expect(value).assertEqual('other');
        })

        /**
         * @tc.number    SUB_ARK_ETS_INTL_PLURALRULES_007
         * @tc.name      testIntlPluralRules007
         * @tc.desc      The current function handles Intl PluralRules
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 0
        */
        it('testIntlPluralRules007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            let plur = new Intl.PluralRules('en-GB');
            let value = plur.select(0);
            console.log('PluralRulesTest007 :' + value);
            expect(value).assertEqual('other');
        })

        /**
         * @tc.number    SUB_ARK_ETS_INTL_PLURALRULES_008
         * @tc.name      testIntlPluralRules008
         * @tc.desc      The current function handles Intl PluralRules
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 0
        */
        it('testIntlPluralRules008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            let plur = new Intl.PluralRules('en-GB', { 'minimumFractionDigits': 11 });
            let value = plur.select(0);
            console.log('PluralRulesTest008 :' + value);
            expect(value).assertEqual('other');
            expect(plur.resolvedOptions().minimumFractionDigits).assertEqual(11);
        })

        console.log('*************RelativeTimeFormat*************');
        /**
         * @tc.number    SUB_ARK_ETS_INTL_RELATIVETIMEFORMAT_001
         * @tc.name      testIntlRelativeTimeFormat001
         * @tc.desc      The current function handles Intl RelativeTimeFormat
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 0
        */
        it('testIntlRelativeTimeFormat001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            let relativetimefmt = new Intl.RelativeTimeFormat();
            let value = relativetimefmt.format(100, 'second');
            console.log('RelativeTimeFormatTest001 :' + value);
            expect(value).assertEqual('in 100 seconds');
        })

        /**
         * @tc.number    SUB_ARK_ETS_INTL_RELATIVETIMEFORMAT_002
         * @tc.name      testIntlRelativeTimeFormat002
         * @tc.desc      The current function handles Intl RelativeTimeFormat
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 0
        */
        it('testIntlRelativeTimeFormat002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            let relativetimefmt = new Intl.RelativeTimeFormat("en");
            let value = relativetimefmt.format(100, 'second');
            console.log('RelativeTimeFormatTest002 :' + value);
            expect(value).assertEqual('in 100 seconds');
        })

        /**
         * @tc.number    SUB_ARK_ETS_INTL_RELATIVETIMEFORMAT_003
         * @tc.name      testIntlRelativeTimeFormat003
         * @tc.desc      The current function handles Intl RelativeTimeFormat
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 0
        */
        it('testIntlRelativeTimeFormat003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            let relativetimefmt = new Intl.RelativeTimeFormat("zh");
            let value = relativetimefmt.format(100, 'second');
            console.log('RelativeTimeFormatTest003 :' + value);
            expect(value).assertEqual('100秒钟后');
        })

        /**
         * @tc.number    SUB_ARK_ETS_INTL_RELATIVETIMEFORMAT_004
         * @tc.name      testIntlRelativeTimeFormat004
         * @tc.desc      The current function handles Intl RelativeTimeFormat
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 0
        */
        it('testIntlRelativeTimeFormat004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            let relativetimefmt = new Intl.RelativeTimeFormat("en");
            let value = relativetimefmt.format(100, 'quarter');
            console.log('RelativeTimeFormatTest004 :' + value);
            expect(value).assertEqual('in 100 quarters');
        })

        /**
         * @tc.number    SUB_ARK_ETS_INTL_RELATIVETIMEFORMAT_005
         * @tc.name      testIntlRelativeTimeFormat005
         * @tc.desc      The current function handles Intl RelativeTimeFormat
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 0
        */
        it('testIntlRelativeTimeFormat005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            let relativetimefmt = new Intl.RelativeTimeFormat("en");
            let value = relativetimefmt.format(6, 'quarter');
            console.log('RelativeTimeFormatTest005 :' + value);
            expect(value).assertEqual('in 6 quarters');
        })

        /**
         * @tc.number    SUB_ARK_ETS_INTL_RELATIVETIMEFORMAT_006
         * @tc.name      testIntlRelativeTimeFormat006
         * @tc.desc      The current function handles Intl RelativeTimeFormat
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 0
        */
        it('testIntlRelativeTimeFormat006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            let relativetimefmt = new Intl.RelativeTimeFormat("zh");
            let value = relativetimefmt.format(100, 'quarter');
            console.log('RelativeTimeFormatTest006 :' + value);
            expect(value).assertEqual('100个季度后');
        })

        /**
         * @tc.number    SUB_ARK_ETS_INTL_RELATIVETIMEFORMAT_007
         * @tc.name      testIntlRelativeTimeFormat007
         * @tc.desc      The current function handles Intl RelativeTimeFormat
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 0
        */
        it('testIntlRelativeTimeFormat007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            let relativetimefmt = new Intl.RelativeTimeFormat("en", { style: "narrow" });
            let value = relativetimefmt.format(100, 'second');
            console.log('RelativeTimeFormatTest007 :' + value);
            expect(value).assertEqual('in 100s');
        })

        /**
         * @tc.number    SUB_ARK_ETS_INTL_RELATIVETIMEFORMAT_008
         * @tc.name      testIntlRelativeTimeFormat008
         * @tc.desc      The current function handles Intl RelativeTimeFormat
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 0
        */
        it('testIntlRelativeTimeFormat008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            let relativetimefmt = new Intl.RelativeTimeFormat("en", { style: "narrow" });
            let value = relativetimefmt.format(-1, 'day');
            console.log('RelativeTimeFormatTest008 :' + value);
            expect(value).assertEqual('1d ago');
        })

        /**
         * @tc.number    SUB_ARK_ETS_INTL_RELATIVETIMEFORMAT_009
         * @tc.name      testIntlRelativeTimeFormat009
         * @tc.desc      The current function handles Intl RelativeTimeFormat
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 0
        */
        it('testIntlRelativeTimeFormat009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            let relativetimefmt = new Intl.RelativeTimeFormat("zh", { style: "narrow" });
            let value = relativetimefmt.format(-1, 'day');
            console.log('RelativeTimeFormatTest009 :' + value);
            expect(value).assertEqual('1天前');
        })

        /**
         * @tc.number    SUB_ARK_ETS_INTL_RELATIVETIMEFORMAT_010
         * @tc.name      testIntlRelativeTimeFormat010
         * @tc.desc      The current function handles Intl RelativeTimeFormat
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 0
        */
        it('testIntlRelativeTimeFormat010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            let relativetimefmt = new Intl.RelativeTimeFormat("en", { style: "narrow" });
            let value = relativetimefmt.format(2, 'day');
            console.log('RelativeTimeFormatTest010 :' + value);
            expect(value).assertEqual('in 2d');
        })

        /**
         * @tc.number    SUB_ARK_ETS_INTL_RELATIVETIMEFORMAT_011
         * @tc.name      testIntlRelativeTimeFormat011
         * @tc.desc      The current function handles Intl RelativeTimeFormat
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 0
        */
        it('testIntlRelativeTimeFormat011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            let relativetimefmt = new Intl.RelativeTimeFormat("zh", { style: "narrow" });
            let value = relativetimefmt.format(2, 'day');
            console.log('RelativeTimeFormatTest011 :' + value);
            expect(value).assertEqual('2天后');
        })

        /**
         * @tc.number    SUB_ARK_ETS_INTL_RELATIVETIMEFORMAT_012
         * @tc.name      testIntlRelativeTimeFormat012
         * @tc.desc      The current function handles Intl RelativeTimeFormat
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 0
        */
        it('testIntlRelativeTimeFormat012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            let relativetimefmt = new Intl.RelativeTimeFormat("en", { numeric: "auto" });
            let value = relativetimefmt.format(2, 'day');
            console.log('RelativeTimeFormatTest012 :' + value);
            expect(value).assertEqual('in 2 days');
        })

        /**
         * @tc.number    SUB_ARK_ETS_INTL_RELATIVETIMEFORMAT_013
         * @tc.name      testIntlRelativeTimeFormat013
         * @tc.desc      The current function handles Intl RelativeTimeFormat
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 0
        */
        it('testIntlRelativeTimeFormat013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            let relativetimefmt = new Intl.RelativeTimeFormat("zh", { numeric: "auto" });
            let value = relativetimefmt.format(2, 'day');
            console.log('RelativeTimeFormatTest012 :' + value);
            expect(value).assertEqual('后天');
        })

        /**
         * @tc.number    SUB_ARK_ETS_INTL_RELATIVETIMEFORMAT_014
         * @tc.name      testIntlRelativeTimeFormat014
         * @tc.desc      The current function handles Intl RelativeTimeFormat
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 0
        */
        it('testIntlRelativeTimeFormat014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            let relativetimefmt = new Intl.RelativeTimeFormat("en", { numeric: "auto" });
            let value = relativetimefmt.format(-1, 'year');
            console.log('RelativeTimeFormatTest014 :' + value);
            expect(value).assertEqual('last year');
        })

        /**
         * @tc.number    SUB_ARK_ETS_INTL_RELATIVETIMEFORMAT_015
         * @tc.name      testIntlRelativeTimeFormat015
         * @tc.desc      The current function handles Intl RelativeTimeFormat
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 0
        */
        it('testIntlRelativeTimeFormat015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            let relativetimefmt = new Intl.RelativeTimeFormat("zh", { numeric: "auto" });
            let value = relativetimefmt.format(-1, 'year');
            console.log('RelativeTimeFormatTest014 :' + value);
            expect(value).assertEqual('去年');
        })

        /**
         * @tc.number    SUB_ARK_ETS_INTL_RELATIVETIMEFORMAT_016
         * @tc.name      testIntlRelativeTimeFormat016
         * @tc.desc      The current function handles Intl RelativeTimeFormat
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 0
        */
        it('testIntlRelativeTimeFormat016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            try {
                let relativetimefmt = new Intl.RelativeTimeFormat("en", { numeric: "auto" });
                let value = relativetimefmt.format(-1, 'month');
                console.log('RelativeTimeFormatTest016 :' + value);
            } catch (e) {
                e = e as Error;
                console.log('RelativeTimeFormatTest016 Err:' + e);
                expect(e.name == "RangeError").assertTrue();
            }
        })

        /**
         * @tc.number    SUB_ARK_ETS_INTL_RELATIVETIMEFORMAT_017
         * @tc.name      testIntlRelativeTimeFormat017
         * @tc.desc      The current function handles Intl RelativeTimeFormat
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 0
        */
        it('testIntlRelativeTimeFormat017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            let relativetimefmt = new Intl.RelativeTimeFormat("zh", { numeric: "auto" });
            let value = relativetimefmt.format(-1, 'quarter');
            console.log('RelativeTimeFormatTest017 :' + value);
            expect(value).assertEqual('上季度');
        })

        /**
         * @tc.number    SUB_ARK_ETS_INTL_RELATIVETIMEFORMAT_018
         * @tc.name      testIntlRelativeTimeFormat018
         * @tc.desc      The current function handles Intl RelativeTimeFormat
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 0
        */
        it('testIntlRelativeTimeFormat018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            let relativetimefmt = new Intl.RelativeTimeFormat("en", { numeric: "auto", style: 'short' });
            let value = relativetimefmt.format(-1, 'quarter');
            console.log('RelativeTimeFormatTest018 :' + value);
            expect(value).assertEqual('last qtr.');
            expect(relativetimefmt.resolvedOptions().numeric).assertEqual('auto');
            expect(relativetimefmt.resolvedOptions().style).assertEqual('short');
        })

        /**
         * @tc.number    SUB_ARK_ETS_INTL_RELATIVETIMEFORMAT_019
         * @tc.name      testIntlRelativeTimeFormat019
         * @tc.desc      The current function handles Intl RelativeTimeFormat
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 0
        */
        it('testIntlRelativeTimeFormat019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            let relativetimefmt = new Intl.RelativeTimeFormat("en", { numeric: "auto", style: 'short' });
            let value = relativetimefmt.format(1, 'quarter');
            console.log('RelativeTimeFormatTest019 :' + value);
            expect(value).assertEqual('next qtr.');
            expect(relativetimefmt.resolvedOptions().numeric).assertEqual('auto');
            expect(relativetimefmt.resolvedOptions().style).assertEqual('short');
        })

        /**
         * @tc.number    SUB_ARK_ETS_INTL_RELATIVETIMEFORMAT_020
         * @tc.name      testIntlRelativeTimeFormat020
         * @tc.desc      The current function handles Intl RelativeTimeFormat
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 0
        */
        it('testIntlRelativeTimeFormat020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            let relativetimefmt = new Intl.RelativeTimeFormat("en", { numeric: "auto", style: 'narrow' });
            let value = relativetimefmt.format(1, 'quarter');
            console.log('RelativeTimeFormatTest020 :' + value);
            expect(value).assertEqual('next qtr.');
            expect(relativetimefmt.resolvedOptions().numeric).assertEqual('auto');
            expect(relativetimefmt.resolvedOptions().style).assertEqual('narrow');
        })

        /**
         * @tc.number    SUB_ARK_ETS_INTL_RELATIVETIMEFORMAT_021
         * @tc.name      testIntlRelativeTimeFormat021
         * @tc.desc      The current function handles Intl RelativeTimeFormat
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 0
        */
        it('testIntlRelativeTimeFormat021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            let relativetimefmt = new Intl.RelativeTimeFormat("en", { numeric: "always", style: 'narrow' });
            let value = relativetimefmt.format(1, 'quarter');
            console.log('RelativeTimeFormatTest021 :' + value);
            expect(value).assertEqual('in 1q');
            expect(relativetimefmt.resolvedOptions().numeric).assertEqual('always');
            expect(relativetimefmt.resolvedOptions().style).assertEqual('narrow');
        })

        /**
         * @tc.number    SUB_ARK_ETS_INTL_RELATIVETIMEFORMAT_022
         * @tc.name      testIntlRelativeTimeFormat022
         * @tc.desc      The current function handles Intl RelativeTimeFormat
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 0
        */
        it('testIntlRelativeTimeFormat022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            let relativetimefmt = new Intl.RelativeTimeFormat("zh", { numeric: "always", style: 'narrow' });
            let value = relativetimefmt.format(1, 'quarter');
            console.log('RelativeTimeFormatTest022 :' + value);
            expect(value).assertEqual('1个季度后');
            expect(relativetimefmt.resolvedOptions().numeric).assertEqual('always');
            expect(relativetimefmt.resolvedOptions().style).assertEqual('narrow');
        })

        /**
         * @tc.number    SUB_ARK_ETS_INTL_RELATIVETIMEFORMAT_023
         * @tc.name      testIntlRelativeTimeFormat023
         * @tc.desc      The current function handles Intl RelativeTimeFormat
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 0
        */
        it('testIntlRelativeTimeFormat023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            let relativetimefmt = new Intl.RelativeTimeFormat("en", { numeric: "always", style: 'long' });
            let value = relativetimefmt.format(1, 'quarter');
            console.log('RelativeTimeFormatTest023 :' + value);
            expect(value).assertEqual('in 1 quarter');
            expect(relativetimefmt.resolvedOptions().numeric).assertEqual('always');
            expect(relativetimefmt.resolvedOptions().style).assertEqual('long');
        })

        /**
         * @tc.number    SUB_ARK_ETS_INTL_RELATIVETIMEFORMAT_024
         * @tc.name      testIntlRelativeTimeFormat024
         * @tc.desc      The current function handles Intl RelativeTimeFormat
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 0
        */
        it('testIntlRelativeTimeFormat024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            let relativetimefmt = new Intl.RelativeTimeFormat("zh", { numeric: "always", style: 'long' });
            let value = relativetimefmt.format(1, 'quarter');
            console.log('RelativeTimeFormatTest024 :' + value);
            expect(value).assertEqual('1个季度后');
            expect(relativetimefmt.resolvedOptions().numeric).assertEqual('always');
            expect(relativetimefmt.resolvedOptions().style).assertEqual('long');
        })

        console.log('*************ListFormat*************');
        /**
         * @tc.number    SUB_ARK_ETS_INTL_LISTFORMAT_001
         * @tc.name      testIntlListFormat001
         * @tc.desc      The current function handles Intl ListFormat
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 0
        */
        it('testIntlListFormat001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            let listform = new Intl.ListFormat();
            let value = listform.format(vehicles);
            console.log('ListFormatTest001 :' + value);
            expect(value).assertEqual('Motorcycle, Bus, and Car');
        })

        /**
         * @tc.number    SUB_ARK_ETS_INTL_LISTFORMAT_002
         * @tc.name      testIntlListFormat002
         * @tc.desc      The current function handles Intl ListFormat
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 0
        */
        it('testIntlListFormat002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            let listform = new Intl.ListFormat("zh");
            let value = listform.format(vehicles);
            console.log('ListFormatTest002 :' + value);
            expect(value).assertEqual('Motorcycle、Bus和Car');
        })

        /**
         * @tc.number    SUB_ARK_ETS_INTL_LISTFORMAT_003
         * @tc.name      testIntlListFormat003
         * @tc.desc      The current function handles Intl ListFormat
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 0
        */
        it('testIntlListFormat003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            let listform = new Intl.ListFormat("en");
            let value = listform.format(vehicles);
            console.log('ListFormatTest003 :' + value);
            expect(value).assertEqual('Motorcycle, Bus, and Car');
        })

        /**
         * @tc.number    SUB_ARK_ETS_INTL_LISTFORMAT_004
         * @tc.name      testIntlListFormat004
         * @tc.desc      The current function handles Intl ListFormat
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 0
        */
        it('testIntlListFormat004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            let listform = new Intl.ListFormat("zh", { style: 'long' });
            let value = listform.format(vehicles);
            console.log('ListFormatTest004 :' + value);
            expect(value).assertEqual('Motorcycle、Bus和Car');
        })

        /**
         * @tc.number    SUB_ARK_ETS_INTL_LISTFORMAT_005
         * @tc.name      testIntlListFormat005
         * @tc.desc      The current function handles Intl ListFormat
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 0
        */
        it('testIntlListFormat005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            let listform = new Intl.ListFormat("zh", { style: 'short' });
            let value = listform.format(vehicles);
            console.log('ListFormatTest005 :' + value);
            expect(value).assertEqual('Motorcycle、Bus和Car');
        })

        /**
         * @tc.number    SUB_ARK_ETS_INTL_LISTFORMAT_006
         * @tc.name      testIntlListFormat006
         * @tc.desc      The current function handles Intl ListFormat
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 0
        */
        it('testIntlListFormat006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            let listform = new Intl.ListFormat("zh", { style: 'narrow' });
            let value = listform.format(vehicles);
            console.log('ListFormatTest006 :' + value);
            expect(value).assertEqual('Motorcycle、Bus、Car');
        })

        /**
         * @tc.number    SUB_ARK_ETS_INTL_LISTFORMAT_007
         * @tc.name      testIntlListFormat007
         * @tc.desc      The current function handles Intl ListFormat
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 0
        */
        it('testIntlListFormat007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            let listform = new Intl.ListFormat("en", { style: 'long' });
            let value = listform.format(vehicles);
            console.log('ListFormatTest007 :' + value);
            expect(value).assertEqual('Motorcycle, Bus, and Car');
        })

        /**
         * @tc.number    SUB_ARK_ETS_INTL_LISTFORMAT_008
         * @tc.name      testIntlListFormat008
         * @tc.desc      The current function handles Intl ListFormat
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 0
        */
        it('testIntlListFormat008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            let listform = new Intl.ListFormat("en", { style: 'short' });
            let value = listform.format(vehicles);
            console.log('ListFormatTest008 :' + value);
            expect(value).assertEqual('Motorcycle, Bus, & Car');
        })

        /**
         * @tc.number    SUB_ARK_ETS_INTL_LISTFORMAT_009
         * @tc.name      testIntlListFormat009
         * @tc.desc      The current function handles Intl ListFormat
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 0
        */
        it('testIntlListFormat009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            let listform = new Intl.ListFormat("en", { style: 'narrow' });
            let value = listform.format(vehicles);
            console.log('ListFormatTest009 :' + value);
            expect(value).assertEqual('Motorcycle, Bus, Car');
        })

        /**
         * @tc.number    SUB_ARK_ETS_INTL_LISTFORMAT_010
         * @tc.name      testIntlListFormat010
         * @tc.desc      The current function handles Intl ListFormat
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 0
        */
        it('testIntlListFormat010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            let listform = new Intl.ListFormat("zh", { style: 'long', type: 'conjunction' });
            let value = listform.format(vehicles);
            console.log('ListFormatTest010 :' + value);
            expect(value).assertEqual('Motorcycle、Bus和Car');
        })

        /**
         * @tc.number    SUB_ARK_ETS_INTL_LISTFORMAT_011
         * @tc.name      testIntlListFormat011
         * @tc.desc      The current function handles Intl ListFormat
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 0
        */
        it('testIntlListFormat011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            let listform = new Intl.ListFormat("zh", { style: 'long', type: 'disjunction' });
            let value = listform.format(vehicles);
            console.log('ListFormatTest011 :' + value);
            expect(value).assertEqual('Motorcycle、Bus或Car');
        })

        /**
         * @tc.number    SUB_ARK_ETS_INTL_LISTFORMAT_012
         * @tc.name      testIntlListFormat012
         * @tc.desc      The current function handles Intl ListFormat
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 0
        */
        it('testIntlListFormat012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            let listform = new Intl.ListFormat("zh", { style: 'long', type: 'unit' });
            let value = listform.format(vehicles);
            console.log('ListFormatTest012 :' + value);
            expect(value).assertEqual('MotorcycleBusCar');
        })

        /**
         * @tc.number    SUB_ARK_ETS_INTL_LISTFORMAT_013
         * @tc.name      testIntlListFormat013
         * @tc.desc      The current function handles Intl ListFormat
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 0
        */
        it('testIntlListFormat013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            let listform = new Intl.ListFormat("en", { style: 'short', type: 'conjunction' });
            let value = listform.format(vehicles);
            console.log('ListFormatTest013 :' + value);
            expect(value).assertEqual('Motorcycle, Bus, & Car');
        })

        /**
         * @tc.number    SUB_ARK_ETS_INTL_LISTFORMAT_014
         * @tc.name      testIntlListFormat014
         * @tc.desc      The current function handles Intl ListFormat
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 0
        */
        it('testIntlListFormat014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            let listform = new Intl.ListFormat("en", { style: 'short', type: 'disjunction' });
            let value = listform.format(vehicles);
            console.log('ListFormatTest014 :' + value);
            expect(value).assertEqual('Motorcycle, Bus, or Car');
        })

        /**
         * @tc.number    SUB_ARK_ETS_INTL_LISTFORMAT_015
         * @tc.name      testIntlListFormat015
         * @tc.desc      The current function handles Intl ListFormat
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 0
        */
        it('testIntlListFormat015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            let listform = new Intl.ListFormat("en", { style: 'short', type: 'unit' });
            let value = listform.format(vehicles);
            console.log('ListFormatTest015 :' + value);
            expect(value).assertEqual('Motorcycle, Bus, Car');
        })

        /**
         * @tc.number    SUB_ARK_ETS_INTL_LISTFORMAT_016
         * @tc.name      testIntlListFormat016
         * @tc.desc      The current function handles Intl ListFormat
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 0
        */
        // it('testIntlListFormat016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void =>  {
        //     let listform = new Intl.ListFormat("en", {style: 'narrow', type: 'conjunction' });
        //     let value = listform.format(vehicles);
        //     console.log('ListFormatTest016 :' + value);
        //     expect(value).assertEqual('Motorcycle, Bus, Car');
        //     expect(listform.resolvedOptions().style).assertEqual('narrow');
        //     expect(listform.resolvedOptions().type).assertEqual('conjunction');
        // })

        /**
         * @tc.number    SUB_ARK_ETS_INTL_LISTFORMAT_017
         * @tc.name      testIntlListFormat017
         * @tc.desc      The current function handles Intl ListFormat
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 0
        */
        // it('testIntlListFormat017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void =>  {
        //     let listform = new Intl.ListFormat("en", {style: 'narrow', type: 'disjunction' });
        //     let value = listform.format(vehicles);
        //     console.log('ListFormatTest017 :' + value);
        //     expect(value).assertEqual('Motorcycle, Bus, or Car');
        //     expect(listform.resolvedOptions().style).assertEqual('narrow');
        //     expect(listform.resolvedOptions().type).assertEqual('disjunction');
        // })

        /**
         * @tc.number    SUB_ARK_ETS_INTL_LISTFORMAT_018
         * @tc.name      testIntlListFormat018
         * @tc.desc      The current function handles Intl ListFormat
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 0
        */
        // it('testIntlListFormat018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void =>  {
        //     let listform = new Intl.ListFormat("en", {style: 'narrow', type: 'unit' });
        //     let value = listform.format(vehicles);
        //     console.log('ListFormatTest018 :' + value);
        //     expect(value).assertEqual('Motorcycle Bus Car');
        //     expect(listform.resolvedOptions().style).assertEqual('narrow');
        //     expect(listform.resolvedOptions().type).assertEqual('unit');
        // })
        console.log('*************end IntlTest*************');
    })
}