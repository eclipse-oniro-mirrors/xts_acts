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

import { expect, describe, it, afterEach } from '@ohos/hypium';
import { Driver, ON, PointerMatrix, Rect } from '@ohos.UiTest';
import Utils from '../common/Utils';

export default function calendarPickerDateTest(){

  describe('CalendarPickerDateTest', () => {
    afterEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_POST_FRAME_0100
     * @tc.name       : testCalendarPickerDate001
     * @tc.desc       : testing CalendarPicker AutoPlay
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCalendarPickerDate001', 0, async (done: Function) => {
      let PAGE_TAG = 'TestCalendarPickerDate';
      await Utils.pushPage(`calendarPicker/${PAGE_TAG}`);
      await Utils.sleep(3000)
      let strJson = getInspectorByKey('CalendarPickerDate_001');
      console.log('testCalendarPickerDate001' + JSON.stringify(JSON.parse(strJson).$attrs.start));
      console.log('testCalendarPickerDate001' + JSON.stringify(JSON.parse(strJson).$attrs.end));
      expect(JSON.parse(strJson).$attrs.start).assertEqual('2024年12月1日星期日');
      expect(JSON.parse(strJson).$attrs.end).assertEqual('2025年12月30日星期二');
      done();
    });
    
  })
}