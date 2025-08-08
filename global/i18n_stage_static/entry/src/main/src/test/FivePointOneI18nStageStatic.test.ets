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
import { TextStyle, StyledString } from 'arkui.component.styledString'
import { Color, FontStyle, FontWeight } from 'arkui.component.enums'

let domain: number = 0x0000;
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
     * @tc.number   : SUB_GLOBAL_refinedFormat_static_0160
     * @tc.name     : SUB_GLOBAL_refinedFormat_static_0160
     * @tc.desc     : begin code same as stop code
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 2
     */
    it('SUB_GLOBAL_refinedFormat_static_0160', Level.LEVEL2, async (): Promise<void> => {
      let numFormat: intl.NumberFormat = new intl.NumberFormat("zh-hans-CN");
      let formattedRange: string = numFormat.formatRange(0, 0);
      expect(formattedRange == "~0").assertTrue();
    })

    /**
     * @tc.number   : SUB_GLOBAL_refinedFormat_static_0170
     * @tc.name     : SUB_GLOBAL_refinedFormat_static_0170
     * @tc.desc     : normally (begin code & stop code)
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 2
     */
    it('SUB_GLOBAL_refinedFormat_static_0170', Level.LEVEL2, async (): Promise<void> => {
      let numFormat: intl.NumberFormat = new intl.NumberFormat("zh-hans-CN");
      let formattedRange: string = numFormat.formatRange(0, 9);
      expect(formattedRange == "0-9").assertTrue();
    })

    /**
     * @tc.number   : SUB_GLOBAL_refinedFormat_static_0180
     * @tc.name     : SUB_GLOBAL_refinedFormat_static_0180
     * @tc.desc     : begin code with negative ,stop code with decimal
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 2
     */
    it('SUB_GLOBAL_refinedFormat_static_0180', Level.LEVEL2, async (): Promise<void> => {
      let numFormat = new intl.NumberFormat("zh-hans-CN");
      let formattedRange: string = numFormat.formatRange(-9, 9.9);
      expect(formattedRange == "-9 - 9.9").assertTrue();
    })

    /**
     * @tc.number   : SUB_GLOBAL_refinedFormat_static_0190
     * @tc.name     : SUB_GLOBAL_refinedFormat_static_0190
     * @tc.desc     : begin code large than stop code
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 0
     */
    it('SUB_GLOBAL_refinedFormat_static_0190', Level.LEVEL0, async (): Promise<void> => {
      let numFormat = new intl.NumberFormat("zh-hans-CN");
      let formattedRange: string = numFormat.formatRange(9, 0);
      expect(formattedRange == "").assertTrue();
    })
    
    /**
     * @tc.number   : SUB_GLOBAL_I18N_getTemperatureName_static_0100
     * @tc.name     : I18N_test_getTemperatureName_static_0100
     * @tc.desc     : i18n.TemperatureType.CELSIUS
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 0
     */
    it('I18N_test_getTemperatureName_static_0100', Level.LEVEL0, async (): Promise<void> => {
      let type = i18n.System.getTemperatureName(i18n.TemperatureType.CELSIUS);
      console.log('I18N_test_getTemperatureName_static_0100:' + type);
      expect(type).assertEqual('celsius');
    })

    /**
     * @tc.number   : SUB_GLOBAL_I18N_getTemperatureName_static_0200
     * @tc.name     : I18N_test_getTemperatureName_static_0200
     * @tc.desc     : i18n.TemperatureType.FAHRENHEIT
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 2
     */
    it('I18N_test_getTemperatureName_static_0200', Level.LEVEL2, async (): Promise<void> => {
      let type = i18n.System.getTemperatureName(i18n.TemperatureType.FAHRENHEIT);
      console.log('I18N_test_getTemperatureName_static_0200:' + type);
      expect(type).assertEqual('fahrenheit');
    })

    /**
     * @tc.number   : SUB_GLOBAL_I18N_getTemperatureName_static_0300
     * @tc.name     : I18N_test_getTemperatureName_static_0300
     * @tc.desc     : i18n.TemperatureType.KELVIN
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 2
     */
    it('I18N_test_getTemperatureName_static_0300', Level.LEVEL2, async (): Promise<void> => {
      let type = i18n.System.getTemperatureName(i18n.TemperatureType.KELVIN);
      console.log('I18N_test_getTemperatureName_static_0300:' + type);
      expect(type).assertEqual('kelvin');
    })

    /**
     * @tc.number   : SUB_GLOBAL_I18N_getTemperatureName_static_0400
     * @tc.name     : I18N_test_getTemperatureName_static_0400
     * @tc.desc     : input number zero
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('I18N_test_getTemperatureName_static_0400', Level.LEVEL3, async (): Promise<void> => {
      try {
        i18n.System.getTemperatureName(i18n.TemperatureType.KELVIN);
      } catch (e: BusinessError) {
        console.log('I18N_test_getTemperatureName_static_0400 code&message:' + e.code + e.message);
        expect(e.code).assertEqual('890001');
      }
    })

    /**
     * @tc.number   : SUB_GLOBAL_I18N_getSimplifiedLanguage_static_01_static_0100
     * @tc.name     : I18N_test_getSimplifiedLanguage_static_01_static_0100
     * @tc.desc     : en-GB & en-Latn-US
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 0
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
     * @tc.number   : SUB_GLOBAL_I18N_getSimplifiedLanguage_static_01_static_0200
     * @tc.name     : I18N_test_getSimplifiedLanguage_static_01_static_0200
     * @tc.desc     : zh-Hant-HK & zh-Hant-TW
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 2
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
     * @tc.number   : SUB_GLOBAL_I18N_getSimplifiedLanguage_static_01_static_0300
     * @tc.name     : I18N_test_getSimplifiedLanguage_static_01_static_0300
     * @tc.desc     : es-ES & es-US
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 2
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
     * @tc.number   : SUB_GLOBAL_I18N_getSimplifiedLanguage_static_01_static_0400
     * @tc.name     : I18N_test_getSimplifiedLanguage_static_01_static_0400
     * @tc.desc     : pt-PT & pt-BR
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 2
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
     * @tc.number   : SUB_GLOBAL_I18N_getSimplifiedLanguage_static_01_static_0500
     * @tc.name     : I18N_test_getSimplifiedLanguage_static_01_static_0500
     * @tc.desc     : en-CN & en-Test
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 2
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
     * @tc.number   : SUB_GLOBAL_I18N_getSimplifiedLanguage_static_01_static_0600
     * @tc.name     : I18N_test_getSimplifiedLanguage_static_01_static_0600
     * @tc.desc     : zh-Hant-CN & zh-Hant-Test
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 2
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
     * @tc.number   : SUB_GLOBAL_I18N_getSimplifiedLanguage_static_01_static_0700
     * @tc.name     : I18N_test_getSimplifiedLanguage_static_01_static_0700
     * @tc.desc     : es-CN & es-Test
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 2
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
     * @tc.number   : SUB_GLOBAL_I18N_getSimplifiedLanguage_static_01_static_0800
     * @tc.name     : I18N_test_getSimplifiedLanguage_static_01_static_0800
     * @tc.desc     : pt-CN & pt-Test
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 2
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
     * @tc.number   : SUB_GLOBAL_I18N_getSimplifiedLanguage_static_01_static_0900
     * @tc.name     : I18N_test_getSimplifiedLanguage_static_01_static_0900
     * @tc.desc     : bo-CN & bo-Test & bo-Test
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 2
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
     * @tc.number   : SUB_GLOBAL_I18N_getSimplifiedLanguage_static_01_static_1000
     * @tc.name     : I18N_test_getSimplifiedLanguage_static_01_static_1000
     * @tc.desc     : pt-CN & pt-Test
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
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
     * @tc.number   : SUB_GLOBAL_refinedFormat_static_0310
     * @tc.name     : SUB_GLOBAL_refinedFormat_static_0310
     * @tc.desc     : maximumFractionDigits: 2 & maximumSignificantDigits: 6 & roundingPriority: "lessPrecision"
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 2
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
     * @tc.number   : SUB_GLOBAL_refinedFormat_static_0320
     * @tc.name     : SUB_GLOBAL_refinedFormat_static_0320
     * @tc.desc     : maximumFractionDigits: 2 & roundingIncrement: 1
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 2
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
     * @tc.number   : SUB_GLOBAL_refinedFormat_static_0630
     * @tc.name     : SUB_GLOBAL_refinedFormat_static_0630
     * @tc.desc     : roundingMode: "halfExpand" & maximumSignificantDigits: 5
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 2
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
     * @tc.number   : I18N_test_getSimplifiedLanguage_static_01_static_1010
     * @tc.name     : I18N_test_getSimplifiedLanguage_static_01_static_1010
     * @tc.desc     : no param
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 2
     */
    it('I18N_test_getSimplifiedLanguage_static_01_static_1010', Level.LEVEL2, async (): Promise<void> => {
      let type_one = i18n.System.getSimplifiedLanguage();
      console.log('I18N_test_getSimplifiedLanguage_static_01_static_1010 type_one:' + type_one);
      expect(type_one != null).assertTrue();
    })

    /**
     * @tc.number   : I18N_test_getTemperatureType_static_0100
     * @tc.name     : I18N_test_getTemperatureType_static_0100
     * @tc.desc     : no param
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 2
     */
    it('I18N_test_getTemperatureType_static_0100', Level.LEVEL2, async (): Promise<void> => {
      let type: i18n.TemperatureType = i18n.System.getTemperatureType();
      console.log('I18N_test_getTemperatureType_static_0100 type_one:' + type);
      expect(type != null).assertTrue();
    })

    /**
     * @tc.number   : I18N_test_getFirstDayOfWeek_static_0100
     * @tc.name     : I18N_test_getFirstDayOfWeek_static_0100
     * @tc.desc     : no param
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 2
     */
    it('I18N_test_getFirstDayOfWeek_static_0100', Level.LEVEL2, async (): Promise<void> => {
      let type = i18n.System.getFirstDayOfWeek();
      console.log('I18N_test_getFirstDayOfWeek_static_0100 type_one:' + type);
      expect(type != null).assertTrue();
    })

    console.log('*************end FivePointOne_i18nStageTest*************');
  })
}