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
import { TextStyle, StyledString } from 'arkui.component.styledString'
import { Color, FontStyle, FontWeight } from 'arkui.component.enums'

let domain: int = 0x0000;
let tag: string = 'testTag';

export default function FivePointOne_i18nStageTest() {

  describe("FivePointOne_i18nStageTest", (): void => {
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

    /**
     * @tc.name   SUB_GLOBAL_refinedFormat_static_0160
     * @tc.number SUB_GLOBAL_refinedFormat_static_0160
     * @tc.desc   begin code same as stop code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_refinedFormat_static_0160', Level.LEVEL2, async (): Promise<void> => {
      let numFormat: intl.NumberFormat = new intl.NumberFormat("zh-hans-CN");
      let formattedRange: string = numFormat.formatRange(0, 0);
      expect(formattedRange == "~0").assertTrue();
    })

    /**
     * @tc.name   SUB_GLOBAL_refinedFormat_static_0170
     * @tc.number SUB_GLOBAL_refinedFormat_static_0170
     * @tc.desc   normally (begin code & stop code)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_refinedFormat_static_0170', Level.LEVEL2, async (): Promise<void> => {
      let numFormat: intl.NumberFormat = new intl.NumberFormat("zh-hans-CN");
      let formattedRange: string = numFormat.formatRange(0, 9);
      expect(formattedRange == "0-9").assertTrue();
    })

    /**
     * @tc.name   SUB_GLOBAL_refinedFormat_static_0180
     * @tc.number SUB_GLOBAL_refinedFormat_static_0180
     * @tc.desc   begin code with negative ,stop code with decimal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_refinedFormat_static_0180', Level.LEVEL2, async (): Promise<void> => {
      let numFormat = new intl.NumberFormat("zh-hans-CN");
      let formattedRange: string = numFormat.formatRange(-9, 9.9);
      expect(formattedRange == "-9 - 9.9").assertTrue();
    })

    /**
     * @tc.name   SUB_GLOBAL_refinedFormat_static_0190
     * @tc.number SUB_GLOBAL_refinedFormat_static_0190
     * @tc.desc   begin code large than stop code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_GLOBAL_refinedFormat_static_0190', Level.LEVEL0, async (): Promise<void> => {
      let numFormat = new intl.NumberFormat("zh-hans-CN");
      let formattedRange: string = numFormat.formatRange(9, 0);
      expect(formattedRange == "").assertTrue();
    })
    
    /**
     * @tc.name   I18N_test_getTemperatureName_static_0100
     * @tc.number SUB_GLOBAL_I18N_getTemperatureName_static_0100
     * @tc.desc   i18n.TemperatureType.CELSIUS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('I18N_test_getTemperatureName_static_0100', Level.LEVEL0, async (): Promise<void> => {
      let type = i18n.System.getTemperatureName(i18n.TemperatureType.CELSIUS);
      console.log('I18N_test_getTemperatureName_static_0100:' + type);
      expect(type).assertEqual('celsius');
    })

    /**
     * @tc.name   I18N_test_getTemperatureName_static_0200
     * @tc.number SUB_GLOBAL_I18N_getTemperatureName_static_0200
     * @tc.desc   i18n.TemperatureType.FAHRENHEIT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('I18N_test_getTemperatureName_static_0200', Level.LEVEL2, async (): Promise<void> => {
      let type = i18n.System.getTemperatureName(i18n.TemperatureType.FAHRENHEIT);
      console.log('I18N_test_getTemperatureName_static_0200:' + type);
      expect(type).assertEqual('fahrenheit');
    })

    /**
     * @tc.name   I18N_test_getTemperatureName_static_0300
     * @tc.number SUB_GLOBAL_I18N_getTemperatureName_static_0300
     * @tc.desc   i18n.TemperatureType.KELVIN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('I18N_test_getTemperatureName_static_0300', Level.LEVEL2, async (): Promise<void> => {
      let type = i18n.System.getTemperatureName(i18n.TemperatureType.KELVIN);
      console.log('I18N_test_getTemperatureName_static_0300:' + type);
      expect(type).assertEqual('kelvin');
    })

    /**
     * @tc.name   I18N_test_getTemperatureName_static_0400
     * @tc.number SUB_GLOBAL_I18N_getTemperatureName_static_0400
     * @tc.desc   input number zero
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('I18N_test_getTemperatureName_static_0400', Level.LEVEL3, async (): Promise<void> => {
      try {
        i18n.System.getTemperatureName(i18n.TemperatureType.KELVIN);
      } catch (e) {
        e = e as BusinessError;
        console.log('I18N_test_getTemperatureName_static_0400 code&message:' + e.code + e.message);
        expect(e.code).assertEqual('890001');
      }
    })

    /**
     * @tc.name   I18N_test_getSimplifiedLanguage_static_01_static_0100
     * @tc.number SUB_GLOBAL_I18N_getSimplifiedLanguage_static_01_static_0100
     * @tc.desc   en-GB & en-Latn-US
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('I18N_test_getSimplifiedLanguage_static_01_static_0100', Level.LEVEL0, async (): Promise<void> => {
      let type_one = i18n.System.getSimplifiedLanguage('en-GB');
      console.log('I18N_test_getSimplifiedLanguage_static_01_static_0100 type_one:' + type_one);
      let type_two = i18n.System.getSimplifiedLanguage('en-Latn-US');
      console.log('I18N_test_getSimplifiedLanguage_static_01_static_0100 type_two:' + type_two);
      expect(type_one).assertEqual('en-GB');
      expect(type_two).assertEqual('en');
    })

    /**
     * @tc.name   I18N_test_getSimplifiedLanguage_static_01_static_0200
     * @tc.number SUB_GLOBAL_I18N_getSimplifiedLanguage_static_01_static_0200
     * @tc.desc   zh-Hant-HK & zh-Hant-TW
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('I18N_test_getSimplifiedLanguage_static_01_static_0200', Level.LEVEL2, async (): Promise<void> => {
      let type_one = i18n.System.getSimplifiedLanguage('zh-Hant-HK');
      console.log('I18N_test_getSimplifiedLanguage_static_01_static_0200 type_one:' + type_one);
      let type_two = i18n.System.getSimplifiedLanguage('zh-Hant-TW');
      console.log('I18N_test_getSimplifiedLanguage_static_01_static_0200 type_two:' + type_two);
      expect(type_one).assertEqual('zh-HK');
      expect(type_two).assertEqual('zh-TW');
    })

    /**
     * @tc.name   I18N_test_getSimplifiedLanguage_static_01_static_0300
     * @tc.number SUB_GLOBAL_I18N_getSimplifiedLanguage_static_01_static_0300
     * @tc.desc   es-ES & es-US
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('I18N_test_getSimplifiedLanguage_static_01_static_0300', Level.LEVEL2, async (): Promise<void> => {
      let type_one = i18n.System.getSimplifiedLanguage('es-ES');
      console.log('I18N_test_getSimplifiedLanguage_static_01_static_0300 type_one:' + type_one);
      let type_two = i18n.System.getSimplifiedLanguage('es-US');
      console.log('I18N_test_getSimplifiedLanguage_static_01_static_0300 type_two:' + type_two);
      expect(type_one).assertEqual('es');
      expect(type_two).assertEqual('es-US');
    })

    /**
     * @tc.name   I18N_test_getSimplifiedLanguage_static_01_static_0400
     * @tc.number SUB_GLOBAL_I18N_getSimplifiedLanguage_static_01_static_0400
     * @tc.desc   pt-PT & pt-BR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('I18N_test_getSimplifiedLanguage_static_01_static_0400', Level.LEVEL2, async (): Promise<void> => {
      let type_one = i18n.System.getSimplifiedLanguage('pt-PT');
      console.log('I18N_test_getSimplifiedLanguage_static_01_static_0400 type_one:' + type_one);
      let type_two = i18n.System.getSimplifiedLanguage('pt-BR');
      console.log('I18N_test_getSimplifiedLanguage_static_01_static_0400 type_two:' + type_two);
      expect(type_one).assertEqual('pt-PT');
      expect(type_two).assertEqual('pt');
    })

    /**
     * @tc.name   I18N_test_getSimplifiedLanguage_static_01_static_0500
     * @tc.number SUB_GLOBAL_I18N_getSimplifiedLanguage_static_01_static_0500
     * @tc.desc   en-CN & en-Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('I18N_test_getSimplifiedLanguage_static_01_static_0500', Level.LEVEL2, async (): Promise<void> => {
      let type_one = i18n.System.getSimplifiedLanguage('en-CN');
      console.log('I18N_test_getSimplifiedLanguage_static_01_static_0500 type_one:' + type_one);
      let type_two = i18n.System.getSimplifiedLanguage('en-Test');
      console.log('I18N_test_getSimplifiedLanguage_static_01_static_0500 type_two:' + type_two);
      expect(type_one).assertEqual('en-CN');
      expect(type_two).assertEqual('en-Test');
    })

    /**
     * @tc.name   I18N_test_getSimplifiedLanguage_static_01_static_0600
     * @tc.number SUB_GLOBAL_I18N_getSimplifiedLanguage_static_01_static_0600
     * @tc.desc   zh-Hant-CN & zh-Hant-Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('I18N_test_getSimplifiedLanguage_static_01_static_0600', Level.LEVEL2, async (): Promise<void> => {
      let type_one = i18n.System.getSimplifiedLanguage('zh-Hant-CN');
      console.log('I18N_test_getSimplifiedLanguage_static_01_static_0600 type_one:' + type_one);
      let type_two = i18n.System.getSimplifiedLanguage('zh-Hant-Test');
      console.log('I18N_test_getSimplifiedLanguage_static_01_static_0600 type_two:' + type_two);
      expect(type_one).assertEqual('zh-Hant-CN');
      expect(type_two).assertEqual('zh');
    })

    /**
     * @tc.name   I18N_test_getSimplifiedLanguage_static_01_static_0700
     * @tc.number SUB_GLOBAL_I18N_getSimplifiedLanguage_static_01_static_0700
     * @tc.desc   es-CN & es-Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('I18N_test_getSimplifiedLanguage_static_01_static_0700', Level.LEVEL2, async (): Promise<void> => {
      let type_one = i18n.System.getSimplifiedLanguage('es-CN');
      console.log('I18N_test_getSimplifiedLanguage_static_01_static_0700 type_one:' + type_one);
      let type_two = i18n.System.getSimplifiedLanguage('es-Test');
      console.log('I18N_test_getSimplifiedLanguage_static_01_static_0700 type_two:' + type_two);
      expect(type_one).assertEqual('es-CN');
      expect(type_two).assertEqual('es-Test');
    })

    /**
     * @tc.name   I18N_test_getSimplifiedLanguage_static_01_static_0800
     * @tc.number SUB_GLOBAL_I18N_getSimplifiedLanguage_static_01_static_0800
     * @tc.desc   pt-CN & pt-Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('I18N_test_getSimplifiedLanguage_static_01_static_0800', Level.LEVEL2, async (): Promise<void> => {
      let type_one = i18n.System.getSimplifiedLanguage('pt-CN');
      console.log('I18N_test_getSimplifiedLanguage_static_01_static_0800 type_one:' + type_one);
      let type_two = i18n.System.getSimplifiedLanguage('pt-Test');
      console.log('I18N_test_getSimplifiedLanguage_static_01_static_0800 type_two:' + type_two);
      expect(type_one).assertEqual('pt-CN');
      expect(type_two).assertEqual('pt-Test');
    })

    /**
     * @tc.name   I18N_test_getSimplifiedLanguage_static_01_static_0900
     * @tc.number SUB_GLOBAL_I18N_getSimplifiedLanguage_static_01_static_0900
     * @tc.desc   bo-CN & bo-Test & bo-Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('I18N_test_getSimplifiedLanguage_static_01_static_0900', Level.LEVEL2, async (): Promise<void> => {
      let type_one = i18n.System.getSimplifiedLanguage('bo-CN');
      console.log('I18N_test_getSimplifiedLanguage_static_01_static_0900 type_one:' + type_one);
      let type_two = i18n.System.getSimplifiedLanguage('bo-US');
      console.log('I18N_test_getSimplifiedLanguage_static_01_static_0900 type_two:' + type_two);
      let type_three = i18n.System.getSimplifiedLanguage('bo-Test');
      console.log('I18N_test_getSimplifiedLanguage_static_01_static_0900 type_three:' + type_three);
      expect(type_one).assertEqual('bo');
      expect(type_two).assertEqual('bo-US');
      expect(type_three).assertEqual('bo-Test');
    })

    /**
     * @tc.name   I18N_test_getSimplifiedLanguage_static_01_static_1000
     * @tc.number SUB_GLOBAL_I18N_getSimplifiedLanguage_static_01_static_1000
     * @tc.desc   pt-CN & pt-Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('I18N_test_getSimplifiedLanguage_static_01_static_1000', Level.LEVEL3, async (): Promise<void> => {
      try {
        i18n.System.getSimplifiedLanguage("0");
      } catch (err) {
        let error = err as BusinessError
        console.log('I18N_test_getSimplifiedLanguage_static_01_static_1000 code&message:' + error.code + error.message);
        expect(error.code == 890001).assertTrue();
      }
    })

    /**
     * @tc.name   SUB_GLOBAL_refinedFormat_static_0310
     * @tc.number SUB_GLOBAL_refinedFormat_static_0310
     * @tc.desc   maximumFractionDigits: 2 & maximumSignificantDigits: 6 & roundingPriority: "lessPrecision"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_refinedFormat_static_0310', Level.LEVEL2, async (done: () => void): Promise<void> => {
      let numOptions: intl.NumberOptions = {
        maximumFractionDigits: 2, maximumSignificantDigits: 6, roundingPriority: "lessPrecision"
      };
      let numfmt: intl.NumberFormat = new intl.NumberFormat("zh-hans-CN", numOptions);
      let numberFormatted: string = numfmt.format(123.456);
      console.log('numberFormatted:'+numberFormatted);
      expect(numberFormatted == "123.456").assertTrue();
      done();
    })
    
    /**
     * @tc.name   SUB_GLOBAL_refinedFormat_static_0320
     * @tc.number SUB_GLOBAL_refinedFormat_static_0320
     * @tc.desc   maximumFractionDigits: 2 & roundingIncrement: 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_GLOBAL_refinedFormat_static_0320', Level.LEVEL0, async (): Promise<void> => {
      let numOptions: intl.NumberOptions = {
        maximumFractionDigits: 2, roundingIncrement: 1
      };
      let numfmt: intl.NumberFormat = new intl.NumberFormat("zh-hans-CN", numOptions);
      let numberFormatted: string = numfmt.format(123.456);
      expect(numberFormatted == "123.46").assertTrue();
    })

    /**
     * @tc.name   SUB_GLOBAL_FilePathMirroring_static_0100
     * @tc.number SUB_GLOBAL_FilePathMirroring_static_0100
     * @tc.desc   path /data/out/tmp & delimiter /
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_FilePathMirroring_static_0100', Level.LEVEL2, async (): Promise<void> => {
      let path: string = "/data/out/tmp";
      let delimiter: string = "/";
      let locale: Intl.Locale = new Intl.Locale("ug");
      let mirrorPath: string = i18n.I18NUtil.getUnicodeWrappedFilePath(path, delimiter, locale);
      let flag = i18n.Unicode.isRTL(mirrorPath);
      expect(flag).assertTrue();
    })

    /**
     * @tc.name   SUB_GLOBAL_refinedFormat_static_0020
     * @tc.number SUB_GLOBAL_refinedFormat_static_0020
     * @tc.desc   Date(2024, 11, 13, 6, 30, 25) & 'y'/'M'/'d' 'h':'m':'s'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_refinedFormat_static_0020', Level.LEVEL2, async (): Promise<void> => {
      let locale: Intl.Locale = new Intl.Locale("zh-Hans-CN");
      let date: Date = new Date(2024, 11, 13, 6, 30, 25);
      let formatter: i18n.SimpleDateTimeFormat =
        i18n.getSimpleDateTimeFormatByPattern("'time('y'/'M'/'d' 'h':'m':'s')'", locale);
      let dateFormatted: string = formatter.format(date);
      expect(dateFormatted == "time(2024/12/13 6:30:25)").assertTrue();
    })

    /**
     * @tc.name   SUB_GLOBAL_refinedFormat_static_0630
     * @tc.number SUB_GLOBAL_refinedFormat_static_0630
     * @tc.desc   roundingMode: "halfExpand" & maximumSignificantDigits: 5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_GLOBAL_refinedFormat_static_0630', Level.LEVEL0,  async (done: () => void): Promise<void> => {
      let numOptions: intl.NumberOptions = {
        roundingMode: "halfExpand", maximumSignificantDigits: 5
      };
      let numfmt: intl.NumberFormat = new intl.NumberFormat("zh-hans-CN", numOptions);
      let numberFormatted: string = numfmt.format(123.454);
      console.log('numberFormatted:'+numberFormatted);
      expect(numberFormatted == "123.45").assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_GLOBAL_refinedFormat_static_0790
     * @tc.number SUB_GLOBAL_refinedFormat_static_0790
     * @tc.desc   skeletonFormat (1230000) & getSimpleNumberFormatBySkeleton "engineering/sign-always"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_refinedFormat_static_0790', Level.LEVEL2, async (): Promise<void> => {
      let locale: Intl.Locale = new Intl.Locale("zh-Hans-CN");
      let skeletonFormat: i18n.SimpleNumberFormat =
        i18n.getSimpleNumberFormatBySkeleton("engineering/sign-always", locale);
      let numberFormatted: string = skeletonFormat.format(1230000);
      expect(numberFormatted == "1.23E+6").assertTrue();
    })

    /**
     * @tc.name   SUB_GLOBAL_refinedFormat_static_008
     * @tc.number SUB_GLOBAL_refinedFormat_static_008
     * @tc.desc   local is CN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_refinedFormat_static_008', Level.LEVEL2, async (): Promise<void> => {
      let locale: Intl.Locale = new Intl.Locale("zh-Hans-CN");
      let date: Date = new Date(2024, 11, 13, 6, 30, 25);
      let skeletonFormatter: i18n.SimpleDateTimeFormat = i18n.getSimpleDateTimeFormatBySkeleton("yMdhms", locale);
      let dateFormatted: string = skeletonFormatter.format(date);
      expect(dateFormatted == "2024/12/13 上午6:30:25").assertTrue();
    })

    /**
     * @tc.name   I18N_test_getSimplifiedLanguage_static_01_static_1010
     * @tc.number I18N_test_getSimplifiedLanguage_static_01_static_1010
     * @tc.desc   no param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('I18N_test_getSimplifiedLanguage_static_01_static_1010', Level.LEVEL2, async (): Promise<void> => {
      let type_one = i18n.System.getSimplifiedLanguage();
      console.log('I18N_test_getSimplifiedLanguage_static_01_static_1010 type_one:' + type_one);
      expect(type_one != null).assertTrue();
    })

    /**
     * @tc.name   I18N_test_getTemperatureType_static_0100
     * @tc.number I18N_test_getTemperatureType_static_0100
     * @tc.desc   no param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('I18N_test_getTemperatureType_static_0100', Level.LEVEL2, async (): Promise<void> => {
      let type: i18n.TemperatureType = i18n.System.getTemperatureType();
      console.log('I18N_test_getTemperatureType_static_0100 type_one:' + type);
      expect(type != null).assertTrue();
    })

    /**
     * @tc.name   I18N_test_getFirstDayOfWeek_static_0100
     * @tc.number I18N_test_getFirstDayOfWeek_static_0100
     * @tc.desc   no param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('I18N_test_getFirstDayOfWeek_static_0100', Level.LEVEL2, async (): Promise<void> => {
      let type = i18n.System.getFirstDayOfWeek();
      console.log('I18N_test_getFirstDayOfWeek_static_0100 type_one:' + type);
      expect(type != null).assertTrue();
    })

    /**
     * @tc.name   I18N_test_getUnicodeWrappedFilePath_static_0100
     * @tc.number I18N_test_getUnicodeWrappedFilePath_static_0100
     * @tc.desc   890001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('I18N_test_getUnicodeWrappedFilePath_static_0100', Level.LEVEL3, async (): Promise<void> => {
      try {
        let path: string = "error";
        let delimiter: string = "error";
        let locale: Intl.Locale = new Intl.Locale("ug");
        i18n.I18NUtil.getUnicodeWrappedFilePath(path, delimiter, locale);
      } catch (e) {
        e = e as BusinessError;
        console.log('I18N_test_getUnicodeWrappedFilePath_static_0100 type_one:' + e.code);
        expect(JSON.stringify(e.code)).assertEqual('890001');
      }
    })

    /**
     * @tc.name   I18N_test_getUnicodeWrappedFilePath_static_0200
     * @tc.number I18N_test_getUnicodeWrappedFilePath_static_0200
     * @tc.desc   path & delimiter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('I18N_test_getUnicodeWrappedFilePath_static_0200', Level.LEVEL2, async (): Promise<void> => {
      let path: string = "/data/out/tmp";
      let delimiter: string = "/";
      let mirrorPath: string = i18n.I18NUtil.getUnicodeWrappedFilePath(path, delimiter);
      console.log('I18N_test_getUnicodeWrappedFilePath_static_0200:' + mirrorPath);
      expect(mirrorPath != null).assertTrue();
    })

    /**
     * @tc.name   I18N_test_getUnicodeWrappedFilePath_static_0300
     * @tc.number I18N_test_getUnicodeWrappedFilePath_static_0300
     * @tc.desc   path
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('I18N_test_getUnicodeWrappedFilePath_static_0300', Level.LEVEL2, async (): Promise<void> => {
      let path: string = "/data/out/tmp";
      let mirrorPath: string = i18n.I18NUtil.getUnicodeWrappedFilePath(path);
      console.log('I18N_test_getUnicodeWrappedFilePath_static_0300:' + mirrorPath);
      expect(mirrorPath != null).assertTrue();
    })

    /**
     * @tc.name   I18N_test_getSimpleDateTimeFormatByPattern_static_0100
     * @tc.number I18N_test_getSimpleDateTimeFormatByPattern_static_0100
     * @tc.desc   89001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('I18N_test_getSimpleDateTimeFormatByPattern_static_0100', Level.LEVEL3, async (): Promise<void> => {
      try {
        let locale: Intl.Locale = new Intl.Locale("zh-Hans-CN");
        i18n.getSimpleDateTimeFormatByPattern('error', locale);
      } catch (e) {
        e = e as BusinessError;
        console.log('I18N_test_getSimpleDateTimeFormatByPattern_static_0100 error code:' + e.code);
        expect(e.code).assertEqual(890001);
      }
    })

    /**
     * @tc.name   I18N_test_getSimpleDateTimeFormatByPattern_static_0200
     * @tc.number I18N_test_getSimpleDateTimeFormatByPattern_static_0200
     * @tc.desc   only date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('I18N_test_getSimpleDateTimeFormatByPattern_static_0200', Level.LEVEL2, async (): Promise<void> => {
      let date: Date = new Date(2024, 11, 13, 6, 30, 25);
      let formatter: i18n.SimpleDateTimeFormat =
        i18n.getSimpleDateTimeFormatByPattern("'time('y'/'M'/'d'/'h':'m':'s')'");
      let dateFormatted: string = formatter.format(date);
      console.log('I18N_test_getSimpleDateTimeFormatByPattern_static_0200 dateFormatted:' + dateFormatted);
      expect(dateFormatted != null).assertTrue();
    })

    /**
     * @tc.name   I18N_test_getSimpleDateTimeFormatBySkeleton_static_0100
     * @tc.number I18N_test_getSimpleDateTimeFormatBySkeleton_static_0100
     * @tc.desc   89001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('I18N_test_getSimpleDateTimeFormatBySkeleton_static_0100', Level.LEVEL3, async (): Promise<void> => {
      try {
        let locale: Intl.Locale = new Intl.Locale("zh-Hans-CN");
        i18n.getSimpleDateTimeFormatBySkeleton('error', locale);
      } catch (e) {
        e = e as BusinessError;
        console.log('I18N_test_getSimpleDateTimeFormatBySkeleton_static_0100 error code:' + e.code);
        expect(e.code).assertEqual(890001);
      }
    })

    /**
     * @tc.name   I18N_test_getSimpleDateTimeFormatBySkeleton_static_0200
     * @tc.number I18N_test_getSimpleDateTimeFormatBySkeleton_static_0200
     * @tc.desc   only date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('I18N_test_getSimpleDateTimeFormatBySkeleton_static_0200', Level.LEVEL2, async (): Promise<void> => {
      let date: Date = new Date(2024, 11, 13, 6, 30, 25);
      let skeletonFormatter: i18n.SimpleDateTimeFormat =
        i18n.getSimpleDateTimeFormatBySkeleton("yMdhms");
      let dateFormatted: string = skeletonFormatter.format(date);
      expect(dateFormatted != null).assertTrue();
    })

    /**
     * @tc.name   roundingMode_test_static_0100
     * @tc.number roundingMode_test_static_0100
     * @tc.desc   test roundingIncrement success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("roundingMode_test_static_0100", Level.LEVEL1, async (done: () => void): Promise<void> => {
      const TAG: string = "roundingMode";
      try {
        let options: intl.NumberOptions = {
          roundingMode: "halfExpand", maximumSignificantDigits: 5
        }
        let numberFormat: intl.NumberFormat = new intl.NumberFormat("zh-hans-CN", options);
        let numberFormatted: string = numberFormat.format(123.456);
        expect(numberFormatted == "123.46").assertEqual(true);
        done();
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', `${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   roundingIncrement_test_static_0100
     * @tc.number roundingIncrement_test_static_0100
     * @tc.desc   test roundingIncrement success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("roundingIncrement_test_static_0100", Level.LEVEL1, async (done: () => void): Promise<void> => {
      const TAG: string = "roundingIncrement";
      try {
        let options: intl.NumberOptions = {
          maximumFractionDigits: 2, roundingIncrement: 1
        }
        let numberFormat: intl.NumberFormat = new intl.NumberFormat("zh-hans-CN", options);
        let numberFormatted: string = numberFormat.format(123.456);
        expect(numberFormatted == "123.46").assertEqual(true);
        done();
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', `${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   I18N_test_getSimpleNumberFormatBySkeleton_static_0100
     * @tc.number I18N_test_getSimpleNumberFormatBySkeleton_static_0100
     * @tc.desc   89001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('I18N_test_getSimpleNumberFormatBySkeleton_static_0100', Level.LEVEL3, async (): Promise<void> => {
      try {
        let locale: Intl.Locale = new Intl.Locale("zh-Hans-CN");
        i18n.getSimpleNumberFormatBySkeleton('error', locale);
      } catch (e) {
        e = e as BusinessError;
        console.log('I18N_test_getSimpleNumberFormatBySkeleton_static_0100 error code:' + e.code);
        expect(e.code).assertEqual(890001);
      }
    })

    /**
     * @tc.name   I18N_test_getSimpleNumberFormatBySkeleton_static_0200
     * @tc.number I18N_test_getSimpleNumberFormatBySkeleton_static_0200
     * @tc.desc   only skeletonFormatter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('I18N_test_getSimpleNumberFormatBySkeleton_static_0200', Level.LEVEL2, async (): Promise<void> => {
      let skeletonFormatter: i18n.SimpleNumberFormat =
        i18n.getSimpleNumberFormatBySkeleton("engineering/sign-always");
      let numberFormatted: string = skeletonFormatter.format(1230000);
      expect(numberFormatted == "1.23E+6").assertTrue();
    })

    console.log('*************end FivePointOne_i18nStageTest*************');
  })
}