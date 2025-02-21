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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from '@ohos/hypium'

export default function TimezoneInI18nTest() {
describe('TimezoneInI18nTest', function () {
    console.log('*************start TimezoneInI18nTest*************');

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

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_TIMEZONE_0100
    * @tc.name    test getTimeZone method
    * @tc.desc    get the getTimeZone value
    */
    it('timezone_test_0100', 0, function () {
        console.log('timezone_test_0100 ' + 'start');
        let timezone = I18n.getTimeZone();
        let value = timezone.getID();
        console.log('timezone_test_0100 ' + value);
        expect(value.length > 0).assertTrue();
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_TIMEZONE_0200
    * @tc.name    test getDisplayName method
    * @tc.desc    get the getDisplayName value
    */
    it('timezone_test_0200', 0, function () {
        console.log('timezone_test_0200 ' + 'start');
        let timezone = I18n.getTimeZone();
        let value = timezone.getDisplayName();
        console.log('timezone_test_0200 ' + value);
        expect(value.length > 0).assertTrue();
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_TIMEZONE_0300
    * @tc.name    test getDisplayName method with zh-CN param
    * @tc.desc    get the getDisplayName value
    */
    it('timezone_test_0300', 0, function () {
        console.log('timezone_test_0300 ' + 'start');
        let timezone = I18n.getTimeZone();
        let value = timezone.getDisplayName('zh-CN');
        console.log('timezone_test_0300 ' + value);
        expect(value.length > 0).assertTrue();
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_TIMEZONE_0400
    * @tc.name    test getDisplayName method with true param
    * @tc.desc    get the getDisplayName value
    */
    it('timezone_test_0400', 0, function () {
        console.log('timezone_test_0400 ' + 'start');
        let timezone = I18n.getTimeZone();
        let value = timezone.getDisplayName(true);
        console.log('timezone_test_0400 ' + value);
        expect(value.length > 0).assertTrue();
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_TIMEZONE_0500
    * @tc.name    test getDisplayName method with false param
    * @tc.desc    get the getDisplayName value
    */
    it('timezone_test_0500', 0, function () {
        console.log('timezone_test_0500 ' + 'start');
        let timezone = I18n.getTimeZone();
        let value = timezone.getDisplayName(false);
        console.log('timezone_test_0500 ' + value);
        expect(value.length > 0).assertTrue();
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_TIMEZONE_0600
    * @tc.name    test getRawOffset method
    * @tc.desc    get the getRawOffset value
    */
    it('timezone_test_0600', 0, function () {
        console.log('timezone_test_0600 ' + 'start');
        let timezone = I18n.getTimeZone();
        let value = timezone.getRawOffset();
        console.log('timezone_test_0600 ' + value);
        expect(value >= 0).assertEqual(true);
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_TIMEZONE_0700
    * @tc.name    test getOffset method
    * @tc.desc    get the getOffset value
    */
    it('timezone_test_0700', 0, function () {
        console.log('timezone_test_0700 ' + 'start');
        let timezone = I18n.getTimeZone();
        let value = timezone.getOffset();
        console.log('timezone_test_0700 ' + value);
        expect(value >= 0).assertEqual(true);
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_TIMEZONE_0800
    * @tc.name    test getOffset method with date param
    * @tc.desc    get the getOffset value
    */
    it('timezone_test_0800', 0, function () {
        console.log('timezone_test_0800 ' + 'start');
        let timezone = I18n.getTimeZone();
        let value = timezone.getOffset(10540800000);
        console.log('timezone_test_0800 ' + value);
        expect(value >= 0).assertEqual(true);
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_TIMEZONE_0900
    * @tc.name    test getID
    * @tc.desc    get the getID value
    */
    it('timezone_test_0900', 0, function () {
        console.log('timezone_test_0900 ' + 'start');
        let timezone = I18n.getTimeZone('ACT');
        let value = timezone.getID();
        console.log('timezone_test_0900 ' + value);
        expect(value).assertEqual('ACT');
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_TIMEZONE_1000
    * @tc.name    test getDisplayName with timezone id
    * @tc.desc    get the getID value
    */
    it('timezone_test_1000', 0, function () {
        console.log('timezone_test_1000 ' + 'start');
        let timezone = I18n.getTimeZone('ACT');
        let value = timezone.getDisplayName();
        console.log('timezone_test_1000 ' + value);
        expect(value).assertEqual('澳大利亚中部标准时间');
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_TIMEZONE_1100
    * @tc.name    test getDisplayName with locale
    * @tc.desc    get the getID value
    */
    it('timezone_test_1100', 0, function () {
        console.log('timezone_test_1100 ' + 'start');
        let timezone = I18n.getTimeZone('Asia/Shanghai');
        let value = timezone.getDisplayName('zh-CN');
        console.log('timezone_test_1100 ' + value);
        expect(value).assertEqual('中国标准时间');
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_TIMEZONE_1200
    * @tc.name    test getDisplayName with locale
    * @tc.desc    get the getID value
    */
    it('timezone_test_1200', 0, function () {
        console.log('timezone_test_1200 ' + 'start');
        let timezone = I18n.getTimeZone('Asia/Shanghai');
        let value = timezone.getDisplayName('zh-CN', true);
        console.log('timezone_test_1200 ' + value);
        expect(value).assertEqual('中国标准时间');
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_TIMEZONE_1300
    * @tc.name    test getDisplayName with en-US and true param
    * @tc.desc    get the getID value
    */
    it('timezone_test_1300', 0, function () {
        console.log('timezone_test_1300 ' + 'start');
        let timezone = I18n.getTimeZone('Asia/Shanghai');
        let value = timezone.getDisplayName('en-US', true);
        console.log('timezone_test_1300 ' + value);
        expect(value).assertEqual('China Standard Time');
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_TIMEZONE_1400
    * @tc.name    test getDisplayName with zh-CN and false param
    * @tc.desc    get the getID value
    */
    it('timezone_test_1400', 0, function () {
        console.log('timezone_test_1400 ' + 'start');
        let timezone = I18n.getTimeZone('Asia/Shanghai');
        let value = timezone.getDisplayName('zh-CN', false);
        console.log('timezone_test_1400 ' + value);
        expect(value).assertEqual('中国标准时间');
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_TIMEZONE_1500
    * @tc.name    test getRawOffset method with timezone id
    * @tc.desc    get the getRawOffset value
    */
    it('timezone_test_1500', 0, function () {
        console.log('timezone_test_1500 ' + 'start');
        let timezone = I18n.getTimeZone('ACT');
        let value = timezone.getRawOffset();
        console.log('timezone_test_1500 ' + value);
        expect(value > 0).assertEqual(true);
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_TIMEZONE_1600
    * @tc.name    test getOffset method with timezone id
    * @tc.desc    get the getOffset value
    */
    it('timezone_test_1600', 0, function () {
        console.log('timezone_test_1600 ' + 'start');
        let timezone = I18n.getTimeZone('ACT');
        let value = timezone.getOffset();
        console.log('timezone_test_1600 ' + value);
        expect(value > 0).assertEqual(true);
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_TIMEZONE_1700
    * @tc.name    test getOffset method with date and timezone id param
    * @tc.desc    get the getOffset value
    */
    it('timezone_test_1700', 0, function () {
        console.log('timezone_test_1700 ' + 'start');
        let timezone = I18n.getTimeZone('ACT');
        let value = timezone.getOffset(10540800000);
        console.log('timezone_test_1700 ' + value);
        expect(value > 0).assertEqual(true);
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_TIMEZONE_1800
    * @tc.name test getAvailableIDs method
    * @tc.desc get the getAvailableIDs value
    */
    it('timezone_test_1800', 0, function () {
        console.log('timezone_test_1800 ' + 'start');
        let value = I18n.TimeZone.getAvailableIDs();
        console.log('timezone_test_1800 ' + value);
        expect(value.length > 0).assertEqual(true);
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_TIMEZONE_1900
    * @tc.name test getAvailableZoneCityIDs method
    * @tc.desc get the getAvailableZoneCityIDs value
    */
    it('timezone_test_1900', 0, function () {
        console.log('timezone_test_1900 ' + 'start');
        let value = I18n.TimeZone.getAvailableZoneCityIDs();
        console.log('timezone_test_1900 ' + value);
        expect(value.length > 0).assertEqual(true);
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_TIMEZONE_2000
    * @tc.name test getCityDisplayName method with zh locale
    * @tc.desc get the getCityDisplayName value
    */
    it('timezone_test_2000', 0, function () {
        console.log('timezone_test_2000 ' + 'start');
        let value = I18n.TimeZone.getCityDisplayName('Auckland', 'zh');
        console.log('timezone_test_2000 ' + value);
        expect(value).assertEqual('奥克兰 (新西兰)');
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_TIMEZONE_2020
    * @tc.name test getCityDisplayName method with en loacle
    * @tc.desc get the getCityDisplayName value
    */
    it('timezone_test_2020', 0, function () {
        console.log('timezone_test_2020 ' + 'start');
        let value = I18n.TimeZone.getCityDisplayName('Auckland', 'en');
        console.log('timezone_test_2020 ' + value);
        expect(value).assertEqual('Auckland (New Zealand)');
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_TIMEZONE_2040
    * @tc.name test getCityDisplayName method with not exist cityid
    * @tc.desc get the getCityDisplayName value
    */
    it('timezone_test_2040', 0, function () {
        console.log('timezone_test_2040 ' + 'start');
        let value = I18n.TimeZone.getCityDisplayName('abcd', 'en');
        console.log('timezone_test_2040 ' + value);
        expect(value).assertEqual('');
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_TIMEZONE_2060
    * @tc.name test getCityDisplayName method with not exist locale
    * @tc.desc get the getCityDisplayName value
    */
    it('timezone_test_2060', 0, function () {
        console.log('timezone_test_2060 ' + 'start');
        let value = I18n.TimeZone.getCityDisplayName('Auckland', 'abc');
        console.log('timezone_test_2060 ' + value);
        expect(value).assertEqual('Auckland (New Zealand)');
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_TIMEZONE_2100
    * @tc.name test getTimezoneFromCity method
    * @tc.desc get the getTimezoneFromCity value
    */
    it('timezone_test_2100', 0, function () {
        console.log('timezone_test_2100 ' + 'start');
        let value = I18n.TimeZone.getTimezoneFromCity('Auckland');
        console.log('timezone_test_2100 ' + value);
        expect(value != null).assertTrue();
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_TIMEZONE_2120
    * @tc.name test getTimezoneFromCity method with not exist cityid
    * @tc.desc get the getTimezoneFromCity value
    */
    it('timezone_test_2120', 0, function () {
        console.log('timezone_test_2120 ' + 'start');
        let value = I18n.TimeZone.getTimezoneFromCity('abc');
        console.log('timezone_test_2120 ' + value);
        expect(value != null).assertTrue();
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_TIMEZONE_2200
    * @tc.name test getTimezonesByLocation method
    * @tc.desc get the getTimezonesByLocation value
    */
    it('timezone_test_2200', 0, function () {
        console.log('timezone_test_2200 ' + 'start');
        try{
            let value = I18n.TimeZone.getTimezonesByLocation(116,39);
            console.log('timezone_test_2200 ' + value.length);
            expect(value != null).assertTrue();
            console.log('timezone_test_2200 ' + value[0].getID());
            expect(value[0].getID()).assertEqual('Asia/Shanghai');
        }catch(e){
            console.log('timezone_test_2200 e.code' + e.code);
            console.log('timezone_test_2200 e.message' + e.message);
        }
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_TIMEZONE_2300
    * @tc.name test getTimezonesByLocation method
    * @tc.desc get the getTimezonesByLocation value
    */
    it('timezone_test_2300', 0, function () {
        console.log('timezone_test_2300 ' + 'start');
        try{
            let value = I18n.TimeZone.getTimezonesByLocation(87,43);
            console.log('timezone_test_2300 ' + value.length);
            expect(value != null).assertTrue();
            console.log('timezone_test_2300 ' + value[0].getID());
            console.log('timezone_test_2300 ' + value[1].getID());
            expect(value[0].getID()).assertEqual('Asia/Shanghai');
            expect(value[1].getID()).assertEqual('Asia/Urumqi');
        }catch(e){
            console.log('timezone_test_2300 e.code' + e.code);
            console.log('timezone_test_2300 e.message' + e.message);
        }
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_TIMEZONE_2400
    * @tc.name test getTimezonesByLocation method
    * @tc.desc get the getTimezonesByLocation value
    */
    it('timezone_test_2400', 0, function () {
        console.log('timezone_test_2400 ' + 'start');
        try{
            let value = I18n.TimeZone.getTimezonesByLocation(-74,40);
            console.log('timezone_test_2400 ' + value.length);
            expect(value != null).assertTrue();
            console.log('timezone_test_2400 ' + value[0].getID());
            expect(value[0].getID()).assertEqual('America/New_York');
        }catch(e){
            console.log('timezone_test_2400 e.code' + e.code);
            console.log('timezone_test_2400 e.message' + e.message);
        }
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_TIMEZONE_2500
    * @tc.name test getTimezonesByLocation method
    * @tc.desc get the getTimezonesByLocation value
    */
    it('timezone_test_2500', 0, function () {
        console.log('timezone_test_2500 ' + 'start');
        try{
            let value = I18n.TimeZone.getTimezonesByLocation(2,49);
            console.log('timezone_test_2500 ' + value.length);
            expect(value != null).assertTrue();
            console.log('timezone_test_2500 ' + value[0].getID());
            expect(value[0].getID()).assertEqual('Europe/Paris');
        }catch(e){
            console.log('timezone_test_2500 e.code' + e.code);
            console.log('timezone_test_2500 e.message' + e.message);
        }
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_TIMEZONE_2600
    * @tc.name test getTimezonesByLocation method
    * @tc.desc get the getTimezonesByLocation value
    */
    it('timezone_test_2600', 0, function () {
        console.log('timezone_test_2600 ' + 'start');
        try{
            let value = I18n.TimeZone.getTimezonesByLocation(18,-33);
            console.log('timezone_test_2600 ' + value.length);
            expect(value != null).assertTrue();
            console.log('timezone_test_2600 ' + value[0].getID());
            expect(value[0].getID()).assertEqual('Africa/Johannesburg');
        }catch(e){
            console.log('timezone_test_2600 e.code' + e.code);
            console.log('timezone_test_2600 e.message' + e.message);
        }
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_TIMEZONE_2700
    * @tc.name test getTimezonesByLocation method
    * @tc.desc get the getTimezonesByLocation value
    */
    it('timezone_test_2700', 0, function () {
        console.log('timezone_test_2700 ' + 'start');
        try{
            let value = I18n.TimeZone.getTimezonesByLocation(100,90);
            console.log('timezone_test_2700 ' + value);
            expect(value != null).assertTrue();
        }catch(e){
            console.log('timezone_test_2700 e.code' + e.code);
            console.log('timezone_test_2700 e.message' + e.message);
            expect(e.code == 890001).assertTrue();
            expect(e.message == 'Invalid parameter, the longitude or latitude must be a valid value.').assertTrue();
        }
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_TIMEZONE_2800
    * @tc.name test getTimezonesByLocation method
    * @tc.desc get the getTimezonesByLocation value
    */
    it('timezone_test_2800', 0, function () {
        console.log('timezone_test_2800 ' + 'start');
        try{
            let value = I18n.TimeZone.getTimezonesByLocation(100,-90.1);
            console.log('timezone_test_2800 ' + value);
            expect(value != null).assertTrue();
        }catch(e){
            console.log('timezone_test_2800 e.code' + e.code);
            console.log('timezone_test_2800 e.message' + e.message);
            expect(e.code == 890001).assertTrue();
            expect(e.message == 'Invalid parameter, the longitude or latitude must be a valid value.').assertTrue();
        }
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_TIMEZONE_2900
    * @tc.name test getTimezonesByLocation method
    * @tc.desc get the getTimezonesByLocation value
    */
    it('timezone_test_2900', 0, function () {
        console.log('timezone_test_2900 ' + 'start');
        try{
            let value = I18n.TimeZone.getTimezonesByLocation(180.0,50);
            console.log('timezone_test_2900 ' + value);
            expect(value != null).assertTrue();
        }catch(e){
            console.log('timezone_test_2900 e.code' + e.code);
            console.log('timezone_test_2900 e.message' + e.message);
            expect(e.code == 890001).assertTrue();
            expect(e.message == 'Invalid parameter, the longitude or latitude must be a valid value.').assertTrue();
        }
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_TIMEZONE_3000
    * @tc.name test getTimezonesByLocation method
    * @tc.desc get the getTimezonesByLocation value
    */
    it('timezone_test_3000', 0, function () {
        console.log('timezone_test_3000 ' + 'start');
        try{
            let value = I18n.TimeZone.getTimezonesByLocation(-180.1,50);
            console.log('timezone_test_3000 ' + value);
            expect(value != null).assertTrue();
        }catch(e){
            console.log('timezone_test_3000 e.code' + e.code);
            console.log('timezone_test_3000 e.message' + e.message);
            expect(e.code == 890001).assertTrue();
            expect(e.message == 'Invalid parameter, the longitude or latitude must be a valid value.').assertTrue();
        }
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_TIMEZONE_3100
    * @tc.name test getTimezonesByLocation method
    * @tc.desc get the getTimezonesByLocation value
    */
    it('timezone_test_3100', 0, function () {
        console.log('timezone_test_3100 ' + 'start');
        try{
            let value = I18n.TimeZone.getTimezonesByLocation(18);
            console.log('timezone_test_3100 ' + value.length);
            expect(value != null).assertTrue();
        }catch(e){
            console.log('timezone_test_3100 e.code' + e.code);
            console.log('timezone_test_3100 e.message' + e.message);
            expect(e.code == 401).assertTrue();
            expect(e.message == 'Parameter error, the longitude or latitude cannot be empty.').assertTrue();
        }
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_TIMEZONE_3200
    * @tc.name test getTimezonesByLocation method
    * @tc.desc get the getTimezonesByLocation value
    */
    it('timezone_test_3200', 0, function () {
        console.log('timezone_test_3200 ' + 'start');
        try{
            let value = I18n.TimeZone.getTimezonesByLocation(18, '33');
            console.log('timezone_test_3200 ' + value.length);
            expect(value != null).assertTrue();
        }catch(e){
            console.log('timezone_test_3200 e.code' + e.code);
            console.log('timezone_test_3200 e.message' + e.message);
            expect(e.code == 401).assertTrue();
            expect(e.message == 'Parameter error, the type of latitude must be number.').assertTrue();
        }
    })

    console.log('*************end TimezoneInI18nTest*************');
})}
