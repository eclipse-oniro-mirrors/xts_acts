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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index";
import router from '@ohos.router';
import { Driver, Component, UiWindow, ON } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import events_emitter from '@ohos.events.emitter';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import { UtilsTest } from '../Util.test'
import { UtilsTest } from '../Util.test';

let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function symbolTabs() {
  describe('symbolTabs', () => {
    beforeAll(() => {
      await UtilsTest.startAbility("com.arkui.ace.scroll12.static", "EntryAbility")
      
    });
    beforeEach(async (): Promise<void> => {
      console.info("symbolTabs beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Tabs/symbolTabs",
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get symbolTabs state pages:" + JSON.stringify(pages));
        if (!("symbolTabs" == pages.name)) {
          console.info("get symbolTabs pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push symbolTabs page result:");
        }
      } catch (err) {
        console.error("push symbolTabs page error:" + err);
      }
      console.info("symbolTabs beforeEach end");
    });

    
      
  
/**
     * @tc.number   symbolTabs_static_0100
     * @tc.name     symbolTabs_static_0100
     * @tc.desc     symbolTabs_static_0100
     * @tc.level    Level.LEVEL0
     */
it('symbolTabs_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[symbolTabs_static_0100] START');
      let swipeTabs = CommonFunc.getComponentRectOnScreen('tabs_normal_id');
      let top = swipeTabs.top;
      let right = swipeTabs.right;
      let left = swipeTabs.left;
      let bottom = swipeTabs.bottom;
      console.info("symbolTabs_static_0100 value is" + left + " --" + right + "--" + top + "--" + bottom);
      let height = bottom - top;
      let width = right - left;
      let driver = Driver.create()
      await driver.drag((Math.round(left + width * 0.8)).toInt(), (Math.round(top + height / 2)).toInt(),
        (Math.round(left + width * 0.2)).toInt(), (Math.round(top + height / 2)).toInt());
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('tabs_symbol_mess');
      console.info("[symbolTabs_static_0100] component obj is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      console.info("[symbolTabs_static_0100] content: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content'))
        .assertEqual('symbol: Pink onWillHide');
      console.info('[symbolTabs_static_0100] END');
      done();
    });
  })
}
