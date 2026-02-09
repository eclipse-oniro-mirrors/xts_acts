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

export default function tabsCallBack7() {
  describe('tabsCallBack7', () => {
    beforeAll(() => {

      
      await UtilsTest.startAbility("com.arkui.ace.scroll12.static", "EntryAbility")
      
    });
    beforeEach(async (): Promise<void> => {
      console.info("tabsCallBack7 beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Tabs/tabsCallBack7",
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get tabsCallBack7 state pages:" + JSON.stringify(pages));
        if (!("tabsCallBack7" == pages.name)) {
          console.info("get tabsCallBack7 pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push tabsCallBack7 page result:");
        }
      } catch (err) {
        console.error("push tabsCallBack7 page error:" + err);
      }
      console.info("tabsCallBack7 beforeEach end");
    });


      
  
/**
     * @tc.number   tabsCallBack7_static_0100
     * @tc.name     tabsCallBack7_static_0100
     * @tc.desc     tabsCallBack7_static_0100
     * @tc.level    Level.LEVEL0
     */
it('tabsCallBack7_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[tabsCallBack7_static_0100] START');
      let swiperTabs = CommonFunc.getComponentRectOnScreen('callback_gestureSwipe_7');
      let top = swiperTabs.top;
      let right = swiperTabs.right;
      let left = swiperTabs.left;
      let bottom = swiperTabs.bottom;
      console.info("tabsCallBack7_static_0100 value is" + left + " --" + right + "--" + top + "--" + bottom);
      let height = bottom - top;
      let width = right - left;
      let driver = Driver.create()
      await driver.swipe((Math.round(left + width * 0.9)).toInt(), (Math.round(bottom - height / 2)).toInt(),
        (Math.round(left + width * 0.1)).toInt(), (Math.round(bottom - height / 2)).toInt());
      await CommonFunc.sleep(1500);
      let strJson1 = inspector.getInspectorByKey('tabs_onGestureSwipe_7');
      console.info("[tabsCallBack7_static_0100] component obj is: " + JSON.stringify(JSON.parseJsonElement(strJson1)));
      console.info("[tabsCallBack7_static_0100] content: " +
      JSON.stringify(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('content')));
      expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('content')).assertEqual('111');
      let strJson2 = inspector.getInspectorByKey('tabs_callback_7');
      console.info("[tabsCallBack7_static_0100] component obj is: " + JSON.stringify(JSON.parseJsonElement(strJson2)));
      console.info("[tabsCallBack7_static_0100] content1: " +
      JSON.stringify(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content')));
      expect(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content'))
        .assertEqual('tabs: onWillShow1-');
      console.info('[tabsCallBack7_static_0100] END');
      done();
    });
  })
}
