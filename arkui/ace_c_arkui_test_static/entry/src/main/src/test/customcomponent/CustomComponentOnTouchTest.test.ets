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

export default function customComponentOnTouchTest() {

  describe('CustomComponentOnTouchTest', () => {

    let PAGE_TAG = 'CustomComponentOnTouchTest';

    beforeAll(async () => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
      await Utils.pushPage(`customcomponent/${PAGE_TAG}`, false);
    });

    
    
/**
     * @tc.number   testCustomComponentOnTouch001
     * @tc.name     testCustomComponentOnTouch001
     * @tc.desc     testCustomComponentOnTouch001
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentOnTouch001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.clickComponent('OnTouchTest')
      await Utils.sleep(2000)
      let strJson1 = inspector.getInspectorByKey('OnTouchTest');
      let obj1 = JSON.parseJsonElement(strJson1);
      expect(obj1.getElement('$attrs').getString('backgroundColor')).assertEqual('#FF00FF00')
      done()
    })

    
    
/**
     * @tc.number   testCustomComponentOnTouch002
     * @tc.name     testCustomComponentOnTouch002
     * @tc.desc     testCustomComponentOnTouch002
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentOnTouch002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.clickComponent('OnTouchTestDisable')
      await Utils.sleep(2000)
      let strJson1 = inspector.getInspectorByKey('OnTouchTestDisable');
      let obj1 = JSON.parseJsonElement(strJson1);
      expect(obj1.getElement('$attrs').getString('backgroundColor')).assertEqual('#FFFF0000')
      done()
    })
  })
}
