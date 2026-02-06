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

let domain: int = 0x0000;
let tag: string = 'testTag';

export default function i18nStageTest() {

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
     * @tc.name   SUB_GLOBAL_I18N_SR000IFGMS_static_0100
     * @tc.number SUB_GLOBAL_I18N_getTimeInMillis_static_0100
     * @tc.desc   hour=[21,5],local="en-US",at night
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_GLOBAL_I18N_SR000IFGMS_static_0100', Level.LEVEL0, async (): Promise<void> => {
      let value = i18n.I18NUtil.getTimePeriodName(5, "en-US");
      console.log('SUB_GLOBAL_I18N_SR000IFGMS_static_0100:' + value);
      expect(value == "at night").assertTrue();
    })

    /**
     * @tc.name   SUB_GLOBAL_I18N_SR000IFGMS_static_0200
     * @tc.number SUB_GLOBAL_I18N_getTimeInMillis_static_0200
     * @tc.desc   hour=[6,11],local="en-US",in the morning
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_I18N_SR000IFGMS_static_0200', Level.LEVEL2, async (): Promise<void> => {
      let value = i18n.I18NUtil.getTimePeriodName(11, "en-US");
      console.log('SUB_GLOBAL_I18N_SR000IFGMS_static_0200:' + value);
      expect(value == "in the morning").assertTrue();
    })

    /**
     * @tc.name   SUB_GLOBAL_I18N_SR000IFGMS_static_0300
     * @tc.number SUB_GLOBAL_I18N_getTimeInMillis_static_0300
     * @tc.desc   hour=12,local="en-US",noon
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_I18N_SR000IFGMS_static_0300', Level.LEVEL2, async (): Promise<void> => {
      let value = i18n.I18NUtil.getTimePeriodName(12, "en-US");
      console.log('SUB_GLOBAL_I18N_SR000IFGMS_static_0300:' + value);
      expect(value == "noon").assertTrue();
    })

    /**
     * @tc.name   SUB_GLOBAL_I18N_SR000IFGMS_static_0400
     * @tc.number SUB_GLOBAL_I18N_getTimeInMillis_static_0400
     * @tc.desc   hour=[13,17],local="en-US",in the afternoon
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_I18N_SR000IFGMS_static_0400', Level.LEVEL2, async (): Promise<void> => {
      let value = i18n.I18NUtil.getTimePeriodName(41, "en-US"); //41%24=17
      console.log('SUB_GLOBAL_I18N_SR000IFGMS_static_0400:' + value);
      expect(value == "in the afternoon").assertTrue();
    })

    /**
     * @tc.name   SUB_GLOBAL_I18N_SR000IFGMS_static_0500
     * @tc.number SUB_GLOBAL_I18N_getTimeInMillis_static_0500
     * @tc.desc   hour=[18,20],local="en-US",in the evening
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_I18N_SR000IFGMS_static_0500', Level.LEVEL2, async (): Promise<void> => {
      let value = i18n.I18NUtil.getTimePeriodName(-4, "en-US"); //24+(-4)=20
      console.log('SUB_GLOBAL_I18N_SR000IFGMS_static_0500:' + value);
      expect(value == "in the evening").assertTrue();
    })

    /**
     * @tc.name   SUB_GLOBAL_I18N_SR000IFGMS_static_0600
     * @tc.number SUB_GLOBAL_I18N_getTimeInMillis_static_0600
     * @tc.desc   hour=12,local=""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_I18N_SR000IFGMS_static_0600', Level.LEVEL2, async (): Promise<void> => {
      try {
        let value = i18n.I18NUtil.getTimePeriodName(12, "");
        console.log('SUB_GLOBAL_I18N_SR000IFGMS_static_0600:' + value);
      } catch (e) {
        e = e as BusinessError;
        console.log('SUB_GLOBAL_I18N_SR000IFGMS_static_0600 code&message:' + e.code + e.message);
        expect(e.code == 890001).assertTrue();
      }
    })

    /**
     * @tc.name   SUB_GLOBAL_I18N_SR000IFGMS_static_0700
     * @tc.number SUB_GLOBAL_I18N_SR000IFGMS_static_0700
     * @tc.desc   hour=12,local=invalid string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_I18N_SR000IFGMS_static_0700', Level.LEVEL2, async (): Promise<void> => {
      try {
        let value = i18n.I18NUtil.getTimePeriodName(12, "abcd");
        console.log('SUB_GLOBAL_I18N_SR000IFGMS_static_0700:' + value);
      } catch (e) {
        e = e as BusinessError;
        console.log('SUB_GLOBAL_I18N_SR000IFGMS_static_0700 code&message:' + e.code + e.message);
        expect(e.code == 890001).assertTrue();
      }
    })

    /**
     * @tc.name   SUB_GLOBAL_i18n_SR000IFGNH_static_0010
     * @tc.number SUB_GLOBAL_i18n_HolidayManager_static_0010
     * @tc.desc   HolidayManager-input .ics file
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_GLOBAL_i18n_SR000IFGNH_static_0010', Level.LEVEL0, async (): Promise<void> => {
      try {
        let holidayManager = new i18n.HolidayManager("/system/lib/TR.ics");
        console.log('SUB_GLOBAL_i18n_SR000IFGNH_static_0010:' + holidayManager);
      } catch (e) {
        e = e as BusinessError;
        console.log('SUB_GLOBAL_i18n_SR000IFGNH_static_0010 code&message:' + e.code + e.message);
        expect(e.code == null).assertTrue();
      }
    })
    
    /**
     * @tc.name   SUB_GLOBAL_i18n_SR000IFGNH_static_0020
     * @tc.number SUB_GLOBAL_i18n_HolidayManager_static_0020
     * @tc.desc   HolidayManager-input .xml file
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_GLOBAL_i18n_SR000IFGNH_static_0020', Level.LEVEL0, async (): Promise<void> => {
      try {
        let holidayManager = new i18n.HolidayManager("A.xml");
        console.log('SUB_GLOBAL_i18n_SR000IFGNH_static_0020:' + holidayManager);
      } catch (e) {
        e = e as BusinessError;
        console.log('SUB_GLOBAL_i18n_SR000IFGNH_static_0020 code&message:' + e.code + e.message);
        expect(e.code == 890001).assertTrue();
      }
    })

    /**
     * @tc.name   SUB_GLOBAL_I18N_SR000IFGNH_static_0030
     * @tc.number SUB_GLOBAL_I18N_isHoliday_static_0030
     * @tc.desc   isHoliday-input null(The current date is used by default)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_I18N_SR000IFGNH_static_0030', Level.LEVEL2, async (): Promise<void> => {
      let holidayManager = new i18n.HolidayManager("/system/lib/TR.ics");
      let isHoliday = holidayManager.isHoliday();
      console.log('SUB_GLOBAL_I18N_SR000IFGNH_static_0030:' + isHoliday);
      expect(isHoliday == false).assertTrue();
    })

    /**
     * @tc.name   SUB_GLOBAL_I18N_SR000IFGNH_static_0050
     * @tc.number SUB_GLOBAL_I18N_isHoliday_static_0050
     * @tc.desc   isHoliday-input correct date (is not holiday) parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_I18N_SR000IFGNH_static_0050', Level.LEVEL2, async (): Promise<void> => {
      let holidayManager = new i18n.HolidayManager("/system/lib/TR.ics");
      let isHoliday = holidayManager.isHoliday(new Date(2020, 6, 25));
      console.log('SUB_GLOBAL_I18N_SR000IFGNH_static_0050:' + isHoliday);
      expect(isHoliday == false).assertTrue();
    })

    /**
     * @tc.name   SUB_GLOBAL_I18N_SR000IFGNH_static_0070
     * @tc.number SUB_GLOBAL_I18N_getHolidayInfoItemArray_static_0070
     * @tc.desc   getHolidayInfoItemArray-input null(The current year is used by default)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_I18N_SR000IFGNH_static_0070', Level.LEVEL2, async (): Promise<void> => {
      let holidayManager = new i18n.HolidayManager("/system/lib/TR.ics");
      let holidayInfoItemArray = holidayManager.getHolidayInfoItemArray();
      console.log('SUB_GLOBAL_I18N_SR000IFGNH_static_0070:' + holidayInfoItemArray);
      expect(holidayInfoItemArray != null).assertTrue();
    })

    /**
     * @tc.name   SUB_GLOBAL_I18N_SR000IFGNH_static_0080
     * @tc.number SUB_GLOBAL_I18N_getHolidayInfoItemArray_static_0080
     * @tc.desc   getHolidayInfoItemArray-input correct year parameter (contain holidays)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_I18N_SR000IFGNH_static_0080', Level.LEVEL2, async (): Promise<void> => {
      let holidayManager = new i18n.HolidayManager("/system/lib/TR.ics");
      let holidayInfoItemArray = holidayManager.getHolidayInfoItemArray(2023);
      console.log('SUB_GLOBAL_I18N_SR000IFGNH_static_0080:' + holidayInfoItemArray);
      expect(holidayInfoItemArray != null).assertTrue();
    })

    /**
     * @tc.name   SUB_GLOBAL_I18N_SR000IFGNH_static_0090
     * @tc.number SUB_GLOBAL_I18N_getHolidayInfoItemArray_static_0090
     * @tc.desc   getHolidayInfoItemArray-input correct number parameter (don't contain holidays)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_I18N_SR000IFGNH_static_0090', Level.LEVEL2, async (): Promise<void> => {
      let holidayManager = new i18n.HolidayManager("/system/lib/TR.ics");
      let holidayInfoItemArray = holidayManager.getHolidayInfoItemArray(2022);
      console.log('SUB_GLOBAL_I18N_SR000IFGNH_static_0090:' + holidayInfoItemArray);
      expect(holidayInfoItemArray.length == 0).assertTrue();
    })

    /**
     * @tc.name   SUB_GLOBAL_I18N_SR000IET4P_static_0100
     * @tc.number SUB_GLOBAL_I18N_add_static_0100
     * @tc.desc   add - amount >= 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_GLOBAL_I18N_SR000IET4P_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let calendar: i18n.Calendar = i18n.getCalendar("zh-Hans");
      calendar.set(2023, 9, 22, 18, 0, 0); //set time to 2023.9.22 18:00:00
      calendar.add("year", 2); //2023+2
      let year: number = calendar.get("year"); //year = 2025
      console.log('SUB_GLOBAL_I18N_SR000IET4P_static_0100:' + year);
      expect(year == 2025).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_GLOBAL_I18N_SR000IET4P_static_0200
     * @tc.number SUB_GLOBAL_I18N_add_static_0200
     * @tc.desc   add - amount parameter input 'week_of_year'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_I18N_SR000IET4P_static_0200', Level.LEVEL2, async (done: () => void): Promise<void> => {
      let calendar: i18n.Calendar = i18n.getCalendar("zh-Hans");
      calendar.set(2023, 9, 22, 18, 0, 0); //set time to 2023.9.22 18:00:00
      calendar.add("week_of_year", 2); //add 2 weeks
      let month: number = calendar.get("month"); //month = 10
      let date: number = calendar.get("date");
      console.log('SUB_GLOBAL_I18N_SR000IET4P_static_0200_month:' + month);
      console.log('SUB_GLOBAL_I18N_SR000IET4P_static_0200_date:' + date);
      expect(month == 10 && date == 5).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_GLOBAL_I18N_SR000IET4P_static_0300
     * @tc.number SUB_GLOBAL_I18N_add_static_0300
     * @tc.desc   add - amount < 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_I18N_SR000IET4P_static_0300', Level.LEVEL2, async (done: () => void): Promise<void> => {
      let calendar: i18n.Calendar = i18n.getCalendar("zh-Hans");
      calendar.set(2023, 9, 22, 18, 0, 0); //set time to 2023.9.22 18:00:00
      calendar.add("year", -1); //2023-2
      let year: number = calendar.get("year"); //year = 2022
      console.log('SUB_GLOBAL_I18N_SR000IET4P_static_0300:' + year);
      expect(year == 2022).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_GLOBAL_I18N_SR000IET4P_static_0600
     * @tc.number SUB_GLOBAL_I18N_add_static_0600
     * @tc.desc   add - filed parameter input invalid parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_I18N_SR000IET4P_static_0600', Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        let calendar: i18n.Calendar = i18n.getCalendar("zh-Hans");
        calendar.set(2023, 9, 22, 18, 0, 0); //set time to 2023.9.22 18:00:00
        calendar.add("test", 2);
        let year: number = calendar.get("year"); //year = 2022
        console.log('SUB_GLOBAL_I18N_SR000IET4P_static_0600:' + year);
      } catch (err) {
        let error = err as BusinessError
        console.log('SUB_GLOBAL_I18N_SR000IET4P_static_0600 code&message:' + error.code + error.message);
        expect(error.code == 890001).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_GLOBAL_I18N_SR000IET4P_static_0700
     * @tc.number SUB_GLOBAL_I18N_getTimeInMillis_static_0700
     * @tc.desc   add - filed parameter input invalid parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_I18N_SR000IET4P_static_0700', Level.LEVEL2, async (): Promise<void> => {
      let calendar: i18n.Calendar = i18n.getCalendar("zh-Hans");
      calendar.setTime(5000);
      let millisecond: number = calendar.getTimeInMillis(); //millisecond = 5000
      console.log('SUB_GLOBAL_I18N_SR000IET4P_static_0700:' + millisecond);
      expect(millisecond == 5000).assertTrue();
    })

    /**
     * @tc.name   SUB_GLOBAL_I18N_CompareDays_static_0100
     * @tc.number SUB_GLOBAL_I18N_compareDays_static_0100
     * @tc.desc   CompareDays - Compare the Date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_GLOBAL_I18N_CompareDays_static_0100', Level.LEVEL0, async (): Promise<void> => {
      let calendar: i18n.Calendar = i18n.getCalendar("zh-Hans");
      calendar.set(2023, 9, 22, 18, 0, 0); //set time to 2023.9.22 18:00:00
      let date: Date = new Date(2023, 9, 23, 19, 0, 0);
      let diff: number = calendar.compareDays(date);
      console.log('SUB_GLOBAL_I18N_CompareDays_static_0100:' + diff);
      expect(diff == 2).assertTrue();
    })

    /**
     * @tc.name   SUB_GLOBAL_I18N_CompareDays_static_0200
     * @tc.number SUB_GLOBAL_I18N_compareDays_static_0200
     * @tc.desc   CompareDays - Compare the Date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_I18N_CompareDays_static_0200', Level.LEVEL2, async (): Promise<void> => {
      let calendar: i18n.Calendar = i18n.getCalendar("zh-Hans");
      calendar.set(2023, 9, 22, 18, 0, 0); //set time to 2023.9.22 18:00:00
      let date: Date = new Date(2023, 9, 20, 13, 0, 0);
      let diff: number = calendar.compareDays(date);
      console.log('SUB_GLOBAL_I18N_CompareDays_static_0200:' + diff);
      expect(diff == -3).assertTrue();
    })

    /**
     * @tc.name   SUB_GLOBAL_I18N_CompareDays_static_0300
     * @tc.number SUB_GLOBAL_I18N_compareDays_static_0300
     * @tc.desc   CompareDays - Compare the Date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_I18N_CompareDays_static_0300', Level.LEVEL2, async (): Promise<void> => {
      let calendar: i18n.Calendar = i18n.getCalendar("zh-Hans");
      calendar.setTime(5000);
      let date: Date = new Date(6000);
      let diff: number = calendar.compareDays(date);
      console.log('SUB_GLOBAL_I18N_CompareDays_static_0300:' + diff);
      expect(diff == 1).assertTrue();
    })

    /**
     * @tc.name   SUB_GLOBAL_I18N_EntityRecognizer_static_0100
     * @tc.number SUB_GLOBAL_I18N_EntityRecognizer_static_0100
     * @tc.desc   findEntityInfo - Identifying Entity Information in Text
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_GLOBAL_I18N_EntityRecognizer_static_0100', Level.LEVEL0, async (): Promise<void> => {
      let entityRecognizer: i18n.EntityRecognizer = new i18n.EntityRecognizer("zh-CN");
      let text: string = "如有疑问，请联系13801048417";
      let result = entityRecognizer.findEntityInfo(text);
      console.log('SUB_GLOBAL_I18N_EntityRecognizer_static_0100 type:' + result[0].type);
      console.log('SUB_GLOBAL_I18N_EntityRecognizer_static_0100 begin:' + result[0].begin);
      console.log('SUB_GLOBAL_I18N_EntityRecognizer_static_0100 end:' + result[0].end);
      expect(result[0].type == "phone_number").assertTrue();
      expect(result[0].begin == 8).assertTrue();
      expect(result[0].end == 19).assertTrue();
    })

    /**
     * @tc.name   SUB_GLOBAL_I18N_EntityRecognizer_static_0200
     * @tc.number SUB_GLOBAL_I18N_EntityRecognizer_static_0200
     * @tc.desc   findEntityInfo - Identifying Entity Information in Text
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_I18N_EntityRecognizer_static_0200', Level.LEVEL2, async (): Promise<void> => {
      let entityRecognizer: i18n.EntityRecognizer = new i18n.EntityRecognizer("zh-CN");
      let text: string = "如有疑问，请联系010 1234 5678";
      let result = entityRecognizer.findEntityInfo(text);
      console.log('SUB_GLOBAL_I18N_EntityRecognizer_static_0200 type:' + result[0].type);
      console.log('SUB_GLOBAL_I18N_EntityRecognizer_static_0200 begin:' + result[0].begin);
      console.log('SUB_GLOBAL_I18N_EntityRecognizer_static_0200 end:' + result[0].end);
      expect(result[0].type == "phone_number").assertTrue();
      expect(result[0].begin == 8).assertTrue();
      expect(result[0].end == 21).assertTrue();
    })

    /**
     * @tc.name   SUB_GLOBAL_I18N_EntityRecognizer_static_0400
     * @tc.number SUB_GLOBAL_I18N_EntityRecognizer_static_0400
     * @tc.desc   findEntityInfo - no recognizable entity information in Text
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_I18N_EntityRecognizer_static_0400', Level.LEVEL2, async (): Promise<void> => {
      let entityRecognizer: i18n.EntityRecognizer = new i18n.EntityRecognizer("zh-CN");
      let text: string = "如有疑问，请联系我";
      let result = entityRecognizer.findEntityInfo(text);
      console.log('SUB_GLOBAL_I18N_EntityRecognizer_static_0400:' + result);
      expect(result.length == 0).assertTrue();
    })

    /**
     * @tc.name   SUB_GLOBAL_I18N_EntityRecognizer_static_0600
     * @tc.number SUB_GLOBAL_I18N_EntityRecognizer_static_0600
     * @tc.desc   findEntityInfo - Identifying Entity Information in Text
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_I18N_EntityRecognizer_static_0600', Level.LEVEL2, async (): Promise<void> => {
      let entityRecognizer: i18n.EntityRecognizer = new i18n.EntityRecognizer("en-GB");
      let text: string = "If you have any questions, Please call 13801048417";
      let result = entityRecognizer.findEntityInfo(text);
      console.log('SUB_GLOBAL_I18N_EntityRecognizer_static_0600 type:' + result[0].type);
      console.log('SUB_GLOBAL_I18N_EntityRecognizer_static_0600 begin:' + result[0].begin);
      console.log('SUB_GLOBAL_I18N_EntityRecognizer_static_0600 end:' + result[0].end);
      expect(result[0].type == "phone_number").assertTrue();
      expect(result[0].begin == 39).assertTrue();
      expect(result[0].end == 50).assertTrue();
    })

    /**
     * @tc.name   SUB_GLOBAL_I18N_EntityRecognizer_static_0800
     * @tc.number SUB_GLOBAL_I18N_EntityRecognizer_static_0800
     * @tc.desc   findEntityInfo - Identifying Entity Date Information in Text(Chinese)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_I18N_EntityRecognizer_static_0800', Level.LEVEL2, async (): Promise<void> => {
      let entityRecognizer: i18n.EntityRecognizer = new i18n.EntityRecognizer("zh-CN");
      let text: string = "我们2023年12月1日下午8点一起吃饭吧。";
      let result = entityRecognizer.findEntityInfo(text);
      console.log('SUB_GLOBAL_I18N_EntityRecognizer_static_0800 type:' + result[0].type);
      console.log('SUB_GLOBAL_I18N_EntityRecognizer_static_0800 begin:' + result[0].begin);
      console.log('SUB_GLOBAL_I18N_EntityRecognizer_static_0800 end:' + result[0].end);
      expect(result[0].type == "date").assertTrue();
      expect(result[0].begin == 2).assertTrue();
      expect(result[0].end == 16).assertTrue();
    })

    /**
     * @tc.name   SUB_GLOBAL_I18N_EntityRecognizer_static_0900
     * @tc.number SUB_GLOBAL_I18N_EntityRecognizer_static_0900
     * @tc.desc   findEntityInfo - Identifying Entity Date Information in Text(Chinese)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_I18N_EntityRecognizer_static_0900', Level.LEVEL2, async (): Promise<void> => {
      let entityRecognizer: i18n.EntityRecognizer = new i18n.EntityRecognizer("zh-CN");
      let text: string = "今天下午3点到5点有个会议。";
      let result = entityRecognizer.findEntityInfo(text);
      console.log('SUB_GLOBAL_I18N_EntityRecognizer_static_0900 type:' + result[0].type);
      console.log('SUB_GLOBAL_I18N_EntityRecognizer_static_0900 begin:' + result[0].begin);
      console.log('SUB_GLOBAL_I18N_EntityRecognizer_static_0900 end:' + result[0].end);
      expect(result[0].type == "date").assertTrue();
      expect(result[0].begin == 0).assertTrue();
      expect(result[0].end == 9).assertTrue();
    })

    /**
     * @tc.name   SUB_GLOBAL_I18N_EntityRecognizer_static_1000
     * @tc.number SUB_GLOBAL_I18N_EntityRecognizer_static_1000
     * @tc.desc   findEntityInfo - Identifying Entity Date Information in Text(English)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_I18N_EntityRecognizer_static_1000', Level.LEVEL2, async (): Promise<void> => {
      let entityRecognizer: i18n.EntityRecognizer = new i18n.EntityRecognizer("en-GB");
      let text: string = "Let's have dinner in December 1, 2023.";
      let result = entityRecognizer.findEntityInfo(text);
      console.log('SUB_GLOBAL_I18N_EntityRecognizer_static_1000:' + result);
      expect([result[0].type, result[1].type].indexOf("date") != -1).assertTrue();
      expect([result[0].begin, result[1].begin].indexOf(21) != -1).assertTrue();
      expect([result[0].end, result[1].end].indexOf(37) != -1).assertTrue();
    })

    /**
     * @tc.name   SUB_GLOBAL_I18N_EntityRecognizer_static_1100
     * @tc.number SUB_GLOBAL_I18N_EntityRecognizer_static_1100
     * @tc.desc   findEntityInfo - Identifying Entity Date Information in Text(English)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_I18N_EntityRecognizer_static_1100', Level.LEVEL2, async (): Promise<void> => {
      let entityRecognizer: i18n.EntityRecognizer = new i18n.EntityRecognizer("en-GB");
      let text: string = "The time is 11/10/2023-11/13/2023.";
      let result = entityRecognizer.findEntityInfo(text);
      console.log('SUB_GLOBAL_I18N_EntityRecognizer_static_1100:' + result);
      expect(result[1].type == "date").assertTrue();
      expect(result[1].begin == 12).assertTrue();
      expect(result[1].end == 34).assertTrue();
    })

    /**
     * @tc.name   SUB_GLOBAL_i18n_AppPreferredLanguage_static_0100
     * @tc.number SUB_GLOBAL_i18n_AppPreferredLanguage_static_0100
     * @tc.desc   setAppPreferredLanguage - Set App Preferred Language
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_GLOBAL_i18n_AppPreferredLanguage_static_0100', Level.LEVEL0, async (): Promise<void> => {
      try {
        i18n.System.setAppPreferredLanguage('zh');
      } catch (e) {
        let error = e as BusinessError
        console.log('SUB_GLOBAL_i18n_AppPreferredLanguage_static_0100 code&message:' + error.code + error.message);
        expect(error.code).assertNull();
      }
    })

    /**
     * @tc.name   SUB_GLOBAL_I18N_AppPreferredLanguage_static_0200
     * @tc.number SUB_GLOBAL_I18N_AppPreferredLanguage_static_0200
     * @tc.desc   setAppPreferredLanguage - Set App Preferred Language to invalid language
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_GLOBAL_I18N_AppPreferredLanguage_static_0200', Level.LEVEL3, async (): Promise<void> => {
      try {
        i18n.System.setAppPreferredLanguage('1');
      } catch (err) {
        let error = err as BusinessError
        console.log('SUB_GLOBAL_I18N_AppPreferredLanguage_static_0200 code&message:' + error.code + error.message);
        expect(error.code == 890001).assertTrue();
      }
    })

    /**
     * @tc.name   SUB_GLOBAL_I18N_AppPreferredLanguage_static_0400
     * @tc.number SUB_GLOBAL_I18N_AppPreferredLanguage_static_0400
     * @tc.desc   setAppPreferredLanguage - Set App Preferred Language to zh-CN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_I18N_AppPreferredLanguage_static_0400', Level.LEVEL2, async (): Promise<void> => {
      i18n.System.setAppPreferredLanguage('zh-CN');
      let appPreferredLanguage: string = i18n.System.getAppPreferredLanguage();
      console.log('SUB_GLOBAL_I18N_AppPreferredLanguage_static_0400:' + appPreferredLanguage);
      expect(appPreferredLanguage).assertEqual("zh-CN");
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

    /**
     * @tc.name   testGetThreeLetterLanguage_static_0100
     * @tc.number SUB_GLOBAL_getThreeLetterLanguage_static_0100
     * @tc.desc   param value is en
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetThreeLetterLanguage_static_0100', Level.LEVEL2, async (): Promise<void> => {
      let language: string = i18n.I18NUtil.getThreeLetterLanguage('en')
      console.info('testGetThreeLetterLanguage_static_0100', language);
      expect('eng').assertEqual(language);
    })

    /**
     * @tc.name   testgetThreeLetterRegion_static_0030
     * @tc.number testgetThreeLetterRegion_static_0030
     * @tc.desc   Get a three-letter abbreviation of the specified language
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
     * @tc.name   testGetThreeLetterLanguage_static_0040
     * @tc.number testGetThreeLetterLanguage_static_0040
     * @tc.desc   param value not valid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetThreeLetterLanguage_static_0040', Level.LEVEL3, async (): Promise<void> => {
      try {
        let language: string = i18n.I18NUtil.getThreeLetterLanguage('bbb')
      } catch (e) {
        e = e as BusinessError;
        console.log('testGetThreeLetterLanguage_0030' + e.code + e.message);
        expect(e.code).assertEqual('890001');
      }
    })

    /**
     * @tc.name   testGetThreeLetterRegion_static_0040
     * @tc.number testGetThreeLetterRegion_static_0040
     * @tc.desc   param value not valid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetThreeLetterRegion_static_0040', Level.LEVEL3, async (): Promise<void> => {
      try {
        let language: string = i18n.I18NUtil.getThreeLetterRegion('aa')
      } catch (e) {
        e = e as BusinessError;
        console.log('testGetThreeLetterRegion_static_0040' + e.code + e.message);
        expect(e.code).assertEqual('890001');
      }
    })


    /**
     * @tc.name   testGetThreeLetterRegion_static_0100
     * @tc.number SUB_GLOBAL_getThreeLetterRegion_static_0100
     * @tc.desc   transfer GB and return GBR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetThreeLetterRegion_static_0100', Level.LEVEL2, async (): Promise<void> => {
      let language: string = i18n.I18NUtil.getThreeLetterRegion('GB')
      console.info('testGetThreeLetterRegion_static_0100', language);
      expect('GBR').assertEqual(language);
    })

    /**
     * @tc.name   SUB_GLOBAL_I18N_getDisplayLanguage_static_0200
     * @tc.number SUB_GLOBAL_I18N_getDisplayLanguage_static_0200
     * @tc.desc   errcode 890001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_GLOBAL_I18N_getDisplayLanguage_static_0200', Level.LEVEL3, async (): Promise<void> => {
      try {
        i18n.System.getDisplayLanguage('2', '1');
      } catch (err) {
        let error = err as BusinessError
        console.log('SUB_GLOBAL_I18N_getDisplayLanguage_static_0200 code&message:' + error.code + error.message);
        expect(error.code == 890001).assertTrue();
      }
    })

    /**
     * @tc.name   SUB_GLOBAL_I18N_getSystemCountries_static_0100
     * @tc.number SUB_GLOBAL_I18N_getSystemCountries_static_0100
     * @tc.desc   errcode 890001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_GLOBAL_I18N_getSystemCountries_static_0100', Level.LEVEL3, async (): Promise<void> => {
      try {
        i18n.System.getSystemCountries('xx');
        console.log('SUB_GLOBAL_I18N_getSystemCountries_static_0100: 1++');
      } catch (err) {
        let error = err as BusinessError
        console.log('SUB_GLOBAL_I18N_getSystemCountries_static_0100: code&message:' + error.code + error.message);
        expect(error.code == 890001).assertTrue();
      }
    })

    /**
     * @tc.name   SUB_GLOBAL_I18N_isSuggested_static_0200
     * @tc.number SUB_GLOBAL_I18N_isSuggested_static_0200
     * @tc.desc   errcode 890001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_GLOBAL_I18N_isSuggested_static_0200', Level.LEVEL3, async (): Promise<void> => {
      try {
        i18n.System.isSuggested("aaa", '111');
        console.log('SUB_GLOBAL_I18N_isSuggested_static_0200:asdf');
      } catch (err) {
        let error = err as BusinessError
        console.log('SUB_GLOBAL_I18N_isSuggested_static_0200:code&message:' + error.code + error.message);
        expect(error.code == 890001).assertTrue();
      }
    })

    /**
     * @tc.name   SUB_GLOBAL_I18N_getTimePeriodName_static_0200
     * @tc.number SUB_GLOBAL_I18N_getTimePeriodName_static_0200
     * @tc.desc   getTimePeriodName errcode 890001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_GLOBAL_I18N_getTimePeriodName_static_0200', Level.LEVEL3, async (): Promise<void> => {
      try {
        i18n.I18NUtil.getTimePeriodName(2, 'invalid');
      } catch (e) {
        e = e as BusinessError;
        console.log('SUB_GLOBAL_I18N_getTimePeriodName_static_0200 code&message:' + e.code + e.message);
        expect(e.code == 890001).assertTrue();
      }
    })

    /**
     * @tc.name   SUB_GLOBAL_I18N_unitConvert_static_0100
     * @tc.number SUB_GLOBAL_I18N_unitConvert_static_0100
     * @tc.desc   unitConvert
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_I18N_unitConvert_static_0100', Level.LEVEL2, async (): Promise<void> => {
      let value = i18n.I18NUtil.unitConvert({ unit: 'cup', measureSystem: 'US' },
        { unit: 'liter', measureSystem: 'SI' },
        1000,
        'en-US');
      console.log('SUB_GLOBAL_I18N_unitConvert_static_0100 ' + value);
      expect(value).assertContain('236.588');
    })

    /**
     * @tc.name   i18n_calendar_test_static_2600
     * @tc.number i18n_calendar_test_static_2600
     * @tc.desc   getCalendar
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('i18n_calendar_test_static_2600', Level.LEVEL2, async (): Promise<void> => {
      let calendar = i18n.getCalendar('zh');
      calendar.set(2021, 11, 11, 10);
      let value = calendar.isWeekend();
      console.log('i18n_calendar_test_static_2600 ' + value);
      expect(value).assertTrue();
    })

    /**
     * @tc.name   SUB_GLOBAL_I18N_getHolidayInfoItemArray_static_0100
     * @tc.number SUB_GLOBAL_I18N_getHolidayInfoItemArray_static_0100
     * @tc.desc   getHolidayInfoItemArray error code 890001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_GLOBAL_I18N_getHolidayInfoItemArray_static_0100', Level.LEVEL3, async (): Promise<void> => {
      try {
        let holidayManager = new i18n.HolidayManager("/system/lib/TR.ics");
        holidayManager.getHolidayInfoItemArray(-1);
      } catch (e) {
        e = e as BusinessError;
        console.log('SUB_GLOBAL_I18N_getHolidayInfoItemArray_static_0100 code&message:' + e.code + e.message);
        expect(e.code).assertEqual(890001)
      }
    })

    /**
     * @tc.name   SUB_GLOBAL_I18N_SR000IFGMS_static_0800
     * @tc.number SUB_GLOBAL_I18N_SR000IFGMS_static_0800
     * @tc.desc   hour=[21,5],at night
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_I18N_SR000IFGMS_static_0800', Level.LEVEL2, async (): Promise<void> => {
      let value = i18n.I18NUtil.getTimePeriodName(5);
      console.log('SUB_GLOBAL_I18N_SR000IFGMS_static_0800:' + value);
      expect(value != null).assertTrue();
    })

    /**
     * @tc.name   dateTimeFormatAdapt_test_static_0010
     * @tc.number SUB_GLOBAL_Localization_foramtAdapt_static_0010
     * @tc.desc   check the dateStyle is adapt to auto
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('dateTimeFormatAdapt_test_static_0010', Level.LEVEL1, async (): Promise<void> => {
      let data = new Date(2020, 11, 20, 14, 23, 16);
      let dateFmt = new intl.DateTimeFormat("zh-CN", {
        dateStyle: 'full'
      });
      console.log('dateTimeFormatAdapt_test_0010:' + dateFmt.format(data));
      expect(dateFmt.format(data)).assertEqual('2020年12月20日星期日');
    })

    /**
     * @tc.name   dateTimeFormatAdapt_test_static_0020
     * @tc.number SUB_GLOBAL_Localization_foramtAdapt_static_0020
     * @tc.desc   check the timeStyle is adapt to auto
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('dateTimeFormatAdapt_test_static_0020', Level.LEVEL1, async (): Promise<void> => {
      let data = new Date(2020, 11, 20, 14, 23, 16);
      let dateFmt = new intl.DateTimeFormat("zh-CN", {
        timeStyle: 'full'
      });
      console.log('dateTimeFormatAdapt_test_0020:' + dateFmt.format(data));
      expect(dateFmt.format(data)).assertEqual('中国标准时间 下午2:23:16');
    })

    /**
     * @tc.name   dateTimeFormatAdapt_test_static_0030
     * @tc.number SUB_GLOBAL_Localization_foramtAdapt_static_0030
     * @tc.desc   check the weekday is adapt to auto
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('dateTimeFormatAdapt_test_static_0030', Level.LEVEL1, async (): Promise<void> => {
      let data = new Date(2020, 11, 20, 14, 23, 16);
      let dateFmt = new intl.DateTimeFormat("zh-CN", {
        weekday: 'long'
      });
      console.log('dateTimeFormatAdapt_test_0030:' + dateFmt.format(data));
      expect(dateFmt.format(data)).assertEqual('星期日');
    })

    /**
     * @tc.name   dateTimeFormatAdapt_test_static_0040
     * @tc.number SUB_GLOBAL_Localization_foramtAdapt_static_0040
     * @tc.desc   check the month is adapt to auto
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('dateTimeFormatAdapt_test_static_0040', Level.LEVEL1, async (): Promise<void> => {
      let data = new Date(2020, 11, 20, 14, 23, 16);
      let dateFmt = new intl.DateTimeFormat("en-gb", {
        month: 'long'
      });
      console.log('dateTimeFormatAdapt_test_0040:' + dateFmt.format(data));
      expect(dateFmt.format(data)).assertEqual('December');
    })

    /**
     * @tc.name   dateTimeFormatAdapt_test_static_0050
     * @tc.number SUB_GLOBAL_Localization_foramtAdapt_static_0050
     * @tc.desc   check the timeZoneName is adapt to auto
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('dateTimeFormatAdapt_test_static_0050', Level.LEVEL1, async (): Promise<void> => {
      let data = new Date(2020, 11, 20, 14, 23, 16);
      let dateFmt = new intl.DateTimeFormat("zh-CN", {
        timeZoneName: 'long'
      });
      console.log('dateTimeFormatAdapt_test_0050:' + dateFmt.format(data));
      expect(dateFmt.format(data)).assertEqual('2020/12/20 中国标准时间');
    })

    /**
     * @tc.name   dateTimeFormatAdapt_test_static_0060
     * @tc.number SUB_GLOBAL_Localization_foramtAdapt_static_0060
     * @tc.desc   check the dayPeriod is adapt to auto
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('dateTimeFormatAdapt_test_static_0060', Level.LEVEL1, async (): Promise<void> => {
      let data = new Date(2020, 11, 20, 14, 23, 16);
      let dateFmt = new intl.DateTimeFormat("zh-CN", {
        dayPeriod: 'long'
      });
      console.log('dateTimeFormatAdapt_test_static_0060:' + dateFmt.format(data));
      expect(dateFmt.format(data)).assertEqual('2020/12/20');
    })

    /**
     * @tc.name   dateTimeFormatAdapt_test_static_0070
     * @tc.number SUB_GLOBAL_Localization_foramtAdapt_static_0070
     * @tc.desc   check the option is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('dateTimeFormatAdapt_test_static_0070', Level.LEVEL1, async (): Promise<void> => {
      let data = new Date(2020, 11, 20, 14, 23, 16);
      let dateFmt = new intl.DateTimeFormat("zh-CN");
      console.log('dateTimeFormatAdapt_test_static_0070:' + dateFmt.format(data));
      let devType = deviceInfo.deviceType;
      if (devType == '2in1' || devType == 'tablet') {
        expect(dateFmt.format(data)).assertEqual('2020年12月20日');
      } else {
        expect(dateFmt.format(data)).assertEqual('2020/12/20');
      }
    })

    /**
     * @tc.name   numberFormatAdapt_test_static_0080
     * @tc.number SUB_GLOBAL_Localization_foramtAdapt_static_0080
     * @tc.desc   format the datetime with currencyDisplay symbol
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('numberFormatAdapt_test_static_0080', Level.LEVEL1, async (): Promise<void> => {
      let data = 123456.789;
      let numFmt = new intl.NumberFormat("en-GB", {
        currencyDisplay: 'symbol'
      });
      console.log('numberFormatAdapt_test_static_0080:' + numFmt.format(data));
      expect(numFmt.format(data)).assertEqual('123,456.789');
    })

    /**
     * @tc.name   numberFormatAdapt_test_static_0090
     * @tc.number SUB_GLOBAL_Localization_foramtAdapt_static_0090
     * @tc.desc   format the datetime with currencyDisplay short
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('numberFormatAdapt_test_static_0090', Level.LEVEL1, async (): Promise<void> => {
      let data = 123456.789;
      let numFmt = new intl.NumberFormat("en-GB", {
        currencyDisplay: 'narrowSymbol'
      });
      console.log('numberFormatAdapt_test_static_0090:' + numFmt.format(data));
      expect(numFmt.format(data)).assertEqual('123,456.789');
    })

    /**
     * @tc.name   numberFormatAdapt_test_static_0150
     * @tc.number SUB_GLOBAL_Localization_foramtAdapt_static_0150
     * @tc.desc   format the datetime with unitDisplay long
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('numberFormatAdapt_test_static_0150', Level.LEVEL1, async (): Promise<void> => {
      console.log('numberFormatAdapt_test_static_0150:' + 'start');
      let numFmt = new intl.NumberFormat("en-GB", {
        style: 'unit', unit: 'meter', unitDisplay: 'long'
      });
      console.log('numberFormatAdapt_test_static_0150' + numFmt.format(123456.789));
      expect(numFmt.format(123456.789)).assertEqual('123,456.789 metres');
    })
    
    /**
     * @tc.name   numberFormatAdapt_test_static_0160
     * @tc.number SUB_GLOBAL_Localization_foramtAdapt_static_0160
     * @tc.desc   format the datetime with unitDisplay long
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('numberFormatAdapt_test_static_0160', Level.LEVEL1, async (): Promise<void> => {
      console.log('numberFormatAdapt_test_static_0160:' + 'start');
      let numFmt = new intl.NumberFormat("en-GB", {
        style: 'unit', unit: 'meter', unitDisplay: 'short'
      });
      console.log('numberFormatAdapt_test_static_0090' + numFmt.format(123456.789));
      expect(numFmt.format(123456.789)).assertEqual('123,456.789 m');
    })

    /**
     * @tc.name   relativeTimeFormatAdapt_test_static_0100
     * @tc.number SUB_GLOBAL_Localization_foramtAdapt_static_0100
     * @tc.desc   format timeStyle is long
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('relativeTimeFormatAdapt_test_static_0100', Level.LEVEL1, async (): Promise<void> => {
      console.log('relativeTimeFormatAdapt_test_static_0100:' + 'start');
      let relativeTimeFmt = new Intl.RelativeTimeFormat("en", {
        style: 'long'
      });
      let value = relativeTimeFmt.format(100, 'second');
      console.log('relativeTimeFormatAdapt_test_static_0100' + value);
      expect(value).assertEqual('in 100 seconds');
    })

    /**
     * @tc.name   relativeTimeFormatAdapt_test_static_0110
     * @tc.number SUB_GLOBAL_Localization_foramtAdapt_static_0110
     * @tc.desc   format the timeStyle is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('relativeTimeFormatAdapt_test_static_0110', Level.LEVEL1, async (): Promise<void> => {
      console.log('relativeTimeFormatAdapt_test_static_0110:' + 'start');
      let relativeTimeFmt = new Intl.RelativeTimeFormat("en");
      let value = relativeTimeFmt.format(100, 'second');
      console.log('relativeTimeFormatAdapt_test_static_0110' + value);
      let devTyp = deviceInfo.deviceType;
      console.log('relativeTimeFormatAdapt_test_static_0110 device' + devTyp);
      if (devTyp == '2in1' || devTyp == 'tablet' || devTyp == 'phone' || devTyp == 'default') {
        expect(value).assertEqual('in 100 seconds');
      } else {
        expect(value).assertEqual('in 100 sec.');
      }
    })


    /**
     * @tc.name   SUB_GLOBAL_numberFormatTyping_static_0100
     * @tc.number SUB_GLOBAL_numberFormatTyping_static_0100
     * @tc.desc   adapter in adding
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_numberFormatTyping_static_0100', Level.LEVEL2, async (): Promise<void> => {
      let option: i18n.PhoneNumberFormatOptions = {
        type: "TYPING"
      };
      let phoneNumberFormat: i18n.PhoneNumberFormat = new i18n.PhoneNumberFormat("CN", option);
      let phoneNumber = "13801048465";
      let arr: Array<String> = ['1', '13', '138', '138 0', '138 01', '138 010', '138 0104', '1380 1048', '138 0104 84',
        '138 0104 846', '138 0104 8465']
      let formatted = "";
      let k = 0;
      for (let i of phoneNumber) {
        formatted = formatted + i;
        let result = phoneNumberFormat.format(formatted);
        console.info('SUB_GLOBAL_numberFormatTyping_static_0100_arr', arr[k])
        expect(result).assertEqual(arr[k])
        k += 1
      }
    })

    /**
     * @tc.name   SUB_GLOBAL_numberFormatTyping_static_0200
     * @tc.number SUB_GLOBAL_numberFormatTyping_static_0200
     * @tc.desc   adapter in delete
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_numberFormatTyping_static_0200', Level.LEVEL2, async (): Promise<void> => {
      let option: i18n.PhoneNumberFormatOptions = {
        type: "TYPING"
      };
      let phoneNumberFormat: i18n.PhoneNumberFormat = new i18n.PhoneNumberFormat("CN", option);
      let phoneNumber = "13801048465";
      let result = phoneNumberFormat.format(phoneNumber.substring(0, phoneNumber.length - 1));
      expect(result).assertEqual('138 0104 846')
    })


    /**
     * @tc.name   SUB_GLOBAL_numberFormatTyping_static_0300
     * @tc.number SUB_GLOBAL_numberFormatTyping_static_0300
     * @tc.desc   not CN phone number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_GLOBAL_numberFormatTyping_static_0300', Level.LEVEL1, async (): Promise<void> => {
      let option: i18n.PhoneNumberFormatOptions = {
        type: "TYPING"
      };
      let phoneNumberFormat: i18n.PhoneNumberFormat = new i18n.PhoneNumberFormat("CN", option);
      let phoneNumber = "00886960186456";
      let arr: Array<String> = ['0', '00', '00 8', '00 88', '00 886 ', '00 886 9', '00 886 96', '00 886 960',
        '00 886 960 1', '00 886 960 18', '00 886 960 186', '00 886 960 186 4', '00 886 960 186 45',
        '00 886 960 186 456']
      let formatted = "";
      let k = 0
      for (let i of phoneNumber) {
        formatted = formatted + i;
        let result = phoneNumberFormat.format(formatted);
        console.info('SUB_GLOBAL_numberFormatTyping_static_0300_arr', arr[k])
        expect(result).assertEqual(arr[k])
        k += 1
      }
    })

    console.log('*************end i18nStageTest*************');
  })
}