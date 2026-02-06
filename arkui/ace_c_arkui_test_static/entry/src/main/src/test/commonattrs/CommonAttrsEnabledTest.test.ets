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
import Utils from '../common/Utils';
import { UtilsTest } from '../Util.test'
import inspector from '@ohos.arkui.inspector';
import {focusControl} from '@ohos.arkui.component'

export default function commonAttrsEnabledTest() {

  describe('CommonAttrsEnabledTest', () => {

    let PAGE_TAG = 'CommonAttrsEnabledTest';

    beforeAll(async () => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
      await Utils.pushPage(`commonattrs/${PAGE_TAG}`, false);
    });

    
    
/**
     * @tc.number   testCommonAttrsEnabled001
     * @tc.name     testCommonAttrsEnabled001
     * @tc.desc     testCommonAttrsEnabled001
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsEnabled001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.clickComponent('EnabledTestButton')
      await Utils.sleep(2000)
      let strJson1 = inspector.getInspectorByKey('EnabledTestButton');
      let obj1 = JSON.parseJsonElement(strJson1);
      expect(obj1.getElement('$attrs').getString('backgroundColor')).assertEqual('#FF00FF00')

      focusControl.requestFocus('EnabledTestButtonCompare')
      await Utils.sleep(2000)
      focusControl.requestFocus('EnabledTestButton')
      await Utils.sleep(2000)
      let strJson2 = inspector.getInspectorByKey('EnabledTestButton');
      let obj2 = JSON.parseJsonElement(strJson2);
      expect(obj2.getElement('$attrs').getString('backgroundColor')).assertEqual('#FF0000FF')

      focusControl.requestFocus('EnabledTestButtonCompare')
      await Utils.sleep(2000)
      let strJson3 = inspector.getInspectorByKey('EnabledTestButton');
      let obj3 = JSON.parseJsonElement(strJson3);
      let strJson4 = inspector.getInspectorByKey('EnabledTestButton');
      let obj4 = JSON.parseJsonElement(strJson4);
      expect(obj3.getElement('$attrs').getString('backgroundColor')).assertEqual('#FFFFFF00')

      expect(obj4.getElement('$attrs').getBoolean('enabled')).assertTrue()
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsEnabled002
     * @tc.name     testCommonAttrsEnabled002
     * @tc.desc     testCommonAttrsEnabled002
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsEnabled002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.clickComponent('EnabledTestButtonDisable')
      await Utils.sleep(2000)
      let strJson1 = inspector.getInspectorByKey('EnabledTestButtonDisable');
      let obj1 = JSON.parseJsonElement(strJson1);
      expect(obj1.getElement('$attrs').getString('backgroundColor')).assertEqual('#FFFF0000')

      focusControl.requestFocus('EnabledTestButton')
      await Utils.sleep(2000)
      focusControl.requestFocus('EnabledTestButtonDisable')
      await Utils.sleep(2000)
      let strJson2 = inspector.getInspectorByKey('EnabledTestButtonDisable');
      let obj2 = JSON.parseJsonElement(strJson2);
      expect(obj2.getElement('$attrs').getString('backgroundColor')).assertEqual('#FFFF0000')

      focusControl.requestFocus('EnabledTestButton')
      await Utils.sleep(2000)
      let strJson3 = inspector.getInspectorByKey('EnabledTestButtonDisable');
      let obj3 = JSON.parseJsonElement(strJson3);
      let strJson4 = inspector.getInspectorByKey('EnabledTestButtonDisable');
      let obj4 = JSON.parseJsonElement(strJson4);
      expect(obj3.getElement('$attrs').getString('backgroundColor')).assertEqual('#FFFF0000')

      expect(obj4.getElement('$attrs').getBoolean('enabled')).assertFalse()
      done()
    })

  })
}
