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

import Ability from '@ohos.app.ability.UIAbility';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { i18n, intl } from '@kit.LocalizationKit';
import { LengthMetrics } from '@kit.ArkUI';

export default function FivePointOne_i18nStageTest() {
  describe("FivePointOne_i18nStageTest", () => {
    console.log('*************start FivePointOne_i18nStageTest*************');

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
     * @tc.name   SUB_GLOBAL_refinedFormat_0160
     * @tc.number SUB_GLOBAL_refinedFormat_0160
     * @tc.desc   begin code same as stop code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_refinedFormat_0160', Level.LEVEL2, () => {
      let numFormat: intl.NumberFormat = new intl.NumberFormat("zh-hans-CN");
      let formattedRange: string = numFormat.formatRange(0, 0);
      expect(formattedRange == "~0").assertTrue();
    })

    /**
     * @tc.name   SUB_GLOBAL_refinedFormat_0170
     * @tc.number SUB_GLOBAL_refinedFormat_0170
     * @tc.desc   normally (begin code & stop code)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_refinedFormat_0170', Level.LEVEL2, () => {
      let numFormat: intl.NumberFormat = new intl.NumberFormat("zh-hans-CN");
      let formattedRange: string = numFormat.formatRange(0, 9);
      expect(formattedRange == "0-9").assertTrue();
    })

    /**
     * @tc.name   SUB_GLOBAL_refinedFormat_0180
     * @tc.number SUB_GLOBAL_refinedFormat_0180
     * @tc.desc   begin code with negative ,stop code with decimal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_refinedFormat_0180', Level.LEVEL2, () => {
      let numFormat: intl.NumberFormat = new intl.NumberFormat("zh-hans-CN");
      let formattedRange: string = numFormat.formatRange(-9, 9.9);
      expect(formattedRange == "-9 - 9.9").assertTrue();
    })

    /**
     * @tc.name   SUB_GLOBAL_refinedFormat_0190
     * @tc.number SUB_GLOBAL_refinedFormat_0190
     * @tc.desc   begin code large than stop code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_refinedFormat_0190', Level.LEVEL2, () => {
      let numFormat: intl.NumberFormat = new intl.NumberFormat("zh-hans-CN");
      let formattedRange: string = numFormat.formatRange(9, 0);
      expect(formattedRange == "").assertTrue();
    })

    /**
     * @tc.name   I18N_test_getTemperatureName_0100
     * @tc.number SUB_GLOBAL_I18N_getTemperatureName_0100
     * @tc.desc   i18n.TemperatureType.CELSIUS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('I18N_test_getTemperatureName_0100', Level.LEVEL0, () => {
      let type = i18n.System.getTemperatureName(i18n.TemperatureType.CELSIUS);
      console.log('I18N_test_getTemperatureName_0100:' + type);
      expect(type).assertEqual('celsius');
    })

    /**
     * @tc.name   I18N_test_getTemperatureName_0200
     * @tc.number SUB_GLOBAL_I18N_getTemperatureName_0200
     * @tc.desc   i18n.TemperatureType.FAHRENHEIT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('I18N_test_getTemperatureName_0200', Level.LEVEL2, () => {
      let type = i18n.System.getTemperatureName(i18n.TemperatureType.FAHRENHEIT);
      console.log('I18N_test_getTemperatureName_0200:' + type);
      expect(type).assertEqual('fahrenheit');
    })

    /**
     * @tc.name   I18N_test_getTemperatureName_0300
     * @tc.number SUB_GLOBAL_I18N_getTemperatureName_0300
     * @tc.desc   i18n.TemperatureType.KELVIN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('I18N_test_getTemperatureName_0300', Level.LEVEL2, () => {
      let type = i18n.System.getTemperatureName(i18n.TemperatureType.KELVIN);
      console.log('I18N_test_getTemperatureName_0300:' + type);
      expect(type).assertEqual('kelvin');
    })

    /**
     * @tc.name   I18N_test_getTemperatureName_0400
     * @tc.number SUB_GLOBAL_I18N_getTemperatureName_0400
     * @tc.desc   input number zero
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('I18N_test_getTemperatureName_0400', Level.LEVEL3, () => {
      try {
        i18n.System.getTemperatureName(0);
      } catch (e) {
        console.log('I18N_test_getTemperatureName_0400 code&message:' + e.code + e.message);
        expect(e.code).assertEqual('890001');
      }
    })

    /**
     * @tc.name   I18N_test_getSimplifiedLanguage_01_0100
     * @tc.number SUB_GLOBAL_I18N_getSimplifiedLanguage_01_0100
     * @tc.desc   en-GB & en-Latn-US
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('I18N_test_getSimplifiedLanguage_01_0100', Level.LEVEL0, () => {
      let type_one = i18n.System.getSimplifiedLanguage('en-GB');
      console.log('I18N_test_getSimplifiedLanguage_01_0100 type_one:' + type_one);
      let type_two = i18n.System.getSimplifiedLanguage('en-Latn-US');
      console.log('I18N_test_getSimplifiedLanguage_01_0100 type_two:' + type_two);
      expect(type_one).assertEqual('en-GB');
      expect(type_two).assertEqual('en');
    })

    /**
     * @tc.name   I18N_test_getSimplifiedLanguage_01_0200
     * @tc.number SUB_GLOBAL_I18N_getSimplifiedLanguage_01_0200
     * @tc.desc   zh-Hant-HK & zh-Hant-TW
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('I18N_test_getSimplifiedLanguage_01_0200', Level.LEVEL2, () => {
      let type_one = i18n.System.getSimplifiedLanguage('zh-Hant-HK');
      console.log('I18N_test_getSimplifiedLanguage_01_0200 type_one:' + type_one);
      let type_two = i18n.System.getSimplifiedLanguage('zh-Hant-TW');
      console.log('I18N_test_getSimplifiedLanguage_01_0200 type_two:' + type_two);
      expect(type_one).assertEqual('zh-HK');
      expect(type_two).assertEqual('zh-TW');
    })

    /**
     * @tc.name   I18N_test_getSimplifiedLanguage_01_0300
     * @tc.number SUB_GLOBAL_I18N_getSimplifiedLanguage_01_0300
     * @tc.desc   es-ES & es-US
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('I18N_test_getSimplifiedLanguage_01_0300', Level.LEVEL2, () => {
      let type_one = i18n.System.getSimplifiedLanguage('es-ES');
      console.log('I18N_test_getSimplifiedLanguage_01_0300 type_one:' + type_one);
      let type_two = i18n.System.getSimplifiedLanguage('es-US');
      console.log('I18N_test_getSimplifiedLanguage_01_0300 type_two:' + type_two);
      expect(type_one).assertEqual('es');
      expect(type_two).assertEqual('es-US');
    })

    /**
     * @tc.name   I18N_test_getSimplifiedLanguage_01_0400
     * @tc.number SUB_GLOBAL_I18N_getSimplifiedLanguage_01_0400
     * @tc.desc   pt-PT & pt-BR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('I18N_test_getSimplifiedLanguage_01_0400', Level.LEVEL2, () => {
      let type_one = i18n.System.getSimplifiedLanguage('pt-PT');
      console.log('I18N_test_getSimplifiedLanguage_01_0400 type_one:' + type_one);
      let type_two = i18n.System.getSimplifiedLanguage('pt-BR');
      console.log('I18N_test_getSimplifiedLanguage_01_0400 type_two:' + type_two);
      expect(type_one).assertEqual('pt-PT');
      expect(type_two).assertEqual('pt');
    })

    /**
     * @tc.name   I18N_test_getSimplifiedLanguage_01_0500
     * @tc.number SUB_GLOBAL_I18N_getSimplifiedLanguage_01_0500
     * @tc.desc   en-CN & en-Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('I18N_test_getSimplifiedLanguage_01_0500', Level.LEVEL2, () => {
      let type_one = i18n.System.getSimplifiedLanguage('en-CN');
      console.log('I18N_test_getSimplifiedLanguage_01_0500 type_one:' + type_one);
      let type_two = i18n.System.getSimplifiedLanguage('en-Test');
      console.log('I18N_test_getSimplifiedLanguage_01_0500 type_two:' + type_two);
      expect(type_one).assertEqual('en-CN');
      expect(type_two).assertEqual('en-Test');
    })

    /**
     * @tc.name   I18N_test_getSimplifiedLanguage_01_0600
     * @tc.number SUB_GLOBAL_I18N_getSimplifiedLanguage_01_0600
     * @tc.desc   zh-Hant-CN & zh-Hant-Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('I18N_test_getSimplifiedLanguage_01_0600', Level.LEVEL2, () => {
      let type_one = i18n.System.getSimplifiedLanguage('zh-Hant-CN');
      console.log('I18N_test_getSimplifiedLanguage_01_0600 type_one:' + type_one);
      let type_two = i18n.System.getSimplifiedLanguage('zh-Hant-Test');
      console.log('I18N_test_getSimplifiedLanguage_01_0600 type_two:' + type_two);
      expect(type_one).assertEqual('zh-Hant-CN');
      expect(type_two).assertEqual('zh');
    })

    /**
     * @tc.name   I18N_test_getSimplifiedLanguage_01_0700
     * @tc.number SUB_GLOBAL_I18N_getSimplifiedLanguage_01_0700
     * @tc.desc   es-CN & es-Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('I18N_test_getSimplifiedLanguage_01_0700', Level.LEVEL2, () => {
      let type_one = i18n.System.getSimplifiedLanguage('es-CN');
      console.log('I18N_test_getSimplifiedLanguage_01_0700 type_one:' + type_one);
      let type_two = i18n.System.getSimplifiedLanguage('es-Test');
      console.log('I18N_test_getSimplifiedLanguage_01_0700 type_two:' + type_two);
      expect(type_one).assertEqual('es-CN');
      expect(type_two).assertEqual('es-Test');
    })

    /**
     * @tc.name   I18N_test_getSimplifiedLanguage_01_0800
     * @tc.number SUB_GLOBAL_I18N_getSimplifiedLanguage_01_0800
     * @tc.desc   pt-CN & pt-Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('I18N_test_getSimplifiedLanguage_01_0800', Level.LEVEL2, () => {
      let type_one = i18n.System.getSimplifiedLanguage('pt-CN');
      console.log('I18N_test_getSimplifiedLanguage_01_0800 type_one:' + type_one);
      let type_two = i18n.System.getSimplifiedLanguage('pt-Test');
      console.log('I18N_test_getSimplifiedLanguage_01_0800 type_two:' + type_two);
      expect(type_one).assertEqual('pt-CN');
      expect(type_two).assertEqual('pt-Test');
    })

    /**
     * @tc.name   I18N_test_getSimplifiedLanguage_01_0900
     * @tc.number SUB_GLOBAL_I18N_getSimplifiedLanguage_01_0900
     * @tc.desc   bo-CN & bo-Test & bo-Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('I18N_test_getSimplifiedLanguage_01_0900', Level.LEVEL2, () => {
      let type_one = i18n.System.getSimplifiedLanguage('bo-CN');
      console.log('I18N_test_getSimplifiedLanguage_01_0900 type_one:' + type_one);
      let type_two = i18n.System.getSimplifiedLanguage('bo-US');
      console.log('I18N_test_getSimplifiedLanguage_01_0900 type_two:' + type_two);
      let type_three = i18n.System.getSimplifiedLanguage('bo-Test');
      console.log('I18N_test_getSimplifiedLanguage_01_0900 type_three:' + type_three);
      expect(type_one).assertEqual('bo');
      expect(type_two).assertEqual('bo-US');
      expect(type_three).assertEqual('bo-Test');
    })

    /**
     * @tc.name   I18N_test_getSimplifiedLanguage_01_1000
     * @tc.number SUB_GLOBAL_I18N_getSimplifiedLanguage_01_1000
     * @tc.desc   pt-CN & pt-Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('I18N_test_getSimplifiedLanguage_01_1000', Level.LEVEL3, () => {
      try {
        i18n.System.getSimplifiedLanguage("0");
      } catch (e) {
        console.log('I18N_test_getSimplifiedLanguage_01_1000 code&message:' + e.code + e.message);
        expect(e.code).assertEqual('890001');
      }
    })

    /**
     * @tc.name   SUB_GLOBAL_I18N_StyledNumberFormat_02_00100
     * @tc.number SUB_GLOBAL_I18N_StyledNumberFormat_02_00100
     * @tc.desc   fontColor &fontFamily & fontSize & fontWeight & fontStyle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_GLOBAL_I18N_StyledNumberFormat_02_00100', Level.LEVEL0, () => {
      let integer_textStyle = new TextStyle({
        fontColor: Color.Red,
        fontFamily: "Arial",
        fontWeight: FontWeight.Lighter,
        fontStyle: FontStyle.Italic
      });
      let decimal_textStyle = new TextStyle({
        fontColor: Color.Black,
        fontFamily: "Arial",
        fontWeight: FontWeight.Normal,
        fontStyle: FontStyle.Normal
      });
      let fraction_textStyle = new TextStyle({
        fontColor: Color.Green,
        fontFamily: "Arial",
        fontWeight: FontWeight.Regular,
        fontStyle: FontStyle.Normal
      });
      let unit_textStyle = new TextStyle({
        fontColor: Color.Blue,
        fontFamily: "Arial",
        fontWeight: FontWeight.Medium,
        fontStyle: FontStyle.Italic
      });
      let number_format = new intl.NumberFormat('en-GB', {
        style: 'currency',
        currency: 'EUR',
        currencyDisplay: 'name',
        currencySign: 'accounting',
        signDisplay: 'always'
      });
      let styledNumberFormat = new i18n.StyledNumberFormat(number_format, {
        integer: integer_textStyle,
        decimal: decimal_textStyle,
        fraction: fraction_textStyle,
        unit: unit_textStyle
      });
      let result = styledNumberFormat.format(123456.789);
      console.log('testscw', result.getString());
      expect(result.getString() == "+123,456.79 euros").assertTrue();

      let arrList = result.getStyles(0, result.length);
      let testList: Array<string> = [];
      let resultList: Array<string> = ["#FFFF0000", "Arial", "12", "1", "#FF000000", "Arial", "10", "0",
        "#FF008000", "Arial", "14", "0", "#FF0000FF", "Arial", "13", "1"];
      for (const arr of arrList) {
        testList.push(arr.styledValue["fontColor"])
        testList.push(arr.styledValue["fontFamily"])
        testList.push(arr.styledValue["fontWeight"])
        testList.push(arr.styledValue["fontStyle"])
      }
      ;
      console.log('testscw', testList.toString());
      expect(testList.toString() == resultList.toString()).assertTrue();
    })

    /**
     * @tc.name   SUB_GLOBAL_refinedFormat_0310
     * @tc.number SUB_GLOBAL_refinedFormat_0310
     * @tc.desc   maximumFractionDigits: 2 & maximumSignificantDigits: 6 & roundingPriority: "lessPrecision"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_refinedFormat_0310', Level.LEVEL2, () => {
      let numOptions: intl.NumberOptions = {
        maximumFractionDigits: 2, maximumSignificantDigits: 6, roundingPriority: "lessPrecision"
      };
      let numfmt: intl.NumberFormat = new intl.NumberFormat("zh-hans-CN", numOptions);
      let numberFormatted: string = numfmt.format(123.456);
      expect(numberFormatted == "123.46").assertTrue();
    })

    /**
     * @tc.name   SUB_GLOBAL_refinedFormat_0630
     * @tc.number SUB_GLOBAL_refinedFormat_0630
     * @tc.desc   roundingMode: "halfExpand" & maximumSignificantDigits: 5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_refinedFormat_0630', Level.LEVEL2, () => {
      let numOptions: intl.NumberOptions = {
        roundingMode: "halfExpand", maximumSignificantDigits: 5
      };
      let numfmt: intl.NumberFormat = new intl.NumberFormat("zh-hans-CN", numOptions);
      let numberFormatted: string = numfmt.format(123.454);
      expect(numberFormatted == "123.45").assertTrue();
    })

    /**
     * @tc.name   SUB_GLOBAL_FilePathMirroring_0100
     * @tc.number SUB_GLOBAL_FilePathMirroring_0100
     * @tc.desc   path /data/out/tmp & delimiter /
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_FilePathMirroring_0100', Level.LEVEL2, () => {
      let path: string = "/data/out/tmp";
      let delimiter: string = "/";
      let locale: intl.Locale = new intl.Locale("ug");
      let mirrorPath: string = i18n.I18NUtil.getUnicodeWrappedFilePath(path, delimiter, locale);
      let flag = i18n.Unicode.isRTL(mirrorPath);
      expect(flag).assertTrue();
    })

    /**
     * @tc.name   SUB_GLOBAL_refinedFormat_0020
     * @tc.number SUB_GLOBAL_refinedFormat_0020
     * @tc.desc   Date(2024, 11, 13, 6, 30, 25) & 'y'/'M'/'d' 'h':'m':'s'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_refinedFormat_0020', Level.LEVEL2, () => {
      let locale: intl.Locale = new intl.Locale("zh-Hans-CN");
      let date: Date = new Date(2024, 11, 13, 6, 30, 25);
      let formatter: i18n.SimpleDateTimeFormat =
        i18n.getSimpleDateTimeFormatByPattern("'time('y'/'M'/'d' 'h':'m':'s')'", locale);
      let dateFormatted: string = formatter.format(date);
      expect(dateFormatted == "time(2024/12/13 6:30:25)").assertTrue();
    })

    /**
     * @tc.name   SUB_GLOBAL_refinedFormat_0790
     * @tc.number SUB_GLOBAL_refinedFormat_0790
     * @tc.desc   skeletonFormat (1230000) & getSimpleNumberFormatBySkeleton "engineering/sign-always"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_refinedFormat_0790', Level.LEVEL2, () => {
      let locale: intl.Locale = new intl.Locale("zh-Hans-CN");
      let skeletonFormat: i18n.SimpleNumberFormat =
        i18n.getSimpleNumberFormatBySkeleton("engineering/sign-always", locale);
      let numberFormatted: string = skeletonFormat.format(1230000);
      expect(numberFormatted == "1.23E+6").assertTrue();
    })

    /**
     * @tc.name   SUB_GLOBAL_refinedFormat_0320
     * @tc.number SUB_GLOBAL_refinedFormat_0320
     * @tc.desc   maximumFractionDigits: 2 & roundingIncrement: 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_refinedFormat_0320', Level.LEVEL2, () => {
      let numOptions: intl.NumberOptions = {
        maximumFractionDigits: 2, roundingIncrement: 1
      };
      let numfmt: intl.NumberFormat = new intl.NumberFormat("zh-hans-CN", numOptions);
      let numberFormatted: string = numfmt.format(123.456);
      expect(numberFormatted == "123.46").assertTrue();
    })

    /**
     * @tc.name   SUB_GLOBAL_refinedFormat_008
     * @tc.number SUB_GLOBAL_refinedFormat_008
     * @tc.desc   local is CN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_refinedFormat_008', Level.LEVEL2, () => {
      let locale: intl.Locale = new intl.Locale("zh-Hans-CN");
      let date: Date = new Date(2024, 11, 13, 6, 30, 25);
      let skeletonFormatter: i18n.SimpleDateTimeFormat = i18n.getSimpleDateTimeFormatBySkeleton("yMdhms", locale);
      let dateFormatted: string = skeletonFormatter.format(date);
      expect(dateFormatted == "2024/12/13 上午6:30:25").assertTrue();
    })

    /**
     * @tc.name   I18N_test_getSimplifiedLanguage_01_1010
     * @tc.number I18N_test_getSimplifiedLanguage_01_1010
     * @tc.desc   no param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('I18N_test_getSimplifiedLanguage_01_1010', Level.LEVEL2, () => {
      let type_one = i18n.System.getSimplifiedLanguage();
      console.log('I18N_test_getSimplifiedLanguage_01_1010 type_one:' + type_one);
      expect(type_one != null).assertTrue();
    })

    /**
     * @tc.name   I18N_test_getTemperatureType_0100
     * @tc.number I18N_test_getTemperatureType_0100
     * @tc.desc   no param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('I18N_test_getTemperatureType_0100', Level.LEVEL2, () => {
      let type: i18n.TemperatureType = i18n.System.getTemperatureType();
      console.log('I18N_test_getTemperatureType_0100 type_one:' + type);
      expect(type != null).assertTrue();
    })

    /**
     * @tc.name   I18N_test_getFirstDayOfWeek_0100
     * @tc.number I18N_test_getFirstDayOfWeek_0100
     * @tc.desc   no param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('I18N_test_getFirstDayOfWeek_0100', Level.LEVEL2, () => {
      let type: i18n.WeekDay = i18n.System.getFirstDayOfWeek();
      console.log('I18N_test_getFirstDayOfWeek_0100 type_one:' + type);
      expect(type != null).assertTrue();
    })

    /**
     * @tc.name   I18N_test_getUnicodeWrappedFilePath_0100
     * @tc.number I18N_test_getUnicodeWrappedFilePath_0100
     * @tc.desc   890001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('I18N_test_getUnicodeWrappedFilePath_0100', Level.LEVEL3, () => {
      try {
        let path: string = "error";
        let delimiter: string = "error";
        let locale: intl.Locale = new intl.Locale("ug");
        i18n.I18NUtil.getUnicodeWrappedFilePath(path, delimiter, locale);
      } catch (e) {
        console.log('I18N_test_getUnicodeWrappedFilePath_0100 type_one:' + e.code);
        expect(e.code).assertEqual('890001');
      }
    })

    /**
     * @tc.name   I18N_test_getUnicodeWrappedFilePath_0200
     * @tc.number I18N_test_getUnicodeWrappedFilePath_0200
     * @tc.desc   path & delimiter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('I18N_test_getUnicodeWrappedFilePath_0200', Level.LEVEL2, () => {
      let path: string = "/data/out/tmp";
      let delimiter: string = "/";
      let mirrorPath: string = i18n.I18NUtil.getUnicodeWrappedFilePath(path, delimiter);
      console.log('I18N_test_getUnicodeWrappedFilePath_0200:' + mirrorPath);
      expect(mirrorPath != null).assertTrue();
    })

    /**
     * @tc.name   I18N_test_getUnicodeWrappedFilePath_0300
     * @tc.number I18N_test_getUnicodeWrappedFilePath_0300
     * @tc.desc   path
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('I18N_test_getUnicodeWrappedFilePath_0300', Level.LEVEL2, () => {
      let path: string = "/data/out/tmp";
      let mirrorPath: string = i18n.I18NUtil.getUnicodeWrappedFilePath(path);
      console.log('I18N_test_getUnicodeWrappedFilePath_0300:' + mirrorPath);
      expect(mirrorPath != null).assertTrue();
    })

    /**
     * @tc.name   I18N_test_getSimpleDateTimeFormatByPattern_0100
     * @tc.number I18N_test_getSimpleDateTimeFormatByPattern_0100
     * @tc.desc   89001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('I18N_test_getSimpleDateTimeFormatByPattern_0100', Level.LEVEL3, () => {
      try {
        let locale: intl.Locale = new intl.Locale("zh-Hans-CN");
        i18n.getSimpleDateTimeFormatByPattern('error', locale);
      } catch (e) {
        console.log('I18N_test_getSimpleDateTimeFormatByPattern_0100 error code:' + e.code);
        expect(e.code).assertEqual('890001');
      }
    })

    /**
     * @tc.name   I18N_test_getSimpleDateTimeFormatByPattern_0200
     * @tc.number I18N_test_getSimpleDateTimeFormatByPattern_0200
     * @tc.desc   only date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('I18N_test_getSimpleDateTimeFormatByPattern_0200', Level.LEVEL2, () => {
      let date: Date = new Date(2024, 11, 13, 6, 30, 25);
      let formatter: i18n.SimpleDateTimeFormat =
        i18n.getSimpleDateTimeFormatByPattern("'time('y'/'M'/'d'/'h':'m':'s')'");
      let dateFormatted: string = formatter.format(date);
      console.log('I18N_test_getSimpleDateTimeFormatByPattern_0200 dateFormatted:' + dateFormatted);
      expect(dateFormatted != null).assertTrue();
    })

    /**
     * @tc.name   I18N_test_getSimpleDateTimeFormatBySkeleton_0100
     * @tc.number I18N_test_getSimpleDateTimeFormatBySkeleton_0100
     * @tc.desc   89001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('I18N_test_getSimpleDateTimeFormatBySkeleton_0100', Level.LEVEL3, () => {
      try {
        let locale: intl.Locale = new intl.Locale("zh-Hans-CN");
        i18n.getSimpleDateTimeFormatBySkeleton('error', locale);
      } catch (e) {
        console.log('I18N_test_getSimpleDateTimeFormatBySkeleton_0100 error code:' + e.code);
        expect(e.code).assertEqual('890001');
      }
    })

    /**
     * @tc.name   I18N_test_getSimpleDateTimeFormatBySkeleton_0200
     * @tc.number I18N_test_getSimpleDateTimeFormatBySkeleton_0200
     * @tc.desc   only date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('I18N_test_getSimpleDateTimeFormatBySkeleton_0200', Level.LEVEL2, () => {
      let date: Date = new Date(2024, 11, 13, 6, 30, 25);
      let skeletonFormatter: i18n.SimpleDateTimeFormat =
        i18n.getSimpleDateTimeFormatBySkeleton("yMdhms");
      let dateFormatted: string = skeletonFormatter.format(date);
      expect(dateFormatted != null).assertTrue();
    })

    /**
     * @tc.name   I18N_test_getSimpleNumberFormatBySkeleton_0100
     * @tc.number I18N_test_getSimpleNumberFormatBySkeleton_0100
     * @tc.desc   89001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('I18N_test_getSimpleNumberFormatBySkeleton_0100', Level.LEVEL3, () => {
      try {
        let locale: intl.Locale = new intl.Locale("zh-Hans-CN");
        i18n.getSimpleNumberFormatBySkeleton('error', locale);
      } catch (e) {
        console.log('I18N_test_getSimpleNumberFormatBySkeleton_0100 error code:' + e.code);
        expect(e.code).assertEqual('890001');
      }
    })

    /**
     * @tc.name   I18N_test_getSimpleNumberFormatBySkeleton_0200
     * @tc.number I18N_test_getSimpleNumberFormatBySkeleton_0200
     * @tc.desc   only skeletonFormatter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('I18N_test_getSimpleNumberFormatBySkeleton_0200', Level.LEVEL2, () => {
      let skeletonFormatter: i18n.SimpleNumberFormat =
        i18n.getSimpleNumberFormatBySkeleton("engineering/sign-always");
      let numberFormatted: string = skeletonFormatter.format(1230000);
      expect(numberFormatted == "1.23E+6").assertTrue();
    })

    /**
     * @tc.name   SUB_GLOBAL_refinedFormat_0010
     * @tc.number SUB_GLOBAL_refinedFormat_0010
     * @tc.desc   without pattern
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_refinedFormat_0010', Level.LEVEL2, () => {
      let locale: intl.Locale = new intl.Locale("zh-Hans-CN");
      let date: Date = new Date(2024, 11, 13, 6, 30, 25);
      let formatter: i18n.SimpleDateTimeFormat = i18n.getSimpleDateTimeFormatByPattern("yMdhms", locale);
      let dateFormatted: string = formatter.format(date);
      expect(dateFormatted).assertEqual("2024121363025")
    })

    /**
     * @tc.name   SUB_GLOBAL_refinedFormat_0030
     * @tc.number SUB_GLOBAL_refinedFormat_0030
     * @tc.desc   without data symbol
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_refinedFormat_0030', Level.LEVEL2, () => {
      let locale: intl.Locale = new intl.Locale("zh-Hans-CN");
      let date: Date = new Date(2024, 11, 13, 6, 30, 25);
      let formatter: i18n.SimpleDateTimeFormat = i18n.getSimpleDateTimeFormatByPattern("'time()'", locale);
      let dateFormatted: string = formatter.format(date);
      expect(dateFormatted).assertEqual("time()")
    })

    /**
     * @tc.name   SUB_GLOBAL_refinedFormat_0050
     * @tc.number SUB_GLOBAL_refinedFormat_0050
     * @tc.desc   local is en-US
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_refinedFormat_0050', Level.LEVEL2, () => {
      let locale: intl.Locale = new intl.Locale("en-US");
      let date: Date = new Date(2024, 11, 13, 6, 30, 25);
      let formatter: i18n.SimpleDateTimeFormat =
        i18n.getSimpleDateTimeFormatByPattern("'time('y'/'M'/'d' 'h':'m':'s')'", locale);
      let dateFormatted: string = formatter.format(date);
      expect(dateFormatted).assertEqual("time(2024/12/13 6:30:25)")
    })

    /**
     * @tc.name   SUB_GLOBAL_refinedFormat_0060
     * @tc.number SUB_GLOBAL_refinedFormat_0060
     * @tc.desc   local is ug-CN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_refinedFormat_0060', Level.LEVEL2, () => {
      let locale: intl.Locale = new intl.Locale("ug-CN");
      let date: Date = new Date(2024, 11, 13, 6, 30, 25);
      let formatter: i18n.SimpleDateTimeFormat =
        i18n.getSimpleDateTimeFormatByPattern("'time('y'/'M'/'d' 'h':'m':'s')'", locale);
      let dateFormatted: string = formatter.format(date);
      expect(dateFormatted).assertEqual("time(2024/12/13 6:30:25)")
    })

    /**
     * @tc.name   SUB_GLOBAL_refinedFormat_0090
     * @tc.number SUB_GLOBAL_refinedFormat_0090
     * @tc.desc   local is zh-Hant-HK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_refinedFormat_0090', Level.LEVEL2, () => {
      let locale: intl.Locale = new intl.Locale("zh-Hant-HK");
      let date: Date = new Date(2024, 11, 13, 6, 30, 25);
      let formatter: i18n.SimpleDateTimeFormat =
        i18n.getSimpleDateTimeFormatBySkeleton("yMdhms", locale);
      let dateFormatted: string = formatter.format(date);
      expect(dateFormatted).assertEqual("13/12/2024 上午 6:30:25")
    })

    /**
     * @tc.name   SUB_GLOBAL_refinedFormat_0100
     * @tc.number SUB_GLOBAL_refinedFormat_0100
     * @tc.desc   local is zh-Hant-TW
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_refinedFormat_0100', Level.LEVEL2, () => {
      let locale: intl.Locale = new intl.Locale("zh-Hant-TW");
      let date: Date = new Date(2024, 11, 13, 6, 30, 25);
      let formatter: i18n.SimpleDateTimeFormat =
        i18n.getSimpleDateTimeFormatBySkeleton("yMdhms", locale);
      let dateFormatted: string = formatter.format(date);
      expect(dateFormatted).assertEqual("2024/12/13 上午 6:30:25")
    })

    /**
     * @tc.name   SUB_GLOBAL_refinedFormat_0110
     * @tc.number SUB_GLOBAL_refinedFormat_0110
     * @tc.desc   local is zh-Hant-MO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_refinedFormat_0110', Level.LEVEL2, () => {
      let locale: intl.Locale = new intl.Locale("zh-Hant-MO");
      let date: Date = new Date(2024, 11, 13, 6, 30, 25);
      let formatter: i18n.SimpleDateTimeFormat =
        i18n.getSimpleDateTimeFormatBySkeleton("yMdhms", locale);
      let dateFormatted: string = formatter.format(date);
      expect(dateFormatted).assertEqual("13/12/2024 上午 6:30:25")
    })

    /**
     * @tc.name   SUB_GLOBAL_refinedFormat_0120
     * @tc.number SUB_GLOBAL_refinedFormat_0120
     * @tc.desc   local is ug-CN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_refinedFormat_0120', Level.LEVEL2, () => {
      let locale: intl.Locale = new intl.Locale("ug-CN");
      let date: Date = new Date(2024, 11, 13, 6, 30, 25);
      let formatter: i18n.SimpleDateTimeFormat =
        i18n.getSimpleDateTimeFormatBySkeleton("yMdhms", locale);
      let dateFormatted: string = formatter.format(date);
      expect(dateFormatted).assertEqual("13/12/2024 6:30:25 چ ب")
    })

    /**
     * @tc.name   SUB_GLOBAL_refinedFormat_0130
     * @tc.number SUB_GLOBAL_refinedFormat_0130
     * @tc.desc   local is bo-CN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_refinedFormat_0130', Level.LEVEL2, () => {
      let locale: intl.Locale = new intl.Locale("bo-CN");
      let date: Date = new Date(2024, 11, 13, 6, 30, 25);
      let formatter: i18n.SimpleDateTimeFormat =
        i18n.getSimpleDateTimeFormatBySkeleton("yMdhms", locale);
      let dateFormatted: string = formatter.format(date);
      expect(dateFormatted).assertEqual("2024/12/13 སྔ་དྲོ་6:30:25")
    })

    /**
     * @tc.name   SUB_GLOBAL_refinedFormat_0140
     * @tc.number SUB_GLOBAL_refinedFormat_0140
     * @tc.desc   local is en-GB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_refinedFormat_0140', Level.LEVEL2, () => {
      let locale: intl.Locale = new intl.Locale("en-GB");
      let date: Date = new Date(2024, 11, 13, 6, 30, 25);
      let formatter: i18n.SimpleDateTimeFormat =
        i18n.getSimpleDateTimeFormatBySkeleton("yMdhms", locale);
      let dateFormatted: string = formatter.format(date);
      expect(dateFormatted).assertEqual("13/12/2024, 6:30:25 am")
    })

    /**
     * @tc.name   SUB_GLOBAL_refinedFormat_0150
     * @tc.number SUB_GLOBAL_refinedFormat_0150
     * @tc.desc   local is en-GB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_refinedFormat_0150', Level.LEVEL2, () => {
      let locale: intl.Locale = new intl.Locale("en-US");
      let date: Date = new Date(2024, 11, 13, 6, 30, 25);
      let skeletonFormatter: i18n.SimpleDateTimeFormat = i18n.getSimpleDateTimeFormatBySkeleton('yMdhms', locale);
      let dateFormatted: string = skeletonFormatter.format(date);
      expect(dateFormatted).assertEqual("12/13/2024, 6:30:25 AM")
    })

    /**
     * @tc.name   SUB_GLOBAL_refinedFormat_0240
     * @tc.number SUB_GLOBAL_refinedFormat_0240
     * @tc.desc   numOptions is 2,4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_GLOBAL_refinedFormat_0240', Level.LEVEL3, () => {
      let numOptions: intl.NumberOptions = {
        maximumFractionDigits: 2, maximumSignificantDigits: 4
      }
      let numFmt: intl.NumberFormat = new intl.NumberFormat("zh-hans-CN", numOptions);
      let numberFormatted: string = numFmt.format(123.456);
      expect(numberFormatted).assertEqual("123.5")
    })

    /**
     * @tc.name   SUB_GLOBAL_refinedFormat_0250
     * @tc.number SUB_GLOBAL_refinedFormat_0250
     * @tc.desc   numOptions is 2,6
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_GLOBAL_refinedFormat_0250', Level.LEVEL3, () => {
      let numOptions: intl.NumberOptions = {
        maximumFractionDigits: 2, maximumSignificantDigits: 6
      }
      let numFmt: intl.NumberFormat = new intl.NumberFormat("zh-hans-CN", numOptions);
      let numberFormatted: string = numFmt.format(123.456);
      expect(numberFormatted).assertEqual("123.456")
    })

    /**
     * @tc.name   SUB_GLOBAL_refinedFormat_0260
     * @tc.number SUB_GLOBAL_refinedFormat_0260
     * @tc.desc   numOptions is 2,4,auto
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_GLOBAL_refinedFormat_0260', Level.LEVEL3, () => {
      let numOptions: intl.NumberOptions = {
        maximumFractionDigits: 2, maximumSignificantDigits: 4, roundingPriority: "auto"
      }
      let numFmt: intl.NumberFormat = new intl.NumberFormat("zh-hans-CN", numOptions);
      let numberFormatted: string = numFmt.format(123.456);
      expect(numberFormatted).assertEqual("123.5")
    })

    /**
     * @tc.name   SUB_GLOBAL_refinedFormat_0270
     * @tc.number SUB_GLOBAL_refinedFormat_0270
     * @tc.desc   numOptions is 2,6,auto
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_refinedFormat_0270', Level.LEVEL2, () => {
      let numOptions: intl.NumberOptions = {
        maximumFractionDigits: 2, maximumSignificantDigits: 6, roundingPriority: "auto"
      }
      let numFmt: intl.NumberFormat = new intl.NumberFormat("zh-hans-CN", numOptions);
      let numberFormatted: string = numFmt.format(123.456);
      expect(numberFormatted).assertEqual("123.46")
    })

    /**
     * @tc.name   SUB_GLOBAL_refinedFormat_0280
     * @tc.number SUB_GLOBAL_refinedFormat_0280
     * @tc.desc   numOptions is 2,4,morePrecision
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_refinedFormat_0280', Level.LEVEL2, () => {
      let numOptions: intl.NumberOptions = {
        maximumFractionDigits: 2, maximumSignificantDigits: 4, roundingPriority: "morePrecision"
      }
      let numFmt: intl.NumberFormat = new intl.NumberFormat("zh-hans-CN", numOptions);
      let numberFormatted: string = numFmt.format(123.456);
      expect(numberFormatted).assertEqual("123.46")
    })

    /**
     * @tc.name   SUB_GLOBAL_refinedFormat_0290
     * @tc.number SUB_GLOBAL_refinedFormat_0290
     * @tc.desc   numOptions is 2,6,morePrecision
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_refinedFormat_0290', Level.LEVEL2, () => {
      let numOptions: intl.NumberOptions = {
        maximumFractionDigits: 2, maximumSignificantDigits: 6, roundingPriority: "morePrecision"
      }
      let numFmt: intl.NumberFormat = new intl.NumberFormat("zh-hans-CN", numOptions);
      let numberFormatted: string = numFmt.format(123.456);
      expect(numberFormatted).assertEqual("123.456")
    })

    /**
     * @tc.name   SUB_GLOBAL_refinedFormat_0300
     * @tc.number SUB_GLOBAL_refinedFormat_0300
     * @tc.desc   numOptions is 2,4,lessPrecision
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_refinedFormat_0300', Level.LEVEL2, () => {
      let numOptions: intl.NumberOptions = {
        maximumFractionDigits: 2, maximumSignificantDigits: 4, roundingPriority: "lessPrecision"
      }
      let numFmt: intl.NumberFormat = new intl.NumberFormat("zh-hans-CN", numOptions);
      let numberFormatted: string = numFmt.format(123.456);
      expect(numberFormatted).assertEqual("123.5")
    })

    /**
     * @tc.name   SUB_GLOBAL_refinedFormat_0330
     * @tc.number SUB_GLOBAL_refinedFormat_0330
     * @tc.desc   numOptions is 2,2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_refinedFormat_0330', Level.LEVEL2, () => {
      let numOptions: intl.NumberOptions = {
        maximumFractionDigits: 2, roundingIncrement: 2
      }
      let numFmt: intl.NumberFormat = new intl.NumberFormat("zh-hans-CN", numOptions);
      let numberFormatted: string = numFmt.format(123.456);
      expect(numberFormatted).assertEqual("123.46")
    })

    /**
     * @tc.name   SUB_GLOBAL_refinedFormat_0340
     * @tc.number SUB_GLOBAL_refinedFormat_0340
     * @tc.desc   numOptions is 2,5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_refinedFormat_0340', Level.LEVEL2, () => {
      let numOptions: intl.NumberOptions = {
        maximumFractionDigits: 2, roundingIncrement: 5
      }
      let numFmt: intl.NumberFormat = new intl.NumberFormat("zh-hans-CN", numOptions);
      let numberFormatted: string = numFmt.format(123.456);
      expect(numberFormatted).assertEqual("123.45")
    })

    /**
     * @tc.name   SUB_GLOBAL_refinedFormat_0350
     * @tc.number SUB_GLOBAL_refinedFormat_0350
     * @tc.desc   numOptions is 2,10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_refinedFormat_0350', Level.LEVEL2, () => {
      let numOptions: intl.NumberOptions = {
        maximumFractionDigits: 2, roundingIncrement: 10
      }
      let numFmt: intl.NumberFormat = new intl.NumberFormat("zh-hans-CN", numOptions);
      let numberFormatted: string = numFmt.format(123.456);
      expect(numberFormatted).assertEqual("123.5")
    })

    /**
     * @tc.name   SUB_GLOBAL_refinedFormat_0360
     * @tc.number SUB_GLOBAL_refinedFormat_0360
     * @tc.desc   numOptions is 2,20
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_refinedFormat_0360', Level.LEVEL2, () => {
      let numOptions: intl.NumberOptions = {
        maximumFractionDigits: 2, roundingIncrement: 20
      }
      let numFmt: intl.NumberFormat = new intl.NumberFormat("zh-hans-CN", numOptions);
      let numberFormatted: string = numFmt.format(123.456);
      expect(numberFormatted).assertEqual("123.4")
    })

    /**
     * @tc.name   SUB_GLOBAL_refinedFormat_0370
     * @tc.number SUB_GLOBAL_refinedFormat_0370
     * @tc.desc   numOptions is 2,25
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_refinedFormat_0370', Level.LEVEL2, () => {
      let numOptions: intl.NumberOptions = {
        maximumFractionDigits: 2, roundingIncrement: 25
      }
      let numFmt: intl.NumberFormat = new intl.NumberFormat("zh-hans-CN", numOptions);
      let numberFormatted: string = numFmt.format(123.456);
      expect(numberFormatted).assertEqual("123.50")
    })

    /**
     * @tc.name   SUB_GLOBAL_refinedFormat_0380
     * @tc.number SUB_GLOBAL_refinedFormat_0380
     * @tc.desc   numOptions is 2,50
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_refinedFormat_0380', Level.LEVEL2, () => {
      let numOptions: intl.NumberOptions = {
        maximumFractionDigits: 2, roundingIncrement: 50
      }
      let numFmt: intl.NumberFormat = new intl.NumberFormat("zh-hans-CN", numOptions);
      let numberFormatted: string = numFmt.format(123.456);
      expect(numberFormatted).assertEqual("123.5")
    })

    /**
     * @tc.name   SUB_GLOBAL_refinedFormat_0390
     * @tc.number SUB_GLOBAL_refinedFormat_0390
     * @tc.desc   numOptions is 2,100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_refinedFormat_0390', Level.LEVEL2, () => {
      let numOptions: intl.NumberOptions = {
        maximumFractionDigits: 2, roundingIncrement: 100
      }
      let numFmt: intl.NumberFormat = new intl.NumberFormat("zh-hans-CN", numOptions);
      let numberFormatted: string = numFmt.format(123.456);
      expect(numberFormatted).assertEqual("123")
    })

    /**
     * @tc.name   SUB_GLOBAL_refinedFormat_0400
     * @tc.number SUB_GLOBAL_refinedFormat_0400
     * @tc.desc   numOptions is 2,200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_refinedFormat_0400', Level.LEVEL2, () => {
      let numOptions: intl.NumberOptions = {
        maximumFractionDigits: 2, roundingIncrement: 200
      }
      let numFmt: intl.NumberFormat = new intl.NumberFormat("zh-hans-CN", numOptions);
      let numberFormatted: string = numFmt.format(123.456);
      expect(numberFormatted).assertEqual("124")
    })

    /**
     * @tc.name   SUB_GLOBAL_refinedFormat_0410
     * @tc.number SUB_GLOBAL_refinedFormat_0410
     * @tc.desc   numOptions is 2,250
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_refinedFormat_0410', Level.LEVEL2, () => {
      let numOptions: intl.NumberOptions = {
        maximumFractionDigits: 2, roundingIncrement: 250
      }
      let numFmt: intl.NumberFormat = new intl.NumberFormat("zh-hans-CN", numOptions);
      let numberFormatted: string = numFmt.format(123.456);
      expect(numberFormatted).assertEqual("122.5")
    })

    /**
     * @tc.name   SUB_GLOBAL_refinedFormat_0420
     * @tc.number SUB_GLOBAL_refinedFormat_0420
     * @tc.desc   numOptions is 2,500
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_refinedFormat_0420', Level.LEVEL2, () => {
      let numOptions: intl.NumberOptions = {
        maximumFractionDigits: 2, roundingIncrement: 500
      }
      let numFmt: intl.NumberFormat = new intl.NumberFormat("zh-hans-CN", numOptions);
      let numberFormatted: string = numFmt.format(123.456);
      expect(numberFormatted).assertEqual("125")
    })

    /**
     * @tc.name   SUB_GLOBAL_refinedFormat_0430
     * @tc.number SUB_GLOBAL_refinedFormat_0430
     * @tc.desc   numOptions is 2,1000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_refinedFormat_0430', Level.LEVEL2, () => {
      let numOptions: intl.NumberOptions = {
        maximumFractionDigits: 2, roundingIncrement: 1000
      }
      let numFmt: intl.NumberFormat = new intl.NumberFormat("zh-hans-CN", numOptions);
      let numberFormatted: string = numFmt.format(123.456);
      expect(numberFormatted).assertEqual("120")
    })

    /**
     * @tc.name   SUB_GLOBAL_refinedFormat_0440
     * @tc.number SUB_GLOBAL_refinedFormat_0440
     * @tc.desc   numOptions is 2,2000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_refinedFormat_0440', Level.LEVEL2, () => {
      let numOptions: intl.NumberOptions = {
        maximumFractionDigits: 2, roundingIncrement: 2000
      }
      let numFmt: intl.NumberFormat = new intl.NumberFormat("zh-hans-CN", numOptions);
      let numberFormatted: string = numFmt.format(123.456);
      expect(numberFormatted).assertEqual("120")
    })

    /**
     * @tc.name   SUB_GLOBAL_refinedFormat_0450
     * @tc.number SUB_GLOBAL_refinedFormat_0450
     * @tc.desc   numOptions is 2,2500
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_refinedFormat_0450', Level.LEVEL2, () => {
      let numOptions: intl.NumberOptions = {
        maximumFractionDigits: 2, roundingIncrement: 2500
      }
      let numFmt: intl.NumberFormat = new intl.NumberFormat("zh-hans-CN", numOptions);
      let numberFormatted: string = numFmt.format(123.456);
      expect(numberFormatted).assertEqual("125")
    })

    /**
     * @tc.name   SUB_GLOBAL_refinedFormat_0460
     * @tc.number SUB_GLOBAL_refinedFormat_0460
     * @tc.desc   numOptions is 2,5000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_refinedFormat_0460', Level.LEVEL2, () => {
      let numOptions: intl.NumberOptions = {
        maximumFractionDigits: 2, roundingIncrement: 5000
      }
      let numFmt: intl.NumberFormat = new intl.NumberFormat("zh-hans-CN", numOptions);
      let numberFormatted: string = numFmt.format(123.456);
      expect(numberFormatted).assertEqual("100")
    })

    /**
     * @tc.name   SUB_GLOBAL_refinedFormat_0470
     * @tc.number SUB_GLOBAL_refinedFormat_0470
     * @tc.desc   numOptions is ceil,2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_refinedFormat_0470', Level.LEVEL2, () => {
      let numOptions: intl.NumberOptions = {
        roundingMode: 'ceil', maximumFractionDigits: 2
      }
      let numFmt: intl.NumberFormat = new intl.NumberFormat("zh-hans-CN", numOptions);
      let numberFormatted: string = numFmt.format(123.451);
      expect(numberFormatted).assertEqual("123.46")
    })

    /**
     * @tc.name   SUB_GLOBAL_refinedFormat_0480
     * @tc.number SUB_GLOBAL_refinedFormat_0480
     * @tc.desc   numOptions is ceil,5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_refinedFormat_0480', Level.LEVEL2, () => {
      let numOptions: intl.NumberOptions = {
        roundingMode: 'ceil', maximumSignificantDigits: 5
      }
      let numFmt: intl.NumberFormat = new intl.NumberFormat("zh-hans-CN", numOptions);
      let numberFormatted: string = numFmt.format(-123.459);
      expect(numberFormatted).assertEqual("-123.45")
    })

    /**
     * @tc.name   SUB_GLOBAL_refinedFormat_0490
     * @tc.number SUB_GLOBAL_refinedFormat_0490
     * @tc.desc   numOptions is floor,2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_refinedFormat_0490', Level.LEVEL2, () => {
      let numOptions: intl.NumberOptions = {
        roundingMode: 'floor', maximumFractionDigits: 2
      }
      let numFmt: intl.NumberFormat = new intl.NumberFormat("zh-hans-CN", numOptions);
      let numberFormatted: string = numFmt.format(123.459);
      expect(numberFormatted).assertEqual("123.45")
    })

    /**
     * @tc.name   SUB_GLOBAL_refinedFormat_0500
     * @tc.number SUB_GLOBAL_refinedFormat_0500
     * @tc.desc   numOptions is floor,5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_refinedFormat_0500', Level.LEVEL2, () => {
      let numOptions: intl.NumberOptions = {
        roundingMode: 'floor', maximumSignificantDigits: 5
      }
      let numFmt: intl.NumberFormat = new intl.NumberFormat("zh-hans-CN", numOptions);
      let numberFormatted: string = numFmt.format(-123.451);
      expect(numberFormatted).assertEqual("-123.46")
    })

    /**
     * @tc.name   SUB_GLOBAL_refinedFormat_0510
     * @tc.number SUB_GLOBAL_refinedFormat_0510
     * @tc.desc   numOptions is expand,2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_refinedFormat_0510', Level.LEVEL2, () => {
      let numOptions: intl.NumberOptions = {
        roundingMode: 'expand', maximumFractionDigits: 2
      }
      let numFmt: intl.NumberFormat = new intl.NumberFormat("zh-hans-CN", numOptions);
      let numberFormatted: string = numFmt.format(123.451);
      expect(numberFormatted).assertEqual("123.46")
    })

    /**
     * @tc.name   SUB_GLOBAL_refinedFormat_0520
     * @tc.number SUB_GLOBAL_refinedFormat_0520
     * @tc.desc   numOptions is expand,5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_refinedFormat_0520', Level.LEVEL2, () => {
      let numOptions: intl.NumberOptions = {
        roundingMode: 'expand', maximumSignificantDigits: 5
      }
      let numFmt: intl.NumberFormat = new intl.NumberFormat("zh-hans-CN", numOptions);
      let numberFormatted: string = numFmt.format(-123.451);
      expect(numberFormatted).assertEqual("-123.46")
    })

    /**
     * @tc.name   SUB_GLOBAL_refinedFormat_0530
     * @tc.number SUB_GLOBAL_refinedFormat_0530
     * @tc.desc   numOptions is trunc,2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_refinedFormat_0530', Level.LEVEL2, () => {
      let numOptions: intl.NumberOptions = {
        roundingMode: 'trunc', maximumFractionDigits: 2
      }
      let numFmt: intl.NumberFormat = new intl.NumberFormat("zh-hans-CN", numOptions);
      let numberFormatted: string = numFmt.format(123.459);
      expect(numberFormatted).assertEqual("123.45")
    })

    /**
     * @tc.name   SUB_GLOBAL_refinedFormat_0540
     * @tc.number SUB_GLOBAL_refinedFormat_0540
     * @tc.desc   numOptions is trunc,5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_refinedFormat_0540', Level.LEVEL2, () => {
      let numOptions: intl.NumberOptions = {
        roundingMode: 'trunc', maximumSignificantDigits: 5
      }
      let numFmt: intl.NumberFormat = new intl.NumberFormat("zh-hans-CN", numOptions);
      let numberFormatted: string = numFmt.format(-123.459);
      expect(numberFormatted).assertEqual("-123.45")
    })

    /**
     * @tc.name   SUB_GLOBAL_refinedFormat_0550
     * @tc.number SUB_GLOBAL_refinedFormat_0550
     * @tc.desc   numOptions is halfCeil,2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_refinedFormat_0550', Level.LEVEL2, () => {
      let numOptions: intl.NumberOptions = {
        roundingMode: 'halfCeil', maximumFractionDigits: 2
      }
      let numFmt: intl.NumberFormat = new intl.NumberFormat("zh-hans-CN", numOptions);
      let numberFormatted: string = numFmt.format(123.455);
      expect(numberFormatted).assertEqual("123.46")
    })

    /**
     * @tc.name   SUB_GLOBAL_refinedFormat_0560
     * @tc.number SUB_GLOBAL_refinedFormat_0560
     * @tc.desc   numOptions is halfCeil,5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_refinedFormat_0560', Level.LEVEL2, () => {
      let numOptions: intl.NumberOptions = {
        roundingMode: 'halfCeil', maximumSignificantDigits: 5
      }
      let numFmt: intl.NumberFormat = new intl.NumberFormat("zh-hans-CN", numOptions);
      let numberFormatted: string = numFmt.format(123.454);
      expect(numberFormatted).assertEqual("123.45")
    })

    /**
     * @tc.name   SUB_GLOBAL_refinedFormat_0570
     * @tc.number SUB_GLOBAL_refinedFormat_0570
     * @tc.desc   numOptions is halfCeil,2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_refinedFormat_0570', Level.LEVEL2, () => {
      let numOptions: intl.NumberOptions = {
        roundingMode: 'halfCeil', maximumFractionDigits: 2
      }
      let numFmt: intl.NumberFormat = new intl.NumberFormat("zh-hans-CN", numOptions);
      let numberFormatted: string = numFmt.format(-123.455);
      expect(numberFormatted).assertEqual("-123.45")
    })

    /**
     * @tc.name   SUB_GLOBAL_refinedFormat_0580
     * @tc.number SUB_GLOBAL_refinedFormat_0580
     * @tc.desc   numOptions is halfCeil,5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_refinedFormat_0580', Level.LEVEL2, () => {
      let numOptions: intl.NumberOptions = {
        roundingMode: 'halfCeil', maximumSignificantDigits: 5
      }
      let numFmt: intl.NumberFormat = new intl.NumberFormat("zh-hans-CN", numOptions);
      let numberFormatted: string = numFmt.format(-123.456);
      expect(numberFormatted).assertEqual("-123.46")
    })

    /**
     * @tc.name   SUB_GLOBAL_refinedFormat_0590
     * @tc.number SUB_GLOBAL_refinedFormat_0590
     * @tc.desc   numOptions is halfFloor,2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_refinedFormat_0590', Level.LEVEL2, () => {
      let numOptions: intl.NumberOptions = {
        roundingMode: 'halfFloor', maximumFractionDigits: 2
      }
      let numFmt: intl.NumberFormat = new intl.NumberFormat("zh-hans-CN", numOptions);
      let numberFormatted: string = numFmt.format(123.455);
      expect(numberFormatted).assertEqual("123.45")
    })

    /**
     * @tc.name   SUB_GLOBAL_refinedFormat_0600
     * @tc.number SUB_GLOBAL_refinedFormat_0600
     * @tc.desc   numOptions is halfFloor,5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_refinedFormat_0600', Level.LEVEL2, () => {
      let numOptions: intl.NumberOptions = {
        roundingMode: 'halfFloor', maximumSignificantDigits: 5
      }
      let numFmt: intl.NumberFormat = new intl.NumberFormat("zh-hans-CN", numOptions);
      let numberFormatted: string = numFmt.format(123.456);
      expect(numberFormatted).assertEqual("123.46")
    })

    /**
     * @tc.name   SUB_GLOBAL_refinedFormat_0610
     * @tc.number SUB_GLOBAL_refinedFormat_0610
     * @tc.desc   numOptions is halfFloor,2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_refinedFormat_0610', Level.LEVEL2, () => {
      let numOptions: intl.NumberOptions = {
        roundingMode: 'halfFloor', maximumFractionDigits: 2
      }
      let numFmt: intl.NumberFormat = new intl.NumberFormat("zh-hans-CN", numOptions);
      let numberFormatted: string = numFmt.format(-123.454);
      expect(numberFormatted).assertEqual("-123.45")
    })

    /**
     * @tc.name   SUB_GLOBAL_refinedFormat_0620
     * @tc.number SUB_GLOBAL_refinedFormat_0620
     * @tc.desc   numOptions is halfFloor,5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_refinedFormat_0620', Level.LEVEL2, () => {
      let numOptions: intl.NumberOptions = {
        roundingMode: 'halfFloor', maximumSignificantDigits: 5
      }
      let numFmt: intl.NumberFormat = new intl.NumberFormat("zh-hans-CN", numOptions);
      let numberFormatted: string = numFmt.format(-123.455);
      expect(numberFormatted).assertEqual("-123.46")
    })

    /**
     * @tc.name   SUB_GLOBAL_refinedFormat_0640
     * @tc.number SUB_GLOBAL_refinedFormat_0640
     * @tc.desc   numOptions is halfExpand,5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_refinedFormat_0640', Level.LEVEL2, () => {
      let numOptions: intl.NumberOptions = {
        roundingMode: 'halfExpand', maximumSignificantDigits: 5
      }
      let numFmt: intl.NumberFormat = new intl.NumberFormat("zh-hans-CN", numOptions);
      let numberFormatted: string = numFmt.format(123.455);
      expect(numberFormatted).assertEqual("123.46")
    })

    /**
     * @tc.name   SUB_GLOBAL_refinedFormat_0650
     * @tc.number SUB_GLOBAL_refinedFormat_0650
     * @tc.desc   numOptions is halfExpand,5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_refinedFormat_0650', Level.LEVEL2, () => {
      let numOptions: intl.NumberOptions = {
        roundingMode: 'halfExpand', maximumSignificantDigits: 5
      }
      let numFmt: intl.NumberFormat = new intl.NumberFormat("zh-hans-CN", numOptions);
      let numberFormatted: string = numFmt.format(-123.454);
      expect(numberFormatted).assertEqual("-123.45")
    })

    /**
     * @tc.name   SUB_GLOBAL_refinedFormat_0660
     * @tc.number SUB_GLOBAL_refinedFormat_0660
     * @tc.desc   numOptions is halfExpand,5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_refinedFormat_0660', Level.LEVEL2, () => {
      let numOptions: intl.NumberOptions = {
        roundingMode: 'halfExpand', maximumSignificantDigits: 5
      }
      let numFmt: intl.NumberFormat = new intl.NumberFormat("zh-hans-CN", numOptions);
      let numberFormatted: string = numFmt.format(-123.455);
      expect(numberFormatted).assertEqual("-123.46")
    })

    /**
     * @tc.name   SUB_GLOBAL_refinedFormat_0670
     * @tc.number SUB_GLOBAL_refinedFormat_0670
     * @tc.desc   numOptions is halfTrunc,5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_refinedFormat_0670', Level.LEVEL2, () => {
      let numOptions: intl.NumberOptions = {
        roundingMode: 'halfTrunc', maximumSignificantDigits: 5
      }
      let numFmt: intl.NumberFormat = new intl.NumberFormat("zh-hans-CN", numOptions);
      let numberFormatted: string = numFmt.format(123.455);
      expect(numberFormatted).assertEqual("123.45")
    })

    /**
     * @tc.name   SUB_GLOBAL_refinedFormat_0680
     * @tc.number SUB_GLOBAL_refinedFormat_0680
     * @tc.desc   numOptions is halfTrunc,5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_refinedFormat_0680', Level.LEVEL2, () => {
      let numOptions: intl.NumberOptions = {
        roundingMode: 'halfTrunc', maximumSignificantDigits: 5
      }
      let numFmt: intl.NumberFormat = new intl.NumberFormat("zh-hans-CN", numOptions);
      let numberFormatted: string = numFmt.format(123.456);
      expect(numberFormatted).assertEqual("123.46")
    })

    /**
     * @tc.name   SUB_GLOBAL_refinedFormat_0690
     * @tc.number SUB_GLOBAL_refinedFormat_0690
     * @tc.desc   numOptions is halfTrunc,5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_refinedFormat_0690', Level.LEVEL2, () => {
      let numOptions: intl.NumberOptions = {
        roundingMode: 'halfTrunc', maximumSignificantDigits: 5
      }
      let numFmt: intl.NumberFormat = new intl.NumberFormat("zh-hans-CN", numOptions);
      let numberFormatted: string = numFmt.format(-123.455);
      expect(numberFormatted).assertEqual("-123.45")
    })

    /**
     * @tc.name   SUB_GLOBAL_refinedFormat_0700
     * @tc.number SUB_GLOBAL_refinedFormat_0700
     * @tc.desc   numOptions is halfTrunc,5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_refinedFormat_0700', Level.LEVEL2, () => {
      let numOptions: intl.NumberOptions = {
        roundingMode: 'halfTrunc', maximumSignificantDigits: 5
      }
      let numFmt: intl.NumberFormat = new intl.NumberFormat("zh-hans-CN", numOptions);
      let numberFormatted: string = numFmt.format(-123.456);
      expect(numberFormatted).assertEqual("-123.46")
    })

    /**
     * @tc.name   SUB_GLOBAL_refinedFormat_0710
     * @tc.number SUB_GLOBAL_refinedFormat_0710
     * @tc.desc   numOptions is halfEven,5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_refinedFormat_0710', Level.LEVEL2, () => {
      let numOptions: intl.NumberOptions = {
        roundingMode: 'halfEven', maximumSignificantDigits: 5
      }
      let numFmt: intl.NumberFormat = new intl.NumberFormat("zh-hans-CN", numOptions);
      let numberFormatted: string = numFmt.format(123.445);
      expect(numberFormatted).assertEqual("123.44")
    })

    /**
     * @tc.name   SUB_GLOBAL_refinedFormat_0720
     * @tc.number SUB_GLOBAL_refinedFormat_0720
     * @tc.desc   numOptions is halfEven,5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_refinedFormat_0720', Level.LEVEL2, () => {
      let numOptions: intl.NumberOptions = {
        roundingMode: 'halfEven', maximumSignificantDigits: 5
      }
      let numFmt: intl.NumberFormat = new intl.NumberFormat("zh-hans-CN", numOptions);
      let numberFormatted: string = numFmt.format(123.455);
      expect(numberFormatted).assertEqual("123.46")
    })

    /**
     * @tc.name   SUB_GLOBAL_refinedFormat_0730
     * @tc.number SUB_GLOBAL_refinedFormat_0730
     * @tc.desc   numOptions is halfEven,5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_refinedFormat_0730', Level.LEVEL2, () => {
      let numOptions: intl.NumberOptions = {
        roundingMode: 'halfEven', maximumSignificantDigits: 5
      }
      let numFmt: intl.NumberFormat = new intl.NumberFormat("zh-hans-CN", numOptions);
      let numberFormatted: string = numFmt.format(-123.445);
      expect(numberFormatted).assertEqual("-123.44")
    })

    /**
     * @tc.name   SUB_GLOBAL_refinedFormat_0740
     * @tc.number SUB_GLOBAL_refinedFormat_0740
     * @tc.desc   numOptions is halfEven,5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_refinedFormat_0740', Level.LEVEL2, () => {
      let numOptions: intl.NumberOptions = {
        roundingMode: 'halfEven', maximumSignificantDigits: 5
      }
      let numFmt: intl.NumberFormat = new intl.NumberFormat("zh-hans-CN", numOptions);
      let numberFormatted: string = numFmt.format(-123.455);
      expect(numberFormatted).assertEqual("-123.46")
    })

    /**
     * @tc.name   SUB_GLOBAL_refinedFormat_0800
     * @tc.number SUB_GLOBAL_refinedFormat_0800
     * @tc.desc   skeleton is EE+!0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_refinedFormat_0800', Level.LEVEL2, () => {
      let locale: intl.Locale = new intl.Locale("zh-hans-CN");
      let skeletonFormat: i18n.SimpleNumberFormat = i18n.getSimpleNumberFormatBySkeleton("EE+!0", locale);
      let numberFormatted: string = skeletonFormat.format(1230000);
      expect(numberFormatted).assertEqual("1.23E+6")
    })

    /**
     * @tc.name   SUB_GLOBAL_refinedFormat_0810
     * @tc.number SUB_GLOBAL_refinedFormat_0810
     * @tc.desc   skeleton is %
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_refinedFormat_0810', Level.LEVEL2, () => {
      let locale: intl.Locale = new intl.Locale("zh-hans-CN");
      let skeletonFormat: i18n.SimpleNumberFormat = i18n.getSimpleNumberFormatBySkeleton("%", locale);
      let numberFormatted: string = skeletonFormat.format(10);
      expect(numberFormatted).assertEqual("10%")
    })

    /**
     * @tc.name   SUB_GLOBAL_refinedFormat_0820
     * @tc.number SUB_GLOBAL_refinedFormat_0820
     * @tc.desc   skeleton is permille
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_refinedFormat_0820', Level.LEVEL2, () => {
      let locale: intl.Locale = new intl.Locale("zh-hans-CN");
      let skeletonFormat: i18n.SimpleNumberFormat = i18n.getSimpleNumberFormatBySkeleton("permille", locale);
      let numberFormatted: string = skeletonFormat.format(10);
      expect(numberFormatted).assertEqual("10‰")
    })

    /**
     * @tc.name   SUB_GLOBAL_refinedFormat_0830
     * @tc.number SUB_GLOBAL_refinedFormat_0830
     * @tc.desc   skeleton is %x100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_refinedFormat_0830', Level.LEVEL2, () => {
      let locale: intl.Locale = new intl.Locale("zh-hans-CN");
      let skeletonFormat: i18n.SimpleNumberFormat = i18n.getSimpleNumberFormatBySkeleton("%x100", locale);
      let numberFormatted: string = skeletonFormat.format(0.01);
      expect(numberFormatted).assertEqual("1%")
    })

    /**
     * @tc.name   SUB_GLOBAL_refinedFormat_0840
     * @tc.number SUB_GLOBAL_refinedFormat_0840
     * @tc.desc   skeleton is unit/meter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_refinedFormat_0840', Level.LEVEL2, () => {
      let locale: intl.Locale = new intl.Locale("zh-hans-CN");
      let skeletonFormat: i18n.SimpleNumberFormat = i18n.getSimpleNumberFormatBySkeleton("unit/meter", locale);
      let numberFormatted: string = skeletonFormat.format(5);
      expect(numberFormatted).assertEqual("5米")
    })

    /**
     * @tc.name   SUB_GLOBAL_refinedFormat_0850
     * @tc.number SUB_GLOBAL_refinedFormat_0850
     * @tc.desc   skeleton is measure-unit/length-meter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_refinedFormat_0850', Level.LEVEL2, () => {
      let locale: intl.Locale = new intl.Locale("zh-hans-CN");
      let skeletonFormat: i18n.SimpleNumberFormat =
        i18n.getSimpleNumberFormatBySkeleton("measure-unit/length-meter", locale);
      let numberFormatted: string = skeletonFormat.format(5);
      expect(numberFormatted).assertEqual("5米")
    })

    /**
     * @tc.name   SUB_GLOBAL_refinedFormat_0860
     * @tc.number SUB_GLOBAL_refinedFormat_0860
     * @tc.desc   skeleton is currency/CNY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_refinedFormat_0860', Level.LEVEL2, () => {
      let locale: intl.Locale = new intl.Locale("zh-hans-CN");
      let skeletonFormat: i18n.SimpleNumberFormat = i18n.getSimpleNumberFormatBySkeleton("currency/CNY", locale);
      let numberFormatted: string = skeletonFormat.format(5);
      expect(numberFormatted).assertEqual("¥5.00")
    })

    /**
     * @tc.name   SUB_GLOBAL_refinedFormat_0870
     * @tc.number SUB_GLOBAL_refinedFormat_0870
     * @tc.desc   skeleton is measure-unit/length-meter per-measure-unit/duration-second
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_refinedFormat_0870', Level.LEVEL2, () => {
      let locale: intl.Locale = new intl.Locale("en-US");
      let skeletonFormat: i18n.SimpleNumberFormat =
        i18n.getSimpleNumberFormatBySkeleton("measure-unit/length-meter per-measure-unit/duration-second", locale);
      let numberFormatted: string = skeletonFormat.format(5);
      expect(numberFormatted).assertEqual("5 m/s")
    })

    /**
     * @tc.name   SUB_GLOBAL_refinedFormat_0880
     * @tc.number SUB_GLOBAL_refinedFormat_0880
     * @tc.desc   skeleton is unit/meter unit-width-full-name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_refinedFormat_0880', Level.LEVEL2, () => {
      let locale: intl.Locale = new intl.Locale("en-US");
      let skeletonFormat: i18n.SimpleNumberFormat =
        i18n.getSimpleNumberFormatBySkeleton("unit/meter unit-width-full-name", locale);
      let numberFormatted: string = skeletonFormat.format(5);
      expect(numberFormatted).assertEqual("5 meters")
    })

    /**
     * @tc.name   SUB_GLOBAL_refinedFormat_0890
     * @tc.number SUB_GLOBAL_refinedFormat_0890
     * @tc.desc   skeleton is precision-increment/0.01
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_refinedFormat_0890', Level.LEVEL2, () => {
      let locale: intl.Locale = new intl.Locale("zh-hans-CN");
      let skeletonFormat: i18n.SimpleNumberFormat =
        i18n.getSimpleNumberFormatBySkeleton("precision-increment/0.01", locale);
      let numberFormatted: string = skeletonFormat.format(5.555);
      expect(numberFormatted).assertEqual("5.56")
    })

    /**
     * @tc.name   SUB_GLOBAL_refinedFormat_0900
     * @tc.number SUB_GLOBAL_refinedFormat_0900
     * @tc.desc   skeleton is precision-increment/0.01 rounding-mode-ceiling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_refinedFormat_0900', Level.LEVEL2, () => {
      let locale: intl.Locale = new intl.Locale("zh-hans-CN");
      let skeletonFormat: i18n.SimpleNumberFormat =
        i18n.getSimpleNumberFormatBySkeleton("precision-increment/0.01 rounding-mode-ceiling", locale);
      let numberFormatted: string = skeletonFormat.format(5.551);
      expect(numberFormatted).assertEqual("5.56")
    })

    /**
     * @tc.name   SUB_GLOBAL_refinedFormat_0910
     * @tc.number SUB_GLOBAL_refinedFormat_0910
     * @tc.desc   skeleton is integer-width/000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_refinedFormat_0910', Level.LEVEL2, () => {
      let locale: intl.Locale = new intl.Locale("zh-hans-CN");
      let skeletonFormat: i18n.SimpleNumberFormat = i18n.getSimpleNumberFormatBySkeleton("integer-width/000", locale);
      let numberFormatted: string = skeletonFormat.format(12345);
      expect(numberFormatted).assertEqual("345")
    })

    /**
     * @tc.name   SUB_GLOBAL_refinedFormat_0920
     * @tc.number SUB_GLOBAL_refinedFormat_0920
     * @tc.desc   skeleton is scale/100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_refinedFormat_0920', Level.LEVEL2, () => {
      let locale: intl.Locale = new intl.Locale("zh-hans-CN");
      let skeletonFormat: i18n.SimpleNumberFormat = i18n.getSimpleNumberFormatBySkeleton("scale/100", locale);
      let numberFormatted: string = skeletonFormat.format(1.23);
      expect(numberFormatted).assertEqual("123")
    })

    /**
     * @tc.name   SUB_GLOBAL_refinedFormat_0930
     * @tc.number SUB_GLOBAL_refinedFormat_0930
     * @tc.desc   skeleton is group-min2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_refinedFormat_0930', Level.LEVEL2, () => {
      let locale: intl.Locale = new intl.Locale("zh-hans-CN");
      let skeletonFormat: i18n.SimpleNumberFormat = i18n.getSimpleNumberFormatBySkeleton("group-min2", locale);
      let numberFormatted: string = skeletonFormat.format(123456);
      expect(numberFormatted).assertEqual("123,456")
    })

    /**
     * @tc.name   SUB_GLOBAL_refinedFormat_0940
     * @tc.number SUB_GLOBAL_refinedFormat_0940
     * @tc.desc   skeleton is numbering-system/arab
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_refinedFormat_0940', Level.LEVEL2, () => {
      let locale: intl.Locale = new intl.Locale("zh-hans-CN");
      let skeletonFormat: i18n.SimpleNumberFormat =
        i18n.getSimpleNumberFormatBySkeleton("numbering-system/arab", locale);
      let numberFormatted: string = skeletonFormat.format(10);
      expect(numberFormatted).assertEqual("١٠")
    })

    /**
     * @tc.name   SUB_GLOBAL_refinedFormat_0950
     * @tc.number SUB_GLOBAL_refinedFormat_0950
     * @tc.desc   skeleton is () currency/CAD
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_refinedFormat_0950', Level.LEVEL2, () => {
      let locale: intl.Locale = new intl.Locale("zh-hans-CN");
      let skeletonFormat: i18n.SimpleNumberFormat = i18n.getSimpleNumberFormatBySkeleton("() currency/CAD", locale);
      let numberFormatted: string = skeletonFormat.format(-50);
      expect(numberFormatted).assertEqual("(CA$50.00)")
    })

    /**
     * @tc.name   SUB_GLOBAL_refinedFormat_0960
     * @tc.number SUB_GLOBAL_refinedFormat_0960
     * @tc.desc   skeleton is decimal-always
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_refinedFormat_0960', Level.LEVEL2, () => {
      let locale: intl.Locale = new intl.Locale("zh-hans-CN");
      let skeletonFormat: i18n.SimpleNumberFormat = i18n.getSimpleNumberFormatBySkeleton("decimal-always", locale);
      let numberFormatted: string = skeletonFormat.format(123);
      expect(numberFormatted).assertEqual("123.")
    })

    /**
     * @tc.name   SUB_GLOBAL_FilePathMirroring_0200
     * @tc.number SUB_GLOBAL_FilePathMirroring_0200
     * @tc.desc   path /data/out/tmp & delimiter / non-mirror language
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_FilePathMirroring_0200', Level.LEVEL2, () => {
      let path: string = "/data/out/tmp";
      let delimiter: string = "/";
      let local: intl.Locale = new intl.Locale("zh-hans");
      let mirrorPath: string = i18n.I18NUtil.getUnicodeWrappedFilePath(path, delimiter, local);
      let flag = i18n.Unicode.isRTL(mirrorPath);
      expect(flag).assertFalse()
    })

    /**
     * @tc.name   SUB_GLOBAL_FilePathMirroring_0300
     * @tc.number SUB_GLOBAL_FilePathMirroring_0300
     * @tc.desc   path \data\out\tmp & delimiter \ mirror language
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_FilePathMirroring_0300', Level.LEVEL2, () => {
      let path: string = "\\data\\out\\tmp";
      let delimiter: string = "\\";
      let local: intl.Locale = new intl.Locale("ug");
      let mirrorPath: string = i18n.I18NUtil.getUnicodeWrappedFilePath(path, delimiter, local);
      let flag = i18n.Unicode.isRTL(mirrorPath);
      expect(flag).assertTrue()
    })

    /**
     * @tc.name   SUB_GLOBAL_FilePathMirroring_0400
     * @tc.number SUB_GLOBAL_FilePathMirroring_0400
     * @tc.desc   path >data>out>tmp & delimiter > mirror language
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_FilePathMirroring_0400', Level.LEVEL2, () => {
      let path: string = ">data>out>tmp";
      let delimiter: string = ">";
      let local: intl.Locale = new intl.Locale("ug");
      let mirrorPath: string = i18n.I18NUtil.getUnicodeWrappedFilePath(path, delimiter, local);
      let flag = i18n.Unicode.isRTL(mirrorPath);
      expect(flag).assertTrue()
    })

    /**
     * @tc.name   SUB_GLOBAL_FilePathMirroring_0600
     * @tc.number SUB_GLOBAL_FilePathMirroring_0600
     * @tc.desc   path /data/out/tmp & delimiter > mirror language
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_FilePathMirroring_0600', Level.LEVEL2, () => {
      let path: string = "/data/out/tmp";
      let delimiter: string = ">";
      let local: intl.Locale = new intl.Locale("ug");
      let mirrorPath: string = i18n.I18NUtil.getUnicodeWrappedFilePath(path, delimiter, local);
      let flag = i18n.Unicode.isRTL(mirrorPath);
      expect(flag).assertFalse()
    })

    /**
     * @tc.name   SUB_GLOBAL_FilePathMirroring_0800
     * @tc.number SUB_GLOBAL_FilePathMirroring_0800
     * @tc.desc   path /data/&*^%$#@-+=!out/tmp & delimiter / mirror language
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_FilePathMirroring_0800', Level.LEVEL2, () => {
      let path: string = "/data/&*^%$#@-+=!out/tmp";
      let delimiter: string = "/";
      let local: intl.Locale = new intl.Locale("ar");
      let mirrorPath: string = i18n.I18NUtil.getUnicodeWrappedFilePath(path, delimiter, local);
      let flag = i18n.Unicode.isRTL(mirrorPath);
      expect(flag).assertTrue()
    })

    /**
     * @tc.name   SUB_GLOBAL_numberFormat_0010
     * @tc.number SUB_GLOBAL_numberFormat_0010
     * @tc.desc   units Incoming beat-per-minute
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_numberFormat_0010', Level.LEVEL2, () => {
      let options: intl.NumberOptions = {
        style: "unit",
        unit: "beat-per-minute",
        unitDisplay: "short"
      }
      let numberFmt: intl.NumberFormat = new intl.NumberFormat("en-US", options);
      let resultFmt: string = numberFmt.format(0);
      expect(resultFmt).assertEqual("0 bpm")
      let numberFmt2: intl.NumberFormat = new intl.NumberFormat("zh-Hans-CN", options);
      let resultFmt2: string = numberFmt2.format(0);
      expect(resultFmt2).assertEqual("0 次/分钟")
    })

    /**
     * @tc.name   SUB_GLOBAL_numberFormat_0020
     * @tc.number SUB_GLOBAL_numberFormat_0020
     * @tc.desc   units Incoming beat-per-minute
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_GLOBAL_numberFormat_0020', Level.LEVEL1, () => {
      let options: intl.NumberOptions = {
        style: "unit",
        unit: "beat-per-minute",
        unitDisplay: "short"
      }
      let numberFmt: intl.NumberFormat = new intl.NumberFormat("en-US", options);
      let resultFmt: string = numberFmt.format(1);
      expect(resultFmt).assertEqual("1 bpm")
      let numberFmt2: intl.NumberFormat = new intl.NumberFormat("zh-Hans-CN", options);
      let resultFmt2: string = numberFmt2.format(1);
      expect(resultFmt2).assertEqual("1 次/分钟")
    })

    /**
     * @tc.name   SUB_GLOBAL_numberFormat_0030
     * @tc.number SUB_GLOBAL_numberFormat_0030
     * @tc.desc   units Incoming beat-per-minute
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_GLOBAL_numberFormat_0030', Level.LEVEL3, () => {
      let options: intl.NumberOptions = {
        style: "unit",
        unit: "beat-per-minute",
        unitDisplay: "short"
      }
      let numberFmt: intl.NumberFormat = new intl.NumberFormat("en-US", options);
      let resultFmt: string = numberFmt.format(256);
      expect(resultFmt).assertEqual("256 bpm")
      let numberFmt2: intl.NumberFormat = new intl.NumberFormat("zh-Hans-CN", options);
      let resultFmt2: string = numberFmt2.format(256);
      expect(resultFmt2).assertEqual("256 次/分钟")
    })

    /**
     * @tc.name   SUB_GLOBAL_numberFormat_0040
     * @tc.number SUB_GLOBAL_numberFormat_0040
     * @tc.desc   units Incoming beat-per-minute
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_GLOBAL_numberFormat_0040', Level.LEVEL3, () => {
      let options: intl.NumberOptions = {
        style: "unit",
        unit: "beat-per-minute",
        unitDisplay: "long"
      }
      let numberFmt: intl.NumberFormat = new intl.NumberFormat("en-US", options);
      let resultFmt: string = numberFmt.format(10000);
      expect(resultFmt).assertEqual("10,000 bpm")
      let numberFmt2: intl.NumberFormat = new intl.NumberFormat("zh-Hans-CN", options);
      let resultFmt2: string = numberFmt2.format(10000);
      expect(resultFmt2).assertEqual("10,000 次/分钟")
    })

    /**
     * @tc.name   SUB_GLOBAL_numberFormat_0050
     * @tc.number SUB_GLOBAL_numberFormat_0050
     * @tc.desc   units Incoming beat-per-minute
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_numberFormat_0050', Level.LEVEL2, () => {
      let options: intl.NumberOptions = {
        style: 'unit',
        unit: 'beat-per-minute',
        unitDisplay: 'long'
      }
      let numberFmt: intl.NumberFormat = new intl.NumberFormat("en-US", options);
      let resultFmt: string = numberFmt.format(0.1);
      expect(resultFmt).assertEqual("0.1 bpm")
      let numberFmt2: intl.NumberFormat = new intl.NumberFormat("zh-Hans-CN", options);
      let resultFmt2: string = numberFmt2.format(0.1);
      expect(resultFmt2).assertEqual("0.1 次/分钟")
    })

    /**
     * @tc.name   SUB_GLOBAL_numberFormat_0060
     * @tc.number SUB_GLOBAL_numberFormat_0060
     * @tc.desc   units Incoming beat-per-minute
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_GLOBAL_numberFormat_0060', Level.LEVEL3, () => {
      let options: intl.NumberOptions = {
        style: 'unit',
        unit: 'beat-per-minute',
        unitDisplay: 'long'
      }
      let numberFmt: intl.NumberFormat = new intl.NumberFormat("en-US", options);
      let resultFmt: string = numberFmt.format(-1);
      expect(resultFmt).assertEqual("-1 bpm")
      let numberFmt2: intl.NumberFormat = new intl.NumberFormat("zh-Hans-CN", options);
      let resultFmt2: string = numberFmt2.format(-1);
      expect(resultFmt2).assertEqual("-1 次/分钟")
    })

    /**
     * @tc.name   SUB_GLOBAL_numberFormat_0070
     * @tc.number SUB_GLOBAL_numberFormat_0070
     * @tc.desc   units Incoming jump-rope-per-minute
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_numberFormat_0070', Level.LEVEL2, () => {
      let options: intl.NumberOptions = {
        style: 'unit',
        unit: 'jump-rope-per-minute',
        unitDisplay: 'shot'
      }
      let numberFmt: intl.NumberFormat = new intl.NumberFormat("en-US", options);
      let resultFmt: string = numberFmt.format(0);
      expect(resultFmt).assertEqual("0 jumps/minute")
      let numberFmt2: intl.NumberFormat = new intl.NumberFormat("zh-Hans-CN", options);
      let resultFmt2: string = numberFmt2.format(0);
      expect(resultFmt2).assertEqual("0 个/分钟")
    })

    /**
     * @tc.name   SUB_GLOBAL_numberFormat_0080
     * @tc.number SUB_GLOBAL_numberFormat_0080
     * @tc.desc   units Incoming jump-rope-per-minute
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_GLOBAL_numberFormat_0080', Level.LEVEL1, () => {
      let options: intl.NumberOptions = {
        style: 'unit',
        unit: 'jump-rope-per-minute',
        unitDisplay: 'shot'
      }
      let numberFmt: intl.NumberFormat = new intl.NumberFormat("en-US", options);
      let resultFmt: string = numberFmt.format(1);
      expect(resultFmt).assertEqual("1 jump/minute")
      let numberFmt2: intl.NumberFormat = new intl.NumberFormat("zh-Hans-CN", options);
      let resultFmt2: string = numberFmt2.format(1);
      expect(resultFmt2).assertEqual("1 个/分钟")
    })

    /**
     * @tc.name   SUB_GLOBAL_numberFormat_0090
     * @tc.number SUB_GLOBAL_numberFormat_0090
     * @tc.desc   units Incoming jump-rope-per-minute
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_GLOBAL_numberFormat_0090', Level.LEVEL3, () => {
      let options: intl.NumberOptions = {
        style: 'unit',
        unit: 'jump-rope-per-minute',
        unitDisplay: 'shot'
      }
      let numberFmt: intl.NumberFormat = new intl.NumberFormat("en-US", options);
      let resultFmt: string = numberFmt.format(256);
      expect(resultFmt).assertEqual("256 jumps/minute")
      let numberFmt2: intl.NumberFormat = new intl.NumberFormat("zh-Hans-CN", options);
      let resultFmt2: string = numberFmt2.format(256);
      expect(resultFmt2).assertEqual("256 个/分钟")
    })

    /**
     * @tc.name   SUB_GLOBAL_numberFormat_0100
     * @tc.number SUB_GLOBAL_numberFormat_0100
     * @tc.desc   units Incoming jump-rope-per-minute
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_GLOBAL_numberFormat_0100', Level.LEVEL3, () => {
      let options: intl.NumberOptions = {
        style: 'unit',
        unit: 'jump-rope-per-minute',
        unitDisplay: 'shot'
      }
      let numberFmt: intl.NumberFormat = new intl.NumberFormat("en-US", options);
      let resultFmt: string = numberFmt.format(10000);
      expect(resultFmt).assertEqual("10,000 jumps/minute")
      let numberFmt2: intl.NumberFormat = new intl.NumberFormat("zh-Hans-CN", options);
      let resultFmt2: string = numberFmt2.format(10000);
      expect(resultFmt2 == "10,000 个/分钟").assertTrue()
    })

    /**
     * @tc.name   SUB_GLOBAL_numberFormat_0110
     * @tc.number SUB_GLOBAL_numberFormat_0110
     * @tc.desc   units Incoming jump-rope-per-minute
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_numberFormat_0110', Level.LEVEL2, () => {
      let options: intl.NumberOptions = {
        style: 'unit',
        unit: 'jump-rope-per-minute',
        unitDisplay: 'long'
      }
      let numberFmt: intl.NumberFormat = new intl.NumberFormat("en-US", options);
      let resultFmt: string = numberFmt.format(0.1);
      expect(resultFmt).assertEqual("0.1 jumps/minute")
      let numberFmt2: intl.NumberFormat = new intl.NumberFormat("zh-Hans-CN", options);
      let resultFmt2: string = numberFmt2.format(0.1);
      expect(resultFmt2).assertEqual("0.1 个/分钟")
    })

    /**
     * @tc.name   SUB_GLOBAL_numberFormat_0120
     * @tc.number SUB_GLOBAL_numberFormat_0120
     * @tc.desc   units Incoming jump-rope-per-minute
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_GLOBAL_numberFormat_0120', Level.LEVEL3, () => {
      let options: intl.NumberOptions = {
        style: 'unit',
        unit: 'jump-rope-per-minute',
        unitDisplay: 'long'
      }
      let numberFmt: intl.NumberFormat = new intl.NumberFormat("en-US", options);
      let resultFmt: string = numberFmt.format(-1);
      expect(resultFmt).assertEqual("-1 jump/minute")
      let numberFmt2: intl.NumberFormat = new intl.NumberFormat("zh-Hans-CN", options);
      let resultFmt2: string = numberFmt2.format(-1);
      expect(resultFmt2).assertEqual("-1 个/分钟")
    })

    /**
     * @tc.name   SUB_GLOBAL_numberFormat_0130
     * @tc.number SUB_GLOBAL_numberFormat_0130
     * @tc.desc   units Incoming breath-per-minute
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_numberFormat_0130', Level.LEVEL2, () => {
      let options: intl.NumberOptions = {
        style: 'unit',
        unit: 'breath-per-minute',
        unitDisplay: 'shot'
      }
      let numberFmt: intl.NumberFormat = new intl.NumberFormat("en-US", options);
      let resultFmt: string = numberFmt.format(0);
      expect(resultFmt).assertEqual("0 brpm")
      let numberFmt2: intl.NumberFormat = new intl.NumberFormat("zh-Hans-CN", options);
      let resultFmt2: string = numberFmt2.format(0);
      expect(resultFmt2).assertEqual("0 次/分")
    })

    /**
     * @tc.name   SUB_GLOBAL_numberFormat_0140
     * @tc.number SUB_GLOBAL_numberFormat_0140
     * @tc.desc   units Incoming breath-per-minute
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_GLOBAL_numberFormat_0140', Level.LEVEL1, () => {
      let options: intl.NumberOptions = {
        style: 'unit',
        unit: 'breath-per-minute',
        unitDisplay: 'shot'
      }
      let numberFmt: intl.NumberFormat = new intl.NumberFormat("en-US", options);
      let resultFmt: string = numberFmt.format(1);
      expect(resultFmt).assertEqual("1 brpm")
      let numberFmt2: intl.NumberFormat = new intl.NumberFormat("zh-Hans-CN", options);
      let resultFmt2: string = numberFmt2.format(1);
      expect(resultFmt2).assertEqual("1 次/分")
    })

    /**
     * @tc.name   SUB_GLOBAL_numberFormat_0150
     * @tc.number SUB_GLOBAL_numberFormat_0150
     * @tc.desc   units Incoming breath-per-minute
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_GLOBAL_numberFormat_0150', Level.LEVEL3, () => {
      let options: intl.NumberOptions = {
        style: 'unit',
        unit: 'breath-per-minute',
        unitDisplay: 'shot'
      }
      let numberFmt: intl.NumberFormat = new intl.NumberFormat("en-US", options);
      let resultFmt: string = numberFmt.format(256);
      expect(resultFmt).assertEqual("256 brpm")
      let numberFmt2: intl.NumberFormat = new intl.NumberFormat("zh-Hans-CN", options);
      let resultFmt2: string = numberFmt2.format(256);
      expect(resultFmt2).assertEqual("256 次/分")
    })

    /**
     * @tc.name   SUB_GLOBAL_numberFormat_0160
     * @tc.number SUB_GLOBAL_numberFormat_0160
     * @tc.desc   units Incoming breath-per-minute
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_GLOBAL_numberFormat_0160', Level.LEVEL3, () => {
      let options: intl.NumberOptions = {
        style: 'unit',
        unit: 'breath-per-minute',
        unitDisplay: 'long'
      }
      let numberFmt: intl.NumberFormat = new intl.NumberFormat("en-US", options);
      let resultFmt: string = numberFmt.format(10000);
      expect(resultFmt).assertEqual("10,000 brpm")
      let numberFmt2: intl.NumberFormat = new intl.NumberFormat("zh-Hans-CN", options);
      let resultFmt2: string = numberFmt2.format(10000);
      expect(resultFmt2).assertEqual("10,000 次/分")
    })

    /**
     * @tc.name   SUB_GLOBAL_numberFormat_0170
     * @tc.number SUB_GLOBAL_numberFormat_0170
     * @tc.desc   units Incoming breath-per-minute
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_numberFormat_0170', Level.LEVEL2, () => {
      let options: intl.NumberOptions = {
        style: 'unit',
        unit: 'breath-per-minute',
        unitDisplay: 'shot'
      }
      let numberFmt: intl.NumberFormat = new intl.NumberFormat("en-US", options);
      let resultFmt: string = numberFmt.format(0.1);
      expect(resultFmt).assertEqual("0.1 brpm")
      let numberFmt2: intl.NumberFormat = new intl.NumberFormat("zh-Hans-CN", options);
      let resultFmt2: string = numberFmt2.format(0.1);
      expect(resultFmt2).assertEqual("0.1 次/分")
    })

    /**
     * @tc.name   SUB_GLOBAL_numberFormat_0180
     * @tc.number SUB_GLOBAL_numberFormat_0180
     * @tc.desc   units Incoming breath-per-minute
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_GLOBAL_numberFormat_0180', Level.LEVEL3, () => {
      let options: intl.NumberOptions = {
        style: 'unit',
        unit: 'breath-per-minute',
        unitDisplay: 'long'
      }
      let numberFmt: intl.NumberFormat = new intl.NumberFormat("en-US", options);
      let resultFmt: string = numberFmt.format(-1);
      expect(resultFmt).assertEqual("-1 brpm")
      let numberFmt2: intl.NumberFormat = new intl.NumberFormat("zh-Hans-CN", options);
      let resultFmt2: string = numberFmt2.format(-1);
      expect(resultFmt2).assertEqual("-1 次/分")
    })

    /**
     * @tc.name   SUB_GLOBAL_numberFormat_0190
     * @tc.number SUB_GLOBAL_numberFormat_0190
     * @tc.desc   units Incoming body-weight-per-second
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_numberFormat_0190', Level.LEVEL2, () => {
      let options: intl.NumberOptions = {
        style: 'unit',
        unit: 'body-weight-per-second',
        unitDisplay: 'short'
      }
      let numberFmt: intl.NumberFormat = new intl.NumberFormat("en-US", options);
      let resultFmt: string = numberFmt.format(0);
      expect(resultFmt).assertEqual("0 BW/s")
      let numberFmt2: intl.NumberFormat = new intl.NumberFormat("zh-Hans-CN", options);
      let resultFmt2: string = numberFmt2.format(0);
      expect(resultFmt2).assertEqual("0 BW/s")
    })

    /**
     * @tc.name   SUB_GLOBAL_numberFormat_0200
     * @tc.number SUB_GLOBAL_numberFormat_0200
     * @tc.desc   units Incoming body-weight-per-second
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_GLOBAL_numberFormat_0200', Level.LEVEL1, () => {
      let options: intl.NumberOptions = {
        style: 'unit',
        unit: 'body-weight-per-second',
        unitDisplay: 'short'
      }
      let numberFmt: intl.NumberFormat = new intl.NumberFormat("en-US", options);
      let resultFmt: string = numberFmt.format(1);
      expect(resultFmt).assertEqual("1 BW/s")
      let numberFmt2: intl.NumberFormat = new intl.NumberFormat("zh-Hans-CN", options);
      let resultFmt2: string = numberFmt2.format(1);
      expect(resultFmt2).assertEqual("1 BW/s")
    })

    /**
     * @tc.name   SUB_GLOBAL_numberFormat_0210
     * @tc.number SUB_GLOBAL_numberFormat_0210
     * @tc.desc   units Incoming body-weight-per-second
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_GLOBAL_numberFormat_0210', Level.LEVEL3, () => {
      let options: intl.NumberOptions = {
        style: 'unit',
        unit: 'body-weight-per-second',
        unitDisplay: 'short'
      }
      let numberFmt: intl.NumberFormat = new intl.NumberFormat("en-US", options);
      let resultFmt: string = numberFmt.format(256);
      expect(resultFmt).assertEqual("256 BW/s")
      let numberFmt2: intl.NumberFormat = new intl.NumberFormat("zh-Hans-CN", options);
      let resultFmt2: string = numberFmt2.format(256);
      expect(resultFmt2).assertEqual("256 BW/s")
    })

    /**
     * @tc.name   SUB_GLOBAL_numberFormat_0220
     * @tc.number SUB_GLOBAL_numberFormat_0220
     * @tc.desc   units Incoming body-weight-per-second
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_GLOBAL_numberFormat_0220', Level.LEVEL3, () => {
      let options: intl.NumberOptions = {
        style: 'unit',
        unit: 'body-weight-per-second',
        unitDisplay: 'long'
      }
      let numberFmt: intl.NumberFormat = new intl.NumberFormat("en-US", options);
      let resultFmt: string = numberFmt.format(10000);
      expect(resultFmt).assertEqual("10,000 BW/s")
      let numberFmt2: intl.NumberFormat = new intl.NumberFormat("zh-Hans-CN", options);
      let resultFmt2: string = numberFmt2.format(10000);
      expect(resultFmt2).assertEqual("10,000 BW/s")
    })

    /**
     * @tc.name   SUB_GLOBAL_numberFormat_0230
     * @tc.number SUB_GLOBAL_numberFormat_0230
     * @tc.desc   units Incoming body-weight-per-second
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_numberFormat_0230', Level.LEVEL2, () => {
      let options: intl.NumberOptions = {
        style: 'unit',
        unit: 'body-weight-per-second',
        unitDisplay: 'long'
      }
      let numberFmt: intl.NumberFormat = new intl.NumberFormat("en-US", options);
      let resultFmt: string = numberFmt.format(0.1);
      expect(resultFmt).assertEqual("0.1 BW/s")
      let numberFmt2: intl.NumberFormat = new intl.NumberFormat("zh-Hans-CN", options);
      let resultFmt2: string = numberFmt2.format(0.1);
      expect(resultFmt2).assertEqual("0.1 BW/s")
    })

    /**
     * @tc.name   SUB_GLOBAL_numberFormat_0240
     * @tc.number SUB_GLOBAL_numberFormat_0240
     * @tc.desc   units Incoming body-weight-per-second
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_GLOBAL_numberFormat_0240', Level.LEVEL3, () => {
      let options: intl.NumberOptions = {
        style: 'unit',
        unit: 'body-weight-per-second',
        unitDisplay: 'long'
      }
      let numberFmt: intl.NumberFormat = new intl.NumberFormat("en-US", options);
      let resultFmt: string = numberFmt.format(-1);
      expect(resultFmt).assertEqual("-1 BW/s")
      let numberFmt2: intl.NumberFormat = new intl.NumberFormat("zh-Hans-CN", options);
      let resultFmt2: string = numberFmt2.format(-1);
      expect(resultFmt2).assertEqual("-1 BW/s")
    })

    /**
     * @tc.name   SUB_GLOBAL_numberFormat_0250
     * @tc.number SUB_GLOBAL_numberFormat_0250
     * @tc.desc   units Incoming rotation-per-minute
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_numberFormat_0250', Level.LEVEL2, () => {
      let options: intl.NumberOptions = {
        style: 'unit',
        unit: 'rotation-per-minute',
        unitDisplay: 'short'
      }
      let numberFmt: intl.NumberFormat = new intl.NumberFormat("en-US", options);
      let resultFmt: string = numberFmt.format(0);
      expect(resultFmt).assertEqual("0 rpm")
      let numberFmt2: intl.NumberFormat = new intl.NumberFormat("zh-Hans-CN", options);
      let resultFmt2: string = numberFmt2.format(0);
      expect(resultFmt2).assertEqual("0 转/分钟")
    })

    /**
     * @tc.name   SUB_GLOBAL_numberFormat_0260
     * @tc.number SUB_GLOBAL_numberFormat_0260
     * @tc.desc   units Incoming rotation-per-minute
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_GLOBAL_numberFormat_0260', Level.LEVEL1, () => {
      let options: intl.NumberOptions = {
        style: 'unit',
        unit: 'rotation-per-minute',
        unitDisplay: 'short'
      }
      let numberFmt: intl.NumberFormat = new intl.NumberFormat("en-US", options);
      let resultFmt: string = numberFmt.format(1);
      expect(resultFmt).assertEqual("1 rpm")
      let numberFmt2: intl.NumberFormat = new intl.NumberFormat("zh-Hans-CN", options);
      let resultFmt2: string = numberFmt2.format(1);
      expect(resultFmt2).assertEqual("1 转/分钟")
    })

    /**
     * @tc.name   SUB_GLOBAL_numberFormat_0270
     * @tc.number SUB_GLOBAL_numberFormat_0270
     * @tc.desc   units Incoming rotation-per-minute
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_GLOBAL_numberFormat_0270', Level.LEVEL3, () => {
      let options: intl.NumberOptions = {
        style: 'unit',
        unit: 'rotation-per-minute',
        unitDisplay: 'short'
      }
      let numberFmt: intl.NumberFormat = new intl.NumberFormat("en-US", options);
      let resultFmt: string = numberFmt.format(256);
      expect(resultFmt).assertEqual("256 rpm")
      let numberFmt2: intl.NumberFormat = new intl.NumberFormat("zh-Hans-CN", options);
      let resultFmt2: string = numberFmt2.format(256);
      expect(resultFmt2).assertEqual("256 转/分钟")
    })

    /**
     * @tc.name   SUB_GLOBAL_numberFormat_0280
     * @tc.number SUB_GLOBAL_numberFormat_0280
     * @tc.desc   units Incoming rotation-per-minute
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_GLOBAL_numberFormat_0280', Level.LEVEL3, () => {
      let options: intl.NumberOptions = {
        style: 'unit',
        unit: 'rotation-per-minute',
        unitDisplay: 'long'
      }
      let numberFmt: intl.NumberFormat = new intl.NumberFormat("en-US", options);
      let resultFmt: string = numberFmt.format(10000);
      expect(resultFmt).assertEqual("10,000 rpm")
      let numberFmt2: intl.NumberFormat = new intl.NumberFormat("zh-Hans-CN", options);
      let resultFmt2: string = numberFmt2.format(10000);
      expect(resultFmt2).assertEqual("10,000 转/分钟")
    })

    /**
     * @tc.name   SUB_GLOBAL_numberFormat_0290
     * @tc.number SUB_GLOBAL_numberFormat_0290
     * @tc.desc   units Incoming rotation-per-minute
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_numberFormat_0290', Level.LEVEL2, () => {
      let options: intl.NumberOptions = {
        style: 'unit',
        unit: 'rotation-per-minute',
        unitDisplay: 'long'
      }
      let numberFmt: intl.NumberFormat = new intl.NumberFormat("en-US", options);
      let resultFmt: string = numberFmt.format(0.1);
      expect(resultFmt).assertEqual("0.1 rpm")
      let numberFmt2: intl.NumberFormat = new intl.NumberFormat("zh-Hans-CN", options);
      let resultFmt2: string = numberFmt2.format(0.1);
      expect(resultFmt2).assertEqual("0.1 转/分钟")
    })

    /**
     * @tc.name   SUB_GLOBAL_numberFormat_0300
     * @tc.number SUB_GLOBAL_numberFormat_0300
     * @tc.desc   units Incoming rotation-per-minute
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_GLOBAL_numberFormat_0300', Level.LEVEL3, () => {
      let options: intl.NumberOptions = {
        style: 'unit',
        unit: 'rotation-per-minute',
        unitDisplay: 'long'
      }
      let numberFmt: intl.NumberFormat = new intl.NumberFormat("en-US", options);
      let resultFmt: string = numberFmt.format(-1);
      expect(resultFmt).assertEqual("-1 rpm")
      let numberFmt2: intl.NumberFormat = new intl.NumberFormat("zh-Hans-CN", options);
      let resultFmt2: string = numberFmt2.format(-1);
      expect(resultFmt2).assertEqual("-1 转/分钟")
    })

    /**
     * @tc.name   SUB_GLOBAL_numberFormat_0310
     * @tc.number SUB_GLOBAL_numberFormat_0310
     * @tc.desc   units Incoming mile-per-hour
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_numberFormat_0310', Level.LEVEL2, () => {
      let options: intl.NumberOptions = {
        style: 'unit',
        unit: 'mile-per-hour',
        unitDisplay: 'short'
      }
      let numberFmt: intl.NumberFormat = new intl.NumberFormat("en-US", options);
      let resultFmt: string = numberFmt.format(0);
      expect(resultFmt).assertEqual("0 mph")
      let numberFmt2: intl.NumberFormat = new intl.NumberFormat("zh-Hans-CN", options);
      let resultFmt2: string = numberFmt2.format(0);
      expect(resultFmt2).assertEqual("0 mi/h")
    })

    /**
     * @tc.name   SUB_GLOBAL_numberFormat_0320
     * @tc.number SUB_GLOBAL_numberFormat_0320
     * @tc.desc   units Incoming mile-per-hour
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_GLOBAL_numberFormat_0320', Level.LEVEL1, () => {
      let options: intl.NumberOptions = {
        style: 'unit',
        unit: 'mile-per-hour',
        unitDisplay: 'short'
      }
      let numberFmt: intl.NumberFormat = new intl.NumberFormat("en-US", options);
      let resultFmt: string = numberFmt.format(1);
      expect(resultFmt).assertEqual("1 mph")
      let numberFmt2: intl.NumberFormat = new intl.NumberFormat("zh-Hans-CN", options);
      let resultFmt2: string = numberFmt2.format(1);
      expect(resultFmt2).assertEqual("1 mi/h")
    })

    /**
     * @tc.name   SUB_GLOBAL_numberFormat_0330
     * @tc.number SUB_GLOBAL_numberFormat_0330
     * @tc.desc   units Incoming mile-per-hour
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_GLOBAL_numberFormat_0330', Level.LEVEL3, () => {
      let options: intl.NumberOptions = {
        style: 'unit',
        unit: 'mile-per-hour',
        unitDisplay: 'short'
      }
      let numberFmt: intl.NumberFormat = new intl.NumberFormat("en-US", options);
      let resultFmt: string = numberFmt.format(256);
      expect(resultFmt).assertEqual("256 mph")
      let numberFmt2: intl.NumberFormat = new intl.NumberFormat("zh-Hans-CN", options);
      let resultFmt2: string = numberFmt2.format(256);
      expect(resultFmt2).assertEqual("256 mi/h")
    })

    /**
     * @tc.name   SUB_GLOBAL_numberFormat_0340
     * @tc.number SUB_GLOBAL_numberFormat_0340
     * @tc.desc   units Incoming mile-per-hour
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_GLOBAL_numberFormat_0340', Level.LEVEL3, () => {
      let options: intl.NumberOptions = {
        style: 'unit',
        unit: 'mile-per-hour',
        unitDisplay: 'long'
      }
      let numberFmt: intl.NumberFormat = new intl.NumberFormat('en-US', options);
      let resultFmt: string = numberFmt.format(10000);
      expect(resultFmt).assertEqual("10,000 miles per hour")
      let numberFmt2: intl.NumberFormat = new intl.NumberFormat("zh-Hans-CN", options);
      let resultFmt2: string = numberFmt2.format(10000);
      expect(resultFmt2).assertEqual("每小时10,000英里")
    })

    /**
     * @tc.name   SUB_GLOBAL_numberFormat_0350
     * @tc.number SUB_GLOBAL_numberFormat_0350
     * @tc.desc   units Incoming mile-per-hour
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_numberFormat_0350', Level.LEVEL2, () => {
      let options: intl.NumberOptions = {
        style: 'unit',
        unit: 'mile-per-hour',
        unitDisplay: 'long'
      }
      let numberFmt: intl.NumberFormat = new intl.NumberFormat('en-US', options);
      let resultFmt: string = numberFmt.format(0.1);
      expect(resultFmt).assertEqual("0.1 miles per hour")
      let numberFmt2: intl.NumberFormat = new intl.NumberFormat("zh-Hans-CN", options);
      let resultFmt2: string = numberFmt2.format(0.1);
      expect(resultFmt2).assertEqual("每小时0.1英里")
    })

    /**
     * @tc.name   SUB_GLOBAL_numberFormat_0360
     * @tc.number SUB_GLOBAL_numberFormat_0360
     * @tc.desc   units Incoming mile-per-hour
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_GLOBAL_numberFormat_0360', Level.LEVEL3, () => {
      let options: intl.NumberOptions = {
        style: 'unit',
        unit: 'mile-per-hour',
        unitDisplay: 'long'
      }
      let numberFmt: intl.NumberFormat = new intl.NumberFormat('en-US', options);
      let resultFmt: string = numberFmt.format(-1);
      expect(resultFmt).assertEqual("-1 mile per hour")
      let numberFmt2: intl.NumberFormat = new intl.NumberFormat("zh-Hans-CN", options);
      let resultFmt2: string = numberFmt2.format(-1);
      expect(resultFmt2).assertEqual("每小时-1英里")
    })

    /**
     * @tc.name   SUB_GLOBAL_numberFormat_0370
     * @tc.number SUB_GLOBAL_numberFormat_0370
     * @tc.desc   units Incoming kilometer-per-hour
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_numberFormat_0370', Level.LEVEL2, () => {
      let options: intl.NumberOptions = {
        style: 'unit',
        unit: 'kilometer-per-hour',
        unitDisplay: 'short'
      }
      let numberFmt: intl.NumberFormat = new intl.NumberFormat('en-US', options);
      let resultFmt: string = numberFmt.format(0);
      expect(resultFmt).assertEqual("0 km/h")

      let numberFmt2: intl.NumberFormat = new intl.NumberFormat("zh-Hans-CN", options);
      let resultFmt2: string = numberFmt2.format(0);
      expect(resultFmt2).assertEqual("0 km/h")
    })

    /**
     * @tc.name   SUB_GLOBAL_numberFormat_0380
     * @tc.number SUB_GLOBAL_numberFormat_0380
     * @tc.desc   units Incoming kilometer-per-hour
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_GLOBAL_numberFormat_0380', Level.LEVEL1, () => {
      let options: intl.NumberOptions = {
        style: 'unit',
        unit: 'kilometer-per-hour',
        unitDisplay: 'short'
      }
      let numberFmt: intl.NumberFormat = new intl.NumberFormat('en-US', options);
      let resultFmt: string = numberFmt.format(1);
      expect(resultFmt).assertEqual("1 km/h")
      let numberFmt2: intl.NumberFormat = new intl.NumberFormat("zh-Hans-CN", options);
      let resultFmt2: string = numberFmt2.format(1);
      expect(resultFmt2).assertEqual("1 km/h")
    })

    /**
     * @tc.name   SUB_GLOBAL_numberFormat_0390
     * @tc.number SUB_GLOBAL_numberFormat_0390
     * @tc.desc   units Incoming kilometer-per-hour
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_GLOBAL_numberFormat_0390', Level.LEVEL3, () => {
      let options: intl.NumberOptions = {
        style: 'unit',
        unit: 'kilometer-per-hour',
        unitDisplay: 'short'
      }
      let numberFmt: intl.NumberFormat = new intl.NumberFormat('en-US', options);
      let resultFmt: string = numberFmt.format(256);
      expect(resultFmt).assertEqual("256 km/h")
      let numberFmt2: intl.NumberFormat = new intl.NumberFormat("zh-Hans-CN", options);
      let resultFmt2: string = numberFmt2.format(256);
      expect(resultFmt2).assertEqual("256 km/h")
    })

    /**
     * @tc.name   SUB_GLOBAL_numberFormat_0400
     * @tc.number SUB_GLOBAL_numberFormat_0400
     * @tc.desc   units Incoming kilometer-per-hour
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_GLOBAL_numberFormat_0400', Level.LEVEL3, () => {
      let options: intl.NumberOptions = {
        style: 'unit',
        unit: 'kilometer-per-hour',
        unitDisplay: 'long'
      }
      let numberFmt: intl.NumberFormat = new intl.NumberFormat('en-US', options);
      let resultFmt: string = numberFmt.format(10000);
      expect(resultFmt).assertEqual("10,000 kilometers per hour")
      let numberFmt2: intl.NumberFormat = new intl.NumberFormat("zh-Hans-CN", options);
      let resultFmt2: string = numberFmt2.format(10000);
      expect(resultFmt2).assertEqual("每小时10,000公里")
    })

    /**
     * @tc.name   SUB_GLOBAL_numberFormat_0410
     * @tc.number SUB_GLOBAL_numberFormat_0410
     * @tc.desc   units Incoming kilometer-per-hour
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_numberFormat_0410', Level.LEVEL2, () => {
      let options: intl.NumberOptions = {
        style: 'unit',
        unit: 'kilometer-per-hour',
        unitDisplay: 'long'
      }
      let numberFmt: intl.NumberFormat = new intl.NumberFormat('en-US', options);
      let resultFmt: string = numberFmt.format(0.1);
      expect(resultFmt).assertEqual("0.1 kilometers per hour")
      let numberFmt2: intl.NumberFormat = new intl.NumberFormat("zh-Hans-CN", options);
      let resultFmt2: string = numberFmt2.format(0.1);
      expect(resultFmt2).assertEqual("每小时0.1公里")
    })

    /**
     * @tc.name   SUB_GLOBAL_numberFormat_0420
     * @tc.number SUB_GLOBAL_numberFormat_0420
     * @tc.desc   units Incoming kilometer-per-hour
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_GLOBAL_numberFormat_0420', Level.LEVEL3, () => {
      let options: intl.NumberOptions = {
        style: 'unit',
        unit: 'kilometer-per-hour',
        unitDisplay: 'long'
      }
      let numberFmt: intl.NumberFormat = new intl.NumberFormat('en-US', options);
      let resultFmt: string = numberFmt.format(-1);
      expect(resultFmt).assertEqual("-1 kilometer per hour")
      let numberFmt2: intl.NumberFormat = new intl.NumberFormat("zh-Hans-CN", options);
      let resultFmt2: string = numberFmt2.format(-1);
      expect(resultFmt2).assertEqual("每小时-1公里")
    })

    /**
     * @tc.name   SUB_GLOBAL_numberFormat_0430
     * @tc.number SUB_GLOBAL_numberFormat_0430
     * @tc.desc   units Incoming meter-per-hour
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_numberFormat_0430', Level.LEVEL2, () => {
      let options: intl.NumberOptions = {
        style: 'unit',
        unit: 'meter-per-hour',
        unitDisplay: 'short'
      }
      let numberFmt: intl.NumberFormat = new intl.NumberFormat('en-US', options);
      let resultFmt: string = numberFmt.format(0);
      expect(resultFmt).assertEqual("0 m/h")
      let numberFmt2: intl.NumberFormat = new intl.NumberFormat("zh-Hans-CN", options);
      let resultFmt2: string = numberFmt2.format(0);
      expect(resultFmt2).assertEqual("0 米/小时")
    })

    /**
     * @tc.name   SUB_GLOBAL_numberFormat_0440
     * @tc.number SUB_GLOBAL_numberFormat_0440
     * @tc.desc   units Incoming meter-per-hour
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_GLOBAL_numberFormat_0440', Level.LEVEL1, () => {
      let options: intl.NumberOptions = {
        style: 'unit',
        unit: 'meter-per-hour',
        unitDisplay: 'short'
      }
      let numberFmt: intl.NumberFormat = new intl.NumberFormat('en-US', options);
      let resultFmt: string = numberFmt.format(1);
      expect(resultFmt).assertEqual("1 m/h")
      let numberFmt2: intl.NumberFormat = new intl.NumberFormat("zh-Hans-CN", options);
      let resultFmt2: string = numberFmt2.format(1);
      expect(resultFmt2).assertEqual("1 米/小时")
    })

    /**
     * @tc.name   SUB_GLOBAL_numberFormat_0450
     * @tc.number SUB_GLOBAL_numberFormat_0450
     * @tc.desc   units Incoming meter-per-hour
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_GLOBAL_numberFormat_0450', Level.LEVEL3, () => {
      let options: intl.NumberOptions = {
        style: 'unit',
        unit: 'meter-per-hour',
        unitDisplay: 'short'
      }
      let numberFmt: intl.NumberFormat = new intl.NumberFormat('en-US', options);
      let resultFmt: string = numberFmt.format(256);
      expect(resultFmt).assertEqual("256 m/h")
      let numberFmt2: intl.NumberFormat = new intl.NumberFormat("zh-Hans-CN", options);
      let resultFmt2: string = numberFmt2.format(256);
      expect(resultFmt2).assertEqual("256 米/小时")
    })

    /**
     * @tc.name   SUB_GLOBAL_numberFormat_0460
     * @tc.number SUB_GLOBAL_numberFormat_0460
     * @tc.desc   units Incoming meter-per-hour
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_GLOBAL_numberFormat_0460', Level.LEVEL3, () => {
      let options: intl.NumberOptions = {
        style: 'unit',
        unit: 'meter-per-hour',
        unitDisplay: 'short'
      }
      let numberFmt: intl.NumberFormat = new intl.NumberFormat('en-US', options);
      let resultFmt: string = numberFmt.format(10000);
      expect(resultFmt).assertEqual("10,000 m/h")
      let numberFmt2: intl.NumberFormat = new intl.NumberFormat("zh-Hans-CN", options);
      let resultFmt2: string = numberFmt2.format(10000);
      expect(resultFmt2).assertEqual("10,000 米/小时")
    })

    /**
     * @tc.name   SUB_GLOBAL_numberFormat_0470
     * @tc.number SUB_GLOBAL_numberFormat_0470
     * @tc.desc   units Incoming meter-per-hour
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_numberFormat_0470', Level.LEVEL2, () => {
      let options: intl.NumberOptions = {
        style: 'unit',
        unit: 'meter-per-hour',
        unitDisplay: 'short'
      }
      let numberFmt: intl.NumberFormat = new intl.NumberFormat('en-US', options);
      let resultFmt: string = numberFmt.format(0.1);
      expect(resultFmt).assertEqual("0.1 m/h")
      let numberFmt2: intl.NumberFormat = new intl.NumberFormat("zh-Hans-CN", options);
      let resultFmt2: string = numberFmt2.format(0.1);
      expect(resultFmt2).assertEqual("0.1 米/小时")
    })

    /**
     * @tc.name   SUB_GLOBAL_numberFormat_0480
     * @tc.number SUB_GLOBAL_numberFormat_0480
     * @tc.desc   units Incoming meter-per-hour
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_GLOBAL_numberFormat_0480', Level.LEVEL3, () => {
      let options: intl.NumberOptions = {
        style: 'unit',
        unit: 'meter-per-hour',
        unitDisplay: 'short'
      }
      let numberFmt: intl.NumberFormat = new intl.NumberFormat('en-US', options);
      let resultFmt: string = numberFmt.format(-1);
      expect(resultFmt).assertEqual("-1 m/h")
      let numberFmt2: intl.NumberFormat = new intl.NumberFormat("zh-Hans-CN", options);
      let resultFmt2: string = numberFmt2.format(-1);
      expect(resultFmt2).assertEqual("-1 米/小时")
    })

    /**
     * @tc.name   SUB_GLOBAL_numberFormat_0490
     * @tc.number SUB_GLOBAL_numberFormat_0490
     * @tc.desc   units Incoming meter-per-second
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_numberFormat_0490', Level.LEVEL2, () => {
      let options: intl.NumberOptions = {
        style: 'unit',
        unit: 'meter-per-second',
        unitDisplay: 'short'
      }
      let numberFmt: intl.NumberFormat = new intl.NumberFormat('en-US', options);
      let resultFmt: string = numberFmt.format(0);
      expect(resultFmt).assertEqual("0 m/s")
      let numberFmt2: intl.NumberFormat = new intl.NumberFormat("zh-Hans-CN", options);
      let resultFmt2: string = numberFmt2.format(0);
      expect(resultFmt2).assertEqual("0 m/s")
    })

    /**
     * @tc.name   SUB_GLOBAL_numberFormat_0500
     * @tc.number SUB_GLOBAL_numberFormat_0500
     * @tc.desc   units Incoming meter-per-second
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_GLOBAL_numberFormat_0500', Level.LEVEL1, () => {
      let options: intl.NumberOptions = {
        style: 'unit',
        unit: 'meter-per-second',
        unitDisplay: 'short'
      }
      let numberFmt: intl.NumberFormat = new intl.NumberFormat('en-US', options);
      let resultFmt: string = numberFmt.format(1);
      expect(resultFmt).assertEqual("1 m/s")
      let numberFmt2: intl.NumberFormat = new intl.NumberFormat("zh-Hans-CN", options);
      let resultFmt2: string = numberFmt2.format(1);
      expect(resultFmt2).assertEqual("1 m/s")
    })

    /**
     * @tc.name   SUB_GLOBAL_numberFormat_0510
     * @tc.number SUB_GLOBAL_numberFormat_0510
     * @tc.desc   units Incoming meter-per-second
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_GLOBAL_numberFormat_0510', Level.LEVEL3, () => {
      let options: intl.NumberOptions = {
        style: 'unit',
        unit: 'meter-per-second',
        unitDisplay: 'short'
      }
      let numberFmt: intl.NumberFormat = new intl.NumberFormat('en-US', options);
      let resultFmt: string = numberFmt.format(256);
      expect(resultFmt).assertEqual("256 m/s")
      let numberFmt2: intl.NumberFormat = new intl.NumberFormat("zh-Hans-CN", options);
      let resultFmt2: string = numberFmt2.format(256);
      expect(resultFmt2).assertEqual("256 m/s")
    })

    /**
     * @tc.name   SUB_GLOBAL_numberFormat_0520
     * @tc.number SUB_GLOBAL_numberFormat_0520
     * @tc.desc   units Incoming meter-per-second
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_GLOBAL_numberFormat_0520', Level.LEVEL3, () => {
      let options: intl.NumberOptions = {
        style: 'unit',
        unit: 'meter-per-second',
        unitDisplay: 'long'
      }
      let numberFmt: intl.NumberFormat = new intl.NumberFormat('en-US', options);
      let resultFmt: string = numberFmt.format(10000);
      expect(resultFmt).assertEqual("10,000 meters per second")
      let numberFmt2: intl.NumberFormat = new intl.NumberFormat("zh-Hans-CN", options);
      let resultFmt2: string = numberFmt2.format(10000);
      expect(resultFmt2).assertEqual("每秒10,000米")
    })

    /**
     * @tc.name   SUB_GLOBAL_numberFormat_0530
     * @tc.number SUB_GLOBAL_numberFormat_0530
     * @tc.desc   units Incoming meter-per-second
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_numberFormat_0530', Level.LEVEL2, () => {
      let options: intl.NumberOptions = {
        style: 'unit',
        unit: 'meter-per-second',
        unitDisplay: 'long'
      }
      let numberFmt: intl.NumberFormat = new intl.NumberFormat('en-US', options);
      let resultFmt: string = numberFmt.format(0.1);
      expect(resultFmt).assertEqual("0.1 meters per second")
      let numberFmt2: intl.NumberFormat = new intl.NumberFormat("zh-Hans-CN", options);
      let resultFmt2: string = numberFmt2.format(0.1);
      expect(resultFmt2).assertEqual("每秒0.1米")
    })

    /**
     * @tc.name   SUB_GLOBAL_numberFormat_0540
     * @tc.number SUB_GLOBAL_numberFormat_0540
     * @tc.desc   units Incoming meter-per-second
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_GLOBAL_numberFormat_0540', Level.LEVEL3, () => {
      let options: intl.NumberOptions = {
        style: 'unit',
        unit: 'meter-per-second',
        unitDisplay: 'long'
      }
      let numberFmt: intl.NumberFormat = new intl.NumberFormat('en-US', options);
      let resultFmt: string = numberFmt.format(-1);
      expect(resultFmt).assertEqual("-1 meter per second")
      let numberFmt2: intl.NumberFormat = new intl.NumberFormat("zh-Hans-CN", options);
      let resultFmt2: string = numberFmt2.format(-1);
      expect(resultFmt2).assertEqual("每秒-1米")
    })

    /**
     * @tc.name   SUB_GLOBAL_numberFormat_0550
     * @tc.number SUB_GLOBAL_numberFormat_0550
     * @tc.desc   units Incoming milliliter-per-minute-per-kilogram
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_numberFormat_0550', Level.LEVEL2, () => {
      let options: intl.NumberOptions = {
        style: 'unit',
        unit: 'milliliter-per-minute-per-kilogram',
        unitDisplay: 'short'
      }
      let numberFmt: intl.NumberFormat = new intl.NumberFormat('en-US', options);
      let resultFmt: string = numberFmt.format(0);
      expect(resultFmt).assertEqual("0 ml/kg/min")
      let numberFmt2: intl.NumberFormat = new intl.NumberFormat("zh-Hans-CN", options);
      let resultFmt2: string = numberFmt2.format(0);
      expect(resultFmt2).assertEqual("0 ml/kg/min")
    })

    /**
     * @tc.name   SUB_GLOBAL_numberFormat_0560
     * @tc.number SUB_GLOBAL_numberFormat_0560
     * @tc.desc   units Incoming milliliter-per-minute-per-kilogram
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_numberFormat_0560', Level.LEVEL2, () => {
      let options: intl.NumberOptions = {
        style: 'unit',
        unit: 'milliliter-per-minute-per-kilogram',
        unitDisplay: 'short'
      }
      let numberFmt: intl.NumberFormat = new intl.NumberFormat('en-US', options);
      let resultFmt: string = numberFmt.format(1);
      expect(resultFmt).assertEqual("1 ml/kg/min")
      let numberFmt2: intl.NumberFormat = new intl.NumberFormat("zh-Hans-CN", options);
      let resultFmt2: string = numberFmt2.format(1);
      expect(resultFmt2).assertEqual("1 ml/kg/min")
    })

    /**
     * @tc.name   SUB_GLOBAL_numberFormat_0570
     * @tc.number SUB_GLOBAL_numberFormat_0570
     * @tc.desc   units Incoming milliliter-per-minute-per-kilogram
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_GLOBAL_numberFormat_0570', Level.LEVEL3, () => {
      let options: intl.NumberOptions = {
        style: 'unit',
        unit: 'milliliter-per-minute-per-kilogram',
        unitDisplay: 'short'
      }
      let numberFmt: intl.NumberFormat = new intl.NumberFormat('en-US', options);
      let resultFmt: string = numberFmt.format(256);
      expect(resultFmt).assertEqual("256 ml/kg/min")
      let numberFmt2: intl.NumberFormat = new intl.NumberFormat("zh-Hans-CN", options);
      let resultFmt2: string = numberFmt2.format(256);
      expect(resultFmt2).assertEqual("256 ml/kg/min")
    })

    /**
     * @tc.name   SUB_GLOBAL_numberFormat_0580
     * @tc.number SUB_GLOBAL_numberFormat_0580
     * @tc.desc   units Incoming milliliter-per-minute-per-kilogram
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_GLOBAL_numberFormat_0580', Level.LEVEL3, () => {
      let options: intl.NumberOptions = {
        style: 'unit',
        unit: 'milliliter-per-minute-per-kilogram',
        unitDisplay: 'long'
      }
      let numberFmt: intl.NumberFormat = new intl.NumberFormat('en-US', options);
      let resultFmt: string = numberFmt.format(10000);
      expect(resultFmt).assertEqual("10,000 ml/kg/min")
      let numberFmt2: intl.NumberFormat = new intl.NumberFormat("zh-Hans-CN", options);
      let resultFmt2: string = numberFmt2.format(10000);
      expect(resultFmt2).assertEqual("10,000 ml/kg/min")
    })

    /**
     * @tc.name   SUB_GLOBAL_numberFormat_0590
     * @tc.number SUB_GLOBAL_numberFormat_0590
     * @tc.desc   units Incoming milliliter-per-minute-per-kilogram
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_numberFormat_0590', Level.LEVEL2, () => {
      let options: intl.NumberOptions = {
        style: 'unit',
        unit: 'milliliter-per-minute-per-kilogram',
        unitDisplay: 'long'
      }
      let numberFmt: intl.NumberFormat = new intl.NumberFormat('en-US', options);
      let resultFmt: string = numberFmt.format(0.1);
      expect(resultFmt).assertEqual("0.1 ml/kg/min")
      let numberFmt2: intl.NumberFormat = new intl.NumberFormat("zh-Hans-CN", options);
      let resultFmt2: string = numberFmt2.format(0.1);
      expect(resultFmt2).assertEqual("0.1 ml/kg/min")
    })

    /**
     * @tc.name   SUB_GLOBAL_numberFormat_0600
     * @tc.number SUB_GLOBAL_numberFormat_0600
     * @tc.desc   units Incoming milliliter-per-minute-per-kilogram
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_GLOBAL_numberFormat_0600', Level.LEVEL3, () => {
      let options: intl.NumberOptions = {
        style: 'unit',
        unit: 'milliliter-per-minute-per-kilogram',
        unitDisplay: 'long'
      }
      let numberFmt: intl.NumberFormat = new intl.NumberFormat('en-US', options);
      let resultFmt: string = numberFmt.format(-1);
      expect(resultFmt).assertEqual("-1 ml/kg/min")
      let numberFmt2: intl.NumberFormat = new intl.NumberFormat("zh-Hans-CN", options);
      let resultFmt2: string = numberFmt2.format(-1);
      expect(resultFmt2).assertEqual("-1 ml/kg/min")
    })

    /**
     * @tc.name   SUB_GLOBAL_numberFormat_0610
     * @tc.number SUB_GLOBAL_numberFormat_0610
     * @tc.desc   units Incoming millimole-per-liter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_numberFormat_0610', Level.LEVEL2, () => {
      let options: intl.NumberOptions = {
        style: 'unit',
        unit: 'millimole-per-liter',
        unitDisplay: 'short'
      }
      let numberFmt: intl.NumberFormat = new intl.NumberFormat('en-US', options);
      let resultFmt: string = numberFmt.format(0);
      expect(resultFmt).assertEqual("0 mmol/L")
      let numberFmt2: intl.NumberFormat = new intl.NumberFormat("zh-Hans-CN", options);
      let resultFmt2: string = numberFmt2.format(0);
      expect(resultFmt2).assertEqual("0 mmol/L")
    })

    /**
     * @tc.name   SUB_GLOBAL_numberFormat_0620
     * @tc.number SUB_GLOBAL_numberFormat_0620
     * @tc.desc   units Incoming millimole-per-liter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_GLOBAL_numberFormat_0620', Level.LEVEL1, () => {
      let options: intl.NumberOptions = {
        style: 'unit',
        unit: 'millimole-per-liter',
        unitDisplay: 'short'
      }
      let numberFmt: intl.NumberFormat = new intl.NumberFormat('en-US', options);
      let resultFmt: string = numberFmt.format(1);
      expect(resultFmt).assertEqual("1 mmol/L")
      let numberFmt2: intl.NumberFormat = new intl.NumberFormat("zh-Hans-CN", options);
      let resultFmt2: string = numberFmt2.format(1);
      expect(resultFmt2).assertEqual("1 mmol/L")
    })

    /**
     * @tc.name   SUB_GLOBAL_numberFormat_0630
     * @tc.number SUB_GLOBAL_numberFormat_0630
     * @tc.desc   units Incoming millimole-per-liter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_GLOBAL_numberFormat_0630', Level.LEVEL3, () => {
      let options: intl.NumberOptions = {
        style: 'unit',
        unit: 'millimole-per-liter',
        unitDisplay: 'short'
      }
      let numberFmt: intl.NumberFormat = new intl.NumberFormat('en-US', options);
      let resultFmt: string = numberFmt.format(256);
      expect(resultFmt).assertEqual("256 mmol/L")
      let numberFmt2: intl.NumberFormat = new intl.NumberFormat("zh-Hans-CN", options);
      let resultFmt2: string = numberFmt2.format(256);
      expect(resultFmt2).assertEqual("256 mmol/L")
    })

    /**
     * @tc.name   SUB_GLOBAL_numberFormat_0640
     * @tc.number SUB_GLOBAL_numberFormat_0640
     * @tc.desc   units Incoming millimole-per-liter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_GLOBAL_numberFormat_0640', Level.LEVEL3, () => {
      let options: intl.NumberOptions = {
        style: 'unit',
        unit: 'millimole-per-liter',
        unitDisplay: 'long'
      }
      let numberFmt: intl.NumberFormat = new intl.NumberFormat('en-US', options);
      let resultFmt: string = numberFmt.format(10000);
      expect(resultFmt).assertEqual("10,000 millimoles per liter")
      let numberFmt2: intl.NumberFormat = new intl.NumberFormat("zh-Hans-CN", options);
      let resultFmt2: string = numberFmt2.format(10000);
      expect(resultFmt2).assertEqual("每升10,000毫摩尔")
    })

    /**
     * @tc.name   SUB_GLOBAL_numberFormat_0650
     * @tc.number SUB_GLOBAL_numberFormat_0650
     * @tc.desc   units Incoming millimole-per-liter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_numberFormat_0650', Level.LEVEL2, () => {
      let options: intl.NumberOptions = {
        style: 'unit',
        unit: 'millimole-per-liter',
        unitDisplay: 'long'
      }
      let numberFmt: intl.NumberFormat = new intl.NumberFormat('en-US', options);
      let resultFmt: string = numberFmt.format(0.1);
      expect(resultFmt).assertEqual("0.1 millimoles per liter")
      let numberFmt2: intl.NumberFormat = new intl.NumberFormat("zh-Hans-CN", options);
      let resultFmt2: string = numberFmt2.format(0.1);
      expect(resultFmt2).assertEqual("每升0.1毫摩尔")
    })

    /**
     * @tc.name   SUB_GLOBAL_numberFormat_0660
     * @tc.number SUB_GLOBAL_numberFormat_0660
     * @tc.desc   units Incoming millimole-per-liter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_GLOBAL_numberFormat_0660', Level.LEVEL3, () => {
      let options: intl.NumberOptions = {
        style: 'unit',
        unit: 'millimole-per-liter',
        unitDisplay: 'long'
      }
      let numberFmt: intl.NumberFormat = new intl.NumberFormat('en-US', options);
      let resultFmt: string = numberFmt.format(-1);
      expect(resultFmt).assertEqual("-1 millimole per liter")
      let numberFmt2: intl.NumberFormat = new intl.NumberFormat("zh-Hans-CN", options);
      let resultFmt2: string = numberFmt2.format(-1);
      expect(resultFmt2).assertEqual("每升-1毫摩尔")
    })

    /**
     * @tc.name   SUB_GLOBAL_numberFormat_0670
     * @tc.number SUB_GLOBAL_numberFormat_0670
     * @tc.desc   units Incoming step-per-minute
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_numberFormat_0670', Level.LEVEL2, () => {
      let options: intl.NumberOptions = {
        style: 'unit',
        unit: 'step-per-minute',
        unitDisplay: 'shot'
      }
      let numberFmt: intl.NumberFormat = new intl.NumberFormat('en-US', options);
      let resultFmt: string = numberFmt.format(0);
      expect(resultFmt).assertEqual("0 steps/min")
      let numberFmt2: intl.NumberFormat = new intl.NumberFormat("zh-Hans-CN", options);
      let resultFmt2: string = numberFmt2.format(0);
      expect(resultFmt2).assertEqual("0 步/分钟")
    })

    /**
     * @tc.name   SUB_GLOBAL_numberFormat_0680
     * @tc.number SUB_GLOBAL_numberFormat_0680
     * @tc.desc   units Incoming step-per-minute
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_GLOBAL_numberFormat_0680', Level.LEVEL1, () => {
      let options: intl.NumberOptions = {
        style: 'unit',
        unit: 'step-per-minute',
        unitDisplay: 'shot'
      }
      let numberFmt: intl.NumberFormat = new intl.NumberFormat('en-US', options);
      let resultFmt: string = numberFmt.format(1);
      expect(resultFmt).assertEqual("1 step/min")
      let numberFmt2: intl.NumberFormat = new intl.NumberFormat("zh-Hans-CN", options);
      let resultFmt2: string = numberFmt2.format(1);
      expect(resultFmt2).assertEqual("1 步/分钟")
    })

    /**
     * @tc.name   SUB_GLOBAL_numberFormat_0690
     * @tc.number SUB_GLOBAL_numberFormat_0690
     * @tc.desc   units Incoming step-per-minute
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_GLOBAL_numberFormat_0690', Level.LEVEL3, () => {
      let options: intl.NumberOptions = {
        style: 'unit',
        unit: 'step-per-minute',
        unitDisplay: 'shot'
      }
      let numberFmt: intl.NumberFormat = new intl.NumberFormat('en-US', options);
      let resultFmt: string = numberFmt.format(256);
      expect(resultFmt).assertEqual("256 steps/min")
      let numberFmt2: intl.NumberFormat = new intl.NumberFormat("zh-Hans-CN", options);
      let resultFmt2: string = numberFmt2.format(256);
      expect(resultFmt2).assertEqual("256 步/分钟")
    })

    /**
     * @tc.name   SUB_GLOBAL_numberFormat_0700
     * @tc.number SUB_GLOBAL_numberFormat_0700
     * @tc.desc   units Incoming step-per-minute
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_GLOBAL_numberFormat_0700', Level.LEVEL3, () => {
      let options: intl.NumberOptions = {
        style: 'unit',
        unit: 'step-per-minute',
        unitDisplay: 'long'
      }
      let numberFmt: intl.NumberFormat = new intl.NumberFormat('en-US', options);
      let resultFmt: string = numberFmt.format(10000);
      expect(resultFmt).assertEqual("10,000 steps/min")
      let numberFmt2: intl.NumberFormat = new intl.NumberFormat("zh-Hans-CN", options);
      let resultFmt2: string = numberFmt2.format(10000);
      expect(resultFmt2).assertEqual("10,000 步/分钟")
    })

    /**
     * @tc.name   SUB_GLOBAL_numberFormat_0710
     * @tc.number SUB_GLOBAL_numberFormat_0710
     * @tc.desc   units Incoming step-per-minute
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_numberFormat_0710', Level.LEVEL2, () => {
      let options: intl.NumberOptions = {
        style: 'unit',
        unit: 'step-per-minute',
        unitDisplay: 'long'
      }
      let numberFmt: intl.NumberFormat = new intl.NumberFormat('en-US', options);
      let resultFmt: string = numberFmt.format(0.1);
      expect(resultFmt).assertEqual("0.1 steps/min")
      let numberFmt2: intl.NumberFormat = new intl.NumberFormat("zh-Hans-CN", options);
      let resultFmt2: string = numberFmt2.format(0.1);
      expect(resultFmt2).assertEqual("0.1 步/分钟")
    })

    /**
     * @tc.name   SUB_GLOBAL_numberFormat_0720
     * @tc.number SUB_GLOBAL_numberFormat_0720
     * @tc.desc   units Incoming step-per-minute
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_GLOBAL_numberFormat_0720', Level.LEVEL3, () => {
      let options: intl.NumberOptions = {
        style: 'unit',
        unit: 'step-per-minute',
        unitDisplay: 'long'
      }
      let numberFmt: intl.NumberFormat = new intl.NumberFormat('en-US', options);
      let resultFmt: string = numberFmt.format(-1);
      expect(resultFmt).assertEqual("-1 step/min")
      let numberFmt2: intl.NumberFormat = new intl.NumberFormat("zh-Hans-CN", options);
      let resultFmt2: string = numberFmt2.format(-1);
      expect(resultFmt2).assertEqual("-1 步/分钟")
    })

    /**
     * @tc.name   SUB_GLOBAL_numberFormat_0730
     * @tc.number SUB_GLOBAL_numberFormat_0730
     * @tc.desc   units Incoming stroke-per-minute
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_numberFormat_0730', Level.LEVEL2, () => {
      let options: intl.NumberOptions = {
        style: 'unit',
        unit: 'stroke-per-minute',
        unitDisplay: 'shot'
      }
      let numberFmt: intl.NumberFormat = new intl.NumberFormat('en-US', options);
      let resultFmt: string = numberFmt.format(0);
      expect(resultFmt).assertEqual("0 strokes/min")
      let numberFmt2: intl.NumberFormat = new intl.NumberFormat("zh-Hans-CN", options);
      let resultFmt2: string = numberFmt2.format(0);
      expect(resultFmt2).assertEqual("0 次/分钟")
    })

    /**
     * @tc.name   SUB_GLOBAL_numberFormat_0740
     * @tc.number SUB_GLOBAL_numberFormat_0740
     * @tc.desc   units Incoming stroke-per-minute
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_GLOBAL_numberFormat_0740', Level.LEVEL1, () => {
      let options: intl.NumberOptions = {
        style: 'unit',
        unit: 'stroke-per-minute',
        unitDisplay: 'shot'
      }
      let numberFmt: intl.NumberFormat = new intl.NumberFormat('en-US', options);
      let resultFmt: string = numberFmt.format(1);
      expect(resultFmt).assertEqual("1 stroke/min")
      let numberFmt2: intl.NumberFormat = new intl.NumberFormat("zh-Hans-CN", options);
      let resultFmt2: string = numberFmt2.format(1);
      expect(resultFmt2).assertEqual("1 次/分钟")
    })

    /**
     * @tc.name   SUB_GLOBAL_numberFormat_0750
     * @tc.number SUB_GLOBAL_numberFormat_0750
     * @tc.desc   units Incoming stroke-per-minute
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_GLOBAL_numberFormat_0750', Level.LEVEL3, () => {
      let options: intl.NumberOptions = {
        style: 'unit',
        unit: 'stroke-per-minute',
        unitDisplay: 'shot'
      }
      let numberFmt: intl.NumberFormat = new intl.NumberFormat('en-US', options);
      let resultFmt: string = numberFmt.format(256);
      expect(resultFmt).assertEqual("256 strokes/min")
      let numberFmt2: intl.NumberFormat = new intl.NumberFormat("zh-Hans-CN", options);
      let resultFmt2: string = numberFmt2.format(256);
      expect(resultFmt2).assertEqual("256 次/分钟")
    })

    /**
     * @tc.name   SUB_GLOBAL_numberFormat_0760
     * @tc.number SUB_GLOBAL_numberFormat_0760
     * @tc.desc   units Incoming stroke-per-minute
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_GLOBAL_numberFormat_0760', Level.LEVEL3, () => {
      let options: intl.NumberOptions = {
        style: 'unit',
        unit: 'stroke-per-minute',
        unitDisplay: 'long'
      }
      let numberFmt: intl.NumberFormat = new intl.NumberFormat('en-US', options);
      let resultFmt: string = numberFmt.format(10000);
      expect(resultFmt).assertEqual("10,000 strokes/min")
      let numberFmt2: intl.NumberFormat = new intl.NumberFormat("zh-Hans-CN", options);
      let resultFmt2: string = numberFmt2.format(10000);
      expect(resultFmt2).assertEqual("10,000 次/分钟")
    })

    /**
     * @tc.name   SUB_GLOBAL_numberFormat_0770
     * @tc.number SUB_GLOBAL_numberFormat_0770
     * @tc.desc   units Incoming stroke-per-minute
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_numberFormat_0770', Level.LEVEL2, () => {
      let options: intl.NumberOptions = {
        style: 'unit',
        unit: 'stroke-per-minute',
        unitDisplay: 'long'
      }
      let numberFmt: intl.NumberFormat = new intl.NumberFormat('en-US', options);
      let resultFmt: string = numberFmt.format(0.1);
      expect(resultFmt).assertEqual("0.1 strokes/min")
      let numberFmt2: intl.NumberFormat = new intl.NumberFormat("zh-Hans-CN", options);
      let resultFmt2: string = numberFmt2.format(0.1);
      expect(resultFmt2).assertEqual("0.1 次/分钟")
    })

    /**
     * @tc.name   SUB_GLOBAL_numberFormat_0780
     * @tc.number SUB_GLOBAL_numberFormat_0780
     * @tc.desc   units Incoming stroke-per-minute
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_GLOBAL_numberFormat_0780', Level.LEVEL3, () => {
      let options: intl.NumberOptions = {
        style: 'unit',
        unit: 'stroke-per-minute',
        unitDisplay: 'long'
      }
      let numberFmt: intl.NumberFormat = new intl.NumberFormat('en-US', options);
      let resultFmt: string = numberFmt.format(-1);
      expect(resultFmt).assertEqual("-1 stroke/min")
      let numberFmt2: intl.NumberFormat = new intl.NumberFormat("zh-Hans-CN", options);
      let resultFmt2: string = numberFmt2.format(-1);
      expect(resultFmt2).assertEqual("-1 次/分钟")
    })

    /**
     * @tc.name   SUB_GLOBAL_numberFormat_0790
     * @tc.number SUB_GLOBAL_numberFormat_0790
     * @tc.desc   units Incoming foot-per-hour
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_numberFormat_0790', Level.LEVEL2, () => {
      let options: intl.NumberOptions = {
        style: 'unit',
        unit: 'foot-per-hour',
        unitDisplay: 'short'
      }
      let numberFmt: intl.NumberFormat = new intl.NumberFormat('en-US', options);
      let resultFmt: string = numberFmt.format(0);
      expect(resultFmt).assertEqual("0 ft/h")
      let numberFmt2: intl.NumberFormat = new intl.NumberFormat("zh-Hans-CN", options);
      let resultFmt2: string = numberFmt2.format(0);
      expect(resultFmt2).assertEqual("0 英尺/小时")
    })

    /**
     * @tc.name   SUB_GLOBAL_numberFormat_0800
     * @tc.number SUB_GLOBAL_numberFormat_0800
     * @tc.desc   units Incoming foot-per-hour
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_GLOBAL_numberFormat_0800', Level.LEVEL1, () => {
      let options: intl.NumberOptions = {
        style: 'unit',
        unit: 'foot-per-hour',
        unitDisplay: 'short'
      }
      let numberFmt: intl.NumberFormat = new intl.NumberFormat('en-US', options);
      let resultFmt: string = numberFmt.format(1);
      expect(resultFmt).assertEqual("1 ft/h")
      let numberFmt2: intl.NumberFormat = new intl.NumberFormat("zh-Hans-CN", options);
      let resultFmt2: string = numberFmt2.format(1);
      expect(resultFmt2).assertEqual("1 英尺/小时")
    })

    /**
     * @tc.name   SUB_GLOBAL_numberFormat_0810
     * @tc.number SUB_GLOBAL_numberFormat_0810
     * @tc.desc   units Incoming foot-per-hour
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_GLOBAL_numberFormat_0810', Level.LEVEL3, () => {
      let options: intl.NumberOptions = {
        style: 'unit',
        unit: 'foot-per-hour',
        unitDisplay: 'short'
      }
      let numberFmt: intl.NumberFormat = new intl.NumberFormat('en-US', options);
      let resultFmt: string = numberFmt.format(256);
      expect(resultFmt).assertEqual("256 ft/h")
      let numberFmt2: intl.NumberFormat = new intl.NumberFormat("zh-Hans-CN", options);
      let resultFmt2: string = numberFmt2.format(256);
      expect(resultFmt2).assertEqual("256 英尺/小时")
    })

    /**
     * @tc.name   SUB_GLOBAL_numberFormat_0820
     * @tc.number SUB_GLOBAL_numberFormat_0820
     * @tc.desc   units Incoming foot-per-hour
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_GLOBAL_numberFormat_0820', Level.LEVEL3, () => {
      let options: intl.NumberOptions = {
        style: 'unit',
        unit: 'foot-per-hour',
        unitDisplay: 'long'
      }
      let numberFmt: intl.NumberFormat = new intl.NumberFormat('en-US', options);
      let resultFmt: string = numberFmt.format(10000);
      expect(resultFmt).assertEqual("10,000 ft/h")
      let numberFmt2: intl.NumberFormat = new intl.NumberFormat("zh-Hans-CN", options);
      let resultFmt2: string = numberFmt2.format(10000);
      expect(resultFmt2).assertEqual("10,000 英尺/小时")
    })

    /**
     * @tc.name   SUB_GLOBAL_numberFormat_0830
     * @tc.number SUB_GLOBAL_numberFormat_0830
     * @tc.desc   units Incoming foot-per-hour
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_numberFormat_0830', Level.LEVEL2, () => {
      let options: intl.NumberOptions = {
        style: 'unit',
        unit: 'foot-per-hour',
        unitDisplay: 'long'
      }
      let numberFmt: intl.NumberFormat = new intl.NumberFormat('en-US', options);
      let resultFmt: string = numberFmt.format(0.1);
      expect(resultFmt).assertEqual("0.1 ft/h")
      let numberFmt2: intl.NumberFormat = new intl.NumberFormat("zh-Hans-CN", options);
      let resultFmt2: string = numberFmt2.format(0.1);
      expect(resultFmt2).assertEqual("0.1 英尺/小时")
    })

    /**
     * @tc.name   SUB_GLOBAL_numberFormat_0840
     * @tc.number SUB_GLOBAL_numberFormat_0840
     * @tc.desc   units Incoming foot-per-hour
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_GLOBAL_numberFormat_0840', Level.LEVEL3, () => {
      let options: intl.NumberOptions = {
        style: 'unit',
        unit: 'foot-per-hour',
        unitDisplay: 'long'
      }
      let numberFmt: intl.NumberFormat = new intl.NumberFormat('en-US', options);
      let resultFmt: string = numberFmt.format(-1);
      expect(resultFmt).assertEqual("-1 ft/h")
      let numberFmt2: intl.NumberFormat = new intl.NumberFormat("zh-Hans-CN", options);
      let resultFmt2: string = numberFmt2.format(-1);
      expect(resultFmt2).assertEqual("-1 英尺/小时")
    })

    console.log('*************end FivePointOne_i18nStageTest*************');
  })
}