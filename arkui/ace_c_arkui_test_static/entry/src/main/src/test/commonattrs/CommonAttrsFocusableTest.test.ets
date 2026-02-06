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
import {focusControl} from '@ohos.arkui.component'
import inspector from '@ohos.arkui.inspector';

export default function commonAttrsFocusableTest() {

  describe('CommonAttrsFocusableTest', () => {

    let PAGE_TAG = 'CommonAttrsFocusableTest';

    beforeAll(async () => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
      await Utils.pushPage(`commonattrs/${PAGE_TAG}`, false);
    });

    
    
/**
     * @tc.number   testCommonAttrsFocusable001
     * @tc.name     testCommonAttrsFocusable001
     * @tc.desc     testCommonAttrsFocusable001
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsFocusable001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      focusControl.requestFocus('FocusableTestButtonCompare')
      await Utils.sleep(2000)
      focusControl.requestFocus('FocusableTestButton')
      await Utils.sleep(2000)
      let strJson1 = inspector.getInspectorByKey('FocusableTestButton');
      let obj1 = JSON.parseJsonElement(strJson1);
      let strJson2 = inspector.getInspectorByKey('FocusableTestButton');
      let obj2 = JSON.parseJsonElement(strJson2);
      expect(obj1.getElement('$attrs').getString('backgroundColor')).assertEqual('#FF00FF00')

      expect(obj2.getElement('$attrs').getBoolean('focusable')).assertTrue()
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsFocusable002
     * @tc.name     testCommonAttrsFocusable002
     * @tc.desc     testCommonAttrsFocusable002
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsFocusable002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      focusControl.requestFocus('FocusableTestButton')
      await Utils.sleep(2000)
      focusControl.requestFocus('FocusableTestButtonDisable')
      await Utils.sleep(2000)
      let strJson1 = inspector.getInspectorByKey('FocusableTestButtonDisable');
      let obj1 = JSON.parseJsonElement(strJson1);
      let strJson2 = inspector.getInspectorByKey('FocusableTestButtonDisable');
      let obj2 = JSON.parseJsonElement(strJson2);
      expect(obj1.getElement('$attrs').getString('backgroundColor')).assertEqual('#FFFF0000')

      expect(obj2.getElement('$attrs').getBoolean('focusable')).assertFalse()
      done()
    })

  })
}
