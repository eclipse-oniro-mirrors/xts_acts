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

export default function BreakIteratorInI18nTest() {
describe('BreakIteratorInI18nTest', function () {
    console.log('*************start BreakIteratorInI18nTest*************');

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
    * @tc.number  SUB_GLOBAL_I18N_JS_BREAKITERATOR_0100
    * @tc.name    test current interface
    * @tc.desc    check the current result
    */
    it('i18n_test_iterator_0100', 0, function () {
        console.log('i18n_test_iterator_0100 ' + 'start');
        let iterator =I18n.getLineInstance('en');
        iterator.setLineBreakText('My name is Tom.Welcome to the sky world.');
        let value = iterator.current();
        console.log('i18n_test_iterator_0100 ' + value);
        expect(value).assertEqual(0);
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_BREAKITERATOR_0200
    * @tc.name    test first interface
    * @tc.desc    check the first
    */
    it('i18n_test_iterator_0200', 0, function () {
        console.log('i18n_test_iterator_0200 ' + 'start');
        let iterator =I18n.getLineInstance('en');
        iterator.setLineBreakText('My name is Tom.Welcome to the sky world.');
        let value = iterator.first();
        console.log('i18n_test_iterator_0200 ' + value);
        expect(value).assertEqual(0);
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_BREAKITERATOR_0300
    * @tc.name    test last interface
    * @tc.desc    check the last interface
    */
    it('i18n_test_iterator_0300', 0, function () {
        console.log('i18n_test_iterator_0300 ' + 'start');
        let iterator =I18n.getLineInstance('en');
        iterator.setLineBreakText('My name is Tom.Welcome to the sky world.');
        let value = iterator.last();
        console.log('i18n_test_iterator_0300 ' + value);
        expect(value).assertEqual(40);
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_BREAKITERATOR_0400
    * @tc.name    test next interface
    * @tc.desc    check the next interface
    */
    it('i18n_test_iterator_0400', 0, function () {
        console.log('i18n_test_iterator_0400 ' + 'start');
        let iterator =I18n.getLineInstance('en');
        iterator.setLineBreakText('My name is Tom.Welcome to the sky world.');
        let value = iterator.next();
        console.log('i18n_test_iterator_0400 ' + value);
        expect(value).assertEqual(3);
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_BREAKITERATOR_0500
    * @tc.name    test next interface with param
    * @tc.desc    check the next interface with param
    */
    it('i18n_test_iterator_0500', 0, function () {
        console.log('i18n_test_iterator_0500 ' + 'start');
        let iterator =I18n.getLineInstance('en');
        iterator.setLineBreakText('My name is Tom.Welcome to the sky world.');
        let value = iterator.next(2);
        console.log('i18n_test_iterator_0500 ' + value);
        expect(value).assertEqual(8);
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_BREAKITERATOR_0600
    * @tc.name    test previous interface
    * @tc.desc    check the previous interface
    */
    it('i18n_test_iterator_0600', 0, function () {
        console.log('i18n_test_iterator_0600 ' + 'start');
        let iterator =I18n.getLineInstance('en');
        iterator.setLineBreakText('My name is Tom.Welcome to the sky world.');
        let value = iterator.previous();
        console.log('i18n_test_iterator_0600 ' + value);
        expect(value).assertEqual(-1);
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_BREAKITERATOR_0700
    * @tc.name    test following interface
    * @tc.desc    check the following interface
    */
    it('i18n_test_iterator_0700', 0, function () {
        console.log('i18n_test_iterator_0700 ' + 'start');
        let iterator =I18n.getLineInstance('en');
        iterator.setLineBreakText('My name is Tom.Welcome to the sky world.');
        let value = iterator.following(1);
        console.log('i18n_test_iterator_0700 ' + value);
        expect(value).assertEqual(3);
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_BREAKITERATOR_0800
    * @tc.name    test getLineBreakText interface
    * @tc.desc    check the getLineBreakText interface
    */
    it('i18n_test_iterator_0800', 0, function () {
        console.log('i18n_test_iterator_0800 ' + 'start');
        let iterator =I18n.getLineInstance('en');
        iterator.setLineBreakText('My name is Tom.Welcome to the sky world.');
        let value = iterator.getLineBreakText();
        console.log('i18n_test_iterator_0800 ' + value);
        expect(value).assertEqual('My name is Tom.Welcome to the sky world.');
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_BREAKITERATOR_0900
    * @tc.name    test isBoundary interface
    * @tc.desc    check the isBoundary interface
    */
    it('i18n_test_iterator_0900', 0, function () {
        console.log('i18n_test_iterator_0900 ' + 'start');
        let iterator =I18n.getLineInstance('en');
        iterator.setLineBreakText('My name is Tom.Welcome to the sky world.');
        let value = iterator.isBoundary(10);
        console.log('i18n_test_iterator_0900 ' + value);
        expect(value).assertFalse();
        // current
        let current = iterator.current();
        console.log('i18n_test_iterator_0900 ' + current);
        expect(current).assertEqual(11);
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_BREAKITERATOR_1000
    * @tc.name    test iterator interface
    * @tc.desc    check the iterator interface
    */
    it('i18n_test_iterator_1000', 0, function () {
        console.log('i18n_test_iterator_1000 ' + 'start');
        let iterator =I18n.getLineInstance('en');
        iterator.setLineBreakText('My name is Tom.Welcome to the sky world.');
        // current
        let current = iterator.current();
        console.log('i18n_test_iterator_1000 ' + current);
        expect(current).assertEqual(0);
        // next
        let next = iterator.next();
        console.log('i18n_test_iterator_1000 ' + next);
        expect(next).assertEqual(3);
        // current
        let current2 = iterator.current();
        console.log('i18n_test_iterator_1000 ' + current2);
        expect(current2).assertEqual(3);
        // next 5
        let next2 = iterator.next(5);
        console.log('i18n_test_iterator_1000 ' + next2);
        expect(next2).assertEqual(30);
        // previous
        let previous = iterator.previous();
        console.log('i18n_test_iterator_1000 ' + previous);
        expect(previous).assertEqual(26);
        // following 2
        let follwoing = iterator.following(3);
        console.log('i18n_test_iterator_1000 ' + follwoing);
        expect(follwoing).assertEqual(8);
        // current
        let current3 = iterator.current();
        console.log('i18n_test_iterator_1000 ' + current3);
        expect(current3).assertEqual(8);
        // isBoundary
        let value = iterator.isBoundary(3);
        console.log('i18n_test_iterator_1000 ' + value);
        expect(value).assertTrue();
        // current
        let current4 = iterator.current();
        console.log('i18n_test_iterator_1000 ' + current4);
        expect(current4).assertEqual(3);
    })

    console.log('*************end BreakIteratorInI18nTest*************');
})}
