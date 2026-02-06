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

import { describe, beforeEach, beforeAll, afterEach, it, expect, Level} from "../../../../hypium/index"
import router from '@ohos.router';
import { Driver, Component, ON } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { MessageManager,Callback  } from '../../../ets/MainAbility/common/MessageManager';
import events_emitter from '@ohos.events.emitter';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import inspector from '@ohos.arkui.inspector'
import common from '@ohos.app.ability.common';
import { UtilsTest, startAbility } from '../Util.test';
import {SharedTransitionEffectType,Color} from '@ohos.arkui.component';
import { BusinessError } from '@ohos.base';
import { AppStorage } from '@ohos.arkui.stateManagement';
export default function NavigationApi() {
  describe('NavigationApi',  () =>{
    beforeAll(() => {

      await UtilsTest.startAbility("com.arkui.ace.navigation.static", "EntryAbility");
    });

    beforeEach(async (): Promise<void> => {
      console.info("NavigationApi beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Navigation/NavigationApi',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get NavigationApi state success " + JSON.stringify(pages));
        if (!("NavigationApi" == pages.name)) {
          console.info("get NavigationApi state success " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push NavigationApi page success ");
        }
      } catch (err) {
        console.error("push NavigationApi page error: " + err);
      }
    });

    afterEach(async  () =>{
      await CommonFunc.sleep(1000);
      console.info("NavigationApi after each called");
    });


    
/**
     * @tc.number   NavigationApi_static_001
     * @tc.name     NavigationApi_static_001
     * @tc.desc     NavigationApi_static_001
     * @tc.level    Level.LEVEL0
     */
it('NavigationApi_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[NavigationApi_static_001] START');
      await CommonFunc.sleep(1000);

      let driver= Driver.create();
      await CommonFunc.sleep(1000);
      let btn1 = await (driver.findComponent(ON.id('NavigationApi_pushPath')) as Promise<Component>);
      await btn1.click()
      await CommonFunc.sleep(2000);
      console.info("[NavigationApi_static_001] btn1")

      let btn2 = await (driver.findComponent(ON.id('NavigationApi_replacePathByName')) as Promise<Component>);
      await btn2.click()
      await CommonFunc.sleep(2000);
      console.info("[NavigationApi_static_001] btn2")

      let btn3 = await (driver.findComponent(ON.id('NavigationApi_pop2')) as Promise<Component>);
      console.info("[NavigationApi_static_001] btn3 before")
      await btn3.click()
  console.info("[NavigationApi_static_001] btn3 after")
      await CommonFunc.sleep(2000);
      console.info("[NavigationApi_static_001] btn3")

      let strJson = inspector.getInspectorByKey('NavigationApi_text_Navigation');
      await CommonFunc.sleep(1000);
      console.info("[NavigationApi_static_001] obj is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')).assertEqual('Navigation');

      console.info('[NavigationApi_static_001] END');
      done();

    });
  })
}


