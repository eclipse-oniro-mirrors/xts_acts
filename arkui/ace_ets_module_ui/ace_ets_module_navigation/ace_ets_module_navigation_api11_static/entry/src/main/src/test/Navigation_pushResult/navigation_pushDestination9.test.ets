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
export default function navigation_pushDestination9() {
  describe('navigation_pushDestination9',  () =>{
    beforeAll(() => {

      await UtilsTest.startAbility("com.arkui.ace.navigation.static", "EntryAbility");
    });

    beforeEach(async (): Promise<void> => {
      console.info("navigation_pushDestination9 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Navigation_pushResult/navigation_pushDestination9',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get navigation_pushDestination9 state pages:" + JSON.stringify(pages));
        if (!("navigation_pushDestination9" == pages.name)) {
          console.info("get navigation_pushDestination9 pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push navigation_pushDestination9 page result:");
        }
      } catch (err) {
        console.error("push navigation_pushDestination9 page error:" + err);
      }
      console.info("navigation_pushDestination9 beforeEach end");
    });
    afterEach(async  () =>{
      await CommonFunc.sleep(1000);
      console.info("navigation_pushDestination9 after each called");
    });


    
/**
     * @tc.number   navigation_pushDestination9_static_0100
     * @tc.name     navigation_pushDestination9_static_0100
     * @tc.desc     navigation_pushDestination9_static_0100
     * @tc.level    Level.LEVEL0
     */
it('navigation_pushDestination9_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[navigation_pushDestination9_static_0100] START');
      await CommonFunc.sleep(2000);

      let driver = Driver.create();
      await CommonFunc.sleep(300);
      let btn1 = await (driver.findComponent(ON.id('navigation_pushDestination9_pushDestinationOne')) as Promise<Component>);
      await btn1.click();
      await CommonFunc.sleep(2000);
      console.info('[navigation_pushDestination9_static_0100] btn1');

      let text1 = inspector.getInspectorByKey('navigation_pushDestination9_text_result1');
      expect(JSON.parseJsonElement(text1).getElement('$attrs').getString('content')).assertEqual('success');

      let btn2 = await (driver.findComponent(ON.id('navigation_pushDestination9_pop')) as Promise<Component>);
      await btn2.click();
      await CommonFunc.sleep(2000);
      console.info('[navigation_pushDestination9_static_0100] btn2');

      let btn3 = await (driver.findComponent(ON.id('navigation_pushDestination9_pushDestinationTwo')) as Promise<Component>);
      await btn3.click();
      await CommonFunc.sleep(2000);
      console.info('[navigation_pushDestination9_static_0100] btn3');

      let text2 = inspector.getInspectorByKey('navigation_pushDestination9_text_result2');
      expect(JSON.parseJsonElement(text2).getElement('$attrs').getString('content')).assertEqual('100006NavDestination not found.');

      let btn4 = await (driver.findComponent(ON.id('navigation_pushDestination9_btn')) as Promise<Component>);
      await btn4.click();
      await CommonFunc.sleep(2000);
      console.info('[navigation_pushDestination9_static_0100] btn4');

      let btn5 = await (driver.findComponent(ON.id('navigation_pushDestination9_pushDestinationThree')) as Promise<Component>);
      await btn5.click();
      await CommonFunc.sleep(2000);
      console.info('[navigation_pushDestination9_static_0100] btn5');

      let text3 = inspector.getInspectorByKey('navigation_pushDestination9_text_result3');
      expect(JSON.parseJsonElement(text3).getElement('$attrs').getString('content')).assertEqual('100005Builder function not registered.');

      console.info('[navigation_pushDestination9_static_0100] END');
      done();
    });

  })
}
