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
const uiContext = new UIContext();
export default function navigationNavbar01() {
  describe('navigationNavbar01',  () =>{
    beforeAll(() => {

      await UtilsTest.startAbility("com.arkui.ace.navigation.static", "EntryAbility");
    });

    beforeEach(async (): Promise<void> => {
      console.info("navigationNavbar01 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Navigation/navigationNavbar01',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get navigationNavbar01 state pages: " + JSON.stringify(pages));
        if (!("navigationNavbar01" == pages.name)) {
          console.info("get navigationNavbar01 state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push navigationNavbar01 page result: ");
        }
      } catch (err) {
        console.error("push navigationNavbar01 page error: " + err);
        expect().assertFail();
      }
    });


    
/**
     * @tc.number   navigationNavbar01_static_001
     * @tc.name     navigationNavbar01_static_001
     * @tc.desc     navigationNavbar01_static_001
     * @tc.level    Level.LEVEL0
     */
it('navigationNavbar01_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[navigationNavbar01_static_001] START');
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({name:'NavigationWidth', value: 300 });
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let button = await (driver.findComponent(ON.id('NavRouter0')) as Promise<Component>);
      await button.click();
      await CommonFunc.sleep(1000);
      let navigationText01 = CommonFunc.getComponentRect('navigationText01');
      expect(Math.round(navigationText01.right - navigationText01.left)).assertEqual(Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(300))));

      console.info('[navigationNavbar01_static_001] END');
      done();
    });


    
/**
     * @tc.number   navigationNavbar01_static_002
     * @tc.name     navigationNavbar01_static_002
     * @tc.desc     navigationNavbar01_static_002
     * @tc.level    Level.LEVEL0
     */
it('navigationNavbar01_static_002', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[navigationNavbar01_static_002] START');
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({name:'NavigationWidth', value: 200 });
      await CommonFunc.sleep(1000);
      let navigationText01 = CommonFunc.getComponentRect('navigationText01');
      console.info('[navigationNavbar01_static_002] navigationText01' + Number(navigationText01.right - navigationText01.left));
      console.info('[navigationNavbar01_static_002] AppStorage' + Number(AppStorage.get<UIContext>('uiContext')?.vp2px(200)));
      expect(Math.round(navigationText01.right - navigationText01.left)).assertEqual(Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(200))));
      console.info('[navigationNavbar01_static_002] END');
      done();
    });
  })
}
