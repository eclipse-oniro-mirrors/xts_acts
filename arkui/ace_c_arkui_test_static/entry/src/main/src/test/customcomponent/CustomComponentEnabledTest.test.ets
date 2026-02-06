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

import { describe, expect, it, afterEach, Level, beforeAll, beforeEach } from '../../../../hypium';
import Utils from '../common/Utils';
import { Driver, ON, MouseButton, Component, Point } from '@kit.TestKit';
import { UtilsTest } from '../Util.test'
import inspector from '@ohos.arkui.inspector';
import { focusControl } from '@ohos.arkui.component'

export default function customComponentEnabledTest() {

  describe('CustomComponentEnabledTest', () => {

    let PAGE_TAG = 'CustomComponentEnabledTest';

    beforeAll(async () => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
      await Utils.pushPage(`customcomponent/${PAGE_TAG}`, false);
    });

    
    
/**
     * @tc.number   testCustomComponentEnabled001
     * @tc.name     testCustomComponentEnabled001
     * @tc.desc     testCustomComponentEnabled001
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentEnabled001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.clickComponent('EnabledTestCustomComponent')
      await Utils.sleep(2000)
      let strJson1 = inspector.getInspectorByKey('EnabledTestCustomComponent');
      let obj1 = JSON.parseJsonElement(strJson1);
      let strJson2 = inspector.getInspectorByKey('EnabledTestCustomComponent');
      let obj2 = JSON.parseJsonElement(strJson2);
      expect(obj1.getElement('$attrs').getString('backgroundColor')).assertEqual('#FF00FF00')

      focusControl.requestFocus('EnabledTestCustomComponentCompare')
      await Utils.sleep(2000)
      focusControl.requestFocus('EnabledTestCustomComponent')
      await Utils.sleep(2000)
      expect(obj2.getElement('$attrs').getString('backgroundColor')).assertEqual('#FF00FF00')

      focusControl.requestFocus('EnabledTestCustomComponentCompare')
      await Utils.sleep(2000)
      let strJson3 = inspector.getInspectorByKey('EnabledTestCustomComponent');
      let obj3 = JSON.parseJsonElement(strJson3);
      expect(obj3
        .getElement('$attrs')
        .getString('backgroundColor')).assertEqual('#FF00FF00')
      let strJson4 = inspector.getInspectorByKey('EnabledTestCustomComponent');
      let obj4 = JSON.parseJsonElement(strJson4);
      expect(obj4.getElement('$attrs').getBoolean('enabled')).assertTrue()
      done()
    })

    
    
/**
     * @tc.number   testCustomComponentEnabled002
     * @tc.name     testCustomComponentEnabled002
     * @tc.desc     testCustomComponentEnabled002
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentEnabled002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.clickComponent('EnabledTestCustomComponentDisable')
      await Utils.sleep(2000)
      let strJson1 = inspector.getInspectorByKey('EnabledTestCustomComponentDisable');
      let obj1 = JSON.parseJsonElement(strJson1);
      let strJson2 = inspector.getInspectorByKey('EnabledTestCustomComponentDisable');
      let obj2 = JSON.parseJsonElement(strJson2);
      let strJson3 = inspector.getInspectorByKey('EnabledTestCustomComponentDisable');
      let obj3 = JSON.parseJsonElement(strJson3);
      let strJson4 = inspector.getInspectorByKey('EnabledTestCustomComponentDisable');
      let obj4 = JSON.parseJsonElement(strJson4);
      expect(obj1
        .getElement('$attrs')
        .getString('backgroundColor')).assertEqual('#FFFF0000')

      focusControl.requestFocus('EnabledTestCustomComponent')
      await Utils.sleep(2000)
      focusControl.requestFocus('EnabledTestCustomComponentDisable')
      await Utils.sleep(2000)
      expect(obj2
        .getElement('$attrs')
        .getString('backgroundColor')).assertEqual('#FFFF0000')

      focusControl.requestFocus('EnabledTestCustomComponent')
      await Utils.sleep(2000)
      expect(obj3
        .getElement('$attrs')
        .getString('backgroundColor')).assertEqual('#FFFF0000')

      expect(obj4.getElement('$attrs').getBoolean('enabled')).assertFalse()
      done()
    })

  })
}
