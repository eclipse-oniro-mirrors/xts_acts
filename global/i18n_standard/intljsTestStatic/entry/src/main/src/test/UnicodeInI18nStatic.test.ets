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
import Utils from './Util.test'

let domain: number = 0x0000;
let tag: string = 'testTag';

export default function UnicodeInI18nTest() {

  describe("UnicodeInI18nTest", (): void => {
    hilog.info(0x0000, 'testTag', '%{public}s', '*************start UnicodeInI18nTest*************');

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
    * @tc.number  SUB_GLOBAL_I18N_JS_CHARACTER_static_0100
    * @tc.name    i18n_test_character_static_0100
    * @tc.desc    check the isDigit interface
    */
    it('i18n_test_character_static_0100', Level.LEVEL0, async (): Promise<void> => {
      console.log('i18n_test_character_static_0100 ' + 'start');
      let value = i18n.Unicode.isDigit('abc');
      console.log('i18n_test_character_static_0100 ' + value);
      expect(value).assertFalse();
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_CHARACTER_static_0120
    * @tc.name    i18n_test_character_static_0120
    * @tc.desc    check the isDigit interface,test isDigit interface with 123 param
    */
    it('i18n_test_character_static_0120', Level.LEVEL2, async (): Promise<void> => {
      console.log('i18n_test_character_static_0120 ' + 'start');
      let value = i18n.Unicode.isDigit('123');
      console.log('i18n_test_character_static_0120 ' + value);
      expect(value).assertTrue();
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_CHARACTER_static_0140
    * @tc.name    i18n_test_character_static_0140
    * @tc.desc    check the isDigit interface，test isDigit interface with 123abc param
    */
    it('i18n_test_character_static_0140', Level.LEVEL2, async (): Promise<void> => {
      console.log('i18n_test_character_static_0140 ' + 'start');
      let value = i18n.Unicode.isDigit('123abc');
      console.log('i18n_test_character_static_0140 ' + value);
      expect(value).assertTrue();
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_CHARACTER_static_0150
    * @tc.name    i18n_test_character_static_0150
    * @tc.desc    check the isDigit interface test isDigit interface with abc123 param
    */
    it('i18n_test_character_static_0150', Level.LEVEL2, async (): Promise<void> => {
      console.log('i18n_test_character_static_0150 ' + 'start');
      let value = i18n.Unicode.isDigit('abc123');
      console.log('i18n_test_character_static_0150 ' + value);
      expect(value).assertFalse();
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_CHARACTER_static_0160
    * @tc.name    i18n_test_character_static_0160
    * @tc.desc    check the isDigit interface,test isDigit interface with null param
    */
    it('i18n_test_character_static_0160', Level.LEVEL2, async (): Promise<void> => {
      let value = i18n.Unicode.isDigit('');
      console.log('i18n_test_character_static_0160 ' + value);
      expect(value).assertFalse();
    })
    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_CHARACTER_static_0200
    * @tc.name    i18n_test_character_static_0200
    * @tc.desc    check the isSpaceChar interface test isSpaceChar interface with abc param
    */
    it('i18n_test_character_static_0200', Level.LEVEL0, async (): Promise<void> => {
      console.log('i18n_test_character_static_0200 ' + 'start');
      let value = i18n.Unicode.isSpaceChar('abc');
      console.log('i18n_test_character_static_0200 ' + value);
      expect(value).assertFalse();
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_CHARACTER_static_0220
    * @tc.name    i18n_test_character_static_0220
    * @tc.desc    check the isSpaceChar interface test isSpaceChar interface with one space param
    */
    it('i18n_test_character_static_0220', Level.LEVEL2, async (): Promise<void> => {
      console.log('i18n_test_character_static_0220 ' + 'start');
      let value = i18n.Unicode.isSpaceChar(' ');
      console.log('i18n_test_character_static_0220 ' + value);
      expect(value).assertTrue();
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_CHARACTER_static_0240
    * @tc.name    i18n_test_character_static_0240
    * @tc.desc    check the isSpaceChar interface test isSpaceChar interface with multi space param
    */
    it('i18n_test_character_static_0240', Level.LEVEL2, async (): Promise<void> => {
      console.log('i18n_test_character_static_0240 ' + 'start');
      let value = i18n.Unicode.isSpaceChar('   ');
      console.log('i18n_test_character_static_0240--' + value + '--');
      expect(value).assertTrue();
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_CHARACTER_static_0300
    * @tc.name    i18n_test_character_static_0300
    * @tc.desc    test isWhitespace interface with abc param
    */
    it('i18n_test_character_static_0300', Level.LEVEL0, async (): Promise<void> => {
      console.log('i18n_test_character_static_0300 ' + 'start');
      let value = i18n.Unicode.isWhitespace('abc');
      console.log('i18n_test_character_static_0300 ' + value);
      expect(value).assertFalse();
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_CHARACTER_static_0320
    * @tc.name    i18n_test_character_static_0320
    * @tc.desc    check the isWhitespace interface,test isWhitespace interface with \u0009 param
    */
    it('i18n_test_character_static_0320', Level.LEVEL2, async (): Promise<void> => {
      console.log('i18n_test_character_static_0320 ' + 'start');
      let value = i18n.Unicode.isWhitespace('\u0009');
      console.log('i18n_test_character_static_0320--' + value + '--');
      expect(value).assertTrue();
    })

    /* *
     * @tc.number  SUB_GLOBAL_I18N_JS_CHARACTER_static_0400
     * @tc.name    i18n_test_character_static_0400
     * @tc.desc    check the isRTL interface test isRTL interface with abc param
     */
    it('i18n_test_character_static_0400', Level.LEVEL0, (): void => {
      hilog.info(domain, tag, '%{public}s', 'i18n_test_character_static_0400 start');
      let value: boolean = i18n.Unicode.isRTL('abc');
      hilog.info(domain, tag, '%{public}s', 'i18n_test_character_static_0400 ' + value);
      expect(value).assertFalse();
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_CHARACTER_static_0420
    * @tc.name    i18n_test_character_static_0420
    * @tc.desc    test isRTL interface with ١٢٣٤٥٦٧ param check the isRTL interface
    */
    it('i18n_test_character_static_0420', Level.LEVEL2, (): void => {
      hilog.info(domain, tag, '%{public}s', 'i18n_test_character_static_0420 start');
      let value: boolean = i18n.Unicode.isRTL('١٢٣٤٥٦٧');
      hilog.info(domain, tag, '%{public}s', 'i18n_test_character_static_0420 ' + value);
      expect(value).assertFalse();
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_CHARACTER_static_0440
    * @tc.name    i18n_test_character_static_0440
    * @tc.desc    test isRTL interface with 我是小明 param
    */
    it('i18n_test_character_static_0440', Level.LEVEL2, (): void => {
      hilog.info(domain, tag, '%{public}s', 'i18n_test_character_static_0440 start');
      let value: boolean = i18n.Unicode.isRTL('我是小明');
      hilog.info(domain, tag, '%{public}s', 'i18n_test_character_static_0440 ' + value);
      expect(value).assertFalse();
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_CHARACTER_static_0460
    * @tc.name    i18n_test_character_static_0460
    * @tc.desc    test isRTL interface with نحن param
    */
    it('i18n_test_character_static_0460', Level.LEVEL2, (): void => {
      hilog.info(domain, tag, '%{public}s', 'i18n_test_character_static_0460 start');
      let value: boolean = i18n.Unicode.isRTL('نحن');
      hilog.info(domain, tag, '%{public}s', 'i18n_test_character_static_0460 ' + value);
      expect(value).assertTrue();
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_CHARACTER_static_0500
    * @tc.name    i18n_test_character_static_0500
    * @tc.desc    check the isIdeograph interface test isIdeograph interface with abc param
    */
    it('i18n_test_character_static_0500', Level.LEVEL0, async (): Promise<void> => {
      console.log('i18n_test_character_static_0500 ' + 'start');
      let value = i18n.Unicode.isIdeograph('abc');
      console.log('i18n_test_character_static_0500 ' + value);
      expect(value).assertFalse();
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_CHARACTER_static_0700
    * @tc.name    i18n_test_character_static_0700
    * @tc.desc    test isLowerCase interface with abc param
    */
    it('i18n_test_character_static_0700', Level.LEVEL0, async (): Promise<void> => {
      console.log('i18n_test_character_static_0700 ' + 'start');
      let value = i18n.Unicode.isLowerCase('abc');
      console.log('i18n_test_character_static_0700 ' + value);
      expect(value).assertTrue();
    })

    /* *
    * @tc.number  i18n_test_character_static_0900
    * @tc.name    i18n_test_character_static_0900
    * @tc.desc    test getType interface with a param
    */
    it('i18n_test_character_static_0900', Level.LEVEL0, async (): Promise<void> => {
      console.log('i18n_test_character_static_0900 ' + 'start');
      let value = i18n.Unicode.getType('a');
      console.log('i18n_test_character_static_0900 ' + value);
      expect(value).assertEqual('U_LOWERCASE_LETTER');
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_CHARACTER_static_0520
    * @tc.name    i18n_test_character_static_0520
    * @tc.desc    test isIdeograph interface with '我' param
    */
    it('i18n_test_character_static_0520', Level.LEVEL2, async (): Promise<void> => {
      console.log('i18n_test_character_static_0520 ' + 'start');
      let value = i18n.Unicode.isIdeograph('我');
      console.log('i18n_test_character_static_0520 ' + value);
      expect(value).assertTrue();
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_CHARACTER_static_0540
    * @tc.name    i18n_test_character_static_0540
    * @tc.desc    test isIdeograph interface with '우리' param
    */
    it('i18n_test_character_static_0540', Level.LEVEL2, async (): Promise<void> => {
      console.log('i18n_test_character_static_0540 ' + 'start');
      let value = i18n.Unicode.isIdeograph('우리');
      console.log('i18n_test_character_static_0540 ' + value);
      expect(value).assertFalse();
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_CHARACTER_static_0560
    * @tc.name    i18n_test_character_static_0560
    * @tc.desc    test isIdeograph interface with '私た' param
    */
    it('i18n_test_character_static_0560', Level.LEVEL2, async (): Promise<void> => {
      console.log('i18n_test_character_static_0560 ' + 'start');
      let value = i18n.Unicode.isIdeograph('私たち');
      console.log('i18n_test_character_static_0560 ' + value);
      expect(value).assertTrue();
    })

    /* *
     * @tc.number  i18n_test_character_static_0600
     * @tc.name    i18n_test_character_static_0600
     * @tc.desc    test isLetter interface with abc param
     */
    it('i18n_test_character_static_0600', Level.LEVEL0, async (): Promise<void> => {
      console.log('i18n_test_character_static_0600 ' + 'start');
      let value = i18n.Unicode.isLetter('abc');
      console.log('i18n_test_character_static_0600 ' + value);
      expect(value).assertTrue();
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_CHARACTER_static_0620
    * @tc.name    i18n_test_character_static_0620
    * @tc.desc    test isLetter interface with 123 param
    */
    it('i18n_test_character_static_0620', Level.LEVEL2, async (): Promise<void> => {
      console.log('i18n_test_character_static_0620 ' + 'start');
      let value = i18n.Unicode.isLetter('123');
      console.log('i18n_test_character_static_0620 ' + value);
      expect(value).assertFalse();
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_CHARACTER_static_0640
    * @tc.name    i18n_test_character_static_0640
    * @tc.desc    test isLetter interface with abc123 param
    */
    it('i18n_test_character_static_0640', Level.LEVEL2, async (): Promise<void> => {
      console.log('i18n_test_character_static_0640 ' + 'start');
      let value = i18n.Unicode.isLetter('abc123');
      console.log('i18n_test_character_static_0640 ' + value);
      expect(value).assertTrue();
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_CHARACTER_static_0660
    * @tc.name    i18n_test_character_static_0660
    * @tc.desc    test isLetter interface with 123abc param
    */
    it('i18n_test_character_static_0660', Level.LEVEL2, async (): Promise<void> => {
      console.log('i18n_test_character_static_0660 ' + 'start');
      let value = i18n.Unicode.isLetter('123abc');
      console.log('i18n_test_character_static_0660 ' + value);
      expect(value).assertFalse();
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_CHARACTER_static_0720
    * @tc.name    i18n_test_character_static_0720
    * @tc.desc    ftest isLowerCase interface with ABC param
    */
    it('i18n_test_character_static_0720', Level.LEVEL2, async (): Promise<void> => {
      console.log('i18n_test_character_static_0720 ' + 'start');
      let value = i18n.Unicode.isLowerCase('ABC');
      console.log('i18n_test_character_static_0720 ' + value);
      expect(value).assertFalse();
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_CHARACTER_static_0740
    * @tc.name    i18n_test_character_static_0740
    * @tc.desc    test isLowerCase interface with abcDEF param
    */
    it('i18n_test_character_static_0740', Level.LEVEL2, async (): Promise<void> => {
      console.log('i18n_test_character_static_0740 ' + 'start');
      let value = i18n.Unicode.isLowerCase('abcDEF');
      console.log('i18n_test_character_static_0740 ' + value);
      expect(value).assertTrue();
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_CHARACTER_static_0760
    * @tc.name    i18n_test_character_static_0760
    * @tc.desc    test isLowerCase interface with ABCdef param
    */
    it('i18n_test_character_static_0760', Level.LEVEL2, async (): Promise<void> => {
      console.log('i18n_test_character_static_0760 ' + 'start');
      let value = i18n.Unicode.isLowerCase('ABCdef');
      console.log('i18n_test_character_static_0760 ' + value);
      expect(value).assertFalse();
    })

    /* *
      * @tc.number  SUB_GLOBAL_I18N_JS_CHARACTER_static_0800
      * @tc.name    i18n_test_character_static_0800
      * @tc.desc    test isUpperCase interface with ABC param
      */
    it('i18n_test_character_static_0800', Level.LEVEL0, async (): Promise<void> => {
      console.log('i18n_test_character_static_0800 ' + 'start');
      let value = i18n.Unicode.isUpperCase('ABC');
      console.log('i18n_test_character_static_0800 ' + value);
      expect(value).assertTrue();
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_CHARACTER_static_0820
    * @tc.name    i18n_test_character_static_0820
    * @tc.desc    test isUpperCase interface with abc param
    */
    it('i18n_test_character_static_0820', Level.LEVEL2, async (): Promise<void> => {
      console.log('i18n_test_character_static_0820 ' + 'start');
      let value = i18n.Unicode.isUpperCase('abc');
      console.log('i18n_test_character_static_0820 ' + value);
      expect(value).assertFalse();
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_CHARACTER_static_0840
    * @tc.name    i18n_test_character_static_0840
    * @tc.desc    test isUpperCase interface with ABCdef param
    */
    it('i18n_test_character_static_0840', Level.LEVEL2, async (): Promise<void> => {
      console.log('i18n_test_character_static_0840 ' + 'start');
      let value = i18n.Unicode.isUpperCase('ABCdef');
      console.log('i18n_test_character_static_0840 ' + value);
      expect(value).assertTrue();
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_CHARACTER_static_0860
    * @tc.name    i18n_test_character_static_0860
    * @tc.desc    test isUpperCase interface with abcDEF param
    */
    it('i18n_test_character_static_0860', Level.LEVEL2, async (): Promise<void> => {
      console.log('i18n_test_character_static_0860 ' + 'start');
      let value = i18n.Unicode.isUpperCase('abcDEF');
      console.log('i18n_test_character_static_0860 ' + value);
      expect(value).assertFalse();
    })

    /* *
     * @tc.number  SUB_GLOBAL_I18N_JS_CHARACTER_static_0920
     * @tc.name    i18n_test_character_static_0920
     * @tc.desc    ftest getType interface with ABC param
     */
    it('i18n_test_character_static_0920', Level.LEVEL2, async (): Promise<void> => {
      console.log('i18n_test_character_static_0920 ' + 'start');
      let value = i18n.Unicode.getType('ABC');
      console.log('i18n_test_character_static_0920 ' + value);
      expect(value).assertEqual('U_UPPERCASE_LETTER');
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_CHARACTER_static_0940
    * @tc.name    i18n_test_character_static_0940
    * @tc.desc    test getType interface with ABCdef param
    */
    it('i18n_test_character_static_0940', Level.LEVEL2, async (): Promise<void> => {
      console.log('i18n_test_character_static_0940 ' + 'start');
      let value = i18n.Unicode.getType('ABCdef');
      console.log('i18n_test_character_static_0940 ' + value);
      expect(value).assertEqual('U_UPPERCASE_LETTER');
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_CHARACTER_static_0960
    * @tc.name    i18n_test_character_static_0960
    * @tc.desc    test getType interface with 123 param
    */
    it('i18n_test_character_static_0960', Level.LEVEL2, async (): Promise<void> => {
      console.log('i18n_test_character_static_0960 ' + 'start');
      let value = i18n.Unicode.getType('123');
      console.log('i18n_test_character_static_0960 ' + value);
      expect(value).assertEqual('U_DECIMAL_DIGIT_NUMBER');
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_CHARACTER_static_0970
    * @tc.name    i18n_test_character_static_0970
    * @tc.desc    test getType interface with 123abc param
    */
    it('i18n_test_character_static_0970', Level.LEVEL2, async (): Promise<void> => {
      console.log('i18n_test_character_static_0970 ' + 'start');
      let value = i18n.Unicode.getType('123abc');
      console.log('i18n_test_character_static_0970 ' + value);
      expect(value).assertEqual('U_DECIMAL_DIGIT_NUMBER');
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_CHARACTER_static_0980
    * @tc.name    i18n_test_character_static_0980
    * @tc.desc    test getType interface with ١٢٣٤٥٦٧ param
    */
    it('i18n_test_character_static_0980', Level.LEVEL2, async (): Promise<void> => {
      console.log('i18n_test_character_static_0980 ' + 'start');
      let value = i18n.Unicode.getType('١٢٣٤٥٦٧');
      console.log('i18n_test_character_static_0980 ' + value);
      expect(value).assertEqual('U_DECIMAL_DIGIT_NUMBER');
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_CHARACTER_static_0990
    * @tc.name    i18n_test_character_static_0990
    * @tc.desc    test getType interface with multi space param
    */
    it('i18n_test_character_static_0990', Level.LEVEL2, async (): Promise<void> => {
      console.log('i18n_test_character_static_0990 ' + 'start');
      let value = i18n.Unicode.getType('   ');
      console.log('i18n_test_character_static_0990 ' + value);
      expect(value).assertEqual('U_SPACE_SEPARATOR');
    })
    console.log('*************end UnicodeInI18nTest*************');
  })
}