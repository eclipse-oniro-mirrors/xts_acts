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

let domain: int = 0x0000;
let tag: string = 'testTag';

export default function I18NTest() {

  describe("I18nUtilInI18nTest", (): void => {
    hilog.info(0x0000, 'testTag', '%{public}s', '*************start I18nUtilInI18nTest*************');

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
     * @tc.name   i18n_i18nutil_test_static_0100
     * @tc.number SUB_GLOBAL_I18N_I18NUTIL_JS_static_0100
     * @tc.desc   test unitConvert interface from cup to liter unit with long style
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('i18n_i18nutil_test_static_0100', Level.LEVEL0, async (): Promise<void> => {
      console.log('i18n_i18nutil_test_static_0100 ' + 'start');
      let value = i18n.I18NUtil.unitConvert({
        unit: 'cup', measureSystem: 'US'
      },
        {
          unit: 'liter', measureSystem: 'SI'
        },
        1000,
        'en-US',
        'long');
      console.log('i18n_i18nutil_test_static_0100 ' + value);
      expect(value).assertEqual('236.588 liters');
    })

    /**
     * @tc.name   i18n_i18nutil_test_static_0200
     * @tc.number SUB_GLOBAL_I18N_I18NUTIL_JS_static_0200
     * @tc.desc   test unitConvert interface from cup to liter unit with undefined style
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('i18n_i18nutil_test_static_0200', Level.LEVEL2, async (): Promise<void> => {
      console.log('i18n_i18nutil_test_static_0200 ' + 'start');
      let value = i18n.I18NUtil.unitConvert({
        unit: 'cup', measureSystem: 'US'
      },
        {
          unit: 'liter', measureSystem: 'SI'
        },
        1000,
        'en-US',
        undefined);
      console.log('i18n_i18nutil_test_static_0200 ' + value);
      let devType = deviceInfo.deviceType;
      if (devType == '2in1') {
        expect(value).assertEqual('236.588 liters');
      } else if (devType == 'phone') {
        expect(value).assertEqual('236.588 L');
      }
    })

    /**
     * @tc.name   i18n_i18nutil_test_static_0300
     * @tc.number SUB_GLOBAL_I18N_I18NUTIL_JS_static_0300
     * @tc.desc   test unitConvert interface from cup to liter unit with null style
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('i18n_i18nutil_test_static_0300', Level.LEVEL2, async (): Promise<void> => {
      console.log('i18n_i18nutil_test_static_0300 ' + 'start');
      let value = i18n.I18NUtil.unitConvert({
        unit: 'cup', measureSystem: 'US'
      },
        {
          unit: 'liter', measureSystem: 'SI'
        },
        1000,
        'en-US');
      console.log('i18n_i18nutil_test_static_0300 ' + value);
      let devType = deviceInfo.deviceType;
      if (devType == '2in1') {
        expect(value).assertEqual('236.588 liters');
      } else if (devType == 'phone') {
        expect(value).assertEqual('236.588 L');
      }
    })

    /**
     * @tc.name   i18n_i18nutil_test_static_0400
     * @tc.number SUB_GLOBAL_I18N_I18NUTIL_JS_static_0400
     * @tc.desc   test unitConvert interface from cup to liter unit with medium style
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('i18n_i18nutil_test_static_0400', Level.LEVEL2, async (): Promise<void> => {
      console.log('i18n_i18nutil_test_static_0400 ' + 'start');
      let value = i18n.I18NUtil.unitConvert({
        unit: 'cup', measureSystem: 'US'
      },
        {
          unit: 'liter', measureSystem: 'SI'
        },
        1000,
        'en-US',
        'medium');
      console.log('i18n_i18nutil_test_static_0400 ' + value);
      let devType = deviceInfo.deviceType;
      if (devType == '2in1') {
        expect(value).assertEqual('236.588 liters');
      } else if (devType == 'phone') {
        expect(value).assertEqual('236.588 L');
      }
    })

    /**
     * @tc.name   i18n_i18nutil_test_static_0500
     * @tc.number SUB_GLOBAL_I18N_I18NUTIL_JS_static_0500
     * @tc.desc   test unitConvert interface from cup to liter unit with narrow style
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('i18n_i18nutil_test_static_0500', Level.LEVEL2, async (): Promise<void> => {
      console.log('i18n_i18nutil_test_static_0500 ' + 'start');
      let value = i18n.I18NUtil.unitConvert({
        unit: 'cup', measureSystem: 'US'
      },
        {
          unit: 'liter', measureSystem: 'SI'
        },
        1000,
        'en-US',
        'narrow');
      console.log('i18n_i18nutil_test_static_0500 ' + value);
      expect(value).assertEqual('236.588L');
    })

    /**
     * @tc.name   i18n_i18nutil_test_static_0600
     * @tc.number SUB_GLOBAL_I18N_I18NUTIL_JS_static_0600
     * @tc.desc   test unitConvert interface from cup to liter unit with short style
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('i18n_i18nutil_test_static_0600', Level.LEVEL2, async (): Promise<void> => {
      console.log('i18n_i18nutil_test_static_0600 ' + 'start');
      let value = i18n.I18NUtil.unitConvert({
        unit: 'cup', measureSystem: 'US'
      },
        {
          unit: 'liter', measureSystem: 'SI'
        },
        1000,
        'en-US',
        'short');
      console.log('i18n_i18nutil_test_static_0600 ' + value);
      expect(value).assertEqual('236.588 L');
    })

    /**
     * @tc.name   i18n_i18nutil_test_static_0700
     * @tc.number SUB_GLOBAL_I18N_I18NUTIL_JS_static_0700
     * @tc.desc   test unitConvert interface from meter to mile unit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('i18n_i18nutil_test_static_0700', Level.LEVEL2, async (): Promise<void> => {
      console.log('i18n_i18nutil_test_static_0700 ' + 'start');
      let value = i18n.I18NUtil.unitConvert({
        unit: 'meter', measureSystem: 'SI'
      },
        {
          unit: 'mile', measureSystem: 'SI'
        },
        1000,
        'zh-CN',
        'long');
      console.log('i18n_i18nutil_test_static_0700 ' + value);
      expect(value).assertEqual('0.621英里');
    })

    /**
     * @tc.name   i18n_i18nutil_test_static_0800
     * @tc.number SUB_GLOBAL_I18N_I18NUTIL_JS_static_0800
     * @tc.desc   test unitConvert interface from hour to second unit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('i18n_i18nutil_test_static_0800', Level.LEVEL2, async (): Promise<void> => {
      console.log('i18n_i18nutil_test_static_0800 ' + 'start');
      let value = i18n.I18NUtil.unitConvert({
        unit: 'hour', measureSystem: 'SI'
      },
        {
          unit: 'second', measureSystem: 'SI'
        },
        10,
        'zh-CN',
        'medium');
      console.log('i18n_i18nutil_test_static_0800 ' + value);
      let devType = deviceInfo.deviceType;
      if (devType == '2in1') {
        expect(value).assertEqual('36,000秒钟');
      } else if (devType == 'phone') {
        expect(value).assertEqual('36,000秒');
      }
    })

    /**
     * @tc.name   i18n_i18nutil_test_static_0900
     * @tc.number SUB_GLOBAL_I18N_I18NUTIL_JS_static_0900
     * @tc.desc   test unitConvert interface from celsius to fahrenheit unit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('i18n_i18nutil_test_static_0900', Level.LEVEL2, async (): Promise<void> => {
      console.log('i18n_i18nutil_test_static_0900 ' + 'start');
      let value = i18n.I18NUtil.unitConvert({
        unit: 'celsius', measureSystem: 'SI'
      },
        {
          unit: 'fahrenheit', measureSystem: 'SI'
        },
        1000,
        'zh-CN',
        'short');
      console.log('i18n_i18nutil_test_static_0900 ' + value);
      expect(value).assertEqual('1,832°F');
    })

    /**
     * @tc.name   i18n_i18nutil_test_static_1000
     * @tc.number SUB_GLOBAL_I18N_I18NUTIL_JS_static_1000
     * @tc.desc   test unitConvert interface from acre to hectare unit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('i18n_i18nutil_test_static_1000', Level.LEVEL2, async (): Promise<void> => {
      console.log('i18n_i18nutil_test_static_1000 ' + 'start');
      let value = i18n.I18NUtil.unitConvert({
        unit: 'acre', measureSystem: 'SI'
      },
        {
          unit: 'hectare', measureSystem: 'SI'
        },
        1000,
        'zh-CN',
        'long');
      console.log('i18n_i18nutil_test_static_1000 ' + value);
      expect(value).assertEqual('404.686公顷');
    })

    /**
     * @tc.name   i18n_i18nutil_test_static_1100
     * @tc.number SUB_GLOBAL_I18N_I18NUTIL_JS_static_1100
     * @tc.desc   test unitConvert interface from acre to square-meter unit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('i18n_i18nutil_test_static_1100', Level.LEVEL2, async (): Promise<void> => {
      console.log('i18n_i18nutil_test_static_1100 ' + 'start');
      let value = i18n.I18NUtil.unitConvert({
        unit: 'acre', measureSystem: 'SI'
      },
        {
          unit: 'square-meter', measureSystem: 'SI'
        },
        1000,
        'zh-CN',
        'long');
      console.log('i18n_i18nutil_test_static_1100 ' + value);
      expect(value).assertEqual('4,046,856.422平方米');
    })

    /**
     * @tc.name   i18n_i18nutil_test_static_1200
     * @tc.number SUB_GLOBAL_I18N_I18NUTIL_JS_static_1200
     * @tc.desc   test unitConvert interface from kilometer-per-hour to knot unit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('i18n_i18nutil_test_static_1200', Level.LEVEL2, async (): Promise<void> => {
      console.log('i18n_i18nutil_test_static_1200 ' + 'start');
      let value = i18n.I18NUtil.unitConvert({
        unit: 'kilometer-per-hour', measureSystem: 'SI'
      },
        {
          unit: 'knot', measureSystem: 'SI'
        },
        1000,
        'zh-CN',
        'long');
      console.log('i18n_i18nutil_test_static_1200 ' + value);
      expect(value).assertEqual('539.957节');
    })

    /**
     * @tc.name   i18n_i18nutil_test_static_1300
     * @tc.number SUB_GLOBAL_I18N_I18NUTIL_JS_static_1300
     * @tc.desc   test unitConvert interface from kilometer-per-hour to meter-per-second unit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('i18n_i18nutil_test_static_1300', Level.LEVEL2, async (): Promise<void> => {
      console.log('i18n_i18nutil_test_static_1300 ' + 'start');
      let value = i18n.I18NUtil.unitConvert({
        unit: 'kilometer-per-hour', measureSystem: 'SI'
      },
        {
          unit: 'meter-per-second', measureSystem: 'SI'
        },
        1000,
        'zh-CN',
        'long');
      console.log('i18n_i18nutil_test_static_1300 ' + value);
      expect(value).assertEqual('每秒277.778米');
    })

    /**
     * @tc.name   i18n_i18nutil_test_static_1400
     * @tc.number SUB_GLOBAL_I18N_I18NUTIL_JS_static_1400
     * @tc.desc   test unitConvert interface from meter to kilometer unit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('i18n_i18nutil_test_static_1400', Level.LEVEL2, async (): Promise<void> => {
      console.log('i18n_i18nutil_test_static_1400 ' + 'start');
      let value = i18n.I18NUtil.unitConvert({
        unit: 'meter', measureSystem: 'SI'
      },
        {
          unit: 'kilometer', measureSystem: 'SI'
        },
        1000,
        'zh-CN',
        'long');
      console.log('i18n_i18nutil_test_static_1400 ' + value);
      expect(value).assertEqual('1公里');
    })

    /**
     * @tc.name   i18n_i18nutil_test_static_1500
     * @tc.number SUB_GLOBAL_I18N_I18NUTIL_JS_static_1500
     * @tc.desc   test unitConvert interface from meter to meter-per-second unit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('i18n_i18nutil_test_static_1500', Level.LEVEL2, async (): Promise<void> => {
      console.log('i18n_i18nutil_test_static_1500 ' + 'start');
      let value = i18n.I18NUtil.unitConvert({
        unit: 'meter', measureSystem: 'SI'
      },
        {
          unit: 'meter-per-second', measureSystem: 'SI'
        },
        1000,
        'zh-CN',
        'long');
      console.log('i18n_i18nutil_test_static_1500 ' + value);
      expect(value).assertEqual('1,000米');
    })
    
    /**
     * @tc.name   i18n_i18nutil_test_staic_1600
     * @tc.number i18n_i18nutil_test_staic_1600
     * @tc.desc   test getDateOrder method with zh param,get the DateOrder value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('i18n_i18nutil_test_staic_1600', Level.LEVEL0, async (): Promise<void> => {
      console.log('i18n_i18nutil_test_staic_1600 ' + 'start');
      let value = i18n.I18NUtil.getDateOrder('zh');
      console.log('i18n_i18nutil_test_staic_1600 ' + value);
      expect(value).assertEqual('y-L-d');
    })

    /**
     * @tc.name   i18n_i18nutil_test_staic_1700
     * @tc.number i18n_i18nutil_test_staic_1700
     * @tc.desc   test getDateOrder method with en param,get the DateOrder value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('i18n_i18nutil_test_staic_1700', Level.LEVEL0, async (): Promise<void> => {
      console.log('i18n_i18nutil_test_staic_1700 ' + 'start');
      let value = i18n.I18NUtil.getDateOrder('en');
      console.log('i18n_i18nutil_test_staic_1700 ' + value);
      expect(value).assertEqual('LLL-d-y');
    })

    /**
     * @tc.name   i18n_i18nutil_test_staic_1800
     * @tc.number i18n_i18nutil_test_staic_1800
     * @tc.desc   test getDateOrder method with th param,get the DateOrder value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('i18n_i18nutil_test_staic_1800', Level.LEVEL0, async (): Promise<void> => {
      console.log('i18n_i18nutil_test_staic_1800 ' + 'start');
      let value = i18n.I18NUtil.getDateOrder('th');
      console.log('i18n_i18nutil_test_staic_1800 ' + value);
      expect(value).assertEqual('d-LLL-y');
    })

    /**
     * @tc.name   i18n_i18nutil_test_staic_1900
     * @tc.number i18n_i18nutil_test_staic_1900
     * @tc.desc   test getDateOrder method with jp param,get the DateOrder value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('i18n_i18nutil_test_staic_1900',Level.LEVEL0, async (): Promise<void> => {
      console.log('i18n_i18nutil_test_staic_1900 ' + 'start');
      let value = i18n.I18NUtil.getDateOrder('ja');
      console.log('i18n_i18nutil_test_staic_1900 ' + value);
      expect(value).assertEqual('y-LL-dd');
    })


    console.log('*************end I18nUtilInI18nTest*************');
  })
}