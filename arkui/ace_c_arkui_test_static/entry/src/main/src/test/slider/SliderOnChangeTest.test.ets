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

import { beforeEach, describe, expect, it, Level, beforeAll } from '../../../../hypium';
import Utils from '../common/Utils';
import {LibUtil} from '../../../ets/pages/LibUtil'
import { UtilsTest } from '../Util.test'
import { ScrollState, ScrollSource,focusControl } from '@ohos.arkui.component'
import { Driver, ON, MouseButton, Component, Point } from '@kit.TestKit';
import inspector from '@ohos.arkui.inspector';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UIContext } from '@ohos.arkui.UIContext';

export default function sliderOnChangeTest() {

  describe('SliderOnChangeTest', () => {

    let PAGE_TAG = 'SliderOnChangeTest';

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
      await Utils.pushPage(`slider/${PAGE_TAG}`, false);
    });

    
    
/**
     * @tc.number   testSliderOnchange001
     * @tc.name     testSliderOnchange001
     * @tc.desc     testSliderOnchange001
     * @tc.level    Level.LEVEL1
     */
    it('testSliderOnchange001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.clickComponent('OnChangeSlider')
      await Utils.sleep(5000);
      let strJson1 = inspector.getInspectorByKey('OnChangeSlider');
      let obj1 = JSON.parseJsonElement(strJson1);
      expect(obj1.getElement('$attrs').getString('trackColor')).assertEqual('#FFFF0000')
      done()
    })

    
    
/**
     * @tc.number   testSliderOnchange002
     * @tc.name     testSliderOnchange002
     * @tc.desc     testSliderOnchange002
     * @tc.level    Level.LEVEL1
     */
    it('testSliderOnchange002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.clickComponent('OnChangeSliderValue')
      await Utils.sleep(5000);
      let strJson1 = inspector.getInspectorByKey('OnChangeSliderValue');
      let obj1 = JSON.parseJsonElement(strJson1);
      expect(obj1.getElement('$attrs').getString('trackColor')).assertEqual('#FF00FF00')
      done()
    })
  })
}
