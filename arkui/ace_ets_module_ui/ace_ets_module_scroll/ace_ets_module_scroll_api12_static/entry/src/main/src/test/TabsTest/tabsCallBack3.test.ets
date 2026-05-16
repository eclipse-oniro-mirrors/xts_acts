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

export default function tabsCallBack3() {
  describe('tabsCallBack3', () => {
    beforeAll(() => {

      
      await UtilsTest.startAbility("com.arkui.ace.scroll12.static", "EntryAbility")
      
    });
    beforeEach(async (): Promise<void> => {
      console.info("tabsCallBack3 beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Tabs/tabsCallBack3",
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get tabsCallBack3 state pages:" + JSON.stringify(pages));
        if (!("tabsCallBack3" == pages.name)) {
          console.info("get tabsCallBack3 pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push tabsCallBack3 page result:");
        }
      } catch (err) {
        console.error("push tabsCallBack3 page error:" + err);
      }
      console.info("tabsCallBack3 beforeEach end");
    });
    afterEach(async () => {
      await CommonFunc.sleep(500);
      console.info("tabsCallBack3 after each called");
    });

 
    
      
  
/**
     * @tc.number   tabsCallBack3_static_0100
     * @tc.name     tabsCallBack3_static_0100
     * @tc.desc     tabsCallBack3_static_0100
     * @tc.level    Level.LEVEL0
     */
it('tabsCallBack3_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[tabsCallBack3_static_0100] START');
      let driver = Driver.create();
      let btn = await driver.findComponent(ON.id('tabs_callback_index_3'));
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(1500);
      let strJson = inspector.getInspectorByKey('tabs_callback_3');
      console.info("[tabsCallBack3_static_0100] component obj is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      console.info("[tabsCallBack3_static_0100] content: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')));
      await CommonFunc.sleep(1000);
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content'))
        .assertEqual('tabs: onWillShow1-onContentWillChange-onWillShow2-onWillHide1-onChange-');
      console.info('[tabsCallBack3_static_0100] END');
      done();
    });
  })
}
