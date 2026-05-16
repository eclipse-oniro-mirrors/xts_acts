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
export default function NavigationApi1() {
  describe('NavigationApi1', () => {
    beforeAll(() => {

      await UtilsTest.msSleep(4000);
      await startAbility("com.arkui.ace.navigation12.static", "EntryAbility");
      await UtilsTest.msSleep(4000);
    });

    beforeEach(async (): Promise<void> => {
      console.info("NavigationApi1 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Navigation/NavigationApi1',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get NavigationApi1 state pages:" + JSON.stringify(pages));
        if (!("NavigationApi1" == pages.name)) {
          console.info("get NavigationApi1 pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push NavigationApi1 page result:");
        }
      } catch (err) {
        console.error("push NavigationApi1 page error:" + err);
      }
      console.info("NavigationApi1 beforeEach end");
    });
    afterEach(async () => {
    });


    

    /**
     * @tc.number   NavigationApi1_static_0100
     * @tc.name     NavigationApi1_static_0100
     * @tc.desc     NavigationApi1_static_0100
     * @tc.level    Level.LEVEL0
     */
it('NavigationApi1_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('NavigationApi1_static_0100 START');
      await CommonFunc.sleep(1000);

      inspector.sendEventByKey('NavigationApi1_btn1',10,"")
      await CommonFunc.sleep(1000);

      let NavigationApi1_1 = inspector.getInspectorByKey('NavigationApi1_text1');
      await CommonFunc.sleep(1000);
      let str = JSON.parseJsonElement(NavigationApi1_1)
      expect(JSON.stringify(str.getElement('$attrs').getString('content'))).assertEqual('"pageOne"');

      console.info('NavigationApi1_static_0100 END');
      done();
    });



  })
}