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
const SUITE = 'NavigationParam'
const waitUiReadyMs: number = 500;
export default function NavigationParamTest() {
  describe('NavigationParamTest', () => {
    beforeAll(() => {
      await UtilsTest.startAbility("com.arkui.ace.navigation.static", "EntryAbility");
    });
    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Navigation/NavigationParam",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages: router.RouterState = routerInstance.getState();
        if (!("NavigationParam" == pages.name)) {
          routerInstance.pushUrl(options)
        }
      } catch (err) {
        console.error(`${SUITE} beforeEach error:` + JSON.stringify(err));
      }
      await CommonFunc.sleep(2000);
    });

    
/**
     * @tc.number   ArkUI_Navigation_static_0100
     * @tc.name     ArkUI_Navigation_static_0100
     * @tc.desc     ArkUI_Navigation_static_0100
     * @tc.level    Level.LEVEL0
     */
it('ArkUI_Navigation_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let CASE = 'ArkUI_Navigation_static_0100'
      console.info(`${SUITE} ${CASE} START`)
      let strJson = inspector.getInspectorByKey('NavigationParam_Navigation1')
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Navigation')
      console.info(`${SUITE} ${CASE} END`)
      done()
    });


    
/**
     * @tc.number   ArkUI_Navigation_static_0200
     * @tc.name     ArkUI_Navigation_static_0200
     * @tc.desc     ArkUI_Navigation_static_0200
     * @tc.level    Level.LEVEL0
     */
it('ArkUI_Navigation_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let CASE = 'ArkUI_Navigation_static_0200'
      console.info(`${SUITE} ${CASE} START`)
      let strJson = inspector.getInspectorByKey('NavigationParam_Navigation2')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('title')).assertEqual('test_string_title')
      console.info(`${SUITE} ${CASE} END`)
      done()
    });

  })
}
