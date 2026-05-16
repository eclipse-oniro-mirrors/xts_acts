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
export default function NavigationBarStyle() {
  describe('NavigationBarStyle', () => {
    beforeAll(() => {

      await UtilsTest.msSleep(4000);
      await startAbility("com.arkui.ace.navigation12.static", "EntryAbility");
      await UtilsTest.msSleep(4000);
    });

    beforeEach(async (): Promise<void> => {
      console.info("NavigationBarStyle beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Navigation/NavigationBarStyle',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get NavigationBarStyle state pages:" + JSON.stringify(pages));
        if (!("NavigationBarStyle" == pages.name)) {
          console.info("get NavigationBarStyle pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push NavigationBarStyle page result:");
        }
      } catch (err) {
        console.error("push NavigationBarStyle page error:" + err);
      }
      console.info("NavigationBarStyle beforeEach end");
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("NavigationBarStyle after each called");
    });



    

    /**
     * @tc.number   NavigationBarStyle_static_0100
     * @tc.name     NavigationBarStyle_static_0100
     * @tc.desc     NavigationBarStyle_static_0100
     * @tc.level    Level.LEVEL0
     */
it('NavigationBarStyle_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('NavigationBarStyle_static_0100 START');
      await CommonFunc.sleep(1000);

      let navRect = CommonFunc.getComponentRect('NavigationBarStyle_nav');
      let navContentRect = CommonFunc.getComponentRect('NavigationBarStyle_content');
      expect(Math.round(navRect.top)).assertEqual(Math.round(navContentRect.top));

      console.info('NavigationBarStyle_static_0100 END');
      done();
    });


  })
}