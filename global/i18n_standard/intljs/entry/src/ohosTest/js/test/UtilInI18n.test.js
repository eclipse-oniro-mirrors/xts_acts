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
import I18n from '@ohos.i18n'
import deviceInfo from '@ohos.deviceInfo'
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level} from '@ohos/hypium'

export default function UtilInI18nTest() {
describe('UtilInI18nTest', function () {
    console.log('*************start UtilInI18nTest*************');

    let hour = I18n.System.is24HourClock();
    console.log('init 24 hour clock value ' + hour);

    /* *
    * execute this step before all testcases
    */
    beforeAll(function(){
        console.log('step before all cases in I18n.'
        + ' 24hour: ' + I18n.System.is24HourClock()
        + ' prelang: ' + I18n.System.getPreferredLanguageList()
        + ' syslocale: ' + I18n.System.getSystemLocale());
    })

    /* *
    * execute this step before every testcase
    */
    beforeEach(function(){
        console.log('step before every case in I18n.');
    })

    /* *
    * execute this step after every testcase
    */
    afterEach(function(){
        console.log('step after every case in I18n.');
    })

    /* *
    * execute this step after all testcases
    */
    afterAll(function(){
        console.log('step after all cases in I18n.'
        + ' 24hour: ' + I18n.System.is24HourClock()
        + ' prelang: ' + I18n.System.getPreferredLanguageList()
        + ' syslocale: ' + I18n.System.getSystemLocale());
    })

    /**
     * @tc.number  SUB_GLOBAL_I18N_UTIL_JS_0100
     * @tc.name    test unitConvert interface from cup to liter unit with long style
     * @tc.desc    get the unitConvert value
     */
     it('i18n_util_test_0100', Level.LEVEL0, function () {
        console.log('i18n_util_test_0100 ' + 'start');
        let util = new I18n.Util();
        let value = util.unitConvert({unit: 'cup', measureSystem: 'US'},
                                {unit: 'liter', measureSystem: 'SI'},
                                1000,
                                'en-US',
                                'long');
        console.log('i18n_util_test_0100 ' + value);
        expect(value).assertEqual('236.588 liters');
    })

    /**
     * @tc.number  SUB_GLOBAL_I18N_UTIL_JS_0200
     * @tc.name    test unitConvert interface from cup to liter unit with undefined style
     * @tc.desc    get the unitConvert value
     */
    it('i18n_util_test_0200', Level.LEVEL2, function () {
        console.log('i18n_util_test_0200 ' + 'start');
        let util = new I18n.Util();
        let value = util.unitConvert({unit: 'cup', measureSystem: 'US'},
                                {unit: 'liter', measureSystem: 'SI'},
                                1000,
                                'en-US',
                                undefined);
        console.log('i18n_util_test_0200 ' + value);
        let devType = deviceInfo.devicType;
        if (devType == '2in1'){
            expect(value).assertEqual('236.588 liters');
        }else if (devType == 'phone'){
            expect(value).assertEqual('236.588 L');
        }
    })

    /**
     * @tc.number  SUB_GLOBAL_I18N_UTIL_JS_0300
     * @tc.name    test unitConvert interface from cup to liter unit with null style
     * @tc.desc    get the unitConvert value
     */
     it('i18n_util_test_0300', Level.LEVEL2, function () {
        console.log('i18n_util_test_0300 ' + 'start');
        let util = new I18n.Util();
        let value = util.unitConvert({unit: 'cup', measureSystem: 'US'},
                                {unit: 'liter', measureSystem: 'SI'},
                                1000,
                                'en-US',
                                null);
        console.log('i18n_util_test_0300 ' + value);
        let devType = deviceInfo.devicType;
        if (devType == '2in1'){
            expect(value).assertEqual('236.588 liters');
        }else if (devType == 'phone'){
            expect(value).assertEqual('236.588 L');
        }
    })

    /**
     * @tc.number  SUB_GLOBAL_I18N_UTIL_JS_0400
     * @tc.name    test unitConvert interface from cup to liter unit with medium style
     * @tc.desc    get the unitConvert value
     */
    it('i18n_util_test_0400', Level.LEVEL2, function () {
        console.log('i18n_util_test_0400 ' + 'start');
        let util = new I18n.Util();
        let value = util.unitConvert({unit: 'cup', measureSystem: 'US'},
                                {unit: 'liter', measureSystem: 'SI'},
                                1000,
                                'en-US',
                                'medium');
        console.log('i18n_util_test_0400 ' + value);
        let devType = deviceInfo.devicType;
        if (devType == '2in1'){
            expect(value).assertEqual('236.588 liters');
        }else if (devType == 'phone'){
            expect(value).assertEqual('236.588 L');
        }
    })

    /**
     * @tc.number  SUB_GLOBAL_I18N_UTIL_JS_0500
     * @tc.name    test unitConvert interface from cup to liter unit with narrow style
     * @tc.desc    get the unitConvert value
     */
    it('i18n_util_test_0500', Level.LEVEL2, function () {
        console.log('i18n_util_test_0500 ' + 'start');
        let util = new I18n.Util();
        let value = util.unitConvert({unit: 'cup', measureSystem: 'US'},
                                {unit: 'liter', measureSystem: 'SI'},
                                1000,
                                'en-US',
                                'narrow');
        console.log('i18n_util_test_0500 ' + value);
        expect(value).assertEqual('236.588L');
    })

    /**
     * @tc.number  SUB_GLOBAL_I18N_UTIL_JS_0600
     * @tc.name    test unitConvert interface from cup to liter unit with short style
     * @tc.desc    get the unitConvert value
     */
    it('i18n_util_test_0600', Level.LEVEL2, function () {
        console.log('i18n_util_test_0600 ' + 'start');
        let util = new I18n.Util();
        let value = util.unitConvert({unit: 'cup', measureSystem: 'US'},
                                {unit: 'liter', measureSystem: 'SI'},
                                1000,
                                'en-US',
                                'short');
        console.log('i18n_util_test_0600 ' + value);
        expect(value).assertEqual('236.588 L');
    })

    /**
     * @tc.number  SUB_GLOBAL_I18N_UTIL_JS_0700
     * @tc.name    test unitConvert interface from meter to mile unit
     * @tc.desc    get the unitConvert value
     */
    it('i18n_util_test_0700', Level.LEVEL2, function () {
        console.log('i18n_util_test_0700 ' + 'start');
        let util = new I18n.Util();
        let value = util.unitConvert({unit: 'meter', measureSystem: 'SI'},
                                {unit: 'mile', measureSystem: 'SI'},
                                1000,
                                'zh-CN',
                                'long');
        console.log('i18n_util_test_0700 ' + value);
        expect(value).assertEqual('0.621英里');
    })

    /**
     * @tc.number  SUB_GLOBAL_I18N_UTIL_JS_0800
     * @tc.name    test unitConvert interface from hour to second unit
     * @tc.desc    get the unitConvert value
     */
    it('i18n_util_test_0800', Level.LEVEL2, function () {
        console.log('i18n_util_test_0800 ' + 'start');
        let util = new I18n.Util();
        let value = util.unitConvert({unit: 'hour', measureSystem: 'SI'},
                                {unit: 'second', measureSystem: 'SI'},
                                10,
                                'zh-CN',
                                'medium');
        console.log('i18n_util_test_0800 ' + value);
        let devType = deviceInfo.devicType;
        if (devType == '2in1'){
            expect(value).assertEqual('36,000秒钟');
        }else if (devType == 'phone'){
            expect(value).assertEqual('36,000秒');
        }
    })

    /**
     * @tc.number  SUB_GLOBAL_I18N_UTIL_JS_0900
     * @tc.name    test unitConvert interface from celsius to fahrenheit unit
     * @tc.desc    get the unitConvert value
     */
    it('i18n_util_test_0900', Level.LEVEL2, function () {
        console.log('i18n_util_test_0900 ' + 'start');
        let util = new I18n.Util();
        let value = util.unitConvert({unit: 'celsius', measureSystem: 'SI'},
                                {unit: 'fahrenheit', measureSystem: 'SI'},
                                1000,
                                'zh-CN',
                                'short');
        console.log('i18n_util_test_0900 ' + value);
        expect(value).assertEqual('1,832°F');
    })

    /**
     * @tc.number  SUB_GLOBAL_I18N_UTIL_JS_1000
     * @tc.name    test unitConvert interface from acre to hectare unit
     * @tc.desc    get the unitConvert value
     */
    it('i18n_util_test_1000', Level.LEVEL2, function () {
        console.log('i18n_util_test_1000 ' + 'start');
        let util = new I18n.Util();
        let value = util.unitConvert({unit: 'acre', measureSystem: 'SI'},
                                {unit: 'hectare', measureSystem: 'SI'},
                                1000,
                                'zh-CN',
                                'long');
        console.log('i18n_util_test_1000 ' + value);
        expect(value).assertEqual('404.686公顷');
    })

    /**
     * @tc.number  SUB_GLOBAL_I18N_UTIL_JS_1100
     * @tc.name    test unitConvert interface from acre to square-meter unit
     * @tc.desc    get the unitConvert value
     */
    it('i18n_util_test_1100', Level.LEVEL2, function () {
        console.log('i18n_util_test_1100 ' + 'start');
        let util = new I18n.Util();
        let value = util.unitConvert({unit: 'acre', measureSystem: 'SI'},
                                {unit: 'square-meter', measureSystem: 'SI'},
                                1000,
                                'zh-CN',
                                'long');
        console.log('i18n_util_test_1100 ' + value);
        expect(value).assertEqual('4,046,856.422平方米');
    })

    /**
     * @tc.number  SUB_GLOBAL_I18N_UTIL_JS_1200
     * @tc.name    test unitConvert interface from kilometer-per-hour to knot unit
     * @tc.desc    get the unitConvert value
     */
    it('i18n_util_test_1200', Level.LEVEL2, function () {
        console.log('i18n_util_test_1200 ' + 'start');
        let util = new I18n.Util();
        let value = util.unitConvert({unit: 'kilometer-per-hour', measureSystem: 'SI'},
                                {unit: 'knot', measureSystem: 'SI'},
                                1000,
                                'zh-CN',
                                'long');
        console.log('i18n_util_test_1200 ' + value);
        expect(value).assertEqual('539.957节');
    })

    /**
     * @tc.number  SUB_GLOBAL_I18N_UTIL_JS_1300
     * @tc.name    test unitConvert interface from kilometer-per-hour to meter-per-second unit
     * @tc.desc    get the unitConvert value
     */
    it('i18n_util_test_1300', Level.LEVEL2, function () {
        console.log('i18n_util_test_1300 ' + 'start');
        let util = new I18n.Util();
        let value = util.unitConvert({unit: 'kilometer-per-hour', measureSystem: 'SI'},
                                {unit: 'meter-per-second', measureSystem: 'SI'},
                                1000,
                                'zh-CN',
                                'long');
        console.log('i18n_util_test_1300 ' + value);
        expect(value).assertEqual('每秒277.778米');
    })

    /**
     * @tc.number  SUB_GLOBAL_I18N_UTIL_JS_1400
     * @tc.name    test unitConvert interface from meter to kilometer unit
     * @tc.desc    get the unitConvert value
     */
    it('i18n_util_test_1400', Level.LEVEL2, function () {
        console.log('i18n_util_test_1400 ' + 'start');
        let util = new I18n.Util();
        let value = util.unitConvert({unit: 'meter', measureSystem: 'SI'},
                                {unit: 'kilometer', measureSystem: 'SI'},
                                1000,
                                'zh-CN',
                                'long');
        console.log('i18n_util_test_1400 ' + value);
        expect(value).assertEqual('1公里');
    })

    /**
     * @tc.number  SUB_GLOBAL_I18N_UTIL_JS_1500
     * @tc.name    test unitConvert interface from meter to meter-per-second unit
     * @tc.desc    get the unitConvert value
     */
    it('i18n_util_test_1500', Level.LEVEL2, function () {
        console.log('i18n_util_test_1500 ' + 'start');
        let util = new I18n.Util();
        let value = util.unitConvert({unit: 'meter', measureSystem: 'SI'},
                                {unit: 'meter-per-second', measureSystem: 'SI'},
                                1000,
                                'zh-CN',
                                'long');
        console.log('i18n_util_test_1500 ' + value);
        expect(value).assertEqual('1,000米');
    })

    /**
     * @tc.number   : i18n_util_test_1600
     * @tc.name     : i18n_util_test_1600
     * @tc.desc     : unitConvert
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 2
     */
    it('i18n_util_test_1600', Level.LEVEL2, function () {
        console.log('i18n_util_test_1600 ' + 'start');
        let util = new I18n.Util();
        let value = util.unitConvert({unit: 'cup', measureSystem: 'US'},
            {unit: 'liter', measureSystem: 'SI'},
            1000,
            'en-US');
        console.log('i18n_util_test_1600 ' + value);
        expect(value).assertContain('236.588');
    })

    console.log('*************end UtilInI18nTest*************');
})}
