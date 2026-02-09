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
export default function navigationPosition() {
  describe('navigationPosition',  () =>{
    beforeAll(() => {

      await UtilsTest.startAbility("com.arkui.ace.navigation.static", "EntryAbility");
    });

    beforeEach(async (): Promise<void> => {
      console.info("navigationPosition beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Navigation/navigationPosition',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get navigationPosition state pages: " + JSON.stringify(pages));
        if (!("navigationPosition" == pages.name)) {
          console.info("get navigationPosition state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push navigationPosition page result: ");
        }
      } catch (err) {
        console.error("push navigationPosition page error: " + err);
        expect().assertFail();
      }
    });


    
/**
     * @tc.number   navigationPosition_static_001
     * @tc.name     navigationPosition_static_001
     * @tc.desc     navigationPosition_static_001
     * @tc.level    Level.LEVEL0
     */
it('navigationPosition_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('[navigationPosition_static_001] START');
      await CommonFunc.sleep(1000);
      AppStorage.get<MessageManager<int>>("messageManager")?.notify({name:'navBarPositionIndex', value: 0 });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('navigationPosition');

      console.info("[navigationPosition_static_001] component JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      await CommonFunc.sleep(1000);
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('navBarPosition')).assertEqual('NavBarPosition.Start');

      console.info('[navigationPosition_static_001] END');
      done();
    });


    
/**
     * @tc.number   navigationPosition_static_002
     * @tc.name     navigationPosition_static_002
     * @tc.desc     navigationPosition_static_002
     * @tc.level    Level.LEVEL0
     */
it('navigationPosition_static_002', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('[navigationPosition_static_002] START');
      AppStorage.get<MessageManager<int>>("messageManager")?.notify({name:'navBarPositionIndex', value: 1 });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('navigationPosition');

      console.info("[navigationPosition_static_002] component JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      await CommonFunc.sleep(1000);
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('navBarPosition')).assertEqual('NavBarPosition.End');

      console.info('[navigationPosition_static_002] END');
      done();
    });
  })
}
