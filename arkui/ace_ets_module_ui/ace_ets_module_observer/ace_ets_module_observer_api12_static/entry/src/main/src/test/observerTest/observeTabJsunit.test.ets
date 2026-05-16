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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium"
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON,  MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector';

export default function observeTabJsunit() {
  describe('observeTabJsunit', () => {
    beforeAll(() => {
      console.info("observeTabJsunit beforeEach start");
      await UtilsTest.msSleep(4000);
      await UtilsTest.startAbility("com.arkui.ace.observer12.static", "EntryAbility");
      await UtilsTest.msSleep(4000);
    });
    beforeEach(async (): Promise<void> => {
      console.info("observeTabJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/observer/observeTab",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get observeTabJsunit state pages:" + JSON.stringify(pages));
        if (!("observeTab" == pages.name)) {
          console.info("get observeTabJsunit pages.name:" + JSON.stringify(pages.name));
          // let result = routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push observeTabJsunit page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push observeTabJsunit page error:" + err);
      }
      console.info("observeTabJsunit beforeEach end");
    });
    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("observeTabJsunit after each called");
    });

    
    
/**
     * @tc.number   observeTabJsunit_static_0100
     * @tc.name     observeTabJsunit_static_0100
     * @tc.desc     observeTabJsunit_static_0100
     * @tc.level    Level.LEVEL0
     */
it('observeTabJsunit_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('[observeTabJsunit_0100] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn1 = await driver.findComponent(ON.id('observer_tabOn'));
      await (btn1?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let btn2 = await driver.findComponent(ON.id('change_index'));
      await (btn2?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      let strJson3 = inspector.getInspectorByKey('tabs_tabContentId');
      let obj3 = JSON.parseJsonElement(strJson3);
      console.info("[observeTabJsunit_0100] component obj3 is: " + JSON.stringify(obj3));
      expect(obj3.getElement('$attrs').getString('content')).assertEqual('tabContentId: tabContent02');
	  
      await CommonFunc.sleep(1000);
      let btn3 = await driver.findComponent(ON.id('observer_tabOff'));
      await (btn3?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
	  
      console.info('[observeTabJsunit_0100] END');
      done();
    });
  })
}
