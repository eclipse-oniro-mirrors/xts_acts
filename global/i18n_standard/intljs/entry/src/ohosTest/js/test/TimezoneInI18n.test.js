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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level} from '@ohos/hypium'

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

    /**
     * @tc.name   timezone_test_0100
     * @tc.number SUB_GLOBAL_I18N_JS_TIMEZONE_0100
     * @tc.desc   get the getTimeZone value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('timezone_test_0100', Level.LEVEL0, function () {
        console.log('timezone_test_0100 ' + 'start');
        let timezone = I18n.getTimeZone();
        let value = timezone.getID();
        console.log('timezone_test_0100 ' + value);
        expect(value.length > 0).assertTrue();
    })

    /**
     * @tc.name   timezone_test_0200
     * @tc.number SUB_GLOBAL_I18N_JS_TIMEZONE_0200
     * @tc.desc   get the getDisplayName value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('timezone_test_0200', Level.LEVEL2, function () {
        console.log('timezone_test_0200 ' + 'start');
        let timezone = I18n.getTimeZone();
        let value = timezone.getDisplayName();
        console.log('timezone_test_0200 ' + value);
        expect(value.length > 0).assertTrue();
    })

    /**
     * @tc.name   timezone_test_0300
     * @tc.number SUB_GLOBAL_I18N_JS_TIMEZONE_0300
     * @tc.desc   get the getDisplayName value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('timezone_test_0300', Level.LEVEL2, function () {
        console.log('timezone_test_0300 ' + 'start');
        let timezone = I18n.getTimeZone();
        let value = timezone.getDisplayName('zh-CN');
        console.log('timezone_test_0300 ' + value);
        expect(value.length > 0).assertTrue();
    })

    /**
     * @tc.name   timezone_test_0400
     * @tc.number SUB_GLOBAL_I18N_JS_TIMEZONE_0400
     * @tc.desc   get the getDisplayName value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('timezone_test_0400', Level.LEVEL2, function () {
        console.log('timezone_test_0400 ' + 'start');
        let timezone = I18n.getTimeZone();
        let value = timezone.getDisplayName(true);
        console.log('timezone_test_0400 ' + value);
        expect(value.length > 0).assertTrue();
    })

    /**
     * @tc.name   timezone_test_0500
     * @tc.number SUB_GLOBAL_I18N_JS_TIMEZONE_0500
     * @tc.desc   get the getDisplayName value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('timezone_test_0500', Level.LEVEL2, function () {
        console.log('timezone_test_0500 ' + 'start');
        let timezone = I18n.getTimeZone();
        let value = timezone.getDisplayName(false);
        console.log('timezone_test_0500 ' + value);
        expect(value.length > 0).assertTrue();
    })

    /**
     * @tc.name   timezone_test_0600
     * @tc.number SUB_GLOBAL_I18N_JS_TIMEZONE_0600
     * @tc.desc   get the getRawOffset value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('timezone_test_0600', Level.LEVEL2, function () {
        console.log('timezone_test_0600 ' + 'start');
        let timezone = I18n.getTimeZone();
        let value = timezone.getRawOffset();
        console.log('timezone_test_0600 ' + value);
        expect(value >= 0).assertEqual(true);
    })

    /**
     * @tc.name   timezone_test_0700
     * @tc.number SUB_GLOBAL_I18N_JS_TIMEZONE_0700
     * @tc.desc   get the getOffset value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('timezone_test_0700', Level.LEVEL2, function () {
        console.log('timezone_test_0700 ' + 'start');
        let timezone = I18n.getTimeZone();
        let value = timezone.getOffset();
        console.log('timezone_test_0700 ' + value);
        expect(value >= 0).assertEqual(true);
    })

    /**
     * @tc.name   timezone_test_0800
     * @tc.number SUB_GLOBAL_I18N_JS_TIMEZONE_0800
     * @tc.desc   get the getOffset value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('timezone_test_0800', Level.LEVEL2, function () {
        console.log('timezone_test_0800 ' + 'start');
        let timezone = I18n.getTimeZone();
        let value = timezone.getOffset(10540800000);
        console.log('timezone_test_0800 ' + value);
        expect(value >= 0).assertEqual(true);
    })

    /**
     * @tc.name   timezone_test_0900
     * @tc.number SUB_GLOBAL_I18N_JS_TIMEZONE_0900
     * @tc.desc   get the getID value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('timezone_test_0900', Level.LEVEL2, function () {
        console.log('timezone_test_0900 ' + 'start');
        let timezone = I18n.getTimeZone('ACT');
        let value = timezone.getID();
        console.log('timezone_test_0900 ' + value);
        expect(value).assertEqual('ACT');
    })

    /**
     * @tc.name   timezone_test_1000
     * @tc.number SUB_GLOBAL_I18N_JS_TIMEZONE_1000
     * @tc.desc   get the getID value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('timezone_test_1000', Level.LEVEL2, function () {
        console.log('timezone_test_1000 ' + 'start');
        let timezone = I18n.getTimeZone('ACT');
        let value = timezone.getDisplayName();
        console.log('timezone_test_1000 ' + value);
        expect(value).assertEqual('澳大利亚中部标准时间');
    })

    /**
     * @tc.name   timezone_test_1100
     * @tc.number SUB_GLOBAL_I18N_JS_TIMEZONE_1100
     * @tc.desc   get the getID value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('timezone_test_1100', Level.LEVEL2, function () {
        console.log('timezone_test_1100 ' + 'start');
        let timezone = I18n.getTimeZone('Asia/Shanghai');
        let value = timezone.getDisplayName('zh-CN');
        console.log('timezone_test_1100 ' + value);
        expect(value).assertEqual('中国标准时间');
    })

    /**
     * @tc.name   timezone_test_1200
     * @tc.number SUB_GLOBAL_I18N_JS_TIMEZONE_1200
     * @tc.desc   get the getID value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('timezone_test_1200', Level.LEVEL2, function () {
        console.log('timezone_test_1200 ' + 'start');
        let timezone = I18n.getTimeZone('Asia/Shanghai');
        let value = timezone.getDisplayName('zh-CN', true);
        console.log('timezone_test_1200 ' + value);
        expect(value).assertEqual('中国标准时间');
    })

    /**
     * @tc.name   timezone_test_1300
     * @tc.number SUB_GLOBAL_I18N_JS_TIMEZONE_1300
     * @tc.desc   get the getID value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('timezone_test_1300', Level.LEVEL2, function () {
        console.log('timezone_test_1300 ' + 'start');
        let timezone = I18n.getTimeZone('Asia/Shanghai');
        let value = timezone.getDisplayName('en-US', true);
        console.log('timezone_test_1300 ' + value);
        expect(value).assertEqual('China Standard Time');
    })

    /**
     * @tc.name   timezone_test_1400
     * @tc.number SUB_GLOBAL_I18N_JS_TIMEZONE_1400
     * @tc.desc   get the getID value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('timezone_test_1400', Level.LEVEL2, function () {
        console.log('timezone_test_1400 ' + 'start');
        let timezone = I18n.getTimeZone('Asia/Shanghai');
        let value = timezone.getDisplayName('zh-CN', false);
        console.log('timezone_test_1400 ' + value);
        expect(value).assertEqual('中国标准时间');
    })

    /**
     * @tc.name   timezone_test_1500
     * @tc.number SUB_GLOBAL_I18N_JS_TIMEZONE_1500
     * @tc.desc   get the getRawOffset value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('timezone_test_1500', Level.LEVEL2, function () {
        console.log('timezone_test_1500 ' + 'start');
        let timezone = I18n.getTimeZone('ACT');
        let value = timezone.getRawOffset();
        console.log('timezone_test_1500 ' + value);
        expect(value > 0).assertEqual(true);
    })

    /**
     * @tc.name   timezone_test_1600
     * @tc.number SUB_GLOBAL_I18N_JS_TIMEZONE_1600
     * @tc.desc   get the getOffset value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('timezone_test_1600', Level.LEVEL2, function () {
        console.log('timezone_test_1600 ' + 'start');
        let timezone = I18n.getTimeZone('ACT');
        let value = timezone.getOffset();
        console.log('timezone_test_1600 ' + value);
        expect(value > 0).assertEqual(true);
    })

    /**
     * @tc.name   timezone_test_1700
     * @tc.number SUB_GLOBAL_I18N_JS_TIMEZONE_1700
     * @tc.desc   get the getOffset value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('timezone_test_1700', Level.LEVEL2, function () {
        console.log('timezone_test_1700 ' + 'start');
        let timezone = I18n.getTimeZone('ACT');
        let value = timezone.getOffset(10540800000);
        console.log('timezone_test_1700 ' + value);
        expect(value > 0).assertEqual(true);
    })

    /**
     * @tc.name   timezone_test_1800
     * @tc.number SUB_GLOBAL_I18N_JS_TIMEZONE_1800
     * @tc.desc   get the getAvailableIDs value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('timezone_test_1800', Level.LEVEL0, function () {
        console.log('timezone_test_1800 ' + 'start');
        let value = I18n.TimeZone.getAvailableIDs();
        console.log('timezone_test_1800 ' + value);
        expect(value.length > 0).assertEqual(true);
    })

    /**
     * @tc.name   timezone_test_1900
     * @tc.number SUB_GLOBAL_I18N_JS_TIMEZONE_1900
     * @tc.desc   get the getAvailableZoneCityIDs value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('timezone_test_1900', Level.LEVEL0, function () {
        console.log('timezone_test_1900 ' + 'start');
        let value = I18n.TimeZone.getAvailableZoneCityIDs();
        console.log('timezone_test_1900 ' + value);
        expect(value.length > 0).assertEqual(true);
    })

    /**
     * @tc.name   timezone_test_2000
     * @tc.number SUB_GLOBAL_I18N_JS_TIMEZONE_2000
     * @tc.desc   get the getCityDisplayName value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('timezone_test_2000', Level.LEVEL0, function () {
        console.log('timezone_test_2000 ' + 'start');
        let value = I18n.TimeZone.getCityDisplayName('Auckland', 'zh');
        console.log('timezone_test_2000 ' + value);
        expect(value).assertEqual('奥克兰 (新西兰)');
    })

    /**
     * @tc.name   timezone_test_2020
     * @tc.number SUB_GLOBAL_I18N_JS_TIMEZONE_2020
     * @tc.desc   get the getCityDisplayName value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('timezone_test_2020', Level.LEVEL2, function () {
        console.log('timezone_test_2020 ' + 'start');
        let value = I18n.TimeZone.getCityDisplayName('Auckland', 'en');
        console.log('timezone_test_2020 ' + value);
        expect(value).assertEqual('Auckland (New Zealand)');
    })

    /**
     * @tc.name   timezone_test_2040
     * @tc.number SUB_GLOBAL_I18N_JS_TIMEZONE_2040
     * @tc.desc   get the getCityDisplayName value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('timezone_test_2040', Level.LEVEL2, function () {
        console.log('timezone_test_2040 ' + 'start');
        let value = I18n.TimeZone.getCityDisplayName('abcd', 'en');
        console.log('timezone_test_2040 ' + value);
        expect(value).assertEqual('');
    })

    /**
     * @tc.name   timezone_test_2060
     * @tc.number SUB_GLOBAL_I18N_JS_TIMEZONE_2060
     * @tc.desc   get the getCityDisplayName value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('timezone_test_2060', Level.LEVEL2, function () {
        console.log('timezone_test_2060 ' + 'start');
        let value = I18n.TimeZone.getCityDisplayName('Auckland', 'abc');
        console.log('timezone_test_2060 ' + value);
        expect(value).assertEqual('Auckland (New Zealand)');
    })

    /**
     * @tc.name   timezone_test_2100
     * @tc.number SUB_GLOBAL_I18N_JS_TIMEZONE_2100
     * @tc.desc   get the getTimezoneFromCity value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('timezone_test_2100', Level.LEVEL0, function () {
        console.log('timezone_test_2100 ' + 'start');
        let value = I18n.TimeZone.getTimezoneFromCity('Auckland');
        console.log('timezone_test_2100 ' + value);
        expect(value != null).assertTrue();
    })

    /**
     * @tc.name   timezone_test_2120
     * @tc.number SUB_GLOBAL_I18N_JS_TIMEZONE_2120
     * @tc.desc   get the getTimezoneFromCity value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('timezone_test_2120', Level.LEVEL2, function () {
        console.log('timezone_test_2120 ' + 'start');
        let value = I18n.TimeZone.getTimezoneFromCity('abc');
        console.log('timezone_test_2120 ' + value);
        expect(value != null).assertTrue();
    })

    /**
     * @tc.name   timezone_test_2200
     * @tc.number SUB_GLOBAL_I18N_JS_TIMEZONE_2200
     * @tc.desc   get the getTimezonesByLocation value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('timezone_test_2200', Level.LEVEL0, function () {
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

    /**
     * @tc.name   timezone_test_2300
     * @tc.number SUB_GLOBAL_I18N_JS_TIMEZONE_2300
     * @tc.desc   get the getTimezonesByLocation value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('timezone_test_2300', Level.LEVEL2, function () {
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

    /**
     * @tc.name   timezone_test_2400
     * @tc.number SUB_GLOBAL_I18N_JS_TIMEZONE_2400
     * @tc.desc   get the getTimezonesByLocation value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('timezone_test_2400', Level.LEVEL2, function () {
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

    /**
     * @tc.name   timezone_test_2500
     * @tc.number SUB_GLOBAL_I18N_JS_TIMEZONE_2500
     * @tc.desc   get the getTimezonesByLocation value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('timezone_test_2500', Level.LEVEL2, function () {
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

    /**
     * @tc.name   timezone_test_2600
     * @tc.number SUB_GLOBAL_I18N_JS_TIMEZONE_2600
     * @tc.desc   get the getTimezonesByLocation value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('timezone_test_2600', Level.LEVEL2, function () {
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

    /**
     * @tc.name   timezone_test_2700
     * @tc.number SUB_GLOBAL_I18N_JS_TIMEZONE_2700
     * @tc.desc   get the getTimezonesByLocation value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('timezone_test_2700', Level.LEVEL2, function () {
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

    /**
     * @tc.name   timezone_test_2800
     * @tc.number SUB_GLOBAL_I18N_JS_TIMEZONE_2800
     * @tc.desc   get the getTimezonesByLocation value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('timezone_test_2800', Level.LEVEL2, function () {
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

    /**
     * @tc.name   timezone_test_2900
     * @tc.number SUB_GLOBAL_I18N_JS_TIMEZONE_2900
     * @tc.desc   get the getTimezonesByLocation value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('timezone_test_2900', Level.LEVEL2, function () {
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

    /**
     * @tc.name   timezone_test_3000
     * @tc.number SUB_GLOBAL_I18N_JS_TIMEZONE_3000
     * @tc.desc   get the getTimezonesByLocation value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('timezone_test_3000', Level.LEVEL2, function () {
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

    /**
     * @tc.name   timezone_test_3100
     * @tc.number SUB_GLOBAL_I18N_JS_TIMEZONE_3100
     * @tc.desc   get the getTimezonesByLocation value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('timezone_test_3100', Level.LEVEL2, function () {
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

    /**
     * @tc.name   timezone_test_3200
     * @tc.number SUB_GLOBAL_I18N_JS_TIMEZONE_3200
     * @tc.desc   get the getTimezonesByLocation value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('timezone_test_3200', Level.LEVEL2, function () {
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
