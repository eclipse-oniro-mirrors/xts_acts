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

export default function TransliteratorInI18nTest() {
describe('TransliteratorInI18nTest', function () {
    console.log('*************start TransliteratorInI18nTest*************');

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
     * @tc.name   transliterator_test_0100
     * @tc.number SUB_GLOBAL_I18N_JS_TRANSLITERATOR_0100
     * @tc.desc   get the ID value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('transliterator_test_0100', Level.LEVEL0, function () {
        console.log('transliterator_test_0100 ' + 'start');
        let value = I18n.Transliterator.getAvailableIDs();
        let len = value.length;
        console.log('transliterator_test_0100 ' + value);
        console.log('transliterator_test_0100 ' + len);
        expect(value !== null).assertTrue();
        expect(len > 0).assertTrue();
        while (len > 0)
        {
            console.log('transliterator_test_0100 ' + value[len-1]);
            len--;
        }
    })

    /**
     * @tc.name   transliterator_test_0200
     * @tc.number SUB_GLOBAL_I18N_JS_TRANSLITERATOR_0200
     * @tc.desc   get the instance value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('transliterator_test_0200', Level.LEVEL2, function () {
        console.log('transliterator_test_0200 ' + 'start');
        let value = I18n.Transliterator.getInstance('a');
        console.log('transliterator_test_0200 ' + value);
        expect(value !== null).assertTrue();
    })

    /**
     * @tc.name   transliterator_test_0300
     * @tc.number SUB_GLOBAL_I18N_JS_TRANSLITERATOR_0300
     * @tc.desc   get the transform value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('transliterator_test_0300', Level.LEVEL2, function () {
        console.log('transliterator_test_0300 ' + 'start');
        let trans = I18n.Transliterator.getInstance('Any-Accents');
        let value = trans.transform('中国');
        console.log('transliterator_test_0300 ' + value);
        expect(value).assertEqual('中国');
    })

    /**
     * @tc.name   transliterator_test_0400
     * @tc.number SUB_GLOBAL_I18N_JS_TRANSLITERATOR_0400
     * @tc.desc   get the transform value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('transliterator_test_0400', Level.LEVEL2, function () {
        console.log('transliterator_test_0400 ' + 'start');
        let trans = I18n.Transliterator.getInstance('Any-Latn');
        let value = trans.transform('中国');
        console.log('transliterator_test_0400 ' + value);
        expect(value).assertEqual('zhōng guó');
    })

    /**
     * @tc.name   transliterator_test_0500
     * @tc.number SUB_GLOBAL_I18N_JS_TRANSLITERATOR_0500
     * @tc.desc   get the transform value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('transliterator_test_0500', Level.LEVEL2, function () {
        console.log('transliterator_test_0500 ' + 'start');
        let trans = I18n.Transliterator.getInstance('Any-Thai');
        let value = trans.transform('中国');
        console.log('transliterator_test_0500 ' + value);
        expect(value).assertEqual('中国');
    })

    /**
     * @tc.name   transliterator_test_0600
     * @tc.number SUB_GLOBAL_I18N_JS_TRANSLITERATOR_0600
     * @tc.desc   get the transform value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('transliterator_test_0600', Level.LEVEL2, function () {
        console.log('transliterator_test_0600 ' + 'start');
        let trans = I18n.Transliterator.getInstance('Any-zh');
        let value = trans.transform('nihao');
        console.log('transliterator_test_0600 ' + value);
        expect(value).assertEqual('nihao');
    })

    /**
     * @tc.name   transliterator_test_0700
     * @tc.number SUB_GLOBAL_I18N_JS_TRANSLITERATOR_0700
     * @tc.desc   get the transform value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('transliterator_test_0700', Level.LEVEL2, function () {
        console.log('transliterator_test_0700 ' + 'start');
        let trans = I18n.Transliterator.getInstance('Any-Hant');
        let value = trans.transform('hello');
        console.log('transliterator_test_0700 ' + value);
        expect(value).assertEqual('hello');
    })

    /**
     * @tc.name   transliterator_test_0800
     * @tc.number SUB_GLOBAL_I18N_JS_TRANSLITERATOR_0800
     * @tc.desc   get the transform value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('transliterator_test_0800', Level.LEVEL2, function () {
        console.log('transliterator_test_0800 ' + 'start');
        let trans = I18n.Transliterator.getInstance('Any-Kannada');
        let value = trans.transform('hello');
        console.log('transliterator_test_0800 ' + value);
        expect(value).assertEqual('ಹೆಲ್ಲೊ');
    })

    console.log('*************end TransliteratorInI18nTest*************');
})}
