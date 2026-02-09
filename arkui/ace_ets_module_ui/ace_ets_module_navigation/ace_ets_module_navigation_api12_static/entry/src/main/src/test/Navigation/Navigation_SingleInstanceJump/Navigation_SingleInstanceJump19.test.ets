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
export default function Navigation_SingleInstanceJump19() {
  describe('Navigation_SingleInstanceJump19', () => {
    beforeAll(() => {

      
      await UtilsTest.startAbility("com.arkui.ace.navigation12.static", "EntryAbility");
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("Navigation_SingleInstanceJump19 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Navigation/Navigation_SingleInstanceJump/Navigation_SingleInstanceJump19',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get Navigation_SingleInstanceJump19 state pages:" + JSON.stringify(pages));
        if (!("List_SpaceChange" == pages.name)) {
          console.info("get Navigation_SingleInstanceJump19 pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push Navigation_SingleInstanceJump19 page result:");
        }
      } catch (err) {
        console.error("push Navigation_SingleInstanceJump19 page error:" + err);
      }
      console.info("Navigation_SingleInstanceJump19 beforeEach end");
    });
    afterEach(async () => {
    });

    
    

    /**
     * @tc.number   Navigation_SingleInstanceJump19_static_0100
     * @tc.name     Navigation_SingleInstanceJump19_static_0100
     * @tc.desc     Navigation_SingleInstanceJump19_static_0100
     * @tc.level    Level.LEVEL0
     */
it('Navigation_SingleInstanceJump19_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('Navigation_SingleInstanceJump19_static_0100 START');
      await CommonFunc.sleep(1000);

      inspector.sendEventByKey('Navigation_SingleInstanceJump19_btn1',10,"")
      await CommonFunc.sleep(1000);
      inspector.sendEventByKey('Navigation_SingleInstanceJump19_btn1',10,"")
      await CommonFunc.sleep(1000);
      inspector.sendEventByKey('Navigation_SingleInstanceJump19_btn1',10,"")
      await CommonFunc.sleep(1000);
      inspector.sendEventByKey('Navigation_SingleInstanceJump19_btn3',10,"")
      await CommonFunc.sleep(1000);

      let text1 = inspector.getInspectorByKey('Navigation_SingleInstanceJump19_text1');
      expect(String(JSON.parseJsonElement(text1).getElement('$attrs').getString('content'))).assertEqual('page1,Param:1 page1,Param:2 page1,Param:3 ');

      console.info('Navigation_SingleInstanceJump19_static_0100 END');
      done();
    });



  })
}