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

import { beforeAll, describe, expect, it } from '@ohos/hypium';
import Utils from '../common/Utils';

export default function checkboxEnabledTest() {

  describe('CheckboxEnabledTest', () => {

    let PAGE_TAG = 'CheckboxEnabledTest';

    beforeAll(async (done: Function) => {
      await Utils.pushPage(`checkbox/${PAGE_TAG}`, done);
    });

    /*
    * @tc.number     : SUB_ARKUI_CAPI_CHECKBOX_ENABLED_0100
    * @tc.name       : testCheckboxEnabled001
    * @tc.desc       : testing enabled event callback for checkbox with normal value (true)
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testCheckboxEnabled001', 0, async (done: Function) => {
      await Utils.clickComponent('OnClickEnabledCheckbox')
      await Utils.sleep(1000)
      focusControl.requestFocus('OnBlurEnabledCheckbox')
      await Utils.sleep(1000)
      focusControl.requestFocus('OnFocusEnabledCheckbox')
      await Utils.sleep(1000)

      expect(Utils.getComponentInfoByKey('OnClickEnabledCheckbox').$attrs.backgroundColor).assertEqual('#FF00FF00')
      expect(Utils.getComponentInfoByKey('OnFocusEnabledCheckbox').$attrs.backgroundColor).assertEqual('#FF0000FF')
      expect(Utils.getComponentInfoByKey('OnBlurEnabledCheckbox').$attrs.backgroundColor).assertEqual('#FFFFFF00')
      expect(Utils.getComponentInfoByKey('OnClickEnabledCheckbox').$attrs.enabled).assertTrue()
      done();
    })

    /*
    * @tc.number     : SUB_ARKUI_CAPI_CHECKBOX_ENABLED_0200
    * @tc.name       : testCheckboxEnabled002
    * @tc.desc       : testing enabled event callback for checkbox with normal value (false)
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testCheckboxEnabled002', 0, async (done: Function) => {
      await Utils.clickComponent('OnClickDisabledCheckbox')
      await Utils.sleep(1000)
      focusControl.requestFocus('OnBlurDisabledCheckbox')
      await Utils.sleep(1000)
      focusControl.requestFocus('OnFocusDisabledCheckbox')
      await Utils.sleep(1000)

      expect(Utils.getComponentInfoByKey('OnClickDisabledCheckbox').$attrs.backgroundColor).assertEqual('#FFFF0000')
      expect(Utils.getComponentInfoByKey('OnFocusDisabledCheckbox').$attrs.backgroundColor).assertEqual('#FFFF0000')
      expect(Utils.getComponentInfoByKey('OnBlurDisabledCheckbox').$attrs.backgroundColor).assertEqual('#FFFF0000')
      expect(Utils.getComponentInfoByKey('OnClickDisabledCheckbox').$attrs.enabled).assertFalse()
      done();
    })

    /*
    * @tc.number     : SUB_ARKUI_CAPI_CHECKBOX_ENABLED_0300
    * @tc.name       : testCheckboxEnabled003
    * @tc.desc       : testing enabled event callback for checkbox with abnormal value
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testCheckboxEnabled003', 0, async (done: Function) => {
      await Utils.clickComponent('OnClickAbnormalCheckbox')
      await Utils.sleep(1000)
      focusControl.requestFocus('OnBlurAbnormalCheckbox')
      await Utils.sleep(1000)
      focusControl.requestFocus('OnFocusAbnormalCheckbox')
      await Utils.sleep(1000)

      expect(Utils.getComponentInfoByKey('OnClickAbnormalCheckbox').$attrs.backgroundColor).assertEqual('#FF00FF00')
      expect(Utils.getComponentInfoByKey('OnFocusAbnormalCheckbox').$attrs.backgroundColor).assertEqual('#FF0000FF')
      expect(Utils.getComponentInfoByKey('OnBlurAbnormalCheckbox').$attrs.backgroundColor).assertEqual('#FFFFFF00')
      expect(Utils.getComponentInfoByKey('OnClickAbnormalCheckbox').$attrs.enabled).assertTrue()
      done();
    })
  })
}
