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

export default function PhoneNumberFormatInI18nTest() {
describe('PhoneNumberFormatInI18nTest', function () {
    console.log('*************start PhoneNumberFormatInI18nTest*************');

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
      * @tc.name   i18n_phonenumberformat_test_0100
      * @tc.number SUB_GLOBAL_I18N_PHONENUMBERFORMAT_JS_0100
      * @tc.desc   get the isValidNumber value
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL0
      */
     it('i18n_phonenumberformat_test_0100', Level.LEVEL0, function () {
        console.log('i18n_phonenumberformat_test_0100 ' + 'start');
        let phonenumber = new I18n.PhoneNumberFormat('CN');
        let ran = Math.ceil(Math.random(1) * 9);
        console.log('i18n_phonenumberformat_test_0100 ' + ran);
        let valid = phonenumber.isValidNumber('1351057467' + ran);
        console.log('i18n_phonenumberformat_test_0100 ' + valid);
        expect(valid).assertEqual(true);
    })

     /**
      * @tc.name   i18n_phonenumberformat_test_0200
      * @tc.number SUB_GLOBAL_I18N_PHONENUMBERFORMAT_JS_0200
      * @tc.desc   get the isValidNumber value
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL2
      */
     it('i18n_phonenumberformat_test_0200', Level.LEVEL2, function () {
        console.log('i18n_phonenumberformat_test_0200 ' + 'start');
        let phonenumber = new I18n.PhoneNumberFormat('CN', undefined);
        let ran = Math.ceil(Math.random(1) * 9);
        console.log('i18n_phonenumberformat_test_0200 ' + ran);
        let valid = phonenumber.isValidNumber('1351057467' + ran);
        console.log('i18n_phonenumberformat_test_0200 ' + valid);
        expect(valid).assertEqual(true);
    })

     /**
      * @tc.name   i18n_phonenumberformat_test_0300
      * @tc.number SUB_GLOBAL_I18N_PHONENUMBERFORMAT_JS_0300
      * @tc.desc   get the isValidNumber value
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL2
      */
     it('i18n_phonenumberformat_test_0300', Level.LEVEL2, function () {
        console.log('i18n_phonenumberformat_test_0300 ' + 'start');
        let phonenumber = new I18n.PhoneNumberFormat('CN', null);
        let ran = Math.ceil(Math.random(1) * 9);
        console.log('i18n_phonenumberformat_test_0300 ' + ran);
        let valid = phonenumber.isValidNumber('1351057467' + ran);
        console.log('i18n_phonenumberformat_test_0300 ' + valid);
        expect(valid).assertEqual(true);
    })

     /**
      * @tc.name   i18n_phonenumberformat_test_0400
      * @tc.number SUB_GLOBAL_I18N_PHONENUMBERFORMAT_JS_0400
      * @tc.desc   get the isValidNumber value
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL2
      */
     it('i18n_phonenumberformat_test_0400', Level.LEVEL2, function () {
        console.log('i18n_phonenumberformat_test_0400 ' + 'start');
        let phonenumber = new I18n.PhoneNumberFormat('CN');
        let ran = Math.ceil(Math.random(1) * 9);
        console.log('i18n_phonenumberformat_test_0400 ' + ran);
        let valid = phonenumber.isValidNumber('0755-6100088' + ran);
        console.log('i18n_phonenumberformat_test_0400 ' + valid);
        expect(valid).assertEqual(true);
    })

     /**
      * @tc.name   i18n_phonenumberformat_test_0500
      * @tc.number SUB_GLOBAL_I18N_PHONENUMBERFORMAT_JS_0500
      * @tc.desc   get the isValidNumber value
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL2
      */
     it('i18n_phonenumberformat_test_0500', Level.LEVEL2, function () {
        console.log('i18n_phonenumberformat_test_0500 ' + 'start');
        let phonenumber = new I18n.PhoneNumberFormat('CN');
        let valid = phonenumber.isValidNumber('110');
        console.log('i18n_phonenumberformat_test_0500 ' + valid);
        expect(valid).assertEqual(false);
    })

    /**
     * @tc.name   i18n_phonenumberformat_test_0600
     * @tc.number SUB_GLOBAL_I18N_PHONENUMBERFORMAT_JS_0600
     * @tc.desc   get the isValidNumber value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('i18n_phonenumberformat_test_0600', Level.LEVEL2, function () {
        console.log('i18n_phonenumberformat_test_0600 ' + 'start');
        let phonenumber = new I18n.PhoneNumberFormat('CN');
        let ran = Math.ceil(Math.random(1) * 9);
        console.log('i18n_phonenumberformat_test_0600 ' + ran);
        let valid = phonenumber.isValidNumber('135 1057 467' + ran);
        console.log('i18n_phonenumberformat_test_0600 ' + valid);
        expect(valid).assertEqual(true);
    })

    /**
     * @tc.name   i18n_phonenumberformat_test_0700
     * @tc.number SUB_GLOBAL_I18N_PHONENUMBERFORMAT_JS_0700
     * @tc.desc   get the isValidNumber value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('i18n_phonenumberformat_test_0700', Level.LEVEL2, function () {
        console.log('i18n_phonenumberformat_test_0700 ' + 'start');
        let phonenumber = new I18n.PhoneNumberFormat('CN');
        let ran = Math.ceil(Math.random(1) * 9);
        console.log('i18n_phonenumberformat_test_0700 ' + ran);
        let valid = phonenumber.isValidNumber('+86 135 1057 467' + ran);
        console.log('i18n_phonenumberformat_test_0700 ' + valid);
        expect(valid).assertEqual(true);
    })

    /**
     * @tc.name   i18n_phonenumberformat_test_0800
     * @tc.number SUB_GLOBAL_I18N_PHONENUMBERFORMAT_JS_0800
     * @tc.desc   get the isValidNumber value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('i18n_phonenumberformat_test_0800', Level.LEVEL2, function () {
        console.log('i18n_phonenumberformat_test_0800 ' + 'start');
        let phonenumber = new I18n.PhoneNumberFormat('CN');
        let ran = Math.ceil(Math.random(1) * 9);
        console.log('i18n_phonenumberformat_test_0800 ' + ran);
        let valid = phonenumber.isValidNumber('135-1057-467' + ran);
        console.log('i18n_phonenumberformat_test_0800 ' + valid);
        expect(valid).assertEqual(true);
    })

    /**
     * @tc.name   i18n_phonenumberformat_test_0900
     * @tc.number SUB_GLOBAL_I18N_PHONENUMBERFORMAT_JS_0900
     * @tc.desc   get the isValidNumber value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('i18n_phonenumberformat_test_0900', Level.LEVEL2, function () {
        console.log('i18n_phonenumberformat_test_0900 ' + 'start');
        let phonenumber = new I18n.PhoneNumberFormat('CN');
        let ran = Math.ceil(Math.random(1) * 9);
        console.log('i18n_phonenumberformat_test_0900 ' + ran);
        let valid = phonenumber.isValidNumber('tel:+86-135-1057-467' + ran);
        console.log('i18n_phonenumberformat_test_0900 ' + valid);
        expect(valid).assertEqual(true);
    })

    /**
     * @tc.name   i18n_phonenumberformat_test_1000
     * @tc.number SUB_GLOBAL_I18N_PHONENUMBERFORMAT_JS_1000
     * @tc.desc   get the isValidNumber value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('i18n_phonenumberformat_test_1000', Level.LEVEL2, function () {
        console.log('i18n_phonenumberformat_test_1000 ' + 'start');
        let phonenumber = new I18n.PhoneNumberFormat('CN');
        let ran = Math.ceil(Math.random(1) * 9);
        console.log('i18n_phonenumberformat_test_1000 ' + ran);
        let valid = phonenumber.isValidNumber('86-135-1057-467' + ran);
        console.log('i18n_phonenumberformat_test_1000 ' + valid);
        expect(valid).assertEqual(true);
    })

    /**
     * @tc.name   i18n_phonenumberformat_test_1100
     * @tc.number SUB_GLOBAL_I18N_PHONENUMBERFORMAT_JS_1100
     * @tc.desc   get the isValidNumber value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('i18n_phonenumberformat_test_1100', Level.LEVEL2, function () {
        console.log('i18n_phonenumberformat_test_1100 ' + 'start');
        let phonenumber = new I18n.PhoneNumberFormat('CN');
        let ran = Math.ceil(Math.random(1) * 9);
        console.log('i18n_phonenumberformat_test_1100 ' + ran);
        let valid = phonenumber.isValidNumber('+861351057467' + ran);
        console.log('i18n_phonenumberformat_test_1100 ' + valid);
        expect(valid).assertEqual(true);
    })

    /**
     * @tc.name   i18n_phonenumberformat_test_1200
     * @tc.number SUB_GLOBAL_I18N_PHONENUMBERFORMAT_JS_1200
     * @tc.desc   get the isValidNumber value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('i18n_phonenumberformat_test_1200', Level.LEVEL2, function () {
        console.log('i18n_phonenumberformat_test_1200 ' + 'start');
        let phonenumber = new I18n.PhoneNumberFormat('CN');
        let ran = Math.ceil(Math.random(1) * 9);
        console.log('i18n_phonenumberformat_test_1200 ' + ran);
        let valid = phonenumber.isValidNumber('861351057467' + ran);
        console.log('i18n_phonenumberformat_test_1200 ' + valid);
        expect(valid).assertEqual(true);
    })

    /**
     * @tc.name   i18n_phonenumberformat_test_1300
     * @tc.number SUB_GLOBAL_I18N_PHONENUMBERFORMAT_JS_1300
     * @tc.desc   get the isValidNumber value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('i18n_phonenumberformat_test_1300', Level.LEVEL2, function () {
        console.log('i18n_phonenumberformat_test_1300 ' + 'start');
        let phonenumber = new I18n.PhoneNumberFormat('CN');
        let ran = Math.ceil(Math.random(1) * 9);
        console.log('i18n_phonenumberformat_test_1300 ' + ran);
        let valid = phonenumber.isValidNumber('135105746' + ran);
        console.log('i18n_phonenumberformat_test_1300 ' + valid);
        expect(valid).assertEqual(false);
    })

    /**
     * @tc.name   i18n_phonenumberformat_test_1400
     * @tc.number SUB_GLOBAL_I18N_PHONENUMBERFORMAT_JS_1400
     * @tc.desc   get the isValidNumber value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('i18n_phonenumberformat_test_1400', Level.LEVEL2, function () {
        console.log('i18n_phonenumberformat_test_1400 ' + 'start');
        let phonenumber = new I18n.PhoneNumberFormat('CN');
        let ran = Math.ceil(Math.random(1) * 9);
        console.log('i18n_phonenumberformat_test_1400 ' + ran);
        let valid = phonenumber.isValidNumber('13510574676' + ran);
        console.log('i18n_phonenumberformat_test_1400 ' + valid);
        expect(valid).assertEqual(false);
    })

    /**
     * @tc.name   i18n_phonenumberformat_test_1500
     * @tc.number SUB_GLOBAL_I18N_PHONENUMBERFORMAT_JS_1500
     * @tc.desc   get the isValidNumber value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('i18n_phonenumberformat_test_1500', Level.LEVEL2, function () {
        console.log('i18n_phonenumberformat_test_1500 ' + 'start');
        let phonenumber = new I18n.PhoneNumberFormat('CN');
        let ran = Math.ceil(Math.random(1) * 9);
        console.log('i18n_phonenumberformat_test_1500 ' + ran);
        let valid = phonenumber.isValidNumber('135105746' + ran + 'a');
        console.log('i18n_phonenumberformat_test_1500 ' + valid);
        expect(valid).assertEqual(false);
    })

    /**
     * @tc.name   i18n_phonenumberformat_test_1600
     * @tc.number SUB_GLOBAL_I18N_PHONENUMBERFORMAT_JS_1600
     * @tc.desc   get the isValidNumber value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('i18n_phonenumberformat_test_1600', Level.LEVEL2, function () {
        console.log('i18n_phonenumberformat_test_1600 ' + 'start');
        let phonenumber = new I18n.PhoneNumberFormat('US');
        let ran = Math.ceil(Math.random(1) * 9);
        console.log('i18n_phonenumberformat_test_1600 ' + ran);
        let valid = phonenumber.isValidNumber('626202337' + ran);
        console.log('i18n_phonenumberformat_test_1600 ' + valid);
        expect(valid).assertEqual(true);
    })

    /**
     * @tc.name   i18n_phonenumberformat_test_1700
     * @tc.number SUB_GLOBAL_I18N_PHONENUMBERFORMAT_JS_1700
     * @tc.desc   get the isValidNumber value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('i18n_phonenumberformat_test_1700', Level.LEVEL2, function () {
        console.log('i18n_phonenumberformat_test_1700 ' + 'start');
        let phonenumber = new I18n.PhoneNumberFormat('US');
        let ran = Math.ceil(Math.random(1) * 9);
        console.log('i18n_phonenumberformat_test_1700 ' + ran);
        let valid = phonenumber.isValidNumber('62620233' + ran);
        console.log('i18n_phonenumberformat_test_1700 ' + valid);
        expect(valid).assertEqual(false);
    })

    /**
     * @tc.name   i18n_phonenumberformat_test_1800
     * @tc.number SUB_GLOBAL_I18N_PHONENUMBERFORMAT_JS_1800
     * @tc.desc   get the isValidNumber value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('i18n_phonenumberformat_test_1800', Level.LEVEL2, function () {
        console.log('i18n_phonenumberformat_test_1800 ' + 'start');
        let phonenumber = new I18n.PhoneNumberFormat('US');
        let ran = Math.ceil(Math.random(1) * 9);
        console.log('i18n_phonenumberformat_test_1800 ' + ran);
        let valid = phonenumber.isValidNumber('6262023379' + ran);
        console.log('i18n_phonenumberformat_test_1800 ' + valid);
        expect(valid).assertEqual(false);
    })

    /**
     * @tc.name   i18n_phonenumberformat_test_1900
     * @tc.number SUB_GLOBAL_I18N_PHONENUMBERFORMAT_JS_1900
     * @tc.desc   get the isValidNumber value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('i18n_phonenumberformat_test_1900', Level.LEVEL2, function () {
        console.log('i18n_phonenumberformat_test_1900 ' + 'start');
        let phonenumber = new I18n.PhoneNumberFormat('US');
        let ran = Math.ceil(Math.random(1) * 9);
        console.log('i18n_phonenumberformat_test_1900 ' + ran);
        let valid = phonenumber.isValidNumber('62620233' + ran + 'a');
        console.log('i18n_phonenumberformat_test_1900 ' + valid);
        expect(valid).assertEqual(false);
    })

    /**
     * @tc.name   i18n_phonenumberformat_test_2000
     * @tc.number SUB_GLOBAL_I18N_PHONENUMBERFORMAT_JS_2000
     * @tc.desc   get the isValidNumber value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('i18n_phonenumberformat_test_2000', Level.LEVEL2, function () {
        console.log('i18n_phonenumberformat_test_2000 ' + 'start');
        let phonenumber = new I18n.PhoneNumberFormat('CN');
        let ran = Math.ceil(Math.random(1) * 9);
        console.log('i18n_phonenumberformat_test_2000 ' + ran);
        let value = phonenumber.format('1351057467' + ran);
        console.log('i18n_phonenumberformat_test_2000 ' + value);
        expect(value).assertEqual('135 1057 467' + ran);
    })

    /**
     * @tc.name   i18n_phonenumberformat_test_2100
     * @tc.number SUB_GLOBAL_I18N_PHONENUMBERFORMAT_JS_2100
     * @tc.desc   get the isValidNumber value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('i18n_phonenumberformat_test_2100', Level.LEVEL2, function () {
        console.log('i18n_phonenumberformat_test_2100 ' + 'start');
        let phonenumber = new I18n.PhoneNumberFormat('US');
        let ran = Math.ceil(Math.random(1) * 9);
        console.log('i18n_phonenumberformat_test_2100 ' + ran);
        let value = phonenumber.format('626202337' + ran);
        console.log('i18n_phonenumberformat_test_2100 ' + value);
        expect(value).assertEqual('(626) 202-337' + ran);
    })

    /**
     * @tc.name   i18n_phonenumberformat_test_2200
     * @tc.number SUB_GLOBAL_I18N_PHONENUMBERFORMAT_JS_2200
     * @tc.desc   get the isValidNumber value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('i18n_phonenumberformat_test_2200', Level.LEVEL2, function () {
        console.log('i18n_phonenumberformat_test_2200 ' + 'start');
        let phonenumber = new I18n.PhoneNumberFormat('CN', {'type': 'NATIONAL'});
        let ran = Math.ceil(Math.random(1) * 9);
        console.log('i18n_phonenumberformat_test_2200 ' + ran);
        let value = phonenumber.format('1351057467' + ran);
        console.log('i18n_phonenumberformat_test_2200 ' + value);
        expect(value).assertEqual('135 1057 467' + ran);
    })

    /**
     * @tc.name   i18n_phonenumberformat_test_2300
     * @tc.number SUB_GLOBAL_I18N_PHONENUMBERFORMAT_JS_2300
     * @tc.desc   get the isValidNumber value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('i18n_phonenumberformat_test_2300', Level.LEVEL2, function () {
        console.log('i18n_phonenumberformat_test_2300 ' + 'start');
        let phonenumber = new I18n.PhoneNumberFormat('CN', {'type': 'NATIONAL'});
        let ran = Math.ceil(Math.random(1) * 9);
        console.log('i18n_phonenumberformat_test_2300 ' + ran);
        let value = phonenumber.format('135105746' + ran);
        console.log('i18n_phonenumberformat_test_2300 ' + value);
        expect(value).assertEqual('135105746' + ran);
    })

    /**
     * @tc.name   i18n_phonenumberformat_test_2400
     * @tc.number SUB_GLOBAL_I18N_PHONENUMBERFORMAT_JS_2400
     * @tc.desc   get the isValidNumber value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('i18n_phonenumberformat_test_2400', Level.LEVEL2, function () {
        console.log('i18n_phonenumberformat_test_2400 ' + 'start');
        let phonenumber = new I18n.PhoneNumberFormat('CN', {'type': 'NATIONAL'});
        let ran = Math.ceil(Math.random(1) * 9);
        console.log('i18n_phonenumberformat_test_2400 ' + ran);
        let value = phonenumber.format('13510574676' + ran);
        console.log('i18n_phonenumberformat_test_2400 ' + value);
        expect(value).assertEqual('013 510 574 676' + ran);
    })

    /**
     * @tc.name   i18n_phonenumberformat_test_2500
     * @tc.number SUB_GLOBAL_I18N_PHONENUMBERFORMAT_JS_2500
     * @tc.desc   get the isValidNumber value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('i18n_phonenumberformat_test_2500', Level.LEVEL2, function () {
        console.log('i18n_phonenumberformat_test_2500 ' + 'start');
        let phonenumber = new I18n.PhoneNumberFormat('CN', {'type': 'NATIONAL'});
        let ran = Math.ceil(Math.random(1) * 9);
        console.log('i18n_phonenumberformat_test_2500 ' + ran);
        let value = phonenumber.format('135 1057 467' + ran);
        console.log('i18n_phonenumberformat_test_2500 ' + value);
        expect(value).assertEqual('135 1057 467' + ran);
    })

    /**
     * @tc.name   i18n_phonenumberformat_test_2600
     * @tc.number SUB_GLOBAL_I18N_PHONENUMBERFORMAT_JS_2600
     * @tc.desc   get the isValidNumber value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('i18n_phonenumberformat_test_2600', Level.LEVEL2, function () {
        console.log('i18n_phonenumberformat_test_2600 ' + 'start');
        let phonenumber = new I18n.PhoneNumberFormat('CN', {'type': 'INTERNATIONAL'});
        let ran = Math.ceil(Math.random(1) * 9);
        console.log('i18n_phonenumberformat_test_2600 ' + ran);
        let value = phonenumber.format('1351057467' + ran);
        console.log('i18n_phonenumberformat_test_2600 ' + value);
        expect(value).assertEqual('+86 135 1057 467' + ran);
    })

    /**
     * @tc.name   i18n_phonenumberformat_test_2700
     * @tc.number SUB_GLOBAL_I18N_PHONENUMBERFORMAT_JS_2700
     * @tc.desc   get the isValidNumber value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('i18n_phonenumberformat_test_2700', Level.LEVEL2, function () {
        console.log('i18n_phonenumberformat_test_2700 ' + 'start');
        let phonenumber = new I18n.PhoneNumberFormat('CN', {'type': 'RFC3966'});
        let ran = Math.ceil(Math.random(1) * 9);
        console.log('i18n_phonenumberformat_test_2700 ' + ran);
        let value = phonenumber.format('1351057467' + ran);
        console.log('i18n_phonenumberformat_test_2700 ' + value);
        expect(value).assertEqual('tel:+86-135-1057-467' + ran);
    })

    /**
     * @tc.name   i18n_phonenumberformat_test_2800
     * @tc.number SUB_GLOBAL_I18N_PHONENUMBERFORMAT_JS_2800
     * @tc.desc   get the isValidNumber value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('i18n_phonenumberformat_test_2800', Level.LEVEL2, function () {
        console.log('i18n_phonenumberformat_test_2800 ' + 'start');
        let phonenumber = new I18n.PhoneNumberFormat('CN', {'type': 'E164'});
        let ran = Math.ceil(Math.random(1) * 9);
        console.log('i18n_phonenumberformat_test_2800 ' + ran);
        let value = phonenumber.format('1351057467' + ran);
        console.log('i18n_phonenumberformat_test_2800 ' + value);
        expect(value).assertEqual('+861351057467' + ran);
    })

    /**
     * @tc.name   i18n_phonenumberformat_test_2900
     * @tc.number SUB_GLOBAL_I18N_PHONENUMBERFORMAT_JS_2900
     * @tc.desc   get the isValidNumber value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('i18n_phonenumberformat_test_2900', Level.LEVEL2, function () {
        console.log('i18n_phonenumberformat_test_2900 ' + 'start');
        let phonenumber = new I18n.PhoneNumberFormat('US', {'type': 'NATIONAL'});
        let ran = Math.ceil(Math.random(1) * 9);
        console.log('i18n_phonenumberformat_test_2900 ' + ran);
        let value = phonenumber.format('626202337' + ran);
        console.log('i18n_phonenumberformat_test_2900 ' + value);
        expect(value).assertEqual('(626) 202-337' + ran);
    })

    /**
     * @tc.name   i18n_phonenumberformat_test_3000
     * @tc.number SUB_GLOBAL_I18N_PHONENUMBERFORMAT_JS_3000
     * @tc.desc   get the isValidNumber value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('i18n_phonenumberformat_test_3000', Level.LEVEL2, function () {
        console.log('i18n_phonenumberformat_test_3000 ' + 'start');
        let phonenumber = new I18n.PhoneNumberFormat('US', {'type': 'INTERNATIONAL'});
        let ran = Math.ceil(Math.random(1) * 9);
        console.log('i18n_phonenumberformat_test_3000 ' + ran);
        let value = phonenumber.format('626202337' + ran);
        console.log('i18n_phonenumberformat_test_3000 ' + value);
        expect(value).assertEqual('+1 626-202-337' + ran);
    })

    /**
     * @tc.name   i18n_phonenumberformat_test_3100
     * @tc.number SUB_GLOBAL_I18N_PHONENUMBERFORMAT_JS_3100
     * @tc.desc   get the isValidNumber value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('i18n_phonenumberformat_test_3100', Level.LEVEL2, function () {
        console.log('i18n_phonenumberformat_test_3100 ' + 'start');
        let phonenumber = new I18n.PhoneNumberFormat('US', {'type': 'RFC3966'});
        let ran = Math.ceil(Math.random(1) * 9);
        console.log('i18n_phonenumberformat_test_3100 ' + ran);
        let value = phonenumber.format('626202337' + ran);
        console.log('i18n_phonenumberformat_test_3100 ' + value);
        expect(value).assertEqual('tel:+1-626-202-337' + ran);
    })

    /**
     * @tc.name   i18n_phonenumberformat_test_3200
     * @tc.number SUB_GLOBAL_I18N_PHONENUMBERFORMAT_JS_3200
     * @tc.desc   get the isValidNumber value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('i18n_phonenumberformat_test_3200', Level.LEVEL2, function () {
        console.log('i18n_phonenumberformat_test_3200 ' + 'start');
        let phonenumber = new I18n.PhoneNumberFormat('US', {'type': 'E164'});
        let ran = Math.ceil(Math.random(1) * 9);
        console.log('i18n_phonenumberformat_test_3200 ' + ran);
        let value = phonenumber.format('626202337' + ran);
        console.log('i18n_phonenumberformat_test_3200 ' + value);
        expect(value).assertEqual('+1626202337' + ran);
    })

    /**
     * @tc.name   i18n_phonenumberformat_test_3300
     * @tc.number SUB_GLOBAL_I18N_PHONENUMBERFORMAT_JS_3300
     * @tc.desc   get the getLocationName value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('i18n_phonenumberformat_test_3300', Level.LEVEL2, function () {
        console.log('i18n_phonenumberformat_test_3300 ' + 'start');
        let phonenumber = new I18n.PhoneNumberFormat('CN');
        let ran = Math.ceil(Math.random(1) * 9);
        console.log('i18n_phonenumberformat_test_3300 ' + ran);
        let value = phonenumber.getLocationName('1351057467' + ran, 'zh-CN');
        console.log('i18n_phonenumberformat_test_3300 ' + value);
        expect(value == '中国' || value == '广东省深圳市').assertTrue();
    })

    /**
     * @tc.name   i18n_phonenumberformat_test_3400
     * @tc.number SUB_GLOBAL_I18N_PHONENUMBERFORMAT_JS_3400
     * @tc.desc   get the getLocationName value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('i18n_phonenumberformat_test_3400', Level.LEVEL2, function () {
        console.log('i18n_phonenumberformat_test_3400 ' + 'start');
        let phonenumber = new I18n.PhoneNumberFormat('CN');
        let ran = Math.ceil(Math.random(1) * 9);
        console.log('i18n_phonenumberformat_test_3400 ' + ran);
        let value = phonenumber.getLocationName('+861351057467' + ran, 'en-US');
        console.log('i18n_phonenumberformat_test_3400 ' + value);
        expect(value == 'China' || value == 'Shenzhen, Guangdong').assertTrue();
        let value2 = phonenumber.getLocationName('+86 1351057467' + ran, 'en-US');
        console.log('i18n_phonenumberformat_test_3400 ' + value2);
        expect(value2 == 'China' || value2 == 'Shenzhen, Guangdong').assertTrue();
    })

    /**
     * @tc.name   i18n_phonenumberformat_test_3500
     * @tc.number SUB_GLOBAL_I18N_PHONENUMBERFORMAT_JS_3500
     * @tc.desc   get the getLocationName value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('i18n_phonenumberformat_test_3500', Level.LEVEL2, function () {
        console.log('i18n_phonenumberformat_test_3500 ' + 'start');
        let phonenumber = new I18n.PhoneNumberFormat('CN');
        let ran = Math.ceil(Math.random(1) * 9);
        console.log('i18n_phonenumberformat_test_3500 ' + ran);
        let value1 = phonenumber.getLocationName('+861586661737' + ran, 'en-US');
        console.log('i18n_phonenumberformat_test_3500 ' + value1);
        expect(value1 == 'China' || value1 == 'Jinan, Shandong').assertTrue();
        let value2 = phonenumber.getLocationName('+86 1586661737' + ran, 'en-US');
        console.log('i18n_phonenumberformat_test_3500 ' + value2);
        expect(value2 == 'China' || value2 == 'Jinan, Shandong').assertTrue();
    })

    /**
     * @tc.name   i18n_phonenumberformat_test_3600
     * @tc.number SUB_GLOBAL_I18N_PHONENUMBERFORMAT_JS_3600
     * @tc.desc   get the getLocationName value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('i18n_phonenumberformat_test_3600', Level.LEVEL2, function () {
        console.log('i18n_phonenumberformat_test_3600 ' + 'start');
        let phonenumber = new I18n.PhoneNumberFormat('CN');
        let ran = Math.ceil(Math.random(1) * 9);
        console.log('i18n_phonenumberformat_test_3600 ' + ran);
        let value = phonenumber.getLocationName('027-5937411' + ran, 'zh-CN');
        console.log('i18n_phonenumberformat_test_3600 ' + value);
        expect(value == '中国' || value == '湖北省武汉市').assertTrue();
    })

    /**
     * @tc.name   i18n_phonenumberformat_test_3700
     * @tc.number SUB_GLOBAL_I18N_PHONENUMBERFORMAT_JS_3700
     * @tc.desc   get the getLocationName value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('i18n_phonenumberformat_test_3700', Level.LEVEL2, function () {
        console.log('i18n_phonenumberformat_test_3700 ' + 'start');
        let phonenumber = new I18n.PhoneNumberFormat('CN');
        let ran = Math.ceil(Math.random(1) * 9);
        console.log('i18n_phonenumberformat_test_3700 ' + ran);
        let value = phonenumber.getLocationName('0728-623797' + ran, 'zh-CN');
        console.log('i18n_phonenumberformat_test_3700 ' + value);
        expect(value == '中国' || value == '湖北省仙桃市').assertTrue();
    })

    /**
     * @tc.name   i18n_phonenumberformat_test_3800
     * @tc.number SUB_GLOBAL_I18N_PHONENUMBERFORMAT_JS_3800
     * @tc.desc   get the getLocationName value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('i18n_phonenumberformat_test_3800', Level.LEVEL2, function () {
        console.log('i18n_phonenumberformat_test_3800 ' + 'start');
        let phonenumber = new I18n.PhoneNumberFormat('CN');
        let ran = Math.ceil(Math.random(1) * 9);
        console.log('i18n_phonenumberformat_test_3800 ' + ran);
        let value1 = phonenumber.getLocationName('+3460724205' + ran, 'en-US');
        console.log('i18n_phonenumberformat_test_3800 ' + value1);
        expect(value1).assertEqual('Spain');
        let value2 = phonenumber.getLocationName('+34 60724205' + ran, 'en-US');
        console.log('i18n_phonenumberformat_test_3800 ' + value2);
        expect(value2).assertEqual('Spain');
    })

    /**
     * @tc.name   i18n_phonenumberformat_test_3900
     * @tc.number SUB_GLOBAL_I18N_PHONENUMBERFORMAT_JS_3900
     * @tc.desc   get the getLocationName value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('i18n_phonenumberformat_test_3900', Level.LEVEL2, function () {
        console.log('i18n_phonenumberformat_test_3900 ' + 'start');
        let phonenumber = new I18n.PhoneNumberFormat('CN');
        let ran = Math.ceil(Math.random(1) * 9);
        console.log('i18n_phonenumberformat_test_3900 ' + ran);
        let value = phonenumber.getLocationName('+39342652441' + ran, 'en-US');
        console.log('i18n_phonenumberformat_test_3900 ' + value);
        expect(value).assertEqual('Italy');
        let value2 = phonenumber.getLocationName('+39 342652441' + ran, 'en-US');
        console.log('i18n_phonenumberformat_test_3900 ' + value2);
        expect(value2).assertEqual('Italy');
    })

    /**
     * @tc.name   i18n_phonenumberformat_test_4000
     * @tc.number SUB_GLOBAL_I18N_PHONENUMBERFORMAT_JS_4000
     * @tc.desc   get the getLocationName value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('i18n_phonenumberformat_test_4000', Level.LEVEL2, function () {
        console.log('i18n_phonenumberformat_test_4000 ' + 'start');
        let phonenumber = new I18n.PhoneNumberFormat('CN');
        let ran = Math.ceil(Math.random(1) * 9);
        console.log('i18n_phonenumberformat_test_4000 ' + ran);
        let value = phonenumber.getLocationName('+39342652441' + ran, 'zh-CN');
        console.log('i18n_phonenumberformat_test_4000 ' + value);
        expect(value).assertEqual('意大利');
        let value2 = phonenumber.getLocationName('+39 342652441' + ran, 'zh-CN');
        console.log('i18n_phonenumberformat_test_4000 ' + value2);
        expect(value2).assertEqual('意大利');
    })

    /**
     * @tc.name   i18n_phonenumberformat_test_4100
     * @tc.number SUB_GLOBAL_I18N_PHONENUMBERFORMAT_JS_4100
     * @tc.desc   get the getLocationName value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('i18n_phonenumberformat_test_4100', Level.LEVEL2, function () {
        console.log('i18n_phonenumberformat_test_4100 ' + 'start');
        let phonenumber = new I18n.PhoneNumberFormat('CN');
        let ran = Math.ceil(Math.random(1) * 9);
        console.log('i18n_phonenumberformat_test_4100 ' + ran);
        let value1 = phonenumber.getLocationName('+3460724205' + ran, 'zh-CN');
        console.log('i18n_phonenumberformat_test_4100 ' + value1);
        expect(value1).assertEqual('西班牙');
        let value2 = phonenumber.getLocationName('+34 60724205' + ran, 'zh-CN');
        console.log('i18n_phonenumberformat_test_4100 ' + value2);
        expect(value2).assertEqual('西班牙');
    })

    console.log('*************end PhoneNumberFormatInI18nTest*************');
})}
