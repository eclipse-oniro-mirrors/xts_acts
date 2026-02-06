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

export default function tabsCallBack4() {
  describe('tabsCallBack4', () => {
    beforeAll(() => {
      await UtilsTest.startAbility("com.arkui.ace.scroll12.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("tabsCallBack4 beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Tabs/tabsCallBack4",
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get tabsCallBack4 state pages:" + JSON.stringify(pages));
        if (!("tabsCallBack4" == pages.name)) {
          console.info("get tabsCallBack4 pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push tabsCallBack4 page result:");
        }
      } catch (err) {
        console.error("push tabsCallBack4 page error:" + err);
      }
      console.info("tabsCallBack4 beforeEach end");
    });

    afterEach(async () => {
      await CommonFunc.sleep(500);
      console.info("tabsCallBack4 after each called");
    });

  
/**
     * @tc.number   tabsCallBack4_static_0100
     * @tc.name     tabsCallBack4_static_0100
     * @tc.desc     tabsCallBack4_static_0100
     * @tc.level    Level.LEVEL0
     */
it('tabsCallBack4_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[tabsCallBack4_static_0100] START');
      let swiperTabs = CommonFunc.getComponentRectOnScreen('tabs_swipe_callback');
      let top = swiperTabs.top;
      let right = swiperTabs.right;
      let left = swiperTabs.left;
      let bottom = swiperTabs.bottom;
      console.info("tabsCallBack4_static_0100 value is" + left + " --" + right + "--" + top + "--" + bottom);
      let height = bottom - top;
      let width = right - left;
      let driver = Driver.create()
      await driver.swipe((Math.round(left + width * 0.9)).toInt(), (Math.round(bottom - height / 2)).toInt(),
        (Math.round(left + width * 0.1)).toInt(), (Math.round(bottom - height / 2)).toInt());
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('tabs_callback_4');
      console.info("[tabsCallBack4_static_0100] component obj is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      console.info("[tabsCallBack4_static_0100] content: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')));
      await CommonFunc.sleep(1000);
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content'))
        .assertEqual('tabs: onWillShow1-onContentWillChange-onWillShow2-onWillHide1-onAnimationStart-onChange-');
      console.info('[tabsCallBack4_static_0100] END');
      done();
    });
  })
}
