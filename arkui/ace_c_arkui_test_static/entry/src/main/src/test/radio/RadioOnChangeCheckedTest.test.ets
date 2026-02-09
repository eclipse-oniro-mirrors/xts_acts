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

import { describe, expect, it, afterEach, Level,beforeAll,beforeEach } from '../../../../hypium';
import Utils from '../common/Utils';
import { Driver, ON, MouseButton,Component,Point } from '@kit.TestKit';
import { UtilsTest } from '../Util.test'
import inspector from '@ohos.arkui.inspector';

export default function radioOnChangeCheckedTest() {

  describe('RadioOnChangeCheckedTest', () => {

    let PAGE_TAG = 'RadioOnChangeCheckedTest';

    beforeAll(async () => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
      await Utils.pushPage(`radio/${PAGE_TAG}`, false);
    });

    
    
/**
     * @tc.number   testRadioChecked008
     * @tc.name     testRadioChecked008
     * @tc.desc     testRadioChecked008
     * @tc.level    Level.LEVEL1
     */
    it('testRadioChecked008', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let strJson1 = inspector.getInspectorByKey('OnChangeRadio');
      let obj1 = JSON.parseJsonElement(strJson1);
      let strJson2 = inspector.getInspectorByKey('OnChangeRadio2');
      let obj2 = JSON.parseJsonElement(strJson2);
      let r1 = obj1.getElement('$attrs').getBoolean('checked');
      let r2 = obj2.getElement('$attrs').getBoolean('checked');

      let r3 = false;

      if(r1 != r2)
      {
        r3 = true;
      }
      await Utils.sleep(2000);
      expect(r3).assertEqual(true)
      done()
    })

  })
}
