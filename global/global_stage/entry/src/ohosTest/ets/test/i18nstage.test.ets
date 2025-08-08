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

import Ability from '@ohos.app.ability.UIAbility'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import I18n from '@ohos.i18n'

export default function i18nStageTest() {
  describe("i18nStageTest", () => {
    console.log('*************start i18nStageTest*************');

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
     * @tc.number    : SUB_GLOBAL_GETTIMEPERIODNAME_STAGE_0100
     * @tc.name      : getTimePeriodName
     * @tc.desc      : getTimePeriodName
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getTimePeriodName_stagetest_0100', 0, async (done: Function) => {
      let value = I18n.I18NUtil.getTimePeriodName(2, 'zh-CN');
      console.log('getTimePeriodName_stagetest_0100 1' + value);
      expect(value).assertEqual('凌晨');
      done();
    })

    /**
     * @tc.number    : SUB_GLOBAL_ADD_STAGE_0100
     * @tc.name      : calendar.add
     * @tc.desc      : calendar.add
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('add_stagetest_0100', 0, async (done: Function) => {
      let calendar = I18n.getCalendar('zh-CN');
      calendar.set(2021, 11, 11, 8, 0, 0);
      calendar.add('year', 8);
      let year = calendar.get('year');
      console.log('add_stagetest_0100 1' + year);
      expect(year).assertEqual(2029);
      done();
    })

    /**
     * @tc.number    : SUB_GLOBAL_GETTIMEINMILLIS_STAGE_0100
     * @tc.name      : calendar.getTimeInMillis
     * @tc.desc      : calendar.getTimeInMillis
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getTimeInMillis_stagetest_0100', 0, async (done: Function) => {
      let calendar = I18n.getCalendar('zh-CN');
      calendar.setTime(5000);
      let millisecond = calendar.getTimeInMillis();
      console.log('getTimeInMillis_stagetest_0100 1' + millisecond);
      expect(millisecond).assertEqual(5000);
      done();
    })

    /**
     * @tc.number    : SUB_GLOBAL_COMPAREDAYS_STAGE_0100
     * @tc.name      : calendar.compareDays
     * @tc.desc      : calendar.compareDays
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('compareDays_stagetest_0100', 0, async (done: Function) => {
      let calendar = I18n.getCalendar('zh-CN');
      calendar.setTime(5000);
      let date = new Date(6000);
      let diff = calendar.compareDays(date);
      console.log('compareDays_stagetest_0100 1' + diff);
      expect(diff).assertEqual(1);
      done();
    })

    /**
     * @tc.number    : SUB_GLOBAL_HOLIDAYMANAGER_STAGE_0100
     * @tc.name      : HolidayManager
     * @tc.desc      : HolidayManager
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('HolidayManager_stagetest_0100', 0, async (done: Function) => {
      let holiday = new I18n.HolidayManager('/system/lib/US.ics');
      console.log('HolidayManager_stagetest_0100 1' + holiday);
      expect(holiday !== null).assertTrue();
      let isHoliday = holiday.isHoliday();
      console.log('HolidayManager_stagetest_0100 1' + isHoliday);
      expect(isHoliday).assertFalse();
      let item = holiday.getHolidayInfoItemArray(2023);
      console.log('HolidayManager_stagetest_0100 1' + item.length);
      for (let i = 0; i < item.length; i++) {
        console.log('HolidayManager_stagetest_0100 1' + JSON.stringify(item[i].baseName));
        console.log('HolidayManager_stagetest_0100 1' + JSON.stringify(item[i].year));
        console.log('HolidayManager_stagetest_0100 1' + JSON.stringify(item[i].month));
        console.log('HolidayManager_stagetest_0100 1' + JSON.stringify(item[i].day));
        for (let j = 0; j < item[i].localNames!.length; j++) {
          console.log('HolidayManager_stagetest_0100 1' + JSON.stringify(item[i].localNames![j].language));
          console.log('HolidayManager_stagetest_0100 1' + JSON.stringify(item[i].localNames![j].name));
        }
      }
      done();
    })

    /**
     * @tc.number   :i18n_test_getBestMatchLocale_0010
     * @tc.name     :test the getBestMatchLocale interface
     * @tc.desc     :resource list is empty
     * @tc.size     :MEDIUM
     * @tc.type     :Function
     * @tc.level    :Level 0
     */
    it('i18n_test_getBestMatchLocale_0010', 0, () => {
      console.log('i18n_test_getBestMatchLocale_0010' + 'start');
      try {
        let matchedLocaledId: string = I18n.I18NUtil.getBestMatchLocale("en-US", [""]);
      } catch (e) {
        console.log('i18n_test_getBestMatchLocale_0010' + e.code + e.message);
        expect(e.code == 890001).assertTrue();
      }
    })

    /**
     * @tc.number   :testgetThreeLetterRegion_0030
     * @tc.name     :Get a three-letter abbreviation of the specified language
     * @tc.desc     :transfer GB and return GBR
     */
    it('testgetThreeLetterRegion_0030', 0, () => {
      let language: string = I18n.I18NUtil.getThreeLetterRegion('GB');
      console.info('aaa+++', language);
      expect('GBR').assertEqual(language);
    })

    /**
     * @tc.number   :testgetThreeLetterLanguage_0030
     * @tc.name     :Get a three-letter abbreviation of the specified language
     * @tc.desc     :transfer en and return eng
     */
    it('testgetThreeLetterLanguage_0030', 0, () => {
      let language: string = I18n.I18NUtil.getThreeLetterLanguage('en');
      console.info('aaa+++', language);
      expect('eng').assertEqual(language);
    })

    console.log('*************end i18nStageTest*************');
  })
}