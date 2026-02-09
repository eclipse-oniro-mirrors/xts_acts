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

export default function NumberFormatInIntlTest() {

  describe("NumberFormatInIntlTest", (): void => {
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
     * @tc.name   formatNumber_test_static_0100
     * @tc.number SUB_GLOBAL_INTL_JS_NUMBER_static_0100
     * @tc.desc   check the number in zh
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('formatNumber_test_static_0100', Level.LEVEL0, async (): Promise<void> => {
      let numfmt = new intl.NumberFormat('zh');
      console.log('formatNumber_test_static_0100 ' + numfmt.format(123456.789));
      expect(numfmt.format(123456.789)).assertEqual('123,456.789');
    })

    /**
     * @tc.name   formatNumber_test_static_0120
     * @tc.number SUB_GLOBAL_INTL_JS_NUMBER_static_0120
     * @tc.desc   check the number with default locale
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('formatNumber_test_static_0120', Level.LEVEL2, async (): Promise<void> => {
      let numfmt = new intl.NumberFormat();
      expect(numfmt !== null).assertTrue();
    })

    /**
     * @tc.name   formatNumber_test_static_0140
     * @tc.number SUB_GLOBAL_INTL_JS_NUMBER_static_0140
     * @tc.desc   format the number in zh and undefined options
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('formatNumber_test_static_0140', Level.LEVEL2, async (): Promise<void> => {
      let numfmt = new intl.NumberFormat('zh', undefined);
      console.log('formatNumber_test_static_0140 ' + numfmt.format(123456.789));
      expect(numfmt.format(123456.789)).assertEqual('123,456.789');
    })

    /**
     * @tc.name   formatNumber_test_static_0160
     * @tc.number SUB_GLOBAL_INTL_JS_NUMBER_static_0160
     * @tc.desc   format the number in zh and null options
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('formatNumber_test_static_0160', Level.LEVEL2, async (): Promise<void> => {
      let numfmt = new intl.NumberFormat('zh', {});
      console.log('formatNumber_test_static_0160 ' + numfmt.format(123456.789));
      expect(numfmt.format(123456.789)).assertEqual('123,456.789');
    })

    /**
     * @tc.name   formatNumber_test_static_0200
     * @tc.number SUB_GLOBAL_INTL_JS_NUMBER_static_0200
     * @tc.desc   format the number in zh-u-nu-latn
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('formatNumber_test_static_0200', Level.LEVEL2, async (): Promise<void> => {
      let numfmt = new intl.NumberFormat('zh-u-nu-latn');
      console.log('formatNumber_test_static_0200 ' + numfmt.format(123456.789));
      expect(numfmt.format(123456.789)).assertEqual('123,456.789');
    })

    /**
     * @tc.name   formatNumber_test_static_0300
     * @tc.number SUB_GLOBAL_INTL_JS_NUMBER_static_0300
     * @tc.desc   format the number in zh-u-nu-arab
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('formatNumber_test_static_0300', Level.LEVEL2, async (): Promise<void> => {
      let numfmt = new intl.NumberFormat('zh-u-nu-arab');
      console.log('formatNumber_test_static_0300 ' + numfmt.format(123456.789));
      expect(numfmt.format(123456.789)).assertEqual('١٢٣٬٤٥٦٫٧٨٩');
    })

    /**
     * @tc.name   formatNumber_test_static_0400
     * @tc.number SUB_GLOBAL_INTL_JS_NUMBER_static_0400
     * @tc.desc   format the number in en
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('formatNumber_test_static_0400', Level.LEVEL2, async (): Promise<void> => {
      let numfmt = new intl.NumberFormat('en');
      console.log('formatNumber_test_static_0400 ' + numfmt.format(123456.789));
      expect(numfmt.format(123456.789)).assertEqual('123,456.789');
    })

    /**
     * @tc.name   formatNumber_test_static_0500
     * @tc.number SUB_GLOBAL_INTL_JS_NUMBER_static_0500
     * @tc.desc   format the number in en-u-nu-thai
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('formatNumber_test_static_0500', Level.LEVEL2, async (): Promise<void> => {
      let numfmt = new intl.NumberFormat('en-u-nu-thai');
      console.log('formatNumber_test_static_0500 ' + numfmt.format(123456.789));
      expect(numfmt.format(123456.789)).assertEqual('๑๒๓,๔๕๖.๗๘๙');
    })

    /**
     * @tc.name   formatNumber_test_static_0600
     * @tc.number SUB_GLOBAL_INTL_JS_NUMBER_static_0600
     * @tc.desc   format the number in en-GB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('formatNumber_test_static_0600', Level.LEVEL2, async (): Promise<void> => {
      let numfmt = new intl.NumberFormat('en-GB');
      console.log('formatNumber_test_static_0600 ' + numfmt.format(123456.789));
      expect(numfmt.format(123456.789)).assertEqual('123,456.789');
    })

    /**
     * @tc.name   formatNumber_test_static_0700
     * @tc.number SUB_GLOBAL_INTL_JS_NUMBER_static_0700
     * @tc.desc   format the number in en-US
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('formatNumber_test_static_0700', Level.LEVEL2, async (): Promise<void> => {
      let numfmt = new intl.NumberFormat('en-US');
      console.log('formatNumber_test_static_0700 ' + numfmt.format(123456.789));
      expect(numfmt.format(123456.789)).assertEqual('123,456.789');
    })

    /**
     * @tc.name   formatNumber_test_static_0900
     * @tc.number SUB_GLOBAL_INTL_JS_NUMBER_static_0900
     * @tc.desc   check the number in zh and en list
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('formatNumber_test_static_0900', Level.LEVEL2, async (): Promise<void> => {
      let numfmt = new intl.NumberFormat(['zh','en']);
      console.log('formatNumber_test_static_0900 ' + numfmt.format(123456.789));
      expect(numfmt.format(123456.789)).assertEqual('123,456.789');
    })

    /**
     * @tc.name   formatNumber_test_static_1000
     * @tc.number SUB_GLOBAL_INTL_JS_NUMBER_static_1000
     * @tc.desc   check the number in en and zh list
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('formatNumber_test_static_1000', Level.LEVEL2, async (): Promise<void> => {
      let numfmt = new intl.NumberFormat(['en','zh']);
      console.log('formatNumber_test_static_1000 ' + numfmt.format(123456.789));
      expect(numfmt.format(123456.789)).assertEqual('123,456.789');
    })

    /**
     * @tc.name   formatNumber_test_static_1100
     * @tc.number SUB_GLOBAL_INTL_JS_NUMBER_static_1100
     * @tc.desc   check the number in en and aa list
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('formatNumber_test_static_1100', Level.LEVEL2, async (): Promise<void> => {
      let numfmt = new intl.NumberFormat(['en','aa']);
      console.log('formatNumber_test_static_1100 ' + numfmt.format(123456.789));
      expect(numfmt.format(123456.789)).assertEqual('123,456.789');
    })

    /**
     * @tc.name   formatNumber_test_static_1200
     * @tc.number SUB_GLOBAL_INTL_JS_NUMBER_static_1200
     * @tc.desc   check the number in aa and zh list
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('formatNumber_test_static_1200', Level.LEVEL2, async (): Promise<void> => {
      let numfmt = new intl.NumberFormat(['aa','zh']);
      console.log('formatNumber_test_static_1200 ' + numfmt.format(123456.789));
      expect(numfmt.format(123456.789)).assertEqual('123,456.789');
    })

    /**
     * @tc.name   formatNumber_test_static_1400
     * @tc.number SUB_GLOBAL_INTL_JS_NUMBER_static_1400
     * @tc.desc   check the number in aa  bb and es list
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('formatNumber_test_static_1400', Level.LEVEL2, async (): Promise<void> => {
      let numfmt = new intl.NumberFormat(['aa','bb','es']);
      console.log('formatNumber_test_static_1400 ' + numfmt.format(123456.789));
      expect(numfmt.format(123456.789)).assertEqual('123.456,789');
    })

    /**
     * @tc.name   formatNumber_test_static_1500
     * @tc.number SUB_GLOBAL_INTL_JS_NUMBER_static_1500
     * @tc.desc   check the number in aa it and bb list
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('formatNumber_test_static_1500', Level.LEVEL2, async (): Promise<void> => {
      let numfmt = new intl.NumberFormat(['aa','it','bb']);
      console.log('formatNumber_test_static_1500 ' + numfmt.format(123456.789));
      expect(numfmt.format(123456.789)).assertEqual('123.456,789');
    })

    /**
     * @tc.name   formatNumber_test_static_1600
     * @tc.number SUB_GLOBAL_INTL_JS_NUMBER_static_1600
     * @tc.desc   check the number with scientific
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('formatNumber_test_static_1600', Level.LEVEL2, async (): Promise<void> => {
      let numfmt = new intl.NumberFormat('en-GB', { style: 'decimal', notation: 'scientific' });
      console.log('formatNumber_test_static_1600 ' + numfmt.format(123456.789));
      expect(numfmt.format(123456.789)).assertEqual('1.234568E5');
      expect(numfmt.resolvedOptions().style).assertEqual('decimal');
      expect(numfmt.resolvedOptions().notation).assertEqual('scientific');
    })

    /**
     * @tc.name   formatNumber_test_static_1700
     * @tc.number SUB_GLOBAL_INTL_JS_NUMBER_static_1700
     * @tc.desc   check the number with currency EUR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('formatNumber_test_static_1700', Level.LEVEL2, async (): Promise<void> => {
      let numfmt = new intl.NumberFormat('en-GB', { style: 'currency', currency: 'EUR',
        currencyDisplay: 'name', currencySign: 'accounting', signDisplay: 'always' });
      console.log('formatNumber_test_static_1700 ' + numfmt.format(123456.789));
      expect(numfmt.format(123456.789)).assertEqual('+123,456.79 euros');
      expect(numfmt.resolvedOptions().locale).assertEqual('en-GB');
      expect(numfmt.resolvedOptions().style).assertEqual('currency');
      expect(numfmt.resolvedOptions().currency).assertEqual('EUR');
      expect(numfmt.resolvedOptions().currencyDisplay).assertEqual('name');
      expect(numfmt.resolvedOptions().currencySign).assertEqual('accounting');
      expect(numfmt.resolvedOptions().signDisplay).assertEqual('always');
    })

    /**
     * @tc.name   formatNumber_test_static_1800
     * @tc.number SUB_GLOBAL_INTL_JS_NUMBER_static_1800
     * @tc.desc   check the number with currency USD
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('formatNumber_test_static_1800', Level.LEVEL2, async (): Promise<void> => {
      let numfmt = new intl.NumberFormat('en-US', { style: 'currency', currency: 'USD',
        currencyDisplay: 'code', currencySign: 'accounting', signDisplay: 'always' });
      console.log('formatNumber_test_static_1800 ' + numfmt.format(123456.789));
      expect(numfmt.format(123456.789)).assertContain('+USD');
      expect(numfmt.format(123456.789)).assertContain('123,456.79');
    })

    /**
     * @tc.name   formatNumber_test_static_1900
     * @tc.number SUB_GLOBAL_INTL_JS_NUMBER_static_1900
     * @tc.desc   check the number with currency CNY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('formatNumber_test_static_1900', Level.LEVEL2, async (): Promise<void> => {
      let numfmt = new intl.NumberFormat('zh-CN', { style: 'currency', currency: 'CNY',
        currencyDisplay: 'symbol', currencySign: 'accounting', signDisplay: 'always' });
      console.log('formatNumber_test_static_1900 ' + numfmt.format(123456.789));
      expect(numfmt.format(123456.789)).assertEqual('+¥123,456.79');
    })

    /**
     * @tc.name   formatNumber_test_static_2000
     * @tc.number SUB_GLOBAL_INTL_JS_NUMBER_static_2000
     * @tc.desc   check the number with currency JPY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('formatNumber_test_static_2000', Level.LEVEL2, async (): Promise<void> => {
      let numfmt = new intl.NumberFormat('ja-JP', { style: 'currency', currency: 'JPY',
        currencyDisplay: 'narrowSymbol', currencySign: 'accounting', signDisplay: 'always' });
      console.log('formatNumber_test_static_2000 ' + numfmt.format(123456.789));
      expect(numfmt.format(123456.789)).assertEqual('+￥123,457');
    })

    /**
     * @tc.name   formatNumber_test_static_2100
     * @tc.number SUB_GLOBAL_INTL_JS_NUMBER_static_2100
     * @tc.desc   check the number with signDisplay
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('formatNumber_test_static_2100', Level.LEVEL2, async (): Promise<void> => {
      let numfmt = new intl.NumberFormat('en-GB', { style: 'currency', currency: 'EUR',
        currencyDisplay: 'name', currencySign: 'accounting', signDisplay: 'always',
        notation: 'compact', compactDisplay: 'long', localeMatcher: 'lookup' });
      console.log('formatNumber_test_static_2100 ' + numfmt.format(123456.789));
      expect(numfmt.format(123456.789)).assertEqual('+123 thousand euros');
      expect(numfmt.resolvedOptions().locale).assertEqual('en-GB');
      expect(numfmt.resolvedOptions().style).assertEqual('currency');
      expect(numfmt.resolvedOptions().currency).assertEqual('EUR');
      expect(numfmt.resolvedOptions().currencyDisplay).assertEqual('name');
      expect(numfmt.resolvedOptions().currencySign).assertEqual('accounting');
      expect(numfmt.resolvedOptions().compactDisplay).assertEqual('long');
      expect(numfmt.resolvedOptions().localeMatcher).assertEqual('lookup');
      expect(numfmt.resolvedOptions().signDisplay).assertEqual('always');
    })

    /**
     * @tc.name   formatNumber_test_static_2200
     * @tc.number SUB_GLOBAL_INTL_JS_NUMBER_static_2200
     * @tc.desc   check the number with meter unit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('formatNumber_test_static_2200', Level.LEVEL2, async (): Promise<void> => {
      let numfmt = new intl.NumberFormat('zh-CN', { style: 'unit', unit: 'meter',
        unitDisplay: 'long', maximumFractionDigits: 2, minimumIntegerDigits: 7 });
      console.log('formatNumber_test_static_2200 ' + numfmt.format(123456.789));
      expect(numfmt.format(123456.789)).assertEqual('0,123,456.79米');
      expect(numfmt.resolvedOptions().style).assertEqual('unit');
      expect(numfmt.resolvedOptions().unit).assertEqual('meter');
      expect(numfmt.resolvedOptions().unitDisplay).assertEqual('long');
    })

    /**
     * @tc.name   formatNumber_test_static_2250
     * @tc.number SUB_GLOBAL_INTL_JS_NUMBER_static_2250
     * @tc.desc   check the number with unitUsage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('formatNumber_test_static_2250', Level.LEVEL2, async (): Promise<void> => {
      let numfmt = new intl.NumberFormat('zh-CN', { style: 'unit', unit: 'meter',
        unitDisplay: 'long', unitUsage: 'length-road' });
      console.log('formatNumber_test_static_2250 ' + numfmt.format(123456.789));
      expect(numfmt.format(123456.789)).assertEqual('123,456.789米');
      expect(numfmt.resolvedOptions().unitUsage).assertEqual('length-road');
    })

    /**
     * @tc.name   formatNumber_test_static_2260
     * @tc.number SUB_GLOBAL_INTL_JS_NUMBER_static_2260
     * @tc.desc   format the number with narrow value in unitUsage param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('formatNumber_test_static_2260', Level.LEVEL2, async (): Promise<void> => {
      let numfmt = new intl.NumberFormat('zh-CN', { style: 'unit', unit: 'meter',
        unitDisplay: 'narrow', unitUsage: 'length-road' });
      console.log('formatNumber_test_static_2260 ' + numfmt.format(123456.789));
      expect(numfmt.format(123456.789)).assertEqual('123,456.789米');
      expect(numfmt.resolvedOptions().unitUsage).assertEqual('length-road');
    })

    /**
     * @tc.name   formatNumber_test_static_2270
     * @tc.number SUB_GLOBAL_INTL_JS_NUMBER_static_2270
     * @tc.desc   format the number with short value in unitUsage param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('formatNumber_test_static_2270', Level.LEVEL2, async (): Promise<void> => {
      let numfmt = new intl.NumberFormat('zh-CN', { style: 'unit', unit: 'meter',
        unitDisplay: 'short', unitUsage: 'length-road' });
      console.log('formatNumber_test_static_2270 ' + numfmt.format(123456.789));
      expect(numfmt.format(123456.789)).assertEqual('123,456.789米');
      expect(numfmt.resolvedOptions().unitUsage).assertEqual('length-road');
    })

    /**
     * @tc.name   formatNumber_test_static_2280
     * @tc.number SUB_GLOBAL_INTL_JS_NUMBER_static_2280
     * @tc.desc   format the number with narrow value in unitUsage param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('formatNumber_test_static_2280', Level.LEVEL2, async (): Promise<void> => {
      let numfmt = new intl.NumberFormat('en-US', { style: 'unit', unit: 'meter',
        unitDisplay: 'narrow', unitUsage: 'length-road' });
      console.log('formatNumber_test_static_2280 ' + numfmt.format(123456.789));
      expect(numfmt.format(123456.789)).assertEqual('76.712mi');
      expect(numfmt.resolvedOptions().unitUsage).assertEqual('length-road');
    })

    /**
     * @tc.name   formatNumber_test_static_2290
     * @tc.number SUB_GLOBAL_INTL_JS_NUMBER_static_2290
     * @tc.desc   format the number with short value in unitUsage param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('formatNumber_test_static_2290', Level.LEVEL2, async (): Promise<void> => {
      let numfmt = new intl.NumberFormat('en-US', { style: 'unit', unit: 'meter',
        unitDisplay: 'short', unitUsage: 'length-road' });
      console.log('formatNumber_test_static_2290 ' + numfmt.format(123456.789));
      expect(numfmt.format(123456.789)).assertEqual('76.712 mi');
      expect(numfmt.resolvedOptions().unitUsage).assertEqual('length-road');
    })

    /**
     * @tc.name   formatNumber_test_static_2300
     * @tc.number SUB_GLOBAL_INTL_JS_NUMBER_static_2300
     * @tc.desc   format the number with percetn style
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('formatNumber_test_static_2300', Level.LEVEL2, async (): Promise<void> => {
      let numfmt = new intl.NumberFormat('en-CN', { style: 'percent', maximumFractionDigits: 2,
        minimumIntegerDigits: 7 });
      console.log('formatNumber_test_static_2300 ' + numfmt.format(123456.789));
      expect(numfmt.format(123456.789)).assertEqual('12,345,678.9%');
    })

    /**
     * @tc.name   formatNumber_test_static_2400
     * @tc.number SUB_GLOBAL_INTL_JS_NUMBER_static_2400
     * @tc.desc   format the number with numberingSystem
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('formatNumber_test_static_2400', Level.LEVEL2, async (): Promise<void> => {
      let numfmt = new intl.NumberFormat('ar-EG', { numberingSystem: 'arab' });
      console.log('formatNumber_test_static_2400 ' + numfmt.format(123456.789));
      expect(numfmt.format(123456.789)).assertEqual('١٢٣٬٤٥٦٫٧٨٩');
      expect(numfmt.resolvedOptions().numberingSystem).assertEqual('arab');
    })

    /**
     * @tc.name   formatNumber_test_static_2500
     * @tc.number SUB_GLOBAL_INTL_JS_NUMBER_static_2500
     * @tc.desc   format the number with style
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('formatNumber_test_static_2500', Level.LEVEL2, async (): Promise<void> => {
      let numfmt = new intl.NumberFormat('ar', { style: 'percent', minimumFractionDigits: 1, maximumFractionDigits: 2,
        minimumIntegerDigits: 7, minimumSignificantDigits: 5, maximumSignificantDigits: 10, useGrouping: true  });
      console.log('formatNumber_test_static_2500 ' + numfmt.resolvedOptions().style);
      expect(numfmt.resolvedOptions().style).assertEqual('percent');
      expect(numfmt.resolvedOptions().minimumFractionDigits).assertEqual(1);
      expect(numfmt.resolvedOptions().maximumFractionDigits).assertEqual(2);
      expect(numfmt.resolvedOptions().minimumIntegerDigits).assertEqual(7);
      expect(numfmt.resolvedOptions().minimumSignificantDigits).assertEqual(5);
      expect(numfmt.resolvedOptions().maximumSignificantDigits).assertEqual(10);
      expect(numfmt.resolvedOptions().useGrouping).assertTrue();
    })
    console.log('*************end NumberFormatInIntlTest*************');
  })
}