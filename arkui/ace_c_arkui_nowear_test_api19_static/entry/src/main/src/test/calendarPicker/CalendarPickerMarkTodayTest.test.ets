'use static'
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from "../../../../hypium/index";
import Utils from '../common/Utils';
import { Driver, ON, PointerMatrix, Rect } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import { UtilsTest } from '../Util.test'


export default function calendarPickerTest(){

  describe('CalendarPickerTest', () =>{
    beforeAll((): void => {
      await UtilsTest.startAbility("com.openharmony.arkui_capi_nowear_xts_api19_static", "EntryAbility")
    });

    afterEach(async (): Promise<void> => {
      await Utils.sleep(100);
    })

    
    /**
     * @tc.number   CalendarPickerMarkTodayTest001
     * @tc.name     CalendarPickerMarkTodayTest001
     * @tc.desc     CalendarPickerMarkTodayTest001
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1
     */
    it('CalendarPickerMarkTodayTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('CalendarPickerMarkTodayTest001 START');
      let PAGE_TAG = 'CalendarPickerMarkTodayTest';
      await Utils.pushPage(`calendarPicker/${PAGE_TAG}`, false);
      await Utils.sleep(3000)
      let strJson = inspector.getInspectorByKey('calendarPicker_001');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[CalendarPickerMarkTodayTest001]disabledDateRange:" + JSON.stringify(obj.getElement('$attrs').getString('disabledDateRange')));
      console.info("[CalendarPickerMarkTodayTest001]markToday:" + JSON.stringify(obj.getElement('$attrs').getString('markToday')));
      expect(obj.getElement('$attrs').getString('disabledDateRange')).assertEqual('2025年1月7日星期二,2025年1月9日星期四,2025年7月1日星期二,2100年12月31日星期五');
      await Utils.sleep(1000)
      expect(obj.getElement('$attrs').getString('markToday')).assertEqual('true');
      await Utils.sleep(1000)
      console.info('CalendarPickerMarkTodayTest001 END');
      done();
    })

    
    /**
     * @tc.number   CalendarPickerMarkTodayTest002
     * @tc.name     CalendarPickerMarkTodayTest002
     * @tc.desc     CalendarPickerMarkTodayTest002
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1
     */
    it('CalendarPickerMarkTodayTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('CalendarPickerMarkTodayTest002 START');
      let PAGE_TAG = 'CalendarPickerMarkTodayTest';
      await Utils.pushPage(`calendarPicker/${PAGE_TAG}`, false);
      await Utils.sleep(3000)
      let strJson = inspector.getInspectorByKey('calendarPicker_002');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[CalendarPickerMarkTodayTest002]disabledDateRange:" + JSON.stringify(obj.getElement('$attrs').getString('disabledDateRange')));
      console.info("[CalendarPickerMarkTodayTest002]markToday:" + JSON.stringify(obj.getElement('$attrs').getString('markToday')));
      expect(obj.getElement('$attrs').getString('disabledDateRange')).assertEqual('1970年1月1日星期四,2020年11月10日星期二');
      await Utils.sleep(1000)
      expect(obj.getElement('$attrs').getString('markToday')).assertEqual('true');
      await Utils.sleep(1000)
      console.info('CalendarPickerMarkTodayTest002 END');
      done();
    })

    
    /**
     * @tc.number   CalendarPickerMarkTodayTest003
     * @tc.name     CalendarPickerMarkTodayTest003
     * @tc.desc     CalendarPickerMarkTodayTest003
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1
     */
    it('CalendarPickerMarkTodayTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('CalendarPickerMarkTodayTest003 START');
      let PAGE_TAG = 'CalendarPickerMarkTodayTest';
      await Utils.pushPage(`calendarPicker/${PAGE_TAG}`, false);
      await Utils.sleep(3000)
      let strJson = inspector.getInspectorByKey('calendarPicker_003');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[CalendarPickerMarkTodayTest003]disabledDateRange:" + JSON.stringify(obj.getElement('$attrs').getString('disabledDateRange')));
      console.info("[CalendarPickerMarkTodayTest003]markToday:" + JSON.stringify(obj.getElement('$attrs').getString('markToday')));
      expect(obj.getElement('$attrs').getString('disabledDateRange')).assertEqual('2025年1月7日星期二,2025年1月9日星期四,2025年7月1日星期二,2100年12月31日星期五');
      await Utils.sleep(1000)
      expect(obj.getElement('$attrs').getString('markToday')).assertEqual('false');
      await Utils.sleep(1000)
      console.info('CalendarPickerMarkTodayTest003 END');
      done();
    })

    
    /**
     * @tc.number   CalendarPickerMarkTodayTest004
     * @tc.name     CalendarPickerMarkTodayTest004
     * @tc.desc     CalendarPickerMarkTodayTest004
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1
     */
    it('CalendarPickerMarkTodayTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('CalendarPickerMarkTodayTest004 START');
      let PAGE_TAG = 'CalendarPickerMarkTodayTest';
      await Utils.pushPage(`calendarPicker/${PAGE_TAG}`, false);
      await Utils.sleep(3000)
      let strJson = inspector.getInspectorByKey('calendarPicker_004');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[CalendarPickerMarkTodayTest004]disabledDateRange:" + JSON.stringify(obj.getElement('$attrs').getString('disabledDateRange')));
      console.info("[CalendarPickerMarkTodayTest004]markToday:" + JSON.stringify(obj.getElement('$attrs').getString('markToday')));
      expect(obj.getElement('$attrs').getString('disabledDateRange')).assertEqual('2025年7月1日星期二,2100年12月31日星期五');
      await Utils.sleep(1000)
      expect(obj.getElement('$attrs').getString('markToday')).assertEqual('false');
      await Utils.sleep(1000)
      console.info('CalendarPickerMarkTodayTest004 END');
      done();
    })

  })
}