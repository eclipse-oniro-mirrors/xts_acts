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

export default function DateTimeFormatInIntlTest() {

  describe("DateTimeFormatInIntlTest", (): void => {
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
     * @tc.name   dateTimeFormat_test_static_0100
     * @tc.number SUB_GLOBAL_INTL_JS_DATETIME_static_0100
     * @tc.desc   format the datetime with en-GB locale
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('dateTimeFormat_test_static_0100', Level.LEVEL0, async (): Promise<void> => {
      let datefmt = new intl.DateTimeFormat('en-GB');
      expect(datefmt !== null).assertTrue();
    })

    /**
     * @tc.name   dateTimeFormat_test_static_0120
     * @tc.number SUB_GLOBAL_INTL_JS_DATETIME_static_0120
     * @tc.desc   format the datetime with en-GB locale
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('dateTimeFormat_test_static_0120', Level.LEVEL2, async (): Promise<void> => {
      let datefmt = new intl.DateTimeFormat();
      expect(datefmt !== null).assertTrue();
    })

    /**
     * @tc.name   dateTimeFormat_test_static_0200
     * @tc.number SUB_GLOBAL_INTL_JS_DATETIME_static_0200
     * @tc.desc   format the date with zh locale
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('dateTimeFormat_test_static_0200', Level.LEVEL2, async (): Promise<void> => {
      let date = new Date(2021, 11, 17, 3, 24, 0);
      let datefmt = new intl.DateTimeFormat('zh');
      console.log('dateTimeFormat_test_static_0200 ' + datefmt.format(date));
      expect(datefmt.format(date)).assertContain('2021');
    })

    /**
     * @tc.name   dateTimeFormat_test_static_0220
     * @tc.number SUB_GLOBAL_INTL_JS_DATETIME_static_0220
     * @tc.desc   format the date with zh locale and undefined options
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('dateTimeFormat_test_static_0220', Level.LEVEL2, async (): Promise<void> => {
      let date = new Date(2021, 11, 17, 3, 24, 0);
      let datefmt = new intl.DateTimeFormat('zh', undefined);
      console.log('dateTimeFormat_test_static_0220 ' + datefmt.format(date));
      expect(datefmt.format(date)).assertContain('2021');
    })

    /**
     * @tc.name   dateTimeFormat_test_static_0240
     * @tc.number SUB_GLOBAL_INTL_JS_DATETIME_static_0240
     * @tc.desc   format the date with zh locale and null options
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('dateTimeFormat_test_static_0240', Level.LEVEL2, async (): Promise<void> => {
      let date = new Date(2021, 11, 17, 3, 24, 0);
      let datefmt = new intl.DateTimeFormat('zh', {});
      console.log('dateTimeFormat_test_static_0240 ' + datefmt.format(date));
      expect(datefmt.format(date)).assertContain('2021');
    })

    /**
     * @tc.name   dateTimeFormat_test_static_0300
     * @tc.number SUB_GLOBAL_INTL_JS_DATETIME_static_0300
     * @tc.desc   format the date with en locale
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('dateTimeFormat_test_static_0300', Level.LEVEL2, async (): Promise<void> => {
      let date = new Date(2021, 11, 17, 3, 24, 0);
      let datefmt = new intl.DateTimeFormat('en');
      console.log('dateTimeFormat_test_static_0300 ' + datefmt.format(date));
      expect(datefmt.format(date)).assertContain('21');
    })

    /**
     * @tc.name   dateTimeFormat_test_static_0310
     * @tc.number SUB_GLOBAL_INTL_JS_DATETIME_static_0310
     * @tc.desc   format the date with en-US locale
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('dateTimeFormat_test_static_0310', Level.LEVEL2, async (): Promise<void> => {
      let date = new Date(2021, 11, 17, 3, 24, 0);
      let datefmt = new intl.DateTimeFormat('en-US');
      console.log('dateTimeFormat_test_static_0310 ' + datefmt.format(date));
      expect(datefmt.format(date)).assertContain('21');
    })

    /**
     * @tc.name   dateTimeFormat_test_static_0320
     * @tc.number SUB_GLOBAL_INTL_JS_DATETIME_static_0320
     * @tc.desc   format the date with en-GB locale
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('dateTimeFormat_test_static_0320', Level.LEVEL2, async (): Promise<void> => {
      let date = new Date(2021, 11, 17, 3, 24, 0);
      let datefmt = new intl.DateTimeFormat('en-GB');
      console.log('dateTimeFormat_test_static_0320 ' + datefmt.format(date));
      expect(datefmt.format(date)).assertContain('2021');
    })

    /**
     * @tc.name   dateTimeFormat_test_static_0400
     * @tc.number SUB_GLOBAL_INTL_JS_DATETIME_static_0400
     * @tc.desc   format the date with aa locale
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('dateTimeFormat_test_static_0400', Level.LEVEL2, async (): Promise<void> => {
      let date = new Date(2021, 11, 17, 3, 24, 0);
      let datefmt = new intl.DateTimeFormat('aa');
      let value = datefmt.format(date);
      console.log('dateTimeFormat_test_static_0400 ' + value);
      expect(value).assertInstanceOf('String');
    })

    /**
     * @tc.name   dateTimeFormat_test_static_0500
     * @tc.number SUB_GLOBAL_INTL_JS_DATETIME_static_0500
     * @tc.desc   format the hour with ban and zh locale
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('dateTimeFormat_test_static_0500', Level.LEVEL2, async (): Promise<void> => {
      let date = new Date(2020, 11, 20, 14, 23, 16);
      let option: intl.DateTimeOptions = {
        dateStyle: 'full'
      };
      let datefmt = new intl.DateTimeFormat(['ban', 'zh'], option);
      console.log('dateTimeFormat_test_static_0500 ' + datefmt.format(date));
      expect(datefmt.format(date)).assertEqual('2020年12月20日星期日');
    })

    /**
     * @tc.name   dateTimeFormat_test_static_0600
     * @tc.number SUB_GLOBAL_INTL_JS_DATETIME_static_0600
     * @tc.desc   format the hour with en and zh locale
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('dateTimeFormat_test_static_0600', Level.LEVEL2, async (): Promise<void> => {
      let date = new Date(2020, 11, 20, 14, 23, 16);
      let option: intl.DateTimeOptions = {
        dateStyle: 'full'
      };
      let datefmt = new intl.DateTimeFormat(['en', 'zh'], option);
      console.log('dateTimeFormat_test_static_0600 ' + datefmt.format(date));
      expect(datefmt.format(date)).assertEqual('Sunday, December 20, 2020');
    })

    /**
     * @tc.name   dateTimeFormat_test_static_0700
     * @tc.number SUB_GLOBAL_INTL_JS_DATETIME_static_0700
     * @tc.desc   format the hour with en and ban locale
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('dateTimeFormat_test_static_0700', Level.LEVEL2, async (): Promise<void> => {
      let date = new Date(2020, 11, 20, 14, 23, 16);
      let option: intl.DateTimeOptions = {
        dateStyle: 'full'
      };
      let datefmt = new intl.DateTimeFormat(['en', 'ban'], option);
      console.log('dateTimeFormat_test_static_0700 ' + datefmt.format(date));
      expect(datefmt.format(date)).assertEqual('Sunday, December 20, 2020');
    })

    /**
     * @tc.name   dateTimeFormat_test_static_0800
     * @tc.number SUB_GLOBAL_INTL_JS_DATETIME_static_0800
     * @tc.desc   format the hour without correct locale
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('dateTimeFormat_test_static_0800', Level.LEVEL2, async (): Promise<void> => {
      let date = new Date(2020, 11, 20, 14, 23, 16);
      let option: intl.DateTimeOptions = {
        dateStyle: 'full'
      };
      let datefmt = new intl.DateTimeFormat(['abc', 'ban'], option);
      console.log('dateTimeFormat_test_static_0800 ' + datefmt.format(date));
      expect(datefmt.format(date)).assertContain('2020');
    })

    /**
     * @tc.name   dateTimeFormat_test_static_0900
     * @tc.number SUB_GLOBAL_INTL_JS_DATETIME_static_0900
     * @tc.desc   format the date with full datestyle and mediu timestyle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('dateTimeFormat_test_static_0900', Level.LEVEL2, async (): Promise<void> => {
      let date = new Date(2020, 11, 20, 14, 23, 16);
      let option: intl.DateTimeOptions = {
        dateStyle: 'full', timeStyle: 'full'
      };
      let datefmt = new intl.DateTimeFormat('zh-Hans-CN', option);
      console.log('dateTimeFormat_test_static_0900 ' + datefmt.format(date));
      expect(datefmt.format(date)).assertContain('2020年12月20日星期日');
    })

    /**
     * @tc.name   dateTimeFormat_test_static_1000
     * @tc.number SUB_GLOBAL_INTL_JS_DATETIME_static_1000
     * @tc.desc   format the date dateStyle with long style
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('dateTimeFormat_test_static_1000', Level.LEVEL2, async (): Promise<void> => {
      let date = new Date(2020, 11, 20, 14, 23, 16);
      let option: intl.DateTimeOptions = {
        dateStyle: 'long', timeStyle: 'long'
      };
      let datefmt = new intl.DateTimeFormat('zh-CN', option);
      console.log('dateTimeFormat_test_static_1000 ' + datefmt.resolvedOptions().dateStyle);
      expect(datefmt.resolvedOptions().dateStyle).assertEqual('long');
      expect(datefmt.format(date)).assertContain('2020年12月20日');
    })

    /**
     * @tc.name   dateTimeFormat_test_static_1100
     * @tc.number SUB_GLOBAL_INTL_JS_DATETIME_static_1100
     * @tc.desc   format the date dateStyle with medium style
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('dateTimeFormat_test_static_1100', Level.LEVEL2, async (): Promise<void> => {
      let date = new Date(2020, 11, 20, 14, 23, 16);
      let option: intl.DateTimeOptions = {
        dateStyle: 'medium', timeStyle: 'medium'
      };
      let datefmt = new intl.DateTimeFormat('zh-CN', option);
      console.log('dateTimeFormat_test_static_1100 ' + datefmt.resolvedOptions().dateStyle);
      expect(datefmt.resolvedOptions().dateStyle).assertEqual('medium');
      expect(datefmt.format(date)).assertContain('2020年12月20日');
    })

    /**
     * @tc.name   dateTimeFormat_test_static_1200
     * @tc.number SUB_GLOBAL_INTL_JS_DATETIME_static_1200
     * @tc.desc   format the date dateStyle with short style
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('dateTimeFormat_test_static_1200', Level.LEVEL2, async (): Promise<void> => {
      let date = new Date(2020, 11, 20, 14, 23, 16);
      let option: intl.DateTimeOptions = {
        dateStyle: 'short', timeStyle: 'short'
      };
      let datefmt = new intl.DateTimeFormat('zh-CN', option);
      console.log('dateTimeFormat_test_static_1200 ' + datefmt.resolvedOptions().dateStyle);
      expect(datefmt.resolvedOptions().dateStyle).assertEqual('short');
      expect(datefmt.format(date)).assertContain('2020/12/20');
    })

    /**
     * @tc.name   dateTimeFormat_test_static_1300
     * @tc.number SUB_GLOBAL_INTL_JS_DATETIME_static_1300
     * @tc.desc   format the date with daterange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('dateTimeFormat_test_static_1300', Level.LEVEL2, async (): Promise<void> => {
      let startdate = new Date(2020, 11, 20, 14, 23, 16);
      let enddate = new Date(2020, 11, 21, 14, 23, 16);
      let datefmt = new intl.DateTimeFormat('en-GB');
      console.log('dateTimeFormat_test_static_1300 ' + datefmt.formatRange(startdate, enddate));
      let devType = deviceInfo.deviceType;
      if (devType == '2in1') {
        expect(datefmt.formatRange(startdate, enddate)).assertEqual('20–21 Dec 2020');
      } else {
        expect(datefmt.formatRange(startdate, enddate)).assertEqual('20/12/2020 – 21/12/2020');
      }
    })

    /**
     * @tc.name   dateTimeFormat_test_static_1400
     * @tc.number SUB_GLOBAL_INTL_JS_DATETIME_static_1400
     * @tc.desc   format the date with daterange when the start and end date is equal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('dateTimeFormat_test_static_1400', Level.LEVEL2, async (): Promise<void> => {
      let startdate = new Date(2020, 11, 20, 14, 23, 16);
      let enddate = new Date(2020, 11, 20, 14, 23, 16);
      let datefmt = new intl.DateTimeFormat('en-GB');
      console.log('dateTimeFormat_test_static_1400 ' + datefmt.formatRange(startdate, enddate));
      let devType = deviceInfo.deviceType;
      if (devType == '2in1') {
        expect(datefmt.formatRange(startdate, enddate)).assertEqual('20 Dec 2020');
      } else {
        expect(datefmt.formatRange(startdate, enddate)).assertEqual('20/12/2020');
      }
    })

    /**
     * @tc.name   dateTimeFormat_test_static_1500
     * @tc.number SUB_GLOBAL_INTL_JS_DATETIME_static_1500
     * @tc.desc   format the year、month、day、weekday
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('dateTimeFormat_test_static_1500', Level.LEVEL2, async (): Promise<void> => {
      let date = new Date(2020, 11, 20, 14, 23, 16);
      let option: intl.DateTimeOptions = {
        year: 'numeric',
        month: 'long',
        day: 'numeric',
        weekday: 'long'
      };
      let datefmt = new intl.DateTimeFormat('ja', option);
      console.log('dateTimeFormat_test_static_1500 ' + datefmt.format(date));
      expect(datefmt.format(date)).assertEqual('2020年12月20日日曜日');
    })

    /**
     * @tc.name   dateTimeFormat_test_static_1600
     * @tc.number SUB_GLOBAL_INTL_JS_DATETIME_static_1600
     * @tc.desc   format the timerange with year、month、day、weekday
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('dateTimeFormat_test_static_1600', Level.LEVEL2, async (): Promise<void> => {
      let startdate = new Date(2020, 11, 20, 14, 23, 16);
      let enddate = new Date(2021, 4, 5, 10, 5, 3);
      let option: intl.DateTimeOptions = {
        year: 'numeric',
        month: 'long',
        day: 'numeric',
        weekday: 'long'
      };
      let datefmt = new intl.DateTimeFormat('en', option);
      console.log('dateTimeFormat_test_static_1600 ' + datefmt.formatRange(startdate, enddate));
      expect(datefmt.formatRange(startdate, enddate)).assertEqual('Sunday, December 20, 2020 – Wednesday, May 5, 2021');
    })

    /**
     * @tc.name   dateTimeFormat_test_static_1700
     * @tc.number SUB_GLOBAL_INTL_JS_DATETIME_static_1700
     * @tc.desc   format the hour&minute&second
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('dateTimeFormat_test_static_1700', Level.LEVEL2, async (): Promise<void> => {
      let date = new Date(2020, 11, 20, 14, 23, 16);
      let option: intl.DateTimeOptions = { year: 'numeric', month: 'long', day: 'numeric',
        hour: 'numeric', minute: '2-digit', second: 'numeric', weekday: 'long', era: 'short' };
      let datefmt = new intl.DateTimeFormat('zh-CN-u-hc-h12', option);
      console.log('dateTimeFormat_test_static_1700 ' + datefmt.format(date));
      expect(datefmt.format(date)).assertContain('公元2020年12月20日星期日');
    })

    /**
     * @tc.name   dateTimeFormat_test_static_1800
     * @tc.number SUB_GLOBAL_INTL_JS_DATETIME_static_1800
     * @tc.desc   format the timeZone
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('dateTimeFormat_test_static_1800', Level.LEVEL2, async (): Promise<void> => {
      let date = new Date(2020, 3, 14, 15, 5, 3);
      let option: intl.DateTimeOptions = { timeZone: 'America/Los_Angeles', timeZoneName: 'long' };
      let datefmt = new intl.DateTimeFormat('zh-CN-u-hc-h12', option);
      console.log('dateTimeFormat_test_static_1800 ' + datefmt.format(date));
      expect(datefmt.format(date).indexOf('北美太平洋夏令时间') !== -1).assertTrue();
    })

    /**
     * @tc.name   dateTimeFormat_test_static_1900
     * @tc.number SUB_GLOBAL_INTL_JS_DATETIME_static_1900
     * @tc.desc   format the America/Los_Angeles timeZone
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('dateTimeFormat_test_static_1900', Level.LEVEL2, async (): Promise<void> => {
      let option: intl.DateTimeOptions = { timeZone: 'America/Los_Angeles', timeZoneName: 'long' };
      let datefmt = new intl.DateTimeFormat('zh-CN-u-hc-h12', option);
      console.log('dateTimeFormat_test_static_1900 ' + datefmt.resolvedOptions().timeZone);
      expect(datefmt.resolvedOptions().timeZone).assertEqual('America/Los_Angeles');
    })

    /**
     * @tc.name   dateTimeFormat_test_static_2000
     * @tc.number SUB_GLOBAL_INTL_JS_DATETIME_static_2000
     * @tc.desc   format the America/Los_Angeles timeZoneName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('dateTimeFormat_test_static_2000', Level.LEVEL2, async (): Promise<void> => {
      let option: intl.DateTimeOptions = { timeZone: 'America/Los_Angeles', timeZoneName: 'long' };
      let datefmt = new intl.DateTimeFormat('zh-CN-u-hc-h12', option);
      console.log('dateTimeFormat_test_static_2000 ' + datefmt.resolvedOptions().timeZoneName);
      expect(datefmt.resolvedOptions().timeZoneName).assertEqual('long');
    })

    /**
     * @tc.name   dateTimeFormat_test_static_2100
     * @tc.number SUB_GLOBAL_INTL_JS_DATETIME_static_2100
     * @tc.desc   format the year
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('dateTimeFormat_test_static_2100', Level.LEVEL2, async (): Promise<void> => {
      let option: intl.DateTimeOptions = { year: 'numeric', month: 'long', day: 'numeric',
        hour: 'numeric', minute: '2-digit', second: 'numeric', weekday: 'long', era: 'short' };
      let datefmt = new intl.DateTimeFormat('zh-CN-u-hc-h12', option);
      console.log('dateTimeFormat_test_static_2100 ' + datefmt.resolvedOptions().year);
      expect(datefmt.resolvedOptions().year).assertEqual('numeric');
    })

    /**
     * @tc.name   dateTimeFormat_test_static_2200
     * @tc.number SUB_GLOBAL_INTL_JS_DATETIME_static_2200
     * @tc.desc   format the weekday
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('dateTimeFormat_test_static_2200', Level.LEVEL2, async (): Promise<void> => {
      let option: intl.DateTimeOptions = { year: 'numeric', month: 'long', day: 'numeric',
        hour: 'numeric', minute: '2-digit', second: 'numeric', weekday: 'long', era: 'short' };
      let datefmt = new intl.DateTimeFormat('zh-CN-u-hc-h12', option);
      console.log('dateTimeFormat_test_static_2200 ' + datefmt.resolvedOptions().weekday);
      expect(datefmt.resolvedOptions().weekday).assertEqual('long');
    })

    /**
     * @tc.name   dateTimeFormat_test_static_2300
     * @tc.number SUB_GLOBAL_INTL_JS_DATETIME_static_2300
     * @tc.desc   format the hour in zh-CN-u-hc-h12
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('dateTimeFormat_test_static_2300', Level.LEVEL2, async (): Promise<void> => {
      let option: intl.DateTimeOptions = { year: 'numeric', month: 'long', day: 'numeric',
        hour: 'numeric', minute: '2-digit', second: 'numeric', weekday: 'long', era: 'short' };
      let datefmt = new intl.DateTimeFormat('zh-CN-u-hc-h12', option);
      console.log('dateTimeFormat_test_static_2300 ' + datefmt.resolvedOptions().hour);
      expect(datefmt.resolvedOptions().hour).assertEqual('numeric');
    })

    /**
     * @tc.name   dateTimeFormat_test_static_2400
     * @tc.number SUB_GLOBAL_INTL_JS_DATETIME_static_2400
     * @tc.desc   format the hour in fr-Latn-FR-u-nu-mong
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('dateTimeFormat_test_static_2400', Level.LEVEL2, async (): Promise<void> => {
      let date = new Date(2020, 11, 20, 14, 23, 16);
      let option: intl.DateTimeOptions = { dateStyle: 'full' };
      let datefmt = new intl.DateTimeFormat('fr-Latn-FR-u-nu-mong', option);
      console.log('dateTimeFormat_test_static_2400 ' + datefmt.format(date));
      expect(datefmt.format(date)).assertEqual('dimanche ᠒᠐ décembre ᠒᠐᠒᠐');
    })

    /**
     * @tc.name   dateTimeFormat_test_static_2500
     * @tc.number SUB_GLOBAL_INTL_JS_DATETIME_static_2500
     * @tc.desc   format the hour in zh-CN-u-hc-h12 with matcher
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('dateTimeFormat_test_static_2500', Level.LEVEL2, async (): Promise<void> => {
      let option: intl.DateTimeOptions = { year: 'numeric', month: 'long', day: 'numeric',
        hour: 'numeric', minute: '2-digit', second: 'numeric', weekday: 'long', era: 'short',
        hourCycle: 'h24',numberingSystem: 'arab', hour12: true, dayPeriod: 'short',
        formatMatcher: 'basic', localeMatcher: 'lookup' };
      let datefmt = new intl.DateTimeFormat('zh-CN-u-hc-h12', option);
      expect(datefmt.resolvedOptions().locale).assertEqual('zh-CN');
      expect(datefmt.resolvedOptions().hourCycle).assertEqual('h24');
      expect(datefmt.resolvedOptions().numberingSystem).assertEqual('arab');
      expect(datefmt.resolvedOptions().hour12).assertTrue();
      expect(datefmt.resolvedOptions().era).assertEqual('short');
      expect(datefmt.resolvedOptions().month).assertEqual('long');
      expect(datefmt.resolvedOptions().day).assertEqual('numeric');
      expect(datefmt.resolvedOptions().minute).assertEqual('2-digit');
      expect(datefmt.resolvedOptions().second).assertEqual('numeric');
      expect(datefmt.resolvedOptions().dayPeriod).assertEqual('short');
      expect(datefmt.resolvedOptions().formatMatcher).assertEqual('basic');
      expect(datefmt.resolvedOptions().localeMatcher).assertEqual('lookup');
    })
    console.log('*************end DateTimeFormatInIntlTest*************');
  })
}