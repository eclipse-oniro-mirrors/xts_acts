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
export default function NavPathStackApi2() {
  describe('NavPathStackApi2',  () =>{
    beforeAll(() => {

      await UtilsTest.startAbility("com.arkui.ace.navigation.static", "EntryAbility");
    });

    beforeEach(async (): Promise<void> => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Navigation/NavPathStackApi2',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get NavPathStackApi2 state success " + JSON.stringify(pages));
        if (!("NavPathStackApi2" == pages.name)) {
          console.info("get NavPathStackApi2 state success " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push NavPathStackApi2 page success ");
        }
      } catch (err) {
        console.error("push NavPathStackApi2 page error: " + err);
      }
    });

    afterEach(async  () =>{
      await CommonFunc.sleep(1000);
      console.info("NavPathStackApi2 after each called");
    });


    
/**
     * @tc.number   NavPathStackApi2_static_001
     * @tc.name     NavPathStackApi2_static_001
     * @tc.desc     NavPathStackApi2_static_001
     * @tc.level    Level.LEVEL0
     */
it('NavPathStackApi2_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[NavPathStackApi2_static_001] START');
      await CommonFunc.sleep(1000);

      let driver= Driver.create();
      await CommonFunc.sleep(1000);
      let btn1 = await (driver.findComponent(ON.id('NavPathStackApi2_pushDestinationByName')) as Promise<Component>);
      await btn1.click()
      await CommonFunc.sleep(2000);
      console.info("[NavPathStackApi2_static_001] btn1")

      let strJson = inspector.getInspectorByKey('NavPathStackApi2_text_pageOne');
      let obj = JSON.parseJsonElement(strJson);
      await CommonFunc.sleep(1000);
      console.info("[NavPathStackApi2_static_001] obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('pageOne2');

      console.info('[NavPathStackApi2_static_001] END');
      done();

    });
  })
}


