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

export default function NormalizerInI18nTest() {
describe('NormalizerInI18nTest', function () {
    console.log('*************start NormalizerInI18nTest*************');

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
    * @tc.number SUB_GLOBAL_I18N_NORMALIZE_JS_0100
    * @tc.name   normalize the '1e9b 0323' in NFC mode
    * @tc.desc   get the NFC mode value
    */
     it('i18n_normalizer_test_0100', Level.LEVEL0, function () {
        console.log('i18n_normalizer_test_0100 ' + 'start');
        let str = '\u1e9b\u0323';
        let normal = I18n.Normalizer.getInstance(I18n.NormalizerMode.NFC);
        let value = normal.normalize(str);
        console.log('i18n_normalizer_test_0100 ' + value);
        expect(value).assertEqual('\u1e9b\u0323');
    })

    /**
     * @tc.number SUB_GLOBAL_I18N_NORMALIZE_JS_0200
     * @tc.name   normalize the '1e9b 0323' in NFD mode
     * @tc.desc   get the NFD mode value
     */
    it('i18n_normalizer_test_0200', Level.LEVEL2, function () {
        console.log('i18n_normalizer_test_0200 ' + 'start');
        let str = '\u1e9b\u0323';
        let normal = I18n.Normalizer.getInstance(I18n.NormalizerMode.NFD);
        let value = normal.normalize(str);
        console.log('i18n_normalizer_test_0200 ' + value);
        expect(value).assertEqual('\u017f\u0323\u0307');
    })

    /**
     * @tc.number SUB_GLOBAL_I18N_NORMALIZE_JS_0300
     * @tc.name   normalize the '1e9b 0323' in NFKC mode
     * @tc.desc   get the NFKC mode value
     */
    it('i18n_normalizer_test_0300', Level.LEVEL2, function () {
        console.log('i18n_normalizer_test_0300 ' + 'start');
        let str = '\u1e9b\u0323';
        let normal = I18n.Normalizer.getInstance(I18n.NormalizerMode.NFKC);
        let value = normal.normalize(str);
        console.log('i18n_normalizer_test_0300 ' + value);
        expect(value).assertEqual('\u1e69');
    })

    /**
     * @tc.number SUB_GLOBAL_I18N_NORMALIZE_JS_0400
     * @tc.name   normalize the '1e9b 0323' in NFKD mode
     * @tc.desc   get the NFKD mode value
     */
    it('i18n_normalizer_test_0400', Level.LEVEL0, function () {
        console.log('i18n_normalizer_test_0400 ' + 'start');
        let str = '\u1e9b\u0323';
        let normal = I18n.Normalizer.getInstance(I18n.NormalizerMode.NFKD);
        let value = normal.normalize(str);
        console.log('i18n_normalizer_test_0400 ' + value);
        expect(value).assertEqual('\u0073\u0323\u0307');
    })

    /**
     * @tc.number SUB_GLOBAL_I18N_NORMALIZE_JS_0500
     * @tc.name   normalize the '0032 2075' in NFC mode
     * @tc.desc   get the NFC mode value
     */
    it('i18n_normalizer_test_0500', Level.LEVEL2, function () {
        console.log('i18n_normalizer_test_0500 ' + 'start');
        let str = '\u0032\u2075';
        let normal = I18n.Normalizer.getInstance(I18n.NormalizerMode.NFC);
        let value = normal.normalize(str);
        console.log('i18n_normalizer_test_0500 ' + value);
        expect(value).assertEqual('\u0032\u2075');
    })

    /**
     * @tc.number SUB_GLOBAL_I18N_NORMALIZE_JS_0600
     * @tc.name   normalize the '0032 2075' in NFD mode
     * @tc.desc   get the NFD mode value
     */
    it('i18n_normalizer_test_0600', Level.LEVEL2, function () {
        console.log('i18n_normalizer_test_0600 ' + 'start');
        let str = '\u0032\u2075';
        let normal = I18n.Normalizer.getInstance(I18n.NormalizerMode.NFD);
        let value = normal.normalize(str);
        console.log('i18n_normalizer_test_0600 ' + value);
        expect(value).assertEqual('\u0032\u2075');
    })

    /**
     * @tc.number SUB_GLOBAL_I18N_NORMALIZE_JS_0700
     * @tc.name   normalize the '0032 2075' in NFKC mode
     * @tc.desc   get the NFKC mode value
     */
    it('i18n_normalizer_test_0700', Level.LEVEL2, function () {
        console.log('i18n_normalizer_test_0700 ' + 'start');
        let str = '\u0032\u2075';
        let normal = I18n.Normalizer.getInstance(I18n.NormalizerMode.NFKC);
        let value = normal.normalize(str);
        console.log('i18n_normalizer_test_0700 ' + value);
        expect(value).assertEqual('\u0032\u0035');
    })

    /**
     * @tc.number SUB_GLOBAL_I18N_NORMALIZE_JS_0800
     * @tc.name   normalize the '0032 2075' in NFKD mode
     * @tc.desc   get the NFKD mode value
     */
    it('i18n_normalizer_test_0800', Level.LEVEL2, function () {
        console.log('i18n_normalizer_test_0800 ' + 'start');
        let str = '\u0032\u2075';
        let normal = I18n.Normalizer.getInstance(I18n.NormalizerMode.NFKD);
        let value = normal.normalize(str);
        console.log('i18n_normalizer_test_0800 ' + value);
        expect(value).assertEqual('\u0032\u0035');
    })

    /**
     * @tc.number SUB_GLOBAL_I18N_NORMALIZE_JS_0900
     * @tc.name getInstance method return 401 error code
     * @tc.desc test the getInstance error code
     */
     it('i18n_normalizer_test_0900', Level.LEVEL3, function () {
        console.log('i18n_normalizer_test_0900 ' + 'start');
        let str = '\u0032\u2075';
        try{
            let normal = I18n.Normalizer.getInstance(0);
        }catch(error){
            console.log('i18n_normalizer_test_0900 ' + error.code);
            console.log('i18n_normalizer_test_0900 ' + error.message);
            expect(error.code == 401).assertTrue();
        }
    })

    /**
     * @tc.number SUB_GLOBAL_I18N_NORMALIZE_JS_1000
     * @tc.name normalize method return 401 error code
     * @tc.desc test the normalize error code
     */
    it('i18n_normalizer_test_1000', Level.LEVEL3, function () {
        console.log('i18n_normalizer_test_1000 ' + 'start');
        let str = '\u0032\u2075';
        let normal = I18n.Normalizer.getInstance(1);
        try{
            let value = normal.normalize(1234);
        }catch(error){
            console.log('i18n_normalizer_test_1000 ' + error.code);
            console.log('i18n_normalizer_test_1000 ' + error.message);
            expect(error.code == 401).assertTrue();
        }
    })

    console.log('*************end NormalizerInI18nTest*************');
})}
