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
import inspector from '@ohos.arkui.inspector';
import { UtilsTest } from '../Util.test'

export default function checkboxOnChangeTest() {

  describe('CheckboxOnChangeTest', () => {

    let PAGE_TAG = 'CheckboxOnChangeTest';

    beforeAll(async () => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
      await Utils.pushPage(`checkbox/${PAGE_TAG}`, false);
    });

    
    
/**
     * @tc.number   testCheckboxOnChange001
     * @tc.name     testCheckboxOnChange001
     * @tc.desc     testCheckboxOnChange001
     * @tc.level    Level.LEVEL1
     */
    it('testCheckboxOnChange001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.clickComponent('OnChangeTestCheckBox')
      await Utils.sleep(2000)
      await Utils.clickComponent('OnChangeTestCheckBoxSelected')
      await Utils.sleep(2000)
      let strJson1 = inspector.getInspectorByKey('OnChangeTestCheckBox');
      let obj1 = JSON.parseJsonElement(strJson1);
      let strJson2 = inspector.getInspectorByKey('OnChangeTestCheckBoxSelected');
      let obj2 = JSON.parseJsonElement(strJson2);
      expect(obj1.getElement('$attrs').getString('backgroundColor')).assertEqual('#FF00FF00')
      expect(obj2.getElement('$attrs').getString('backgroundColor'))
        .assertEqual('#FF00FF00')
      done()
    })

  })
}
