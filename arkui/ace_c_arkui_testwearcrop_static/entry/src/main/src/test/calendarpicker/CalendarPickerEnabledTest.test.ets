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
import { LibUtil } from '../../../ets/pages/LibUtil';
import { focusControl } from '@ohos.arkui.component'

export default function calendarPickerEnabledTest() {

  describe('CalendarPickerEnabledTest', () => {

    let PAGE_TAG = 'CalendarPickerEnabledTest';

    beforeAll((): void => {
      console.info("[ui] beforeAll start");
      await UtilsTest.startAbility("com.openharmony.arkui_capi_xts_testwearcrop.static", "EntryAbility")
      await Utils.pushPage(`calendarpicker/${PAGE_TAG}`, false);
      console.info("[ui] beforeAll end");
    });

    
    /**
     * @tc.number   testCalendarPickerEnabled001
     * @tc.name     testCalendarPickerEnabled001
     * @tc.desc     testCalendarPickerEnabled001
     * @tc.level    Level.LEVEL1
     */
    it('testCalendarPickerEnabled001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.clickComponent('OnClickEnabledCalendarPicker')
      await Utils.sleep(1000)

      expect(Utils.getComponentInfoByKey('OnClickEnabledCalendarPicker')
        .getElement('$attrs')
        .getString('backgroundColor')).assertEqual('#FF00FF00')

      focusControl.requestFocus('TextClick')
      focusControl.requestFocus('EnabledCalendarPicker')
      await Utils.sleep(1000)
      expect(Utils.getComponentInfoByKey('EnabledCalendarPicker').getElement('$attrs').getString('backgroundColor'))
        .assertEqual('#FF0000FF')

      focusControl.requestFocus('TextClick')
      await Utils.sleep(1000)
      expect(Utils.getComponentInfoByKey('EnabledCalendarPicker').getElement('$attrs').getString('backgroundColor'))
        .assertEqual('#FFFFFF00')
      expect(Utils.getComponentInfoByKey('EnabledCalendarPicker').getElement('$attrs').getBoolean('enabled'))
        .assertTrue()

      await Utils.clickComponent('TextClick')
      await Utils.sleep(1000)
      done();
    })

    
    /**
     * @tc.number   testCalendarPickerEnabled002
     * @tc.name     testCalendarPickerEnabled002
     * @tc.desc     testCalendarPickerEnabled002
     * @tc.level    Level.LEVEL1
     */
    it('testCalendarPickerEnabled002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.clickComponent('OnClickDisabledCalendarPicker')
      await Utils.sleep(1000)
      expect(Utils.getComponentInfoByKey('OnClickDisabledCalendarPicker')
        .getElement('$attrs')
        .getString('backgroundColor')).assertEqual('#FFFF0000')

      focusControl.requestFocus('TextClick')
      focusControl.requestFocus('DisabledCalendarPicker')
      await Utils.sleep(1000)
      expect(Utils.getComponentInfoByKey('DisabledCalendarPicker').getElement('$attrs').getString('backgroundColor'))
        .assertEqual('#FFFF0000')

      focusControl.requestFocus('TextClick')
      await Utils.sleep(1000)
      expect(Utils.getComponentInfoByKey('DisabledCalendarPicker').getElement('$attrs').getString('backgroundColor'))
        .assertEqual('#FFFF0000')
      expect(Utils.getComponentInfoByKey('DisabledCalendarPicker').getElement('$attrs').getBoolean('enabled'))
        .assertFalse()

      done();
    })

    
    /**
     * @tc.number   testCalendarPickerEnabled003
     * @tc.name     testCalendarPickerEnabled003
     * @tc.desc     testCalendarPickerEnabled003
     * @tc.level    Level.LEVEL1
     */
    it('testCalendarPickerEnabled003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.clickComponent('OnClickAbnormalCalendarPicker')
      await Utils.sleep(1000)
      expect(Utils.getComponentInfoByKey('OnClickAbnormalCalendarPicker')
        .getElement('$attrs')
        .getString('backgroundColor')).assertEqual('#FF00FF00')

      focusControl.requestFocus('TextClick')
      focusControl.requestFocus('AbnormalCalendarPicker')
      await Utils.sleep(1000)
      expect(Utils.getComponentInfoByKey('AbnormalCalendarPicker').getElement('$attrs').getString('backgroundColor'))
        .assertEqual('#FF0000FF')

      focusControl.requestFocus('TextClick')
      await Utils.sleep(1000)
      expect(Utils.getComponentInfoByKey('AbnormalCalendarPicker').getElement('$attrs').getString('backgroundColor'))
        .assertEqual('#FFFFFF00')
      expect(Utils.getComponentInfoByKey('AbnormalCalendarPicker').getElement('$attrs').getBoolean('enabled'))
        .assertTrue()

      await Utils.clickComponent('TextClick')
      await Utils.sleep(1000)
      done();
    })
  })
}
