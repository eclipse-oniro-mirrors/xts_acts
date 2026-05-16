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
import { SpanStyle } from '@ohos.arkui.component';

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

    /**
     * @tc.name i18n_HolidayInfoItem_test_Static_0100
     * @tc.number i18n_HolidayInfoItem_test_Static_0100
     * @tc.desc with HolidayInfoItem
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('i18n_HolidayInfoItem_test_Static_0100', Level.LEVEL3, () => {
      try {
        let holiday = new i18n.HolidayManager('/system/lib/US.ics');
        let item: i18n.HolidayInfoItem[] = holiday.getHolidayInfoItemArray(2023);
        let value: string = JSON.stringify(item[0].baseName);
        console.log('i18n_HolidayInfoItem_test_Static_0100 value:', value);
        expect(value).assertFail();
      } catch (e) {
        console.log('i18n_HolidayInfoItem_test_Static_0100 code&message:', e.code + e.message);
        expect(e.code).assertEqual(401);
      }
    })

    /**
     * @tc.name i18n_HolidayInfoItem_test_Static_0200
     * @tc.number i18n_HolidayInfoItem_test_Static_0200
     * @tc.desc with HolidayInfoItem
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('i18n_HolidayInfoItem_test_Static_0200', Level.LEVEL3, () => {
      try {
        let holiday = new i18n.HolidayManager('/system/lib/US.ics');
        let item: i18n.HolidayInfoItem[] = holiday.getHolidayInfoItemArray(2023);
        let value: string = JSON.stringify(item[1].year);
        console.log('i18n_HolidayInfoItem_test_Static_0200 value:', value);
        expect(value).assertFail();
      } catch (e) {
        console.log('i18n_HolidayInfoItem_test_Static_0200 code&message:', e.code + e.message);
        expect(e.code).assertEqual(401);
      }
    })

    /**
     * @tc.name i18n_HolidayInfoItem_test_Static_0300
     * @tc.number i18n_HolidayInfoItem_test_Static_0300
     * @tc.desc with HolidayInfoItem
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('i18n_HolidayInfoItem_test_Static_0300', Level.LEVEL3, () => {
      try {
        let holiday = new i18n.HolidayManager('/system/lib/US.ics');
        let item: i18n.HolidayInfoItem[] = holiday.getHolidayInfoItemArray(2023);
        let value: string = JSON.stringify(item[2].month);
        console.log('i18n_HolidayInfoItem_test_Static_0300 value:', value);
        expect(value).assertFail();
      } catch (e) {
        console.log('i18n_HolidayInfoItem_test_Static_0300 code&message:', e.code + e.message);
        expect(e.code).assertEqual(401);
      }
    })

    /**
     * @tc.name i18n_HolidayInfoItem_test_Static_0400
     * @tc.number i18n_HolidayInfoItem_test_Static_0400
     * @tc.desc with HolidayInfoItem
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('i18n_HolidayInfoItem_test_Static_0400', Level.LEVEL3, () => {
      try {
        let holiday = new i18n.HolidayManager('/system/lib/US.ics');
        let item: i18n.HolidayInfoItem[] = holiday.getHolidayInfoItemArray(2023);
        let value: string = JSON.stringify(item[3].day);
        console.log('i18n_HolidayInfoItem_test_Static_0400 value:', value);
        expect(value).assertFail();
      } catch (e) {
        console.log('i18n_HolidayInfoItem_test_Static_0400 code&message:', e.code + e.message);
        expect(e.code).assertEqual(401);
      }
    })

    /**
     * @tc.name i18n_HolidayLocalName_test_Static_0100
     * @tc.number i18n_HolidayLocalName_test_Static_0100
     * @tc.desc with HolidayLocalName
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('i18n_HolidayLocalName_test_Static_0100', Level.LEVEL3, () => {
      try {
        let holiday = new i18n.HolidayManager('/system/lib/US.ics');
        let item: i18n.HolidayInfoItem[] = holiday.getHolidayInfoItemArray(2023);
        let value: string = JSON.stringify(item[0].localNames![1].language);
        console.log('i18n_HolidayLocalName_test_Static_0100 value:', value);
        expect(value).assertFail();
      } catch (e) {
        console.log('i18n_HolidayLocalName_test_Static_0100 code&message:', e.code + e.message);
        expect(e.code).assertEqual(401);
      }
    })

    /**
     * @tc.name i18n_HolidayLocalName_test_Static_0200
     * @tc.number i18n_HolidayLocalName_test_Static_0200
     * @tc.desc with HolidayLocalName
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('i18n_HolidayLocalName_test_Static_0200', Level.LEVEL3, () => {
      try {
        let holiday = new i18n.HolidayManager('/system/lib/US.ics');
        let item: i18n.HolidayInfoItem[] = holiday.getHolidayInfoItemArray(2023);
        let value: string = JSON.stringify(item[0].localNames![1].name);
        console.log('i18n_HolidayLocalName_test_Static_0200 value:', value);
        expect(value).assertFail();
      } catch (e) {
        console.log('i18n_HolidayLocalName_test_Static_0200 code&message:', e.code + e.message);
        expect(e.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   AdvancedMeasureFormat_test_Static_0100
     * @tc.number AdvancedMeasureFormat_test_Static_0100
     * @tc.desc   AdvancedMeasureFormat  with AREA_LAND_AGRICULT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AdvancedMeasureFormat_test_Static_0100', Level.LEVEL2, () => {
      let nft: Intl.NumberFormat = new Intl.NumberFormat('en-US', {style:"unit", unit: "hectare", unitDisplay: "short"});
      let aft = new i18n.AdvancedMeasureFormat(nft, {unitUsage:i18n.UnitUsage.AREA_LAND_AGRICULT});
      let value: string = aft.format(100)
      console.log('AdvancedMeasureFormat_test_Static_0100 value:', value);
      expect(value).assertEqual("247.105 ac")
    })

    /**
     * @tc.name   AdvancedMeasureFormat_test_Static_0200
     * @tc.number AdvancedMeasureFormat_test_Static_0200
     * @tc.desc   AdvancedMeasureFormat  with AREA_LAND_AGRICULT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AdvancedMeasureFormat_test_Static_0200', Level.LEVEL2, () => {
      let nft: Intl.NumberFormat = new Intl.NumberFormat('en-US', {style:"unit", unit: "hectare", unitDisplay: "short"});
      let aft = new i18n.AdvancedMeasureFormat(nft, {unitUsage:i18n.UnitUsage.AREA_LAND_COMMERCL});
      let value: string = aft.format(100)
      console.log('AdvancedMeasureFormat_test_Static_0200 value:', value);
      expect(value).assertEqual("247.105 ac")
    })

    /**
     * @tc.name   AdvancedMeasureFormat_test_Static_0300
     * @tc.number AdvancedMeasureFormat_test_Static_0300
     * @tc.desc   AdvancedMeasureFormat  with AREA_LAND_RESIDNTL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AdvancedMeasureFormat_test_Static_0300', Level.LEVEL2, () => {
      let nft: Intl.NumberFormat = new Intl.NumberFormat('en-US', {style:"unit", unit: "hectare", unitDisplay: "short"});
      let aft = new i18n.AdvancedMeasureFormat(nft, {unitUsage:i18n.UnitUsage.AREA_LAND_RESIDNTL});
      let value: string = aft.format(100)
      console.log('AdvancedMeasureFormat_test_Static_0300 value:', value);
      expect(value).assertEqual("247.105 ac")
    })

    /**
     * @tc.name   AdvancedMeasureFormat_test_Static_0400
     * @tc.number AdvancedMeasureFormat_test_Static_0400
     * @tc.desc   AdvancedMeasureFormat  with LENGTH_PERSON
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AdvancedMeasureFormat_test_Static_0400', Level.LEVEL2, () => {
      let nft: Intl.NumberFormat = new Intl.NumberFormat('en-US', {style:"unit", unit: "meter", unitDisplay: "short"});
      let aft = new i18n.AdvancedMeasureFormat(nft, {unitUsage:i18n.UnitUsage.LENGTH_PERSON});
      let value: string = aft.format(2)
      console.log('AdvancedMeasureFormat_test_Static_0400 value:', value);
      expect(value).assertEqual("78.74 in")
    })

    /**
     * @tc.name   AdvancedMeasureFormat_test_Static_0500
     * @tc.number AdvancedMeasureFormat_test_Static_0500
     * @tc.desc   AdvancedMeasureFormat  with LENGTH_PERSON_SMALL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AdvancedMeasureFormat_test_Static_0500', Level.LEVEL2, () => {
      let nft: Intl.NumberFormat = new Intl.NumberFormat('en-US', {style:"unit", unit: "meter", unitDisplay: "short"});
      let aft = new i18n.AdvancedMeasureFormat(nft, {unitUsage:i18n.UnitUsage.LENGTH_PERSON_SMALL});
      let value: string = aft.format(2)
      console.log('AdvancedMeasureFormat_test_Static_0500 value:', value);
      expect(value).assertEqual("78.74 in")
    })

    /**
     * @tc.name   AdvancedMeasureFormat_test_Static_0600
     * @tc.number AdvancedMeasureFormat_test_Static_0600
     * @tc.desc   AdvancedMeasureFormat  with LENGTH_RAINFALL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AdvancedMeasureFormat_test_Static_0600', Level.LEVEL2, () => {
      let nft: Intl.NumberFormat = new Intl.NumberFormat('en-US', {style:"unit", unit: "milliliter", unitDisplay: "short"});
      let aft = new i18n.AdvancedMeasureFormat(nft, {unitUsage:i18n.UnitUsage.LENGTH_RAINFALL});
      let value: string = aft.format(2)
      console.log('AdvancedMeasureFormat_test_Static_0600 value:', value);
      expect(value).assertEqual("2 mL")
    })

    /**
     * @tc.name   AdvancedMeasureFormat_test_Static_0700
     * @tc.number AdvancedMeasureFormat_test_Static_0700
     * @tc.desc   AdvancedMeasureFormat  with LENGTH_ROAD
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AdvancedMeasureFormat_test_Static_0700', Level.LEVEL2, () => {
      let nft: Intl.NumberFormat = new Intl.NumberFormat('en-US', {style:"unit", unit: "meter", unitDisplay: "short"});
      let aft = new i18n.AdvancedMeasureFormat(nft, {unitUsage:i18n.UnitUsage.LENGTH_ROAD});
      let value: string = aft.format(100)
      console.log('AdvancedMeasureFormat_test_Static_0700 value:', value);
      expect(value).assertEqual("0.062 mi")
    })

    /**
     * @tc.name   AdvancedMeasureFormat_test_Static_0800
     * @tc.number SUB_GLOBAL_i18n_NumberFormatSupportUnit_0800
     * @tc.desc   AdvancedMeasureFormat  with LENGTH_ROAD_SMALL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AdvancedMeasureFormat_test_Static_0800', Level.LEVEL2, () => {
      let nft: Intl.NumberFormat = new Intl.NumberFormat('en-US', {style:"unit", unit: "meter", unitDisplay: "short"});
      let aft = new i18n.AdvancedMeasureFormat(nft, {unitUsage:i18n.UnitUsage.LENGTH_ROAD_SMALL});
      let value: string = aft.format(100)
      console.log('AdvancedMeasureFormat_test_Static_0800 value:', value);
      expect(value).assertEqual("328.084 ft")
    })

    /**
     * @tc.name   AdvancedMeasureFormat_test_Static_0900
     * @tc.number AdvancedMeasureFormat_test_Static_0900
     * @tc.desc   AdvancedMeasureFormat  with LENGTH_SNOWFALL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AdvancedMeasureFormat_test_Static_0900', Level.LEVEL2, () => {
      let nft: Intl.NumberFormat = new Intl.NumberFormat('en-US', {style:"unit", unit: "milliliter", unitDisplay: "short"});
      let aft = new i18n.AdvancedMeasureFormat(nft, {unitUsage:i18n.UnitUsage.LENGTH_SNOWFALL});
      let value: string = aft.format(100)
      console.log('AdvancedMeasureFormat_test_Static_0900 value:', value);
      expect(value).assertEqual("100 mL")
    })

    /**
     * @tc.name   AdvancedMeasureFormat_test_Static_1000
     * @tc.number AdvancedMeasureFormat_test_Static_1000
     * @tc.desc   AdvancedMeasureFormat  with LENGTH_VEHICLE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AdvancedMeasureFormat_test_Static_1000', Level.LEVEL2, () => {
      let nft: Intl.NumberFormat = new Intl.NumberFormat('en-US', {style:"unit", unit: "meter", unitDisplay: "short"});
      let aft = new i18n.AdvancedMeasureFormat(nft, {unitUsage:i18n.UnitUsage.LENGTH_VEHICLE});
      let value: string = aft.format(100)
      console.log('AdvancedMeasureFormat_test_Static_1000 value:', value);
      expect(value).assertEqual("328.084 ft")
    })

    /**
     * @tc.name   AdvancedMeasureFormat_test_Static_1100
     * @tc.number AdvancedMeasureFormat_test_Static_1100
     * @tc.desc   AdvancedMeasureFormat  with LENGTH_VISIBLTY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AdvancedMeasureFormat_test_Static_1100', Level.LEVEL2, () => {
      let nft: Intl.NumberFormat = new Intl.NumberFormat('en-US', {style:"unit", unit: "meter", unitDisplay: "short"});
      let aft = new i18n.AdvancedMeasureFormat(nft, {unitUsage:i18n.UnitUsage.LENGTH_VISIBLTY});
      let value: string = aft.format(100)
      console.log('AdvancedMeasureFormat_test_Static_1100 value:', value);
      expect(value).assertEqual("0.062 mi")
    })

    /**
     * @tc.name   AdvancedMeasureFormat_test_Static_1200
     * @tc.number AdvancedMeasureFormat_test_Static_1200
     * @tc.desc   AdvancedMeasureFormat  with LENGTH_VISIBLTY_SMALL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AdvancedMeasureFormat_test_Static_1200', Level.LEVEL2, () => {
      let nft: Intl.NumberFormat = new Intl.NumberFormat('en-US', {style:"unit", unit: "meter", unitDisplay: "short"});
      let aft = new i18n.AdvancedMeasureFormat(nft, {unitUsage:i18n.UnitUsage.LENGTH_VISIBLTY_SMALL});
      let value: string = aft.format(100)
      console.log('AdvancedMeasureFormat_test_Static_1200 value:', value);
      expect(value).assertEqual("328.084 ft")
    })

    /**
     * @tc.name   AdvancedMeasureFormat_test_Static_1300
     * @tc.number AdvancedMeasureFormat_test_Static_1300
     * @tc.desc   AdvancedMeasureFormat  with LENGTH_PERSON_INFORMAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AdvancedMeasureFormat_test_Static_1300', Level.LEVEL2, () => {
      let nft: Intl.NumberFormat = new Intl.NumberFormat('en-US', {style:"unit", unit: "meter", unitDisplay: "short"});
      let aft = new i18n.AdvancedMeasureFormat(nft, {unitUsage:i18n.UnitUsage.LENGTH_PERSON_INFORMAL});
      let value: string = aft.format(100)
      console.log('AdvancedMeasureFormat_test_Static_1300 value:', value);
      expect(value).assertEqual("328.084 ft")
    })

    /**
     * @tc.name   AdvancedMeasureFormat_test_Static_1400
     * @tc.number AdvancedMeasureFormat_test_Static_1400
     * @tc.desc   AdvancedMeasureFormat  with LENGTH_SMALL_INFORMAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AdvancedMeasureFormat_test_Static_1400', Level.LEVEL2, () => {
      let nft: Intl.NumberFormat = new Intl.NumberFormat('en-US', {style:"unit", unit: "meter", unitDisplay: "short"});
      let aft = new i18n.AdvancedMeasureFormat(nft, {unitUsage:i18n.UnitUsage.LENGTH_PERSON_SMALL_INFORMAL});
      let value: string = aft.format(100)
      console.log('AdvancedMeasureFormat_test_Static_1400 value:', value);
      expect(value).assertEqual("100 m")
    })

    /**
     * @tc.name   AdvancedMeasureFormat_test_Static_1500
     * @tc.number SUB_GLOBAL_i18n_NumberFormatSupportUnit_1500
     * @tc.desc   AdvancedMeasureFormat  with LENGTH_ROAD_INFORMAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AdvancedMeasureFormat_test_Static_1500', Level.LEVEL2, () => {
      let nft: Intl.NumberFormat = new Intl.NumberFormat('en-US', {style:"unit", unit: "meter", unitDisplay: "short"});
      let aft = new i18n.AdvancedMeasureFormat(nft, {unitUsage:i18n.UnitUsage.LENGTH_ROAD_INFORMAL});
      let value: string = aft.format(100)
      console.log('AdvancedMeasureFormat_test_Static_1500 value:', value);
      expect(value).assertEqual("100 m")
    })

    /**
     * @tc.name   AdvancedMeasureFormat_test_Static_1600
     * @tc.number AdvancedMeasureFormat_test_Static_1600
     * @tc.desc   AdvancedMeasureFormat  with SPEED_ROAD_TRAVEL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AdvancedMeasureFormat_test_Static_1600', Level.LEVEL2, () => {
      let nft: Intl.NumberFormat = new Intl.NumberFormat('en-US', {style:"unit", unit: "meter", unitDisplay: "short"});
      let aft = new i18n.AdvancedMeasureFormat(nft, {unitUsage:i18n.UnitUsage.SPEED_ROAD_TRAVEL});
      let value: string = aft.format(100)
      console.log('AdvancedMeasureFormat_test_Static_1600 value:', value);
      expect(value).assertEqual("100 m")
    })

    /**
     * @tc.name   AdvancedMeasureFormat_test_Static_1700
     * @tc.number AdvancedMeasureFormat_test_Static_1700
     * @tc.desc   AdvancedMeasureFormat  with SPEED_WIND
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AdvancedMeasureFormat_test_Static_1700', Level.LEVEL2, () => {
      let nft: Intl.NumberFormat = new Intl.NumberFormat('zh-Hans-CN', {style:"unit", unit: "meter", unitDisplay: "short"});
      let aft = new i18n.AdvancedMeasureFormat(nft, {unitUsage:i18n.UnitUsage.SPEED_WIND});
      let value: string = aft.format(100)
      console.log('AdvancedMeasureFormat_test_Static_1700 value:', value);
      expect(value).assertEqual("100米")
    })

    /**
     * @tc.name   AdvancedMeasureFormat_test_Static_1800
     * @tc.number AdvancedMeasureFormat_test_Static_1800
     * @tc.desc   AdvancedMeasureFormat  with TEMPERATURE_PERSON
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AdvancedMeasureFormat_test_Static_1800', Level.LEVEL2, () => {
      let nft: Intl.NumberFormat = new Intl.NumberFormat('zh-Hans-CN', {style:"unit", unit: "fahrenheit", unitDisplay: "short"});
      let aft = new i18n.AdvancedMeasureFormat(nft, {unitUsage:i18n.UnitUsage.TEMPERATURE_PERSON});
      let value: string = aft.format(100)
      console.log('AdvancedMeasureFormat_test_Static_1800 value:', value);
      expect(value).assertEqual("37.778°C")
    })

    /**
     * @tc.name   AdvancedMeasureFormat_test_Static_1900
     * @tc.number AdvancedMeasureFormat_test_Static_1900
     * @tc.desc   AdvancedMeasureFormat  with TEMPERATURE_WEATHER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AdvancedMeasureFormat_test_Static_1900', Level.LEVEL2, () => {
      let nft: Intl.NumberFormat = new Intl.NumberFormat('en-US', {style:"unit", unit: "fahrenheit", unitDisplay: "short"});
      let aft = new i18n.AdvancedMeasureFormat(nft, {unitUsage:i18n.UnitUsage.TEMPERATURE_WEATHER});
      let value: string = aft.format(100)
      console.log('AdvancedMeasureFormat_test_Static_1900 value:', value);
      expect(value).assertEqual("37.778°C")
    })

    /**
     * @tc.name   AdvancedMeasureFormat_test_Static_2000
     * @tc.number AdvancedMeasureFormat_test_Static_2000
     * @tc.desc   AdvancedMeasureFormat  with VOLUME_VEHICLE_FUEL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AdvancedMeasureFormat_test_Static_2000', Level.LEVEL2, () => {
      let nft: Intl.NumberFormat = new Intl.NumberFormat('en-US', {style:"unit", unit: "liter", unitDisplay: "short"});
      let aft = new i18n.AdvancedMeasureFormat(nft, {unitUsage:i18n.UnitUsage.VOLUME_VEHICLE_FUEL});
      let value: string = aft.format(100)
      console.log('AdvancedMeasureFormat_test_Static_2000 value:', value);
      expect(value).assertEqual("26.417 gal")
    })

    /**
     * @tc.name   AdvancedMeasureFormat_test_Static_2100
     * @tc.number AdvancedMeasureFormat_test_Static_2100
     * @tc.desc   AdvancedMeasureFormat  with ELAPSED_TIME_SECOND
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AdvancedMeasureFormat_test_Static_2100', Level.LEVEL2, () => {
      let nft: Intl.NumberFormat = new Intl.NumberFormat('zh-Hans-CN', {style:"unit", unit: "day", unitDisplay: "short"});
      let aft = new i18n.AdvancedMeasureFormat(nft, {unitUsage:i18n.UnitUsage.ELAPSED_TIME_SECOND});
      let value: string = aft.format(100)
      console.log('AdvancedMeasureFormat_test_Static_2100 value:', value);
      expect(value).assertEqual("3个月前")
    })

    /**
     * @tc.name   AdvancedMeasureFormat_test_Static_2200
     * @tc.number AdvancedMeasureFormat_test_Static_2200
     * @tc.desc   AdvancedMeasureFormat  with SIZE_FILE_BYTE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AdvancedMeasureFormat_test_Static_2200', Level.LEVEL2, () => {
      let nft: Intl.NumberFormat = new Intl.NumberFormat('en-US', {style:"unit", unit: "bit", unitDisplay: "short"});
      let aft = new i18n.AdvancedMeasureFormat(nft, {unitUsage:i18n.UnitUsage.SIZE_FILE_BYTE});
      let value: string = aft.format(100)
      console.log('AdvancedMeasureFormat_test_Static_2200 value:', value);
      expect(value).assertEqual("100 bit")
    })

    /**
     * @tc.name   AdvancedMeasureFormat_test_Static_2300
     * @tc.number AdvancedMeasureFormat_test_Static_2300
     * @tc.desc   AdvancedMeasureFormat  with SIZE_SHORTFILE_BYTE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AdvancedMeasureFormat_test_Static_2300', Level.LEVEL2, () => {
      let nft: Intl.NumberFormat = new Intl.NumberFormat('zh-Hans-CN', {style:"unit", unit: "terabit", unitDisplay: "short"});
      let aft = new i18n.AdvancedMeasureFormat(nft, {unitUsage:i18n.UnitUsage.SIZE_SHORTFILE_BYTE});
      let value: string = aft.format(100)
      console.log('AdvancedMeasureFormat_test_Static_2300 value:', value);
      expect(value).assertEqual("100 Tb")
    })

    /**
     * @tc.name   i18n_getMilliseconds_test_Static_0100
     * @tc.number i18n_getMilliseconds_test_Static_0100
     * @tc.desc   getMilliseconds with Africa/Cairo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('i18n_getMilliseconds_test_Static_0100', Level.LEVEL3, () => {
      let timeZone: i18n.TimeZone = i18n.getTimeZone('Africa/Cairo');
      let zoneRules: i18n.ZoneRules = timeZone.getZoneRules();
      let date: Date = new Date(2025, 3, 13);
      let zoneOffsetTransition: i18n.ZoneOffsetTransition = zoneRules.nextTransition(date.getTime());
      let sj: long = zoneOffsetTransition.getMilliseconds().toLong();
      console.log('i18n_getMilliseconds_test_Static_0100 sj:', sj);
      let dateTimeFormat: Intl.DateTimeFormat = new Intl.DateTimeFormat('zh-CN', {
        timeZone: 'Africa/Cairo',
        dateStyle: 'long',
        timeStyle: 'long',
        hour12: false
      });
      let date2: Date = new Date(sj);
      let dateFormat = dateTimeFormat.format(date2);
      let sj2 = zoneOffsetTransition.getOffsetAfter() / 3600000;
      let sj3 = zoneOffsetTransition.getOffsetBefore() / 3600000;
      console.log('i18n_getMilliseconds_test_Static_0100 value:', dateFormat);
      console.log('i18n_getMilliseconds_test_Static_0100 sj2:', sj2);
      console.log('i18n_getMilliseconds_test_Static_0100 sj3:', sj3);
      expect(dateFormat).assertEqual('2025年4月25日 GMT+3 01:00:00');
      expect(sj2).assertEqual(3);
      expect(sj3).assertEqual(2);
    })

    /**
     * @tc.name   i18n_StyledNumberFormat_test_Static_0100
     * @tc.number i18n_StyledNumberFormat_test_Static_0100
     * @tc.desc   getMilliseconds with simpleNumFmt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('i18n_StyledNumberFormat_test_Static_0100', Level.LEVEL3, () => {
      let integerTextStyle: TextStyle = new TextStyle({ fontColor: Color.Red });
      let decimalTextStyle: TextStyle = new TextStyle({ fontColor: Color.Brown });
      let fractionTextStyle: TextStyle = new TextStyle({ fontColor: Color.Blue });
      let unitTextStyle: TextStyle = new TextStyle({ fontColor: Color.Green });
      let numFmt: Intl.NumberFormat = new Intl.NumberFormat('zh',{ style: 'unit', unit: 'percent' });
      let styledNumFmt: i18n.StyledNumberFormat = new i18n.StyledNumberFormat(numFmt, {
        integer: integerTextStyle,
        decimal: decimalTextStyle,
        fraction: fractionTextStyle,
        unit: unitTextStyle
      });
      let formattedNumber: StyledString = styledNumFmt.format(1234.5678);
      expect(formattedNumber.getString()).assertEqual('1,234.568%')
      let locale: Intl.Locale = new Intl.Locale('zh');
      let simpleNumFmt: i18n.SimpleNumberFormat = i18n.getSimpleNumberFormatBySkeleton('percent', locale);
      let styledSimpleNumFmt: i18n.StyledNumberFormat = new i18n.StyledNumberFormat(simpleNumFmt, {
        integer: integerTextStyle,
        decimal: decimalTextStyle,
        fraction: fractionTextStyle,
        unit: unitTextStyle
      });
      let formattedSimpleNumber: StyledString = styledSimpleNumFmt.format(1234.5678);
      expect(formattedSimpleNumber.getString()).assertContain('1,234.5678%')
    })

    /**
     * @tc.name   i18n_StyledDateTimeFormat_format_test_Static_0100
     * @tc.number i18n_StyledDateTimeFormat_format_test_Static_0100
     * @tc.desc   getMilliseconds with styledDateFormat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('i18n_StyledDateTimeFormat_format_test_Static_0100', Level.LEVEL3, () => {
      let yearTextStyle: TextStyle = new TextStyle({
        fontColor: Color.Blue,
        fontFamily: "Sans",
        fontWeight: FontWeight.Medium,
        fontStyle: FontStyle.Italic
      });
      let monthTextStyle: TextStyle = new TextStyle({
        fontColor: Color.Red,
        fontFamily: "Arial",
        fontWeight: FontWeight.Lighter,
        fontStyle: FontStyle.Normal
      });
      let dayTextStyle: TextStyle = new TextStyle({
        fontColor: Color.Blue,
        fontFamily: "Sans",
        fontWeight: FontWeight.Medium,
        fontStyle: FontStyle.Italic
      });
      let hourTextStyle: TextStyle = new TextStyle({
        fontColor: Color.Red,
        fontFamily: "Arial",
        fontWeight: FontWeight.Lighter,
        fontStyle: FontStyle.Normal
      });
      let minuteTextStyle: TextStyle = new TextStyle({
        fontColor: Color.Blue,
        fontFamily: "Sans",
        fontWeight: FontWeight.Medium,
        fontStyle: FontStyle.Italic
      });
      let secondTextStyle: TextStyle = new TextStyle({
        fontColor: Color.Red,
        fontFamily: "Arial",
        fontWeight: FontWeight.Lighter,
        fontStyle: FontStyle.Normal
      });
      let weekdayTextStyle: TextStyle = new TextStyle({
        fontColor: Color.Blue,
        fontFamily: "Sans",
        fontWeight: FontWeight.Medium,
        fontStyle: FontStyle.Italic
      });
      let eraTextStyle: TextStyle = new TextStyle({
        fontColor: Color.Red,
        fontFamily: "Arial",
        fontWeight: FontWeight.Lighter,
        fontStyle: FontStyle.Normal
      });
      let dayPeriodTextStyle: TextStyle = new TextStyle({
        fontColor: Color.Blue,
        fontFamily: "Sans",
        fontWeight: FontWeight.Medium,
        fontStyle: FontStyle.Italic
      });
      let timeZoneNameTextStyle: TextStyle = new TextStyle({
        fontColor: Color.Red,
        fontFamily: "Arial",
        fontWeight: FontWeight.Lighter,
        fontStyle: FontStyle.Normal
      });
      let date: Date = new Date(2025, 6, 17, 3, 24, 30);
      let formatter: Intl.DateTimeFormat = new Intl.DateTimeFormat('zh-CN', {
        dateStyle: 'long',
        timeStyle: 'long'
      });
      let styledDateFormat: i18n.StyledDateTimeFormat = new i18n.StyledDateTimeFormat(formatter, {
        year: yearTextStyle,
        month: monthTextStyle,
        day: dayTextStyle,
        hour: hourTextStyle,
        minute: minuteTextStyle,
        second: secondTextStyle,
        weekday: weekdayTextStyle,
        era: eraTextStyle,
        dayPeriod: dayPeriodTextStyle,
        timeZoneName: timeZoneNameTextStyle
      });
      let formattedDate: StyledString = styledDateFormat.format(date);
      expect(formattedDate.getString()).assertContain('2025年7月17日 GMT+8 03:24:30')
    })

    /**
     * @tc.name i18n_getSystemLanguages_test_Static_0100
     * @tc.number i18n_getSystemLanguages_test_Static_0100
     * @tc.desc with getSystemLanguages
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('i18n_getSystemLanguages_test_Static_0100', Level.LEVEL3, () => {
      let lang: string[] = i18n.System.getSystemLanguages();
      console.log('i18n_getSystemLanguages_test_Static_0100 value:', lang);
      expect(lang.length != 0).assertEqual(true);
    })

    /**
     * @tc.name i18n_getSystemLocaleInstance_test_Static_0100
     * @tc.number i18n_getSystemLocaleInstance_test_Static_0100
     * @tc.desc with getSystemLocaleInstance
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('i18n_getSystemLocaleInstance_test_Static_0100', Level.LEVEL3, () => {
      let locale: string = i18n.System.getSystemLocaleInstance().toString();
      console.log('i18n_getSystemLocaleInstance_test_Static_0100 value:', locale);
      expect(locale).assertEqual('zh-Hans-CN');
    })

    /**
     * @tc.name i18n_getPreferredLanguageList_test_Static_0100
     * @tc.number i18n_getPreferredLanguageList_test_Static_0100
     * @tc.desc with getPreferredLanguageList
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('i18n_getPreferredLanguageList_test_Static_0100', Level.LEVEL3, () => {
      let value: string[] = i18n.System.getPreferredLanguageList();
      console.log('i18n_getSystemLocaleInstance_test_Static_0100 value:', value);
      expect(value.length != 0).assertEqual(true);
    })

    /**
     * @tc.name i18n_calendar_getFirstDayOfWeek_test_Static_0100
     * @tc.number i18n_calendar_getFirstDayOfWeek_test_Static_0100
     * @tc.desc with getFirstDayOfWeek
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('i18n_calendar_getFirstDayOfWeek_test_Static_0100', Level.LEVEL3, () => {
      let calendar: i18n.Calendar = i18n.getCalendar('zh');
      let value: number = calendar.getFirstDayOfWeek();
      console.log('i18n_calendar_getFirstDayOfWeek_test_Static_0100 value:', value);
      expect(value).assertEqual(1);
    })

    /**
     * @tc.name i18n_calendar_getMinimalDaysInFirstWeek_test_Static_0100
     * @tc.number i18n_calendar_getMinimalDaysInFirstWeek_test_Static_0100
     * @tc.desc with getMinimalDaysInFirstWeek
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('i18n_calendar_getMinimalDaysInFirstWeek_test_Static_0100', Level.LEVEL3, () => {
      let calendar: i18n.Calendar = i18n.getCalendar('zh-Hans');
      let value: number = calendar.getMinimalDaysInFirstWeek();
      console.log('i18n_calendar_getMinimalDaysInFirstWeek_test_Static_0100 value:', value);
      expect(value).assertEqual(1);
    })

    /**
     * @tc.name i18n_BreakIterator_current_test_Static_0100
     * @tc.number i18n_BreakIterator_current_test_Static_0100
     * @tc.desc with current
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('i18n_BreakIterator_current_test_Static_0100', Level.LEVEL3, () => {
      let iterator: i18n.BreakIterator = i18n.getLineInstance('en');
      iterator.setLineBreakText('Apple is my favorite fruit.');
      let currentPos: number = iterator.current();
      console.log('i18n_BreakIterator_current_test_Static_0100 value:', currentPos);
      expect(currentPos).assertEqual(0);
    })

    /**
     * @tc.name i18n_BreakIterator_first_test_Static_0100
     * @tc.number i18n_BreakIterator_first_test_Static_0100
     * @tc.desc with first
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('i18n_BreakIterator_first_test_Static_0100', Level.LEVEL3, () => {
      let iterator: i18n.BreakIterator = i18n.getLineInstance('en');
      iterator.setLineBreakText('Apple is my favorite fruit.');
      let firstPos: number = iterator.first();
      console.log('i18n_BreakIterator_first_test_Static_0100 value:', firstPos);
      expect(firstPos).assertEqual(0);
    })

    /**
     * @tc.name i18n_BreakIterator_previous_test_Static_0100
     * @tc.number i18n_BreakIterator_previous_test_Static_0100
     * @tc.desc with previous
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('i18n_BreakIterator_previous_test_Static_0100', Level.LEVEL3, () => {
      let iterator: i18n.BreakIterator = i18n.getLineInstance('en');
      iterator.setLineBreakText('Apple is my favorite fruit.');
      let pos1: number = iterator.first();
      let pos2: number = iterator.next(3);
      let pos3: number = iterator.previous();
      console.log('i18n_BreakIterator_previous_test_Static_0100 value:', pos3);
      expect(pos3).assertEqual(9);
    })

    /**
     * @tc.name i18n_BreakIterator_following_test_Static_0100
     * @tc.number i18n_BreakIterator_following_test_Static_0100
     * @tc.desc with following
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('i18n_BreakIterator_following_test_Static_0100', Level.LEVEL3, () => {
      let iterator: i18n.BreakIterator = i18n.getLineInstance('en');
      iterator.setLineBreakText('Apple is my favorite fruit.');
      let pos: number = iterator.following(0);
      console.log('i18n_BreakIterator_following_test_Static_0100 value:', pos);
      expect(pos).assertEqual(6);
    })

    /**
     * @tc.name i18n_IndexUtil_getIndexList_test_Static_0100
     * @tc.number i18n_IndexUtil_getIndexList_test_Static_0100
     * @tc.desc with getIndexList
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('i18n_IndexUtil_getIndexList_test_Static_0100', Level.LEVEL3, () => {
      let indexUtil: i18n.IndexUtil = i18n.getInstance('zh-CN');
      let indexList: string[] = indexUtil.getIndexList();
      console.log('i18n_IndexUtil_getIndexList_test_Static_0100 value:', indexList);
      expect(indexList[1]).assertEqual("A");
    })

    /**
     * @tc.name i18n_TimeZone_getRawOffset_test_Static_0100
     * @tc.number i18n_TimeZone_getRawOffset_test_Static_0100
     * @tc.desc with getRawOffset
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('i18n_TimeZone_getRawOffset_test_Static_0100', Level.LEVEL3, () => {
      let timeZone: i18n.TimeZone = i18n.getTimeZone('Asia/Shanghai');
      let offset: number = timeZone.getRawOffset();
      console.log('i18n_TimeZone_getRawOffset_test_Static_0100 value:', offset);
      expect(offset).assertEqual(28800000);
    })

    /**
     * @tc.name i18n_Transliterator_getAvailableIDs_test_Static_0100
     * @tc.number i18n_Transliterator_getAvailableIDs_test_Static_0100
     * @tc.desc with getAvailableIDs
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('i18n_Transliterator_getAvailableIDs_test_Static_0100', Level.LEVEL3, () => {
      let ids: string[] = i18n.Transliterator.getAvailableIDs();
      console.log('i18n_Transliterator_getAvailableIDs_test_Static_0100 value:', ids);
      expect(ids.length != 0 ).assertEqual(true);
    })

    /**
     * @tc.name i18n_normalizer_getInstance_test_Static_0100
     * @tc.number i18n_normalizer_getInstance_test_Static_0100
     * @tc.desc with getInstance
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('i18n_normalizer_getInstance_test_Static_0100', Level.LEVEL3, () => {
      let str: string = '\u1e9b\u0323';
      let normal: i18n.Normalizer = i18n.Normalizer.getInstance(i18n.NormalizerMode.NFD);
      let value: string = normal.normalize(str);
      console.log('i18n_normalizer_getInstance_test_Static_0100 value:', value);
      expect(value).assertEqual('\u017f\u0323\u0307');
    })

    /**
     * @tc.name intl_DateTimeFormat_resolvedOptions_dateStyle_test_Static_0100
     * @tc.number intl_DateTimeFormat_resolvedOptions_dateStyle_test_Static_0100
     * @tc.desc with resolvedOptions
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('intl_DateTimeFormat_resolvedOptions_dateStyle_test_Static_0100', Level.LEVEL3, () => {
      let formatter: intl.DateTimeFormat = new intl.DateTimeFormat('en-GB', { dateStyle: 'full', timeStyle: 'medium' });
      let options: intl.DateTimeOptions = formatter.resolvedOptions();
      let dateStyle: string | undefined = options.dateStyle;
      let timeStyle: string | undefined = options.timeStyle;
      console.log('intl_DateTimeFormat_resolvedOptions_dateStyle_test_Static_0100 value:', dateStyle);
      console.log('intl_DateTimeFormat_resolvedOptions_dateStyle_test_Static_0100 value:', timeStyle);
      expect(dateStyle).assertEqual('full');
      expect(timeStyle).assertEqual('medium');
    })

    /**
     * @tc.name intl_NumberFormat_resolvedOptions_test_Static_0100
     * @tc.number intl_NumberFormat_resolvedOptions_test_Static_0100
     * @tc.desc with resolvedOptions
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('intl_NumberFormat_resolvedOptions_test_Static_0100', Level.LEVEL3, () => {
      let formatter: intl.NumberFormat = new intl.NumberFormat('zh', { style: 'decimal', notation: 'scientific' });
      let options: intl.NumberOptions = formatter.resolvedOptions();
      let style: string | undefined = options.style;
      let notation: string | undefined = options.notation;
      console.log('intl_NumberFormat_resolvedOptions_test_Static_0100 value:', style);
      console.log('intl_NumberFormat_resolvedOptions_test_Static_0100 value:', notation);
      expect(style).assertEqual('decimal');
      expect(notation).assertEqual('scientific');
    })

    /**
     * @tc.name intl_Collator_resolvedOptions_test_Static_0100
     * @tc.number intl_Collator_resolvedOptions_test_Static_0100
     * @tc.desc with resolvedOptions
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('intl_Collator_resolvedOptions_test_Static_0100', Level.LEVEL3, () => {
      let collator = new intl.Collator('zh-Hans', { usage: 'sort', ignorePunctuation: true });
      let options: intl.CollatorOptions = collator.resolvedOptions();
      let usage: string | undefined  = options.usage;
      let ignorePunctuation: boolean | undefined  = options.ignorePunctuation;
      console.log('intl_Collator_resolvedOptions_test_Static_0100 value:', usage);
      console.log('intl_Collator_resolvedOptions_test_Static_0100 value:', ignorePunctuation);
      expect(usage).assertEqual('sort');
      expect(ignorePunctuation).assertEqual(true);
    })

    /**
     * @tc.name TimeZone_GetOffset_test_Static_0100
     * @tc.number SUB_GLOBAL_I18N_TimeZoneGetOffSet_Static_0100
     * @tc.desc with getOffset
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('TimeZone_GetOffset_test_Static_0100', Level.LEVEL3, () => {
      let timeZone: i18n.TimeZone = i18n.getTimeZone();
      let value: number = timeZone.getOffset(1234567890);
      console.log('TimeZone_GetOffset_test_Static_0100 value:', value);
      expect(value).assertEqual(28800000);
    })


    console.log('*************end FivePointOne_i18nStageTest*************');
  })
}