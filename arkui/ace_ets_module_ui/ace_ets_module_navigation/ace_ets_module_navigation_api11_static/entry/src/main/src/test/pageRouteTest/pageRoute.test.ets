'use static';
/**
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
interface Value {
  value: string
}
export default function pageRouteTest() {
  describe('pageRouteTest', () => {
    beforeAll(() => {

      await UtilsTest.startAbility("com.arkui.ace.navigation.static", "EntryAbility");
    });

    beforeEach(async (): Promise<void> => {
      console.info("pageRouteTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/pageRoute/pageRoute',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get pageRouteTest pages: " + JSON.stringify(pages));
        if (!("pageRoute" == pages.name)) {
          console.info("get pageRouteTest pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("pageRouteTest page result: ");
        }
      } catch (err) {
        console.error("pageRouteTest page error: " + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("pageRouteTest after each called");
    })

    
/**
     * @tc.number   testOnPageHideStatic01
     * @tc.name     testOnPageHideStatic01
     * @tc.desc     testOnPageHideStatic01
     * @tc.level    Level.LEVEL0
     */
it('testOnPageHideStatic01', Level.LEVEL0, async (): Promise<void> => {
      console.info('[testOnPageHideStatic01] START');
      let callback = (eventData: events_emitter.EventData) => {
        console.info("[testOnPageHideStatic01] get event state result is: " + JSON.stringify(eventData));
        expect((eventData.data as Value)?.value).assertEqual('onPageHide')

      }
      let innerEvent: events_emitter.InnerEvent = {
        eventId: 10,
        priority: events_emitter.EventPriority.LOW
      }
      try {
        events_emitter.on(innerEvent, callback)
        console.info("testOnPageHideStatic01 click result is: " + JSON.stringify(inspector.sendEventByKey('next', 10, "")));
      } catch (err) {
        console.info("[testOnPageHideStatic01] on events_emitter err : " + JSON.stringify(err));
      }
      console.info('[testOnPageHideStatic01] testSendTouchEvent END');

    });
  })
}