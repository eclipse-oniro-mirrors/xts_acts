'use static';
/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import events_emitter from '@ohos.events.emitter';
import { afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType, afterAll } from '../../../../hypium/index'
import router from '@ohos.router';
import {
  Component,
  DisplayRotation,
  Driver,
  MatchPattern,
  ON,
  PointerMatrix,
  ResizeDirection,
  UiWindow,
  WindowMode
} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { startAbility, UtilsTest } from '../Util.test';

let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function onSelectedTabs() {
  describe('onSelectedTabs', () => {
    beforeAll(() => {
      console.info("onSelectedTabs beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.scroll18.static", "EntryAbility");
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("onSelectedTabs beforeEach start");
      const onSelectedTabs = AppStorage.get<Router>("router") as Router
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Tabs/onSelectedTabs",
      }
      try {
        let pages = onSelectedTabs.getState();
        console.info("get onSelectedTabs state pages:" + JSON.stringify(pages));
        if (!("onSelectedTabs" == pages.name)) {
          console.info("get onSelectedTabs pages.name:" + JSON.stringify(pages.name));
          onSelectedTabs.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push onSelectedTabs page error:" + err);
      }
      console.info("onSelectedTabs beforeEach end");
    });


    
    
/**
     * @tc.number   onSelectedTabs_static_0100
     * @tc.name     onSelectedTabs_static_0100
     * @tc.desc     onSelectedTabs_static_0100
     * @tc.level    Level.LEVEL0
     */
it('onSelectedTabs_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[onSelectedTabs_static_0100] START');
      let swipeTabs = CommonFunc.getComponentRectOnScreen('tabs_onSelected');
      let top = swipeTabs.top;
      let right = swipeTabs.right;
      let left = swipeTabs.left;
      let bottom = swipeTabs.bottom;
      console.info("onSelectedTabs_static_0100 value is" + left + " --" + right + "--" + top + "--" + bottom);
      let height = bottom - top;
      let width = right - left;
      let driver = Driver.create()
      await driver.drag((Math.round(left + width * 0.8)).toInt(), (Math.round(top + height / 2)).toInt(),
        (Math.round(left + width * 0.2)).toInt(), (Math.round(top + height / 2)).toInt());
      await CommonFunc.sleep(2000);
      let strJson1 = inspector.getInspectorByKey('selectedIndex_tabs_text');
      console.info("[onSelectedTabs_static_0100] component obj1 is: " +
      JSON.stringify(JSON.parseJsonElement(strJson1)));
      console.info("[onSelectedTabs_static_0100] content1: " +
      JSON.stringify(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('content')));
      expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('content')).assertEqual('selectedIndex: 1');

      let strJson2 = inspector.getInspectorByKey('onUnselected_tabs_text');
      console.info("[onSelectedTabs_static_0100] component obj2 is: " +
      JSON.stringify(JSON.parseJsonElement(strJson2)));
      console.info("[onSelectedTabs_static_0100] content2: " +
      JSON.stringify(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content')));
      expect(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content')).assertEqual('index: 0');
      console.info('[onSelectedTabs_static_0100] END');
      done();
    });
  })
}
