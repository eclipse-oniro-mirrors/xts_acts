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
export default function ImageAttr() {
  describe('NavigationAttr',  () =>{
    beforeAll(() => {

      await UtilsTest.startAbility("com.arkui.ace.navigation.static", "EntryAbility");
    });

    beforeEach(async (): Promise<void> => {
      console.info("NavigationAttr beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Navigation/NavigationAttr',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get NavigationAttr state success " + JSON.stringify(pages));
        if (!("NavigationAttr" == pages.name)) {
          console.info("get NavigationAttr state success " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push NavigationAttr page success ");
        }
      } catch (err) {
        console.error("push NavigationAttr page error: " + err);
      }
    });

    afterEach(async  () =>{
      await CommonFunc.sleep(1000);
      console.info("NavigationAttr after each called");
    });


    
/**
     * @tc.number   NavigationAttr_static_001
     * @tc.name     NavigationAttr_static_001
     * @tc.desc     NavigationAttr_static_001
     * @tc.level    Level.LEVEL0
     */
it('NavigationAttr_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[NavigationAttr_static_001] START');

      await CommonFunc.sleep(1000);
      let driver =Driver.create()
      let button = await (driver.findComponent(ON.id('pushPathByName_test')) as Promise<Component>);
      await button.click();
      await CommonFunc.sleep(1000);

      let strJson1 = inspector.getInspectorByKey('finishTransitionTest_api');
      await CommonFunc.sleep(200);
      let obj1 = JSON.parseJsonElement(strJson1);
      await CommonFunc.sleep(1000);
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('444');

      let strJson2 = inspector.getInspectorByKey('customNavContentTransitionTest_api');
      await CommonFunc.sleep(200);
      let obj2 = JSON.parseJsonElement(strJson2);
      await CommonFunc.sleep(1000);
      expect(obj2.getElement('$attrs').getString('content')).assertEqual('222');


      console.info('[NavigationAttr_static_001] END');
      done();
    });





  })
}


