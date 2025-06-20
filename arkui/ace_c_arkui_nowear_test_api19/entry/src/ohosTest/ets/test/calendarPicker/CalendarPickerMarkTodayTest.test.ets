/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { describe, beforeEach, afterEach, it, expect, TestType, Size, Level } from '@ohos/hypium'
import { Driver, ON, PointerMatrix, Rect } from '@ohos.UiTest';
import Utils from '../common/Utils';

export default function calendarPickerTest(){

  describe('CalendarPickerTest', () => {
    afterEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    })

    /*
     * @tc.number: CalendarPickerMarkTodayTest001
     * @tc.name: CalendarPickerMarkTodayTest001
     * @tc.desc: CalendarPickerMark value 2025-01-07,2025-01-09,2025-07-01,2100-12-31，markToday true
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
      */
    it('CalendarPickerMarkTodayTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('CalendarPickerMarkTodayTest001 START');
      let PAGE_TAG = 'CalendarPickerMarkTodayTest';
      await Utils.pushPage(`calendarPicker/${PAGE_TAG}`);
      await Utils.sleep(3000)
      let strJson = getInspectorByKey('calendarPicker_001');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[CalendarPickerMarkTodayTest001]disabledDateRange:" + JSON.stringify(obj.$attrs.disabledDateRange));
      console.info("[CalendarPickerMarkTodayTest001]markToday:" + JSON.stringify(obj.$attrs.markToday));
      expect(obj.$attrs.disabledDateRange).assertEqual('2025年1月7日星期二,2025年1月9日星期四,2025年7月1日星期二,2100年12月31日星期五');
      await Utils.sleep(1000)
      expect(obj.$attrs.markToday).assertEqual('true');
      await Utils.sleep(1000)
      console.info('CalendarPickerMarkTodayTest001 END');
      done();
    })

    /*
     * @tc.number: CalendarPickerMarkTodayTest002
     * @tc.name: CalendarPickerMarkTodayTest002
     * @tc.desc: CalendarPickerMark value 1970-01-01,2020-11-10,2021-01-,2021-01-15，markToday true
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
      */
    it('CalendarPickerMarkTodayTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('CalendarPickerMarkTodayTest002 START');
      let PAGE_TAG = 'CalendarPickerMarkTodayTest';
      await Utils.pushPage(`calendarPicker/${PAGE_TAG}`);
      await Utils.sleep(3000)
      let strJson = getInspectorByKey('calendarPicker_002');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[CalendarPickerMarkTodayTest002]disabledDateRange:" + JSON.stringify(obj.$attrs.disabledDateRange));
      console.info("[CalendarPickerMarkTodayTest002]markToday:" + JSON.stringify(obj.$attrs.markToday));
      expect(obj.$attrs.disabledDateRange).assertEqual('1970年1月1日星期四,2020年11月10日星期二');
      await Utils.sleep(1000)
      expect(obj.$attrs.markToday).assertEqual('true');
      await Utils.sleep(1000)
      console.info('CalendarPickerMarkTodayTest002 END');
      done();
    })

    /*
    * @tc.number: CalendarPickerMarkTodayTest003
    * @tc.name: CalendarPickerMarkTodayTest003
    * @tc.desc: CalendarPickerMark value 2025-01-07,2025-01-09,2025-07-01,2100-12-31，markToday false
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
     */
    it('CalendarPickerMarkTodayTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('CalendarPickerMarkTodayTest003 START');
      let PAGE_TAG = 'CalendarPickerMarkTodayTest';
      await Utils.pushPage(`calendarPicker/${PAGE_TAG}`);
      await Utils.sleep(3000)
      let strJson = getInspectorByKey('calendarPicker_003');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[CalendarPickerMarkTodayTest003]disabledDateRange:" + JSON.stringify(obj.$attrs.disabledDateRange));
      console.info("[CalendarPickerMarkTodayTest003]markToday:" + JSON.stringify(obj.$attrs.markToday));
      expect(obj.$attrs.disabledDateRange).assertEqual('2025年1月7日星期二,2025年1月9日星期四,2025年7月1日星期二,2100年12月31日星期五');
      await Utils.sleep(1000)
      expect(obj.$attrs.markToday).assertEqual('false');
      await Utils.sleep(1000)
      console.info('CalendarPickerMarkTodayTest003 END');
      done();
    })

    /*
   * @tc.number: CalendarPickerMarkTodayTest004
   * @tc.name: CalendarPickerMarkTodayTest004
   * @tc.desc: CalendarPickerMark value null,undefied,2025-07-01,2100-12-31，markToday false
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 1
    */
    it('CalendarPickerMarkTodayTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('CalendarPickerMarkTodayTest004 START');
      let PAGE_TAG = 'CalendarPickerMarkTodayTest';
      await Utils.pushPage(`calendarPicker/${PAGE_TAG}`);
      await Utils.sleep(3000)
      let strJson = getInspectorByKey('calendarPicker_004');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[CalendarPickerMarkTodayTest004]disabledDateRange:" + JSON.stringify(obj.$attrs.disabledDateRange));
      console.info("[CalendarPickerMarkTodayTest004]markToday:" + JSON.stringify(obj.$attrs.markToday));
      expect(obj.$attrs.disabledDateRange).assertEqual('2025年7月1日星期二,2100年12月31日星期五');
      await Utils.sleep(1000)
      expect(obj.$attrs.markToday).assertEqual('false');
      await Utils.sleep(1000)
      console.info('CalendarPickerMarkTodayTest004 END');
      done();
    })

  })
}