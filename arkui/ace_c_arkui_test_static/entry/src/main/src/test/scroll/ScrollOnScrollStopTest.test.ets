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

export default function scrollOnScrollStopTest() {

  describe('ScrollOnScrollStopTest', () => {

    let PAGE_TAG = 'ScrollOnScrollStopTest';

    beforeAll(async () => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
      await Utils.pushPage(`scroll/${PAGE_TAG}`, false);
    });

    
    
/**
     * @tc.number   testScrollOnScrollStop001
     * @tc.name     testScrollOnScrollStop001
     * @tc.desc     testScrollOnScrollStop001
     * @tc.level    Level.LEVEL1
     */
    it('testScrollOnScrollStop001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.flingComponent('scrollCalled', false, true);
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('scrollCalled');
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('backgroundColor')).assertEqual('#FF00FF00')
      done()
    })

    
    
/**
     * @tc.number   testScrollOnScrollStop002
     * @tc.name     testScrollOnScrollStop002
     * @tc.desc     testScrollOnScrollStop002
     * @tc.level    Level.LEVEL1
     */
    it('testScrollOnScrollStop002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.flingComponent('scrollNotCalled', true, true);
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('scrollNotCalled');
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('backgroundColor')).assertEqual('#FFFF0000')
      done()
    })
  })
}
