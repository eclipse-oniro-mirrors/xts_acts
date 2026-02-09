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
export default function NavRouterJsunit() {
  describe('NavRouterJsunit',  () =>{
    beforeAll(() => {

      await UtilsTest.startAbility("com.arkui.ace.navigation.static", "EntryAbility");
    });

    beforeEach(async (): Promise<void> => {
      console.info("NavRouter beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/NavRouter/NavRouterPage',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get NavRouter state pages: " + JSON.stringify(pages));
        if (!("NavRouterPage" == pages.name)) {
          console.info("get NavRouter state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          console.info("push NavRouter page result: ");
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push NavRouter page error: " + err);
        expect().assertFail();
      }
    });

    
/**
     * @tc.number   NavRouterJsunit_static_0100
     * @tc.name     NavRouterJsunit_static_0100
     * @tc.desc     NavRouterJsunit_static_0100
     * @tc.level    Level.LEVEL0
     */
it('NavRouterJsunit_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      // Verify onStateChange function of the main title
      console.info('[NavRouterJsunit_static_0100] START');
      let driver = Driver.create()
      let navRouter = await (driver.findComponent(ON.id('NavRouter1')) as Promise<Component>);
      await navRouter.click();
      await CommonFunc.sleep(1000);
      let scrollBar: Component = await (driver.findComponent(ON.type('Scroll')) as Promise<Component>);

      let textComponent = await (scrollBar.scrollSearch(ON.id('textContent')) as Promise<Component>);
      let text2 = await textComponent.getText();
      console.info("[NavRouterJsunit_static_0100] text2: " + JSON.stringify(text2));
      expect(text2 == 'Hello').assertTrue();

      console.info('[NavRouterJsunit_static_0100] END');
      done();
    });
  })
}
