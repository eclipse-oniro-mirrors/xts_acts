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

export default function datePickerEnabledTest() {

  describe('DatePickerEnabledTest', () => {

    let PAGE_TAG = 'DatePickerEnabledTest';

    beforeAll(async (done: Function) => {
      await Utils.pushPage(`datepicker/${PAGE_TAG}`, done);
    });

    /**
     * @tc.name   testDatePickerEnabled001
     * @tc.number SUB_ARKUI_CAPI_DATEPICKER_ENABLED_0100
     * @tc.desc   testing enabled event callback for datePicker with normal value (true)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDatePickerEnabled001', Level.LEVEL1, async (done: Function) => {
      await Utils.clickComponent('OnClickEnabledDatePicker')
      await Utils.sleep(1000)
      expect(Utils.getComponentInfoByKey('OnClickEnabledDatePicker').$attrs.backgroundColor).assertEqual('#FF00FF00')

      focusControl.requestFocus('AbnormalDatePicker')
      focusControl.requestFocus('EnabledDatePicker')
      await Utils.sleep(1000)
      expect(Utils.getComponentInfoByKey('EnabledDatePicker').$attrs.backgroundColor).assertEqual('#FF0000FF')

      focusControl.requestFocus('AbnormalDatePicker')
      await Utils.sleep(1000)
      expect(Utils.getComponentInfoByKey('EnabledDatePicker').$attrs.backgroundColor).assertEqual('#FFFFFF00')
      expect(Utils.getComponentInfoByKey('EnabledDatePicker').$attrs.enabled).assertTrue()
      done();
    })

    /**
     * @tc.name   testDatePickerEnabled002
     * @tc.number SUB_ARKUI_CAPI_DATEPICKER_ENABLED_0200
     * @tc.desc   testing enabled event callback for datePicker with normal value (false)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDatePickerEnabled002', Level.LEVEL1, async (done: Function) => {
      await Utils.clickComponent('OnClickDisabledDatePicker')
      await Utils.sleep(1000)
      expect(Utils.getComponentInfoByKey('OnClickDisabledDatePicker').$attrs.backgroundColor).assertEqual('#FFFF0000')

      focusControl.requestFocus('EnabledDatePicker')
      focusControl.requestFocus('DisabledDatePicker')
      await Utils.sleep(1000)
      expect(Utils.getComponentInfoByKey('DisabledDatePicker').$attrs.backgroundColor).assertEqual('#FFFF0000')

      focusControl.requestFocus('EnabledDatePicker')
      await Utils.sleep(1000)
      expect(Utils.getComponentInfoByKey('DisabledDatePicker').$attrs.backgroundColor).assertEqual('#FFFF0000')
      expect(Utils.getComponentInfoByKey('DisabledDatePicker').$attrs.enabled).assertFalse()
      done();
    })

    /**
     * @tc.name   testDatePickerEnabled003
     * @tc.number SUB_ARKUI_CAPI_DATEPICKER_ENABLED_0300
     * @tc.desc   testing enabled event callback for datePicker with abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDatePickerEnabled003', Level.LEVEL1, async (done: Function) => {
      await Utils.clickComponent('OnClickAbnormalDatePicker')
      await Utils.sleep(1000)
      expect(Utils.getComponentInfoByKey('OnClickAbnormalDatePicker').$attrs.backgroundColor).assertEqual('#FF00FF00')

      focusControl.requestFocus('EnabledDatePicker')
      focusControl.requestFocus('AbnormalDatePicker')
      await Utils.sleep(1000)
      expect(Utils.getComponentInfoByKey('AbnormalDatePicker').$attrs.backgroundColor).assertEqual('#FF0000FF')

      focusControl.requestFocus('EnabledDatePicker')
      await Utils.sleep(1000)
      expect(Utils.getComponentInfoByKey('AbnormalDatePicker').$attrs.backgroundColor).assertEqual('#FFFFFF00')
      expect(Utils.getComponentInfoByKey('AbnormalDatePicker').$attrs.enabled).assertTrue()
      done();
    })
  })
}
