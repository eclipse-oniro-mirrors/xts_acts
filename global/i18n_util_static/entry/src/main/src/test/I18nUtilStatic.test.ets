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
import Context from 'application.Context';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import hilog from '@ohos.hilog'
import i18n from '@ohos.i18n'
import deviceInfo from '@ohos.deviceInfo'
import intl from '@ohos.intl'

let domain: int = 0x0000;
let tag: string = 'testTag';

export default function FivePointOne_resMgrStageTest() {

  describe("i18nStageTest", (): void => {
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
     * @tc.name   getTimePeriodName_stagetest_static_0100
     * @tc.number SUB_GLOBAL_GETTIMEPERIODNAME_STAGE_static_0100
     * @tc.desc   getTimePeriodName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getTimePeriodName_stagetest_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let value = i18n.I18NUtil.getTimePeriodName(2, 'zh-CN');
      console.log('getTimePeriodName_stagetest_static_0100 1' + value);
      expect(value).assertEqual('凌晨');
      done();
    })

    /**
     * @tc.name   add_stagetest_static_0100
     * @tc.number SUB_GLOBAL_ADD_STAGE_static_0100
     * @tc.desc   calendar.add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('add_stagetest_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let calendar = i18n.getCalendar('zh-CN');
      calendar.set(2021, 11, 11, 8, 0, 0);
      calendar.add('year', 8);
      let year = calendar.get('year');
      console.log('add_stagetest_static_0100 1' + year);
      expect(year).assertEqual(2029);
      done();
    })

    /**
     * @tc.name   getTimeInMillis_stagetest_static_0100
     * @tc.number SUB_GLOBAL_GETTIMEINMILLIS_STAGE_static_0100
     * @tc.desc   calendar.getTimeInMillis
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getTimeInMillis_stagetest_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let calendar = i18n.getCalendar('zh-CN');
      calendar.setTime(5000);
      let millisecond = calendar.getTimeInMillis();
      console.log('getTimeInMillis_stagetest_static_0100 1' + millisecond);
      expect(millisecond).assertEqual(5000);
      done();
    })

    /**
     * @tc.name   compareDays_stagetest_static_0100
     * @tc.number SUB_GLOBAL_COMPAREDAYS_STAGE_static_0100
     * @tc.desc   calendar.compareDays
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('compareDays_stagetest_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let calendar = i18n.getCalendar('zh-CN');
      calendar.setTime(5000);
      let date = new Date(6000);
      let diff = calendar.compareDays(date);
      console.log('compareDays_stagetest_static_0100 1' + diff);
      expect(diff).assertEqual(1);
      done();
    })

    /**
     * @tc.name   HolidayManager_stagetest_static_0100
     * @tc.number SUB_GLOBAL_HOLIDAYMANAGER_STAGE_0100
     * @tc.desc   HolidayManager
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('HolidayManager_stagetest_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let holiday = new i18n.HolidayManager('/system/lib/US.ics');
      console.log('HolidayManager_stagetest_static_0100 1' + holiday);
      expect(holiday !== null).assertTrue();
      let isHoliday = holiday.isHoliday();
      console.log('HolidayManager_stagetest_static_0100 1' + isHoliday);
      expect(isHoliday).assertFalse();
      let item = holiday.getHolidayInfoItemArray(2023);
      console.log('HolidayManager_stagetest_static_0100 1' + item.length);
      for (let i = 0; i < item.length; i++) {
        console.log('HolidayManager_stagetest_static_0100 baseName' + JSON.stringify(item[i].baseName));
        console.log('HolidayManager_stagetest_static_0100 year' + JSON.stringify(item[i].year));
        console.log('HolidayManager_stagetest_static_0100 month' + JSON.stringify(item[i].month));
        console.log('HolidayManager_stagetest_static_0100 day' + JSON.stringify(item[i].day));
        for (let j = 0; j < item[i].localNames!.length; j++) {
          console.log('HolidayManager_stagetest_static_0100 language' + JSON.stringify(item[i].localNames![j].language));
          console.log('HolidayManager_stagetest_static_0100 name' + JSON.stringify(item[i].localNames![j].name));
        }
      }
      done();
    })
    /**
     * @tc.name   i18n_test_getBestMatchLocale_static_0010
     * @tc.number i18n_test_getBestMatchLocale_static_0010
     * @tc.desc   resource list is empty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('i18n_test_getBestMatchLocale_static_0010', Level.LEVEL3, async (): Promise<void> => {
      console.log('i18n_test_getBestMatchLocale_static_0010' + 'start');
      try {
        let matchedLocaledId: string = i18n.I18NUtil.getBestMatchLocale("en-US", [""]);
      } catch (e) {
        let err = e as BusinessError
        console.log('i18n_test_getBestMatchLocale_static_0010' + err.code + err.message);
        expect(err.code == 890001).assertTrue();
      }
    })

    /**
     * @tc.name   testgetThreeLetterRegion_static_0030
     * @tc.number testgetThreeLetterRegion_static_0030
     * @tc.desc   transfer GB and return GBR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testgetThreeLetterRegion_static_0030', Level.LEVEL0, async (): Promise<void> => {
      let language: string = i18n.I18NUtil.getThreeLetterRegion('GB');
      console.info('aaa+++', language);
      expect('GBR').assertEqual(language);
    })

    /**
     * @tc.name   testgetThreeLetterLanguage_static_0030
     * @tc.number testgetThreeLetterLanguage_static_0030
     * @tc.desc   transfer en and return eng
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testgetThreeLetterLanguage_static_0030', Level.LEVEL0, async (): Promise<void> => {
      let language: string = i18n.I18NUtil.getThreeLetterLanguage('en');
      console.info('aaa+++', language);
      expect('eng').assertEqual(language);
    })
    console.log('*************end i18nStageTest*************');
  })
}