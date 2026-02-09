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

import { describe, beforeEach, beforeAll, afterEach, it, expect, Level} from "../../../../../hypium/index"
import router from '@ohos.router';
import { Driver, Component, ON } from '@ohos.UiTest';
import CommonFunc from '../../../../ets/MainAbility/common/Common';
import { MessageManager,Callback  } from '../../../../ets/MainAbility/common/MessageManager';
import events_emitter from '@ohos.events.emitter';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import inspector from '@ohos.arkui.inspector'
import common from '@ohos.app.ability.common';
import { UtilsTest, startAbility } from '../../Util.test';
import {SharedTransitionEffectType,Color} from '@ohos.arkui.component';
import { BusinessError } from '@ohos.base';
import { AppStorage } from '@ohos.arkui.stateManagement';
export default function NavigationLevelTest21() {
  describe('NavigationLevelTest21', () => {
    beforeAll(() => {

      await UtilsTest.msSleep(4000);
      await startAbility("com.arkui.ace.navigation12.static", "EntryAbility");
      await UtilsTest.msSleep(4000);
    });

    beforeEach(async (): Promise<void> => {
      console.info("NavigationLevelTest21 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Navigation/NavigationLevel/NavigationLevelTest21',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get NavigationLevelTest21 state success " + JSON.stringify(pages));
        if (!("NavigationLevelTest21" == pages.name)) {
          console.info("get NavigationLevelTest21 state success " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push NavigationLevelTest21 page success ");
        }
      } catch (err) {
        console.error("push NavigationLevelTest21 page error: " + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("NavigationLevelTest21 after each called");
    });

    
    

    /**
     * @tc.number   NavigationLevelTest21_static_0100
     * @tc.name     NavigationLevelTest21_static_0100
     * @tc.desc     NavigationLevelTest21_static_0100
     * @tc.level    Level.LEVEL0
     */
it('NavigationLevelTest21_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('[NavigationLevelTest21_static_0100] START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(1000);

      let btn = await driver.findComponent(ON.id('NavigationLevelTest21_btn1'));
      await (btn?.click() as Promise<void>);
      console.info('[NavigationLevelTest21_static_0100] btn click');
      await CommonFunc.sleep(1000);

      let strJson1 = inspector.getInspectorByKey('NavigationLevelTest21_text1');
      await CommonFunc.sleep(1000);
      console.info("[NavigationLevelTest21_static_0100] obj1 is: " + JSON.stringify(JSON.parseJsonElement(strJson1)));
      expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('content')).assertEqual('pageOne');

      console.info('[NavigationLevelTest21_static_0100] END');
      done();
    });
  })
}

