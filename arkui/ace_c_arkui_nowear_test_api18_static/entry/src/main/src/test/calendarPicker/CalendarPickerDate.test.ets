'use static';
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index";
import Utils from '../common/Utils';
import { Driver, ON, PointerMatrix, Rect } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import { UtilsTest } from '../Util.test'


export default function calendarPickerDateTest(){

  describe('CalendarPickerDateTest', () => {
    beforeAll((): void => {
      await UtilsTest.startAbility("com.openharmony.arkui_capi_nowear_xts_api18_static", "EntryAbility")
    });
    afterEach(async (): Promise<void> => {
      await Utils.sleep(100);
    })

    
    /**
     * @tc.number   testCalendarPickerDate_static_001
     * @tc.name     testCalendarPickerDate_static_001
     * @tc.desc     testCalendarPickerDate_static_001
     * @tc.level    Level.LEVEL0
     */
    it('testCalendarPickerDate_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let PAGE_TAG = 'TestCalendarPickerDate';
      await Utils.pushPage(`calendarPicker/${PAGE_TAG}`);
      await Utils.sleep(3000)
      let strJson = inspector.getInspectorByKey('CalendarPickerDate_001');
      console.log('testCalendarPickerDate001' + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('start')));
      console.log('testCalendarPickerDate001' + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('end')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('start')).assertEqual('2024年12月1日星期日');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('end')).assertEqual('2025年12月30日星期二');
      done();
    });
    
  })
}