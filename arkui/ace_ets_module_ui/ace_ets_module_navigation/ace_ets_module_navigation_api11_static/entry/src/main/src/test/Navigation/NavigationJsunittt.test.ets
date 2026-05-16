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
interface Action {
  ACTION: boolean
}
export default function navigationJsunittt() {
  describe('navigationJsunittt',  () =>{
    beforeAll(() => {

      await UtilsTest.startAbility("com.arkui.ace.navigation.static", "EntryAbility");
    });

    beforeEach(async (): Promise<void> => {
      console.info("navigation beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Navigation/navigationtt',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get navigation state pages:" + JSON.stringify(pages));
        if (!("navigationtt" == pages.name)) {
          console.info("get navigation state pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push navigation page result:");
        }
      } catch (err) {
        console.error("push navigation page error:" + JSON.stringify(err));
      }
    });

    afterEach(async  () =>{
      await CommonFunc.sleep(1000);
      console.info("navigation after each called");
    });

    
/**
     * @tc.number   testNavigation_static_100
     * @tc.name     testNavigation_static_100
     * @tc.desc     testNavigation_static_100
     * @tc.level    Level.LEVEL0
     */
it('testNavigation_static_100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testNavigation_static_100] START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('Navigation');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[testNavigation_static_100] obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('width')).assertEqual("100.00%");
      console.info('[testNavigation_static_100] END');
      done();
    });

    
/**
     * @tc.number   testNavigation_static_200
     * @tc.name     testNavigation_static_200
     * @tc.desc     testNavigation_static_200
     * @tc.level    Level.LEVEL0
     */
it('testNavigation_static_200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('testNavigation_static_200 START');
      await CommonFunc.sleep(1000);
      let callback = (indexEvent: events_emitter.EventData) => {
        console.info("testNavigation_static_200 get state result is: " + JSON.stringify(indexEvent));
        expect((indexEvent.data as Action)?.ACTION).assertEqual(false);
        done();
      }
      let indexEvent: events_emitter.InnerEvent = {
        eventId: 1366,
        priority: events_emitter.EventPriority.LOW
      }
      try {
        events_emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("testNavigation_static_200 on events_emitter err : " + JSON.stringify(err));
      }
      console.info("testNavigation_static_200 click result is: " + JSON.stringify(inspector.sendEventByKey('NavigationContent1',10,"")));
      await CommonFunc.sleep(2000);
      console.info('testNavigation_static_200 END');
      done();
    });

    
/**
     * @tc.number   testNavigation_static_300
     * @tc.name     testNavigation_static_300
     * @tc.desc     testNavigation_static_300
     * @tc.level    Level.LEVEL0
     */
it('testNavigation_static_300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testNavigation_static_300] START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('Navigation');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[testNavigation_static_300] obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('height')).assertEqual("300.00vp");
      console.info('[testNavigation_static_300] END');
      done();
    });

    
/**
     * @tc.number   testNavigation_static_400
     * @tc.name     testNavigation_static_400
     * @tc.desc     testNavigation_static_400
     * @tc.level    Level.LEVEL0
     */
it('testNavigation_static_400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testNavigation_static_400] START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('Navigation');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[testNavigation_static_400] obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('align')).assertEqual("Alignment.Center");
      console.info('[testNavigation_static_400] END');
      done();
    });
  })
}