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
let emitKey = "emitUserAgent";

export default function navigationuxtest() {
  describe('navigationuxtest',  () =>{
    const SUITE = 'navigationuxtest'
    beforeAll(() => {

      await UtilsTest.startAbility("com.arkui.ace.navigation.static", "EntryAbility");
    });

    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Navigation/navigationux",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages: router.RouterState = routerInstance.getState();
        if (pages == null || !("navigationux" == pages.name)) {
          routerInstance.pushUrl(options).then(() => {
            console.info(`${SUITE} router.pushUrl success`);

          })
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error(`${SUITE} beforeEach error:` + JSON.stringify(err));
      }
    });


    
/**
     * @tc.number   ArkUX_Stage_Navigation_static_0100
     * @tc.name     ArkUX_Stage_Navigation_static_0100
     * @tc.desc     ArkUX_Stage_Navigation_static_0100
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Navigation_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Navigation_static_0100 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Navigation_0100');
          console.info('ArkUX_Stage_Navigation_static_0100 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Navigation_static_0100 component obj.getElement('$attrs').getString('toolbarConfiguration') is: " +
          JSON.stringify(obj.getElement('$attrs').tryGetElement('toolbarConfiguration')));
          console.info('ArkUX_Stage_Navigation_static_0100 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Navigation_static_0100 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 5000)
    });
  })
}
