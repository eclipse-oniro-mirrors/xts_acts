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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level} from '@ohos/hypium'
import I18n from '@ohos.i18n'
import Intl from '@ohos.intl'
import deviceInfo from '@ohos.deviceInfo'

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

    //11月27号编写
    /**
     * @tc.name   SUB_GLOBAL_I18N_SR000IFGMS_0100
     * @tc.number SUB_GLOBAL_I18N_getTimeInMillis_0100
     * @tc.desc   hour=[21,5],local="en-US",at night
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_GLOBAL_I18N_SR000IFGMS_0100', Level.LEVEL0, () => {
      let value = I18n.I18NUtil.getTimePeriodName(5, "en-US");
      console.log('SUB_GLOBAL_I18N_SR000IFGMS_0100:' + value);
      expect(value == "at night").assertTrue();
    })

    /**
     * @tc.name   SUB_GLOBAL_I18N_SR000IFGMS_0200
     * @tc.number SUB_GLOBAL_I18N_getTimeInMillis_0200
     * @tc.desc   hour=[6,11],local="en-US",in the morning
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_I18N_SR000IFGMS_0200', Level.LEVEL2, () => {
      let value = I18n.I18NUtil.getTimePeriodName(11, "en-US");
      console.log('SUB_GLOBAL_I18N_SR000IFGMS_0200:' + value);
      expect(value == "in the morning").assertTrue();
    })

    /**
     * @tc.name   SUB_GLOBAL_I18N_SR000IFGMS_0300
     * @tc.number SUB_GLOBAL_I18N_getTimeInMillis_0300
     * @tc.desc   hour=12,local="en-US",noon
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_I18N_SR000IFGMS_0300', Level.LEVEL2, () => {
      let value = I18n.I18NUtil.getTimePeriodName(12, "en-US");
      console.log('SUB_GLOBAL_I18N_SR000IFGMS_0300:' + value);
      expect(value == "noon").assertTrue();
    })

    /**
     * @tc.name   SUB_GLOBAL_I18N_SR000IFGMS_0400
     * @tc.number SUB_GLOBAL_I18N_getTimeInMillis_0400
     * @tc.desc   hour=[13,17],local="en-US",in the afternoon
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_I18N_SR000IFGMS_0400', Level.LEVEL2, () => {
      let value = I18n.I18NUtil.getTimePeriodName(41, "en-US"); //41%24=17
      console.log('SUB_GLOBAL_I18N_SR000IFGMS_0400:' + value);
      expect(value == "in the afternoon").assertTrue();
    })

    /**
     * @tc.name   SUB_GLOBAL_I18N_SR000IFGMS_0500
     * @tc.number SUB_GLOBAL_I18N_getTimeInMillis_0500
     * @tc.desc   hour=[18,20],local="en-US",in the evening
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_I18N_SR000IFGMS_0500', Level.LEVEL2, () => {
      let value = I18n.I18NUtil.getTimePeriodName(-4, "en-US"); //24+(-4)=20
      console.log('SUB_GLOBAL_I18N_SR000IFGMS_0500:' + value);
      expect(value == "in the evening").assertTrue();
    })

    /**
     * @tc.name   SUB_GLOBAL_I18N_SR000IFGMS_0600
     * @tc.number SUB_GLOBAL_I18N_getTimeInMillis_0600
     * @tc.desc   hour=12,local=""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_I18N_SR000IFGMS_0600', Level.LEVEL2, () => {
      try {
        let value = I18n.I18NUtil.getTimePeriodName(12, "");
        console.log('SUB_GLOBAL_I18N_SR000IFGMS_0600:' + value);
      } catch (e) {
        console.log('SUB_GLOBAL_I18N_SR000IFGMS_0600 code&message:' + e.code + e.message);
        expect(e.code == 890001).assertTrue();
      }
    })

    /**
     * @tc.name   SUB_GLOBAL_I18N_SR000IFGMS_0700
     * @tc.number SUB_GLOBAL_I18N_getTimeInMillis_0700
     * @tc.desc   hour=12,local=invalid string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_I18N_SR000IFGMS_0700', Level.LEVEL2, () => {
      try {
        let value = I18n.I18NUtil.getTimePeriodName(12, "abcd");
        console.log('SUB_GLOBAL_I18N_SR000IFGMS_0700:' + value);
      } catch (e) {
        console.log('SUB_GLOBAL_I18N_SR000IFGMS_0700 code&message:' + e.code + e.message);
        expect(e.code == 890001).assertTrue();
      }
    })

    /**
     * @tc.name   SUB_GLOBAL_I18N_SR000IFGNH_0010
     * @tc.number SUB_GLOBAL_I18N_HolidayManager_0010
     * @tc.desc   HolidayManager-input .ics file
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_I18N_SR000IFGNH_0010', Level.LEVEL2, () => {
      try {
        let holidayManager = new I18n.HolidayManager("/system/lib/TR.ics");
        console.log('SUB_GLOBAL_I18N_SR000IFGNH_0010:' + holidayManager);
      } catch (e) {
        console.log('SUB_GLOBAL_I18N_SR000IFGNH_0010 code&message:' + e.code + e.message);
        expect(e.code == null).assertTrue();
      }
    })

    /**
     * @tc.name   SUB_GLOBAL_I18N_SR000IFGNH_0020
     * @tc.number SUB_GLOBAL_I18N_HolidayManager_0020
     * @tc.desc   HolidayManager-input .xml file
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_GLOBAL_I18N_SR000IFGNH_0020', Level.LEVEL3, () => {
      try {
        let holidayManager = new I18n.HolidayManager("A.xml");
        console.log('SUB_GLOBAL_I18N_SR000IFGNH_0020:' + holidayManager);
      } catch (e) {
        console.log('SUB_GLOBAL_I18N_SR000IFGNH_0020 code&message:' + e.code + e.message);
        expect(e.code == '890001').assertTrue();
      }
    })

    /**
     * @tc.name   SUB_GLOBAL_I18N_SR000IFGNH_0030
     * @tc.number SUB_GLOBAL_I18N_isHoliday_0030
     * @tc.desc   isHoliday-input null(The current date is used by default)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_I18N_SR000IFGNH_0030', Level.LEVEL2, () => {
      let holidayManager = new I18n.HolidayManager("/system/lib/TR.ics");
      let isHoliday = holidayManager.isHoliday();
      console.log('SUB_GLOBAL_I18N_SR000IFGNH_0030:' + isHoliday);
      expect(isHoliday == false).assertTrue();
    })

    /**
     * @tc.name   SUB_GLOBAL_I18N_SR000IFGNH_0050
     * @tc.number SUB_GLOBAL_I18N_isHoliday_0050
     * @tc.desc   isHoliday-input correct date (is not holiday) parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_I18N_SR000IFGNH_0050', Level.LEVEL2, () => {
      let holidayManager = new I18n.HolidayManager("/system/lib/TR.ics");
      let isHoliday = holidayManager.isHoliday(new Date(2020, 6, 25));
      console.log('SUB_GLOBAL_I18N_SR000IFGNH_0050:' + isHoliday);
      expect(isHoliday == false).assertTrue();
    })

    /**
     * @tc.name   SUB_GLOBAL_I18N_SR000IFGNH_0070
     * @tc.number SUB_GLOBAL_I18N_getHolidayInfoItemArray_0070
     * @tc.desc   getHolidayInfoItemArray-input null(The current year is used by default)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_I18N_SR000IFGNH_0070', Level.LEVEL2, () => {
      let holidayManager = new I18n.HolidayManager("/system/lib/TR.ics");
      let holidayInfoItemArray = holidayManager.getHolidayInfoItemArray();
      console.log('SUB_GLOBAL_I18N_SR000IFGNH_0070:' + holidayInfoItemArray);
      expect(holidayInfoItemArray != null).assertTrue();
    })

    /**
     * @tc.name   SUB_GLOBAL_I18N_SR000IFGNH_0080
     * @tc.number SUB_GLOBAL_I18N_getHolidayInfoItemArray_0080
     * @tc.desc   getHolidayInfoItemArray-input correct year parameter (contain holidays)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_I18N_SR000IFGNH_0080', Level.LEVEL2, () => {
      let holidayManager = new I18n.HolidayManager("/system/lib/TR.ics");
      let holidayInfoItemArray = holidayManager.getHolidayInfoItemArray(2023);
      console.log('SUB_GLOBAL_I18N_SR000IFGNH_0080:' + holidayInfoItemArray);
      expect(holidayInfoItemArray != null).assertTrue();
    })

    /**
     * @tc.name   SUB_GLOBAL_I18N_SR000IFGNH_0090
     * @tc.number SUB_GLOBAL_I18N_getHolidayInfoItemArray_0090
     * @tc.desc   getHolidayInfoItemArray-input correct number parameter (don't contain holidays)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_I18N_SR000IFGNH_0090', Level.LEVEL2, () => {
      let holidayManager = new I18n.HolidayManager("/system/lib/TR.ics");
      let holidayInfoItemArray = holidayManager.getHolidayInfoItemArray(2022);
      console.log('SUB_GLOBAL_I18N_SR000IFGNH_0090:' + holidayInfoItemArray);
      expect(holidayInfoItemArray.length == 0).assertTrue();
    })

    /**
     * @tc.name   SUB_GLOBAL_I18N_SR000IET4P_0100
     * @tc.number SUB_GLOBAL_I18N_add_0100
     * @tc.desc   add - amount >= 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_GLOBAL_I18N_SR000IET4P_0100', Level.LEVEL0, () => {
      let calendar: I18n.Calendar = I18n.getCalendar("zh-Hans");
      calendar.set(2023, 9, 22, 18, 0, 0); //set time to 2023.9.22 18:00:00
      calendar.add("year", 2); //2023+2
      let year: number = calendar.get("year"); //year = 2025
      console.log('SUB_GLOBAL_I18N_SR000IET4P_0100:' + year);
      expect(year == 2025).assertTrue();
    })

    /**
     * @tc.name   SUB_GLOBAL_I18N_SR000IET4P_0200
     * @tc.number SUB_GLOBAL_I18N_add_0200
     * @tc.desc   add - amount parameter input 'week_of_year'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_I18N_SR000IET4P_0200', Level.LEVEL2, () => {
      let calendar: I18n.Calendar = I18n.getCalendar("zh-Hans");
      calendar.set(2023, 9, 22, 18, 0, 0); //set time to 2023.9.22 18:00:00
      calendar.add("week_of_year", 2); //add 2 weeks
      let month: number = calendar.get("month"); //month = 10
      let date: number = calendar.get("date");
      console.log('SUB_GLOBAL_I18N_SR000IET4P_0200_month:' + month);
      console.log('SUB_GLOBAL_I18N_SR000IET4P_0200_date:' + date);
      expect(month == 10 && date == 5).assertTrue();
    })

    /**
     * @tc.name   SUB_GLOBAL_I18N_SR000IET4P_0300
     * @tc.number SUB_GLOBAL_I18N_add_0300
     * @tc.desc   add - amount < 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_I18N_SR000IET4P_0300', Level.LEVEL2, () => {
      let calendar: I18n.Calendar = I18n.getCalendar("zh-Hans");
      calendar.set(2023, 9, 22, 18, 0, 0); //set time to 2023.9.22 18:00:00
      calendar.add("year", -1); //2023-2
      let year: number = calendar.get("year"); //year = 2022
      console.log('SUB_GLOBAL_I18N_SR000IET4P_0300:' + year);
      expect(year == 2022).assertTrue();
    })

    /**
     * @tc.name   SUB_GLOBAL_I18N_SR000IET4P_0600
     * @tc.number SUB_GLOBAL_I18N_add_0600
     * @tc.desc   add - filed parameter input invalid parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_I18N_SR000IET4P_0600', Level.LEVEL2, () => {
      try {
        let calendar: I18n.Calendar = I18n.getCalendar("zh-Hans");
        calendar.set(2023, 9, 22, 18, 0, 0); //set time to 2023.9.22 18:00:00
        calendar.add("test", 2);
        let year: number = calendar.get("year"); //year = 2022
        console.log('SUB_GLOBAL_I18N_SR000IET4P_0600:' + year);
      } catch (e) {
        console.log('SUB_GLOBAL_I18N_SR000IET4P_0600 code&message:' + e.code + e.message);
        expect(e.code == '890001').assertTrue();
      }
    })

    /**
     * @tc.name   SUB_GLOBAL_I18N_SR000IET4P_0700
     * @tc.number SUB_GLOBAL_I18N_getTimeInMillis_0700
     * @tc.desc   add - filed parameter input invalid parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_I18N_SR000IET4P_0700', Level.LEVEL2, () => {
      let calendar: I18n.Calendar = I18n.getCalendar("zh-Hans");
      calendar.setTime(5000);
      let millisecond: number = calendar.getTimeInMillis(); //millisecond = 5000
      console.log('SUB_GLOBAL_I18N_SR000IET4P_0700:' + millisecond);
      expect(millisecond == 5000).assertTrue();
    })

    /**
     * @tc.name   SUB_GLOBAL_I18N_CompareDays_0100
     * @tc.number SUB_GLOBAL_I18N_compareDays_0100
     * @tc.desc   CompareDays - Compare the Date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_GLOBAL_I18N_CompareDays_0100', Level.LEVEL0, () => {
      let calendar: I18n.Calendar = I18n.getCalendar("zh-Hans");
      calendar.set(2023, 9, 22, 18, 0, 0); //set time to 2023.9.22 18:00:00
      let date: Date = new Date(2023, 9, 23, 19, 0, 0);
      let diff: number = calendar.compareDays(date);
      console.log('SUB_GLOBAL_I18N_CompareDays_0100:' + diff);
      expect(diff == 2).assertTrue();
    })

    /**
     * @tc.name   SUB_GLOBAL_I18N_CompareDays_0200
     * @tc.number SUB_GLOBAL_I18N_compareDays_0200
     * @tc.desc   CompareDays - Compare the Date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_I18N_CompareDays_0200', Level.LEVEL2, () => {
      let calendar: I18n.Calendar = I18n.getCalendar("zh-Hans");
      calendar.set(2023, 9, 22, 18, 0, 0); //set time to 2023.9.22 18:00:00
      let date: Date = new Date(2023, 9, 20, 13, 0, 0);
      let diff: number = calendar.compareDays(date);
      console.log('SUB_GLOBAL_I18N_CompareDays_0200:' + diff);
      expect(diff == -3).assertTrue();
    })

    /**
     * @tc.name   SUB_GLOBAL_I18N_CompareDays_0300
     * @tc.number SUB_GLOBAL_I18N_compareDays_0300
     * @tc.desc   CompareDays - Compare the Date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_I18N_CompareDays_0300', Level.LEVEL2, () => {
      let calendar: I18n.Calendar = I18n.getCalendar("zh-Hans");
      calendar.setTime(5000);
      let date: Date = new Date(6000);
      let diff: number = calendar.compareDays(date);
      console.log('SUB_GLOBAL_I18N_CompareDays_0300:' + diff);
      expect(diff == 1).assertTrue();
    })

    /**
     * @tc.name   SUB_GLOBAL_I18N_EntityRecognizer_0100
     * @tc.number SUB_GLOBAL_I18N_EntityRecognizer_0100
     * @tc.desc   findEntityInfo - Identifying Entity Information in Text
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_GLOBAL_I18N_EntityRecognizer_0100', Level.LEVEL0, () => {
      let entityRecognizer: I18n.EntityRecognizer = new I18n.EntityRecognizer("zh-CN");
      let text: string = "如有疑问，请联系13801048417";
      let result = entityRecognizer.findEntityInfo(text);
      console.log('SUB_GLOBAL_I18N_EntityRecognizer_0100 type:' + result[0].type);
      console.log('SUB_GLOBAL_I18N_EntityRecognizer_0100 begin:' + result[0].begin);
      console.log('SUB_GLOBAL_I18N_EntityRecognizer_0100 end:' + result[0].end);
      expect(result[0].type == "phone_number").assertTrue();
      expect(result[0].begin == 8).assertTrue();
      expect(result[0].end == 19).assertTrue();
    })

    /**
     * @tc.name   SUB_GLOBAL_I18N_EntityRecognizer_0200
     * @tc.number SUB_GLOBAL_I18N_EntityRecognizer_0200
     * @tc.desc   findEntityInfo - Identifying Entity Information in Text
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_I18N_EntityRecognizer_0200', Level.LEVEL2, () => {
      let entityRecognizer: I18n.EntityRecognizer = new I18n.EntityRecognizer("zh-CN");
      let text: string = "如有疑问，请联系010 1234 5678";
      let result = entityRecognizer.findEntityInfo(text);
      console.log('SUB_GLOBAL_I18N_EntityRecognizer_0200 type:' + result[0].type);
      console.log('SUB_GLOBAL_I18N_EntityRecognizer_0200 begin:' + result[0].begin);
      console.log('SUB_GLOBAL_I18N_EntityRecognizer_0200 end:' + result[0].end);
      expect(result[0].type == "phone_number").assertTrue();
      expect(result[0].begin == 8).assertTrue();
      expect(result[0].end == 21).assertTrue();
    })

    /**
     * @tc.name   SUB_GLOBAL_I18N_EntityRecognizer_0400
     * @tc.number SUB_GLOBAL_I18N_EntityRecognizer_0400
     * @tc.desc   findEntityInfo - no recognizable entity information in Text
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_I18N_EntityRecognizer_0400', Level.LEVEL2, () => {
      let entityRecognizer: I18n.EntityRecognizer = new I18n.EntityRecognizer("zh-CN");
      let text: string = "如有疑问，请联系我";
      let result = entityRecognizer.findEntityInfo(text);
      console.log('SUB_GLOBAL_I18N_EntityRecognizer_0400:' + result);
      expect(result.length == 0).assertTrue();
    })

    /**
     * @tc.name   SUB_GLOBAL_I18N_EntityRecognizer_0600
     * @tc.number SUB_GLOBAL_I18N_EntityRecognizer_0600
     * @tc.desc   findEntityInfo - Identifying Entity Information in Text
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_I18N_EntityRecognizer_0600', Level.LEVEL2, () => {
      let entityRecognizer: I18n.EntityRecognizer = new I18n.EntityRecognizer("en-GB");
      let text: string = "If you have any questions, Please call 13801048417";
      let result = entityRecognizer.findEntityInfo(text);
      console.log('SUB_GLOBAL_I18N_EntityRecognizer_0600 type:' + result[0].type);
      console.log('SUB_GLOBAL_I18N_EntityRecognizer_0600 begin:' + result[0].begin);
      console.log('SUB_GLOBAL_I18N_EntityRecognizer_0600 end:' + result[0].end);
      expect(result[0].type == "phone_number").assertTrue();
      expect(result[0].begin == 39).assertTrue();
      expect(result[0].end == 50).assertTrue();
    })

    /**
     * @tc.name   SUB_GLOBAL_I18N_EntityRecognizer_0800
     * @tc.number SUB_GLOBAL_I18N_EntityRecognizer_0800
     * @tc.desc   findEntityInfo - Identifying Entity Date Information in Text(Chinese)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_I18N_EntityRecognizer_0800', Level.LEVEL2, () => {
      let entityRecognizer: I18n.EntityRecognizer = new I18n.EntityRecognizer("zh-CN");
      let text: string = "我们2023年12月1日下午8点一起吃饭吧。";
      let result = entityRecognizer.findEntityInfo(text);
      console.log('SUB_GLOBAL_I18N_EntityRecognizer_0800 type:' + result[0].type);
      console.log('SUB_GLOBAL_I18N_EntityRecognizer_0800 begin:' + result[0].begin);
      console.log('SUB_GLOBAL_I18N_EntityRecognizer_0800 end:' + result[0].end);
      expect(result[0].type == "date").assertTrue();
      expect(result[0].begin == 2).assertTrue();
      expect(result[0].end == 16).assertTrue();
    })

    /**
     * @tc.name   SUB_GLOBAL_I18N_EntityRecognizer_0900
     * @tc.number SUB_GLOBAL_I18N_EntityRecognizer_0900
     * @tc.desc   findEntityInfo - Identifying Entity Date Information in Text(Chinese)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_I18N_EntityRecognizer_0900', Level.LEVEL2, () => {
      let entityRecognizer: I18n.EntityRecognizer = new I18n.EntityRecognizer("zh-CN");
      let text: string = "今天下午3点到5点有个会议。";
      let result = entityRecognizer.findEntityInfo(text);
      console.log('SUB_GLOBAL_I18N_EntityRecognizer_0900 type:' + result[0].type);
      console.log('SUB_GLOBAL_I18N_EntityRecognizer_0900 begin:' + result[0].begin);
      console.log('SUB_GLOBAL_I18N_EntityRecognizer_0900 end:' + result[0].end);
      expect(result[0].type == "date").assertTrue();
      expect(result[0].begin == 0).assertTrue();
      expect(result[0].end == 9).assertTrue();
    })

    /**
     * @tc.name   SUB_GLOBAL_I18N_EntityRecognizer_1000
     * @tc.number SUB_GLOBAL_I18N_EntityRecognizer_1000
     * @tc.desc   findEntityInfo - Identifying Entity Date Information in Text(English)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_I18N_EntityRecognizer_1000', Level.LEVEL2, () => {
      let entityRecognizer: I18n.EntityRecognizer = new I18n.EntityRecognizer("en-GB");
      let text: string = "Let's have dinner in December 1, 2023.";
      let result = entityRecognizer.findEntityInfo(text);
      console.log('SUB_GLOBAL_I18N_EntityRecognizer_1000:' + result);
      expect([result[0].type, result[1].type].indexOf("date") != -1).assertTrue();
      expect([result[0].begin, result[1].begin].indexOf(21) != -1).assertTrue();
      expect([result[0].end, result[1].end].indexOf(37) != -1).assertTrue();
    })

    /**
     * @tc.name   SUB_GLOBAL_I18N_EntityRecognizer_1100
     * @tc.number SUB_GLOBAL_I18N_EntityRecognizer_1100
     * @tc.desc   findEntityInfo - Identifying Entity Date Information in Text(English)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_I18N_EntityRecognizer_1100', Level.LEVEL2, () => {
      let entityRecognizer: I18n.EntityRecognizer = new I18n.EntityRecognizer("en-GB");
      let text: string = "The time is 11/10/2023-11/13/2023.";
      let result = entityRecognizer.findEntityInfo(text);
      console.log('SUB_GLOBAL_I18N_EntityRecognizer_1100:' + result);
      expect(result[1].type == "date").assertTrue();
      expect(result[1].begin == 12).assertTrue();
      expect(result[1].end == 34).assertTrue();
    })

    /**
     * @tc.name   SUB_GLOBAL_I18N_AppPreferredLanguage_0100
     * @tc.number SUB_GLOBAL_I18N_AppPreferredLanguage_0100
     * @tc.desc   setAppPreferredLanguage - Set App Preferred Language
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_GLOBAL_I18N_AppPreferredLanguage_0100', Level.LEVEL0, () => {
      try {
        I18n.System.setAppPreferredLanguage('zh'); //设置应用偏好语言
      } catch (e) {
        console.log('SUB_GLOBAL_I18N_AppPreferredLanguage_0100 code&message:' + e.code + e.message);
        expect(e.code).assertNull();
      }
    })

    /**
     * @tc.name   SUB_GLOBAL_I18N_AppPreferredLanguage_0200
     * @tc.number SUB_GLOBAL_I18N_AppPreferredLanguage_0200
     * @tc.desc   setAppPreferredLanguage - Set App Preferred Language to invalid language
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_GLOBAL_I18N_AppPreferredLanguage_0200', Level.LEVEL3, () => {
      try {
        I18n.System.setAppPreferredLanguage('1'); //设置应用偏好语言
      } catch (e) {
        console.log('SUB_GLOBAL_I18N_AppPreferredLanguage_0200 code&message:' + e.code + e.message);
        expect(e.code == 890001).assertTrue();
      }
    })

    /**
     * @tc.name   SUB_GLOBAL_I18N_AppPreferredLanguage_0400
     * @tc.number SUB_GLOBAL_I18N_AppPreferredLanguage_0400
     * @tc.desc   setAppPreferredLanguage - Set App Preferred Language to zh-CN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_I18N_AppPreferredLanguage_0400', Level.LEVEL2, () => {
      I18n.System.setAppPreferredLanguage('zh-CN'); //设置应用偏好语言'zh-CN'
      let appPreferredLanguage: string = I18n.System.getAppPreferredLanguage();
      console.log('SUB_GLOBAL_I18N_AppPreferredLanguage_0400:' + appPreferredLanguage);
      expect(appPreferredLanguage == 'zh-CN').assertTrue();
    })

    /**
     * @tc.name   dateTimeFormatAdapt_test_0010
     * @tc.number SUB_GLOBAL_Localization_foramtAdapt_0010
     * @tc.desc   check the dateStyle is adapt to full
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('dateTimeFormatAdapt_test_0010', Level.LEVEL2, () => {
      let data = new Date(2020, 11, 20, 14, 23, 16);
      let dateFmt = new Intl.DateTimeFormat("zh-CN", {
        dateStyle: 'full'
      });
      console.log('dateTimeFormatAdapt_test_0010:' + dateFmt.format(data));
      expect(dateFmt.format(data)).assertEqual('2020年12月20日星期日');
    })

    /**
     * @tc.name   dateTimeFormatAdapt_test_0020
     * @tc.number SUB_GLOBAL_Localization_foramtAdapt_0020
     * @tc.desc   check the timeStyle is adapt to full
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('dateTimeFormatAdapt_test_0020', Level.LEVEL1, () => {
      let data = new Date(2020, 11, 20, 14, 23, 16);
      let dateFmt = new Intl.DateTimeFormat("zh-CN", {
        timeStyle: 'full',
        hourCycle: 'h12'
      });
      console.log('dateTimeFormatAdapt_test_0020:' + dateFmt.format(data));
      expect(dateFmt.format(data)).assertEqual('中国标准时间 下午2:23:16');
    })

    /**
     * @tc.name   dateTimeFormatAdapt_test_0030
     * @tc.number SUB_GLOBAL_Localization_foramtAdapt_0030
     * @tc.desc   check the weekday is adapt to long
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('dateTimeFormatAdapt_test_0030', Level.LEVEL1, () => {
      let data = new Date(2020, 11, 20, 14, 23, 16);
      let dateFmt = new Intl.DateTimeFormat("zh-CN", {
        weekday: 'long'
      });
      console.log('dateTimeFormatAdapt_test_0030:' + dateFmt.format(data));
      expect(dateFmt.format(data)).assertEqual('星期日');
    })

    /**
     * @tc.name   dateTimeFormatAdapt_test_0040
     * @tc.number SUB_GLOBAL_Localization_foramtAdapt_0040
     * @tc.desc   check the month is adapt to long
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('dateTimeFormatAdapt_test_0040', Level.LEVEL1, () => {
      let data = new Date(2020, 11, 20, 14, 23, 16);
      let dateFmt = new Intl.DateTimeFormat("en-gb", {
        month: 'long'
      });
      console.log('dateTimeFormatAdapt_test_0040:' + dateFmt.format(data));
      expect(dateFmt.format(data)).assertEqual('December');
    })

    /**
     * @tc.name   dateTimeFormatAdapt_test_0050
     * @tc.number SUB_GLOBAL_Localization_foramtAdapt_0050
     * @tc.desc   check the timeZoneName is adapt to long
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('dateTimeFormatAdapt_test_0050', Level.LEVEL1, () => {
      let data = new Date(2020, 11, 20, 14, 23, 16);
      let dateFmt = new Intl.DateTimeFormat("zh-CN", {
        timeZoneName: 'long'
      });
      console.log('dateTimeFormatAdapt_test_0050:' + dateFmt.format(data));
      expect(dateFmt.format(data)).assertEqual('2020/12/20 中国标准时间');
    })

    /**
     * @tc.name   dateTimeFormatAdapt_test_0060
     * @tc.number SUB_GLOBAL_Localization_foramtAdapt_0060
     * @tc.desc   check the dayPeriod is adapt to auto
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('dateTimeFormatAdapt_test_0060', Level.LEVEL1, () => {
      let data = new Date(2020, 11, 20, 14, 23, 16);
      let dateFmt = new Intl.DateTimeFormat("zh-CN", {
        dayPeriod: 'auto'
      });
      console.log('dateTimeFormatAdapt_test_0060:' + dateFmt.format(data));
      expect(dateFmt.format(data)).assertEqual('2020/12/20');
    })

    /**
     * @tc.name   dateTimeFormatAdapt_test_0070
     * @tc.number SUB_GLOBAL_Localization_foramtAdapt_0070
     * @tc.desc   check the option dateStyle is full
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('dateTimeFormatAdapt_test_0070', Level.LEVEL1, () => {
      let data = new Date(2020, 11, 20, 14, 23, 16);
      let dateFmt = new Intl.DateTimeFormat("zh-CN", {
        dateStyle: 'full'
      });
      console.log('dateTimeFormatAdapt_test_0070:' + dateFmt.format(data));
      expect(dateFmt.format(data)).assertEqual('2020年12月20日星期日');
    })

    /**
     * @tc.name   numberFormatAdapt_test_0080
     * @tc.number SUB_GLOBAL_Localization_foramtAdapt_0080
     * @tc.desc   format the datetime with currencyDisplay symbol
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('numberFormatAdapt_test_0080', Level.LEVEL1, () => {
      let data = 123456.789;
      let numFmt = new Intl.NumberFormat("en-GB", {
        currencyDisplay: 'symbol'
      });
      console.log('numberFormatAdapt_test_0080:' + numFmt.format(data));
      expect(numFmt.format(data)).assertEqual('123,456.789');
    })

    /**
     * @tc.name   numberFormatAdapt_test_0090
     * @tc.number SUB_GLOBAL_Localization_foramtAdapt_0090
     * @tc.desc   format the datetime with currencyDisplay short
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('numberFormatAdapt_test_0090', Level.LEVEL1, () => {
      let data = 123456.789;
      let numFmt = new Intl.NumberFormat("en-GB", {
        currencyDisplay: 'narrowSymbol'
      });
      console.log('numberFormatAdapt_test_0090:' + numFmt.format(data));
      expect(numFmt.format(data)).assertEqual('123,456.789');
    })

    /**
     * @tc.name   numberFormatAdapt_test_0150
     * @tc.number SUB_GLOBAL_Localization_foramtAdapt_0150
     * @tc.desc   format the datetime with unitDisplay long
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('numberFormatAdapt_test_0150', Level.LEVEL1, () => {
      console.log('numberFormatAdapt_test_0150:' + 'start');
      let numFmt = new Intl.NumberFormat("en-GB", {
        style: 'unit', unit: 'meter', unitDisplay: 'long'
      });
      console.log('numberFormatAdapt_test_0150' + numFmt.format(123456.789));
      expect(numFmt.format(123456.789)).assertEqual('123,456.789 metres');
    })

    /**
     * @tc.name   numberFormatAdapt_test_0160
     * @tc.number SUB_GLOBAL_Localization_foramtAdapt_0160
     * @tc.desc   format the datetime with unitDisplay long
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('numberFormatAdapt_test_0160', Level.LEVEL1, () => {
      console.log('numberFormatAdapt_test_0160:' + 'start');
      let numFmt = new Intl.NumberFormat("en-GB", {
        style: 'unit', unit: 'meter', unitDisplay: 'short'
      });
      console.log('numberFormatAdapt_test_0090' + numFmt.format(123456.789));
      expect(numFmt.format(123456.789)).assertEqual('123,456.789 m');
    })

    /**
     * @tc.name   relativeTimeFormatAdapt_test_0100
     * @tc.number SUB_GLOBAL_Localization_foramtAdapt_0100
     * @tc.desc   format timeStyle is long
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('relativeTimeFormatAdapt_test_0100', Level.LEVEL1, () => {
      console.log('relativeTimeFormatAdapt_test_0100:' + 'start');
      let relativeTimeFmt = new Intl.RelativeTimeFormat("en", {
        style: 'long'
      });
      let value = relativeTimeFmt.format(100, 'second');
      console.log('relativeTimeFormatAdapt_test_0100' + value);
      expect(value).assertEqual('in 100 seconds');
    })

    /**
     * @tc.name   relativeTimeFormatAdapt_test_0110
     * @tc.number SUB_GLOBAL_Localization_foramtAdapt_0110
     * @tc.desc   format the timeStyle is short
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('relativeTimeFormatAdapt_test_0110', Level.LEVEL1, () => {
      console.log('relativeTimeFormatAdapt_test_0110:' + 'start');
      let relativeTimeFmt = new Intl.RelativeTimeFormat("en", {
        style: 'short'
      });
      let value = relativeTimeFmt.format(100, 'second');
      console.log('relativeTimeFormatAdapt_test_0110' + value);
      expect(value).assertEqual('in 100 sec.');
    })

    /**
     * @tc.name   testGetThreeLetterLanguage_0030
     * @tc.number SUB_GLOBAL_getThreeLetterLanguage_0030
     * @tc.desc   param value not valid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetThreeLetterLanguage_0030', Level.LEVEL3, () => {
      try {
        let language: string = I18n.I18NUtil.getThreeLetterLanguage('bbb')
      } catch (e) {
        console.log('testGetThreeLetterLanguage_0030' + e.code + e.message);
        expect(e.code).assertEqual('890001');
      }
    })

    /**
     * @tc.name   testGetThreeLetterLanguage_0100
     * @tc.number SUB_GLOBAL_getThreeLetterLanguage_0100
     * @tc.desc   param value is en
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetThreeLetterLanguage_0100', Level.LEVEL2, () => {
      let language: string = I18n.I18NUtil.getThreeLetterLanguage('en')
      console.info('testGetThreeLetterLanguage_0100', language);
      expect('eng').assertEqual(language);
    })

    /**
     * @tc.name   testGetThreeLetterRegion_0030
     * @tc.number SUB_GLOBAL_getThreeLetterRegion_0300
     * @tc.desc   param value not valid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetThreeLetterRegion_0030', Level.LEVEL3, () => {
      try {
        let language: string = I18n.I18NUtil.getThreeLetterRegion('aa')
      } catch (e) {
        console.log('testGetThreeLetterRegion_0030' + e.code + e.message);
        expect(e.code).assertEqual('890001');
      }
    })

    /**
     * @tc.name   testGetThreeLetterRegion_0100
     * @tc.number SUB_GLOBAL_getThreeLetterRegion_0100
     * @tc.desc   transfer GB and return GBR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetThreeLetterRegion_0100', Level.LEVEL2, () => {
      let language: string = I18n.I18NUtil.getThreeLetterRegion('GB')
      console.info('testGetThreeLetterRegion_0100', language);
      expect('GBR').assertEqual(language);
    })

    /**
     * @tc.name   SUB_GLOBAL_numberFormatTyping_0100
     * @tc.number SUB_GLOBAL_numberFormatTyping_0100
     * @tc.desc   adapter in adding
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_numberFormatTyping_0100', Level.LEVEL2, () => {
      let option: I18n.PhoneNumberFormatOptions = {
        type: "TYPING"
      };
      let phoneNumberFormat: I18n.PhoneNumberFormat = new I18n.PhoneNumberFormat("CN", option);
      let number = "13801048465";
      let arr: Array<String> = ['1', '13', '138', '138 0', '138 01', '138 010', '138 0104', '1380 1048', '138 0104 84',
        '138 0104 846', '138 0104 8465']
      let formatted = "";
      let k = 0;
      for (let i of number) {
        formatted = formatted + i;
        let result = phoneNumberFormat.format(formatted);
        console.info('SUB_GLOBAL_numberFormatTyping_0100_arr', arr[k])
        expect(result).assertEqual(arr[k])
        k += 1
      }
    })

    /**
     * @tc.name   SUB_GLOBAL_numberFormatTyping_0200
     * @tc.number SUB_GLOBAL_numberFormatTyping_0200
     * @tc.desc   adapter in delete
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_numberFormatTyping_0200', Level.LEVEL2, () => {
      let option: I18n.PhoneNumberFormatOptions = {
        type: "TYPING"
      };
      let phoneNumberFormat: I18n.PhoneNumberFormat = new I18n.PhoneNumberFormat("CN", option);
      let number = "13801048465";
      let result = phoneNumberFormat.format(number.substring(0, number.length - 1));
      expect(result).assertEqual('138 0104 846')
    })


    /**
     * @tc.name   SUB_GLOBAL_numberFormatTyping_0300
     * @tc.number SUB_GLOBAL_numberFormatTyping_0300
     * @tc.desc   not CN phone number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_GLOBAL_numberFormatTyping_0300', Level.LEVEL1, () => {
      let option: I18n.PhoneNumberFormatOptions = {
        type: "TYPING"
      };
      let phoneNumberFormat: I18n.PhoneNumberFormat = new I18n.PhoneNumberFormat("CN", option);
      let number = "00886960186456";
      let arr: Array<String> = ['0', '00', '00 8', '00 88', '00 886 ', '00 886 9', '00 886 96', '00 886 960',
        '00 886 960 1', '00 886 960 18', '00 886 960 186', '00 886 960 186 4', '00 886 960 186 45',
        '00 886 960 186 456']
      let formatted = "";
      let k = 0
      for (let i of number) {
        formatted = formatted + i;
        let result = phoneNumberFormat.format(formatted);
        console.info('SUB_GLOBAL_numberFormatTyping_0300_arr', arr[k])
        expect(result).assertEqual(arr[k])
        k += 1
      }
    })

    /**
     * @tc.name   SUB_GLOBAL_I18N_getDisplayLanguage_0200
     * @tc.number SUB_GLOBAL_I18N_getDisplayLanguage_0200
     * @tc.desc   errcode 890001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_GLOBAL_I18N_getDisplayLanguage_0200', Level.LEVEL3, () => {
      try {
        I18n.System.getDisplayLanguage('2', '1');
      } catch (e) {
        console.log('SUB_GLOBAL_I18N_getDisplayLanguage_0200 code&message:' + e.code + e.message);
        expect(e.code == 890001).assertTrue();
      }
    })

    /**
     * @tc.name   SUB_GLOBAL_I18N_getSystemCountries_0100
     * @tc.number SUB_GLOBAL_I18N_getSystemCountries_0100
     * @tc.desc   errcode 890001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_GLOBAL_I18N_getSystemCountries_0100', Level.LEVEL3, () => {
      try {
        I18n.System.getSystemCountries('xx');
        console.log('SUB_GLOBAL_I18N_getSystemCountries_0100: 1++');
      } catch (e) {
        console.log('SUB_GLOBAL_I18N_getSystemCountries_0100: code&message:' + e.code + e.message);
        expect(e.code == 890001).assertTrue();
      }
    })

    /**
     * @tc.name   SUB_GLOBAL_I18N_isSuggested_0200
     * @tc.number SUB_GLOBAL_I18N_isSuggested_0200
     * @tc.desc   errcode 890001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_GLOBAL_I18N_isSuggested_0200', Level.LEVEL3, () => {
      try {
        I18n.System.isSuggested("aaa", '111');
        console.log('SUB_GLOBAL_I18N_isSuggested_0200:asdf');
      } catch (e) {
        console.log('SUB_GLOBAL_I18N_isSuggested_0200:code&message:' + e.code + e.message);
        expect(e.code == 890001).assertTrue();
      }
    })

    /**
     * @tc.name   SUB_GLOBAL_I18N_getTimePeriodName_0200
     * @tc.number SUB_GLOBAL_I18N_getTimePeriodName_0200
     * @tc.desc   getTimePeriodName errcode 890001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_GLOBAL_I18N_getTimePeriodName_0200', Level.LEVEL3, () => {
      try {
        I18n.I18NUtil.getTimePeriodName(2, 'invalid');
      } catch (e) {
        console.log('SUB_GLOBAL_I18N_getTimePeriodName_0200 code&message:' + e.code + e.message);
        expect(e.code == 890001).assertTrue();
      }
    })

    /**
     * @tc.name   SUB_GLOBAL_I18N_unitConvert_0100
     * @tc.number SUB_GLOBAL_I18N_unitConvert_0100
     * @tc.desc   unitConvert
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_I18N_unitConvert_0100', Level.LEVEL2, () => {
      let value = I18n.I18NUtil.unitConvert({unit: 'cup', measureSystem: 'US'},
        {unit: 'liter', measureSystem: 'SI'},
        1000,
        'en-US');
      console.log('SUB_GLOBAL_I18N_unitConvert_0100 ' + value);
      expect(value).assertContain('236.588');
    })

    /**
     * @tc.name   i18n_calendar_test_2600
     * @tc.number i18n_calendar_test_2600
     * @tc.desc   getCalendar
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('i18n_calendar_test_2600', Level.LEVEL2, () => {
      let calendar = I18n.getCalendar('zh');
      calendar.set(2021, 11, 11, 10);
      let value = calendar.isWeekend();
      console.log('i18n_calendar_test_2600 ' + value);
      expect(value).assertTrue();
    })

    /**
     * @tc.name   SUB_GLOBAL_I18N_getHolidayInfoItemArray_0100
     * @tc.number SUB_GLOBAL_I18N_getHolidayInfoItemArray_0100
     * @tc.desc   getHolidayInfoItemArray error code 890001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_GLOBAL_I18N_getHolidayInfoItemArray_0100', Level.LEVEL3, () => {
      try {
        let holidayManager = new I18n.HolidayManager("/system/lib/TR.ics");
        holidayManager.getHolidayInfoItemArray(-1);
      } catch (e) {
        console.log('SUB_GLOBAL_I18N_getHolidayInfoItemArray_0100 code&message:' + e.code + e.message);
        expect(e.code).assertEqual('890001')
      }
    })

    /**
     * @tc.name   SUB_GLOBAL_I18N_addPreferredLanguage_0100
     * @tc.number SUB_GLOBAL_I18N_addPreferredLanguage_0100
     * @tc.desc   addPreferredLanguage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_I18N_addPreferredLanguage_0100', Level.LEVEL2, () => {
      console.log('SUB_GLOBAL_I18N_addPreferredLanguage_0100 ' + 'start');
      let list = I18n.getPreferredLanguageList();
      console.log('SUB_GLOBAL_I18N_addPreferredLanguage_0100 ' + list);
      expect(list.length).assertLarger(0);
      if(list[0] != 'zh-Hans-CN' && list[0] != 'zh-Hans'){
        let value = I18n.addPreferredLanguage('zh-Hans-CN', 1);
        console.log('SUB_GLOBAL_I18N_addPreferredLanguage_0100 ' + value);
        expect(list.length > 0).assertTrue();
      }
      else{
        let value = I18n.addPreferredLanguage('en-Latn-US', 2);
        console.log('SUB_GLOBAL_I18N_addPreferredLanguage_0100 ' + value);
        expect(list.length > 0).assertTrue();
      }
      console.log('SUB_GLOBAL_I18N_addPreferredLanguage_0100 ' + I18n.getPreferredLanguageList());
    })

    /**
     * @tc.name   SUB_GLOBAL_I18N_SR000IFGMS_0800
     * @tc.number SUB_GLOBAL_I18N_SR000IFGMS_0800
     * @tc.desc   hour=[21,5],at night
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_I18N_SR000IFGMS_0800', Level.LEVEL2, () => {
      let value = I18n.I18NUtil.getTimePeriodName(5);
      console.log('SUB_GLOBAL_I18N_SR000IFGMS_0800:' + value);
      expect(value != null).assertTrue();
    })

    console.log('*************end i18nStageTest*************');
  })
}