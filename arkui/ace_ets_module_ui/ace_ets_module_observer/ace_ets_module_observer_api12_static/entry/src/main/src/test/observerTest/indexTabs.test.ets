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
import emitter from '@ohos.events.emitter';
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

let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;
export default function indexTabs() {
  describe('indexTabs', () => {
    beforeAll(() => {
      console.info("indexTabs beforeEach start");
      await UtilsTest.msSleep(4000);
      await UtilsTest.startAbility("com.arkui.ace.observer12.static", "EntryAbility");
      await UtilsTest.msSleep(4000);
    });
    beforeEach(async (): Promise<void> => {
      console.info("indexTabs beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/observer/indexTabs",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get indexTabs state pages:" + JSON.stringify(pages));
        if (!("indexTabs" == pages.name)) {
          console.info("get indexTabs pages.name:" + JSON.stringify(pages.name));
          // let result = routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push indexTabs page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push indexTabs page error:" + err);
      }
      console.info("indexTabs beforeEach end");
    });

    
    
/**
     * @tc.number   indexTabs_static_0100
     * @tc.name     indexTabs_static_0100
     * @tc.desc     indexTabs_static_0100
     * @tc.level    Level.LEVEL0
     */
it('indexTabs_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('[indexTabs_0100] START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let btn1 = await driver.findComponent(ON.id('observer_tabs_on'));
      await CommonFunc.sleep(500);
      await (btn1?.click() as Promise<void>);
      await CommonFunc.sleep(1500);

      let btn2 = await driver.findComponent(ON.id('change_index_obs'));
      await CommonFunc.sleep(500);
      await (btn2?.click() as Promise<void>);
      await CommonFunc.sleep(1500);

      let strJson = inspector.getInspectorByKey('tabs_tabIndex');
      console.info("[indexTabs_0100] component obj1 is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      console.info("[indexTabs_0100] content: " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')).assertEqual('index: 1');
      await CommonFunc.sleep(1000);

      let btn3 = await driver.findComponent(ON.id('observer_tabs_off'));
      await (btn3?.click() as Promise<void>);
      await CommonFunc.sleep(1500);
      console.info('[indexTabs_0100] END');
      done();
    });
  })
}
