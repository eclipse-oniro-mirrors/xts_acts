/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { beforeAll, describe, expect, it, Level } from '@ohos/hypium';
import Utils from '../common/Utils';

export default function calendarPickerEnabledTest() {

  describe('CalendarPickerEnabledTest', () => {

    let PAGE_TAG = 'CalendarPickerEnabledTest';

    beforeAll(async (done: Function) => {
      await Utils.pushPage(`calendarpicker/${PAGE_TAG}`, done);
    });

    /**
     * @tc.name   testCalendarPickerEnabled001
     * @tc.number SUB_ARKUI_CAPI_CALENDARPICKER_ENABLED_0100
     * @tc.desc   testing enabled event callback for calendarPicker with normal value (true)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCalendarPickerEnabled001', Level.LEVEL1, async  (done: Function) => {
      await Utils.clickComponent('OnClickEnabledCalendarPicker')
      await Utils.sleep(1000)
      expect(Utils.getComponentInfoByKey('OnClickEnabledCalendarPicker').$attrs.backgroundColor).assertEqual('#FF00FF00')

      focusControl.requestFocus('TextClick')
      focusControl.requestFocus('EnabledCalendarPicker')
      await Utils.sleep(1000)
      expect(Utils.getComponentInfoByKey('EnabledCalendarPicker').$attrs.backgroundColor).assertEqual('#FF0000FF')

      focusControl.requestFocus('TextClick')
      await Utils.sleep(1000)
      expect(Utils.getComponentInfoByKey('EnabledCalendarPicker').$attrs.backgroundColor).assertEqual('#FFFFFF00')
      expect(Utils.getComponentInfoByKey('EnabledCalendarPicker').$attrs.enabled).assertTrue()

      await Utils.clickComponent('TextClick')
      await Utils.sleep(1000)
      done();
    })

    /**
     * @tc.name   testCalendarPickerEnabled002
     * @tc.number SUB_ARKUI_CAPI_CALENDARPICKER_ENABLED_0200
     * @tc.desc   testing enabled event callback for calendarPicker with normal value (false)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCalendarPickerEnabled002', Level.LEVEL1, async  (done: Function) => {
      await Utils.clickComponent('OnClickDisabledCalendarPicker')
      await Utils.sleep(1000)
      expect(Utils.getComponentInfoByKey('OnClickDisabledCalendarPicker').$attrs.backgroundColor).assertEqual('#FFFF0000')

      focusControl.requestFocus('TextClick')
      focusControl.requestFocus('DisabledCalendarPicker')
      await Utils.sleep(1000)
      expect(Utils.getComponentInfoByKey('DisabledCalendarPicker').$attrs.backgroundColor).assertEqual('#FFFF0000')

      focusControl.requestFocus('TextClick')
      await Utils.sleep(1000)
      expect(Utils.getComponentInfoByKey('DisabledCalendarPicker').$attrs.backgroundColor).assertEqual('#FFFF0000')
      expect(Utils.getComponentInfoByKey('DisabledCalendarPicker').$attrs.enabled).assertFalse()

      done();
    })

    /**
     * @tc.name   testCalendarPickerEnabled003
     * @tc.number SUB_ARKUI_CAPI_CALENDARPICKER_ENABLED_0300
     * @tc.desc   testing enabled event callback for calendarPicker with abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCalendarPickerEnabled003', Level.LEVEL1, async  (done: Function) => {
      await Utils.clickComponent('OnClickAbnormalCalendarPicker')
      await Utils.sleep(1000)
      expect(Utils.getComponentInfoByKey('OnClickAbnormalCalendarPicker').$attrs.backgroundColor).assertEqual('#FF00FF00')

      focusControl.requestFocus('TextClick')
      focusControl.requestFocus('AbnormalCalendarPicker')
      await Utils.sleep(1000)
      expect(Utils.getComponentInfoByKey('AbnormalCalendarPicker').$attrs.backgroundColor).assertEqual('#FF0000FF')

      focusControl.requestFocus('TextClick')
      await Utils.sleep(1000)
      expect(Utils.getComponentInfoByKey('AbnormalCalendarPicker').$attrs.backgroundColor).assertEqual('#FFFFFF00')
      expect(Utils.getComponentInfoByKey('AbnormalCalendarPicker').$attrs.enabled).assertTrue()

      await Utils.clickComponent('TextClick')
      await Utils.sleep(1000)
      done();
    })
  })
}
