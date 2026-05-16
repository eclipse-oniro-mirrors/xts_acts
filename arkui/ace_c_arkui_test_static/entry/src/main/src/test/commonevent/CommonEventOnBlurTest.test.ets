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
import {focusControl} from '@ohos.arkui.component'

export default function commonEventOnBlurTest() {

  describe('CommonEventOnBlurTest', () => {

    let PAGE_TAG = 'CommonEventOnBlurTest';

    beforeAll(async () => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
      await Utils.pushPage(`commonevent/${PAGE_TAG}`, false);
    });

    
    
/**
     * @tc.number   testCommonEventOnBlur001
     * @tc.name     testCommonEventOnBlur001
     * @tc.desc     testCommonEventOnBlur001
     * @tc.level    Level.LEVEL1
     */
    it('testCommonEventOnBlur001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      focusControl.requestFocus('OnBlurTestButtonCompare')
      await Utils.sleep(2000)
      focusControl.requestFocus('OnBlurTestButton')
      await Utils.sleep(2000)
      let strJson = inspector.getInspectorByKey('OnBlurTestButtonCompare');
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('backgroundColor')).assertEqual('#FF00FF00')
      done()
    })


    
    
/**
     * @tc.number   testCommonEventOnBlur002
     * @tc.name     testCommonEventOnBlur002
     * @tc.desc     testCommonEventOnBlur002
     * @tc.level    Level.LEVEL1
     */
    it('testCommonEventOnBlur002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      focusControl.requestFocus('OnBlurTestButtonDisable')
      await Utils.sleep(2000)
      focusControl.requestFocus('OnBlurTestButton')
      await Utils.sleep(2000)
      let strJson = inspector.getInspectorByKey('OnBlurTestButtonDisable');
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('backgroundColor')).assertEqual('#FFFF0000')
      done()
    })

  })
}
