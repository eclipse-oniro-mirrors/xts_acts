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

let domain: int = 0x0000;
let tag: string = 'testTag';

export default function SystemIni18nTest() {

  describe("SystemIni18nTest", (): void => {
    hilog.info(0x0000, 'testTag', '%{public}s', '*************start SystemIni18nTest*************');

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
    /**
     * @tc.name   i18n_system_test_static_0100
     * @tc.number SUB_GLOBAL_i18n_SYSTEM_JS_static_0100
     * @tc.desc   getDisplayCountry with zh-Hans-CN and en-US and true param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('i18n_system_test_static_0100', Level.LEVEL0, async (): Promise<void> => {
      let value = i18n.System.getDisplayCountry('zh-Hans-CN', 'en-US', true);
      console.log('i18n_system_test_static_0100 ' + value);
      expect(value).assertEqual('China');
    })

    /**
     * @tc.name   i18n_system_test_static_0200
     * @tc.number SUB_GLOBAL_i18n_SYSTEM_JS_static_0200
     * @tc.desc   getDisplayCountry with zh-Hans-CN and en-US and undefined param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('i18n_system_test_static_0200', Level.LEVEL2, async (): Promise<void> => {
      let value = i18n.System.getDisplayCountry('zh-Hans-CN', 'en-US', undefined);
      console.log('i18n_system_test_static_0200 ' + value);
      expect(value).assertEqual('China');
    })

    /**
     * @tc.name   i18n_system_test_static_0400
     * @tc.number SUB_GLOBAL_i18n_SYSTEM_JS_static_0400
     * @tc.desc   getDisplayCountry with zh and en-US and true param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('i18n_system_test_static_0400', Level.LEVEL2, async (): Promise<void> => {
      try{
        let value = i18n.System.getDisplayCountry('zh', 'en-US', true);
        console.log('i18n_system_test_static_0400 ' + value);
        expect(value).assertEqual('');
      }catch(e: BusinessError){
        console.log('i18n_system_test_static_0400 ' + e.code);
        console.log('i18n_system_test_static_0400 ' + e.message);
        expect(e.code).assertEqual(890001);
        expect(e.message).assertEqual('Invalid parameter, the country must be a valid region.');
      }
    })

    /**
     * @tc.name   i18n_system_test_static_0500
     * @tc.number SUB_GLOBAL_i18n_SYSTEM_JS_static_0500
     * @tc.desc   getDisplayCountry with zh-CN and en-US and true param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('i18n_system_test_static_0500', Level.LEVEL2, async (): Promise<void> => {
      let value = i18n.System.getDisplayCountry('zh-CN', 'en-US', true);
      console.log('i18n_system_test_static_0500 ' + value);
      expect(value).assertEqual('China');
    })

    /**
     * @tc.name   i18n_system_test_static_0600
     * @tc.number SUB_GLOBAL_i18n_SYSTEM_JS_static_0600
     * @tc.desc   getDisplayCountry with zh-Hans and en-US and true param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('i18n_system_test_static_0600', Level.LEVEL2, async (): Promise<void> => {
      try{
        let value = i18n.System.getDisplayCountry('zh-Hans', 'en-US', true);
        console.log('i18n_system_test_static_0600 ' + value);
        expect(value).assertEqual('');
      }catch(e: BusinessError){
        console.log('i18n_system_test_static_0600 ' + e.code);
        console.log('i18n_system_test_static_0600 ' + e.message);
        expect(e.code).assertEqual(890001);
        expect(e.message).assertEqual('Invalid parameter, the country must be a valid region.');
      }
    })

    /**
     * @tc.name   i18n_system_test_static_0700
     * @tc.number SUB_GLOBAL_i18n_SYSTEM_JS_static_0700
     * @tc.desc   getDisplayCountry with zh-Hans-CN and en-US and false param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('i18n_system_test_static_0700', Level.LEVEL2, async (): Promise<void> => {
      let value = i18n.System.getDisplayCountry('zh-Hans-CN', 'en-US', false);
      console.log('i18n_system_test_static_0700 ' + value);
      expect(value).assertEqual('China');
    })

    /**
     * @tc.name   i18n_system_test_static_0800
     * @tc.number SUB_GLOBAL_i18n_SYSTEM_JS_static_0800
     * @tc.desc   getDisplayCountry with zh-Hans-CN and en-US param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('i18n_system_test_static_0800', Level.LEVEL2, async (): Promise<void> => {
      let value = i18n.System.getDisplayCountry('zh-Hans-CN', 'en-US');
      console.log('i18n_system_test_static_0800 ' + value);
      expect(value).assertEqual('China');
    })

    /**
     * @tc.name   i18n_system_test_static_1100
     * @tc.number SUB_GLOBAL_I18N_SYSTEM_JS_static_1100
     * @tc.desc   check the language, getDisplayLanguage with zh-Hans-CN and en-US and true param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('i18n_system_test_static_1100', Level.LEVEL0, async (): Promise<void> => {
      let value = i18n.System.getDisplayLanguage('zh-Hans-CN', 'en-US', true);
      console.log('i18n_system_test_static_1100 ' + value);
      expect(value).assertEqual('Simplified Chinese');
    })

    /**
     * @tc.name   i18n_system_test_static_1200
     * @tc.number SUB_GLOBAL_I18N_SYSTEM_JS_static_1200
     * @tc.desc   check the language, getDisplayLanguage with zh-Hans-CN and en-US and undefined param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('i18n_system_test_static_1200', Level.LEVEL0, async (): Promise<void> => {
      let value = i18n.System.getDisplayLanguage('zh-Hans-CN', 'en-US', undefined);
      console.log('i18n_system_test_static_1200 ' + value);
      expect(value).assertEqual('Simplified Chinese');
    })

    /**
     * @tc.name   i18n_system_test_static_1300
     * @tc.number SUB_GLOBAL_I18N_SYSTEM_JS_static_1300
     * @tc.desc   check the language, getDisplayLanguage with zh-Hans-CN and en-US and null param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('i18n_system_test_static_1300', Level.LEVEL0, async (): Promise<void> => {
      let value = i18n.System.getDisplayLanguage('zh-Hans-CN', 'en-US', undefined);
      console.log('i18n_system_test_static_1300 ' + value);
      expect(value).assertEqual('Simplified Chinese');
    })

    /**
     * @tc.name   i18n_system_test_static_1400
     * @tc.number SUB_GLOBAL_I18N_SYSTEM_JS_static_1400
     * @tc.desc   check the language, getDisplayLanguage with zh-Hans-CN and en-GB and true param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('i18n_system_test_static_1400', Level.LEVEL0, async (): Promise<void> => {
      let value = i18n.System.getDisplayLanguage('zh-Hans-CN', 'en-GB', true);
      console.log('i18n_system_test_static_1400 ' + value);
      expect(value).assertEqual('Simplified Chinese');
    })

    /**
     * @tc.name   i18n_system_test_static_1500
     * @tc.number SUB_GLOBAL_I18N_SYSTEM_JS_static_1500
     * @tc.desc   check the language, getDisplayLanguage with zh and en-US and true param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('i18n_system_test_static_1500', Level.LEVEL0, async (): Promise<void> => {
      let value = i18n.System.getDisplayLanguage('zh', 'en-US', true);
      console.log('i18n_system_test_static_1500 ' + value);
      expect(value).assertEqual('Chinese');
    })

    /**
     * @tc.name   i18n_system_test_static_1600
     * @tc.number SUB_GLOBAL_I18N_SYSTEM_JS_static_1600
     * @tc.desc   check the language, getDisplayLanguage with zh-CN and en-US and true param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('i18n_system_test_static_1600', Level.LEVEL0, async (): Promise<void> => {
      let value = i18n.System.getDisplayLanguage('zh-CN', 'en-US', true);
      console.log('i18n_system_test_static_1600 ' + value);
      expect(value).assertEqual('Chinese');
    })

    /**
     * @tc.name   i18n_system_test_static_1700
     * @tc.number SUB_GLOBAL_I18N_SYSTEM_JS_static_1700
     * @tc.desc   check the language, getDisplayLanguage with zh-Hans and en-US and true param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('i18n_system_test_static_1700', Level.LEVEL0, async (): Promise<void> => {
      let value = i18n.System.getDisplayLanguage('zh-Hans', 'en-US', true);
      console.log('i18n_system_test_static_1700 ' + value);
      expect(value).assertEqual('Simplified Chinese');
    })

    /**
     * @tc.name   i18n_system_test_static_1800
     * @tc.number SUB_GLOBAL_I18N_SYSTEM_JS_static_1800
     * @tc.desc   check the language, getDisplayLanguage with zh-Hans-CN and en-US and false param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('i18n_system_test_static_1800', Level.LEVEL0, async (): Promise<void> => {
      let value = i18n.System.getDisplayLanguage('zh-Hans-CN', 'en-US', false);
      console.log('i18n_system_test_static_1800 ' + value);
      expect(value).assertEqual('Simplified Chinese');
    })
    
    /**
     * @tc.name   i18n_system_test_static_1900
     * @tc.number SUB_GLOBAL_I18N_SYSTEM_JS_static_1900
     * @tc.desc   check the language, getDisplayLanguage with zh-Hans-CN and en-US param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('i18n_system_test_static_1900', Level.LEVEL0, async (): Promise<void> => {
      let value = i18n.System.getDisplayLanguage('zh-Hans-CN', 'en-US');
      console.log('i18n_system_test_static_1900 ' + value);
      expect(value).assertEqual('Simplified Chinese');
    })

    /**
     * @tc.name   i18n_system_test_static_2200
     * @tc.number SUB_GLOBAL_i18n_SYSTEM_JS_static_2200
     * @tc.desc   getSystemLanguages test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('i18n_system_test_static_2200', Level.LEVEL2, async (): Promise<void> => {
      let value = i18n.System.getSystemLanguages(); 
      let len = value.length;
      console.log('i18n_system_test_static_2200 ' + len);
      expect(len > 0).assertTrue();
    })

    /**
     * @tc.name   i18n_system_test_static_2300
     * @tc.number SUB_GLOBAL_i18n_SYSTEM_JS_static_2300
     * @tc.desc   getSystemCountries with en param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('i18n_system_test_static_2300', Level.LEVEL2, async (): Promise<void> => {
      let value = i18n.System.getSystemCountries('en');
      let len = value.length;
      console.log('i18n_system_test_static_2300 ' + len);
      expect(len > 0).assertTrue();
    })

    /**
     * @tc.name   i18n_system_test_static_2600
     * @tc.number SUB_GLOBAL_i18n_SYSTEM_JS_static_2600
     * @tc.desc   isSuggested with zh param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('i18n_system_test_static_2600', Level.LEVEL0, async (): Promise<void> => {
      let value = i18n.System.isSuggested('zh');
      console.log('i18n_system_test_static_2600 ' + value);
      expect(value).assertTrue();
    })

    /**
     * @tc.name   i18n_system_test_static_2700
     * @tc.number SUB_GLOBAL_i18n_SYSTEM_JS_static_2700
     * @tc.desc   isSuggested with en param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('i18n_system_test_static_2700', Level.LEVEL2, async (): Promise<void> => {
      let value = i18n.System.isSuggested('en');
      console.log('i18n_system_test_static_2700 ' + value);
      expect(value).assertFalse();
    })

    /**
     * @tc.name   i18n_system_test_static_2800
     * @tc.number SUB_GLOBAL_i18n_SYSTEM_JS_static_2800
     * @tc.desc   isSuggested with zh-CN param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('i18n_system_test_static_2800', Level.LEVEL2, async (): Promise<void> => {
      let value = i18n.System.isSuggested('zh', 'CN');
      console.log('i18n_system_test_static_2800 ' + value);
      expect(value).assertTrue();
    })

    /**
     * @tc.name   i18n_system_test_static_2900
     * @tc.number SUB_GLOBAL_i18n_SYSTEM_JS_static_2900
     * @tc.desc   isSuggested with en-US param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('i18n_system_test_static_2900', Level.LEVEL2, async (): Promise<void> => {
      let value = i18n.System.isSuggested('en', 'US');
      console.log('i18n_system_test_static_2900 ' + value);
      expect(value).assertTrue();
    })

    /**
     * @tc.name   i18n_system_test_static_3200
     * @tc.number SUB_GLOBAL_i18n_SYSTEM_JS_static_3200
     * @tc.desc   getSystemLanguage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('i18n_system_test_static_3200', Level.LEVEL2, (): void => {
      let lang: string = i18n.System.getSystemLanguage();
      hilog.info(domain, tag, '%{public}s', 'i18n_system_test_static_3200 ' + lang);
      expect(lang).assertInstanceOf('String');
    })

    /**
     * @tc.name   i18n_system_test_static_3300
     * @tc.number SUB_GLOBAL_i18n_SYSTEM_JS_static_3300
     * @tc.desc   check the getSystemRegion
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('i18n_system_test_static_3300', Level.LEVEL0, (): void => {
      let region: string = i18n.System.getSystemRegion();
      hilog.info(domain, tag, '%{public}s', 'i18n_system_test_static_3300 ' + region);
      expect(region).assertInstanceOf('String');
    })

    /**
     * @tc.name   i18n_system_test_static_3400
     * @tc.number SUB_GLOBAL_i18n_SYSTEM_JS_static_3400
     * @tc.desc   check the getSystemLocaleInstance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('i18n_system_test_static_3400', Level.LEVEL0, (): void => {
      let locale: string = i18n.System.getSystemLocaleInstance().toString();
      hilog.info(domain, tag, '%{public}s', 'i18n_system_test_static_3400 ' + locale);
      expect(locale).assertInstanceOf('String');
    })
    /**
     * @tc.name   i18n_system_test_static_3500
     * @tc.number SUB_GLOBAL_i18n_SYSTEM_JS_static_3500
     * @tc.desc   check the is24HourClock
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('i18n_system_test_static_3500', Level.LEVEL0, (): void => {
      let value: boolean = i18n.System.is24HourClock();
      hilog.info(domain, tag, '%{public}s', 'i18n_system_test_static_3500 ' + value);
      expect(value).assertFalse();
    })

    /**
     * @tc.name   i18n_system_test_static_3600
     * @tc.number SUB_GLOBAL_i18n_SYSTEM_JS_static_3600
     * @tc.desc   test the getPreferredLanguageList interface with default value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('i18n_system_test_static_3600', Level.LEVEL0, async (): Promise<void> => {
      console.log('i18n_system_test_static_3600 ' + 'start');
      let value = i18n.System.getPreferredLanguageList();
      console.log('i18n_system_test_static_3600 ' + value);
      expect(value.length > 0).assertTrue();
    })

    /**
     * @tc.name   i18n_system_test_static_3700
     * @tc.number SUB_GLOBAL_i18n_SYSTEM_JS_static_3700
     * @tc.desc   test the getFirstPreferredLanguage interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('i18n_system_test_static_3700', Level.LEVEL0, async (): Promise<void> => {
      console.log('i18n_system_test_static_3700 ' + 'start');
      let value = i18n.System.getFirstPreferredLanguage();
      console.log('i18n_system_test_static_3700 ' + value);
      let list = i18n.System.getPreferredLanguageList();
      console.log('i18n_system_test_static_3700 ' + list);
      expect(value.length > 0).assertTrue();
      if (list[0] == 'zh-Hans') {
        expect(value).assertEqual('zh-Hans');
      } else if (list[0] == 'en') {
        expect(value).assertEqual('en');
      }
    })

    /**
     * @tc.name   i18n_system_test_static_3800
     * @tc.number SUB_GLOBAL_i18n_SYSTEM_JS_static_3800
     * @tc.desc   test the getAppPreferredLanguage interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('i18n_system_test_static_3800', Level.LEVEL2, async (): Promise<void> => {
      console.log('i18n_system_test_static_3800 ' + 'start');
      let value = i18n.System.getAppPreferredLanguage();
      console.log('i18n_system_test_static_3800 ' + value);
      expect(value).assertContain('zh');
    })

    /**
     * @tc.name   i18n_system_test_static_3900
     * @tc.number i18n_system_test_static_3900
     * @tc.desc   get the getUsingLocalDigit value,test getUsingLocalDigit method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('i18n_system_test_static_3900', Level.LEVEL0, async (): Promise<void> => {
      let value = i18n.System.getUsingLocalDigit();
      console.log('i18n_system_test_static_3900 ' + value);
      expect(value).assertFalse();
    })

    console.log('*************end SystemIni18nTest*************');
  })
}