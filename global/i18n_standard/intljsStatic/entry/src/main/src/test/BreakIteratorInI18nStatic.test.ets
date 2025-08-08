/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
import Ability from '@ohos.app.ability.UIAbility'
import {
  describe,
  it,
  expect,
  TestType,
  Size,
  Level,
  beforeAll,
  afterEach,
  beforeEach,
  afterAll
} from "../../../hypium/index";
import { BusinessError } from '@ohos.base';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import hilog from '@ohos.hilog'
import i18n from '@ohos.i18n'
import deviceInfo from '@ohos.deviceInfo'
import intl from '@ohos.intl'

let domain: number = 0x0000;
let tag: string = 'testTag';

export default function BreakIteratorInI18nTest() {

  describe("BreakIteratorInI18nTest", (): void => {
    hilog.info(0x0000, 'testTag', '%{public}s', '*************start i18nStageTest*************');

    beforeAll(async () => {
      console.info("beforeAll case");
    });
    beforeEach(() => {
      console.info("beforeEach case");
    });
    afterEach(async () => {
      console.info("afterEach case");
    });
    afterAll(() => {
      console.info("afterAll case");
    });

    /* *
    * @tc.number  i18n_test_iterator_static_0100
    * @tc.name    i18n_test_iterator_static_0100
    * @tc.desc    test current interface
    */
    it('i18n_test_iterator_static_0100', Level.LEVEL0, async (): Promise<void> => {
      console.log('i18n_test_iterator_static_0100 ' + 'start');
      let iterator = i18n.getLineInstance('en');
      iterator.setLineBreakText('My name is Tom.Welcome to the sky world.');
      let value = iterator.current();
      console.log('i18n_test_iterator_static_0100 ' + value);
      expect(value).assertEqual(0);
    })


    /* *
     * @tc.number  SUB_GLOBAL_I18N_JS_BREAKITERATOR_static_0200
     * @tc.name    i18n_test_iterator_static_0200
     * @tc.desc    test first interface
     */
    it('i18n_test_iterator_static_0200', Level.LEVEL2, async (): Promise<void> => {
      console.log('i18n_test_iterator_static_0200 ' + 'start');
      let iterator = i18n.getLineInstance('en');
      iterator.setLineBreakText('My name is Tom.Welcome to the sky world.');
      let value = iterator.first();
      console.log('i18n_test_iterator_static_0200 ' + value);
      expect(value).assertEqual(0);
    })


    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_BREAKITERATOR_static_0300
    * @tc.name    i18n_test_iterator_static_0300
    * @tc.desc    test last interface
    */
    it('i18n_test_iterator_static_0300', Level.LEVEL2, async (): Promise<void> => {
      console.log('i18n_test_iterator_static_0300 ' + 'start');
      let iterator = i18n.getLineInstance('en');
      iterator.setLineBreakText('My name is Tom.Welcome to the sky world.');
      let value = iterator.last();
      console.log('i18n_test_iterator_static_0300 ' + value);
      expect(value).assertEqual(40);
    })


    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_BREAKITERATOR_static_0400
    * @tc.name    i18n_test_iterator_static_0400
    * @tc.desc    test next interface
    */
    it('i18n_test_iterator_static_0400', Level.LEVEL2, async (): Promise<void> => {
      console.log('i18n_test_iterator_static_0400 ' + 'start');
      let iterator = i18n.getLineInstance('en');
      iterator.setLineBreakText('My name is Tom.Welcome to the sky world.');
      let value = iterator.next();
      console.log('i18n_test_iterator_static_0400 ' + value);
      expect(value).assertEqual(3);
    })
    
    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_BREAKITERATOR_static_0500
    * @tc.name    i18n_test_iterator_static_0500
    * @tc.desc    check the next interface with param, test next interface with param
    */
    it('i18n_test_iterator_static_0500', Level.LEVEL0, async (): Promise<void> => {
      console.log('i18n_test_iterator_static_0500 ' + 'start');
      let iterator =i18n.getLineInstance('en');
      iterator.setLineBreakText('My name is Tom.Welcome to the sky world.');
      let value = iterator.next(2);
      console.log('i18n_test_iterator_static_0500 ' + value);
      expect(value).assertEqual(8);
    })


    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_BREAKITERATOR_static_0600
    * @tc.name    i18n_test_iterator_static_0600
    * @tc.desc    test previous interface
    */
    it('i18n_test_iterator_static_0600', Level.LEVEL2, async (): Promise<void> => {
      console.log('i18n_test_iterator_static_0600 ' + 'start');
      let iterator = i18n.getLineInstance('en');
      iterator.setLineBreakText('My name is Tom.Welcome to the sky world.');
      let value = iterator.previous();
      console.log('i18n_test_iterator_static_0600 ' + value);
      expect(value).assertEqual(-1);
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_BREAKITERATOR_static_0700
    * @tc.name    i18n_test_iterator_static_0700
    * @tc.desc    test following interface
    */
    it('i18n_test_iterator_static_0700', Level.LEVEL2, async (): Promise<void> => {
      console.log('i18n_test_iterator_static_0700 ' + 'start');
      let iterator = i18n.getLineInstance('en');
      iterator.setLineBreakText('My name is Tom.Welcome to the sky world.');
      let value = iterator.following(1);
      console.log('i18n_test_iterator_static_0700 ' + value);
      expect(value).assertEqual(3);
    })

    /* *
   * @tc.number  SUB_GLOBAL_I18N_JS_BREAKITERATOR_static_0800
   * @tc.name    i18n_test_iterator_static_0800
   * @tc.desc    test getLineBreakText interface
   */
    it('i18n_test_iterator_static_0800', Level.LEVEL2, async (): Promise<void> => {
      console.log('i18n_test_iterator_static_0800 ' + 'start');
      let iterator = i18n.getLineInstance('en');
      iterator.setLineBreakText('My name is Tom.Welcome to the sky world.');
      let value = iterator.getLineBreakText();
      console.log('i18n_test_iterator_static_0800 ' + value);
      expect(value).assertEqual('My name is Tom.Welcome to the sky world.');
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_BREAKITERATOR_static_0900
    * @tc.name    i18n_test_iterator_static_0900
    * @tc.desc    test isBoundary interface
    */
    it('i18n_test_iterator_static_0900', Level.LEVEL2, async (): Promise<void> => {
      console.log('i18n_test_iterator_static_0900 ' + 'start');
      let iterator = i18n.getLineInstance('en');
      iterator.setLineBreakText('My name is Tom.Welcome to the sky world.');
      let value = iterator.isBoundary(10);
      console.log('i18n_test_iterator_static_0900 ' + value);
      expect(value).assertFalse();
      // current
      let current = iterator.current();
      console.log('i18n_test_iterator_static_0900 ' + current);
      expect(current).assertEqual(11);
    })

    /* *
     * @tc.number  SUB_GLOBAL_I18N_JS_BREAKITERATOR_static_1000
     * @tc.name    i18n_test_iterator_static_1000
     * @tc.desc    test iterator interface
    */
    it('i18n_test_iterator_static_1000', Level.LEVEL2, async (): Promise<void> => {
      console.log('i18n_test_iterator_static_1000 ' + 'start');
      let iterator =i18n.getLineInstance('en');
      iterator.setLineBreakText('My name is Tom.Welcome to the sky world.');
      let current = iterator.current();
      console.log('i18n_test_iterator_static_1000 ' + current);
      expect(current).assertEqual(0);
      let next = iterator.next();
      console.log('i18n_test_iterator_static_1000 ' + next);
      expect(next).assertEqual(3);
      let current2 = iterator.current();
      console.log('i18n_test_iterator_static_1000 ' + current2);
      expect(current2).assertEqual(3);
      let next2 = iterator.next(5);
      console.log('i18n_test_iterator_static_1000 ' + next2);
      expect(next2).assertEqual(30);
      let previous = iterator.previous();
      console.log('i18n_test_iterator_static_1000 ' + previous);
      expect(previous).assertEqual(26);
      let follwoing = iterator.following(3);
      console.log('i18n_test_iterator_static_1000 ' + follwoing);
      expect(follwoing).assertEqual(8);
      let current3 = iterator.current();
      console.log('i18n_test_iterator_static_1000 ' + current3);
      expect(current3).assertEqual(8);
      let value = iterator.isBoundary(3);
      console.log('i18n_test_iterator_static_1000 ' + value);
      console.log('i18n_test_iterator_static_1000 ' + value);
      expect(value).assertTrue();
      let current4 = iterator.current();
      console.log('i18n_test_iterator_static_1000 ' + current4);
      expect(current4).assertEqual(3);
    })
    console.log('*************end BreakIteratorInI18nTest*************');
  })
}