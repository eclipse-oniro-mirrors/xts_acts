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

export default function CharacterInI18nTest() {
describe('CharacterInI18nTest', function () {
    console.log('*************start CharacterInI18nTest*************');

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
    * @tc.number  SUB_GLOBAL_I18N_JS_CHARACTER_1100
    * @tc.name    test isDigit interface
    * @tc.desc    check the isDigit interface
    */
    it('i18n_test_character_1100', Level.LEVEL0, function () {
        console.log('i18n_test_character_1100 ' + 'start');
        let character = new I18n.Character();
        let value = character.isDigit('abc');
        console.log('i18n_test_character_1100 ' + value);
        expect(value).assertFalse();
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_CHARACTER_1120
    * @tc.name    test isDigit interface with 123 param
    * @tc.desc    check the isDigit interface
    */
    it('i18n_test_character_1120', Level.LEVEL2, function () {
        console.log('i18n_test_character_1120 ' + 'start');
        let character = new I18n.Character();
        let value = character.isDigit('123');
        console.log('i18n_test_character_1120 ' + value);
        expect(value).assertTrue();
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_CHARACTER_1140
    * @tc.name    test isDigit interface with 123abc param
    * @tc.desc    check the isDigit interface
    */
    it('i18n_test_character_1140', Level.LEVEL2, function () {
        console.log('i18n_test_character_1140 ' + 'start');
        let character = new I18n.Character();
        let value = character.isDigit('123abc');
        console.log('i18n_test_character_1140 ' + value);
        expect(value).assertTrue();
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_CHARACTER_1150
    * @tc.name    test isDigit interface with abc123 param
    * @tc.desc    check the isDigit interface
    */
    it('i18n_test_character_1150', Level.LEVEL2, function () {
        console.log('i18n_test_character_1150 ' + 'start');
        let character = new I18n.Character();
        let value = character.isDigit('abc123');
        console.log('i18n_test_character_1150 ' + value);
        expect(value).assertFalse();
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_CHARACTER_1160
    * @tc.name    test isDigit interface with null param
    * @tc.desc    check the isDigit interface
    */
    it('i18n_test_character_1160', Level.LEVEL2, function () {
        console.log('i18n_test_character_1160 ' + 'start');
        let character = new I18n.Character();
        let value = character.isDigit('');
        console.log('i18n_test_character_1160 ' + value);
        expect(value).assertFalse();
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_CHARACTER_1200
    * @tc.name    test isSpaceChar interface with abc param
    * @tc.desc    check the isSpaceChar interface
    */
    it('i18n_test_character_1200', Level.LEVEL0, function () {
        console.log('i18n_test_character_1200 ' + 'start');
        let character = new I18n.Character();
        let value = character.isSpaceChar('abc');
        console.log('i18n_test_character_1200 ' + value);
        expect(value).assertFalse();
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_CHARACTER_1220
    * @tc.name    test isSpaceChar interface with one space param
    * @tc.desc    check the isSpaceChar interface
    */
    it('i18n_test_character_1220', Level.LEVEL2, function () {
        console.log('i18n_test_character_1220 ' + 'start');
        let character = new I18n.Character();
        let value = character.isSpaceChar(' ');
        console.log('i18n_test_character_1220 ' + value);
        expect(value).assertTrue();
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_CHARACTER_1240
    * @tc.name    test isSpaceChar interface with multi space param
    * @tc.desc    check the isSpaceChar interface
    */
    it('i18n_test_character_1240', Level.LEVEL2, function () {
        console.log('i18n_test_character_1240 ' + 'start');
        let character = new I18n.Character();
        let value = character.isSpaceChar('   ');
        console.log('i18n_test_character_1240--' + value + '--');
        expect(value).assertTrue();
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_CHARACTER_1300
    * @tc.name    test isWhitespace interface with abc param
    * @tc.desc    check the isWhitespace interface
    */
    it('i18n_test_character_1300', Level.LEVEL0, function () {
        console.log('i18n_test_character_1300 ' + 'start');
        let character = new I18n.Character();
        let value = character.isWhitespace('abc');
        console.log('i18n_test_character_1300 ' + value);
        expect(value).assertFalse();
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_CHARACTER_1320
    * @tc.name    test isWhitespace interface with \u0009 param
    * @tc.desc    check the isWhitespace interface
    */
    it('i18n_test_character_1320', Level.LEVEL2, function () {
        console.log('i18n_test_character_1320 ' + 'start');
        let character = new I18n.Character();
        let value = character.isWhitespace('\u0009');
        console.log('i18n_test_character_1320--' + value + '--');
        expect(value).assertTrue();
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_CHARACTER_1400
    * @tc.name    test isRTL interface with abc param
    * @tc.desc    check the isRTL interface
    */
    it('i18n_test_character_1400', Level.LEVEL0, function () {
        console.log('i18n_test_character_1400 ' + 'start');
        let character = new I18n.Character();
        let value = character.isRTL('abc');
        console.log('i18n_test_character_1400 ' + value);
        expect(value).assertFalse();
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_CHARACTER_1420
    * @tc.name    test isRTL interface with ١٢٣٤٥٦٧ param
    * @tc.desc    check the isRTL interface
    */
    it('i18n_test_character_1420', Level.LEVEL2, function () {
        console.log('i18n_test_character_1420 ' + 'start');
        let character = new I18n.Character();
        let value = character.isRTL('١٢٣٤٥٦٧');
        console.log('i18n_test_character_1420 ' + value);
        expect(value).assertFalse();
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_CHARACTER_1440
    * @tc.name    test isRTL interface with 我是小明 param
    * @tc.desc    check the isRTL interface
    */
    it('i18n_test_character_1440', Level.LEVEL2, function () {
        console.log('i18n_test_character_1440 ' + 'start');
        let character = new I18n.Character();
        let value = character.isRTL('我是小明');
        console.log('i18n_test_character_1440 ' + value);
        expect(value).assertFalse();
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_CHARACTER_1460
    * @tc.name    test isRTL interface with نحن param
    * @tc.desc    check the isRTL interface
    */
    it('i18n_test_character_1460', Level.LEVEL2, function () {
        console.log('i18n_test_character_1460 ' + 'start');
        let character = new I18n.Character();
        let value = character.isRTL('نحن');
        console.log('i18n_test_character_1460 ' + value);
        expect(value).assertTrue();
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_CHARACTER_1500
    * @tc.name    test isIdeograph interface with abc param
    * @tc.desc    check the isIdeograph interface
    */
    it('i18n_test_character_1500', Level.LEVEL2, function () {
        console.log('i18n_test_character_1500 ' + 'start');
        let character = new I18n.Character();
        let value = character.isIdeograph('abc');
        console.log('i18n_test_character_1500 ' + value);
        expect(value).assertFalse();
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_CHARACTER_1520
    * @tc.name    test isIdeograph interface with '我' param
    * @tc.desc    check the isIdeograph interface
    */
    it('i18n_test_character_1520', Level.LEVEL2, function () {
        console.log('i18n_test_character_1520 ' + 'start');
        let character = new I18n.Character();
        let value = character.isIdeograph('我');
        console.log('i18n_test_character_1520 ' + value);
        expect(value).assertTrue();
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_CHARACTER_1540
    * @tc.name    test isIdeograph interface with '우리' param
    * @tc.desc    check the isIdeograph interface
    */
    it('i18n_test_character_1540', Level.LEVEL2, function () {
        console.log('i18n_test_character_1540 ' + 'start');
        let character = new I18n.Character();
        let value = character.isIdeograph('우리');
        console.log('i18n_test_character_1540 ' + value);
        expect(value).assertFalse();
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_CHARACTER_1560
    * @tc.name    test isIdeograph interface with '私た' param
    * @tc.desc    check the isIdeograph interface
    */
    it('i18n_test_character_1560', Level.LEVEL2, function () {
        console.log('i18n_test_character_1560 ' + 'start');
        let character = new I18n.Character();
        let value = character.isIdeograph('私たち');
        console.log('i18n_test_character_1560 ' + value);
        expect(value).assertTrue();
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_CHARACTER_1600
    * @tc.name    test isLetter interface with abc param
    * @tc.desc    check the isLetter interface
    */
    it('i18n_test_character_1600', Level.LEVEL0, function () {
        console.log('i18n_test_character_1600 ' + 'start');
        let character = new I18n.Character();
        let value = character.isLetter('abc');
        console.log('i18n_test_character_1600 ' + value);
        expect(value).assertTrue();
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_CHARACTER_1620
    * @tc.name    test isLetter interface with 123 param
    * @tc.desc    check the isLetter interface
    */
    it('i18n_test_character_1620', Level.LEVEL2, function () {
        console.log('i18n_test_character_1620 ' + 'start');
        let character = new I18n.Character();
        let value = character.isLetter('123');
        console.log('i18n_test_character_1620 ' + value);
        expect(value).assertFalse();
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_CHARACTER_1640
    * @tc.name    test isLetter interface with abc123 param
    * @tc.desc    check the isLetter interface
    */
    it('i18n_test_character_1640', Level.LEVEL2, function () {
        console.log('i18n_test_character_1640 ' + 'start');
        let character = new I18n.Character();
        let value = character.isLetter('abc123');
        console.log('i18n_test_character_1640 ' + value);
        expect(value).assertTrue();
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_CHARACTER_1660
    * @tc.name    test isLetter interface with 123abc param
    * @tc.desc    check the isLetter interface
    */
    it('i18n_test_character_1660', Level.LEVEL2, function () {
        console.log('i18n_test_character_1660 ' + 'start');
        let character = new I18n.Character();
        let value = character.isLetter('123abc');
        console.log('i18n_test_character_1660 ' + value);
        expect(value).assertFalse();
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_CHARACTER_1700
    * @tc.name    test isLowerCase interface with abc param
    * @tc.desc    check the isLowerCase interface
    */
    it('i18n_test_character_1700', Level.LEVEL0, function () {
        console.log('i18n_test_character_1700 ' + 'start');
        let character = new I18n.Character();
        let value = character.isLowerCase('abc');
        console.log('i18n_test_character_1700 ' + value);
        expect(value).assertTrue();
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_CHARACTER_1720
    * @tc.name    ftest isLowerCase interface with ABC param
    * @tc.desc    check the isLowerCase interface
    */
    it('i18n_test_character_1720', Level.LEVEL2, function () {
        console.log('i18n_test_character_1720 ' + 'start');
        let character = new I18n.Character();
        let value = character.isLowerCase('ABC');
        console.log('i18n_test_character_1720 ' + value);
        expect(value).assertFalse();
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_CHARACTER_1740
    * @tc.name    test isLowerCase interface with abcDEF param
    * @tc.desc    check the isLowerCase interface
    */
    it('i18n_test_character_1740', Level.LEVEL2, function () {
        console.log('i18n_test_character_1740 ' + 'start');
        let character = new I18n.Character();
        let value = character.isLowerCase('abcDEF');
        console.log('i18n_test_character_1740 ' + value);
        expect(value).assertTrue();
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_CHARACTER_1760
    * @tc.name    test isLowerCase interface with ABCdef param
    * @tc.desc    check the isLowerCase interface
    */
    it('i18n_test_character_1760', Level.LEVEL2, function () {
        console.log('i18n_test_character_1760 ' + 'start');
        let character = new I18n.Character();
        let value = character.isLowerCase('ABCdef');
        console.log('i18n_test_character_1760 ' + value);
        expect(value).assertFalse();
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_CHARACTER_1800
    * @tc.name    test isUpperCase interface with ABC param
    * @tc.desc    check the isUpperCase interface
    */
    it('i18n_test_character_1800', Level.LEVEL0, function () {
        console.log('i18n_test_character_1800 ' + 'start');
        let character = new I18n.Character();
        let value = character.isUpperCase('ABC');
        console.log('i18n_test_character_1800 ' + value);
        expect(value).assertTrue();
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_CHARACTER_1820
    * @tc.name    test isUpperCase interface with abc param
    * @tc.desc    check the isUpperCase interface
    */
    it('i18n_test_character_1820', Level.LEVEL2, function () {
        console.log('i18n_test_character_1820 ' + 'start');
        let character = new I18n.Character();
        let value = character.isUpperCase('abc');
        console.log('i18n_test_character_1820 ' + value);
        expect(value).assertFalse();
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_CHARACTER_1840
    * @tc.name    test isUpperCase interface with ABCdef param
    * @tc.desc    check the isUpperCase interface
    */
    it('i18n_test_character_1840', Level.LEVEL2, function () {
        console.log('i18n_test_character_1840 ' + 'start');
        let character = new I18n.Character();
        let value = character.isUpperCase('ABCdef');
        console.log('i18n_test_character_1840 ' + value);
        expect(value).assertTrue();
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_CHARACTER_1860
    * @tc.name    test isUpperCase interface with abcDEF param
    * @tc.desc    check the isUpperCase interface
    */
    it('i18n_test_character_1860', Level.LEVEL2, function () {
        console.log('i18n_test_character_1860 ' + 'start');
        let character = new I18n.Character();
        let value = character.isUpperCase('abcDEF');
        console.log('i18n_test_character_1860 ' + value);
        expect(value).assertFalse();
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_CHARACTER_1900
    * @tc.name    test getType interface with a param
    * @tc.desc    check the getType interface
    */
    it('i18n_test_character_1900', Level.LEVEL0, function () {
        console.log('i18n_test_character_1900 ' + 'start');
        let character = new I18n.Character();
        let value = character.getType('a');
        console.log('i18n_test_character_1900 ' + value);
        expect(value).assertEqual('U_LOWERCASE_LETTER');
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_CHARACTER_1920
    * @tc.name    ftest getType interface with ABC param
    * @tc.desc    check the getType interface
    */
    it('i18n_test_character_1920', Level.LEVEL2, function () {
        console.log('i18n_test_character_1920 ' + 'start');
        let character = new I18n.Character();
        let value = character.getType('ABC');
        console.log('i18n_test_character_1920 ' + value);
        expect(value).assertEqual('U_UPPERCASE_LETTER');
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_CHARACTER_1940
    * @tc.name    test getType interface with ABCdef param
    * @tc.desc    check the getType interface
    */
    it('i18n_test_character_1940', Level.LEVEL2, function () {
        console.log('i18n_test_character_1940 ' + 'start');
        let character = new I18n.Character();
        let value = character.getType('ABCdef');
        console.log('i18n_test_character_1940 ' + value);
        expect(value).assertEqual('U_UPPERCASE_LETTER');
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_CHARACTER_1960
    * @tc.name    test getType interface with 123 param
    * @tc.desc    check the getType interface
    */
    it('i18n_test_character_1960', Level.LEVEL2, function () {
        console.log('i18n_test_character_1960 ' + 'start');
        let character = new I18n.Character();
        let value = character.getType('123');
        console.log('i18n_test_character_1960 ' + value);
        expect(value).assertEqual('U_DECIMAL_DIGIT_NUMBER');
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_CHARACTER_1970
    * @tc.name    test getType interface with 123abc param
    * @tc.desc    check the getType interface
    */
    it('i18n_test_character_1970', Level.LEVEL2, function () {
        console.log('i18n_test_character_1970 ' + 'start');
        let character = new I18n.Character();
        let value = character.getType('123abc');
        console.log('i18n_test_character_1970 ' + value);
        expect(value).assertEqual('U_DECIMAL_DIGIT_NUMBER');
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_CHARACTER_1980
    * @tc.name    test getType interface with ١٢٣٤٥٦٧ param
    * @tc.desc    check the getType interface
    */
    it('i18n_test_character_1980', Level.LEVEL2, function () {
        console.log('i18n_test_character_1980 ' + 'start');
        let character = new I18n.Character();
        let value = character.getType('١٢٣٤٥٦٧');
        console.log('i18n_test_character_1980 ' + value);
        expect(value).assertEqual('U_DECIMAL_DIGIT_NUMBER');
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_CHARACTER_1990
    * @tc.name    test getType interface with multi space param
    * @tc.desc    check the getType interface
    */
    it('i18n_test_character_1990', Level.LEVEL2, function () {
        console.log('i18n_test_character_1990 ' + 'start');
        let character = new I18n.Character();
        let value = character.getType('   ');
        console.log('i18n_test_character_1990 ' + value);
        expect(value).assertEqual('U_SPACE_SEPARATOR');
    })

    console.log('*************end CharacterInI18nTest*************');
})}
