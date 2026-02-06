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

import { beforeAll, describe, expect, it, Level } from '../../../../hypium';
import { focusControl } from '@ohos.arkui.component'
import Utils from '../common/Utils';
import { UtilsTest } from '../Util.test'
import inspector from '@ohos.arkui.inspector';

export default function checkboxEnabledTest() {

  describe('CheckboxEnabledTest', () => {

    let PAGE_TAG = 'CheckboxEnabledTest';

    beforeAll(async () => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
      await Utils.pushPage(`checkbox/${PAGE_TAG}`, false);
    });

    
    
/**
     * @tc.number   testCheckboxEnabled001
     * @tc.name     testCheckboxEnabled001
     * @tc.desc     testCheckboxEnabled001
     * @tc.level    Level.LEVEL1
     */
    it('testCheckboxEnabled001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.clickComponent('OnClickEnabledCheckbox')
      await Utils.sleep(1000)
      focusControl.requestFocus('OnBlurEnabledCheckbox')
      await Utils.sleep(1000)
      focusControl.requestFocus('OnFocusEnabledCheckbox')
      await Utils.sleep(1000)
      let strJson1 = inspector.getInspectorByKey('OnClickEnabledCheckbox');
      let obj1 = JSON.parseJsonElement(strJson1);
      let strJson2 = inspector.getInspectorByKey('OnFocusEnabledCheckbox');
      let obj2 = JSON.parseJsonElement(strJson2);
      let strJson3 = inspector.getInspectorByKey('OnBlurEnabledCheckbox');
      let obj3 = JSON.parseJsonElement(strJson3);
      let strJson4 = inspector.getInspectorByKey('OnClickEnabledCheckbox');
      let obj4 = JSON.parseJsonElement(strJson4);
      expect(obj1.getElement('$attrs').getString('backgroundColor')).assertEqual('#FF00FF00')
      expect(obj2.getElement('$attrs').getString('backgroundColor')).assertEqual('#FF0000FF')
      expect(obj3.getElement('$attrs').getString('backgroundColor')).assertEqual('#FFFFFF00')
      expect(obj4.getElement('$attrs').getBoolean('enabled')).assertTrue()
      done();
    })

    
    
/**
     * @tc.number   testCheckboxEnabled002
     * @tc.name     testCheckboxEnabled002
     * @tc.desc     testCheckboxEnabled002
     * @tc.level    Level.LEVEL1
     */
    it('testCheckboxEnabled002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.clickComponent('OnClickDisabledCheckbox')
      await Utils.sleep(1000)
      focusControl.requestFocus('OnBlurDisabledCheckbox')
      await Utils.sleep(1000)
      focusControl.requestFocus('OnFocusDisabledCheckbox')
      await Utils.sleep(1000)
      let strJson1 = inspector.getInspectorByKey('OnClickDisabledCheckbox');
      let obj1 = JSON.parseJsonElement(strJson1);
      let strJson2 = inspector.getInspectorByKey('OnFocusDisabledCheckbox');
      let obj2 = JSON.parseJsonElement(strJson2);
      let strJson3 = inspector.getInspectorByKey('OnBlurDisabledCheckbox');
      let obj3 = JSON.parseJsonElement(strJson3);
      let strJson4 = inspector.getInspectorByKey('OnClickDisabledCheckbox');
      let obj4 = JSON.parseJsonElement(strJson4);
      expect(obj1.getElement('$attrs').getString('backgroundColor')).assertEqual('#FFFF0000')
      expect(obj2.getElement('$attrs').getString('backgroundColor')).assertEqual('#FFFF0000')
      expect(obj3.getElement('$attrs').getString('backgroundColor')).assertEqual('#FFFF0000')
      expect(obj4.getElement('$attrs').getBoolean('enabled')).assertFalse()
      done();
    })

    
    
/**
     * @tc.number   testCheckboxEnabled003
     * @tc.name     testCheckboxEnabled003
     * @tc.desc     testCheckboxEnabled003
     * @tc.level    Level.LEVEL1
     */
    it('testCheckboxEnabled003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.clickComponent('OnClickAbnormalCheckbox')
      await Utils.sleep(1000)
      focusControl.requestFocus('OnBlurAbnormalCheckbox')
      await Utils.sleep(1000)
      focusControl.requestFocus('OnFocusAbnormalCheckbox')
      await Utils.sleep(1000)
      let strJson1 = inspector.getInspectorByKey('OnClickAbnormalCheckbox');
      let obj1 = JSON.parseJsonElement(strJson1);
      let strJson2 = inspector.getInspectorByKey('OnFocusAbnormalCheckbox');
      let obj2 = JSON.parseJsonElement(strJson2);
      let strJson3 = inspector.getInspectorByKey('OnBlurAbnormalCheckbox');
      let obj3 = JSON.parseJsonElement(strJson3);
      let strJson4 = inspector.getInspectorByKey('OnClickAbnormalCheckbox');
      let obj4 = JSON.parseJsonElement(strJson4);
      expect(obj1.getElement('$attrs').getString('backgroundColor')).assertEqual('#FF00FF00')
      expect(obj2.getElement('$attrs').getString('backgroundColor')).assertEqual('#FF0000FF')
      expect(obj3.getElement('$attrs').getString('backgroundColor')).assertEqual('#FFFFFF00')
      expect(obj4.getElement('$attrs').getBoolean('enabled')).assertTrue()
      done();
    })
  })
}
