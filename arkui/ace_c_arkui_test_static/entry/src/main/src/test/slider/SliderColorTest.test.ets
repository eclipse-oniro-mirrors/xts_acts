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

import { resourceManager } from '@kit.LocalizationKit';
import { beforeEach, describe, expect, it, Level, beforeAll } from '../../../../hypium';
import Utils from '../common/Utils';
import {LibUtil} from '../../../ets/pages/LibUtil'
import { UtilsTest } from '../Util.test'
import { Resource,$r } from '@ohos.arkui.component'
import { Driver, ON, MouseButton, Component, Point } from '@kit.TestKit';
import inspector from '@ohos.arkui.inspector';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UIContext } from '@ohos.arkui.UIContext';

let libUtil: LibUtil = new LibUtil();

function spliceColor(sysColor: Resource) {
  let context: UIContext = AppStorage.get<UIContext>('uiContent') as UIContext;
  let resourceColor = context!.getHostContext()!.resourceManager.getColorSync(sysColor.id)
  let newArgb: string = '#' + resourceColor.toString(16).toUpperCase()
  return newArgb;
}


export default function sliderSelectedColorTest() {

  describe('SliderColorTest', () => {

    let PAGE_TAG = 'SliderColorTest';
    beforeAll(() => {
      console.log('SliderColorTest start')
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
      console.log('SliderColorTest end')
    });
    beforeEach(async (): Promise<void> => {
      await Utils.pushPage(`slider/${PAGE_TAG}`, false);
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testSliderColor001
     * @tc.name     testSliderColor001
     * @tc.desc     testSliderColor001
     * @tc.level    Level.LEVEL1
     */
    it('testSliderColor001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('testSliderColor001  START');
      await Utils.sleep(500);
      let strJson = inspector.getInspectorByKey('sliderId');
      console.info('testSliderColor001 strJson:' + JSON.stringify(strJson));
      let obj = JSON.parseJsonElement(strJson);
      console.info("testSliderColor001 component obj.$attrs is: " + JSON.stringify(obj.getElement('$attrs')));
      console.info("testSliderColor001 component obj.$attrs.selectedColor is: " +
      JSON.stringify(obj.getElement('$attrs').getString('selectedColor')));
      console.info("testSliderColor001 component sys  selectedColor  is: " +
      spliceColor($r('sys.color.ohos_id_color_emphasize')));
      expect(obj.getElement('$attrs').getString('selectedColor'))
        .assertEqual(spliceColor($r('sys.color.ohos_id_color_emphasize')))
      done()
    })

  })
}