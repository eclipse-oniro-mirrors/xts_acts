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
export default function NavigationOnPop() {
  describe('NavigationOnPop', () => {
    beforeAll(() => {

      await UtilsTest.msSleep(4000);
      await startAbility("com.arkui.ace.navigation12.static", "EntryAbility");
      await UtilsTest.msSleep(4000);
    });

    beforeEach(async (): Promise<void> => {
      console.info("NavigationOnPop beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Navigation/NavigationOnPop',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get NavigationOnPop state pages:" + JSON.stringify(pages));
        if (!("NavigationOnPop" == pages.name)) {
          console.info("get NavigationOnPop pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push NavigationOnPop page result:");
        }
      } catch (err) {
        console.error("push NavigationOnPop page error:" + err);
      }
      console.info("NavigationOnPop beforeEach end");
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("NavigationOnPop after each called");
    });



    

    /**
     * @tc.number   NavigationOnPop_static_0100
     * @tc.name     NavigationOnPop_static_0100
     * @tc.desc     NavigationOnPop_static_0100
     * @tc.level    Level.LEVEL0
     */
it('NavigationOnPop_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('NavigationOnPop_static_0100 START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let btn1 = await driver.findComponent(ON.id('NavigationOnPop_pageOne'));
      await (btn1?.click() as Promise<void>);
      console.info("[NavigationOnPop_static_0100] btn1");
      await CommonFunc.sleep(1000);

      let btn2 = await driver.findComponent(ON.id('NavigationOnPop_pop'));
      await (btn2?.click() as Promise<void>);
      console.info("[NavigationOnPop_static_0100] btn2");
      await CommonFunc.sleep(1000);

      let strJson1 = inspector.getInspectorByKey('NavigationOnPop_text1');
      let obj1 = JSON.parseJsonElement(strJson1);
      await CommonFunc.sleep(1000);
      console.info("[NavigationOnPop_static_0100] obj1 is: " + JSON.stringify(obj1));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('page:pageOne;param:str;result:{"value":"pageOnePop"}');

      console.info('NavigationOnPop_static_0100 END');
      done();
    });


  })
}