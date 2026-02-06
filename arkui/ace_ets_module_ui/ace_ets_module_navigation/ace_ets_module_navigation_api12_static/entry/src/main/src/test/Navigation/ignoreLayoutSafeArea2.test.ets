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
export default function ignoreLayoutSafeArea2() {
  describe('ignoreLayoutSafeArea2', () => {
    beforeAll(() => {

      await UtilsTest.msSleep(4000);
      await startAbility("com.arkui.ace.navigation12.static", "EntryAbility");
      await UtilsTest.msSleep(4000);
    });

    beforeEach(async (): Promise<void> => {
      console.info("ignoreLayoutSafeArea2 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Navigation/ignoreLayoutSafeArea2',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get ignoreLayoutSafeArea2 state success " + JSON.stringify(pages));
        if (!("ignoreLayoutSafeArea2" == pages.name)) {
          console.info("get ignoreLayoutSafeArea2 state success " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push ignoreLayoutSafeArea2 page success ");
        }
      } catch (err) {
        console.error("push ignoreLayoutSafeArea2 page error: " + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("ignoreLayoutSafeArea2 after each called");
    });


    

    /**
     * @tc.number   ignoreLayoutSafeArea2_static_0100
     * @tc.name     ignoreLayoutSafeArea2_static_0100
     * @tc.desc     ignoreLayoutSafeArea2_static_0100
     * @tc.level    Level.LEVEL0
     */
it('ignoreLayoutSafeArea2_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('[ignoreLayoutSafeArea2_static_0100] START');
      await CommonFunc.sleep(2000);

      let navRect = CommonFunc.getComponentRect('ignoreLayoutSafeAreaTest2_nav');//获取父组件的尺寸和子组件的尺寸不同
      let columnRect = CommonFunc.getComponentRect('ignoreLayoutSafeAreaTest2_column');
      expect(Math.round(navRect.top)).assertEqual(Math.round(columnRect.top));

      console.info('[ignoreLayoutSafeArea2_static_0100] END');
      done();
    });
  })
}

