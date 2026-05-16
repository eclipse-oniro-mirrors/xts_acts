/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
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
import {
  describe,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect,
  Level
} from "../../../hypium/index";
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog'
import i18n from '@ohos.i18n'
import intl from '@ohos.intl'

let domain: int = 0x0000;
let tag: string = 'testTag';

export default function SevenPointZeroI18nStageStaticTest() {

  describe("SevenPointZeroI18nStageStaticTest", (): void => {
    hilog.info(0x0000, 'testTag', '%{public}s', '*************start SevenPointZeroI18nStageTest*************');

    beforeAll(() => {
      console.info("beforeAll case");
    });
    beforeEach(() => {
      console.info("beforeEach case");
    });
    afterEach(() => {
      console.info("afterEach case");
    });
    afterAll(() => {
      console.info("afterAll case");
    });

    /**
     * @tc.name test_SymbolDateTimeFormat_static_0100
     * @tc.number SUB_GLOBAL_I18N_customSymbol_static_0100
     * @tc.desc test SymbolDateTimeFormat with empty SymbolDateTimeFormatOptions param
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('test_SymbolDateTimeFormat_static_0100', Level.LEVEL2, async (): Promise<void> => {
      let locale = new Intl.Locale("en-US", { "hourCycle": "h12" });
      let customSymbol: i18n.SymbolDateTimeFormatOptions = {};
      try {
        let symbolFormat = new i18n.SymbolDateTimeFormat(locale, customSymbol);
        let options = symbolFormat.resolvedOptions();
        console.log('test_SymbolDateTimeFormat_static_0100 result:', options.amPMSymbol);
        expect(options.amPMSymbol?.toString() == "AM,PM").assertTrue();
      } catch (e) {
        console.log('test_SymbolDateTimeFormat_static_0100 catch error:', e.code + e.message);
        expect(false).assertTrue();
      }
    })

    /**
     * @tc.name test_SymbolDateTimeFormat_static_0200
     * @tc.number SUB_GLOBAL_I18N_customSymbol_static_0200
     * @tc.desc test SymbolDateTimeFormat with undefined SymbolDateTimeFormatOptions param
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('test_SymbolDateTimeFormat_static_0200', Level.LEVEL2, async (): Promise<void> => {
      let locale = new Intl.Locale("en-US", { "hourCycle": "h12" });
      try {
        let symbolFormat = new i18n.SymbolDateTimeFormat(locale, undefined);
        let options = symbolFormat.resolvedOptions();
        console.log('test_SymbolDateTimeFormat_static_0200 result:', options.amPMSymbol);
        expect(options.amPMSymbol?.toString() == "AM,PM").assertTrue();
      } catch (e) {
        console.log('test_SymbolDateTimeFormat_static_0200 catch error:', e.code + e.message);
        expect(false).assertTrue();
      }
    })

    /**
     * @tc.name test_SymbolDateTimeFormat_static_0300
     * @tc.number SUB_GLOBAL_I18N_customSymbol_static_0300
     * @tc.desc test SymbolDateTimeFormat with custom PM character
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('test_SymbolDateTimeFormat_static_0300', Level.LEVEL2, async (): Promise<void> => {
      let locale = new Intl.Locale("en-US", { "hourCycle": "h12" });
      let customSymbol: i18n.SymbolDateTimeFormatOptions = { "amPMSymbol": ["test1", "test2"], "timeStyle": "full" };
      let date: Date = new Date(2026, 2, 18, 14, 8);
      try {
        let symbolFormat = new i18n.SymbolDateTimeFormat(locale, customSymbol);
        let dateFormat = symbolFormat.format(date);
        console.log('test_SymbolDateTimeFormat_static_0300 result:', dateFormat);
        expect(dateFormat).assertContain("test2");
      } catch (e) {
        console.log('test_SymbolDateTimeFormat_static_0300 catch error:', e.code + e.message);
        expect(false).assertTrue();
      }
    })

    /**
     * @tc.name test_SymbolDateTimeFormat_static_0400
     * @tc.number SUB_GLOBAL_I18N_customSymbol_static_0400
     * @tc.desc test SymbolDateTimeFormat with custom AM character
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('test_SymbolDateTimeFormat_static_0400', Level.LEVEL2, async (): Promise<void> => {
      let locale = new Intl.Locale("en-US", { "hourCycle": "h12" });
      let customSymbol: i18n.SymbolDateTimeFormatOptions = { "amPMSymbol": ["test1", "test2"], "timeStyle": "full" };
      let date: Date = new Date(2026, 2, 18, 10, 8);
      try {
        let symbolFormat = new i18n.SymbolDateTimeFormat(locale, customSymbol);
        let dateFormat = symbolFormat.format(date);
        console.log('test_SymbolDateTimeFormat_static_0400 result:', dateFormat);
        expect(dateFormat).assertContain("test1");
      } catch (e) {
        console.log('test_SymbolDateTimeFormat_static_0400 catch error:', e.code + e.message);
        expect(false).assertTrue();
      }
    })

    /**
     * @tc.name test_SymbolDateTimeFormat_static_0500
     * @tc.number SUB_GLOBAL_I18N_customSymbol_static_0500
     * @tc.desc test SymbolDateTimeFormat with resolvedOptions
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('test_SymbolDateTimeFormat_static_0500', Level.LEVEL2, async (): Promise<void> => {
      let locale = new Intl.Locale("en-US", { "hourCycle": "h12" });
      let customSymbol: i18n.SymbolDateTimeFormatOptions = { "amPMSymbol": ["test1", "test2"] };
      try {
        let symbolFormat = new i18n.SymbolDateTimeFormat(locale, customSymbol);
        let options = symbolFormat.resolvedOptions();
        console.log('test_SymbolDateTimeFormat_static_0500 result:', options.amPMSymbol);
        expect(options.amPMSymbol?.toString() == "test1,test2").assertTrue();
      } catch (e) {
        console.log('test_SymbolDateTimeFormat_static_0500 catch error:', e.code + e.message);
        expect(false).assertTrue();
      }
    })

    /**
     * @tc.name test_SymbolDateTimeFormat_static_0600
     * @tc.number SUB_GLOBAL_I18N_customSymbol_static_0600
     * @tc.desc test SymbolDateTimeFormat with empty amPMSymbol param
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('test_SymbolDateTimeFormat_static_0600', Level.LEVEL2, async (): Promise<void> => {
      let locale = new Intl.Locale("en-US", { "hourCycle": "h12" });
      let customSymbol: i18n.SymbolDateTimeFormatOptions = { "amPMSymbol": [] };
      try {
        let symbolFormat = new i18n.SymbolDateTimeFormat(locale, customSymbol);
        symbolFormat.resolvedOptions();
        console.log('test_SymbolDateTimeFormat_static_0600 result:');
        expect(false).assertTrue();
      } catch (e) {
        console.log('test_SymbolDateTimeFormat_static_0600 catch error:', e.code + e.message);
        expect(Number(e.code) === 890001).assertTrue();
      }
    })

    /**
     * @tc.name test_SymbolNumberFormat_static_0100
     * @tc.number SUB_GLOBAL_I18N_customSymbol_static_0800
     * @tc.desc test SymbolNumberFormat with empty SymbolNumberFormatOptions
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('test_SymbolNumberFormat_static_0100', Level.LEVEL2, async (): Promise<void> => {
      let locale = new Intl.Locale("en-US", { "numberingSystem": "latn" });
      let customSymbol: i18n.SymbolNumberFormatOptions = {};
      try {
        let symbolFormat = new i18n.SymbolNumberFormat(locale, customSymbol);
        let options = symbolFormat.resolvedOptions();
        console.log('test_SymbolNumberFormat_static_0100 result:', options.zero);
        expect(options.zero === '0').assertTrue();
      } catch (e) {
        console.log('test_SymbolNumberFormat_static_0100 catch error:', e.code + e.message);
        expect(false).assertTrue();
      }
    })

    /**
     * @tc.name test_SymbolNumberFormat_static_0200
     * @tc.number SUB_GLOBAL_I18N_customSymbol_static_0900
     * @tc.desc test SymbolNumberFormat with undefined SymbolNumberFormatOptions
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('test_SymbolNumberFormat_static_0200', Level.LEVEL2, async (): Promise<void> => {
      let locale = new Intl.Locale("en-US", { "numberingSystem": "latn" });
      try {
        let symbolFormat = new i18n.SymbolNumberFormat(locale, undefined);
        let options = symbolFormat.resolvedOptions();
        console.log('test_SymbolNumberFormat_static_0200 result:', options.zero);
        expect(options.zero === '0').assertTrue();
      } catch (e) {
        console.log('test_SymbolNumberFormat_static_0200 catch error:', e.code + e.message);
        expect(false).assertTrue();
      }
    })

    /**
     * @tc.name test_SymbolNumberFormat_static_0400
     * @tc.number SUB_GLOBAL_I18N_customSymbol_static_1100
     * @tc.desc test SymbolNumberFormat with
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('test_SymbolNumberFormat_static_0400', Level.LEVEL2, async (): Promise<void> => {
      let locale = new Intl.Locale("en-US", { "numberingSystem": "latn" });
      let customSymbol: i18n.SymbolNumberFormatOptions = { "zero": "B" };
      try {
        let symbolFormat = new i18n.SymbolNumberFormat(locale, customSymbol);
        let options = symbolFormat.resolvedOptions();
        console.log('test_SymbolNumberFormat_static_0400 result:', options.zero);
        expect(options.zero === 'B').assertTrue();
      } catch (e) {
        console.log('test_SymbolNumberFormat_static_0400 catch error:', e.code + e.message);
        expect(false).assertTrue();
      }
    })

    /**
     * @tc.name test_SymbolNumberFormat_static_0600
     * @tc.number SUB_GLOBAL_I18N_customSymbol_static_1300
     * @tc.desc test SymbolNumberFormat with undefined SymbolNumberFormatOptions param
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('test_SymbolNumberFormat_static_0600', Level.LEVEL2, async (): Promise<void> => {
      let locale = new Intl.Locale("en-US", { "numberingSystem": "latn" });
      let customSymbol: i18n.SymbolNumberFormatOptions = { "zero": undefined };
      try {
        let symbolFormat = new i18n.SymbolNumberFormat(locale, customSymbol);
        let options = symbolFormat.resolvedOptions();
        console.log('test_SymbolNumberFormat_static_0600 result:', options.zero);
        expect(options.zero === '0').assertTrue();
      } catch (e) {
        console.log('test_SymbolNumberFormat_static_0600 catch error:', e.code + e.message);
        expect(false).assertTrue();
      }
    })

    /**
     * @tc.name test_SymbolNumberFormat_static_0700
     * @tc.number SUB_GLOBAL_I18N_customSymbol_static_1400
     * @tc.desc test SymbolNumberFormat with custom null character
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('test_SymbolNumberFormat_static_0700', Level.LEVEL2, async (): Promise<void> => {
      let locale = new Intl.Locale("en-US", { "numberingSystem": "latn" });
      let customSymbol: i18n.SymbolNumberFormatOptions = { "nan": "B" };
      try {
        let symbolFormat = new i18n.SymbolNumberFormat(locale, customSymbol);
        let numberFormat = symbolFormat.format(NaN);
        console.log('test_SymbolNumberFormat_static_0700 result:', numberFormat);
        expect(numberFormat === 'B').assertTrue();
      } catch (e) {
        console.log('test_SymbolNumberFormat_static_0700 catch error:', e.code + e.message);
        expect(false).assertTrue();
      }
    })

    /**
     * @tc.name test_SymbolNumberFormat_static_0800
     * @tc.number SUB_GLOBAL_I18N_customSymbol_static_1500
     * @tc.desc test SymbolNumberFormat with resolvedOptions function
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('test_SymbolNumberFormat_static_0800', Level.LEVEL2, async (): Promise<void> => {
      let locale = new Intl.Locale("en-US", { "numberingSystem": "latn" });
      let customSymbol: i18n.SymbolNumberFormatOptions = { "nan": "B" };
      try {
        let symbolFormat = new i18n.SymbolNumberFormat(locale, customSymbol);
        let options = symbolFormat.resolvedOptions();
        console.log('test_SymbolNumberFormat_static_0800 result:', options.nan);
        expect(options.nan === 'B').assertTrue();
      } catch (e) {
        console.log('test_SymbolNumberFormat_static_0800 catch error:', e.code + e.message);
        expect(false).assertTrue();
      }
    })

    /**
     * @tc.name test_SymbolNumberFormat_static_1000
     * @tc.number SUB_GLOBAL_I18N_customSymbol_static_1700
     * @tc.desc test SymbolNumberFormat with undefined nan option
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('test_SymbolNumberFormat_static_1000', Level.LEVEL2, async (): Promise<void> => {
      let locale = new Intl.Locale("en-US", { "numberingSystem": "latn" });
      let customSymbol: i18n.SymbolNumberFormatOptions = { "nan": undefined };
      try {
        let symbolFormat = new i18n.SymbolNumberFormat(locale, customSymbol);
        let options = symbolFormat.resolvedOptions();
        console.log('test_SymbolNumberFormat_static_1000 result:', options.nan);
        expect(options.nan === 'NaN').assertTrue();
      } catch (e) {
        console.log('test_SymbolNumberFormat_static_1000 catch error:', e.code + e.message);
        expect(false).assertTrue();
      }
    })

    /**
     * @tc.name test_SymbolNumberFormat_static_1100
     * @tc.number SUB_GLOBAL_I18N_customSymbol_static_1800
     * @tc.desc test SymbolNumberFormat with custom minusSign character
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('test_SymbolNumberFormat_static_1100', Level.LEVEL2, async (): Promise<void> => {
      let locale = new Intl.Locale("en-US", { "numberingSystem": "latn" });
      let customSymbol: i18n.SymbolNumberFormatOptions = { "minusSign": "B" };
      try {
        let symbolFormat = new i18n.SymbolNumberFormat(locale, customSymbol);
        let numberFormat = symbolFormat.format(-12345.06);
        console.log('test_SymbolNumberFormat_static_1100 result:', numberFormat);
        expect(numberFormat === 'B12,345.06').assertTrue();
      } catch (e) {
        console.log('test_SymbolNumberFormat_static_1100 catch error:', e.code + e.message);
        expect(false).assertTrue();
      }
    })

    /**
     * @tc.name test_SymbolNumberFormat_static_1200
     * @tc.number SUB_GLOBAL_I18N_customSymbol_static_1900
     * @tc.desc test SymbolNumberFormat with resolvedOptions
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('test_SymbolNumberFormat_static_1200', Level.LEVEL2, async (): Promise<void> => {
      let locale = new Intl.Locale("en-US", { "numberingSystem": "latn" });
      let customSymbol: i18n.SymbolNumberFormatOptions = { "minusSign": "B" };
      try {
        let symbolFormat = new i18n.SymbolNumberFormat(locale, customSymbol);
        let options = symbolFormat.resolvedOptions();
        console.log('test_SymbolNumberFormat_static_1200 result:', options.minusSign);
        expect(options.minusSign === 'B').assertTrue();
      } catch (e) {
        console.log('test_SymbolNumberFormat_static_1200 catch error:', e.code + e.message);
        expect(false).assertTrue();
      }
    })

    /**
     * @tc.name test_SymbolNumberFormat_static_1400
     * @tc.number SUB_GLOBAL_I18N_customSymbol_static_2100
     * @tc.desc test SymbolNumberFormat with undefined minusSign param
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('test_SymbolNumberFormat_static_1400', Level.LEVEL2, async (): Promise<void> => {
      let locale = new Intl.Locale('en-US', { 'numberingSystem': 'latn' });
      let customSymbol: i18n.SymbolNumberFormatOptions = {'minusSign': undefined };
      try {
        let symbolFormat = new i18n.SymbolNumberFormat(locale, customSymbol);
        let options = symbolFormat.resolvedOptions();
        console.log('test_SymbolNumberFormat_static_1400 result:' + options.minusSign);
        expect(options.minusSign === '-').assertTrue();
      }catch(e){
        console.log('test_SymbolNumberFormat_static_1400 catch error:' + e.code + e.message);
        expect(false).assertTrue();
      }
    })

    /**
     * @tc.name test_SymbolNumberFormat_static_1500
     * @tc.number SUB_GLOBAL_I18N_customSymbol_static_2200
     * @tc.desc test SymbolNumberFormat with custom plusSign param
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('test_SymbolNumberFormat_static_1500', Level.LEVEL2, async (): Promise<void> => {
      let locale = new Intl.Locale('en-US', { 'numberingSystem': 'latn' });
      let customSymbol: i18n.SymbolNumberFormatOptions = {'plusSign': 'B', signDisplay: 'always'};
      try {
        let symbolFormat = new i18n.SymbolNumberFormat(locale, customSymbol);
        let numberFormat = symbolFormat.format(12345.06);
        console.log('test_SymbolNumberFormat_static_1500 result:' + numberFormat);
        expect(numberFormat === 'B12,345.06').assertTrue();
      }catch(e){
        console.log('test_SymbolNumberFormat_static_1500 catch error:' + e.code + e.message);
        expect(false).assertTrue();
      }
    })

    /**
     * @tc.name test_SymbolNumberFormat_static_1600
     * @tc.number SUB_GLOBAL_I18N_customSymbol_static_2300
     * @tc.desc test SymbolNumberFormat with resolveOptions
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('test_SymbolNumberFormat_static_1600', Level.LEVEL2, async (): Promise<void> => {
      let locale = new Intl.Locale('en-US', { 'numberingSystem': 'latn' });
      let customSymbol: i18n.SymbolNumberFormatOptions = {'plusSign': 'B'};
      try {
        let symbolFormat = new i18n.SymbolNumberFormat(locale, customSymbol);
        let options = symbolFormat.resolvedOptions();
        console.log('test_SymbolNumberFormat_static_1600 result:' + options.plusSign);
        expect(options.plusSign === 'B').assertTrue();
      }catch(e){
        console.log('test_SymbolNumberFormat_static_1600 catch error:' + e.code + e.message);
        expect(false).assertTrue();
      }
    })

    /**
     * @tc.name test_SymbolNumberFormat_static_1800
     * @tc.number SUB_GLOBAL_I18N_customSymbol_static_2500
     * @tc.desc test SymbolNumberFormat with empty plusSign param
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('test_SymbolNumberFormat_static_1800', Level.LEVEL2, async (): Promise<void> => {
      let locale = new Intl.Locale('en-US', { 'numberingSystem': 'latn' });
      let customSymbol: i18n.SymbolNumberFormatOptions = {'plusSign': undefined};
      try {
        let symbolFormat = new i18n.SymbolNumberFormat(locale, customSymbol);
        let options = symbolFormat.resolvedOptions();
        console.log('test_SymbolNumberFormat_static_1800 result:' + options.plusSign);
        expect(options.plusSign === '+').assertTrue();
      }catch(e){
        console.log('test_SymbolNumberFormat_static_1800 catch error:' + e.code + e.message);
        expect(false).assertTrue();
      }
    })

    /**
     * @tc.name test_SymbolNumberFormat_static_1900
     * @tc.number SUB_GLOBAL_I18N_customSymbol_static_2600
     * @tc.desc test SymbolNumberFormat with custom infinity symbol
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('test_SymbolNumberFormat_static_1900', Level.LEVEL2, async (): Promise<void> => {
      let locale = new Intl.Locale('en-US');
      let customSymbol: i18n.SymbolNumberFormatOptions = { 'infinity': 'B' };
      try {
        let symbolFormat = new i18n.SymbolNumberFormat(locale, customSymbol);
        let numberFormat = symbolFormat.format(Infinity);
        console.log('test_SymbolNumberFormat_static_1900 result:' + numberFormat);
        expect(numberFormat === 'B').assertTrue();
      }catch(e){
        console.log('test_SymbolNumberFormat_static_1900 catch error:' + e.code + e.message);
        expect(false).assertTrue();
      }
    })

    /**
     * @tc.name test_SymbolNumberFormat_static_2000
     * @tc.number SUB_GLOBAL_I18N_customSymbol_static_2700
     * @tc.desc test SymbolNumberFormat with resolvedOptions
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('test_SymbolNumberFormat_static_2000', Level.LEVEL2, async (): Promise<void> => {
      let locale = new Intl.Locale('en-US');
      let customSymbol: i18n.SymbolNumberFormatOptions = { 'infinity': 'B' };
      try {
        let symbolFormat = new i18n.SymbolNumberFormat(locale, customSymbol);
        let options = symbolFormat.resolvedOptions();
        console.log('test_SymbolNumberFormat_static_2000 result:' + options.infinity);
        expect(options.infinity === 'B').assertTrue();
      }catch(e){
        console.log('test_SymbolNumberFormat_static_2000 catch error:' + e.code + e.message);
        expect(false).assertTrue();
      }
    })

    /**
     * @tc.name test_SymbolNumberFormat_static_2200
     * @tc.number SUB_GLOBAL_I18N_customSymbol_static_2900
     * @tc.desc test SymbolNumberFormat with undefined infinity param
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('test_SymbolNumberFormat_static_2200', Level.LEVEL2, async (): Promise<void> => {
      let locale = new Intl.Locale('en-US');
      let customSymbol: i18n.SymbolNumberFormatOptions = { 'infinity': undefined };
      try {
        let symbolFormat = new i18n.SymbolNumberFormat(locale, customSymbol);
        let options = symbolFormat.resolvedOptions();
        console.log('test_SymbolNumberFormat_static_2200 result:' + options.infinity);
        expect(options.infinity === '∞').assertTrue();
      }catch(e){
        console.log('test_SymbolNumberFormat_static_2200 catch error:' + e.code + e.message);
        expect(false).assertTrue();
      }
    })

    /**
     * @tc.name test_SymbolNumberFormat_static_2300
     * @tc.number SUB_GLOBAL_I18N_customSymbol_static_3000
     * @tc.desc test SymbolNumberFormat with undefined infinity param
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('test_SymbolNumberFormat_static_2300', Level.LEVEL2, async (): Promise<void> => {
      let locale = new Intl.Locale('en-US');
      let customSymbol: i18n.SymbolNumberFormatOptions = { 'groupingSeparator': '-' };
      try {
        let symbolFormat = new i18n.SymbolNumberFormat(locale, customSymbol);
        let numberFormat = symbolFormat.format(123456);
        console.log('test_SymbolNumberFormat_static_2300 result:' + numberFormat);
        expect(numberFormat === '123-456').assertTrue();
      }catch(e){
        console.log('test_SymbolNumberFormat_static_2300 catch error:' + e.code + e.message);
        expect(false).assertTrue();
      }
    })

    /**
     * @tc.name test_SymbolNumberFormat_static_2400
     * @tc.number SUB_GLOBAL_I18N_customSymbol_static_3100
     * @tc.desc test SymbolNumberFormat with groupingSeparator
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('test_SymbolNumberFormat_static_2400', Level.LEVEL2, async (): Promise<void> => {
      let locale = new Intl.Locale('en-US');
      let customSymbol: i18n.SymbolNumberFormatOptions = { 'groupingSeparator': '-' };
      try {
        let symbolFormat = new i18n.SymbolNumberFormat(locale, customSymbol);
        let options = symbolFormat.resolvedOptions();
        console.log('test_SymbolNumberFormat_static_2400 result:' + options.groupingSeparator);
        expect(options.groupingSeparator === '-').assertTrue();
      }catch(e){
        console.log('test_SymbolNumberFormat_static_2400 catch error:' + e.code + e.message);
        expect(false).assertTrue();
      }
    })

    /**
     * @tc.name test_SymbolNumberFormat_static_2600
     * @tc.number SUB_GLOBAL_I18N_customSymbol_static_3200
     * @tc.desc test SymbolNumberFormat with empty groupingSeparator param
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('test_SymbolNumberFormat_static_2600', Level.LEVEL2, async (): Promise<void> => {
      let locale = new Intl.Locale('en-US');
      let customSymbol: i18n.SymbolNumberFormatOptions = { 'groupingSeparator': undefined };
      try {
        let symbolFormat = new i18n.SymbolNumberFormat(locale, customSymbol);
        let options = symbolFormat.resolvedOptions();
        console.log('test_SymbolNumberFormat_static_2600 result:' + options.groupingSeparator);
        expect(options.groupingSeparator === ',').assertTrue();
      }catch(e){
        console.log('test_SymbolNumberFormat_static_2600 catch error:' + e.code + e.message);
        expect(false).assertTrue();
      }
    })

    /**
     * @tc.name test_SymbolDateTimeFormat_static_0800
     * @tc.number test_SymbolDateTimeFormat_static_0800
     * @tc.desc test SymbolDateTimeFormat with custom AM character
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL2
     */
    it('test_SymbolDateTimeFormat_static_0800', Level.LEVEL2, () => {
      let locale = new Intl.Locale("en-US", { "hourCycle": "h12" });
      let customSymbol: i18n.SymbolDateTimeFormatOptions = { "amPMSymbol": ["test1", "test2"], "timeStyle": "full" };
      let date: Date = new Date(2026, 2, 18, 10, 8);
      let date2: Date = new Date(2027, 2, 18, 10, 8);
      let symbolFormat = new i18n.SymbolDateTimeFormat(locale, customSymbol);
      let dateFormat = symbolFormat.formatRange(date, date2);
      console.log('test_SymbolDateTimeFormat_static_0800 result:', dateFormat);
      expect(dateFormat).assertEqual("3/18/2026, 10:08:00 AM Central Standard Time – 3/18/2027, 10:08:00 AM Central Standard Time");
    })

    /**
     * @tc.name test_SymbolDateTimeFormat_static_0900
     * @tc.number test_SymbolDateTimeFormat_static_0900
     * @tc.desc test SymbolDateTimeFormat with custom AM character
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL2
     */
    it('test_SymbolDateTimeFormat_static_0900', Level.LEVEL2, () => {
      let locale = new Intl.Locale("en-US", { "hourCycle": "h12" });
      let customSymbol: i18n.SymbolDateTimeFormatOptions = { "amPMSymbol": ["test1", "test2"], "timeStyle": "full" };
      let date: Date = new Date(2026, 2, 18, 10, 8);
      let date2: Date = new Date(2026, 2, 18, 10, 8);
      let expectedValue: string[] = ["10", ":", "08", ":", "00", " ", "AM", " " ,"Central Standard Time"];
      let expectedType: string[] = ["hour", "literal", "minute", "literal", "second", "literal", "dayPeriod", "literal" ,"timeZoneName"];
      let symbolFormat = new i18n.SymbolDateTimeFormat(locale, customSymbol);
      let dateFormat: Array<Intl.DateTimeRangeFormatPart> = symbolFormat.formatRangeToParts(date, date2);
      console.log('test_SymbolDateTimeFormat_static_0900 result:', JSON.stringify(dateFormat));
      for (let i = 0; i < dateFormat.length; i++) {
        expect(dateFormat[i].value).assertEqual(expectedValue[i]);
        expect(dateFormat[i].type).assertEqual(expectedType[i]);
      }
    })

    /**
     * @tc.name test_SymbolDateTimeFormat_static_1000
     * @tc.number test_SymbolDateTimeFormat_static_1000
     * @tc.desc test SymbolDateTimeFormat with custom AM character
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL2
     */
    it('test_SymbolDateTimeFormat_static_1000', Level.LEVEL2, () => {
      let locale = new Intl.Locale("en-US", { "hourCycle": "h12" });
      let customSymbol: i18n.SymbolDateTimeFormatOptions = { "amPMSymbol": ["test1", "test2"], "timeStyle": "full" };
      let date: Date = new Date(2026, 2, 18, 10, 8);
      let expectedValue: string[] = ["10", ":", "08", ":", "00", " ", "test1", " " ,"Central Standard Time"];
      let expectedType: string[] = ["hour", "literal", "minute", "literal", "second", "literal", "dayPeriod", "literal" ,"timeZoneName"];
      let symbolFormat = new i18n.SymbolDateTimeFormat(locale, customSymbol);
      let dateFormat: Intl.DateTimeFormatPart[] = symbolFormat.formatToParts(date);
      console.log('test_SymbolDateTimeFormat_static_1000 result:', JSON.stringify(dateFormat));
      for (let i = 0; i < dateFormat.length; i++) {
        expect(dateFormat[i].value).assertEqual(expectedValue[i]);
        expect(dateFormat[i].type).assertEqual(expectedType[i]);
      }
    })


    /**
     * @tc.name test_SymbolNumberFormat_static_2700
     * @tc.number test_SymbolNumberFormat_static_2700
     * @tc.desc test SymbolNumberFormat with custom plusSign param
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL2
     */
    it('test_SymbolNumberFormat_static_2700', Level.LEVEL2, () => {
      let locale = new Intl.Locale('en-US', { 'numberingSystem': 'latn' });
      let customSymbol: i18n.SymbolNumberFormatOptions = {'plusSign': 'B', signDisplay: 'always'};
      let symbolFormat = new i18n.SymbolNumberFormat(locale, customSymbol);
      let numberFormat = symbolFormat.formatRange(100, 101);
      console.log('test_SymbolNumberFormat_static_2700 result:' + numberFormat);
      expect(numberFormat).assertEqual('B100 – B101');
    })

    /**
     * @tc.name test_SymbolNumberFormat_static_2800
     * @tc.number test_SymbolNumberFormat_static_2800
     * @tc.desc test SymbolNumberFormat with custom plusSign param
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL2
     */
    it('test_SymbolNumberFormat_static_2800', Level.LEVEL2, () => {
      let locale = new Intl.Locale('en-US', { 'numberingSystem': 'latn' });
      let customSymbol: i18n.SymbolNumberFormatOptions = {'plusSign': 'B', signDisplay: 'always'};
      let symbolFormat = new i18n.SymbolNumberFormat(locale, customSymbol);
      let expectedValue: string[] = ["B", "100"];
      let expectedType: string[] = ["plusSign", "integer"];
      let numberFormat: Intl.NumberFormatPart[] = symbolFormat.formatToParts(100);
      console.log('test_SymbolNumberFormat_static_2800 result:' + JSON.stringify(numberFormat));
      for (let i = 0; i < numberFormat.length; i++) {
        expect(numberFormat[i].value).assertEqual(expectedValue[i]);
        expect(numberFormat[i].type).assertEqual(expectedType[i]);
      }
    })

    /**
     * @tc.name test_SymbolNumberFormat_static_2900
     * @tc.number test_SymbolNumberFormat_static_2900
     * @tc.desc test SymbolNumberFormat with custom plusSign param
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL2
     */
    it('test_SymbolNumberFormat_static_2900', Level.LEVEL2, () => {
      let locale = new Intl.Locale('en-US', { 'numberingSystem': 'latn' });
      let customSymbol: i18n.SymbolNumberFormatOptions = {'plusSign': 'B', signDisplay: 'always'};
      let symbolFormat = new i18n.SymbolNumberFormat(locale, customSymbol);
      let expectedValue: string[] = ["B", "100", " – ", "B", "101"];
      let expectedType: string[] = ["plusSign", "integer", "literal", "plusSign", "integer"];
      let numberFormat: Array<Intl.NumberRangeFormatPart> = symbolFormat.formatRangeToParts(100, 101);
      console.log('test_SymbolNumberFormat_static_2900 result:' + JSON.stringify(numberFormat));
      for (let i = 0; i < numberFormat.length; i++) {
        expect(numberFormat[i].value).assertEqual(expectedValue[i]);
        expect(numberFormat[i].type).assertEqual(expectedType[i]);
      }
    })

    /**
     * @tc.name   SUB_GLOBAL_detectEncoding_static_0100
     * @tc.number SUB_GLOBAL_DETECTENCODING_STATIC_0100
     * @tc.desc   with detectEncoding
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_detectEncoding_static_0100', Level.LEVEL2, async (): Promise<void> => {
      let uint8Array = new Uint8Array([0xE4, 0xB8, 0xAD, 0xE5, 0x9B, 0xBD]);
      let info = i18n.Unicode.detectEncoding(uint8Array);
      console.log('SUB_GLOBAL_detectEncoding_static_0100 value:', info.encodingName);
      console.log('SUB_GLOBAL_detectEncoding_static_0100 value:', info.confidence);
      expect(info.encodingName).assertEqual('UTF-8');
      expect(info.confidence).assertEqual(80);
    })

    /**
     * @tc.name   SUB_GLOBAL_detectEncoding_static_0200
     * @tc.number SUB_GLOBAL_DETECTENCODING_STATIC_0200
     * @tc.desc   with detectEncoding
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_detectEncoding_static_0200', Level.LEVEL2, async (): Promise<void> => {
      let uint8Array = new Uint8Array([0x44, 0x65, 0x72, 0x43, 0x6F, 0x64, 0x65]);
      let info = i18n.Unicode.detectEncoding(uint8Array);
      console.log('SUB_GLOBAL_detectEncoding_static_0200 value:', info.encodingName);
      console.log('SUB_GLOBAL_detectEncoding_static_0200 value:', info.confidence);
      expect(info.encodingName).assertEqual('ISO-8859-1');
      expect(info.confidence).assertEqual(75);
    })

    /**
     * @tc.name   SUB_GLOBAL_detectEncoding_static_0300
     * @tc.number SUB_GLOBAL_DETECTENCODING_STATIC_0300
     * @tc.desc   with detectEncoding
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_detectEncoding_static_0300', Level.LEVEL2, async (): Promise<void> => {
      let uint8Array = new Uint8Array([0xC2, 0xC8]);
      let info = i18n.Unicode.detectEncoding(uint8Array);
      console.log('SUB_GLOBAL_detectEncoding_static_0300 value:', info.encodingName);
      console.log('SUB_GLOBAL_detectEncoding_static_0300 value:', info.confidence);
      expect(info.encodingName).assertEqual('GB18030');
      expect(info.confidence).assertEqual(10);
    })

    /**
     * @tc.name   SUB_GLOBAL_detectEncoding_static_0400
     * @tc.number SUB_GLOBAL_DETECTENCODING_STATIC_0400
     * @tc.desc   with detectEncoding
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_detectEncoding_static_0400', Level.LEVEL2, async (): Promise<void> => {
      let uint8Array = new Uint8Array([0xD6, 0xD0, 0xCE, 0xC4]);
      let info = i18n.Unicode.detectEncoding(uint8Array);
      console.log('SUB_GLOBAL_detectEncoding_static_0400 value:', info.encodingName);
      console.log('SUB_GLOBAL_detectEncoding_static_0400 value:', info.confidence);
      expect(info.encodingName).assertEqual('UTF-16BE');
      expect(info.confidence).assertEqual(10);
    })

    /**
     * @tc.name   SUB_GLOBAL_detectEncoding_static_0500
     * @tc.number SUB_GLOBAL_DETECTENCODING_STATIC_0500
     * @tc.desc   with detectEncoding
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_detectEncoding_static_0500', Level.LEVEL2, async (): Promise<void> => {
      let uint8Array = new Uint8Array([0x00, 0x00, 0x4E, 0x2D]);
      let info = i18n.Unicode.detectEncoding(uint8Array);
      console.log('SUB_GLOBAL_detectEncoding_static_0500 value:', info.encodingName);
      console.log('SUB_GLOBAL_detectEncoding_static_0500 value:', info.confidence);
      expect(info.encodingName).assertEqual('UTF-32BE');
      expect(info.confidence).assertEqual(80);
    })

    /**
     * @tc.name   SUB_GLOBAL_detectEncoding_static_0600
     * @tc.number SUB_GLOBAL_DETECTENCODING_STATIC_0600
     * @tc.desc   with detectEncoding
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_detectEncoding_static_0600', Level.LEVEL2, async (): Promise<void> => {
      let uint8Array = new Uint8Array([0xC4, 0xEA, 0xCC, 0xE5]);
      let info = i18n.Unicode.detectEncoding(uint8Array);
      console.log('SUB_GLOBAL_detectEncoding_static_0600 value:', info.encodingName);
      console.log('SUB_GLOBAL_detectEncoding_static_0600 value:', info.confidence);
      expect(info.encodingName).assertEqual('ISO-8859-7');
      expect(info.confidence).assertEqual(60);
    })

    /**
     * @tc.name   SUB_GLOBAL_detectEncoding_static_0700
     * @tc.number SUB_GLOBAL_DETECTENCODING_STATIC_0700
     * @tc.desc   with detectEncoding
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_detectEncoding_static_0700', Level.LEVEL2, async (): Promise<void> => {
      let uint8Array = new Uint8Array([0xF0, 0xF4, 0xF6]);
      let info = i18n.Unicode.detectEncoding(uint8Array);
      console.log('SUB_GLOBAL_detectEncoding_static_0700 value:', info.encodingName);
      console.log('SUB_GLOBAL_detectEncoding_static_0700 value:', info.confidence);
      expect(info.encodingName).assertEqual('');
      expect(info.confidence).assertEqual(0);
    })

    /**
     * @tc.name   SUB_GLOBAL_detectEncoding_static_0800
     * @tc.number SUB_GLOBAL_DETECTENCODING_STATIC_0800
     * @tc.desc   with detectEncoding
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_detectEncoding_static_0800', Level.LEVEL2, async (): Promise<void> => {
      let uint8Array1 = new Uint8Array([0x44, 0x65, 0x72, 0x43, 0x6F, 0x64, 0x65]);
      let uint8Array2 = new Uint8Array([0x44, 0x65]);
      let info1 = i18n.Unicode.detectEncoding(uint8Array1);
      let info2 = i18n.Unicode.detectEncoding(uint8Array2);
      console.log('SUB_GLOBAL_detectEncoding_static_0800 value:', info1.confidence);
      console.log('SUB_GLOBAL_detectEncoding_static_0800 value:', info2.confidence);
      expect(info1.confidence < info2.confidence).assertTrue();
    })

    /**
     * @tc.name   SUB_GLOBAL_detectEncoding_static_0900
     * @tc.number SUB_GLOBAL_DETECTENCODING_STATIC_0900
     * @tc.desc   with detectEncoding
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_detectEncoding_static_0900', Level.LEVEL2, async (): Promise<void> => {
      let uint8Array1 = new Uint8Array([0xC4, 0xEA, 0xCC, 0xE5]);
      let uint8Array2 = new Uint8Array([0xC4, 0xEA, 0xCC, 0xE5, 0x11, 0x11, 0x11]);
      let info1 = i18n.Unicode.detectEncoding(uint8Array1);
      let info2 = i18n.Unicode.detectEncoding(uint8Array2);
      console.log('SUB_GLOBAL_detectEncoding_static_0900 value:', info1.confidence);
      console.log('SUB_GLOBAL_detectEncoding_static_0900 value:', info2.confidence);
      expect(info1.confidence > info2.confidence).assertTrue();
    })

    /**
     * @tc.name   SUB_GLOBAL_detectEncoding_static_1000
     * @tc.number SUB_GLOBAL_DETECTENCODING_STATIC_1000
     * @tc.desc   with detectEncoding
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_detectEncoding_static_1000', Level.LEVEL2, async (): Promise<void> => {
      let uint8Array = new Uint8Array();
      let info = i18n.Unicode.detectEncoding(uint8Array);
      console.log('SUB_GLOBAL_detectEncoding_static_1000 value:', info.encodingName);
      console.log('SUB_GLOBAL_detectEncoding_static_1000 value:', info.confidence);
      expect(info.encodingName).assertEqual('');
      expect(info.confidence).assertEqual(0);
    })

    /**
     * @tc.name   SUB_GLOBAL_detectEncoding_static_1100
     * @tc.number SUB_GLOBAL_DETECTENCODING_STATIC_1100
     * @tc.desc   with detectEncoding
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_detectEncoding_static_1100', Level.LEVEL2, async (): Promise<void> => {
      let uint8Array = new Uint8Array(0x000000000);
      let info = i18n.Unicode.detectEncoding(uint8Array);
      console.log('SUB_GLOBAL_detectEncoding_static_1100 value:', info.encodingName);
      console.log('SUB_GLOBAL_detectEncoding_static_1100 value:', info.confidence);
      expect(info.encodingName).assertEqual('');
      expect(info.confidence).assertEqual(0);
    })

    /**
     * @tc.name   testSymbolDateTimeFormatStatic_0700
     * @tc.number SUB_GLOBAL_I18N_CUSTOMSYMBOL_STATIC_0700
     * @tc.desc   test SymbolDateTimeFormat with undefined amPMSymbol param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSymbolDateTimeFormatStatic_0700', Level.LEVEL2, async (): Promise<void> => {
      let locale = new Intl.Locale("en-US", { "hourCycle": "h12" });
      let customSymbol: i18n.SymbolDateTimeFormatOptions = { "amPMSymbol": undefined };
      let symbolFormat = new i18n.SymbolDateTimeFormat(locale, customSymbol);
      let options = symbolFormat.resolvedOptions();
      console.log('testSymbolDateTimeFormatStatic_0700 result:'+ options.amPMSymbol);
      expect(options.amPMSymbol?.toString()).assertEqual('AM,PM');
    })

    /**
     * @tc.name   test_SymbolNumberFormat_static_0300
     * @tc.number SUB_GLOBAL_I18N_CUSTOMSYMBOL_STATIC_1000
     * @tc.desc   test SymbolNumberFormat with custom 0 character
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_SymbolNumberFormat_static_0300', Level.LEVEL2, async (): Promise<void> => {
      let locale = new Intl.Locale("en-US", { "numberingSystem": "latn" });
      let customSymbol: i18n.SymbolNumberFormatOptions = { "zero": "B" };
      try {
        let symbolFormat = new i18n.SymbolNumberFormat(locale, customSymbol);
        let numberFormat = symbolFormat.format(12345.06);
        console.log('test_SymbolNumberFormat_static_0300 result:', numberFormat);
        expect(numberFormat === '12,345.B6').assertTrue();
      } catch (e) {
        console.log('test_SymbolNumberFormat_static_0300 catch error:', e.code + e.message);
        expect(false).assertTrue();
      }
    })

    /**
     * @tc.name   test_SymbolNumberFormat_static_0500
     * @tc.number SUB_GLOBAL_I18N_CUSTOMSYMBOL_STATIC_1200
     * @tc.desc   test SymbolNumberFormat with empty SymbolNumberFormatOptions param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_SymbolNumberFormat_static_0500', Level.LEVEL2, async (): Promise<void> => {
      let locale = new Intl.Locale("en-US", { "numberingSystem": "latn" });
      let customSymbol: i18n.SymbolNumberFormatOptions = { "zero": "" };
      try {
        let symbolFormat = new i18n.SymbolNumberFormat(locale, customSymbol);
        let options = symbolFormat.resolvedOptions();
        console.log('test_SymbolNumberFormat_static_0500 result:', options.zero);
        expect(options.zero === '').assertTrue();
      } catch (e) {
        console.log('test_SymbolNumberFormat_static_0500 catch error:', e.code + e.message);
        expect(false).assertTrue();
      }
    })

    /**
     * @tc.name   test_SymbolNumberFormat_static_0900
     * @tc.number SUB_GLOBAL_I18N_CUSTOMSYMBOL_STATIC_1600
     * @tc.desc   test SymbolNumberFormat with empty nan option
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_SymbolNumberFormat_static_0900', Level.LEVEL2, async (): Promise<void> => {
      let locale = new Intl.Locale("en-US", { "numberingSystem": "latn" });
      let customSymbol: i18n.SymbolNumberFormatOptions = { "nan": "" };
      try {
        let symbolFormat = new i18n.SymbolNumberFormat(locale, customSymbol);
        let options = symbolFormat.resolvedOptions();
        console.log('test_SymbolNumberFormat_static_0900 result:', options.nan);
        expect(options.nan === '').assertTrue();
      } catch (e) {
        console.log('test_SymbolNumberFormat_static_0900 catch error:', e.code + e.message);
        expect(false).assertTrue();
      }
    })

    /**
     * @tc.name   test_SymbolNumberFormat_static_1300
     * @tc.number SUB_GLOBAL_I18N_CUSTOMSYMBOL_STATIC_2000
     * @tc.desc   test SymbolNumberFormat with empty minusSign param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_SymbolNumberFormat_static_1300', Level.LEVEL2, async (): Promise<void> => {
      let locale = new Intl.Locale("en-US", { "numberingSystem": "latn" });
      let customSymbol: i18n.SymbolNumberFormatOptions = { "minusSign": "" };
      try {
        let symbolFormat = new i18n.SymbolNumberFormat(locale, customSymbol);
        let options = symbolFormat.resolvedOptions();
        console.log('test_SymbolNumberFormat_static_1300 result:', options.minusSign);
        expect(options.minusSign === '').assertTrue();
      } catch (e) {
        console.log('test_SymbolNumberFormat_static_1300 catch error:', e.code + e.message);
        expect(false).assertTrue();
      }
    })

    /**
     * @tc.name   test_SymbolNumberFormat_static_1700
     * @tc.number SUB_GLOBAL_I18N_CUSTOMSYMBOL_STATIC_2400
     * @tc.desc   test SymbolNumberFormat with empty plusSign param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_SymbolNumberFormat_static_1700', Level.LEVEL2, async (): Promise<void> => {
      let locale = new Intl.Locale('en-US', { 'numberingSystem': 'latn' });
      let customSymbol: i18n.SymbolNumberFormatOptions = { 'plusSign': "" };
      try {
        let symbolFormat = new i18n.SymbolNumberFormat(locale, customSymbol);
        let options = symbolFormat.resolvedOptions();
        console.log('test_SymbolNumberFormat_static_1700 result:' + options.plusSign);
        expect(options.plusSign === '').assertTrue();
      } catch (e) {
        console.log('test_SymbolNumberFormat_static_1700 catch error:' + e.code + e.message);
        expect(false).assertTrue();
      }
    })

    /**
     * @tc.name   test_SymbolNumberFormat_static_2100
     * @tc.number SUB_GLOBAL_I18N_CUSTOMSYMBOL_STATIC_2800
     * @tc.desc   test SymbolNumberFormat with resolvedOptions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_SymbolNumberFormat_static_2100', Level.LEVEL2, async (): Promise<void> => {
      let locale = new Intl.Locale('en-US');
      let customSymbol: i18n.SymbolNumberFormatOptions = { 'infinity': '' };
      try {
        let symbolFormat = new i18n.SymbolNumberFormat(locale, customSymbol);
        let options = symbolFormat.resolvedOptions();
        console.log('test_SymbolNumberFormat_static_2100 result:' + options.infinity);
        expect(options.infinity === '').assertTrue();
      } catch (e) {
        console.log('test_SymbolNumberFormat_static_2100 catch error:' + e.code + e.message);
        expect(false).assertTrue();
      }
    })

    /**
     * @tc.name   i18n_setAppDefaultTimeZoneById_static_0400
     * @tc.number SUB_GLOBAL_APPSSETTINGTIMEZONE_STATIC_0400
     * @tc.desc   test getAppDefaultTimeZone with Asia/Shanghai
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('i18n_setAppDefaultTimeZoneById_static_0400', Level.LEVEL2, async (): Promise<void> => {
      let getAppTimeZone: i18n.TimeZone = i18n.TimeZone.getAppDefaultTimeZone();
      let value: string = getAppTimeZone.getID();
      console.log('i18n_setAppDefaultTimeZoneById_static_0400 value:', value);
      expect(value).assertEqual('Asia/Shanghai');
    })

    /**
     * @tc.name   i18n_setAppDefaultTimeZoneById_static_0100
     * @tc.number SUB_GLOBAL_APPSSETTINGTIMEZONE_STATIC_0100
     * @tc.desc   test setAppDefaultTimeZoneById with Asia/Hong_Kong
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('i18n_setAppDefaultTimeZoneById_static_0100', Level.LEVEL2, async (): Promise<void> => {
      let timeZone: i18n.TimeZone = i18n.getTimeZone();
      let GetID: string = timeZone.getID();
      i18n.TimeZone.setAppDefaultTimeZoneById('Asia/Hong_Kong');
      let getAppTimeZone: i18n.TimeZone = i18n.TimeZone.getAppDefaultTimeZone();
      let value: string = getAppTimeZone.getID();
      let value2: string = getAppTimeZone.getDisplayName();
      console.log('i18n_setAppDefaultTimeZoneById_static_0100 value:', value);
      expect(value).assertEqual('Asia/Hong_Kong');
      expect(value2).assertEqual('香港标准时间');
      i18n.TimeZone.setAppDefaultTimeZoneById(GetID);
    })

    /**
     * @tc.name   i18n_setAppDefaultTimeZoneById_static_0200
     * @tc.number SUB_GLOBAL_APPSSETTINGTIMEZONE_STATIC_0200
     * @tc.desc   test setAppDefaultTimeZoneById with America/New_York
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('i18n_setAppDefaultTimeZoneById_static_0200', Level.LEVEL2, async (): Promise<void> => {
      let timeZone: i18n.TimeZone = i18n.getTimeZone();
      let GetID: string = timeZone.getID();
      i18n.TimeZone.setAppDefaultTimeZoneById('America/New_York');
      let getAppTimeZone: i18n.TimeZone = i18n.TimeZone.getAppDefaultTimeZone();
      let value: string = getAppTimeZone.getID();
      let value2: string = getAppTimeZone.getDisplayName();
      console.log('i18n_setAppDefaultTimeZoneById_static_0200 value:', value);
      expect(value).assertEqual('America/New_York');
      expect(value2).assertEqual('北美东部时间');
      i18n.TimeZone.setAppDefaultTimeZoneById(GetID);
    })

    /**
     * @tc.name   i18n_setAppDefaultTimeZoneById_static_0300
     * @tc.number SUB_GLOBAL_APPSSETTINGTIMEZONE_STATIC_0300
     * @tc.desc   test setAppDefaultTimeZoneById with America/New_York
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('i18n_setAppDefaultTimeZoneById_static_0300', Level.LEVEL2, async (): Promise<void> => {
      let timeZone: i18n.TimeZone = i18n.getTimeZone();
      let GetID: string = timeZone.getID();
      i18n.TimeZone.setAppDefaultTimeZoneById('America/New_York');
      let getAppTimeZone: i18n.TimeZone = i18n.TimeZone.getAppDefaultTimeZone();
      let value: string = getAppTimeZone.getID();
      let dateTimeFormat: Intl.DateTimeFormat = new Intl.DateTimeFormat('zh-Hans-CN', {
        timeZone: value,
        dateStyle: 'long',
        timeStyle: 'long',
        hour12: true
      });
      let date: Date = new Date(2025, 4, 13, 12, 30);
      let dateFormat = dateTimeFormat.format(date);
      console.log('i18n_setAppDefaultTimeZoneById_static_0300 value:', dateFormat);
      expect(dateFormat).assertEqual('2025年5月13日 GMT-4 上午12:30:00');
      i18n.TimeZone.setAppDefaultTimeZoneById(GetID);
    })

    /**
     * @tc.name   i18n_setAppDefaultTimeZoneById_static_0500
     * @tc.number SUB_GLOBAL_APPSSETTINGTIMEZONE_STATIC_0500
     * @tc.desc   test getAppDefaultTimeZone with Asia/123
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('i18n_setAppDefaultTimeZoneById_static_0500', Level.LEVEL2, async (): Promise<void> => {
      try {
        i18n.TimeZone.setAppDefaultTimeZoneById('Asia/123');
      } catch (e) {
        console.log('i18n_setAppDefaultTimeZoneById_static_0500 code&message:', e.code + e.message);
        expect(Number(e.code)).assertEqual(8900001);
      }
    })

    /**
     * @tc.name   i18n_setUnicodeWrappedBidiDirection_static_0100
     * @tc.number SUB_GLOBAL_MIRRORDISPLAY_STATIC_0100
     * @tc.desc   test setUnicodeWrappedBidiDirection with LTR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('i18n_setUnicodeWrappedBidiDirection_static_0100', Level.LEVEL2, async (): Promise<void> => {
      let res: string = '知己';
      let ltr: string = i18n.I18NUtil.setUnicodeWrappedBidiDirection(res, 'LTR');
      let LTR: string = '海内存' + ltr + '，天涯若比邻。';
      console.log('i18n_setUnicodeWrappedBidiDirection_static_0100 value:', LTR);
      expect(LTR).assertEqual('海内存' + '\u2066' + '知己' + '\u2069' + '，天涯若比邻。');
    })

    /**
     * @tc.name   i18n_setUnicodeWrappedBidiDirection_static_0200
     * @tc.number SUB_GLOBAL_MIRRORDISPLAY_STATIC_0200
     * @tc.desc   test setUnicodeWrappedBidiDirection with RTL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('i18n_setUnicodeWrappedBidiDirection_static_0200', Level.LEVEL2, async (): Promise<void> => {
      let res: string = '知己';
      let rtl: string = i18n.I18NUtil.setUnicodeWrappedBidiDirection(res, 'RTL');
      let RTL: string = '海内存' + rtl + '，天涯若比邻。';
      console.log('i18n_setUnicodeWrappedBidiDirection_static_0200 value:', RTL);
      expect(RTL).assertEqual('海内存' + '\u2067' + '知己' + '\u2069' + '，天涯若比邻。');
    })

    /**
     * @tc.name   i18n_setUnicodeWrappedBidiDirection_static_0300
     * @tc.number SUB_GLOBAL_MIRRORDISPLAY_STATIC_0300
     * @tc.desc   test setUnicodeWrappedBidiDirection with RTL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('i18n_setUnicodeWrappedBidiDirection_static_0300', Level.LEVEL2, async (): Promise<void> => {
      let res: string = 'AB';
      let rtl: string = i18n.I18NUtil.setUnicodeWrappedBidiDirection(res, 'RTL');
      let RTL: string = '海内存' + rtl + '，天涯若比邻。';
      console.log('i18n_setUnicodeWrappedBidiDirection_static_0300 value:', RTL);
      expect(RTL).assertEqual('海内存' + '\u2067' + 'AB' + '\u2069' + '，天涯若比邻。');
    })

    /**
     * @tc.name   i18n_setUnicodeWrappedBidiDirection_static_0400
     * @tc.number SUB_GLOBAL_MIRRORDISPLAY_STATIC_0400
     * @tc.desc   test setUnicodeWrappedBidiDirection with RTL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('i18n_setUnicodeWrappedBidiDirection_static_0400', Level.LEVEL2, async (): Promise<void> => {
      let res: string = '0 1 2 3';
      let rtl: string = i18n.I18NUtil.setUnicodeWrappedBidiDirection(res, 'RTL');
      let RTL: string = '海内存' + rtl + '，天涯若比邻。';
      console.log('i18n_setUnicodeWrappedBidiDirection_static_0400 value:', RTL);
      expect(RTL).assertEqual('海内存' + '\u2067' + '0 1 2 3' + '\u2069' + '，天涯若比邻。');
    })

    /**
     * @tc.name   i18n_setUnicodeWrappedBidiDirection_static_0500
     * @tc.number SUB_GLOBAL_MIRRORDISPLAY_STATIC_0500
     * @tc.desc   test setUnicodeWrappedBidiDirection with RTL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('i18n_setUnicodeWrappedBidiDirection_static_0500', Level.LEVEL2, async (): Promise<void> => {
      let res: string = 'تفاحة';
      let ltr: string = i18n.I18NUtil.setUnicodeWrappedBidiDirection(res, 'LTR');
      let LTR: string = 'Apple is a fruit, AR name is ' + ltr + ', is very delicious.';
      console.log('i18n_setUnicodeWrappedBidiDirection_static_0500 value:', LTR);
      expect(LTR).assertEqual('Apple is a fruit, AR name is ' + '\u2066' + 'تفاحة' + '\u2069' + ', is very delicious.');
    })

    /**
     * @tc.name   i18n_setUnicodeWrappedBidiDirection_static_0600
     * @tc.number SUB_GLOBAL_MIRRORDISPLAY_STATIC_0600
     * @tc.desc   test setUnicodeWrappedBidiDirection with RTL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('i18n_setUnicodeWrappedBidiDirection_static_0600', Level.LEVEL2, async (): Promise<void> => {
      let res: string = 'تفاحة';
      let rtl: string = i18n.I18NUtil.setUnicodeWrappedBidiDirection(res, 'RTL');
      let RTL: string = 'Apple is a fruit, AR name is ' + rtl + ', is very delicious.';
      console.log('i18n_setUnicodeWrappedBidiDirection_static_0600 value:', RTL);
      expect(RTL).assertEqual('Apple is a fruit, AR name is ' + '\u2067' + 'تفاحة' + '\u2069' + ', is very delicious.');
    })

    /**
     * @tc.name   i18n_setUnicodeWrappedBidiDirection_static_0700
     * @tc.number SUB_GLOBAL_MIRRORDISPLAY_STATIC_0700
     * @tc.desc   test setUnicodeWrappedBidiDirection with RTL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('i18n_setUnicodeWrappedBidiDirection_static_0700', Level.LEVEL2, async (): Promise<void> => {
      let res: string = 'تفاحة';
      let ltr: string = i18n.I18NUtil.setUnicodeWrappedBidiDirection(res, 'LTR');
      let LTR: string = 'الرقم' + ':' + ltr + ',' + '.الرقم';
      console.log('i18n_setUnicodeWrappedBidiDirection_static_0700 value:', LTR);
      expect(LTR).assertEqual('الرقم' +':'+ '\u2066' + 'تفاحة' + '\u2069' + ',' + '.الرقم');
    })

    /**
     * @tc.name   i18n_setUnicodeWrappedBidiDirection_static_0800
     * @tc.number SUB_GLOBAL_MIRRORDISPLAY_STATIC_0800
     * @tc.desc   test setUnicodeWrappedBidiDirection with RTL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('i18n_setUnicodeWrappedBidiDirection_static_0800', Level.LEVEL2, async (): Promise<void> => {
      let res: string = 'تفاحة';
      let rtl: string = i18n.I18NUtil.setUnicodeWrappedBidiDirection(res, 'RTL');
      let RTL: string = 'الرقم' + ':' + rtl + ',' + '.الرقم';
      console.log('i18n_setUnicodeWrappedBidiDirection_static_0800 value:', RTL);
      expect(RTL).assertEqual('الرقم' +':'+ '\u2067' + 'تفاحة' + '\u2069' + ',' + '.الرقم');
    })

    /**
     * @tc.name   i18n_setUnicodeWrappedBidiDirection_static_0900
     * @tc.number SUB_GLOBAL_MIRRORDISPLAY_STATIC_0900
     * @tc.desc   test setUnicodeWrappedBidiDirection with ''
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('i18n_setUnicodeWrappedBidiDirection_static_0900', Level.LEVEL2, async (): Promise<void> => {
      let res: string = '';
      let ltr: string = i18n.I18NUtil.setUnicodeWrappedBidiDirection(res, 'LTR');
      let LTR: string = '海内存' + ltr + '，天涯若比邻。';
      console.log('i18n_setUnicodeWrappedBidiDirection_static_0900 value:', LTR);
      expect(LTR).assertEqual('海内存' + '\u2066' + '\u2069' + '，天涯若比邻。');
    })

    /**
     * @tc.name SUB_GLOBAL_ISO8601DateTimeFormat_Test_Static_0100
     * @tc.number SUB_GLOBAL_ISO8601DateTimeFormat_Test_Static_0100
     * @tc.desc test ISO8601DateTimeFormat with Asia/Shanghai
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL2
     */
    it('SUB_GLOBAL_ISO8601DateTimeFormat_Test_Static_0100', Level.LEVEL2, () => {
      let date: Date = new Date(2027, 10, 10, 10, 20, 30, 123);
      let timeZone: i18n.TimeZone = i18n.getTimeZone('Asia/Shanghai');
      let iso = new i18n.ISO8601DateTimeFormat({
        dateFormat: 'calendar',
        timePrecision: 'milliSeconds',
        timeZone,
        separatorStyle: 'basic',
        displayTimeZone: true
      });
      let value: string = iso.format(date);
      console.log('SUB_GLOBAL_ISO8601DateTimeFormat_Test_Static_0100 value:', value);
      expect(value).assertEqual('20271110T102030.123+0800');
    })

    /**
     * @tc.name SUB_GLOBAL_ISO8601DateTimeFormat_Test_Static_0200
     * @tc.number SUB_GLOBAL_ISO8601DateTimeFormat_Test_Static_0200
     * @tc.desc test ISO8601DateTimeFormat with America/New_York
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL2
     */
    it('SUB_GLOBAL_ISO8601DateTimeFormat_Test_Static_0200', Level.LEVEL2, () => {
      let date: Date = new Date(2026, 0, 2, 10, 20, 30, 0);
      let timeZone: i18n.TimeZone = i18n.getTimeZone('America/New_York');
      let iso = new i18n.ISO8601DateTimeFormat({
        dateFormat: 'ordinal',
        timePrecision: 'seconds',
        timeZone,
        separatorStyle: 'extended',
        displayTimeZone: false
      });
      let value: string = iso.format(date);
      console.log('SUB_GLOBAL_ISO8601DateTimeFormat_Test_Static_0200 value:', value);
      expect(value).assertEqual('2026-001T21:20:30');
    })

    /**
     * @tc.name SUB_GLOBAL_ISO8601DateTimeFormat_Test_Static_0300
     * @tc.number SUB_GLOBAL_ISO8601DateTimeFormat_Test_Static_0300
     * @tc.desc test ISO8601DateTimeFormat with Asia/Kolkata
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL2
     */
    it('SUB_GLOBAL_ISO8601DateTimeFormat_Test_Static_0300', Level.LEVEL2, () => {
      let date: Date = new Date(2026, 0, 2, 10, 20, 30, 0);
      let timeZone: i18n.TimeZone = i18n.getTimeZone('Asia/Kolkata');
      let iso = new i18n.ISO8601DateTimeFormat({
        dateFormat: 'week',
        timePrecision: 'minutes',
        timeZone,
        displayTimeZone: true
      });
      let value: string = iso.format(date);
      console.log('SUB_GLOBAL_ISO8601DateTimeFormat_Test_Static_0300 value:', value);
      expect(value).assertEqual('2026-W01-6T07:50+05:30');
    })

    /**
     * @tc.name SUB_GLOBAL_ISO8601DateTimeFormat_Test_Static_0400
     * @tc.number SUB_GLOBAL_ISO8601DateTimeFormat_Test_Static_0400
     * @tc.desc test ISO8601DateTimeFormat with Africa/Cairo
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL2
     */
    it('SUB_GLOBAL_ISO8601DateTimeFormat_Test_Static_0400', Level.LEVEL2, () => {
      let date: Date = new Date(2026, 0, 2, 10, 20, 30, 0);
      let timeZone: i18n.TimeZone = i18n.getTimeZone('Africa/Cairo');
      let iso = new i18n.ISO8601DateTimeFormat({
        dateFormat: 'calendar',
        timePrecision: 'hours',
        timeZone,
        displayTimeZone: true
      });
      let value: string = iso.format(date);
      console.log('SUB_GLOBAL_ISO8601DateTimeFormat_Test_Static_0400 value:', value);
      expect(value).assertEqual('2026-01-02T04+02:00');
    })

    /**
     * @tc.name SUB_GLOBAL_ISO8601DateTimeFormat_Test_Static_0500
     * @tc.number SUB_GLOBAL_ISO8601DateTimeFormat_Test_Static_0500
     * @tc.desc test ISO8601DateTimeFormat with Asia/Riyadh
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL2
     */
    it('SUB_GLOBAL_ISO8601DateTimeFormat_Test_Static_0500', Level.LEVEL2, () => {
      let date: Date = new Date(2026, 0, 1, 10, 20, 30, 0);
      let timeZone: i18n.TimeZone = i18n.getTimeZone('Asia/Riyadh');
      let iso = new i18n.ISO8601DateTimeFormat({
        dateFormat: 'calendar',
        timePrecision: 'dateOnly',
        timeZone,
        displayTimeZone: true
      });
      let value: string = iso.format(date);
      console.log('SUB_GLOBAL_ISO8601DateTimeFormat_Test_Static_0500 value:', value);
      expect(value).assertEqual('2026-01-01');
    })

    /**
     * @tc.name SUB_GLOBAL_ISO8601DateTimeFormat_Test_Static_0600
     * @tc.number SUB_GLOBAL_ISO8601DateTimeFormat_Test_Static_0600
     * @tc.desc test ISO8601DateTimeFormat with
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL2
     */
    it('SUB_GLOBAL_ISO8601DateTimeFormat_Test_Static_0600', Level.LEVEL2, () => {
      let date: Date = new Date(2026, 0, 1, 10, 20, 30, 0);
      let iso = new i18n.ISO8601DateTimeFormat();
      let value: string = iso.format(date);
      console.log('SUB_GLOBAL_ISO8601DateTimeFormat_Test_Static_0600 value:', value);
      expect(value).assertEqual('2026-01-01T02:20:30Z');
    })

    /**
     * @tc.name SUB_GLOBAL_ISO8601DateTimeFormat_Test_Static_0700
     * @tc.number SUB_GLOBAL_ISO8601DateTimeFormat_Test_Static_0700
     * @tc.desc test ISO8601DateTimeFormat with calendar
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL2
     */
    it('SUB_GLOBAL_ISO8601DateTimeFormat_Test_Static_0700', Level.LEVEL2, () => {
      let date: Date = new Date(2026, 0, 1, 10, 20, 30, 0);
      let iso = new i18n.ISO8601DateTimeFormat({ dateFormat: 'calendar' });
      let value: string = iso.format(date);
      console.log('SUB_GLOBAL_ISO8601DateTimeFormat_Test_Static_0700 value:', value);
      expect(value).assertEqual('2026-01-01T02:20:30Z');
    })

    /**
     * @tc.name SUB_GLOBAL_ISO8601DateTimeFormat_Test_Static_0800
     * @tc.number SUB_GLOBAL_ISO8601DateTimeFormat_Test_Static_0800
     * @tc.desc test ISO8601DateTimeFormat with milliSeconds
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL2
     */
    it('SUB_GLOBAL_ISO8601DateTimeFormat_Test_Static_0800', Level.LEVEL2, () => {
      let date: Date = new Date(2026, 0, 1, 10, 20, 30, 0);
      let iso = new i18n.ISO8601DateTimeFormat({ timePrecision: 'milliSeconds' });
      let value: string = iso.format(date);
      console.log('SUB_GLOBAL_ISO8601DateTimeFormat_Test_Static_0800 value:', value);
      expect(value).assertEqual('2026-01-01T02:20:30.000Z');
    })

    /**
     * @tc.name SUB_GLOBAL_ISO8601DateTimeFormat_Test_Static_0900
     * @tc.number SUB_GLOBAL_ISO8601DateTimeFormat_Test_Static_0900
     * @tc.desc test ISO8601DateTimeFormat with timeZone
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL2
     */
    it('SUB_GLOBAL_ISO8601DateTimeFormat_Test_Static_0900', Level.LEVEL2, () => {
      let date: Date = new Date(2026, 0, 1, 10, 20, 30, 0);
      let timeZone: i18n.TimeZone = i18n.getTimeZone();
      let iso = new i18n.ISO8601DateTimeFormat({ timeZone });
      let value: string = iso.format(date);
      console.log('SUB_GLOBAL_ISO8601DateTimeFormat_Test_Static_0800 value:', value);
      expect(value).assertEqual('2026-01-01T10:20:30+08:00');
    })

    /**
     * @tc.name SUB_GLOBAL_ISO8601DateTimeFormat_Test_Static_1000
     * @tc.number SUB_GLOBAL_ISO8601DateTimeFormat_Test_Static_1000
     * @tc.desc test ISO8601DateTimeFormat with timeZone
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL2
     */
    it('SUB_GLOBAL_ISO8601DateTimeFormat_Test_Static_1000', Level.LEVEL2, () => {
      let date: Date = new Date(2026, 0, 1, 10, 20, 30, 0);
      let iso = new i18n.ISO8601DateTimeFormat({ displayTimeZone: true });
      let value: string = iso.format(date);
      console.log('SUB_GLOBAL_ISO8601DateTimeFormat_Test_Static_1000 value:', value);
      expect(value).assertEqual('2026-01-01T02:20:30Z');
    })

    /**
     * @tc.name SUB_GLOBAL_ISO8601DateTimeFormat_GetTimeZone_NullString_Test_Static_1100
     * @tc.number SUB_GLOBAL_ISO8601DateTimeFormat_GetTimeZone_nullString_Test_Static_1100
     * @tc.desc test ISO8601DateTimeFormat with timeZone
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL2
     */
    it('SUB_GLOBAL_ISO8601DateTimeFormat_GetTimeZone_NullString_Test_Static_1100', Level.LEVEL2, () => {
      let date: Date = new Date(2026, 0, 1, 1, 20, 30, 0);
      let timeZone: i18n.TimeZone = i18n.getTimeZone('');
      let iso = new i18n.ISO8601DateTimeFormat({
        dateFormat: 'calendar',
        timePrecision: 'milliSeconds',
        timeZone,
        displayTimeZone: true
      });
      let value: string = iso.format(date);
      console.log('SUB_GLOBAL_ISO8601DateTimeFormat_GetTimeZone_NullString_Test_Static_1100 value:', value);
      expect(value).assertEqual('2026-01-01T01:20:30.000+08:00');
    })

    /**
     * @tc.name SUB_GLOBAL_ISO8601DateTimeFormat_DateFormat_Undefined_Test_Static_1400
     * @tc.number SUB_GLOBAL_ISO8601DateTimeFormat_DateFormat_Undefined_Test_Static_1400
     * @tc.desc test ISO8601DateTimeFormat with dateFormat
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL2
     */
    it('SUB_GLOBAL_ISO8601DateTimeFormat_DateFormat_Undefined_Test_Static_1400', Level.LEVEL2, () => {
      let date: Date = new Date(2026, 0, 1, 1, 20, 30, 0);
      let timeZone: i18n.TimeZone = i18n.getTimeZone();
      let iso = new i18n.ISO8601DateTimeFormat({
        dateFormat: undefined,
        timePrecision: 'milliSeconds',
        timeZone,
        displayTimeZone: true
      });
      let value: string = iso.format(date);
      console.log('SUB_GLOBAL_ISO8601DateTimeFormat_DateFormat_Undefined_Test_Static_1400 value:', value);
      expect(value).assertEqual('2026-01-01T01:20:30.000+08:00');
    })

    /**
     * @tc.name SUB_GLOBAL_ISO8601DateTimeFormat_TimePrecision_Undefined_Test_Static_1500
     * @tc.number SUB_GLOBAL_ISO8601DateTimeFormat_TimePrecision_Undefined_Test_Static_1500
     * @tc.desc test ISO8601DateTimeFormat with timePrecision
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL2
     */
    it('SUB_GLOBAL_ISO8601DateTimeFormat_TimePrecision_Undefined_Test_Static_1500', Level.LEVEL2, () => {
      let date: Date = new Date(2026, 0, 1, 1, 20, 30, 0);
      let timeZone: i18n.TimeZone = i18n.getTimeZone();
      let iso = new i18n.ISO8601DateTimeFormat({
        dateFormat: 'calendar',
        timePrecision: undefined,
        timeZone,
        displayTimeZone: true
      });
      let value: string = iso.format(date);
      console.log('SUB_GLOBAL_ISO8601DateTimeFormat_TimePrecision_Undefined_Test_Static_1500 value:', value);
      expect(value).assertEqual('2026-01-01T01:20:30+08:00');
    })

    /**
     * @tc.name SUB_GLOBAL_ISO8601DateTimeFormat_SeparatorStyle_Undefined_Test_Static_1800
     * @tc.number SUB_GLOBAL_ISO8601DateTimeFormat_SeparatorStyle_Undefined_Test_Static_1800
     * @tc.desc test ISO8601DateTimeFormat with separatorStyle
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL2
     */
    it('SUB_GLOBAL_ISO8601DateTimeFormat_SeparatorStyle_Undefined_Test_Static_1800', Level.LEVEL2, () => {
      let date: Date = new Date(2026, 0, 2, 10, 20, 30, 0);
      let timeZone: i18n.TimeZone = i18n.getTimeZone();
      let iso = new i18n.ISO8601DateTimeFormat({
        dateFormat: 'calendar',
        timePrecision: 'milliSeconds',
        timeZone,
        separatorStyle: undefined,
        displayTimeZone: true
      });
      let value: string = iso.format(date);
      console.log('SUB_GLOBAL_ISO8601DateTimeFormat_SeparatorStyle_Undefined_Test_Static_1800 value:', value);
      expect(value).assertEqual('2026-01-02T10:20:30.000+08:00');
    })

    /**
     * @tc.name SUB_GLOBAL_GetChineseCalendar_Test_Static_0100
     * @tc.number SUB_GLOBAL_GetChineseCalendar_Test_Static_0100
     * @tc.desc test setChineseCalendarTime with cyclicalYear 43
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL2
     */
    it('SUB_GLOBAL_GetChineseCalendar_Test_Static_0100', Level.LEVEL2, () => {
      let locale: Intl.Locale = new Intl.Locale('zh-Hans-CN');
      let chineseCalendar: i18n.ChineseCalendar = i18n.getChineseCalendar(locale);
      chineseCalendar.setChineseCalendarTime({
        gregorianYear: 2026,
        cyclicalYear: 43,
        month: 1,
        date: 23,
        isLeapMonth: false,
        hour: 10,
        minute: 20,
        second: 30
      })
      let date: Date = new Date(2026, 3, 10, 10, 20, 30);
      let value: number = chineseCalendar.compareDays(date);
      console.log('SUB_GLOBAL_GetChineseCalendar_Test_Static_0100 value:', value);
      expect(value).assertEqual(-1);
    })

    /**
     * @tc.name SUB_GLOBAL_GetChineseCalendar_Test_Static_0200
     * @tc.number SUB_GLOBAL_GetChineseCalendar_Test_Static_0200
     * @tc.desc test setChineseCalendarTime with cyclicalYear 49
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL2
     */
    it('SUB_GLOBAL_GetChineseCalendar_Test_Static_0200', Level.LEVEL2, () => {
      let locale: Intl.Locale = new Intl.Locale('zh-Hans-CN');
      let chineseCalendar: i18n.ChineseCalendar = i18n.getChineseCalendar(locale);
      chineseCalendar.setChineseCalendarTime({
        gregorianYear: 2026,
        cyclicalYear: 49,
        month: 2,
        date: 23
      })
      let value1: number = chineseCalendar.get('year');
      let value2: number = chineseCalendar.get('month');
      let value3: number = chineseCalendar.get('date');
      console.log('SUB_GLOBAL_GetChineseCalendar_Test_Static_0200 value1:', value1);
      console.log('SUB_GLOBAL_GetChineseCalendar_Test_Static_0200 value2:', value2);
      console.log('SUB_GLOBAL_GetChineseCalendar_Test_Static_0200 value3:', value3);
      expect(value1).assertEqual(49);
      expect(value2).assertEqual(2);
      expect(value3).assertEqual(23);
    })

    /**
     * @tc.name SUB_GLOBAL_GetChineseCalendar_Test_Static_0300
     * @tc.number SUB_GLOBAL_GetChineseCalendar_Test_Static_0300
     * @tc.desc test setChineseCalendarTime with cyclicalYear 49
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL2
     */
    it('SUB_GLOBAL_GetChineseCalendar_Test_Static_0300', Level.LEVEL2, () => {
      let locale: Intl.Locale = new Intl.Locale('zh-Hans-CN');
      let chineseCalendar: i18n.ChineseCalendar = i18n.getChineseCalendar(locale);
      chineseCalendar.setChineseCalendarTime({
        gregorianYear: 2026,
        cyclicalYear: 49,
        month: 2,
        date: 23,
        isLeapMonth: true,
        hour: 10,
        minute: 20,
        second: 30
      })
      chineseCalendar.add('year', 1);
      let value: number = chineseCalendar.get('year');
      console.log('SUB_GLOBAL_GetChineseCalendar_Test_Static_0300 value:', value);
      expect(value).assertEqual(50);
    })

    /**
     * @tc.name SUB_GLOBAL_GetChineseCalendar_Test_Static_0400
     * @tc.number SUB_GLOBAL_GetChineseCalendar_Test_Static_0400
     * @tc.desc test setChineseCalendarTime with cyclicalYear 49
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL2
     */
    it('SUB_GLOBAL_GetChineseCalendar_Test_Static_0400', Level.LEVEL2, () => {
      let locale: Intl.Locale = new Intl.Locale('zh-Hans-CN');
      let chineseCalendar: i18n.ChineseCalendar = i18n.getChineseCalendar(locale);
      chineseCalendar.setChineseCalendarTime({
        gregorianYear: 2026,
        cyclicalYear: 49,
        month: 2,
        date: 23,
        isLeapMonth: true,
        hour: 10,
        minute: 20,
        second: 30
      })
      chineseCalendar.add('date', 1);
      let value: number = chineseCalendar.get('date');
      console.log('SUB_GLOBAL_GetChineseCalendar_Test_Static_0400 value:', value);
      expect(value).assertEqual(24);
    })

    /**
     * @tc.name SUB_GLOBAL_GetChineseCalendar_Test_Static_0500
     * @tc.number SUB_GLOBAL_GetChineseCalendar_Test_Static_0500
     * @tc.desc test setChineseCalendarTime with cyclicalYear 49
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL2
     */
    it('SUB_GLOBAL_GetChineseCalendar_Test_Static_0500', Level.LEVEL2, () => {
      let locale: Intl.Locale = new Intl.Locale('zh-Hans-CN');
      let chineseCalendar: i18n.ChineseCalendar = i18n.getChineseCalendar(locale);
      let date: Date = new Date(2027, 10, 10, 10, 20, 30);
      chineseCalendar.setTime(date);
      let value: number = chineseCalendar.get('year');
      console.log('SUB_GLOBAL_GetChineseCalendar_Test_Static_0500 value:', value);
      expect(value).assertEqual(44);
    })

    /**
     * @tc.name SUB_GLOBAL_GetChineseCalendar_Test_Static_0600
     * @tc.number SUB_GLOBAL_GetChineseCalendar_Test_Static_0600
     * @tc.desc test setChineseCalendarTime with cyclicalYear 49
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL2
     */
    it('SUB_GLOBAL_GetChineseCalendar_Test_Static_0600', Level.LEVEL2, () => {
      let locale: Intl.Locale = new Intl.Locale('ar-EA');
      let chineseCalendar: i18n.ChineseCalendar = i18n.getChineseCalendar(locale);
      chineseCalendar.setChineseCalendarTime({
        gregorianYear: 2026,
        cyclicalYear: 43,
        month: 2,
        date: 23,
        isLeapMonth: true,
        hour: 10,
        minute: 20,
        second: 30
      })
      let value: number = chineseCalendar.get('year');
      console.log('SUB_GLOBAL_GetChineseCalendar_Test_Static_0600 value:', value);
      expect(value).assertEqual(43);
    })

    /**
     * @tc.name SUB_GLOBAL_GetChineseCalendar_Test_Static_0700
     * @tc.number SUB_GLOBAL_GetChineseCalendar_Test_Static_0700
     * @tc.desc test setChineseCalendarTime with chinese time and time
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL2
     */
    it('SUB_GLOBAL_GetChineseCalendar_Test_Static_0700', Level.LEVEL2, () => {
      let locale: Intl.Locale = new Intl.Locale('zh-Hans-CN');
      let chineseCalendar: i18n.ChineseCalendar = i18n.getChineseCalendar(locale);
      chineseCalendar.setTimeZone('Asia/Shanghai');
      let calendar = i18n.getCalendar('zh-Hans-CN', 'gregory');
      calendar.setTimeZone('Asia/Shanghai');
      calendar.set(1947, 2, 23);
      chineseCalendar.setTime(calendar.getTimeInMillis());
      console.log('SUB_GLOBAL_GetChineseCalendar_Test_Static_0700 month1:', chineseCalendar.get('month'));
      console.log('SUB_GLOBAL_GetChineseCalendar_Test_Static_0700 date1:', chineseCalendar.get('date'));
      expect(chineseCalendar.get('month')).assertEqual(1);
      expect(chineseCalendar.get('date')).assertEqual(1);
      chineseCalendar.setChineseCalendarTime({
        gregorianYear: 1947,
        cyclicalYear: 24,
        month: 1,
        date: 1,
        isLeapMonth: true,
      })
      calendar.setTime(chineseCalendar.getTimeInMillis());
      let value1: number = calendar.get('month');
      let value2: number = calendar.get('date');
      console.log('SUB_GLOBAL_GetChineseCalendar_Test_Static_0700 value1:', value1);
      console.log('SUB_GLOBAL_GetChineseCalendar_Test_Static_0700 value2:', value2);
      expect(value1).assertEqual(2);
      expect(value2).assertEqual(23);
    })

    /**
     * @tc.name SUB_GLOBAL_GetChineseCalendar_Test_Static_0800
     * @tc.number SUB_GLOBAL_GetChineseCalendar_Test_Static_0800
     * @tc.desc test setChineseCalendarTime with is_leap_month 1
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL2
     */
    it('SUB_GLOBAL_GetChineseCalendar_Test_Static_0800', Level.LEVEL2, () => {
      let locale: Intl.Locale = new Intl.Locale('zh-Hans-CN');
      let chineseCalendar: i18n.ChineseCalendar = i18n.getChineseCalendar(locale);
      chineseCalendar.setChineseCalendarTime({
        gregorianYear: 1947,
        cyclicalYear: 24,
        month: 1,
        date: 1,
        isLeapMonth: true,
      })
      let value: number = chineseCalendar.get('is_leap_month');
      console.log('SUB_GLOBAL_GetChineseCalendar_Test_Static_0800 value:', value);
      expect(value).assertEqual(1);
    })

    /**
     * @tc.name SUB_GLOBAL_GetChineseCalendar_Test_Static_0900
     * @tc.number SUB_GLOBAL_GetChineseCalendar_Test_Static_0900
     * @tc.desc test setChineseCalendarTime with is_leap_month 0
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL2
     */
    it('SUB_GLOBAL_GetChineseCalendar_Test_Static_0900', Level.LEVEL2, () => {
      let locale: Intl.Locale = new Intl.Locale('zh-Hans-CN');
      let chineseCalendar: i18n.ChineseCalendar = i18n.getChineseCalendar(locale);
      chineseCalendar.setChineseCalendarTime({
        gregorianYear: 2026,
        cyclicalYear: 24,
        month: 1,
        date: 1,
        isLeapMonth: true,
      })
      let value: number = chineseCalendar.get('is_leap_month');
      console.log('SUB_GLOBAL_GetChineseCalendar_Test_Static_0900 value:', value);
      expect(value).assertEqual(0);
    })

    /**
     * @tc.name SUB_GLOBAL_GetChineseCalendar_Test_Static_1000
     * @tc.number SUB_GLOBAL_GetChineseCalendar_Test_Static_1000
     * @tc.desc test setChineseCalendarTime with is_leap_month 0
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL2
     */
    it('SUB_GLOBAL_GetChineseCalendar_Test_Static_1000', Level.LEVEL2, () => {
      let locale: Intl.Locale = new Intl.Locale('zh-Hans-CN');
      let chineseCalendar: i18n.ChineseCalendar = i18n.getChineseCalendar(locale);
      chineseCalendar.setChineseCalendarTime({
        gregorianYear: 1947,
        cyclicalYear: 24,
        month: 1,
        date: 1,
        isLeapMonth: false,
      })
      let value: number = chineseCalendar.get('is_leap_month');
      console.log('SUB_GLOBAL_GetChineseCalendar_Test_Static_1000 value:', value);
      expect(value).assertEqual(0);
    })

    /**
     * @tc.name SUB_GLOBAL_GetChineseCalendar_Test_Static_1100
     * @tc.number SUB_GLOBAL_GetChineseCalendar_Test_Static_1100
     * @tc.desc test setChineseCalendarTime with checkLeapMonth 1900, 37, 7
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL2
     */
    it('SUB_GLOBAL_GetChineseCalendar_Test_Static_1100', Level.LEVEL2, () => {
      let value: boolean = i18n.ChineseCalendar.checkLeapMonth(1900, 37, 7);
      console.log('SUB_GLOBAL_GetChineseCalendar_Test_Static_1100 value:', value);
      expect(value).assertEqual(true);
    })

    /**
     * @tc.name SUB_GLOBAL_GetChineseCalendar_Test_Static_1200
     * @tc.number SUB_GLOBAL_GetChineseCalendar_Test_Static_1200
     * @tc.desc test setChineseCalendarTime with checkLeapMonth 1900, 37, 6
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL2
     */
    it('SUB_GLOBAL_GetChineseCalendar_Test_Static_1200', Level.LEVEL2, () => {
      let value: boolean = i18n.ChineseCalendar.checkLeapMonth(1900, 37, 6);
      console.log('SUB_GLOBAL_GetChineseCalendar_Test_Static_1200 value:', value);
      expect(value).assertEqual(false);
    })

    /**
     * @tc.name SUB_GLOBAL_I18N_DaylightSavingTime_Test_Static_0100
     * @tc.number SUB_GLOBAL_I18N_DaylightSavingTime_Test_Static_0100
     * @tc.desc test isDaylightSavingTime with date
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL2
     */
    it('SUB_GLOBAL_I18N_DaylightSavingTime_Test_Static_0100', Level.LEVEL2, () => {
      let date: Date = new Date(2027, 10, 10, 10, 20, 30, 123);
      let timeZone:i18n.TimeZone = i18n.getTimeZone('Asia/Shanghai');
      let value: boolean = timeZone.isDaylightSavingTime(date);
      console.log('SUB_GLOBAL_I18N_DaylightSavingTime_Test_Static_0100 value:', value);
      expect(value).assertEqual(false);
    })

    /**
     * @tc.name SUB_GLOBAL_I18N_DaylightSavingTime_Test_Static_0200
     * @tc.number SUB_GLOBAL_I18N_DaylightSavingTime_Test_Static_0200
     * @tc.desc test isDaylightSavingTime with date
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL2
     */
    it('SUB_GLOBAL_I18N_DaylightSavingTime_Test_Static_0200', Level.LEVEL2, () => {
      let date: Date = new Date(2026, 2, 29, 7, 59, 30, 123);
      let timeZone:i18n.TimeZone = i18n.getTimeZone('Europe/Chisinau');
      let value: boolean = timeZone.isDaylightSavingTime(date);
      console.log('SUB_GLOBAL_I18N_DaylightSavingTime_Test_Static_0200 value:', value);
      expect(value).assertEqual(false);
    })

    /**
     * @tc.name SUB_GLOBAL_I18N_DaylightSavingTime_Test_Static_0300
     * @tc.number SUB_GLOBAL_I18N_DaylightSavingTime_Test_Static_0300
     * @tc.desc test isDaylightSavingTime with date
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL2
     */
    it('SUB_GLOBAL_I18N_DaylightSavingTime_Test_Static_0300', Level.LEVEL2, () => {
      let date: Date = new Date(2026, 2, 29, 9, 0, 0, 0);
      let timeZone:i18n.TimeZone = i18n.getTimeZone('Europe/Chisinau');
      let value: boolean = timeZone.isDaylightSavingTime(date);
      console.log('SUB_GLOBAL_I18N_DaylightSavingTime_Test_Static_0300 value:', value);
      expect(value).assertEqual(true);
    })

    /**
     * @tc.name SUB_GLOBAL_I18N_DaylightSavingTime_Test_Static_0400
     * @tc.number SUB_GLOBAL_I18N_DaylightSavingTime_Test_Static_0400
     * @tc.desc test isDaylightSavingTime with date
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL2
     */
    it('SUB_GLOBAL_I18N_DaylightSavingTime_Test_Static_0400', Level.LEVEL2, () => {
      let date: Date = new Date(2026, 9, 25, 8, 59, 0, 0);
      let timeZone:i18n.TimeZone = i18n.getTimeZone('Europe/Chisinau');
      let value: boolean = timeZone.isDaylightSavingTime(date);
      console.log('SUB_GLOBAL_I18N_DaylightSavingTime_Test_Static_0400 value:', value);
      expect(value).assertEqual(true);
    })

    /**
     * @tc.name SUB_GLOBAL_I18N_DaylightSavingTime_Test_Static_0500
     * @tc.number SUB_GLOBAL_I18N_DaylightSavingTime_Test_Static_0500
     * @tc.desc test isDaylightSavingTime with date
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL2
     */
    it('SUB_GLOBAL_I18N_DaylightSavingTime_Test_Static_0500', Level.LEVEL2, () => {
      let date: Date = new Date(2026, 9, 25, 9, 0, 0, 0);
      let timeZone:i18n.TimeZone = i18n.getTimeZone('Europe/Chisinau');
      let value: boolean = timeZone.isDaylightSavingTime(date);
      console.log('SUB_GLOBAL_I18N_DaylightSavingTime_Test_Static_0500 value:', value);
      expect(value).assertEqual(false);
    })

    /**
     * @tc.name SUB_GLOBAL_I18N_DaylightSavingTime_Test_Static_0600
     * @tc.number SUB_GLOBAL_I18N_DaylightSavingTime_Test_Static_0600
     * @tc.desc test isDaylightSavingTime with date
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL2
     */
    it('SUB_GLOBAL_I18N_DaylightSavingTime_Test_Static_0600', Level.LEVEL2, () => {
      let date: Date = new Date(2024, 9, 6, 11, 0, 0, 0);
      let timeZone:i18n.TimeZone = i18n.getTimeZone('America/Asuncion');
      let value: boolean = timeZone.isDaylightSavingTime(date);
      console.log('SUB_GLOBAL_I18N_DaylightSavingTime_Test_Static_0600 value:', value);
      expect(value).assertEqual(false);
    })

    /**
     * @tc.name SUB_GLOBAL_I18N_DaylightSavingTime_Test_Static_0700
     * @tc.number SUB_GLOBAL_I18N_DaylightSavingTime_Test_Static_0700
     * @tc.desc test isDaylightSavingTime with date
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL2
     */
    it('SUB_GLOBAL_I18N_DaylightSavingTime_Test_Static_0700', Level.LEVEL2, () => {
      let date: Date = new Date(2024, 9, 6, 12, 0, 0, 0);
      let timeZone:i18n.TimeZone = i18n.getTimeZone('America/Asuncion');
      let value: boolean = timeZone.isDaylightSavingTime(date);
      console.log('SUB_GLOBAL_I18N_DaylightSavingTime_Test_Static_0700 value:', value);
      expect(value).assertEqual(true);
    })

    /**
     * @tc.name SUB_GLOBAL_I18N_DaylightSavingTime_Test_Static_0800
     * @tc.number SUB_GLOBAL_I18N_DaylightSavingTime_Test_Static_0800
     * @tc.desc test isDaylightSavingTime with date
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL2
     */
    it('SUB_GLOBAL_I18N_DaylightSavingTime_Test_Static_0800', Level.LEVEL2, () => {
      let date: Date = new Date(2025, 9, 6, 11, 0, 0, 0);
      let timeZone:i18n.TimeZone = i18n.getTimeZone('America/Asuncion');
      let value: boolean = timeZone.isDaylightSavingTime(date);
      console.log('SUB_GLOBAL_I18N_DaylightSavingTime_Test_Static_0800 value:', value);
      expect(value).assertEqual(false);
    })

    /**
     * @tc.name SUB_GLOBAL_I18N_DaylightSavingTime_Test_Static_0900
     * @tc.number SUB_GLOBAL_I18N_DaylightSavingTime_Test_Static_0900
     * @tc.desc test isDaylightSavingTime with date
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL2
     */
    it('SUB_GLOBAL_I18N_DaylightSavingTime_Test_Static_0900', Level.LEVEL2, () => {
      let date: Date = new Date(2025, 9, 6, 1, 0, 0, 0);
      let timeZone:i18n.TimeZone = i18n.getTimeZone();
      let value: boolean = timeZone.isDaylightSavingTime(date);
      console.log('SUB_GLOBAL_I18N_DaylightSavingTime_Test_Static_0900 value:', value);
      expect(value).assertEqual(false);
    })

    /**
     * @tc.name SUB_GLOBAL_ConvertCanonicalLocaleIdentifier_Test_Static_0100
     * @tc.number SUB_GLOBAL_I18N_ConvertCanonicalLocaleIdentifier_Test_Static_0100
     * @tc.desc test convertCanonicalLocaleIdentifier with ZH-hANS-cn
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL2
     */
    it('SUB_GLOBAL_ConvertCanonicalLocaleIdentifier_Test_Static_0100', Level.LEVEL2, () => {
      let CanonicalLocale: string = i18n.I18NUtil.convertCanonicalLocaleIdentifier('ZH-hANS-cn');
      console.log('SUB_GLOBAL_ConvertCanonicalLocaleIdentifier_Test_Static_0100 value:', CanonicalLocale);
      expect(CanonicalLocale).assertEqual('zh-Hans-CN');
    })

    /**
     * @tc.name SUB_GLOBAL_ConvertCanonicalLocaleIdentifier_Test_Static_0200
     * @tc.number SUB_GLOBAL_I18N_ConvertCanonicalLocaleIdentifier_Test_Static_0200
     * @tc.desc test convertCanonicalLocaleIdentifier with ZH-cn
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL2
     */
    it('SUB_GLOBAL_ConvertCanonicalLocaleIdentifier_Test_Static_0200', Level.LEVEL2, () => {
      let CanonicalLocale: string = i18n.I18NUtil.convertCanonicalLocaleIdentifier('ZH-cn');
      console.log('SUB_GLOBAL_ConvertCanonicalLocaleIdentifier_Test_Static_0200 value:', CanonicalLocale);
      expect(CanonicalLocale).assertEqual('zh-CN');
    })

    /**
     * @tc.name SUB_GLOBAL_ConvertCanonicalLocaleIdentifier_Test_Static_0300
     * @tc.number SUB_GLOBAL_I18N_ConvertCanonicalLocaleIdentifier_Test_Static_0300
     * @tc.desc test convertCanonicalLocaleIdentifier with DE
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL2
     */
    it('SUB_GLOBAL_ConvertCanonicalLocaleIdentifier_Test_Static_0300', Level.LEVEL2, () => {
      let CanonicalLocale: string = i18n.I18NUtil.convertCanonicalLocaleIdentifier('DE');
      console.log('SUB_GLOBAL_ConvertCanonicalLocaleIdentifier_Test_Static_0300 value:', CanonicalLocale);
      expect(CanonicalLocale).assertEqual('de');
    })

    /**
     * @tc.name SUB_GLOBAL_ConvertCanonicalLocaleIdentifier_Test_Static_0400
     * @tc.number SUB_GLOBAL_I18N_ConvertCanonicalLocaleIdentifier_Test_Static_0400
     * @tc.desc test convertCanonicalLocaleIdentifier with jp-lATN-us
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL2
     */
    it('SUB_GLOBAL_ConvertCanonicalLocaleIdentifier_Test_Static_0400', Level.LEVEL2, () => {
      let CanonicalLocale: string = i18n.I18NUtil.convertCanonicalLocaleIdentifier('jp-lATN-us');
      console.log('SUB_GLOBAL_ConvertCanonicalLocaleIdentifier_Test_Static_0400 value:', CanonicalLocale);
      expect(CanonicalLocale).assertEqual('jp-Latn-US');
    })

    /**
     * @tc.name SUB_GLOBAL_ConvertCanonicalLocaleIdentifier_Test_Static_0500
     * @tc.number SUB_GLOBAL_I18N_ConvertCanonicalLocaleIdentifier_Test_Static_0500
     * @tc.desc test convertCanonicalLocaleIdentifier with AR-tw
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL2
     */
    it('SUB_GLOBAL_ConvertCanonicalLocaleIdentifier_Test_Static_0500', Level.LEVEL2, () => {
      let CanonicalLocale: string = i18n.I18NUtil.convertCanonicalLocaleIdentifier('AR-tw');
      console.log('SUB_GLOBAL_ConvertCanonicalLocaleIdentifier_Test_Static_0500 value:', CanonicalLocale);
      expect(CanonicalLocale).assertEqual('ar-TW');
    })

    /**
     * @tc.name SUB_GLOBAL_ConvertCanonicalLocaleIdentifier_Test_Static_0600
     * @tc.number SUB_GLOBAL_I18N_ConvertCanonicalLocaleIdentifier_Test_Static_0600
     * @tc.desc test convertCanonicalLocaleIdentifier with ZHO-CN
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL2
     */
    it('SUB_GLOBAL_ConvertCanonicalLocaleIdentifier_Test_Static_0600', Level.LEVEL2, () => {
      let CanonicalLocale: string = i18n.I18NUtil.convertCanonicalLocaleIdentifier('ZHO-CN');
      console.log('SUB_GLOBAL_ConvertCanonicalLocaleIdentifier_Test_Static_0600 value:', CanonicalLocale);
      expect(CanonicalLocale).assertEqual('zh-CN');
    })

    /**
     * @tc.name SUB_GLOBAL_ConvertCanonicalLocaleIdentifier_Test_Static_0700
     * @tc.number SUB_GLOBAL_I18N_ConvertCanonicalLocaleIdentifier_Test_Static_0700
     * @tc.desc test convertCanonicalLocaleIdentifier with ENG-usa
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL2
     */
    it('SUB_GLOBAL_ConvertCanonicalLocaleIdentifier_Test_Static_0700', Level.LEVEL2, () => {
      let CanonicalLocale: string = i18n.I18NUtil.convertCanonicalLocaleIdentifier('ENG-usa');
      console.log('SUB_GLOBAL_ConvertCanonicalLocaleIdentifier_Test_Static_0700 value:', CanonicalLocale);
      expect(CanonicalLocale).assertEqual('usa');
    })

    /**
     * @tc.name SUB_GLOBAL_ConvertCanonicalLocaleIdentifier_Test_Static_0800
     * @tc.number SUB_GLOBAL_I18N_ConvertCanonicalLocaleIdentifier_Test_Static_0800
     * @tc.desc test convertCanonicalLocaleIdentifier with zh-TWN
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL2
     */
    it('SUB_GLOBAL_ConvertCanonicalLocaleIdentifier_Test_Static_0800', Level.LEVEL2, () => {
      let CanonicalLocale: string = i18n.I18NUtil.convertCanonicalLocaleIdentifier('zh-TWN');
      console.log('SUB_GLOBAL_ConvertCanonicalLocaleIdentifier_Test_Static_0800 value:', CanonicalLocale);
      expect(CanonicalLocale).assertEqual('twn');
    })

    /**
     * @tc.name SUB_GLOBAL_ConvertCanonicalLocaleIdentifier_Test_Static_0900
     * @tc.number SUB_GLOBAL_I18N_ConvertCanonicalLocaleIdentifier_Test_Static_0900
     * @tc.desc test convertCanonicalLocaleIdentifier with jp_Latn_US
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL2
     */
    it('SUB_GLOBAL_ConvertCanonicalLocaleIdentifier_Test_Static_0900', Level.LEVEL2, () => {
      let CanonicalLocale: string = i18n.I18NUtil.convertCanonicalLocaleIdentifier('jp_Latn_US');
      console.log('SUB_GLOBAL_ConvertCanonicalLocaleIdentifier_Test_Static_0900 value:', CanonicalLocale);
      expect(CanonicalLocale).assertEqual('');
    })

    /**
     * @tc.name SUB_GLOBAL_ConvertCanonicalLocaleIdentifier_Test_Static_1000
     * @tc.number SUB_GLOBAL_I18N_ConvertCanonicalLocaleIdentifier_Test_Static_1000
     * @tc.desc test convertCanonicalLocaleIdentifier with jp-Latn1-US
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL2
     */
    it('SUB_GLOBAL_ConvertCanonicalLocaleIdentifier_Test_Static_1000', Level.LEVEL2, () => {
      let CanonicalLocale: string = i18n.I18NUtil.convertCanonicalLocaleIdentifier('jp-Latn1-US');
      console.log('SUB_GLOBAL_ConvertCanonicalLocaleIdentifier_Test_Static_1000 value:', CanonicalLocale);
      expect(CanonicalLocale).assertEqual('');
    })

    /**
     * @tc.name SUB_GLOBAL_ConvertCanonicalLocaleIdentifier_Test_Static_1100
     * @tc.number SUB_GLOBAL_I18N_ConvertCanonicalLocaleIdentifier_Test_Static_1100
     * @tc.desc test convertCanonicalLocaleIdentifier with nullString
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL2
     */
    it('SUB_GLOBAL_ConvertCanonicalLocaleIdentifier_Test_Static_1100', Level.LEVEL2, () => {
      let CanonicalLocale: string = i18n.I18NUtil.convertCanonicalLocaleIdentifier('');
      console.log('SUB_GLOBAL_ConvertCanonicalLocaleIdentifier_Test_Static_1100 value:', CanonicalLocale);
      expect(CanonicalLocale).assertEqual('');
    })

  })
}
